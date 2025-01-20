@interface PKDiscoveryCallToActionShelfView
- (BOOL)_isFooterWordmarkOnly;
- (BOOL)showActivityIndicator;
- (CGSize)_wordmarkAssetSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDiscoveryCallToActionShelfView)initWithShelf:(id)a3;
- (PKDiscoveryCardViewDelegate)delegate;
- (double)_desiredWordmarkAssetHeight;
- (void)_buttonPressed:(id)a3;
- (void)layoutSubviews;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setWordmarkAsset:(id)a3 animated:(BOOL)a4;
@end

@implementation PKDiscoveryCallToActionShelfView

- (PKDiscoveryCallToActionShelfView)initWithShelf:(id)a3
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v70.receiver = self;
  v70.super_class = (Class)PKDiscoveryCallToActionShelfView;
  v6 = [(PKDiscoveryCallToActionShelfView *)&v70 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_24;
  }
  objc_storeStrong((id *)&v6->_ctaShelf, a3);
  uint64_t v8 = [v5 callToAction];
  callToAction = v7->_callToAction;
  v7->_callToAction = (PKDiscoveryCallToAction *)v8;

  uint64_t v10 = [(PKDiscoveryCallToAction *)v7->_callToAction icon];
  icon = v7->_icon;
  v7->_icon = (PKDiscoveryMedia *)v10;

  uint64_t v12 = [(PKDiscoveryCallToAction *)v7->_callToAction wordmarkAsset];
  wordmarkAsset = v7->_wordmarkAsset;
  v7->_wordmarkAsset = (PKDiscoveryMedia *)v12;

  v7->_hasIcon = v7->_icon != 0;
  v14 = [(PKDiscoveryCallToAction *)v7->_callToAction localizedButtonText];
  if (v14) {
    BOOL v15 = [(PKDiscoveryCallToAction *)v7->_callToAction action] != 0;
  }
  else {
    BOOL v15 = 0;
  }
  v7->_hasButton = v15;

  v7->_hasWordmarkAsset = v7->_wordmarkAsset != 0;
  v16 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(PKDiscoveryCallToActionShelfView *)v7 setBackgroundColor:v16];

  uint64_t v17 = [(PKDiscoveryCallToAction *)v7->_callToAction localizedTitle];
  v18 = (double *)MEMORY[0x1E4F1DB28];
  v66 = (void *)v17;
  if (v17)
  {
    v7->_hasTitle = 1;
  }
  else
  {
    v19 = objc_msgSend(0, "pk_stringIfNotEmpty");
    v7->_hasTitle = v19 != 0;

    if (!v7->_hasTitle) {
      goto LABEL_9;
    }
  }
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
  titleLabel = v7->_titleLabel;
  v7->_titleLabel = (UILabel *)v20;

  [(UILabel *)v7->_titleLabel setText:v66];
  v22 = v7->_titleLabel;
  v23 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2990], 0);
  [(UILabel *)v22 setFont:v23];

  v24 = v7->_titleLabel;
  v25 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v24 setTextColor:v25];

  [(UILabel *)v7->_titleLabel setNumberOfLines:1];
  [(PKDiscoveryCallToActionShelfView *)v7 addSubview:v7->_titleLabel];
LABEL_9:
  v65 = [(PKDiscoveryCallToAction *)v7->_callToAction localizedSubtitle];
  if (v65)
  {
    v7->_hasSubtitle = 1;
LABEL_12:
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
    subtitleLabel = v7->_subtitleLabel;
    v7->_subtitleLabel = (UILabel *)v27;

    [(UILabel *)v7->_subtitleLabel setText:v65];
    v29 = v7->_subtitleLabel;
    v30 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [(UILabel *)v29 setFont:v30];

    v31 = v7->_subtitleLabel;
    v32 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v31 setTextColor:v32];

    [(UILabel *)v7->_subtitleLabel setNumberOfLines:2];
    [(UILabel *)v7->_subtitleLabel setTextAlignment:1];
    [(PKDiscoveryCallToActionShelfView *)v7 addSubview:v7->_subtitleLabel];
    goto LABEL_13;
  }
  v26 = objc_msgSend(0, "pk_stringIfNotEmpty");
  v7->_hasSubtitle = v26 != 0;

  if (v7->_hasSubtitle) {
    goto LABEL_12;
  }
