@interface PKGSVWalletHeaderView
- (BOOL)needsRemoval;
- (BOOL)showActivityIndicator;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKGSVWalletHeaderView)initWithPassType:(unint64_t)a3 state:(id *)a4 delegate:(id)a5;
- (id)_inboxBadgeValue;
- (id)interstitialProvider;
- (id)leadingViewsForInterstitialController:(id)a3;
- (id)trailingViewsForInterstitialController:(id)a3;
- (uint64_t)_shouldShowInboxButton;
- (unint64_t)passType;
- (void)_layoutSubviewsInBounds:(double)a3 withCommitMode:(double)a4;
- (void)_setSizeMayChange;
- (void)_updateFonts:(uint64_t)a1;
- (void)addTapped;
- (void)inboxTapped;
- (void)layoutSubviews;
- (void)ordersTapped;
- (void)setHeaderDelegate:(id)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setShowBackgroundProvisioningHint:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation PKGSVWalletHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKGSVWalletHeaderView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_layoutSubviewsInBounds:(double)a3 withCommitMode:(double)a4
{
  if (a1)
  {
    v84.receiver = (id)a1;
    v84.super_class = (Class)PKGSVWalletHeaderView;
    objc_msgSendSuper2(&v84, sel_layoutSubviews);
    double v59 = a3;
    double v60 = a4;
    if (*(unsigned char *)(a1 + 408))
    {
      [*(id *)(a1 + 496) sizeToFit];
      id v11 = *(id *)(a1 + 464);
      if (!v11)
      {
        __break(1u);
        return;
      }
      v12 = v11;
      [v11 size];
      [v12 alignmentRectInsets];
      PKFloatRoundToPixel();
      double v14 = v13;

      double v15 = fmax(v14, 5.0);
      double v16 = *MEMORY[0x1E4F1DAD8];
      double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      objc_msgSend(*(id *)(a1 + 512), "setFrame:", *MEMORY[0x1E4F1DAD8], v17, v15, v15);
      objc_msgSend(*(id *)(a1 + 520), "setFrame:", v16, v17, v15, v15);
      [*(id *)(a1 + 528) sizeToFit];
      objc_msgSend(*(id *)(a1 + 536), "setFrame:", v16, v17, v15, v15);
      *(unsigned char *)(a1 + 408) = 0;
    }
    else
    {
      double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    int v18 = [(id)a1 _shouldReverseLayoutDirection];
    if (v18) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 0x200000000;
    }
    double v20 = *(double *)(a1 + 416);
    double v21 = *(double *)(a1 + 432);
    if (v18) {
      double v22 = *(double *)(a1 + 440);
    }
    else {
      double v22 = *(double *)(a1 + 424);
    }
    if (v18) {
      double v23 = *(double *)(a1 + 424);
    }
    else {
      double v23 = *(double *)(a1 + 440);
    }
    uint64_t v78 = 0;
    v79 = (CGRect *)&v78;
    uint64_t v80 = 0x4010000000;
    v81 = "";
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v72 = 0;
    v73 = (CGRect *)&v72;
    uint64_t v74 = 0x4010000000;
    v75 = "";
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v68 = 0;
    v69 = (double *)&v68;
    uint64_t v70 = 0x2020000000;
    double v71 = v17;
    [*(id *)(a1 + 496) frame];
    CGFloat v25 = v24;
    double v58 = v22;
    double v26 = a5 - (v22 + v23);
    double v27 = a6 - (v20 + v21);
    PKSizeAlignedInRect();
    v28 = v73;
    v73[1].origin.CGFloat x = v85.origin.x;
    v28[1].origin.CGFloat y = v85.origin.y;
    ++v28;
    v28->size.width = v85.size.width;
    v28->size.CGFloat height = v85.size.height;
    CGRectDivide(v85, v79 + 1, v28, v25, (CGRectEdge)v19);
    PKSizeAlignedInRect();
    v69[3] = fmax(v29 + v30, v69[3]);
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 496), "setFrame:");
      if (*(void *)(a1 + 504))
      {
        CGSize size = v73[1].size;
        CGPoint origin = v73[1].origin;
        CGFloat x = origin.x;
        CGSize v67 = size;
        CGFloat y = v73[1].origin.y;
        size.width = v73[1].size.width;
        CGFloat height = v73[1].size.height;
        CGRectDivide(*(CGRect *)(&size - 1), v79 + 1, v73 + 1, 10.0, (CGRectEdge)v19);
        [*(id *)(a1 + 504) frame];
        CGFloat v36 = v35;
        CGRectDivide(v73[1], v79 + 1, v73 + 1, v37, (CGRectEdge)v19);
        v38 = [*(id *)(a1 + 496) font];
        v39 = [*(id *)(a1 + 504) font];
        [v38 descender];
        [v39 ascender];
        PKFloatRoundToPixel();
        v40 = v79;
        v79[1].origin.CGFloat y = v41;
        v40[1].size.CGFloat height = v36;
        v42 = *(void **)(a1 + 504);
        PKSizeAlignedInRect();
        objc_msgSend(v42, "setFrame:");
        v43 = v73;
        CGSize v44 = v67;
        v73[1].CGPoint origin = origin;
        v43[1].CGSize size = v44;
      }
    }
    origin.CGFloat x = 0.0;
    *(void *)&origin.CGFloat y = &origin;
    *(void *)&v67.width = 0x2020000000;
    LOBYTE(v67.height) = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKGSVWalletHeaderView__layoutSubviewsInBounds_withCommitMode___block_invoke;
    aBlock[3] = &unk_1E59D0648;
    aBlock[4] = &origin;
    aBlock[5] = &v72;
    aBlock[8] = v19;
    int v63 = HIDWORD(v19);
    int v64 = 1;
    aBlock[6] = &v78;
    aBlock[7] = &v68;
    char v65 = a2;
    v45 = _Block_copy(aBlock);
    (*((void (**)(void *, void, void))v45 + 2))(v45, *(void *)(a1 + 512), 0);
    [*(id *)(a1 + 544) frame];
    v46 = *(void **)(a1 + 544);
    PKSizeAlignedInRect();
    objc_msgSend(v46, "setFrame:");
    uint64_t v47 = *(void *)(a1 + 536);
    if (v47) {
      (*((void (**)(void *, uint64_t, void))v45 + 2))(v45, v47, 0);
    }
    if (*(void *)(a1 + 520))
    {
      uint64_t v48 = *(void *)(a1 + 528);
      if (v48) {
        uint64_t v49 = *(void *)(a1 + 528);
      }
      else {
        uint64_t v49 = *(void *)(a1 + 520);
      }
      (*((void (**)(void *, uint64_t, BOOL))v45 + 2))(v45, v49, v48 != 0);
    }
    double v50 = v60 + v20;
    PKSizeAlignedInRect();
    double v52 = v51;
    double v54 = v53;
    if (a2) {
      objc_msgSend(*(id *)(a1 + 488), "setFrame:");
    }
    double v55 = fmax(v52 + v54, v50);

    _Block_object_dispose(&origin, 8);
    _Block_object_dispose(&v68, 8);
    if (*(void *)(a1 + 552))
    {
      v56 = v73;
      v73[1].origin.CGFloat x = v59 + v58;
      v56[1].origin.CGFloat y = v50;
      ++v56;
      v56->size.width = v26;
      v56->size.CGFloat height = v27;
      v86.origin.CGFloat x = v59 + v58;
      v86.origin.CGFloat y = v60 + v20;
      v86.size.width = v26;
      v86.size.CGFloat height = v27;
      CGRectDivide(v86, v79 + 1, v56, v55 - v50, CGRectMinYEdge);
      CGRectDivide(v73[1], v79 + 1, v73 + 1, 30.0, CGRectMinYEdge);
      objc_msgSend(*(id *)(a1 + 552), "sizeThatFits:", v73[1].size.width, 1.79769313e308);
      CGRectDivide(v73[1], v79 + 1, v73 + 1, v57, CGRectMinYEdge);
      PKSizeAlignedInRect();
      if (a2) {
        objc_msgSend(*(id *)(a1 + 552), "setFrame:");
      }
      CGRectDivide(v73[1], v79 + 1, v73 + 1, 10.0, CGRectMinYEdge);
    }
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(&v78, 8);
  }
}

