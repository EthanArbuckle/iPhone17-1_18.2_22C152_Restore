@interface SXImageView
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)autoPlayEnabled;
- (BOOL)containsAnimatedImage;
- (BOOL)hasInterest;
- (BOOL)hasLoadedImage;
- (BOOL)isAccessibilityElement;
- (BOOL)isDecorative;
- (BOOL)isScrubbing;
- (BOOL)isVisible;
- (BOOL)objectHasQualityInterest:(id)a3 quality:(int *)a4;
- (BOOL)paused;
- (BOOL)prefersHighQuality;
- (BOOL)scrubbingEnabled;
- (BOOL)shouldResume;
- (BOOL)shouldResumeAfterLoad;
- (BOOL)shouldShowLoadingIndicator;
- (CGPoint)previousPoint;
- (CGSize)loadedImageSize;
- (CGSize)preferredImageSize;
- (CGSize)preferredQualityLoadingImageSize;
- (NSMapTable)interestTable;
- (NSString)dragIdentifier;
- (NSTimer)activeTimer;
- (SWReachabilityProvider)reachabilityProvider;
- (SXAnimatedImage)animatedImage;
- (SXImageResource)imageResource;
- (SXImageView)initWithImageResource:(id)a3 resourceDataSource:(id)a4 reachabilityProvider:(id)a5;
- (SXImageViewDelegate)delegate;
- (SXResourceDataSource)resourceDataSource;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImage)highQualityImage;
- (UIImage)preferredQualityImage;
- (UILongPressGestureRecognizer)scrubGesture;
- (id)copyWithZone:(_NSZone *)a3;
- (id)frameChangeBlock;
- (id)highQualityImageRequestCancelHandler;
- (id)itemsForCustomRotor:(id)a3;
- (id)preferredQualityImageRequestCancelHandler;
- (id)stringForAXDragAction;
- (id)supportedCustomRotors;
- (int64_t)loadingIndicatorStyle;
- (unint64_t)frameIndex;
- (unint64_t)highQualityInterest;
- (unint64_t)intendedFrameIndex;
- (unint64_t)playCount;
- (unint64_t)preferredQualityInterest;
- (void)addInterestInImageQuality:(int)a3 forObject:(id)a4;
- (void)animatedImage:(id)a3 madeImageAvailableForFrameAtIndex:(unint64_t)a4;
- (void)dealloc;
- (void)didEndDragging;
- (void)didLoadAnimatedImage:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)didReceiveMemoryWarning;
- (void)didStartDragging;
- (void)fadeInImageWhenVisible:(id)a3;
- (void)giveUpInterestForObject:(id)a3;
- (void)handleScrubGesture:(id)a3;
- (void)layoutActivityIndicator;
- (void)layoutSubviews;
- (void)loadHighQualityImage;
- (void)loadPreferredQualityImage;
- (void)pause;
- (void)reachabilityChanged:(BOOL)a3;
- (void)resume;
- (void)setActiveTimer:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setAnimatedImage:(id)a3;
- (void)setAutoPlayEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFrameChangeBlock:(id)a3;
- (void)setFrameIndex:(unint64_t)a3;
- (void)setFrameIndex:(unint64_t)a3 allowNearest:(BOOL)a4;
- (void)setHighQualityImage:(id)a3;
- (void)setHighQualityImageRequestCancelHandler:(id)a3;
- (void)setHighQualityInterest:(unint64_t)a3;
- (void)setIntendedFrameIndex:(unint64_t)a3;
- (void)setInterestTable:(id)a3;
- (void)setIsDecorative:(BOOL)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setLoadingIndicatorStyle:(int64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlayCount:(unint64_t)a3;
- (void)setPreferredImageSize:(CGSize)a3;
- (void)setPreferredQualityImage:(id)a3;
- (void)setPreferredQualityImageRequestCancelHandler:(id)a3;
- (void)setPreferredQualityInterest:(unint64_t)a3;
- (void)setPreferredQualityLoadingImageSize:(CGSize)a3;
- (void)setPreviousPoint:(CGPoint)a3;
- (void)setScrubGesture:(id)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
- (void)setShouldResume:(BOOL)a3;
- (void)setShouldResumeAfterLoad:(BOOL)a3;
- (void)setShouldShowLoadingIndicator:(BOOL)a3;
- (void)showNextFrame;
- (void)validateLoadedImage;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SXImageView

- (SXImageView)initWithImageResource:(id)a3 resourceDataSource:(id)a4 reachabilityProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SXImageView;
  v12 = [(SXImageView *)&v18 init];
  v13 = v12;
  if (v12)
  {
    v12->_autoPlayEnabled = 1;
    v12->_paused = 1;
    objc_storeStrong((id *)&v12->_imageResource, a3);
    objc_storeWeak((id *)&v13->_resourceDataSource, v10);
    uint64_t v14 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0];
    interestTable = v13->_interestTable;
    v13->_interestTable = (NSMapTable *)v14;

    v13->_intendedFrameIndex = -1;
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v13 selector:sel_didReceiveMemoryWarning name:*MEMORY[0x263F1D060] object:0];

    [v11 addReachabilityObserver:v13];
  }

  return v13;
}

