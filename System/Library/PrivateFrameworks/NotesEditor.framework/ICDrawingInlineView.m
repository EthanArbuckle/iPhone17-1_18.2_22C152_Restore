@interface ICDrawingInlineView
- (BOOL)cancelDidScrollIntoVisibleRange;
- (BOOL)forManualRendering;
- (BOOL)fullscreen;
- (BOOL)hasImage;
- (BOOL)hideLoadingProgress;
- (BOOL)isEditable;
- (BOOL)isInAttachmentBrowser;
- (BOOL)isReadyToPresent;
- (BOOL)isVisibleWithinScrollView;
- (BOOL)needsToUpdateImage;
- (BOOL)shouldUseLightDrawingBackground;
- (BOOL)showGotoNote;
- (BOOL)thumbnailDisplay;
- (CALayer)imageLayer;
- (CGRect)boundsForDisplay;
- (CGRect)imageFrame;
- (CGSize)attachmentContentSize;
- (ICAttachment)attachment;
- (ICDrawingInlineView)initWithCoder:(id)a3;
- (ICDrawingInlineView)initWithFrame:(CGRect)a3;
- (ICDrawingInlineView)initWithFrame:(CGRect)a3 forManualRendering:(BOOL)a4;
- (ICLoadingPieLayer)loadingProgressLayer;
- (ICSelectorDelayer)previewImageUpdateDelayer;
- (UIColor)borderColor;
- (UIColor)drawingBackgroundColor;
- (id)attachmentImage;
- (id)imageLoadingCancelBlock;
- (id)lowestSuperScrollView;
- (id)previewImage;
- (void)animateImageArrivalWithAnimationDuration:(double)a3;
- (void)attachmentPreviewDidStart:(id)a3;
- (void)attachmentPreviewImagesDidUpdate:(id)a3;
- (void)commonInit;
- (void)dealloc;
- (void)delayedPreviewImageChanged;
- (void)didMoveToWindow;
- (void)didScrollIntoVisibleRange;
- (void)didScrollOutOfVisibleRange;
- (void)observePreviewGenerationProgress:(id)a3;
- (void)registerForTraitChanges;
- (void)setAttachment:(id)a3;
- (void)setAttachmentContentSize:(CGSize)a3;
- (void)setBorderColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEditable:(BOOL)a3;
- (void)setForManualRendering:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setHideLoadingProgress:(BOOL)a3;
- (void)setImageLayer:(id)a3;
- (void)setImageLoadingCancelBlock:(id)a3;
- (void)setIsInAttachmentBrowser:(BOOL)a3;
- (void)setLoadingProgressLayer:(id)a3;
- (void)setNeedsToUpdateImage:(BOOL)a3;
- (void)setPreviewImageUpdateDelayer:(id)a3;
- (void)setShowGotoNote:(BOOL)a3;
- (void)setThumbnailDisplay:(BOOL)a3;
- (void)updateBorderWidth;
- (void)updateImageWithAnimation:(BOOL)a3;
- (void)updateLayerImage:(id)a3 animation:(BOOL)a4;
@end

@implementation ICDrawingInlineView

- (ICDrawingInlineView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDrawingInlineView;
  v3 = -[ICDrawingInlineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICDrawingInlineView *)v3 commonInit];
  }
  return v4;
}

- (ICDrawingInlineView)initWithFrame:(CGRect)a3 forManualRendering:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ICDrawingInlineView;
  v5 = -[ICDrawingInlineView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v6 = v5;
  if (v5)
  {
    [(ICDrawingInlineView *)v5 commonInit];
    v6->_forManualRendering = a4;
  }
  return v6;
}

