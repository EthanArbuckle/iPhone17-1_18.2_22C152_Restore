@interface SUICKPMapCardSectionViewController
+ (id)cardSectionClasses;
- (BOOL)_shouldAttemptToSnapshotMapView;
- (id)_initWithCardSection:(id)a3;
- (id)_mapCardSection;
- (id)_viewSnapshot;
- (void)_loadCardSectionView;
- (void)_loadCardSectionViewIfNeeded;
- (void)_loadMapCardSectionView;
- (void)_snapshotCardSectionView;
- (void)_updateContentSize;
- (void)dealloc;
- (void)didEngageCardSection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUICKPMapCardSectionViewController

+ (id)cardSectionClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)_initWithCardSection:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUICKPMapCardSectionViewController;
  v5 = [(CRKCardSectionViewController *)&v11 _initWithCardSection:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__SUICKPMapCardSectionViewController__initWithCardSection___block_invoke;
    v8[3] = &unk_26490F668;
    objc_copyWeak(&v9, &location);
    v5[131] = CFRunLoopObserverCreateWithHandler(0, 0x81uLL, 1u, 0, v8);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v5[131], (CFRunLoopMode)*MEMORY[0x263F1D798]);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __59__SUICKPMapCardSectionViewController__initWithCardSection___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      WeakRetained[1033] = 1;
    }
    else
    {
      WeakRetained[1033] = 0;
      v5 = WeakRetained;
      [WeakRetained _loadCardSectionViewIfNeeded];
      WeakRetained = v5;
    }
  }
}

- (void)dealloc
{
  if (self->_mainRunLoopObserverRef)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveObserver(Main, self->_mainRunLoopObserverRef, (CFRunLoopMode)*MEMORY[0x263F1D798]);
    CFRelease(self->_mainRunLoopObserverRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)SUICKPMapCardSectionViewController;
  [(SUICKPMapCardSectionViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUICKPMapCardSectionViewController;
  [(CRKCardSectionViewController *)&v4 viewDidAppear:a3];
  [(SUICKPMapCardSectionViewController *)self _loadCardSectionViewIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUICKPMapCardSectionViewController;
  [(CRKCardSectionViewController *)&v3 viewDidLayoutSubviews];
  [(SUICKPMapCardSectionViewController *)self _updateContentSize];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUICKPMapCardSectionViewController *)self _snapshotCardSectionView];
  v5.receiver = self;
  v5.super_class = (Class)SUICKPMapCardSectionViewController;
  [(SUICKPMapCardSectionViewController *)&v5 viewWillDisappear:v3];
}

- (void)_snapshotCardSectionView
{
  if ([(SUICKPMapCardSectionViewController *)self _shouldAttemptToSnapshotMapView]
    && !self->_needsToLoadCardSectionView)
  {
    id v3 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_super v4 = [(SUICKPMapCardSectionViewController *)self view];
    [v4 bounds];
    id v11 = (id)objc_msgSend(v3, "initWithFrame:");

    [v11 setClipsToBounds:1];
    id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
    v6 = [(SUICKPMapCardSectionViewController *)self _viewSnapshot];
    v7 = (void *)[v5 initWithImage:v6];

    [v7 setContentMode:2];
    v8 = [(SUICKPMapCardSectionViewController *)self view];
    [v8 bounds];
    objc_msgSend(v7, "setFrame:");

    [v7 setAutoresizingMask:18];
    [v11 addSubview:v7];
    id v9 = [(SUICKPMapCardSectionViewController *)self view];
    [v9 setContentView:v11];

    mapSectionView = self->_mapSectionView;
    self->_mapSectionView = 0;

    self->_needsToLoadCardSectionView = 1;
  }
}

- (void)_loadCardSectionView
{
  if ([(SUICKPMapCardSectionViewController *)self _shouldAttemptToSnapshotMapView])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F31608]);
    [v3 setInterceptsTouches:0];
    [(SUICKPMapCardSectionViewController *)self setView:v3];
    [(SUICKPMapCardSectionViewController *)self _loadMapCardSectionView];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SUICKPMapCardSectionViewController;
    [(CRKCardSectionViewController *)&v4 _loadCardSectionView];
  }
}

