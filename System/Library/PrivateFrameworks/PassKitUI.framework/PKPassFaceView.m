@interface PKPassFaceView
+ (Class)_faceClassForStyle:(int64_t)a3;
+ (id)newFrontFaceViewForStyle:(int64_t)a3;
- (BOOL)bodyContentCreated;
- (BOOL)clipsContent;
- (BOOL)isInvalidated;
- (BOOL)isPaused;
- (BOOL)liveMotionEnabled;
- (BOOL)modallyPresented;
- (BOOL)showsLiveRendering;
- (BOOL)viewExpanded;
- (CGSize)cobrandLogoSize;
- (CGSize)contentSize;
- (NSArray)buckets;
- (NSData)dynamicBarcodeData;
- (NSMutableArray)headerBucketViews;
- (PKPass)pass;
- (PKPassBucketTemplate)headerBucketTemplate;
- (PKPassColorProfile)colorProfile;
- (PKPassFaceTemplate)faceTemplate;
- (PKPassFaceView)init;
- (PKPassFaceView)initWithCoder:(id)a3;
- (PKPassFaceView)initWithFrame:(CGRect)a3;
- (PKPassFaceView)initWithStyle:(int64_t)a3;
- (PKPassFaceViewDelegate)delegate;
- (PKPassFaceViewRendererState)rendererState;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)shadowBackgroundInsets;
- (UIEdgeInsets)shadowInsets;
- (UIImageView)backgroundView;
- (UIView)contentView;
- (double)clippedContentHeight;
- (id)_relevantBuckets;
- (id)_viewSetForContentViewType:(int64_t)a3;
- (id)headerTemplate;
- (id)passFaceTemplate;
- (int64_t)backgroundMode;
- (int64_t)style;
- (unint64_t)visibleRegions;
- (void)_createBucketsIfNecessary;
- (void)_createContentViewsForRegions:(unint64_t)a3;
- (void)_createDimmingFilterIfNecessary;
- (void)_createInvariantViewsForRegions:(unint64_t)a3;
- (void)_flushContentViewsForRegions:(unint64_t)a3;
- (void)_handleTimeOrLocaleChange:(id)a3;
- (void)_loadFaceImageIfNecessary;
- (void)_presentDiffRecursivelyDiff:(id)a3 forBucketAtIndex:(unint64_t)a4 withBuckets:(id)a5 completion:(id)a6;
- (void)_recreateFieldDerivedContent;
- (void)_setBalances:(id)a3;
- (void)_setContentViewsAlpha:(double)a3;
- (void)_setShowsBackgroundView:(BOOL)a3;
- (void)_setShowsBodyViews:(BOOL)a3;
- (void)_setShowsHeaderViews:(BOOL)a3;
- (void)_updateEffectiveShowsBackgroundView;
- (void)_updateForeignBalances;
- (void)_updateShowsPanSuffix;
- (void)createBodyContentViews;
- (void)createContentViewsWithFade:(BOOL)a3;
- (void)createHeaderContentViews;
- (void)dealloc;
- (void)didAuthenticate;
- (void)didDismiss;
- (void)didInvalidate;
- (void)didPresent;
- (void)didTransact;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)insertContentView:(id)a3 ofType:(int64_t)a4;
- (void)invalidate;
- (void)layoutSubviews;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)presentDiff:(id)a3 completion:(id)a4;
- (void)removeContentView:(id)a3 ofType:(int64_t)a4;
- (void)setBackgroundMode:(int64_t)a3;
- (void)setClippedContentHeight:(double)a3;
- (void)setClipsContent:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmer:(double)a3 animated:(BOOL)a4;
- (void)setDynamicBarcodeData:(id)a3;
- (void)setHeaderBucketViews:(id)a3;
- (void)setLiveMotionEnabled:(BOOL)a3;
- (void)setModallyPresented:(BOOL)a3;
- (void)setPass:(id)a3 colorProfile:(id)a4;
- (void)setPaused:(BOOL)a3;
- (void)setShowsLiveRendering:(BOOL)a3;
- (void)setShowsLiveRendering:(BOOL)a3 rendererState:(id)a4;
- (void)setViewExpanded:(BOOL)a3;
- (void)setVisibleRegions:(unint64_t)a3;
- (void)updateShadow:(double)a3 animated:(BOOL)a4 withDelay:(double)a5;
@end

@implementation PKPassFaceView

+ (id)newFrontFaceViewForStyle:(int64_t)a3
{
  id v4 = objc_alloc((Class)objc_msgSend(a1, "_faceClassForStyle:"));

  return (id)[v4 initWithStyle:a3];
}

+ (Class)_faceClassForStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 9 || ((0x3D7u >> a3) & 1) == 0 || (v3 = objc_opt_class()) == 0) {
    v3 = objc_opt_class();
  }

  return (Class)v3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)style
{
  return self->_style;
}

- (PKPassFaceTemplate)faceTemplate
{
  return self->_faceTemplate;
}

- (PKPass)pass
{
  return self->_pass;
}