- (ICDrawingInlineView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDrawingInlineView;
  v3 = [(ICDrawingInlineView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICDrawingInlineView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  imageLayer = self->_imageLayer;
  self->_imageLayer = v3;

  [(ICDrawingInlineView *)self bounds];
  -[CALayer setFrame:](self->_imageLayer, "setFrame:");
  [(CALayer *)self->_imageLayer setMasksToBounds:1];
  [(ICDrawingInlineView *)self setClipsToBounds:1];
  v5 = [(ICDrawingInlineView *)self layer];
  objc_super v6 = [(ICDrawingInlineView *)self imageLayer];
  [v5 addSublayer:v6];

  v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
  [(ICDrawingInlineView *)self setBorderColor:v7];

  objc_super v8 = (void *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_delayedPreviewImageChanged delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:0.3];
  [(ICDrawingInlineView *)self setPreviewImageUpdateDelayer:v8];

  [(ICDrawingInlineView *)self registerForTraitChanges];
}

- (void)dealloc
{
  v3 = [(ICDrawingInlineView *)self previewImageUpdateDelayer];
  [v3 cancelPreviousFireRequests];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ICDrawingInlineView;
  [(ICDrawingInlineView *)&v5 dealloc];
}

- (BOOL)shouldUseLightDrawingBackground
{
  v3 = [(ICDrawingInlineView *)self ic_appearanceInfo];
  if ([v3 isDark]) {
    BOOL v4 = [(ICDrawingInlineView *)self isInAttachmentBrowser]
  }
      || [(ICDrawingInlineView *)self thumbnailDisplay];
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setAttachment:(id)a3
{
  objc_super v5 = (ICAttachment *)a3;
  if (self->_attachment != v5)
  {
    v40 = v5;
    objc_super v6 = [(ICDrawingInlineView *)self attachment];

    v7 = (uint64_t *)MEMORY[0x263F5A978];
    objc_super v8 = (uint64_t *)MEMORY[0x263F5A940];
    v9 = (uint64_t *)MEMORY[0x263F5A968];
    if (v6)
    {
      v10 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v11 = *MEMORY[0x263F5A978];
      v12 = [(ICDrawingInlineView *)self attachment];
      v13 = [v12 objectID];
      [v10 removeObserver:self name:v11 object:v13];

      v14 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v15 = *v8;
      v16 = [(ICDrawingInlineView *)self attachment];
      v17 = [v16 objectID];
      [v14 removeObserver:self name:v15 object:v17];

      v18 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v19 = *v9;
      v20 = [(ICDrawingInlineView *)self attachment];
      v21 = [v20 objectID];
      uint64_t v22 = v19;
      v7 = (uint64_t *)MEMORY[0x263F5A978];
      [v18 removeObserver:self name:v22 object:v21];
    }
    objc_storeStrong((id *)&self->_attachment, a3);
    v23 = [(ICDrawingInlineView *)self attachment];

    if (v23)
    {
      v24 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v25 = *v7;
      v26 = [(ICDrawingInlineView *)self attachment];
      v27 = [v26 objectID];
      [v24 addObserver:self selector:sel_attachmentPreviewImagesDidUpdate_ name:v25 object:v27];

      v28 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v29 = *v8;
      v30 = [(ICDrawingInlineView *)self attachment];
      v31 = [v30 objectID];
      [v28 addObserver:self selector:sel_attachmentPreviewImagesDidUpdate_ name:v29 object:v31];

      v32 = [MEMORY[0x263F5B230] sharedGenerator];
      v33 = [(ICDrawingInlineView *)self attachment];
      v34 = [v33 objectID];
      v35 = [v32 progressForObjectID:v34];

      if (v35) {
        [(ICDrawingInlineView *)self observePreviewGenerationProgress:v35];
      }
      v36 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v37 = *v9;
      v38 = [(ICDrawingInlineView *)self attachment];
      v39 = [v38 objectID];
      [v36 addObserver:self selector:sel_attachmentPreviewDidStart_ name:v37 object:v39];
    }
    [(ICDrawingInlineView *)self updateImageWithAnimation:1];
    objc_super v5 = v40;
  }
}

- (CGRect)boundsForDisplay
{
  v3 = [(ICDrawingInlineView *)self attachment];
  BOOL v4 = [v3 drawingModel];
  objc_super v5 = [v4 drawing];
  [v5 bounds];
  CGFloat x = v6;
  CGFloat y = v8;
  double height = v10;

  v12 = [(ICDrawingInlineView *)self attachment];
  v13 = [v12 drawingModel];
  v14 = [v13 drawing];
  [v14 fullBounds];
  double width = v15;

  if (TSDNearlyEqualSizes())
  {
    [MEMORY[0x263F5AC38] defaultSize];
    TSDRectWithSize();
    CGFloat x = v17;
    CGFloat y = v18;
    double width = v19;
    double height = v20;
  }
  if (![(ICDrawingInlineView *)self thumbnailDisplay])
  {
    if ((width + -250.0) * 0.5 <= 0.0) {
      double v21 = (width + -250.0) * 0.5;
    }
    else {
      double v21 = 0.0;
    }
    if ((height + -250.0) * 0.5 <= 0.0) {
      double v22 = (height + -250.0) * 0.5;
    }
    else {
      double v22 = 0.0;
    }
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    CGRect v28 = CGRectInset(v27, v21, v22);
    CGRect v29 = CGRectIntegral(v28);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
  }
  if (width < 1.0 || height < 1.0 || (TSDRectIsFinite() & 1) == 0)
  {
    CGFloat y = 0.0;
    double height = 250.0;
    double width = 250.0;
    CGFloat x = 0.0;
  }
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGRect)imageFrame
{
  if ([(ICDrawingInlineView *)self fullscreen])
  {
    [(ICDrawingInlineView *)self bounds];
LABEL_17:
    double y = v4;
    CGFloat width = v5;
    CGFloat height = v6;
    goto LABEL_18;
  }
  BOOL v7 = [(ICDrawingInlineView *)self thumbnailDisplay];
  [(ICDrawingInlineView *)self boundsForDisplay];
  double v11 = v10;
  double v13 = v12;
  if (!v7)
  {
    v42 = (void *)MEMORY[0x263F5AC38];
    [MEMORY[0x263F5AC38] defaultSize];
    double v44 = v43;
    double v46 = v45;
    v47 = [(ICDrawingInlineView *)self attachment];
    objc_msgSend(v42, "fullSize:forOrientation:", (int)objc_msgSend(v47, "orientation"), v44, v46);
    double v49 = v48;
    CGFloat v51 = v50;

    [(ICDrawingInlineView *)self bounds];
    double v53 = v52 / v49;
    [(ICDrawingInlineView *)self bounds];
    double v55 = v54 / v13;
    v59.a = v53;
    if (v53 < v54 / v13) {
      double v55 = v53;
    }
    v59.b = 0.0;
    v59.c = 0.0;
    v59.d = v55;
    v63.origin.double y = -v11;
    v59.tdouble x = 0.0;
    v59.tdouble y = 0.0;
    v63.origin.double x = 0.0;
    v63.size.CGFloat width = v49;
    v63.size.CGFloat height = v51;
    *(CGRect *)&CGFloat v3 = CGRectApplyAffineTransform(v63, &v59);
    goto LABEL_17;
  }
  double v14 = v8;
  double v15 = v9;
  v16 = (void *)MEMORY[0x263F5AC38];
  [MEMORY[0x263F5AC38] defaultSize];
  double v18 = v17;
  double v20 = v19;
  double v21 = [(ICDrawingInlineView *)self attachment];
  objc_msgSend(v16, "fullSize:forOrientation:", (int)objc_msgSend(v21, "orientation"), v18, v20);
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  [(ICDrawingInlineView *)self bounds];
  double v28 = v27 / v15;
  double v29 = 1.0;
  if (v27 / v15 > 1.0) {
    double v28 = 1.0;
  }
  if (v26 / v13 <= 1.0) {
    double v29 = v26 / v13;
  }
  if (v28 < v29) {
    double v29 = v28;
  }
  v60.a = v29;
  v61.origin.double x = -v14;
  v60.b = 0.0;
  v60.c = 0.0;
  v60.d = v29;
  v61.origin.double y = -v11;
  v60.tdouble x = 0.0;
  v60.tdouble y = 0.0;
  v61.size.CGFloat width = v23;
  v61.size.CGFloat height = v25;
  CGRect v62 = CGRectApplyAffineTransform(v61, &v60);
  double x = v62.origin.x;
  double y = v62.origin.y;
  CGFloat width = v62.size.width;
  CGFloat height = v62.size.height;
  v34 = [(ICDrawingInlineView *)self attachment];
  [v34 bounds];
  double v36 = v35;
  double v38 = v37;

  [(ICDrawingInlineView *)self frame];
  double v41 = floor((v40 - v36) * 0.5);
  if (v36 >= v40) {
    double v41 = -0.0;
  }
  CGFloat v3 = x + v41;
  if (v38 < v39) {
    double y = y + floor((v39 - v38) * 0.5);
  }
LABEL_18:
  double v56 = y;
  double v57 = width;
  double v58 = height;
  result.size.CGFloat height = v58;
  result.size.CGFloat width = v57;
  result.origin.double y = v56;
  result.origin.double x = v3;
  return result;
}

- (UIColor)drawingBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ic_lightAttachmentBackgroundColor");
}

- (void)animateImageArrivalWithAnimationDuration:(double)a3
{
  double v5 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v5 setFromValue:&unk_26C1391D0];
  [v5 setToValue:&unk_26C1391E0];
  [v5 setDuration:a3];
  double v6 = [(ICDrawingInlineView *)self imageLayer];
  [v6 addAnimation:v5 forKey:@"opacity"];

  BOOL v7 = [(ICDrawingInlineView *)self shouldUseLightDrawingBackground];
  double v8 = [(ICDrawingInlineView *)self ic_backgroundColor];

  if (v8)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke;
    v11[3] = &unk_2640B9320;
    v11[4] = self;
    BOOL v12 = v7;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke_2;
    v9[3] = &unk_2640B9320;
    BOOL v10 = v7;
    v9[4] = self;
    objc_msgSend(MEMORY[0x263F82E00], "ic_animateWithDuration:animations:completion:", v11, v9, a3);
  }
}

