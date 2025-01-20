@interface VideosExtrasShowcaseTemplateViewController
- (BOOL)showsPlaceholder;
- (BOOL)supportsOneupMode;
- (IKShowcaseTemplate)templateElement;
- (NSArray)bannerButtonElements;
- (NSArray)carouselLockupElements;
- (NSDictionary)overriddenFullscreenImages;
- (VideosExtrasCarouselViewController)carouselViewController;
- (VideosExtrasImageBrowserViewController)imageBrowserViewController;
- (VideosExtrasShowcaseTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5;
- (VideosExtrasZoomingImageTransitionController)activeZoomingImageInteractiveTransitionController;
- (id)_mainChildViewController;
- (id)animationControllerForNavigationOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (unint64_t)autohighlightIndex;
- (unint64_t)indexOfVisibleItem;
- (unint64_t)numberOfImagesForBrowserViewController:(id)a3;
- (unint64_t)numberOfItemsInCarouselViewController:(id)a3;
- (void)_loadTextElement:(id)a3 textAttributes:(id)a4 withCompletionHandler:(id)a5;
- (void)_prepareLayout;
- (void)_pushImageBrowserWithVisibleItemIndex:(unint64_t)a3;
- (void)carouselViewController:(id)a3 configureCarouselCollectionViewCell:(id)a4 forItemAtIndex:(unint64_t)a5 withThumbnailImageContainerSize:(CGSize)a6;
- (void)carouselViewController:(id)a3 didHighlightItemAtIndex:(unint64_t)a4;
- (void)carouselViewController:(id)a3 didSelectItemAtIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)handlePinchGestureForZoomingImageInteractiveTransitionWithContext:(id)a3;
- (void)imageBrowserViewController:(id)a3 loadDescriptionAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)imageBrowserViewController:(id)a3 loadImageAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)imageBrowserViewController:(id)a3 loadSubtitleAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)imageBrowserViewController:(id)a3 loadTitleAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setActiveZoomingImageInteractiveTransitionController:(id)a3;
- (void)setAutohighlightIndex:(unint64_t)a3;
- (void)setBannerButtonElements:(id)a3;
- (void)setCarouselLockupElements:(id)a3;
- (void)setCarouselViewController:(id)a3;
- (void)setImageBrowserViewController:(id)a3;
- (void)setOverriddenFullscreenImages:(id)a3;
- (void)setSupportsOneupMode:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VideosExtrasShowcaseTemplateViewController

- (VideosExtrasShowcaseTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  v5 = [(VideosExtrasTemplateViewController *)&v29 initWithDocument:a3 options:a4 context:a5];
  v6 = v5;
  if (v5)
  {
    v20 = [(VideosExtrasShowcaseTemplateViewController *)v5 templateElement];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = v6;
    v6->_autohighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
    v19 = [v20 carousel];
    v8 = [v19 sections];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [v13 items];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __79__VideosExtrasShowcaseTemplateViewController_initWithDocument_options_context___block_invoke;
            v22[3] = &unk_1E6DFB2D0;
            v23 = v7;
            id v24 = v21;
            [v14 enumerateObjectsUsingBlock:v22];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }
    v6 = v7;
    [(VideosExtrasShowcaseTemplateViewController *)v7 setCarouselLockupElements:v21];
    v15 = [v20 modes];
    uint64_t v16 = [v15 containsObject:*MEMORY[0x1E4F6EF98]];
    [(VideosExtrasShowcaseTemplateViewController *)v7 setSupportsOneupMode:v16];
    if ([v15 containsObject:*MEMORY[0x1E4F6EFA0]])
    {
      v17 = objc_alloc_init(VideosExtrasCarouselViewController);
      [(VideosExtrasCarouselViewController *)v17 setDataSource:v7];
      [(VideosExtrasCarouselViewController *)v17 setDelegate:v7];
      [(VideosExtrasShowcaseTemplateViewController *)v7 setCarouselViewController:v17];
      if (!v17) {
        goto LABEL_17;
      }
    }
    else
    {
      if (!v16) {
        goto LABEL_17;
      }
      v17 = objc_alloc_init(VideosExtrasImageBrowserViewController);
      [(VideosExtrasShowcaseTemplateViewController *)v7 setImageBrowserViewController:v17];
      [(VideosExtrasCarouselViewController *)v17 addObserver:v7 forKeyPath:@"title" options:0 context:0];
      [(VideosExtrasCarouselViewController *)v17 setDataSource:v7];
      [(VideosExtrasCarouselViewController *)v17 setVisibleImageIndex:v7->_autohighlightIndex];
      if (!v17) {
        goto LABEL_17;
      }
    }
    [(VideosExtrasShowcaseTemplateViewController *)v7 addChildViewController:v17];
    [(VideosExtrasCarouselViewController *)v17 didMoveToParentViewController:v7];

LABEL_17:
  }
  return v6;
}

