@interface PKExpressTransactionBannerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isBannerDetached;
- (NSString)associatedAppBundleIdentifier;
- (NSURL)launchURL;
- (PKBannerHandleState)bannerState;
- (PKBannerViewControllerPresentable)presentable;
- (PKExpressTransactionBannerViewController)init;
- (PKExpressTransactionBannerViewController)initWithCoder:(id)a3;
- (PKExpressTransactionBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredCustomLayout;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)_cancelRevokeTimer;
- (void)_displayResolution;
- (void)_revoked;
- (void)_startRevokeTimer;
- (void)_updateBalanceContent;
- (void)_updatePreferredContentSize;
- (void)dealloc;
- (void)expressLabelViewDidChangeSize:(id)a3;
- (void)expressTrailingView:(id)a3 revealingCheckmarkAnimated:(BOOL)a4;
- (void)loadView;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setBannerDetached:(BOOL)a3;
- (void)setBannerState:(id)a3;
- (void)setPresentable:(id)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation PKExpressTransactionBannerViewController

- (PKExpressTransactionBannerViewController)init
{
  return 0;
}

- (PKExpressTransactionBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKExpressTransactionBannerViewController)initWithCoder:(id)a3
{
  return 0;
}

void __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:a1[5]];
    uint64_t v4 = *(void *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  v6 = a1[6];

  dispatch_group_leave(v6);
}

void __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[123] setTransitProperties:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    [v3[123] setDynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    -[PKExpressTransactionBannerViewController _updateBalanceContent](v3);
    WeakRetained = v3;
  }
}

- (void)_updateBalanceContent
{
  if (!a1 || ![a1 isViewLoaded]) {
    return;
  }
  uint64_t v2 = a1[127];
  uint64_t v3 = (void *)a1[123];
  if (v3)
  {
    id v4 = [v3 displayableBalances];
    v5 = v4;
    if (v4 && [v4 count])
    {
      v6 = [v5 objectAtIndexedSubscript:0];
      v7 = [v6 formattedValue];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v14 = v7;
  if (v2)
  {
    id v8 = *(id *)(v2 + 416);
    id v9 = v14;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      if (v9 && v8)
      {
        char v11 = [v8 isEqualToString:v9];

        if (v11) {
          goto LABEL_20;
        }
      }
      else
      {
      }
      uint64_t v12 = [v10 copy];
      v13 = *(void **)(v2 + 416);
      *(void *)(v2 + 416) = v12;

      -[PKExpressBannerLabelView _updateLabelAnimated:](v2);
    }
  }
LABEL_20:
}

- (void)dealloc
{
  transitionTimer = self->_transitionTimer;
  if (transitionTimer) {
    dispatch_source_cancel(transitionTimer);
  }
  revokeTimer = self->_revokeTimer;
  if (revokeTimer) {
    dispatch_source_cancel(revokeTimer);
  }
  [(PKPaymentService *)self->_paymentService setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)PKExpressTransactionBannerViewController;
  [(PKExpressTransactionBannerViewController *)&v5 dealloc];
}

- (void)loadView
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v92.receiver = self;
  v92.super_class = (Class)PKExpressTransactionBannerViewController;
  [(PKExpressTransactionBannerViewController *)&v92 loadView];
  uint64_t v3 = [(PKExpressTransactionBannerViewController *)self view];
  [v3 setAutoresizingMask:0];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  objc_super v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v6 = 1000;
  containerView = self->_containerView;
  self->_containerView = v5;

  [(UIView *)self->_containerView setOpaque:0];
  id v8 = self->_containerView;
  id v9 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)v8 setBackgroundColor:v9];

  v10 = [PKExpressBannerLeadingView alloc];
  pass = self->_pass;
  uint64_t v12 = pass;
  v13 = v12;
  v91 = v3;
  if (!v10) {
    goto LABEL_46;
  }
  if (!v12) {
    goto LABEL_45;
  }
  id v14 = PKPassKitUIBundle();
  v15 = [v14 URLForResource:@"aperture_express_leading-D73" withExtension:@"ca"];

  if (!v15)
  {
    v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96.receiver) = 0;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: could not find archive.", (uint8_t *)&v96, 2u);
    }
    v19 = 0;
    goto LABEL_25;
  }
  uint64_t v16 = *MEMORY[0x1E4F3A4C0];
  v93.receiver = 0;
  v17 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v15 type:v16 options:0 error:&v93];
  v18 = v93.receiver;
  if (!v17)
  {
    p_super = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v96.receiver) = 138412290;
      *(id *)((char *)&v96.receiver + 4) = v18;
      _os_log_impl(&dword_19F450000, p_super, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: could not load archive - %@.", (uint8_t *)&v96, 0xCu);
    }
    v19 = 0;
    goto LABEL_24;
  }
  v19 = [v17 rootLayer];
  if (!v19)
  {
    p_super = 0;
    v46 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96.receiver) = 0;
      _os_log_impl(&dword_19F450000, v46, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: archive has no content.", (uint8_t *)&v96, 2u);
      v19 = 0;
    }
    goto LABEL_23;
  }
  uint64_t v20 = [v17 isGeometryFlipped];
  obj = v19;
  [(PKExpressBannerLeadingView *)v19 setGeometryFlipped:v20];
  uint64_t v21 = [v17 publishedObjectWithName:@"cardfront"];
  if (!v21) {
    goto LABEL_20;
  }
  v22 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_20:
    v46 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96.receiver) = 0;
      _os_log_impl(&dword_19F450000, v46, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: missing card front.", (uint8_t *)&v96, 2u);
    }
    v19 = 0;
    p_super = &obj->super.super.super;
    goto LABEL_23;
  }
  v88 = v22;
  v96.receiver = v10;
  v96.super_class = (Class)PKExpressBannerLeadingView;
  v23 = -[PKExpressTransactionBannerViewController initWithFrame:](&v96, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v24 = (uint64_t)v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->super._accessibilityHUD, obj);
    v86 = *(void **)(v24 + 432);
    v25 = PKLayerNullActions();
    [v86 setActions:v25];

    objc_storeStrong((id *)(v24 + 440), v88);
    objc_storeStrong((id *)(v24 + 408), pass);
    id v26 = -[PKPassThumbnailView initWithPass:suppressedContent:rendererState:options:]([PKPassThumbnailView alloc], *(void **)(v24 + 408), 0, 0, 2);
    v27 = *(void **)(v24 + 416);
    *(void *)(v24 + 416) = v26;

    -[PKPassThumbnailView setModallyPresented:](*(void *)(v24 + 416), 1);
    -[PKPassThumbnailView setBrighten:](*(void *)(v24 + 416), 1);
    -[PKPassThumbnailView setShadowVisibility:](*(void *)(v24 + 416), 0.0);
    [(id)v24 addSubview:*(void *)(v24 + 416)];
    v28 = [(id)v24 layer];
    [v28 addSublayer:*(void *)(v24 + 432)];
    v87 = [*(id *)(v24 + 416) layer];
    uint64_t v29 = [MEMORY[0x1E4F39C40] layer];
    v30 = *(void **)(v24 + 424);
    *(void *)(v24 + 424) = v29;

    [*(id *)(v24 + 424) setSourceLayer:v87];
    [*(id *)(v24 + 424) setHidesSourceLayer:1];
    [*(id *)(v24 + 424) setGeometryFlipped:v20];
    [*(id *)(v24 + 440) addSublayer:*(void *)(v24 + 424)];
    [*(id *)(v24 + 440) bounds];
    objc_msgSend(*(id *)(v24 + 416), "sizeThatFits:", v31, 1.79769313e308);
    PKSizeAlignedInRect();
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    objc_msgSend(*(id *)(v24 + 416), "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    objc_msgSend(*(id *)(v24 + 424), "setFrame:", v33, v35, v37, v39);
    uint64_t v40 = [objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:*(void *)(v24 + 432)];
    v41 = *(void **)(v24 + 448);
    *(void *)(v24 + 448) = v40;

    [*(id *)(v24 + 448) setInitialStatesOfLayer:*(void *)(v24 + 432)];
    *(_DWORD *)(v24 + 456) = 0;
    *(_DWORD *)(v24 + 460) = 0;
    [*(id *)(v24 + 432) bounds];
    *(void *)(v24 + 480) = v42;
    *(void *)(v24 + 488) = v43;
    *(float64x2_t *)(v24 + 496) = vaddq_f64(*(float64x2_t *)(v24 + 480), (float64x2_t)vdupq_n_s64(0xC051000000000000));
    *(_OWORD *)(v24 + 512) = *(_OWORD *)(v24 + 480);
    *(_OWORD *)(v24 + 528) = *(_OWORD *)(v24 + 496);
    *(_OWORD *)(v24 + 544) = ArchiveAlignmentInsets;
    *(_OWORD *)(v24 + 560) = unk_1A0445BD8;
    [v28 anchorPoint];
    objc_msgSend(*(id *)(v24 + 432), "setAnchorPoint:", (v44 * *(double *)(v24 + 496) + 35.0) / *(double *)(v24 + 480), (v45 * *(double *)(v24 + 504) + 17.0) / *(double *)(v24 + 488));
    -[PKExpressBannerLeadingView _updateSizeWithAnimationFactory:](v24, 0);
  }
  v10 = (PKExpressBannerLeadingView *)(id)v24;
  v19 = v10;
  v46 = v88;
  p_super = &obj->super.super.super;
LABEL_23:

LABEL_24:
LABEL_25:

  while (1)
  {

    leadingView = self->_leadingView;
    self->_leadingView = v19;

    v49 = [PKExpressBannerTrailingView alloc];
    v50 = (double *)MEMORY[0x1E4F1DB28];
    uint64_t v90 = v6;
    if (v49)
    {
      v93.receiver = v49;
      v93.super_class = (Class)PKExpressBannerTrailingView;
      double v51 = *MEMORY[0x1E4F1DB28];
      double v52 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v53 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v54 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v55 = -[PKExpressTransactionBannerViewController initWithFrame:](&v93, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v52, v53, v54);
      v56 = (PKExpressBannerTrailingView *)v55;
      if (v55)
      {
        LODWORD(v55->super._frozenTraitCollection) = 0;
        v57 = [PKExpressGlyphView alloc];
        if (v57)
        {
          v96.receiver = v57;
          v96.super_class = (Class)PKExpressGlyphView;
          v58 = -[PKExpressTransactionBannerViewController initWithFrame:](&v96, sel_initWithFrame_, v51, v52, v53, v54);
          uint64_t v59 = (uint64_t)v58;
          if (v58)
          {
            v58->super._traitChangeRegistry = (_UITraitChangeRegistry *)0x4047000000000000;
            uint64_t v60 = [objc_alloc(MEMORY[0x1E4F88120]) initWithStyle:7];
            v61 = *(void **)(v59 + 432);
            *(void *)(v59 + 432) = v60;

            objc_msgSend(*(id *)(v59 + 432), "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *(double *)(v59 + 424), *(double *)(v59 + 424));
            [*(id *)(v59 + 432) setDelegate:v59];
            [(id)v59 addSubview:*(void *)(v59 + 432)];
            *(_DWORD *)(v59 + 408) = 0;
            -[PKExpressGlyphView _updateGlyphViewAnimated:](v59, 0);
          }
        }
        else
        {
          uint64_t v59 = 0;
        }
        glyphView = v56->_glyphView;
        v56->_glyphView = (PKExpressGlyphView *)v59;

        [(PKExpressBannerTrailingView *)v56 addSubview:v56->_glyphView];
        v63 = v56->_glyphView;
        if (v63) {
          objc_storeWeak((id *)&v63->_delegate, v56);
        }
        -[PKExpressBannerTrailingView _updateStateAnimated:withDelay:]((uint64_t)v56, 0, 0.0);
        v64 = [(PKExpressBannerTrailingView *)v56 layer];
        long long v65 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        long long v98 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        long long v99 = v65;
        long long v100 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        uint64_t v66 = *(void *)(MEMORY[0x1E4F39B10] + 80);
        long long v67 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        objc_super v96 = (objc_super)*MEMORY[0x1E4F39B10];
        long long v97 = v67;
        uint64_t v101 = v66;
        unint64_t v102 = 0xBF739354D8AD2CBELL;
        long long v68 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        long long v103 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        long long v104 = v68;
        [v64 setSublayerTransform:&v96];
      }
    }
    else
    {
      v56 = 0;
    }
    uint64_t v6 = (uint64_t)&OBJC_IVAR___PKExpressTransactionBannerViewController__trailingView;
    trailingView = self->_trailingView;
    self->_trailingView = v56;

    v70 = [(PKExpressBannerTrailingView *)self->_trailingView layer];
    id v71 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v13 = (PKPass *)*MEMORY[0x1E4F3A0D0];
    v72 = (void *)[v71 initWithType:*MEMORY[0x1E4F3A0D0]];
    [v72 setName:@"blur"];
    v95 = v72;
    v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
    [v70 setFilters:v73];

    self->_trailingBlur = 0.0;
    v74 = [PKExpressBannerLabelView alloc];
    if (!v74) {
      break;
    }
    v96.receiver = v74;
    v96.super_class = (Class)PKExpressBannerLabelView;
    v75 = -[PKExpressTransactionBannerViewController initWithFrame:](&v96, sel_initWithFrame_, *v50, v50[1], v50[2], v50[3]);
    v76 = (PKExpressBannerLabelView *)v75;
    if (!v75) {
      goto LABEL_38;
    }
    LODWORD(v75->super._frozenTraitCollection) = 0;
    uint64_t frozenTraitCollection_low = SLODWORD(v75->super._frozenTraitCollection);
    if (frozenTraitCollection_low < 4)
    {
      -[PKExpressTransactionBannerViewController setAnchorPoint:](v75, "setAnchorPoint:", dbl_1A0445C90[frozenTraitCollection_low], dbl_1A0445C70[frozenTraitCollection_low]);
      goto LABEL_38;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    v19 = 0;
  }
  v76 = 0;
LABEL_38:
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v76;

  v79 = [(PKExpressBannerLabelView *)self->_trailingLabel layer];
  v80 = (void *)[objc_alloc(MEMORY[0x1E4F39BC0]) initWithType:v13];
  [v80 setName:@"blur"];
  v94 = v80;
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
  [v79 setFilters:v81];

  self->_trailingLabelBlur = 0.0;
  [(PKExpressBannerLabelView *)self->_trailingLabel setHidden:1];
  [(PKExpressBannerLabelView *)self->_trailingLabel setAlpha:0.0];
  v82 = [*(id *)((char *)&self->super.super.super.isa + v90) layer];
  [v82 setAllowsHitTesting:0];

  [*(id *)((char *)&self->super.super.super.isa + v90) setUserInteractionEnabled:0];
  v83 = self->_leadingView;
  if (v83) {
    objc_storeWeak((id *)&v83->_delegate, self);
  }
  v84 = self->_trailingView;
  if (v84) {
    objc_storeWeak((id *)&v84->_delegate, self);
  }
  v85 = self->_trailingLabel;
  if (v85) {
    objc_storeWeak((id *)&v85->_delegate, self);
  }
  [v91 addSubview:*(Class *)((char *)&self->super.super.super.isa + v90)];
  [*(id *)((char *)&self->super.super.super.isa + v90) addSubview:self->_trailingLabel];
  [*(id *)((char *)&self->super.super.super.isa + v90) addSubview:self->_trailingView];
  [*(id *)((char *)&self->super.super.super.isa + v90) addSubview:self->_leadingView];
  -[PKExpressTransactionBannerViewController _updateBalanceContent](self);
}

- (void)viewWillLayoutSubviews
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  v128.receiver = self;
  v128.super_class = (Class)PKExpressTransactionBannerViewController;
  [(PKExpressTransactionBannerViewController *)&v128 viewWillLayoutSubviews];
  int64_t activeLayoutMode = self->_activeLayoutMode;
  if (activeLayoutMode == 4 || activeLayoutMode == 1)
  {
    objc_super v5 = [(PKExpressTransactionBannerViewController *)self view];
    int v95 = [v5 _shouldReverseLayoutDirection];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_msgSend(v5, "SBUISA_systemApertureObstructedAreaLayoutGuide");
    [v14 layoutFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    containerView = self->_containerView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](containerView, "setFrame:");
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", v5, v7, v9, v11, v13);
    double v25 = v24;
    uint64_t v27 = v26;
    double v29 = v28;
    uint64_t v31 = v30;
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", v5, v16, v18, v20, v22);
    uint64_t v92 = v33;
    uint64_t v93 = v32;
    double v35 = v34;
    double v37 = v36;

    if ((self->_state - 3) <= 2)
    {
      PKSizeAlignedInRect();
      double v25 = v38;
      uint64_t v27 = v39;
      double v29 = v40;
      uint64_t v31 = v41;
    }
    if (self->_transitioning) {
      int v42 = 1;
    }
    else {
      int v42 = [MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled];
    }
    uint64_t v43 = 2;
    if (!v95) {
      uint64_t v43 = 0x200000000;
    }
    double v44 = fmax(v35, v25);
    double v45 = v44 - v25;
    double v46 = fmax(v35 + v37, v44);
    double v47 = fmax(v25 + v29, v46) - v46;
    if (v95) {
      double v48 = v46;
    }
    else {
      double v48 = v25;
    }
    if (v95) {
      double v49 = v47;
    }
    else {
      double v49 = v45;
    }
    double v88 = v48;
    double v89 = v49;
    if (v95) {
      double v50 = v25;
    }
    else {
      double v50 = v46;
    }
    if (v95) {
      double v51 = v45;
    }
    else {
      double v51 = v47;
    }
    double v90 = v50;
    double v91 = v51;
    unsigned int state = self->_state;
    if (state < 0xA)
    {
      HIDWORD(v84) = state != 0;
      BOOL v85 = self->_activeLayoutMode > 1uLL;
      uint64_t v87 = v43;
      LODWORD(v84) = (self->_state & 0x3FF) == 9;
      char v86 = v42;
      if (v42)
      {
        v94 = (void *)[objc_alloc(MEMORY[0x1E4F88168]) initWithMass:2.0 stiffness:300.0 damping:50.0];
        int v56 = self->_state;
        if ((v56 - 3) >= 4)
        {
          if (v56 == 9) {
            [v94 setSpeed:0.85];
          }
        }
        else
        {
          LODWORD(v53) = 1049830265;
          LODWORD(v54) = *(_DWORD *)"ŏ)?-&v?";
          LODWORD(v55) = *(_DWORD *)"-&v?";
          v57 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v53 :0.0 :v54 :v55];
          [v94 setTiming:v57 withDynamicDurationProvider:&__block_literal_global_237];
        }
        v58 = (void *)[objc_alloc(MEMORY[0x1E4F88168]) initWithMass:2.0 stiffness:300.0 damping:50.0];
        int v60 = self->_state;
        if ((v60 - 3) > 3)
        {
          uint64_t v59 = 0;
        }
        else
        {
          uint64_t v59 = (void *)[v94 copy];
          [v59 setSpeed:1.176];
          int v60 = self->_state;
        }
      }
      else
      {
        v94 = 0;
        v58 = 0;
        uint64_t v59 = 0;
        int v60 = self->_state;
      }
      leadingView = self->_leadingView;
      if (v60 > 2) {
        int v62 = 2;
      }
      else {
        int v62 = dword_1A0445C60[v60];
      }
      if (v59) {
        v63 = v59;
      }
      else {
        v63 = v58;
      }
      id v64 = v63;
      if (leadingView && leadingView->_sizeClass != v62)
      {
        leadingView->_sizeClass = v62;
        -[PKExpressBannerLeadingView _updateSizeWithAnimationFactory:]((uint64_t)leadingView, v64);
      }

      trailingLabel = self->_trailingLabel;
      if (v95) {
        int v66 = 0;
      }
      else {
        int v66 = 2;
      }
      if (trailingLabel && trailingLabel->_alignmentEdge != v66)
      {
        trailingLabel->_uint64_t alignmentEdge = v66;
        uint64_t alignmentEdge = (int)trailingLabel->_alignmentEdge;
        if (alignmentEdge >= 4) {
          goto LABEL_68;
        }
        double v68 = dbl_1A0445C70[alignmentEdge];
        double v69 = dbl_1A0445C90[alignmentEdge];
        -[UILabel setAnchorPoint:](trailingLabel->_label, "setAnchorPoint:", v69, v68);
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        v70 = trailingLabel->_obsoleteLabels;
        uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v129 objects:&v133 count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v130;
          do
          {
            for (uint64_t i = 0; i != v71; ++i)
            {
              if (*(void *)v130 != v72) {
                objc_enumerationMutation(v70);
              }
              objc_msgSend(*(id *)(*((void *)&v129 + 1) + 8 * i), "setAnchorPoint:", v69, v68, v84);
            }
            uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v129 objects:&v133 count:16];
          }
          while (v71);
        }

        -[PKExpressBannerLabelView setAnchorPoint:](trailingLabel, "setAnchorPoint:", v69, v68);
        [(PKExpressBannerLabelView *)trailingLabel setNeedsLayout];
      }
      trailingView = self->_trailingView;
      if (self->_transitioning)
      {
        double v75 = 0.28;
        if (self->_state != 3) {
          double v75 = 0.0;
        }
      }
      else
      {
        double v75 = 0.0;
      }
      unsigned int v76 = (0x3F8u >> state) & 1;
      if (trailingView)
      {
        if (trailingView->_state != v76)
        {
          trailingView->_unsigned int state = v76;
          -[PKExpressBannerTrailingView _updateStateAnimated:withDelay:]((uint64_t)trailingView, v76, v75);
        }
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_4;
      aBlock[3] = &unk_1E59DEEC8;
      aBlock[4] = self;
      v77 = _Block_copy(aBlock);
      uint64_t v133 = 0;
      v134 = (CGRect *)&v133;
      uint64_t v135 = 0x4010000000;
      v136 = "";
      long long v78 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      long long v137 = *MEMORY[0x1E4F1DB20];
      long long v138 = v78;
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_5;
      v96[3] = &unk_1E59DEF90;
      id v79 = v77;
      id v101 = v79;
      id v80 = v59;
      id v97 = v80;
      id v81 = v58;
      char v121 = v86;
      char v122 = BYTE4(v84);
      BOOL v123 = v85;
      char v124 = (0x3F8u >> state) & 1;
      id v98 = v81;
      long long v99 = self;
      char v125 = v84;
      double v103 = v35;
      uint64_t v104 = v93;
      double v105 = v37;
      uint64_t v106 = v92;
      double v107 = v25;
      uint64_t v108 = v27;
      double v109 = v29;
      uint64_t v110 = v31;
      char v126 = v95;
      double v111 = v88;
      uint64_t v112 = v27;
      double v113 = v89;
      uint64_t v114 = v31;
      double v115 = v90;
      uint64_t v116 = v27;
      double v117 = v91;
      uint64_t v118 = v31;
      uint64_t v119 = v87;
      uint64_t v120 = v87;
      unint64_t v102 = &v133;
      id v82 = v94;
      id v100 = v82;
      v83 = (void (**)(void *, void))_Block_copy(v96);
      v83[2](v83, 0);
      v83[2](v83, 1);
      if (!CGRectIsNull(v134[1]))
      {
        v83[2](v83, 2);

        _Block_object_dispose(&v133, 8);
        return;
      }
    }
