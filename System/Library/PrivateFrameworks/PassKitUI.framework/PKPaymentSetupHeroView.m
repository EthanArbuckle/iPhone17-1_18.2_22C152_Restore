@interface PKPaymentSetupHeroView
- (BOOL)_isSmallPhone;
- (CGSize)_watchCardCarouselSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentSetupHeroView)initWithContext:(int64_t)a3 heroImageController:(id)a4 heroImages:(id)a5;
- (PKPaymentSetupHeroView)initWithContext:(int64_t)a3 heroImageController:(id)a4 heroImages:(id)a5 product:(id)a6;
- (double)_instructionFontSizeForContext:(int64_t)a3;
- (double)_phoneCardHeightInset;
- (double)_phoneTopPadding;
- (id)_heroImages;
- (id)pk_childrenForAppearance;
- (void)_configureHeroCardsFromHeroImages:(id)a3;
- (void)_createSubviews;
- (void)_layoutBottomDividerViewForBounds:(CGRect)a3;
- (void)_layoutCardCarouselWithAlignment:(id)a3;
- (void)heroImageController:(id)a3 didFinishDownloadingImageData:(id)a4 forImage:(id)a5 error:(id)a6;
- (void)layoutSubviews;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation PKPaymentSetupHeroView

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PKPaymentSetupHeroView)initWithContext:(int64_t)a3 heroImageController:(id)a4 heroImages:(id)a5
{
  return [(PKPaymentSetupHeroView *)self initWithContext:a3 heroImageController:a4 heroImages:a5 product:0];
}

- (PKPaymentSetupHeroView)initWithContext:(int64_t)a3 heroImageController:(id)a4 heroImages:(id)a5 product:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentSetupHeroView;
  v14 = -[PKPaymentSetupHeroView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    objc_storeStrong((id *)&v14->_heroImageController, a4);
    [MEMORY[0x1E4F84AC0] cardAspectRatio];
    if (v13)
    {
      double v17 = 300.0 / v16;
      v18 = [[PKImageSequenceView alloc] initWitImages:0];
      cardCarouselView = v15->_cardCarouselView;
      v15->_cardCarouselView = v18;

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke;
      v26[3] = &unk_1E59CC3F0;
      v27 = v15;
      id v28 = v13;
      uint64_t v29 = 0x4072C00000000000;
      double v30 = v17;
      id v20 = (id)[v28 digitalCardCachedImage:v26];

      v21 = v27;
    }
    else
    {
      [(PKPaymentHeroImageController *)v15->_heroImageController setDelegate:v15];
      [(PKPaymentSetupHeroView *)v15 _configureHeroCardsFromHeroImages:v12];
      v22 = [PKImageSequenceView alloc];
      v21 = [(PKPaymentSetupHeroView *)v15 _heroImages];
      uint64_t v23 = [(PKImageSequenceView *)v22 initWitImages:v21];
      v24 = v15->_cardCarouselView;
      v15->_cardCarouselView = (PKImageSequenceView *)v23;
    }
    [(PKPaymentSetupHeroView *)v15 setClipsToBounds:0];
    [(PKPaymentSetupHeroView *)v15 _createSubviews];
  }

  return v15;
}

void __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 464);
    v13[0] = a3;
    v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    v7 = [v5 arrayWithObjects:v13 count:1];
    [v4 updateImages:v7];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke_2;
    v10[3] = &unk_1E59CC3C8;
    v8 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v9 = (id)objc_msgSend(v8, "thumbnailCachedImageForSize:completion:", v10, *(double *)(a1 + 48), *(double *)(a1 + 56));

    v7 = 0;
    id v6 = v11;
  }
}

