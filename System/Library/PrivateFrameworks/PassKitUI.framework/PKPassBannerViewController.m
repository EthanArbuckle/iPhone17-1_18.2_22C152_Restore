@interface PKPassBannerViewController
+ (id)createForTransactionWithPass:(id)a3 primaryText:(id)a4 secondaryText:(id)a5 preferredLabelAxis:(unint64_t)a6 trailingViewConfiguration:(id)a7 walletForeground:(BOOL)a8;
+ (id)createWithPass:(id)a3 primaryText:(id)a4 secondaryText:(id)a5 trailingViewConfiguration:(id)a6 walletForeground:(BOOL)a7;
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSString)associatedAppBundleIdentifier;
- (NSString)primaryText;
- (NSString)secondaryText;
- (NSURL)launchURL;
- (PKBannerViewControllerPresentable)presentable;
- (PKPass)pass;
- (PKPassBannerTrailingViewConfiguration)trailingViewConfiguration;
- (PKPassBannerViewController)init;
- (PKPassBannerViewController)initWithCoder:(id)a3;
- (PKPassBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIEdgeInsets)bannerContentOutsets;
- (double)_layoutContentViewWithBounds:(double)a3 commit:(CGFloat)a4;
- (double)_maximumSystemApertureWidth;
- (id)_initWithPass:(void *)a3 primaryText:(void *)a4 secondaryText:(void *)a5 preferredLabelAxis:(void *)a6 trailingViewConfiguration:(char)a7 walletForeground:;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)preferredLabelAxis;
- (unint64_t)presentationBehaviors;
- (void)_appeared;
- (void)_platterView;
- (void)_revoke;
- (void)_revoked;
- (void)_tapped:(id)a3;
- (void)_updateFonts;
- (void)dealloc;
- (void)loadView;
- (void)passBannerMinimalViewDidChangeSize:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setPresentable:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation PKPassBannerViewController

+ (id)createWithPass:(id)a3 primaryText:(id)a4 secondaryText:(id)a5 trailingViewConfiguration:(id)a6 walletForeground:(BOOL)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = -[PKPassBannerViewController _initWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:]((id *)[PKPassBannerViewController alloc], v14, v13, v12, 0, v11, a7);

  return v15;
}

- (id)_initWithPass:(void *)a3 primaryText:(void *)a4 secondaryText:(void *)a5 preferredLabelAxis:(void *)a6 trailingViewConfiguration:(char)a7 walletForeground:
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  result = a6;
  v18 = result;
  if (!a1)
  {
LABEL_15:

    return a1;
  }
  if (v14)
  {
    v24.receiver = a1;
    v24.super_class = (Class)PKPassBannerViewController;
    v19 = (id *)objc_msgSendSuper2(&v24, sel_initWithNibName_bundle_, 0, 0);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 138, a2);
      uint64_t v20 = [v15 length];
      if (v20) {
        v21 = (void *)[v15 copy];
      }
      else {
        v21 = 0;
      }
      objc_storeStrong(a1 + 139, v21);
      if (v20) {

      }
      uint64_t v22 = [v16 length];
      if (v22) {
        v23 = (void *)[v16 copy];
      }
      else {
        v23 = 0;
      }
      objc_storeStrong(a1 + 140, v23);
      if (v22) {

      }
      a1[141] = a5;
      objc_storeStrong(a1 + 142, a6);
      *((unsigned char *)a1 + 977) = a7;
      a1[124] = (id)SBSIsSystemApertureAvailable();
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

+ (id)createForTransactionWithPass:(id)a3 primaryText:(id)a4 secondaryText:(id)a5 preferredLabelAxis:(unint64_t)a6 trailingViewConfiguration:(id)a7 walletForeground:(BOOL)a8
{
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = -[PKPassBannerViewController _initWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:]((id *)[PKPassBannerViewController alloc], v16, v15, v14, (void *)a6, v13, a8);

  if (v17) {
    *((unsigned char *)v17 + 976) = 1;
  }
  return v17;
}

- (PKPassBannerViewController)init
{
  return 0;
}