LABEL_13:
  if (v7->_hasIcon)
  {
    v7->_iconSize = (CGSize)vdupq_n_s64(0x4056000000000000uLL);
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
    iconImageView = v7->_iconImageView;
    v7->_iconImageView = (UIImageView *)v33;

    v35 = v7->_iconImageView;
    v36 = (void *)MEMORY[0x1E4FB1618];
    v37 = [(PKDiscoveryMedia *)v7->_icon backgroundColor];
    v38 = objc_msgSend(v36, "pkui_colorWithPKColor:", v37);
    [(UIImageView *)v35 setBackgroundColor:v38];

    [(UIImageView *)v7->_iconImageView setContentMode:1];
    [(UIImageView *)v7->_iconImageView setAccessibilityIgnoresInvertColors:1];
    v39 = v7->_iconImageView;
    v40 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v39 setTintColor:v40];

    v41 = [(UIImageView *)v7->_iconImageView layer];
    [v41 setCornerRadius:14.0];
    [v41 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v41 setMasksToBounds:1];
    [(PKDiscoveryCallToActionShelfView *)v7 addSubview:v7->_iconImageView];
  }
  if (v7->_hasWordmarkAsset)
  {
    uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", *v18, v18[1], v18[2], v18[3]);
    wordmarkImageView = v7->_wordmarkImageView;
    v7->_wordmarkImageView = (UIImageView *)v42;

    v44 = v7->_wordmarkImageView;
    v45 = (void *)MEMORY[0x1E4FB1618];
    v46 = [(PKDiscoveryMedia *)v7->_wordmarkAsset backgroundColor];
    v47 = objc_msgSend(v45, "pkui_colorWithPKColor:", v46);
    [(UIImageView *)v44 setBackgroundColor:v47];

    [(UIImageView *)v7->_wordmarkImageView setContentMode:1];
    [(UIImageView *)v7->_wordmarkImageView setAccessibilityIgnoresInvertColors:1];
    v48 = v7->_wordmarkImageView;
    v49 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v48 setTintColor:v49];

    v50 = [(UIImageView *)v7->_wordmarkImageView layer];
    [v50 setMasksToBounds:1];

    [(PKDiscoveryCallToActionShelfView *)v7 addSubview:v7->_wordmarkImageView];
  }
  if (v7->_hasButton)
  {
    uint64_t v67 = 0;
    int64x2_t v68 = vdupq_n_s64(2uLL);
    int64x2_t v69 = v68;
    v51 = [[PKContinuousButton alloc] initWithConfiguration:&v67];
    button = v7->_button;
    v7->_button = v51;

    v53 = v7->_button;
    v54 = [MEMORY[0x1E4FB1618] linkColor];
    [(PKContinuousButton *)v53 setTintColor:v54];

    -[PKContinuousButton setContentEdgeInsets:](v7->_button, "setContentEdgeInsets:", 6.0, 18.0, 6.0, 18.0);
    v55 = v7->_button;
    v56 = [(PKDiscoveryCallToAction *)v7->_callToAction localizedButtonText];
    [(PKContinuousButton *)v55 setTitle:v56 forState:0];

    v57 = [(PKContinuousButton *)v7->_button titleLabel];
    v58 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27E8], 2, 0);
    [v57 setFont:v58];

    [(PKContinuousButton *)v7->_button addTarget:v7 action:sel__buttonPressed_ forControlEvents:64];
    -[PKContinuousButton _setTouchInsets:](v7->_button, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(PKDiscoveryCallToActionShelfView *)v7 addSubview:v7->_button];
  }
  if ([(PKDiscoveryCallToAction *)v7->_callToAction action] == 8)
  {
    v59 = [(PKDiscoveryCallToAction *)v7->_callToAction appStoreAppIdentifier];
    if (v59)
    {
      v60 = [PKLinkedApplication alloc];
      v71[0] = v59;
      v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      uint64_t v62 = [(PKLinkedApplication *)v60 initWithStoreIDs:v61 defaultLaunchURL:0];
      linkedApplication = v7->_linkedApplication;
      v7->_linkedApplication = (PKLinkedApplication *)v62;

      [(PKLinkedApplication *)v7->_linkedApplication addObserver:v7];
      [(PKDiscoveryCallToActionShelfView *)v7 setShowActivityIndicator:1];
      [(PKLinkedApplication *)v7->_linkedApplication reloadApplicationStateIfNecessary];
    }
  }