double __64__PKGSVWalletHeaderView__layoutSubviewsInBounds_withCommitMode___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  [v5 frame];
  CGFloat v7 = v6;
  if (a3)
  {
    objc_msgSend(v5, "alignmentRectForFrame:");
    CGFloat v7 = v8;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v9 = *(CGRect **)(*(void *)(a1 + 40) + 8);
    v17.origin.CGFloat x = v9[1].origin.x;
    v17.origin.CGFloat y = v9[1].origin.y;
    ++v9;
    v17.size.width = v9->size.width;
    v17.size.CGFloat height = v9->size.height;
    CGRectDivide(v17, (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v9, 12.0, *(CGRectEdge *)(a1 + 68));
  }
  v10 = *(CGRect **)(*(void *)(a1 + 40) + 8);
  v18.origin.CGFloat x = v10[1].origin.x;
  v18.origin.CGFloat y = v10[1].origin.y;
  ++v10;
  v18.size.width = v10->size.width;
  v18.size.CGFloat height = v10->size.height;
  CGRectDivide(v18, (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v10, v7, *(CGRectEdge *)(a1 + 68));
  PKSizeAlignedInRect();
  double v15 = v11;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = fmax(v12 + v14, *(double *)(*(void *)(*(void *)(a1 + 56) + 8)+ 24));
  if (a3) {
    objc_msgSend(v5, "frameForAlignmentRect:", v11, v12, v13, v14);
  }
  if (*(unsigned char *)(a1 + 80)) {
    objc_msgSend(v5, "setFrame:");
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;

  return v15;
}

- (BOOL)needsRemoval
{
  if (self->_passType == 1)
  {
    shouldShowInboCGFloat x = -[PKGSVWalletHeaderView _shouldShowInboxButton]((uint64_t)self);
    double v4 = -[PKGSVWalletHeaderView _inboxBadgeValue]((id *)&self->super.super.super.isa);
    if (shouldShowInbox == (self->_inboxButton == 0))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      id v5 = [(PKBadgedView *)self->_badgedInboxButton text];
      id v6 = v4;
      CGFloat v7 = v6;
      if (v5 == v6)
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        LOBYTE(v8) = 1;
        if (v6 && v5) {
          int v8 = [v5 isEqualToString:v6] ^ 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (uint64_t)_shouldShowInboxButton
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
    double v3 = WeakRetained;
    if (WeakRetained) {
      uint64_t v1 = [WeakRetained inboxVisibleForSectionHeaderView:v1];
    }
    else {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (id)_inboxBadgeValue
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 70);
    double v3 = WeakRetained;
    if (WeakRetained)
    {
      id v1 = (id)[WeakRetained inboxBadgeCountForSectionHeaderView:v1];
      if (v1)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
        [v4 setMaximumFractionDigits:0];
        id v5 = [NSNumber numberWithUnsignedInteger:v1];
        id v1 = [v4 stringFromNumber:v5];
      }
    }
    else
    {
      id v1 = 0;
    }
  }

  return v1;
}

- (void)setShowBackgroundProvisioningHint:(BOOL)a3 animated:(BOOL)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  backgroundProvisioningHintView = self->_backgroundProvisioningHintView;
  if ((backgroundProvisioningHintView != 0) != a3)
  {
    BOOL v5 = a4;
    if (backgroundProvisioningHintView)
    {
      CGFloat v7 = backgroundProvisioningHintView;
      int v8 = self->_backgroundProvisioningHintView;
      self->_backgroundProvisioningHintView = 0;

      if (v5)
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        double v27 = __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke_2;
        v28 = &unk_1E59CB6D8;
        double v29 = v7;
        [(UIView *)v29 pkui_setAlpha:1 animated:&v25 withCompletion:0.0];
      }
      else
      {
        [(PKPGSVSectionHeader_BackgroundProvisioningHintView *)v7 removeFromSuperview];
      }
    }
    else
    {
      objc_initWeak(&location, self);
      v9 = [PKPGSVSectionHeader_BackgroundProvisioningHintView alloc];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke;
      v30[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v31, &location);
      v10 = v30;
      if (v9)
      {
        v33.receiver = v9;
        v33.super_class = (Class)PKPGSVSectionHeader_BackgroundProvisioningHintView;
        v9 = -[PKGSVWalletHeaderView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        if (v9)
        {
          double v11 = _Block_copy(v10);
          id observer = v9->_observer;
          v9->_id observer = v11;

          -[PKPGSVSectionHeader_BackgroundProvisioningHintView setAnchorPoint:](v9, "setAnchorPoint:", 0.5, 0.0);
          [(PKPGSVSectionHeader_BackgroundProvisioningHintView *)v9 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2788]];
          double v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
          label = v9->_label;
          v9->_label = v13;

          double v15 = v9->_label;
          double v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
          [(UILabel *)v15 setTextColor:v16];

          [(UILabel *)v9->_label setNumberOfLines:0];
          [(UILabel *)v9->_label setTextAlignment:1];
          CGRect v17 = v9->_label;
          CGRect v18 = PKLocalizedPaymentString(&cfstr_AddingCardsToW.isa);
          [(UILabel *)v17 setText:v18];

          [(PKPGSVSectionHeader_BackgroundProvisioningHintView *)v9 addSubview:v9->_label];
          uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
          activityIndicator = v9->_activityIndicator;
          v9->_activityIndicator = (UIActivityIndicatorView *)v19;

          [(UIActivityIndicatorView *)v9->_activityIndicator startAnimating];
          [(PKPGSVSectionHeader_BackgroundProvisioningHintView *)v9 addSubview:v9->_activityIndicator];
          v34[0] = objc_opt_class();
          v34[1] = objc_opt_class();
          double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
          id v22 = (id)[(PKPGSVSectionHeader_BackgroundProvisioningHintView *)v9 registerForTraitChanges:v21 withHandler:&__block_literal_global_58];

          -[PKPGSVSectionHeader_BackgroundProvisioningHintView _updateFonts:]((uint64_t)v9, 1);
        }
      }

      double v23 = self->_backgroundProvisioningHintView;
      self->_backgroundProvisioningHintView = v9;

      [(PKGSVWalletHeaderView *)self addSubview:self->_backgroundProvisioningHintView];
      if (v5)
      {
        [(UIView *)self->_backgroundProvisioningHintView pkui_setAlpha:0 animated:0.0];
        [(UIView *)self->_backgroundProvisioningHintView pkui_setAlpha:1 animated:1.0];
      }
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    [(PKGSVWalletHeaderView *)self setNeedsLayout];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_headerDelegate);
    [WeakRetained setNeedsUpdateForGroupStackViewSectionHeaderView:self];
  }
}