- (BOOL)viewExpanded
{
  return self->_viewExpanded;
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = a2;
  v30 = v3;
  if (((_WORD)v3[61] & 0x400) == 0)
  {
    *((_WORD *)v3 + 244) |= 0x600u;
    id v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = [v3[55] frontFaceImage];
    uint64_t v6 = [v4 imageWithPKImage:v5];
    id v7 = v30[67];
    v30[67] = (id)v6;

    v8 = (void *)MEMORY[0x1E4FB1618];
    v9 = [v30[55] frontFaceImageAverageColor];
    uint64_t v10 = objc_msgSend(v8, "pkui_colorWithPKColor:", v9);
    id v11 = v30[76];
    v30[76] = (id)v10;

    PKPassFaceShadowInsets();
    v30[68] = v12;
    v30[69] = v13;
    v30[70] = v14;
    v30[71] = v15;
    [v30[67] size];
    double v18 = v17 - (*((double *)v30 + 68) + *((double *)v30 + 70));
    double v19 = *(double *)(a1 + 48);
    double v20 = *(double *)(a1 + 40) - (v16 - (*((double *)v30 + 69) + *((double *)v30 + 71)));
    v30[72] = 0;
    *((double *)v30 + 74) = v19 - v18;
    PKFloatRoundToPixel();
    *((double *)v30 + 73) = v21;
    *((double *)v30 + 75) = v20 - v21;
    v22 = (void *)MEMORY[0x1E4FB1818];
    v23 = [v30[55] frontFaceShadowImage];
    uint64_t v24 = [v22 imageWithPKImage:v23];
    id v25 = v30[77];
    v30[77] = (id)v24;

    id v26 = v30[78];
    v30[78] = 0;

    id v27 = v30[66];
    v30[66] = 0;

    id v28 = v30[63];
    if (v28)
    {
      [v28 removeFromSuperview];
      id v29 = v30[63];
      v30[63] = 0;
    }
    if (([v30[94] isLoaded] & 1) == 0) {
      [v30[94] loadContent];
    }
    [v30 setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  [(PKPassFaceView *)self shadowInsets];
  [(PKPassFaceView *)self bounds];
  -[PKPassFaceView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PKLiveRenderedCardFaceView setFrame:](self->_liveBackgroundView, "setFrame:");
  -[PKTransactionDataOverlayCardFaceView setFrame:](self->_transactionDataOverlayView, "setFrame:", v4, v6, v8, v10);
  backgroundPlaceholderView = self->_backgroundPlaceholderView;
  if (backgroundPlaceholderView)
  {
    v12 = [(UIImageView *)backgroundPlaceholderView image];
    placeholderFaceImage = self->_placeholderFaceImage;

    if (v12 != placeholderFaceImage) {
      [(UIImageView *)self->_backgroundPlaceholderView setImage:self->_placeholderFaceImage];
    }
    v14 = self->_backgroundPlaceholderView;
    UIRectInset();
    -[UIImageView setFrame:](v14, "setFrame:");
  }
  $2C2C0F74643FC2F4D213D6D0647A904C flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    shadowBackgroundView = self->_shadowBackgroundView;
    [(PKPassFaceView *)self shadowBackgroundInsets];
    UIRectInset();
    -[UIImageView setFrame:](shadowBackgroundView, "setFrame:");
    if (self->_faceImage || self->_backgroundMode == 1 && self->_modallyPresented)
    {
      double v17 = [(UIImageView *)self->_backgroundView image];
      faceImage = self->_faceImage;

      if (v17 != faceImage) {
        [(UIImageView *)self->_backgroundView setImage:self->_faceImage];
      }
      double v19 = [(UIImageView *)self->_shadowBackgroundView image];
      faceShadowImage = self->_faceShadowImage;

      if (v19 != faceShadowImage) {
        [(UIImageView *)self->_shadowBackgroundView setImage:self->_faceShadowImage];
      }
      backgroundView = self->_backgroundView;
      UIRectInset();
    }
    else
    {
      v22 = [(UIImageView *)self->_backgroundView image];
      partialFaceImage = self->_partialFaceImage;

      if (v22 != partialFaceImage) {
        [(UIImageView *)self->_backgroundView setImage:self->_partialFaceImage];
      }
      [(UIImage *)self->_partialFaceImage size];
      PKSizeAlignedInRect();
      backgroundView = self->_backgroundView;
    }
    -[UIImageView setFrame:](backgroundView, "setFrame:");
    uint64_t v24 = [(PKDynamicLayerView *)self->_dynamicCardView layer];
    PKPaymentStyleApplyCorners();

    -[PKDynamicLayerView setFrame:](self->_dynamicCardView, "setFrame:", v4, v6, v8, v10);
    $2C2C0F74643FC2F4D213D6D0647A904C flags = self->_flags;
  }
  [(UIView *)self->_contentView setHidden:(*(unsigned int *)&flags >> 5) & 1];
  __int16 v25 = (__int16)self->_flags;
  if ((v25 & 0x10) == 0)
  {
    [(PKLiveRenderedCardFaceView *)self->_liveBackgroundView clearFaceImage];
    liveBackgroundView = self->_liveBackgroundView;
    BOOL v27 = (v25 & 8) == 0;
    goto LABEL_34;
  }
  uint64_t v28 = 536;
  if (self->_faceImage)
  {
    id v29 = self->_liveBackgroundView;
    p_faceImageAlignmentInsets = &self->_faceImageAlignmentInsets;
    unint64_t v31 = 576;
LABEL_27:
    -[PKLiveRenderedCardFaceView setFaceImage:withAverageColor:alignmentInsets:contentInsets:](v29, "setFaceImage:withAverageColor:alignmentInsets:contentInsets:", p_faceImageAlignmentInsets->top, p_faceImageAlignmentInsets->left, p_faceImageAlignmentInsets->bottom, p_faceImageAlignmentInsets->right, *(double *)((char *)&self->super.super.super.super.isa + v31), *(double *)((char *)&self->super.super.super._responderFlags + v31), *(double *)((char *)&self->super.super.super.__layeringSceneIdentity + v31), *(double *)&(&self->super.super._constraintsExceptingSubviewAutoresizingConstraints)[v31 / 8]);
    goto LABEL_29;
  }
  if (self->_backgroundMode == 1 && self->_modallyPresented)
  {
    id v29 = self->_liveBackgroundView;
  }
  else
  {
    uint64_t v28 = 624;
    id v29 = self->_liveBackgroundView;
    if (self->_partialFaceImage)
    {
      unint64_t v31 = 664;
      p_faceImageAlignmentInsets = &self->_partialFaceImageAlignmentInsets;
      goto LABEL_27;
    }
  }
  [(PKLiveRenderedCardFaceView *)v29 clearFaceImage];
LABEL_29:
  liveBackgroundView = self->_liveBackgroundView;
  if ((v25 & 8) != 0)
  {
    if (*(Class *)((char *)&self->super.super.super.super.isa + v28)) {
      BOOL v27 = 0;
    }
    else {
      BOOL v27 = self->_backgroundPlaceholderView != 0;
    }
  }
  else
  {
    BOOL v27 = 1;
  }
LABEL_34:
  [(PKLiveRenderedCardFaceView *)liveBackgroundView setHidden:v27];
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
  if (primaryAccountNumberSuffixView)
  {
    [(UIView *)primaryAccountNumberSuffixView frame];
    PKPaymentPassContentInsets();
    [(UIView *)self->_contentView bounds];
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIView setFrame:](self->_primaryAccountNumberSuffixView, "setFrame:");
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v33 = self->_headerBucketViews;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v53 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v39 = [v38 bucketTemplate];
        [v39 bucketRect];
        objc_msgSend(v38, "setFrame:");
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v35);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v40 = self->_bodyBucketViews;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v49 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v46 = [v45 bucketTemplate];
        [v46 bucketRect];
        objc_msgSend(v45, "setFrame:");
      }
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v42);
  }

  v47.receiver = self;
  v47.super_class = (Class)PKPassFaceView;
  [(PKPassFaceView *)&v47 layoutSubviews];
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(PKPassFaceView *)self shadowInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_clipsContent)
  {
    double v11 = fmax(self->_clippedContentHeight, 0.0);
    [(PKPassFaceView *)self contentSize];
    double v8 = v8 + fmax(v11 - fmax(v12, 0.0), 0.0);
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)shadowInsets
{
  PKPassFaceShadowInsets();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)shadowBackgroundInsets
{
  PKPassFaceShadowInsets();
  double v3 = v2 + 15.0;
  double v5 = v4 + 15.0;
  double v7 = v6 + 15.0;
  double v9 = v8 + 15.0;
  result.right = v9;
  result.bottom = v5;
  result.left = v7;
  result.top = v3;
  return result;
}

- (void)setPass:(id)a3 colorProfile:(id)a4
{
  double v13 = (PKPass *)a3;
  double v7 = (PKPassColorProfile *)a4;
  p_pass = &self->_pass;
  if (self->_pass != v13)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    if (*p_pass)
    {
      BOOL v9 = +[PKLiveRenderedCardFaceView replacesContentForType:[(PKPass *)*p_pass liveRenderType]];
      p___int16 flags = &self->_flags;
      __int16 flags = (__int16)self->_flags;
      if ((v9 ^ ((flags & 0x20) == 0))) {
        goto LABEL_10;
      }
      if (v9) {
        __int16 v12 = 32;
      }
      else {
        __int16 v12 = 0;
      }
    }
    else
    {
      p___int16 flags = &self->_flags;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0) {
        goto LABEL_10;
      }
      __int16 v12 = 0;
    }
    *(_WORD *)p___int16 flags = flags & 0xFFDF | v12;
    [(PKPassFaceView *)self setNeedsLayout];
  }