void __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = (id *)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 32) drawingBackgroundColor];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F825C8] clearColor];
    v2 = (id *)(a1 + 32);
  }
  id v4 = (id)v3;
  objc_msgSend(*v2, "setIc_backgroundColor:", v3);
}

uint64_t __64__ICDrawingInlineView_animateImageArrivalWithAnimationDuration___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return objc_msgSend(*(id *)(result + 32), "setIc_backgroundColor:", 0);
  }
  return result;
}

- (id)attachmentImage
{
  uint64_t v3 = [(ICDrawingInlineView *)self attachment];
  [MEMORY[0x263F5AC38] defaultPixelSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(ICDrawingInlineView *)self ic_appearanceInfo];
  double v9 = objc_msgSend(v3, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v8, "type"), 1, v5, v7, 1.0);

  BOOL v10 = [v9 orientedImage];

  return v10;
}

- (id)previewImage
{
  uint64_t v3 = [(ICDrawingInlineView *)self attachment];

  if (v3)
  {
    [(ICDrawingInlineView *)self ic_backingScaleFactor];
    double v5 = v4;
    [MEMORY[0x263F5AC38] defaultSize];
    double v7 = v6;
    double v9 = v8;
    BOOL v10 = [(ICDrawingInlineView *)self attachment];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    [(ICDrawingInlineView *)self frame];
    double v16 = v15;
    double v18 = v17;
    if ([(ICDrawingInlineView *)self thumbnailDisplay])
    {
      double v19 = fmax(v16, 256.0);
      if (v12 >= v16) {
        double v20 = v16;
      }
      else {
        double v20 = v19;
      }
      double v21 = fmax(v18, 256.0);
      if (v14 >= v18) {
        double v22 = v18;
      }
      else {
        double v22 = v21;
      }
    }
    else
    {
      double v24 = [(ICDrawingInlineView *)self attachment];
      [v24 orientation];
      int IsLandscape = ICDrawingOrientationIsLandscape();

      double v26 = v7 / v12;
      double v27 = v9 / v14;
      if (IsLandscape)
      {
        double v20 = v26 * v16;
        double v22 = v27 * v18;
      }
      else
      {
        double v22 = v26 * v18;
        double v20 = v27 * v16;
      }
    }
    double v28 = [(ICDrawingInlineView *)self attachment];
    double v29 = [(ICDrawingInlineView *)self ic_appearanceInfo];
    CGFloat v23 = objc_msgSend(v28, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v29, "type"), 1, v20, v22, v5);
  }
  else
  {
    CGFloat v23 = 0;
  }

  return v23;
}

