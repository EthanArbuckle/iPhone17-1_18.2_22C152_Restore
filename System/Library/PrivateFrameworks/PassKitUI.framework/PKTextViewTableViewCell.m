@interface PKTextViewTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKTextViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextView)textView;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PKTextViewTableViewCell

- (PKTextViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKTextViewTableViewCell;
  v4 = [(PKTextViewTableViewCell *)&v11 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v5;

    v7 = v4->_textView;
    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UITextView *)v7 setFont:v8];

    v9 = [(PKTextViewTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_textView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKTextViewTableViewCell;
  [(PKTextViewTableViewCell *)&v16 layoutSubviews];
  [(PKTextViewTableViewCell *)self layoutMargins];
  double v4 = v3;
  uint64_t v5 = [(PKTextViewTableViewCell *)self contentView];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  textView = self->_textView;
  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  CGFloat v15 = CGRectGetWidth(v17) + v4 * -2.0;
  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  -[UITextView setFrame:](textView, "setFrame:", v4, 0.0, v15, CGRectGetHeight(v18));
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKTextViewTableViewCell;
  [(PKTextViewTableViewCell *)&v3 prepareForReuse];
  [(UITextView *)self->_textView resignFirstResponder];
  [(UITextView *)self->_textView setDelegate:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = [(UITextView *)self->_textView font];
  [v4 lineHeight];
  double v6 = v5 * 12.0;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
}

@end