LABEL_10:
  if (self->_colorProfile != v7) {
    objc_storeStrong((id *)&self->_colorProfile, a4);
  }
}

- (void)createContentViewsWithFade:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPassFaceView *)self _createContentViewsForRegions:self->_visibleRegions];
  if (v3)
  {
    [(PKPassFaceView *)self _setContentViewsAlpha:0.0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__PKPassFaceView_createContentViewsWithFade___block_invoke;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.2];
  }
}

- (void)setVisibleRegions:(unint64_t)a3
{
  self->_visibleRegions = a3;
}

- (void)_createContentViewsForRegions:(unint64_t)a3
{
  if ([(PKPass *)self->_pass isContentLoaded])
  {
    unint64_t v5 = a3 & ~self->_contentViewCreatedRegions;
    if ((v5 & 2) != 0)
    {
      double v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      headerContentViews = self->_headerContentViews;
      self->_headerContentViews = v6;

      [(PKPassFaceView *)self createHeaderContentViews];
    }
    if ((v5 & 4) != 0)
    {
      if (!self->_faceTemplate)
      {
        double v8 = [(PKPassFaceView *)self passFaceTemplate];
        faceTemplate = self->_faceTemplate;
        self->_faceTemplate = v8;
      }
      double v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      bodyContentViews = self->_bodyContentViews;
      self->_bodyContentViews = v10;

      [(PKPassFaceView *)self createBodyContentViews];
    }
    self->_contentViewCreatedRegions |= v5;
    [(PKPassFaceView *)self setNeedsLayout];
  }
}

- (void)setShowsLiveRendering:(BOOL)a3 rendererState:(id)a4
{
  BOOL v4 = a3;
  id v36 = a4;
  __int16 flags = (__int16)self->_flags;
  if (v4) {
    __int16 v7 = 4;
  }
  else {
    __int16 v7 = 0;
  }
  __int16 v8 = flags & 0xFFFB | v7;
  *(_WORD *)&self->___int16 flags = v8;
  if (v4)
  {
    if ([(PKPass *)self->_pass passType] == PKPassTypeSecureElement) {
      pass = self->_pass;
    }
    else {
      pass = 0;
    }
    double v14 = pass;
    double v15 = self->_pass;
    if (v15)
    {
      if ([(PKPass *)v15 liveRenderType])
      {
        liveBackgroundView = self->_liveBackgroundView;
        if (!liveBackgroundView)
        {
          BOOL v27 = [PKLiveRenderedCardFaceView alloc];
          double v28 = *MEMORY[0x1E4F1DAD8];
          double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          [(PKPass *)self->_pass style];
          PKPassFrontFaceContentSize();
          v32 = -[PKLiveRenderedCardFaceView initWithFrame:pass:](v27, "initWithFrame:pass:", self->_pass, v28, v29, v30, v31);
          v33 = self->_liveBackgroundView;
          self->_liveBackgroundView = v32;

          uint64_t v34 = self->_liveBackgroundView;
          if (!v34) {
            goto LABEL_24;
          }
          [(PKLiveRenderedCardFaceView *)v34 setMotionEnabled:self->_liveMotionEnabled];
          [(PKPassFaceView *)self insertSubview:self->_liveBackgroundView belowSubview:self->_contentView];
          liveBackgroundView = self->_liveBackgroundView;
          if (!liveBackgroundView) {
            goto LABEL_24;
          }
        }
        LODWORD(transactionDataOverlayView) = [(PKLiveRenderedCardFaceView *)liveBackgroundView requiresFaceImage];

        __int16 v8 = (__int16)self->_flags;
        if ((v8 & 8) != 0)
        {
          int v17 = 0;
          BOOL v13 = 1;
          goto LABEL_35;
        }
LABEL_33:
        __int16 v12 = 8;
        int v11 = 1;
        goto LABEL_34;
      }
      double v15 = self->_pass;
    }
    if (![(PKPass *)v15 supportsCategoryVisualization]
      || !v14
      || ([(PKPass *)v14 associatedAccountServiceAccountIdentifier],
          double v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          !v18))
    {
LABEL_24:

      LODWORD(transactionDataOverlayView) = 0;
      int v11 = 0;
      __int16 v12 = 0;
      BOOL v13 = 0;
      __int16 v8 = (__int16)self->_flags;
      if ((v8 & 8) != 0) {
        goto LABEL_34;
      }
LABEL_28:
      if ((v8 & 0x10) == 0)
      {
        [(PKTransactionDataOverlayCardFaceView *)self->_transactionDataOverlayView setHidden:!v13];
        goto LABEL_43;
      }
      __int16 v35 = 0;
      goto LABEL_41;
    }
    transactionDataOverlayView = self->_transactionDataOverlayView;
    if (!transactionDataOverlayView)
    {
      double v19 = [PKTransactionDataOverlayCardFaceView alloc];
      double v20 = *MEMORY[0x1E4F1DAD8];
      double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [(PKPass *)self->_pass style];
      PKPassFrontFaceContentSize();
      uint64_t v24 = -[PKTransactionDataOverlayCardFaceView initWithFrame:pass:rendererState:](v19, "initWithFrame:pass:rendererState:", self->_pass, v36, v20, v21, v22, v23);
      __int16 v25 = self->_transactionDataOverlayView;
      self->_transactionDataOverlayView = v24;

      id v26 = self->_transactionDataOverlayView;
      if (v26)
      {
        [(PKPassFaceView *)self insertSubview:v26 belowSubview:self->_contentView];
        transactionDataOverlayView = self->_transactionDataOverlayView;
      }
      else
      {
        transactionDataOverlayView = 0;
      }
    }
    BOOL v13 = transactionDataOverlayView != 0;

    __int16 v8 = (__int16)self->_flags;
    if (v13 != ((v8 & 8) == 0)) {
      goto LABEL_28;
    }
    if (!transactionDataOverlayView)
    {
      int v11 = 0;
      __int16 v12 = 0;
      goto LABEL_34;
    }
    LODWORD(transactionDataOverlayView) = 0;
    goto LABEL_33;
  }
  LODWORD(transactionDataOverlayView) = 0;
  int v11 = 0;
  __int16 v12 = 0;
  BOOL v13 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_28;
  }
LABEL_34:
  __int16 v8 = v8 & 0xFFF7 | v12;
  *(_WORD *)&self->___int16 flags = v8;
  int v17 = 1;
  BOOL v13 = v11;
LABEL_35:
  if (((((v8 & 0x10) == 0) ^ transactionDataOverlayView) & 1) == 0)
  {
    if (transactionDataOverlayView) {
      __int16 v35 = 16;
    }
    else {
      __int16 v35 = 0;
    }
LABEL_41:
    *(_WORD *)&self->___int16 flags = v8 & 0xFFEF | v35;
    [(PKTransactionDataOverlayCardFaceView *)self->_transactionDataOverlayView setHidden:!v13];
    goto LABEL_42;
  }
  [(PKTransactionDataOverlayCardFaceView *)self->_transactionDataOverlayView setHidden:!v13];
  if (v17) {
LABEL_42:
  }
    [(PKPassFaceView *)self setNeedsLayout];