LABEL_68:
    __break(1u);
  }
}

double __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_3(double a1, double a2, double a3, double a4, double a5)
{
  return a5 * 2.5;
}

void *__66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_4(void *result, unsigned int a2)
{
  if (a2 < 3) {
    return *(id *)(result[4] + *off_1E59DF090[a2]);
  }
  __break(1u);
  return result;
}

void __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_5(uint64_t a1, unsigned int a2)
{
  id v4 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  objc_super v5 = [v4 layer];
  if (a2 || (double v6 = *(void **)(a1 + 32)) == 0) {
    double v6 = *(void **)(a1 + 40);
  }
  id v7 = v6;
  if (*(unsigned char *)(a1 + 224)) {
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
  }
  else {
    double v8 = 0;
  }
  uint64_t v112 = 0;
  double v113 = (double *)&v112;
  uint64_t v114 = 0x2020000000;
  uint64_t v115 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_6;
  aBlock[3] = &unk_1E59DEEF0;
  double v111 = &v112;
  id v9 = v8;
  id v110 = v9;
  double v10 = _Block_copy(aBlock);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_7;
  v106[3] = &unk_1E59DEF18;
  uint64_t v108 = &v112;
  id v11 = v9;
  id v107 = v11;
  double v12 = _Block_copy(v106);
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_8;
  v96[3] = &unk_1E59DEF68;
  unsigned int v102 = a2;
  char v103 = *(unsigned char *)(a1 + 225);
  __int16 v104 = *(_WORD *)(a1 + 226);
  void v96[4] = *(void *)(a1 + 48);
  id v13 = v7;
  id v97 = v13;
  id v14 = v10;
  long long v99 = v4;
  id v100 = v14;
  char v105 = *(unsigned char *)(a1 + 228);
  id v98 = v5;
  id v15 = v12;
  id v101 = v15;
  double v16 = (void (**)(void, double, double))_Block_copy(v96);
  double v17 = v16;
  if (a2 < 2)
  {
    int v18 = *(_DWORD *)(*(void *)(a1 + 48) + 1056);
    if ((v18 - 3) >= 7)
    {
      if ((v18 - 1) >= 2)
      {
        double v23 = 0.0;
        double v24 = 0.0;
        double v25 = 0.0;
        double v26 = 0.0;
        if (!v18)
        {
          v16[2](v16, *(double *)(a1 + 96), *(double *)(a1 + 104));
          PKSizeAlignedInRect();
          double v25 = v83;
          double v24 = v84;
          double v23 = v85;
          double v26 = v86 + 22.0;
        }
        goto LABEL_28;
      }
      v120.origin.CGFloat x = *(CGFloat *)(a1 + 112);
      v120.origin.CGFloat y = *(double *)(a1 + 88) + *(double *)(a1 + 104);
      v120.size.double width = *(CGFloat *)(a1 + 128);
      v120.size.double height = *(double *)(a1 + 120) + *(double *)(a1 + 136) - v120.origin.y;
      memset(&remainder, 0, sizeof(remainder));
      CGRect slice = v120;
      CGRectDivide(v120, &remainder, &slice, 6.0, CGRectMinYEdge);
      v17[2](v17, slice.size.width, slice.size.height);
      PKSizeAlignedInRect();
    }
    else
    {
      PKFloatRoundToPixel();
      if (a2)
      {
        double v19 = (CGRect *)(a1 + 176);
        double v20 = (CGFloat *)(a1 + 184);
        double v21 = (double *)(a1 + 192);
        double v22 = (double *)(a1 + 200);
      }
      else
      {
        double v19 = (CGRect *)(a1 + 144);
        double v20 = (CGFloat *)(a1 + 152);
        double v21 = (double *)(a1 + 160);
        double v22 = (double *)(a1 + 168);
      }
      double v49 = *v22;
      double v50 = *v21;
      CGFloat x = v19->origin.x;
      CGFloat rect = *v20;
      v116.origin.CGFloat x = *(double *)(a1 + 112) + 10.0;
      v116.origin.CGFloat y = *(double *)(a1 + 120) + 10.0;
      v116.size.double width = *(double *)(a1 + 128) + -20.0;
      v116.size.double height = *(double *)(a1 + 136) + -20.0;
      CGRect v121 = CGRectIntersection(v116, *v19);
      double width = v121.size.width;
      double height = v121.size.height;
      BOOL IsNull = CGRectIsNull(v121);
      if (IsNull) {
        v56.n128_f64[0] = v49;
      }
      else {
        v56.n128_f64[0] = height;
      }
      if (IsNull) {
        v55.n128_f64[0] = v50;
      }
      else {
        v55.n128_f64[0] = width;
      }
      ((void (*)(void (**)(void, double, double), __n128, __n128))v17[2])(v17, v55, v56);
      PKFloatRoundToPixel();
      double v58 = v57;
      PKFloatRoundToPixel();
      double v59 = fmax(v58, 10.0);
      memset(&remainder, 0, sizeof(remainder));
      CGFloat v60 = rect;
      slice.origin.CGFloat x = x;
      slice.origin.CGFloat y = rect;
      slice.size.double width = v50;
      slice.size.double height = v49;
      uint64_t v61 = 212;
      if (!a2) {
        uint64_t v61 = 208;
      }
      CGFloat v62 = x;
      double v63 = v50;
      double v64 = v49;
      CGRectDivide(*(CGRect *)(&v60 - 1), &remainder, &slice, v59, *(CGRectEdge *)(a1 + v61));
      PKSizeAlignedInRect();
    }
    double v26 = v45;
    double v25 = v46;
    double v24 = v47;
    double v23 = v48;
LABEL_28:
    if (a2)
    {
      long long v65 = *(double **)(*(void *)(a1 + 72) + 8);
      v65[4] = v26;
      v65[5] = v25;
      v65[6] = v24;
      v65[7] = v23;
    }
    goto LABEL_32;
  }
  double v23 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  if (a2 != 2)
  {
LABEL_32:
    [v5 anchorPoint];
    double v72 = v71;
    double v74 = v73;
    [v5 position];
    double v77 = v75.n128_f64[0];
    double v78 = v76;
    double v79 = v26 + v72 * v24;
    double v80 = v25 + v74 * v23;
    if (v79 != v75.n128_f64[0] || v80 != v76)
    {
      if (*(void *)(a1 + 56))
      {
        if (v75.n128_f64[0] != v79)
        {
          uint64_t v82 = *(void *)(a1 + 48);
          if (*(unsigned char *)(v82 + 992))
          {
            v75.n128_u64[0] = 0x3F8EB851EB851EB8;
            if (*(_DWORD *)(v82 + 1056) != 1) {
              v75.n128_f64[0] = 0.0;
            }
          }
          else
          {
            v75.n128_u64[0] = 0;
          }
          v14[2](v14, v75, v77, v79);
        }
        if (v78 != v80)
        {
          uint64_t v88 = *(void *)(a1 + 48);
          if (*(unsigned char *)(v88 + 992))
          {
            v75.n128_u64[0] = 0x3FB3333333333333;
            if (*(_DWORD *)(v88 + 1056) != 3) {
              v75.n128_f64[0] = 0.0;
            }
          }
          else
          {
            v75.n128_u64[0] = 0;
          }
          ((void (*)(void (**)(void, __n128, double, double), void, __CFString *, __n128, double, double))v14[2])(v14, *(void *)(a1 + 56), @"position.y", v75, v78, v80);
        }
      }
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_11;
      v93[3] = &unk_1E59CBCB8;
      v93[4] = v4;
      *(double *)&v93[5] = v79;
      *(double *)&v93[6] = v80;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v93];
    }
    if ([v11 count])
    {
      double v89 = [MEMORY[0x1E4F39B38] animation];
      [v89 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
      [v89 setAnimations:v11];
      [v89 setDuration:v113[3]];
      id v90 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v89);
    }
    _Block_object_dispose(&v112, 8);

    return;
  }
  if (!*(unsigned char *)(a1 + 228))
  {
    CGSize v66 = *(CGSize *)(a1 + 96);
    remainder.origin = *(CGPoint *)(a1 + 80);
    remainder.size = v66;
    goto LABEL_31;
  }
  CGSize v27 = *(CGSize *)(a1 + 192);
  remainder.origin = *(CGPoint *)(a1 + 176);
  remainder.size = v27;
  double v28 = *(double **)(*(void *)(a1 + 72) + 8);
  int v29 = *(_DWORD *)(a1 + 212);
  v27.double width = remainder.origin.x;
  CGFloat y = remainder.origin.y;
  CGFloat v31 = remainder.size.width;
  CGFloat v32 = remainder.size.height;
  CGFloat v33 = v28[4];
  CGFloat v34 = v28[5];
  CGFloat v35 = v28[6];
  CGFloat v36 = v28[7];
  CGRect v117 = CGRectStandardize(*(CGRect *)&v27.width);
  double v37 = v117.origin.x;
  double v38 = v117.origin.y;
  double v39 = v117.size.width;
  double v40 = v117.size.height;
  v122.origin.CGFloat x = v33;
  v122.origin.CGFloat y = v34;
  v122.size.double width = v35;
  v122.size.double height = v36;
  CGRect v118 = CGRectIntersection(v117, v122);
  double v41 = v118.origin.x;
  double v42 = v118.origin.y;
  double v43 = v118.size.width;
  double v44 = v118.size.height;
  if (CGRectIsNull(v118))
  {
LABEL_14:
    remainder.origin.CGFloat x = v37;
    remainder.origin.CGFloat y = v38;
    remainder.size.double width = v39;
    remainder.size.double height = v40;
    memset(&slice, 0, sizeof(slice));
    v119.origin.CGFloat x = v37;
    v119.origin.CGFloat y = v38;
    v119.size.double width = v39;
    v119.size.double height = v40;
    CGRectDivide(v119, &slice, &remainder, 5.0, *(CGRectEdge *)(a1 + 212));
LABEL_31:
    v17[2](v17, remainder.size.width, remainder.size.height);
    PKSizeAlignedInRect();
    double v26 = v67;
    double v25 = v68;
    double v24 = v69;
    double v23 = v70;
    goto LABEL_32;
  }
  switch(v29)
  {
    case 0:
      double v87 = v37 + v39;
      double v37 = fmin(v41 + v43, v37 + v39);
      double v39 = v87 - v37;
      goto LABEL_14;
    case 1:
      double v91 = v38 + v40;
      double v38 = fmin(v42 + v44, v38 + v40);
      double v40 = v91 - v38;
      goto LABEL_14;
    case 2:
      double v39 = fmax(v41 - v37, 0.0);
      goto LABEL_14;
    case 3:
      double v40 = fmax(v42 - v38, 0.0);
      goto LABEL_14;
    default:
      __break(1u);
      break;
  }
}

