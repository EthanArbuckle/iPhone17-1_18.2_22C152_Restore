@interface SXMapComponentView
- ($4137A935A6BBB85B3D0ECB651BA01BF7)region;
- ($D6E06D00CA255A0C0B2BA890DDD3F671)mapRect;
- (BOOL)areBarsHidden;
- (BOOL)hasSelectedAnnotations;
- (BOOL)isPresentingFullscreen;
- (BOOL)isUserInteractingWithMap;
- (MKMapView)mapView;
- (NSArray)annotations;
- (NSArray)toolbarItems;
- (NSCache)cachedSnapshots;
- (SXDocumentTitleProviding)documentTitleProvider;
- (SXFullscreenCanvasViewController)fullScreenCanvasViewController;
- (SXMapComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 documentTitleProvider:(id)a9;
- (SXMapSnapShotter)snapShotter;
- (SXMediaEngageEvent)activeMediaEngageEvent;
- (UIBarButtonItem)doneBarButtonItem;
- (UIImageView)imageView;
- (UISegmentedControl)segmentedControl;
- (UITapGestureRecognizer)tapGesture;
- (id)mapTitle;
- (id)snapShotCancelHandler;
- (unint64_t)analyticsMediaType;
- (unint64_t)mapTypeForSegmentIndex:(unint64_t)a3;
- (unint64_t)segmentIndexForMapType:(unint64_t)a3;
- (void)cancelSnapShot;
- (void)configureMapView;
- (void)createMediaEngageEvent;
- (void)createSnapShot;
- (void)dealloc;
- (void)discardContents;
- (void)dismissFullScreen;
- (void)enableMapViewInteraction:(BOOL)a3;
- (void)finishMediaEngageEvent;
- (void)handleTap:(id)a3;
- (void)mapTypeChanged:(id)a3;
- (void)memoryWarning:(id)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)presentFullScreen;
- (void)renderContents;
- (void)setActiveMediaEngageEvent:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setDoneBarButtonItem:(id)a3;
- (void)setFullScreenCanvasViewController:(id)a3;
- (void)setMapRect:(id)a3;
- (void)setMapView:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSnapShotCancelHandler:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setToolbarItems:(id)a3;
- (void)setupNavigationBar;
- (void)setupToolbar;
- (void)submitEvents;
- (void)submitMediaEngageCompleteEvent;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SXMapComponentView

- (SXMapComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 documentTitleProvider:(id)a9
{
  id v16 = a9;
  v30.receiver = self;
  v30.super_class = (Class)SXMapComponentView;
  v17 = [(SXMediaComponentView *)&v30 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6 analyticsReporting:a7 appStateMonitor:a8];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_documentTitleProvider, a9);
    v19 = objc_alloc_init(SXMapSnapShotter);
    snapShotter = v18->_snapShotter;
    v18->_snapShotter = v19;

    v21 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    imageView = v18->_imageView;
    v18->_imageView = v21;

    [(UIImageView *)v18->_imageView setUserInteractionEnabled:1];
    v23 = [(SXComponentView *)v18 contentView];
    [v23 addSubview:v18->_imageView];

    v24 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedSnapshots = v18->_cachedSnapshots;
    v18->_cachedSnapshots = v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v18 action:sel_handleTap_];
    tapGesture = v18->_tapGesture;
    v18->_tapGesture = (UITapGestureRecognizer *)v26;

    [(UIImageView *)v18->_imageView addGestureRecognizer:v18->_tapGesture];
    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v18 selector:sel_memoryWarning_ name:*MEMORY[0x263F1D060] object:0];
  }
  return v18;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D060] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SXMapComponentView;
  [(SXComponentView *)&v4 dealloc];
}

- (void)memoryWarning:(id)a3
{
  id v3 = [(SXMapComponentView *)self cachedSnapshots];
  [v3 removeAllObjects];
}

