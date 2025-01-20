@interface KNBuildAnvilSmokeSystem
+ (BOOL)useVisibilities;
+ (BOOL)willOverrideStartingPoints;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (double)rotationMax;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (double)speedMax;
@end

@implementation KNBuildAnvilSmokeSystem

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  double v4 = (double)(unint64_t)-[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  double v5 = v4 / (double)(unint64_t)[(KNBuildAnvilSmokeSystem *)self particleCount];
  [(KNBuildAnvilSmokeSystem *)self objectSize];
  double v6 = -8.0;
  double v8 = v5 * v7 + -8.0;
  result.y = v6;
  result.x = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(KNBuildAnvilSmokeSystem *)self randomGenerator];
  double v7 = (double)(unint64_t)(2 * (void)-[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", x, y));
  double v8 = v7 / (double)(unint64_t)[(KNBuildAnvilSmokeSystem *)self particleCount] + -1.0;
  double v9 = sqrt(fabs(v8));
  if (v8 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = -v9;
  }
  double v11 = fabs(v9) + 0.25;
  [v6 doubleBetween:-1.0 :0.1];
  double v13 = v12;
  [v6 doubleBetween:0.25 :1.0];
  *(float *)&double v14 = v14 * v10 * 5.6;
  float v15 = v13 * v11 * -5.0;
  *(float *)&double v13 = *(float *)&v14 / 6.25;
  float v16 = v15 / 6.25;

  float v17 = 0.0;
  float v18 = *(float *)&v13;
  float v19 = v16;
  result.var2 = v17;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (double)speedMax
{
  [(KNBuildAnvilSystem *)self p_anvilGlobalScale];
  return v2 * 6.25;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  double v4 = (double)(unint64_t)(2
                                * (void)-[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y));
  double v5 = v4 / (double)(unint64_t)[(KNBuildAnvilSmokeSystem *)self particleCount] + -1.0;
  double v6 = [(KNBuildAnvilSmokeSystem *)self randomGenerator];
  [v6 doubleBetween:0.5 :1.0];
  double v8 = v5 * v7;

  float v9 = v8;
  float v10 = 0.0;
  float v11 = 0.0;
  result.var2 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (double)rotationMax
{
  [(KNBuildAnvilSmokeSystem *)self duration];
  return v2 * 3.14159265;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  id v4 = -[KNBuildAnvilSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  double v5 = fabs(((double)(unint64_t)v4 + (double)(unint64_t)v4)/ (double)(unint64_t)[(KNBuildAnvilSmokeSystem *)self particleCount]+ -1.0)+ 1.25;
  TSURandom();
  TSDMixFloats();
  double v7 = v6 * v5;
  [(KNBuildAnvilSystem *)self p_anvilGlobalScale];
  return v8 * 0.0625 * v7;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  [(KNBuildAnvilSmokeSystem *)self duration];
  double v5 = v4;
  double v6 = [(KNBuildAnvilSmokeSystem *)self randomGenerator];
  [v6 doubleBetween:0.15 :1.0];
  *(float *)&double v5 = v5 * v7;

  float v8 = 0.0;
  float v9 = *(float *)&v5;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (BOOL)useVisibilities
{
  return 0;
}

@end