void __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_6(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  if (a2 && a4 != a5)
  {
    objc_msgSend(a2, "springAnimationWithKeyPath:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", a4, a5);
    if (a3 != 0.0) {
      [v10 setBeginTime:a3];
    }
    [v10 duration];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmax(v9 + a3, *(double *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24));
    [*(id *)(a1 + 32) addObject:v10];
  }
}

void __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_7(uint64_t a1, void *a2, void *a3, _OWORD *a4, _OWORD *a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  if (v11)
  {
    long long v13 = a4[5];
    *(_OWORD *)&a.m31 = a4[4];
    *(_OWORD *)&a.m33 = v13;
    long long v14 = a4[7];
    *(_OWORD *)&a.m41 = a4[6];
    *(_OWORD *)&a.m43 = v14;
    long long v15 = a4[1];
    *(_OWORD *)&a.m11 = *a4;
    *(_OWORD *)&a.m13 = v15;
    long long v16 = a4[3];
    *(_OWORD *)&a.m21 = a4[2];
    *(_OWORD *)&a.m23 = v16;
    long long v17 = a5[5];
    *(_OWORD *)&v31.m31 = a5[4];
    *(_OWORD *)&v31.m33 = v17;
    long long v18 = a5[7];
    *(_OWORD *)&v31.m41 = a5[6];
    *(_OWORD *)&v31.m43 = v18;
    long long v19 = a5[1];
    *(_OWORD *)&v31.m11 = *a5;
    *(_OWORD *)&v31.m13 = v19;
    long long v20 = a5[3];
    *(_OWORD *)&v31.m21 = a5[2];
    *(_OWORD *)&v31.m23 = v20;
    if (!CATransform3DEqualToTransform(&a, &v31))
    {
      double v21 = [v11 springAnimationWithKeyPath:v12];
      long long v22 = a4[5];
      *(_OWORD *)&a.m31 = a4[4];
      *(_OWORD *)&a.m33 = v22;
      long long v23 = a4[7];
      *(_OWORD *)&a.m41 = a4[6];
      *(_OWORD *)&a.m43 = v23;
      long long v24 = a4[1];
      *(_OWORD *)&a.m11 = *a4;
      *(_OWORD *)&a.m13 = v24;
      long long v25 = a4[3];
      *(_OWORD *)&a.m21 = a4[2];
      *(_OWORD *)&a.m23 = v25;
      long long v26 = a5[5];
      *(_OWORD *)&v31.m31 = a5[4];
      *(_OWORD *)&v31.m33 = v26;
      long long v27 = a5[7];
      *(_OWORD *)&v31.m41 = a5[6];
      *(_OWORD *)&v31.m43 = v27;
      long long v28 = a5[1];
      *(_OWORD *)&v31.m11 = *a5;
      *(_OWORD *)&v31.m13 = v28;
      long long v29 = a5[3];
      *(_OWORD *)&v31.m21 = a5[2];
      *(_OWORD *)&v31.m23 = v29;
      objc_msgSend(v21, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v31);
      if (a6 != 0.0) {
        [v21 setBeginTime:a6];
      }
      [v21 duration];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmax(v30 + a6, *(double *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24));
      [*(id *)(a1 + 32) addObject:v21];
    }
  }
}

double __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_8(uint64_t a1, __n128 a2, double a3)
{
  int v4 = *(_DWORD *)(a1 + 80);
  if (v4 == 2)
  {
    double v5 = a3;
    double v6 = a2.n128_f64[0];
    if (*(unsigned char *)(a1 + 85))
    {
      double v43 = (double)*(unsigned __int8 *)(a1 + 87);
      double v8 = 0.0;
      if (*(unsigned char *)(a1 + 87)) {
        goto LABEL_17;
      }
    }
    else
    {
      double v43 = 0.0;
    }
    double v8 = 8.33333333;
LABEL_17:
    uint64_t v9 = *(void *)(a1 + 32);
    double v7 = 1.0;
    if (*(double *)(v9 + 1024) == v8) {
      goto LABEL_38;
    }
    *(double *)(v9 + 1024) = v8;
    if (!*(void *)(a1 + 40)) {
      goto LABEL_37;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v10 + 992))
    {
      a2.n128_u64[0] = 0;
      if (*(_DWORD *)(v10 + 1056) == 9) {
        a2.n128_f64[0] = 0.125;
      }
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  double v6 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v4 == 1)
  {
    if (*(unsigned char *)(a1 + 85))
    {
      double v43 = (double)*(unsigned __int8 *)(a1 + 86);
      if (*(unsigned char *)(a1 + 86))
      {
        double v8 = 0.0;
        double v7 = 1.0;
        goto LABEL_29;
      }
      double v7 = 1.5;
    }
    else
    {
      if (*(unsigned char *)(a1 + 86)) {
        double v7 = 1.0;
      }
      else {
        double v7 = 1.5;
      }
      double v43 = 0.0;
    }
    double v8 = 10.0;
LABEL_29:
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(double *)(v11 + 1040) == v8) {
      goto LABEL_38;
    }
    *(double *)(v11 + 1040) = v8;
    if (!*(void *)(a1 + 40)) {
      goto LABEL_37;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v12 + 992))
    {
      a2.n128_u64[0] = 0x3FD23D70A3D70A3DLL;
      if (*(_DWORD *)(v12 + 1056) != 3) {
        a2.n128_f64[0] = 0.0;
      }
      goto LABEL_36;
    }
