@interface PTUINumericKeypad
+ (id)sharedKeypad;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)stringValue;
- (PTUINumericKeypad)init;
- (double)_layoutButtonRow:(id)a3 atY:(double)a4;
- (double)_layoutButtonRow:(id)a3 atY:(double)a4 stretch:(BOOL)a5;
- (double)doubleValue;
- (unint64_t)_remainingAllowedDigits;
- (void)_appendDigit:(unint64_t)a3;
- (void)_appendDot;
- (void)_backspace;
- (void)_changeSign;
- (void)_clear;
- (void)_dismissButtonPress;
- (void)_flash;
- (void)_updateDisplayedValue;
- (void)hideAnimated:(BOOL)a3;
- (void)keyPress:(id)a3;
- (void)layoutSubviews;
- (void)setDoubleValue:(double)a3;
- (void)setStringValue:(id)a3;
- (void)showAnimated:(BOOL)a3 forDelegate:(id)a4;
@end

@implementation PTUINumericKeypad

+ (id)sharedKeypad
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__PTUINumericKeypad_sharedKeypad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedKeypad_onceToken != -1) {
    dispatch_once(&sharedKeypad_onceToken, block);
  }
  v2 = (void *)sharedKeypad___keypad;

  return v2;
}

uint64_t __33__PTUINumericKeypad_sharedKeypad__block_invoke(uint64_t a1)
{
  sharedKeypad___keypad = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (PTUINumericKeypad)init
{
  v43.receiver = self;
  v43.super_class = (Class)PTUINumericKeypad;
  v2 = [(PTUINumericKeypad *)&v43 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    digitsBeforeDot = v2->_digitsBeforeDot;
    v2->_digitsBeforeDot = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    digitsAfterDot = v2->_digitsAfterDot;
    v2->_digitsAfterDot = (NSMutableArray *)v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v7;

    v9 = v2->_backgroundView;
    v10 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)v9 setBackgroundColor:v10];

    v11 = [(UIView *)v2->_backgroundView layer];
    [v11 setCornerRadius:10.0];

    v12 = [(UIView *)v2->_backgroundView layer];
    [v12 setBorderWidth:2.0];

    v13 = [(UIView *)v2->_backgroundView layer];
    _KeypadForegroundColor();
    id v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    [(PTUINumericKeypad *)v2 addSubview:v2->_backgroundView];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    valueLabel = v2->_valueLabel;
    v2->_valueLabel = v15;

    v17 = v2->_valueLabel;
    v18 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v17 setBackgroundColor:v18];

    v19 = v2->_valueLabel;
    v20 = _KeypadForegroundColor();
    [(UILabel *)v19 setTextColor:v20];

    v21 = v2->_valueLabel;
    v22 = [MEMORY[0x263F1C658] systemFontOfSize:23.0];
    [(UILabel *)v21 setFont:v22];

    [(UILabel *)v2->_valueLabel setTextAlignment:2];
    [(PTUINumericKeypad *)v2 addSubview:v2->_valueLabel];
    v23 = objc_alloc_init(_KeypadDismissButton);
    dismissButton = v2->_dismissButton;
    v2->_dismissButton = v23;

    [(_KeypadDismissButton *)v2->_dismissButton addTarget:v2 action:sel__dismissButtonPress forControlEvents:64];
    [(PTUINumericKeypad *)v2 addSubview:v2->_dismissButton];
    v25 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != 10; ++i)
    {
      v27 = [[_KeypadButton alloc] initWithDigit:i target:v2];
      [v25 addObject:v27];
      [(PTUINumericKeypad *)v2 addSubview:v27];
    }
    uint64_t v28 = [v25 copy];
    digitButtons = v2->_digitButtons;
    v2->_digitButtons = (NSArray *)v28;

    v30 = [[_KeypadButton alloc] initWithKeyType:1 target:v2];
    dotButton = v2->_dotButton;
    v2->_dotButton = v30;

    [(PTUINumericKeypad *)v2 addSubview:v2->_dotButton];
    v32 = [[_KeypadButton alloc] initWithKeyType:2 target:v2];
    signButton = v2->_signButton;
    v2->_signButton = v32;

    [(PTUINumericKeypad *)v2 addSubview:v2->_signButton];
    v34 = [[_KeypadButton alloc] initWithKeyType:3 target:v2];
    clearButton = v2->_clearButton;
    v2->_clearButton = v34;

    [(PTUINumericKeypad *)v2 addSubview:v2->_clearButton];
    v36 = [[_KeypadButton alloc] initWithKeyType:4 target:v2];
    backspaceButton = v2->_backspaceButton;
    v2->_backspaceButton = v36;

    [(PTUINumericKeypad *)v2 addSubview:v2->_backspaceButton];
    v38 = [(PTUINumericKeypad *)v2 layer];
    objc_msgSend(v38, "setShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

    v39 = [(PTUINumericKeypad *)v2 layer];
    LODWORD(v40) = 1053609165;
    [v39 setShadowOpacity:v40];

    v41 = [(PTUINumericKeypad *)v2 layer];
    [v41 setShadowRadius:8.0];
  }
  return v2;
}

