@interface SUUISignInView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_borderPathWithSize:(CGSize)a3;
+ (id)_fontDescriptorWithViewElement:(id)a3 defaultTextStyle:(id)a4 bold:(BOOL)a5;
+ (id)_labelWithViewElement:(id)a3;
+ (id)_textFieldWithViewElement:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUISignInView)initWithFrame:(CGRect)a3;
- (SUUISignInViewDelegate)delegate;
- (double)_layoutLabels;
- (id)_accountNameText;
- (id)_applePasswordText;
- (id)viewForElementIdentifier:(id)a3;
- (void)_clearFieldsAndLabels;
- (void)_layoutTextFieldsOffsetX:(double)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SUUISignInView

- (SUUISignInView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SUUISignInView;
  v3 = -[SUUISignInView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    borderColor = v3->_borderColor;
    v3->_borderColor = (UIColor *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    labels = v3->_labels;
    v3->_labels = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    textFields = v3->_textFields;
    v3->_textFields = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewFontDescriptors = v3->_viewFontDescriptors;
    v3->_viewFontDescriptors = (NSMapTable *)v10;
  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  v7 = objc_msgSend(a4, "firstChildForElementType:", 138, a5);
  if (v7)
  {
    v8 = [a1 _fontDescriptorWithViewElement:v7 defaultTextStyle:*MEMORY[0x263F83588] bold:1];
    v9 = [MEMORY[0x263F81708] fontWithDescriptor:v8 size:0.0];
    [v9 _scaledValueForValue:50.0];
    double v11 = v10 + v10;
  }
  else
  {
    a3 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v12 = a3;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  v6 = (SUUIViewElement *)a3;
  [(SUUISignInView *)self _clearFieldsAndLabels];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__SUUISignInView_reloadWithViewElement_width_context___block_invoke;
  v17[3] = &unk_2654008B8;
  v17[4] = self;
  [(SUUIViewElement *)v6 enumerateChildrenUsingBlock:v17];
  v7 = [(SUUIViewElement *)v6 style];
  v8 = [v7 ikBackgroundColor];
  v9 = [v8 color];

  if (!v9)
  {
    v9 = [MEMORY[0x263F825C8] whiteColor];
  }
  [(SUUISignInView *)self setBackgroundColor:v9];
  double v10 = [v7 ikBorderColor];
  double v11 = [v10 color];
  borderColor = self->_borderColor;
  self->_borderColor = v11;

  if (!self->_borderColor)
  {
    double v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    v14 = self->_borderColor;
    self->_borderColor = v13;
  }
  viewElement = self->_viewElement;
  self->_viewElement = v6;
  v16 = v6;

  [(SUUISignInView *)self setNeedsLayout];
}

void __54__SUUISignInView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 elementType];
  if (v3 == 140)
  {
    if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 432) count] > 1) {
      goto LABEL_8;
    }
    id v4 = v11;
    double v5 = [(id)objc_opt_class() _textFieldWithViewElement:v4];
    [v5 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) addSubview:v5];
    [*(id *)(*(void *)(a1 + 32) + 432) addObject:v5];
    v6 = objc_opt_class();
    uint64_t v7 = *MEMORY[0x263F83588];
    id v8 = v4;
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  if (v3 == 138 && (unint64_t)[*(id *)(*(void *)(a1 + 32) + 424) count] <= 1)
  {
    id v4 = v11;
    double v5 = [(id)objc_opt_class() _labelWithViewElement:v4];
    [*(id *)(a1 + 32) addSubview:v5];
    [*(id *)(*(void *)(a1 + 32) + 424) addObject:v5];
    v6 = objc_opt_class();
    uint64_t v7 = *MEMORY[0x263F83588];
    id v8 = v4;
    uint64_t v9 = 1;
LABEL_7:
    double v10 = [v6 _fontDescriptorWithViewElement:v8 defaultTextStyle:v7 bold:v9];

    [*(id *)(*(void *)(a1 + 32) + 448) setObject:v10 forKey:v5];
  }