LABEL_35:
    a2.n128_u64[0] = 0;
LABEL_36:
    (*(void (**)(__n128))(*(void *)(a1 + 64) + 16))(a2);
LABEL_37:
    long long v13 = *(void **)(a1 + 48);
    long long v14 = [NSNumber numberWithDouble:v8];
    [v13 setValue:v14 forKeyPath:@"filters.blur.inputRadius"];

    goto LABEL_38;
  }
  double v7 = 0.0;
  if (v4)
  {
    a2.n128_u64[0] = 0;
  }
  else
  {
    double v7 = 1.0;
    if (*(unsigned char *)(a1 + 84))
    {
      a2.n128_u8[0] = *(unsigned char *)(a1 + 85);
      a2.n128_f64[0] = (double)a2.n128_u64[0];
    }
    else
    {
      a2.n128_u64[0] = 1.0;
    }
  }
  double v43 = a2.n128_f64[0];
LABEL_38:
  objc_msgSend(*(id *)(a1 + 56), "sizeThatFits:", v6, v5);
  double v18 = v16.n128_f64[0];
  double rect2 = v15.n128_f64[0];
  if (v7 != 1.0)
  {
    v15.n128_f64[0] = v7 * v15.n128_f64[0];
    v16.n128_f64[0] = v7 * v16.n128_f64[0];
    PKSizeRoundToPixel(v15, v16, v17);
  }
  char v19 = objc_msgSend(*(id *)(a1 + 56), "isHidden", v15.n128_u64[0]);
  [*(id *)(a1 + 48) opacity];
  double v21 = v20;
  BOOL v22 = v43 != v20;
  memset(&v66, 0, sizeof(v66));
  CATransform3DMakeScale(&v66, v7, v7, 1.0);
  memset(&v65, 0, sizeof(v65));
  long long v23 = *(void **)(a1 + 48);
  if (v23) {
    [v23 transform];
  }
  CATransform3D a = v65;
  CATransform3D b = v66;
  BOOL v24 = CATransform3DEqualToTransform(&a, &b);
  double v25 = *MEMORY[0x1E4F1DAD8];
  double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [*(id *)(a1 + 48) bounds];
  double x = v67.origin.x;
  double y = v67.origin.y;
  double width = v67.size.width;
  double height = v67.size.height;
  v68.origin.double x = v25;
  v68.origin.double y = v26;
  v68.size.double width = rect2;
  v68.size.double height = v18;
  BOOL v31 = CGRectEqualToRect(v67, v68);
  BOOL v33 = v31;
  if (v43 == v21)
  {
    int v37 = !v24 || !v31;
    if (*(_DWORD *)(a1 + 80)) {
      unsigned __int8 v35 = v19 ^ 1;
    }
    else {
      unsigned __int8 v35 = 0;
    }
  }
  else
  {
    int v34 = *(_DWORD *)(a1 + 80);
    if (v34) {
      unsigned __int8 v35 = v19 ^ 1;
    }
    else {
      unsigned __int8 v35 = 0;
    }
    if (*(void *)(a1 + 40))
    {
      v32.n128_u64[0] = 0;
      if (v34 == 2)
      {
        uint64_t v36 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v36 + 992))
        {
          if (*(_DWORD *)(v36 + 1056) == 9) {
            v32.n128_f64[0] = 0.125;
          }
        }
      }
      (*(void (**)(__n128, double, double))(*(void *)(a1 + 64) + 16))(v32, v21, v43);
    }
    int v37 = 1;
  }
  if (!v24 && *(void *)(a1 + 40))
  {
    double v38 = *(void (**)(double))(*(void *)(a1 + 72) + 16);
    CATransform3D a = v65;
    CATransform3D b = v66;
    v38(0.0);
  }
  if (((v33 | v35 ^ 1) & 1) == 0 && *(void *)(a1 + 40))
  {
    (*(void (**)(double, double, double))(*(void *)(a1 + 64) + 16))(0.0, x, v25);
    (*(void (**)(double, double, double))(*(void *)(a1 + 64) + 16))(0.0, y, v26);
    (*(void (**)(double, double, double))(*(void *)(a1 + 64) + 16))(0.0, width, rect2);
    (*(void (**)(double, double, double))(*(void *)(a1 + 64) + 16))(0.0, height, v18);
  }
  if (v37)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    *(double *)&v45[5] = v43;
    long long v51 = *(_OWORD *)&v66.m33;
    long long v52 = *(_OWORD *)&v66.m41;
    long long v53 = *(_OWORD *)&v66.m43;
    long long v46 = *(_OWORD *)&v66.m11;
    long long v47 = *(_OWORD *)&v66.m13;
    long long v48 = *(_OWORD *)&v66.m21;
    v45[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_9;
    v45[3] = &unk_1E59DEF40;
    char v58 = v19;
    v45[4] = *(void *)(a1 + 56);
    BOOL v59 = v22;
    BOOL v60 = !v24;
    long long v49 = *(_OWORD *)&v66.m23;
    long long v50 = *(_OWORD *)&v66.m31;
    BOOL v61 = !v33;
    double v54 = v25;
    double v55 = v26;
    double v56 = rect2;
    double v57 = v18;
    unsigned __int8 v62 = v35;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v45];
    if (((v33 | v35 ^ 1) & 1) == 0)
    {
      uint64_t v39 = *(void *)(a1 + 40);
      if (v39)
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_10;
        v44[3] = &unk_1E59CA7D0;
        v44[4] = *(void *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingFactory:withDelay:options:animations:completion:", v39, 6, v44, 0, 0.0);
      }
    }
  }
  return v41;
}

uint64_t __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_9(uint64_t result)
{
  uint64_t v1 = result;
  if (*(double *)(result + 40) > 0.0 && *(unsigned char *)(result + 208)) {
    result = [*(id *)(result + 32) setHidden:0];
  }
  if (*(unsigned char *)(v1 + 209)) {
    result = [*(id *)(v1 + 32) setAlpha:*(double *)(v1 + 40)];
  }
  if (*(unsigned char *)(v1 + 210))
  {
    uint64_t v2 = *(void **)(v1 + 32);
    long long v3 = *(_OWORD *)(v1 + 128);
    v7[4] = *(_OWORD *)(v1 + 112);
    v7[5] = v3;
    long long v4 = *(_OWORD *)(v1 + 160);
    v7[6] = *(_OWORD *)(v1 + 144);
    v7[7] = v4;
    long long v5 = *(_OWORD *)(v1 + 64);
    v7[0] = *(_OWORD *)(v1 + 48);
    v7[1] = v5;
    long long v6 = *(_OWORD *)(v1 + 96);
    v7[2] = *(_OWORD *)(v1 + 80);
    v7[3] = v6;
    result = [v2 setTransform3D:v7];
  }
  if (*(unsigned char *)(v1 + 211))
  {
    result = objc_msgSend(*(id *)(v1 + 32), "setBounds:", *(double *)(v1 + 176), *(double *)(v1 + 184), *(double *)(v1 + 192), *(double *)(v1 + 200));
    if (!*(unsigned char *)(v1 + 212)) {
      return [*(id *)(v1 + 32) layoutIfNeeded];
    }
  }
  return result;
}

uint64_t __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    if (!*((unsigned char *)v3 + 1072) && v3[264] == 1)
    {
      val = v3;
      long long v5 = [v3 viewIfLoaded];
      long long v6 = v5;
      if (v5)
      {
        [v5 bounds];
        objc_msgSend(val, "setPreferredContentSize:", v7, v8);
      }
      val[264] = 2;
      -[PKExpressTransactionBannerViewController _updatePreferredContentSize](val);

      long long v3 = val;
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
  }
}

- (void)_updatePreferredContentSize
{
  if (val)
  {
    if ((*((_DWORD *)val + 264) - 2) >= 8)
    {
      __break(1u);
    }
    else if (!val[1160])
    {
      val[1160] = 1;
      objc_initWeak(&location, val);
      uint64_t v2 = [val systemApertureElementContext];
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke;
      v3[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v4, &location);
      [v2 setElementNeedsUpdateWithCoordinatedAnimations:v3];

      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_3;
  v12[3] = &unk_1E59CA7D0;
  id v13 = *(id *)(a1 + 32);
  [v4 performWithoutAnimation:v12];
  *(_DWORD *)(*(void *)(a1 + 40) + 1056) = 1;
  *(unsigned char *)(*(void *)(a1 + 40) + 992) = 1;
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  *(unsigned char *)(*(void *)(a1 + 40) + 992) = 0;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(void *)(v5 + 1136))
  {
    if (![*(id *)(v5 + 1136) status]) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(a1 + 40);
  }
  -[PKExpressTransactionBannerViewController _displayResolution](v5);
LABEL_5:
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v6 + 1120))
  {
    if (*(unsigned char *)(v6 + 1121)) {
      int v7 = 2;
    }
    else {
      int v7 = 3;
    }
  }
  else
  {
    int v7 = 1;
  }
  uint64_t v8 = *(void *)(v6 + 1008);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_4;
  v9[3] = &unk_1E59CB0D8;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 48);
  -[PKExpressBannerLeadingView _setState:withCompletion:](v8, v7, v9);

  objc_destroyWeak(&v11);
}

