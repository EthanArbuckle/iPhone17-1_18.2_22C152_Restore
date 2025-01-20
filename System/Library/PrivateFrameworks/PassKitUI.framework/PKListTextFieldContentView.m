@interface PKListTextFieldContentView
- (BOOL)_keepTextFieldVisible;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKListTextFieldContentConfiguration)configuration;
- (PKListTextFieldContentView)initWithConfiguration:(id)a3;
- (PKListTextFieldContentView)initWithFrame:(CGRect)a3;
- (PKListTextFieldContentViewDelegate)delegate;
- (id)_transformedText:(id)a3 forTransform:(int64_t)a4;
- (id)textFieldText;
- (int64_t)_textAlignmentForListAlignment:(int64_t)a3;
- (int64_t)_textAutocapTypeForTextTransform:(int64_t)a3;
- (void)_applyConfiguration:(id)a3;
- (void)_applyTextProperties:(id)a3 toLabel:(id)a4;
- (void)_applyTextProperties:(id)a3 toTextField:(id)a4;
- (void)_textFieldTextDidChange:(id)a3;
- (void)_updateErrorState:(BOOL)a3;
- (void)beginEditing;
- (void)endEditing;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)resetTextFieldTextFromLabel;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setToolbarItems:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation PKListTextFieldContentView

- (PKListTextFieldContentView)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = -[PKListTextFieldContentView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    [(PKListTextFieldContentView *)v5 setConfiguration:v4];
  }

  return v6;
}

- (PKListTextFieldContentView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKListTextFieldContentView;
  v3 = -[PKListTextFieldContentView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v4;

    [(PKListTextFieldContentView *)v3 addSubview:v3->_textLabel];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryTextLabel = v3->_secondaryTextLabel;
    v3->_secondaryTextLabel = v6;

    [(PKListTextFieldContentView *)v3 addSubview:v3->_secondaryTextLabel];
    v8 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    textField = v3->_textField;
    v3->_textField = v8;

    [(UITextField *)v3->_textField setDelegate:v3];
    [(UITextField *)v3->_textField addTarget:v3 action:sel__textFieldTextDidChange_ forControlEvents:0x20000];
    [(PKListTextFieldContentView *)v3 addSubview:v3->_textField];
  }
  return v3;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    [(PKListTextFieldContentView *)self _applyConfiguration:v5];
  }
}

- (void)_applyConfiguration:(id)a3
{
  textLabel = self->_textLabel;
  id v5 = a3;
  v6 = [v5 text];
  [(UILabel *)textLabel setText:v6];

  textField = self->_textField;
  v8 = [v5 text];
  [(UITextField *)textField setText:v8];

  v9 = self->_textField;
  v10 = [v5 placeholderText];
  [(UITextField *)v9 setPlaceholder:v10];

  secondaryTextLabel = self->_secondaryTextLabel;
  v12 = [v5 secondaryText];
  [(UILabel *)secondaryTextLabel setText:v12];

  v13 = [v5 textProperties];
  [(PKListTextFieldContentView *)self _applyTextProperties:v13 toLabel:self->_textLabel];

  v14 = [v5 textProperties];
  [(PKListTextFieldContentView *)self _applyTextProperties:v14 toTextField:self->_textField];

  v15 = [v5 secondaryTextProperties];
  [(PKListTextFieldContentView *)self _applyTextProperties:v15 toLabel:self->_secondaryTextLabel];

  -[UITextField setClearsOnBeginEditing:](self->_textField, "setClearsOnBeginEditing:", [v5 clearsOnBeginEditing]);
  -[UITextField setClearsOnInsertion:](self->_textField, "setClearsOnInsertion:", [v5 clearsOnInsertion]);
  -[UITextField setReturnKeyType:](self->_textField, "setReturnKeyType:", [v5 returnKeyType]);
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", [v5 keyboardType]);
  -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", [v5 autocorrectionType]);
  id v18 = [v5 error];

  if (v18)
  {
    v16 = self->_secondaryTextLabel;
    v17 = [v18 localizedDescription];
    [(UILabel *)v16 setText:v17];

    [(PKListTextFieldContentView *)self _updateErrorState:1];
  }
  if ([(UITextField *)self->_textField isFirstResponder]) {
    [(PKListTextFieldContentView *)self beginEditing];
  }
  else {
    [(PKListTextFieldContentView *)self endEditing];
  }
  [(PKListTextFieldContentView *)self setNeedsLayout];
}

