@interface MailStatusLabelView
- (MailStatusBarViewDelegate)delegate;
- (MailStatusLabelView)initWithFrame:(CGRect)a3;
- (NSAttributedString)primaryLabelText;
- (NSAttributedString)secondaryLabelText;
- (id)_titleFont;
- (id)newLabel:(id)a3;
- (void)_updateBarItemTitle;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setPrimaryLabelText:(id)a3;
- (void)setSecondaryLabelText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithStatusInfo:(id)a3;
- (void)viewDidMoveToSuperview;
@end

@implementation MailStatusLabelView

- (void)layoutSubviews
{
  [(MailStatusLabelView *)self frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat rect_16 = v7;
  CGFloat rect_24 = v5;
  CGFloat v9 = v8;
  [(UILabel *)self->_primaryLabel sizeToFit];
  [(UILabel *)self->_secondaryLabel sizeToFit];
  [(UILabel *)self->_primaryLabel frame];
  CGFloat v35 = v11;
  CGFloat v36 = v10;
  CGFloat v13 = v12;
  double rect_8 = v14;
  [(UILabel *)self->_secondaryLabel frame];
  CGFloat rect = v15;
  CGFloat v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = rect_16;
  v43.size.height = v9;
  CGRectGetWidth(v43);
  v44.origin.y = v35;
  v44.origin.x = v36;
  double v37 = v13;
  v44.size.width = v13;
  CGFloat v22 = v4;
  v44.size.height = rect_8;
  CGRectGetWidth(v44);
  UIRoundToViewScale();
  double v34 = v23;
  v45.origin.x = v4;
  v45.origin.y = rect_24;
  v45.size.width = rect_16;
  v45.size.height = v9;
  CGRectGetWidth(v45);
  v46.origin.x = rect;
  v46.origin.y = v17;
  v46.size.width = v19;
  v46.size.height = v21;
  CGRectGetWidth(v46);
  UIRoundToViewScale();
  double v25 = v24;
  v26 = [(UILabel *)self->_primaryLabel text];
  [v26 length];

  v27 = [(UILabel *)self->_secondaryLabel text];
  [v27 length];

  double v28 = v25 + 0.0;
  v47.origin.x = v22;
  v47.size.width = rect_16;
  v47.origin.y = rect_24;
  v47.size.height = v9;
  CGRectGetHeight(v47);
  UIRoundToViewScale();
  double v30 = v29;
  v48.origin.x = v34 + 0.0;
  v48.origin.y = v30;
  v48.size.width = v37;
  v48.size.height = rect_8;
  CGRectGetMinY(v48);
  v49.origin.x = v28;
  v49.origin.y = v17;
  v49.size.width = v19;
  v49.size.height = v21;
  CGRectGetHeight(v49);
  UIRoundToViewScale();
  double v32 = v31;
  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v34 + 0.0, v30, v37, rect_8);
  secondaryLabel = self->_secondaryLabel;

  -[UILabel setFrame:](secondaryLabel, "setFrame:", v28, v32, v19, v21);
}

- (void)setPrimaryLabelText:(id)a3
{
  id v9 = a3;
  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    double v5 = [(MailStatusLabelView *)self newLabel:0];
    CGFloat v6 = self->_primaryLabel;
    self->_primaryLabel = v5;

    primaryLabel = self->_primaryLabel;
  }
  double v7 = [(UILabel *)primaryLabel attributedText];
  unsigned __int8 v8 = [v9 isEqualToAttributedString:v7];

  if ((v8 & 1) == 0)
  {
    [(UILabel *)self->_primaryLabel setAttributedText:v9];
    [(MailStatusLabelView *)self _updateBarItemTitle];
  }
}

- (void)_updateBarItemTitle
{
  delegate = self->_delegate;
  CGFloat v4 = [(UILabel *)self->_primaryLabel attributedText];
  double v5 = [v4 string];
  CGFloat v6 = [(UILabel *)self->_secondaryLabel attributedText];
  double v7 = [v6 string];
  [(MailStatusBarViewDelegate *)delegate updateBarItemTitle:v5 secondaryTitle:v7];

  [(MailStatusLabelView *)self setNeedsLayout];
}

- (MailStatusBarViewDelegate)delegate
{
  return self->_delegate;
}

- (void)traitCollectionDidChange:(id)a3
{
  CGFloat v4 = [(MailStatusLabelView *)self _titleFont];
  [(UILabel *)self->_primaryLabel setFont:v4];

  double v5 = [(MailStatusLabelView *)self _titleFont];
  [(UILabel *)self->_secondaryLabel setFont:v5];

  [(MailStatusLabelView *)self setNeedsLayout];
}

- (id)newLabel:(id)a3
{
  id v4 = objc_alloc_init((Class)UILabel);
  double v5 = [(MailStatusLabelView *)self _titleFont];
  [v4 setFont:v5];

  [v4 setOpaque:0];
  [v4 setBackgroundColor:0];
  CGFloat v6 = +[UIColor labelColor];
  [v4 setTextColor:v6];

  [v4 setAdjustsFontForContentSizeCategory:1];
  [v4 sizeToFit];
  [(MailStatusLabelView *)self addSubview:v4];
  return v4;
}

- (id)_titleFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleCaption2 maximumContentSizeCategory:UIContentSizeCategoryExtraLarge];
}

- (void)setSecondaryLabelText:(id)a3
{
  id v10 = a3;
  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    double v5 = +[UIColor systemGrayColor];
    CGFloat v6 = [(MailStatusLabelView *)self newLabel:v5];
    double v7 = self->_secondaryLabel;
    self->_secondaryLabel = v6;

    secondaryLabel = self->_secondaryLabel;
  }
  unsigned __int8 v8 = [(UILabel *)secondaryLabel attributedText];
  unsigned __int8 v9 = [v10 isEqualToAttributedString:v8];

  if ((v9 & 1) == 0)
  {
    [(UILabel *)self->_secondaryLabel setAttributedText:v10];
    [(MailStatusLabelView *)self _updateBarItemTitle];
  }
}

- (void)setDelegate:(id)a3
{
}

- (MailStatusLabelView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailStatusLabelView;
  double v3 = -[MailStatusLabelView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(MailStatusLabelView *)v3 setAutoresizingMask:18];
    [(MailStatusLabelView *)v4 setOpaque:0];
  }
  return v4;
}

- (NSAttributedString)primaryLabelText
{
  return (NSAttributedString *)[(UILabel *)self->_primaryLabel text];
}

- (void)viewDidMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MailStatusLabelView;
  [(MailStatusLabelView *)&v3 viewDidMoveToSuperview];
  [(MailStatusLabelView *)self _updateBarItemTitle];
}

- (NSAttributedString)secondaryLabelText
{
  return [(UILabel *)self->_secondaryLabel attributedText];
}

- (void)updateWithStatusInfo:(id)a3
{
  id v5 = a3;
  [(MailStatusLabelView *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MailStatusLabelView updateWithStatusInfo:]", "MailStatusLabelView.m", 107, "0");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end