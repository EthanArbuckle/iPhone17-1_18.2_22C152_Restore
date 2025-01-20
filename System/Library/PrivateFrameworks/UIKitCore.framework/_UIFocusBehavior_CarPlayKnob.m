@interface _UIFocusBehavior_CarPlayKnob
+ (id)sharedInstance;
- (BOOL)refinesIndexBarTargetContentOffset;
@end

@implementation _UIFocusBehavior_CarPlayKnob

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___UIFocusBehavior_CarPlayKnob_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB262058 != -1) {
    dispatch_once(&qword_1EB262058, block);
  }
  v2 = (void *)_MergedGlobals_1171;
  return v2;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 1;
}

@end