- (void)showAnimated:(BOOL)a3 forDelegate:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_delegate, a4);
  if (!self->_showing)
  {
    v8 = [(PTUINumericKeypad *)self superview];

    if (!v8)
    {
      [(id)__numericKeypadWindow addSubview:self];
      [(id)__numericKeypadWindow bringSubviewToFront:self];
      [(PTUINumericKeypad *)self sizeToFit];
      [(id)__numericKeypadWindow bounds];
      double MidX = CGRectGetMidX(v17);
      [(id)__numericKeypadWindow bounds];
      -[PTUINumericKeypad setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v18) + -100.0);
      CGAffineTransformMakeScale(&v16, 0.75, 0.75);
      [(PTUINumericKeypad *)self setTransform:&v16];
      [(PTUINumericKeypad *)self setAlpha:0.0];
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke;
    v15[3] = &unk_26425E9A8;
    v15[4] = self;
    v10 = (void (**)(void))MEMORY[0x2166C6A80](v15);
    v11 = v10;
    if (v5)
    {
      v12 = (void *)MEMORY[0x263F1CB60];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke_2;
      v13[3] = &unk_26425E9D0;
      id v14 = v10;
      [v12 animateWithDuration:4 delay:v13 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      v10[2](v10);
    }
    self->_showing = 1;
  }
}

uint64_t __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hideAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  delegate = self->_delegate;
  self->_delegate = 0;

  if (self->_showing)
  {
    if (v3)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __34__PTUINumericKeypad_hideAnimated___block_invoke;
      v7[3] = &unk_26425E9A8;
      v7[4] = self;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __34__PTUINumericKeypad_hideAnimated___block_invoke_2;
      v6[3] = &unk_26425E9F8;
      v6[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v7 options:v6 animations:0.3 completion:0.0];
    }
    else
    {
      [(PTUINumericKeypad *)self removeFromSuperview];
    }
    self->_showing = 0;
  }
}

uint64_t __34__PTUINumericKeypad_hideAnimated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.75, 0.75);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

unsigned char *__34__PTUINumericKeypad_hideAnimated___block_invoke_2(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[416]) {
    return (unsigned char *)[result removeFromSuperview];
  }
  return result;
}

- (double)doubleValue
{
  cachedNumberValue = self->_cachedNumberValue;
  if (!cachedNumberValue)
  {
    if ([(NSMutableArray *)self->_digitsBeforeDot count])
    {
      unint64_t v4 = 0;
      double v5 = 1.0;
      double v6 = 0.0;
      do
      {
        id v7 = [(NSMutableArray *)self->_digitsBeforeDot objectAtIndex:v4];
        unint64_t v8 = [v7 integerValue];

        double v6 = v6 + (double)v8 * v5;
        double v5 = v5 * 10.0;
        ++v4;
      }
      while (v4 < [(NSMutableArray *)self->_digitsBeforeDot count]);
    }
    else
    {
      double v6 = 0.0;
    }
    if ([(NSMutableArray *)self->_digitsAfterDot count])
    {
      unint64_t v9 = 0;
      double v10 = 0.1;
      do
      {
        v11 = [(NSMutableArray *)self->_digitsAfterDot objectAtIndex:v9];
        unint64_t v12 = [v11 integerValue];

        double v6 = v6 + (double)v12 * v10;
        double v10 = v10 * 0.1;
        ++v9;
      }
      while (v9 < [(NSMutableArray *)self->_digitsAfterDot count]);
    }
    double v13 = -v6;
    if (!self->_negative) {
      double v13 = v6;
    }
    *(float *)&double v13 = v13;
    id v14 = [NSNumber numberWithFloat:v13];
    v15 = self->_cachedNumberValue;
    self->_cachedNumberValue = v14;

    cachedNumberValue = self->_cachedNumberValue;
  }
  [(NSNumber *)cachedNumberValue floatValue];
  return v16;
}