uint64_t __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_displayResolution
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1 || *(unsigned char *)(a1 + 1072) || !*(_DWORD *)(a1 + 1056)) {
    return;
  }
  uint64_t v2 = *(void **)(a1 + 1136);
  if (v2)
  {
    uint64_t v3 = [v2 status];
    BOOL v4 = v3 == 1;
    if (*(unsigned char *)(a1 + 1120))
    {
      if (v3 == 1 && !*(unsigned char *)(a1 + 1121))
      {
        *(unsigned char *)(a1 + 1121) = v4;
        if (!*(unsigned char *)(a1 + 1120))
        {
          *(unsigned char *)(a1 + 1120) = 1;
          goto LABEL_23;
        }
LABEL_17:
        uint64_t v5 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v44 = a1;
          uint64_t v6 = "PKExpressTransactionBVC (%p): displaying override success resolution.";
LABEL_25:
          _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
        }
LABEL_26:
        char v8 = 1;
        int v9 = 2;
        int v10 = 1;
LABEL_32:

        uint64_t v12 = *(void *)(a1 + 1008);
        if (v12)
        {
          int v13 = *(_DWORD *)(v12 + 456);
          if ((v13 | 4) != 4 && v13 != v9)
          {
            if (*(void *)(v12 + 472))
            {
              *(_DWORD *)(v12 + 456) = v9;
              [(PKExpressBannerLeadingView *)v12 _updateLayerState];
            }
            else
            {
              -[PKExpressBannerLeadingView _setState:withCompletion:](v12, v9, 0);
            }
          }
        }
        objc_initWeak(&location, (id)a1);
        *(unsigned char *)(a1 + 1122) = 1;
        -[PKExpressTransactionBannerViewController _cancelRevokeTimer](a1);
        id v15 = objc_alloc(MEMORY[0x1E4F84630]);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke;
        v36[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v37, &location);
        __n128 v16 = (void *)[v15 initWithBlock:v36];
        uint64_t v17 = *(void *)(a1 + 1032);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        BOOL v31 = __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke_2;
        __n128 v32 = &unk_1E59DF030;
        id v18 = v16;
        id v33 = v18;
        objc_copyWeak(&v34, &location);
        char v35 = v8;
        if (!v17) {
          goto LABEL_55;
        }
        uint64_t v19 = *(void *)(v17 + 416);
        float v20 = v30;
        double v21 = v20;
        if (v19)
        {
          if (*(_DWORD *)(v19 + 408) == v10)
          {
            BOOL v22 = *(void **)(v19 + 416);
            if (!v22)
            {
              ((void (*)(void *, void))v31)(v20, 0);
              goto LABEL_54;
            }
            id v23 = _Block_copy(v20);
            [v22 addObject:v23];
          }
          else
          {
            *(_DWORD *)(v19 + 408) = v10;
            id v24 = *(id *)(v19 + 416);
            double v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
            double v26 = _Block_copy(v21);
            [v25 addObject:v26];

            objc_storeStrong((id *)(v19 + 416), v25);
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v23 = v24;
            uint64_t v27 = [v23 countByEnumeratingWithState:&v39 objects:buf count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v40;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v40 != v28) {
                    objc_enumerationMutation(v23);
                  }
                  (*(void (**)(void))(*(void *)(*((void *)&v39 + 1) + 8 * i) + 16))();
                }
                uint64_t v27 = [v23 countByEnumeratingWithState:&v39 objects:buf count:16];
              }
              while (v27);
            }

            if (v25 == *(void **)(v19 + 416)) {
              -[PKExpressGlyphView _updateGlyphViewAnimated:](v19, 1);
            }
          }
        }
LABEL_54:

LABEL_55:
        objc_destroyWeak(&v34);

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
        return;
      }
      goto LABEL_12;
    }
    *(unsigned char *)(a1 + 1121) = v4;
    if (*(unsigned char *)(a1 + 1120))
    {
      if (v3 == 1) {
        goto LABEL_17;
      }
LABEL_20:
      uint64_t v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v44 = a1;
        int v7 = "PKExpressTransactionBVC (%p): displaying override failure resolution.";
LABEL_30:
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
        goto LABEL_31;
      }
      goto LABEL_31;
    }
    *(unsigned char *)(a1 + 1120) = 1;
    if (v3 == 1)
    {
LABEL_23:
      uint64_t v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v44 = a1;
        uint64_t v6 = "PKExpressTransactionBVC (%p): displaying success resolution.";
        goto LABEL_25;
      }
      goto LABEL_26;
    }
LABEL_28:
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v44 = a1;
      int v7 = "PKExpressTransactionBVC (%p): displaying failure resolution.";
      goto LABEL_30;
    }
LABEL_31:
    char v8 = 0;
    int v10 = 2;
    int v9 = 3;
    goto LABEL_32;
  }
  if (!*(unsigned char *)(a1 + 1120))
  {
    *(unsigned char *)(a1 + 1121) = 0;
    if (*(unsigned char *)(a1 + 1120)) {
      goto LABEL_20;
    }
    *(unsigned char *)(a1 + 1120) = 1;
    goto LABEL_28;
  }
LABEL_12:

  -[PKExpressTransactionBannerViewController _startRevokeTimer](a1);
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_6;
  v2[3] = &unk_1E59CB128;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      id v5 = WeakRetained;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): appeared.", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 1112) = CFAbsoluteTimeGetCurrent();
  *(_DWORD *)(*(void *)(a1 + 32) + 1056) = 6;
  *(unsigned char *)(*(void *)(a1 + 32) + 992) = 1;
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  *(unsigned char *)(*(void *)(a1 + 32) + 992) = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && !*(unsigned char *)(v1 + 1072) && *(_DWORD *)(v1 + 1056) == 6)
  {
    uint64_t v2 = *(NSObject **)(v1 + 1048);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = *(void **)(v1 + 1048);
      *(void *)(v1 + 1048) = 0;
    }
    double v4 = *(double *)(v1 + 1104);
    double v5 = 0.0;
    if (v4 > 0.0)
    {
      double v6 = *(double *)(v1 + 1112);
      BOOL v7 = v4 >= v6 || v6 <= 0.0;
      double v8 = v6 - v4;
      if (v7) {
        double v5 = 0.0;
      }
      else {
        double v5 = v8;
      }
    }
    double v9 = 0.45 - v5;
    if (0.45 - v5 <= 0.0)
    {
      __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke((uint64_t)v2, v1);
    }
    else
    {
      dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      double v11 = *(void **)(v1 + 1048);
      *(void *)(v1 + 1048) = v10;

      uint64_t v12 = *(NSObject **)(v1 + 1048);
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      objc_initWeak(&location, (id)v1);
      long long v14 = *(NSObject **)(v1 + 1048);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke_2;
      handler[3] = &unk_1E59CB128;
      objc_copyWeak(&v17, &location);
      id v16 = &__block_literal_global_272_0;
      dispatch_source_set_event_handler(v14, handler);
      dispatch_resume(*(dispatch_object_t *)(v1 + 1048));

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_4;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134217984;
      id v4 = WeakRetained;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): shrunk.", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)_cancelRevokeTimer
{
  id v2 = *(NSObject **)(a1 + 1128);
  if (v2)
  {
    dispatch_source_cancel(v2);
    int v3 = *(void **)(a1 + 1128);
    *(void *)(a1 + 1128) = 0;
  }
}

uint64_t __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 1056) = 9;
  *(unsigned char *)(*(void *)(a1 + 32) + 992) = 1;
  [*(id *)(a1 + 40) setNeedsLayout];
  uint64_t result = [*(id *)(a1 + 40) layoutIfNeeded];
  *(unsigned char *)(*(void *)(a1 + 32) + 992) = 0;
  return result;
}

void __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_3;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134217984;
      id v4 = WeakRetained;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): expanded.", (uint8_t *)&v3, 0xCu);
    }

    WeakRetained[1076] = 0;
    -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)WeakRetained);
  }
}

- (void)_startRevokeTimer
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 1072))
  {
    -[PKExpressTransactionBannerViewController _cancelRevokeTimer](a1);
    if (*(unsigned char *)(a1 + 1122))
    {
      id v2 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:

        return;
      }
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      int v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - glyph state animating.";
LABEL_25:
      _os_log_debug_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)location, 0xCu);
      goto LABEL_5;
    }
    if (!*(unsigned char *)(a1 + 1074))
    {
      id v2 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      int v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - leading view shrinking.";
      goto LABEL_25;
    }
    if (!*(unsigned char *)(a1 + 1075))
    {
      id v2 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      int v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - waiting for shrink.";
      goto LABEL_25;
    }
    if (*(unsigned char *)(a1 + 1076))
    {
      id v2 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      int v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - expanding.";
      goto LABEL_25;
    }
    id v4 = *(void **)(a1 + 1136);
    if (v4 && [v4 isProcessing])
    {
      id v2 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      int v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - express transaction ongoing.";
      goto LABEL_25;
    }
    int v5 = *(unsigned __int8 *)(a1 + 1144);
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    BOOL v7 = *(void **)(a1 + 1128);
    *(void *)(a1 + 1128) = v6;

    double v8 = *(NSObject **)(a1 + 1128);
    if (v5) {
      int64_t v9 = 1000000000;
    }
    else {
      int64_t v9 = 500000000;
    }
    dispatch_time_t v10 = dispatch_time(0, v9);
    dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(location, (id)a1);
    double v11 = *(NSObject **)(a1 + 1128);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __61__PKExpressTransactionBannerViewController__startRevokeTimer__block_invoke;
    handler[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v13, location);
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 1128));
    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
}