void __79__VideosExtrasShowcaseTemplateViewController_initWithDocument_options_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v6 autoHighlightIdentifier];

    if (v5) {
      *(void *)(*(void *)(a1 + 32) + 1088) = a3;
    }
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)dealloc
{
  v3 = [(VideosExtrasShowcaseTemplateViewController *)self _mainChildViewController];
  v4 = v3;
  if (v3)
  {
    [v3 willMoveToParentViewController:0];
    if ([v4 isViewLoaded])
    {
      v5 = [v4 view];
      [v5 removeFromSuperview];
    }
    [v4 removeFromParentViewController];
  }
  id v6 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];
  [v6 setDataSource:0];
  [v6 setDelegate:0];
  v7 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
  [v7 setDataSource:0];
  [v7 setZoomingImageInteractiveTransitionSource:0];
  if (v4 == v7) {
    [v4 removeObserver:self forKeyPath:@"title" context:0];
  }

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v8 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
  id v14 = [(VideosExtrasShowcaseTemplateViewController *)self _mainChildViewController];
  if (v13 != v11 || v13 != v14)
  {

    goto LABEL_6;
  }
  int v15 = [v10 isEqualToString:@"title"];

  if (!v15)
  {
LABEL_6:
    v17.receiver = self;
    v17.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
    [(VideosExtrasShowcaseTemplateViewController *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_7;
  }
  uint64_t v16 = [v11 title];
  [(VideosExtrasShowcaseTemplateViewController *)self setTitle:v16];

LABEL_7:
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v33 viewDidLoad];
  v3 = [(VideosExtrasShowcaseTemplateViewController *)self templateElement];
  v4 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v3 background];

  if (v6)
  {
    v7 = [v3 background];
    [v5 addObject:v7];
  }
  objc_super v8 = [v3 documentBanner];
  uint64_t v9 = [v8 background];

  if (v9)
  {
    id v10 = [v3 documentBanner];
    id v11 = [v10 background];
    [v5 addObject:v11];
  }
  [(VideosExtrasTemplateViewController *)self configureBackgroundWithElements:v5];
  if (v4)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [(VideosExtrasShowcaseTemplateViewController *)self title];
  }
  id v13 = [v3 documentBanner];
  [(VideosExtrasElementViewController *)self _configureBannerWithElement:v13];

  if (!v4)
  {
    id v14 = [(VideosExtrasShowcaseTemplateViewController *)self navigationItem];
    int v15 = [(VideosExtrasShowcaseTemplateViewController *)self title];
    [v14 setBackButtonTitle:v15];

    [(VideosExtrasShowcaseTemplateViewController *)self setTitle:v12];
  }
  uint64_t v16 = [v4 view];
  if (!v16)
  {
    objc_super v17 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
    uint64_t v16 = [v17 view];

    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [v16 setBackgroundColor:v18];
  }
  v19 = [(VideosExtrasShowcaseTemplateViewController *)self view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 addSubview:v16];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = (void *)MEMORY[0x1E4F28DC8];
  if (v4)
  {
    v22 = [v19 safeAreaLayoutGuide];
    v23 = [v21 constraintWithItem:v16 attribute:3 relatedBy:0 toItem:v22 attribute:3 multiplier:1.0 constant:0.0];
    [v20 addObject:v23];

    id v24 = (void *)MEMORY[0x1E4F28DC8];
    double v25 = *MEMORY[0x1E4FB2848];
    double v26 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v28 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    objc_super v29 = v16;
    v30 = v19;
    uint64_t v31 = 14;
  }
  else
  {
    double v25 = *MEMORY[0x1E4FB2848];
    double v26 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v28 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    id v24 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v29 = v16;
    v30 = v19;
    uint64_t v31 = 15;
  }
  v32 = objc_msgSend(v24, "constraintsByAttachingView:toView:alongEdges:insets:", v29, v30, v31, v25, v26, v27, v28);
  [v20 addObjectsFromArray:v32];

  [v19 addConstraints:v20];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v4 viewDidDisappear:a3];
  [(VideosExtrasShowcaseTemplateViewController *)self setActiveZoomingImageInteractiveTransitionController:0];
  [(VideosExtrasShowcaseTemplateViewController *)self setOverriddenFullscreenImages:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  [(VideosExtrasElementViewController *)&v12 viewWillAppear:a3];
  uint64_t v4 = 1088;
  if (self->_autohighlightIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];

    if (v5)
    {
      id v6 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];
      [v6 setIndexOfVisibleItem:self->_autohighlightIndex];
    }
    else
    {
      id v6 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
      [v6 setVisibleImageIndex:self->_autohighlightIndex];
    }

    self->_autohighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v4 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
    BOOL v8 = v4 != 0;
  }
  uint64_t v9 = [(VideosExtrasTemplateViewController *)self context];
  id v10 = [v9 extrasRootViewController];
  id v11 = [v10 mainMenuBar];
  [v11 setHidden:v8];

  if (!v7) {
}
  }

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];

  if (v4)
  {
    id v5 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
    [v5 setDataSource:0];
    [v5 setZoomingImageInteractiveTransitionSource:0];
    [(VideosExtrasShowcaseTemplateViewController *)self setImageBrowserViewController:0];
  }
  [(VideosExtrasShowcaseTemplateViewController *)self setActiveZoomingImageInteractiveTransitionController:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  [(VideosExtrasShowcaseTemplateViewController *)&v7 viewWillDisappear:a3];
  uint64_t v4 = [(VideosExtrasTemplateViewController *)self context];
  id v5 = [v4 extrasRootViewController];
  objc_super v6 = [v5 mainMenuBar];
  [v6 setHidden:0];
}

