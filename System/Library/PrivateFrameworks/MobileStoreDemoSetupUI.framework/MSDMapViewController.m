@interface MSDMapViewController
- (CLLocation)userLocation;
- (MKMapView)mapView;
- (MSDMapViewController)initWithDelegate:(id)a3;
- (MSDMapViewControllerDelegate)delegate;
- (UIButton)recenterButton;
- (id)_getAnnotationWithStoreInfo:(id)a3;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)_recenter:(id)a3;
- (void)_recenterToCoordinate:(CLLocationCoordinate2D)a3;
- (void)_removeAllStoreAnnotations;
- (void)_zoomToAnnotation;
- (void)_zoomToCoordinate:(CLLocationCoordinate2D)a3 withRadius:(double)a4 allowZoomOut:(BOOL)a5;
- (void)annotateStores:(id)a3;
- (void)deselectAnnotation;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMapView:(id)a3;
- (void)setRecenterButton:(id)a3;
- (void)setUserLocation:(id)a3;
- (void)stopUpdatingUserLocation;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)zoomToStore:(id)a3;
@end

@implementation MSDMapViewController

- (MSDMapViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSDMapViewController;
  v5 = [(MSDMapViewController *)&v15 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F1C488] buttonWithType:1];
    [(MSDMapViewController *)v5 setRecenterButton:v6];

    v7 = [(MSDMapViewController *)v5 recenterButton];
    [v7 setHidden:1];

    [(MSDMapViewController *)v5 setUserLocation:0];
    [(MSDMapViewController *)v5 setDelegate:v4];
    v8 = objc_opt_new();
    [(MSDMapViewController *)v5 setMapView:v8];

    v9 = [(MSDMapViewController *)v5 mapView];
    [v9 setDelegate:v5];

    v10 = [(MSDMapViewController *)v5 mapView];
    [v10 setShowsUserLocation:1];

    v11 = [(MSDMapViewController *)v5 mapView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [(MSDMapViewController *)v5 mapView];
    [v12 registerClass:objc_opt_class() forAnnotationViewWithReuseIdentifier:@"StoreAnnotation"];

    v13 = [(MSDMapViewController *)v5 mapView];
    [v13 registerClass:objc_opt_class() forAnnotationViewWithReuseIdentifier:@"StoreClusterAnnotation"];
  }
  return v5;
}

- (void)viewDidLoad
{
  v38[2] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)MSDMapViewController;
  [(MSDMapViewController *)&v37 viewDidLoad];
  v3 = [(MSDMapViewController *)self view];
  id v4 = [(MSDMapViewController *)self mapView];
  [v3 addSubview:v4];

  v36 = [MEMORY[0x263F1C6B0] systemImageNamed:@"location"];
  v5 = [(MSDMapViewController *)self recenterButton];
  [v5 setImage:v36 forState:0];

  v6 = [MEMORY[0x263F1C550] systemBlueColor];
  v7 = [(MSDMapViewController *)self recenterButton];
  [v7 setTintColor:v6];

  v8 = [MEMORY[0x263F1C550] whiteColor];
  v9 = [(MSDMapViewController *)self recenterButton];
  [v9 setBackgroundColor:v8];

  v10 = [(MSDMapViewController *)self recenterButton];
  v11 = [v10 layer];
  [v11 setCornerRadius:10.0];

  v12 = [(MSDMapViewController *)self recenterButton];
  v13 = [v12 layer];
  [v13 setBorderWidth:1.0];

  id v14 = [MEMORY[0x263F1C550] systemBlueColor];
  uint64_t v15 = [v14 CGColor];
  v16 = [(MSDMapViewController *)self recenterButton];
  v17 = [v16 layer];
  [v17 setBorderColor:v15];

  v18 = [(MSDMapViewController *)self recenterButton];
  objc_msgSend(v18, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);

  v19 = [(MSDMapViewController *)self recenterButton];
  [v19 addTarget:self action:sel__recenter_ forControlEvents:64];

  v20 = [(MSDMapViewController *)self recenterButton];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(MSDMapViewController *)self view];
  v22 = [(MSDMapViewController *)self recenterButton];
  [v21 addSubview:v22];

  v35 = [(MSDMapViewController *)self recenterButton];
  v33 = [v35 trailingAnchor];
  v34 = [(MSDMapViewController *)self view];
  v23 = [v34 safeAreaLayoutGuide];
  v24 = [v23 trailingAnchor];
  v25 = [v33 constraintEqualToAnchor:v24 constant:-15.0];
  v38[0] = v25;
  v26 = [(MSDMapViewController *)self recenterButton];
  v27 = [v26 topAnchor];
  v28 = [(MSDMapViewController *)self view];
  v29 = [v28 safeAreaLayoutGuide];
  v30 = [v29 topAnchor];
  v31 = [v27 constraintEqualToAnchor:v30 constant:15.0];
  v38[1] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

  [MEMORY[0x263F08938] activateConstraints:v32];
}

