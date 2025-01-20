@interface SBUIPasscodeLockViewSimpleFixedDigitKeypad
- (SBUIPasscodeLockViewSimpleFixedDigitKeypad)initWithLightStyle:(BOOL)a3;
- (SBUIPasscodeLockViewSimpleFixedDigitKeypad)initWithLightStyle:(BOOL)a3 numberOfDigits:(unint64_t)a4;
- (double)_entryFieldBottomYDistanceFromNumberPadTopButton;
- (id)_newEntryField;
- (unint64_t)numberOfDigits;
@end

@implementation SBUIPasscodeLockViewSimpleFixedDigitKeypad

- (SBUIPasscodeLockViewSimpleFixedDigitKeypad)initWithLightStyle:(BOOL)a3
{
  return [(SBUIPasscodeLockViewSimpleFixedDigitKeypad *)self initWithLightStyle:a3 numberOfDigits:6];
}

- (SBUIPasscodeLockViewSimpleFixedDigitKeypad)initWithLightStyle:(BOOL)a3 numberOfDigits:(unint64_t)a4
{
  self->_numberOfDigits = a4;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPasscodeLockViewSimpleFixedDigitKeypad;
  v5 = -[SBUIPasscodeLockViewWithKeypad initWithLightStyle:](&v8, sel_initWithLightStyle_);
  if (v5)
  {
    if (a3) {
      [MEMORY[0x1E4F428B8] clearColor];
    }
    else {
    v6 = [MEMORY[0x1E4F428B8] blackColor];
    }
    [(SBUIPasscodeLockViewBase *)v5 setCustomBackgroundColor:v6];
  }
  return v5;
}

- (id)_newEntryField
{
  v3 = [SBUISimpleFixedDigitPasscodeEntryField alloc];
  BOOL v4 = [(SBUIPasscodeLockViewWithKeypad *)self _usesLightStyle];
  unint64_t numberOfDigits = self->_numberOfDigits;
  return [(SBUISimpleFixedDigitPasscodeEntryField *)v3 initWithDefaultSizeAndLightStyle:v4 numberOfDigits:numberOfDigits];
}

- (double)_entryFieldBottomYDistanceFromNumberPadTopButton
{
  v2 = (void *)MEMORY[0x1E4FA5F68];
  BOOL v3 = [(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented];
  [v2 pinFixedDigitEntryFieldBottomYDistanceFromNumberPadTopButton:v3];
  return result;
}

- (unint64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

@end