void __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  v61[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 1072))
  {
    int v4 = WeakRetained[264];
    BOOL v5 = 0;
    int v6 = 3;
    int v7 = 3;
    switch(v4)
    {
      case 2:
        goto LABEL_7;
      case 3:
      case 6:
      case 9:
        goto LABEL_9;
      case 4:
        int v7 = 5;
        int v6 = 6;
        goto LABEL_7;
      case 5:
        BOOL v5 = 0;
        int v4 = 6;
        goto LABEL_9;
      case 7:
        int v7 = 8;
        int v6 = 9;
LABEL_7:
        BOOL v5 = v4 != v7;
        WeakRetained[264] = v7;
        int v4 = v6;
        goto LABEL_9;
      case 8:
        BOOL v5 = 0;
        int v4 = 9;
LABEL_9:
        double v8 = [WeakRetained view];
        PKFloatRoundToPixel();
        int64_t v9 = objc_msgSend(v8, "SBUISA_systemApertureObstructedAreaLayoutGuide");
        [v9 layoutFrame];
        double v11 = v10;
        double v13 = v12;

        PKFloatRoundToPixel();
        id v17 = (double *)*((void *)v3 + 126);
        double v50 = v11;
        double v51 = v13;
        double v49 = v14.n128_f64[0];
        if (v17)
        {
          -[PKExpressBannerLeadingView _metricsForSizeClass:]((uint64_t)&buf, v17, 2u, v14, v15, v16);
          double v18 = *(double *)&v59;
        }
        else
        {
          double v18 = 0.0;
        }
        PKFloatRoundToPixel();
        double v20 = v19;
        PKFloatRoundToPixel();
        objc_msgSend(*((id *)v3 + 129), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        double v22 = v21;
        PKFloatRoundToPixel();
        double v24 = v23;
        PKFloatRoundToPixel();
        double v25 = v22 + fmax(v24, 10.0);
        if ((v4 - 3) < 6) {
          goto LABEL_12;
        }
        if (v4 != 9)
        {
LABEL_35:
          __break(1u);
          return;
        }
        long long v46 = (void *)*((void *)v3 + 127);
        if (v46 && v46[55])
        {
          double v47 = v25 + 5.0;
          objc_msgSend(v46, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
          double v25 = v47 + v48;
        }
LABEL_12:
        double v26 = fmax(v49 + v18 + fmax(v20, 10.0), v25);
        double v27 = v11 + v26 * 2.0;
        if (*((_DWORD *)v3 + 264) == 3)
        {
          uint64_t v28 = [v3 viewIfLoaded];
          long long v29 = v28;
          if (v28
            && ([v28 window], v30 = objc_claimAutoreleasedReturnValue(), (BOOL v31 = v30) != 0))
          {
            [v30 bounds];
            double v33 = v32;
          }
          else
          {
            double v33 = 1.79769313e308;
          }

          *((double *)v3 + 136) = fmin(v27, v33);
          *((double *)v3 + 137) = v51;
          if (v5)
          {
            id v34 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = v3;
              _os_log_impl(&dword_19F450000, v34, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): psuedo shrinking...", (uint8_t *)&buf, 0xCu);
            }

            *((unsigned char *)v3 + 992) = v5;
            [v8 setNeedsLayout];
            [v8 layoutIfNeeded];
            *((unsigned char *)v3 + 992) = 0;
            id v35 = objc_alloc(MEMORY[0x1E4F84630]);
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_270;
            v55[3] = &unk_1E59CA7F8;
            objc_copyWeak(&v56, v1);
            uint64_t v36 = (void *)[v35 initWithBlock:v55];
            uint64_t v37 = *((void *)v3 + 126);
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_2;
            v52[3] = &unk_1E59CB268;
            objc_copyWeak(&v54, v1);
            id v38 = v36;
            id v53 = v38;
            -[PKExpressBannerLeadingView _setState:withCompletion:](v37, 4, v52);
            if (!*((unsigned char *)v3 + 1072) && *((_DWORD *)v3 + 264) == 3)
            {
              long long v39 = *((void *)v3 + 131);
              if (v39)
              {
                dispatch_source_cancel(v39);
                long long v40 = (void *)*((void *)v3 + 131);
                *((void *)v3 + 131) = 0;
              }
              dispatch_source_t v41 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
              long long v42 = (void *)*((void *)v3 + 131);
              *((void *)v3 + 131) = v41;

              double v43 = *((void *)v3 + 131);
              dispatch_time_t v44 = dispatch_time(0, 110000000);
              dispatch_source_set_timer(v43, v44, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
              objc_initWeak(&location, v3);
              uint64_t v45 = *((void *)v3 + 131);
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              *(double *)&BOOL v59 = COERCE_DOUBLE(__61__PKExpressTransactionBannerViewController__startShrinkTimer__block_invoke);
              BOOL v60 = &unk_1E59CA7F8;
              objc_copyWeak(v61, &location);
              dispatch_source_set_event_handler(v45, &buf);
              dispatch_resume(*((dispatch_object_t *)v3 + 131));
              objc_destroyWeak(v61);
              objc_destroyWeak(&location);
            }

            objc_destroyWeak(&v54);
            objc_destroyWeak(&v56);
          }
          else
          {
            *((unsigned char *)v3 + 992) = 0;
            [v8 setNeedsLayout];
            [v8 layoutIfNeeded];
            *((unsigned char *)v3 + 992) = 0;
          }
        }
        else
        {
          objc_msgSend(v3, "setPreferredContentSize:", v50 + v26 * 2.0, v51);
        }
        *((unsigned char *)v3 + 1160) = 0;

        break;
      default:
        goto LABEL_35;
    }
  }
}

id __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_270(uint64_t a1)
{
  id result = objc_loadWeakRetained((id *)(a1 + 32));
  if (result) {
    __break(1u);
  }
  return result;
}

void __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if ([*(id *)(a1 + 32) invalidate])
    {
      __break(1u);
      return;
    }
    v3[1074] = 1;
    -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)v3);
    id WeakRetained = v3;
  }
}

id __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke(uint64_t a1)
{
  id result = objc_loadWeakRetained((id *)(a1 + 32));
  if (result) {
    __break(1u);
  }
  return result;
}

void __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) invalidate])
  {
    __break(1u);
  }
  else
  {
    id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained && WeakRetained[1121] == *(unsigned __int8 *)(a1 + 48))
    {
      WeakRetained[1122] = 0;
      id v3 = WeakRetained;
      -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)WeakRetained);
      id WeakRetained = v3;
    }
  }
}

void __61__PKExpressTransactionBannerViewController__startShrinkTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = (CFAbsoluteTime *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    val = WeakRetained;
    id v2 = *((void *)WeakRetained + 131);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = (void *)*((void *)val + 131);
      val[131] = 0.0;
    }
    val[138] = CFAbsoluteTimeGetCurrent();
    *((_DWORD *)val + 264) = 4;
    -[PKExpressTransactionBannerViewController _updatePreferredContentSize](val);
    id WeakRetained = val;
  }
}

void __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 1075) = 1;
  *(_DWORD *)(a2 + 1056) = 7;
  val = (id)a2;
  -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)val);
  -[PKExpressTransactionBannerViewController _updatePreferredContentSize](val);
}

void __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = WeakRetained[131];
    int v6 = v3;
    if (v4)
    {
      dispatch_source_cancel(v4);
      BOOL v5 = v6[131];
      v6[131] = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v6;
  }
}

void __61__PKExpressTransactionBannerViewController__startRevokeTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 1072))
  {
    id v3 = WeakRetained;
    -[PKExpressTransactionBannerViewController _revoked]((uint64_t)WeakRetained);
    id v2 = objc_loadWeakRetained(v3 + 146);
    [v2 revoke];

    id WeakRetained = v3;
  }
}

- (void)_revoked
{
  if (a1 && !*(unsigned char *)(a1 + 1072))
  {
    *(unsigned char *)(a1 + 1072) = 1;
    id v2 = *(NSObject **)(a1 + 1128);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = *(void **)(a1 + 1128);
      *(void *)(a1 + 1128) = 0;
    }
    int v4 = *(void **)(a1 + 1080);
    if (v4)
    {
      id v5 = v4;
      int v6 = *(void **)(a1 + 1080);
      *(void *)(a1 + 1080) = 0;

      int v7 = [MEMORY[0x1E4FB1438] sharedApplication];
      if (v7)
      {
        uint64_t v16 = 0;
        id v17 = &v16;
        uint64_t v18 = 0x2020000000;
        uint64_t v19 = *MEMORY[0x1E4FB2748];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __52__PKExpressTransactionBannerViewController__revoked__block_invoke;
        aBlock[3] = &unk_1E59DD778;
        id v13 = v5;
        __n128 v15 = &v16;
        id v8 = v7;
        id v14 = v8;
        int64_t v9 = _Block_copy(aBlock);
        uint64_t v10 = [v8 beginBackgroundTaskWithName:@"Wallet Banner - CL In Use Grace Period" expirationHandler:v9];
        v17[3] = v10;
        dispatch_time_t v11 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F87460] * 1000000000.0));
        dispatch_after(v11, MEMORY[0x1E4F14428], v9);

        _Block_object_dispose(&v16, 8);
      }
      else
      {
        [v5 invalidate];
      }
    }
  }
}

uint64_t __52__PKExpressTransactionBannerViewController__revoked__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(void *)(v3 + 24) != *MEMORY[0x1E4FB2748])
  {
    *(void *)(v3 + 24) = *MEMORY[0x1E4FB2748];
    int v4 = *(void **)(a1 + 40);
    return objc_msgSend(v4, "endBackgroundTask:");
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPresentable:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_presentable, v5);
  int v4 = v5;
  if (v5 && self->_revoked)
  {
    [v5 revoke];
    int v4 = v5;
  }
}

