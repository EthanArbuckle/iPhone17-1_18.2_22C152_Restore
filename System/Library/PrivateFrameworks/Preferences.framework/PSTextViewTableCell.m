@interface PSTextViewTableCell
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (PSTextView)textView;
- (PSTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_adjustTextView:(id)a3 updateTable:(BOOL)a4 withSpecifier:(id)a5;
- (void)cellRemovedFromView;
- (void)layoutSubviews;
- (void)setTextView:(id)a3;
- (void)setValue:(id)a3;
- (void)textContentViewDidEndEditing:(id)a3;
@end

@implementation PSTextViewTableCell

- (PSTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  v9 = (id *)a5;
  v20.receiver = self;
  v20.super_class = (Class)PSTextViewTableCell;
  v10 = [(PSTableCell *)&v20 initWithStyle:a3 reuseIdentifier:v8 specifier:v9];
  v11 = v10;
  if (v10)
  {
    [(PSTextViewTableCell *)v10 setSelectionStyle:0];
    [(PSTextViewTableCell *)v11 setAccessoryType:0];
    v12 = [PSTextView alloc];
    v13 = -[UITextContentView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PSTextView *)v13 setCell:v11];
    [(PSTextView *)v13 setTextLoupeVisibility:1];
    v14 = UISystemFontForSize();
    [(UITextContentView *)v13 setFont:v14];

    [(PSTextViewTableCell *)v11 setTextView:v13];
    if (v9[2])
    {
      id WeakRetained = objc_loadWeakRetained(v9 + 1);
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        v17 = [v9 performGetter];
        [(PSTextViewTableCell *)v11 setValue:v17];
      }
    }
    if (v9[3] && v9[2])
    {
      id v18 = objc_loadWeakRetained(v9 + 1);
      [(PSTableCell *)v11 setValueChangedTarget:v18 action:v9[3] specifier:v9];
    }
  }

  return v11;
}

- (void)setValue:(id)a3
{
  [(UITextContentView *)self->_textView setContentToHTMLString:a3];
  [(PSTextViewTableCell *)self setNeedsLayout];
  [(PSTextViewTableCell *)self layoutIfNeeded];
}

- (void)cellRemovedFromView
{
  v3 = [(PSTableCell *)self specifier];
  v5.receiver = self;
  v5.super_class = (Class)PSTextViewTableCell;
  [(PSTableCell *)&v5 cellRemovedFromView];
  if ([(UITextContentView *)self->_textView isEditing]) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    [(PSTableCell *)self setSpecifier:v3];
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PSTextViewTableCell;
  [(PSTableCell *)&v5 layoutSubviews];
  v3 = [(PSTextViewTableCell *)self textView];
  BOOL v4 = [(PSTableCell *)self specifier];
  [(PSTextViewTableCell *)self _adjustTextView:v3 updateTable:1 withSpecifier:v4];
}

- (void)_adjustTextView:(id)a3 updateTable:(BOOL)a4 withSpecifier:(id)a5
{
  BOOL v6 = a4;
  id v25 = a3;
  id v7 = a5;
  id v8 = [v7 propertyForKey:@"textViewBottomMargin"];
  if (v8)
  {
    id v9 = (id)[v25 text];
    double v10 = PSTextViewInsets();
    double v12 = v11;
    v13 = [v25 webView];
    [v13 frame];
    double v14 = v12 + v10 + CGRectGetHeight(v27);
    [v8 floatValue];
    double v16 = v14 + v15;

    *(float *)&double v17 = v16;
    id v18 = [MEMORY[0x1E4F28ED0] numberWithFloat:v17];
    v19 = [v7 propertyForKey:@"height"];
    char v20 = [v19 isEqual:v18];

    if ((v20 & 1) == 0)
    {
      if (v6)
      {
        v21 = [v7 target];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22 = [v7 target];
          v23 = [v22 table];
        }
        else
        {
          v23 = 0;
        }

        uint64_t v24 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
        [MEMORY[0x1E4F42FF0] setAnimationsEnabled:0];
        [v23 beginUpdates];
        [v7 setProperty:v18 forKey:@"height"];
        [v23 endUpdates];
        [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v24];
      }
      else
      {
        [v7 setProperty:v18 forKey:@"height"];
      }
    }
  }
}

- (void)textContentViewDidEndEditing:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(PSTableCell *)self cellTarget];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    BOOL v6 = [(PSTableCell *)self specifier];

    if (v6)
    {
      [(PSTableCell *)self cellAction];
      id v7 = [(PSTableCell *)self cellTarget];
      id v8 = [v11 contentAsHTMLString];
      id v9 = [(PSTableCell *)self specifier];
      id v10 = (id)SFPerformSelector2();
    }
  }
}

- (BOOL)becomeFirstResponder
{
  return [(UITextContentView *)self->_textView becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(UITextContentView *)self->_textView canBecomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PSTextViewTableCell;
  if (![(PSTextViewTableCell *)&v5 isFirstResponder]) {
    return [(UITextContentView *)self->_textView resignFirstResponder];
  }
  v4.receiver = self;
  v4.super_class = (Class)PSTextViewTableCell;
  return [(PSTextViewTableCell *)&v4 resignFirstResponder];
}

- (PSTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_super v5 = (PSTextView *)a3;
  p_textView = &self->_textView;
  if (self->_textView != v5)
  {
    id v8 = v5;
    id v7 = [(PSTextViewTableCell *)self contentView];
    [v7 addSubview:v8];

    if (*p_textView) {
      [(UITextContentView *)*p_textView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_textView, a3);
    [(UITextContentView *)*p_textView setDelegate:self];
    objc_super v5 = v8;
  }
}

- (void).cxx_destruct
{
}

@end