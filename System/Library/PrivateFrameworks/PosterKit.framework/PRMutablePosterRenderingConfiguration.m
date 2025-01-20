@interface PRMutablePosterRenderingConfiguration
- (BOOL)isDepthEffectDisabled;
- (BOOL)isParallaxEnabled;
- (PRMutablePosterRenderingConfiguration)initWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDepthEffectDisabled:(BOOL)a3;
- (void)setParallaxEnabled:(BOOL)a3;
@end

@implementation PRMutablePosterRenderingConfiguration

- (PRMutablePosterRenderingConfiguration)initWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PRMutablePosterRenderingConfiguration;
  result = -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](&v7, sel_initWithDepthEffectDisabled_parallaxEnabled_);
  if (result)
  {
    result->_depthEffectDisabled = a3;
    result->_parallaxEnabled = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PRPosterRenderingConfiguration allocWithZone:a3];
  return [(PRPosterRenderingConfiguration *)v4 initWithRenderingConfiguration:self];
}

- (BOOL)isDepthEffectDisabled
{
  return self->_depthEffectDisabled;
}

- (void)setDepthEffectDisabled:(BOOL)a3
{
  self->_depthEffectDisabled = a3;
}

- (BOOL)isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

@end