- (IKShowcaseTemplate)templateElement
{
  v2 = [(VideosExtrasTemplateViewController *)self document];
  v3 = [v2 templateElement];

  return (IKShowcaseTemplate *)v3;
}

- (BOOL)showsPlaceholder
{
  return 0;
}

- (void)_prepareLayout
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasShowcaseTemplateViewController;
  [(VideosExtrasElementViewController *)&v4 _prepareLayout];
  v3 = [(VideosExtrasElementViewController *)self backgroundViewController];
  [v3 setVignetteType:3];
}

- (unint64_t)numberOfItemsInCarouselViewController:(id)a3
{
  v3 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)carouselViewController:(id)a3 configureCarouselCollectionViewCell:(id)a4 forItemAtIndex:(unint64_t)a5 withThumbnailImageContainerSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  v109[2] = *MEMORY[0x1E4F143B8];
  id v96 = a4;
  v85 = self;
  id v10 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
  unint64_t v83 = a5;
  v95 = [v10 objectAtIndex:a5];

  v93 = [v96 titleTextStyle];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:");
  uint64_t v107 = *MEMORY[0x1E4FB0700];
  uint64_t v12 = v107;
  id v13 = [MEMORY[0x1E4FB1618] whiteColor];
  v109[0] = v13;
  uint64_t v108 = *MEMORY[0x1E4FB06F8];
  uint64_t v14 = v108;
  v92 = (void *)v11;
  int v15 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
  v109[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:&v107 count:2];

  v90 = [v96 subtitleTextStyle];
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:");
  v105[0] = v12;
  v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
  v105[1] = v14;
  v106[0] = v18;
  v89 = (void *)v17;
  v19 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v17 size:0.0];
  v106[1] = v19;
  v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];

  v88 = [v96 descriptionTextStyle];
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:");
  v103[0] = v12;
  id v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.6 alpha:1.0];
  v103[1] = v14;
  v104[0] = v21;
  v87 = (void *)v20;
  v22 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v20 size:0.0];
  v104[1] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:2];

  id v24 = [v95 title];
  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28E48]);
    double v26 = [v24 text];
    double v27 = [v26 string];
    double v28 = (void *)[v25 initWithString:v27 attributes:v16];

    objc_super v29 = [v24 textAttributes];
    objc_msgSend(v28, "addAttributes:range:", v29, 0, objc_msgSend(v28, "length"));
    [v96 setTitleText:v28];
  }
  v91 = (void *)v16;
  v30 = [v95 subtitle];
  if (v30)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28E48]);
    v32 = [v30 text];
    objc_super v33 = [v32 string];
    v34 = (void *)[v31 initWithString:v33 attributes:v94];

    v35 = [v30 textAttributes];
    objc_msgSend(v34, "addAttributes:range:", v35, 0, objc_msgSend(v34, "length"));
    [v96 setSubtitleText:v34];
  }
  v36 = [v95 descriptionText];
  if (v36)
  {
    id v37 = objc_alloc(MEMORY[0x1E4F28E48]);
    v38 = [v36 text];
    v39 = [v38 string];
    v40 = (void *)[v37 initWithString:v39 attributes:v23];

    v41 = [v36 textAttributes];
    objc_msgSend(v40, "addAttributes:range:", v41, 0, objc_msgSend(v40, "length"));
    [v96 setDescriptionText:v40];
  }
  v86 = v24;
  v42 = [v95 overlays];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v43 = [v42 children];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v98 objects:v102 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    v46 = v30;
    v47 = v23;
    v48 = v42;
    uint64_t v49 = *(void *)v99;
    while (2)
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v99 != v49) {
          objc_enumerationMutation(v43);
        }
        v51 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v52 = [v51 resourceImage];
          goto LABEL_17;
        }
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v98 objects:v102 count:16];
      if (v45) {
        continue;
      }
      break;
    }
    v52 = 0;
