@interface PKPassPaymentCardFrontFaceView
- (BOOL)showsShare;
- (CGSize)_barcodeSize;
- (CGSize)contentSize;
- (PKPassPaymentCardFrontFaceView)initWithStyle:(int64_t)a3;
- (double)_barcodePadding;
- (id)_filterAuxiliaryField:(id)a3;
- (id)_filterSecondaryField:(id)a3;
- (id)templateForHeaderBucket;
- (id)templateForLayoutMode:(int64_t)a3;
- (void)_handleAccountChanged:(id)a3;
- (void)_handlePeerPaymentAccountChanged:(id)a3;
- (void)_initializeBalanceLabelWithTextColor:(id)a3;
- (void)_showFullScreenBarcodeForButton:(id)a3;
- (void)_updateAccountBalanceVisibilityAnimated:(BOOL)a3;
- (void)_updateBalanceLabelFontSize;
- (void)_updateBalanceWithAmount:(id)a3;
- (void)_updateStateForAccount:(id)a3 animated:(BOOL)a4;
- (void)createBodyContentViews;
- (void)createHeaderContentViews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDynamicBarcodeData:(id)a3;
- (void)setModallyPresented:(BOOL)a3;
- (void)setShowsLiveBalance:(BOOL)a3;
- (void)setViewExpanded:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPassPaymentCardFrontFaceView

- (void)layoutSubviews
{
  v65.receiver = self;
  v65.super_class = (Class)PKPassPaymentCardFrontFaceView;
  [(PKPassFrontFaceView *)&v65 layoutSubviews];
  v3 = [(PKPassFaceView *)self contentView];
  [v3 bounds];
  balanceLabel = self->_balanceLabel;
  if (balanceLabel)
  {
    CGFloat v9 = v4;
    CGFloat v10 = v5;
    CGFloat v11 = v6;
    CGFloat v12 = v7;
    [(UILabel *)balanceLabel sizeToFit];
    [(UILabel *)self->_balanceLabel frame];
    remainder.origin.x = v9;
    remainder.origin.y = v10;
    remainder.size.width = v11;
    remainder.size.height = v12;
    memset(&slice, 0, sizeof(slice));
    v66.origin.x = v9;
    v66.origin.y = v10;
    v66.size.width = v11;
    v66.size.height = v12;
    CGRectDivide(v66, &slice, &remainder, 14.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 20.0, CGRectMaxXEdge);
    v13 = self->_balanceLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v13, "setFrame:");
  }
  BOOL v14 = [(PKPassFaceView *)self viewExpanded];
  PKPassFrontFaceContentSize();
  double v16 = v15;
  double v18 = v17;
  [(PKPassPaymentCardFrontFaceView *)self _barcodePadding];
  double v20 = v19;
  if (v19 <= 20.0) {
    double v21 = 16.0;
  }
  else {
    double v21 = 20.0;
  }
  backdropView = self->_backdropView;
  if (backdropView)
  {
    if (v14) {
      double v23 = v16;
    }
    else {
      double v23 = v18;
    }
    -[PKBackdropView setFrame:](backdropView, "setFrame:", 0.0, 0.0, v16, v23);
    v24 = [(PKBackdropView *)self->_backdropView layer];
    PKPaymentStyleApplyCorners();
  }
  scrimView = self->_scrimView;
  if (scrimView)
  {
    if (v14) {
      double v26 = v16;
    }
    else {
      double v26 = v18;
    }
    -[UIView setFrame:](scrimView, "setFrame:", 0.0, 0.0, v16, v26);
    v27 = [(UIView *)self->_scrimView layer];
    PKPaymentStyleApplyCorners();
  }
  fullScreenButton = self->_fullScreenButton;
  if (fullScreenButton)
  {
    [(UIButton *)fullScreenButton sizeToFit];
    [(UIButton *)self->_fullScreenButton frame];
    -[UIButton setCenter:](self->_fullScreenButton, "setCenter:", v16 - v29, v29 + 5.0);
  }
  compactBankLogoView = self->_compactBankLogoView;
  if (compactBankLogoView)
  {
    v31 = [(UIImageView *)compactBankLogoView image];
    [v31 size];

    PKSizeAspectFit();
    PKSizeRoundToPixel(v32, v33, v34);
    -[UIImageView setFrame:](self->_compactBankLogoView, "setFrame:", 16.0, 16.0, v35, v36);
  }
  topBarcodeView = self->_topBarcodeView;
  if (!topBarcodeView)
  {
    if (![(NSMutableArray *)self->_oldTopBarcodeViews count]) {
      goto LABEL_26;
    }
    topBarcodeView = self->_topBarcodeView;
  }
  [(PKBarcodeStickerView *)topBarcodeView frame];
  v42.n128_f64[0] = v18 + 256.0;
  if (v14) {
    v42.n128_f64[0] = v20 + v21 + 24.0;
  }
  v41.n128_f64[0] = v16 * 0.5;
  v38.n128_f64[0] = v16 * 0.5 - v39.n128_f64[0] * 0.5;
  PKRectRoundToPixel(v38, v42, v39, v40, v41);
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  -[PKBarcodeStickerView setFrame:](self->_topBarcodeView, "setFrame:");
  oldTopBarcodeViews = self->_oldTopBarcodeViews;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke;
  v62[3] = &__block_descriptor_64_e37_v32__0__PKBarcodeStickerView_8Q16_B24l;
  v62[4] = v44;
  v62[5] = v46;
  v62[6] = v48;
  v62[7] = v50;
  [(NSMutableArray *)oldTopBarcodeViews enumerateObjectsUsingBlock:v62];
