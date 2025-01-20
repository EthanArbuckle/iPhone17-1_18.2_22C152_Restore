@interface KNBuildAnvilSpecksSystem
+ (BOOL)useVisibilities;
+ (BOOL)willOverrideStartingPoint;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (double)speedMax;
@end

@implementation KNBuildAnvilSpecksSystem

+ (BOOL)willOverrideStartingPoint
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  double v4 = (double)(unint64_t)-[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  double v5 = v4 / (double)(unint64_t)[(KNBuildAnvilSpecksSystem *)self particleCount];
  [(KNBuildAnvilSpecksSystem *)self objectSize];
  double v6 = 8.0;
  double v8 = v5 * v7 + 8.0;
  result.y = v6;
  result.x = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(KNBuildAnvilSpecksSystem *)self randomGenerator];
  id v7 = -[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", x, y);
  double v8 = (double)(unint64_t)(2 * (void)v7)
     / (double)(unint64_t)[(KNBuildAnvilSpecksSystem *)self particleCount]
     + -1.0;
  [v6 doubleBetween:0.2 :1.0];
  double v10 = v9;
  if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v7 + 0x5555555555555555 >= 0x5555555555555555)
  {
    [v6 randomDouble];
    double v8 = v8 * 10.0;
    double v10 = v10 * dbl_344F10[v12 < 0.5] * 10.0;
    float v11 = 0.2;
  }
  else
  {
    float v11 = 1.0;
  }
  double v13 = v10 / 52.5 * 4.0;
  float v14 = v8 / 52.5 * 5.25;
  float v15 = v13;

  float v16 = v14;
  float v17 = v15;
  float v18 = v11;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (double)speedMax
{
  [(KNBuildAnvilSystem *)self p_anvilGlobalScale];
  return v2 * 10.0 * 5.25;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  id v4 = -[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  double v5 = [(KNBuildAnvilSpecksSystem *)self randomGenerator];
  [v5 doubleBetween:3.0 :5.0];
  double v7 = v6;

  if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v4 + 0x5555555555555555 >= 0x5555555555555555) {
    double v7 = v7 * 3.0;
  }
  [(KNBuildAnvilSystem *)self p_anvilGlobalScale];
  return v7 * (v8 * 0.0625);
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  id v4 = -[KNBuildAnvilSpecksSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  [(KNBuildAnvilSpecksSystem *)self duration];
  if (v5 <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  double v7 = [(KNBuildAnvilSpecksSystem *)self randomGenerator];
  [v7 doubleBetween:0.2 :0.5];
  float v9 = v6 * v8;

  if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v4 + 0x5555555555555555 >= 0x5555555555555555) {
    float v10 = v9 * 10.0;
  }
  else {
    float v10 = v9;
  }
  float v11 = 0.0;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

+ (BOOL)useVisibilities
{
  return 0;
}

@end