@interface PKAppleHomeKeyCardView
- (PKAppleHomeKeyCardView)initWithStyle:(int64_t)a3 text:(id)a4 font:(id)a5 textColor:(id)a6;
- (void)layoutSubviews;
@end

@implementation PKAppleHomeKeyCardView

- (PKAppleHomeKeyCardView)initWithStyle:(int64_t)a3 text:(id)a4 font:(id)a5 textColor:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 URLForResource:@"homekey-metalness" withExtension:@"png"];
  v15 = [v13 URLForResource:@"homekey-normal" withExtension:@"png"];
  if ((unint64_t)a3 > 3)
  {
    v18 = 0;
LABEL_22:
    v28 = 0;
    goto LABEL_30;
  }
  int v16 = dword_21EEE7860[a3];
  v17 = [v13 URLForResource:off_2644F8EB0[a3] withExtension:@"png"];
  v18 = v17;
  if (v17) {
    BOOL v19 = v14 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19 || v15 == 0) {
    goto LABEL_22;
  }
  v21 = (CGImage *)PKCreateCGImage(v17);
  if (!v21)
  {
    v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEBD000, v22, OS_LOG_TYPE_DEFAULT, "PKAppleHomeKeyCardView: could not load diffuse image.", buf, 2u);
    }
  }
  id v34 = v10;
  v23 = (CGImage *)PKCreateCGImage(v14);
  if (!v23)
  {
    v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEBD000, v24, OS_LOG_TYPE_DEFAULT, "PKAppleHomeKeyCardView: could not load metalness image.", buf, 2u);
    }
  }
  uint64_t v25 = PKCreateCGImage(v15);
  v26 = (CGImage *)v25;
  if (!v25)
  {
    v33 = v21;
    v29 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEBD000, v29, OS_LOG_TYPE_DEFAULT, "PKAppleHomeKeyCardView: could not load normal image.", buf, 2u);
    }

    v21 = v33;
    goto LABEL_26;
  }
  if (!v21 || !v23)
  {
LABEL_26:

    v27 = 0;
    goto LABEL_27;
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __60__PKAppleHomeKeyCardView_initWithStyle_text_font_textColor___block_invoke;
  v35[3] = &__block_descriptor_60_e51___PKTexturedCardRenderer_16__0__PKMetalRenderLoop_8l;
  v35[4] = v21;
  v35[5] = v23;
  v35[6] = v25;
  int v36 = v16;
  v27 = -[PKTexturedCardView _initWithPixelFormat:renderer:]((id *)&self->super.super.super.super.isa, 80, v35);
LABEL_27:
  CGImageRelease(v21);
  CGImageRelease(v23);
  CGImageRelease(v26);
  id v10 = v34;
  if (v27)
  {
    id v30 = objc_alloc_init(MEMORY[0x263F1C768]);
    id v31 = v27[57];
    v27[57] = v30;

    [v27[57] setNumberOfLines:1];
    [v27[57] setFont:v11];
    [v27[57] setText:v34];
    [v27[57] setTextColor:v12];
    [v27[57] setAdjustsFontSizeToFitWidth:1];
    [v27[57] setMinimumScaleFactor:0.8];
    [v27 addSubview:v27[57]];
  }
  self = v27;
  v28 = self;
LABEL_30:

  return v28;
}

id *__60__PKAppleHomeKeyCardView_initWithStyle_text_font_textColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setColorSpace:PKColorSpaceStandardRGB()];
  v4 = -[PKTexturedCardRenderer initWithStyle:renderLoop:diffuse:metalness:normal:]((id *)[PKTexturedCardRenderer alloc], 1uLL, v3, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));

  -[PKTexturedCardRenderer setLightIntensity:]((uint64_t)v4, *(float *)(a1 + 56));

  return v4;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)PKAppleHomeKeyCardView;
  [(PKTexturedCardView *)&v25 layoutSubviews];
  [(PKAppleHomeKeyCardView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  PKPaymentPassScaleFactor();
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __40__PKAppleHomeKeyCardView_layoutSubviews__block_invoke;
  v24[3] = &__block_descriptor_40_e8_d16__0d8l;
  v24[4] = v11;
  id v12 = (double (**)(double))MEMORY[0x223C3D8D0](v24);
  double v13 = v12[2](14.0);
  double v14 = ((double (*)(double (**)(double), double))v12[2])(v12, 20.0);
  double v15 = ((double (*)(double (**)(double), double))v12[2])(v12, 14.0);
  double v16 = v4 + v14;
  double v17 = v6 + v13;
  double v18 = v8 - (v14 + ((double (*)(double (**)(double), double))v12[2])(v12, 20.0));
  double v19 = v10 - (v13 + v15);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v18, v19);
  double v22 = v21;
  if (v20 >= v18) {
    double v23 = v18;
  }
  else {
    double v23 = v20;
  }
  v26.origin.x = v16;
  v26.origin.y = v17;
  v26.size.width = v18;
  v26.size.height = v19;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", CGRectGetMaxX(v26) - v23, v17, v23, v22);
}

uint64_t __40__PKAppleHomeKeyCardView_layoutSubviews__block_invoke()
{
  return PKFloatRoundToPixelWithScale();
}

- (void).cxx_destruct
{
}

@end