LABEL_26:
  if (self->_bottomBarcodeView || [(NSMutableArray *)self->_oldBottomBarcodeViews count])
  {
    [(PKBarcodeStickerView *)self->_bottomBarcodeView frame];
    if (v14) {
      v53.n128_f64[0] = v16 + v55 * -0.5 - v20 - v21;
    }
    else {
      v53.n128_f64[0] = v18 + v16 + 256.0 + v55 * -0.5 + -24.0;
    }
    v52.n128_f64[0] = v16 * 0.5;
    PKPointRoundToPixel(v52, v53, v54);
    uint64_t v57 = v56;
    uint64_t v59 = v58;
    -[PKBarcodeStickerView setCenter:](self->_bottomBarcodeView, "setCenter:");
    oldBottomBarcodeViews = self->_oldBottomBarcodeViews;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke_2;
    v61[3] = &__block_descriptor_48_e37_v32__0__PKBarcodeStickerView_8Q16_B24l;
    v61[4] = v57;
    v61[5] = v59;
    [(NSMutableArray *)oldBottomBarcodeViews enumerateObjectsUsingBlock:v61];
  }
}

- (CGSize)contentSize
{
  v3 = [(PKPassFaceView *)self pass];
  [v3 style];
  PKPassFrontFaceContentSize();
  double v5 = v4;
  double v7 = v6;
  if ([(PKPassFaceView *)self viewExpanded]) {
    double v7 = v5;
  }

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)_barcodePadding
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 0.0;
  if (v2 <= 0xE) {
    return dbl_1A0443F88[v2];
  }
  return result;
}

- (void)createBodyContentViews
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)PKPassPaymentCardFrontFaceView;
  [(PKPassFrontFaceView *)&v37 createBodyContentViews];
  v3 = [(PKPassFaceView *)self pass];
  double v4 = [v3 paymentPass];

  if ([v4 supportsBarcodePayment])
  {
    backdropView = self->_backdropView;
    if (!backdropView)
    {
      double v6 = objc_alloc_init(PKBackdropView);
      double v7 = self->_backdropView;
      self->_backdropView = v6;

      [(PKBackdropView *)self->_backdropView setAlpha:0.0];
      double v8 = [(PKBackdropView *)self->_backdropView backdropLayer];
      if (UIAccessibilityIsReduceTransparencyEnabled())
      {
        [v8 setFilters:0];
      }
      else
      {
        double v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
        [v9 setName:@"gaussianBlur"];
        [v9 setValue:&unk_1EF2B9030 forKey:@"inputRadius"];
        [v8 setScale:0.1];
        v38[0] = v9;
        CGFloat v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
        [v8 setFilters:v10];
      }
      backdropView = self->_backdropView;
    }
    [(PKPassFrontFaceView *)self insertContentView:backdropView ofType:2];
    scrimView = self->_scrimView;
    if (!scrimView)
    {
      CGFloat v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v13 = self->_scrimView;
      self->_scrimView = v12;

      [(UIView *)self->_scrimView setClipsToBounds:1];
      BOOL v14 = self->_scrimView;
      double v15 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIView *)v14 setBackgroundColor:v15];

      [(UIView *)self->_scrimView setAlpha:0.0];
      double v16 = (void *)MEMORY[0x1E4FB14D8];
      double v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.left.and.arrow.down.right"];
      double v18 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:2 scale:18.0];
      double v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      double v20 = objc_msgSend(v16, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v17, v18, v19);

      objc_initWeak(&location, self);
      double v21 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      __n128 v33 = __56__PKPassPaymentCardFrontFaceView_createBodyContentViews__block_invoke;
      __n128 v34 = &unk_1E59CBEE0;
      objc_copyWeak(&v35, &location);
      v22 = [v21 actionWithHandler:&v31];
      objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v20, v22, v31, v32, v33, v34);
      double v23 = (UIButton *)objc_claimAutoreleasedReturnValue();
      fullScreenButton = self->_fullScreenButton;
      self->_fullScreenButton = v23;

      [(UIButton *)self->_fullScreenButton setConfigurationUpdateHandler:&__block_literal_global_89];
      [(UIButton *)self->_fullScreenButton setOverrideUserInterfaceStyle:1];
      [(UIView *)self->_scrimView addSubview:self->_fullScreenButton];
      v25 = [(PKPassFaceView *)self pass];
      double v26 = [v25 compactBankLogoDarkImage];

      id v27 = objc_alloc(MEMORY[0x1E4FB1838]);
      v28 = [MEMORY[0x1E4FB1818] imageWithPKImage:v26];
      double v29 = (UIImageView *)[v27 initWithImage:v28];
      compactBankLogoView = self->_compactBankLogoView;
      self->_compactBankLogoView = v29;

      [(UIView *)self->_scrimView addSubview:self->_compactBankLogoView];
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);

      scrimView = self->_scrimView;
    }
    [(PKPassFrontFaceView *)self insertContentView:scrimView ofType:2];
  }
}