- (void)setDoubleValue:(double)a3
{
  [(NSMutableArray *)self->_digitsBeforeDot removeAllObjects];
  [(NSMutableArray *)self->_digitsAfterDot removeAllObjects];
  self->_negative = a3 < 0.0;
  double v5 = fabs(a3);
  unint64_t v6 = vcvtmd_u64_f64(v5);
  if (v6)
  {
    unint64_t v7 = 1;
    do
    {
      if ((unint64_t)[(NSMutableArray *)self->_digitsBeforeDot count] > 0xA) {
        break;
      }
      unint64_t v8 = 10 * v7;
      digitsBeforeDot = self->_digitsBeforeDot;
      double v10 = [NSNumber numberWithUnsignedInteger:v6 % (10 * v7) / v7];
      [(NSMutableArray *)digitsBeforeDot addObject:v10];

      unint64_t v7 = v8;
    }
    while (v8 <= v6);
  }
  unint64_t v11 = [(PTUINumericKeypad *)self _remainingAllowedDigits];
  if (v11 != -1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    double v12 = v5 - (double)v6;
    do
    {
      double v15 = v12 * 10.0;
      unint64_t v16 = vcvtmd_u64_f64(v12 * 10.0);
      if (v16)
      {
        for (; v14; --v14)
          [(NSMutableArray *)self->_digitsAfterDot addObject:&unk_26C69C378];
        digitsAfterDot = self->_digitsAfterDot;
        CGRect v18 = [NSNumber numberWithUnsignedInteger:v16];
        [(NSMutableArray *)digitsAfterDot addObject:v18];

        uint64_t v14 = 0;
      }
      else
      {
        ++v14;
      }
      double v12 = v15 - (double)v16;
      BOOL v26 = v13++ == v11;
    }
    while (!v26);
  }
  if ([(NSMutableArray *)self->_digitsAfterDot count] <= v11
    || ([(NSMutableArray *)self->_digitsAfterDot lastObject],
        v19 = objc_claimAutoreleasedReturnValue(),
        unint64_t v20 = [v19 integerValue],
        v19,
        [(NSMutableArray *)self->_digitsAfterDot removeLastObject],
        v20 < 5))
  {
LABEL_19:
    int v25 = 0;
  }
  else
  {
    while ([(NSMutableArray *)self->_digitsAfterDot count])
    {
      v21 = [(NSMutableArray *)self->_digitsAfterDot lastObject];
      unint64_t v22 = [v21 integerValue] + 1;

      [(NSMutableArray *)self->_digitsAfterDot removeLastObject];
      if (v22 <= 9)
      {
        v23 = self->_digitsAfterDot;
        v24 = [NSNumber numberWithUnsignedInteger:v22];
        [(NSMutableArray *)v23 addObject:v24];

        goto LABEL_19;
      }
    }
    int v25 = 1;
  }
  if ([(NSMutableArray *)self->_digitsBeforeDot count]) {
    BOOL v26 = v25 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  if (!v26)
  {
    unint64_t v27 = 1;
    do
    {
      uint64_t v28 = [(NSMutableArray *)self->_digitsBeforeDot objectAtIndex:v27 - 1];
      uint64_t v29 = [v28 integerValue];
      uint64_t v30 = v29 + 1;

      LOBYTE(v25) = v29 == 9;
      if (v29 == 9) {
        uint64_t v31 = 0;
      }
      else {
        uint64_t v31 = v29 + 1;
      }
      v32 = self->_digitsBeforeDot;
      v33 = [NSNumber numberWithUnsignedInteger:v31];
      [(NSMutableArray *)v32 replaceObjectAtIndex:v27 - 1 withObject:v33];
    }
    while (v27++ < [(NSMutableArray *)self->_digitsBeforeDot count] && v30 == 10);
  }
  if (v25) {
    [(NSMutableArray *)self->_digitsBeforeDot addObject:&unk_26C69C390];
  }
  self->_hasDot = [(NSMutableArray *)self->_digitsAfterDot count] != 0;

  [(PTUINumericKeypad *)self _updateDisplayedValue];
}

- (NSString)stringValue
{
  cachedStringValue = self->_cachedStringValue;
  if (!cachedStringValue)
  {
    unint64_t v4 = [MEMORY[0x263F089D8] string];
    double v5 = v4;
    if (self->_negative) {
      [v4 appendString:@"-"];
    }
    if ([(NSMutableArray *)self->_digitsBeforeDot count])
    {
      digitsBeforeDot = self->_digitsBeforeDot;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __32__PTUINumericKeypad_stringValue__block_invoke;
      v17[3] = &unk_26425EA20;
      id v18 = v5;
      [(NSMutableArray *)digitsBeforeDot enumerateObjectsWithOptions:2 usingBlock:v17];
    }
    else
    {
      [v5 appendString:@"0"];
    }
    if (self->_hasDot) {
      [v5 appendString:@"."];
    }
    digitsAfterDot = self->_digitsAfterDot;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __32__PTUINumericKeypad_stringValue__block_invoke_2;
    double v15 = &unk_26425EA20;
    id v16 = v5;
    id v8 = v5;
    [(NSMutableArray *)digitsAfterDot enumerateObjectsUsingBlock:&v12];
    unint64_t v9 = (NSString *)objc_msgSend(v8, "copy", v12, v13, v14, v15);
    double v10 = self->_cachedStringValue;
    self->_cachedStringValue = v9;

    cachedStringValue = self->_cachedStringValue;
  }

  return cachedStringValue;
}

uint64_t __32__PTUINumericKeypad_stringValue__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%d", objc_msgSend(a2, "intValue"));
}