- (void)updateImageWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICDrawingInlineView *)self bounds];
  if (v6 != *MEMORY[0x263F001B0] || v5 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v8 = [(ICDrawingInlineView *)self previewImage];
    if (v8)
    {
      if ([(ICDrawingInlineView *)self forManualRendering])
      {
        double v9 = [v8 image];
        [(ICDrawingInlineView *)self updateLayerImage:v9 animation:0];
      }
      else
      {
        BOOL v10 = [(ICDrawingInlineView *)self imageLoadingCancelBlock];

        if (v10)
        {
          [(ICDrawingInlineView *)self setNeedsToUpdateImage:1];
        }
        else
        {
          if (![(ICDrawingInlineView *)self hasImage]
            && ([(ICDrawingInlineView *)self thumbnailDisplay] || v3))
          {
            [MEMORY[0x263F158F8] begin];
            [MEMORY[0x263F158F8] setDisableActions:1];
            [MEMORY[0x263F158F8] setAnimationDuration:0.0];
            [(ICDrawingInlineView *)self imageFrame];
            double v12 = v11;
            double v14 = v13;
            double v16 = v15;
            double v18 = v17;
            double v19 = [(ICDrawingInlineView *)self imageLayer];
            objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

            id v20 = [(ICDrawingInlineView *)self borderColor];
            uint64_t v21 = [v20 CGColor];
            double v22 = [(ICDrawingInlineView *)self layer];
            [v22 setBorderColor:v21];

            [(ICDrawingInlineView *)self updateBorderWidth];
            CGFloat v23 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.04];
            [(ICDrawingInlineView *)self setIc_backgroundColor:v23];

            [MEMORY[0x263F158F8] commit];
          }
          v36[0] = 0;
          v36[1] = v36;
          v36[2] = 0x2020000000;
          char v37 = 0;
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke;
          v34[3] = &unk_2640BBCD0;
          v34[4] = self;
          v34[5] = v36;
          BOOL v35 = v3;
          double v24 = [v8 asyncImage:v34 aboutToLoadHandler:0];
          CGFloat v25 = (void *)[v24 copy];

          if (v25)
          {
            uint64_t v27 = MEMORY[0x263EF8330];
            uint64_t v28 = 3221225472;
            double v29 = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_4;
            v30 = &unk_2640BBCF8;
            v33 = v36;
            v31 = self;
            id v32 = v25;
            double v26 = _Block_copy(&v27);
            -[ICDrawingInlineView setImageLoadingCancelBlock:](self, "setImageLoadingCancelBlock:", v26, v27, v28, v29, v30);
          }
          _Block_object_dispose(v36, 8);
        }
      }
    }
  }
}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_2;
  v5[3] = &unk_2640BBCA8;
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 48);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(void *)(a1 + 32))
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      v2 = *(void **)(a1 + 32);
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_3;
      v5[3] = &unk_2640BBC80;
      objc_copyWeak(&v6, &location);
      char v7 = *(unsigned char *)(a1 + 56);
      objc_msgSend(v2, "ic_decodeWithCompletion:", v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      id v3 = *(void **)(a1 + 40);
      uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
      [v3 updateLayerImage:0 animation:v4];
    }
  }
}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained updateLayerImage:v5 animation:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __48__ICDrawingInlineView_updateImageWithAnimation___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  if (([*(id *)(a1 + 32) thumbnailDisplay] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) layer];
    [v2 setBorderColor:0];

    id v3 = [*(id *)(a1 + 32) layer];
    [v3 setBorderWidth:0.0];
  }
  char v4 = [*(id *)(a1 + 32) shouldUseLightDrawingBackground];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 drawingBackgroundColor];
    objc_msgSend(*(id *)(a1 + 32), "setIc_backgroundColor:", v6);
  }
  else
  {
    objc_msgSend(v5, "setIc_backgroundColor:", 0);
  }
  [MEMORY[0x263F158F8] commit];
  [*(id *)(a1 + 32) setNeedsToUpdateImage:0];
  id v7 = [*(id *)(a1 + 32) previewImageUpdateDelayer];
  [v7 cancelPreviousFireRequests];
}

