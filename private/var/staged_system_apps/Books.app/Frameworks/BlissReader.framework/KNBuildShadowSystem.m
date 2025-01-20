@interface KNBuildShadowSystem
+ (BOOL)willOverrideGeometry;
+ (unint64_t)numberOfVerticesPerParticle;
- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (KNBuildCrumbleSystem)crumbleSystem;
- (double)lifeSpanDelay;
- (double)lifeSpanRandomness;
- (double)rotationMax;
- (double)speedMax;
- (double)speedMaxLimiter;
- (void)setCrumbleSystem:(id)a3;
- (void)setLifeSpanDelay:(double)a3;
- (void)setLifeSpanRandomness:(double)a3;
- (void)setRotationMax:(double)a3;
- (void)setSpeedMax:(double)a3;
- (void)setSpeedMaxLimiter:(double)a3;
@end

@implementation KNBuildShadowSystem

+ (BOOL)willOverrideGeometry
{
  return 1;
}

+ (unint64_t)numberOfVerticesPerParticle
{
  return 3;
}

- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4
{
  unint64_t v5 = 3 * (void)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a4.x, a4.y) + a3;
  v6 = [(KNBuildCrumbleSystem *)self->_crumbleSystem dataBuffer];
  v7 = [(KNBuildCrumbleSystem *)self->_crumbleSystem positionAttribute];
  [v6 metalPoint2DForAttribute:v7 atIndex:v5];
  float v9 = v8;
  float v11 = v10;

  float v12 = v9;
  float v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3
{
  uint64_t v4 = 3 * (void)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  unint64_t v5 = [(KNBuildCrumbleSystem *)self->_crumbleSystem dataBuffer];
  v6 = [(KNBuildCrumbleSystem *)self->_crumbleSystem centerAttribute];
  [v5 metalPoint2DForAttribute:v6 atIndex:v4];
  float v8 = v7;
  float v10 = v9;

  float v11 = v8;
  float v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  uint64_t v4 = 3 * (void)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  unint64_t v5 = [(KNBuildCrumbleSystem *)self->_crumbleSystem dataBuffer];
  v6 = [(KNBuildCrumbleSystem *)self->_crumbleSystem rotationAttribute];
  [v5 metalPoint3DForAttribute:v6 atIndex:v4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;

  float v13 = v8;
  float v14 = v10;
  float v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  uint64_t v4 = 3 * (void)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  unint64_t v5 = [(KNBuildCrumbleSystem *)self->_crumbleSystem dataBuffer];
  v6 = [(KNBuildCrumbleSystem *)self->_crumbleSystem speedAttribute];
  [v5 metalPoint3DForAttribute:v6 atIndex:v4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;

  float v13 = v8;
  float v14 = v10;
  float v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  uint64_t v4 = 3 * (void)-[KNBuildShadowSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  unint64_t v5 = [(KNBuildCrumbleSystem *)self->_crumbleSystem dataBuffer];
  v6 = [(KNBuildCrumbleSystem *)self->_crumbleSystem lifeSpanAttribute];
  [v5 metalPoint2DForAttribute:v6 atIndex:v4];
  float v8 = v7;
  float v10 = v9;

  float v11 = v8;
  float v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (KNBuildCrumbleSystem)crumbleSystem
{
  return self->_crumbleSystem;
}

- (void)setCrumbleSystem:(id)a3
{
  self->_crumbleSystem = (KNBuildCrumbleSystem *)a3;
}

- (double)speedMaxLimiter
{
  return self->_speedMaxLimiter;
}

- (void)setSpeedMaxLimiter:(double)a3
{
  self->_speedMaxLimiter = a3;
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

- (double)lifeSpanRandomness
{
  return self->_lifeSpanRandomness;
}

- (void)setLifeSpanRandomness:(double)a3
{
  self->_lifeSpanRandomness = a3;
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