- (void)dealloc
{
  v3 = [(SXImageView *)self activeTimer];
  [v3 invalidate];

  [(SXImageView *)self setActiveTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)SXImageView;
  [(SXImageView *)&v4 dealloc];
}

- (void)setShouldShowLoadingIndicator:(BOOL)a3
{
  self->_shouldShowLoadingIndicator = a3;
  objc_super v4 = [(SXImageView *)self activityIndicatorView];
  if (v4)
  {

    goto LABEL_8;
  }
  if (![(SXImageView *)self shouldShowLoadingIndicator])
  {
LABEL_8:
    if (![(SXImageView *)self shouldShowLoadingIndicator])
    {
      v8 = [(SXImageView *)self activityIndicatorView];
      [v8 removeFromSuperview];

      [(SXImageView *)self setActivityIndicatorView:0];
    }
    return;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  [(SXImageView *)self setActivityIndicatorView:v5];

  v6 = [(SXImageView *)self activityIndicatorView];
  [v6 setHidesWhenStopped:1];

  [(SXImageView *)self layoutActivityIndicator];
  v7 = [(SXImageView *)self activityIndicatorView];
  [(SXImageView *)self addSubview:v7];

  if (![(SXImageView *)self hasLoadedImage])
  {
    id v9 = [(SXImageView *)self activityIndicatorView];
    [v9 startAnimating];
  }
}

- (void)setLoadingIndicatorStyle:(int64_t)a3
{
  id v4 = [(SXImageView *)self activityIndicatorView];
  [v4 setActivityIndicatorViewStyle:a3];
}

- (int64_t)loadingIndicatorStyle
{
  v2 = [(SXImageView *)self activityIndicatorView];
  int64_t v3 = [v2 activityIndicatorViewStyle];

  return v3;
}

- (void)layoutActivityIndicator
{
  [(SXImageView *)self bounds];
  double v4 = v3 * 0.5;
  [(SXImageView *)self bounds];
  double v6 = v5 * 0.5;
  id v7 = [(SXImageView *)self activityIndicatorView];
  objc_msgSend(v7, "setCenter:", v4, v6);
}

- (void)addInterestInImageQuality:(int)a3 forObject:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v11 = a4;
  double v6 = [(SXImageView *)self interestTable];
  id v7 = [v6 objectForKey:v11];

  if (v7)
  {
    if ([v7 intValue] != v4)
    {
      [(SXImageView *)self giveUpInterestForObject:v11];
      [(SXImageView *)self addInterestInImageQuality:v4 forObject:v11];
    }
  }
  else
  {
    v8 = &OBJC_IVAR___SXImageView__highQualityInterest;
    if (!v4) {
      v8 = &OBJC_IVAR___SXImageView__preferredQualityInterest;
    }
    ++*(Class *)((char *)&self->super.super.super.super.isa + *v8);
    id v9 = [(SXImageView *)self interestTable];
    id v10 = [NSNumber numberWithInt:v4];
    [v9 setObject:v10 forKey:v11];

    [(SXImageView *)self validateLoadedImage];
  }
}

