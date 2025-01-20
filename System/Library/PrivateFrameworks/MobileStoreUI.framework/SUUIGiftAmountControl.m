@interface SUUIGiftAmountControl
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (NSString)selectedAmountString;
- (SUUIGiftAmountControl)initWithGiftConfiguration:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)selectedAmount;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_layoutForPad;
- (void)_layoutForPhone;
- (void)_reloadSelectedButton;
- (void)_textFieldDidBeginEditing:(id)a3;
- (void)_textFieldDidChange:(id)a3;
- (void)_textFieldDidEndEditing:(id)a3;
- (void)_updateButtonsWithTouch:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SUUIGiftAmountControl

- (SUUIGiftAmountControl)initWithGiftConfiguration:(id)a3
{
  id v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SUUIGiftAmountControl;
  v6 = [(SUUIGiftAmountControl *)&v51 init];
  v7 = v6;
  if (v6)
  {
    p_giftConfiguration = (id *)&v6->_giftConfiguration;
    objc_storeStrong((id *)&v6->_giftConfiguration, a3);
    v9 = [*p_giftConfiguration fixedGiftAmountLabels];
    v10 = [*p_giftConfiguration fixedGiftAmountValues];
    uint64_t v11 = [v9 count];
    v12 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    amountButtons = v7->_amountButtons;
    v7->_amountButtons = v14;

    if (v11 >= 1)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 3;
      if (v13) {
        uint64_t v17 = 4;
      }
      if (v17 >= v11) {
        uint64_t v18 = v11;
      }
      else {
        uint64_t v18 = v17;
      }
      do
      {
        v19 = objc_alloc_init(SUUIGiftAmountButton);
        v20 = [v10 objectAtIndex:v16];
        -[SUUIGiftAmountButton setTag:](v19, "setTag:", [v20 integerValue]);

        v21 = [v9 objectAtIndex:v16];
        [(SUUIGiftAmountButton *)v19 setTitle:v21 forState:0];

        [(SUUIGiftAmountButton *)v19 sizeToFit];
        [(SUUIGiftAmountControl *)v7 addSubview:v19];
        [(NSMutableArray *)v7->_amountButtons addObject:v19];

        ++v16;
      }
      while (v18 != v16);
    }
    id v22 = objc_alloc(MEMORY[0x263F82E00]);
    v23 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v24 = [v23 userInterfaceIdiom];

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v25 = 110.0;
    }
    else {
      double v25 = 72.0;
    }
    uint64_t v26 = objc_msgSend(v22, "initWithFrame:", 0.0, 0.0, v25, 44.0);
    customAmountBackgroundView = v7->_customAmountBackgroundView;
    v7->_customAmountBackgroundView = (UIView *)v26;

    v28 = v7->_customAmountBackgroundView;
    v29 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UIView *)v28 setBackgroundColor:v29];

    v30 = [(UIView *)v7->_customAmountBackgroundView layer];
    id v31 = [MEMORY[0x263F825C8] separatorColor];
    objc_msgSend(v30, "setBorderColor:", objc_msgSend(v31, "CGColor"));

    v32 = [MEMORY[0x263F82B60] mainScreen];
    [v32 scale];
    [v30 setBorderWidth:1.0 / v33];

    [v30 setCornerRadius:7.0];
    [(SUUIGiftAmountControl *)v7 addSubview:v7->_customAmountBackgroundView];
    v34 = (UITextField *)objc_alloc_init(MEMORY[0x263F82CF0]);
    customAmountField = v7->_customAmountField;
    v7->_customAmountField = v34;

    [(UITextField *)v7->_customAmountField setContentHorizontalAlignment:0];
    [(UITextField *)v7->_customAmountField setTextAlignment:1];
    v36 = v7->_customAmountField;
    v37 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [(UITextField *)v36 setFont:v37];

    [(UITextField *)v7->_customAmountField setDelegate:v7];
    [(UITextField *)v7->_customAmountField setKeyboardType:4];
    v38 = v7->_customAmountField;
    v39 = [MEMORY[0x263F825C8] labelColor];
    [(UITextField *)v38 setTextColor:v39];

    v40 = [*p_giftConfiguration clientContext];
    id v41 = objc_alloc(MEMORY[0x263F089B8]);
    if (v40) {
      [v40 localizedStringForKey:@"GIFTING_AMOUNT_OTHER" inTable:@"Gifting"];
    }
    else {
    v42 = +[SUUIClientContext localizedStringForKey:@"GIFTING_AMOUNT_OTHER" inBundles:0 inTable:@"Gifting"];
    }
    v43 = (void *)[v41 initWithString:v42];

    uint64_t v44 = [v43 length];
    uint64_t v45 = *MEMORY[0x263F814F0];
    v46 = [(UITextField *)v7->_customAmountField font];
    objc_msgSend(v43, "addAttribute:value:range:", v45, v46, 0, v44);

    uint64_t v47 = *MEMORY[0x263F81500];
    v48 = [MEMORY[0x263F825C8] placeholderTextColor];
    objc_msgSend(v43, "addAttribute:value:range:", v47, v48, 0, v44);

    [(UITextField *)v7->_customAmountField setAttributedPlaceholder:v43];
    [(UITextField *)v7->_customAmountField sizeToFit];
    [(SUUIGiftAmountControl *)v7 addSubview:v7->_customAmountField];
    v49 = [MEMORY[0x263F08A00] defaultCenter];
    [v49 addObserver:v7 selector:sel__textFieldDidBeginEditing_ name:*MEMORY[0x263F83AC0] object:v7->_customAmountField];
    [v49 addObserver:v7 selector:sel__textFieldDidChange_ name:*MEMORY[0x263F83AC8] object:v7->_customAmountField];
    [v49 addObserver:v7 selector:sel__textFieldDidEndEditing_ name:*MEMORY[0x263F83AD0] object:v7->_customAmountField];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83AC0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83AC8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83AD0] object:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_amountButtons;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) removeTarget:self action:0 forControlEvents:4095];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(UITextField *)self->_customAmountField setDelegate:0];
  v9.receiver = self;
  v9.super_class = (Class)SUUIGiftAmountControl;
  [(SUUIGiftAmountControl *)&v9 dealloc];
}

