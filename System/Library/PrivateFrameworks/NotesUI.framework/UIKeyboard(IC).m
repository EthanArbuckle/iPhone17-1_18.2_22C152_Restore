@interface UIKeyboard(IC)
+ (uint64_t)ic_isInFloatingKeyboardMode;
+ (uint64_t)ic_isShiftKeyPressed;
+ (void)ic_suppressingShiftStateUpdates:()IC;
@end

@implementation UIKeyboard(IC)

+ (uint64_t)ic_isInFloatingKeyboardMode
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v0 = (void *)MEMORY[0x1E4FB1900];
  return [v0 isFloating];
}

+ (uint64_t)ic_isShiftKeyPressed
{
  v0 = [MEMORY[0x1E4FB1900] activeInstance];
  uint64_t v1 = [v0 callLayoutIsShiftKeyBeingHeld];

  return v1;
}

+ (void)ic_suppressingShiftStateUpdates:()IC
{
  v3 = a3;
  v4 = [MEMORY[0x1E4FB1900] activeInstance];
  if ([v4 suppressUpdateShiftState])
  {
    v3[2](v3);
  }
  else
  {
    [MEMORY[0x1E4F39CF8] begin];
    [v4 setSuppressUpdateShiftState:1];
    v3[2](v3);
    v5 = (void *)MEMORY[0x1E4F39CF8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__UIKeyboard_IC__ic_suppressingShiftStateUpdates___block_invoke;
    v6[3] = &unk_1E5FD8DF0;
    id v7 = v4;
    [v5 setCompletionBlock:v6];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

@end