- (BOOL)hasImage
{
  v2 = [(ICDrawingInlineView *)self imageLayer];
  id v3 = [v2 contents];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)updateLayerImage:(id)a3 animation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICDrawingInlineView *)self setImageLoadingCancelBlock:0];
  unint64_t v7 = 0x263F15000uLL;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  char v8 = [(ICDrawingInlineView *)self attachment];
  uint64_t v9 = (int)[v8 orientation];

  [MEMORY[0x263F5AC38] defaultSizeOrientationTransform:v9];
  BOOL v10 = [(ICDrawingInlineView *)self imageLayer];
  v64[0] = *(_OWORD *)((char *)&v64[3] + 8);
  v64[1] = *(_OWORD *)((char *)&v64[4] + 8);
  v64[2] = *(_OWORD *)((char *)&v64[5] + 8);
  [v10 setAffineTransform:v64];

  [(ICDrawingInlineView *)self imageFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(ICDrawingInlineView *)self imageLayer];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  [MEMORY[0x263F158F8] commit];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  double v20 = 0.1;
  if (!v4) {
    double v20 = 0.0;
  }
  [MEMORY[0x263F158F8] setAnimationDuration:v20];
  uint64_t v21 = [(ICDrawingInlineView *)self attachment];
  double v22 = [v21 previewUpdateDate];
  CGFloat v23 = [(ICDrawingInlineView *)self attachment];
  double v24 = [v23 modificationDate];
  uint64_t v25 = [v22 compare:v24];

  if (v4) {
    int v26 = ![(ICDrawingInlineView *)self hasImage];
  }
  else {
    int v26 = 0;
  }
  uint64_t v27 = [(ICDrawingInlineView *)self attachment];
  [MEMORY[0x263F5AC38] defaultPixelSize];
  double v29 = v28;
  double v31 = v30;
  id v32 = [(ICDrawingInlineView *)self ic_appearanceInfo];
  v33 = objc_msgSend(v27, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v32, "type"), 1, v29, v31, 1.0);

  if ((v6 || v25 != -1)
    && (v33
     || ([0 size],
         double v39 = v38,
         double v41 = v40,
         [MEMORY[0x263F5AC38] defaultPixelSize],
         v39 == v43)
     && v41 == v42))
  {
    BOOL v44 = [(ICDrawingInlineView *)self thumbnailDisplay];
    double v36 = objc_msgSend(v6, "ic_CGImage");
    if (!v44)
    {
      double v50 = [(ICDrawingInlineView *)self layer];
      [v50 setBorderColor:0];

      CGFloat v51 = [(ICDrawingInlineView *)self layer];
      [v51 setBorderWidth:0.0];

      goto LABEL_18;
    }
    BOOL v34 = v4;
    BOOL v35 = v33;
    int v37 = 0;
  }
  else
  {
    BOOL v34 = v4;
    BOOL v35 = v33;
    double v36 = objc_msgSend(v6, "ic_CGImage");
    int v37 = 1;
  }
  id v45 = [(ICDrawingInlineView *)self borderColor];
  uint64_t v46 = [v45 CGColor];
  v47 = [(ICDrawingInlineView *)self layer];
  [v47 setBorderColor:v46];

  [(ICDrawingInlineView *)self updateBorderWidth];
  if (v37)
  {
    double v48 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.04];
    [(ICDrawingInlineView *)self setIc_backgroundColor:v48];

    [(ICDrawingInlineView *)self observePreviewGenerationProgress:0];
    float v49 = *(float *)"333?";
    v33 = v35;
    BOOL v4 = v34;
    unint64_t v7 = 0x263F15000;
    goto LABEL_22;
  }
  v33 = v35;
  BOOL v4 = v34;
  unint64_t v7 = 0x263F15000;
