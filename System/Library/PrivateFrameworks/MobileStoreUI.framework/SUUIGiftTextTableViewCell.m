@interface SUUIGiftTextTableViewCell
+ (id)newTextView;
- (BOOL)leftToRight;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (NSString)label;
- (NSString)placeholder;
- (SUUIGiftTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextView)textView;
- (int64_t)maximumCharacterCount;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setLabel:(id)a3;
- (void)setLeftToRight:(BOOL)a3;
- (void)setMaximumCharacterCount:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setTextView:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation SUUIGiftTextTableViewCell

- (SUUIGiftTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SUUIGiftTextTableViewCell;
  v4 = [(SUUIGiftTextTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SUUIGiftTextTableViewCell *)v4 contentView];
    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomBorderView = v5->_bottomBorderView;
    v5->_bottomBorderView = v7;

    v9 = v5->_bottomBorderView;
    v10 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [v6 addSubview:v5->_bottomBorderView];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topBorderView = v5->_topBorderView;
    v5->_topBorderView = v11;

    v13 = v5->_topBorderView;
    v14 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v13 setBackgroundColor:v14];

    [v6 addSubview:v5->_topBorderView];
    v15 = [MEMORY[0x263F82438] sharedApplication];
    v5->_leftToRight = [v15 userInterfaceLayoutDirection] == 0;
  }
  return v5;
}

- (void)dealloc
{
  [(UITextView *)self->_textView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftTextTableViewCell;
  [(SUUIGiftTextTableViewCell *)&v3 dealloc];
}

+ (id)newTextView
{
  id v2 = objc_alloc_init(MEMORY[0x263F82D60]);
  [v2 setAlwaysBounceVertical:1];
  objc_super v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v3];

  v4 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
  [v2 setFont:v4];

  return v2;
}

- (NSString)label
{
  return [(UILabel *)self->_label text];
}

- (NSString)placeholder
{
  return [(UILabel *)self->_placeholderLabel text];
}

- (void)setLabel:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIGiftTextTableViewCell *)self label];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    label = self->_label;
    if (v15)
    {
      if (!label)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_label;
        self->_label = v6;

        v8 = self->_label;
        v9 = [MEMORY[0x263F825C8] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_label;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_label;
        v13 = [MEMORY[0x263F825C8] secondaryLabelColor];
        [(UILabel *)v12 setTextColor:v13];

        label = self->_label;
      }
      -[UILabel setText:](label, "setText:");
      [(UILabel *)self->_label sizeToFit];
      v14 = [(SUUIGiftTextTableViewCell *)self contentView];
      [v14 addSubview:self->_label];
    }
    else
    {
      [(UILabel *)label removeFromSuperview];
      v14 = self->_label;
      self->_label = 0;
    }

    [(SUUIGiftTextTableViewCell *)self setNeedsLayout];
  }
}

- (void)setPlaceholder:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIGiftTextTableViewCell *)self placeholder];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    placeholderLabel = self->_placeholderLabel;
    if (v15)
    {
      if (!placeholderLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_placeholderLabel;
        self->_placeholderLabel = v6;

        v8 = self->_placeholderLabel;
        v9 = [MEMORY[0x263F825C8] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_placeholderLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_placeholderLabel;
        v13 = [MEMORY[0x263F825C8] placeholderTextColor];
        [(UILabel *)v12 setTextColor:v13];

        placeholderLabel = self->_placeholderLabel;
      }
      -[UILabel setText:](placeholderLabel, "setText:");
      [(UILabel *)self->_placeholderLabel sizeToFit];
      v14 = [(SUUIGiftTextTableViewCell *)self contentView];
      [v14 addSubview:self->_placeholderLabel];
    }
    else
    {
      [(UILabel *)placeholderLabel removeFromSuperview];
      v14 = self->_placeholderLabel;
      self->_placeholderLabel = 0;
    }

    [(SUUIGiftTextTableViewCell *)self setNeedsLayout];
  }
}