- (void)setBannerDetached:(BOOL)a3
{
  if (self->_bannerDetached != a3)
  {
    self->_bannerDetached = a3;
    if (a3)
    {
      if ([(PKExpressTransactionState *)self->_expressState isProcessing])
      {
        [(PKExpressTransactionState *)self->_expressState resolve];
        -[PKExpressTransactionBannerViewController _displayResolution]((uint64_t)self);
      }
    }
  }
}

- (PKBannerHandleState)bannerState
{
  return self->_bannerState;
}

- (void)setBannerState:(id)a3
{
  id v5 = (PKExpressTransactionBannerHandleState *)a3;
  if (v5)
  {
    dispatch_time_t v11 = v5;
    if ([(PKExpressTransactionBannerHandleState *)v5 type]) {
      goto LABEL_13;
    }
    p_bannerState = (id *)&self->_bannerState;
    id v5 = v11;
    if (self->_bannerState != v11)
    {
      int v7 = [(PKExpressTransactionBannerHandleState *)v11 transactionState];
      if (!*p_bannerState
        || ([*p_bannerState transactionState],
            id v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = [v7 isRelatedToState:v8],
            v8,
            (v9 & 1) != 0))
      {
        objc_storeStrong((id *)&self->_bannerState, a3);
        objc_storeStrong((id *)&self->_expressState, v7);
        expressState = self->_expressState;
        if (!expressState || [(PKExpressTransactionState *)expressState status]) {
          -[PKExpressTransactionBannerViewController _displayResolution]((uint64_t)self);
        }

        id v5 = v11;
        goto LABEL_10;
      }
LABEL_13:
      __break(1u);
      return;
    }
  }
LABEL_10:
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  if (!self->_revoked)
  {
    int v4 = (void *)MEMORY[0x1E4F1E5E8];
    PKPassKitCoreBundle();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = (CLInUseAssertion *)[v4 newAssertionForBundle:v7 withReason:@"Wallet Express Banner is Active"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v5;
  }
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredCustomLayout
{
  if (self->_state >= 4u) {
    return 0;
  }
  else {
    return 3;
  }
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F87D30];
}

- (NSURL)launchURL
{
  return [(PKPass *)self->_pass passURL];
}

- (unint64_t)presentationBehaviors
{
  return 74;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  if (self->_activeLayoutMode != a3)
  {
    id v5 = [(PKExpressTransactionBannerViewController *)self viewIfLoaded];
    id v10 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      self->_int64_t activeLayoutMode = a3;
      int v6 = [(PKExpressTransactionBannerViewController *)self systemApertureElementContext];
      id v7 = [v6 requestAlertingAssertion];
      [v7 setAutomaticallyInvalidatable:0];

      [v10 setNeedsLayout];
    }
    else
    {
      self->_int64_t activeLayoutMode = a3;
      id v8 = [(PKExpressTransactionBannerViewController *)self systemApertureElementContext];
      char v9 = [v8 requestAlertingAssertion];
      [v9 setAutomaticallyInvalidatable:0];
    }
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  v40[2] = *(id *)MEMORY[0x1E4F143B8];
  id v24 = a3;
  if (self->_revoked) {
    goto LABEL_2;
  }
  int state = self->_state;
  if (state == 8)
  {
    id v14 = v24;
    if (self->_state != 8) {
      goto LABEL_27;
    }
    __n128 v15 = v14;
    if (!v14) {
      goto LABEL_27;
    }
    uint64_t v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): expanding...", buf, 0xCu);
    }

    self->_expanding = 1;
    -[PKExpressTransactionBannerViewController _cancelRevokeTimer]((uint64_t)self);
    objc_initWeak(aBlock, self);
    id v17 = [(PKExpressTransactionBannerViewController *)self view];
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke;
    uint64_t v36 = &unk_1E59DC118;
    uint64_t v37 = self;
    uint64_t v18 = v17;
    id v38 = v18;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    double v27 = __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_2;
    uint64_t v28 = &unk_1E59D63E0;
    objc_copyWeak(&v29, aBlock);
    [v15 animateAlongsideTransition:buf completion:&v25];
    objc_destroyWeak(&v29);

    objc_destroyWeak(aBlock);
  }
  else
  {
    if (state != 5)
    {
      if (state) {
        goto LABEL_2;
      }
      id v5 = v24;
      if (!self->_state)
      {
        int v6 = v5;
        if (v5)
        {
          int64_t activeLayoutMode = self->_activeLayoutMode;
          id v8 = PKLogFacilityTypeGetObject();
          BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
          if (activeLayoutMode == 4)
          {
            if (v9)
            {
              *(_DWORD *)long long buf = 134217984;
              *(void *)&uint8_t buf[4] = self;
              _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): appearing...", buf, 0xCu);
            }

            id v10 = [(PKExpressTransactionBannerViewController *)self view];
            objc_initWeak(&location, self);
            v32[0] = 0;
            v32[1] = v32;
            v32[2] = 0x2020000000;
            char v33 = 0;
            aBlock[0] = (id)MEMORY[0x1E4F143A8];
            aBlock[1] = (id)3221225472;
            aBlock[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke;
            aBlock[3] = &unk_1E59DEFB8;
            void aBlock[4] = v32;
            dispatch_time_t v11 = _Block_copy(aBlock);
            *(void *)long long buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_2;
            uint64_t v36 = &unk_1E59DEFE0;
            id v8 = v10;
            uint64_t v37 = (PKExpressTransactionBannerViewController *)v8;
            id v38 = self;
            objc_copyWeak(v40, &location);
            id v12 = v11;
            id v39 = v12;
            uint64_t v25 = MEMORY[0x1E4F143A8];
            uint64_t v26 = 3221225472;
            double v27 = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_5;
            uint64_t v28 = &unk_1E59DF008;
            objc_copyWeak(&v30, &location);
            id v13 = v12;
            id v29 = v13;
            [v6 animateAlongsideTransition:buf completion:&v25];

            objc_destroyWeak(&v30);
            objc_destroyWeak(v40);

            _Block_object_dispose(v32, 8);
            objc_destroyWeak(&location);
          }
          else if (v9)
          {
            *(_DWORD *)long long buf = 134218240;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = activeLayoutMode;
            _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): deferring apperance while in mode %ld.", buf, 0x16u);
          }

          goto LABEL_2;
        }
      }
LABEL_27:
      __break(1u);
    }
    id v19 = v24;
    if (self->_state != 5) {
      goto LABEL_27;
    }
    double v20 = v19;
    if (!v19) {
      goto LABEL_27;
    }
    double v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): shrinking...", buf, 0xCu);
    }

    double v22 = [(PKExpressTransactionBannerViewController *)self view];
    objc_initWeak(aBlock, self);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke;
    uint64_t v36 = &unk_1E59DC118;
    uint64_t v37 = self;
    double v23 = v22;
    id v38 = v23;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    double v27 = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3;
    uint64_t v28 = &unk_1E59D63E0;
    objc_copyWeak(&v29, aBlock);
    [v20 animateAlongsideTransition:buf completion:&v25];
    objc_destroyWeak(&v29);

    objc_destroyWeak(aBlock);
  }
LABEL_2:
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return 0;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_transitBalanceModel)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    block[3] = &unk_1E59CA8E8;
    void block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __111__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 976) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 984) setTransitProperties:*(void *)(a1 + 48)];
    int v4 = *(void **)(a1 + 32);
    -[PKExpressTransactionBannerViewController _updateBalanceContent](v4);
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_transitBalanceModel)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
    block[3] = &unk_1E59CA8E8;
    void block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __100__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 976) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 984) setDynamicBalances:*(void *)(a1 + 48)];
    int v4 = *(void **)(a1 + 32);
    -[PKExpressTransactionBannerViewController _updateBalanceContent](v4);
  }
}

- (void)expressTrailingView:(id)a3 revealingCheckmarkAnimated:(BOOL)a4
{
  if (self && !self->_revoked && !self->_successPlayed)
  {
    self->_successPlayed = 1;
    kdebug_trace();
    leadingView = self->_leadingView;
    if (leadingView)
    {
      passView = leadingView->_passView;
      if (passView)
      {
        if ((passView->_options & 2) == 0)
        {
          __break(1u);
          return;
        }
        [(PKPassView *)passView->_passView didTransact];
      }
    }
    pass = self->_pass;
    if (pass)
    {
      SystemSoundID v8 = 1394;
      if ([(PKPass *)pass passType] == PKPassTypeSecureElement)
      {
        if ([(PKPass *)self->_pass isAccessPass]) {
          SystemSoundID v8 = 1163;
        }
        else {
          SystemSoundID v8 = 1394;
        }
      }
    }
    else
    {
      SystemSoundID v8 = 1394;
    }
    AudioServicesPlaySystemSound(v8);
  }
}

- (void)expressLabelViewDidChangeSize:(id)a3
{
  id v4 = a3;
  unsigned int state = self->_state;
  BOOL v6 = state >= 8;
  unsigned int v7 = state - 8;
  if (v6)
  {
    id v8 = v4;
    if (v7 > 1)
    {
      __break(1u);
      return;
    }
    -[PKExpressTransactionBannerViewController _updatePreferredContentSize](self);
    id v4 = v8;
  }
}

- (PKBannerViewControllerPresentable)presentable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentable);

  return (PKBannerViewControllerPresentable *)WeakRetained;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (BOOL)isBannerDetached
{
  return self->_bannerDetached;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentable);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_revokeTimer, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_bannerState, 0);
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end