@interface SBUIPasscodeLockViewLongNumericKeypad
- (SBUIPasscodeLockViewLongNumericKeypad)initWithLightStyle:(BOOL)a3;
- (double)_entryFieldBottomYDistanceFromNumberPadTopButton;
- (id)_newEntryField;
- (void)_setHasInput:(BOOL)a3;
@end

@implementation SBUIPasscodeLockViewLongNumericKeypad

- (SBUIPasscodeLockViewLongNumericKeypad)initWithLightStyle:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockViewLongNumericKeypad;
  v4 = -[SBUIPasscodeLockViewWithKeypad initWithLightStyle:](&v7, sel_initWithLightStyle_);
  if (v4)
  {
    if (a3) {
      [MEMORY[0x1E4F428B8] clearColor];
    }
    else {
    v5 = [MEMORY[0x1E4F428B8] blackColor];
    }
    [(SBUIPasscodeLockViewBase *)v4 setCustomBackgroundColor:v5];
  }
  return v4;
}

- (id)_newEntryField
{
  v3 = [SBUILongNumericPasscodeEntryField alloc];
  BOOL v4 = [(SBUIPasscodeLockViewWithKeypad *)self _usesLightStyle];
  return [(SBUILongNumericPasscodeEntryField *)v3 initWithDefaultSizeAndLightStyle:v4];
}

- (void)_setHasInput:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockViewLongNumericKeypad;
  -[SBUIPasscodeLockViewWithKeypad _setHasInput:](&v7, sel__setHasInput_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBUIPasscodeLockViewLongNumericKeypad__setHasInput___block_invoke;
  v5[3] = &unk_1E5CCC5A8;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:0.25];
}

void __54__SBUIPasscodeLockViewLongNumericKeypad__setHasInput___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _longNumericEntryField];
  [v2 setShowsOkButton:*(unsigned __int8 *)(a1 + 40)];
}

- (double)_entryFieldBottomYDistanceFromNumberPadTopButton
{
  id v2 = (void *)MEMORY[0x1E4FA5F68];
  BOOL v3 = [(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented];
  [v2 pinLongNumericEntryFieldBottomYDistanceFromNumberPadTopButton:v3];
  return result;
}

@end