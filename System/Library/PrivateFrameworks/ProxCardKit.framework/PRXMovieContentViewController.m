@interface PRXMovieContentViewController
- (BOOL)shouldFadeInElementsOnAppear;
- (CGSize)movieDimensions;
- (PRXMovieContentViewController)initWithMovieView:(id)a3 movieDimensions:(CGSize)a4 productHeight:(double)a5;
- (UIView)movieView;
- (double)fadeInDelay;
- (double)fadeInDuration;
- (double)productHeight;
- (void)fadeInAuxiliaryViewsOverDuration:(double)a3 delay:(double)a4 completion:(id)a5;
- (void)hideAuxiliaryViews;
- (void)setAuxiliaryViewsAlpha:(double)a3;
- (void)setFadeInDelay:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setShouldFadeInElementsOnAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PRXMovieContentViewController

- (PRXMovieContentViewController)initWithMovieView:(id)a3 movieDimensions:(CGSize)a4 productHeight:(double)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRXMovieContentViewController;
  v11 = [(PRXCardContentViewController *)&v15 initWithContentView:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_movieView, a3);
    v12->_movieDimensions.CGFloat width = width;
    v12->_movieDimensions.CGFloat height = height;
    v12->_productHeight = a5;
    v12->_fadeInDelay = 0.5;
    v12->_fadeInDuration = 1.5;
    v13 = v12;
  }

  return v12;
}

- (void)viewDidLoad
{
  v48[10] = *MEMORY[0x263EF8340];
  v47.receiver = self;
  v47.super_class = (Class)PRXMovieContentViewController;
  [(PRXCardContentViewController *)&v47 viewDidLoad];
  v3 = [(PRXMovieContentViewController *)self movieView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(PRXMovieContentViewController *)self view];
  v5 = [(PRXMovieContentViewController *)self movieView];
  [v4 addSubview:v5];

  v6 = [(PRXMovieContentViewController *)self view];
  v7 = [(PRXMovieContentViewController *)self movieView];
  [v6 sendSubviewToBack:v7];

  id v8 = objc_alloc_init(MEMORY[0x263F1C778]);
  [v8 setIdentifier:@"PRXMovieContentGuide"];
  v9 = [(PRXCardContentViewController *)self contentView];
  [v9 addLayoutGuide:v8];

  id v10 = [(PRXCardContentViewController *)self contentView];
  v11 = [v10 mainContentGuide];

  v33 = (void *)MEMORY[0x263F08938];
  v45 = [(PRXMovieContentViewController *)self movieView];
  v44 = [v45 heightAnchor];
  [(PRXMovieContentViewController *)self movieDimensions];
  v43 = [v44 constraintEqualToConstant:v12];
  v48[0] = v43;
  v42 = [(PRXMovieContentViewController *)self movieView];
  v41 = [v42 widthAnchor];
  [(PRXMovieContentViewController *)self movieDimensions];
  v40 = objc_msgSend(v41, "constraintEqualToConstant:");
  v48[1] = v40;
  v39 = [(PRXMovieContentViewController *)self movieView];
  v38 = [v39 centerXAnchor];
  v37 = [v8 centerXAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v48[2] = v36;
  v35 = [(PRXMovieContentViewController *)self movieView];
  v34 = [v35 centerYAnchor];
  v32 = [v8 centerYAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v48[3] = v31;
  v30 = [v8 heightAnchor];
  [(PRXMovieContentViewController *)self productHeight];
  v29 = objc_msgSend(v30, "constraintEqualToConstant:");
  v48[4] = v29;
  v28 = [v8 leadingAnchor];
  v27 = [v11 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v48[5] = v26;
  v25 = [v8 trailingAnchor];
  v24 = [v11 trailingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v48[6] = v23;
  v22 = [v8 topAnchor];
  v21 = [v11 topAnchor];
  v13 = [v22 constraintGreaterThanOrEqualToAnchor:v21];
  v48[7] = v13;
  v14 = [v8 bottomAnchor];
  objc_super v15 = [v11 bottomAnchor];
  v16 = [v14 constraintLessThanOrEqualToAnchor:v15];
  v48[8] = v16;
  v17 = [v8 centerYAnchor];
  v46 = v11;
  v18 = [v11 centerYAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v48[9] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:10];
  [v33 activateConstraints:v20];

  if ([(PRXMovieContentViewController *)self shouldFadeInElementsOnAppear]) {
    [(PRXMovieContentViewController *)self hideAuxiliaryViews];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PRXMovieContentViewController;
  [(PRXMovieContentViewController *)&v7 viewWillAppear:a3];
  [(PRXMovieContentViewController *)self fadeInDuration];
  double v5 = v4;
  [(PRXMovieContentViewController *)self fadeInDelay];
  [(PRXMovieContentViewController *)self fadeInAuxiliaryViewsOverDuration:0 delay:v5 completion:v6];
}

- (void)hideAuxiliaryViews
{
}

- (void)fadeInAuxiliaryViewsOverDuration:(double)a3 delay:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = (void *)MEMORY[0x263F1CB60];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke;
  v13[3] = &unk_264418170;
  v13[4] = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke_2;
  v11[3] = &unk_2644183E8;
  id v12 = v8;
  id v10 = v8;
  [v9 animateWithDuration:2 delay:v13 options:v11 animations:a3 completion:a4];
}

uint64_t __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAuxiliaryViewsAlpha:1.0];
}

uint64_t __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setAuxiliaryViewsAlpha:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v5 = [(PRXCardContentViewController *)self contentView];
  double v6 = [v5 titleTextView];
  [v6 setAlpha:a3];

  objc_super v7 = [(PRXCardContentViewController *)self contentView];
  id v8 = [v7 subtitleLabel];
  [v8 setAlpha:a3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = [(PRXCardContentViewController *)self contentView];
  id v10 = [v9 auxiliaryViews];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setAlpha:a3];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)shouldFadeInElementsOnAppear
{
  return self->_shouldFadeInElementsOnAppear;
}

- (void)setShouldFadeInElementsOnAppear:(BOOL)a3
{
  self->_shouldFadeInElementsOnAppear = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeInDelay
{
  return self->_fadeInDelay;
}

- (void)setFadeInDelay:(double)a3
{
  self->_fadeInDelay = a3;
}

- (UIView)movieView
{
  return self->_movieView;
}

- (CGSize)movieDimensions
{
  double width = self->_movieDimensions.width;
  double height = self->_movieDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)productHeight
{
  return self->_productHeight;
}

- (void).cxx_destruct
{
}

@end