- (PKPassPaymentCardFrontFaceView)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassPaymentCardFrontFaceView;
  v3 = [(PKPassFrontFaceView *)&v9 initWithStyle:a3];
  if (v3)
  {
    double v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    oldTopBarcodeViews = v3->_oldTopBarcodeViews;
    v3->_oldTopBarcodeViews = v4;

    double v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    oldBottomBarcodeViews = v3->_oldBottomBarcodeViews;
    v3->_oldBottomBarcodeViews = v6;
  }
  return v3;
}

- (void)setModallyPresented:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassPaymentCardFrontFaceView;
  [(PKPassFaceView *)&v6 setModallyPresented:a3];
  double v4 = [(PKPassFaceView *)self pass];
  double v5 = [v4 paymentPass];

  if ([v5 associatedAccountFeatureIdentifier] == 4) {
    [(PKPassPaymentCardFrontFaceView *)self _updateAccountBalanceVisibilityAnimated:1];
  }
}

- (void)createHeaderContentViews
{
  v3 = [(PKPassFaceView *)self pass];
  double v4 = [v3 paymentPass];

  if (([v4 hasAssociatedPeerPaymentAccount] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPassPaymentCardFrontFaceView;
    [(PKPassFrontFaceView *)&v6 createHeaderContentViews];
  }
  balanceLabel = self->_balanceLabel;
  if (balanceLabel) {
    [(PKPassFrontFaceView *)self insertContentView:balanceLabel ofType:0];
  }
}

- (void)setShowsLiveBalance:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(PKPassFaceView *)self pass];
    double v5 = [v4 paymentPass];

    if ([v5 hasAssociatedPeerPaymentAccount])
    {
      objc_super v6 = [MEMORY[0x1E4F84E00] sharedInstance];
      double v7 = [v6 account];
      double v8 = [v7 associatedPassUniqueID];
      objc_super v9 = [v5 uniqueID];
      int v10 = [v8 isEqualToString:v9];

      if (v10)
      {
        if (!self->_balanceLabel)
        {
          CGFloat v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v11 addObserver:self selector:sel__handlePeerPaymentAccountChanged_ name:*MEMORY[0x1E4F87CB0] object:v6];
        }
        CGFloat v12 = [MEMORY[0x1E4FB1618] whiteColor];
        [(PKPassPaymentCardFrontFaceView *)self _initializeBalanceLabelWithTextColor:v12];

        v13 = [v7 currentBalance];
        [(PKPassPaymentCardFrontFaceView *)self _updateBalanceWithAmount:v13];

        [(UILabel *)self->_balanceLabel setAlpha:1.0];
      }
    }
    else if ([v5 associatedAccountFeatureIdentifier] == 4)
    {
      objc_initWeak(&location, self);
      double v15 = [MEMORY[0x1E4F84270] sharedInstance];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke;
      v16[3] = &unk_1E59CFFF8;
      objc_copyWeak(&v17, &location);
      [v15 defaultAccountForFeature:4 completion:v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    balanceLabel = self->_balanceLabel;
    [(UILabel *)balanceLabel setAlpha:0.0];
  }
}