- (void)setToolbarItems:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1DF0]);
    [v4 setItems:v5];
    [v4 sizeToFit];
    [(UITextField *)self->_textField setInputAccessoryView:v4];
  }
  else
  {
    [(UITextField *)self->_textField setInputAccessoryView:0];
  }
}

- (void)_applyTextProperties:(id)a3 toLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 resolvedColor];
  [v6 setTextColor:v8];

  v9 = [v7 font];
  [v6 setFont:v9];

  objc_msgSend(v6, "setTextAlignment:", -[PKListTextFieldContentView _textAlignmentForListAlignment:](self, "_textAlignmentForListAlignment:", objc_msgSend(v7, "alignment")));
  objc_msgSend(v6, "setLineBreakMode:", objc_msgSend(v7, "lineBreakMode"));
  objc_msgSend(v6, "setNumberOfLines:", objc_msgSend(v7, "numberOfLines"));
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v7, "adjustsFontSizeToFitWidth"));
  [v7 minimumScaleFactor];
  objc_msgSend(v6, "setMinimumScaleFactor:");
  objc_msgSend(v6, "setAllowsDefaultTighteningForTruncation:", objc_msgSend(v7, "allowsDefaultTighteningForTruncation"));
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v7, "adjustsFontForContentSizeCategory"));
  id v12 = [v6 text];
  uint64_t v10 = [v7 transform];

  objc_super v11 = [(PKListTextFieldContentView *)self _transformedText:v12 forTransform:v10];
  [v6 setText:v11];
}

- (void)_applyTextProperties:(id)a3 toTextField:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  id v7 = [v6 resolvedColor];
  [v12 setTextColor:v7];

  v8 = [v6 font];
  [v12 setFont:v8];

  objc_msgSend(v12, "setTextAlignment:", -[PKListTextFieldContentView _textAlignmentForListAlignment:](self, "_textAlignmentForListAlignment:", objc_msgSend(v6, "alignment")));
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v6, "adjustsFontSizeToFitWidth"));
  [v6 minimumScaleFactor];
  objc_msgSend(v12, "setMinimumFontSize:");
  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v6, "adjustsFontForContentSizeCategory"));
  v9 = [v12 text];
  uint64_t v10 = -[PKListTextFieldContentView _transformedText:forTransform:](self, "_transformedText:forTransform:", v9, [v6 transform]);
  [v12 setText:v10];

  uint64_t v11 = [v6 transform];
  objc_msgSend(v12, "setAutocapitalizationType:", -[PKListTextFieldContentView _textAutocapTypeForTextTransform:](self, "_textAutocapTypeForTextTransform:", v11));
}

- (int64_t)_textAlignmentForListAlignment:(int64_t)a3
{
  if (a3 == 2) {
    return 3;
  }
  if (a3) {
    return 1;
  }
  if ([(PKListTextFieldContentView *)self _shouldReverseLayoutDirection])return 2; {
  return 0;
  }
}

- (id)_transformedText:(id)a3 forTransform:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  switch(a4)
  {
    case 3:
      objc_msgSend(v5, "pk_capitalizedStringForPreferredLocale");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v5, "pk_lowercaseStringForPreferredLocale");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v5, "pk_uppercaseStringForPreferredLocale");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      id v7 = v5;
      break;
  }
  v8 = v7;

  return v8;
}

