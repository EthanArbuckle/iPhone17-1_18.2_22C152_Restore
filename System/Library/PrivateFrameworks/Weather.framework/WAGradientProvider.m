@interface WAGradientProvider
- ($7EA73340C7CC676E337367CBF1F3785A)mixedGradientForSunheight:(SEL)a3 hourAngle:(double)a4 condition:(double)a5 latitude:(int64_t)a6;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)mixedColorsForIndex:(int64_t)a3 solarHeight:(float)a4 condition:(int64_t)a5 latitude:(float)a6;
- (id)gradientForConditionCode:(int64_t)a3 isDay:(BOOL)a4;
- (void)getTopColor:(id *)a3 middleColor:(id *)a4 bottomColor:(id *)a5 gradientStopPoint:(double *)a6 forCity:(id)a7 date:(id)a8;
@end

@implementation WAGradientProvider

- (id)gradientForConditionCode:(int64_t)a3 isDay:(BOOL)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  double v4 = -90.0;
  if (a4) {
    double v4 = 90.0;
  }
  -[WAGradientProvider mixedGradientForSunheight:hourAngle:condition:latitude:](self, "mixedGradientForSunheight:hourAngle:condition:latitude:", a3, v4, 0.0, 0.0, 0, 0);
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263F1C550] colorWithRed:v12 green:v13 blue:v14 alpha:1.0];
  v7 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v8 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  [v5 addObjectsFromArray:v9];

  v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v10;
}

- (void)getTopColor:(id *)a3 middleColor:(id *)a4 bottomColor:(id *)a5 gradientStopPoint:(double *)a6 forCity:(id)a7 date:(id)a8
{
  id v13 = a7;
  if ([v13 isDay]) {
    double v14 = 90.0;
  }
  else {
    double v14 = -90.0;
  }
  uint64_t v15 = objc_msgSend(v13, "conditionCode", 0, 0);

  [(WAGradientProvider *)self mixedGradientForSunheight:v15 hourAngle:v14 condition:0.0 latitude:0.0];
  if (a3)
  {
    *a3 = [MEMORY[0x263F1C550] colorWithRed:*(float *)&v16 green:*((float *)&v16 + 1) blue:v17 alpha:1.0];
  }
  if (a4)
  {
    *a4 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  }
  if (a5)
  {
    *a5 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  }
  *a6 = 0.0;
}

- ($7EA73340C7CC676E337367CBF1F3785A)mixedGradientForSunheight:(SEL)a3 hourAngle:(double)a4 condition:(double)a5 latitude:(int64_t)a6
{
  float v11 = a4;
  *(float *)&a4 = v11;
  *(float *)&a5 = a7;
  [(WAGradientProvider *)self mixedColorsForIndex:0 solarHeight:a6 condition:a4 latitude:a5];
  float v35 = v13;
  float v36 = v12;
  float v15 = v14;
  float v17 = v16;
  *(float *)&double v18 = v11;
  *(float *)&double v19 = a7;
  [(WAGradientProvider *)self mixedColorsForIndex:1 solarHeight:a6 condition:v18 latitude:v19];
  float v21 = v20;
  float v23 = v22;
  float v25 = v24;
  float v27 = v26;
  *(float *)&double v28 = v11;
  *(float *)&double v29 = a7;
  result = ($7EA73340C7CC676E337367CBF1F3785A *)[(WAGradientProvider *)self mixedColorsForIndex:2 solarHeight:a6 condition:v28 latitude:v29];
  retstr->var0.var0 = v36;
  retstr->var0.var1 = v35;
  retstr->var0.var2 = v15;
  retstr->var0.var3 = v17;
  retstr->var1.var0 = v21;
  retstr->var1.var1 = v23;
  retstr->var1.var2 = v25;
  retstr->var1.var3 = v27;
  retstr->var2.var0 = v31;
  retstr->var2.var1 = v32;
  retstr->var2.var2 = v33;
  retstr->var2.var3 = v34;
  return result;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)mixedColorsForIndex:(int64_t)a3 solarHeight:(float)a4 condition:(int64_t)a5 latitude:(float)a6
{
  if ((unint64_t)a5 > 0x2F)
  {
    v7 = (double *)&clearDay;
    v6 = (double *)&clearNight;
  }
  else
  {
    v6 = (double *)*(&off_2647E11E8 + a5);
    v7 = (double *)*(&off_2647E1368 + a5);
  }
  float v8 = 0.0;
  if (a4 > -9.0) {
    float v8 = 1.0;
  }
  if (a4 >= 9.0 || a4 <= -9.0)
  {
    float v11 = v8;
  }
  else
  {
    float v9 = (a4 + 9.0) / 18.0;
    float v11 = v9;
  }
  float v12 = (float64x2_t *)&v7[4 * a3];
  float v13 = v12[1].f64[0];
  float v14 = v7[a3 + 12];
  float v15 = (float64x2_t *)&v6[4 * a3];
  float v16 = v15[1].f64[0];
  float v17 = v6[a3 + 12];
  float32x2_t v18 = vmla_n_f32(vmul_n_f32(vcvt_f32_f64(*v12), v11), vcvt_f32_f64(*v15), 1.0 - v11);
  float v19 = (float)(v11 * v13) + (float)(v16 * (float)(1.0 - v11));
  float v20 = (float)(v11 * v14) + (float)(v17 * (float)(1.0 - v11));
  float v21 = v18.f32[1];
  result.var0 = v18.f32[0];
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v21;
  return result;
}

@end