- (void)_loadMapCardSectionView
{
  v17[1] = *MEMORY[0x263EF8340];
  if (!self->_mapSectionView)
  {
    id v3 = [(CRKCardSectionViewController *)self viewConfiguration];

    if (v3)
    {
      objc_super v4 = [(CRKCardSectionViewController *)self viewConfiguration];
      id v5 = [v4 cardSectionView];
      mapSectionView = self->_mapSectionView;
      self->_mapSectionView = v5;
    }
    else
    {
      v7 = (void *)MEMORY[0x263F67C00];
      v8 = [(SUICKPMapCardSectionViewController *)self _mapCardSection];
      v17[0] = v8;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      v10 = [v7 viewsForCardSections:v9 feedbackListener:self];
      id v11 = [v10 firstObject];
      v12 = self->_mapSectionView;
      self->_mapSectionView = v11;
    }
    v13 = [(SUICKPMapCardSectionViewController *)self view];
    v14 = self->_mapSectionView;
    v15 = [(CRKCardSectionViewController *)self delegate];
    [v15 boundingSizeForCardSectionViewController:self];
    -[CRKCardSectionView sizeThatFits:](v14, "sizeThatFits:");
    objc_msgSend(v13, "setContentSize:");

    v16 = [(SUICKPMapCardSectionViewController *)self view];
    [v16 setContentView:self->_mapSectionView];
  }
}

- (void)_loadCardSectionViewIfNeeded
{
  if (self->_needsToLoadCardSectionView && !self->_inTrackingRunLoopMode)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__SUICKPMapCardSectionViewController__loadCardSectionViewIfNeeded__block_invoke;
    block[3] = &unk_26490F690;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    self->_needsToLoadCardSectionView = 0;
  }
}

uint64_t __66__SUICKPMapCardSectionViewController__loadCardSectionViewIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadMapCardSectionView];
}

- (void)_updateContentSize
{
  if (self->_mapSectionView)
  {
    id v5 = [(SUICKPMapCardSectionViewController *)self view];
    mapSectionView = self->_mapSectionView;
    objc_super v4 = [(CRKCardSectionViewController *)self delegate];
    [v4 boundingSizeForCardSectionViewController:self];
    -[CRKCardSectionView sizeThatFits:](mapSectionView, "sizeThatFits:");
    objc_msgSend(v5, "setContentSize:");
  }
}

- (id)_viewSnapshot
{
  id v3 = [(SUICKPMapCardSectionViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 scale];
  CGFloat v10 = v9;
  v16.width = v5;
  v16.height = v7;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v10);

  id v11 = [(SUICKPMapCardSectionViewController *)self view];
  v12 = [(SUICKPMapCardSectionViewController *)self view];
  [v12 bounds];
  objc_msgSend(v11, "drawViewHierarchyInRect:afterScreenUpdates:", 0);

  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v13;
}

- (id)_mapCardSection
{
  v2 = [(CRKCardSectionViewController *)self cardSection];
  id v3 = [v2 backingCardSection];

  return v3;
}

- (BOOL)_shouldAttemptToSnapshotMapView
{
  id v3 = [(SUICKPMapCardSectionViewController *)self _mapCardSection];
  if ([v3 interactive])
  {
    BOOL v4 = 0;
  }
  else
  {
    CGFloat v5 = [(CRKCardSectionViewController *)self _remoteViewController];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)didEngageCardSection:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUICKPMapCardSectionViewController;
  [(SUICKPInteractiveCardSectionViewController *)&v31 didEngageCardSection:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double v6 = [(CRKCardSectionViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [v5 triggerEvent];
      if (v8 == 14 || [v5 triggerEvent] == 2)
      {
        double v9 = [(CRKCardSectionViewController *)self cardSection];
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          id v11 = [(CRKCardSectionViewController *)self cardSection];
          v12 = [v11 actionCommands];

          v13 = [(CRKCardSectionViewController *)self _extraCommands];

          v25 = v12;
          id v26 = v4;
          if (v13)
          {
            v14 = [(CRKCardSectionViewController *)self _extraCommands];
            id v15 = [v12 arrayByAddingObjectsFromArray:v14];
          }
          else
          {
            id v15 = v12;
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v34 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v28 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                if (v8 == 14)
                {
                  v32 = @"CRKMapCardSectionPlacemarkData";
                  [v5 modifiedPlacemarkData];
                  v23 = id v22 = v5;
                  v33 = v23;
                  v24 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
                  [v21 setUserInfo:v24];

                  id v5 = v22;
                }
                -[CRKCardSectionViewController _performCommand:](self, "_performCommand:", v21, v25);
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v34 count:16];
            }
            while (v18);
          }

          id v4 = v26;
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end