- (void)renderContents
{
  v3.receiver = self;
  v3.super_class = (Class)SXMapComponentView;
  [(SXComponentView *)&v3 renderContents];
  [(SXMapComponentView *)self createSnapShot];
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)SXMapComponentView;
  [(SXComponentView *)&v6 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  v5 = [(SXMapComponentView *)self imageView];
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v5, "setFrame:");

  if ([(SXComponentView *)self hasRenderedContents])
  {
    if (var0) {
      [(SXMapComponentView *)self discardContents];
    }
  }
}

- (void)discardContents
{
  v4.receiver = self;
  v4.super_class = (Class)SXMapComponentView;
  [(SXComponentView *)&v4 discardContents];
  objc_super v3 = [(SXMapComponentView *)self imageView];
  [v3 setImage:0];

  [(SXMapComponentView *)self cancelSnapShot];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXMapComponentView;
  [(SXMapComponentView *)&v4 traitCollectionDidChange:a3];
  if ([(SXComponentView *)self hasRenderedContents]) {
    [(SXMapComponentView *)self createSnapShot];
  }
}

- (void)createSnapShot
{
  [(SXComponentView *)self contentFrame];
  double v4 = v3;
  double v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x263F10998]);
  v8 = [(SXComponentView *)self component];
  objc_msgSend(v7, "setMapType:", objc_msgSend(v8, "defaultMapType"));

  [(SXMapComponentView *)self mapRect];
  objc_msgSend(v7, "setMapRect:");
  objc_msgSend(v7, "setSize:", v4, v6);
  v9 = [(SXMapComponentView *)self traitCollection];
  [v7 setTraitCollection:v9];

  v10 = [(SXMapComponentView *)self cachedSnapshots];
  v11 = [v10 objectForKey:v7];

  if (v11)
  {
    v12 = [(SXMapComponentView *)self imageView];
    [v12 setImage:v11];
  }
  else
  {
    [(SXMapComponentView *)self cancelSnapShot];
    objc_initWeak(&location, self);
    v13 = [(SXMapComponentView *)self snapShotter];
    v14 = [(SXMapComponentView *)self annotations];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__SXMapComponentView_createSnapShot__block_invoke;
    v16[3] = &unk_2646543E8;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    v15 = [v13 snapShotWithOptions:v17 annotations:v14 completionBlock:v16];
    [(SXMapComponentView *)self setSnapShotCancelHandler:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __36__SXMapComponentView_createSnapShot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) isEqual:v6])
  {
    v8 = [WeakRetained imageView];
    [v8 setImage:v5];

    [WeakRetained setSnapShotCancelHandler:0];
    v9 = [WeakRetained imageView];
    [v9 setAlpha:0.0];

    [WeakRetained setIsDisplayingMedia:1];
    if (v5)
    {
      v10 = [WeakRetained cachedSnapshots];
      [v10 setObject:v5 forKey:v6];
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__SXMapComponentView_createSnapShot__block_invoke_2;
    v11[3] = &unk_2646511F8;
    v11[4] = WeakRetained;
    [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v11 options:0 animations:0.2 completion:0.0];
  }
}

void __36__SXMapComponentView_createSnapShot__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageView];
  [v1 setAlpha:1.0];
}

- (void)cancelSnapShot
{
  double v3 = [(SXMapComponentView *)self snapShotCancelHandler];

  if (v3)
  {
    double v4 = [(SXMapComponentView *)self snapShotCancelHandler];
    v4[2]();

    [(SXMapComponentView *)self setSnapShotCancelHandler:0];
  }
}

- (NSArray)annotations
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  annotations = self->_annotations;
  if (!annotations)
  {
    double v4 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [(SXComponentView *)self component];
    id v6 = [v5 items];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [[SXMapComponentAnnotation alloc] initWithMapItem:*(void *)(*((void *)&v15 + 1) + 8 * v10)];
          [v4 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
    v13 = self->_annotations;
    self->_annotations = v12;

    annotations = self->_annotations;
  }
  return annotations;
}

- ($D6E06D00CA255A0C0B2BA890DDD3F671)mapRect
{
  [(SXMapComponentView *)self region];
  +[SXMapComponentSizer mapRectForRegion:](SXMapComponentSizer, "mapRectForRegion:");
  result.var1.var1 = v5;
  result.var1.BOOL var0 = v4;
  result.var0.var1 = v3;
  result.var0.BOOL var0 = v2;
  return result;
}

