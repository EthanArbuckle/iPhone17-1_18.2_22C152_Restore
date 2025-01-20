@interface _UIFocusBehavior_CarPlayTouchpad
+ (id)sharedInstance;
- (BOOL)refinesIndexBarTargetContentOffset;
- (BOOL)shouldEnableFocusOnSelect;
- (BOOL)supportsIndirectPanningMovement;
@end

@implementation _UIFocusBehavior_CarPlayTouchpad

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___UIFocusBehavior_CarPlayTouchpad_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25F200 != -1) {
    dispatch_once(&qword_1EB25F200, block);
  }
  v2 = (void *)_MergedGlobals_964;
  return v2;
}

- (BOOL)supportsIndirectPanningMovement
{
  return 1;
}

- (BOOL)shouldEnableFocusOnSelect
{
  return 1;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 1;
}

@end