@interface PRMonogramView
- (BOOL)allowsEditing;
- (BOOL)bordered;
- (BOOL)highlighted;
- (BOOL)isCircular;
- (BOOL)isSelected;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (PRMonogram)monogram;
- (PRMonogramView)initWithFrame:(CGRect)a3;
- (void)_updateCornerRadii;
- (void)_updateTextLabel;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setBordered:(BOOL)a3;
- (void)setCircular:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMonogram:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textFieldResignFirstResponder;
@end

@implementation PRMonogramView

- (PRMonogramView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PRMonogramView;
  v3 = -[PRMonogramView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PRMonogramView *)v3 setCircular:1];
    uint64_t v5 = +[PRMonogram plateOverlayLayer];
    circleGradientLayer = v4->_circleGradientLayer;
    v4->_circleGradientLayer = (CAGradientLayer *)v5;

    v7 = v4->_circleGradientLayer;
    [(PRMonogramView *)v4 bounds];
    -[CAGradientLayer setFrame:](v7, "setFrame:");
    v8 = [(PRMonogramView *)v4 layer];
    [v8 addSublayer:v4->_circleGradientLayer];

    id v9 = objc_alloc(MEMORY[0x263F1CA98]);
    [(PRMonogramView *)v4 bounds];
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:");
    textField = v4->_textField;
    v4->_textField = (UITextField *)v10;

    v12 = [MEMORY[0x263F1C550] whiteColor];
    [(UITextField *)v4->_textField setTintColor:v12];

    [(UITextField *)v4->_textField setTextAlignment:1];
    [(UITextField *)v4->_textField setAdjustsFontSizeToFitWidth:0];
    [(UITextField *)v4->_textField setEnabled:0];
    [(UITextField *)v4->_textField setAutocapitalizationType:3];
    [(UITextField *)v4->_textField setAutocorrectionType:1];
    [(UITextField *)v4->_textField setSpellCheckingType:1];
    [(UITextField *)v4->_textField setReturnKeyType:9];
    [(UITextField *)v4->_textField setKeyboardType:13];
    [(UITextField *)v4->_textField setDelegate:v4];
    [(PRMonogramView *)v4 addSubview:v4->_textField];
  }
  return v4;
}

- (void)dealloc
{
  [(PRMonogram *)self->_monogram removeObserver:self forKeyPath:@"text"];
  [(PRMonogram *)self->_monogram removeObserver:self forKeyPath:@"fontIndex"];
  [(PRMonogram *)self->_monogram removeObserver:self forKeyPath:@"color"];
  v3.receiver = self;
  v3.super_class = (Class)PRMonogramView;
  [(PRMonogramView *)&v3 dealloc];
}

- (void)setMonogram:(id)a3
{
  uint64_t v5 = (PRMonogram *)a3;
  p_monogram = &self->_monogram;
  monogram = self->_monogram;
  if (monogram != v5)
  {
    v8 = v5;
    [(PRMonogram *)monogram removeObserver:self forKeyPath:@"text"];
    [(PRMonogram *)*p_monogram removeObserver:self forKeyPath:@"fontIndex"];
    [(PRMonogram *)*p_monogram removeObserver:self forKeyPath:@"color"];
    objc_storeStrong((id *)&self->_monogram, a3);
    [(PRMonogram *)*p_monogram addObserver:self forKeyPath:@"text" options:1 context:0];
    [(PRMonogram *)*p_monogram addObserver:self forKeyPath:@"fontIndex" options:1 context:0];
    [(PRMonogram *)*p_monogram addObserver:self forKeyPath:@"color" options:1 context:0];
    monogram = (PRMonogram *)[(PRMonogramView *)self _updateTextLabel];
    uint64_t v5 = v8;
  }
  MEMORY[0x270F9A758](monogram, v5);
}

- (void)setBordered:(BOOL)a3
{
  if (self->_bordered != a3)
  {
    self->_bordered = a3;
    [(PRMonogramView *)self _updateTextLabel];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3) {
    self->_selected = a3;
  }
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
  -[UITextField setEnabled:](self->_textField, "setEnabled:");
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    [(PRMonogramView *)self _updateCornerRadii];
  }
}

