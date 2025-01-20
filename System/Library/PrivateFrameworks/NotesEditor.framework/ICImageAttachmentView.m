@interface ICImageAttachmentView
+ (double)ICLoadingPlaceholderIconSize;
+ (id)ICLoadingPlaceholderBackgroundColor;
+ (id)ICLoadingPlaceholderIconColor;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)cancelDidScrollIntoVisibleRange;
- (BOOL)isAttachmentEditable;
- (BOOL)isThumbnailView;
- (BOOL)shouldShowLoadingImage;
- (BOOL)shouldTryToReloadImageIfLoadingFails;
- (BOOL)shouldUpdateLayoutInImageDidLoad;
- (BOOL)showLoadingImage;
- (CALayer)imageLayer;
- (CGRect)frameForContent;
- (CGRect)imageFrame;
- (CGSize)imageSize;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIImageView)loadingImageView;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)icaxHintString;
- (id)imageContentsGravity;
- (id)imageLoadingCancelBlock;
- (void)animateImageArrival;
- (void)dealloc;
- (void)didChangeAttachment;
- (void)didChangeMedia;
- (void)didMoveToWindow;
- (void)didScrollOutOfVisibleRange;
- (void)didUpdatePreviewImages;
- (void)imageDidLoad:(id)a3 shouldFade:(BOOL)a4;
- (void)prepareForPrinting;
- (void)refreshLoadingImage;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageLayer:(id)a3;
- (void)setImageLoadingCancelBlock:(id)a3;
- (void)setLoadingImageView:(id)a3;
- (void)setShouldShowLoadingImage:(BOOL)a3;
- (void)setShouldTryToReloadImageIfLoadingFails:(BOOL)a3;
- (void)setShouldUpdateLayoutInImageDidLoad:(BOOL)a3;
- (void)setShowLoadingImage:(BOOL)a3;
- (void)setupBorderForLayer:(id)a3;
- (void)setupEventHandling;
- (void)setupImagePlaceholder;
- (void)setupImagePlaceholderIfNecessary;
- (void)sharedInit:(BOOL)a3;
- (void)updateImageInView:(BOOL)a3;
- (void)updateImageInViewIfNecessary;
- (void)updateImageSize;
@end

@implementation ICImageAttachmentView

void __44__ICImageAttachmentView_animateImageArrival__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F825C8] clearColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

uint64_t __43__ICImageAttachmentView_updateImageInView___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupImagePlaceholderIfNecessary];
}

uint64_t __44__ICImageAttachmentView_animateImageArrival__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:0];
}

- (void)didMoveToWindow
{
  v3 = [(ICImageAttachmentView *)self window];
  v4 = [v3 screen];

  if (v4)
  {
    id v9 = [(ICImageAttachmentView *)self window];
    v5 = [v9 screen];
    [v5 scale];
    double v7 = v6;
    v8 = [(ICImageAttachmentView *)self imageLayer];
    [v8 setContentsScale:v7];
  }
}

- (void)didChangeAttachment
{
  v3.receiver = self;
  v3.super_class = (Class)ICImageAttachmentView;
  [(ICImageAttachmentView *)&v3 didChangeAttachment];
  [(ICImageAttachmentView *)self updateImageInViewIfNecessary];
}

- (void)updateImageInViewIfNecessary
{
  objc_super v3 = [(ICImageAttachmentView *)self imageLoadingCancelBlock];

  if (v3)
  {
    [(ICImageAttachmentView *)self setShouldTryToReloadImageIfLoadingFails:1];
  }
  else
  {
    [(ICImageAttachmentView *)self updateImageInView:0];
  }
}

- (id)imageLoadingCancelBlock
{
  return self->_imageLoadingCancelBlock;
}

- (void)setupImagePlaceholderIfNecessary
{
  objc_super v3 = [(ICImageAttachmentView *)self imageLayer];
  v4 = [v3 contents];

  if (!v4)
  {
    [(ICImageAttachmentView *)self setupImagePlaceholder];
  }
}

