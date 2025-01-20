@interface STHorizontalDivider
- (NSLayoutXAxisAnchor)horizontalLineRightAnchor;
- (STHorizontalDivider)initWithTintColor:(id)a3;
- (UIImage)horizontalLineImage;
- (UIImageView)horizontalLine;
- (UILabel)label;
@end

@implementation STHorizontalDivider

- (STHorizontalDivider)initWithTintColor:(id)a3
{
  v42[6] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)STHorizontalDivider;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v7 = a3;
  v8 = -[STHorizontalDivider initWithFrame:](&v41, sel_initWithFrame_, v3, v4, v5, v6);
  id v9 = objc_alloc(MEMORY[0x263F82828]);
  v10 = [(STHorizontalDivider *)v8 horizontalLineImage];
  uint64_t v11 = [v9 initWithImage:v10];
  horizontalLine = v8->_horizontalLine;
  v8->_horizontalLine = (UIImageView *)v11;

  [(UIImageView *)v8->_horizontalLine setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)v8->_horizontalLine setTintColor:v7];

  uint64_t v13 = [(UIImageView *)v8->_horizontalLine rightAnchor];
  horizontalLineRightAnchor = v8->_horizontalLineRightAnchor;
  v8->_horizontalLineRightAnchor = (NSLayoutXAxisAnchor *)v13;

  [(STHorizontalDivider *)v8 addSubview:v8->_horizontalLine];
  uint64_t v15 = objc_opt_new();
  label = v8->_label;
  v8->_label = (UILabel *)v15;

  [(UILabel *)v8->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [(UILabel *)v8->_label setFont:v17];

  v18 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  [(UILabel *)v8->_label setTextColor:v18];

  LODWORD(v19) = 1144750080;
  [(UILabel *)v8->_label setContentHuggingPriority:0 forAxis:v19];
  LODWORD(v20) = 1144766464;
  [(UILabel *)v8->_label setContentCompressionResistancePriority:0 forAxis:v20];
  [(STHorizontalDivider *)v8 addSubview:v8->_label];
  v33 = (void *)MEMORY[0x263F08938];
  v40 = [(UIImageView *)v8->_horizontalLine leftAnchor];
  v39 = [(STHorizontalDivider *)v8 leftAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v42[0] = v38;
  v37 = [(UIImageView *)v8->_horizontalLine centerYAnchor];
  v36 = [(STHorizontalDivider *)v8 centerYAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v42[1] = v35;
  v34 = [(UILabel *)v8->_label topAnchor];
  v32 = [(STHorizontalDivider *)v8 topAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v42[2] = v31;
  v21 = [(UILabel *)v8->_label leftAnchor];
  v22 = [v21 constraintEqualToAnchor:v8->_horizontalLineRightAnchor constant:4.0];
  v42[3] = v22;
  v23 = [(UILabel *)v8->_label bottomAnchor];
  v24 = [(STHorizontalDivider *)v8 bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v42[4] = v25;
  v26 = [(UILabel *)v8->_label rightAnchor];
  v27 = [(STHorizontalDivider *)v8 rightAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v42[5] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:6];
  [v33 activateConstraints:v29];

  return v8;
}

- (UIImage)horizontalLineImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__STHorizontalDivider_horizontalLineImage__block_invoke;
  block[3] = &unk_264766F30;
  block[4] = self;
  if (horizontalLineImage_onceToken != -1) {
    dispatch_once(&horizontalLineImage_onceToken, block);
  }
  return (UIImage *)(id)horizontalLineImage_horizontalLineImage;
}

void __42__STHorizontalDivider_horizontalLineImage__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  [v1 displayScale];
  double v3 = 1.0 / v2;

  double v4 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v3, v3);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__STHorizontalDivider_horizontalLineImage__block_invoke_2;
  v11[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v11[4] = v3;
  uint64_t v5 = [v4 imageWithActions:v11];
  double v6 = (void *)horizontalLineImage_horizontalLineImage;
  horizontalLineImage_horizontalLineImage = v5;

  uint64_t v7 = objc_msgSend((id)horizontalLineImage_horizontalLineImage, "resizableImageWithCapInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  v8 = (void *)horizontalLineImage_horizontalLineImage;
  horizontalLineImage_horizontalLineImage = v7;

  uint64_t v9 = [(id)horizontalLineImage_horizontalLineImage imageWithRenderingMode:2];
  v10 = (void *)horizontalLineImage_horizontalLineImage;
  horizontalLineImage_horizontalLineImage = v9;
}

void __42__STHorizontalDivider_horizontalLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (CGContext *)[a2 CGContext];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = v4;

  CGContextFillRect(v3, *(CGRect *)&v5);
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 408, 1);
}

- (NSLayoutXAxisAnchor)horizontalLineRightAnchor
{
  return (NSLayoutXAxisAnchor *)objc_getProperty(self, a2, 416, 1);
}

- (UIImageView)horizontalLine
{
  return (UIImageView *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalLine, 0);
  objc_storeStrong((id *)&self->_horizontalLineRightAnchor, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end