uint64_t __32__PTUINumericKeypad_stringValue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%d", objc_msgSend(a2, "intValue"));
}

- (void)setStringValue:(id)a3
{
  [a3 doubleValue];

  -[PTUINumericKeypad setDoubleValue:](self, "setDoubleValue:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 210.0;
  double v4 = 310.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v42[2] = *MEMORY[0x263EF8340];
  [(PTUINumericKeypad *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  v43.origin.x = v4;
  v43.origin.double y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  CGRect v44 = CGRectInset(v43, 16.0, 16.0);
  double y = v44.origin.y;
  [(UILabel *)self->_valueLabel setFrame:v44.origin.x];
  backspaceButton = self->_backspaceButton;
  v42[0] = self->_clearButton;
  v42[1] = backspaceButton;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  [(PTUINumericKeypad *)self _layoutButtonRow:v13 atY:y + 46.0];
  double v15 = v14;

  id v16 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:7];
  v41[0] = v16;
  CGRect v17 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:8];
  v41[1] = v17;
  id v18 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:9];
  v41[2] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:3];
  [(PTUINumericKeypad *)self _layoutButtonRow:v19 atY:v15];
  double v21 = v20;

  unint64_t v22 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:4];
  v40[0] = v22;
  v23 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:5];
  v40[1] = v23;
  v24 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:6];
  v40[2] = v24;
  int v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:3];
  [(PTUINumericKeypad *)self _layoutButtonRow:v25 atY:v21];
  double v27 = v26;

  uint64_t v28 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:1];
  v39[0] = v28;
  uint64_t v29 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:2];
  v39[1] = v29;
  uint64_t v30 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:3];
  v39[2] = v30;
  uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
  [(PTUINumericKeypad *)self _layoutButtonRow:v31 atY:v27];
  double v33 = v32;

  v38[0] = self->_signButton;
  v34 = [(NSArray *)self->_digitButtons objectAtIndexedSubscript:0];
  dotButton = self->_dotButton;
  v38[1] = v34;
  v38[2] = dotButton;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];
  [(PTUINumericKeypad *)self _layoutButtonRow:v36 atY:v33];

  -[_KeypadDismissButton setFrame:](self->_dismissButton, "setFrame:", -20.0, -20.0, 40.0, 40.0);
  v37 = [(_KeypadDismissButton *)self->_dismissButton layer];
  [v37 setCornerRadius:20.0];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[_KeypadDismissButton convertPoint:fromView:](self->_dismissButton, "convertPoint:fromView:", self, x, y);
  if (-[_KeypadDismissButton pointInside:withEvent:](self->_dismissButton, "pointInside:withEvent:", v7))
  {
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PTUINumericKeypad;
    BOOL v8 = -[PTUINumericKeypad pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y);
  }

  return v8;
}