- (id)templateForLayoutMode:(int64_t)a3
{
  double v4 = objc_alloc_init(PKPassFaceTemplate);
  -[PKPassFaceTemplate setBarcodeMaxSize:](v4, "setBarcodeMaxSize:", 290.0, 165.0);
  double v5 = [(PKPassFaceTemplate *)v4 defaultFieldTemplate];
  [v5 setTextAlignment:0];

  objc_super v6 = [(PKPassFaceTemplate *)v4 defaultFieldTemplate];
  uint64_t v78 = *MEMORY[0x1E4FB28E0];
  double v7 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:");
  double v8 = [v7 fontDescriptorWithSymbolicTraits:2];

  objc_super v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:11.0];

  [v6 setLabelFont:v9];
  PKPassFrontFaceContentSize();
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(PKPassFaceView *)self buckets];
  double v15 = [v14 objectAtIndex:0];
  uint64_t v16 = [v15 firstObject];

  id v17 = [v14 objectAtIndex:1];
  double v18 = [v17 firstObject];

  double v19 = [v14 objectAtIndex:2];
  double v20 = [v19 firstObject];
  double v21 = [(PKPassPaymentCardFrontFaceView *)self _filterSecondaryField:v20];

  v22 = [v14 objectAtIndex:3];
  double v23 = [v22 firstObject];
  v24 = [(PKPassPaymentCardFrontFaceView *)self _filterAuxiliaryField:v23];

  if (v18) {
    BOOL v25 = v21 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  int v26 = !v25;
  v77 = (void *)v16;
  if (v16) {
    BOOL v27 = v24 == 0;
  }
  else {
    BOOL v27 = 1;
  }
  int v28 = !v27;
  int v76 = v28;
  if (v18)
  {
    double v29 = objc_alloc_init(PKPassBucketTemplate);
    [(PKPassBucketTemplate *)v29 setBucketAlignment:3];
    if (v21) {
      double v30 = v11 * 0.5 + -34.0;
    }
    else {
      double v30 = v11 + -34.0;
    }
    -[PKPassBucketTemplate setBucketRect:](v29, "setBucketRect:", 17.0, v13 + -35.0 + -12.0, v30, 35.0);
    [(PKPassBucketTemplate *)v29 setMaxFields:1];
    uint64_t v31 = [(PKPassBucketTemplate *)v29 defaultFieldTemplate];
    uint64_t v32 = [v18 label];
    __n128 v33 = v32;
    if (v32)
    {
      uint64_t v34 = [(__CFString *)v32 length];
      int v35 = 0;
      if (v33 != @" " && v34) {
        int v35 = [(__CFString *)v33 isEqualToString:@" "] ^ 1;
      }
    }
    else
    {
      int v35 = 0;
    }

    double v36 = PKPassPaymentFrontFaceValueFont(v35);
    [v31 setValueFont:v36];

    objc_super v37 = [(PKPassBucketTemplate *)v29 defaultFieldTemplate];
    __n128 v38 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v78];
    __n128 v39 = [v38 fontDescriptorWithSymbolicTraits:2];

    __n128 v40 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v39 size:11.0];

    [v37 setLabelFont:v40];
    __n128 v41 = [(PKPassBucketTemplate *)v29 defaultFieldTemplate];
    [v41 setVerticalPadding:-3.0];

    __n128 v42 = [(PKPassBucketTemplate *)v29 defaultFieldTemplate];
    [v42 setSuppressesEmptyLabel:1];

    uint64_t v43 = [(PKPassBucketTemplate *)v29 defaultFieldTemplate];
    [v43 setTextAlignment:0];

    [(PKPassFaceTemplate *)v4 addBucketTemplate:v29];
  }
  if (v21)
  {
    uint64_t v44 = objc_alloc_init(PKPassBucketTemplate);
    [(PKPassBucketTemplate *)v44 setBucketAlignment:3];
    double v45 = 17.0;
    if (v26)
    {
      double v45 = v11 * 0.5 + 17.0;
      double v46 = v11 * 0.5 + -34.0;
    }
    else
    {
      double v46 = v11 + -34.0;
    }
    -[PKPassBucketTemplate setBucketRect:](v44, "setBucketRect:", v45, v13 + -35.0 + -12.0, v46, 35.0);
    [(PKPassBucketTemplate *)v44 setMaxFields:1];
    uint64_t v47 = [(PKPassBucketTemplate *)v44 defaultFieldTemplate];
    uint64_t v48 = [v21 label];
    uint64_t v49 = v48;
    if (v48)
    {
      uint64_t v50 = [(__CFString *)v48 length];
      int v51 = 0;
      if (v49 != @" " && v50) {
        int v51 = [(__CFString *)v49 isEqualToString:@" "] ^ 1;
      }
    }
    else
    {
      int v51 = 0;
    }

    __n128 v52 = PKPassPaymentFrontFaceValueFont(v51);
    [v47 setValueFont:v52];

    __n128 v53 = [(PKPassBucketTemplate *)v44 defaultFieldTemplate];
    __n128 v54 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v78];
    double v55 = [v54 fontDescriptorWithSymbolicTraits:2];

    uint64_t v56 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v55 size:11.0];

    [v53 setLabelFont:v56];
    uint64_t v57 = [(PKPassBucketTemplate *)v44 defaultFieldTemplate];
    [v57 setVerticalPadding:-3.0];

    uint64_t v58 = [(PKPassBucketTemplate *)v44 defaultFieldTemplate];
    [v58 setSuppressesEmptyLabel:1];

    uint64_t v59 = [(PKPassBucketTemplate *)v44 defaultFieldTemplate];
    [v59 setTextAlignment:2];

    [(PKPassFaceTemplate *)v4 addBucketTemplate:v44];
  }
  if (v24)
  {
    v60 = objc_alloc_init(PKPassBucketTemplate);
    [(PKPassBucketTemplate *)v60 setBucketAlignment:3];
    if (v76) {
      double v61 = v11 * 0.5 + -34.0;
    }
    else {
      double v61 = v11 + -34.0;
    }
    -[PKPassBucketTemplate setBucketRect:](v60, "setBucketRect:", 17.0, 12.0, v61, 35.0);
    [(PKPassBucketTemplate *)v60 setMaxFields:1];
    v62 = [(PKPassBucketTemplate *)v60 defaultFieldTemplate];
    v63 = [v24 label];
    v64 = v63;
    if (v63)
    {
      uint64_t v65 = [(__CFString *)v63 length];
      int v66 = 0;
      if (v64 != @" " && v65) {
        int v66 = [(__CFString *)v64 isEqualToString:@" "] ^ 1;
      }
    }
    else
    {
      int v66 = 0;
    }

    v67 = PKPassPaymentFrontFaceValueFont(v66);
    [v62 setValueFont:v67];

    v68 = [(PKPassBucketTemplate *)v60 defaultFieldTemplate];
    v69 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v78];
    v70 = [v69 fontDescriptorWithSymbolicTraits:2];

    v71 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v70 size:11.0];

    [v68 setLabelFont:v71];
    v72 = [(PKPassBucketTemplate *)v60 defaultFieldTemplate];
    [v72 setVerticalPadding:-3.0];

    v73 = [(PKPassBucketTemplate *)v60 defaultFieldTemplate];
    [v73 setSuppressesEmptyLabel:1];

    v74 = [(PKPassBucketTemplate *)v60 defaultFieldTemplate];
    [v74 setTextAlignment:0];

    [(PKPassFaceTemplate *)v4 addBucketTemplate:v60];
  }

  return v4;
}