- (void)giveUpInterestForObject:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [(SXImageView *)self interestTable];
  double v5 = [v4 objectForKey:v17];

  if (v5)
  {
    int v6 = [v5 intValue];
    id v7 = &OBJC_IVAR___SXImageView__highQualityInterest;
    if (!v6) {
      id v7 = &OBJC_IVAR___SXImageView__preferredQualityInterest;
    }
    --*(Class *)((char *)&self->super.super.super.super.isa + *v7);
    if (![(SXImageView *)self prefersHighQuality])
    {
      v8 = [(SXImageView *)self highQualityImage];

      if (v8) {
        [(SXImageView *)self setHighQualityImage:0];
      }
    }
    id v9 = [(SXImageView *)self interestTable];
    [v9 removeObjectForKey:v17];

    if ([(SXImageView *)self hasInterest])
    {
      if (![(SXImageView *)self prefersHighQuality])
      {
        id v10 = [(SXImageView *)self highQualityImageRequestCancelHandler];

        if (v10)
        {
          id v11 = [(SXImageView *)self highQualityImageRequestCancelHandler];
          v11[2]();

          [(SXImageView *)self setHighQualityImageRequestCancelHandler:0];
        }
      }
    }
    else
    {
      v12 = [(SXImageView *)self preferredQualityImageRequestCancelHandler];

      if (v12)
      {
        v13 = [(SXImageView *)self preferredQualityImageRequestCancelHandler];
        v13[2]();

        [(SXImageView *)self setPreferredQualityImageRequestCancelHandler:0];
        -[SXImageView setPreferredQualityLoadingImageSize:](self, "setPreferredQualityLoadingImageSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      }
      uint64_t v14 = [(SXImageView *)self highQualityImageRequestCancelHandler];

      if (v14)
      {
        v15 = [(SXImageView *)self highQualityImageRequestCancelHandler];
        v15[2]();

        [(SXImageView *)self setHighQualityImageRequestCancelHandler:0];
      }
      if ([(SXImageView *)self containsAnimatedImage])
      {
        v16 = [(SXImageView *)self animatedImage];
        [v16 setPreloadType:0 currentFrameIndex:0];
      }
    }
  }
}

- (BOOL)hasInterest
{
  return [(SXImageView *)self preferredQualityInterest]
      || [(SXImageView *)self highQualityInterest] != 0;
}

- (BOOL)prefersHighQuality
{
  return [(SXImageView *)self highQualityInterest] != 0;
}

- (BOOL)objectHasQualityInterest:(id)a3 quality:(int *)a4
{
  id v6 = a3;
  id v7 = [(SXImageView *)self interestTable];
  v8 = [v7 objectForKey:v6];

  if (a4 && v8) {
    *a4 = [v8 intValue];
  }

  return v8 != 0;
}

- (void)validateLoadedImage
{
  [(SXImageView *)self bounds];
  if (v4 <= 0.0
    || v3 <= 0.0
    || ![(SXImageView *)self hasInterest]
    || [(SXImageView *)self containsAnimatedImage])
  {
    return;
  }
  if (![(SXImageView *)self prefersHighQuality])
  {
    id v9 = [(SXImageView *)self preferredQualityImage];
    [v9 size];
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = [(SXImageView *)self preferredQualityImage];
    if (!v14) {
      goto LABEL_14;
    }
    v15 = (void *)v14;
    uint64_t v16 = [(SXImageView *)self preferredQualityImage];
    if (v16)
    {
      id v17 = (void *)v16;
      double v18 = ceil(v11);
      [(SXImageView *)self preferredImageSize];
      double v20 = v19;
      double v22 = v21;

      if (v20 != v18 || v22 != ceil(v13))
      {
LABEL_14:
        [(SXImageView *)self preferredImageSize];
        double v24 = v23;
        double v26 = v25;
        [(SXImageView *)self preferredQualityLoadingImageSize];
        if (v24 != v28 || v26 != v27)
        {
          [(SXImageView *)self loadPreferredQualityImage];
        }
        return;
      }
    }
    else
    {
    }
    v29 = [(SXImageView *)self image];
    v30 = [(SXImageView *)self preferredQualityImage];

    if (v29 == v30) {
      return;
    }
    uint64_t v8 = [(SXImageView *)self preferredQualityImage];
    goto LABEL_25;
  }
  double v5 = [(SXImageView *)self highQualityImage];

  if (v5)
  {
    id v6 = [(SXImageView *)self highQualityImage];
    id v7 = [(SXImageView *)self image];

    if (v6 == v7) {
      return;
    }
    uint64_t v8 = [(SXImageView *)self highQualityImage];
LABEL_25:
    id v31 = (id)v8;
    [(SXImageView *)self crossfadeToImage:v8];

    return;
  }
  [(SXImageView *)self loadHighQualityImage];
}

- (void)loadPreferredQualityImage
{
  [(SXImageView *)self preferredImageSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(SXImageView *)self preferredQualityImageRequestCancelHandler];

  if (v7)
  {
    uint64_t v8 = [(SXImageView *)self preferredQualityImageRequestCancelHandler];
    v8[2]();

    [(SXImageView *)self setPreferredQualityImageRequestCancelHandler:0];
  }
  if (![(SXImageView *)self hasLoadedImage])
  {
    id v9 = [(SXImageView *)self activityIndicatorView];
    [v9 startAnimating];
  }
  self->_preferredQualityLoadingImageSize.width = v4;
  self->_preferredQualityLoadingImageSize.height = v6;
  objc_initWeak(&location, self);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  double v23 = __40__SXImageView_loadPreferredQualityImage__block_invoke;
  double v24 = &unk_264651468;
  objc_copyWeak(&v25, &location);
  double v10 = (void *)MEMORY[0x223CA5030](&v21);
  double v11 = [(SXImageView *)self imageResource];
  uint64_t v12 = [v11 wideColorSpace];

  double v13 = [SXImageRequest alloc];
  uint64_t v14 = [(SXImageView *)self imageResource];
  v15 = [v14 imageIdentifier];
  uint64_t v16 = [(SXImageView *)self imageResource];
  id v17 = [v16 URL];
  double v18 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v13, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v15, 6, v17, v12, v10, v4, v6);

  double v19 = [(SXImageView *)self resourceDataSource];
  double v20 = [v19 loadImagesForImageRequest:v18 completionBlock:0];
  [(SXImageView *)self setPreferredQualityImageRequestCancelHandler:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __40__SXImageView_loadPreferredQualityImage__block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v5 = (double *)MEMORY[0x263F001B0];
  if (isKindOfClass)
  {
    id v6 = [v16 animatedImage];
    [WeakRetained didLoadAnimatedImage:v6];
  }
  else
  {
    id v6 = v16;
    id v7 = [WeakRetained activityIndicatorView];
    [v7 stopAnimating];

    uint64_t v8 = [v6 image];

    if (v8)
    {
      id v9 = [v6 image];
      [WeakRetained setPreferredQualityImage:v9];

      double v10 = [WeakRetained image];

      double v11 = [WeakRetained preferredQualityImage];
      if (v10) {
        [WeakRetained crossfadeToImage:v11];
      }
      else {
        [WeakRetained fadeInImageWhenVisible:v11];
      }

      objc_msgSend(WeakRetained, "setPreferredQualityLoadingImageSize:", *v5, v5[1]);
      uint64_t v12 = [WeakRetained delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        uint64_t v14 = [WeakRetained delegate];
        v15 = [WeakRetained preferredQualityImage];
        [v14 imageView:WeakRetained didLoadImage:v15 ofQuality:0];
      }
    }
  }

  objc_msgSend(WeakRetained, "setPreferredQualityLoadingImageSize:", *v5, v5[1]);
  [WeakRetained setPreferredQualityImageRequestCancelHandler:0];
}

- (void)loadHighQualityImage
{
  if (![(SXImageView *)self hasLoadedImage])
  {
    double v3 = [(SXImageView *)self activityIndicatorView];
    [v3 startAnimating];
  }
  objc_initWeak(&location, self);
  double v4 = [(SXImageView *)self highQualityImageRequestCancelHandler];
  if (!v4)
  {
    double v5 = [(SXImageView *)self highQualityImage];

    if (v5) {
      goto LABEL_6;
    }
    double v4 = objc_loadWeakRetained(&location);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __35__SXImageView_loadHighQualityImage__block_invoke;
    v17[3] = &unk_264651490;
    v17[4] = v4;
    id v6 = (void *)MEMORY[0x223CA5030](v17);
    id v7 = [(SXImageView *)self imageResource];
    uint64_t v8 = [v7 wideColorSpace];

    id v9 = [SXImageRequest alloc];
    double v10 = [(SXImageView *)self imageResource];
    double v11 = [v10 imageIdentifier];
    uint64_t v12 = [(SXImageView *)self imageResource];
    char v13 = [v12 URL];
    uint64_t v14 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v9, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v11, 6, v13, v8, v6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

    v15 = [(SXImageView *)self resourceDataSource];
    id v16 = [v15 loadImagesForImageRequest:v14 completionBlock:0];
    [(SXImageView *)self setHighQualityImageRequestCancelHandler:v16];
  }
LABEL_6:
  objc_destroyWeak(&location);
}

void __35__SXImageView_loadHighQualityImage__block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v25;
    double v4 = [v3 animatedImage];
    [v4 imageSize];
    double v6 = v5;
    double v8 = v7;
    id v9 = [*(id *)(a1 + 32) animatedImage];
    [v9 imageSize];
    double v11 = v10;
    double v13 = v12;

    if (v6 == v11 && v8 == v13) {
      goto LABEL_13;
    }
    v15 = *(void **)(a1 + 32);
    id v16 = [v3 animatedImage];
    [v15 didLoadAnimatedImage:v16];
  }
  else
  {
    id v17 = [*(id *)(a1 + 32) activityIndicatorView];
    [v17 stopAnimating];

    double v18 = [v25 image];
    [*(id *)(a1 + 32) setHighQualityImage:v18];

    double v19 = [*(id *)(a1 + 32) image];

    double v20 = *(void **)(a1 + 32);
    uint64_t v21 = [v20 highQualityImage];
    if (v19) {
      [v20 crossfadeToImage:v21];
    }
    else {
      [v20 fadeInImageWhenVisible:v21];
    }

    uint64_t v22 = [*(id *)(a1 + 32) delegate];
    char v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) == 0) {
      goto LABEL_14;
    }
    id v3 = [*(id *)(a1 + 32) delegate];
    double v24 = *(void **)(a1 + 32);
    id v16 = [v24 highQualityImage];
    [v3 imageView:v24 didLoadImage:v16 ofQuality:1];
  }