- (int64_t)_textAutocapTypeForTextTransform:(int64_t)a3
{
  int64_t v3 = 3;
  if (a3 != 1) {
    int64_t v3 = 0;
  }
  if (a3 == 3) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKListTextFieldContentView;
  [(PKListTextFieldContentView *)&v3 layoutSubviews];
  [(PKListTextFieldContentView *)self bounds];
  [(PKListTextFieldContentView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKListTextFieldContentView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(PKListTextFieldContentView *)self configuration];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)&rect[1] = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)&rect[3] = v9;
  [(PKListTextFieldContentConfiguration *)self->_configuration directionalLayoutMargins];
  *(double *)rect = x;
  double v11 = x + v10;
  double v13 = y + v12;
  double v15 = width - (v10 + v14);
  double v17 = v12 + v16;
  double v18 = height - (v12 + v16);
  remainder.origin.double x = v11;
  remainder.origin.double y = y + v12;
  remainder.size.double width = v15;
  remainder.size.double height = v18;
  if (!self->_isTemplateLayout && [v8 focusTextField]) {
    -[UITextField setFrame:](self->_textField, "setFrame:", v11, v13, v15, v18);
  }
  if (objc_msgSend(v8, "mode", *(void *)&y)
    && ([(UILabel *)self->_secondaryTextLabel text],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v19))
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryTextLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v15, v18);
    CGFloat v21 = v20;
    double v23 = v22;
    if (v20 <= v15 * 0.5)
    {
      v59.origin.double x = v11;
      v59.origin.double y = v13;
      v59.size.double width = v15;
      v59.size.double height = v18;
      CGRectDivide(v59, (CGRect *)&rect[1], &remainder, v21, CGRectMinXEdge);
      if (!self->_isTemplateLayout) {
        -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      [(PKListTextFieldContentConfiguration *)self->_configuration textToSecondaryTextHorizontalPadding];
      double v48 = v47;
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v47, CGRectMinXEdge);
      if (!self->_isTemplateLayout) {
        -[UILabel setFrame:](self->_textLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      }
      if (([v8 focusTextField] & 1) == 0 && !self->_isTemplateLayout) {
        -[UITextField setFrame:](self->_textField, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      }
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_textLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
      double v30 = v48 + fmax(v49, v23);
    }
    else
    {
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_textLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v15, v18);
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      v57.origin.double x = v11;
      v57.origin.double y = v13;
      v57.size.double width = v15;
      v57.size.double height = v18;
      double v27 = v24;
      CGRectDivide(v57, (CGRect *)&rect[1], &remainder, v24, CGRectMinYEdge);
      if (!self->_isTemplateLayout) {
        -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      [(PKListTextFieldContentConfiguration *)self->_configuration textToSecondaryTextVerticalPadding];
      double v29 = v28;
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v28, CGRectMinYEdge);
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v26, CGRectMinYEdge);
      if (!self->_isTemplateLayout) {
        -[UILabel setFrame:](self->_textLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      if (([v8 focusTextField] & 1) == 0 && !self->_isTemplateLayout) {
        -[UITextField setFrame:](self->_textField, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      double v30 = v26 + v27 + v29;
    }
    CGFloat v44 = v53;
    double v34 = v30 + 0.0;
  }
  else
  {
    v31 = [(UILabel *)self->_textLabel text];

    if (v31)
    {
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_textLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v15, v18);
      CGFloat v33 = v32;
      v58.origin.double x = v11;
      v58.origin.double y = v13;
      v58.size.double width = v15;
      v58.size.double height = v18;
      CGRectDivide(v58, (CGRect *)&rect[1], &remainder, v33, CGRectMinYEdge);
      if (!self->_isTemplateLayout)
      {
        -[UILabel setFrame:](self->_textLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
        if (([v8 focusTextField] & 1) == 0) {
          -[UITextField setFrame:](self->_textField, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
        }
      }
      double v34 = v33 + 0.0;
    }
    else
    {
      double v34 = 0.0;
      if (!self->_isTemplateLayout)
      {
        double v35 = *MEMORY[0x1E4F1DB28];
        double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        -[UILabel setFrame:](self->_textLabel, "setFrame:", *MEMORY[0x1E4F1DB28], v36, v37, v38);
        -[UITextField setFrame:](self->_textField, "setFrame:", v35, v36, v37, v38);
      }
    }
    [(PKListTextFieldContentConfiguration *)self->_configuration textToSecondaryTextVerticalPadding];
    CGFloat v40 = v39;
    v41 = [(UILabel *)self->_secondaryTextLabel text];

    if (v41)
    {
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryTextLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
      CGFloat v43 = v42;
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v40, CGRectMinYEdge);
      CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v43, CGRectMinYEdge);
      if (!self->_isTemplateLayout) {
        -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      double v34 = v34 + v40 + v43;
    }
    else if (!self->_isTemplateLayout)
    {
      -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    CGFloat v44 = v53;
    if (v34 == 0.0)
    {
      -[UITextField sizeThatFits:](self->_textField, "sizeThatFits:", width, height);
      double v46 = v45;
      if (!self->_isTemplateLayout)
      {
        CGRectDivide(remainder, (CGRect *)&rect[1], &remainder, v45, CGRectMinYEdge);
        -[UITextField setFrame:](self->_textField, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
      }
      double v34 = v34 + v46;
    }
  }
  *(void *)&v60.origin.double x = rect[0];
  v60.origin.double y = v44;
  v60.size.double width = width;
  v60.size.double height = height;
  CGFloat v50 = CGRectGetWidth(v60);

  double v51 = v50;
  double v52 = v17 + v34;
  result.double height = v52;
  result.double width = v51;
  return result;
}

- (id)textFieldText
{
  return [(UITextField *)self->_textField text];
}

- (void)beginEditing
{
  [(UITextField *)self->_textField setHidden:0];
  [(UILabel *)self->_textLabel setHidden:1];
  [(UILabel *)self->_textLabel setUserInteractionEnabled:1];
  if ([(PKListTextFieldContentConfiguration *)self->_configuration focusTextField]) {
    [(UILabel *)self->_secondaryTextLabel setHidden:1];
  }
  textField = self->_textField;

  [(UITextField *)textField becomeFirstResponder];
}

- (void)endEditing
{
  BOOL v3 = [(PKListTextFieldContentView *)self _keepTextFieldVisible];
  [(UITextField *)self->_textField setHidden:v3 ^ 1];
  [(UILabel *)self->_textLabel setHidden:v3];
  [(UILabel *)self->_textLabel setUserInteractionEnabled:0];
  if ([(PKListTextFieldContentConfiguration *)self->_configuration focusTextField]) {
    [(UILabel *)self->_secondaryTextLabel setHidden:0];
  }
  textField = self->_textField;

  [(UITextField *)textField resignFirstResponder];
}

- (void)resetTextFieldTextFromLabel
{
  textField = self->_textField;
  id v3 = [(UILabel *)self->_textLabel text];
  [(UITextField *)textField setText:v3];
}

- (void)_textFieldTextDidChange:(id)a3
{
  id v6 = a3;
  double v4 = [(PKListTextFieldContentView *)self configuration];
  double v5 = [v4 hasErrorHandler];

  if (v5) {
    [(PKListTextFieldContentView *)self _updateErrorState:((uint64_t (**)(void, id))v5)[2](v5, v6)];
  }
}

- (void)_updateErrorState:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PKListTextFieldContentView *)self configuration];
  id v10 = v5;
  if (v3)
  {
    id v6 = [v5 errorColor];
    id v7 = v6;
  }
  else
  {
    v8 = [v5 textProperties];
    id v7 = [v8 color];

    long long v9 = [v10 secondaryTextProperties];
    id v6 = [v9 color];
  }
  [(UILabel *)self->_textLabel setTextColor:v7];
  [(UITextField *)self->_textField setTextColor:v7];
  [(UILabel *)self->_secondaryTextLabel setTextColor:v6];
}

- (BOOL)_keepTextFieldVisible
{
  v2 = [(PKListTextFieldContentView *)self configuration];
  BOOL v3 = [v2 mode] == 1;

  return v3;
}

- (void)prepareForReuse
{
  [(UILabel *)self->_textLabel setText:0];
  [(UILabel *)self->_secondaryTextLabel setText:0];
  [(UITextField *)self->_textField setText:0];
  configuration = self->_configuration;
  self->_configuration = 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(PKListTextFieldContentViewDelegate *)self->_delegate textFieldShouldReturn:v4 forContentView:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PKListTextFieldContentViewDelegate *)self->_delegate textFieldDidBeginEditing:v4 forContentView:self];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PKListTextFieldContentViewDelegate *)self->_delegate textFieldDidEndEditing:v4 forContentView:self];
  }
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PKListTextFieldContentViewDelegate *)self->_delegate textFieldDidChangeSelection:v4 forContentView:self];
  }
}

- (PKListTextFieldContentConfiguration)configuration
{
  return self->_configuration;
}

- (PKListTextFieldContentViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textField, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end