LABEL_24:

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(PKDiscoveryCallToActionShelfView *)self _isFooterWordmarkOnly])
  {
    [(PKDiscoveryCallToActionShelfView *)self _wordmarkAssetSize];
    v7.n128_f64[0] = v7.n128_f64[0] + 160.0;
  }
  else
  {
    if (self->_hasIcon) {
      double v9 = self->_iconSize.height + 20.0 + 16.0;
    }
    else {
      double v9 = 24.0;
    }
    if (self->_hasWordmarkAsset)
    {
      [(PKDiscoveryCallToActionShelfView *)self _wordmarkAssetSize];
      double v9 = v9 + v7.n128_f64[0] + 8.0;
    }
    if (self->_hasTitle)
    {
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
      double v9 = v9 + v7.n128_f64[0] + 2.0;
    }
    if (self->_hasSubtitle)
    {
      -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, height);
      double v9 = v9 + v7.n128_f64[0];
    }
    if (self->_hasButton)
    {
      -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
      double v9 = v9 + 11.0 + v7.n128_f64[0];
    }
    v7.n128_f64[0] = v9 + 24.0;
  }
  v6.n128_f64[0] = width;

  PKSizeRoundToPixel(v6, v7, v8);
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  [(PKDiscoveryCallToActionShelfView *)self bounds];
  double y = v70.origin.y;
  double width = v70.size.width;
  double height = v70.size.height;
  v6.n128_f64[0] = CGRectGetMidX(v70);
  double v11 = v6.n128_f64[0];
  if (self->_hasIcon)
  {
    v8.n128_u64[0] = *(void *)&self->_iconSize.width;
    v9.n128_u64[0] = *(void *)&self->_iconSize.height;
    v6.n128_f64[0] = v6.n128_f64[0] + v8.n128_f64[0] * -0.5;
    double v12 = y + 20.0;
    v7.n128_f64[0] = v12;
    PKRectRoundToPixel(v6, v7, v8, v9, v10);
    double v14 = v13;
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
    double y = v12 + v14;
  }
  if (self->_hasWordmarkAsset)
  {
    if ([(PKDiscoveryCallToActionShelfView *)self _isFooterWordmarkOnly])
    {
      double v15 = 80.0;
    }
    else
    {
      double v15 = 16.0;
      if (!self->_hasIcon) {
        double v15 = 24.0;
      }
    }
    double v16 = y + v15;
    [(PKDiscoveryCallToActionShelfView *)self _wordmarkAssetSize];
    double v18 = v11 + v17 * -0.5;
    [(PKDiscoveryCallToActionShelfView *)self _wordmarkAssetSize];
    v20.n128_u64[0] = v19;
    v22.n128_u64[0] = v21;
    v23.n128_f64[0] = v18;
    v24.n128_f64[0] = v16;
    PKRectRoundToPixel(v23, v24, v20, v22, v25);
    double v27 = v26;
    -[UIImageView setFrame:](self->_wordmarkImageView, "setFrame:");
    wordmarkImageView = self->_wordmarkImageView;
    [(PKDiscoveryMedia *)self->_wordmarkAsset height];
    double v30 = v29;
    [(PKDiscoveryCallToActionShelfView *)self _desiredWordmarkAssetHeight];
    [(UIImageView *)wordmarkImageView setContentScaleFactor:v30 / v31];
    double y = v16 + v27;
  }
  if (self->_hasTitle)
  {
    if (!self->_hasWordmarkAsset && !self->_hasIcon) {
      double y = y + 24.0;
    }
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
    PKSizeRoundToPixel(v32, v33, v34);
    v36.n128_f64[0] = v35;
    v38.n128_u64[0] = v37;
    v39.n128_f64[0] = v11 + v35 * -0.5;
    v40.n128_f64[0] = y;
    PKRectRoundToPixel(v39, v40, v36, v38, v41);
    double v43 = v42;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    double v44 = v43 + 2.0;
  }
  else
  {
    double v44 = 8.0;
  }
  double v45 = y + v44;
  if (self->_hasSubtitle)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width + -40.0, height);
    PKSizeRoundToPixel(v46, v47, v48);
    v50.n128_f64[0] = v49;
    v52.n128_u64[0] = v51;
    v53.n128_f64[0] = v11 + v49 * -0.5;
    v54.n128_f64[0] = v45;
    PKRectRoundToPixel(v53, v54, v50, v52, v55);
    double v57 = v56;
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
    double v45 = v45 + v57;
  }
  if (self->_hasButton)
  {
    -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
    PKSizeRoundToPixel(v58, v59, v60);
    v62.n128_f64[0] = v61;
    v64.n128_u64[0] = v63;
    v65.n128_f64[0] = v11 + v61 * -0.5;
    v66.n128_f64[0] = v45 + 11.0;
    button = self->_button;
    PKRectRoundToPixel(v65, v66, v62, v64, v68);
    -[PKContinuousButton setFrame:](button, "setFrame:");
  }
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  if (((!self->_showActivityIndicator ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_showActivityIndicator = a3;
    [(PKContinuousButton *)self->_button setEnabled:!a3];
    button = self->_button;
    [(PKContinuousButton *)button setShowSpinner:v3];
  }
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  ctaShelf = self->_ctaShelf;
  id v7 = a3;
  if ([(PKDiscoveryCallToActionShelf *)ctaShelf useImageAsTitle]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  __n128 v9 = [v7 imageWithRenderingMode:v8];

  if (v4)
  {
    __n128 v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__PKDiscoveryCallToActionShelfView_setImage_animated___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v9;
    objc_msgSend(v10, "pkui_animateUsingOptions:animations:completion:", 4, v11, 0);
  }
  else
  {
    [(UIImageView *)self->_iconImageView setImage:v9];
  }
}

uint64_t __54__PKDiscoveryCallToActionShelfView_setImage_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 504) setImage:*(void *)(a1 + 40)];
}