- (PKPassBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKPassBannerViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  revokeTimer = self->_revokeTimer;
  if (revokeTimer) {
    dispatch_source_cancel(revokeTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPassBannerViewController;
  [(PKPassBannerViewController *)&v4 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassBannerViewController;
  [(PKPassBannerViewController *)&v9 traitCollectionDidChange:v4];
  v5 = [(PKPassBannerViewController *)self traitCollection];
  if (!v4
    || ([v4 preferredContentSizeCategory],
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        [v5 preferredContentSizeCategory],
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKPassBannerViewController _updateFonts](self);
  }
}

- (void)_updateFonts
{
  v66[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 viewIfLoaded];
    if (!v2)
    {
LABEL_53:

      return;
    }
    uint64_t v3 = [a1 traitCollection];
    id v4 = (UITraitCollection *)v3;
    if (!a1[124])
    {
      v5 = (void *)MEMORY[0x1E4FB1E20];
      if (!v3)
      {
        id v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
        if (!v4) {
          goto LABEL_52;
        }
        goto LABEL_7;
      }
      v62[0] = v3;
      v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
      v62[1] = v6;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
      uint64_t v8 = [v5 traitCollectionWithTraitsFromCollections:v7];

      id v4 = (UITraitCollection *)v8;
    }
    if (!v4)
    {
LABEL_52:

      goto LABEL_53;
    }
LABEL_7:
    if (a1[124])
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 1, v4);
      v10 = (void *)a1[131];
      a1[131] = v9;

      objc_msgSend(MEMORY[0x1E4FB08E0], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 3, v4);
    }
    else
    {
      id v12 = (NSString *)*MEMORY[0x1E4FB0938];
      double v13 = *MEMORY[0x1E4FB09E0];
      uint64_t v14 = PKFontForDesign(v4, (NSString *)*MEMORY[0x1E4FB0938], (NSString *)*MEMORY[0x1E4FB2990], *MEMORY[0x1E4FB09E0]);
      id v15 = (void *)a1[131];
      a1[131] = v14;

      PKFontForDesign(v4, v12, (NSString *)*MEMORY[0x1E4FB2908], v13);
    uint64_t v11 = };
    id v16 = (void *)a1[132];
    a1[132] = v11;

    v17 = (void *)a1[134];
    if (v17) {
      [v17 setFont:a1[131]];
    }
    v18 = (void *)a1[135];
    if (v18)
    {
      [v18 setFont:a1[132]];
      if (a1[124] == 1)
      {
        v19 = (void *)a1[135];
        uint64_t v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v19 setTextColor:v20];
      }
    }
    if (a1[134] || a1[135]) {
      [v2 setNeedsLayout];
    }
    if (!a1[133]) {
      goto LABEL_52;
    }
    v21 = [a1 viewIfLoaded];
    if (!v21 || !a1[133]) {
      goto LABEL_51;
    }
    uint64_t v22 = a1[139];
    uint64_t v59 = a1[140];
    uint64_t v23 = [MEMORY[0x1E4FB1618] clearColor];
    objc_super v24 = (void *)v23;
    v25 = (void *)MEMORY[0x1E4FB06C0];
    uint64_t v58 = v22;
    if (v22)
    {
      uint64_t v26 = *MEMORY[0x1E4FB06F8];
      v66[0] = a1[131];
      v27 = (uint64_t *)MEMORY[0x1E4FB0700];
      uint64_t v28 = *MEMORY[0x1E4FB0700];
      v65[0] = v26;
      v65[1] = v28;
      v29 = [MEMORY[0x1E4FB1618] labelColor];
      v65[2] = *v25;
      v66[1] = v29;
      v66[2] = v24;
      v30 = v24;
      v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
    }
    else
    {
      v27 = (uint64_t *)MEMORY[0x1E4FB0700];
      v30 = (void *)v23;
      v61 = 0;
    }
    if (v59)
    {
      uint64_t v31 = *MEMORY[0x1E4FB06F8];
      v64[0] = a1[132];
      uint64_t v32 = *v27;
      v63[0] = v31;
      v63[1] = v32;
      v33 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v63[2] = *MEMORY[0x1E4FB06C0];
      v64[1] = v33;
      v64[2] = v30;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
    }
    else
    {
      v34 = 0;
    }
    id v35 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    id v36 = objc_alloc(MEMORY[0x1E4F28B18]);
    if ([v21 _shouldReverseLayoutDirection]) {
      v37 = @"⁧";
    }
    else {
      v37 = @"⁦";
    }
    if (v61) {
      v38 = v61;
    }
    else {
      v38 = v34;
    }
    v39 = (void *)[v36 initWithString:v37 attributes:v38];
    [v35 appendAttributedString:v39];

    if (v58)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F28B18]);
      v41 = (void *)a1[139];
      if (v41)
      {
        v42 = (objc_class *)NSString;
        id v43 = v41;
        v44 = (void *)[[v42 alloc] initWithFormat:@"⁨%@⁩", v43];
      }
      else
      {
        v44 = 0;
      }
      v45 = (void *)[v40 initWithString:v44 attributes:v61];
      [v35 appendAttributedString:v45];

      if (!v59) {
        goto LABEL_47;
      }
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v34];
      [v35 appendAttributedString:v46];
    }
    else if (!v59)
    {
LABEL_47:
      id v53 = objc_alloc(MEMORY[0x1E4F28B18]);
      if (v34) {
        v54 = v34;
      }
      else {
        v54 = v61;
      }
      v55 = (void *)[v53 initWithString:@"⁩" attributes:v54];
      [v35 appendAttributedString:v55];

      v56 = (void *)a1[133];
      v57 = (void *)[v35 copy];
      [v56 setAttributedText:v57];

      [v21 setNeedsLayout];
LABEL_51:

      goto LABEL_52;
    }
    id v47 = objc_alloc(MEMORY[0x1E4F28B18]);
    v48 = (void *)a1[140];
    if (v48)
    {
      v49 = (objc_class *)NSString;
      v60 = v30;
      id v50 = v48;
      v51 = (void *)[[v49 alloc] initWithFormat:@"⁨%@⁩", v50];

      v30 = v60;
    }
    else
    {
      v51 = 0;
    }
    v52 = (void *)[v47 initWithString:v51 attributes:v34];
    [v35 appendAttributedString:v52];

    goto LABEL_47;
  }
}

- (void)loadView
{
  v30.receiver = self;
  v30.super_class = (Class)PKPassBannerViewController;
  [(PKPassBannerViewController *)&v30 loadView];
  uint64_t v3 = [(PKPassBannerViewController *)self view];
  [v3 setAutoresizingMask:0];
  id v4 = -[PKPassBannerViewController _platterView](self);
  if (v4)
  {
    [v3 addSubview:v4];
    v5 = [v4 customContentView];
  }
  else
  {
    v5 = v3;
  }
  contentView = self->_contentView;
  self->_contentView = v5;

  v7 = (PKPassBannerLeadingView *)-[PKPassBannerLeadingView _initWithStyle:pass:]((id *)[PKPassBannerLeadingView alloc], (void *)self->_style, self->_pass);
  leadingView = self->_leadingView;
  self->_leadingView = v7;

  [(UIView *)self->_contentView addSubview:self->_leadingView];
  uint64_t v9 = (PKPassBannerTrailingView *)-[PKPassBannerTrailingView _initWithStyle:configuration:]((uint64_t)[PKPassBannerTrailingView alloc], self->_style, self->_trailingViewConfiguration);
  trailingView = self->_trailingView;
  self->_trailingView = v9;

  [(UIView *)self->_contentView addSubview:self->_trailingView];
  if (self->_style != 1) {
    goto LABEL_37;
  }
  uint64_t v11 = [[PKPassBannerMinimalView alloc] _initWithStyle:self->_style leadingView:self->_leadingView trailingView:self->_trailingView];
  minimalView = self->_minimalView;
  self->_minimalView = v11;

  double v13 = self->_minimalView;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, self);
    uint64_t v14 = self->_minimalView;
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(UIView *)self->_contentView addSubview:v14];
  if (self->_style == 1 && self->_preferredLabelAxis != 2)
  {
    if (self->_primaryText || self->_secondaryText)
    {
      uint64_t v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      label = self->_label;
      self->_label = v28;

      [(UILabel *)self->_label setNumberOfLines:1];
      [(UILabel *)self->_label setLineBreakMode:4];
      [(UILabel *)self->_label setMarqueeEnabled:1];
      [(UIView *)self->_contentView addSubview:self->_label];
    }
  }
  else
  {
LABEL_37:
    if (self->_primaryText)
    {
      id v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      primaryLabel = self->_primaryLabel;
      self->_primaryLabel = v15;

      [(UILabel *)self->_primaryLabel setNumberOfLines:1];
      [(UILabel *)self->_primaryLabel setLineBreakMode:4];
      if (self->_style == 1) {
        [(UILabel *)self->_primaryLabel setMarqueeEnabled:1];
      }
      [(UIView *)self->_contentView addSubview:self->_primaryLabel];
      [(UILabel *)self->_primaryLabel setText:self->_primaryText];
    }
    if (self->_secondaryText)
    {
      v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      secondaryLabel = self->_secondaryLabel;
      self->_secondaryLabel = v17;

      [(UILabel *)self->_secondaryLabel setNumberOfLines:1];
      [(UILabel *)self->_secondaryLabel setLineBreakMode:4];
      if (self->_style == 1) {
        [(UILabel *)self->_secondaryLabel setMarqueeEnabled:1];
      }
      [(UIView *)self->_contentView addSubview:self->_secondaryLabel];
      [(UILabel *)self->_secondaryLabel setText:self->_secondaryText];
    }
  }
  if (self->_style)
  {
    __38__PKPassBannerViewController_loadView__block_invoke(self->_leadingView);
    __38__PKPassBannerViewController_loadView__block_invoke(self->_trailingView);
    __38__PKPassBannerViewController_loadView__block_invoke(self->_minimalView);
    __38__PKPassBannerViewController_loadView__block_invoke(self->_label);
  }
  else
  {
    v19 = [v4 visualStylingProviderForCategory:1];
    uint64_t v20 = v19;
    v21 = self->_primaryLabel;
    if (v21) {
      [v19 automaticallyUpdateView:v21 withStyle:0];
    }
    uint64_t v22 = self->_secondaryLabel;
    if (v22) {
      [v20 automaticallyUpdateView:v22 withStyle:1];
    }
    if (v4)
    {
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__tapped_];
      [v4 addGestureRecognizer:v23];
      objc_super v24 = self->_trailingView;
      id v25 = v4;
      uint64_t v26 = v25;
      if (v24 && v24->_imageView && !v24->_imageColor)
      {
        v27 = [v25 visualStylingProviderForCategory:1];
        [v27 automaticallyUpdateView:v24->_imageView withStyle:0];
      }
    }
  }
  -[PKPassBannerViewController _updateFonts](self);
}