- ($4137A935A6BBB85B3D0ECB651BA01BF7)region
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v4 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = [(SXComponentView *)self component];
  id v6 = [v5 items];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)MEMORY[0x263F08D40];
        [*(id *)(*((void *)&v15 + 1) + 8 * v10) coordinate];
        v12 = objc_msgSend(v11, "valueWithMKCoordinate:");
        [v4 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [(SXComponentView *)self component];
  [v13 region];
  +[SXMapComponentSizer regionFromRegion:coordinates:](SXMapComponentSizer, "regionFromRegion:coordinates:", v4);

  return result;
}

- (void)presentFullScreen
{
  [(SXMapComponentView *)self configureMapView];
  double v3 = [(SXComponentView *)self presentationDelegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SXMapComponentView_presentFullScreen__block_invoke;
  v7[3] = &unk_2646511F8;
  v7[4] = self;
  double v4 = [v3 requestFullScreenCanvasViewControllerForComponent:self withCompletionBlock:v7];
  [(SXMapComponentView *)self setFullScreenCanvasViewController:v4];

  double v5 = [(SXMapComponentView *)self mapTitle];
  id v6 = [(SXMapComponentView *)self fullScreenCanvasViewController];
  [v6 setTitle:v5];
}

uint64_t __39__SXMapComponentView_presentFullScreen__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  [v2 setDelegate:*(void *)(a1 + 32)];

  double v3 = *(void **)(a1 + 32);
  double v4 = [v3 mapView];
  [v4 center];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  uint64_t v10 = [v9 view];
  objc_msgSend(v3, "convertPoint:toView:", v10, v6, v8);
  double v12 = v11;
  double v14 = v13;

  long long v15 = [*(id *)(a1 + 32) mapView];
  objc_msgSend(v15, "setCenter:", v12, v14);

  long long v16 = [*(id *)(a1 + 32) imageView];
  objc_msgSend(v16, "setCenter:", v12, v14);

  long long v17 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  long long v18 = [v17 view];
  v19 = [*(id *)(a1 + 32) mapView];
  [v18 addSubview:v19];

  uint64_t v20 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  v21 = [v20 view];
  v22 = [*(id *)(a1 + 32) imageView];
  [v21 addSubview:v22];

  [*(id *)(a1 + 32) setupNavigationBar];
  [*(id *)(a1 + 32) setupToolbar];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_2;
  v29[3] = &unk_2646511F8;
  uint64_t v30 = *(void *)(a1 + 32);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_3;
  v28[3] = &unk_2646521E0;
  v28[4] = v30;
  [MEMORY[0x263F1CB60] animateWithDuration:v29 animations:v28 completion:0.3];
  v23 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  v24 = [v23 navigationController];
  [v24 setToolbarHidden:0 animated:1];

  v25 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  uint64_t v26 = [v25 navigationController];
  [v26 setNavigationBarHidden:0 animated:1];

  return [*(id *)(a1 + 32) createMediaEngageEvent];
}

void __39__SXMapComponentView_presentFullScreen__block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) mapView];
  double v3 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  double v4 = [v3 view];
  [v4 frame];
  double Width = CGRectGetWidth(v15);
  double v6 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  double v7 = [v6 view];
  [v7 frame];
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v16));

  id v13 = [*(id *)(a1 + 32) imageView];
  double v8 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  uint64_t v9 = [v8 view];
  [v9 bounds];
  CGFloat v10 = CGRectGetWidth(v17) * 0.5;
  double v11 = [*(id *)(a1 + 32) fullScreenCanvasViewController];
  double v12 = [v11 view];
  [v12 bounds];
  objc_msgSend(v13, "setCenter:", v10, CGRectGetHeight(v18) * 0.5);
}

void __39__SXMapComponentView_presentFullScreen__block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_4;
  v4[3] = &unk_2646511F8;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__SXMapComponentView_presentFullScreen__block_invoke_5;
  v3[3] = &unk_2646521E0;
  v3[4] = v5;
  [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:v3 completion:0.2];
  double v2 = [*(id *)(a1 + 32) mapView];
  [v2 setAutoresizingMask:18];
}