LABEL_8:
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  v3.receiver = self;
  v3.super_class = (Class)SUUISignInView;
  return [(SUUISignInView *)&v3 becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v3 = self->_textFields;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isFirstResponder])
        {
          char v9 = [v8 resignFirstResponder];

          return v9;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)SUUISignInView;
  return [(SUUISignInView *)&v11 resignFirstResponder];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SUUISignInView;
  [(SUUISignInView *)&v18 layoutSubviews];
  if (!self->_borderView)
  {
    objc_super v3 = [SUUIShapeView alloc];
    uint64_t v4 = -[SUUIShapeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    borderView = self->_borderView;
    self->_borderView = v4;

    [(SUUIShapeView *)self->_borderView setUserInteractionEnabled:0];
    [(SUUISignInView *)self addSubview:self->_borderView];
  }
  [(SUUISignInView *)self _layoutLabels];
  [(SUUISignInView *)self _layoutTextFieldsOffsetX:"_layoutTextFieldsOffsetX:"];
  uint64_t v6 = [(SUUIShapeView *)self->_borderView layer];
  objc_msgSend(v6, "setStrokeColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));
  id v7 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

  id v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  double v10 = 1.0 / v9;

  [v6 setLineWidth:v10];
  [(SUUISignInView *)self bounds];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double v15 = CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v20);
  -[SUUIShapeView setFrame:](self->_borderView, "setFrame:", 0.0, 0.0, v15, v16);
  objc_msgSend((id)objc_opt_class(), "_borderPathWithSize:", v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", objc_msgSend(v17, "CGPath"));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = [(NSMutableArray *)self->_labels firstObject];
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_viewFontDescriptors objectForKey:v5];
    id v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];
    [v7 _scaledValueForValue:50.0];
    double v9 = v8 + v8;
    char v19 = 0;
    double v10 = [(SUUIViewElement *)self->_viewElement style];
    SUUIViewElementMarginForStyle(v10, &v19);
    double v12 = v11;
    double v14 = v13;

    double v15 = v12 + v14;
    if (!v19) {
      double v15 = 0.0;
    }
    double v16 = width - v15;
  }
  else
  {
    double v16 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v17 = v16;
  double v18 = v9;
  result.CGFloat height = v18;
  result.double width = v17;
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  int v6 = objc_msgSend(a5, "isEqualToString:", @"\n", a4.location, a4.length);
  if (v6)
  {
    id v7 = [(SUUISignInView *)self _accountNameText];
    double v8 = [(SUUISignInView *)self _applePasswordText];
    if ([v7 length])
    {
      if ([v8 length])
      {
        uint64_t v9 = [(SUUISignInView *)self delegate];
        if (v9)
        {
          double v10 = (void *)v9;
          double v11 = [(SUUISignInView *)self delegate];
          int v12 = [v11 conformsToProtocol:&unk_270628D48];

          if (v12)
          {
            double v13 = [(SUUISignInView *)self delegate];
            [v13 signInEntryComplete:self accountName:v7 password:v8];
          }
        }
      }
    }
    [(SUUISignInView *)self resignFirstResponder];
  }
  return v6 ^ 1;
}

+ (id)_borderPathWithSize:(CGSize)a3
{
  double width = a3.width;
  CGFloat v4 = a3.height * 0.5;
  CGFloat v5 = a3.height * 0.5 + -1.0;
  int v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = 1.0 / v7;
  double v12 = 1.0 / v7;

  uint64_t v9 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v9, "moveToPoint:", 0.0, v5);
  objc_msgSend(v9, "addLineToPoint:", 0.0, 5.0);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 5.0, 5.0, 5.0, 3.14159265, 4.71238898);
  objc_msgSend(v9, "addLineToPoint:", width + -5.0, 0.0);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width + -5.0, 5.0, 5.0, 4.71238898, 0.0);
  objc_msgSend(v9, "addLineToPoint:", width, v5);
  objc_msgSend(v9, "moveToPoint:", width, v5 + v8);
  CGFloat v10 = v4 * 2.0 + -5.0;
  objc_msgSend(v9, "addLineToPoint:", width, v10);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width + -5.0, v10, 5.0, 0.0, 1.57079633);
  objc_msgSend(v9, "addLineToPoint:", 5.0, v4 + v4);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 5.0, v10, 5.0, 1.57079633, 3.14159265);
  objc_msgSend(v9, "addLineToPoint:", 0.0, v5 + v8);
  objc_msgSend(v9, "moveToPoint:", v12, v5);
  objc_msgSend(v9, "lineToPoint:", width - v12, v5);

  return v9;
}