- (int64_t)selectedAmount
{
  if (self->_selectedAmount > 0) {
    return self->_selectedAmount;
  }
  v3 = [(UITextField *)self->_customAmountField text];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (NSString)selectedAmountString
{
  if (self->_selectedAmount)
  {
    v2 = -[SUUIGiftAmountControl viewWithTag:](self, "viewWithTag:");
    v3 = [v2 currentTitle];
  }
  else
  {
    v3 = [(UITextField *)self->_customAmountField text];
  }
  return (NSString *)v3;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUUIGiftAmountControl *)self firstResponder];
  [v6 resignFirstResponder];

  [(SUUIGiftAmountControl *)self _updateButtonsWithTouch:v5];
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[SUUIGiftAmountControl _updateButtonsWithTouch:](self, "_updateButtonsWithTouch:", a3, a4);
  self->_selectedAmount = self->_trackingAmount;
  [(SUUIGiftAmountControl *)self _reloadSelectedButton];
  if (self->_selectedAmount)
  {
    [(UITextField *)self->_customAmountField _setPrefix:0];
    [(UITextField *)self->_customAmountField _setSuffix:0 withColor:0];
    [(UITextField *)self->_customAmountField setText:0];
    id v5 = [(UIView *)self->_customAmountBackgroundView layer];
    id v6 = [MEMORY[0x263F825C8] separatorColor];
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));
  }
  [(SUUIGiftAmountControl *)self sendActionsForControlEvents:4096];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = self;
  v10.receiver = self;
  v10.super_class = (Class)SUUIGiftAmountControl;
  -[SUUIGiftAmountControl hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  uint64_t v7 = (SUUIGiftAmountControl *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ([(NSMutableArray *)v6->_amountButtons indexOfObjectIdenticalTo:v7] != 0x7FFFFFFFFFFFFFFFLL)
    {
      customAmountField = v6;
      id v6 = v7;
      goto LABEL_7;
    }
    if (v7 != v6) {
      goto LABEL_8;
    }
    [(UIView *)v6->_customAmountBackgroundView frame];
    v12.CGFloat x = x;
    v12.CGFloat y = y;
    if (CGRectContainsPoint(v13, v12))
    {
      customAmountField = v6->_customAmountField;
LABEL_7:
      uint64_t v7 = customAmountField;

      goto LABEL_8;
    }
    uint64_t v7 = v6;
  }
LABEL_8:
  return v7;
}

- (void)layoutSubviews
{
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(SUUIGiftAmountControl *)self _layoutForPad];
  }
  else
  {
    [(SUUIGiftAmountControl *)self _layoutForPhone];
  }
}

