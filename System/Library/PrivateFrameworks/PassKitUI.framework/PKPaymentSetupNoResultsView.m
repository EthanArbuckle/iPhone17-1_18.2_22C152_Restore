@interface PKPaymentSetupNoResultsView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentSetupNoResultsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setActionButtonTitle:(id)a3 addTarget:(id)a4 action:(SEL)a5;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPaymentSetupNoResultsView

- (PKPaymentSetupNoResultsView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentSetupNoResultsView;
  v3 = -[PKPaymentSetupNoResultsView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PKPaymentSetupNoResultsView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
    uint64_t v7 = [v5 initWithImage:v6];
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v7;

    [(UIImageView *)v3->_iconImageView setContentMode:1];
    v9 = v3->_iconImageView;
    v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIImageView *)v9 setTintColor:v10];

    [(PKPaymentSetupNoResultsView *)v3 addSubview:v3->_iconImageView];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v11;

    v13 = v3->_titleLabel;
    v14 = (NSString *)*MEMORY[0x1E4FB2780];
    v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2998], (NSString *)*MEMORY[0x1E4FB2780]);
    [(UILabel *)v13 setFont:v15];

    v16 = v3->_titleLabel;
    v17 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v16 setTextColor:v17];

    v18 = v3->_titleLabel;
    v19 = PKLocalizedPaymentString(&cfstr_PaymentSetupNo.isa);
    [(UILabel *)v18 setText:v19];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(PKPaymentSetupNoResultsView *)v3 addSubview:v3->_titleLabel];
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v20;

    v22 = v3->_subtitleLabel;
    v23 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], v14);
    [(UILabel *)v22 setFont:v23];

    v24 = v3->_subtitleLabel;
    v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v24 setTextColor:v25];

    [(UILabel *)v3->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(PKPaymentSetupNoResultsView *)v3 addSubview:v3->_subtitleLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupNoResultsView;
  [(PKPaymentSetupNoResultsView *)&v3 layoutSubviews];
  [(PKPaymentSetupNoResultsView *)self bounds];
  -[PKPaymentSetupNoResultsView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPaymentSetupNoResultsView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = [(PKPaymentSetupNoResultsView *)self readableContentGuide];
  [v10 layoutFrame];
  double v12 = v11;

  if (a4)
  {
    int v13 = 1;
    double v14 = 0.0;
  }
  else
  {
    -[PKPaymentSetupNoResultsView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, x, y, width, height);
    if (v15 >= height)
    {
      int v13 = 0;
      double v14 = 15.0;
    }
    else
    {
      PKFloatRoundToPixel();
      double v14 = v16;
      int v13 = 1;
    }
  }
  v17 = [(UIImageView *)self->_iconImageView image];

  if (v17)
  {
    if (v13)
    {
      v46.origin.double x = (width + -50.0) * 0.5;
      v46.origin.double y = v14;
      v46.size.double width = 50.0;
      v46.size.double height = 50.0;
      double v18 = CGRectGetMaxY(v46) + 20.0;
      if (!a4) {
        -[UIImageView setFrame:](self->_iconImageView, "setFrame:", (width + -50.0) * 0.5, v14, 50.0, 50.0);
      }
    }
    else
    {
      double v18 = v14;
    }
    [(UIImageView *)self->_iconImageView setHidden:v13 ^ 1u];
    double v14 = v18;
  }
  double v19 = v12 + -12.0;
  v20 = [(UILabel *)self->_titleLabel text];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v19, height);
    double v23 = v22;
    double v25 = v24;
    double v26 = (width - v22) * 0.5;
    v47.origin.double x = v26;
    v47.origin.double y = v14;
    v47.size.double width = v23;
    v47.size.double height = v25;
    double v27 = CGRectGetMaxY(v47) + 15.0;
    if (!a4) {
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v26, v14, v23, v25);
    }
  }
  else
  {
    double v27 = v14;
  }
  v28 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v29 = [v28 length];

  if (v29)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v19, height);
    double v31 = v30;
    double v33 = v32;
    double v34 = (width - v30) * 0.5;
    v48.origin.double x = v34;
    v48.origin.double y = v27;
    v48.size.double width = v31;
    v48.size.double height = v33;
    double v35 = CGRectGetMaxY(v48) + 15.0;
    if (!a4) {
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v34, v27, v31, v33);
    }
  }
  else
  {
    double v35 = v27;
  }
  actionButton = self->_actionButton;
  if (actionButton)
  {
    -[UIButton sizeThatFits:](actionButton, "sizeThatFits:", v19, height);
    double v38 = v37;
    double v40 = v39;
    double v41 = (width - v37) * 0.5;
    v49.origin.double x = v41;
    v49.origin.double y = v35;
    v49.size.double width = v38;
    v49.size.double height = v40;
    CGFloat MaxY = CGRectGetMaxY(v49);
    if (!a4) {
      -[UIButton setFrame:](self->_actionButton, "setFrame:", v41, v35, v38, v40);
    }
  }
  else
  {
    CGFloat MaxY = v35;
  }
  double v43 = width;
  double v44 = MaxY;
  result.double height = v44;
  result.double width = v43;
  return result;
}

- (void)setIcon:(id)a3
{
  [(UIImageView *)self->_iconImageView setImage:a3];

  [(PKPaymentSetupNoResultsView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  double v4 = [(UILabel *)self->_titleLabel text];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_titleLabel setText:v6];
    [(PKPaymentSetupNoResultsView *)self setNeedsLayout];
  }
}

- (void)setSubtitle:(id)a3
{
  id v6 = a3;
  double v4 = [(UILabel *)self->_subtitleLabel text];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_subtitleLabel setText:v6];
    [(PKPaymentSetupNoResultsView *)self setNeedsLayout];
  }
}

- (void)setActionButtonTitle:(id)a3 addTarget:(id)a4 action:(SEL)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = v18;
  id v10 = v8;
  actionButton = self->_actionButton;
  if (v18 && v10)
  {
    if (!actionButton)
    {
      double v12 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      int v13 = self->_actionButton;
      self->_actionButton = v12;

      [(UIButton *)self->_actionButton setExclusiveTouch:1];
      double v14 = [(UIButton *)self->_actionButton titleLabel];
      [v14 setNumberOfLines:0];
      double v15 = [MEMORY[0x1E4FB1618] labelColor];
      [v14 setTextColor:v15];

      [v14 setTextAlignment:1];
      double v16 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
      [v14 setFont:v16];

      [(PKPaymentSetupNoResultsView *)self addSubview:self->_actionButton];
      id v9 = v18;
      actionButton = self->_actionButton;
    }
    [(UIButton *)actionButton setTitle:v9 forState:0];
    [(UIButton *)self->_actionButton addTarget:v10 action:a5 forControlEvents:0x2000];
  }
  else
  {
    [(UIButton *)actionButton removeFromSuperview];
    v17 = self->_actionButton;
    self->_actionButton = 0;
  }
  [(PKPaymentSetupNoResultsView *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end