void __39__SXMapComponentView_presentFullScreen__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageView];
  [v1 setAlpha:0.0];
}

void __39__SXMapComponentView_presentFullScreen__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) enableMapViewInteraction:1];
  double v2 = [*(id *)(a1 + 32) imageView];
  [v2 setAlpha:1.0];

  double v3 = [*(id *)(a1 + 32) contentView];
  double v4 = [*(id *)(a1 + 32) imageView];
  [v3 addSubview:v4];

  id v5 = [*(id *)(a1 + 32) imageView];
  [*(id *)(a1 + 32) contentFrame];
  objc_msgSend(v5, "setFrame:");
}

- (void)dismissFullScreen
{
  double v3 = [(SXMapComponentView *)self imageView];
  [v3 setAlpha:1.0];

  double v4 = [(SXMapComponentView *)self fullScreenCanvasViewController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SXMapComponentView_dismissFullScreen__block_invoke;
  v6[3] = &unk_2646511F8;
  v6[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v6];

  [(SXMapComponentView *)self finishMediaEngageEvent];
  [(SXMapComponentView *)self submitMediaEngageCompleteEvent];
  id v5 = [(SXMapComponentView *)self fullScreenCanvasViewController];
  [v5 setNeedsStatusBarAppearanceUpdate];
}

uint64_t __39__SXMapComponentView_dismissFullScreen__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) mapView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setMapView:0];
  double v3 = [*(id *)(a1 + 32) presentationDelegate];
  [v3 dismissFullscreenCanvasForComponent:*(void *)(a1 + 32)];

  double v4 = *(void **)(a1 + 32);
  return [v4 setFullScreenCanvasViewController:0];
}

- (void)handleTap:(id)a3
{
  double v4 = [(SXMapComponentView *)self imageView];
  id v5 = [v4 image];
  if (v5)
  {
  }
  else
  {
    BOOL v6 = [(SXMapComponentView *)self isPresentingFullscreen];

    if (!v6) {
      return;
    }
  }
  if ([(SXMapComponentView *)self isPresentingFullscreen])
  {
    if (![(SXMapComponentView *)self hasSelectedAnnotations])
    {
      uint64_t v7 = [(SXMapComponentView *)self areBarsHidden] ^ 1;
      double v8 = [(SXMapComponentView *)self fullScreenCanvasViewController];
      uint64_t v9 = [v8 navigationController];
      [v9 setNavigationBarHidden:v7 animated:1];

      id v11 = [(SXMapComponentView *)self fullScreenCanvasViewController];
      CGFloat v10 = [v11 navigationController];
      [v10 setToolbarHidden:v7 animated:1];
    }
  }
  else
  {
    [(SXMapComponentView *)self presentFullScreen];
  }
}

- (void)configureMapView
{
  double v3 = [(SXMapComponentView *)self mapView];
  double v4 = [(SXMapComponentView *)self mapView];
  id v5 = [v4 annotations];
  [v3 removeAnnotations:v5];

  BOOL v6 = [(SXMapComponentView *)self mapView];
  uint64_t v7 = [(SXMapComponentView *)self annotations];
  [v6 addAnnotations:v7];

  double v8 = [(SXMapComponentView *)self mapView];
  [(SXMapComponentView *)self mapRect];
  objc_msgSend(v8, "setVisibleMapRect:");

  id v10 = [(SXMapComponentView *)self mapView];
  uint64_t v9 = [(SXComponentView *)self component];
  objc_msgSend(v10, "setMapType:", objc_msgSend(v9, "defaultMapType"));
}

- (void)setupNavigationBar
{
  double v3 = [(SXMapComponentView *)self doneBarButtonItem];

  if (!v3)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_handleDoneTap_];
    [(SXMapComponentView *)self setDoneBarButtonItem:v4];
  }
  id v7 = [(SXMapComponentView *)self fullScreenCanvasViewController];
  id v5 = [v7 navigationItem];
  BOOL v6 = [(SXMapComponentView *)self doneBarButtonItem];
  [v5 setRightBarButtonItem:v6];
}

