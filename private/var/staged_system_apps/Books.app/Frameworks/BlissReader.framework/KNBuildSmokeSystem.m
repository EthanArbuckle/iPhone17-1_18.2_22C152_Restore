@interface KNBuildSmokeSystem
+ (BOOL)willOverrideStartingPoints;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (double)lifeSpanDelay;
- (double)rotationMax;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (double)scaleMax;
- (double)speedMax;
- (void)setLifeSpanDelay:(double)a3;
- (void)setRotationMax:(double)a3;
- (void)setScaleMax:(double)a3;
- (void)setSpeedMax:(double)a3;
@end

@implementation KNBuildSmokeSystem

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  id v4 = -[KNBuildSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  [(KNBuildSmokeSystem *)self objectSize];
  double v6 = v5
     * (double)(unint64_t)v4
     / (double)(unint64_t)[(KNBuildSmokeSystem *)self particleCount];
  [(KNBuildSmokeSystem *)self particleSize];
  double v8 = v6 + v7 * -0.5;
  TSURandom();
  double v10 = v9;
  [(KNBuildSmokeSystem *)self objectSize];
  double v12 = v11;
  [(KNBuildSmokeSystem *)self particleSize];
  double v14 = v13 * -0.5 + v10 * v12;
  double v15 = v8;
  result.y = v14;
  result.x = v15;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  v3 = [(KNBuildSmokeSystem *)self randomGenerator];
  [v3 doubleBetween:-1.0 :-0.3];
  float v5 = v4;

  float v6 = 0.0;
  float v7 = 0.0;
  float v8 = v5;
  result.var2 = v7;
  result.var1 = v8;
  result.var0 = v6;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  v3 = [(KNBuildSmokeSystem *)self randomGenerator];
  [v3 doubleBetween:-1.0 :1.0];
  float v5 = v4;

  float v6 = 0.0;
  float v7 = 0.0;
  float v8 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  double v4 = [(KNBuildSmokeSystem *)self randomGenerator];
  [(KNBuildSmokeSystem *)self scaleMax];
  [v4 doubleBetween:1.0 :v5];
  double v7 = v6;

  return v7;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  -[KNBuildSmokeSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  [(KNBuildSmokeSystem *)self objectSize];
  [(KNBuildSmokeSystem *)self particleCount];
  double v4 = (int *)[(KNBuildSmokeSystem *)self direction];
  if (v4 == (int32_t *)((char *)&stru_20.maxprot + 3)) {
    goto LABEL_7;
  }
  if (v4 != &dword_C && v4 != (int *)((char *)&dword_8 + 3))
  {
    double v5 = +[TSUAssertionHandler currentHandler];
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildSmokeSystem lifeSpanAtIndexPoint:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:941 description:@"Invalid direction!"];

LABEL_7:
    TSURandomBetween();
    goto LABEL_8;
  }
  [(KNBuildSmokeSystem *)self objectSize];
LABEL_8:
  [(KNBuildSmokeSystem *)self lifeSpanDelay];
  [(KNBuildSmokeSystem *)self lifeSpanDelay];
  TSUClamp();
  double v9 = v8;
  [(KNBuildSmokeSystem *)self lifeSpanDelay];
  double v11 = 1.0 - v10;
  float v12 = v9;
  float v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (double)speedMax
{
  return self->_speedMax;
}

- (void)setSpeedMax:(double)a3
{
  self->_speedMax = a3;
}

- (double)rotationMax
{
  return self->_rotationMax;
}

- (void)setRotationMax:(double)a3
{
  self->_rotationMax = a3;
}

- (double)scaleMax
{
  return self->_scaleMax;
}

- (void)setScaleMax:(double)a3
{
  self->_scaleMax = a3;
}

- (double)lifeSpanDelay
{
  return self->_lifeSpanDelay;
}

- (void)setLifeSpanDelay:(double)a3
{
  self->_lifeSpanDelay = a3;
}

@end