- (void)_platterView
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = (void *)a1[126];
    if (!v3)
    {
      if (a1[124])
      {
        uint64_t v3 = 0;
      }
      else
      {
        uint64_t v4 = [MEMORY[0x1E4F91460] platterViewWithStyle:*MEMORY[0x1E4F91478]];
        v5 = (void *)v2[126];
        v2[126] = v4;

        [(id)v2[126] setMaterialGroupNameBase:@"pass-notification"];
        uint64_t v3 = (void *)v2[126];
      }
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __38__PKPassBannerViewController_loadView__block_invoke(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    uint64_t v1 = [v2 layer];
    [v1 setAllowsHitTesting:0];

    [v2 setUserInteractionEnabled:0];
  }
}

- (double)_layoutContentViewWithBounds:(double)a3 commit:(CGFloat)a4
{
  void (**v73)(void *__return_ptr);
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  void (**v83)(void, double, double);
  void (**v84)(void, double, double);
  double v85;
  CGFloat v86;
  BOOL v87;
  uint64_t v88;
  void *v89;
  double (**v90)(void *, void);
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  CGFloat v96;
  BOOL v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  BOOL v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  CGFloat v112;
  CGFloat v113;
  double v114;
  double v115;
  double v116;
  __n128 v117;
  __n128 v118;
  __n128 v119;
  double v120;
  double v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  CGFloat v128;
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double v133;
  double v134;
  double v135;
  double v136;
  CGFloat v137;
  double v138;
  CGFloat v139;
  double v140;
  double v141;
  double v142;
  void (**v143)(CGFloat *__return_ptr, void *, void, double);
  void *v144;
  uint64_t v145;
  void (*v146)(void *, uint64_t, long long *, double, double, double, double);
  uint64_t v147;
  void (*v148)(void *, uint64_t, _OWORD *, double, double, double, double);
  uint64_t v149;
  void (*v150)(void *, uint64_t, long long *, double, double, double, double);
  double v151;
  double v152;
  double v153;
  double v154;
  double v156;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  double v160;
  double v161;
  double r2;
  CGFloat r2a;
  double v164;
  uint64_t v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  BOOL v171;
  int v172;
  double v173;
  double v174;
  CGFloat v175;
  double v176;
  CGFloat v177;
  double v178;
  CGFloat amount;
  double v180;
  double v181;
  CGFloat v182;
  double v183;
  double v185;
  double v187;
  _OWORD v191[2];
  uint64_t v192;
  long long v193;
  long long v194;
  uint64_t v195;
  CGFloat v196[2];
  long long v197;
  uint64_t v198;
  void v199[6];
  CGRect slice;
  id v201;
  double v202;
  BOOL v203;
  CGRect v204;
  CGRect v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  void *v209;
  CGRect v210;
  _OWORD v211[2];
  uint64_t v212;
  CGRect remainder;
  uint64_t v214;
  id v215;
  BOOL v216;
  void aBlock[6];
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;

  if (!a1) {
    return 0.0;
  }
  uint64_t v11 = *(void *)(a1 + 992);
  if (v11 == 1)
  {
    uint64_t v31 = *(void *)(a1 + 1096);
    int v32 = [*(id *)(a1 + 1016) _shouldReverseLayoutDirection];
    uint64_t v33 = 2;
    if (!v32) {
      uint64_t v33 = 0x200000000;
    }
    v165 = v33;
    PKFloatRoundToPixel();
    v178 = v34;
    id v35 = objc_msgSend(*(id *)(a1 + 1016), "SBUISA_systemApertureObstructedAreaLayoutGuide");
    [v35 layoutFrame];
    v166 = v36;
    v174 = v38;
    v176 = v37;
    v180 = v39;

    objc_msgSend(*(id *)(a1 + 1016), "SBUISA_standardInteritemPadding");
    amount = v40;
    if (v31 == 4) {
      double v41 = 1.0;
    }
    else {
      double v41 = 0.5;
    }
    __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke(*(void **)(a1 + 1024));
    double v43 = v42;
    double v45 = v44;
    __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke(*(void **)(a1 + 1032));
    v173 = v46;
    v181 = v45;
    v183 = v47;
    BOOL v48 = v45 > 0.0 && v43 > 0.0;
    uint64_t v49 = *(void *)(a1 + 1032);
    v164 = v41;
    v185 = a4;
    v187 = a6;
    if (v49) {
      LOBYTE(v49) = *(void *)(v49 + 424) != 0;
    }
    if (v46 > 0.0) {
      unsigned __int8 v50 = v49;
    }
    else {
      unsigned __int8 v50 = 0;
    }
    double v51 = *MEMORY[0x1E4F1DB30];
    double v52 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v53 = 0.0;
    r2 = v43;
    if (v48) {
      double v53 = v43;
    }
    double v54 = 0.0;
    v170 = v53;
    PKFloatRoundToPixel();
    double v56 = v55;
    PKFloatRoundToPixel();
    char v57 = v50 & (v183 > 0.0);
    v167 = v51;
    v168 = fmax(v56, 15.0);
    if (v57) {
      double v54 = v173;
    }
    PKFloatRoundToPixel();
    double v59 = v58;
    PKFloatRoundToPixel();
    double v60 = v170 + v168;
    double v61 = v54 + fmax(v59, 15.0);
    double v62 = a5;
    if (v31 != 4) {
      double v62 = -[PKPassBannerViewController _maximumSystemApertureWidth]((void *)a1);
    }
    CGFloat v63 = amount;
    double v64 = v62 - v60;
    if (v48) {
      double v65 = amount;
    }
    else {
      double v65 = 0.0;
    }
    double v66 = v64 - v65 - v61;
    if ((v50 & (v183 > 0.0)) != 0) {
      double v67 = amount;
    }
    else {
      double v67 = 0.0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e34_____CGSize_dd_BdB_16__0__UILabel_8l;
    *(double *)&aBlock[4] = v66 - v67;
    v68 = _Block_copy(aBlock);
    BOOL v69 = *(void *)(a1 + 992) != 1 || *(void *)(a1 + 1128) == 2;
    *(void *)&remainder.origin.x = MEMORY[0x1E4F143A8];
    *(void *)&remainder.origin.y = 3221225472;
    *(void *)&remainder.size.width = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_3;
    *(void *)&remainder.size.height = &unk_1E59DC490;
    v171 = v69;
    v216 = v69;
    id v72 = v68;
    v214 = a1;
    v215 = v72;
    v73 = (void (**)(void *__return_ptr))_Block_copy(&remainder);
    v212 = 0;
    memset(v211, 0, sizeof(v211));
    ((void (**)(_OWORD *__return_ptr))v73)[2](v211);
    v74 = *(double *)v211;
    v172 = v212;
    v169 = v176 + v174;
    if ((_BYTE)v212) {
      PKFloatRoundToPixel();
    }
    if (a2)
    {
      v160 = v74;
      if (v31 == 4)
      {
        [*(id *)(a1 + 1040) setAlpha:0.0];
        [*(id *)(a1 + 1024) setAlpha:1.0];
        [*(id *)(a1 + 1032) setAlpha:1.0];
      }
      [*(id *)(a1 + 1064) setAlpha:(double)(v31 == 4)];
      v75 = fmax(v166, a3);
      v76 = v75 - a3;
      v77 = fmax(v166 + v180, v75);
      v78 = fmax(a3 + a5, v77) - v77;
      if (v32) {
        v79 = v77;
      }
      else {
        v79 = a3;
      }
      if (v32) {
        v80 = v78;
      }
      else {
        v80 = v76;
      }
      if (v32) {
        v81 = a3;
      }
      else {
        v81 = v77;
      }
      if (v32) {
        v82 = v76;
      }
      else {
        v82 = v78;
      }
      rect_8 = v81;
      rect_16 = v82;
      v206 = MEMORY[0x1E4F143A8];
      v207 = 3221225472;
      v208 = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_4;
      v209 = &__block_descriptor_64_e62__CGSize_dd_56__0_CGSize_dd_8_CGRect__CGPoint_dd__CGSize_dd__24l;
      v210.origin.x = a3 + 15.0;
      v210.origin.y = v185 + v178;
      v210.size.width = a5 + -30.0;
      v210.size.height = v187 - (v178 + v178);
      v83 = (void (**)(void, double, double))_Block_copy(&v206);
      v84 = v83;
      memset(&v204, 0, sizeof(v204));
      v205.origin.x = v79;
      v205.origin.y = v185;
      v205.size.width = v80;
      v205.size.height = v187;
      v156 = v60;
      rect = v79;
      v161 = v61;
      if (v48)
      {
        v85 = v79;
        v86 = v80;
        ((void (*)(void (**)(void, double, double), double, double, double, double))v83[2])(v83, r2, v181, v85, v185);
        v87 = v31 != 4;
        v88 = v165;
      }
      else
      {
        v87 = v31 != 4;
        v88 = v165;
        v86 = v80;
      }
      PKFloatRoundToPixel();
      v106 = v105;
      PKFloatRoundToPixel();
      v219.origin.x = rect;
      v219.origin.y = v185;
      v219.size.width = v86;
      v219.size.height = v187;
      CGRectDivide(v219, &v204, &v205, fmax(v106, 15.0), (CGRectEdge)v88);
      PKSizeAlignedInRect();
      v111 = v107;
      v112 = v108;
      v113 = v109;
      v114 = v110;
      if (v31 == 4) {
        objc_msgSend(*(id *)(a1 + 1024), "setFrame:", v107, v108, v109, v110);
      }
      r2a = v114;
      v182 = v111;
      v205.origin.x = rect_8;
      v205.origin.y = v185;
      v205.size.width = rect_16;
      v205.size.height = v187;
      if (v57) {
        v84[2](v84, v173, v183);
      }
      PKFloatRoundToPixel();
      v116 = v115;
      PKFloatRoundToPixel();
      CGRectDivide(v205, &v204, &v205, fmax(v116, 15.0), HIDWORD(v88));
      PKSizeAlignedInRect();
      if (v31 == 4)
      {
        v127 = v117.n128_f64[0];
        v128 = v120;
        v175 = v119.n128_f64[0];
        v177 = v118.n128_f64[0];
        objc_msgSend(*(id *)(a1 + 1032), "setFrame:");
        v220.origin.x = a3;
        v220.size.width = a5;
        v205.origin.x = a3;
        v205.origin.y = v185;
        v205.size.width = a5;
        v205.size.height = v187;
        v220.origin.y = v185;
        v220.size.height = v187;
        v221 = CGRectStandardize(v220);
        x = v221.origin.x;
        y = v221.origin.y;
        width = v221.size.width;
        height = v221.size.height;
        v229.origin.x = v182;
        v229.origin.y = v112;
        v229.size.width = v113;
        v229.size.height = r2a;
        v222 = CGRectIntersection(v221, v229);
        v133 = v222.origin.x;
        v134 = v222.size.width;
        if (!CGRectIsNull(v222))
        {
          if (v88)
          {
            width = fmax(v133 - x, 0.0);
          }
          else
          {
            v135 = x + width;
            x = fmin(v133 + v134, x + width);
            width = v135 - x;
          }
        }
        v205.origin.x = x;
        v205.origin.y = y;
        v205.size.width = width;
        v205.size.height = height;
        if (v48)
        {
          v223.origin.x = x;
          v223.origin.y = y;
          v223.size.width = width;
          v223.size.height = height;
          CGRectDivide(v223, &v204, &v205, amount, (CGRectEdge)v88);
          x = v205.origin.x;
          y = v205.origin.y;
          width = v205.size.width;
          height = v205.size.height;
        }
        v224.origin.x = x;
        v224.origin.y = y;
        v224.size.width = width;
        v224.size.height = height;
        v225 = CGRectStandardize(v224);
        v136 = v225.origin.x;
        v137 = v225.origin.y;
        v138 = v225.size.width;
        v139 = v225.size.height;
        v230.origin.x = v127;
        v230.size.width = v175;
        v230.origin.y = v177;
        v230.size.height = v128;
        v226 = CGRectIntersection(v225, v230);
        v140 = v226.origin.x;
        v141 = v226.size.width;
        if (CGRectIsNull(v226))
        {
          v126 = v164;
        }
        else
        {
          v126 = v164;
          if (HIDWORD(v88))
          {
            v138 = fmax(v140 - v136, 0.0);
          }
          else
          {
            v142 = v136 + v138;
            v136 = fmin(v140 + v141, v136 + v138);
            v138 = v142 - v136;
          }
        }
        v205.origin.x = v136;
        v205.origin.y = v137;
        v205.size.width = v138;
        v205.size.height = v139;
        CGFloat v63 = amount;
        double v60 = v156;
        if (v57)
        {
          v227.origin.x = v136;
          v227.origin.y = v137;
          v227.size.width = v138;
          v227.size.height = v139;
          CGRectDivide(v227, &v204, &v205, amount, HIDWORD(v88));
          v136 = v205.origin.x;
          v137 = v205.origin.y;
          v138 = v205.size.width;
          v139 = v205.size.height;
        }
        v228.origin.x = v136;
        v228.origin.y = v137;
        v228.size.width = v138;
        v228.size.height = v139;
        CGRectDivide(v228, &v204, &v205, v169, CGRectMinYEdge);
      }
      else
      {
        v121 = *(double *)v211;
        v118.n128_f64[0] = fmax(*((double *)v211 + 1), v52);
        if (!(_BYTE)v212) {
          v121 = -0.0;
        }
        v117.n128_f64[0] = v167 + v121;
        if (!(_BYTE)v212) {
          v118.n128_f64[0] = v52;
        }
        v119.n128_u64[0] = 0.5;
        v117.n128_f64[0] = v117.n128_f64[0] * 0.5;
        v118.n128_f64[0] = v118.n128_f64[0] * 0.5;
        PKSizeRoundToPixel(v117, v118, v119);
        PKSizeAlignedInRect();
        v205.origin.x = v122;
        v205.origin.y = v123;
        v205.size.width = v124;
        v205.size.height = v125;
        CGFloat v63 = amount;
        double v60 = v156;
        v126 = v164;
      }
      *(void *)&slice.origin.x = MEMORY[0x1E4F143A8];
      *(void *)&slice.origin.y = 3221225472;
      *(void *)&slice.size.width = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_5;
      *(void *)&slice.size.height = &unk_1E59DC4D8;
      v201 = v72;
      v202 = v126;
      v203 = v87;
      v143 = (void (**)(CGFloat *__return_ptr, void *, void, double))_Block_copy(&slice);
      v199[0] = MEMORY[0x1E4F143A8];
      v199[1] = 3221225472;
      v199[2] = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_6;
      v199[3] = &__block_descriptor_48_e71_v88__0__UILabel_8____CGSize_dd_BdB_16_CGRect__CGPoint_dd__CGSize_dd__56l;
      v199[5] = v88;
      *(double *)&v199[4] = v126;
      v144 = _Block_copy(v199);
      v74 = v160;
      double v61 = v161;
      v198 = 0;
      *(_OWORD *)v196 = 0u;
      v197 = 0u;
      if (v171)
      {
        v143[2](v196, v143, *(void *)(a1 + 1072), v205.size.width);
        CGRectDivide(v205, &v204, &v205, v196[1], CGRectMinYEdge);
        v145 = *(void *)(a1 + 1072);
        v146 = (void (*)(void *, uint64_t, long long *, double, double, double, double))v144[2];
        v193 = *(_OWORD *)v196;
        v194 = v197;
        v195 = v198;
        v146(v144, v145, &v193, v204.origin.x, v204.origin.y, v204.size.width, v204.size.height);
        v195 = 0;
        v193 = 0u;
        v194 = 0u;
        v143[2]((CGFloat *)&v193, v143, *(void *)(a1 + 1080), v205.size.width);
        v147 = *(void *)(a1 + 1080);
        v148 = (void (*)(void *, uint64_t, _OWORD *, double, double, double, double))v144[2];
        v191[0] = v193;
        v191[1] = v194;
        v192 = v195;
        v148(v144, v147, v191, v205.origin.x, v205.origin.y, v205.size.width, v205.size.height);
      }
      else
      {
        v143[2](v196, v143, *(void *)(a1 + 1064), v205.size.width);
        v149 = *(void *)(a1 + 1064);
        v150 = (void (*)(void *, uint64_t, long long *, double, double, double, double))v144[2];
        v193 = *(_OWORD *)v196;
        v194 = v197;
        v195 = v198;
        v150(v144, v149, &v193, v205.origin.x, v205.origin.y, v205.size.width, v205.size.height);
      }
    }
    v151 = -0.0;
    if (v57) {
      v152 = v63;
    }
    else {
      v152 = -0.0;
    }
    if (v48) {
      v153 = v63;
    }
    else {
      v153 = -0.0;
    }
    v154 = v153 + v60;
    if (v172) {
      v151 = v74;
    }
    return fmax(v61 + v152 + v154 + v151, v180 + fmax(v60, v61) * 2.0);
  }
  else
  {
    if (!v11)
    {
      if ([*(id *)(a1 + 1016) _shouldReverseLayoutDirection]) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 0x200000000;
      }
      double v14 = *MEMORY[0x1E4F1DB30];
      double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      objc_msgSend(*(id *)(a1 + 1024), "sizeThatFits:", *MEMORY[0x1E4F1DB30], v13);
      CGFloat v16 = v15;
      BOOL v18 = v15 > 0.0 && v17 > 0.0;
      PKFloatRoundToPixel();
      double v20 = v19;
      PKFloatRoundToPixel();
      double v21 = fmax(v20, 20.0);
      objc_msgSend(*(id *)(a1 + 1032), "sizeThatFits:", v14, v13);
      uint64_t v24 = *(void *)(a1 + 1032);
      if (v24) {
        LOBYTE(v24) = *(void *)(v24 + 424) != 0;
      }
      if (v22 <= 0.0) {
        LOBYTE(v24) = 0;
      }
      char v25 = v24 & (v23 > 0.0);
      CGFloat v26 = v22;
      PKFloatRoundToPixel();
      double v28 = v27;
      PKFloatRoundToPixel();
      memset(&slice, 0, sizeof(slice));
      v218.origin.x = a3;
      double v29 = a5;
      v218.origin.y = a4;
      v218.size.height = a6;
      remainder.origin.x = a3;
      remainder.origin.y = a4;
      remainder.size.width = a5;
      remainder.size.height = a6;
      v218.size.width = a5;
      CGRectDivide(v218, &slice, &remainder, v21, (CGRectEdge)v12);
      if (v18)
      {
        double v30 = 20.0;
        CGRectDivide(remainder, &slice, &remainder, v16, (CGRectEdge)v12);
      }
      else
      {
        slice.origin = remainder.origin;
        slice.size.width = 0.0;
        slice.size.height = remainder.size.height;
        double v30 = 20.0;
      }
      double v70 = fmax(v28, v30);
      if (a2)
      {
        v71 = *(void **)(a1 + 1024);
        PKSizeAlignedInRect();
        objc_msgSend(v71, "setFrame:");
      }
      CGRectDivide(remainder, &slice, &remainder, v70, HIDWORD(v12));
      if (v25)
      {
        CGRectDivide(remainder, &slice, &remainder, v26, HIDWORD(v12));
        if (!a2)
        {
LABEL_69:
          if (v18)
          {
            CGRectDivide(remainder, &slice, &remainder, 16.0, (CGRectEdge)v12);
            if ((v25 & 1) == 0)
            {
LABEL_72:
              v206 = MEMORY[0x1E4F143A8];
              v207 = 3221225472;
              v208 = __72__PKPassBannerViewController__layoutLegacyContentViewWithBounds_commit___block_invoke;
              v209 = &__block_descriptor_64_e27__CGSize_dd_16__0__UILabel_8l;
              v210 = remainder;
              v90 = (double (**)(void *, void))_Block_copy(&v206);
              v91 = v90[2](v90, *(void *)(a1 + 1072));
              v93 = v92;
              v94 = v90[2](v90, *(void *)(a1 + 1080));
              v96 = v95;
              v97 = v94 > 0.0 && v95 > 0.0;
              PKSizeAlignedInRect();
              remainder.origin.x = v98;
              remainder.origin.y = v99;
              remainder.size.width = v100;
              remainder.size.height = v101;
              if (v97)
              {
                CGRectDivide(*(CGRect *)&v98, &slice, &remainder, v96, CGRectMinYEdge);
              }
              else
              {
                slice.origin = remainder.origin;
                slice.size.width = v100;
                slice.size.height = 0.0;
              }
              v102 = v91 > 0.0 && v93 > 0.0 && v97;
              if (a2)
              {
                v103 = *(void **)(a1 + 1080);
                PKSizeAlignedInRect();
                objc_msgSend(v103, "setFrame:");
                if (!v102)
                {
LABEL_79:
                  if (v91 > 0.0 && v93 > 0.0) {
                    goto LABEL_80;
                  }
                  goto LABEL_84;
                }
              }
              else if (v91 <= 0.0 || v93 <= 0.0 || !v97)
              {
                goto LABEL_79;
              }
              CGRectDivide(remainder, &slice, &remainder, 0.0, CGRectMinYEdge);
              if (v91 > 0.0 && v93 > 0.0)
              {
LABEL_80:
                CGRectDivide(remainder, &slice, &remainder, v93, CGRectMinYEdge);
                if (!a2) {
                  goto LABEL_86;
                }
                goto LABEL_85;
              }
LABEL_84:
              slice.origin = remainder.origin;
              slice.size.width = remainder.size.width;
              slice.size.height = 0.0;
              if (!a2)
              {
LABEL_86:

                return v29;
              }
LABEL_85:
              v104 = *(void **)(a1 + 1072);
              PKSizeAlignedInRect();
              objc_msgSend(v104, "setFrame:");
              goto LABEL_86;
            }
          }
          else if ((v25 & 1) == 0)
          {
            goto LABEL_72;
          }
          CGRectDivide(remainder, &slice, &remainder, 8.0, HIDWORD(v12));
          goto LABEL_72;
        }
      }
      else
      {
        slice.origin = remainder.origin;
        slice.size.width = 0.0;
        slice.size.height = remainder.size.height;
        if (!a2) {
          goto LABEL_69;
        }
      }
      v89 = *(void **)(a1 + 1032);
      PKSizeAlignedInRect();
      objc_msgSend(v89, "setFrame:");
      goto LABEL_69;
    }
    return *MEMORY[0x1E4F1DB30];
  }
}