LABEL_13:
LABEL_14:
  [*(id *)(a1 + 32) setHighQualityImageRequestCancelHandler:0];
}

- (void)didLoadAnimatedImage:(id)a3
{
  [(SXImageView *)self setAnimatedImage:a3];
  double v4 = [(SXImageView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(SXImageView *)self delegate];
    double v6 = [(SXImageView *)self animatedImage];
    [v7 imageView:self didLoadAnimatedImage:v6];
  }
}

- (void)didReceiveMemoryWarning
{
  if (![(SXImageView *)self hasInterest])
  {
    [(SXImageView *)self setHighQualityImage:0];
    [(SXImageView *)self setPreferredQualityImage:0];
  }
}

- (BOOL)hasLoadedImage
{
  id v3 = [(SXImageView *)self image];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(SXImageView *)self animatedImage];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (CGSize)loadedImageSize
{
  if ([(SXImageView *)self containsAnimatedImage])
  {
    id v3 = [(SXImageView *)self animatedImage];
    [v3 imageSize];
  }
  else
  {
    id v3 = [(SXImageView *)self image];
    [v3 size];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)fadeInImageWhenVisible:(id)a3
{
  [(SXImageView *)self setImage:a3];
  if ([(SXImageView *)self isVisible])
  {
    id v5 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v5 setFromValue:&unk_26D593AB8];
    [v5 setToValue:&unk_26D593AD0];
    [v5 setDuration:0.2];
    double v4 = [(SXImageView *)self layer];
    [v4 addAnimation:v5 forKey:@"fadeIn"];
  }
}

