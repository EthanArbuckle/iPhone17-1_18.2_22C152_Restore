@interface PKPassPersonalizationCell
+ (double)minimumCellHeight;
+ (double)textLabelWidthForText:(id)a3;
+ (id)_textFieldFont;
+ (id)_textLabelFont;
- (BOOL)becomeFirstResponder;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (PKContact)contact;
- (PKPassPersonalizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKPassPersonalizationCellContext)context;
- (PKPassPersonalizationCellDelegate)delegate;
- (void)_editableTextFieldChanged:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContext:(id)a3 andContact:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PKPassPersonalizationCell

- (PKPassPersonalizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)PKPassPersonalizationCell;
  v4 = [(PKPassPersonalizationCell *)&v30 initWithStyle:1000 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PKPassPersonalizationCell *)v4 setSelectionStyle:0];
    v6 = [(PKPassPersonalizationCell *)v5 textLabel];
    v7 = [(id)objc_opt_class() _textLabelFont];
    [v6 setFont:v7];

    v8 = [(PKPassPersonalizationCell *)v5 textLabel];
    [v8 setMinimumScaleFactor:0.7];

    v9 = [(PKPassPersonalizationCell *)v5 textLabel];
    [v9 setBaselineAdjustment:1];

    v10 = [(PKPassPersonalizationCell *)v5 textLabel];
    [v10 setAdjustsFontSizeToFitWidth:1];

    v11 = [(PKPassPersonalizationCell *)v5 textLabel];
    [v11 setText:0];

    v12 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v12 setText:0];

    v13 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v13 setSecureTextEntry:0];

    v14 = [(PKPassPersonalizationCell *)v5 editableTextField];
    v15 = [(id)objc_opt_class() _textFieldFont];
    [v14 setFont:v15];

    v16 = [(PKPassPersonalizationCell *)v5 editableTextField];
    v17 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v16 setTextColor:v17];

    v18 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v18 setAdjustsFontSizeToFitWidth:0];

    v19 = [(PKPassPersonalizationCell *)v5 editableTextField];
    v20 = PKLocalizedPaymentString(&cfstr_Required.isa);
    [v19 setPlaceholder:v20];

    v21 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v21 setClearButtonMode:1];

    v22 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v22 setAutocorrectionType:1];

    v23 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v23 setKeyboardType:0];

    v24 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v24 setTextContentType:0];

    v25 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v25 setReturnKeyType:4];

    v26 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v26 setInputView:0];

    v27 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v27 setDelegate:v5];

    v28 = [(PKPassPersonalizationCell *)v5 editableTextField];
    [v28 addTarget:v5 action:sel__editableTextFieldChanged_ forControlEvents:0x20000];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(PKPassPersonalizationCell *)self editableTextField];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPassPersonalizationCell;
  [(PKPassPersonalizationCell *)&v4 dealloc];
}

- (BOOL)becomeFirstResponder
{
  v2 = [(PKPassPersonalizationCell *)self editableTextField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)PKPassPersonalizationCell;
  [(PKPassPersonalizationCell *)&v10 prepareForReuse];
  [(PKPassPersonalizationCell *)self setContext:0 andContact:0];
  [(PKPassPersonalizationCell *)self setDelegate:0];
  char v3 = [(PKPassPersonalizationCell *)self textLabel];
  [v3 setText:0];

  objc_super v4 = [(PKPassPersonalizationCell *)self editableTextField];
  [v4 setText:0];

  v5 = [(PKPassPersonalizationCell *)self editableTextField];
  v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v5 setTextColor:v6];

  v7 = [(PKPassPersonalizationCell *)self editableTextField];
  [v7 setKeyboardType:0];

  v8 = [(PKPassPersonalizationCell *)self editableTextField];
  [v8 setTextContentType:0];

  v9 = [(PKPassPersonalizationCell *)self editableTextField];
  [v9 setAutocapitalizationType:0];
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)PKPassPersonalizationCell;
  [(PKPassPersonalizationCell *)&v55 layoutSubviews];
  char v3 = [(PKPassPersonalizationCell *)self textLabel];
  objc_super v4 = [(PKPassPersonalizationCell *)self editableTextField];
  if (v4)
  {
    v5 = [(PKPassPersonalizationCell *)self contentView];
    [v3 frame];
    double v7 = v6;
    CGFloat v50 = v9;
    double v51 = v8;
    double rect = v10;
    [v4 frame];
    double v12 = v11;
    double v53 = v14;
    double v54 = v13;
    CGFloat v49 = v15;
    char v16 = [(PKPassPersonalizationCell *)self _shouldReverseLayoutDirection];
    [v5 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    CGFloat v24 = v23;
    double v46 = v23;
    [v5 layoutMargins];
    double v26 = v25;
    double v47 = v28;
    double v48 = v27;
    double v30 = fmax(v29, fmin(v7, v12) - v18);
    v56.origin.x = v18;
    v56.origin.y = v20;
    v56.size.width = v22;
    v56.size.height = v24;
    double MaxX = CGRectGetMaxX(v56);
    v57.origin.x = v7;
    v57.size.width = v50;
    v57.origin.y = v51;
    v57.size.height = rect;
    double v32 = CGRectGetMaxX(v57);
    v58.origin.x = v12;
    v58.size.height = v53;
    v58.origin.y = v54;
    v58.size.width = v49;
    double v33 = fmax(v47, MaxX - fmax(v32, CGRectGetMaxX(v58)));
    double v34 = v18 + v30;
    double v35 = v20 + v26;
    double v36 = v22 - (v30 + v33);
    double v37 = v46 - (v26 + v48);
    objc_msgSend(v3, "sizeThatFits:", v36, v37);
    double v39 = v38;
    [(PKPassPersonalizationCellContext *)self->_context minimumTextLabelWidth];
    double v41 = fmin(fmax(v39, v40), v36 + -122.0);
    if (v16)
    {
      v59.origin.x = v34;
      v59.origin.y = v35;
      v59.size.width = v36;
      v59.size.height = v37;
      CGFloat v42 = CGRectGetMaxX(v59);
      CGFloat v43 = v42 - v41;
      objc_msgSend(v3, "setFrame:", v42 - v41, v51, v41, rect);
      double v44 = v43 - v34 + -22.0;
    }
    else
    {
      objc_msgSend(v3, "setFrame:", v34, v51, v41, rect);
      v60.origin.x = v34;
      v60.origin.y = v51;
      v60.size.width = v41;
      v60.size.height = rect;
      CGFloat v45 = CGRectGetMaxX(v60) + 22.0;
      v61.origin.x = v34;
      v61.origin.y = v35;
      v61.size.width = v36;
      v61.size.height = v37;
      double v44 = CGRectGetMaxX(v61) - v45;
      double v34 = v45;
    }
    objc_msgSend(v4, "setFrame:", v34, v54, v44, v53);
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = [v6 personalizationCellShouldBeginEditing:self];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = [v6 personalizationCellShouldReturn:self];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

+ (double)minimumCellHeight
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 60.0;
  if (!v2) {
    return 50.0;
  }
  return result;
}

+ (double)textLabelWidthForText:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  id v4 = a3;
  v5 = [a1 _textLabelFont];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [v4 sizeWithAttributes:v6];
  double v8 = v7;

  return v8;
}