void *__72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke(void *result)
{
  if (result)
  {
    objc_msgSend(result, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v2.n128_f64[0] = v1 + v1;
    v4.n128_f64[0] = v3 + v3;
    return (void *)PKSizeRoundToPixel(v2, v4, v5);
  }
  return result;
}

- (double)_maximumSystemApertureWidth
{
  if (!a1) {
    return 0.0;
  }
  if (a1[124] != 1)
  {
    __break(1u);
    return 0.0;
  }
  double v1 = [a1 viewIfLoaded];
  __n128 v2 = v1;
  if (v1 && ([v1 window], (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    __n128 v4 = v3;
    [v3 bounds];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.79769313e308;
  }

  return v6;
}

void __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_2(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a2;
  if (v5)
  {
    id v23 = v5;
    objc_msgSend(v5, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v8 = v6;
    double v9 = fmin(v6, *(double *)(a1 + 32));
    if (v9 <= 0.0 || (double v10 = v7, v7 <= 0.0))
    {
      char v22 = 0;
      *(_OWORD *)a3 = *MEMORY[0x1E4F1DB30];
      *(unsigned char *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = 0;
      id v5 = v23;
    }
    else
    {
      BOOL v11 = v9 < v6;
      [v23 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      objc_msgSend(v23, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v8, v10);
      [v23 _tightBoundingRectOfFirstLine];
      double v21 = v20;
      objc_msgSend(v23, "setBounds:", v13, v15, v17, v19);
      id v5 = v23;
      *(double *)a3 = v9;
      *(double *)(a3 + 8) = v10;
      *(unsigned char *)(a3 + 16) = v11;
      *(double *)(a3 + 24) = -v21;
      char v22 = 1;
    }
  }
  else
  {
    char v22 = 0;
    *(_OWORD *)a3 = *MEMORY[0x1E4F1DB30];
    *(unsigned char *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
  }
  *(unsigned char *)(a3 + 32) = v22;
}

void *__72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = *MEMORY[0x1E4F1DB30];
  if (!*(_DWORD *)(a1 + 48))
  {
    result = (*(void *(**)(long long *__return_ptr))(*(void *)(a1 + 40) + 16))(&v10);
    long long v6 = v11;
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v6;
    *(void *)(a2 + 32) = v12;
    return result;
  }
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  (*(void (**)(long long *__return_ptr))(*(void *)(a1 + 40) + 16))(&v10);
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  result = (*(void *(**)(long long *__return_ptr))(*(void *)(a1 + 40) + 16))(&v7);
  if ((_BYTE)v12)
  {
    *(_OWORD *)a2 = v10;
    *(unsigned char *)(a2 + 16) = v11;
    *(void *)(a2 + 24) = *((void *)&v11 + 1);
    *(unsigned char *)(a2 + 32) = 1;
    if (!(_BYTE)v9) {
      return result;
    }
    *(unsigned char *)(a2 + 16) = v8;
    double v5 = *(double *)(a2 + 8) + *((double *)&v7 + 1) + *((double *)&v8 + 1);
    *(double *)a2 = fmax(*(double *)a2, *(double *)&v7);
    *(double *)(a2 + 8) = v5;
  }
  else
  {
    if (!(_BYTE)v9) {
      return result;
    }
    *(unsigned char *)(a2 + 16) = v8;
    *(_OWORD *)a2 = v7;
    *(void *)(a2 + 24) = *((void *)&v11 + 1);
  }
  *(unsigned char *)(a2 + 32) = 1;
  return result;
}

uint64_t __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_4(CGRect *a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v9.origin.x = a4;
  v9.origin.y = a5;
  v9.size.width = a6;
  v9.size.height = a7;
  CGRect v10 = CGRectIntersection(v9, a1[1]);
  CGRectIsNull(v10);

  return PKSizeAspectFit();
}

void *__72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  result = (*(void *(**)(long long *__return_ptr))(*(void *)(a1 + 32) + 16))(&v18);
  if (a2 && (_BYTE)v20)
  {
    double v12 = *(double *)(a1 + 40);
    v9.n128_f64[0] = v12 * *(double *)&v18;
    v10.n128_f64[0] = v12 * *((double *)&v18 + 1);
    *(void *)&long long v18 = v9.n128_u64[0];
    *((double *)&v18 + 1) = v12 * *((double *)&v18 + 1);
    v11.n128_f64[0] = v12 * *((double *)&v19 + 1);
    *((void *)&v19 + 1) = v11.n128_u64[0];
    if (v9.n128_f64[0] > a4)
    {
      *(double *)&long long v18 = a4;
      LOBYTE(v19) = 1;
      v9.n128_f64[0] = a4;
    }
    PKSizeRoundToPixel(v9, v10, v11);
    *(void *)&long long v18 = v13;
    *((void *)&v18 + 1) = v14;
    result = (void *)PKFloatRoundToPixel();
    *((void *)&v19 + 1) = v15;
    BOOL v16 = v19;
    if ((_BYTE)v19) {
      BOOL v16 = *(unsigned char *)(a1 + 48) == 0;
    }
    LOBYTE(v19) = v16;
    *(void *)(a3 + 32) = v20;
    long long v17 = v19;
    *(_OWORD *)a3 = v18;
    *(_OWORD *)(a3 + 16) = v17;
  }
  else
  {
    *(_OWORD *)a3 = *MEMORY[0x1E4F1DB30];
    *(unsigned char *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(unsigned char *)(a3 + 32) = 0;
  }
  return result;
}

void __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_6(uint64_t a1, void *a2, double *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  remainder.origin.x = a4;
  remainder.origin.y = a5;
  remainder.size.width = a6;
  remainder.size.height = a7;
  id v13 = a2;
  memset(&slice, 0, sizeof(slice));
  v28.origin.x = a4;
  v28.origin.y = a5;
  v28.size.width = a6;
  v28.size.height = a7;
  CGRectDivide(v28, &slice, &remainder, *a3, *(CGRectEdge *)(a1 + 40));
  double v14 = a3[3];
  slice.origin.x = slice.origin.x + 0.0;
  slice.origin.y = v14 + slice.origin.y;
  slice.size.height = slice.size.height - (v14 + 0.0);
  CATransform3DMakeScale(&v25, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32), 1.0);
  [v13 setTransform3D:&v25];
  objc_msgSend(v13, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *a3, a3[1]);
  PKSizeAlignedInRect();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [v13 anchorPoint];
  objc_msgSend(v13, "setCenter:", v16 + v23 * v20, v18 + v24 * v22);
  if ([v13 marqueeRunning] != (*((unsigned char *)a3 + 16) != 0)) {
    [v13 setMarqueeRunning:*((unsigned __int8 *)a3 + 16) != 0];
  }
}

double __72__PKPassBannerViewController__layoutLegacyContentViewWithBounds_commit___block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return *MEMORY[0x1E4F1DB30];
  }
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return fmin(v3, *(double *)(a1 + 48));
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKPassBannerViewController;
  [(PKPassBannerViewController *)&v15 viewWillLayoutSubviews];
  double v3 = [(PKPassBannerViewController *)self view];
  [(UIView *)v3 bounds];
  double v8 = v4;
  double v9 = v5;
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  platter = self->_platter;
  if (platter) {
    -[PLPlatterView setFrame:](platter, "setFrame:", v4, v5, v6, v7);
  }
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v3 == self->_contentView)
  {
    double v13 = v8;
    double v14 = v9;
  }
  -[PKPassBannerViewController _layoutContentViewWithBounds:commit:]((uint64_t)self, 1, v13, v14, v10, v11);
}

void __47__PKPassBannerViewController__startRevokeTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PKPassBannerViewController _revoke]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)_revoke
{
  if (a1 && !*(unsigned char *)(a1 + 979))
  {
    -[PKPassBannerViewController _revoked](a1);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1088));
    [WeakRetained revoke];
  }
}

