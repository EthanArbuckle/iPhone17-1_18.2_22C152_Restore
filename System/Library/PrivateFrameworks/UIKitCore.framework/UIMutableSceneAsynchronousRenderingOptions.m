@interface UIMutableSceneAsynchronousRenderingOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setRenderMaxAPL:(float)a3;
- (void)setRenderPeriod:(double)a3;
- (void)setRenderTimes:(id)a3;
@end

@implementation UIMutableSceneAsynchronousRenderingOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UISceneAsynchronousRenderingOptions alloc];
  return [(UISceneAsynchronousRenderingOptions *)v4 initWithOptions:self];
}

- (void)setRenderTimes:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  renderTimes = self->super._renderTimes;
  self->super._renderTimes = v4;
}

- (void)setRenderPeriod:(double)a3
{
  self->super._renderPeriod = a3;
}

- (void)setRenderMaxAPL:(float)a3
{
  self->super._renderMaxAPL = a3;
}

- (void)setOpaque:(BOOL)a3
{
  self->super._opaque = a3;
}

@end