LABEL_43:
  [(PKPassFaceView *)self _updateEffectiveShowsBackgroundView];
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
    [(PKPassFaceView *)self _loadFaceImageIfNecessary];
  }
}

- (void)_updateEffectiveShowsBackgroundView
{
  __int16 flags = (__int16)self->_flags;
  int v3 = flags & 0x48;
  if (((flags & 0x80) == 0) != (v3 == 64)) {
    return;
  }
  *(_WORD *)&self->___int16 flags = flags & 0xFF7F | ((v3 == 64) << 7);
  if (v3 == 64)
  {
    if ([(PKPass *)self->_pass passType] == PKPassTypeSecureElement
      && ([(PKPass *)self->_pass dynamicLayerConfiguration],
          unint64_t v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      dynamicCardView = self->_dynamicCardView;
      if (!dynamicCardView)
      {
        __int16 v8 = [PKDynamicLayerView alloc];
        BOOL v9 = -[PKDynamicLayerView initWithFrame:pass:automaticallyLoadContent:](v8, "initWithFrame:pass:automaticallyLoadContent:", self->_pass, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v10 = self->_dynamicCardView;
        self->_dynamicCardView = v9;

        [(PKDynamicLayerView *)self->_dynamicCardView setClipsToBounds:1];
        [(PKPassFaceView *)self insertSubview:self->_dynamicCardView belowSubview:self->_contentView];
        goto LABEL_10;
      }
      uint64_t v7 = 0;
    }
    else
    {
      dynamicCardView = self->_dynamicCardView;
      uint64_t v7 = 1;
    }
    [(PKDynamicLayerView *)dynamicCardView setHidden:v7];
LABEL_10:
    [(PKPassFaceView *)self _loadFaceImageIfNecessary];
    goto LABEL_11;
  }
  [(UIImageView *)self->_backgroundPlaceholderView setImage:0];
  [(UIImageView *)self->_backgroundView setImage:0];
  [(UIImageView *)self->_shadowBackgroundView setImage:0];
  [(PKDynamicLayerView *)self->_dynamicCardView setHidden:1];
  [(PKPassFaceView *)self setNeedsLayout];
LABEL_11:

  [(PKPassFaceView *)self _updateShowsPanSuffix];
}

- (void)setLiveMotionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_liveMotionEnabled = a3;
  -[PKLiveRenderedCardFaceView setMotionEnabled:](self->_liveBackgroundView, "setMotionEnabled:");
  [(PKTransactionDataOverlayCardFaceView *)self->_transactionDataOverlayView setMotionEnabled:v3];
  dynamicCardView = self->_dynamicCardView;

  [(PKDynamicLayerView *)dynamicCardView setMotionEnabled:v3];
}

- (void)setClipsContent:(BOOL)a3
{
  if (self->_clipsContent != a3)
  {
    -[PKPassFaceView setClipsToBounds:](self, "setClipsToBounds:");
    self->_clipsContent = a3;
  }
}

- (void)setBackgroundMode:(int64_t)a3
{
  __int16 flags = (__int16)self->_flags;
  if (self->_backgroundMode != a3 || (flags & 0x2000) == 0)
  {
    *(_WORD *)&self->___int16 flags = flags | 0x2000;
    self->_backgroundMode = a3;
    [(PKPassFaceView *)self _loadFaceImageIfNecessary];
    [(PKPassFaceView *)self setNeedsLayout];
  }
}

- (void)_loadFaceImageIfNecessary
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0 || (flags & 0x18) == 0x18)
  {
    if (self->_backgroundMode) {
      BOOL modallyPresented = 1;
    }
    else {
      BOOL modallyPresented = self->_modallyPresented;
    }
    if (!self->_faceImage && (!self->_partialFaceImage || modallyPresented))
    {
      uint64_t v6 = [(PKPass *)self->_pass style];
      [(PKPassFaceView *)self contentSize];
      uint64_t v8 = v7;
      uint64_t v10 = v9;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke;
      aBlock[3] = &__block_descriptor_40_e24_v16__0__PKPassFaceView_8l;
      aBlock[4] = v6;
      int v11 = _Block_copy(aBlock);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_2;
      v29[3] = &__block_descriptor_56_e24_v16__0__PKPassFaceView_8l;
      v29[4] = v6;
      v29[5] = v8;
      v29[6] = v10;
      __int16 v12 = _Block_copy(v29);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_3;
      v28[3] = &__block_descriptor_56_e24_v16__0__PKPassFaceView_8l;
      v28[4] = v6;
      v28[5] = v8;
      v28[6] = v10;
      BOOL v13 = (void (**)(void *, PKPassFaceView *))_Block_copy(v28);
      int v14 = [(PKPass *)self->_pass isImageSetLoaded:0];
      if ((modallyPresented | v14))
      {
        if ((v14 & 1) != 0 || self->_modallyPresented) {
          goto LABEL_14;
        }
        __int16 v19 = (__int16)self->_flags;
        if ((v19 & 0x200) == 0)
        {
          *(_WORD *)&self->___int16 flags = v19 | 0x200;
          [(PKPass *)self->_pass loadCachedImageSet:0];
          if ([(PKPass *)self->_pass isImageSetLoaded:0])
          {
LABEL_14:
            v13[2](v13, self);
LABEL_23:

            return;
          }
          __int16 v19 = (__int16)self->_flags;
        }
        if ((v19 & 0x4000) != 0) {
          goto LABEL_23;
        }
        *(_WORD *)&self->___int16 flags = v19 | 0x4000;
        (*((void (**)(void *, PKPassFaceView *))v11 + 2))(v11, self);
        objc_initWeak(&location, self);
        pass = self->_pass;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_6;
        v21[3] = &unk_1E59CB128;
        int v17 = &v23;
        objc_copyWeak(&v23, &location);
        double v22 = v13;
        [(PKPass *)pass loadImageSetAsync:0 preheat:0 withCompletion:v21];
        double v18 = v22;
      }
      else
      {
        if ([(PKPass *)self->_pass isImageSetLoaded:2])
        {
          (*((void (**)(void *, PKPassFaceView *))v12 + 2))(v12, self);
          goto LABEL_23;
        }
        $2C2C0F74643FC2F4D213D6D0647A904C v15 = self->_flags;
        if ((*(_DWORD *)&v15 & 0x80000000) != 0) {
          goto LABEL_23;
        }
        *(_WORD *)&self->___int16 flags = *(_WORD *)&v15 | 0x8000;
        (*((void (**)(void *, PKPassFaceView *))v11 + 2))(v11, self);
        objc_initWeak(&location, self);
        double v16 = self->_pass;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_4;
        v24[3] = &unk_1E59CB128;
        int v17 = &v26;
        objc_copyWeak(&v26, &location);
        __int16 v25 = v12;
        [(PKPass *)v16 loadImageSetAsync:2 preheat:0 withCompletion:v24];
        double v18 = v25;
      }

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
      goto LABEL_23;
    }
    [(PKPassFaceView *)self setNeedsLayout];
  }
}

- (void)_setShowsHeaderViews:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v5 = self->_headerContentViews;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v9++) setHidden:!v3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_headerInvariantViews;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    BOOL v14 = !v3;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "setHidden:", v14, (void)v16);
      }
      while (v12 != v15);
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)_setShowsBodyViews:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3) {
    __int16 v5 = 2;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = self->_bodyContentViews;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) setHidden:!v3];
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_bodyInvariantViews;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    BOOL v15 = !v3;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "setHidden:", v15, (void)v17);
      }
      uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)_setShowsBackgroundView:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
  [(PKPassFaceView *)self _updateEffectiveShowsBackgroundView];
}