void __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(*(void *)(a1 + 32) + 464);
  if (a3)
  {
    v8[0] = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:v8 count:1];
    [v3 updateImages:v6];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _heroImages];
    objc_msgSend(v3, "updateImages:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!PKPaymentSetupContextIsBridge())
  {
    if (!PKIsPad())
    {
      if ([(PKPaymentSetupHeroView *)self _isSmallPhone])
      {
        [(PKPaymentSetupHeroView *)self bounds];
        double v10 = v9 * 0.560000002;
        [MEMORY[0x1E4F84AC0] cardAspectRatio];
        double v12 = v10 / v11;
        [(PKPaymentSetupHeroView *)self _phoneTopPadding];
        double v14 = v13 + v12;
        [(PKPaymentSetupHeroView *)self _phoneCardHeightInset];
        double v8 = v15 + v14;
      }
      else
      {
        PKScreenSize();
        PKFloatRoundToPixel();
        double v8 = v16;
      }
      goto LABEL_11;
    }
LABEL_7:
    double v8 = 236.0;
LABEL_11:
    double v7 = width;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  heroDeviceView = self->_heroDeviceView;

  -[UIView sizeThatFits:](heroDeviceView, "sizeThatFits:", width, height);
LABEL_12:
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupHeroView;
  [(PKPaymentSetupHeroView *)&v22 layoutSubviews];
  [(PKPaymentSetupHeroView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView sizeThatFits:](self->_heroDeviceView, "sizeThatFits:", v7 * 0.560000002, 1.79769313e308);
  double v12 = v11;
  if (PKPaymentSetupContextIsBridge())
  {
    heroDeviceView = self->_heroDeviceView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](heroDeviceView, "setFrame:");
    [(UIView *)self->_heroDeviceView cardFrame];
    -[PKImageSequenceView setFrame:](self->_cardCarouselView, "setFrame:");
    id v14 = [(PKImageSequenceView *)self->_cardCarouselView layer];
    PKPaymentStyleApplyCorners();
  }
  else
  {
    if (PKIsPad())
    {
      -[UIView setFrame:](self->_heroDeviceView, "setFrame:", v4, v6, v8, v10);
      goto LABEL_9;
    }
    uint64_t v15 = PKContentAlignmentMake();
    [(PKPaymentSetupHeroView *)self _phoneTopPadding];
    double v17 = v10 - v16;
    v18 = self->_heroDeviceView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](v18, "setFrame:");
    id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    id v19 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

    objc_msgSend(v14, "setFrame:", -50.0, -50.0, v12 + 100.0, v17 + 50.0);
    id v20 = [(UIView *)self->_heroDeviceView layer];
    [v20 setMask:v14];

    [(PKPaymentSetupHeroView *)self _layoutCardCarouselWithAlignment:v15];
    if (self->_faceIDGlyphView)
    {
      [(PKImageSequenceView *)self->_cardCarouselView frame];
      CGRectGetMaxY(v23);
      v24.origin.x = v4;
      v24.origin.y = v6;
      v24.size.double width = v8;
      v24.size.double height = v10;
      CGRectGetMaxY(v24);
      faceIDGlyphView = self->_faceIDGlyphView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](faceIDGlyphView, "setFrame:");
    }
    -[PKPaymentSetupHeroView _layoutBottomDividerViewForBounds:](self, "_layoutBottomDividerViewForBounds:", v4, v6, v8, v10);
  }

LABEL_9:
  if ((PKPaymentSetupContextIsBridge() & 1) == 0)
  {
    [(UIView *)self->_backgroundView frame];
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
  }
}

- (void)_layoutCardCarouselWithAlignment:(id)a3
{
  [(UIView *)self->_heroDeviceView frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(PKPaymentSetupHeroView *)self _phoneCardHeightInset];
  CGFloat v13 = v12;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.double width = v9;
  v18.size.double height = v11;
  CGRectInset(v18, 9.0, v13);
  [MEMORY[0x1E4F84AC0] cardAspectRatio];
  cardCarouselView = self->_cardCarouselView;
  PKSizeAlignedInRect();
  -[PKImageSequenceView setFrame:](cardCarouselView, "setFrame:");
  id v16 = [(PKImageSequenceView *)self->_cardCarouselView layer];
  id v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
  [v15 CGColor];
  PKPaymentStyleApplyCorners();
}

- (void)_layoutBottomDividerViewForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v6 = PKUIPixelLength();
  bottomDividerView = self->_bottomDividerView;

  -[UIView setFrame:](bottomDividerView, "setFrame:", 0.0, height - v6, width, v6);
}

- (void)startAnimation
{
}

- (void)stopAnimation
{
}

- (void)heroImageController:(id)a3 didFinishDownloadingImageData:(id)a4 forImage:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PKPaymentSetupHeroView_heroImageController_didFinishDownloadingImageData_forImage_error___block_invoke;
  v15[3] = &unk_1E59CB8B0;
  id v16 = v11;
  id v17 = v9;
  id v18 = v10;
  id v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __91__PKPaymentSetupHeroView_heroImageController_didFinishDownloadingImageData_forImage_error___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 48) identifier];
    if ((objc_msgSend(*(id *)(*(void *)(a1 + 56) + 488), "containsObject:") & 1) == 0) {
      [*(id *)(*(void *)(a1 + 56) + 488) addObject:v8];
    }
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F84780]) initWithData:*(void *)(a1 + 40) scale:PKUIScreenScale()];
    if (v2)
    {
      double v3 = *(void **)(*(void *)(a1 + 56) + 496);
      double v4 = [MEMORY[0x1E4FB1818] imageWithPKImage:v2];
      [v3 setObject:v4 forKey:v8];
    }
    CGFloat v5 = *(void **)(a1 + 56);
    double v6 = (void *)v5[58];
    CGFloat v7 = [v5 _heroImages];
    [v6 updateImages:v7];
  }
}

