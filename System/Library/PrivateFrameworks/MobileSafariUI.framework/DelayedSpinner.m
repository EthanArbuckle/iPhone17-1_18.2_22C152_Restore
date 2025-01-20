@interface DelayedSpinner
+ (void)_setShowStatusBarSpinner:(BOOL)a3 withDelay:(double)a4;
+ (void)_setShowStatusBarSpinnerTimer:(id)a3;
+ (void)_showStatusBarSpinner:(id)a3;
+ (void)hide;
+ (void)showWithDelay;
@end

@implementation DelayedSpinner

+ (void)_setShowStatusBarSpinnerTimer:(id)a3
{
  id v4 = a3;
  if ((id)showStatusBarSpinnerTimer != v4)
  {
    id v5 = v4;
    [(id)showStatusBarSpinnerTimer invalidate];
    objc_storeStrong((id *)&showStatusBarSpinnerTimer, a3);
    id v4 = v5;
  }
}

+ (void)_showStatusBarSpinner:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 BOOLValue];

  [a1 _setShowStatusBarSpinnerTimer:0];
  v6 = (void *)*MEMORY[0x1E4FB2608];
  [v6 setStatusBarShowsProgress:v5];
}

+ (void)_setShowStatusBarSpinner:(BOOL)a3 withDelay:(double)a4
{
  v6 = (void *)MEMORY[0x1E4F1CB00];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v7 = [v6 scheduledTimerWithTimeInterval:a1 target:sel__showStatusBarSpinner_ selector:v8 userInfo:0 repeats:a4];
  [a1 _setShowStatusBarSpinnerTimer:v7];
}

+ (void)showWithDelay
{
}

+ (void)hide
{
}

@end