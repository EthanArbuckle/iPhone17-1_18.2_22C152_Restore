@interface UIScreen(TelephonyUI)
- (BOOL)isUserInterfaceIdiomPad;
- (uint64_t)screenSizeCategory;
@end

@implementation UIScreen(TelephonyUI)

- (uint64_t)screenSizeCategory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIScreen_TelephonyUI__screenSizeCategory__block_invoke;
  block[3] = &unk_1E647C1D0;
  block[4] = a1;
  if (screenSizeCategory_onceToken != -1) {
    dispatch_once(&screenSizeCategory_onceToken, block);
  }
  return screenSizeCategory_screenCategory;
}

- (BOOL)isUserInterfaceIdiomPad
{
  v1 = [a1 traitCollection];
  BOOL v2 = [v1 userInterfaceIdiom] == 1;

  return v2;
}

@end