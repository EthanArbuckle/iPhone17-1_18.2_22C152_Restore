@interface RAPMapFeaturePickerViewController
- ($C79183323B9A0D5602617FF3BE5395AC)selectedMapRect;
- (BOOL)_kindTracksLabelMarkerSelection;
- (BOOL)_shouldShowModeSelector;
- (BOOL)canCommit;
- (BOOL)didCommit;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)requiresRenderedMapToContinue;
- (CLLocationCoordinate2D)selectedCoordinate;
- (CLLocationCoordinate2D)tappedCoordinate;
- (NSArray)selectedTransitLineIdentifiers;
- (NSArray)selectedTransitLineMarkers;
- (NSString)textFieldPlaceholder;
- (RAPAddressLocation)selectedAddressLocation;
- (RAPMapStateProtocol)mapViewReportContext;
- (VKLabelMarker)selectedLabelMarker;
- (double)mapViewZoomLevel;
- (id)backButtonPressedCallback;
- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 inMapRect:(id)a6 withCamera:(id)a7 analyticsTarget:(int)a8 preferredMapType:(unint64_t)a9 selection:(id)a10;
- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 inMapRect:(id)a6 withCamera:(id)a7 analyticsTarget:(int)a8 selection:(id)a9;
- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 initialFeatureCoordinate:(CLLocationCoordinate2D)a6 inMapRect:(id)a7 withCamera:(id)a8 analyticsTarget:(int)a9 selection:(id)a10;
- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 initialFeatureCoordinate:(CLLocationCoordinate2D)a6 inMapRect:(id)a7 withCamera:(id)a8 analyticsTarget:(int)a9 selection:(id)a10 textFieldTitle:(id)a11 textFieldText:(id)a12 textFieldWithEditBlock:(id)a13;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (int)_selectionAction;
- (int)analyticTarget;
- (void)_cancel;
- (void)_commit;
- (void)_handleSegmentedControlTap:(id)a3;
- (void)_mapTappedForTransitLineSelection:(id)a3;
- (void)_selectionDidChange;
- (void)_showModeSelector;
- (void)_updateAttributionInsets;
- (void)_updateCommitBarItem;
- (void)displayAnnotationAtCoordinate:(CLLocationCoordinate2D)a3 withText:(id)a4;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)mapViewWillStartRenderingMap:(id)a3;
- (void)setBackButtonPressedCallback:(id)a3;
- (void)setDidCommit:(BOOL)a3;
- (void)setHandlerBlocksForUserCommittedSelection:(id)a3 cancelled:(id)a4;
- (void)setHandlerBlocksForUserCommittedSelection:(id)a3 withRightBarButtonItemTitle:(id)a4;
- (void)setMapViewZoomLevel:(double)a3;
- (void)setPrompt:(id)a3;
- (void)setRequiresRenderedMapToContinue:(BOOL)a3;
- (void)setSelectedLabelMarker:(id)a3;
- (void)setSelectedTransitLineIdentifiers:(id)a3;
- (void)setTappedCoordinate:(CLLocationCoordinate2D)a3;
- (void)setTextFieldPlaceholder:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RAPMapFeaturePickerViewController

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 inMapRect:(id)a6 withCamera:(id)a7 analyticsTarget:(int)a8 selection:(id)a9
{
  double var1 = a6.var1.var1;
  double var0 = a6.var1.var0;
  double v14 = a6.var0.var1;
  double v15 = a6.var0.var0;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  id v22 = a9;
  v36.receiver = self;
  v36.super_class = (Class)RAPMapFeaturePickerViewController;
  v23 = [(RAPMapFeaturePickerViewController *)&v36 initWithNibName:0 bundle:0];
  v24 = v23;
  if (v23)
  {
    v23->_kind = a3;
    v23->_rect.origin.x = v15;
    v23->_rect.origin.y = v14;
    v23->_rect.size.width = var0;
    v23->_rect.size.height = var1;
    id v25 = [v22 copy];
    id selection = v24->_selection;
    v24->_id selection = v25;

    v27 = (NSString *)[v19 copy];
    prompt = v24->_prompt;
    v24->_prompt = v27;

    objc_storeStrong((id *)&v24->_originalPromptMessage, v24->_prompt);
    v29 = (MKMapCamera *)[v21 copy];
    mapCamera = v24->_mapCamera;
    v24->_mapCamera = v29;

    CLLocationCoordinate2D v31 = kCLLocationCoordinate2DInvalid;
    v24->_selectedCoordinate = kCLLocationCoordinate2DInvalid;
    v24->_initialFeatureCoordinate = v31;
    v24->_analyticsTarget = a8;
    [(RAPMapFeaturePickerViewController *)v24 setTitle:v20];
    v32 = +[NSBundle mainBundle];
    v33 = [v32 localizedStringForKey:@"Back" value:@"localized string not found" table:0];
    v34 = [(RAPMapFeaturePickerViewController *)v24 navigationItem];
    [v34 setBackButtonTitle:v33];

    v24->_mapViewZoomLevel = -1.0;
  }

  return v24;
}

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 inMapRect:(id)a6 withCamera:(id)a7 analyticsTarget:(int)a8 preferredMapType:(unint64_t)a9 selection:(id)a10
{
  id result = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:](self, "initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:", a3, a4, a5, a7, *(void *)&a8, a10, a6.var0.var0, a6.var0.var1, a6.var1.var0, a6.var1.var1);
  if (result)
  {
    *((unsigned char *)result + 56) = 1;
    *((void *)result + 8) = a9;
  }
  return result;
}

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 initialFeatureCoordinate:(CLLocationCoordinate2D)a6 inMapRect:(id)a7 withCamera:(id)a8 analyticsTarget:(int)a9 selection:(id)a10
{
  CLLocationDegrees longitude = a6.longitude;
  CLLocationDegrees latitude = a6.latitude;
  id result = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:](self, "initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:", a3, a4, a5, a8, *(void *)&a9, a10, a7.var0.var0, a7.var0.var1, a7.var1.var0, a7.var1.var1);
  if (result)
  {
    *((CLLocationDegrees *)result + 19) = latitude;
    *((CLLocationDegrees *)result + 20) = longitude;
  }
  return result;
}

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 initialFeatureCoordinate:(CLLocationCoordinate2D)a6 inMapRect:(id)a7 withCamera:(id)a8 analyticsTarget:(int)a9 selection:(id)a10 textFieldTitle:(id)a11 textFieldText:(id)a12 textFieldWithEditBlock:(id)a13
{
  uint64_t v14 = *(void *)&a9;
  double var1 = a7.var1.var1;
  double var0 = a7.var1.var0;
  double v20 = a7.var0.var1;
  double v21 = a7.var0.var0;
  double longitude = a6.longitude;
  double latitude = a6.latitude;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  v29 = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:](self, "initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:", a3, a4, a5, a8, v14, a10, latitude, longitude, v21, v20, var0, var1);
  if (v29)
  {
    id v30 = [v26 copy];
    CLLocationCoordinate2D v31 = (void *)v29[23];
    v29[23] = v30;

    id v32 = [v27 copy];
    v33 = (void *)v29[24];
    v29[24] = v32;

    [v29 _updateCommitBarItem];
    objc_initWeak(&location, v29);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100A6E7B0;
    v37[3] = &unk_101315A08;
    objc_copyWeak(&v39, &location);
    id v38 = v28;
    v34 = objc_retainBlock(v37);
    v35 = (void *)v29[22];
    v29[22] = v34;

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v29;
}

