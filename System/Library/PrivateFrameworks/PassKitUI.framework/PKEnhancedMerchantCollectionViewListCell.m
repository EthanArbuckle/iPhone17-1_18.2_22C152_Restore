@interface PKEnhancedMerchantCollectionViewListCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKAccountEnhancedMerchant)enhancedMerchant;
- (PKEnhancedMerchantCollectionViewListCell)init;
- (PKEnhancedMerchantCollectionViewListCell)initWithFrame:(CGRect)a3;
- (PKLinkedApplication)linkedApplication;
- (UIButton)appStoreButton;
- (UIButton)mapsButton;
- (UIButton)websiteButton;
- (UIImageView)imageView;
- (UILabel)detailedDescriptionLabel;
- (UIListContentView)listContentView;
- (id)_buttonAttributedStringForString:(id)a3;
- (id)_buttonFont;
- (id)_visibleButtons;
- (void)_dispatchActionToDelegate:(int64_t)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_initializeViewsIfNecessary;
- (void)_updateAppStoreButtonBasedOnLinkedApplicationState;
- (void)_updateImageViewDynamicColors;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAppStoreButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailedDescriptionLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setListContentView:(id)a3;
- (void)setMapsButton:(id)a3;
- (void)setWebsiteButton:(id)a3;
- (void)updateWithAccountEnhancedMerchant:(id)a3;
@end

@implementation PKEnhancedMerchantCollectionViewListCell

- (PKEnhancedMerchantCollectionViewListCell)init
{
  return -[PKEnhancedMerchantCollectionViewListCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKEnhancedMerchantCollectionViewListCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  v3 = -[PKEnhancedMerchantCollectionViewListCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKEnhancedMerchantCollectionViewListCell *)v3 _commonInit];
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (void)updateWithAccountEnhancedMerchant:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_enhancedMerchant, a3);
  objc_super v6 = [(PKAccountEnhancedMerchant *)self->_enhancedMerchant adamID];
  if (v6)
  {
    v7 = [PKLinkedApplication alloc];
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = [(PKLinkedApplication *)v7 initWithStoreIDs:v8 defaultLaunchURL:0];
    linkedApplication = self->_linkedApplication;
    self->_linkedApplication = v9;

    [(PKLinkedApplication *)self->_linkedApplication addObserver:self];
    [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
  }
}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void)dealloc
{
  [(PKLinkedApplication *)self->_linkedApplication removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  [(PKEnhancedMerchantCollectionViewListCell *)&v3 dealloc];
}

- (void)_initializeViewsIfNecessary
{
  if (!self->_listContentView)
  {
    objc_super v3 = [(PKEnhancedMerchantCollectionViewListCell *)self contentView];
    id v4 = objc_alloc(MEMORY[0x1E4FB1950]);
    id v5 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    objc_super v6 = (UIListContentView *)[v4 initWithConfiguration:v5];
    listContentView = self->_listContentView;
    self->_listContentView = v6;

    [v3 addSubview:self->_listContentView];
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = self->_imageView;
    self->_imageView = v8;

    v10 = self->_imageView;
    v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v10 setBackgroundColor:v11];

    v12 = [(UIImageView *)self->_imageView layer];
    [v12 setCornerRadius:10.0];
    [v12 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v12 setBorderWidth:PKUIPixelLength()];
    v51 = v12;
    [v12 setMasksToBounds:1];
    [(PKEnhancedMerchantCollectionViewListCell *)self _updateImageViewDynamicColors];
    [v3 addSubview:self->_imageView];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailedDescriptionLabel = self->_detailedDescriptionLabel;
    self->_detailedDescriptionLabel = v13;

    [(UILabel *)self->_detailedDescriptionLabel setNumberOfLines:0];
    [(UILabel *)self->_detailedDescriptionLabel setLineBreakMode:0];
    [(UILabel *)self->_detailedDescriptionLabel setLineBreakStrategy:1];
    [(UILabel *)self->_detailedDescriptionLabel setTextAlignment:0];
    v15 = self->_detailedDescriptionLabel;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    v17 = self->_detailedDescriptionLabel;
    v18 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], 0, 0, *MEMORY[0x1E4FB09D8]);
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)self->_detailedDescriptionLabel setAdjustsFontForContentSizeCategory:1];
    v54 = v3;
    [v3 addSubview:self->_detailedDescriptionLabel];
    v19 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
    v20 = PKRewardsHubGrayButtonColor();
    [v19 setBaseBackgroundColor:v20];

    uint64_t v21 = [(PKEnhancedMerchantCollectionViewListCell *)self _buttonFont];
    [v19 setCornerStyle:4];
    v50 = (void *)v21;
    v22 = [MEMORY[0x1E4FB1830] configurationWithFont:v21];
    [v19 setPreferredSymbolConfigurationForImage:v22];

    objc_msgSend(v19, "setContentInsets:", 5.0, 8.0, 5.0, 12.0);
    [v19 setImagePadding:4.0];
    uint64_t v23 = PKLocalizedFeatureString();
    v24 = PKLocalizedFeatureString();
    uint64_t v25 = PKLocalizedFeatureString();
    v49 = (void *)v23;
    uint64_t v26 = [(PKEnhancedMerchantCollectionViewListCell *)self _buttonAttributedStringForString:v23];
    uint64_t v27 = [(PKEnhancedMerchantCollectionViewListCell *)self _buttonAttributedStringForString:v24];
    v48 = (void *)v25;
    v28 = [(PKEnhancedMerchantCollectionViewListCell *)self _buttonAttributedStringForString:v25];
    v29 = (void *)[v19 copy];
    v47 = (void *)v26;
    [v29 setAttributedTitle:v26];
    v30 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appstore"];
    [v29 setImage:v30];

    [v29 setShowsActivityIndicator:1];
    v31 = (void *)[v19 copy];
    v46 = (void *)v27;
    [v31 setAttributedTitle:v27];
    v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari.fill"];
    [v31 setImage:v32];

    v33 = (void *)[v19 copy];
    [v33 setAttributedTitle:v28];
    v34 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
    [v33 setImage:v34];

    objc_initWeak(location, self);
    v35 = (void *)MEMORY[0x1E4FB13F0];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke;
    v59[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v60, location);
    v53 = [v35 actionWithHandler:v59];
    v36 = (void *)MEMORY[0x1E4FB13F0];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_2;
    v57[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v58, location);
    v52 = [v36 actionWithHandler:v57];
    v37 = (void *)MEMORY[0x1E4FB13F0];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_3;
    v55[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v56, location);
    v38 = [v37 actionWithHandler:v55];
    v39 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v40 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v29 primaryAction:v53];
    appStoreButton = self->_appStoreButton;
    self->_appStoreButton = v40;

    [(UIButton *)self->_appStoreButton setTintColor:v39];
    [v54 addSubview:self->_appStoreButton];
    [(UIButton *)self->_appStoreButton setEnabled:0];
    v42 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v31 primaryAction:v52];
    websiteButton = self->_websiteButton;
    self->_websiteButton = v42;

    [(UIButton *)self->_websiteButton setTintColor:v39];
    [v54 addSubview:self->_websiteButton];
    v44 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v33 primaryAction:v38];
    mapsButton = self->_mapsButton;
    self->_mapsButton = v44;

    [(UIButton *)self->_mapsButton setTintColor:v39];
    [v54 addSubview:self->_mapsButton];

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);

    objc_destroyWeak(&v60);
    objc_destroyWeak(location);
  }
}