- (void)_revoked
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 979))
    {
      *(unsigned char *)(a1 + 979) = 1;
      id v2 = *(NSObject **)(a1 + 984);
      if (v2)
      {
        dispatch_source_cancel(v2);
        double v3 = *(void **)(a1 + 984);
        *(void *)(a1 + 984) = 0;
      }
    }
  }
}

- (void)_appeared
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 978))
    {
      *(unsigned char *)(a1 + 978) = 1;
      if (!*(unsigned char *)(a1 + 979))
      {
        if (*(unsigned char *)(a1 + 976))
        {
          SystemSoundID v2 = 1394;
          if ([*(id *)(a1 + 1104) passType] == 1)
          {
            if ([*(id *)(a1 + 1104) isAccessPass]) {
              SystemSoundID v2 = 1163;
            }
            else {
              SystemSoundID v2 = 1394;
            }
          }
        }
        else
        {
          SystemSoundID v2 = 1400;
        }
        AudioServicesPlaySystemSound(v2);
      }
    }
  }
}

- (void)_tapped:(id)a3
{
  id v7 = [(PKPass *)self->_pass passURL];
  if (v7)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F62628]];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F62688]];
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F62678]];
    double v5 = (void *)*MEMORY[0x1E4F87D30];
    double v6 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v4];
    PKOpenApplication(v5, v6);
  }
  -[PKPassBannerViewController _revoke]((uint64_t)self);
}