- (void)setHighlightColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICImageAttachmentView;
  [(ICImageAttachmentView *)&v5 setHighlightColor:a3];
  v4 = [(ICImageAttachmentView *)self imageLayer];
  [(ICImageAttachmentView *)self setupBorderForLayer:v4];
}

- (void)setupImagePlaceholder
{
  objc_super v3 = [(id)objc_opt_class() ICLoadingPlaceholderBackgroundColor];
  [(ICImageAttachmentView *)self setIc_backgroundColor:v3];

  v4 = [(ICImageAttachmentView *)self imageLayer];
  [(ICImageAttachmentView *)self setupBorderForLayer:v4];

  [(ICImageAttachmentView *)self setShouldShowLoadingImage:1];

  [(ICImageAttachmentView *)self refreshLoadingImage];
}

- (void)animateImageArrival
{
  objc_super v3 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v3 setFromValue:&unk_26C139180];
  [v3 setToValue:&unk_26C139190];
  [v3 setDuration:0.1];
  v4 = [(ICImageAttachmentView *)self imageLayer];
  [v4 addAnimation:v3 forKey:@"opacity"];

  [(ICImageAttachmentView *)self setShowLoadingImage:0];
  objc_super v5 = [(ICImageAttachmentView *)self ic_backgroundColor];

  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__ICImageAttachmentView_animateImageArrival__block_invoke;
    v7[3] = &unk_2640B8140;
    v7[4] = self;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__ICImageAttachmentView_animateImageArrival__block_invoke_2;
    v6[3] = &unk_2640B93C0;
    v6[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v7 animations:v6 completion:0.1];
  }
}

- (BOOL)showLoadingImage
{
  id v2 = [(ICImageAttachmentView *)self loadingImageView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setShowLoadingImage:(BOOL)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v4 = [(ICImageAttachmentView *)self showLoadingImage];
    objc_super v5 = (void *)MEMORY[0x263F827E8];
    double v6 = [(ICImageAttachmentView *)self attachment];
    double v7 = [v6 attachmentModel];
    v8 = [v7 placeholderImageSystemName];
    [(id)objc_opt_class() ICLoadingPlaceholderIconSize];
    id v9 = objc_msgSend(v5, "ic_systemImageNamed:pointSize:", v8);

    if (!v4)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v9];
      [v10 setContentMode:4];
      v11 = [(id)objc_opt_class() ICLoadingPlaceholderIconColor];
      [v10 setTintColor:v11];

      [(ICImageAttachmentView *)self setLoadingImageView:v10];
      v12 = [(ICImageAttachmentView *)self loadingImageView];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

      v13 = [(ICImageAttachmentView *)self loadingImageView];
      [(ICImageAttachmentView *)self addSubview:v13];

      v24 = @"loadingImage";
      v14 = [(ICImageAttachmentView *)self loadingImageView];
      v25[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

      v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[loadingImage]-|" options:0 metrics:0 views:v15];
      v17 = (void *)MEMORY[0x263F08938];
      v18 = [(ICImageAttachmentView *)self loadingImageView];
      v19 = [v17 constraintWithItem:v18 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];

      v20 = (void *)MEMORY[0x263F08938];
      v21 = [v16 arrayByAddingObject:v19];
      [v20 activateConstraints:v21];
    }
  }
  else
  {
    -[ICImageAttachmentView setShouldShowLoadingImage:](self, "setShouldShowLoadingImage:");
    v22 = [(ICImageAttachmentView *)self loadingImageView];

    if (v22)
    {
      v23 = [(ICImageAttachmentView *)self loadingImageView];
      [v23 removeFromSuperview];

      [(ICImageAttachmentView *)self setLoadingImageView:0];
    }
  }
}

- (UIImageView)loadingImageView
{
  return self->_loadingImageView;
}

- (void)setShouldShowLoadingImage:(BOOL)a3
{
  self->_shouldShowLoadingImage = a3;
}

- (void)setLoadingImageView:(id)a3
{
}