LABEL_18:
  if ([(ICDrawingInlineView *)self shouldUseLightDrawingBackground])
  {
    double v52 = [(ICDrawingInlineView *)self drawingBackgroundColor];
    [(ICDrawingInlineView *)self setIc_backgroundColor:v52];
  }
  else
  {
    [(ICDrawingInlineView *)self setIc_backgroundColor:0];
  }
  double v53 = [(ICDrawingInlineView *)self loadingProgressLayer];
  [v53 removeFromSuperlayer];

  [(ICDrawingInlineView *)self setLoadingProgressLayer:0];
  float v49 = 1.0;
LABEL_22:
  if (!(v26 | !v4))
  {
    double v55 = (void *)MEMORY[0x263F82E00];
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    CGAffineTransform v60 = __50__ICDrawingInlineView_updateLayerImage_animation___block_invoke;
    CGRect v61 = &unk_2640B82D8;
    CGRect v62 = self;
    id v63 = v36;
    objc_msgSend(v55, "ic_animateWithDuration:animations:completion:", &v58, 0, 0.3);

    if (!v6) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  double v54 = [(ICDrawingInlineView *)self imageLayer];
  [v54 setContents:v36];

  if (v6)
  {
LABEL_26:
    double v56 = [(ICDrawingInlineView *)self imageLayer];
    *(float *)&double v57 = v49;
    [v56 setOpacity:v57];
  }
LABEL_27:
  objc_msgSend(*(id *)(v7 + 2296), "commit", v58, v59, v60, v61, v62);
  if ([(ICDrawingInlineView *)self needsToUpdateImage])
  {
    [(ICDrawingInlineView *)self setNeedsToUpdateImage:0];
    [(ICDrawingInlineView *)self updateImageWithAnimation:v4];
  }
}

void __50__ICDrawingInlineView_updateLayerImage_animation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageLayer];
  [v2 setContents:v1];
}

