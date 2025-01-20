@interface _TUIFlexibleHeightLayoutController
- (double)_layout:(id)a3 lengthForProposedLength:(double)a4;
@end

@implementation _TUIFlexibleHeightLayoutController

- (double)_layout:(id)a3 lengthForProposedLength:(double)a4
{
  _[a3 computeHeightForProposedHeight:a4];
  return result;
}

@end