LABEL_17:
    v42 = v48;
    v23 = v47;
    v30 = v46;
  }
  else
  {
    v52 = 0;
  }

  objc_msgSend(v96, "setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:", -[VideosExtrasShowcaseTemplateViewController supportsOneupMode](v85, "supportsOneupMode"));
  v53 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v54 = [v53 userInterfaceIdiom];

  if (v54)
  {
    v55 = [v95 image];
    v56 = (void *)MEMORY[0x1E4FB1818];
    v57 = [v55 placeholderURL];
    v58 = [v56 imageForPlaceholderURL:v57];
    [v96 setThumbnailImagePlaceholder:v58];

    v59 = [v55 accessibilityText];
    [v96 setThumbnailImageAccessibilityText:v59];

    v60 = [v55 borderColor];
    v61 = v60;
    if (v60)
    {
      id v62 = v60;
    }
    else
    {
      v66 = [MEMORY[0x1E4FB1618] whiteColor];
      id v62 = [v66 colorWithAlphaComponent:0.2];
    }
    v67 = v91;

    [v96 setThumbnailBorderColor:v62];
    if (v52) {
      [v96 setThumbnailOverlayImage:v52];
    }
    v68 = [v55 artworkCatalog];
    objc_msgSend(v68, "setFittingSize:", width, height);
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __152__VideosExtrasShowcaseTemplateViewController_carouselViewController_configureCarouselCollectionViewCell_forItemAtIndex_withThumbnailImageContainerSize___block_invoke_2;
    v97[3] = &__block_descriptor_40_e60_v24__0__VideosExtrasCarouselCollectionViewCell_8__UIImage_16l;
    v97[4] = v83;
    [v68 setDestination:v96 configurationBlock:v97];
LABEL_44:

    goto LABEL_45;
  }
  uint64_t v63 = [(VideosExtrasElementViewController *)v85 extrasSize];
  double v64 = 175.0;
  if (v63)
  {
    if (v63 == 2)
    {
      double v64 = 220.0;
      double v65 = 300.0;
    }
    else if (v63 == 1)
    {
      double v65 = 260.0;
    }
    else
    {
      double v64 = 270.0;
      double v65 = 335.0;
    }
  }
  else
  {
    double v65 = 205.0;
  }
  objc_msgSend(v96, "setThumbnailMaxSize:", v65, v64);
  v69 = [v95 image];
  v55 = v69;
  if (v69)
  {
    v81 = v42;
    id v62 = [v69 placeholderURL];
    v68 = [MEMORY[0x1E4FB1818] imageForPlaceholderURL:v62];
    [v96 setThumbnailImagePlaceholder:v68];
    v70 = [v55 borderColor];
    v71 = v70;
    v84 = v30;
    if (v70)
    {
      id v72 = v70;
    }
    else
    {
      v73 = [MEMORY[0x1E4FB1618] whiteColor];
      id v72 = [v73 colorWithAlphaComponent:0.2];
    }
    v82 = v36;

    [v96 setThumbnailBorderColor:v72];
    if (v52) {
      [v96 setThumbnailOverlayImage:v52];
    }
    v74 = [v55 artworkCatalog];
    objc_msgSend(v74, "setFittingSize:", v65, v64);
    v75 = [(VideosExtrasShowcaseTemplateViewController *)v85 view];
    v76 = [v75 window];
    v77 = [v76 screen];
    [v77 scale];
    double v79 = v78;

    if (v79 == 0.0)
    {
      v80 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v80 scale];
      objc_msgSend(v74, "setDestinationScale:");
    }
    else
    {
      [v74 setDestinationScale:v79];
    }
    v67 = v91;
    v36 = v82;
    v30 = v84;
    [v74 setDestination:v96 configurationBlock:&__block_literal_global_126];

    v42 = v81;
    goto LABEL_44;
  }
  v67 = v91;
LABEL_45:
}