void __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dispatchActionToDelegate:0];
}

void __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dispatchActionToDelegate:1];
}

void __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dispatchActionToDelegate:2];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double v6 = a3.width + -32.0;
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", a3.width + -32.0 + -48.0 + -10.0, a3.height);
  double v8 = 16.0;
  double v9 = fmax(v7, 48.0) + 16.0 + 16.0;
  double v39 = height;
  -[UILabel sizeThatFits:](self->_detailedDescriptionLabel, "sizeThatFits:", v6, height);
  double v11 = v9 + v10;
  v12 = [(PKEnhancedMerchantCollectionViewListCell *)self _visibleButtons];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = v11 + 16.0;
    if (v13 < 1)
    {
      double v21 = 0.0;
    }
    else
    {
      double v38 = width;
      uint64_t v16 = 0;
      v17 = 0;
      v18 = 0;
      double v20 = *MEMORY[0x1E4F1DB30];
      double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v21 = 0.0;
      double v22 = v19;
      double v23 = *MEMORY[0x1E4F1DB30];
      double v24 = v6;
      do
      {
        uint64_t v25 = v18;
        v18 = objc_msgSend(v12, "objectAtIndexedSubscript:", v16, *(void *)&v38);

        if (++v16 >= v14)
        {
          uint64_t v26 = 0;
        }
        else
        {
          uint64_t v26 = [v12 objectAtIndexedSubscript:v16];
        }

        if (v23 == v20 && v22 == v19)
        {
          objc_msgSend(v18, "sizeThatFits:", v6, v39);
          if (v27 >= v6) {
            double v23 = v6;
          }
          else {
            double v23 = v27;
          }
          double v22 = fmax(v28, 28.0);
        }
        double v29 = v20;
        double v30 = v19;
        if (v26)
        {
          objc_msgSend(v26, "sizeThatFits:", v6, v39);
          if (v29 >= v6) {
            double v29 = v6;
          }
          double v30 = fmax(v31, 28.0);
        }
        BOOL v32 = v26 != 0;
        if (v21 <= v22) {
          double v33 = v22;
        }
        else {
          double v33 = v21;
        }
        BOOL v34 = v29 > v24 - (v23 + 8.0);
        double v35 = v33 + 16.0;
        if (!v32 || !v34) {
          double v35 = -0.0;
        }
        double v15 = v15 + v35;
        if (v32 && v34) {
          double v24 = v6;
        }
        else {
          double v24 = v24 - (v23 + 8.0);
        }
        if (v32 && v34) {
          double v21 = 0.0;
        }
        else {
          double v21 = v33;
        }
        double v22 = v30;
        double v23 = v29;
        v17 = v26;
      }
      while (v14 != v16);

      CGFloat width = v38;
      double v8 = 16.0;
    }
    double v11 = v15 + v21;
  }

  double v36 = width;
  double v37 = v11 + v8;
  result.double height = v37;
  result.CGFloat width = v36;
  return result;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  [(PKEnhancedMerchantCollectionViewListCell *)&v46 layoutSubviews];
  objc_super v3 = [(PKEnhancedMerchantCollectionViewListCell *)self contentView];
  int v4 = [v3 _shouldReverseLayoutDirection];

  [(PKEnhancedMerchantCollectionViewListCell *)self bounds];
  double v6 = v5 + 16.0;
  double v8 = v7 + -32.0;
  double v10 = v9 + -32.0;
  memset(&slice, 0, sizeof(slice));
  double v12 = v11 + 16.0;
  remainder.origin.x = v5 + 16.0;
  remainder.origin.y = v11 + 16.0;
  remainder.size.CGFloat width = v7 + -32.0;
  remainder.size.double height = v9 + -32.0;
  if (v4) {
    CGRectEdge v13 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v13 = CGRectMinXEdge;
  }
  PKContentAlignmentMake();
  PKContentAlignmentMake();
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", v8 + -48.0 + -10.0, v10);
  CGFloat v15 = fmax(v14, 48.0);
  v47.origin.x = v6;
  v47.origin.y = v12;
  v47.size.CGFloat width = v8;
  v47.size.double height = v10;
  CGRectDivide(v47, &slice, &remainder, v15, CGRectMinYEdge);
  memset(&v43, 0, sizeof(v43));
  CGRect v42 = slice;
  CGRectDivide(slice, &v43, &v42, 58.0, v13);
  imageView = self->_imageView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](imageView, "setFrame:");
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", v42.size.width, v42.size.height);
  listContentView = self->_listContentView;
  PKSizeAlignedInRect();
  -[UIListContentView setFrame:](listContentView, "setFrame:");
  remainder.origin = (CGPoint)vaddq_f64((float64x2_t)remainder.origin, (float64x2_t)xmmword_1A0422BE0);
  remainder.size.double height = remainder.size.height + -16.0;
  [(UILabel *)self->_detailedDescriptionLabel sizeThatFits:remainder.size.width];
  CGRect v48 = remainder;
  CGRectDivide(remainder, &slice, &remainder, v48.origin.y + 16.0, CGRectMinYEdge);
  detailedDescriptionLabel = self->_detailedDescriptionLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](detailedDescriptionLabel, "setFrame:");
  double v19 = [(PKEnhancedMerchantCollectionViewListCell *)self _visibleButtons];
  uint64_t v20 = [v19 count];
  if (v20)
  {
    uint64_t v21 = v20;
    CGSize v39 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    CGPoint v40 = (CGPoint)*MEMORY[0x1E4F1DB20];
    v41.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v41.size = v39;
    double Width = CGRectGetWidth(remainder);
    if (v21 >= 1)
    {
      double v23 = Width;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      double v27 = *MEMORY[0x1E4F1DB30];
      double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v29 = v28;
      double v30 = *MEMORY[0x1E4F1DB30];
      do
      {
        double v31 = v26;
        BOOL v32 = v25;
        uint64_t v26 = objc_msgSend(v19, "objectAtIndexedSubscript:", v24, v39, v40);

        if (++v24 >= v21)
        {
          uint64_t v25 = 0;
        }
        else
        {
          uint64_t v25 = [v19 objectAtIndexedSubscript:v24];
        }

        if (v30 == v27)
        {
          CGFloat v33 = v30;
          double v34 = v29;
          if (v29 == v28)
          {
            objc_msgSend(v26, "sizeThatFits:", v23, 1.79769313e308);
            if (v35 >= v23) {
              CGFloat v33 = v23;
            }
            else {
              CGFloat v33 = v35;
            }
            double v34 = fmax(v36, 28.0);
          }
        }
        else
        {
          CGFloat v33 = v30;
          double v34 = v29;
        }
        double v30 = v27;
        double v29 = v28;
        if (v25)
        {
          objc_msgSend(v25, "sizeThatFits:", v23, 1.79769313e308);
          if (v37 >= v23) {
            double v30 = v23;
          }
          else {
            double v30 = v37;
          }
          double v29 = fmax(v38, 28.0);
        }
        if (CGRectIsNull(v41)) {
          CGRectDivide(remainder, &v41, &remainder, v34, CGRectMinYEdge);
        }
        CGRectDivide(v41, &slice, &v41, v33, v13);
        PKSizeAlignedInRect();
        objc_msgSend(v26, "setFrame:");
        if (v25)
        {
          if (v30 + 8.0 <= CGRectGetWidth(v41))
          {
            CGRectDivide(v41, &slice, &v41, 8.0, v13);
          }
          else
          {
            remainder.origin = (CGPoint)vaddq_f64((float64x2_t)remainder.origin, (float64x2_t)xmmword_1A0422BE0);
            remainder.size.double height = remainder.size.height + -16.0;
            v41.origin = v40;
            v41.size = v39;
          }
        }
      }
      while (v21 != v24);
    }
  }
}