- (void)setTextView:(id)a3
{
  v5 = (UITextView *)a3;
  p_textView = &self->_textView;
  textView = self->_textView;
  v14 = v5;
  if (textView != v5)
  {
    if ([(UITextView *)textView isDescendantOfView:self]) {
      [(UITextView *)*p_textView removeFromSuperview];
    }
    [(UITextView *)*p_textView setDelegate:0];
    objc_storeStrong((id *)&self->_textView, a3);
    v5 = *p_textView;
  }
  if (v5)
  {
    v8 = [(UITextView *)v5 superview];
    v9 = [(SUUIGiftTextTableViewCell *)self contentView];

    if (v8 != v9)
    {
      v10 = [(SUUIGiftTextTableViewCell *)self contentView];
      [v10 insertSubview:*p_textView belowSubview:self->_bottomBorderView];
    }
  }
  v11 = [(UITextView *)*p_textView delegate];

  if (v11 != self) {
    [(UITextView *)*p_textView setDelegate:self];
  }
  placeholderLabel = self->_placeholderLabel;
  v13 = [(UITextView *)*p_textView text];
  -[UILabel setHidden:](placeholderLabel, "setHidden:", [v13 length] != 0);
}

- (void)layoutSubviews
{
  v57[1] = *MEMORY[0x263EF8340];
  v56.receiver = self;
  v56.super_class = (Class)SUUIGiftTextTableViewCell;
  [(SUUIGiftTextTableViewCell *)&v56 layoutSubviews];
  objc_super v3 = [(SUUIGiftTextTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(UILabel *)self->_label frame];
  double v13 = v12;
  double v15 = v14;
  BOOL v16 = [(SUUIGiftTextTableViewCell *)self leftToRight];
  label = self->_label;
  double v55 = v11;
  double v52 = v7;
  if (v16)
  {
    double v18 = 12.0;
    double v19 = 15.0;
    double v20 = v13;
    double v21 = v15;
    double v22 = 15.0;
    CGFloat v23 = 12.0;
  }
  else
  {
    CGFloat v23 = 12.0;
    double v22 = 15.0;
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, 12.0, v13, v15, v5, v7, v9, v11);
  }
  -[UILabel setFrame:](label, "setFrame:", v19, v18, v20, v21);
  [(UILabel *)self->_placeholderLabel frame];
  double v25 = v24;
  v58.origin.x = v22;
  double v53 = v23;
  v58.origin.y = v23;
  v58.size.width = v13;
  v58.size.height = v15;
  double v26 = CGRectGetMaxX(v58) + 5.0;
  double v27 = v9;
  double v54 = v9 + -15.0;
  double v28 = v9 + -15.0 - v26;
  BOOL v29 = [(SUUIGiftTextTableViewCell *)self leftToRight];
  placeholderLabel = self->_placeholderLabel;
  double v31 = 12.0;
  if (!v29)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v26, 12.0, v28, v25, v5, v52, v27);
    double v26 = v32;
    double v28 = v33;
    double v25 = v34;
  }
  -[UILabel setFrame:](placeholderLabel, "setFrame:", v26, v31, v28, v25);
  [(UITextView *)self->_textView frame];
  v59.origin.x = v22;
  v59.origin.y = v53;
  v59.size.width = v13;
  v59.size.height = v15;
  CGFloat MaxY = CGRectGetMaxY(v59);
  -[UITextView setFrame:](self->_textView, "setFrame:", 10.0, MaxY + 3.0, v27 + -20.0, v55 + -10.0 - (MaxY + 3.0));
  textView = self->_textView;
  v37 = [(UILabel *)self->_label superview];
  -[UITextView convertRect:fromView:](textView, "convertRect:fromView:", v37, v22, v53, v13, v15);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  v46 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", v39, v41, v43, v45);
  v47 = [(UITextView *)self->_textView textContainer];
  v57[0] = v46;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:1];
  [v47 setExclusionPaths:v48];

  v49 = [MEMORY[0x263F82B60] mainScreen];
  [v49 scale];
  double v51 = 1.0 / v50;

  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v55 - v51, v27, v51);
  -[UIView setFrame:](self->_topBorderView, "setFrame:", 15.0, 0.0, v54, v51);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  if (self->_maximumCharacterCount < 1) {
    return 1;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  double v10 = [a3 text];
  double v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  BOOL v12 = (unint64_t)[v11 length] <= self->_maximumCharacterCount;
  return v12;
}

- (void)textViewDidBeginEditing:(id)a3
{
}

- (void)textViewDidEndEditing:(id)a3
{
  placeholderLabel = self->_placeholderLabel;
  id v4 = [(UITextView *)self->_textView text];
  -[UILabel setHidden:](placeholderLabel, "setHidden:", [v4 length] != 0);
}

- (int64_t)maximumCharacterCount
{
  return self->_maximumCharacterCount;
}

- (void)setMaximumCharacterCount:(int64_t)a3
{
  self->_maximumCharacterCount = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end