uint64_t __152__VideosExtrasShowcaseTemplateViewController_carouselViewController_configureCarouselCollectionViewCell_forItemAtIndex_withThumbnailImageContainerSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(a2, "setThumbnailImage:");
  }
  return result;
}

void __152__VideosExtrasShowcaseTemplateViewController_carouselViewController_configureCarouselCollectionViewCell_forItemAtIndex_withThumbnailImageContainerSize___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5 && [v6 itemIndex] == *(void *)(a1 + 32)) {
    [v6 setThumbnailImage:v5];
  }
}

- (void)carouselViewController:(id)a3 didHighlightItemAtIndex:(unint64_t)a4
{
  id v5 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
  id v6 = [v5 objectAtIndex:a4];

  [v6 dispatchEventOfType:4 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
}

- (void)carouselViewController:(id)a3 didSelectItemAtIndex:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  BOOL v8 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
  uint64_t v9 = [v8 objectAtIndex:a4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke;
  v11[3] = &unk_1E6DFB338;
  v11[4] = self;
  id v12 = v7;
  unint64_t v13 = a4;
  id v10 = v7;
  [v9 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:v11];
}

void __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke(void *a1, char a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6DF5A80;
  char v9 = a2;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __108__VideosExtrasShowcaseTemplateViewController_carouselViewController_didSelectItemAtIndex_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    int v4 = [*(id *)(a1 + 32) supportsOneupMode];
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      return [v5 _pushImageBrowserWithVisibleItemIndex:v6];
    }
  }
  return result;
}

- (unint64_t)numberOfImagesForBrowserViewController:(id)a3
{
  v3 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)imageBrowserViewController:(id)a3 loadImageAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  char v9 = (void (**)(id, void *))a5;
  id v10 = [(VideosExtrasShowcaseTemplateViewController *)self overriddenFullscreenImages];
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  id v12 = [v10 objectForKey:v11];

  if (v12)
  {
    v9[2](v9, v12);
  }
  else
  {
    unint64_t v13 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
    uint64_t v14 = [v13 objectAtIndex:a4];

    int v15 = [v14 image];
    uint64_t v16 = [v8 view];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    id v21 = [v15 artworkCatalog];
    objc_msgSend(v21, "setFittingSize:", v18, v20);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke;
    v22[3] = &unk_1E6DFB360;
    v23 = v9;
    [v21 requestImageWithCompletion:v22];
  }
}

void __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke_2;
      v7[3] = &unk_1E6DF41E8;
      id v9 = *(id *)(a1 + 32);
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