- (void)_createInvariantViewsForRegions:(unint64_t)a3
{
  unint64_t v4 = a3 & ~self->_invariantViewCreatedRegions;
  if ((v4 & 2) != 0)
  {
    __int16 v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    headerInvariantViews = self->_headerInvariantViews;
    self->_headerInvariantViews = v5;

    [(PKPassFaceView *)self createHeaderInvariantViews];
  }
  if ((v4 & 4) != 0)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    bodyInvariantViews = self->_bodyInvariantViews;
    self->_bodyInvariantViews = v7;

    [(PKPassFaceView *)self createBodyInvariantViews];
  }
  self->_invariantViewCreatedRegions |= v4;

  [(PKPassFaceView *)self setNeedsLayout];
}

- (void)_createBucketsIfNecessary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  buckets = self->_buckets;
  if (!buckets)
  {
    unint64_t v4 = [(PKPassFaceView *)self _relevantBuckets];
    __int16 v5 = self->_buckets;
    self->_buckets = v4;

    buckets = self->_buckets;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = buckets;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
LABEL_10:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            if ([*(id *)(*((void *)&v22 + 1) + 8 * v16) foreignReferenceType] == 1) {
              break;
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v14) {
                goto LABEL_10;
              }
              goto LABEL_16;
            }
          }

          if (self->_paymentService) {
            return;
          }
          long long v20 = (PKPaymentService *)[objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:self];
          paymentService = self->_paymentService;
          self->_paymentService = v20;

          [(PKPassFaceView *)self _updateForeignBalances];
          long long v19 = +[PKUIForegroundActiveArbiter sharedInstance];
          self->_foregroundActive = ((unsigned __int16)[v19 registerObserver:self] >> 8) & 1;
          goto LABEL_22;
        }
LABEL_16:

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v17 = self->_paymentService;
  if (v17)
  {
    [(PKPaymentService *)v17 setDelegate:0];
    long long v18 = self->_paymentService;
    self->_paymentService = 0;

    long long v19 = +[PKUIForegroundActiveArbiter sharedInstance];
    [v19 unregisterObserver:self];
LABEL_22:
  }
}

- (void)setClippedContentHeight:(double)a3
{
  self->_clippedContentHeight = a3;
}

- (void)_updateShowsPanSuffix
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0 || (dynamicCardView = self->_dynamicCardView) == 0)
  {
    int v5 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_4;
    }
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  int v5 = [(PKDynamicLayerView *)dynamicCardView isHidden] ^ 1;
  if ((*(_WORD *)&self->_flags & 8) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v6 = [(PKLiveRenderedCardFaceView *)self->_liveBackgroundView requiresFaceImage];
LABEL_7:
  if ((v5 | v6) != 1 || [(PKPass *)self->_pass passType] != PKPassTypeSecureElement)
  {
    uint64_t v7 = 0;
LABEL_16:
    id v19 = 0;
    __int16 v10 = (__int16)self->_flags;
    if ((v10 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  uint64_t v7 = self->_pass;
  uint64_t v8 = [(PKPass *)v7 primaryAccountNumberSuffix];
  if (!v8) {
    goto LABEL_16;
  }
  id v19 = v8;
  uint64_t v9 = [v8 length];
  __int16 v10 = (__int16)self->_flags;
  if ((v9 != 0) != ((v10 & 0x100) == 0)) {
    goto LABEL_19;
  }
  if (v9)
  {
    *(_WORD *)&self->___int16 flags = v10 | 0x100;
    primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
    if (!primaryAccountNumberSuffixView)
    {
      id v12 = (void *)MEMORY[0x1E4FB1618];
      uint64_t v13 = [(PKPass *)v7 displayProfile];
      id v14 = [v13 foregroundColor];
      uint64_t v15 = objc_msgSend(v12, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));

      uint64_t v16 = [[PKMaskedPANSuffixView alloc] initWithSuffix:v19 foregroundColor:v15];
      long long v17 = self->_primaryAccountNumberSuffixView;
      self->_primaryAccountNumberSuffixView = &v16->super;

      primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
    }
    [(PKPassFaceView *)self insertContentView:primaryAccountNumberSuffixView ofType:2];
    goto LABEL_19;
  }
LABEL_17:
  *(_WORD *)&self->___int16 flags = v10 & 0xFEFF;
  long long v18 = self->_primaryAccountNumberSuffixView;
  if (v18) {
    [(PKPassFaceView *)self removeContentView:v18 ofType:2];
  }
LABEL_19:
}

- (void)createHeaderContentViews
{
  [(PKPassFaceView *)self _createBucketsIfNecessary];
  __int16 v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  headerBucketViews = self->_headerBucketViews;
  self->_headerBucketViews = v3;

  int v5 = [(PKPassFaceView *)self pass];
  [v5 cobrandLogoRect];
  self->_cobrandLogoSize.width = v6;
  self->_cobrandLogoSize.height = v7;

  id v12 = [(NSArray *)self->_buckets objectAtIndex:0];
  if ([v12 count])
  {
    uint64_t v8 = objc_alloc_init(PKPassBucketView);
    uint64_t v9 = [(PKPassFaceView *)self pass];
    [(PKPassBucketView *)v8 setPass:v9];

    __int16 v10 = [(PKPassFaceView *)self headerTemplate];
    [(PKPassBucketView *)v8 setBucketTemplate:v10];

    uint64_t v11 = [(PKPassFaceView *)self colorProfile];
    [(PKPassBucketView *)v8 setColorProfile:v11];

    [(PKPassBucketView *)v8 setBucket:v12];
    [(PKPassFaceView *)self insertContentView:v8 ofType:0];
    [(NSMutableArray *)self->_headerBucketViews addObject:v8];
  }
}

- (void)setDimmer:(double)a3 animated:(BOOL)a4
{
  if (self->_dimmer != a3)
  {
    BOOL v4 = a4;
    self->_dimmer = a3;
    [(PKPassFaceView *)self _createDimmingFilterIfNecessary];
    id v14 = [(PKPassFaceView *)self layer];
    CGFloat v6 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 1.0 - self->_dimmer);
    if (v4)
    {
      CGFloat v7 = (void *)MEMORY[0x1E4FB1618];
      uint64_t v8 = [v14 valueForKeyPath:@"filters.dimmingFilter.inputColor"];
      uint64_t v9 = [v7 colorWithCGColor:v8];

      __int16 v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.dimmingFilter.inputColor"];
      [v10 setDuration:0.25];
      [v10 setFillMode:*MEMORY[0x1E4F39FA8]];
      uint64_t v11 = v9;
      if (!v9)
      {
        uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
      }
      objc_msgSend(v10, "setFromValue:", objc_msgSend(v11, "CGColor"));
      if (!v9) {

      }
      objc_msgSend(v10, "setToValue:", objc_msgSend(v6, "CGColor"));
      id v12 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v10);
    }
    id v13 = v6;
    objc_msgSend(v14, "setValue:forKeyPath:", objc_msgSend(v13, "CGColor"), @"filters.dimmingFilter.inputColor");
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    -[PKTransactionDataOverlayCardFaceView setPaused:](self->_transactionDataOverlayView, "setPaused:");
    dynamicCardView = self->_dynamicCardView;
    [(PKDynamicLayerView *)dynamicCardView setPaused:v3];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)createBodyContentViews
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(PKPassFaceView *)self _createBucketsIfNecessary];
  BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  bodyBucketViews = self->_bodyBucketViews;
  self->_bodyBucketViews = v3;

  -[NSArray subarrayWithRange:](self->_buckets, "subarrayWithRange:", 1, [(NSArray *)self->_buckets count] - 1);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        __int16 v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 count])
        {
          uint64_t v11 = [(PKPassFaceTemplate *)self->_faceTemplate templateForBucketAtIndex:v7 + i];
          if (!v11) {
            goto LABEL_11;
          }
          id v12 = (void *)v11;
          id v13 = objc_alloc_init(PKPassBucketView);
          id v14 = [(PKPassFaceView *)self pass];
          [(PKPassBucketView *)v13 setPass:v14];

          [(PKPassBucketView *)v13 setBucketTemplate:v12];
          uint64_t v15 = [(PKPassFaceView *)self colorProfile];
          [(PKPassBucketView *)v13 setColorProfile:v15];

          [(PKPassBucketView *)v13 setBucket:v10];
          [(PKPassFaceView *)self insertContentView:v13 ofType:2];
          [(NSMutableArray *)self->_bodyBucketViews addObject:v13];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      v7 += i;
    }
    while (v6);
  }