- (double)_layoutButtonRow:(id)a3 atY:(double)a4
{
  [(PTUINumericKeypad *)self _layoutButtonRow:a3 atY:0 stretch:a4];
  return result;
}

- (double)_layoutButtonRow:(id)a3 atY:(double)a4 stretch:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v8 = [v7 count];
  if (v8 != 3 && !v5)
  {
    if (v8 == 1)
    {
      uint64_t v12 = [v7 firstObject];
      uint64_t v13 = v12;
      double v14 = 78.0;
      double v15 = a4;
    }
    else
    {
      if (v8 != 2) {
        goto LABEL_15;
      }
      unint64_t v11 = [v7 firstObject];
      objc_msgSend(v11, "setFrame:", 16.0, a4, 54.0, 40.0);

      uint64_t v12 = [v7 lastObject];
      uint64_t v13 = v12;
      double v14 = 140.0;
      double v15 = a4;
    }
    objc_msgSend(v12, "setFrame:", v14, v15, 54.0, 40.0);

    goto LABEL_15;
  }
  double v10 = 54.0;
  if (v8 == 2) {
    double v10 = 85.0;
  }
  if (v8 == 1) {
    double v10 = 178.0;
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0x4030000000000000;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__PTUINumericKeypad__layoutButtonRow_atY_stretch___block_invoke;
  v17[3] = &unk_26425EA48;
  void v17[4] = v18;
  *(double *)&v17[5] = a4;
  *(double *)&v17[6] = v10;
  [v7 enumerateObjectsUsingBlock:v17];
  _Block_object_dispose(v18, 8);
LABEL_15:

  return a4 + 40.0 + 8.0;
}

CGFloat __50__PTUINumericKeypad__layoutButtonRow_atY_stretch___block_invoke(double *a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*((void *)a1 + 4) + 8) + 24);
  double v4 = a1[5];
  double v5 = a1[6];
  objc_msgSend(a2, "setFrame:", v3, v4, v5, 40.0);
  v7.origin.double x = v3;
  v7.origin.double y = v4;
  v7.size.width = v5;
  v7.size.height = 40.0;
  CGFloat result = CGRectGetMaxX(v7) + 8.0;
  *(CGFloat *)(*(void *)(*((void *)a1 + 4) + 8) + 24) = result;
  return result;
}

- (void)_updateDisplayedValue
{
  cachedNumberValue = self->_cachedNumberValue;
  self->_cachedNumberValue = 0;

  cachedStringValue = self->_cachedStringValue;
  self->_cachedStringValue = 0;

  valueLabel = self->_valueLabel;
  CGFloat v6 = [(PTUINumericKeypad *)self stringValue];
  [(UILabel *)valueLabel setText:v6];

  delegate = self->_delegate;

  [(PTUINumericKeypadDelegate *)delegate numericKeypadDidUpdateValue:self];
}

- (void)keyPress:(id)a3
{
  id v4 = a3;
  switch([v4 keyType])
  {
    case 0:
      -[PTUINumericKeypad _appendDigit:](self, "_appendDigit:", [v4 digit]);
      break;
    case 1:
      [(PTUINumericKeypad *)self _appendDot];
      break;
    case 2:
      [(PTUINumericKeypad *)self _changeSign];
      break;
    case 3:
      [(PTUINumericKeypad *)self _clear];
      break;
    case 4:
      [(PTUINumericKeypad *)self _backspace];
      break;
    default:
      break;
  }
}