- (id)_filterSecondaryField:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  double v5 = [v3 key];
  objc_super v6 = (void *)*MEMORY[0x1E4F87510];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  objc_super v9 = v8;
  if (v7 && v8)
  {
    char v10 = [v7 isEqualToString:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_8:
    id v11 = 0;
    goto LABEL_11;
  }

LABEL_10:
  id v11 = v4;
LABEL_11:

  return v11;
}

- (id)_filterAuxiliaryField:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (!v3)
  {
    id v11 = 0;
    goto LABEL_20;
  }
  double v5 = [v3 key];
  objc_super v6 = (void *)*MEMORY[0x1E4F87518];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    objc_super v9 = v8;
    if (v7 && v8)
    {
      char v10 = [v7 isEqualToString:v8];

      if (v10) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    double v12 = (void *)*MEMORY[0x1E4F87520];
    id v13 = v7;
    id v14 = v12;
    if (v13 == v14)
    {
    }
    else
    {
      double v15 = v14;
      if (!v7 || !v14)
      {

LABEL_18:
        id v11 = v4;
        goto LABEL_19;
      }
      char v16 = [v13 isEqualToString:v14];

      if ((v16 & 1) == 0) {
        goto LABEL_18;
      }
    }
  }
LABEL_16:
  id v11 = 0;
LABEL_19:

LABEL_20:

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassPaymentCardFrontFaceView;
  [(PKPassPaymentCardFrontFaceView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(PKPassPaymentCardFrontFaceView *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  if (v4 && v5)
  {
    id v7 = [v4 preferredContentSizeCategory];
    NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v7, v6);

    if (v8 == NSOrderedSame) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v5 && !v4) {
LABEL_7:
  }
    [(PKPassPaymentCardFrontFaceView *)self _updateBalanceLabelFontSize];
LABEL_8:
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F87CB0];
  double v5 = [MEMORY[0x1E4F84E00] sharedInstance];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)PKPassPaymentCardFrontFaceView;
  [(PKPassFaceView *)&v6 dealloc];
}

