@interface KNBuildSparkleSystem
+ (BOOL)useVisibilities;
+ (BOOL)willOverrideStartingPoints;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (double)p_globalScale;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (double)speedMax;
@end

@implementation KNBuildSparkleSystem

- (double)p_globalScale
{
  [(KNBuildSparkleSystem *)self objectSize];
  double v4 = v3;
  [(KNBuildSparkleSystem *)self objectSize];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  [(KNBuildSparkleSystem *)self slideSize];
  double v8 = v7;
  [(KNBuildSparkleSystem *)self slideSize];
  if (v8 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }
  return v6 / sqrt(sqrt(v6 / v10)) * 0.25;
}

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(KNBuildSparkleSystem *)self duration];
  double v7 = v6;
  BOOL v8 = [(KNBuildSparkleSystem *)self direction] == (char *)&dword_C + 1
    || [(KNBuildSparkleSystem *)self direction] == (char *)&dword_C + 2;
  BOOL v9 = [(KNBuildSparkleSystem *)self direction] == &dword_C
    || [(KNBuildSparkleSystem *)self direction] == (char *)&dword_C + 1;
  double v10 = 0.1 / v7;
  double v11 = (double)(unint64_t)-[KNBuildSparkleSystem indexFromPoint:](self, "indexFromPoint:", x, y);
  double v12 = v11 / (float)(unint64_t)[(KNBuildSparkleSystem *)self particleCount];
  if (v9) {
    double v13 = 1.0 - v12;
  }
  else {
    double v13 = v12;
  }
  [self randomGenerator].doubleBetween:-1.0, 1.0;
  double v15 = v13 + v10 * v14;
  TSURandom();
  double v17 = ((v16 * 2.0 + -1.0) * fabs(v16 * 2.0 + -1.0) + 1.0) * 0.5;
  if (v8) {
    double v18 = v17;
  }
  else {
    double v18 = v15;
  }
  if (v8) {
    double v19 = v15;
  }
  else {
    double v19 = v17;
  }
  [(KNBuildSparkleSystem *)self objectSize];
  double v21 = v20;
  [(KNBuildSparkleSystem *)self particleSize];
  double v23 = v22 * -0.5 + v18 * v21;
  [(KNBuildSparkleSystem *)self objectSize];
  double v25 = v24;
  [(KNBuildSparkleSystem *)self particleSize];
  double v27 = v26 * -0.5 + v19 * v25;
  double v28 = v23;
  result.double y = v27;
  result.double x = v28;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  id v3 = [(KNBuildSparkleSystem *)self randomGenerator];
  [v3 metalPoint3DRandomDirection];
  float v5 = v4;
  float v7 = v6;
  float v9 = v8 * 0.01;
  [v3 randomDouble];
  double v11 = v10 * v7;
  double v12 = v10 * v9;
  float v13 = v10 * v5;
  float v14 = v11;
  float v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (double)speedMax
{
  [(KNBuildSparkleSystem *)self objectSize];
  double v4 = v3;
  [(KNBuildSparkleSystem *)self objectSize];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  [(KNBuildSparkleSystem *)self slideSize];
  double v8 = v7;
  [(KNBuildSparkleSystem *)self slideSize];
  if (v8 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }
  return v6 / pow(v6 / v10, 0.667) * 0.25 * 1.5;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  [(KNBuildSparkleSystem *)self p_globalScale];
  double v5 = v4;
  [(KNBuildSparkleSystem *)self particleSize];
  return v5 / v6;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double v4 = (double)(unint64_t)-[KNBuildSparkleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  double v5 = v4 / (double)(unint64_t)[(KNBuildSparkleSystem *)self particleCount];
  [(KNBuildSparkleSystem *)self duration];
  double v7 = 0.667 / v6;
  if (v6 <= 0.75) {
    double v7 = 0.889333333;
  }
  float v8 = v5 * (1.0 - v7);
  float v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (BOOL)useVisibilities
{
  return 0;
}

@end