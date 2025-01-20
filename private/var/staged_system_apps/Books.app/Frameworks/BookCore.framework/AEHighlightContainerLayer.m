@interface AEHighlightContainerLayer
+ (id)defaultActionForKey:(id)a3;
+ (id)layer;
- (int)blendMode;
- (void)renderInContext:(CGContext *)a3;
- (void)setBlendMode:(int)a3;
@end

@implementation AEHighlightContainerLayer

+ (id)layer
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AEHighlightContainerLayer;
  v2 = [super layer];
  [v2 setBlendMode:0];

  return v2;
}

+ (id)defaultActionForKey:(id)a3
{
  return kCFNull;
}

- (void)setBlendMode:(int)a3
{
  if (self->_blendMode != a3)
  {
    switch(a3)
    {
      case 1:
        v5 = &kCAFilterMultiplyBlendMode;
        goto LABEL_8;
      case 2:
        v5 = &kCAFilterScreenBlendMode;
        goto LABEL_8;
      case 3:
        v5 = &kCAFilterOverlayBlendMode;
        goto LABEL_8;
      case 9:
        v5 = &kCAFilterHardLightBlendMode;
LABEL_8:
        v6 = +[CAFilter filterWithType:*v5];
        [(AEHighlightContainerLayer *)self setCompositingFilter:v6];

        break;
      default:
        [(AEHighlightContainerLayer *)self setCompositingFilter:0];
        break;
    }
    self->_blendMode = a3;
  }
}

- (void)renderInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  CGContextSetBlendMode(a3, (CGBlendMode)self->_blendMode);
  v5.receiver = self;
  v5.super_class = (Class)AEHighlightContainerLayer;
  [(AEHighlightContainerLayer *)&v5 renderInContext:a3];
  CGContextRestoreGState(a3);
}

- (int)blendMode
{
  return self->_blendMode;
}

@end