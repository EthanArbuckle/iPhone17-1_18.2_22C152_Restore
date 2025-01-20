@interface PNPWizardScratchpadInkView
+ (double)preferredHeight;
+ (void)initialize;
- (BOOL)pressed;
- (BOOL)selected;
- (CGSize)intrinsicContentSize;
- (PKInk)ink;
- (PNPWizardScratchpadInkView)initWithIndex:(int64_t)a3;
- (void)layoutSubviews;
- (void)setPressed:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PNPWizardScratchpadInkView

+ (double)preferredHeight
{
  return 68.0;
}

- (void)layoutSubviews
{
  [(PNPWizardScratchpadInkView *)self bounds];
  v3 = [(UIImageView *)self->_imageView image];
  [v3 size];

  [(PNPWizardScratchpadInkView *)self bounds];
  v4 = [(PNPWizardScratchpadInkView *)self traitCollection];
  [v4 displayScale];
  uint64_t v13 = v5;
  UIRectCenteredXInRectScale();
  double v7 = v6;
  double v9 = v8;

  if ([(PNPWizardScratchpadInkView *)self selected]) {
    double v10 = 68.0;
  }
  else {
    double v10 = 50.0;
  }
  if ([(PNPWizardScratchpadInkView *)self pressed]) {
    double v10 = v10 + -6.0;
  }
  [(PNPWizardScratchpadInkView *)self bounds];
  imageView = self->_imageView;
  -[UIImageView setFrame:](imageView, "setFrame:", v7, v11 - v10, v9, v10);
}

- (CGSize)intrinsicContentSize
{
  v2 = [(UIImageView *)self->_imageView image];
  [v2 size];
  double v4 = v3;
  [(id)objc_opt_class() preferredHeight];
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  [(PNPWizardScratchpadInkView *)self setNeedsLayout];
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
  [(PNPWizardScratchpadInkView *)self setNeedsLayout];
}

- (PNPWizardScratchpadInkView)initWithIndex:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PNPWizardScratchpadInkView;
  double v4 = [(PNPWizardScratchpadInkView *)&v12 init];
  double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
  imageView = v4->_imageView;
  v4->_imageView = v5;

  double v7 = v4->_imageView;
  double v8 = [(id)__PNPWizardScratchpadInkViewInkImages objectAtIndex:a3];
  [(UIImageView *)v7 setImage:v8];

  [(PNPWizardScratchpadInkView *)v4 addSubview:v4->_imageView];
  uint64_t v9 = [(id)__PNPWizardScratchpadInkViewInks objectAtIndex:a3];
  ink = v4->_ink;
  v4->_ink = (PKInk *)v9;

  return v4;
}

+ (void)initialize
{
  v39[8] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  double v3 = (void *)__PNPWizardScratchpadInkViewInkImages;
  __PNPWizardScratchpadInkViewInkImages = v2;

  uint64_t v4 = [MEMORY[0x263EFF980] array];
  double v5 = (void *)__PNPWizardScratchpadInkViewInks;
  __PNPWizardScratchpadInkViewInks = v4;

  double v6 = [MEMORY[0x263F1C550] systemRedColor];
  v39[0] = v6;
  double v7 = [MEMORY[0x263F1C550] systemRedColor];
  v39[1] = v7;
  double v8 = [MEMORY[0x263F1C550] systemOrangeColor];
  v39[2] = v8;
  uint64_t v9 = [MEMORY[0x263F1C550] systemYellowColor];
  v39[3] = v9;
  double v10 = [MEMORY[0x263F1C550] systemBlueColor];
  v39[4] = v10;
  double v11 = [MEMORY[0x263F1C550] systemPurpleColor];
  v39[5] = v11;
  objc_super v12 = [MEMORY[0x263F1C550] systemOrangeColor];
  v39[6] = v12;
  uint64_t v13 = [MEMORY[0x263F1C550] systemPinkColor];
  v39[7] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:8];

  uint64_t v15 = *MEMORY[0x263F14CB0];
  v32[0] = *MEMORY[0x263F14CA8];
  v32[1] = v15;
  uint64_t v33 = *MEMORY[0x263F14C98];
  uint64_t v34 = v32[0];
  uint64_t v35 = v33;
  uint64_t v36 = v32[0];
  uint64_t v16 = *MEMORY[0x263F14CA0];
  uint64_t v37 = v32[0];
  uint64_t v38 = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:8];
  for (uint64_t i = 0; i != 8; ++i)
  {
    v19 = [&unk_26ECE79A8 objectAtIndex:i];
    v20 = [v14 objectAtIndex:i];
    v21 = [v17 objectAtIndex:i];
    v22 = (void *)MEMORY[0x263F1C6B0];
    v23 = PencilPairingUIBundle();
    v24 = [v22 imageNamed:v19 inBundle:v23 compatibleWithTraitCollection:0];

    [(id)__PNPWizardScratchpadInkViewInkImages addObject:v24];
    v25 = [MEMORY[0x263F14B48] inkWithIdentifier:v21 color:v20];
    [(id)__PNPWizardScratchpadInkViewInks addObject:v25];
    double v26 = *(double *)&__PNPWizardScratchpadInkViewInkHeight;
    [v24 size];
    if (v26 >= v27) {
      *(double *)&uint64_t v28 = v27;
    }
    else {
      *(double *)&uint64_t v28 = v26;
    }
    __PNPWizardScratchpadInkViewInkHeight = v28;
    double v29 = *(double *)&__PNPWizardScratchpadInkViewInkSelectedHeight;
    [v24 size];
    if (v29 >= v30) {
      *(double *)&uint64_t v31 = v29;
    }
    else {
      *(double *)&uint64_t v31 = v30;
    }
    __PNPWizardScratchpadInkViewInkSelectedHeight = v31;
  }
}

- (PKInk)ink
{
  return self->_ink;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end