+ (double)ICLoadingPlaceholderIconSize
{
  return 80.0;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICImageAttachmentView;
  -[ICImageAttachmentView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ICImageAttachmentView *)self updateImageSize];
  [(ICImageAttachmentView *)self refreshLoadingImage];
}

- (void)imageDidLoad:(id)a3 shouldFade:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICImageAttachmentView *)self setImageLoadingCancelBlock:0];
  [(ICImageAttachmentView *)self imageSize];
  if (v6)
  {
    [(ICImageAttachmentView *)self setShouldTryToReloadImageIfLoadingFails:0];
    if ([(ICImageAttachmentView *)self shouldUpdateLayoutInImageDidLoad])
    {
      [(ICImageAttachmentView *)self setShouldUpdateLayoutInImageDidLoad:0];
      id v9 = [(ICImageAttachmentView *)self attachment];
      v10 = [v9 note];
      v11 = [(ICImageAttachmentView *)self attachment];
      uint64_t v12 = [v10 rangeForAttachment:v11];
      uint64_t v14 = v13;

      LODWORD(v9) = ICInternalSettingsIsTextKit2Enabled();
      v15 = [(ICAttachmentView *)self textView];
      v16 = v15;
      if (v9)
      {
        v17 = [v15 textLayoutManager];
        v18 = objc_msgSend(v17, "ic_textRangeForRange:", v12, v14);

        v19 = [(ICAttachmentView *)self textView];
        v20 = [v19 textLayoutManager];
        [v20 invalidateLayoutForRange:v18];
      }
      else
      {
        v25 = [v15 layoutManager];
        objc_msgSend(v25, "invalidateLayoutForCharacterRange:actualCharacterRange:", v12, v14, 0);

        v18 = [(ICAttachmentView *)self textView];
        v19 = [v18 layoutManager];
        objc_msgSend(v19, "invalidateDisplayForCharacterRange:", v12, v14);
      }
    }
    [(ICImageAttachmentView *)self setImage:v6];
    uint64_t v26 = objc_msgSend(v6, "ic_CGImage");
    v27 = [(ICImageAttachmentView *)self imageLayer];
    [v27 setContents:v26];

    switch([v6 imageOrientation])
    {
      case 1:
        long long v38 = 0uLL;
        double v28 = 0.0;
        double v29 = -1.0;
        double v30 = 0.0;
        double v31 = -1.0;
        break;
      case 2:
        long long v38 = 0uLL;
        double v30 = -1.0;
        double v28 = 1.0;
        goto LABEL_17;
      case 3:
        long long v38 = 0uLL;
        double v30 = 1.0;
        double v28 = -1.0;
LABEL_17:
        double v29 = 0.0;
        goto LABEL_23;
      case 4:
        long long v38 = 0uLL;
        double v31 = -1.0;
        double v28 = 0.0;
        double v29 = 1.0;
        goto LABEL_20;
      case 5:
        long long v38 = 0uLL;
        double v31 = 1.0;
        double v28 = 0.0;
        double v29 = -1.0;
LABEL_20:
        double v30 = 0.0;
        break;
      case 6:
        long long v38 = 0uLL;
        double v28 = 1.0;
        double v29 = 0.0;
        double v30 = 1.0;
        goto LABEL_23;
      case 7:
        long long v38 = 0uLL;
        double v28 = -1.0;
        double v29 = 0.0;
        double v30 = -1.0;
LABEL_23:
        double v31 = 0.0;
        break;
      default:
        double v31 = *MEMORY[0x263F000D0];
        double v30 = *(double *)(MEMORY[0x263F000D0] + 8);
        double v28 = *(double *)(MEMORY[0x263F000D0] + 16);
        double v29 = *(double *)(MEMORY[0x263F000D0] + 24);
        long long v38 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        break;
    }
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    long long v37 = v38;
    v32 = [(ICImageAttachmentView *)self imageLayer];
    *(double *)v36 = v31;
    *(double *)&v36[1] = v30;
    *(double *)&v36[2] = v28;
    *(double *)&v36[3] = v29;
    [v32 setAffineTransform:v36];

    [MEMORY[0x263F158F8] commit];
    goto LABEL_25;
  }
  double v21 = v7;
  double v22 = v8;
  if ([(ICImageAttachmentView *)self shouldTryToReloadImageIfLoadingFails])
  {
    [(ICImageAttachmentView *)self setShouldTryToReloadImageIfLoadingFails:0];
    [(ICImageAttachmentView *)self updateImageInViewIfNecessary];
    goto LABEL_32;
  }
  if (v21 != 0.0 && v22 != 0.0)
  {
    [(ICImageAttachmentView *)self setShouldTryToReloadImageIfLoadingFails:0];
    [(ICImageAttachmentView *)self setImage:0];
    uint64_t v23 = objc_msgSend(0, "ic_CGImage");
    v24 = [(ICImageAttachmentView *)self imageLayer];
    [v24 setContents:v23];

LABEL_25:
    v33 = [(ICImageAttachmentView *)self imageContentsGravity];
    v34 = [(ICImageAttachmentView *)self imageLayer];
    [v34 setContentsGravity:v33];

    if (v6)
    {
      if (v4
        && ([(ICImageAttachmentView *)self ic_backgroundColor],
            v35 = objc_claimAutoreleasedReturnValue(),
            v35,
            v35))
      {
        [(ICImageAttachmentView *)self animateImageArrival];
      }
      else
      {
        [(ICImageAttachmentView *)self setIc_backgroundColor:0];
        [(ICImageAttachmentView *)self setShowLoadingImage:0];
      }
    }
    else
    {
      [(ICImageAttachmentView *)self setupImagePlaceholder];
    }
    [(ICImageAttachmentView *)self updateImageSize];
  }