- (void)setContext:(id)a3 andContact:(id)a4
{
  double v19 = (PKPassPersonalizationCellContext *)a3;
  double v7 = (PKContact *)a4;
  p_context = &self->_context;
  if (self->_context != v19) {
    objc_storeStrong((id *)&self->_context, a3);
  }
  p_contact = &self->_contact;
  if (self->_contact != v7) {
    objc_storeStrong((id *)&self->_contact, a4);
  }
  if (*p_context)
  {
    uint64_t v10 = [(PKPassPersonalizationCell *)self textLabel];
    double v11 = [(PKPassPersonalizationCellContext *)v19 title];
    [v10 setText:v11];

    double v12 = [(PKPassPersonalizationCell *)self editableTextField];
    objc_msgSend(v12, "setKeyboardType:", -[PKPassPersonalizationCellContext keyboardType](v19, "keyboardType"));

    double v13 = [(PKPassPersonalizationCell *)self editableTextField];
    double v14 = [(PKPassPersonalizationCellContext *)v19 textContentType];
    [v13 setTextContentType:v14];

    double v15 = [(PKPassPersonalizationCell *)self editableTextField];
    objc_msgSend(v15, "setAutocapitalizationType:", -[PKPassPersonalizationCellContext autocapitalizationType](v19, "autocapitalizationType"));

    if (*p_contact)
    {
      char v16 = [(PKPassPersonalizationCellContext *)*p_context stringRepresentationBlock];
      if (v16)
      {
        double v17 = [(PKPassPersonalizationCell *)self editableTextField];
        double v18 = ((void (**)(void, PKContact *))v16)[2](v16, *p_contact);
        [v17 setText:v18];
      }
    }
    [(PKPassPersonalizationCell *)self setNeedsLayout];
  }
}

- (void)_editableTextFieldChanged:(id)a3
{
  double v12 = [(PKPassPersonalizationCellContext *)self->_context contactUpdateBlock];
  id v4 = [(PKPassPersonalizationCellContext *)self->_context stringRepresentationBlock];
  v5 = [(PKPassPersonalizationCell *)self editableTextField];
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  [v5 setTextColor:v6];

  if (v12)
  {
    double v7 = [(PKPassPersonalizationCell *)self editableTextField];
    double v8 = [v7 text];
    v12[2](v12, v8, self->_contact);

    if ([(PKPassPersonalizationCellContext *)self->_context bindTextToStringRepresentation])
    {
      double v9 = [(PKPassPersonalizationCell *)self editableTextField];
      uint64_t v10 = ((void (**)(void, PKContact *))v4)[2](v4, self->_contact);
      [v9 setText:v10];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained personalizationCellDidChangeValue:self];
}

+ (id)_textLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
}

+ (id)_textFieldFont
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
}

- (PKContact)contact
{
  return self->_contact;
}

- (PKPassPersonalizationCellContext)context
{
  return self->_context;
}

- (PKPassPersonalizationCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassPersonalizationCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end