- (id)templateForHeaderBucket
{
  id v3 = objc_alloc_init(PKPassBucketTemplate);
  [(PKPassBucketTemplate *)v3 setBucketAlignment:3];
  PKPassFrontFaceContentSize();
  double v5 = v4;
  objc_super v6 = [(PKPassFaceView *)self buckets];
  id v7 = [v6 objectAtIndex:0];
  NSComparisonResult v8 = [v7 firstObject];

  objc_super v9 = [v6 objectAtIndex:3];
  char v10 = [v9 firstObject];
  id v11 = [(PKPassPaymentCardFrontFaceView *)self _filterAuxiliaryField:v10];

  [(PKPassFaceView *)self cobrandLogoSize];
  if (v8 && v11)
  {
    double v13 = v5 * 0.5 + 17.0;
    double v14 = v5 * 0.5 + -34.0;
  }
  else
  {
    double v15 = fmin(v12, v5 * 0.7 + -34.0);
    double v13 = v15 + 17.0;
    double v14 = v5 + -34.0 - v15;
  }
  -[PKPassBucketTemplate setBucketRect:](v3, "setBucketRect:", v13, 12.0, v14, 35.0);
  [(PKPassBucketTemplate *)v3 setMaxFields:1];
  char v16 = [(PKPassBucketTemplate *)v3 defaultFieldTemplate];
  id v17 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E0]];
  double v18 = [v17 fontDescriptorWithSymbolicTraits:2];

  double v19 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v18 size:11.0];

  [v16 setLabelFont:v19];
  double v20 = [(PKPassBucketTemplate *)v3 defaultFieldTemplate];
  double v21 = [v8 label];
  v22 = v21;
  if (v21)
  {
    uint64_t v23 = [(__CFString *)v21 length];
    int v24 = 0;
    if (v22 != @" " && v23) {
      int v24 = [(__CFString *)v22 isEqualToString:@" "] ^ 1;
    }
  }
  else
  {
    int v24 = 0;
  }

  BOOL v25 = PKPassPaymentFrontFaceValueFont(v24);
  [v20 setValueFont:v25];

  int v26 = [(PKPassBucketTemplate *)v3 defaultFieldTemplate];
  [v26 setVerticalPadding:-3.0];

  BOOL v27 = [(PKPassBucketTemplate *)v3 defaultFieldTemplate];
  [v27 setSuppressesEmptyLabel:1];

  int v28 = [(PKPassBucketTemplate *)v3 defaultFieldTemplate];
  [v28 setTextAlignment:2];

  return v3;
}

- (BOOL)showsShare
{
  return 0;
}

void __56__PKPassPaymentCardFrontFaceView_createBodyContentViews__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [v3 sender];

  [WeakRetained _showFullScreenBarcodeForButton:v4];
}

uint64_t __56__PKPassPaymentCardFrontFaceView_createBodyContentViews__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)_initializeBalanceLabelWithTextColor:(id)a3
{
  if (!self->_balanceLabel)
  {
    double v4 = (objc_class *)MEMORY[0x1E4FB1930];
    id v5 = a3;
    objc_super v6 = (UILabel *)objc_alloc_init(v4);
    balanceLabel = self->_balanceLabel;
    self->_balanceLabel = v6;

    [(UILabel *)self->_balanceLabel setTextColor:v5];
    [(PKPassPaymentCardFrontFaceView *)self _updateBalanceLabelFontSize];
    NSComparisonResult v8 = self->_balanceLabel;
    [(PKPassFrontFaceView *)self insertContentView:v8 ofType:0];
  }
}

void __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __54__PKPassPaymentCardFrontFaceView_setShowsLiveBalance___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (!WeakRetained[118])
    {
      id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 addObserver:v5 selector:sel__handleAccountChanged_ name:*MEMORY[0x1E4F85BF8] object:0];
    }
    id v4 = [MEMORY[0x1E4FB1618] blackColor];
    [v5 _initializeBalanceLabelWithTextColor:v4];

    [v5 _updateStateForAccount:*(void *)(a1 + 32) animated:0];
    id WeakRetained = v5;
  }
}

- (void)_updateBalanceLabelFontSize
{
  if (self->_balanceLabel)
  {
    id v3 = [(PKPassPaymentCardFrontFaceView *)self traitCollection];
    lhs = [v3 preferredContentSizeCategory];

    if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) == NSOrderedDescending) {
      double v4 = 28.0;
    }
    else {
      double v4 = 24.0;
    }
    id v5 = [(PKPassFaceView *)self pass];
    id v6 = [v5 paymentPass];
    char v7 = [v6 hasAssociatedPeerPaymentAccount];

    balanceLabel = self->_balanceLabel;
    if (v7) {
      objc_msgSend(MEMORY[0x1E4FB08E0], "pk_peerPaymentCashFontOfSize:", v4);
    }
    else {
    objc_super v9 = PKDefaultSystemFontOfSizeAndWeight(v4, *MEMORY[0x1E4FB09D0]);
    }
    [(UILabel *)balanceLabel setFont:v9];

    [(PKPassPaymentCardFrontFaceView *)self setNeedsLayout];
  }
}

uint64_t __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __48__PKPassPaymentCardFrontFaceView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCenter:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)_showFullScreenBarcodeForButton:(id)a3
{
  id v4 = [(PKPassFaceView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 passFaceViewExpandButtonTapped:self];
  }
}

- (void)_updateBalanceWithAmount:(id)a3
{
  id v15 = a3;
  id v4 = [(PKPassFaceView *)self pass];
  id v5 = [v4 paymentPass];
  id v6 = [v5 devicePrimaryPaymentApplication];

  if (!v15)
  {
    balanceLabel = self->_balanceLabel;
LABEL_10:
    [(UILabel *)balanceLabel setText:0];
    goto LABEL_11;
  }
  balanceLabel = self->_balanceLabel;
  if (balanceLabel) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_10;
  }
  objc_super v9 = [v15 minimalFormattedStringValue];
  char v10 = [(PKPassFaceView *)self pass];
  id v11 = [v10 paymentPass];
  int v12 = [v11 hasAssociatedPeerPaymentAccount];

  if (v12)
  {
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
    uint64_t v14 = [v15 minimalFormattedStringValueInLocale:v13];

    objc_super v9 = (void *)v14;
  }
  [(UILabel *)self->_balanceLabel setText:v9];