- (void)_layoutForPad
{
  [(SUUIGiftAmountControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(SUUIGiftAmountControl *)self effectiveUserInterfaceLayoutDirection];
  [(UIView *)self->_customAmountBackgroundView frame];
  double v13 = v12;
  double v15 = v14;
  v34.origin.CGFloat x = v4;
  v34.origin.CGFloat y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  double v16 = CGRectGetMaxX(v34) + -15.0 - v13;
  float v17 = (v10 - v15) * 0.5;
  double v18 = floorf(v17);
  customAmountBackgroundView = self->_customAmountBackgroundView;
  if (v11)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v16, v18, v13, v15, v4, v6, v8, v10);
  }
  else
  {
    double v20 = v16;
    double v21 = v18;
    double v22 = v13;
    double v23 = v15;
  }
  -[UIView setFrame:](customAmountBackgroundView, "setFrame:", v20, v21, v22, v23);
  [(UITextField *)self->_customAmountField frame];
  float v25 = (v15 - v24) * 0.5;
  double v26 = v18 + floorf(v25);
  customAmountField = self->_customAmountField;
  if (v11) {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v16 + 5.0, v26, v13 + -10.0);
  }
  -[UITextField setFrame:](customAmountField, "setFrame:");
  uint64_t v28 = [(NSMutableArray *)self->_amountButtons count];
  if (v28 >= 1)
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0x402E000000000000;
    amountButtons = self->_amountButtons;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    float v30 = (v16 + -8.0 + -15.0 + (float)((float)(v28 - 1) * -8.0)) / (double)v28;
    v31[2] = __38__SUUIGiftAmountControl__layoutForPad__block_invoke;
    v31[3] = &unk_265406BF8;
    v31[4] = v33;
    *(double *)&v31[5] = v4;
    *(double *)&v31[6] = v6;
    *(double *)&v31[7] = v8;
    *(double *)&v31[8] = v10;
    v31[9] = v28;
    *(double *)&v31[10] = v16 + -8.0;
    *(double *)&v31[11] = floorf(v30);
    BOOL v32 = v11 == 0;
    [(NSMutableArray *)amountButtons enumerateObjectsUsingBlock:v31];
    _Block_object_dispose(v33, 8);
  }
}

void __38__SUUIGiftAmountControl__layoutForPad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  [v15 frame];
  CGFloat v6 = v5;
  double v7 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  float v8 = (*(double *)(a1 + 64) - v5) * 0.5;
  float v9 = floorf(v8);
  if (*(void *)(a1 + 72) - 1 == a3) {
    double v10 = *(double *)(a1 + 80) - v7;
  }
  else {
    double v10 = *(double *)(a1 + 88);
  }
  double v11 = v9;
  if (*(unsigned char *)(a1 + 96))
  {
    double v12 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    double v13 = v11;
    CGFloat v14 = v10;
  }
  else
  {
    CGFloat v14 = v10;
    +[SUUICGRectHelpers rect:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) withFlippedOriginXRelativeTo:v11];
  }
  objc_msgSend(v15, "setFrame:", v12, v13);
  v17.origin.CGFloat x = v7;
  v17.origin.CGFloat y = v11;
  v17.size.width = v14;
  v17.size.height = v6;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGRectGetMaxX(v17) + 8.0;
}

- (void)_layoutForPhone
{
  [(SUUIGiftAmountControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(SUUIGiftAmountControl *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v12 = [(NSMutableArray *)self->_amountButtons count];
  if (v12 >= 1)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0x402E000000000000;
    amountButtons = self->_amountButtons;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    float v14 = (v8 + -15.0 + -15.0 + (float)((float)(v12 - 1) * -8.0)) / (double)v12;
    v34[2] = __40__SUUIGiftAmountControl__layoutForPhone__block_invoke;
    v34[3] = &unk_265406BF8;
    v34[4] = v36;
    v34[5] = v12;
    *(double *)&v34[6] = v8 + -15.0;
    *(double *)&v34[7] = floorf(v14);
    BOOL v35 = v11 == 0;
    *(double *)&v34[8] = v4;
    *(double *)&v34[9] = v6;
    *(double *)&v34[10] = v8;
    *(double *)&v34[11] = v10;
    [(NSMutableArray *)amountButtons enumerateObjectsUsingBlock:v34];
    _Block_object_dispose(v36, 8);
  }
  [(UIView *)self->_customAmountBackgroundView frame];
  v37.origin.CGFloat x = v4;
  v37.origin.CGFloat y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  double v15 = CGRectGetMaxX(v37) + -15.0 - (v8 + -30.0);
  float v16 = (v10 + -44.0) * 0.5;
  double v17 = floorf(v16);
  customAmountBackgroundView = self->_customAmountBackgroundView;
  if (v11) {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v15, v17, v8 + -30.0, 44.0, v4, v6, v8, v10);
  }
  -[UIView setFrame:](customAmountBackgroundView, "setFrame:");
  [(UITextField *)self->_customAmountField frame];
  double v20 = v19;
  [(UIView *)self->_customAmountBackgroundView origin];
  double v22 = v21 + 5.0;
  [(UIView *)self->_customAmountBackgroundView origin];
  double v24 = v23;
  [(UIView *)self->_customAmountBackgroundView size];
  float v26 = (v25 - v20) * 0.5;
  double v27 = v24 + floorf(v26);
  [(UIView *)self->_customAmountBackgroundView size];
  double v29 = v28 + -10.0;
  customAmountField = self->_customAmountField;
  if (v11)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v22, v27, v29, v20, v4, v6, v8, v10);
    double v22 = v31;
    double v27 = v32;
    double v20 = v33;
  }
  -[UITextField setFrame:](customAmountField, "setFrame:", v22, v27, v29, v20);
}

