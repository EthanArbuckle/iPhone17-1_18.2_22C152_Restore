@interface VideosExtrasBackgroundViewController
+ (id)vignetteImageForType:(unint64_t)a3;
- (NSArray)backgroundElements;
- (VideosExtrasBackgroundViewController)initWithBackgroundElement:(id)a3;
- (VideosExtrasBackgroundViewController)initWithBackgroundElements:(id)a3;
- (unint64_t)vignetteType;
- (void)_didReceiveImage:(id)a3;
- (void)_initVignette;
- (void)_invalidateTimer;
- (void)_scheduleTimerIfNeeded;
- (void)_updateConstraintsForImageSize:(CGSize)a3 position:(unint64_t)a4;
- (void)_updateImage;
- (void)dealloc;
- (void)setVignetteType:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VideosExtrasBackgroundViewController

- (VideosExtrasBackgroundViewController)initWithBackgroundElement:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VideosExtrasBackgroundViewController;
  v5 = [(VideosExtrasBackgroundViewController *)&v10 init];
  v6 = v5;
  if (v4 && v5)
  {
    v11[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    backgroundElements = v6->_backgroundElements;
    v6->_backgroundElements = (NSArray *)v7;
  }
  return v6;
}

- (VideosExtrasBackgroundViewController)initWithBackgroundElements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasBackgroundViewController;
  v6 = [(VideosExtrasBackgroundViewController *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backgroundElements, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(VideosExtrasBackgroundViewController *)self _invalidateTimer];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasBackgroundViewController;
  [(VideosExtrasBackgroundViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasBackgroundViewController;
  [(VideosExtrasBackgroundViewController *)&v9 viewDidLoad];
  objc_super v3 = [(VideosExtrasBackgroundViewController *)self view];
  id v4 = [(NSArray *)self->_backgroundElements firstObject];
  id v5 = [v4 backgroundColor];
  if (v5)
  {
    [v3 setBackgroundColor:v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [v3 setBackgroundColor:v6];
  }
  [v3 setClipsToBounds:1];
  uint64_t v7 = (MPUArtworkView *)[objc_alloc(MEMORY[0x1E4F76ED8]) initForAutolayout];
  imageView = self->_imageView;
  self->_imageView = v7;

  [(MPUArtworkView *)self->_imageView setAutomaticallyApplyAspectConstraints:1];
  [v3 addSubview:self->_imageView];
  [(VideosExtrasBackgroundViewController *)self _updateImage];
  [(VideosExtrasBackgroundViewController *)self _initVignette];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasBackgroundViewController;
  [(VideosExtrasBackgroundViewController *)&v4 viewDidAppear:a3];
  [(VideosExtrasBackgroundViewController *)self _scheduleTimerIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasBackgroundViewController;
  [(VideosExtrasBackgroundViewController *)&v4 viewWillDisappear:a3];
  [(VideosExtrasBackgroundViewController *)self _invalidateTimer];
  [(MPUArtworkView *)self->_imageView clearArtworkCatalogs];
}

- (void)_updateConstraintsForImageSize:(CGSize)a3 position:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = [(VideosExtrasBackgroundViewController *)self view];
  id v14 = v7;
  if (self->_imageConstraints)
  {
    objc_msgSend(v7, "removeConstraints:");
    uint64_t v7 = v14;
  }
  if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_super v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v10 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_imageView, v14, 10, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(NSArray *)v9 addObjectsFromArray:v10];

    v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_imageView attribute:7 relatedBy:0 toItem:v14 attribute:7 multiplier:1.0 constant:0.0];
    [(NSArray *)v9 addObject:v11];

    imageConstraints = self->_imageConstraints;
    self->_imageConstraints = v9;
    v13 = v9;

    [v14 addConstraints:self->_imageConstraints];
    uint64_t v7 = v14;
  }
}

