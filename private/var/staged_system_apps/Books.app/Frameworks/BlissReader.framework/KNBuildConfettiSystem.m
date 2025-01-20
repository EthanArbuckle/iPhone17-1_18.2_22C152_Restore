@interface KNBuildConfettiSystem
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (double)rotationMax;
- (double)speedMax;
@end

@implementation KNBuildConfettiSystem

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  TSURandomBetween();
  double v4 = v3;
  TSURandomBetween();
  double v6 = v5;
  TSURandomBetween();
  float v7 = v4;
  float v8 = v6;
  float v10 = v9;
  float v11 = v7;
  result.var2 = v10;
  result.var1 = v8;
  result.var0 = v11;
  return result;
}

- (double)rotationMax
{
  return 25.1327412;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(KNBuildConfettiSystem *)self objectSize];
  double v7 = v6;
  [(KNBuildConfettiSystem *)self slideSize];
  double v9 = v7 / v8;
  [(KNBuildConfettiSystem *)self objectSize];
  double v11 = v9 * v10;
  [(KNBuildConfettiSystem *)self slideSize];
  double v13 = v11 / v12;
  if (v11 / v12 > 1.0) {
    double v13 = 1.0;
  }
  double v42 = sqrt(v13) * -0.75 + 1.0;
  id v14 = [(KNBuildConfettiSystem *)self particlesWide];
  uint64_t v15 = (void)[(KNBuildConfettiSystem *)self particlesWide] * (void)v14;
  id v16 = [(KNBuildConfettiSystem *)self particlesHigh];
  double v17 = (double)(unint64_t)(v15
                                 + (void)[(KNBuildConfettiSystem *)self particlesHigh] * (void)v16)
      * 0.25;
  TSURandomBetween();
  double v19 = v18;
  TSURandomBetween();
  double v20 = sqrt(1.0 - v19 * v19);
  __double2 v22 = __sincos_stret(v21);
  float v23 = v20 * v22.__cosval;
  float v24 = v20 * v22.__sinval;
  float v41 = v24;
  float v25 = v19;
  float v40 = -fabsf(v25);
  *(float *)&double v19 = v42 * 20.0 * v23;
  double v26 = x - (double)(unint64_t)[(KNBuildConfettiSystem *)self particlesWide] * 0.5;
  double v27 = y - (double)(unint64_t)[(KNBuildConfettiSystem *)self particlesHigh] * 0.5;
  float v28 = v26;
  float v29 = v42 * v28;
  float v30 = *(float *)&v19 + v29;
  id v31 = [(KNBuildConfettiSystem *)self particlesWide];
  id v32 = [(KNBuildConfettiSystem *)self particlesHigh];
  if (v31 <= v32) {
    unint64_t v33 = (unint64_t)v32;
  }
  else {
    unint64_t v33 = (unint64_t)v31;
  }
  double v34 = 1.0 / ((double)v33 * 0.5 + 20.0);
  float v35 = v34 * v30;
  v36.f32[0] = v27;
  float32_t v37 = sqrt(v17 - (float)((float)(v36.f32[0] * v36.f32[0]) + (float)(v28 * v28)));
  v36.f32[1] = v37;
  float32x2_t v38 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vadd_f32(vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v40), LODWORD(v41))), v42 * 20.0)), vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v36), v42)))), v34));
  float v39 = v38.f32[1];
  result.var1 = v38.f32[0];
  result.var2 = v39;
  result.var0 = v35;
  return result;
}

- (double)speedMax
{
  [(KNBuildConfettiSystem *)self objectSize];
  double v4 = v3;
  [(KNBuildConfettiSystem *)self objectSize];
  if (v4 >= v5) {
    double v4 = v5;
  }
  id v6 = [(KNBuildConfettiSystem *)self particlesWide];
  id v7 = [(KNBuildConfettiSystem *)self particlesHigh];
  if (v6 <= v7) {
    unint64_t v8 = (unint64_t)v7;
  }
  else {
    unint64_t v8 = (unint64_t)v6;
  }
  return v4 * 0.025 * ((double)v8 * 0.5 + 20.0);
}

@end