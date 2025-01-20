@interface PKRewardsEducationHeaderFooterView
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKRewardsEducationHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
@end

@implementation PKRewardsEducationHeaderFooterView

- (PKRewardsEducationHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKRewardsEducationHeaderFooterView;
  v3 = [(PKRewardsEducationHeaderFooterView *)&v11 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    labelView = v3->_labelView;
    v3->_labelView = (UILabel *)v5;

    v7 = v3->_labelView;
    v8 = PKLocalizedFeatureString();
    [(UILabel *)v7 setText:v8];

    [(UILabel *)v3->_labelView setTextAlignment:1];
    v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB2788], 0, 0, *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v3->_labelView setFont:v9];
    [(UILabel *)v3->_labelView setNumberOfLines:0];
    [(PKRewardsEducationHeaderFooterView *)v3 addSubview:v3->_labelView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKRewardsEducationHeaderFooterView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKRewardsEducationHeaderFooterView;
  [(PKRewardsEducationHeaderFooterView *)&v3 layoutSubviews];
  [(PKRewardsEducationHeaderFooterView *)self bounds];
  [(PKRewardsEducationHeaderFooterView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = a3.size.width + -40.0;
  double v8 = a3.size.height + -20.0;
  -[UILabel sizeThatFits:](self->_labelView, "sizeThatFits:", a3.size.width + -40.0, a3.size.height + -20.0);
  double v10 = v9;
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_labelView, "setFrame:", x + 20.0, y + 0.0, v7, v8);
  }
  double v11 = v10 + 0.0 + 20.0;
  double v12 = width;
  result.height = v11;
  result.CGFloat width = v12;
  return result;
}

- (void).cxx_destruct
{
}

@end