- (void)_appendDigit:(unint64_t)a3
{
  if ([(PTUINumericKeypad *)self _remainingAllowedDigits])
  {
    if (self->_hasDot)
    {
      digitsAfterDot = self->_digitsAfterDot;
      CGFloat v6 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableArray *)digitsAfterDot addObject:v6];
    }
    else
    {
      if (!([(NSMutableArray *)self->_digitsBeforeDot count] | a3))
      {
LABEL_10:
        [(PTUINumericKeypad *)self _updateDisplayedValue];
        return;
      }
      digitsBeforeDot = self->_digitsBeforeDot;
      CGFloat v6 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableArray *)digitsBeforeDot insertObject:v6 atIndex:0];
    }

    goto LABEL_10;
  }

  [(PTUINumericKeypad *)self _flash];
}

- (unint64_t)_remainingAllowedDigits
{
  unint64_t v3 = [(NSMutableArray *)self->_digitsBeforeDot count];
  if (v3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  uint64_t v5 = [(NSMutableArray *)self->_digitsAfterDot count];
  if ((unint64_t)(v5 + v4) <= 0xB) {
    return 11 - (v5 + v4);
  }
  else {
    return 0;
  }
}

- (void)_appendDot
{
  if (self->_hasDot)
  {
    [(PTUINumericKeypad *)self _flash];
  }
  else
  {
    self->_hasDot = 1;
    [(PTUINumericKeypad *)self _updateDisplayedValue];
  }
}

- (void)_changeSign
{
  self->_negative ^= 1u;
  [(PTUINumericKeypad *)self _updateDisplayedValue];
}

- (void)_clear
{
  [(NSMutableArray *)self->_digitsAfterDot removeAllObjects];
  [(NSMutableArray *)self->_digitsBeforeDot removeAllObjects];
  self->_hasDot = 0;
  self->_negative = 0;

  [(PTUINumericKeypad *)self _updateDisplayedValue];
}

- (void)_backspace
{
  if ([(NSMutableArray *)self->_digitsAfterDot count])
  {
    [(NSMutableArray *)self->_digitsAfterDot removeLastObject];
LABEL_7:
    [(PTUINumericKeypad *)self _updateDisplayedValue];
    return;
  }
  uint64_t v3 = 505;
  if (self->_hasDot) {
    goto LABEL_4;
  }
  if ([(NSMutableArray *)self->_digitsBeforeDot count])
  {
    [(NSMutableArray *)self->_digitsBeforeDot removeObjectAtIndex:0];
    goto LABEL_7;
  }
  uint64_t v3 = 504;
  if (self->_negative)
  {
LABEL_4:
    *((unsigned char *)&self->super.super.super.isa + v3) = 0;
    goto LABEL_7;
  }

  [(PTUINumericKeypad *)self _flash];
}

- (void)_dismissButtonPress
{
  [(PTUINumericKeypadDelegate *)self->_delegate numericKeypadWillDismiss:self];

  [(PTUINumericKeypad *)self hideAnimated:1];
}

- (void)_flash
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__PTUINumericKeypad__flash__block_invoke;
  v3[3] = &unk_26425E9A8;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __27__PTUINumericKeypad__flash__block_invoke_2;
  v2[3] = &unk_26425E9F8;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:v2 completion:0.1];
}

uint64_t __27__PTUINumericKeypad__flash__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 480);
  if (_KeypadFlashColor_onceToken != -1) {
    dispatch_once(&_KeypadFlashColor_onceToken, &__block_literal_global_144);
  }
  uint64_t v2 = _KeypadFlashColor___color;

  return [v1 setBackgroundColor:v2];
}

uint64_t __27__PTUINumericKeypad__flash__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __27__PTUINumericKeypad__flash__block_invoke_3;
  v2[3] = &unk_26425E9A8;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.1];
}

void __27__PTUINumericKeypad__flash__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 480);
  id v2 = [MEMORY[0x263F1C550] whiteColor];
  [v1 setBackgroundColor:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStringValue, 0);
  objc_storeStrong((id *)&self->_cachedNumberValue, 0);
  objc_storeStrong((id *)&self->_digitsAfterDot, 0);
  objc_storeStrong((id *)&self->_digitsBeforeDot, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_backspaceButton, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_signButton, 0);
  objc_storeStrong((id *)&self->_dotButton, 0);
  objc_storeStrong((id *)&self->_digitButtons, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end