@interface STDashedVerticalDivider
- (BOOL)isSelected;
- (NSLayoutConstraint)labelLeftConstraint;
- (NSLayoutXAxisAnchor)dashedLineCenterXAnchor;
- (NSLayoutYAxisAnchor)labelTopAnchor;
- (NSString)labelText;
- (STDashedVerticalDivider)initWithTintColor:(id)a3;
- (UIImage)dashedLineImage;
- (UIImageView)dashedLine;
- (UILabel)label;
- (void)setDashedLine:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelLeftConstraint:(id)a3;
- (void)setLabelText:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation STDashedVerticalDivider

- (STDashedVerticalDivider)initWithTintColor:(id)a3
{
  v60[8] = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)STDashedVerticalDivider;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v7 = a3;
  v8 = -[STDashedVerticalDivider initWithFrame:](&v59, sel_initWithFrame_, v3, v4, v5, v6);
  id v9 = objc_alloc(MEMORY[0x263F82828]);
  v10 = [(STDashedVerticalDivider *)v8 dashedLineImage];
  uint64_t v11 = [v9 initWithImage:v10];
  dashedLine = v8->_dashedLine;
  v8->_dashedLine = (UIImageView *)v11;

  [(UIImageView *)v8->_dashedLine setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)v8->_dashedLine setTintColor:v7];

  [(STDashedVerticalDivider *)v8 addSubview:v8->_dashedLine];
  uint64_t v13 = objc_opt_new();
  label = v8->_label;
  v8->_label = (UILabel *)v13;

  [(UILabel *)v8->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [(UILabel *)v8->_label setFont:v15];

  v16 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  [(UILabel *)v8->_label setTextColor:v16];

  LODWORD(v17) = 1144750080;
  [(UILabel *)v8->_label setContentCompressionResistancePriority:0 forAxis:v17];
  LODWORD(v18) = 1144750080;
  [(UILabel *)v8->_label setContentHuggingPriority:1 forAxis:v18];
  LODWORD(v19) = 1144766464;
  [(UILabel *)v8->_label setContentCompressionResistancePriority:1 forAxis:v19];
  [(STDashedVerticalDivider *)v8 addSubview:v8->_label];
  v20 = [(UILabel *)v8->_label bottomAnchor];
  v21 = [(UIImageView *)v8->_dashedLine bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(UILabel *)v8->_label rightAnchor];
  v24 = [(STDashedVerticalDivider *)v8 rightAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  uint64_t v26 = [(UILabel *)v8->_label topAnchor];
  labelTopAnchor = v8->_labelTopAnchor;
  v8->_labelTopAnchor = (NSLayoutYAxisAnchor *)v26;

  uint64_t v28 = [(UIImageView *)v8->_dashedLine centerXAnchor];
  dashedLineCenterXAnchor = v8->_dashedLineCenterXAnchor;
  v8->_dashedLineCenterXAnchor = (NSLayoutXAxisAnchor *)v28;

  v30 = [(UILabel *)v8->_label leftAnchor];
  v31 = [(UIImageView *)v8->_dashedLine rightAnchor];
  uint64_t v32 = [v30 constraintEqualToAnchor:v31];
  labelLeftConstraint = v8->_labelLeftConstraint;
  v8->_labelLeftConstraint = (NSLayoutConstraint *)v32;

  v49 = (void *)MEMORY[0x263F08938];
  v60[0] = v8->_labelLeftConstraint;
  v58 = [(UILabel *)v8->_label bottomAnchor];
  v57 = [(UIImageView *)v8->_dashedLine bottomAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v60[1] = v56;
  v55 = [(UILabel *)v8->_label rightAnchor];
  v54 = [(STDashedVerticalDivider *)v8 rightAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v60[2] = v53;
  v52 = [(UIImageView *)v8->_dashedLine topAnchor];
  v51 = [(STDashedVerticalDivider *)v8 topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v60[3] = v50;
  v48 = [(UIImageView *)v8->_dashedLine leftAnchor];
  v47 = [(STDashedVerticalDivider *)v8 leftAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v60[4] = v46;
  v45 = [(UIImageView *)v8->_dashedLine bottomAnchor];
  v44 = [(STDashedVerticalDivider *)v8 bottomAnchor];
  v34 = [v45 constraintEqualToAnchor:v44];
  v60[5] = v34;
  v35 = [(UIImageView *)v8->_dashedLine widthAnchor];
  v36 = [(STDashedVerticalDivider *)v8 traitCollection];
  [v36 displayScale];
  v38 = [v35 constraintEqualToConstant:1.0 / v37];
  v60[6] = v38;
  v39 = [(UILabel *)v8->_label rightAnchor];
  v40 = [(STDashedVerticalDivider *)v8 rightAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v60[7] = v41;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:8];
  [v49 activateConstraints:v42];

  return v8;
}

- (void)setLabelText:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  labelText = self->_labelText;
  self->_labelText = v5;

  id v7 = [(STDashedVerticalDivider *)self label];
  [v7 setText:v4];

  uint64_t v8 = [v4 length];
  if (v8) {
    double v9 = 4.0;
  }
  else {
    double v9 = 0.0;
  }
  id v10 = [(STDashedVerticalDivider *)self labelLeftConstraint];
  [v10 setConstant:v9];
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  if (a3) {
    [MEMORY[0x263F825C8] systemDarkMidGrayColor];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  }
  id v4 = [(STDashedVerticalDivider *)self label];
  [v4 setTextColor:v5];
}

- (UIImage)dashedLineImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__STDashedVerticalDivider_dashedLineImage__block_invoke;
  block[3] = &unk_264766F30;
  block[4] = self;
  if (dashedLineImage_onceToken != -1) {
    dispatch_once(&dashedLineImage_onceToken, block);
  }
  return (UIImage *)(id)dashedLineImage_dashedLineImage;
}

void __42__STDashedVerticalDivider_dashedLineImage__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  [v1 displayScale];
  double v3 = 1.0 / v2;

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v3, 4.0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__STDashedVerticalDivider_dashedLineImage__block_invoke_2;
  v11[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v11[4] = v3;
  uint64_t v5 = [v4 imageWithActions:v11];
  double v6 = (void *)dashedLineImage_dashedLineImage;
  dashedLineImage_dashedLineImage = v5;

  uint64_t v7 = objc_msgSend((id)dashedLineImage_dashedLineImage, "resizableImageWithCapInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  uint64_t v8 = (void *)dashedLineImage_dashedLineImage;
  dashedLineImage_dashedLineImage = v7;

  uint64_t v9 = [(id)dashedLineImage_dashedLineImage imageWithRenderingMode:2];
  id v10 = (void *)dashedLineImage_dashedLineImage;
  dashedLineImage_dashedLineImage = v9;
}

void __42__STDashedVerticalDivider_dashedLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double v3 = (CGContext *)[a2 CGContext];
  CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 32));
  *(_OWORD *)lengths = xmmword_225C13A40;
  CGContextSetLineDash(v3, 0.0, lengths, 2uLL);
  v4.CGFloat x = *(double *)(a1 + 32) * 0.5;
  v4.y = 0.0;
  CGFloat x = v4.x;
  uint64_t v6 = 0x4010000000000000;
  CGContextAddLines(v3, &v4, 2uLL);
  CGContextStrokeLineSegments(v3, &v4, 2uLL);
}

- (NSString)labelText
{
  return self->_labelText;
}

- (NSLayoutXAxisAnchor)dashedLineCenterXAnchor
{
  return (NSLayoutXAxisAnchor *)objc_getProperty(self, a2, 424, 1);
}

- (NSLayoutYAxisAnchor)labelTopAnchor
{
  return (NSLayoutYAxisAnchor *)objc_getProperty(self, a2, 432, 1);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)dashedLine
{
  return self->_dashedLine;
}

- (void)setDashedLine:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSLayoutConstraint)labelLeftConstraint
{
  return self->_labelLeftConstraint;
}

- (void)setLabelLeftConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLeftConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dashedLine, 0);
  objc_storeStrong((id *)&self->_labelTopAnchor, 0);
  objc_storeStrong((id *)&self->_dashedLineCenterXAnchor, 0);

  objc_storeStrong((id *)&self->_labelText, 0);
}

@end