uint64_t __112__VideosExtrasShowcaseTemplateViewController_imageBrowserViewController_loadImageAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)imageBrowserViewController:(id)a3 loadTitleAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void))a5;
  if ([(VideosExtrasElementViewController *)self isWide])
  {
    id v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
    v15[0] = *MEMORY[0x1E4FB0700];
    id v9 = [MEMORY[0x1E4FB1618] whiteColor];
    v16[0] = v9;
    v15[1] = *MEMORY[0x1E4FB06F8];
    id v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
    v16[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    id v12 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
    unint64_t v13 = [v12 objectAtIndex:a4];

    uint64_t v14 = [v13 title];
    [(VideosExtrasShowcaseTemplateViewController *)self _loadTextElement:v14 textAttributes:v11 withCompletionHandler:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)imageBrowserViewController:(id)a3 loadSubtitleAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void))a5;
  if ([(VideosExtrasElementViewController *)self isWide])
  {
    id v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D0]];
    v15[0] = *MEMORY[0x1E4FB0700];
    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
    v16[0] = v9;
    v15[1] = *MEMORY[0x1E4FB06F8];
    id v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
    v16[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    id v12 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
    unint64_t v13 = [v12 objectAtIndex:a4];

    uint64_t v14 = [v13 subtitle];
    [(VideosExtrasShowcaseTemplateViewController *)self _loadTextElement:v14 textAttributes:v11 withCompletionHandler:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)imageBrowserViewController:(id)a3 loadDescriptionAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void))a5;
  if ([(VideosExtrasElementViewController *)self isWide])
  {
    id v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8]];
    v15[0] = *MEMORY[0x1E4FB0700];
    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.6 alpha:1.0];
    v16[0] = v9;
    v15[1] = *MEMORY[0x1E4FB06F8];
    id v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
    v16[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    id v12 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
    unint64_t v13 = [v12 objectAtIndex:a4];

    uint64_t v14 = [v13 descriptionText];
    [(VideosExtrasShowcaseTemplateViewController *)self _loadTextElement:v14 textAttributes:v11 withCompletionHandler:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (id)animationControllerForNavigationOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v8 = (VideosExtrasShowcaseTemplateViewController *)a4;
  id v9 = (VideosExtrasShowcaseTemplateViewController *)a5;
  id v10 = v9;
  BOOL v11 = a3 == 1 && v8 == self;
  uint64_t v12 = v11;
  if (v11)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v14 = v10;
    if (isKindOfClass) {
      goto LABEL_17;
    }
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();
    uint64_t v16 = v10;
    if ((v15 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_11;
  }
  v22 = 0;
  double v18 = 0;
  v23 = 0;
  if (a3 == 2 && v9 == self)
  {
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();
    uint64_t v14 = v8;
    if (v24)
    {
LABEL_17:
      v22 = v14;
      if (v22)
      {
        uint64_t v25 = [(VideosExtrasShowcaseTemplateViewController *)self activeZoomingImageInteractiveTransitionController];
        if (v25)
        {
          v23 = (VideosExtrasZoomingImageTransitionController *)v25;
        }
        else
        {
          v23 = [[VideosExtrasZoomingImageTransitionController alloc] initWithItemIndex:[(VideosExtrasShowcaseTemplateViewController *)v22 visibleImageIndex] forInteractiveTransition:0];
          [(VideosExtrasZoomingImageTransitionController *)v23 setShouldUseSpringAnimation:v12];
        }
        double v18 = 0;
        goto LABEL_39;
      }
      goto LABEL_22;
    }
    objc_opt_class();
    char v26 = objc_opt_isKindOfClass();
    uint64_t v16 = v8;
    if ((v26 & 1) == 0)
    {
LABEL_21:
      v22 = 0;
LABEL_22:
      double v18 = 0;
LABEL_23:
      v23 = 0;
      goto LABEL_39;
    }
LABEL_11:
    double v17 = v16;
    double v18 = v17;
    if (!v17)
    {
      v22 = 0;
      goto LABEL_23;
    }
    double v19 = [(VideosExtrasShowcaseTemplateViewController *)v17 slideshowViewController];
    double v20 = v19;
    if (a3 == 1) {
      uint64_t v21 = [(VideosExtrasShowcaseTemplateViewController *)self indexOfVisibleItem];
    }
    else {
      uint64_t v21 = [v19 visibleImageIndex];
    }
    unint64_t v27 = v21;
    double v28 = [(VideosExtrasShowcaseTemplateViewController *)self carouselLockupElements];
    if (v27 >= [v28 count])
    {
      v23 = 0;
LABEL_38:

      v22 = 0;
      goto LABEL_39;
    }
    objc_super v29 = [v28 objectAtIndex:v27];
    v30 = [v29 image];
    if ([(VideosExtrasShowcaseTemplateViewController *)v18 shouldPerformZoomingImageTransitionFromImageElement:v30 toImageAtIndex:v27])
    {
    }
    else
    {
      [v29 fullscreenImage];
      id v31 = v34 = v29;
      int v33 = [(VideosExtrasShowcaseTemplateViewController *)v18 shouldPerformZoomingImageTransitionFromImageElement:v31 toImageAtIndex:v27];

      objc_super v29 = v34;
      if (!v33)
      {
        v23 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    if (a3 == 1) {
      [v20 setVisibleImageIndex:v27];
    }
    v23 = [[VideosExtrasZoomingImageTransitionController alloc] initWithItemIndex:v27 forInteractiveTransition:0];
    [(VideosExtrasZoomingImageTransitionController *)v23 setShouldUseSpringAnimation:v12];
    goto LABEL_37;
  }
LABEL_39:

  return v23;
}

- (void)handlePinchGestureForZoomingImageInteractiveTransitionWithContext:(id)a3
{
  id v15 = a3;
  unint64_t v4 = [v15 pinchGestureRecognizer];
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    BOOL v11 = [(VideosExtrasShowcaseTemplateViewController *)self activeZoomingImageInteractiveTransitionController];
    [(VideosExtrasZoomingImageTransitionController *)v11 completeInteractiveTransitionWithPinchGestureRecognizer:v4];
LABEL_19:

    goto LABEL_20;
  }
  if (v5 == 2)
  {
    BOOL v11 = [(VideosExtrasShowcaseTemplateViewController *)self activeZoomingImageInteractiveTransitionController];
    [(VideosExtrasZoomingImageTransitionController *)v11 updateInteractiveTransitionWithPinchGestureRecognizer:v4];
    goto LABEL_19;
  }
  if (v5 == 1)
  {
    char v6 = [v15 supportedZoomingImageTransitionDirections];
    [v4 velocity];
    if (v7 >= 0.0 && (v6 & 1) != 0 || (v8 = 0, int v9 = 0, v7 < 0.0) && (v6 & 2) != 0)
    {
      id v10 = [v15 identifier];
      int v8 = [v10 isEqualToString:@"VideosExtrasCarouselZoomingImageTransitionIdentifier"];
      if (v8) {
        int v9 = 0;
      }
      else {
        int v9 = [v10 isEqualToString:@"VideosExtrasImageBrowserZoomingImageTransitionIdentifier"];
      }
    }
    if ((v8 & 1) != 0 || v9)
    {
      uint64_t v12 = [v15 itemIndex];
      BOOL v11 = [[VideosExtrasZoomingImageTransitionController alloc] initWithItemIndex:v12 forInteractiveTransition:1];
      [(VideosExtrasShowcaseTemplateViewController *)self setActiveZoomingImageInteractiveTransitionController:v11];
      [(VideosExtrasZoomingImageTransitionController *)v11 prepareInteractiveTransitionWithPinchGestureRecognizer:v4];
      if (v8)
      {
        [(VideosExtrasShowcaseTemplateViewController *)self _pushImageBrowserWithVisibleItemIndex:v12];
      }
      else
      {
        unint64_t v13 = [(VideosExtrasShowcaseTemplateViewController *)self navigationController];
        id v14 = (id)[v13 popViewControllerAnimated:1];
      }
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appearState];
  if (v5 == 1)
  {
    int v8 = [(VideosExtrasTemplateViewController *)self context];
    int v9 = [v8 extrasRootViewController];
    id v10 = [v9 mainTemplateViewController];
    BOOL v11 = [v10 menuBarView];
    uint64_t v12 = v11;
    double v13 = 0.0;
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    char v6 = [(VideosExtrasElementViewController *)self backgroundViewController];
    double v7 = [v6 view];
    [v7 setAlpha:0.0];

    int v8 = [(VideosExtrasTemplateViewController *)self context];
    int v9 = [v8 extrasRootViewController];
    id v10 = [v9 mainTemplateViewController];
    BOOL v11 = [v10 menuBarView];
    uint64_t v12 = v11;
    double v13 = 1.0;
  }
  [v11 setAlpha:v13];

LABEL_6:
  id v14 = [(VideosExtrasShowcaseTemplateViewController *)self _mainChildViewController];
  [v14 prepareZoomingImageTransitionWithContext:v4];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appearState];
  if (v5 == 1)
  {
    id v14 = [(VideosExtrasElementViewController *)self backgroundViewController];
    id v15 = [v14 view];
    [v15 setAlpha:0.0];

    int v8 = [(VideosExtrasTemplateViewController *)self context];
    int v9 = [v8 extrasRootViewController];
    id v10 = [v9 mainTemplateViewController];
    BOOL v11 = [v10 menuBarView];
    uint64_t v12 = v11;
    double v13 = 0.0;
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    char v6 = [(VideosExtrasElementViewController *)self backgroundViewController];
    double v7 = [v6 view];
    [v7 setAlpha:1.0];

    int v8 = [(VideosExtrasTemplateViewController *)self context];
    int v9 = [v8 extrasRootViewController];
    id v10 = [v9 mainTemplateViewController];
    BOOL v11 = [v10 menuBarView];
    uint64_t v12 = v11;
    double v13 = 1.0;
  }
  [v11 setAlpha:v13];

LABEL_6:
  id v16 = [(VideosExtrasShowcaseTemplateViewController *)self _mainChildViewController];
  [v16 performZoomingImageTransitionWithContext:v4];
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 appearState];
  if (v7)
  {
    if (v7 != 1) {
      goto LABEL_12;
    }
    if (v4) {
      double v8 = 0.0;
    }
    else {
      double v8 = 1.0;
    }
    int v9 = [(VideosExtrasTemplateViewController *)self context];
    id v10 = [v9 extrasRootViewController];
    BOOL v11 = [v10 mainTemplateViewController];
    uint64_t v12 = [v11 menuBarView];
    [v12 setAlpha:v8];

    double v13 = [(VideosExtrasElementViewController *)self backgroundViewController];
    id v14 = [v13 view];
    [v14 setAlpha:1.0];
  }
  else
  {
    if (v4) {
      double v15 = 1.0;
    }
    else {
      double v15 = 0.0;
    }
    double v13 = [(VideosExtrasTemplateViewController *)self context];
    id v14 = [v13 extrasRootViewController];
    id v16 = [v14 mainTemplateViewController];
    double v17 = [v16 menuBarView];
    [v17 setAlpha:v15];
  }
LABEL_12:
  id v18 = [(VideosExtrasShowcaseTemplateViewController *)self _mainChildViewController];
  [v18 finalizeZoomingImageTransitionWithContext:v6 transitionFinished:v4];
}

- (unint64_t)indexOfVisibleItem
{
  v3 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];
  BOOL v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 indexOfVisibleItem];
  }
  else
  {
    id v6 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
    uint64_t v7 = v6;
    if (v6) {
      unint64_t v5 = [v6 visibleImageIndex];
    }
    else {
      unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (void)_loadTextElement:(id)a3 textAttributes:(id)a4 withCompletionHandler:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  if (v16)
  {
    double v8 = (objc_class *)MEMORY[0x1E4F28E48];
    int v9 = (void (**)(id, id))a5;
    id v10 = [v8 alloc];
    BOOL v11 = [v16 text];
    uint64_t v12 = [v11 string];
    id v13 = (id)[v10 initWithString:v12 attributes:v7];

    id v14 = [v16 textAttributes];
    objc_msgSend(v13, "addAttributes:range:", v14, 0, objc_msgSend(v13, "length"));
    v9[2](v9, v13);
  }
  else
  {
    double v15 = (void (*)(void))*((void *)a5 + 2);
    id v13 = a5;
    v15();
  }
}

- (id)_mainChildViewController
{
  v3 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(VideosExtrasShowcaseTemplateViewController *)self imageBrowserViewController];
  }
  id v6 = v5;

  return v6;
}