LABEL_11:

  primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
  if (primaryAccountNumberSuffixView) {
    [(PKPassFaceView *)self insertContentView:primaryAccountNumberSuffixView ofType:2];
  }
}

- (void)insertContentView:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [v6 superview];
    contentView = self->_contentView;

    if (v7 != contentView) {
      [(UIView *)self->_contentView addSubview:v10];
    }
    if ((unint64_t)a4 <= 3) {
      [v10 setHidden:((0x2000200010001uLL >> (16 * a4)) & *(_WORD *)&self->_flags) == 0];
    }
    id v9 = [(PKPassFaceView *)self _viewSetForContentViewType:a4];
    [v9 addObject:v10];

    [(PKPassFaceView *)self setNeedsLayout];
    id v6 = v10;
  }
}

- (id)_viewSetForContentViewType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return *(id *)((char *)&self->super.super.super.super.isa + *off_1E59CBEB8[a3]);
  }
}

- (PKPassColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (PKPassFaceView)initWithStyle:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PKPassFaceView;
  BOOL v4 = -[PKPassFaceView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    *(_WORD *)&v4->_flags |= 7u;
    if (PKIsLowEndDevice())
    {
      id v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      shadowBackgroundView = v5->_shadowBackgroundView;
      v5->_shadowBackgroundView = v6;

      uint64_t v8 = [(UIImageView *)v5->_shadowBackgroundView layer];
      id v9 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.09803922 alpha:1.0];
      uint64_t v10 = [v9 CGColor];

      [v8 setContentsMultiplyColor:v10];
      [v8 setOpacity:0.0];
      [(UIImageView *)v5->_shadowBackgroundView setClipsToBounds:0];
      [(PKPassFaceView *)v5 addSubview:v5->_shadowBackgroundView];
    }
    uint64_t v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    backgroundPlaceholderView = v5->_backgroundPlaceholderView;
    v5->_backgroundPlaceholderView = v11;

    [(PKPassFaceView *)v5 addSubview:v5->_backgroundPlaceholderView];
    id v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v13;

    [(PKPassFaceView *)v5 addSubview:v5->_backgroundView];
    -[WLEasyToHitCustomView setMargins:](v5, "setMargins:", 0.0, 0.0, 20.0, 20.0);
    uint64_t v15 = objc_alloc_init(WLEasyToHitCustomView);
    contentView = v5->_contentView;
    v5->_contentView = &v15->super;

    -[UIView setMargins:](v5->_contentView, "setMargins:", 0.0, 0.0, 20.0, 20.0);
    [(PKPassFaceView *)v5 addSubview:v5->_contentView];
    long long v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v5 selector:sel__handleTimeOrLocaleChange_ name:*MEMORY[0x1E4FB2708] object:0];

    long long v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v5 selector:sel__handleTimeOrLocaleChange_ name:*MEMORY[0x1E4F1C370] object:0];

    long long v19 = [(PKPassFaceView *)v5 layer];
    long long v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v20 scale];
    objc_msgSend(v19, "setRasterizationScale:");
  }
  return v5;
}

- (void)setModallyPresented:(BOOL)a3
{
  if (self->_modallyPresented != a3)
  {
    self->_BOOL modallyPresented = a3;
    [(PKPassFaceView *)self _loadFaceImageIfNecessary];
    if (self->_modallyPresented)
    {
      [(PKPassFaceView *)self didPresent];
    }
    else
    {
      [(PKPassFaceView *)self didDismiss];
    }
  }
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (PKPassFaceView)init
{
  return 0;
}

- (PKPassFaceView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKPassFaceView)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  paymentService = self->_paymentService;
  if (paymentService)
  {
    [(PKPaymentService *)paymentService setDelegate:0];
    id v6 = +[PKUIForegroundActiveArbiter sharedInstance];
    [v6 unregisterObserver:self];
  }
  [(PKPassFaceView *)self invalidate];
  v7.receiver = self;
  v7.super_class = (Class)PKPassFaceView;
  [(PKPassFaceView *)&v7 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKPassFaceView *)self didInvalidate];
  }
}

- (void)didInvalidate
{
  [(PKTransactionDataOverlayCardFaceView *)self->_transactionDataOverlayView invalidate];
  [(PKLiveRenderedCardFaceView *)self->_liveBackgroundView invalidate];
  dynamicCardView = self->_dynamicCardView;

  [(PKDynamicLayerView *)dynamicCardView invalidate];
}

- (void)removeContentView:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    objc_super v7 = [v6 superview];
    contentView = self->_contentView;

    if (v7 == contentView) {
      [v10 removeFromSuperview];
    }
    id v9 = [(PKPassFaceView *)self _viewSetForContentViewType:a4];
    [v9 removeObject:v10];

    [(PKPassFaceView *)self setNeedsLayout];
    id v6 = v10;
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)bodyContentCreated
{
  return (LOBYTE(self->_contentViewCreatedRegions) >> 2) & 1;
}

- (void)_createDimmingFilterIfNecessary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_dimmingFilter)
  {
    BOOL v3 = [(PKPassFaceView *)self layer];
    id v4 = objc_alloc(MEMORY[0x1E4F39BC0]);
    uint64_t v5 = (CAFilter *)[v4 initWithType:*MEMORY[0x1E4F3A2A8]];
    dimmingFilter = self->_dimmingFilter;
    self->_dimmingFilter = v5;

    [(CAFilter *)self->_dimmingFilter setName:@"dimmingFilter"];
    objc_super v7 = self->_dimmingFilter;
    objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 1.0 - self->_dimmer);
    id v8 = objc_claimAutoreleasedReturnValue();
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", [v8 CGColor], @"inputColor");

    v10[0] = self->_dimmingFilter;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setFilters:v9];
  }
}

