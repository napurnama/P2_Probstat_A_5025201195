#1.A
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


#1.B
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

#1.C
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