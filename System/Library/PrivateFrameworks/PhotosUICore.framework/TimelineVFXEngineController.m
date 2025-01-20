@interface TimelineVFXEngineController
- (void)reduceMotionDidChange;
@end

@implementation TimelineVFXEngineController

- (void)reduceMotionDidChange
{
  v3 = self;
  sub_1AB22F8DC();
  (*((void (**)(id))self->super.isa + 202))(objc_msgSend(v3, sel_px_accessibilityIsReduceMotionEnabled));
  swift_release();
}

@end