@interface KNBuildVanishParticleSystem
- ($94F468A8D4C62B317260615823C2B210)lifeSpan;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (double)maxScale;
- (double)maxSpeed;
- (double)minScale;
- (double)randomParticleSpeedMax;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (double)speedMax;
- (void)setLifeSpan:(id)a3;
- (void)setMaxScale:(double)a3;
- (void)setMaxSpeed:(double)a3;
- (void)setMinScale:(double)a3;
- (void)setRandomParticleSpeedMax:(double)a3;
@end

@implementation KNBuildVanishParticleSystem

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(KNBuildVanishParticleSystem *)self randomParticleSpeedMax];
  double v7 = v6;
  [(KNBuildVanishParticleSystem *)self objectSize];
  double v9 = v8;
  [(KNBuildVanishParticleSystem *)self slideSize];
  double v11 = v9 / v10;
  [(KNBuildVanishParticleSystem *)self objectSize];
  double v13 = v11 * v12;
  [(KNBuildVanishParticleSystem *)self slideSize];
  double v15 = v13 / v14;
  if (v13 / v14 > 1.0) {
    double v15 = 1.0;
  }
  double v47 = sqrt(v15) * -0.75 + 1.0;
  double v46 = v7 * v47;
  id v16 = [(KNBuildVanishParticleSystem *)self particlesWide];
  uint64_t v17 = (void)[(KNBuildVanishParticleSystem *)self particlesWide] * (void)v16;
  id v18 = [(KNBuildVanishParticleSystem *)self particlesHigh];
  double v19 = (double)(unint64_t)(v17
                                 + (void)[(KNBuildVanishParticleSystem *)self particlesHigh]
                                 * (void)v18)
      * 0.25;
  TSURandomBetween();
  double v21 = v20;
  TSURandomBetween();
  double v22 = sqrt(1.0 - v21 * v21);
  __double2 v24 = __sincos_stret(v23);
  float v25 = v22 * v24.__cosval;
  float v26 = v22 * v24.__sinval;
  float v45 = v26;
  float v27 = v21;
  float v44 = -fabsf(v27);
  *(float *)&double v21 = v46 * v25;
  double v28 = x - (double)(unint64_t)[(KNBuildVanishParticleSystem *)self particlesWide] * 0.5;
  double v29 = y - (double)(unint64_t)[(KNBuildVanishParticleSystem *)self particlesHigh] * 0.5;
  float v30 = v28;
  float v31 = v47 * v30;
  float v32 = *(float *)&v21 + v31;
  id v33 = [(KNBuildVanishParticleSystem *)self particlesWide];
  id v34 = [(KNBuildVanishParticleSystem *)self particlesHigh];
  if (v33 <= v34) {
    unint64_t v35 = (unint64_t)v34;
  }
  else {
    unint64_t v35 = (unint64_t)v33;
  }
  double v36 = (double)v35 * 0.5 + 20.0;
  TSURandomBetween();
  double v38 = v37 / v36;
  float v39 = v37 / v36 * v32;
  v40.f32[0] = v29;
  float32_t v41 = sqrt(v19 - (float)((float)(v40.f32[0] * v40.f32[0]) + (float)(v30 * v30)));
  v40.f32[1] = v41;
  float32x2_t v42 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vadd_f32(vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v44), LODWORD(v45))), v46)), vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v40), v47)))), v38));
  float v43 = v42.f32[1];
  result.var1 = v42.f32[0];
  result.var2 = v43;
  result.var0 = v39;
  return result;
}

- (double)speedMax
{
  [(KNBuildVanishParticleSystem *)self objectSize];
  double v4 = v3;
  [(KNBuildVanishParticleSystem *)self objectSize];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  [(KNBuildVanishParticleSystem *)self slideSize];
  double v8 = v7;
  [(KNBuildVanishParticleSystem *)self slideSize];
  if (v8 < v9) {
    double v8 = v9;
  }
  [(KNBuildVanishParticleSystem *)self maxSpeed];
  return v10 * (v6 / v8);
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  [(KNBuildVanishParticleSystem *)self minScale];
  [(KNBuildVanishParticleSystem *)self maxScale];
  TSURandomBetween();

  TSUMix();
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  TSURandomBetween();
  TSUMix();
  float v4 = v3;
  float v5 = 0.0;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (double)randomParticleSpeedMax
{
  return self->_randomParticleSpeedMax;
}

- (void)setRandomParticleSpeedMax:(double)a3
{
  self->_randomParticleSpeedMadouble x = a3;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpan
{
  float start = self->_lifeSpan.start;
  float duration = self->_lifeSpan.duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (void)setLifeSpan:(id)a3
{
  self->_lifeSpan = ($A1D7D23D68917446570C1E0BB0B375EB)a3;
}

- (double)maxSpeed
{
  return self->_maxSpeed;
}

- (void)setMaxSpeed:(double)a3
{
  self->_maxSpeed = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (double)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(double)a3
{
  self->_minScale = a3;
}

@end