- (void)setupToolbar
{
  v21[3] = *MEMORY[0x263EF8340];
  double v3 = [(SXMapComponentView *)self segmentedControl];

  if (!v3)
  {
    double v4 = SXBundle();
    id v5 = [v4 localizedStringForKey:@"Standard" value:&stru_26D5311C0 table:0];
    v21[0] = v5;
    BOOL v6 = SXBundle();
    id v7 = [v6 localizedStringForKey:@"Hybrid" value:&stru_26D5311C0 table:0];
    v21[1] = v7;
    double v8 = SXBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"Satellite" value:&stru_26D5311C0 table:0];
    v21[2] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];

    id v11 = (void *)[objc_alloc(MEMORY[0x263F1C968]) initWithItems:v10];
    [v11 addTarget:self action:sel_mapTypeChanged_ forControlEvents:4096];
    double v12 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v11];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
    double v14 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
    v20[0] = v13;
    v20[1] = v12;
    v20[2] = v14;
    CGRect v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
    [(SXMapComponentView *)self setToolbarItems:v15];

    [(SXMapComponentView *)self setSegmentedControl:v11];
  }
  CGRect v16 = [(SXMapComponentView *)self segmentedControl];
  CGRect v17 = [(SXMapComponentView *)self mapView];
  objc_msgSend(v16, "setSelectedSegmentIndex:", -[SXMapComponentView segmentIndexForMapType:](self, "segmentIndexForMapType:", objc_msgSend(v17, "mapType")));

  CGRect v18 = [(SXMapComponentView *)self fullScreenCanvasViewController];
  v19 = [(SXMapComponentView *)self toolbarItems];
  [v18 setToolbarItems:v19];
}

- (unint64_t)segmentIndexForMapType:(unint64_t)a3
{
  if (a3 > 2) {
    return -1;
  }
  else {
    return qword_222BEF710[a3];
  }
}

- (unint64_t)mapTypeForSegmentIndex:(unint64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (void)mapTypeChanged:(id)a3
{
  unint64_t v4 = -[SXMapComponentView mapTypeForSegmentIndex:](self, "mapTypeForSegmentIndex:", [a3 selectedSegmentIndex]);
  id v5 = [(SXMapComponentView *)self mapView];
  [v5 setMapType:v4];
}

- (MKMapView)mapView
{
  mapView = self->_mapView;
  if (!mapView)
  {
    id v4 = objc_alloc(MEMORY[0x263F109A8]);
    [(SXMapComponentView *)self bounds];
    id v5 = objc_msgSend(v4, "initWithFrame:");
    [v5 _setUseBalloonCalloutsForLabels:1];
    [v5 setDelegate:self];
    BOOL v6 = [(SXComponentView *)self contentView];
    id v7 = [(SXMapComponentView *)self imageView];
    [v6 insertSubview:v5 belowSubview:v7];

    [(SXMapComponentView *)self setMapView:v5];
    [(SXMapComponentView *)self enableMapViewInteraction:0];
    double v8 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleTap_];
    [v8 setDelegate:self];
    uint64_t v9 = [(SXMapComponentView *)self mapView];
    id v10 = [v9 _selectingTapGestureRecognizer];
    [v8 requireGestureRecognizerToFail:v10];

    [v5 addGestureRecognizer:v8];
    [(SXMapComponentView *)self setTapGesture:v8];

    mapView = self->_mapView;
  }
  return mapView;
}

- (void)enableMapViewInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  -[MKMapView setZoomEnabled:](self->_mapView, "setZoomEnabled:");
  mapView = self->_mapView;
  [(MKMapView *)mapView setScrollEnabled:v3];
}

- (BOOL)isUserInteractingWithMap
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v3 = [(SXMapComponentView *)self mapView];
  id v4 = [v3 gestureRecognizers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * i) numberOfTouches])
        {
LABEL_26:
          LOBYTE(v10) = 1;
          goto LABEL_27;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [(SXMapComponentView *)self mapView];
  id v4 = [v9 subviews];

  uint64_t v10 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v4);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        double v14 = objc_msgSend(v13, "gestureRecognizers", 0);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v21;
          while (2)
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v20 + 1) + 8 * k) numberOfTouches])
              {

                goto LABEL_26;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v10 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v10);
  }
