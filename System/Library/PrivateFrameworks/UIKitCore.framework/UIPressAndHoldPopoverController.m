@interface UIPressAndHoldPopoverController
+ (BOOL)canPresentPressAndHoldPopoverForEvent:(id)a3;
+ (BOOL)canPresentPressAndHoldPopoverForKeyString:(id)a3;
- (BOOL)handleHardwareKeyboardEvent:(id)a3;
- (BOOL)handleKeyInputForAccentSelector:(id)a3;
- (BOOL)handleKeyInputForPressAndHoldSelector:(id)a3;
- (BOOL)handleSelectionEvent:(id)a3;
- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3;
- (BOOL)isSamePressAndHoldPopoverForKeyString:(id)a3;
- (UIPressAndHoldPopoverController)initWithKeyString:(id)a3;
- (void)insertSelectedAccentVariant:(id)a3 shouldDismissPopover:(BOOL)a4;
- (void)pressAndHoldViewDidAcceptAccentVariant:(id)a3 atIndexPath:(id)a4;
- (void)showAccentVariantInForwardDirection:(BOOL)a3;
@end

@implementation UIPressAndHoldPopoverController

- (UIPressAndHoldPopoverController)initWithKeyString:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIPressAndHoldPopoverController;
  v5 = [(UIKeyboardPopoverController *)&v13 init];
  if (v5)
  {
    [getTUIPressAndHoldViewClass() requiredPopoverSizeForKeyString:v4];
    double v7 = v6;
    double v9 = v8;
    uint64_t v10 = objc_msgSend(objc_alloc((Class)getTUIPressAndHoldViewClass()), "initWithFrame:keyString:", v4, 0.0, 0.0, v6, v8);
    pressAndHoldView = v5->_pressAndHoldView;
    v5->_pressAndHoldView = (TUIPressAndHoldView *)v10;

    [(TUIPressAndHoldView *)v5->_pressAndHoldView setDelegate:v5];
    [(UIKeyboardPopoverController *)v5 setContentView:v5->_pressAndHoldView];
    -[UIViewController setPreferredContentSize:](v5, "setPreferredContentSize:", v7, v9);
  }

  return v5;
}

- (BOOL)handleHardwareKeyboardEvent:(id)a3
{
  id v4 = a3;
  v5 = [[UIKey alloc] initWithKeyboardEvent:v4];
  LOBYTE(self) = [(UIPressAndHoldPopoverController *)self handleKeyInputForPressAndHoldSelector:v4];

  return (char)self;
}

+ (BOOL)canPresentPressAndHoldPopoverForEvent:(id)a3
{
  id v3 = a3;
  id TUIPressAndHoldViewClass = getTUIPressAndHoldViewClass();
  v5 = [v3 _modifiedInput];

  double v6 = [TUIPressAndHoldViewClass accentedCharactersForKeyString:v5];
  LOBYTE(TUIPressAndHoldViewClass) = [v6 count] != 0;

  return (char)TUIPressAndHoldViewClass;
}

+ (BOOL)canPresentPressAndHoldPopoverForKeyString:(id)a3
{
  id v3 = a3;
  id v4 = [getTUIPressAndHoldViewClass() accentedCharactersForKeyString:v3];

  LOBYTE(v3) = [v4 count] != 0;
  return (char)v3;
}

- (BOOL)isSamePressAndHoldPopoverForKeyString:(id)a3
{
  pressAndHoldView = self->_pressAndHoldView;
  if (!pressAndHoldView) {
    return 0;
  }
  id v4 = a3;
  v5 = [(TUIPressAndHoldView *)pressAndHoldView currentKeyString];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)handleKeyInputForPressAndHoldSelector:(id)a3
{
  id v4 = a3;
  if (![v4 _keyCode])
  {
    BOOL v6 = 0;
    goto LABEL_13;
  }
  [v4 _hidEvent];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  if ([v4 _keyCode] != 40)
  {
    if (IntegerValue == 7
      && ([v4 _keyCode] >= 30 && objc_msgSend(v4, "_keyCode") < 39
       || [v4 _keyCode] >= 89 && objc_msgSend(v4, "_keyCode") <= 97))
    {
      pressAndHoldView = self->_pressAndHoldView;
      double v8 = [v4 _modifiedInput];
      LOBYTE(pressAndHoldView) = -[TUIPressAndHoldView handleNumberKey:](pressAndHoldView, "handleNumberKey:", (int)[v8 intValue]);

      if (pressAndHoldView) {
        goto LABEL_4;
      }
    }
LABEL_12:
    BOOL v6 = [(UIPressAndHoldPopoverController *)self handleKeyInputForAccentSelector:v4];
    goto LABEL_13;
  }
  if (![(UIPressAndHoldPopoverController *)self handleSelectionEvent:v4]) {
    goto LABEL_12;
  }
LABEL_4:
  BOOL v6 = 1;
LABEL_13:

  return v6;
}

- (BOOL)handleSelectionEvent:(id)a3
{
  if ([(TUIPressAndHoldView *)self->_pressAndHoldView pressAndHoldGridHasSelectedIndexPath])
  {
    [(TUIPressAndHoldView *)self->_pressAndHoldView handleSelection];
  }
  else
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    [v4 dismissPressAndHoldPopover];
  }
  return 1;
}

- (BOOL)handleKeyInputForAccentSelector:(id)a3
{
  uint64_t v4 = [a3 _keyCode];
  BOOL v5 = 0;
  if (v4 > 223)
  {
    if ((unint64_t)(v4 - 224) < 8) {
      return v5;
    }
    goto LABEL_15;
  }
  if (v4 <= 79)
  {
    switch(v4)
    {
      case '+':
        goto LABEL_6;
      case '9':
        return v5;
      case 'O':
LABEL_6:
        BOOL v5 = 1;
        if ([(UIPressAndHoldPopoverController *)self hasAccentVariantInForwardDirection:1])
        {
          [(UIPressAndHoldPopoverController *)self showAccentVariantInForwardDirection:1];
        }
        return v5;
    }
LABEL_15:
    BOOL v6 = +[UIKeyboardImpl activeInstance];
    [v6 dismissPressAndHoldPopover];

    return 0;
  }
  if ((unint64_t)(v4 - 127) < 4) {
    return v5;
  }
  if (v4 != 80) {
    goto LABEL_15;
  }
  if ([(UIPressAndHoldPopoverController *)self hasAccentVariantInForwardDirection:0])
  {
    [(UIPressAndHoldPopoverController *)self showAccentVariantInForwardDirection:0];
  }
  return 1;
}

- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3
{
  return [(TUIPressAndHoldView *)self->_pressAndHoldView hasAccentVariantInForwardDirection:a3];
}

- (void)showAccentVariantInForwardDirection:(BOOL)a3
{
  [(TUIPressAndHoldView *)self->_pressAndHoldView showAccentVariantInForwardDirection:a3];
  id v4 = [(TUIPressAndHoldView *)self->_pressAndHoldView selectedAccentVariant];
  [(UIPressAndHoldPopoverController *)self insertSelectedAccentVariant:v4 shouldDismissPopover:0];
}

- (void)pressAndHoldViewDidAcceptAccentVariant:(id)a3 atIndexPath:(id)a4
{
}

- (void)insertSelectedAccentVariant:(id)a3 shouldDismissPopover:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = +[UIKeyboardImpl activeInstance];
  [v6 insertedAccentVariantFromPopover:v5];

  if (v4)
  {
    id v7 = +[UIKeyboardImpl activeInstance];
    [v7 dismissPressAndHoldPopover];
  }
}

- (void).cxx_destruct
{
}

@end