- (void)_dispatchActionToDelegate:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(PKEnhancedMerchantCollectionViewListCell *)self enhancedMerchant];
    [WeakRetained performAction:a3 forEnhancedMerchant:v5 sender:self];
  }
}

- (id)_buttonFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27F0], *MEMORY[0x1E4FB09D0]);
}

- (id)_buttonAttributedStringForString:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  double v6 = [(PKEnhancedMerchantCollectionViewListCell *)self _buttonFont];
  double v7 = objc_msgSend(v4, "pkui_attriutedStringWithString:font:paragraphStyle:", v5, v6, 0);

  return v7;
}

- (void)_updateAppStoreButtonBasedOnLinkedApplicationState
{
  [(PKLinkedApplication *)self->_linkedApplication isInstalled];
  objc_super v3 = PKLocalizedFeatureString();
  int v4 = [(PKEnhancedMerchantCollectionViewListCell *)self _buttonAttributedStringForString:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__PKEnhancedMerchantCollectionViewListCell__updateAppStoreButtonBasedOnLinkedApplicationState__block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __94__PKEnhancedMerchantCollectionViewListCell__updateAppStoreButtonBasedOnLinkedApplicationState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appStoreButton];
  id v4 = [v2 configuration];

  [v4 setAttributedTitle:*(void *)(a1 + 40)];
  [v4 setShowsActivityIndicator:0];
  objc_super v3 = [*(id *)(a1 + 32) appStoreButton];
  [v3 setConfiguration:v4];
  [v3 setEnabled:1];
}