- (void)_selectionDidChange
{
  if (!self->_creatingMapViewReportContext)
  {
    mapViewReportContext = self->_mapViewReportContext;
    self->_mapViewReportContext = 0;
  }
  [(RAPMapFeaturePickerViewController *)self _updateCommitBarItem];
  if ([(RAPMapFeaturePickerViewController *)self analyticTarget]
    && [(RAPMapFeaturePickerViewController *)self _selectionAction])
  {
    v4 = +[MKMapService sharedService];
    [v4 captureUserAction:[self _selectionAction] onTarget:[self analyticTarget] eventValue:0];
  }
  id selection = self->_selection;
  if (selection)
  {
    v6 = (void (*)(void))*((void *)selection + 2);
    v6();
  }
}

- (void)setDidCommit:(BOOL)a3
{
  if (self->_didCommit != a3)
  {
    self->_didCommit = a3;
    [(RAPMapFeaturePickerViewController *)self _updateCommitBarItem];
  }
}

- (void)setPrompt:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_prompt != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_prompt, a3);
    [(LocationRefinementViewController *)self->_locationPicker setInstructionsText:self->_prompt];
    v5 = v6;
  }
}

- (void)setHandlerBlocksForUserCommittedSelection:(id)a3 cancelled:(id)a4
{
  id v21 = a4;
  id v6 = a3;
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Next [Report a Problem]" value:@"localized string not found" table:0];
  [(RAPMapFeaturePickerViewController *)self setHandlerBlocksForUserCommittedSelection:v6 withRightBarButtonItemTitle:v8];

  v9 = v21;
  if (self->_cancel != v21)
  {
    id v10 = [v21 copy];
    id cancel = self->_cancel;
    self->_id cancel = v10;

    v9 = v21;
    if (v21)
    {
      if (self->_cancelBarItem) {
        goto LABEL_8;
      }
      v12 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancel"];
      cancelBarItem = self->_cancelBarItem;
      self->_cancelBarItem = v12;

      uint64_t v14 = self->_cancelBarItem;
      double v15 = [(RAPMapFeaturePickerViewController *)self navigationItem];
      v16 = v15;
      v17 = v14;
    }
    else
    {
      v18 = [(RAPMapFeaturePickerViewController *)self navigationItem];
      id v19 = [v18 leftBarButtonItem];
      double v20 = self->_cancelBarItem;

      v9 = 0;
      if (v19 != v20) {
        goto LABEL_8;
      }
      double v15 = [(RAPMapFeaturePickerViewController *)self navigationItem];
      v16 = v15;
      v17 = 0;
    }
    [v15 setLeftBarButtonItem:v17];

    v9 = v21;
  }
LABEL_8:
}

