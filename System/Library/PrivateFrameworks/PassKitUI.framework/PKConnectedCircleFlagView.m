@interface PKConnectedCircleFlagView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKConnectedCircleFlagView)init;
- (PKConnectedCircleFlagView)initWithFlagBackgroundColor:(id)a3;
- (UIColor)flagBackgroundColor;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation PKConnectedCircleFlagView

- (PKConnectedCircleFlagView)init
{
  return 0;
}

- (PKConnectedCircleFlagView)initWithFlagBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = -[PKConnectedCircleFlagView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flagBackgroundColor, a3);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v8;

    [(UIView *)v7->_backgroundView setBackgroundColor:v7->_flagBackgroundColor];
    [(PKConnectedCircleFlagView *)v7 addSubview:v7->_backgroundView];
    id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
    v11 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    v12 = PKPayLaterDisputeFlagIconImageWithConfiguration();
    uint64_t v13 = [v10 initWithImage:v12];
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v13;

    [(PKConnectedCircleFlagView *)v7 addSubview:v7->_imageView];
  }

  return v7;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKConnectedCircleFlagView;
  [(PKConnectedCircleFlagView *)&v3 layoutSubviews];
  [(PKConnectedCircleFlagView *)self bounds];
  -[PKConnectedCircleFlagView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKConnectedCircleFlagView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  PKRectCenteredIntegralRect();
  double v23 = v7;
  double v24 = v6;
  double v9 = v8;
  double v11 = v10;
  PKRectCenteredIntegralRect();
  if (!a4)
  {
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    double v19 = v15;
    v20 = [(UIView *)self->_backgroundView layer];
    [v20 setCornerRadius:10.0];

    -[UIView setFrame:](self->_backgroundView, "setFrame:", v24, v23, v9, v11);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v16, v17, v18, v19);
  }
  double v21 = 24.0;
  double v22 = 24.0;
  result.height = v22;
  result.width = v21;
  return result;
}

- (UIColor)flagBackgroundColor
{
  return self->_flagBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end