- (void)_pushImageBrowserWithVisibleItemIndex:(unint64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(VideosExtrasShowcaseTemplateViewController *)self carouselViewController];
  id v6 = [v5 carouselCollectionViewCellForItemAtIndex:a3];

  id v7 = [v6 thumbnailImage];
  if (v7)
  {
    double v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    uint64_t v12 = v8;
    v13[0] = v7;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [(VideosExtrasShowcaseTemplateViewController *)self setOverriddenFullscreenImages:v9];
  }
  id v10 = objc_alloc_init(VideosExtrasImageBrowserViewController);
  [(VideosExtrasImageBrowserViewController *)v10 setDataSource:self];
  [(VideosExtrasImageBrowserViewController *)v10 setVisibleImageIndex:a3];
  [(VideosExtrasImageBrowserViewController *)v10 setAllowsPinchingImageForInteractiveZoomingImageTransition:1];
  [(VideosExtrasImageBrowserViewController *)v10 setZoomingImageInteractiveTransitionSource:self];
  [(VideosExtrasShowcaseTemplateViewController *)self setImageBrowserViewController:v10];
  BOOL v11 = [(VideosExtrasShowcaseTemplateViewController *)self navigationController];
  [v11 pushViewController:v10 animated:1];
}

- (VideosExtrasZoomingImageTransitionController)activeZoomingImageInteractiveTransitionController
{
  return self->_activeZoomingImageInteractiveTransitionController;
}