LABEL_32:
}

- (BOOL)shouldUpdateLayoutInImageDidLoad
{
  return self->_shouldUpdateLayoutInImageDidLoad;
}

- (void)sharedInit:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ICImageAttachmentView;
  [(ICAttachmentView *)&v19 sharedInit:a3];
  BOOL v4 = [(ICImageAttachmentView *)self imageLayer];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(ICImageAttachmentView *)self setImageLayer:v5];

    [(ICImageAttachmentView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(ICImageAttachmentView *)self imageLayer];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    v15 = [(ICImageAttachmentView *)self imageLayer];
    [v15 setMasksToBounds:1];

    v16 = [(ICImageAttachmentView *)self imageLayer];
    [v16 setAllowsEdgeAntialiasing:0];

    v17 = [(ICImageAttachmentView *)self layer];
    v18 = [(ICImageAttachmentView *)self imageLayer];
    [v17 addSublayer:v18];

    [(ICImageAttachmentView *)self setClipsToBounds:1];
  }
}

- (void)updateImageSize
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  [(ICImageAttachmentView *)self imageFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(ICImageAttachmentView *)self imageLayer];
  [(ICImageAttachmentView *)self setupBorderForLayer:v11];

  char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  double v13 = [(ICImageAttachmentView *)self imageLayer];
  uint64_t v14 = v13;
  if (IsTextKit2Enabled)
  {
    objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

    v15 = (void *)MEMORY[0x263F158F8];
    [v15 commit];
    return;
  }
  [v13 frame];
  if (TSDNearlyEqualSizes())
  {
    v16 = [(ICImageAttachmentView *)self imageLayer];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    double v21 = *MEMORY[0x263F001B0];
    double v22 = *(double *)(MEMORY[0x263F001B0] + 8);

    uint64_t v23 = [(ICImageAttachmentView *)self imageLayer];
    objc_msgSend(v23, "setFrame:", v4, v6, v8, v10);

    [MEMORY[0x263F158F8] commit];
    if (v18 != v21 || v20 != v22) {
      return;
    }
  }
  else
  {

    v25 = [(ICImageAttachmentView *)self imageLayer];
    objc_msgSend(v25, "setFrame:", v4, v6, v8, v10);

    [MEMORY[0x263F158F8] commit];
  }
  if ([(ICAttachmentView *)self finishedInit])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__ICImageAttachmentView_updateImageSize__block_invoke;
    block[3] = &unk_2640B8140;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (CALayer)imageLayer
{
  return (CALayer *)objc_getProperty(self, a2, 528, 1);
}