LABEL_11:
}

- (void)_handleAccountChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassFaceView *)self pass];
  id v6 = [v5 paymentPass];

  if ([v6 associatedAccountFeatureIdentifier] == 4)
  {
    objc_initWeak(&location, self);
    char v7 = [MEMORY[0x1E4F84270] sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke;
    v8[3] = &unk_1E59D1DB0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    [v7 defaultAccountForFeature:4 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to retrieve Apple Balance account with error %@", buf, 0xCu);
    }
  }
  else if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke_66;
    block[3] = &unk_1E59CB378;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v13);
  }
}

void __56__PKPassPaymentCardFrontFaceView__handleAccountChanged___block_invoke_66(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateStateForAccount:*(void *)(a1 + 32) animated:1];
    [*(id *)(a1 + 40) setNeedsLayout];
    id WeakRetained = v3;
  }
}

- (void)_updateStateForAccount:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  self->_accountIsActive = [v12 state] == 1;
  if ([v12 supportsTopUp]) {
    char v6 = 1;
  }
  else {
    char v6 = [v12 supportsAMPTopUp];
  }
  self->_accountSupportsTopUp = v6;
  if (self->_accountIsActive)
  {
    char v7 = [v12 appleBalanceDetails];
    id v8 = [v7 accountSummary];
    uint64_t v9 = [v8 currentBalance];
    char v10 = [v7 currencyCode];
    id v11 = PKCurrencyAmountMake();
    [(PKPassPaymentCardFrontFaceView *)self _updateBalanceWithAmount:v11];
  }
  [(PKPassPaymentCardFrontFaceView *)self _updateAccountBalanceVisibilityAnimated:v4];
}

- (void)_updateAccountBalanceVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_accountIsActive)
  {
    BOOL v5 = [(PKPassFaceView *)self modallyPresented];
    double v6 = 1.0;
    if (v5)
    {
      double v6 = 0.0;
      if (!self->_accountSupportsTopUp) {
        double v6 = 1.0;
      }
    }
    if (v3) {
      goto LABEL_6;
    }
  }
  else
  {
    double v6 = 0.0;
    if (a3)
    {
LABEL_6:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __74__PKPassPaymentCardFrontFaceView__updateAccountBalanceVisibilityAnimated___block_invoke;
      v8[3] = &unk_1E59CB460;
      v8[4] = self;
      *(double *)&void v8[5] = v6;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.2];
      return;
    }
  }
  balanceLabel = self->_balanceLabel;

  [(UILabel *)balanceLabel setAlpha:v6];
}

uint64_t __74__PKPassPaymentCardFrontFaceView__updateAccountBalanceVisibilityAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 944) setAlpha:*(double *)(a1 + 40)];
}

- (void)_handlePeerPaymentAccountChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPassPaymentCardFrontFaceView__handlePeerPaymentAccountChanged___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__PKPassPaymentCardFrontFaceView__handlePeerPaymentAccountChanged___block_invoke(uint64_t a1)
{
  unint64_t v2 = [MEMORY[0x1E4F84E00] sharedInstance];
  id v5 = [v2 account];

  BOOL v3 = *(void **)(a1 + 32);
  BOOL v4 = [v5 currentBalance];
  [v3 _updateBalanceWithAmount:v4];

  [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)setViewExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PKPassFaceView *)self viewExpanded];
  v8.receiver = self;
  v8.super_class = (Class)PKPassPaymentCardFrontFaceView;
  [(PKPassFaceView *)&v8 setViewExpanded:v3];
  if (v5 != v3)
  {
    double v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      BOOL v10 = v3;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassPaymentCardFrontFaceView setting viewExpanded: %ld", buf, 0xCu);
    }

    if (v3) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    [(PKBackdropView *)self->_backdropView setAlpha:v7];
    [(UIView *)self->_scrimView setAlpha:v7];
    [(PKPassPaymentCardFrontFaceView *)self setNeedsLayout];
  }
}