- (id)_heroImages
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = self->_heroImageIdentifiers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[NSMutableDictionary objectForKey:](self->_heroImagesDictionary, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_configureHeroCardsFromHeroImages:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = 0x1E4F84000uLL;
  if ([v4 count])
  {
    [(PKPaymentHeroImageController *)self->_heroImageController downloadImages:v4];
  }
  else
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "No hero card images provided, using defaults.", buf, 2u);
    }

    uint64_t v7 = [MEMORY[0x1E4F84AC0] defaultImages];
    uint64_t v8 = [v7 mutableCopy];

    id v4 = (id)v8;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPaymentSetupHeroView__configureHeroCardsFromHeroImages___block_invoke;
  aBlock[3] = &unk_1E59CC418;
  id v10 = v9;
  id v38 = v10;
  long long v11 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v13)
  {

LABEL_16:
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "No hero card images downloaded, using defaults.", buf, 2u);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = objc_msgSend(*(id *)(v5 + 2752), "defaultImages", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v11[2](v11, *(void *)(*((void *)&v29 + 1) + 8 * i));
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v40 count:16];
      }
      while (v21);
    }

    goto LABEL_26;
  }
  uint64_t v14 = v13;
  int v15 = 0;
  uint64_t v16 = *(void *)v34;
  do
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if (*(void *)v34 != v16) {
        objc_enumerationMutation(v12);
      }
      v15 |= ((uint64_t (*)(void *, void))v11[2])(v11, *(void *)(*((void *)&v33 + 1) + 8 * j));
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
  }
  while (v14);

  unint64_t v5 = 0x1E4F84000;
  if ((v15 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_26:
  objc_storeStrong((id *)&self->_heroImagesDictionary, v9);
  CGRect v24 = [v10 allKeys];
  v25 = objc_msgSend(v24, "pk_shuffledArray");
  v26 = (NSMutableArray *)[v25 mutableCopy];
  heroImageIdentifiers = self->_heroImageIdentifiers;
  self->_heroImageIdentifiers = v26;

  id v28 = [(PKPaymentHeroImageController *)self->_heroImageController primaryImageIdentifier];
  if (v28)
  {
    [(NSMutableArray *)self->_heroImageIdentifiers removeObject:v28];
    [(NSMutableArray *)self->_heroImageIdentifiers insertObject:v28 atIndex:0];
  }
}

uint64_t __60__PKPaymentSetupHeroView__configureHeroCardsFromHeroImages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 imageWithScale:PKUIScreenScale()];
  if (v4 && (uint64_t v5 = [objc_alloc(MEMORY[0x1E4F84780]) initWithData:v4 scale:PKUIScreenScale()]) != 0)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4FB1818] imageWithPKImage:v5];
    id v9 = [v3 identifier];
    [v7 setObject:v8 forKey:v9];

    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_createSubviews
{
  int IsAvailable = PKPearlIsAvailable();
  if (PKPaymentSetupContextIsBridge())
  {
    id v4 = objc_alloc_init(PKWatchHeroImageView);
    heroDeviceView = self->_heroDeviceView;
    self->_heroDeviceView = &v4->super;

    [(UIView *)self->_heroDeviceView setContentMode:2];
    [(UIView *)self->_heroDeviceView addSubview:self->_cardCarouselView];
    int v6 = 0;
  }
  else
  {
    int v7 = PKIsPad();
    if (v7)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"HeroPad"];
      id v9 = v8;
      if (IsAvailable) {
        [v8 appendString:@"-FaceID"];
      }
      uint64_t v10 = [v9 stringByAppendingString:@"-Dark"];
      long long v11 = PKUIDynamicImageNamed(v9, v10);

      id v12 = [[PKPhoneHeroImageView alloc] initWithImage:v11];
      uint64_t v13 = self->_heroDeviceView;
      self->_heroDeviceView = &v12->super;

      [(UIView *)self->_heroDeviceView setContentMode:1];
    }
    else
    {
      uint64_t v14 = [PKPhoneHeroView alloc];
      int v15 = -[PKPhoneHeroView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v16 = self->_heroDeviceView;
      self->_heroDeviceView = v15;

      id v17 = self->_heroDeviceView;
      id v18 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(UIView *)v17 setBackgroundColor:v18];

      if (![(PKPaymentSetupHeroView *)self _isSmallPhone])
      {
        id v19 = @"TouchIDIcon";
        if (IsAvailable) {
          id v19 = @"PearlIDIcon";
        }
        uint64_t v20 = v19;
        uint64_t v21 = PKPassKitUIBundle();
        uint64_t v22 = [v21 URLForResource:v20 withExtension:@"pdf"];

        id v23 = objc_alloc(MEMORY[0x1E4FB1838]);
        double v24 = PKUIScreenScale();
        v25 = PKUIImageFromPDF(v22, 40.0, 40.0, v24);
        v26 = (UIImageView *)[v23 initWithImage:v25];
        faceIDGlyphView = self->_faceIDGlyphView;
        self->_faceIDGlyphView = v26;
      }
      id v28 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      bottomDividerView = self->_bottomDividerView;
      self->_bottomDividerView = v28;

      long long v30 = self->_bottomDividerView;
      id v9 = [(id)objc_opt_class() assetBackgroundColor];
      [(UIView *)v30 setBackgroundColor:v9];
    }

    int v6 = v7 ^ 1;
    long long v31 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v31;

    long long v33 = self->_backgroundView;
    long long v34 = [(id)objc_opt_class() assetBackgroundColor];
    [(UIView *)v33 setBackgroundColor:v34];

    [(PKPaymentSetupHeroView *)self addSubview:self->_backgroundView];
  }
  [(PKPaymentSetupHeroView *)self addSubview:self->_heroDeviceView];
  if (self->_faceIDGlyphView) {
    -[PKPaymentSetupHeroView addSubview:](self, "addSubview:");
  }
  if (self->_bottomDividerView) {
    -[PKPaymentSetupHeroView addSubview:](self, "addSubview:");
  }
  if (v6)
  {
    cardCarouselView = self->_cardCarouselView;
    [(PKPaymentSetupHeroView *)self addSubview:cardCarouselView];
  }
}

