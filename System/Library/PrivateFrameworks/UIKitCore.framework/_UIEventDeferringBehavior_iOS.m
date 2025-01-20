@interface _UIEventDeferringBehavior_iOS
- (BOOL)wantsSystemKeyCommandOverlayRules;
@end

@implementation _UIEventDeferringBehavior_iOS

- (BOOL)wantsSystemKeyCommandOverlayRules
{
  if (qword_1EB262FD8 != -1) {
    dispatch_once(&qword_1EB262FD8, &__block_literal_global_502);
  }
  return _MergedGlobals_1229;
}

@end