uint64_t __45__PKPassFaceView_createContentViewsWithFade___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setContentViewsAlpha:1.0];
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
  if (a3) {
    BOOL clipsContent = 1;
  }
  else {
    BOOL clipsContent = self->_clipsContent;
  }
  id v7 = a4;
  id v8 = a3;
  [(PKPassFaceView *)self setClipsToBounds:clipsContent];
  id v9 = [(NSMutableArray *)self->_headerBucketViews arrayByAddingObjectsFromArray:self->_bodyBucketViews];
  [(PKPassFaceView *)self _presentDiffRecursivelyDiff:v8 forBucketAtIndex:0 withBuckets:v9 completion:v7];
}

- (void)_presentDiffRecursivelyDiff:(id)a3 forBucketAtIndex:(unint64_t)a4 withBuckets:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(void))a6;
  if ([v11 count] <= a4)
  {
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v13 = [v11 objectAtIndex:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__PKPassFaceView__presentDiffRecursivelyDiff_forBucketAtIndex_withBuckets_completion___block_invoke;
    v14[3] = &unk_1E59CBDC0;
    objc_copyWeak(v18, &location);
    id v15 = v10;
    v18[1] = (id)a4;
    id v16 = v11;
    long long v17 = v12;
    [v13 presentDiff:v15 inView:self completion:v14];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

void __86__PKPassFaceView__presentDiffRecursivelyDiff_forBucketAtIndex_withBuckets_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _presentDiffRecursivelyDiff:*(void *)(a1 + 32) forBucketAtIndex:*(void *)(a1 + 64) + 1 withBuckets:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)updateShadow:(double)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  BOOL v6 = a4;
  [(PKRemoveableAnimationTrackerStore *)self->_delayedAnimations preempt];
  [(UIImageView *)self->_shadowBackgroundView layer];
  double v9 = a3 * 0.27;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [v17 opacity];
  if (v6)
  {
    double v11 = *(float *)&v10;
    if (v9 != *(float *)&v10)
    {
      id v12 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      [v12 setBeginTime:a5];
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v11, v9);
      [v12 duration];
      objc_msgSend(v12, "setDuration:", fmax(v13 + a5, 0.0));
      delayedAnimations = self->_delayedAnimations;
      if (!delayedAnimations)
      {
        id v15 = (PKRemoveableAnimationTrackerStore *)objc_alloc_init(MEMORY[0x1E4F84F38]);
        id v16 = self->_delayedAnimations;
        self->_delayedAnimations = v15;

        delayedAnimations = self->_delayedAnimations;
      }
    }
  }
  *(float *)&double v10 = v9;
  [v17 setOpacity:v10];
}

void __50__PKPassFaceView_updateShadow_animated_withDelay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 opacity];
  double v7 = v6;
  id v10 = [v4 fromValue];

  [v10 doubleValue];
  double v9 = v8 + v7;
  *(float *)&double v9 = v9;
  [v5 setOpacity:v9];
}

- (id)passFaceTemplate
{
  return 0;
}

- (id)headerTemplate
{
  return 0;
}

- (CGSize)contentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPassFaceViewRendererState)rendererState
{
  return (PKPassFaceViewRendererState *)[(PKTransactionDataOverlayCardFaceView *)self->_transactionDataOverlayView rendererState];
}

- (BOOL)showsLiveRendering
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setShowsLiveRendering:(BOOL)a3
{
}

- (void)didPresent
{
}

- (void)didDismiss
{
}

- (void)didAuthenticate
{
  [(PKLiveRenderedCardFaceView *)self->_liveBackgroundView didAuthenticate];
  transactionDataOverlayView = self->_transactionDataOverlayView;

  [(PKTransactionDataOverlayCardFaceView *)transactionDataOverlayView setContentSuppressed:0];
}

- (void)didTransact
{
}

- (void)_flushContentViewsForRegions:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t contentViewCreatedRegions = self->_contentViewCreatedRegions;
  if ((contentViewCreatedRegions & 2) != 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = self->_headerContentViews;
    uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v9++) removeFromSuperview];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    headerContentViews = self->_headerContentViews;
    self->_headerContentViews = 0;

    unint64_t contentViewCreatedRegions = self->_contentViewCreatedRegions & 0xFFFFFFFFFFFFFFFDLL;
    self->_unint64_t contentViewCreatedRegions = contentViewCreatedRegions;
  }
  if ((contentViewCreatedRegions & 4) != 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v11 = self->_bodyContentViews;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15++), "removeFromSuperview", (void)v17);
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }

    bodyContentViews = self->_bodyContentViews;
    self->_bodyContentViews = 0;

    self->_contentViewCreatedRegions &= ~4uLL;
  }
}

- (void)_setContentViewsAlpha:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_headerContentViews;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9++) setAlpha:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_bodyContentViews;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "setAlpha:", a3, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  double v3 = a2;
  __int16 v4 = v3[244];
  if ((v4 & 0x1000) == 0)
  {
    v3[244] = v4 | 0x1000;
    if ((v4 & 0xC00) == 0)
    {
      uint64_t v13 = v3;
      uint64_t v5 = *(void *)(a1 + 32);
      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_0);
      if (!qword_1E94F5610)
      {
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28E10], "pk_copiedToWeakObjectsMapTable");
        uint64_t v7 = (void *)qword_1E94F5610;
        qword_1E94F5610 = v6;
      }
      uint64_t v8 = [NSNumber numberWithInteger:v5];
      uint64_t v9 = [(id)qword_1E94F5610 objectForKey:v8];
      if (!v9)
      {
        id v10 = (void *)MEMORY[0x1E4FB1818];
        uint64_t v11 = PKPassGrayPlaceholderImage();
        uint64_t v9 = [v10 imageWithPKImage:v11];

        [(id)qword_1E94F5610 setObject:v9 forKey:v8];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_0);

      uint64_t v12 = (void *)v13[66];
      v13[66] = v9;

      [v13 setNeedsLayout];
      double v3 = v13;
    }
  }
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = *((_WORD *)v3 + 244);
  if ((v4 & 0x800) == 0)
  {
    *((_WORD *)v3 + 244) = v4 | 0x800;
    if ((v4 & 0x400) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4FB1818];
      id v25 = v3;
      uint64_t v6 = [*((id *)v3 + 55) partialFrontFaceImage];
      uint64_t v7 = [v5 imageWithPKImage:v6];
      uint64_t v8 = (void *)*((void *)v25 + 78);
      *((void *)v25 + 78) = v7;

      uint64_t v9 = (void *)MEMORY[0x1E4FB1618];
      id v10 = [*((id *)v25 + 55) partialFrontFaceImageAverageColor];
      uint64_t v11 = objc_msgSend(v9, "pkui_colorWithPKColor:", v10);
      uint64_t v12 = (void *)*((void *)v25 + 76);
      *((void *)v25 + 76) = v11;

      PKPassFaceShadowInsets();
      *((void *)v25 + 79) = v13;
      *((void *)v25 + 80) = v14;
      *((void *)v25 + 82) = v15;
      *((void *)v25 + 81) = 0;
      [*((id *)v25 + 78) size];
      double v18 = v17 - (*((double *)v25 + 79) + *((double *)v25 + 81));
      double v19 = *(double *)(a1 + 48);
      double v20 = *(double *)(a1 + 40) - (v16 - (*((double *)v25 + 80) + *((double *)v25 + 82)));
      *((void *)v25 + 83) = 0;
      *((double *)v25 + 85) = v19 - v18;
      PKFloatRoundToPixel();
      *((double *)v25 + 84) = v21;
      *((double *)v25 + 86) = v20 - v21;
      long long v22 = (void *)*((void *)v25 + 66);
      *((void *)v25 + 66) = 0;

      long long v23 = (void *)*((void *)v25 + 63);
      if (v23)
      {
        [v23 removeFromSuperview];
        long long v24 = (void *)*((void *)v25 + 63);
        *((void *)v25 + 63) = 0;
      }
      [v25 setNeedsLayout];
      id v3 = v25;
    }
  }
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_5;
  v2[3] = &unk_1E59CB128;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_WORD *)WeakRetained + 244) &= ~0x8000u;
    id v4 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_6(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_7;
  v2[3] = &unk_1E59CB128;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_WORD *)WeakRetained + 244) &= ~0x4000u;
    id v4 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