- (BOOL)isVisible
{
  id v3 = [(SXImageView *)self superview];
  [(SXImageView *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SXImageView *)self window];
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  uint64_t v21 = [(SXImageView *)self window];
  [v21 bounds];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.width = v18;
  v33.size.height = v20;
  CGRect v35 = CGRectInset(v33, -10.0, -10.0);
  v34.origin.x = v23;
  v34.origin.y = v25;
  v34.size.width = v27;
  v34.size.height = v29;
  if (CGRectIntersectsRect(v34, v35))
  {
    v30 = [(SXImageView *)self window];
    BOOL v31 = v30 != 0;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (void)setPreferredImageSize:(CGSize)a3
{
  self->_preferredImageSize.width = ceil(a3.width);
  self->_preferredImageSize.height = ceil(a3.height);
  [(SXImageView *)self validateLoadedImage];
}

- (void)reachabilityChanged:(BOOL)a3
{
  if (a3) {
    [(SXImageView *)self validateLoadedImage];
  }
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SXImageView *)self containsAnimatedImage])
  {
    self->_scrubbingEnabled = v3;
    if (v3
      && ([(SXImageView *)self scrubGesture],
          double v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      [(SXImageView *)self setUserInteractionEnabled:1];
      id v8 = (id)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_handleScrubGesture_];
      [v8 setMinimumPressDuration:0.1];
      [v8 setNumberOfTouchesRequired:1];
      [(SXImageView *)self addGestureRecognizer:v8];
      [(SXImageView *)self setScrubGesture:v8];
    }
    else
    {
      double v6 = [(SXImageView *)self scrubGesture];

      if (v6)
      {
        [(SXImageView *)self setUserInteractionEnabled:0];
        double v7 = [(SXImageView *)self scrubGesture];
        [(SXImageView *)self removeGestureRecognizer:v7];

        [(SXImageView *)self setScrubGesture:0];
      }
    }
  }
  else
  {
    self->_scrubbingEnabled = 0;
  }
}