- (void)setHandlerBlocksForUserCommittedSelection:(id)a3 withRightBarButtonItemTitle:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (self->_commit != v19)
  {
    id v7 = [v19 copy];
    id commit = self->_commit;
    self->_id commit = v7;

    if (v19)
    {
      if (self->_commitBarItem) {
        goto LABEL_11;
      }
      id v9 = objc_alloc((Class)UIBarButtonItem);
      if (v6) {
        id v10 = (UIBarButtonItem *)[v9 initWithTitle:v6 style:2 target:self action:"_commit"];
      }
      else {
        id v10 = (UIBarButtonItem *)[v9 initWithBarButtonSystemItem:0 target:self action:"_commit"];
      }
      commitBarItem = self->_commitBarItem;
      self->_commitBarItem = v10;

      [(RAPMapFeaturePickerViewController *)self _updateCommitBarItem];
      v18 = self->_commitBarItem;
      uint64_t v14 = [(RAPMapFeaturePickerViewController *)self navigationItem];
      double v15 = v14;
      v16 = v18;
    }
    else
    {
      v11 = [(RAPMapFeaturePickerViewController *)self navigationItem];
      v12 = [v11 rightBarButtonItem];
      v13 = self->_commitBarItem;

      if (v12 != v13) {
        goto LABEL_11;
      }
      uint64_t v14 = [(RAPMapFeaturePickerViewController *)self navigationItem];
      double v15 = v14;
      v16 = 0;
    }
    [v14 setRightBarButtonItem:v16];
  }
LABEL_11:
}

- (void)_commit
{
  id commit = (void (**)(id, RAPMapFeaturePickerViewController *))self->_commit;
  if (commit) {
    commit[2](commit, self);
  }
  if ([(RAPMapFeaturePickerViewController *)self analyticTarget])
  {
    id v4 = +[MKMapService sharedService];
    [v4 captureUserAction:10110 onTarget:[self analyticTarget] eventValue:0];
  }
}

- (void)_cancel
{
  id cancel = (void (**)(id, RAPMapFeaturePickerViewController *))self->_cancel;
  if (cancel) {
    cancel[2](cancel, self);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPMapFeaturePickerViewController;
  [(RAPMapFeaturePickerViewController *)&v6 viewDidDisappear:a3];
  if ([(RAPMapFeaturePickerViewController *)self isMovingFromParentViewController])
  {
    id v4 = [(RAPMapFeaturePickerViewController *)self backButtonPressedCallback];

    if (v4)
    {
      v5 = [(RAPMapFeaturePickerViewController *)self backButtonPressedCallback];
      v5[2]();
    }
  }
}

- (int)_selectionAction
{
  unint64_t v2 = self->_kind - 6;
  if (v2 > 2) {
    return 10141;
  }
  else {
    return dword_100F731B8[v2];
  }
}

- (void)_updateCommitBarItem
{
  switch(self->_kind)
  {
    case 0:
    case 1:
    case 7:
    case 8:
      v3 = [(RAPMapFeaturePickerViewController *)self selectedLabelMarker];
      int v4 = v3 != 0;

      break;
    case 2:
      int v4 = 1;
      break;
    case 3:
    case 4:
    case 5:
      v5 = [(RAPMapFeaturePickerViewController *)self selectedAddressLocation];
      if (v5) {
        BOOL v6 = !self->_didCommit;
      }
      else {
        BOOL v6 = 0;
      }

      int64_t kind = self->_kind;
      if (kind == 5 || kind == 3)
      {
        int32x2_t v9 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabdq_f64((float64x2_t)self->_initialFeatureCoordinate, (float64x2_t)kCLLocationCoordinate2DInvalid)));
        int v4 = v6 & v9.i32[0] & v9.i32[1];
        if ((v9.i32[0] & v9.i32[1] & 1) == 0 && v6)
        {
          [(RAPMapFeaturePickerViewController *)self selectedCoordinate];
          BOOL v11 = vabdd_f64(v10, self->_initialFeatureCoordinate.latitude) >= 0.00000000999999994;
          int v4 = vabdd_f64(v12, self->_initialFeatureCoordinate.longitude) >= 0.00000000999999994 || v11;
        }
      }
      else
      {
        int v4 = v6;
      }
      if (self->_textFieldEditBlock)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [(RAPLocationRefinementViewController *)self->_locationPicker editedValue];
          double v15 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v16 = [v14 stringByTrimmingCharactersInSet:v15];

          if (v4) {
            int v4 = [v16 length] != 0;
          }
        }
      }
      if (self->_didCommit)
      {
        v13 = +[NSBundle mainBundle];
        v17 = [v13 localizedStringForKey:@"Gathering location data [Report a Problem]" value:@"localized string not found" table:0];
        [(RAPMapFeaturePickerViewController *)self setPrompt:v17];

        goto LABEL_27;
      }
      [(RAPMapFeaturePickerViewController *)self setPrompt:self->_originalPromptMessage];
      break;
    case 6:
      v13 = [(RAPMapFeaturePickerViewController *)self selectedTransitLineMarkers];
      if ([v13 count]) {
        int v4 = self->_transitLinesAnnotation != 0;
      }
      else {
        int v4 = 0;
      }