- (void)setHeaderDelegate:(id)a3
{
}

- (void)_updateFonts:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  id v4 = [(id)a1 traitCollection];
  if (!v4)
  {
    __break(1u);
    goto LABEL_21;
  }
  BOOL v5 = v4;
  id v6 = (NSString *)(id)*MEMORY[0x1E4FB27D0];
  CGFloat v7 = [v5 preferredContentSizeCategory];
  int v8 = v7;
  if (v7 && UIContentSizeCategoryCompareToCategory(v7, v6) == NSOrderedSame)
  {
    id v9 = v5;
  }
  else
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __ReferenceTraitCollection_block_invoke;
    void v34[3] = &unk_1E59D0670;
    v34[4] = v6;
    id v9 = [v5 traitCollectionByModifyingTraits:v34];
  }
  v10 = v9;

  double v11 = (void *)*MEMORY[0x1E4FB0928];
  uint64_t v12 = _PKFontForDesign(v5, (void *)*MEMORY[0x1E4FB0928], (void *)*MEMORY[0x1E4FB2928], 2, 0, 0);
  [*(id *)(a1 + 496) setFont:v12];
  double v13 = (void *)*MEMORY[0x1E4FB2908];
  double v14 = (void *)_PKFontForDesign(v5, v11, (void *)*MEMORY[0x1E4FB2908], 2, 0, 0);
  double v15 = v14;
  if (v5 == v10)
  {
    id v18 = v14;
  }
  else
  {
    id v16 = v10;
    if (!v16)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    CGRect v17 = v16;
    id v18 = (id)_PKFontForDesign(v16, v11, v13, 2, 0, 0);
  }
  id v19 = v15;
  if (!v19)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  double v20 = v19;
  char v29 = a2;
  double v21 = [MEMORY[0x1E4FB1830] configurationWithFont:v19 scale:-1];

  v28 = (void *)v12;
  if (v5 == v10)
  {
    id v24 = v21;
    goto LABEL_16;
  }
  id v22 = v18;
  if (!v22)
  {
LABEL_23:
    __break(1u);
    return;
  }
  double v23 = v22;
  objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:scale:", v22, -1, v12);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PKGSVWalletHeaderView__updateFonts___block_invoke;
  aBlock[3] = &unk_1E59D0620;
  BOOL v33 = v5 == v10;
  id v25 = v21;
  id v31 = v25;
  id v26 = v24;
  id v32 = v26;
  double v27 = (void (**)(void *, __CFString *, uint64_t, uint64_t, uint64_t))_Block_copy(aBlock);
  v27[2](v27, @"plus", a1 + 448, a1 + 456, a1 + 464);
  v27[2](v27, @"person.crop.circle", 0, 0, a1 + 472);
  v27[2](v27, @"shippingbox.fill", 0, 0, a1 + 480);
  [*(id *)(a1 + 512) updateWithImage:*(void *)(a1 + 464)];
  [*(id *)(a1 + 520) updateWithImage:*(void *)(a1 + 472)];
  [*(id *)(a1 + 536) updateWithImage:*(void *)(a1 + 480)];
  *(unsigned char *)(a1 + 408) = 1;
  [(id)a1 setNeedsLayout];
  if ((v29 & 1) == 0) {
    -[PKGSVWalletHeaderView _setSizeMayChange](a1);
  }
}