- (void)handleScrubGesture:(id)a3
{
  id v30 = a3;
  if ([v30 state] == 1)
  {
    [(SXImageView *)self pause];
    [v30 locationInView:self];
    -[SXImageView setPreviousPoint:](self, "setPreviousPoint:");
    double v4 = self;
    uint64_t v5 = 1;
LABEL_17:
    [(SXImageView *)v4 setIsScrubbing:v5];
LABEL_18:
    double v26 = v30;
    goto LABEL_19;
  }
  if ([v30 state] == 2)
  {
    double v6 = [(SXImageView *)self animatedImage];
    uint64_t v7 = [v6 numberOfFrames];

    [v30 locationInView:self];
    double v9 = v8;
    double v11 = v10;
    [(SXImageView *)self previousPoint];
    double v13 = v9 - v12;
    unint64_t v14 = [(SXImageView *)self frameIndex];
    double v15 = [(SXImageView *)self animatedImage];
    uint64_t v16 = [v15 numberOfFrames];
    unint64_t v17 = [(SXImageView *)self frameIndex];

    [(SXImageView *)self frame];
    double Width = CGRectGetWidth(v32);
    unint64_t v19 = [(SXImageView *)self frameIndex];
    if (v13 <= 0.0)
    {
      [(SXImageView *)self previousPoint];
      double v28 = v27 / (double)v14;
      [(SXImageView *)self previousPoint];
      unint64_t v20 = ((__PAIR128__(v19, *(unint64_t *)&v9) - COERCE_UNSIGNED_INT64(v29 - v28 + 20.0)) >> 64) & ~((uint64_t)((__PAIR128__(v19, *(unint64_t *)&v9) - COERCE_UNSIGNED_INT64(v29 - v28 + 20.0)) >> 64) >> 63);
    }
    else
    {
      unint64_t v20 = v7 - 1;
      [(SXImageView *)self previousPoint];
      double v22 = (Width - v21) / (double)(v16 - v17);
      [(SXImageView *)self previousPoint];
      if (v9 <= v23 + v22) {
        unint64_t v24 = v19;
      }
      else {
        unint64_t v24 = v19 + 1;
      }
      if (v20 >= v24) {
        unint64_t v20 = v24;
      }
    }
    BOOL v25 = [(SXImageView *)self frameIndex] == v20;
    double v26 = v30;
    if (!v25)
    {
      [(SXImageView *)self setFrameIndex:v20 allowNearest:1];
      -[SXImageView setPreviousPoint:](self, "setPreviousPoint:", v9, v11);
      goto LABEL_18;
    }
  }
  else if ([v30 state] == 3 || (BOOL v25 = objc_msgSend(v30, "state") == 4, v26 = v30, v25))
  {
    if ([(SXImageView *)self autoPlayEnabled]) {
      [(SXImageView *)self resume];
    }
    double v4 = self;
    uint64_t v5 = 0;
    goto LABEL_17;
  }
LABEL_19:
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SXImageView;
  [(SXImageView *)&v3 layoutSubviews];
  [(SXImageView *)self layoutActivityIndicator];
  [(SXImageView *)self validateLoadedImage];
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXImageView;
  -[SXImageView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  if (a3) {
    [(SXImageView *)self setShouldResume:[(SXImageView *)self autoPlayEnabled]];
  }
}

- (void)didMoveToSuperview
{
  v6.receiver = self;
  v6.super_class = (Class)SXImageView;
  [(SXImageView *)&v6 didMoveToSuperview];
  uint64_t v3 = [(SXImageView *)self superview];
  if (v3)
  {
    double v4 = (void *)v3;
    BOOL v5 = [(SXImageView *)self shouldResume];

    if (v5)
    {
      [(SXImageView *)self resume];
      [(SXImageView *)self setShouldResume:0];
      [(SXImageView *)self validateLoadedImage];
    }
  }
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)SXImageView;
  [(SXImageView *)&v7 didMoveToWindow];
  uint64_t v3 = [(SXImageView *)self window];

  if (!v3)
  {
    [(SXImageView *)self pause];
    goto LABEL_6;
  }
  uint64_t v4 = [(SXImageView *)self superview];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    BOOL v6 = [(SXImageView *)self shouldResume];

    if (v6)
    {
      [(SXImageView *)self resume];
LABEL_6:
      [(SXImageView *)self setShouldResume:v3 == 0];
    }
  }
}

