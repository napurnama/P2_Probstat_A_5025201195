# P2_Probstat_A_5025201195
 
## Nomor 1
### Soal
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas A terhadap
kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
sebanyak 9 responden. Pertama, sebelum melakukan aktivitas A, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas A. Setelah 15 menit, peneliti tersebut mencatat kembali
kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden
mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas A


| Responden | x | y |
|:---------:|:-:|:-:|
|     1     | 78|100|
|     2     | 75| 95|
|     3     | 67| 70|
|     4     | 77| 90|
|     5     | 70| 90|
|     6     | 72| 90|
|     7     | 78| 89|
|     8     | 74| 90|
|     9     | 77|100|

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas A sebanyak 67, dan setelah
melakukan aktivitas A sebanyak 70.

+`a.` Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel
diatas

+`b.` carilah nilai t (p-value)

+`c.` tentukanlah apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
aktivitas A jika diketahui tingkat signifikansi α = 5% serta H0 : “tidak ada
pengaruh yang signifikan secara statistika dalam hal kadar saturasi
oksigen , sebelum dan sesudah melakukan aktivitas A”

### Penyelesaian
+ `a.` Dibuat array berisi perubahan tingkat saturasi oksigen sebelum dan sesudah aktivitas A. Array tersebut dibuat dengan cara berikut:

    ```R
    col = 2
    row = 9

    ex_stats <- array(c(c(78, 75, 67, 77, 70, 72, 78, 74, 77)
                    , c(100, 95, 70, 90, 90, 90, 89, 90, 100))
                    , dim=c(row, col))

    o2_change <- array(c(0), dim=c(row, 1));
    for(i in 1:row){
    o2_change[i] <- ex_stats[i, 2] - ex_stats[i, 1] 
    }
    ```

    Setelah itu, digunakan fungsi yang terdapat dalam R untuk menghitung standard deviation, yaitu `sd()` yang dijalankan dengan cara berikut:

    ```R
    standard_deviation = sd(o2_change)
    ```

    Hasil standard deviation dari data yang tertera dalam tabel adalah seperti berikut:

    ```R
    > print(standard_deviation)
    [1] 6.359595
    > 
    ```

+ `b.` Untuk mencari nilai `t-score` digunakan ukuran sampel sebesar 5 yang diambil secara acak dengan cara seperti berikut:

    ```R
    sample_n <- 5

    sample_data <- sample(o2_change, sample_n)
    ```

    Sesuai dengan rumus: 
    $$\dfrac{({\mu}_{sample} - {\mu}_0)}{\sqrt{\dfrac{S^2_{sample}}{n}}}$$

    dicari nilai mean dari data asli dan data sampel serta nilai standard deviation dari data sampel yang dilakukan dengan cara berikut:

    ```R
    mean <- mean(o2_change)
    sample_mean <- mean(sample_data)
    sample_sd <- sd(sample_data)
    ```

    Dengan nilai-nilai yang ditemukan dimasukkan ke dalam rumus seperti berikut:

    ```R
    sample_t = (sample_mean - mean) / (sample_sd / sqrt(sample_n))
    ```

    Untuk mencari nilai p-value dari nilai t-score yang didapatkan sebelumnya, digunakan fungsi R yaitu `pt()` seperti berikut:

    ```R
    sample_p = pt(sample_t, sample_n - 1, lower.tail = TRUE)
    ```

+ `c.` Dibuat if-else statement untuk mengoutputkan verdict signifikansi berdasarkan nilai p-value seperti berikut: 

    ```R
    alpha <- 0.05
    if(sample_p > alpha){
    cat("Dengan:
    a) tingkat signifikansi alfa = 0.05
    b) hipotesa null = 'tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A
    
    Dengan sampel: ", sample_data, "
    Didapatkan mean: ", sample_mean, "
    Didapatkan standard deviation: ", sample_sd, "
    Didapatkan t-score: ", sample_t, "
    Didapatkan p-value: ", sample_p, "
    
    Nilai p-value yang lebih dari alpha menandakan tidak ada pengaruh yang signifikan secara statistika sehingga null hipotesa dapat dibenarkan.")
    }else {
    cat("Dengan:
    a) tingkat signifikansi alfa = 0.05
    b) hipotesa null = 'tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A
    
    Dengan sampel: ", sample_data, "
    Didapatkan mean: ", sample_mean, "
    Didapatkan standard deviation: ", sample_sd, "
    Didapatkan t-score: ", sample_t, "
    Didapatkan p-value: ", sample_p, "
    Nilai p-value yang kurang dari alpha menandakan ada pengaruh yang signifikan secara statistika sehingga null hipotesa salah.")
    }
    ```

### Dokumentasi
+`a.`

![1A](./Docs/1A.png)

+`b.`

![1B](./Docs/1B.png)

+`c.`

![1C](./Docs/1C.png)

## Nomor 2
### Soal
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk
mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata
23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan
library seperti referensi pada modul).

+`a.` Apakah Anda setuju dengan klaim tersebut?

+`b.` Jelaskan maksud dari output yang dihasilkan!

+`c.` Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