void __38__PKGSVWalletHeaderView__updateFonts___block_invoke(uint64_t a1, void *a2, id *a3, double *a4, id *a5)
{
  id v38 = a2;
  if (!a3 || !*(unsigned char *)(a1 + 48) || (id v9 = *a3, (v10 = *a3) == 0))
  {
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = v38;
    id v14 = v12;
    if (v13)
    {
      double v15 = v14;
      if (v14)
      {
        id v16 = [MEMORY[0x1E4FB1818] _systemImageNamed:v13 withConfiguration:v14];
        double v11 = [v16 imageWithRenderingMode:2];

        objc_storeStrong(a5, v11);
        if (!a3) {
          goto LABEL_19;
        }
        goto LABEL_8;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  double v11 = v10;
  objc_storeStrong(a5, v9);
LABEL_8:
  if (!*a3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v17 = *a5;
      goto LABEL_14;
    }
    id v18 = *(void **)(a1 + 40);
    id v19 = v38;
    id v20 = v18;
    if (v19)
    {
      double v21 = v20;
      if (v20)
      {
        id v22 = [MEMORY[0x1E4FB1818] _systemImageNamed:v19 withConfiguration:v20];
        id v17 = [v22 imageWithRenderingMode:2];

LABEL_14:
        id v23 = *a3;
        *a3 = v17;

        if (a4)
        {
          if (*a3)
          {
            id v24 = *a3;
            [v24 size];
            double v26 = v25;
            double v28 = v27;
            [v24 alignmentRectInsets];
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;
            double v36 = v35;

            double v37 = 32.0 / fmax(v26 - (v32 + v36), v28 - (v30 + v34));
          }
          else
          {
            double v37 = 1.0;
          }
          *a4 = v37;
        }
        goto LABEL_19;
      }
LABEL_25:
      __break(1u);
      return;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
}

- (PKGSVWalletHeaderView)initWithPassType:(unint64_t)a3 state:(id *)a4 delegate:(id)a5
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id obj = a5;
  v64.receiver = self;
  v64.super_class = (Class)PKGSVWalletHeaderView;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v11 = -[PKGSVWalletHeaderView initWithFrame:](&v64, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    [(PKGSVWalletHeaderView *)v11 setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
    objc_msgSend((id)v12, "setAnchorPoint:", 0.5, 0.0);
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    id v14 = *(void **)(v12 + 488);
    *(void *)(v12 + 488) = v13;

    objc_msgSend(*(id *)(v12 + 488), "setAnchorPoint:", 0.5, 0.0);
    [*(id *)(v12 + 488) setMinimumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    [*(id *)(v12 + 488) setMaximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
    [(id)v12 addSubview:*(void *)(v12 + 488)];
    double v15 = [MEMORY[0x1E4FB1618] labelColor];
    id v16 = +[PKPassGroupStackView backgroundColor];
    *(void *)(v12 + 584) = a3;
    objc_storeWeak((id *)(v12 + 560), obj);
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    id v18 = *(void **)(v12 + 496);
    *(void *)(v12 + 496) = v17;

    [*(id *)(v12 + 496) setTextColor:v15];
    id v19 = *(void **)(v12 + 496);
    id v20 = PKLocalizedString(&cfstr_Wallet_0.isa);
    [v19 setText:v20];

    [*(id *)(v12 + 496) setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [*(id *)(v12 + 496) sizeToFit];
    [*(id *)(v12 + 488) addSubview:*(void *)(v12 + 496)];
    objc_initWeak(&location, (id)v12);
    dispatch_time_t v21 = dispatch_time(0, 2500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke;
    block[3] = &unk_1E59CB010;
    double v51 = &v62;
    objc_copyWeak(&v62, &location);
    id v22 = v15;
    id v61 = v22;
    dispatch_after(v21, MEMORY[0x1E4F14428], block);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_2;
    aBlock[3] = &unk_1E59D05D0;
    id v50 = v22;
    id v58 = v50;
    id v23 = v16;
    id v59 = v23;
    id v24 = (uint64_t (**)(void))_Block_copy(aBlock);
    double v25 = (void *)v24[2]();
    [v25 setImageEnabled:0 forState:2];
    double v26 = PKLocalizedPaymentString(&cfstr_AddCard.isa);
    [v25 setAccessibilityLabel:v26];

    objc_storeStrong((id *)(v12 + 512), v25);
    [*(id *)(v12 + 512) setAccessibilityIdentifier:*MEMORY[0x1E4F851C8]];
    [*(id *)(v12 + 512) addTarget:v12 action:sel_addTapped forControlEvents:64];
    [*(id *)(v12 + 488) addSubview:*(void *)(v12 + 512)];
    if (*(void *)(v12 + 584) == 1 && -[PKGSVWalletHeaderView _shouldShowInboxButton](v12))
    {
      double v27 = (void *)((uint64_t (*)(uint64_t (**)(void)))v24[2])(v24);
      objc_storeStrong((id *)(v12 + 520), v27);
      double v28 = -[PKGSVWalletHeaderView _inboxBadgeValue]((id *)v12);
      if (v28)
      {
        double v29 = -[PKBadgedView initWithView:text:]([PKBadgedView alloc], "initWithView:text:", *(void *)(v12 + 520), v28, v50, &v62);
        double v30 = *(void **)(v12 + 528);
        *(void *)(v12 + 528) = v29;
      }
      objc_msgSend(v27, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85810], v50);
    }
    double v31 = *(void **)(v12 + 520);
    if (v31)
    {
      [v31 addTarget:v12 action:sel_inboxTapped forControlEvents:64];
      double v32 = *(void **)(v12 + 488);
      if (*(void *)(v12 + 528)) {
        objc_msgSend(v32, "addSubview:");
      }
      else {
        [v32 addSubview:*(void *)(v12 + 520)];
      }
    }
    if (_os_feature_enabled_impl())
    {
      double v33 = (void *)((uint64_t (*)(uint64_t (**)(void)))v24[2])(v24);
      double v34 = PKLocalizedOrderManagementString(&cfstr_OrdersToolbarA.isa);
      [v33 setAccessibilityLabel:v34];

      [v33 addTarget:v12 action:sel_ordersTapped forControlEvents:64];
      objc_storeStrong((id *)(v12 + 536), v33);
      [v33 setAccessibilityIdentifier:*MEMORY[0x1E4F85730]];
      [*(id *)(v12 + 488) addSubview:*(void *)(v12 + 536)];
    }
    unint64_t v35 = PKUIGetMinScreenType();
    double v36 = (double *)((char *)&unk_1A0443870 + 8 * v35);
    if (v35 >= 0x14) {
      double v36 = (double *)MEMORY[0x1E4F1DB30];
    }
    double v37 = *v36;
    PKPassMaxFrontSize();
    double v39 = 16.0;
    double v40 = 16.0;
    if (v37 > v38)
    {
      double v41 = v37 - v38;
      PKFloatRoundToPixel();
      double v39 = v42 + 6.0;
      double v40 = v41 - v42 + 6.0;
    }
    *(void *)(v12 + 416) = 0;
    *(double *)(v12 + 424) = v39;
    *(void *)(v12 + 432) = 0;
    *(double *)(v12 + 440) = v40;
    v43 = *(void **)(v12 + 488);
    v66[0] = objc_opt_class();
    CGSize v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_3;
    v55[3] = &unk_1E59D05F8;
    objc_copyWeak(&v56, &location);
    id v45 = (id)[v43 registerForTraitChanges:v44 withHandler:v55];

    v46 = *(void **)(v12 + 488);
    uint64_t v65 = objc_opt_class();
    uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_4;
    v53[3] = &unk_1E59D05F8;
    objc_copyWeak(&v54, &location);
    id v48 = (id)[v46 registerForTraitChanges:v47 withHandler:v53];

    -[PKGSVWalletHeaderView _updateFonts:](v12, 1);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);

    objc_destroyWeak(v51);
    objc_destroyWeak(&location);
  }
  return (PKGSVWalletHeaderView *)v12;
}

PKContinuousButton *__57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_2(uint64_t a1)
{
  v5[0] = 0;
  v5[1] = 0;
  int64x2_t v6 = vdupq_n_s64(2uLL);
  uint64_t v7 = 2;
  v2 = [[PKContinuousButton alloc] initWithConfiguration:v5];
  [(PKContinuousButton *)v2 setTintColor:*(void *)(a1 + 32)];
  -[PKContinuousButton _setTouchInsets:](v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  double v3 = [(PKContinuousButton *)v2 imageView];
  [v3 setTintColor:*(void *)(a1 + 40)];

  return v2;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKGSVWalletHeaderView;
  [(PKGSVWalletHeaderView *)&v7 layoutSubviews];
  [(PKGSVWalletHeaderView *)self bounds];
  -[PKGSVWalletHeaderView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 1, v3, v4, v5, v6);
}

void __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    double v3 = PKLocalizedEnvironmentHint();
    if (v3)
    {
      double v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
      double v5 = (void *)_PKFontForDesign(v4, (void *)*MEMORY[0x1E4FB0928], (void *)*MEMORY[0x1E4FB28F0], 64, 0, 0);
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      id v7 = v9[63];
      v9[63] = v6;

      [v9[63] setText:v3];
      [v9[63] setFont:v5];
      [v9[63] setTextColor:*(void *)(a1 + 32)];
      [v9[63] setTextAlignment:2];
      [v9[63] sizeToFit];
      [v9[63] setAccessibilityIdentifier:*MEMORY[0x1E4F854F8]];
      [v9[63] setAlpha:0.0];
      [v9[61] insertSubview:v9[63] atIndex:0];
      [v9 setNeedsLayout];
      double v8 = [v9[63] layer];
      objc_msgSend(v8, "pkui_animateToOpacity:withCompletion:", 0, 0.3);
    }
    id WeakRetained = v9;
  }
}

void __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[56];
    WeakRetained[56] = 0;
    double v3 = WeakRetained;

    -[PKGSVWalletHeaderView _updateFonts:]((uint64_t)v3, 0);
    id WeakRetained = v3;
  }
}

void __57__PKGSVWalletHeaderView_initWithPassType_state_delegate___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKGSVWalletHeaderView _updateFonts:]((uint64_t)WeakRetained, 0);
}

- (void)_setSizeMayChange
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 409))
    {
      *(unsigned char *)(a1 + 409) = 1;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PKGSVWalletHeaderView__setSizeMayChange__block_invoke;
      block[3] = &unk_1E59CA7D0;
      void block[4] = a1;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __42__PKGSVWalletHeaderView__setSizeMayChange__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 409) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 568));
  [WeakRetained setNeedsUpdateForGroupStackViewSectionHeaderView:*(void *)(a1 + 32)];
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  if (self->_showActivityIndicator != a3)
  {
    self->_showActivityIndicator = a3;
    BOOL v5 = !a3;
    if (self->_activityIndicator) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = !a3;
    }
    if (!v6)
    {
      id v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      activityIndicator = self->_activityIndicator;
      self->_activityIndicator = v7;

      double v9 = self->_activityIndicator;
      double v10 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      [(UIActivityIndicatorView *)v9 setColor:v10];

      [(UIActivityIndicatorView *)self->_activityIndicator setAlpha:0.0];
      [(UIView *)self->_headerContainer addSubview:self->_activityIndicator];
      [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
      [(PKGSVWalletHeaderView *)self setNeedsLayout];
      [(PKGSVWalletHeaderView *)self layoutIfNeeded];
    }
    [(PKContinuousButton *)self->_actionButton setEnabled:v5];
    double v11 = self->_activityIndicator;
    uint64_t v12 = (void *)MEMORY[0x1E4FB1EB0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke;
    v18[3] = &unk_1E59CDA78;
    id v19 = v11;
    BOOL v20 = a3;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke_2;
    v15[3] = &unk_1E59CE050;
    BOOL v17 = a3;
    uint64_t v13 = v19;
    id v16 = v13;
    objc_msgSend(v12, "pkui_animateUsingOptions:animations:completion:", 6, v18, v15);
    id v14 = self->_activityIndicator;
    if (v14)
    {
      if (!a3)
      {
        self->_activityIndicator = 0;
      }
    }
  }
}