- (BOOL)containsAnimatedImage
{
  v2 = [(SXImageView *)self animatedImage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setAnimatedImage:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (self->_animatedImage != (SXAnimatedImage *)v5)
  {
    double v11 = (void *)v5;
    uint64_t v7 = [(SXImageView *)self scrubbingEnabled] ? 2 : 1;
    objc_msgSend(v11, "setPreloadType:currentFrameIndex:", v7, -[SXImageView frameIndex](self, "frameIndex"));
    [(SXAnimatedImage *)self->_animatedImage setDelegate:0];
    [v11 setDelegate:self];
    objc_storeStrong((id *)&self->_animatedImage, a3);
    uint64_t v8 = [v11 loopCount];
    uint64_t v9 = [v11 loopCount];
    unint64_t v10 = v8 == -1 ? v9 : v9 + 1;
    self->_playCount = v10;
    uint64_t v5 = [(SXImageView *)self shouldResumeAfterLoad];
    uint64_t v6 = (uint64_t)v11;
    if (v5)
    {
      [(SXImageView *)self resume];
      uint64_t v5 = [(SXImageView *)self setShouldResumeAfterLoad:0];
      uint64_t v6 = (uint64_t)v11;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)showNextFrame
{
  BOOL v3 = [(SXImageView *)self window];

  if (!v3)
  {
    uint64_t v4 = [(SXImageView *)self activeTimer];
    [v4 invalidate];

    [(SXImageView *)self setActiveTimer:0];
    uint64_t v5 = [(SXImageView *)self animatedImage];
    [v5 suspendPreloading];

    [(SXImageView *)self setPaused:1];
  }
  uint64_t v6 = [(SXImageView *)self animatedImage];
  objc_msgSend(v6, "frameAtIndex:", -[SXImageView frameIndex](self, "frameIndex"));
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v7 = -[SXAnimatedImageFrame index]((uint64_t)v26) + 1;
  uint64_t v8 = [(SXImageView *)self animatedImage];
  unint64_t v9 = [v8 numberOfFrames];

  if (v7 >= v9)
  {
    [(SXImageView *)self setPlayCount:[(SXImageView *)self playCount] - 1];
    if (![(SXImageView *)self playCount])
    {
      [(SXImageView *)self pause];
      goto LABEL_15;
    }
    unint64_t v7 = 0;
  }
  unint64_t v10 = [(SXImageView *)self animatedImage];
  double v11 = [v10 frameAtIndex:v7];

  double v12 = -[SXAnimatedImageFrame image]((uint64_t)v11);

  if (v12)
  {
    self->_frameIndex = v7;
    double v13 = -[SXAnimatedImageFrame image]((uint64_t)v11);
    [(SXImageView *)self setImage:v13];

    unint64_t v14 = [(SXImageView *)self frameChangeBlock];

    if (v14)
    {
      double v15 = [(SXImageView *)self frameChangeBlock];
      unint64_t v16 = [(SXImageView *)self frameIndex];
      unint64_t v17 = [(SXImageView *)self animatedImage];
      ((void (**)(void, SXImageView *, unint64_t, uint64_t))v15)[2](v15, self, v16, [v17 numberOfFrames]);
    }
    CGFloat v18 = [(SXImageView *)self activeTimer];
    int v19 = [v18 isValid];

    if (v19)
    {
      unint64_t v20 = [(SXImageView *)self activeTimer];
      [v20 invalidate];
    }
    double v21 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_showNextFrame selector:0 userInfo:0 repeats:-[SXAnimatedImageFrame duration]((uint64_t)v11)];
    [(SXImageView *)self setActiveTimer:v21];

    double v22 = [MEMORY[0x263EFF9F0] currentRunLoop];
    double v23 = [(SXImageView *)self activeTimer];
    [v22 addTimer:v23 forMode:*MEMORY[0x263EFF588]];

    unint64_t v24 = self;
    uint64_t v25 = -1;
  }
  else
  {
    uint64_t v25 = -[SXAnimatedImageFrame index]((uint64_t)v11);
    unint64_t v24 = self;
  }
  [(SXImageView *)v24 setIntendedFrameIndex:v25];

LABEL_15:
}

- (void)setFrameIndex:(unint64_t)a3
{
}

- (void)setFrameIndex:(unint64_t)a3 allowNearest:(BOOL)a4
{
  BOOL v4 = a4;
  self->_frameIndex = a3;
  uint64_t v6 = [(SXImageView *)self animatedImage];
  unint64_t v7 = objc_msgSend(v6, "frameAtIndex:returnNearestPreloaded:", -[SXImageView frameIndex](self, "frameIndex"), v4);
  -[SXAnimatedImageFrame image]((uint64_t)v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = v9;
  if (v9)
  {
    [(SXImageView *)self setImage:v9];
    uint64_t v8 = v9;
  }
}

- (BOOL)paused
{
  v2 = [(SXImageView *)self activeTimer];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)pause
{
  if ([(SXImageView *)self paused] || ![(SXImageView *)self containsAnimatedImage])
  {
    if (![(SXImageView *)self paused])
    {
      [(SXImageView *)self setShouldResumeAfterLoad:0];
    }
  }
  else
  {
    BOOL v3 = [(SXImageView *)self activeTimer];
    [v3 invalidate];

    [(SXImageView *)self setActiveTimer:0];
    id v4 = [(SXImageView *)self animatedImage];
    [v4 suspendPreloading];
  }
}

- (void)resume
{
  if ([(SXImageView *)self paused]
    && [(SXImageView *)self playCount]
    && [(SXImageView *)self containsAnimatedImage])
  {
    BOOL v3 = [(SXImageView *)self animatedImage];
    [v3 resumePreloading];

    [(SXImageView *)self showNextFrame];
  }
  else if ([(SXImageView *)self paused])
  {
    [(SXImageView *)self setShouldResumeAfterLoad:1];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SXImageView);
  uint64_t v5 = [(SXImageView *)self animatedImage];

  if (v5)
  {
    uint64_t v6 = [(SXImageView *)self animatedImage];
    [(SXImageView *)v4 setAnimatedImage:v6];
  }
  else
  {
    uint64_t v6 = [(SXImageView *)self image];
    [(SXImageView *)v4 setImage:v6];
  }

  return v4;
}

- (void)animatedImage:(id)a3 madeImageAvailableForFrameAtIndex:(unint64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SXImageView_animatedImage_madeImageAvailableForFrameAtIndex___block_invoke;
  v4[3] = &unk_2646514B8;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __63__SXImageView_animatedImage_madeImageAvailableForFrameAtIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) intendedFrameIndex];
  if (result == *(void *)(a1 + 40))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 showNextFrame];
  }
  return result;
}

- (id)supportedCustomRotors
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  BOOL v3 = +[SXAXCustomRotorDefinition imagesRotor]();
  id v4 = +[SXAXCustomRotor rotorWithName:v3];
  uint64_t v5 = [v2 orderedSetWithObject:v4];

  return v5;
}

