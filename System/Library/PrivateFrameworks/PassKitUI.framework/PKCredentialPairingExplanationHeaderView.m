@interface PKCredentialPairingExplanationHeaderView
- (BOOL)useCompactLayout;
- (CGSize)sizeThatFits:(CGSize)result;
- (PKCredentialPairingExplanationHeaderView)initWithConfiguration:(id)a3;
- (id)_fallbackPairingImage;
- (void)_loadPairingImage;
- (void)_setPairingImage:(id)a3;
- (void)_showLoadingContent;
- (void)layoutSubviews;
- (void)setUseCompactLayout:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKCredentialPairingExplanationHeaderView

- (PKCredentialPairingExplanationHeaderView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCredentialPairingExplanationHeaderView;
  v6 = [(PKCredentialPairingExplanationHeaderView *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v7->_imageView;
    v7->_imageView = v8;

    [(PKCredentialPairingExplanationHeaderView *)v7 addSubview:v7->_imageView];
    v10 = v7->_imageView;
    v11 = PKProvisioningBackgroundColor();
    [(UIImageView *)v10 setBackgroundColor:v11];

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    spinner = v7->_spinner;
    v7->_spinner = (UIActivityIndicatorView *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v15 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
    uint64_t v16 = [v14 initWithEffect:v15];
    blurView = v7->_blurView;
    v7->_blurView = (UIVisualEffectView *)v16;

    [(PKCredentialPairingExplanationHeaderView *)v7 _showLoadingContent];
    [(PKCredentialPairingExplanationHeaderView *)v7 _loadPairingImage];
    v18 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
    [(PKCredentialPairingExplanationHeaderView *)v7 setBackgroundColor:v18];

    [(PKCredentialPairingExplanationHeaderView *)v7 setClipsToBounds:1];
    [(PKCredentialPairingExplanationHeaderView *)v7 setUseCompactLayout:(unint64_t)PKUIGetMinScreenType() < 4];
  }

  return v7;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PKCredentialPairingExplanationHeaderView;
  [(PKCredentialPairingExplanationHeaderView *)&v17 layoutSubviews];
  v3 = [(UIImageView *)self->_imageView image];
  [(PKCredentialPairingExplanationHeaderView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 size];
  PKSizeAspectFill();
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v12 + 0.0, v13 + 1.0, v15, v14 + -2.0);
  [(UIActivityIndicatorView *)self->_spinner frame];
  spinner = self->_spinner;
  PKSizeAlignedInRect();
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:", v5, v7, v9, v11);
}

- (void)_loadPairingImage
{
  if (([(PKAddCarKeyPassConfiguration *)self->_configuration supportedRadioTechnologies] & 2) != 0) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  double v4 = [(PKCredentialPairingExplanationHeaderView *)self traitCollection];
  BOOL v5 = [v4 userInterfaceStyle] == 2;

  double v6 = [(PKAddCarKeyPassConfiguration *)self->_configuration provisioningTemplateIdentifier];
  double v7 = [MEMORY[0x1E4F84EC8] sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PKCredentialPairingExplanationHeaderView__loadPairingImage__block_invoke;
  v8[3] = &unk_1E59D5E48;
  v8[4] = self;
  [v7 carPairingImageForRadioTechnology:v3 templateIdentifier:v6 darkMode:v5 completion:v8];
}

void __61__PKCredentialPairingExplanationHeaderView__loadPairingImage__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6];
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v3];
    [*(id *)(a1 + 32) _setPairingImage:v4];
  }
  else
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v3 = [v5 _fallbackPairingImage];
    [v5 _setPairingImage:v3];
  }
}

- (void)_showLoadingContent
{
  imageView = self->_imageView;
  double v4 = [(PKCredentialPairingExplanationHeaderView *)self _fallbackPairingImage];
  [(UIImageView *)imageView setImage:v4];

  [(UIVisualEffectView *)self->_blurView setAlpha:1.0];
  [(PKCredentialPairingExplanationHeaderView *)self addSubview:self->_blurView];
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  spinner = self->_spinner;

  [(PKCredentialPairingExplanationHeaderView *)self addSubview:spinner];
}

- (void)_setPairingImage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) stopAnimating];
  [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_3;
  v4[3] = &unk_1E59CB6D8;
  v4[4] = *(void *)(a1 + 32);
  [v2 transitionWithView:v3 duration:5242880 options:v5 animations:v4 completion:0.300000012];
}

uint64_t __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setImage:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 432);

  return [v2 setAlpha:0.0];
}

uint64_t __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 432) removeFromSuperview];
  }
  return result;
}

- (id)_fallbackPairingImage
{
  v2 = [(PKAddCarKeyPassConfiguration *)self->_configuration provisioningTemplateIdentifier];
  if ([v2 containsString:@"RHD"])
  {
    uint64_t v3 = @"CarPairingLightRHD";
    id v4 = @"CarPairingDarkRHD";
  }
  else
  {
    uint64_t v3 = @"CarPairingLightLHD";
    id v4 = @"CarPairingDarkLHD";
  }
  id v5 = PKUIDynamicImageNamed(v3, v4);

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = dbl_1A0444290[!self->_useCompactLayout];
  result.height = v3;
  return result;
}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    [(PKCredentialPairingExplanationHeaderView *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(PKCredentialPairingExplanationHeaderView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [(PKCredentialPairingExplanationHeaderView *)self _loadPairingImage];
  }
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end