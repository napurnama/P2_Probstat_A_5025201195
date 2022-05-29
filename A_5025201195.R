#----------NOMOR 1-----------#
##1.A
col = 2
row = 9

ex_stats <- array(c(c(78, 75, 67, 77, 70, 72, 78, 74, 77)
                  , c(100, 95, 70, 90, 90, 90, 89, 90, 100))
                  , dim=c(row, col))

o2_change <- array(c(0), dim=c(row, 1));
for(i in 1:row){
  o2_change[i] <- ex_stats[i, 2] - ex_stats[i, 1] 
}

standard_deviation = sd(o2_change)
print(standard_deviation)


##1.B
sample_n <- 5

sample_data <- sample(o2_change, sample_n)
print(sample_data)

sample_sd <- sd(sample_data)
print(sample_sd)

mean <- mean(o2_change)
sample_mean <- mean(sample_data)
print(sample_mean)

sample_t = (sample_mean - mean) / (sample_sd / sqrt(sample_n))
print(sample_t)

sample_p = pt(sample_t, sample_n - 1, lower.tail = TRUE)
print(sample_p)

##1.C
alpha <- 0.05
if(sample_p > alpha){
cat("Dengan:
    a) tingkat signifikansi alfa = 0.05
    b) hipotesa null = 'tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A'
    
    Dengan sampel: ", sample_data, "
    Didapatkan mean: ", sample_mean, "
    Didapatkan standard deviation: ", sample_sd, "
    Didapatkan t-score: ", sample_t, "
    Didapatkan p-value: ", sample_p, "
    Nilai p-value yang lebih dari alpha menandakan tidak ada pengaruh yang signifikan secara statistika sehingga null hipotesa dapat dibenarkan.")
}else {
  cat("Dengan:
      a) tingkat signifikansi alfa = 0.05
      b) hipotesa null = 'tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A'
      
      Dengan sampel: ", sample_data, "
      Didapatkan mean: ", sample_mean, "
      Didapatkan standard deviation: ", sample_sd, "
      Didapatkan t-score: ", sample_t, "
      Didapatkan p-value: ", sample_p, "
      Nilai p-value yang kurang dari alpha menandakan ada pengaruh yang signifikan secara statistika sehingga null hipotesa salah.")
}




#----------NOMOR 2-----------#
#install.packages("BSDA")
#library(BSDA)

mean <- 20000
sample_n <- 100
sample_mean <- 23500
sample_sd <- 3900

tsum.test(mean.x = sample_mean, 
          s.x = sample_sd, 
          n.x = sample_n, 
          mu = mean
          )

sample_t = (sample_mean - mean) / (sample_sd / sqrt(sample_n))
sample_p = pt(sample_t, sample_n - 1, lower.tail = FALSE)
sample_t
sample_p

##2.A
# Setuju karena berdasarkan hasil tsum.test() 
# dengan tingkat keyakinan 95% bahwa pengulangan test akan
# menghasilkan nilai rata-rata antara 22.726,16 dan 24.273,84
# dengan batas bawah yang melebihi mean null hypothesis. 

##2.B
# Berdasarkan argumen yang diberikan pada fungsi dihasilkan t-score
# 8.9744 menunjukkan jarak sebuah hasil dari rata-rata. Selain itu,
# p-score yang sangat mendekati nol menunjukkan signifikasi yang tinggi
# sehingga dapat dikatakan bahwa sampel menggambarkan keseluruhan populasi
# secara akurat. Interval keyakinan menunjukkan bahwa 95% pengulangan test 
# akan menghasilkan nilai rata-rata antara 22.726,16 dan 24.273,84 

##2.C
# Nilai p yang jauh lebih rendah dari standar 0.05
# menunjukkan bahwa hasil dari pengambilan sampel acak
# memiliki kemungkinan tinggi untuk terjadi. Oleh karena itu,
# dapat disimpulkan bahwa hasil dari pengambilan sampel acak dapat
# menggambarkan kondisi nyata dengan tingkat akurasi yang cukup tinggi