### Penyelesaian
+ `a.` Untuk menarik kesimpulan harus menguji nilai-nilai yang didapatkan dari populasi sampel. Ini dilakukan dengan cara berikut:

    ```R
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
    ```

    Kesimpulan:
    ```
    Dapat ditarik kesimpulan bahwa null hypothesis benar karena berdasarkan hasil tsum.test() dengan terlihat bahwa 95% pengulangan test akan menghasilkan nilai rata-rata antara 22.726,16 dan 24.273,84 dengan batas bawah yang melebihi mean null hypothesis. 
    ```

+ `b.` Penjelasan output:
    ```
    Berdasarkan argumen yang diberikan pada fungsi dihasilkan t-score
    8.9744 menunjukkan jarak sebuah hasil dari rata-rata. Selain itu, p-score yang sangat mendekati nol menunjukkan signifikasi yang tinggi sehingga dapat dikatakan bahwa sampel menggambarkan keseluruhan populasi secara akurat. Interval keyakinan menunjukkan bahwa 95% pengulangan test akan menghasilkan nilai rata-rata antara 22.726,16 dan 24.273,84 
    ```

+ `c.` Analisis p-value:
  ```
  Nilai p yang jauh lebih rendah dari standar 0.05 menunjukkan bahwa hasil dari pengambilan sampel acak memiliki kemungkinan tinggi untuk terjadi. Oleh karena itu, dapat disimpulkan bahwa hasil dari pengambilan sampel acak dapat menggambarkan kondisi nyata dengan tingkat akurasi yang cukup tinggi
  ```

### Dokumentasi
![2](./Docs/2.png)

## Nomor 3
### Soal
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut      | Bandung | Bali |
|:----------------------:|:-------:|:----:|
| Jumlah Saham           | 19      | 27   |
| Sampel Mean            | 3.64    | 2.79 |
| Sampel Standar Deviasi | 1.67    | 1.32 |

Dari data di atas berilah keputusan serta kesimpulan yang didapatkan dari hasil di atas. Asumsikan nilai variansinya sama, apakah ada perbedaan pada rata-ratanya **($\alpha$ = 0.05)**? Buatlah:

+ `a.` $H_0$ dan $H_1$

+ `b.` Hitung sampel statistik

+ `c.` Lakukan uji statistik (df = 2)

+ `d.` Nilai kritikal

+ `e.` Keputusan

+ `f.` Kesimpulan

### Penyelesaian
+ `a.` $$H_0 = "Rata-rata harga saham Bandung = harga saham Bali"$$
    $$H_1 = "Rata-rata harga saham Bandung != harga saham Bali"$$
  
+ `b.` Uji statistik dilakukan dengan pertama mencari nilai Variansi Sampel yang akan digunakan untuk mencari nilai `t-score` dari sampel. Hal itu dilakukan dengan cara berikut:

    ```R
    bandung_n = 19
    bandung_mean = 3.64
    bandung_sd = 1.67

    bali_n = 27
    bali_mean = 2.79 
    bali_sd = 1.32

    df= bandung_n + bali_n - 2

    pooled_variance = (((bandung_n - 1) * (bandung_sd ** 2))  + ((bali_n - 1) * (bali_sd ** 2))) / (df)
    pooled_variance

    t = (bandung_mean - bali_mean) / (sqrt(pooled_variance/bandung_n + pooled_variance/bali_n))
    t
    ```
  
    Rumus yang digunakan terdapat dua yaitu:
    $$(S_p)^2 = \dfrac{(n_1 - 1) * (S_1)^2 + (n_2 - 1) * (S_2)^2}{(n_1 - 1) + (n_2 - 1)}$$
    $$t = \dfrac{(\bar{X_1} - \bar{X_2})((\mu)_1 - (\mu)_2)}{\sqrt{(S_p)^2(\dfrac{1}{n_1} + \dfrac{1}{n_2})}}$$

+ `c.`
  
+ `d.` Nilai kritikal dapat ditentukan dengan menggunakan ukuran sampel Bandung dan Bali serta nilai $\alpha$ dan menelusuri tabel-t untuk menemukan nilai kritikal. Pertama dihitung nilai `df`, yaitu:

$$df = (n_1 - 1) + (n_2 - 1)$$

Didapatkan nilai `v = 44` dengan nilai $\alpha = 0.05$ maka didapatkan nilai kritikal:

![2D](./Docs/2D.png)

+ `e.` Terima $H_0$ pada $\alpha$ 
  
+ `f.` Uji statistik menghasilkan nilai t yang berada dalam rentang nilai kritikal
  
### Dokumentasi
+`a.`
+`b.`
+`c.`
+`d.`
+`e.`
+`f.`

## Nomor 4
### Soal
+ `a.`
+ `b.`
+ `c.`
+ `d.`
+ `e.`
+ `f.`
### Penyelesaian
+`a.`
+`b.`
+`c.`
+`d.`
+`e.`
+`f.`
### Dokumentasi
+`a.`
+`b.`
+`c.`
+`d.`
+`e.`
+`f.`

## Nomor 5
### Soal
+`a.`
+`b.`
+`c.`
+`d.`
+`e.`
### Penyelesaian
+`a.`
+`b.`
+`c.`
+`d.`
+`e.`
### Dokumentasi
+`a.`
+`b.`
+`c.`
+`d.`
+`e.`