- (void)viewDidLayoutSubviews
{
  v25[4] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)MSDMapViewController;
  [(MSDMapViewController *)&v24 viewDidLayoutSubviews];
  v23 = [(MSDMapViewController *)self mapView];
  v21 = [v23 topAnchor];
  v22 = [(MSDMapViewController *)self view];
  v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v25[0] = v19;
  v18 = [(MSDMapViewController *)self mapView];
  v16 = [v18 bottomAnchor];
  v17 = [(MSDMapViewController *)self view];
  uint64_t v15 = [v17 bottomAnchor];
  id v14 = [v16 constraintEqualToAnchor:v15];
  v25[1] = v14;
  v13 = [(MSDMapViewController *)self mapView];
  v3 = [v13 leftAnchor];
  id v4 = [(MSDMapViewController *)self view];
  v5 = [v4 leftAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v25[2] = v6;
  v7 = [(MSDMapViewController *)self mapView];
  v8 = [v7 rightAnchor];
  v9 = [(MSDMapViewController *)self view];
  v10 = [v9 rightAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v25[3] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];

  [MEMORY[0x263F08938] activateConstraints:v12];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSDMapViewController;
  [(MSDMapViewController *)&v4 viewWillDisappear:a3];
  [(MSDMapViewController *)self stopUpdatingUserLocation];
}

- (void)zoomToStore:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v4;
    _os_log_impl(&dword_23911B000, v5, OS_LOG_TYPE_DEFAULT, "Zooming to store %{public}@...", (uint8_t *)&v18, 0xCu);
  }

  v6 = [(MSDMapViewController *)self _getAnnotationWithStoreInfo:v4];
  v7 = [(MSDMapViewController *)self mapView];
  v8 = [v7 selectedAnnotations];
  uint64_t v9 = [v8 count];

  if (v9 != 1) {
    goto LABEL_8;
  }
  v10 = [(MSDMapViewController *)self mapView];
  v11 = [v10 selectedAnnotations];
  v12 = [v11 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v12 memberAnnotations];
    uint64_t v14 = [v13 firstObject];

    v12 = (void *)v14;
  }
  if (([v6 isSameLocation:v12] & 1) == 0)
  {

LABEL_8:
    if (v6)
    {
      v12 = [(MSDMapViewController *)self mapView];
      [v12 selectAnnotation:v6 animated:1];
    }
    else
    {
      uint64_t v15 = defaultLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MSDMapViewController zoomToStore:]((uint64_t)v4, v15);
      }

      v12 = [v4 storeLocation];
      [v12 coordinate];
      -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](self, "_zoomToCoordinate:withRadius:allowZoomOut:", 0);
    }
    goto LABEL_13;
  }
  v16 = defaultLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v6 storeInfo];
    int v18 = 138543362;
    id v19 = v17;
    _os_log_impl(&dword_23911B000, v16, OS_LOG_TYPE_DEFAULT, "Store %{public}@ have coordinate already zoomed, skipping", (uint8_t *)&v18, 0xCu);
  }
LABEL_13:
}

- (void)deselectAnnotation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(MSDMapViewController *)self mapView];
  id v4 = [v3 selectedAnnotations];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = [(MSDMapViewController *)self mapView];
    v7 = [v6 selectedAnnotations];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          v13 = [(MSDMapViewController *)self mapView];
          [v13 deselectAnnotation:v12 animated:1];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)annotateStores:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    [(MSDMapViewController *)self _removeAllStoreAnnotations];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          uint64_t v12 = [(MSDMapViewController *)self mapView];
          v13 = [[MSDMapAnnotation alloc] initWithStoreInfo:v11];
          [v12 addAnnotation:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [(MSDMapViewController *)self _zoomToAnnotation];
  }
}