- (void)_updateImage
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  objc_super v3 = self->_backgroundElements;
  objc_super v4 = (void *)[(NSArray *)v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v32 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v8 = [v7 images];
        BOOL v9 = [v8 count] == 0;

        if (!v9)
        {
          objc_super v4 = [v7 images];
          goto LABEL_11;
        }
      }
      objc_super v4 = (void *)[(NSArray *)v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([v4 count])
  {
    unint64_t displayedImageElement = (unint64_t)self->_displayedImageElement;
    if (displayedImageElement)
    {
      uint64_t v11 = objc_msgSend(v4, "indexOfObject:");
      unint64_t displayedImageElement = (v11 + 1) % (unint64_t)[v4 count];
    }
    v12 = [v4 objectAtIndex:displayedImageElement];
    v13 = self->_displayedImageElement;
    self->_unint64_t displayedImageElement = v12;

    id v14 = [(IKImageElement *)self->_displayedImageElement artworkCatalog];
    v15 = [(VideosExtrasBackgroundViewController *)self view];
    [v15 bounds];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    double v21 = v20;
    double v23 = v22;

    v37.origin.x = v17;
    v37.origin.y = v19;
    v37.size.double width = v21;
    v37.size.double height = v23;
    if (CGRectIsEmpty(v37))
    {
      v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v24 bounds];
      double v21 = v25;
      double v23 = v26;
    }
    objc_msgSend(v14, "setFittingSize:", v21, v23);
    objc_initWeak(&location, self);
    imageView = self->_imageView;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __52__VideosExtrasBackgroundViewController__updateImage__block_invoke;
    v28[3] = &unk_1E6DF7B08;
    objc_copyWeak(&v29, &location);
    [v14 setDestination:imageView configurationBlock:v28];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

void __52__VideosExtrasBackgroundViewController__updateImage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didReceiveImage:v4];
}

- (void)_didReceiveImage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(MPUArtworkView *)self->_imageView layer];
    v6 = [v5 animationKeys];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      [v4 size];
      -[VideosExtrasBackgroundViewController _updateConstraintsForImageSize:position:](self, "_updateConstraintsForImageSize:position:", [(IKImageElement *)self->_displayedImageElement position], v8, v9);
      objc_super v10 = (void *)MEMORY[0x1E4FB1EB0];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __57__VideosExtrasBackgroundViewController__didReceiveImage___block_invoke;
      id v14 = &unk_1E6DF3F68;
      v15 = self;
      id v16 = v4;
      [v10 animateWithDuration:&v11 animations:1.0];
      [(VideosExtrasBackgroundViewController *)self _scheduleTimerIfNeeded];
    }
  }
}

uint64_t __57__VideosExtrasBackgroundViewController__didReceiveImage___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) _setAnimatesContents:1];
  [*(id *)(*(void *)(a1 + 32) + 1000) setImage:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 1000);
  return [v2 _setAnimatesContents:0];
}

- (void)_scheduleTimerIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  updateTimer = self->_backgroundElements;
  uint64_t v4 = [(NSArray *)updateTimer countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(updateTimer);
        }
        double v8 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "images", (void)v16);
        unint64_t v9 = [v8 count];

        if (v9 > 1)
        {

          objc_super v10 = [(NSArray *)self->_backgroundElements firstObject];
          [v10 transitionInterval];
          double v12 = v11;

          double v13 = 3.0;
          if (v12 <= 3.0) {
            double v13 = v12;
          }
          if (v13 >= 2.22044605e-16) {
            double v14 = v13;
          }
          else {
            double v14 = 10.0;
          }
          [(NSTimer *)self->_updateTimer invalidate];
          v15 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__updateImage selector:0 userInfo:0 repeats:v14];
          updateTimer = (NSArray *)self->_updateTimer;
          self->_updateTimer = v15;
          goto LABEL_16;
        }
      }
      uint64_t v5 = [(NSArray *)updateTimer countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (void)_invalidateTimer
{
  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (void)_initVignette
{
  objc_super v3 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initForAutolayout];
  vignetteView = self->_vignetteView;
  self->_vignetteView = v3;

  uint64_t v5 = [(VideosExtrasBackgroundViewController *)self view];
  [v5 addSubview:self->_vignetteView];

  uint64_t v6 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v7 = self->_vignetteView;
  double v8 = [(VideosExtrasBackgroundViewController *)self view];
  objc_msgSend(v6, "constraintsByAttachingView:toView:alongEdges:insets:", v7, v8, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v9 = [(VideosExtrasBackgroundViewController *)self view];
  [v9 addConstraints:v10];
}

- (void)setVignetteType:(unint64_t)a3
{
  if (self->_vignetteType != a3)
  {
    self->_vignetteType = a3;
    if (a3 && !self->_vignetteView) {
      [(VideosExtrasBackgroundViewController *)self _initVignette];
    }
    id v4 = [(id)objc_opt_class() vignetteImageForType:self->_vignetteType];
    [(UIImageView *)self->_vignetteView setImage:v4];
    [(UIImageView *)self->_vignetteView setHidden:v4 == 0];
  }
}

+ (id)vignetteImageForType:(unint64_t)a3
{
  if (a3 - 1 > 3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", off_1E6DF7B28[a3 - 1], v3);
  }
  return v5;
}

- (NSArray)backgroundElements
{
  return self->_backgroundElements;
}

- (unint64_t)vignetteType
{
  return self->_vignetteType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageConstraints, 0);
  objc_storeStrong((id *)&self->_displayedImageElement, 0);
  objc_storeStrong((id *)&self->_backgroundElements, 0);
}

@end