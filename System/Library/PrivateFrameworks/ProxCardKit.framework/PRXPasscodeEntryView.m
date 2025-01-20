@interface PRXPasscodeEntryView
+ (CGSize)preferredSizeForNumberOfDigits:(int64_t)a3;
+ (CGSize)wellSizeForNumberOfDigits:(int64_t)a3;
+ (double)interWellSpacingForNumberOfDigits:(int64_t)a3;
+ (double)wellCornerRadiusForNumberOfDigits:(int64_t)a3;
+ (id)fontForNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4;
- (BOOL)becomeFirstResponder;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)hasText;
- (BOOL)resignFirstResponder;
- (BOOL)useMonospacedFont;
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (PRXPasscodeEntryView)initWithFrame:(CGRect)a3;
- (PRXPasscodeEntryView)initWithNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4 delegate:(id)a5;
- (PRXPasscodeEntryViewDelegate)delegate;
- (int64_t)autocapitalizationType;
- (int64_t)keyboardType;
- (int64_t)numberOfDigits;
- (int64_t)spellCheckingType;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateWells;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setText:(id)a3;
- (void)tintColorDidChange;
@end

@implementation PRXPasscodeEntryView

- (PRXPasscodeEntryView)initWithNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4 delegate:(id)a5
{
  id v8 = a5;
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v43 = (void *)MEMORY[0x263EFF940];
    uint64_t v44 = *MEMORY[0x263EFF4A0];
    v45 = [NSString stringWithFormat:@"PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively.", 4, 8];
    id v46 = [v43 exceptionWithName:v44 reason:v45 userInfo:0];

    objc_exception_throw(v46);
  }
  v9 = v8;
  [(id)objc_opt_class() preferredSizeForNumberOfDigits:a3];
  v48.receiver = self;
  v48.super_class = (Class)PRXPasscodeEntryView;
  v10 = -[PRXPasscodeEntryView initWithFrame:](&v48, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v11 = v10;
  if (v10)
  {
    v47 = v9;
    objc_storeWeak((id *)&v10->_delegate, v9);
    v11->_keyboardType = 11;
    v11->_numberOfDigits = a3;
    v11->_useMonospacedFont = a4;
    uint64_t v12 = [MEMORY[0x263F089D8] string];
    text = v11->_text;
    v11->_text = (NSMutableString *)v12;

    v14 = [(id)objc_opt_class() fontForNumberOfDigits:a3 useMonospacedFont:v11->_useMonospacedFont];
    [(id)objc_opt_class() interWellSpacingForNumberOfDigits:a3];
    double v16 = v15;
    [(id)objc_opt_class() wellCornerRadiusForNumberOfDigits:a3];
    double v18 = v17;
    v19 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    v20 = [MEMORY[0x263EFF980] array];
    while ([(NSArray *)v19 count] < a3)
    {
      v21 = objc_alloc_init(PRXPasscodeWell);
      [(PRXPasscodeWell *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
      v22 = [(PRXPasscodeWell *)v21 label];
      [v22 setFont:v14];

      [(PRXPasscodeWell *)v21 _setContinuousCornerRadius:v18];
      [(PRXPasscodeEntryView *)v11 addSubview:v21];
      v23 = [(NSArray *)v19 lastObject];
      [(NSArray *)v19 addObject:v21];
      if (v23)
      {
        v24 = [(PRXPasscodeWell *)v21 widthAnchor];
        v25 = [v23 widthAnchor];
        v26 = [v24 constraintEqualToAnchor:v25];
        [v20 addObject:v26];

        v27 = [(PRXPasscodeWell *)v21 leftAnchor];
        v28 = [v23 rightAnchor];
        [v27 constraintEqualToAnchor:v28 constant:v16];
      }
      else
      {
        v27 = [(PRXPasscodeWell *)v21 leftAnchor];
        v28 = [(PRXPasscodeEntryView *)v11 leftAnchor];
        [v27 constraintEqualToAnchor:v28];
      v29 = };
      [v20 addObject:v29];

      v30 = [(PRXPasscodeWell *)v21 topAnchor];
      v31 = [(PRXPasscodeEntryView *)v11 topAnchor];
      v32 = [v30 constraintEqualToAnchor:v31];
      [v20 addObject:v32];

      v33 = [(PRXPasscodeWell *)v21 bottomAnchor];
      v34 = [(PRXPasscodeEntryView *)v11 bottomAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      [v20 addObject:v35];
    }
    v36 = [(NSArray *)v19 lastObject];
    v37 = [v36 rightAnchor];
    v38 = [(PRXPasscodeEntryView *)v11 rightAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    [v20 addObject:v39];

    [MEMORY[0x263F08938] activateConstraints:v20];
    wells = v11->_wells;
    v11->_wells = v19;

    [(PRXPasscodeEntryView *)v11 _updateWells];
    v41 = v11;

    v9 = v47;
  }

  return v11;
}

- (PRXPasscodeEntryView)initWithFrame:(CGRect)a3
{
  return -[PRXPasscodeEntryView initWithNumberOfDigits:useMonospacedFont:delegate:](self, "initWithNumberOfDigits:useMonospacedFont:delegate:", 4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PRXPasscodeEntryView;
  [(PRXPasscodeEntryView *)&v3 tintColorDidChange];
  [(PRXPasscodeEntryView *)self _updateWells];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PRXPasscodeEntryView;
  [(PRXPasscodeEntryView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PRXPasscodeEntryView *)self _updateWells];
}

- (NSString)text
{
  v2 = (void *)[(NSMutableString *)self->_text copy];
  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  id v13 = a3;
  if ((-[NSMutableString isEqualToString:](self->_text, "isEqualToString:") & 1) == 0)
  {
    unint64_t v4 = [v13 length];
    unint64_t numberOfDigits = self->_numberOfDigits;
    if (v4 > numberOfDigits)
    {
      v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      objc_msgSend(NSString, "stringWithFormat:", @"'%@' is too long for %@; _numberOfDigits=%ld",
        v13,
        self,
      v11 = numberOfDigits);
      id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

      objc_exception_throw(v12);
    }
    v6 = [v13 uppercaseString];
    v7 = (NSMutableString *)[v6 mutableCopy];
    text = self->_text;
    self->_text = v7;

    [(PRXPasscodeEntryView *)self _updateWells];
  }
}

- (void)_updateWells
{
  uint64_t v3 = [(NSMutableString *)self->_text length];
  unint64_t v4 = [(PRXPasscodeEntryView *)self traitCollection];
  [v4 displayScale];
  double v6 = 1.0 / v5;

  wells = self->_wells;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__PRXPasscodeEntryView__updateWells__block_invoke;
  v8[3] = &unk_2644182A8;
  v8[4] = self;
  v8[5] = v3;
  *(double *)&v8[6] = v6;
  [(NSArray *)wells enumerateObjectsUsingBlock:v8];
}

void __36__PRXPasscodeEntryView__updateWells__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v17 = a2;
  if (*(void *)(a1 + 40) == a3 && [*(id *)(a1 + 32) isFirstResponder])
  {
    id v5 = [*(id *)(a1 + 32) tintColor];
    uint64_t v6 = [v5 CGColor];
    v7 = [v17 layer];
    [v7 setBorderColor:v6];

    id v8 = [v17 layer];
    v9 = v8;
    double v10 = 2.0;
  }
  else
  {
    id v11 = [MEMORY[0x263F1C550] systemGray4Color];
    uint64_t v12 = [v11 CGColor];
    id v13 = [v17 layer];
    [v13 setBorderColor:v12];

    double v14 = 1.0;
    if (*(uint64_t *)(*(void *)(a1 + 32) + 480) <= 6) {
      double v14 = *(double *)(a1 + 48) + 1.0;
    }
    id v8 = [v17 layer];
    v9 = v8;
    double v10 = v14;
  }
  [v8 setBorderWidth:v10];

  if (*(void *)(a1 + 40) <= a3)
  {
    double v15 = [v17 label];
    [v15 setText:&stru_26CCF1BC8];
  }
  else
  {
    double v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "substringWithRange:", a3, 1);
    double v16 = [v17 label];
    [v16 setText:v15];
  }
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = objc_opt_class();
  int64_t numberOfDigits = self->_numberOfDigits;
  [v3 preferredSizeForNumberOfDigits:numberOfDigits];
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)wellSizeForNumberOfDigits:(int64_t)a3
{
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    uint64_t v17 = v4;
    uint64_t v18 = v3;
    id v13 = (void *)MEMORY[0x263EFF940];
    uint64_t v14 = *MEMORY[0x263EFF4A0];
    double v15 = [NSString stringWithFormat:@"PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively.", 4, 8, v6, v5, v17, v18, v7, v8];
    id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
  double v9 = (double)(a3 - 4);
  float v10 = v9 * -4.5 + 50.0;
  double v11 = roundf(v10);
  *(float *)&double v9 = v9 * -7.0 + 76.0;
  double v12 = roundf(*(float *)&v9);
  result.height = v12;
  result.width = v11;
  return result;
}

+ (double)interWellSpacingForNumberOfDigits:(int64_t)a3
{
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    uint64_t v15 = v4;
    uint64_t v16 = v3;
    double v11 = (void *)MEMORY[0x263EFF940];
    uint64_t v12 = *MEMORY[0x263EFF4A0];
    id v13 = [NSString stringWithFormat:@"PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively.", 4, 8, v6, v5, v15, v16, v7, v8];
    id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  float v9 = (double)(a3 - 4) * -0.5 + 8.0;
  return roundf(v9);
}

+ (double)wellCornerRadiusForNumberOfDigits:(int64_t)a3
{
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    uint64_t v14 = v4;
    uint64_t v15 = v3;
    float v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = *MEMORY[0x263EFF4A0];
    uint64_t v12 = [NSString stringWithFormat:@"PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively.", 4, 8, v6, v5, v14, v15, v7, v8];
    id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  return 8.0;
}

+ (CGSize)preferredSizeForNumberOfDigits:(int64_t)a3
{
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    uint64_t v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF4A0];
    uint64_t v14 = [NSString stringWithFormat:@"PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively.", 4, 8];
    id v15 = [v12 exceptionWithName:v13 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  objc_msgSend(a1, "wellSizeForNumberOfDigits:");
  double v6 = v5;
  double v8 = v7;
  [a1 interWellSpacingForNumberOfDigits:a3];
  double v10 = v9 * (double)(a3 - 1) + v6 * (double)a3;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)fontForNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4
{
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    double v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    double v10 = [NSString stringWithFormat:@"PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively.", a4, 4, 8];
    id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  float v4 = 28.0 - (double)(a3 - 4);
  double v5 = roundf(v4);
  if (a4) {
    [MEMORY[0x263F1C658] monospacedSystemFontOfSize:v5 weight:*MEMORY[0x263F1D340]];
  }
  else {
  double v6 = [MEMORY[0x263F1C658] systemFontOfSize:v5 weight:*MEMORY[0x263F1D330]];
  }
  return v6;
}

- (BOOL)becomeFirstResponder
{
  v7.receiver = self;
  v7.super_class = (Class)PRXPasscodeEntryView;
  BOOL v3 = [(PRXPasscodeEntryView *)&v7 becomeFirstResponder];
  if (v3)
  {
    [(PRXPasscodeEntryView *)self _updateWells];
    float v4 = [(PRXPasscodeEntryView *)self delegate];

    if (v4)
    {
      double v5 = [(PRXPasscodeEntryView *)self delegate];
      [v5 passcodeEntryViewDidBecomeFirstResponder:self];
    }
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PRXPasscodeEntryView;
  BOOL v3 = [(PRXPasscodeEntryView *)&v5 resignFirstResponder];
  if (v3) {
    [(PRXPasscodeEntryView *)self _updateWells];
  }
  return v3;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PRXPasscodeEntryView;
  BOOL v5 = [(PRXPasscodeEntryView *)&v7 beginTrackingWithTouch:a3 withEvent:a4];
  if (v5) {
    [(PRXPasscodeEntryView *)self becomeFirstResponder];
  }
  return v5;
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_text length] != 0;
}

- (void)insertText:(id)a3
{
  id v6 = a3;
  if ((unint64_t)[(NSMutableString *)self->_text length] < self->_numberOfDigits)
  {
    text = self->_text;
    BOOL v5 = [v6 uppercaseString];
    [(NSMutableString *)text appendString:v5];

    [(PRXPasscodeEntryView *)self _updateWells];
    [(PRXPasscodeEntryView *)self sendActionsForControlEvents:4096];
  }
}

- (void)deleteBackward
{
  if ([(NSMutableString *)self->_text length])
  {
    -[NSMutableString replaceCharactersInRange:withString:](self->_text, "replaceCharactersInRange:withString:", [(NSMutableString *)self->_text length] - 1, 1, &stru_26CCF1BC8);
    [(PRXPasscodeEntryView *)self _updateWells];
    [(PRXPasscodeEntryView *)self sendActionsForControlEvents:4096];
  }
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (int64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (BOOL)useMonospacedFont
{
  return self->_useMonospacedFont;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (PRXPasscodeEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRXPasscodeEntryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wells, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end