- (void)stopUpdatingUserLocation
{
  v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping User Location Update...", v5, 2u);
  }

  id v4 = [(MSDMapViewController *)self mapView];
  [v4 setShowsUserLocation:0];
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(MSDMapViewController *)v7 userLocation];

  if (!v8)
  {
    uint64_t v9 = [(MSDMapViewController *)v7 recenterButton];
    [v9 setHidden:0];

    uint64_t v10 = [v6 location];
    [v10 coordinate];
    -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](v7, "_zoomToCoordinate:withRadius:allowZoomOut:", 0);
  }
  uint64_t v11 = [v6 location];
  [(MSDMapViewController *)v7 setUserLocation:v11];

  uint64_t v12 = [(MSDMapViewController *)v7 delegate];
  v13 = [(MSDMapViewController *)v7 userLocation];
  [v12 userLocationDidChange:v13];

  objc_sync_exit(v7);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [(MSDMapViewController *)self mapView];
    uint64_t v8 = [v7 dequeueReusableAnnotationViewWithIdentifier:@"StoreClusterAnnotation" forAnnotation:v6];

    uint64_t v9 = [MEMORY[0x263F1C550] whiteColor];
    [v8 setGlyphTintColor:v9];

    id v10 = [MEMORY[0x263F1C550] systemRedColor];
    [v8 setMarkerTintColor:v10];
LABEL_8:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v5;
    uint64_t v11 = [(MSDMapViewController *)self mapView];
    uint64_t v8 = [v11 dequeueReusableAnnotationViewWithIdentifier:@"StoreAnnotation"];

    [v8 setClusteringIdentifier:*MEMORY[0x263F10870]];
    uint64_t v12 = [v10 storeInfo];
    int v13 = [v12 isHQ];

    if (v13) {
      id v14 = @"building.2.fill";
    }
    else {
      id v14 = @"mappin";
    }
    long long v15 = [MEMORY[0x263F1C6B0] systemImageNamed:v14];
    [v8 setGlyphImage:v15];

    long long v16 = [MEMORY[0x263F1C550] whiteColor];
    [v8 setGlyphTintColor:v16];

    long long v17 = [MEMORY[0x263F1C550] systemRedColor];
    [v8 setMarkerTintColor:v17];

    goto LABEL_8;
  }
  int v18 = defaultLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    id v22 = (id)objc_opt_class();
    id v19 = v22;
    _os_log_impl(&dword_23911B000, v18, OS_LOG_TYPE_DEFAULT, "Unrecognized annotation class: %{public}@, ignoring...", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v8 = [v5 annotation];
  if (isKindOfClass)
  {
    id v9 = objc_alloc(MEMORY[0x263F108A8]);
    v39[0] = v8;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    uint64_t v11 = (void *)[v9 initWithMemberAnnotations:v10];

    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v11 = [v5 annotation];
    if (!v11) {
      goto LABEL_23;
    }
  }
  if (([v11 isSameCoordinate] & 1) != 0 || objc_msgSend(v11, "isInCloseProximity"))
  {
    int v13 = objc_opt_new();
    id v14 = [v11 memberAnnotations];
    long long v15 = [v14 firstObject];

    long long v16 = [v15 storeInfo];
    long long v17 = [v16 storeLocation];
    [v17 coordinate];
    double v19 = v18;
    double v21 = v20;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = objc_msgSend(v11, "memberAnnotations", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v30 + 1) + 8 * v26) storeInfo];
          [v13 addObject:v27];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }

    v28 = defaultLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[MSDMapViewController mapView:didSelectAnnotationView:]";
      __int16 v36 = 2112;
      objc_super v37 = v13;
      _os_log_impl(&dword_23911B000, v28, OS_LOG_TYPE_DEFAULT, "%s - stores %@ selected", buf, 0x16u);
    }

    if ([v11 isSameCoordinate]) {
      -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](self, "_zoomToCoordinate:withRadius:allowZoomOut:", 0, v19, v21, 300.0);
    }
    else {
      -[MSDMapViewController _recenterToCoordinate:](self, "_recenterToCoordinate:", v19, v21);
    }
    v29 = [(MSDMapViewController *)self delegate];
    [v29 didSelectStores:v13 forViewController:self];
  }
  else
  {
    int v13 = [(MSDMapViewController *)self mapView];
    long long v15 = [v11 memberAnnotations];
    [v13 showAnnotations:v15 animated:1];
  }