void __40__SUUIGiftAmountControl__layoutForPhone__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  [v12 frame];
  CGFloat v6 = v5;
  double v7 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (*(void *)(a1 + 40) - 1 == a3) {
    double v8 = *(double *)(a1 + 48) - v7;
  }
  else {
    double v8 = *(double *)(a1 + 56);
  }
  if (*(unsigned char *)(a1 + 96))
  {
    double v9 = 0.0;
    double v10 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    CGFloat v11 = v8;
  }
  else
  {
    CGFloat v11 = v8;
    +[SUUICGRectHelpers rect:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) withFlippedOriginXRelativeTo:0.0];
  }
  objc_msgSend(v12, "setFrame:", v10, v9);
  v14.origin.CGFloat x = v7;
  v14.origin.CGFloat y = 0.0;
  v14.size.width = v11;
  v14.size.height = v6;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGRectGetMaxX(v14) + 8.0;
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = self->_amountButtons;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setBackgroundColor:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUUIGiftAmountControl;
  [(SUUIGiftAmountControl *)&v10 setBackgroundColor:v4];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  long long v11 = [v9 text];
  long long v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);

  if ([v12 length])
  {
    id v13 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v13 setMaximumFractionDigits:0];
    [v13 setNumberStyle:1];
    long long v14 = [v13 numberFromString:v12];
    BOOL v15 = v14 != 0;
    if (v14)
    {
      int64_t v16 = [(SUUIGiftConfiguration *)self->_giftConfiguration currencySymbolPosition];
      if (v16 == 1)
      {
        [v9 _setPrefix:0];
        double v18 = [(SUUIGiftConfiguration *)self->_giftConfiguration currencySymbol];
        double v19 = [v9 textColor];
        [v9 _setSuffix:v18 withColor:v19];
      }
      else if (!v16)
      {
        double v17 = [(SUUIGiftConfiguration *)self->_giftConfiguration currencySymbol];
        [v9 _setPrefix:v17];

        [v9 _setSuffix:0 withColor:0];
      }
    }
  }
  else
  {
    [v9 _setPrefix:0];
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  self->_selectedAmount = 0;
  [(SUUIGiftAmountControl *)self _reloadSelectedButton];
  return 1;
}

- (void)_textFieldDidBeginEditing:(id)a3
{
  id v4 = [(SUUIGiftAmountControl *)self tintColor];
  double v5 = [v4 colorWithAlphaComponent:0.3];

  uint64_t v6 = [(UIView *)self->_customAmountBackgroundView layer];
  id v7 = v5;
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));
}

- (void)_textFieldDidChange:(id)a3
{
}

- (void)_textFieldDidEndEditing:(id)a3
{
  id v4 = [(UITextField *)self->_customAmountField text];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    id v7 = [(UIView *)self->_customAmountBackgroundView layer];
    id v6 = [MEMORY[0x263F825C8] separatorColor];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v6, "CGColor"));
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIGiftAmountControl;
  [(SUUIGiftAmountControl *)&v8 _dynamicUserInterfaceTraitDidChange];
  double v3 = [MEMORY[0x263F825C8] separatorColor];
  if ([(UITextField *)self->_customAmountField isFirstResponder])
  {
    id v4 = [(SUUIGiftAmountControl *)self tintColor];
    uint64_t v5 = [v4 colorWithAlphaComponent:0.3];

    double v3 = (void *)v5;
  }
  id v6 = [(UIView *)self->_customAmountBackgroundView layer];
  id v7 = v3;
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));
}

- (void)_reloadSelectedButton
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_amountButtons;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "setSelected:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "tag", (void)v8) == self->_selectedAmount);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateButtonsWithTouch:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [a3 locationInView:self];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  self->_trackingAmount = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v8 = self->_amountButtons;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "frame", (void)v15);
        v21.CGFloat x = v5;
        v21.CGFloat y = v7;
        BOOL v14 = CGRectContainsPoint(v22, v21);
        if (v14) {
          self->_trackingAmount = [v13 tag];
        }
        [v13 setSelected:v14];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_storeStrong((id *)&self->_customAmountField, 0);
  objc_storeStrong((id *)&self->_customAmountBackgroundView, 0);
  objc_storeStrong((id *)&self->_amountButtons, 0);
}

@end