- (void)textFieldResignFirstResponder
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (self->_monogram == a4)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    if ([v10 isEqualToString:@"color"]
      || [v10 isEqualToString:@"text"]
      || [v10 isEqualToString:@"fontIndex"])
    {
      [(PRMonogramView *)self _updateTextLabel];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PRMonogramView;
    [(PRMonogramView *)&v11 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)_updateTextLabel
{
  v37[1] = *MEMORY[0x263EF8340];
  [(PRMonogramView *)self bounds];
  double Height = CGRectGetHeight(v38);
  v4 = +[PRMonogram fontForIndex:[(PRMonogram *)self->_monogram fontIndex] plateDiameter:Height];
  unint64_t v5 = [(PRMonogram *)self->_monogram fontIndex];
  [v4 pointSize];
  +[PRMonogram kerningForFontIndex:fontSize:](PRMonogram, "kerningForFontIndex:fontSize:", v5);
  double v7 = v6;
  if (self->_bordered) {
    [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
  }
  else {
  uint64_t v8 = [MEMORY[0x263F1C550] whiteColor];
  }
  uint64_t v36 = *MEMORY[0x263F81500];
  v37[0] = v8;
  id v9 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, &v36, 1, v8);
  [(UITextField *)self->_textField editRect];
  double v11 = v10 + Height * -0.200000003;
  v12 = [(PRMonogram *)self->_monogram text];
  uint64_t v13 = *MEMORY[0x263F81510];
  v34[0] = *MEMORY[0x263F814F0];
  v34[1] = v13;
  v35[0] = v4;
  objc_super v14 = [NSNumber numberWithDouble:v7];
  v35[1] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  [v12 sizeWithAttributes:v15];
  double v17 = v16;

  if (v11 > 0.0 && v17 > v11)
  {
    v19 = +[PRMonogram fontForIndex:[(PRMonogram *)self->_monogram fontIndex] plateDiameter:Height * (v11 / v17)];

    unint64_t v20 = [(PRMonogram *)self->_monogram fontIndex];
    [v19 pointSize];
    +[PRMonogram kerningForFontIndex:fontSize:](PRMonogram, "kerningForFontIndex:fontSize:", v20);
    double v7 = v21;
    v4 = v19;
  }
  if (v7 != 0.0)
  {
    v22 = (void *)[v9 mutableCopy];
    v23 = [NSNumber numberWithDouble:v7];
    [v22 setObject:v23 forKey:v13];

    uint64_t v24 = [v22 copy];
    id v9 = (void *)v24;
  }
  id v25 = objc_alloc(MEMORY[0x263F086A0]);
  v26 = [(PRMonogram *)self->_monogram text];
  if (v26)
  {
    v27 = [(PRMonogram *)self->_monogram text];
    v28 = (void *)[v25 initWithString:v27 attributes:v9];
  }
  else
  {
    v28 = (void *)[v25 initWithString:&stru_26C639EC0 attributes:v9];
  }

  v29 = [(UITextField *)self->_textField attributedText];
  char v30 = [v29 isEqual:v28];

  if ((v30 & 1) == 0) {
    [(UITextField *)self->_textField setAttributedText:v28];
  }
  v31 = [(UITextField *)self->_textField font];
  char v32 = [v31 isEqual:v4];

  if ((v32 & 1) == 0) {
    [(UITextField *)self->_textField setFont:v4];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PRMonogramView;
  [(PRMonogramView *)&v8 layoutSubviews];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  objc_super v3 = [(PRMonogramView *)self layer];
  [v3 bounds];
  -[CAGradientLayer setFrame:](self->_circleGradientLayer, "setFrame:");

  [(PRMonogramView *)self _updateCornerRadii];
  [MEMORY[0x263F158F8] commit];
  [(PRMonogramView *)self bounds];
  [(UITextField *)self->_textField setFrame:PRRectScale(v4, v5, v6, v7, 0.899999976, 1.0)];
  [(PRMonogramView *)self _updateTextLabel];
}

- (void)_updateCornerRadii
{
  BOOL v3 = [(PRMonogramView *)self isCircular];
  double v4 = 0.0;
  if (v3)
  {
    [(PRMonogramView *)self bounds];
    PRRectGetMinLength(v5, v6, v7, v8);
    double v4 = v9 * 0.5;
  }
  circleGradientLayer = self->_circleGradientLayer;
  [(CAGradientLayer *)circleGradientLayer setCornerRadius:v4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v3 = a3;
  id v6 = [v3 endOfDocument];
  double v4 = [v3 endOfDocument];
  CGFloat v5 = [v3 textRangeFromPosition:v6 toPosition:v4];
  [v3 setSelectedTextRange:v5];
}

- (void)textFieldDidEndEditing:(id)a3
{
  CGFloat v8 = (PRMonogram *)a3;
  double v4 = [(PRMonogram *)v8 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(PRMonogram *)v8 text];
    monogram = self->_monogram;
  }
  else
  {
    id v6 = [(PRMonogram *)self->_monogram text];
    monogram = v8;
  }
  [(PRMonogram *)monogram setText:v6];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || ([v8 markedTextRange], double v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v13 = [v8 text];
    objc_super v14 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v9);

    uint64_t v20 = 0;
    double v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v15 = [v14 length];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke;
    v19[3] = &unk_264254090;
    v19[4] = &v20;
    objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 2, v19);
    unint64_t v16 = v21[3];
    BOOL v11 = v16 < 3;
    if (v16 == 2)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke_2;
      v17[3] = &unk_264253E58;
      id v18 = v8;
      dispatch_async(MEMORY[0x263EF83A0], v17);
    }
    _Block_object_dispose(&v20, 8);
  }
  return v11;
}

uint64_t __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resignFirstResponder];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)PRMonogramView;
  [(PRMonogramView *)&v5 didMoveToWindow];
  [(PRMonogramView *)self _updateTextLabel];
  id v3 = [(PRMonogramView *)self window];
  double v4 = [v3 screen];
  [v4 scale];
  -[CAGradientLayer setRasterizationScale:](self->_circleGradientLayer, "setRasterizationScale:");
}

- (PRMonogram)monogram
{
  return self->_monogram;
}

- (BOOL)bordered
{
  return self->_bordered;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_circleGradientLayer, 0);
}

@end