LABEL_27:

      break;
    default:
      int v4 = 0;
      break;
  }
  unsigned int v18 = [(RAPMapFeaturePickerViewController *)self requiresRenderedMapToContinue];
  char mapViewHasFinishedToRenderMap = (v18 ^ 1) & v4;
  if (((v18 ^ 1) & 1) == 0 && v4) {
    char mapViewHasFinishedToRenderMap = self->_mapViewHasFinishedToRenderMap;
  }
  self->_canCommit = mapViewHasFinishedToRenderMap;
  commitBarItem = self->_commitBarItem;

  -[UIBarButtonItem setEnabled:](commitBarItem, "setEnabled:");
}

- (void)setMapViewZoomLevel:(double)a3
{
  self->_mapViewZoomLevel = a3;
  if (a3 >= 0.0) {
    -[LocationRefinementViewController setInitialMapViewZoomLevel:](self->_locationPicker, "setInitialMapViewZoomLevel:");
  }
}

- (void)setTextFieldPlaceholder:(id)a3
{
  id v6 = a3;
  int v4 = (NSString *)[v6 copy];
  textFieldPlaceholder = self->_textFieldPlaceholder;
  self->_textFieldPlaceholder = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(RAPLocationRefinementViewController *)self->_locationPicker setTextFieldPlaceholder:v6];
  }
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)RAPMapFeaturePickerViewController;
  [(RAPMapFeaturePickerViewController *)&v36 viewDidLoad];
  v3 = [(RAPMapFeaturePickerViewController *)self view];
  unint64_t v4 = self->_kind - 3;
  if (self->_textFieldEditBlock) {
    v5 = [[RAPAddAPlaceLocationRefinementViewController alloc] initWithCamera:self->_mapCamera showCrosshair:v4 < 3 textFieldTitle:self->_textFieldTitle textFieldPlaceholder:self->_textFieldPlaceholder textFieldText:self->_textFieldText textFieldEditBlock:self->_textFieldEditBlock];
  }
  else {
    v5 = [[RAPLocationRefinementViewController alloc] initWithCamera:self->_mapCamera showCrosshair:v4 < 3];
  }
  locationPicker = self->_locationPicker;
  self->_locationPicker = &v5->super;

  [(RAPMapFeaturePickerViewController *)self mapViewZoomLevel];
  if (v7 >= 0.0)
  {
    v8 = self->_locationPicker;
    [(RAPMapFeaturePickerViewController *)self mapViewZoomLevel];
    -[LocationRefinementViewController setInitialMapViewZoomLevel:](v8, "setInitialMapViewZoomLevel:");
  }
  [v3 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(RAPLocationRefinementViewController *)self->_locationPicker view];
  [v17 setFrame:v10, v12, v14, v16];

  [(LocationRefinementViewController *)self->_locationPicker setMapViewDelegate:self];
  unsigned int v18 = [(LocationRefinementViewController *)self->_locationPicker mapView];
  [v18 setShowsUserLocation:1];

  id v19 = [(LocationRefinementViewController *)self->_locationPicker mapView];
  [v19 _setShowsVenues:1];

  [(LocationRefinementViewController *)self->_locationPicker setInstructionsText:self->_prompt];
  double v20 = [(LocationRefinementViewController *)self->_locationPicker mapView];
  [v20 visibleMapRect];
  self->_selectedMapRect.origin.x = v21;
  self->_selectedMapRect.origin.double y = v22;
  self->_selectedMapRect.size.width = v23;
  self->_selectedMapRect.size.height = v24;

  id v25 = [(LocationRefinementViewController *)self->_locationPicker mapView];
  [v25 setBackdropViewQualityChangingDisabled:1];

  id v26 = [(LocationRefinementViewController *)self->_locationPicker mapView];
  mapView = self->_mapView;
  self->_mapView = v26;

  [(RAPMapFeaturePickerViewController *)self addChildViewController:self->_locationPicker];
  id v28 = [(RAPLocationRefinementViewController *)self->_locationPicker view];
  [v3 addSubview:v28];

  [(RAPLocationRefinementViewController *)self->_locationPicker didMoveToParentViewController:self];
  double y = self->_rect.origin.y;
  if (self->_rect.origin.x != MKMapRectNull.origin.x || y != MKMapRectNull.origin.y) {
    -[MKMapView setVisibleMapRect:](self->_mapView, "setVisibleMapRect:", self->_rect.origin.x, y, self->_rect.size.width, self->_rect.size.height);
  }
  switch(self->_kind)
  {
    case 0:
    case 1:
    case 5:
    case 8:
      if (self->_hasPreferredMapType)
      {
        if ((self->_preferredMapType & 0xFFFFFFFFFFFFFFFDLL) == 1) {
          unint64_t preferredMapType = 0;
        }
        else {
          unint64_t preferredMapType = self->_preferredMapType;
        }
      }
      else
      {
        unint64_t preferredMapType = 0;
      }
      [(MKMapView *)self->_mapView setMapType:preferredMapType];
      [(MKMapView *)self->_mapView _setCanSelectAllLabels:1];
      break;
    case 2:
      [(MKMapView *)self->_mapView setMapType:3];
      break;
    case 3:
    case 4:
      if (self->_hasPreferredMapType)
      {
        if ((self->_preferredMapType & 0xFFFFFFFFFFFFFFFDLL) == 1) {
          unint64_t v31 = 4;
        }
        else {
          unint64_t v31 = self->_preferredMapType;
        }
      }
      else
      {
        unint64_t v31 = 4;
      }
      [(MKMapView *)self->_mapView setMapType:v31];
      if (CLLocationCoordinate2DIsValid(self->_initialFeatureCoordinate)) {
        -[LocationRefinementViewController setSelectedCoordinate:animated:](self->_locationPicker, "setSelectedCoordinate:animated:", 0, self->_initialFeatureCoordinate.latitude, self->_initialFeatureCoordinate.longitude);
      }
      break;
    case 6:
      [(MKMapView *)self->_mapView setMapType:104];
      id v32 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_mapTappedForTransitLineSelection:"];
      [(MKMapView *)self->_mapView addGestureRecognizer:v32];
      goto LABEL_23;
    case 7:
      [(MKMapView *)self->_mapView setMapType:104];
      [(MKMapView *)self->_mapView _setCanSelectAllLabels:1];
      id v33 = objc_alloc((Class)MKPointOfInterestFilter);
      MKPointOfInterestCategory v37 = MKPointOfInterestCategoryPublicTransport;
      v34 = +[NSArray arrayWithObjects:&v37 count:1];
      id v32 = [v33 initIncludingCategories:v34];

      [(MKMapView *)self->_mapView setPointOfInterestFilter:v32];
LABEL_23:

      break;
    default:
      break;
  }
  selectedLabelMarker = self->_selectedLabelMarker;
  if (selectedLabelMarker) {
    [(MKMapView *)self->_mapView _selectLabelMarker:selectedLabelMarker animated:1];
  }
  if ([(RAPMapFeaturePickerViewController *)self _shouldShowModeSelector])
  {
    [(RAPMapFeaturePickerViewController *)self _showModeSelector];
    [(RAPMapFeaturePickerViewController *)self _updateAttributionInsets];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RAPMapFeaturePickerViewController;
  [(RAPMapFeaturePickerViewController *)&v4 viewWillAppear:a3];
  [(LocationRefinementViewController *)self->_locationPicker setMapViewDelegate:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RAPMapFeaturePickerViewController;
  [(RAPMapFeaturePickerViewController *)&v7 viewWillDisappear:a3];
  [(LocationRefinementViewController *)self->_locationPicker setMapViewDelegate:0];
  objc_super v4 = [(RAPMapFeaturePickerViewController *)self navigationController];
  unsigned __int8 v5 = [v4 isToolbarHidden];

  if ((v5 & 1) == 0)
  {
    id v6 = [(RAPMapFeaturePickerViewController *)self navigationController];
    [v6 setToolbarHidden:0 animated:0];
  }
}

- (int)analyticTarget
{
  return self->_analyticsTarget;
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  p_selectedCoordinate = &self->_selectedCoordinate;
  if ((unint64_t)(self->_kind - 3) >= 3)
  {
    double latitude = p_selectedCoordinate->latitude;
    double longitude = self->_selectedCoordinate.longitude;
  }
  else
  {
    [(LocationRefinementViewController *)self->_locationPicker selectedCoordinate];
    double v5 = v4;
    double v7 = v6;
    double latitude = p_selectedCoordinate->latitude;
    if (vabdd_f64(p_selectedCoordinate->latitude, v5) >= 0.00000000999999994
      || (double longitude = p_selectedCoordinate->longitude, vabdd_f64(longitude, v7) >= 0.00000000999999994))
    {
      double v10 = [RAPAddressLocation alloc];
      [(LocationRefinementViewController *)self->_locationPicker selectedCoordinate];
      double v11 = -[RAPAddressLocation initWithCoordinate:](v10, "initWithCoordinate:");
      selectedAddressLocation = self->_selectedAddressLocation;
      self->_selectedAddressLocation = v11;

      [(LocationRefinementViewController *)self->_locationPicker selectedCoordinate];
    }
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)_mapTappedForTransitLineSelection:(id)a3
{
  [a3 locationInView:self->_mapView];
  double v5 = v4;
  double v7 = v6;
  -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", self->_mapView);
  self->_tappedCoordinate.double latitude = v8;
  self->_tappedCoordinate.double longitude = v9;
  double v10 = -[MKMapView _transitLineMarkersForSelectionAtPoint:](self->_mapView, "_transitLineMarkersForSelectionAtPoint:", v5, v7);
  id v11 = [v10 count];
  if (v11) {
    id v12 = [v10 copy];
  }
  else {
    id v12 = 0;
  }
  objc_storeStrong((id *)&self->_selectedTransitLineMarkers, v12);
  if (v11) {

  }
  if (self->_transitLinesAnnotation)
  {
    -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:");
    transitLinesAnnotation = self->_transitLinesAnnotation;
    self->_transitLinesAnnotation = 0;
  }
  id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v10;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) identifier:v23];
        if (v20) {
          [v14 addObject:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray();
  double v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  selectedTransitLineIdentifiers = self->_selectedTransitLineIdentifiers;
  self->_selectedTransitLineIdentifiers = v21;

  [(RAPMapFeaturePickerViewController *)self _selectionDidChange];
  [(RAPMapFeaturePickerViewController *)self _updateCommitBarItem];
}

- (void)displayAnnotationAtCoordinate:(CLLocationCoordinate2D)a3 withText:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = a4;
  v11.double latitude = latitude;
  v11.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v11))
  {
    double v7 = -[RAPTransitLinesAnnotation initWithCoordinate:title:]([RAPTransitLinesAnnotation alloc], "initWithCoordinate:title:", v9, latitude, longitude);
    transitLinesAnnotation = self->_transitLinesAnnotation;
    self->_transitLinesAnnotation = v7;

    [(MKMapView *)self->_mapView addAnnotation:self->_transitLinesAnnotation];
    [(RAPMapFeaturePickerViewController *)self _updateCommitBarItem];
  }
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  transitLinesAnnotation = self->_transitLinesAnnotation;
  if (transitLinesAnnotation)
  {
    id v7 = a4;
    CLLocationDegrees v8 = [a3 viewForAnnotation:transitLinesAnnotation];
    unsigned int v9 = [v7 containsObject:v8];

    if (v9)
    {
      dispatch_time_t v10 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100A6FC70;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CLLocationDegrees v8 = v7;
  LOBYTE(v9) = 0;
  switch(self->_kind)
  {
    case 0:
      unsigned int v9 = [v7 isOneWayArrow] ^ 1;
      break;
    case 1:
      LOBYTE(v9) = [v7 hasBusinessID];
      break;
    case 7:
      if (![v7 hasBusinessID]) {
        goto LABEL_11;
      }
      BOOL v10 = [v8 featureType] == 5;
      goto LABEL_8;
    case 8:
      if ([v7 hasBusinessID])
      {
        BOOL v10 = [v8 featureType] == 6;
LABEL_8:
        LOBYTE(v9) = v10;
      }
      else
      {
LABEL_11:
        LOBYTE(v9) = 0;
      }
      break;
    default:
      break;
  }

  return v9;
}

- (void)setSelectedLabelMarker:(id)a3
{
  p_selectedLabelMarker = &self->_selectedLabelMarker;
  objc_storeStrong((id *)&self->_selectedLabelMarker, a3);
  id v6 = a3;
  [(MKMapView *)self->_mapView _selectLabelMarker:*p_selectedLabelMarker animated:1];
}

- (BOOL)_kindTracksLabelMarkerSelection
{
  return (unint64_t)(self->_kind - 7) < 0xFFFFFFFFFFFFFFFBLL;
}

- (RAPMapStateProtocol)mapViewReportContext
{
  mapViewReportContext = self->_mapViewReportContext;
  if (!mapViewReportContext)
  {
    if (self->_mapView)
    {
      self->_creatingMapViewReportContext = 1;
      double v4 = +[MKMapService sharedService];
      double v5 = [v4 mapsDefaultTraitsForMapView:self->_mapView mapViewEnteredForegroundDate:0 mapViewportChangedDate:0];

      id v6 = [[RAPMapState alloc] initWithMapView:self->_mapView traits:v5 place:0];
      id v7 = self->_mapViewReportContext;
      self->_mapViewReportContext = (RAPMapStateProtocol *)v6;

      self->_creatingMapViewReportContext = 0;
      mapViewReportContext = self->_mapViewReportContext;
    }
    else
    {
      mapViewReportContext = 0;
    }
  }

  return mapViewReportContext;
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  CLLocationDegrees v8 = (VKLabelMarker *)a4;
  unsigned int v5 = [(RAPMapFeaturePickerViewController *)self _kindTracksLabelMarkerSelection];
  id v6 = v8;
  if (v5)
  {
    selectedLabelMarker = self->_selectedLabelMarker;
    if (!v8 || selectedLabelMarker == v8)
    {
      self->_selectedLabelMarker = 0;

      [(RAPMapFeaturePickerViewController *)self _selectionDidChange];
      id v6 = v8;
    }
  }
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6 = a4;
  if ([(RAPMapFeaturePickerViewController *)self _kindTracksLabelMarkerSelection])
  {
    objc_storeStrong((id *)&self->_selectedLabelMarker, a4);
    [(RAPMapFeaturePickerViewController *)self _selectionDidChange];
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = (RAPTransitLinesAnnotation *)a4;
  if (self->_transitLinesAnnotation == v6)
  {
    id v7 = [a3 dequeueReusableAnnotationViewWithIdentifier:@"transitLinesAnnotation"];
    if (!v7) {
      id v7 = [objc_alloc((Class)MKAnnotationView) initWithAnnotation:v6 reuseIdentifier:@"transitLinesAnnotation"];
    }
    [v7 setCanShowCallout:1];
  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    id v7 = 0;
  }

  return v7;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v14 = a3;
  int64_t kind = self->_kind;
  if (kind == 2)
  {
    [(MKMapView *)self->_mapView visibleMapRect];
    self->_selectedMapRect.origin.x = v6;
    self->_selectedMapRect.origin.double y = v7;
    self->_selectedMapRect.size.width = v8;
    self->_selectedMapRect.size.height = v9;
    [(RAPMapFeaturePickerViewController *)self _selectionDidChange];
    int64_t kind = self->_kind;
  }
  if ((unint64_t)(kind - 3) <= 2)
  {
    [(LocationRefinementViewController *)self->_locationPicker selectedCoordinate];
    self->_selectedCoordinate.double latitude = v10;
    self->_selectedCoordinate.double longitude = v11;
    id v12 = -[RAPAddressLocation initWithCoordinate:]([RAPAddressLocation alloc], "initWithCoordinate:", self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
    selectedAddressLocation = self->_selectedAddressLocation;
    self->_selectedAddressLocation = v12;

    [(RAPAddressLocation *)self->_selectedAddressLocation processWithGeocoderIfNeededWithCompletion:0];
    [(RAPMapFeaturePickerViewController *)self _selectionDidChange];
  }
}

- (void)mapViewWillStartRenderingMap:(id)a3
{
  self->_char mapViewHasFinishedToRenderMap = 0;
  if ([(RAPMapFeaturePickerViewController *)self requiresRenderedMapToContinue])
  {
    [(RAPMapFeaturePickerViewController *)self _updateCommitBarItem];
  }
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  self->_char mapViewHasFinishedToRenderMap = 1;
  if ([(RAPMapFeaturePickerViewController *)self requiresRenderedMapToContinue])
  {
    [(RAPMapFeaturePickerViewController *)self _updateCommitBarItem];
  }
}

- (BOOL)_shouldShowModeSelector
{
  return (self->_kind > 8uLL) | (0x1Bu >> self->_kind) & 1;
}

- (void)_showModeSelector
{
  v3 = [(LocationRefinementViewController *)self->_locationPicker userLocationButtonBottomConstraint];

  if (v3)
  {
    double v4 = [(LocationRefinementViewController *)self->_locationPicker userLocationButtonBottomConstraint];
    id v32 = v4;
    unsigned int v5 = +[NSArray arrayWithObjects:&v32 count:1];
    +[NSLayoutConstraint deactivateConstraints:v5];

    double v6 = [(LocationRefinementViewController *)self->_locationPicker snapToUserLocationContainerView];
    [v6 removeFromSuperview];
  }
  double v7 = [[MapViewModeSelector alloc] initWithDesiredViewModes:&off_1013AE538];
  modeSelector = self->_modeSelector;
  self->_modeSelector = v7;

  double v9 = [(LocationRefinementViewController *)self->_locationPicker mapView];
  id v10 = [v9 mapType];
  switch((unint64_t)v10)
  {
    case 1uLL:
      uint64_t v11 = 2;
      break;
    case 2uLL:
      uint64_t v11 = 1;
      break;
    case 3uLL:
      uint64_t v11 = 6;
      break;
    case 4uLL:
      uint64_t v11 = 5;
      break;
    default:
      uint64_t v12 = 3;
      if (v10 != (id)104) {
        uint64_t v12 = 0;
      }
      if (v10 == (id)103) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = v12;
      }
      break;
  }

  [(MapViewModeSelector *)self->_modeSelector addTarget:self action:"_handleSegmentedControlTap:" forControlEvents:4096];
  [(MapViewModeSelector *)self->_modeSelector setSelectedViewMode:v11];
  sub_1005CA8A0(self->_modeSelector);
  double v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  floatingControlsView = self->_floatingControlsView;
  self->_floatingControlsView = v13;

  id v15 = [(RAPMapFeaturePickerViewController *)self view];
  [v15 addSubview:self->_floatingControlsView];

  id v28 = [(UIView *)self->_floatingControlsView leadingAnchor];
  id v30 = [(RAPMapFeaturePickerViewController *)self view];
  v29 = [v30 safeAreaLayoutGuide];
  id v27 = [v29 leadingAnchor];
  long long v26 = [v28 constraintEqualToAnchor:v27 constant:8.0];
  v31[0] = v26;
  id v16 = [(UIView *)self->_floatingControlsView trailingAnchor];
  id v17 = [(RAPMapFeaturePickerViewController *)self view];
  uint64_t v18 = [v17 safeAreaLayoutGuide];
  id v19 = [v18 trailingAnchor];
  double v20 = [v16 constraintEqualToAnchor:v19 constant:-8.0];
  v31[1] = v20;
  double v21 = [(UIView *)self->_floatingControlsView bottomAnchor];
  double v22 = [(MKMapView *)self->_mapView safeAreaLayoutGuide];
  long long v23 = [v22 bottomAnchor];
  long long v24 = [v21 constraintEqualToAnchor:v23 constant:-8.0];
  v31[2] = v24;
  long long v25 = +[NSArray arrayWithObjects:v31 count:3];
  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)_updateAttributionInsets
{
  -[UIView systemLayoutSizeFittingSize:](self->_floatingControlsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v4 = v3;
  unsigned int v5 = [(RAPMapFeaturePickerViewController *)self view];
  [v5 safeAreaInsets];
  double v7 = v6;

  double v8 = +[UIApplication sharedApplication];
  id v9 = [v8 userInterfaceLayoutDirection];

  mapView = self->_mapView;
  id v16 = [(RAPMapFeaturePickerViewController *)self view];
  [v16 safeAreaInsets];
  double v12 = v11;
  if (v9 == (id)1)
  {
    double v12 = v11 + 8.0;
    double v13 = [(RAPMapFeaturePickerViewController *)self view];
    [v13 safeAreaInsets];
  }
  else
  {
    double v13 = [(RAPMapFeaturePickerViewController *)self view];
    [v13 safeAreaInsets];
    double v14 = v15 + 8.0;
  }
  -[MKMapView _setAttributionInsets:](mapView, "_setAttributionInsets:", 0.0, v12, v4 + v7 + 8.0, v14);
}

- (void)_handleSegmentedControlTap:(id)a3
{
  int64_t v4 = [(MapViewModeSelector *)self->_modeSelector selectedViewMode];
  uint64_t v5 = 0;
  mapView = self->_mapView;
  if (v4 == 2) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v4 - 1;
  }
  if (v7 <= 6) {
    uint64_t v5 = qword_100F731C8[v7];
  }

  [(MKMapView *)mapView setMapType:v5];
}

- (NSArray)selectedTransitLineMarkers
{
  return self->_selectedTransitLineMarkers;
}

- (VKLabelMarker)selectedLabelMarker
{
  return self->_selectedLabelMarker;
}

- ($C79183323B9A0D5602617FF3BE5395AC)selectedMapRect
{
  double x = self->_selectedMapRect.origin.x;
  double y = self->_selectedMapRect.origin.y;
  double width = self->_selectedMapRect.size.width;
  double height = self->_selectedMapRect.size.height;
  result.var1.double var1 = height;
  result.var1.double var0 = width;
  result.var0.double var1 = y;
  result.var0.double var0 = x;
  return result;
}

- (RAPAddressLocation)selectedAddressLocation
{
  return self->_selectedAddressLocation;
}

- (NSArray)selectedTransitLineIdentifiers
{
  return self->_selectedTransitLineIdentifiers;
}

- (void)setSelectedTransitLineIdentifiers:(id)a3
{
}

- (CLLocationCoordinate2D)tappedCoordinate
{
  double latitude = self->_tappedCoordinate.latitude;
  double longitude = self->_tappedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setTappedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_tappedCoordinate = a3;
}

- (BOOL)canCommit
{
  return self->_canCommit;
}

- (BOOL)didCommit
{
  return self->_didCommit;
}

- (BOOL)requiresRenderedMapToContinue
{
  return self->_requiresRenderedMapToContinue;
}

- (void)setRequiresRenderedMapToContinue:(BOOL)a3
{
  self->_requiresRenderedMapToContinue = a3;
}

- (NSString)textFieldPlaceholder
{
  return self->_textFieldPlaceholder;
}

- (id)backButtonPressedCallback
{
  return self->_backButtonPressedCallback;
}

- (void)setBackButtonPressedCallback:(id)a3
{
}

- (double)mapViewZoomLevel
{
  return self->_mapViewZoomLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backButtonPressedCallback, 0);
  objc_storeStrong((id *)&self->_textFieldPlaceholder, 0);
  objc_storeStrong((id *)&self->_mapViewReportContext, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedAddressLocation, 0);
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineMarkers, 0);
  objc_storeStrong((id *)&self->_modeSelector, 0);
  objc_storeStrong((id *)&self->_floatingControlsView, 0);
  objc_storeStrong((id *)&self->_textFieldText, 0);
  objc_storeStrong((id *)&self->_textFieldTitle, 0);
  objc_storeStrong(&self->_textFieldEditBlock, 0);
  objc_storeStrong((id *)&self->_transitLinesAnnotation, 0);
  objc_storeStrong(&self->_cancel, 0);
  objc_storeStrong(&self->_commit, 0);
  objc_storeStrong((id *)&self->_cancelBarItem, 0);
  objc_storeStrong((id *)&self->_commitBarItem, 0);
  objc_storeStrong((id *)&self->_locationPicker, 0);
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_originalPromptMessage, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_mapCamera, 0);
}

@end