- (void)setWordmarkAsset:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  ctaShelf = self->_ctaShelf;
  id v7 = a3;
  if ([(PKDiscoveryCallToActionShelf *)ctaShelf useImageAsTitle]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  __n128 v9 = [v7 imageWithRenderingMode:v8];

  if (v4)
  {
    __n128 v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PKDiscoveryCallToActionShelfView_setWordmarkAsset_animated___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v9;
    objc_msgSend(v10, "pkui_animateUsingOptions:animations:completion:", 4, v11, 0);
  }
  else
  {
    [(UIImageView *)self->_wordmarkImageView setImage:v9];
  }
}

uint64_t __62__PKDiscoveryCallToActionShelfView_setWordmarkAsset_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 512) setImage:*(void *)(a1 + 40)];
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4 = a3;
  [(PKDiscoveryCallToActionShelfView *)self setShowActivityIndicator:0];
  char v5 = [v4 isInstalled];

  button = self->_button;
  if (v5)
  {
    id v7 = [(PKDiscoveryCallToAction *)self->_callToAction localizedButtonText];
    [(PKContinuousButton *)button setTitle:v7 forState:0];
  }
  else
  {
    id v7 = PKLocalizedString(&cfstr_ViewButton.isa);
    uint64_t v8 = objc_msgSend(v7, "pk_uppercaseStringForPreferredLocale");
    [(PKContinuousButton *)button setTitle:v8 forState:0];
  }

  [(PKDiscoveryCallToActionShelfView *)self setNeedsLayout];
}

- (void)_buttonPressed:(id)a3
{
  if ([(PKDiscoveryCallToAction *)self->_callToAction action] == 8
    && [(PKLinkedApplication *)self->_linkedApplication isInstalled])
  {
    linkedApplication = self->_linkedApplication;
    [(PKLinkedApplication *)linkedApplication openApplication:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    callToAction = self->_callToAction;
    __n128 v6 = [(PKDiscoveryShelfView *)self itemIdentifier];
    [WeakRetained discoveryCardViewCTATapped:self callToAction:callToAction itemIdentifier:v6];
  }
}

- (BOOL)_isFooterWordmarkOnly
{
  return self->_hasWordmarkAsset && !self->_hasButton && !self->_hasTitle && !self->_hasSubtitle && !self->_hasIcon;
}

- (double)_desiredWordmarkAssetHeight
{
  BOOL v2 = [(PKDiscoveryCallToActionShelfView *)self _isFooterWordmarkOnly];
  double result = 40.0;
  if (!v2) {
    return 30.0;
  }
  return result;
}

- (CGSize)_wordmarkAssetSize
{
  p_wordmarkAssetSize = &self->_wordmarkAssetSize;
  if (self->_hasWordmarkAsset)
  {
    double width = p_wordmarkAssetSize->width;
    if (p_wordmarkAssetSize->width == 0.0 && self->_wordmarkAssetSize.height == 0.0)
    {
      [(PKDiscoveryMedia *)self->_wordmarkAsset width];
      double width = v5;
      [(PKDiscoveryMedia *)self->_wordmarkAsset height];
      double v7 = v6;
      [(PKDiscoveryCallToActionShelfView *)self _desiredWordmarkAssetHeight];
      if (v7 > 0.0 && width > 0.0) {
        double width = width * (v8 / v7);
      }
      p_wordmarkAssetSize->double width = width;
      p_wordmarkAssetSize->double height = v8;
    }
  }
  else
  {
    CGSize *p_wordmarkAssetSize = *(CGSize *)MEMORY[0x1E4F1DB30];
    double width = p_wordmarkAssetSize->width;
  }
  double height = p_wordmarkAssetSize->height;
  double v10 = width;
  result.double height = height;
  result.double width = v10;
  return result;
}

- (PKDiscoveryCardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDiscoveryCardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_wordmarkImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_wordmarkAsset, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_callToAction, 0);

  objc_storeStrong((id *)&self->_ctaShelf, 0);
}

@end