- (BOOL)isReadyToPresent
{
  id v2 = [(ICDrawingInlineView *)self loadingProgressLayer];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)didScrollOutOfVisibleRange
{
  BOOL v3 = [(ICDrawingInlineView *)self imageLoadingCancelBlock];

  if (v3)
  {
    BOOL v4 = [(ICDrawingInlineView *)self imageLoadingCancelBlock];
    v4[2]();

    [(ICDrawingInlineView *)self setImageLoadingCancelBlock:0];
  }
  id v5 = [(ICDrawingInlineView *)self imageLayer];
  [v5 setContents:0];

  id v6 = [(ICDrawingInlineView *)self previewImageUpdateDelayer];
  [v6 cancelPreviousFireRequests];
}

- (void)didScrollIntoVisibleRange
{
  if (![(ICDrawingInlineView *)self hasImage])
  {
    [(ICDrawingInlineView *)self updateImageWithAnimation:1];
  }
}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  uint64_t v3 = [(ICDrawingInlineView *)self imageLoadingCancelBlock];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    BOOL v5 = [(ICDrawingInlineView *)self hasImage];

    if (v5)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      id v6 = [(ICDrawingInlineView *)self imageLoadingCancelBlock];
      v6[2]();

      [(ICDrawingInlineView *)self setImageLoadingCancelBlock:0];
      unint64_t v7 = [(ICDrawingInlineView *)self previewImageUpdateDelayer];
      [v7 cancelPreviousFireRequests];

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v8 = [(ICDrawingInlineView *)self loadingProgressLayer];

  if (v8)
  {
    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    CGFloat v9 = CGRectGetMaxX(v15) + -21.0;
    v16.origin.double x = x;
    v16.origin.double y = y;
    v16.size.double width = width;
    v16.size.double height = height;
    CGFloat v10 = CGRectGetMaxY(v16) + -21.0;
    double v11 = [(ICDrawingInlineView *)self loadingProgressLayer];
    objc_msgSend(v11, "setPosition:", v9, v10);
  }
  [(ICDrawingInlineView *)self frame];
  double v12 = v17.size.width;
  double v13 = v17.size.height;
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v17, v18))
  {
    v14.receiver = self;
    v14.super_class = (Class)ICDrawingInlineView;
    -[ICDrawingInlineView setFrame:](&v14, sel_setFrame_, x, y, width, height);
    if (v12 != width || v13 != height) {
      [(ICDrawingInlineView *)self updateImageWithAnimation:1];
    }
  }
}

- (void)didMoveToWindow
{
  if ([(ICDrawingInlineView *)self thumbnailDisplay])
  {
    [(ICDrawingInlineView *)self updateBorderWidth];
  }
}

- (void)updateBorderWidth
{
  if ([(ICDrawingInlineView *)self thumbnailDisplay])
  {
    [(ICDrawingInlineView *)self ic_backingScaleFactor];
    double v4 = 1.0 / v3;
    BOOL v5 = [(ICDrawingInlineView *)self layer];
    id v7 = v5;
    double v6 = v4;
  }
  else
  {
    BOOL v5 = [(ICDrawingInlineView *)self layer];
    double v6 = 1.0;
    id v7 = v5;
  }
  [v5 setBorderWidth:v6];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ICDrawingInlineView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)ICDrawingInlineView;
  -[ICDrawingInlineView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(ICDrawingInlineView *)self updateImageWithAnimation:1];
  }
}

- (void)observePreviewGenerationProgress:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(ICDrawingInlineView *)self hideLoadingProgress];
  id v5 = v11;
  if (!v4)
  {
    double v6 = [(ICDrawingInlineView *)self loadingProgressLayer];

    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F5B3A0]);
      [(ICDrawingInlineView *)self bounds];
      CGFloat v8 = CGRectGetMaxX(v13) + -21.0;
      [(ICDrawingInlineView *)self bounds];
      objc_msgSend(v7, "setPosition:", v8, CGRectGetMaxY(v14) + -21.0);
      [v7 setZPosition:1.0];
      [v7 setRemoveOnCompletion:1];
      double v9 = [(ICDrawingInlineView *)self layer];
      [v9 addSublayer:v7];

      [(ICDrawingInlineView *)self setLoadingProgressLayer:v7];
    }
    id v5 = v11;
    if (v11)
    {
      double v10 = [(ICDrawingInlineView *)self loadingProgressLayer];
      [v10 setObservedProgress:v11];

      id v5 = v11;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)attachmentPreviewImagesDidUpdate:(id)a3
{
  id v3 = [(ICDrawingInlineView *)self previewImageUpdateDelayer];
  [v3 requestFire];
}

