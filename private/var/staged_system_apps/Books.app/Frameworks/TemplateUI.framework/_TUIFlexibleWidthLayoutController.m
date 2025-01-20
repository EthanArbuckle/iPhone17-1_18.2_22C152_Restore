@interface _TUIFlexibleWidthLayoutController
- (double)_layout:(id)a3 lengthForProposedLength:(double)a4;
@end

@implementation _TUIFlexibleWidthLayoutController

- (double)_layout:(id)a3 lengthForProposedLength:(double)a4
{
  _[a3 computeWidthForProposedWidth:a4];
  return result;
}

@end