- (void)_updateImageViewDynamicColors
{
  objc_super v3 = [(PKEnhancedMerchantCollectionViewListCell *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__PKEnhancedMerchantCollectionViewListCell__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __73__PKEnhancedMerchantCollectionViewListCell__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 888) layer];
  id v1 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  [(PKEnhancedMerchantCollectionViewListCell *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKEnhancedMerchantCollectionViewListCell *)self _updateImageViewDynamicColors];
}

- (id)_visibleButtons
{
  v6[3] = *MEMORY[0x1E4F143B8];
  websiteButton = self->_websiteButton;
  v6[0] = self->_appStoreButton;
  v6[1] = websiteButton;
  v6[2] = self->_mapsButton;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_99);

  return v4;
}

uint64_t __59__PKEnhancedMerchantCollectionViewListCell__visibleButtons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (PKAccountEnhancedMerchant)enhancedMerchant
{
  return self->_enhancedMerchant;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
}

- (UILabel)detailedDescriptionLabel
{
  return self->_detailedDescriptionLabel;
}

- (void)setDetailedDescriptionLabel:(id)a3
{
}

- (UIButton)appStoreButton
{
  return self->_appStoreButton;
}

- (void)setAppStoreButton:(id)a3
{
}

- (UIButton)websiteButton
{
  return self->_websiteButton;
}

- (void)setWebsiteButton:(id)a3
{
}

- (UIButton)mapsButton
{
  return self->_mapsButton;
}

- (void)setMapsButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsButton, 0);
  objc_storeStrong((id *)&self->_websiteButton, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_detailedDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_enhancedMerchant, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end