- (id)_relevantBuckets
{
  return 0;
}

- (void)_updateForeignBalances
{
  if (self->_paymentService)
  {
    objc_initWeak(&location, self);
    paymentService = self->_paymentService;
    id v4 = [(PKPassFaceView *)self pass];
    uint64_t v5 = [v4 uniqueID];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__PKPassFaceView__updateForeignBalances__block_invoke;
    v6[3] = &unk_1E59CBE48;
    objc_copyWeak(&v7, &location);
    [(PKPaymentService *)paymentService balancesForPaymentPassWithUniqueIdentifier:v5 completion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __40__PKPassFaceView__updateForeignBalances__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PKPassFaceView__updateForeignBalances__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __40__PKPassFaceView__updateForeignBalances__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setBalances:*(void *)(a1 + 32)];
}

- (void)_setBalances:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  double v31 = self;
  if (self->_paymentService && [v4 count])
  {
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v48 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v12 = [v11 identifiers];
          if (v12) {
            [v37 setObject:v11 forKeyedSubscript:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v8);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v13 = v31->_buckets;
    uint64_t v34 = [(NSArray *)v13 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v34)
    {
      double v30 = v5;
      char v36 = 0;
      uint64_t v32 = *(void *)v44;
      v33 = v13;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v13);
          }
          uint64_t v35 = v14;
          uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          obuint64_t j = v15;
          uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v40 != v18) {
                  objc_enumerationMutation(obj);
                }
                double v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                if ([v20 foreignReferenceType] == 1)
                {
                  double v21 = [v20 foreignReferenceIdentifiers];
                  if (v21)
                  {
                    long long v22 = [v37 objectForKeyedSubscript:v21];
                    long long v23 = v22;
                    if (v22)
                    {
                      long long v24 = [v22 localizedTitle];
                      id v25 = [v23 formattedValue];
                    }
                    else
                    {
                      id v25 = 0;
                      long long v24 = 0;
                    }
                    long long v26 = [v20 label];
                    char v27 = PKEqualObjects();

                    if ((v27 & 1) == 0)
                    {
                      [v20 setLabel:v24];
                      char v36 = 1;
                    }
                    long long v28 = [v20 value];
                    char v29 = PKEqualObjects();

                    if ((v29 & 1) == 0)
                    {
                      [v20 setUnformattedValue:v25];
                      [v20 flushCachedValue];
                      char v36 = 1;
                    }
                  }
                }
              }
              uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v17);
          }

          uint64_t v14 = v35 + 1;
          uint64_t v13 = v33;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v34);

      uint64_t v5 = v30;
      if (v36) {
        [(PKPassFaceView *)v31 _recreateFieldDerivedContent];
      }
    }
    else
    {
    }
  }
}

- (void)_recreateFieldDerivedContent
{
  unint64_t v3 = self->_contentViewCreatedRegions & 6;
  [(PKPassFaceView *)self _flushContentViewsForRegions:6];

  [(PKPassFaceView *)self _createContentViewsForRegions:v3];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPassFaceView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__PKPassFaceView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) pass];
  unint64_t v3 = [v2 uniqueID];
  int v4 = PKEqualObjects();

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    [v5 _setBalances:v6];
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  if (self->_foregroundActive != ((*(void *)&a4.var0 >> 8) & 1))
  {
    self->_foregroundActive = (unsigned __int16)(*(_WORD *)&a4 & 0x100) >> 8;
    if ((*(_WORD *)&a4 & 0x100) != 0) {
      [(PKPassFaceView *)self _updateForeignBalances];
    }
  }
}

- (void)_handleTimeOrLocaleChange:(id)a3
{
  int v4 = [(PKPassFaceView *)self pass];
  [v4 flushFormattedFieldValues];

  if (self->_style == 9)
  {
    buckets = self->_buckets;
    self->_buckets = 0;
  }

  [(PKPassFaceView *)self _recreateFieldDerivedContent];
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (unint64_t)visibleRegions
{
  return self->_visibleRegions;
}

- (BOOL)modallyPresented
{
  return self->_modallyPresented;
}

- (BOOL)clipsContent
{
  return self->_clipsContent;
}

- (double)clippedContentHeight
{
  return self->_clippedContentHeight;
}

- (BOOL)liveMotionEnabled
{
  return self->_liveMotionEnabled;
}

- (void)setViewExpanded:(BOOL)a3
{
  self->_viewExpanded = a3;
}

- (NSData)dynamicBarcodeData
{
  return self->_dynamicBarcodeData;
}

- (void)setDynamicBarcodeData:(id)a3
{
}

- (PKPassFaceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassFaceViewDelegate *)WeakRetained;
}

- (NSMutableArray)headerBucketViews
{
  return self->_headerBucketViews;
}

- (void)setHeaderBucketViews:(id)a3
{
}

- (PKPassBucketTemplate)headerBucketTemplate
{
  return self->_headerBucketTemplate;
}

- (CGSize)cobrandLogoSize
{
  double width = self->_cobrandLogoSize.width;
  double height = self->_cobrandLogoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIImageView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_headerBucketTemplate, 0);
  objc_storeStrong((id *)&self->_faceTemplate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dynamicBarcodeData, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffixView, 0);
  objc_storeStrong((id *)&self->_dynamicCardView, 0);
  objc_storeStrong((id *)&self->_transactionDataOverlayView, 0);
  objc_storeStrong((id *)&self->_liveBackgroundView, 0);
  objc_storeStrong((id *)&self->_delayedAnimations, 0);
  objc_storeStrong((id *)&self->_bodyBucketViews, 0);
  objc_storeStrong((id *)&self->_headerBucketViews, 0);
  objc_storeStrong((id *)&self->_dimmingFilter, 0);
  objc_storeStrong((id *)&self->_partialFaceImage, 0);
  objc_storeStrong((id *)&self->_faceShadowImage, 0);
  objc_storeStrong((id *)&self->_faceImageAverageColor, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
  objc_storeStrong((id *)&self->_placeholderFaceImage, 0);
  objc_storeStrong((id *)&self->_shadowBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundPlaceholderView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bodyContentViews, 0);
  objc_storeStrong((id *)&self->_headerContentViews, 0);
  objc_storeStrong((id *)&self->_bodyInvariantViews, 0);
  objc_storeStrong((id *)&self->_headerInvariantViews, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end