uint64_t __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __50__PKGSVWalletHeaderView_setShowActivityIndicator___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) stopAnimating];
    v2 = *(void **)(v1 + 32);
    return [v2 removeFromSuperview];
  }
  return result;
}

void __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKGSVWalletHeaderView _setSizeMayChange]((uint64_t)WeakRetained);
}

uint64_t __68__PKGSVWalletHeaderView_setShowBackgroundProvisioningHint_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)addTapped
{
  BOOL v3 = PKUIStoreDemoGatewayWithView(self);
  if (self && v3 && self->_passType <= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained presentPaymentSetupForHeaderView:self];
      id WeakRetained = v5;
    }
  }
}

- (void)ordersTapped
{
  BOOL v3 = PKUIStoreDemoGatewayWithView(self);
  if (self && v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained presentOrderManagementForHeaderView:self];
      id WeakRetained = v5;
    }
  }
}

- (void)inboxTapped
{
  BOOL v3 = PKUIStoreDemoGatewayWithView(self);
  if (self && v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained presentInvitationsForHeaderView:self];
      id WeakRetained = v5;
    }
  }
}

- (id)leadingViewsForInterstitialController:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_titleView)
  {
    v5[0] = self->_titleView;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)trailingViewsForInterstitialController:(id)a3
{
  if (self->_showActivityIndicator)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v6 = v5;
    if (self->_actionButton) {
      objc_msgSend(v5, "addObject:");
    }
    if (self->_orderManagementButton) {
      objc_msgSend(v6, "addObject:");
    }
    if (self->_inboxButton)
    {
      if (self->_badgedInboxButton) {
        badgedInboxButton = self->_badgedInboxButton;
      }
      else {
        badgedInboxButton = self->_inboxButton;
      }
      [v6 addObject:badgedInboxButton];
    }
    if ([v6 count]) {
      BOOL v3 = (void *)[v6 copy];
    }
    else {
      BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v3;
}

- (id)interstitialProvider
{
  if (self->_titleView
    || !self->_showActivityIndicator && (self->_actionButton || self->_orderManagementButton || self->_inboxButton))
  {
    return self;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)passType
{
  return self->_passType;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundProvisioningHintView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_orderManagementButton, 0);
  objc_storeStrong((id *)&self->_badgedInboxButton, 0);
  objc_storeStrong((id *)&self->_inboxButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_environmentLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_headerContainer, 0);
  objc_storeStrong((id *)&self->_orderImage, 0);
  objc_storeStrong((id *)&self->_inboxImage, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);

  objc_storeStrong((id *)&self->_templateActionImage, 0);
}

@end