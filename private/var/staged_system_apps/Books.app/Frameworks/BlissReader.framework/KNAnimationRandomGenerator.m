@interface KNAnimationRandomGenerator
+ (id)randomGeneratorFromPluginContext:(id)a3;
+ (unsigned)generateNewSeed;
- ($94F468A8D4C62B317260615823C2B210)metalPoint2DRandomPoint;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DRandomPoint;
- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DRandomDirection;
- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DRandomPoint;
- (KNAnimationRandomGenerator)initWithSeed:(id)a3;
- (double)doubleBetween:(double)a3 :(double)a4;
- (double)randomDouble;
- (int64_t)intBetween:(int64_t)a3 :(int64_t)a4;
- (unint64_t)seed;
- (void)dealloc;
- (void)setSeed:(unint64_t)a3;
@end

@implementation KNAnimationRandomGenerator

- (KNAnimationRandomGenerator)initWithSeed:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KNAnimationRandomGenerator;
  v5 = [(KNAnimationRandomGenerator *)&v9 init];
  if (v5)
  {
    v6 = +[NSUserDefaults standardUserDefaults];
    if ([v6 BOOLForKey:@"RandomNumberSeedAlwaysZero"])
    {
      id v7 = 0;
    }
    else if ([v6 BOOLForKey:@"RandomNumberSeedAlwaysRandom"] || !v4)
    {
      id v7 = (id)arc4random_uniform(0x7FFFFFFFu);
    }
    else
    {
      id v7 = [v4 integerValue];
    }
    [(KNAnimationRandomGenerator *)v5 setSeed:v7];
  }
  return v5;
}

+ (id)randomGeneratorFromPluginContext:(id)a3
{
  v3 = [[KNAnimationRandomGenerator alloc] initWithSeed:0];

  return v3;
}

- (void)dealloc
{
  if (self->_randGenerator) {
    operator delete();
  }
  v2.receiver = self;
  v2.super_class = (Class)KNAnimationRandomGenerator;
  [(KNAnimationRandomGenerator *)&v2 dealloc];
}

+ (unsigned)generateNewSeed
{
  return arc4random_uniform(0x7FFFFFFFu);
}

- (void)setSeed:(unint64_t)a3
{
}

- (double)randomDouble
{
  randGenerator = self->_randGenerator;
  if (!randGenerator)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationRandomGenerator randomDouble]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNAnimationRandomGenerator.mm"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:149 description:@"invalid nil value for '%s'", "_randGenerator"];

    randGenerator = self->_randGenerator;
  }

  RandGenerator::randomDouble(randGenerator);
  return result;
}

- (int64_t)intBetween:(int64_t)a3 :(int64_t)a4
{
  randGenerator = self->_randGenerator;
  if (!randGenerator)
  {
    v8 = +[TSUAssertionHandler currentHandler];
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationRandomGenerator intBetween::]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNAnimationRandomGenerator.mm"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:155 description:@"invalid nil value for '%s'", "_randGenerator"];

    randGenerator = self->_randGenerator;
  }
  if (a3 >= a4) {
    int64_t v11 = a4;
  }
  else {
    int64_t v11 = a3;
  }
  if (a3 <= a4) {
    int64_t v12 = a4;
  }
  else {
    int64_t v12 = a3;
  }
  RandGenerator::randWithMinMax(randGenerator, (double)v11, (double)v12);
  return vcvtmd_s64_f64(v13);
}

- (double)doubleBetween:(double)a3 :(double)a4
{
  randGenerator = self->_randGenerator;
  if (!randGenerator)
  {
    v8 = +[TSUAssertionHandler currentHandler];
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationRandomGenerator doubleBetween::]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNAnimationRandomGenerator.mm"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:174 description:@"invalid nil value for '%s'", "_randGenerator"];

    randGenerator = self->_randGenerator;
  }
  if (a3 >= a4) {
    double v11 = a4;
  }
  else {
    double v11 = a3;
  }
  if (a3 >= a4) {
    a4 = a3;
  }
  RandGenerator::randomDouble(randGenerator);
  double v13 = a4 * v12;
  double v14 = v11 * v12;
  double v15 = v11 + v13 - v14;
  double result = v11 + v13 - v14;
  if (v11 < 0.0 != a4 >= 0.0) {
    return v15;
  }
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DRandomDirection
{
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  double v4 = v3;
  [(KNAnimationRandomGenerator *)self doubleBetween:0.0 :6.28318531];
  double v5 = sqrt(1.0 - v4 * v4);
  __double2 v7 = __sincos_stret(v6);
  float v8 = v5 * v7.__cosval;
  float v9 = v5 * v7.__sinval;
  float v10 = v4;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)metalPoint2DRandomPoint
{
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  double v4 = v3;
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  float v5 = v4;
  float v7 = v6;
  float v8 = v5;
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DRandomPoint
{
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  double v4 = v3;
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  double v6 = v5;
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  float v7 = v4;
  float v8 = v6;
  float v10 = v9;
  float v11 = v7;
  result.var2 = v10;
  result.var1 = v8;
  result.var0 = v11;
  return result;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DRandomPoint
{
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  double v4 = v3;
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  double v6 = v5;
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  double v8 = v7;
  [(KNAnimationRandomGenerator *)self doubleBetween:-1.0 :1.0];
  float v9 = v4;
  float v10 = v6;
  float v11 = v8;
  float v13 = v12;
  float v14 = v9;
  result.var3 = v13;
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v14;
  return result;
}

- (unint64_t)seed
{
  return self->_seed;
}

@end