- (id)itemsForCustomRotor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SXAXCustomRotorDefinition imagesRotor]();
  id v6 = +[SXAXCustomRotor rotorWithName:v5];

  if (v6 == v4)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F1C3A0]) initWithTargetElement:self targetRange:0];
    unint64_t v7 = [MEMORY[0x263EFF9D8] orderedSetWithObject:v8];
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7;
}

- (NSString)dragIdentifier
{
  v2 = [(SXImageView *)self imageResource];
  BOOL v3 = [v2 imageIdentifier];

  return (NSString *)v3;
}

- (void)didStartDragging
{
}

- (void)didEndDragging
{
}

- (id)stringForAXDragAction
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Drag Image" value:&stru_26D5311C0 table:0];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  if ([(SXImageView *)self isDecorative]) {
    return 0;
  }
  else {
    return ![self sxax_shouldBeOccluded];
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (BOOL)shouldShowLoadingIndicator
{
  return self->_shouldShowLoadingIndicator;
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (CGSize)preferredImageSize
{
  double width = self->_preferredImageSize.width;
  double height = self->_preferredImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SXImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXImageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (void)setIsScrubbing:(BOOL)a3
{
  self->_isScrubbing = a3;
}

- (BOOL)isDecorative
{
  return self->_isDecorative;
}

- (void)setIsDecorative:(BOOL)a3
{
  self->_isDecorative = a3;
}

- (SXAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (unint64_t)frameIndex
{
  return self->_frameIndex;
}

- (id)frameChangeBlock
{
  return self->_frameChangeBlock;
}

- (void)setFrameChangeBlock:(id)a3
{
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (void)setAutoPlayEnabled:(BOOL)a3
{
  self->_autoPlayEnabled = a3;
}

- (SXResourceDataSource)resourceDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceDataSource);
  return (SXResourceDataSource *)WeakRetained;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (id)preferredQualityImageRequestCancelHandler
{
  return self->_preferredQualityImageRequestCancelHandler;
}

- (void)setPreferredQualityImageRequestCancelHandler:(id)a3
{
}

- (id)highQualityImageRequestCancelHandler
{
  return self->_highQualityImageRequestCancelHandler;
}

- (void)setHighQualityImageRequestCancelHandler:(id)a3
{
}

- (CGSize)preferredQualityLoadingImageSize
{
  double width = self->_preferredQualityLoadingImageSize.width;
  double height = self->_preferredQualityLoadingImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredQualityLoadingImageSize:(CGSize)a3
{
  self->_preferredQualityLoadingImageSize = a3;
}

- (UIImage)preferredQualityImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredQualityImage);
  return (UIImage *)WeakRetained;
}

- (void)setPreferredQualityImage:(id)a3
{
}

- (UIImage)highQualityImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highQualityImage);
  return (UIImage *)WeakRetained;
}

- (void)setHighQualityImage:(id)a3
{
}

- (unint64_t)preferredQualityInterest
{
  return self->_preferredQualityInterest;
}

- (void)setPreferredQualityInterest:(unint64_t)a3
{
  self->_preferredQualityInterest = a3;
}

- (unint64_t)highQualityInterest
{
  return self->_highQualityInterest;
}

- (void)setHighQualityInterest:(unint64_t)a3
{
  self->_highQualityInterest = a3;
}

- (NSMapTable)interestTable
{
  return self->_interestTable;
}

- (void)setInterestTable:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (BOOL)shouldResume
{
  return self->_shouldResume;
}

- (void)setShouldResume:(BOOL)a3
{
  self->_shouldResume = a3;
}

- (BOOL)shouldResumeAfterLoad
{
  return self->_shouldResumeAfterLoad;
}

- (void)setShouldResumeAfterLoad:(BOOL)a3
{
  self->_shouldResumeAfterLoad = a3;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (NSTimer)activeTimer
{
  return self->_activeTimer;
}

- (void)setActiveTimer:(id)a3
{
}

- (unint64_t)intendedFrameIndex
{
  return self->_intendedFrameIndex;
}

- (void)setIntendedFrameIndex:(unint64_t)a3
{
  self->_intendedFrameIndex = a3;
}

- (UILongPressGestureRecognizer)scrubGesture
{
  return self->_scrubGesture;
}

- (void)setScrubGesture:(id)a3
{
}

- (CGPoint)previousPoint
{
  double x = self->_previousPoint.x;
  double y = self->_previousPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousPoint:(CGPoint)a3
{
  self->_previousPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubGesture, 0);
  objc_storeStrong((id *)&self->_activeTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_interestTable, 0);
  objc_destroyWeak((id *)&self->_highQualityImage);
  objc_destroyWeak((id *)&self->_preferredQualityImage);
  objc_storeStrong(&self->_highQualityImageRequestCancelHandler, 0);
  objc_storeStrong(&self->_preferredQualityImageRequestCancelHandler, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_destroyWeak((id *)&self->_resourceDataSource);
  objc_storeStrong(&self->_frameChangeBlock, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageResource, 0);
}

@end