- (void)setupBorderForLayer:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v4 = [(ICImageAttachmentView *)self highlightColor];

  if (v4)
  {
    id v5 = [(ICImageAttachmentView *)self highlightColor];
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v5, "CGColor"));

    [v8 setBorderWidth:*MEMORY[0x263F5B058]];
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)components = xmmword_20C1796A0;
    double v7 = CGColorCreate(DeviceGray, components);
    [v8 setBorderColor:v7];
    [(ICImageAttachmentView *)self ic_hairlineWidth];
    objc_msgSend(v8, "setBorderWidth:");

    CGColorRelease(v7);
    CGColorSpaceRelease(DeviceGray);
  }
}

- (CGRect)imageFrame
{
  [(ICImageAttachmentView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  if (v8 != 0.0
    && v3 != 0.0
    && [(ICImageAttachmentView *)self isThumbnailView]
    && ![(ICAttachmentView *)self forManualRendering])
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      double v11 = [(ICImageAttachmentView *)self textAttachment];
      double v12 = [(ICAttachmentView *)self textContainer];
      [v11 attachmentSizeForTextContainer:v12];
      double v14 = v13;
      double v16 = v15;
    }
    else
    {
      [(ICImageAttachmentView *)self attachmentContentSize];
      double v14 = v17;
      double v16 = v18;
    }
    double v19 = (v9 - v14) * 0.5;
    if (v14 < v9)
    {
      double v9 = v14;
      double v5 = v19;
    }
    double v20 = (v10 - v16) * 0.5;
    if (v16 < v10)
    {
      double v10 = v16;
      double v7 = v20;
    }
  }
  double v21 = v5;
  double v22 = v7;
  double v23 = v9;
  double v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setShouldTryToReloadImageIfLoadingFails:(BOOL)a3
{
  self->_shouldTryToReloadImageIfLoadingFails = a3;
}

- (void)setImageLayer:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (CGSize)imageSize
{
  [(ICImageAttachmentView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)imageContentsGravity
{
  return (id)*MEMORY[0x263F15E20];
}

- (void)updateImageInView:(BOOL)a3
{
  [(ICImageAttachmentView *)self setImageLoadingCancelBlock:0];
  double v5 = [(ICImageAttachmentView *)self attachment];
  [v5 sizeWidth];
  if (v6 == 0.0)
  {

    goto LABEL_5;
  }
  double v7 = [(ICImageAttachmentView *)self attachment];
  [v7 sizeHeight];
  double v9 = v8;

  if (v9 == 0.0) {
LABEL_5:
  }
    [(ICImageAttachmentView *)self setShouldUpdateLayoutInImageDidLoad:1];
  BOOL v10 = [(ICAttachmentView *)self forManualRendering];
  double v11 = [(ICImageAttachmentView *)self attachment];
  double v12 = v11;
  if (v10)
  {
    id v37 = [v11 image];

    [(ICImageAttachmentView *)self imageDidLoad:v37 shouldFade:0];

    return;
  }
  [v11 intrinsicContentSize];
  double v14 = v13;
  double v16 = v15;

  [MEMORY[0x263F5B4D0] defaultAttachmentThumbnailViewHeight];
  double v18 = v17;
  double v19 = [(ICImageAttachmentView *)self textAttachment];
  if (([v19 supportsMultiplePresentationSizes] & 1) == 0)
  {

LABEL_18:
    v35 = [(ICImageAttachmentView *)self attachment];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_3;
    v39[3] = &unk_2640B9BD8;
    v39[4] = self;
    BOOL v40 = a3;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_5;
    v38[3] = &unk_2640B8140;
    v38[4] = self;
    v36 = [v35 loadImage:v39 aboutToLoadHandler:v38 forceFullSizeImage:0];
    [(ICImageAttachmentView *)self setImageLoadingCancelBlock:v36];

    return;
  }
  double v20 = [(ICImageAttachmentView *)self attachment];
  int v21 = [v20 preferredViewSize];

  if (v21 != 1 || v14 <= v18 || v16 <= v18) {
    goto LABEL_18;
  }
  [MEMORY[0x263F5B4D0] defaultAttachmentThumbnailViewHeight];
  double v23 = v22;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke;
  aBlock[3] = &unk_2640B9B88;
  objc_copyWeak(&v43, location);
  BOOL v44 = a3;
  double v24 = _Block_copy(aBlock);
  id v25 = objc_alloc_init(MEMORY[0x263F5AD50]);
  [(ICImageAttachmentView *)self ic_backingScaleFactor];
  double v27 = v26;
  double v28 = [(ICImageAttachmentView *)self attachment];
  if (v27 < 1.0) {
    double v27 = 1.0;
  }
  double v29 = [(ICImageAttachmentView *)self ic_appearanceInfo];
  double v30 = [(ICImageAttachmentView *)self attachment];
  double v31 = [v30 identifier];
  v32 = [(ICImageAttachmentView *)self attachment];
  v33 = [v32 attachmentModel];
  v34 = [v33 genericBrickThumbnailCreator];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_2;
  v41[3] = &unk_2640B8140;
  v41[4] = self;
  objc_msgSend(v28, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v29, v25, v31, 0, v24, v34, v23, v23, v27, v41);

  objc_destroyWeak(&v43);
  objc_destroyWeak(location);
}

- (BOOL)isThumbnailView
{
  double v2 = [(ICImageAttachmentView *)self attachment];
  BOOL v3 = [v2 preferredViewSize] == 1;

  return v3;
}

- (void)setImageLoadingCancelBlock:(id)a3
{
}

- (void)refreshLoadingImage
{
  if (![(ICImageAttachmentView *)self isThumbnailView])
  {
    BOOL v3 = [(ICImageAttachmentView *)self attachment];
    [v3 sizeWidth];
    if (v4 <= 0.0)
    {
      BOOL v7 = 0;
    }
    else
    {
      double v5 = [(ICImageAttachmentView *)self attachment];
      [v5 sizeHeight];
      BOOL v7 = v6 > 0.0;
    }
    uint64_t v8 = [(ICImageAttachmentView *)self shouldShowLoadingImage] & v7;
    [(ICImageAttachmentView *)self setShowLoadingImage:v8];
  }
}

- (BOOL)shouldShowLoadingImage
{
  return self->_shouldShowLoadingImage;
}

- (void)setupEventHandling
{
  v2.receiver = self;
  v2.super_class = (Class)ICImageAttachmentView;
  [(ICAttachmentView *)&v2 setupEventHandling];
}

+ (id)ICLoadingPlaceholderIconColor
{
  objc_super v2 = [MEMORY[0x263F825C8] systemGrayColor];
  BOOL v3 = objc_msgSend(v2, "ic_resolvedColorForNoteEditor");

  return v3;
}

+ (id)ICLoadingPlaceholderBackgroundColor
{
  objc_super v2 = objc_msgSend(MEMORY[0x263F825C8], "ic_systemGray5Color");
  BOOL v3 = objc_msgSend(v2, "ic_resolvedColorForNoteEditor");

  return v3;
}

uint64_t __43__ICImageAttachmentView_updateImageInView___block_invoke_4(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v3 = *(unsigned __int8 *)(a1 + 49) != 0;
  }
  else {
    BOOL v3 = 1;
  }
  return [v2 imageDidLoad:*(void *)(a1 + 40) shouldFade:v3];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

void __43__ICImageAttachmentView_updateImageInView___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3 && [MEMORY[0x263F08B88] isMainThread])
  {
    [*(id *)(a1 + 32) imageDidLoad:v5 shouldFade:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__ICImageAttachmentView_updateImageInView___block_invoke_4;
    block[3] = &unk_2640B9BB0;
    block[4] = *(void *)(a1 + 32);
    id v7 = v5;
    char v8 = a3;
    char v9 = *(unsigned char *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (CGRect)frameForContent
{
  [(ICImageAttachmentView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(ICImageAttachmentView *)self imageFrame];
  double v10 = v4 + v9;
  double v12 = v6 + v11;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v12;
  result.origin.x = v10;
  return result;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICImageAttachmentView;
  [(ICAttachmentView *)&v4 dealloc];
}

uint64_t __40__ICImageAttachmentView_updateImageSize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didChangeSize];
}

- (void)didChangeMedia
{
  [(ICImageAttachmentView *)self setShouldUpdateLayoutInImageDidLoad:1];
  v3.receiver = self;
  v3.super_class = (Class)ICImageAttachmentView;
  [(ICImageAttachmentView *)&v3 didChangeMedia];
  [(ICImageAttachmentView *)self updateImageInViewIfNecessary];
}

- (void)didUpdatePreviewImages
{
  v3.receiver = self;
  v3.super_class = (Class)ICImageAttachmentView;
  [(ICImageAttachmentView *)&v3 didUpdatePreviewImages];
  [(ICImageAttachmentView *)self updateImageInViewIfNecessary];
}

- (void)didScrollOutOfVisibleRange
{
  objc_super v3 = [(ICImageAttachmentView *)self imageLoadingCancelBlock];

  if (v3)
  {
    objc_super v4 = [(ICImageAttachmentView *)self imageLoadingCancelBlock];
    v4[2]();

    [(ICImageAttachmentView *)self setImageLoadingCancelBlock:0];
  }
  id v5 = [(ICImageAttachmentView *)self imageLayer];
  [v5 setContents:0];
}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  uint64_t v3 = [(ICImageAttachmentView *)self imageLoadingCancelBlock];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    id v5 = [(ICImageAttachmentView *)self imageLayer];
    double v6 = [v5 contents];

    if (v6)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      double v7 = [(ICImageAttachmentView *)self imageLoadingCancelBlock];
      v7[2]();

      [(ICImageAttachmentView *)self setImageLoadingCancelBlock:0];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)prepareForPrinting
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 attachment];
  objc_super v4 = objc_msgSend(v3, "ic_loggingDescription");
  int v5 = 138412290;
  double v6 = v4;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Unexpected nil image for attachment (%@)", (uint8_t *)&v5, 0xCu);
}

void __43__ICImageAttachmentView_updateImageInView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained imageDidLoad:v4 shouldFade:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __43__ICImageAttachmentView_updateImageInView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupImagePlaceholderIfNecessary];
}

- (BOOL)isAttachmentEditable
{
  return 1;
}

- (UIImage)image
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_image);

  return (UIImage *)WeakRetained;
}

- (void)setShouldUpdateLayoutInImageDidLoad:(BOOL)a3
{
  self->_shouldUpdateLayoutInImageDidLoad = a3;
}

- (BOOL)shouldTryToReloadImageIfLoadingFails
{
  return self->_shouldTryToReloadImageIfLoadingFails;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingImageView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong(&self->_imageLoadingCancelBlock, 0);
  objc_destroyWeak((id *)&self->_image);

  objc_storeStrong((id *)&self->_imageLayer, 0);
}

- (id)icaxHintString
{
  objc_super v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Double tap to view full-screen" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 localizedStringForKey:@"image attachment" value:&stru_26C10E100 table:0];

  uint64_t v7 = [(ICAttachmentView *)self icaxAttachmentViewTypeDescription];
  int v5 = __ICAccessibilityStringForVariables();

  return v5;
}

- (id)accessibilityUserInputLabels
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 localizedStringForKey:@"Image" value:&stru_26C10E100 table:0];
  v8[0] = v4;
  int v5 = [(ICImageAttachmentView *)self accessibilityLabel];
  v8[1] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  return v6;
}

@end