@interface CRLImageMaskKnob
- (id)knobImage;
@end

@implementation CRLImageMaskKnob

- (id)knobImage
{
  return +[CRLImage imageNamed:@"ios-canvas-handle-mask"];
}

@end