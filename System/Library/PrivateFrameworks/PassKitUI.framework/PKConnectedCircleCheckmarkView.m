@interface PKConnectedCircleCheckmarkView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKConnectedCircleCheckmarkView)init;
- (PKConnectedCircleCheckmarkView)initWithCheckmarkTintColor:(id)a3 checkmarkBackgroundColor:(id)a4;
- (UIColor)checkmarkBackgroundColor;
- (UIColor)checkmarkTintColor;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation PKConnectedCircleCheckmarkView

- (PKConnectedCircleCheckmarkView)init
{
  return 0;
}

- (PKConnectedCircleCheckmarkView)initWithCheckmarkTintColor:(id)a3 checkmarkBackgroundColor:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = -[PKConnectedCircleCheckmarkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_checkmarkTintColor, a3);
    objc_storeStrong((id *)&v10->_checkmarkBackgroundColor, a4);
    v11 = (void *)MEMORY[0x1E4FB1830];
    v23[0] = v10->_checkmarkTintColor;
    v23[1] = v10->_checkmarkBackgroundColor;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v13 = [v11 configurationWithPaletteColors:v12];

    v14 = (void *)MEMORY[0x1E4FB1830];
    v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2990], (NSString *)*MEMORY[0x1E4FB27D0]);
    v16 = [v14 configurationWithFont:v15];

    v17 = [v13 configurationByApplyingConfiguration:v16];
    v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    v19 = [v18 imageWithConfiguration:v17];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v19];
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v20;

    [(PKConnectedCircleCheckmarkView *)v10 addSubview:v10->_imageView];
  }

  return v10;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKConnectedCircleCheckmarkView;
  [(PKConnectedCircleCheckmarkView *)&v3 layoutSubviews];
  [(PKConnectedCircleCheckmarkView *)self bounds];
  -[PKConnectedCircleCheckmarkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKConnectedCircleCheckmarkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  PKRectCenteredIntegralRect();
  double v7 = v6;
  double v9 = v8;
  if (!a4) {
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
  }
  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIColor)checkmarkTintColor
{
  return self->_checkmarkTintColor;
}

- (UIColor)checkmarkBackgroundColor
{
  return self->_checkmarkBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkBackgroundColor, 0);
  objc_storeStrong((id *)&self->_checkmarkTintColor, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end