+ (id)_fontDescriptorWithViewElement:(id)a3 defaultTextStyle:(id)a4 bold:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v9 = [v7 style];
  CGFloat v10 = SUUIViewElementFontWithStyle(v9);

  double v11 = [v10 fontDescriptor];

  if (!v11)
  {
LABEL_10:
    double v12 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v8];
    double v11 = v12;
    if (v5)
    {
      uint64_t v13 = [v12 fontDescriptorWithSymbolicTraits:2];

      double v11 = (void *)v13;
    }
  }

  return v11;
}

+ (id)_labelWithViewElement:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  int v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v7 = [v4 text];
  id v8 = [v7 attributedString];
  [v6 setAttributedText:v8];

  uint64_t v9 = [v4 style];

  CGFloat v10 = [v9 ikColor];
  double v11 = [v10 color];

  if (!v11)
  {
    double v11 = [MEMORY[0x263F825C8] blackColor];
  }
  [v6 setTextColor:v11];

  return v6;
}

+ (id)_textFieldWithViewElement:(id)a3
{
  id v3 = a3;
  id v4 = [SUUISignInTextView alloc];
  id v5 = -[SUUISignInTextView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v6 = [v3 keyboardType];
  if ([v3 isSecure]) {
    [(SUUISignInTextView *)v5 setSecureTextEntry:1];
  }
  [(SUUISignInTextView *)v5 setKeyboardType:v6];
  id v7 = [v3 style];
  id v8 = [v7 ikColor];
  uint64_t v9 = [v8 color];

  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263F825C8] blackColor];
  }
  [(SUUISignInTextView *)v5 setTextColor:v9];
  CGFloat v10 = [v3 placeholderText];
  if (v10)
  {
    double v11 = [v3 placeholderText];
  }
  else
  {
    double v11 = &stru_2704F8130;
  }

  id v12 = objc_alloc(NSDictionary);
  uint64_t v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  double v14 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, *MEMORY[0x263F81500], 0);

  double v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11 attributes:v14];
  [(SUUISignInTextView *)v5 setAttributedPlaceholder:v15];

  return v5;
}

- (id)_accountNameText
{
  if ([(NSMutableArray *)self->_textFields count])
  {
    id v3 = [(NSMutableArray *)self->_textFields objectAtIndex:0];
    id v4 = [v3 text];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_applePasswordText
{
  if ((unint64_t)[(NSMutableArray *)self->_textFields count] < 2)
  {
    id v4 = 0;
  }
  else
  {
    id v3 = [(NSMutableArray *)self->_textFields objectAtIndex:1];
    id v4 = [v3 text];
  }

  return v4;
}

- (void)_clearFieldsAndLabels
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = self->_labels;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_labels removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = self->_textFields;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "removeFromSuperview", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_textFields removeAllObjects];
  [(NSMapTable *)self->_viewFontDescriptors removeAllObjects];
}

- (double)_layoutLabels
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_labels;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v10 = [(NSMapTable *)self->_viewFontDescriptors objectForKey:v9];
        uint64_t v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
        [v9 setFont:v11];
        objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
        double v13 = v12;
        double v15 = v14;
        [v11 _scaledValueForValue:29.0];
        double v17 = v16;
        [v9 _firstBaselineOffsetFromTop];
        objc_msgSend(v9, "setFrame:", 12.0, v7 + v17 - v18, v13, v15);
        [v11 _scaledValueForValue:50.0];
        double v7 = v7 + v19;
        double v6 = fmax(v6, v13);
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)_layoutTextFieldsOffsetX:(double)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(SUUISignInView *)self bounds];
  double Width = CGRectGetWidth(v30);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_textFields;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = Width - a3 + -22.0 + -12.0;
    uint64_t v9 = *(void *)v25;
    double v10 = a3 + 22.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v14 = [(NSMapTable *)self->_viewFontDescriptors objectForKey:v13];
        double v15 = [MEMORY[0x263F81708] fontWithDescriptor:v14 size:0.0];
        [v13 setFont:v15];
        double v16 = [v13 _placeholderLabel];
        objc_msgSend(v13, "sizeThatFits:", v8, 1.79769313e308);
        double v18 = v17;
        [v15 _scaledValueForValue:29.0];
        double v20 = v19;
        [v16 _firstBaselineOffsetFromTop];
        objc_msgSend(v13, "setFrame:", v10, v11 + v20 - v21, v8, v18);
        [v15 _scaledValueForValue:50.0];
        double v11 = v11 + v22;
      }
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
}

- (SUUISignInViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUUISignInViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewFontDescriptors, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_borderView, 0);

  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end