- (void)attachmentPreviewDidStart:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];

  double v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5A970]];
  id v7 = ICDynamicCast();

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__ICDrawingInlineView_attachmentPreviewDidStart___block_invoke;
  v9[3] = &unk_2640B82D8;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __49__ICDrawingInlineView_attachmentPreviewDidStart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observePreviewGenerationProgress:*(void *)(a1 + 40)];
}

- (void)delayedPreviewImageChanged
{
  if ([(ICDrawingInlineView *)self isVisibleWithinScrollView])
  {
    [(ICDrawingInlineView *)self updateImageWithAnimation:1];
  }
}

- (BOOL)isVisibleWithinScrollView
{
  id v3 = [(ICDrawingInlineView *)self lowestSuperScrollView];
  if (v3)
  {
    [(ICDrawingInlineView *)self bounds];
    -[ICDrawingInlineView convertRect:toView:](self, "convertRect:toView:", v3);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [v3 bounds];
    v15.origin.double x = v5;
    v15.origin.double y = v7;
    v15.size.double width = v9;
    v15.size.double height = v11;
    BOOL v12 = CGRectIntersectsRect(v14, v15);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)lowestSuperScrollView
{
  id v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [(ICDrawingInlineView *)v2 superview];

      id v2 = (ICDrawingInlineView *)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return v2;
}

- (void)registerForTraitChanges
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__ICDrawingInlineView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_2640BBD20;
  void v5[4] = self;
  id v4 = (id)[(ICDrawingInlineView *)self registerForTraitChanges:v3 withHandler:v5];
}

void __46__ICDrawingInlineView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateImageWithAnimation:1];
  char v2 = [*(id *)(a1 + 32) shouldUseLightDrawingBackground];
  if ([*(id *)(a1 + 32) hasImage])
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v2)
    {
      id v4 = [v3 drawingBackgroundColor];
      [*(id *)(a1 + 32) setBackgroundColor:v4];
    }
    else
    {
      [v3 setBackgroundColor:0];
    }
  }
}

- (BOOL)thumbnailDisplay
{
  return self->_thumbnailDisplay;
}

- (void)setThumbnailDisplay:(BOOL)a3
{
  self->_thumbnailDispladouble y = a3;
}

- (BOOL)hideLoadingProgress
{
  return self->_hideLoadingProgress;
}

- (void)setHideLoadingProgress:(BOOL)a3
{
  self->_hideLoadingProgress = a3;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)showGotoNote
{
  return self->_showGotoNote;
}

- (void)setShowGotoNote:(BOOL)a3
{
  self->_showGotoNote = a3;
}

- (CGSize)attachmentContentSize
{
  double width = self->_attachmentContentSize.width;
  double height = self->_attachmentContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAttachmentContentSize:(CGSize)a3
{
  self->_attachmentContentSize = a3;
}

- (BOOL)isInAttachmentBrowser
{
  return self->_isInAttachmentBrowser;
}

- (void)setIsInAttachmentBrowser:(BOOL)a3
{
  self->_isInAttachmentBrowser = a3;
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (BOOL)fullscreen
{
  return self->_fullscreen;
}

- (void)setFullscreen:(BOOL)a3
{
  self->_fullscreen = a3;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (void)setForManualRendering:(BOOL)a3
{
  self->_forManualRendering = a3;
}

- (id)imageLoadingCancelBlock
{
  return self->_imageLoadingCancelBlock;
}

- (void)setImageLoadingCancelBlock:(id)a3
{
}

- (BOOL)needsToUpdateImage
{
  return self->_needsToUpdateImage;
}

- (void)setNeedsToUpdateImage:(BOOL)a3
{
  self->_needsToUpdateImage = a3;
}

- (ICSelectorDelayer)previewImageUpdateDelayer
{
  return self->_previewImageUpdateDelayer;
}

- (void)setPreviewImageUpdateDelayer:(id)a3
{
}

- (ICLoadingPieLayer)loadingProgressLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingProgressLayer);

  return (ICLoadingPieLayer *)WeakRetained;
}

- (void)setLoadingProgressLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_loadingProgressLayer);
  objc_storeStrong((id *)&self->_previewImageUpdateDelayer, 0);
  objc_storeStrong(&self->_imageLoadingCancelBlock, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);

  objc_storeStrong((id *)&self->_attachment, 0);
}

@end