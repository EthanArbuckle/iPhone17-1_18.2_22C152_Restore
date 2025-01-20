@interface PKPassShareActivationExternalKeyEducationView
- (CGSize)sizeThatFits:(CGSize)result;
- (PKPassShareActivationExternalKeyEducationView)init;
- (PKPassShareActivationExternalKeyEducationView)initWithContinueButtonText:(id)a3 delegate:(id)a4;
- (UIImage)educationImage;
- (void)_nextButtonPressed;
- (void)layoutSubviews;
- (void)setEducationImage:(id)a3;
@end

@implementation PKPassShareActivationExternalKeyEducationView

- (PKPassShareActivationExternalKeyEducationView)init
{
  return 0;
}

- (PKPassShareActivationExternalKeyEducationView)initWithContinueButtonText:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPassShareActivationExternalKeyEducationView;
  v8 = [(PKPassShareActivationExternalKeyEducationView *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    educationImageView = v9->_educationImageView;
    v9->_educationImageView = (UIImageView *)v10;

    [(UIImageView *)v9->_educationImageView setContentMode:1];
    [(PKPassShareActivationExternalKeyEducationView *)v9 addSubview:v9->_educationImageView];
    uint64_t v20 = 0x4024000000000000;
    long long v21 = xmmword_1A040E960;
    int64x2_t v22 = vdupq_n_s64(2uLL);
    v12 = [[PKContinuousButton alloc] initWithConfiguration:&v20];
    nextButton = v9->_nextButton;
    v9->_nextButton = v12;

    v14 = (void *)MEMORY[0x1E4FB14D8];
    v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    v16 = objc_msgSend(v14, "pkui_plainConfigurationWithTitle:font:", v6, v15);

    v17 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [v16 setBaseForegroundColor:v17];

    objc_msgSend(v16, "setContentInsets:", 8.0, 25.0, 8.0, 25.0);
    v18 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v16 setBaseBackgroundColor:v18];

    [v16 setTitleAlignment:2];
    [(PKContinuousButton *)v9->_nextButton setConfiguration:v16];
    [(PKContinuousButton *)v9->_nextButton addTarget:v9 action:sel__nextButtonPressed forControlEvents:64];
    [(PKPassShareActivationExternalKeyEducationView *)v9 addSubview:v9->_nextButton];
  }
  return v9;
}

- (void)setEducationImage:(id)a3
{
  [(UIImageView *)self->_educationImageView setImage:a3];

  [(PKPassShareActivationExternalKeyEducationView *)self setNeedsLayout];
}

- (UIImage)educationImage
{
  return [(UIImageView *)self->_educationImageView image];
}

- (void)_nextButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained externalKeyEdicationViewDidSelectNext:self];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 200.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  [(PKPassShareActivationExternalKeyEducationView *)self bounds];
  CGRect remainder = v5;
  memset(&v3, 0, sizeof(v3));
  CGRectDivide(v5, &v3, &remainder, 111.0, CGRectMinYEdge);
  -[UIImageView setFrame:](self->_educationImageView, "setFrame:", *(_OWORD *)&v3.origin, *(_OWORD *)&v3.size);
  CGRectDivide(remainder, &v3, &remainder, 24.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v3, &remainder, 50.0, CGRectMinYEdge);
  -[PKContinuousButton setFrame:](self->_nextButton, "setFrame:", *(_OWORD *)&v3.origin, *(_OWORD *)&v3.size);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_educationImageView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end