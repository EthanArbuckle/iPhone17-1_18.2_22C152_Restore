@interface VKAutoFadeOutLayer
- (void)setPosition:(CGPoint)a3;
@end

@implementation VKAutoFadeOutLayer

- (void)setPosition:(CGPoint)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKAutoFadeOutLayer;
  -[VKAutoFadeOutLayer setPosition:](&v5, sel_setPosition_, a3.x, a3.y);
  v4 = [(VKAutoFadeOutLayer *)self superlayer];
  [v4 setNeedsDisplay];
}

@end