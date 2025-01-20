@interface TUICandidateInlineTextView
- (NSString)text;
- (TUICandidateInlineTextView)initWithCoder:(id)a3;
- (TUICandidateInlineTextView)initWithFrame:(CGRect)a3;
- (TUICandidateViewStyle)style;
- (UILabel)label;
- (void)commonInit;
- (void)setLabel:(id)a3;
- (void)setStyle:(id)a3;
- (void)setText:(id)a3;
- (void)updateLabels;
@end

@implementation TUICandidateInlineTextView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (NSString)text
{
  return self->_text;
}

- (void)setStyle:(id)a3
{
  id v7 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    v5 = [v7 textColor];
    v6 = [(TUICandidateInlineTextView *)self label];
    [v6 setTextColor:v5];

    [(TUICandidateInlineTextView *)self updateLabels];
  }
}

- (void)updateLabels
{
  [(TUICandidateInlineTextView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v13 = [(TUICandidateInlineTextView *)self style];
  [v13 gridPadding];
  CGFloat v12 = v11 + 10.0;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  CGRect v16 = CGRectInset(v15, v12, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
}

- (void)setText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    CGFloat v4 = (NSString *)[v8 copy];
    text = self->_text;
    self->_text = v4;

    CGFloat v6 = self->_text;
    double v7 = [(TUICandidateInlineTextView *)self label];
    [v7 setText:v6];
  }
}

- (TUICandidateInlineTextView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateInlineTextView;
  double v3 = [(TUICandidateInlineTextView *)&v6 initWithCoder:a3];
  CGFloat v4 = v3;
  if (v3) {
    [(TUICandidateInlineTextView *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateInlineTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateInlineTextView;
  double v3 = -[TUICandidateInlineTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v4 = v3;
  if (v3) {
    [(TUICandidateInlineTextView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  [(TUICandidateInlineTextView *)self bounds];
  CGFloat v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
  label = self->_label;
  self->_label = v4;

  objc_super v6 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
  [(UILabel *)self->_label setFont:v6];

  [(UILabel *)self->_label setLineBreakMode:5];
  [(UILabel *)self->_label setBaselineAdjustment:1];
  [(TUICandidateInlineTextView *)self addSubview:self->_label];
  double v7 = self->_label;
  [(UILabel *)v7 setAutoresizingMask:18];
}

@end