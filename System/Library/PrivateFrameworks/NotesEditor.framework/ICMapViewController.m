@interface ICMapViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)wantsFullScreenLayout;
- (ICMapViewController)initWithAnnotation:(id)a3;
- (MKAnnotation)annotation;
- (MKLocalSearch)localSearch;
- (MKMapItem)mapItem;
- (MKMapView)mapView;
- (void)_toolbarItemPressed:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)selectPin;
- (void)setAnnotation:(id)a3;
- (void)setLocalSearch:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICMapViewController

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];

  [(MKMapView *)self->_mapView setDelegate:0];
  [(MKLocalSearch *)self->_localSearch cancel];

  v3.receiver = self;
  v3.super_class = (Class)ICMapViewController;
  [(ICMapViewController *)&v3 dealloc];
}

- (void)loadView
{
  mapView = self->_mapView;
  if (!mapView)
  {
    uint64_t v21 = 0;
    uint64_t v22 = (uint64_t)&v21;
    uint64_t v23 = 0x3052000000;
    v24 = __Block_byref_object_copy__17;
    v25 = __Block_byref_object_dispose__17;
    v4 = (objc_class *)getMKMapViewClass_softClass;
    uint64_t v26 = getMKMapViewClass_softClass;
    if (!getMKMapViewClass_softClass)
    {
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      uint64_t v18 = (uint64_t)__getMKMapViewClass_block_invoke;
      v19 = &unk_2640B9818;
      v20 = &v21;
      __getMKMapViewClass_block_invoke((uint64_t)&v16);
      v4 = *(objc_class **)(v22 + 40);
    }
    _Block_object_dispose(&v21, 8);
    v5 = (MKMapView *)objc_alloc_init(v4);
    self->_mapView = v5;
    [(MKMapView *)v5 setMapType:0];
    [(MKMapView *)self->_mapView setDelegate:self];
    mapView = self->_mapView;
  }
  [(ICMapViewController *)self setView:mapView];
  [(MKAnnotation *)[(ICMapViewController *)self annotation] coordinate];
  double v7 = v6;
  double v9 = v8;
  uint64_t v21 = 0;
  uint64_t v22 = (uint64_t)&v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__17;
  v25 = __Block_byref_object_dispose__17;
  v10 = (objc_class *)getMKPointAnnotationClass_softClass;
  uint64_t v26 = getMKPointAnnotationClass_softClass;
  if (!getMKPointAnnotationClass_softClass)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = (uint64_t)__getMKPointAnnotationClass_block_invoke;
    v19 = &unk_2640B9818;
    v20 = &v21;
    __getMKPointAnnotationClass_block_invoke((uint64_t)&v16);
    v10 = *(objc_class **)(v22 + 40);
  }
  _Block_object_dispose(&v21, 8);
  id v11 = objc_alloc_init(v10);
  objc_msgSend(v11, "setCoordinate:", v7, v9);
  [v11 setRepresentation:2];
  objc_msgSend(v11, "setTitle:", -[MKAnnotation title](-[ICMapViewController annotation](self, "annotation"), "title"));
  [(MKMapView *)self->_mapView addAnnotation:v11];
  -[MKMapView setCenterCoordinate:](self->_mapView, "setCenterCoordinate:", v7, v9);
  uint64_t v16 = 0;
  uint64_t v17 = (uint64_t)&v16;
  uint64_t v18 = 0x2020000000;
  v12 = (void (*)(double, double, double, double))getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  v19 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    uint64_t v23 = (uint64_t)__getMKCoordinateRegionMakeWithDistanceSymbolLoc_block_invoke;
    v24 = (void (*)(uint64_t, uint64_t))&unk_2640B9818;
    v25 = (void (*)(uint64_t))&v16;
    v13 = (void *)MapKitLibrary();
    v14 = dlsym(v13, "MKCoordinateRegionMakeWithDistance");
    *(void *)(*((void *)v25 + 1) + 24) = v14;
    getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v25 + 1) + 24);
    v12 = *(void (**)(double, double, double, double))(v17 + 24);
  }
  _Block_object_dispose(&v16, 8);
  if (!v12)
  {
    v15 = (_Unwind_Exception *)__59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v15);
  }
  v12(v7, v9, 600.0, 600.0);
  -[MKMapView setRegion:](self->_mapView, "setRegion:");
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    [(MKMapView *)self->_mapView setOverrideUserInterfaceStyle:1];
  }
  objc_msgSend((id)-[ICMapViewController navigationController](self, "navigationController"), "setToolbarHidden:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICMapViewController;
  [(ICMapViewController *)&v7 viewWillAppear:a3];
  getMKPlacemarkClass();
  if (objc_opt_class())
  {
    getMKMapItemClass();
    if (objc_opt_class())
    {
      id v4 = objc_alloc((Class)getMKPlacemarkClass());
      [(MKAnnotation *)[(ICMapViewController *)self annotation] coordinate];
      v5 = objc_msgSend(v4, "initWithCoordinate:");
      double v6 = (void *)[objc_alloc((Class)getMKMapItemClass()) initWithPlacemark:v5];
      objc_msgSend(v6, "setName:", -[MKAnnotation title](-[ICMapViewController annotation](self, "annotation"), "title"));
      [(ICMapViewController *)self setMapItem:v6];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_selectPin object:0];
  v5.receiver = self;
  v5.super_class = (Class)ICMapViewController;
  [(ICMapViewController *)&v5 viewWillDisappear:v3];
  [(ICMapViewController *)self setToolbarItems:0];
  objc_msgSend((id)-[ICMapViewController navigationController](self, "navigationController"), "setToolbarHidden:", 1);
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (ICMapViewController)initWithAnnotation:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICMapViewController;
  id v4 = [(ICMapViewController *)&v7 initWithNibName:0 bundle:0];
  objc_super v5 = v4;
  if (v4) {
    [(ICMapViewController *)v4 setAnnotation:a3];
  }
  return v5;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_selectPin object:0];

  [(ICMapViewController *)self performSelector:sel_selectPin withObject:0 afterDelay:0.7];
}

- (void)_toolbarItemPressed:(id)a3
{
  if (![(ICMapViewController *)self mapItem]) {
    return;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  objc_super v5 = (uint64_t *)getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
  uint64_t v15 = getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
  if (!getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr)
  {
    double v6 = (void *)MapKitLibrary();
    v13[3] = (uint64_t)dlsym(v6, "MKLaunchOptionsDirectionsModeDriving");
    getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr = v13[3];
    objc_super v5 = (uint64_t *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
  {
    __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    goto LABEL_16;
  }
  uint64_t v7 = *v5;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  double v8 = (void *)getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  uint64_t v15 = getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  if (!getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr)
  {
    double v9 = (void *)MapKitLibrary();
    v13[3] = (uint64_t)dlsym(v9, "MKLaunchOptionsDirectionsModeKey");
    getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr = v13[3];
    double v8 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
  {
LABEL_16:
    id v11 = (_Unwind_Exception *)__59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  if (*v8) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    objc_msgSend(v4, "setObject:forKey:", v7);
  }
  [(MKMapItem *)[(ICMapViewController *)self mapItem] openInMapsWithLaunchOptions:v4];
}

- (void)selectPin
{
  BOOL v3 = [(ICMapViewController *)self mapView];
  id v4 = [(ICMapViewController *)self annotation];

  [(MKMapView *)v3 selectAnnotation:v4 animated:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
}

@end