- (void)setDynamicBarcodeData:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPassFaceView *)self dynamicBarcodeData];
  char v6 = PKEqualObjects();

  v33.receiver = self;
  v33.super_class = (Class)PKPassPaymentCardFrontFaceView;
  [(PKPassFaceView *)&v33 setDynamicBarcodeData:v4];
  if ((v6 & 1) == 0)
  {
    PKPassFrontFaceContentSize();
    double v7 = self->_topBarcodeView;
    topBarcodeView = self->_topBarcodeView;
    self->_topBarcodeView = 0;

    if (v7)
    {
      [(NSMutableArray *)self->_oldTopBarcodeViews addObject:v7];
      objc_initWeak(&location, self->_oldTopBarcodeViews);
      uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke;
      v30[3] = &unk_1E59CA7D0;
      uint64_t v31 = v7;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_2;
      v27[3] = &unk_1E59D3908;
      int v28 = v31;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v9, "pkui_animateUsingOptions:animations:completion:", 4, v30, v27);
      objc_destroyWeak(&v29);

      objc_destroyWeak(&location);
    }
    BOOL v10 = self->_bottomBarcodeView;
    bottomBarcodeView = self->_bottomBarcodeView;
    self->_bottomBarcodeView = 0;

    if (v10)
    {
      [(NSMutableArray *)self->_oldBottomBarcodeViews addObject:v10];
      objc_initWeak(&location, self->_oldBottomBarcodeViews);
      id v12 = (void *)MEMORY[0x1E4FB1EB0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_3;
      v25[3] = &unk_1E59CA7D0;
      int v26 = v10;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_4;
      v22[3] = &unk_1E59D3908;
      uint64_t v23 = v26;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v12, "pkui_animateUsingOptions:animations:completion:", 4, v25, v22);
      objc_destroyWeak(&v24);

      objc_destroyWeak(&location);
    }
    if (v4)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F84558]);
      [v13 setFormat:1];
      [v13 setMessageData:v4];
      uint64_t v14 = [[PKBarcodeStickerView alloc] initWithBarcode:v13 validityState:0];
      id v15 = self->_bottomBarcodeView;
      self->_bottomBarcodeView = v14;

      if ((PKShowBarcodeForScreenshotAndBroadcasting() & 1) == 0) {
        [(UIView *)self->_bottomBarcodeView pkui_setExcludedFromScreenCapture:1 andBroadcasting:1];
      }
      [(PKBarcodeStickerView *)self->_bottomBarcodeView setShouldMatteCode:0];
      [(PKBarcodeStickerView *)self->_bottomBarcodeView setAccessibilityElementsHidden:1];
      PKFloatRoundToPixel();
      -[PKBarcodeStickerView setDesiredBarcodeSize:](self->_bottomBarcodeView, "setDesiredBarcodeSize:", v16, v16);
      [(UIView *)self->_scrimView addSubview:self->_bottomBarcodeView];
      [(PKBarcodeStickerView *)self->_bottomBarcodeView sizeToFit];
      id v17 = objc_alloc_init(MEMORY[0x1E4F84558]);
      [v17 setFormat:4];
      [v17 setMessageData:v4];
      [v17 setShouldRemoveQuietZone:1];
      double v18 = [[PKBarcodeStickerView alloc] initWithBarcode:v17 validityState:0];
      double v19 = self->_topBarcodeView;
      self->_topBarcodeView = v18;

      if ((PKShowBarcodeForScreenshotAndBroadcasting() & 1) == 0) {
        [(UIView *)self->_topBarcodeView pkui_setExcludedFromScreenCapture:1 andBroadcasting:1];
      }
      double v20 = self->_topBarcodeView;
      [(PKPassPaymentCardFrontFaceView *)self _barcodeSize];
      -[PKBarcodeStickerView setDesiredBarcodeSize:](v20, "setDesiredBarcodeSize:");
      [(PKBarcodeStickerView *)self->_topBarcodeView setShouldMatteCode:0];
      [(PKBarcodeStickerView *)self->_topBarcodeView setAccessibilityElementsHidden:1];
      [(UIView *)self->_scrimView addSubview:self->_topBarcodeView];
      [(PKBarcodeStickerView *)self->_topBarcodeView sizeToFit];
      [(PKPassPaymentCardFrontFaceView *)self setNeedsLayout];
      [(PKPassPaymentCardFrontFaceView *)self layoutIfNeeded];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_5;
      v21[3] = &unk_1E59CA7D0;
      v21[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 4, v21, 0);
    }
  }
}

uint64_t __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained removeObject:*(void *)(a1 + 32)];
  }
}

uint64_t __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained removeObject:*(void *)(a1 + 32)];
  }
}

uint64_t __56__PKPassPaymentCardFrontFaceView_setDynamicBarcodeData___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 968) setAlpha:1.0];
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 976);

  return [v2 setAlpha:1.0];
}

- (CGSize)_barcodeSize
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  if (v2 > 0xE)
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v3 = dbl_1A0444000[v2];
    double v4 = dbl_1A0444078[v2];
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactBankLogoView, 0);
  objc_storeStrong((id *)&self->_fullScreenButton, 0);
  objc_storeStrong((id *)&self->_oldBottomBarcodeViews, 0);
  objc_storeStrong((id *)&self->_oldTopBarcodeViews, 0);
  objc_storeStrong((id *)&self->_bottomBarcodeView, 0);
  objc_storeStrong((id *)&self->_topBarcodeView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);

  objc_storeStrong((id *)&self->_balanceLabel, 0);
}

@end