LABEL_23:
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v8 = [v5 annotation];
  if (isKindOfClass)
  {
    id v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 storeInfo];
      v29 = v10;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
      *(_DWORD *)buf = 136315394;
      long long v31 = "-[MSDMapViewController mapView:didDeselectAnnotationView:]";
      __int16 v32 = 2114;
      long long v33 = v11;
      _os_log_impl(&dword_23911B000, v9, OS_LOG_TYPE_DEFAULT, "%s - stores %{public}@ de-selected", buf, 0x16u);
    }
    char v12 = [(MSDMapViewController *)self delegate];
    int v13 = [v8 storeInfo];
    v28 = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    [v12 didDeselectStores:v14 forViewController:self];

    goto LABEL_18;
  }
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    uint64_t v8 = objc_opt_new();
    char v12 = [v5 annotation];
    if (([v12 isSameCoordinate] & 1) == 0 && !objc_msgSend(v12, "isInCloseProximity")) {
      goto LABEL_19;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v16 = objc_msgSend(v12, "memberAnnotations", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = [*(id *)(*((void *)&v23 + 1) + 8 * v20) storeInfo];
          [v8 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v18);
    }

    id v22 = defaultLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v31 = "-[MSDMapViewController mapView:didDeselectAnnotationView:]";
      __int16 v32 = 2112;
      long long v33 = v8;
      _os_log_impl(&dword_23911B000, v22, OS_LOG_TYPE_DEFAULT, "%s - stores %@ de-selected", buf, 0x16u);
    }

    int v13 = [(MSDMapViewController *)self delegate];
    [v13 didDeselectStores:v8 forViewController:self];
LABEL_18:

LABEL_19:
  }
}

- (void)_zoomToAnnotation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [(MSDMapViewController *)self deselectAnnotation];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(MSDMapViewController *)self mapView];
  id v5 = [v4 annotations];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 storeInfo];
          if ([v11 isNearby]) {
            [v3 addObject:v10];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  char v12 = [(MSDMapViewController *)self mapView];
  [v12 showAnnotations:v3 animated:1];
}

- (void)_recenter:(id)a3
{
  id v4 = [(MSDMapViewController *)self userLocation];

  if (v4)
  {
    id v5 = defaultLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23911B000, v5, OS_LOG_TYPE_DEFAULT, "Recentering to current user location...", v7, 2u);
    }

    uint64_t v6 = [(MSDMapViewController *)self userLocation];
    [v6 coordinate];
    -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](self, "_zoomToCoordinate:withRadius:allowZoomOut:", 1);

    [(MSDMapViewController *)self deselectAnnotation];
  }
}

- (void)_zoomToCoordinate:(CLLocationCoordinate2D)a3 withRadius:(double)a4 allowZoomOut:(BOOL)a5
{
  double v7 = MEMORY[0x23EC9D1C0](self, a2, (__n128)a3, *(__n128 *)&a3.longitude, a4 + a4, a4 + a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (!a5)
  {
    long long v14 = [(MSDMapViewController *)self mapView];
    [v14 region];
    double v16 = v15;
    double v18 = v17;

    if (v16 < v11) {
      double v11 = v16;
    }
    if (v18 < v13) {
      double v13 = v18;
    }
  }
  id v19 = [(MSDMapViewController *)self mapView];
  objc_msgSend(v19, "setRegion:animated:", 1, v7, v9, v11, v13);
}

- (void)_recenterToCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v6 = [(MSDMapViewController *)self mapView];
  [v6 region];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(MSDMapViewController *)self mapView];
  objc_msgSend(v11, "setRegion:animated:", 1, latitude, longitude, v8, v10);
}

- (id)_getAnnotationWithStoreInfo:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v17 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(MSDMapViewController *)self mapView];
  id v5 = [v4 annotations];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          double v12 = [v11 storeInfo];
          double v13 = [v12 appleID];
          long long v14 = [v17 appleID];
          char v15 = [v13 isEqual:v14];

          if (v15) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (void)_removeAllStoreAnnotations
{
  id v5 = [(MSDMapViewController *)self mapView];
  v3 = [(MSDMapViewController *)self mapView];
  id v4 = [v3 annotations];
  [v5 removeAnnotations:v4];
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (MSDMapViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)recenterButton
{
  return self->_recenterButton;
}

- (void)setRecenterButton:(id)a3
{
}

- (CLLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

- (void)zoomToStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23911B000, a2, OS_LOG_TYPE_ERROR, "Unable to find annotation for store: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end