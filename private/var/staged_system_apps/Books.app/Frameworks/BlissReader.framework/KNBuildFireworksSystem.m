@interface KNBuildFireworksSystem
+ (BOOL)willOverrideColors;
+ (BOOL)willOverrideStartingPoints;
- ($94F468A8D4C62B317260615823C2B210)lifeSpan;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (BOOL)didDrawCenterBurst;
- (CGPoint)randomParticleSpeedMinMax;
- (CGPoint)startingPoint;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (CGSize)randomParticleSizeMinMax;
- (double)colorRandomness;
- (double)fireworkStartingPositionX;
- (double)lifeSpanMinDuration;
- (double)maxDistance;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (double)speedMax;
- (void)setColorRandomness:(double)a3;
- (void)setDidDrawCenterBurst:(BOOL)a3;
- (void)setFireworkStartingPositionX:(double)a3;
- (void)setLifeSpan:(id)a3;
- (void)setLifeSpanMinDuration:(double)a3;
- (void)setMaxDistance:(double)a3;
- (void)setRandomParticleSizeMinMax:(CGSize)a3;
- (void)setRandomParticleSpeedMinMax:(CGPoint)a3;
- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5;
@end

@implementation KNBuildFireworksSystem

- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  [(KNBuildFireworksSystem *)self fireworkStartingPositionX];
  double v10 = v9;
  [(KNBuildFireworksSystem *)self objectSize];
  double v12 = v11;
  [(KNBuildFireworksSystem *)self slideSize];
  double v13 = 1.0;
  double v14 = 1.0;
  if (v15 > 0.0)
  {
    [(KNBuildFireworksSystem *)self slideSize];
    double v14 = v16;
  }
  [v8 frame];
  double v18 = v17;
  [v8 frame];
  double v20 = v19;
  v21 = [(KNBuildFireworksSystem *)self randomGenerator];
  [(KNBuildFireworksSystem *)self objectSize];
  double v23 = v22;
  [(KNBuildFireworksSystem *)self slideSize];
  double v25 = v24 / 10.0;
  if (v23 < v24 / 10.0) {
    double v25 = v23;
  }
  double v26 = -v25;
  [(KNBuildFireworksSystem *)self objectSize];
  [v21 doubleBetween:v26];
  double v28 = v27;

  [(KNBuildFireworksSystem *)self slideSize];
  if (v29 > 0.0)
  {
    [(KNBuildFireworksSystem *)self slideSize];
    double v13 = v30;
  }
  CGFloat v31 = v18 + v20 * (v10 * v12 / v14);
  double v32 = v28 / v13;
  [v8 frame];
  double v34 = v33;
  [v8 frame];
  self->_startingPoint.x = v31;
  self->_startingPoint.y = v34 + v35 * v32;
  TSURandom();
  v36 = +[TSUColor colorWithHue:saturation:brightness:alpha:](TSUColor, "colorWithHue:saturation:brightness:alpha:");
  [v36 redComponent];
  double v38 = v37;
  [v36 greenComponent];
  double v40 = v39;
  [v36 blueComponent];
  float v41 = v38;
  float v42 = v40;
  *(float *)&double v43 = v43;
  self->_startingColorRGB.x = v41;
  self->_startingColorRGB.y = v42;
  self->_startingColorRGB.z = *(float *)&v43;
  v45.receiver = self;
  v45.super_class = (Class)KNBuildFireworksSystem;
  -[KNBuildFireworksSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](&v45, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, v5, width, height);
}

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  double x = self->_startingPoint.x;
  double y = self->_startingPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

+ (BOOL)willOverrideColors
{
  return 1;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3
{
  objc_opt_class();
  v4 = [(KNBuildFireworksSystem *)self randomGenerator];
  BOOL v5 = TSUDynamicCast();

  [v5 metalPoint3DRandomDirection];
  [(KNBuildFireworksSystem *)self colorRandomness];
  TSUClamp();
  float v7 = v6;
  TSUClamp();
  float v9 = v8;
  TSUClamp();
  float v11 = v10;

  float v12 = 1.0;
  float v13 = v7;
  float v14 = v9;
  float v15 = v11;
  result.var3 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (double)speedMax
{
  [(KNBuildFireworksSystem *)self maxDistance];
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  v4 = [(KNBuildFireworksSystem *)self randomGenerator];
  [v4 metalPoint3DRandomDirection];
  float v6 = v5;
  float v8 = v7;
  float v10 = v9;
  [(KNBuildFireworksSystem *)self randomParticleSpeedMinMax];
  double v12 = v11;
  [(KNBuildFireworksSystem *)self randomParticleSpeedMinMax];
  [v4 doubleBetween:v12];
  float v14 = v13 * v6;
  float v15 = v13 * v8;
  float v16 = v13 * v10;

  float v17 = v14;
  float v18 = v15;
  float v19 = v16;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  v4 = [(KNBuildFireworksSystem *)self randomGenerator];
  [(KNBuildFireworksSystem *)self randomParticleSizeMinMax];
  double v6 = v5;
  [(KNBuildFireworksSystem *)self randomParticleSizeMinMax];
  [v4 doubleBetween:v6];
  double v8 = v7;

  return v8;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  v4 = [(KNBuildFireworksSystem *)self randomGenerator];
  [(KNBuildFireworksSystem *)self lifeSpanMinDuration];
  [v4 doubleBetween:];
  float v6 = v5;

  float v7 = 0.0;
  float v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)lifeSpanMinDuration
{
  return self->_lifeSpanMinDuration;
}

- (void)setLifeSpanMinDuration:(double)a3
{
  self->_lifeSpanMinDuration = a3;
}

- (double)colorRandomness
{
  return self->_colorRandomness;
}

- (void)setColorRandomness:(double)a3
{
  self->_colorRandomness = a3;
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

- (double)maxDistance
{
  return self->_maxDistance;
}

- (void)setMaxDistance:(double)a3
{
  self->_maxDistance = a3;
}

- (CGSize)randomParticleSizeMinMax
{
  double width = self->_randomParticleSizeMinMax.width;
  double height = self->_randomParticleSizeMinMax.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRandomParticleSizeMinMax:(CGSize)a3
{
  self->_randomParticleSizeMinMadouble x = a3;
}

- (CGPoint)randomParticleSpeedMinMax
{
  double x = self->_randomParticleSpeedMinMax.x;
  double y = self->_randomParticleSpeedMinMax.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRandomParticleSpeedMinMax:(CGPoint)a3
{
  self->_randomParticleSpeedMinMadouble x = a3;
}

- (double)fireworkStartingPositionX
{
  return self->_fireworkStartingPositionX;
}

- (void)setFireworkStartingPositionX:(double)a3
{
  self->_fireworkStartingPositionX = a3;
}

- (BOOL)didDrawCenterBurst
{
  return self->_didDrawCenterBurst;
}

- (void)setDidDrawCenterBurst:(BOOL)a3
{
  self->_didDrawCenterBurst = a3;
}

- (CGPoint)startingPoint
{
  double x = self->_startingPoint.x;
  double y = self->_startingPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end