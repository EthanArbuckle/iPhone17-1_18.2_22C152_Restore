@interface KNBuildDiffuseSystem
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (double)rotationMax;
- (double)speedMax;
@end

@implementation KNBuildDiffuseSystem

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  v5 = (char *)[(KNBuildDiffuseSystem *)self direction];
  TSURandomBetween();
  double v7 = v6;
  TSURandomBetween();
  double v8 = sqrt(1.0 - v7 * v7);
  __double2 v10 = __sincos_stret(v9);
  double v11 = v8 * v10.__sinval;
  *(float *)&double v8 = v8 * v10.__cosval;
  float v12 = v11;
  double v13 = (y + y) / (double)(unint64_t)[(KNBuildDiffuseSystem *)self particlesHigh] + -1.0;
  double v14 = (1.1 - v13 * v13) * 8.0;
  float v15 = v14 * *(float *)&v8;
  float v16 = v14 * v12;
  *(float *)&double v7 = v7;
  float v17 = v14 * *(float *)&v7;
  double v18 = 2.0 - fabs(v13);
  if (v5 == (unsigned char *)&dword_8 + 3) {
    double v18 = -v18;
  }
  float v19 = v18;
  float v20 = v13 + v13;
  float v21 = (float)(v19 * 5.0) + v15;
  float v22 = (float)(v20 * 5.0) + v16;
  float v23 = v17 + 0.0;
  if (v21 == 0.0 && v22 == 0.0 && v23 == 0.0)
  {
    float v24 = TSDMetalPoint3DZero[0];
    float v25 = TSDMetalPoint3DZero[1];
    float v26 = TSDMetalPoint3DZero[2];
  }
  else
  {
    double v27 = 1.0 / sqrtf((float)((float)(v22 * v22) + (float)(v21 * v21)) + (float)(v23 * v23));
    double v28 = v27 * v21;
    double v29 = v27 * v22;
    double v30 = v27 * v23;
    float v24 = v28;
    float v25 = v29;
    float v26 = v30;
  }
  result.var2 = v26;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- (double)speedMax
{
  [(KNBuildDiffuseSystem *)self objectSize];
  double v4 = v3 * 1.5;
  [(KNBuildDiffuseSystem *)self duration];
  return v4 / sqrt(v5);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  TSURandomBetween();
  double v4 = v3;
  TSURandomBetween();
  float v5 = v4;
  float v7 = v6;
  float v8 = 0.0;
  float v9 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v9;
  return result;
}

- (double)rotationMax
{
  return 25.1327412;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double x = a3.x;
  float v5 = (char *)[(KNBuildDiffuseSystem *)self direction];
  [(KNBuildDiffuseSystem *)self duration];
  TSUClamp();
  double v7 = v6;
  if (v5 == (unsigned char *)&dword_8 + 3) {
    double x = (double)(unint64_t)[(KNBuildDiffuseSystem *)self particlesWide] - x;
  }
  float v8 = (1.0 - v7) * (x / (double)(unint64_t)[(KNBuildDiffuseSystem *)self particlesWide]);
  float v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

@end