- (CGSize)_watchCardCarouselSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (PKPaymentSetupContextIsBridge())
  {
    -[UIView sizeThatFits:](self->_heroDeviceView, "sizeThatFits:", width, height);
  }
  else
  {
    unint64_t v8 = PKUIGetMinScreenType();
    id v9 = (double *)((char *)&unk_1A0442E20 + 8 * v8);
    uint64_t v10 = (double *)((char *)&unk_1A0442EC0 + 8 * v8);
    if (v8 >= 0x14)
    {
      uint64_t v10 = (double *)(MEMORY[0x1E4F1DB30] + 8);
      id v9 = (double *)MEMORY[0x1E4F1DB30];
    }
    double v6 = *v9;
    double v7 = *v10;
  }
  -[PKPaymentHeroImageController cardArtSizeForSize:](self->_heroImageController, "cardArtSizeForSize:", v6, v7);
  double v12 = v11;
  double v14 = v13;
  if (PKPaymentSetupContextIsBridge())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = self->_heroDeviceView;
      [(UIView *)v15 setNeedsLayout];
      [(UIView *)v15 layoutIfNeeded];
      [(UIView *)v15 watchScreenFrame];
      double v12 = v16;

      +[PKBridgeWatchAttributeController heroWatchSize];
      UIRoundToViewScale();
      double v14 = v17;
    }
  }
  double v18 = v12;
  double v19 = v14;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)_instructionFontSizeForContext:(int64_t)a3
{
  int IsAvailable = PKPearlIsAvailable();
  double result = 5.0;
  if (IsAvailable) {
    return 5.5;
  }
  return result;
}

- (BOOL)_isSmallPhone
{
  return PKUIGetMinScreenWidthType() == 0;
}

- (double)_phoneTopPadding
{
  BOOL v2 = [(PKPaymentSetupHeroView *)self _isSmallPhone];
  double result = 20.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (double)_phoneCardHeightInset
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double result = 0.0;
  if (isKindOfClass)
  {
    [(UIView *)self->_heroDeviceView deviceCornerRadius];
    return v5 + 5.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImagesDictionary, 0);
  objc_storeStrong((id *)&self->_heroImageIdentifiers, 0);
  objc_storeStrong((id *)&self->_faceIDGlyphView, 0);
  objc_storeStrong((id *)&self->_heroImageController, 0);
  objc_storeStrong((id *)&self->_cardCarouselView, 0);
  objc_storeStrong((id *)&self->_heroDeviceView, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end