- (void)setActiveZoomingImageInteractiveTransitionController:(id)a3
{
}

- (NSArray)bannerButtonElements
{
  return self->_bannerButtonElements;
}

- (void)setBannerButtonElements:(id)a3
{
}

- (NSArray)carouselLockupElements
{
  return self->_carouselLockupElements;
}

- (void)setCarouselLockupElements:(id)a3
{
}

- (VideosExtrasCarouselViewController)carouselViewController
{
  return self->_carouselViewController;
}

- (void)setCarouselViewController:(id)a3
{
}

- (VideosExtrasImageBrowserViewController)imageBrowserViewController
{
  return self->_imageBrowserViewController;
}

- (void)setImageBrowserViewController:(id)a3
{
}

- (NSDictionary)overriddenFullscreenImages
{
  return self->_overriddenFullscreenImages;
}

- (void)setOverriddenFullscreenImages:(id)a3
{
}

- (BOOL)supportsOneupMode
{
  return self->_supportsOneupMode;
}

- (void)setSupportsOneupMode:(BOOL)a3
{
  self->_supportsOneupMode = a3;
}

- (unint64_t)autohighlightIndex
{
  return self->_autohighlightIndex;
}

- (void)setAutohighlightIndex:(unint64_t)a3
{
  self->_autohighlightIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenFullscreenImages, 0);
  objc_storeStrong((id *)&self->_imageBrowserViewController, 0);
  objc_storeStrong((id *)&self->_carouselViewController, 0);
  objc_storeStrong((id *)&self->_carouselLockupElements, 0);
  objc_storeStrong((id *)&self->_bannerButtonElements, 0);
  objc_storeStrong((id *)&self->_activeZoomingImageInteractiveTransitionController, 0);
}

@end