LABEL_27:

  return v10;
}

- (BOOL)isPresentingFullscreen
{
  double v2 = [(SXMapComponentView *)self fullScreenCanvasViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)areBarsHidden
{
  double v2 = [(SXMapComponentView *)self fullScreenCanvasViewController];
  BOOL v3 = [v2 navigationController];
  char v4 = [v3 isNavigationBarHidden];

  return v4;
}

- (BOOL)hasSelectedAnnotations
{
  double v2 = [(SXMapComponentView *)self mapView];
  BOOL v3 = [v2 selectedAnnotations];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)mapTitle
{
  BOOL v3 = [(SXComponentView *)self component];
  BOOL v4 = [v3 caption];

  uint64_t v5 = [(SXMapComponentView *)self mapView];
  uint64_t v6 = [v5 annotations];

  if (!v4)
  {
    if ([v6 count] != 1
      || ([v6 firstObject],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 title],
          BOOL v4 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v4))
    {
      double v8 = [(SXMapComponentView *)self documentTitleProvider];
      BOOL v4 = [v8 title];
    }
  }

  return v4;
}

- (void)submitEvents
{
  v3.receiver = self;
  v3.super_class = (Class)SXMapComponentView;
  [(SXMediaComponentView *)&v3 submitEvents];
  [(SXMapComponentView *)self finishMediaEngageEvent];
}

- (unint64_t)analyticsMediaType
{
  return 5;
}

- (void)createMediaEngageEvent
{
  objc_super v3 = [(SXMapComponentView *)self activeMediaEngageEvent];

  if (!v3)
  {
    id v4 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
    [(SXMapComponentView *)self setActiveMediaEngageEvent:v4];
  }
}

- (void)finishMediaEngageEvent
{
  objc_super v3 = [(SXMapComponentView *)self activeMediaEngageEvent];

  if (v3)
  {
    id v4 = [(SXMapComponentView *)self activeMediaEngageEvent];
    [v4 determineEndDate];

    uint64_t v5 = [(SXMediaComponentView *)self analyticsReporting];
    uint64_t v6 = [(SXMapComponentView *)self activeMediaEngageEvent];
    [v5 reportEvent:v6];

    [(SXMapComponentView *)self setActiveMediaEngageEvent:0];
  }
}

- (void)submitMediaEngageCompleteEvent
{
  id v4 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
  [v4 determineEndDate];
  objc_super v3 = [(SXMediaComponentView *)self analyticsReporting];
  [v3 reportEvent:v4];
}

- (void)setMapView:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (void)setAnnotations:(id)a3
{
}

- (SXDocumentTitleProviding)documentTitleProvider
{
  return self->_documentTitleProvider;
}

- (UIBarButtonItem)doneBarButtonItem
{
  return self->_doneBarButtonItem;
}

- (void)setDoneBarButtonItem:(id)a3
{
}

- (SXFullscreenCanvasViewController)fullScreenCanvasViewController
{
  return self->_fullScreenCanvasViewController;
}

- (void)setFullScreenCanvasViewController:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (void)setToolbarItems:(id)a3
{
}

- (SXMapSnapShotter)snapShotter
{
  return self->_snapShotter;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setMapRect:(id)a3
{
  self->_mapRect = ($A11905283BE35044ECA251AA92062B1B)a3;
}

- (id)snapShotCancelHandler
{
  return self->_snapShotCancelHandler;
}

- (void)setSnapShotCancelHandler:(id)a3
{
}

- (NSCache)cachedSnapshots
{
  return self->_cachedSnapshots;
}

- (SXMediaEngageEvent)activeMediaEngageEvent
{
  return self->_activeMediaEngageEvent;
}

- (void)setActiveMediaEngageEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeMediaEngageEvent, 0);
  objc_storeStrong((id *)&self->_cachedSnapshots, 0);
  objc_storeStrong(&self->_snapShotCancelHandler, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_snapShotter, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasViewController, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_documentTitleProvider, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end