void __57__PKPassBannerViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !WeakRetained[979])
  {
    id v4 = WeakRetained;
    [WeakRetained loadViewIfNeeded];
    double v3 = -[PKPassBannerViewController _maximumSystemApertureWidth](*(void **)(a1 + 32));
    objc_msgSend(v4, "setPreferredContentSize:", -[PKPassBannerViewController _layoutContentViewWithBounds:commit:]((uint64_t)v4, 0, *MEMORY[0x1E4F1DAD8], *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8), v3, 1.79769313e308));
    id WeakRetained = v4;
    v4[1000] = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPresentable:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_presentable, v5);
  id v4 = v5;
  if (v5 && self->_revoked)
  {
    [v5 revoke];
    id v4 = v5;
  }
}

- (UIEdgeInsets)bannerContentOutsets
{
  SystemSoundID v2 = -[PKPassBannerViewController _platterView](self);
  double v3 = v2;
  if (v2)
  {
    [v2 shadowOutsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4FB2848];
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  if (self->_style)
  {
    [(PKPassBannerViewController *)self preferredContentSize];
  }
  else
  {
    CGFloat height = a3.height;
    CGFloat width = a3.width;
    [(PKPassBannerViewController *)self loadViewIfNeeded];
    double v9 = *MEMORY[0x1E4F1DAD8];
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v5 = -[PKPassBannerViewController _layoutContentViewWithBounds:commit:]((uint64_t)self, 0, v9, v10, width, height);
  }
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  if (!self->_style) {
    MEMORY[0x1F415C470]();
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  if (!self->_style)
  {
    if (!self->_revoked)
    {
      revokeTimer = self->_revokeTimer;
      if (revokeTimer)
      {
        dispatch_source_cancel(revokeTimer);
        double v5 = self->_revokeTimer;
        self->_revokeTimer = 0;
      }
      objc_initWeak(&location, self);
      double v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      double v7 = self->_revokeTimer;
      self->_revokeTimer = v6;

      double v8 = self->_revokeTimer;
      dispatch_time_t v9 = dispatch_time(0, 6000000000);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      CGFloat v10 = self->_revokeTimer;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47__PKPassBannerViewController__startRevokeTimer__block_invoke;
      v11[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v10, v11);
      dispatch_resume((dispatch_object_t)self->_revokeTimer);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    -[PKPassBannerViewController _appeared]((uint64_t)self);
  }
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  return 4;
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
  if (self->_walletForeground) {
    return 74;
  }
  else {
    return 72;
  }
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  if (self->_activeLayoutMode != a3)
  {
    double v5 = [(PKPassBannerViewController *)self viewIfLoaded];
    id v7 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      double v5 = v7;
    }
    self->_activeLayoutMode = a3;
    if (a3 == 4)
    {
      if (self->_style != 1)
      {
        __break(1u);
        return;
      }
      if (!self->_updatingPreferredContentSize)
      {
        self->_updatingPreferredContentSize = 1;
        objc_initWeak(&location, self);
        double v6 = [(PKPassBannerViewController *)self systemApertureElementContext];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __57__PKPassBannerViewController__updatePreferredContentSize__block_invoke;
        v8[3] = &unk_1E59CB010;
        objc_copyWeak(&v9, &location);
        v8[4] = self;
        [v6 setElementNeedsUpdateWithCoordinatedAnimations:v8];

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
        double v5 = v7;
      }
    }
    if (v5)
    {
      [v7 setNeedsLayout];
      double v5 = v7;
    }
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_appeared)
  {
    minimalView = self->_minimalView;
    id v6 = v4;
    [(UIView *)self->_contentView SBUISA_standardInteritemPadding];
    -[PKPassBannerMinimalView _setInteritemPadding:](minimalView, "_setInteritemPadding:");
    -[PKPassBannerViewController _appeared]((uint64_t)self);
    id v4 = v6;
  }
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)self->_leadingView;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)self->_trailingView;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)self->_minimalView;
}

- (void)passBannerMinimalViewDidChangeSize:(id)a3
{
  id v4 = a3;
  if (self->_style == 1 && self->_activeLayoutMode != 4)
  {
    id v6 = v4;
    double v5 = [(PKPassBannerViewController *)self systemApertureElementContext];
    [v5 setElementNeedsUpdate];

    id v4 = v6;
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

- (PKPass)pass
{
  return self->_pass;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (unint64_t)preferredLabelAxis
{
  return self->_preferredLabelAxis;
}

- (PKPassBannerTrailingViewConfiguration)trailingViewConfiguration
{
  return self->_trailingViewConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingViewConfiguration, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_presentable);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_platter, 0);

  objc_storeStrong((id *)&self->_revokeTimer, 0);
}

@end