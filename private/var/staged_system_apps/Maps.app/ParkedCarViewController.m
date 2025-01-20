@interface ParkedCarViewController
+ (double)headerHeightInMinimalMode;
- (BOOL)_canShowWhileLocked;
- (BOOL)isActive;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (ParkedCar)parkedCar;
- (ParkedCarViewControllerDelegate)parkedCarDelegate;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UIView)draggableHeaderView;
- (UIView)viewForHeaderContainmentString;
- (double)contentAlpha;
- (double)currentHeight;
- (double)heightForContentAboveTitle;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)draggableContent;
- (void)_editLocationTapped;
- (void)_getDirections;
- (void)_handlePhotoTap;
- (void)_imagePickerDidRetake:(id)a3;
- (void)_loadStackViewIfNeeded;
- (void)_locationApprovalDidChange:(id)a3;
- (void)_showCamera;
- (void)_showLocationRefinement;
- (void)_updateContentAlpha:(double)a3;
- (void)_updateSectionControllerState:(BOOL)a3;
- (void)dismissTextField;
- (void)hideTitle:(BOOL)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)instrumentDismissAction;
- (void)locationRefinementViewController:(id)a3 didSelectCoordinate:(CLLocationCoordinate2D)a4;
- (void)parkedCarDetailsSectionControllerDidRemovePhoto:(id)a3;
- (void)parkedCarDetailsSectionControllerDidTapAddPhotos:(id)a3;
- (void)parkedCarDetailsSectionControllerDidTapViewPhoto:(id)a3;
- (void)parkedCarFooterActionsSectionControllerDidRemoveParkedCar:(id)a3;
- (void)parkedCarFooterActionsSectionControllerDidShareLocation:(id)a3;
- (void)parkedCarHeaderButtonsSectionControllerRequestsDirections:(id)a3;
- (void)parkedCarHeaderButtonsSectionControllerRequestsEditLocation:(id)a3;
- (void)parkedCarManager:(id)a3 didUpdateParkedCar:(id)a4;
- (void)performAction:(int64_t)a3;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)setActive:(BOOL)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setParkedCar:(id)a3;
- (void)setParkedCarDelegate:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setTransitOptions:(id)a3;
- (void)setWalkingOptions:(id)a3;
- (void)textFieldRowViewDidBeginEditing:(id)a3;
- (void)textFieldRowViewDidChange:(id)a3;
- (void)textFieldRowViewDidEndEditing:(id)a3;
- (void)updateHeaderTrailingConstant;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ParkedCarViewController

- (UIScrollViewDelegate)scrollViewDelegate
{
  v2 = [(ParkedCarViewController *)self scrollView];
  v3 = [v2 delegate];

  return (UIScrollViewDelegate *)v3;
}

- (void)setScrollViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ParkedCarViewController *)self scrollView];
  [v5 setDelegate:v4];
}

- (double)heightForContentAboveTitle
{
  return 0.0;
}

+ (double)headerHeightInMinimalMode
{
  +[MUPlaceHeaderView minimalModeHeight];
  return result;
}

- (void)hideTitle:(BOOL)a3
{
}

- (double)currentHeight
{
  [(MUScrollableStackView *)self->_contentStackView contentSize];
  return v2;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
}

- (UIScrollView)scrollView
{
  [(ParkedCarViewController *)self _loadStackViewIfNeeded];
  contentStackView = self->_contentStackView;

  return (UIScrollView *)contentStackView;
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_double contentAlpha = a3;
    [(ParkedCarViewController *)self _loadStackViewIfNeeded];
    double contentAlpha = self->_contentAlpha;
    [(ParkedCarViewController *)self _updateContentAlpha:contentAlpha];
  }
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)_updateContentAlpha:(double)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_sectionControllers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(ParkedCarHeaderSectionController **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (v10 != self->_headerSectionController)
        {
          v11 = [(ParkedCarHeaderSectionController *)v10 sectionView];
          [v11 setAlpha:a3];
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)ParkedCarViewController;
  [(ParkedCarViewController *)&v29 viewDidLoad];
  [(ParkedCarViewController *)self _loadStackViewIfNeeded];
  v3 = [(ParkedCarViewController *)self view];
  [v3 addSubview:self->_contentStackView];

  id v4 = [(ParkedCarViewController *)self view];
  [v4 setAccessibilityIdentifier:@"ParkedCarView"];

  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
  v23 = [[ParkedCarHeaderSectionController alloc] initWithParkedCar:self->_parkedCar];
  [v5 addObject:];
  id v6 = [[ParkedCarHeaderButtonsSectionController alloc] initWithParkedCar:self->_parkedCar];
  [(ParkedCarHeaderButtonsSectionController *)v6 setActionDelegate:self];
  v24 = v6;
  [v5 addObject:v6];
  id v7 = [[ParkedCarDetailsSectionController alloc] initWithParkedCar:self->_parkedCar];
  [(ParkedCarDetailsSectionController *)v7 setTextFieldDelegate:self];
  [(ParkedCarDetailsSectionController *)v7 setDetailsDelegate:self];
  [v5 addObject:v7];
  uint64_t v8 = [[ParkedCarFooterActionsSectionController alloc] initWithParkedCar:self->_parkedCar];
  [(ParkedCarFooterActionsSectionController *)v8 setActionDelegate:self];
  [v5 addObject:v8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        contentStackView = self->_contentStackView;
        long long v15 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v13) sectionView];
        [(MUScrollableStackView *)contentStackView addArrangedSubview:v15];

        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  headerSectionController = self->_headerSectionController;
  self->_headerSectionController = v23;
  v17 = v23;

  detailsSectionController = self->_detailsSectionController;
  self->_detailsSectionController = v7;
  v19 = v7;

  v20 = (NSArray *)[v9 copy];
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v20;

  v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"_locationApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];
}

- (void)_loadStackViewIfNeeded
{
  if (!self->_contentStackView)
  {
    v3 = [objc_alloc((Class)MUScrollableStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    contentStackView = self->_contentStackView;
    self->_contentStackView = v3;

    [(MUScrollableStackView *)self->_contentStackView setSpacing:16.0];
    [(MUScrollableStackView *)self->_contentStackView setAlwaysBounceVertical:1];
    [(MUScrollableStackView *)self->_contentStackView setScrollEnabled:1];
    id v5 = self->_contentStackView;
    [(MUScrollableStackView *)v5 setKeyboardDismissMode:1];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ParkedCarViewController;
  [(ParkedCarViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(ParkedCarViewController *)self view];
  [v3 bounds];
  -[MUScrollableStackView setFrame:](self->_contentStackView, "setFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ParkedCarViewController;
  [(ParkedCarViewController *)&v4 viewWillAppear:a3];
  [(ParkedCarViewController *)self _updateSectionControllerState:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ParkedCarViewController;
  [(ParkedCarViewController *)&v4 viewDidDisappear:a3];
  [(ParkedCarViewController *)self _updateSectionControllerState:0];
}

- (void)_updateSectionControllerState:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = self->_sectionControllers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setActive:v3 v9];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_locationApprovalDidChange:(id)a3
{
  id v5 = +[MKLocationManager sharedLocationManager];
  if (([v5 isAuthorizedForPreciseLocation] & 1) == 0)
  {
    objc_super v4 = [(ParkedCarViewController *)self parkedCarDelegate];
    [v4 parkedCarViewControllerDidRequestDismissal:self];
  }
}

- (void)setParkedCar:(id)a3
{
  id v5 = (ParkedCar *)a3;
  id v6 = v5;
  p_parkedCar = &self->_parkedCar;
  parkedCar = self->_parkedCar;
  if (parkedCar == v5) {
    goto LABEL_17;
  }
  if (!v5 || parkedCar)
  {
    if (v5 || !parkedCar) {
      goto LABEL_9;
    }
    long long v9 = +[ParkedCarManager sharedManager];
    [v9 removeParkedCarObserver:self];
  }
  else
  {
    long long v9 = +[ParkedCarManager sharedManager];
    [v9 addParkedCarObserver:self];
  }

LABEL_9:
  objc_storeStrong((id *)&self->_parkedCar, a3);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = self->_sectionControllers;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) setParkedCar:*p_parkedCar v15];
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

LABEL_17:
}

- (void)dismissTextField
{
}

- (void)parkedCarManager:(id)a3 didUpdateParkedCar:(id)a4
{
  if (self->_parkedCar == a4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008EA678;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)performAction:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      [(ParkedCarViewController *)self _showLocationRefinement];
      break;
    case 2:
      [(ParkedCarViewController *)self _showCamera];
      break;
    case 1:
      [(ParkedCarDetailsSectionController *)self->_detailsSectionController activateNotesTextField];
      break;
  }
}

- (void)_handlePhotoTap
{
  BOOL v3 = [(ParkedCar *)self->_parkedCar image];
  if (v3) {
    uint64_t v4 = 6006;
  }
  else {
    uint64_t v4 = 6029;
  }

  id v5 = +[MKMapService sharedService];
  LODWORD(v11) = 1;
  [v5 capturePlaceCardUserAction:v4 onTarget:201 eventValue:0 mapItem:0 timestamp:0xFFFFFFFFLL resultIndex:0 targetID:CFAbsoluteTimeGetCurrent() providerID:0 animationID:0 actionURL:0 photoID:0 placeCardType:v11 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0];

  id v6 = [(ParkedCar *)self->_parkedCar image];

  if (v6)
  {
    uint64_t v7 = [FullscreenImageViewController alloc];
    uint64_t v8 = [(ParkedCar *)self->_parkedCar image];
    id v12 = [(FullscreenImageViewController *)v7 initWithImage:v8 scrollable:1];

    long long v9 = +[NSBundle mainBundle];
    long long v10 = [v9 localizedStringForKey:@"Parked Car [Photo Viewer]" value:@"localized string not found" table:0];
    [(FullscreenImageViewController *)v12 setTitle:v10];

    [(FullscreenImageViewController *)v12 setTransitioningDelegate:self];
    [(FullscreenImageViewController *)v12 setModalPresentationStyle:0];
    [(ParkedCarViewController *)self presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    [(ParkedCarViewController *)self _showCamera];
  }
}

- (void)_showLocationRefinement
{
  id v5 = objc_alloc_init((Class)MKMapCamera);
  [(ParkedCar *)self->_parkedCar coordinate];
  [v5 setCenterCoordinate:];
  [v5 setAltitude:1000.0];
  BOOL v3 = [[ParkedCarLocationRefinementViewController alloc] initWithCamera:v5 parkedCar:self->_parkedCar];
  [(LocationRefinementViewController *)v3 setDelegate:self];
  [(ParkedCarLocationRefinementViewController *)v3 setModalPresentationStyle:2];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v3];
  [(ParkedCarViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_showCamera
{
  id v4 = objc_alloc_init((Class)UIImagePickerController);
  [v4 setDelegate:self];
  [v4 setSourceType:1];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_imagePickerDidRetake:" name:_UIImagePickerControllerUserDidRejectItemNotification object:0];

  [(ParkedCarViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_imagePickerDidRetake:(id)a3
{
  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:6031 onTarget:620 eventValue:0];
}

- (void)_getDirections
{
  id v3 = +[MKMapService sharedService];
  LODWORD(v10) = 1;
  [v3 capturePlaceCardUserAction:6003 onTarget:201 eventValue:0 mapItem:0 timestamp:0xFFFFFFFFLL resultIndex:0 targetID:CFAbsoluteTimeGetCurrent() providerID:0 animationID:0 actionURL:0 photoID:0 placeCardType:v10 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0];

  id v4 = +[MKLocationManager sharedLocationManager];
  uint64_t v11 = [v4 lastLocation];

  if (v11
    && (+[MKLocationManager sharedLocationManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isAuthorizedForPreciseLocation],
        v5,
        v6))
  {
    [v11 coordinate];
    [(ParkedCar *)self->_parkedCar coordinate];
    GEOCalculateDistance();
    uint64_t v8 = 2 * (v7 <= 5000.0);
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v9 = [(ParkedCarViewController *)self parkedCarDelegate];
  [v9 parkerCarViewControllerDidSelectDoDirections:self transportType:v8];
}

- (void)_editLocationTapped
{
  id v3 = +[MKMapService sharedService];
  LODWORD(v4) = 1;
  [v3 capturePlaceCardUserAction:6027 onTarget:201 eventValue:0 mapItem:0 timestamp:0xFFFFFFFFLL resultIndex:0 targetID:CFAbsoluteTimeGetCurrent() providerID:0 animationID:0 actionURL:0 photoID:0 placeCardType:v4 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0];

  [(ParkedCarViewController *)self _showLocationRefinement];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [FullscreenImageViewControllerZoomAnimationController alloc];
    long long v9 = [(ParkedCarDetailsSectionController *)self->_detailsSectionController photoImageView];
    uint64_t v10 = [(FullscreenImageViewControllerZoomAnimationController *)v8 initWithOriginalImageView:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [FullscreenImageViewControllerZoomAnimationController alloc];
    double v7 = [(ParkedCarDetailsSectionController *)self->_detailsSectionController photoImageView];
    uint64_t v8 = [(FullscreenImageViewControllerZoomAnimationController *)v6 initWithOriginalImageView:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)textFieldRowViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  LODWORD(v8) = 1;
  [v5 capturePlaceCardUserAction:6032 onTarget:201 eventValue:0 mapItem:0 timestamp:0xFFFFFFFFLL resultIndex:0 targetID:CFAbsoluteTimeGetCurrent() providerID:0 animationID:0 actionURL:0 photoID:0 placeCardType:v8 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0];

  id v6 = [(ParkedCarViewController *)self parkedCarDelegate];
  [v6 parkedCarViewControllerDidBeginEditing:self];

  contentStackView = self->_contentStackView;
  long long v9 = [v4 textView];

  [v9 frame];
  -[MUScrollableStackView scrollRectToVisible:animated:](contentStackView, "scrollRectToVisible:animated:", 1);
}

- (void)textFieldRowViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v6 = +[ParkedCarManager sharedManager];
  id v5 = [v4 currentTextFieldValue];

  [v6 setNotes:v5 forParkedCar:self->_parkedCar];
}

- (void)textFieldRowViewDidChange:(id)a3
{
  contentStackView = self->_contentStackView;
  id v4 = [a3 textView];
  [(MUScrollableStackView *)contentStackView _maps_scrollTextViewSelectedRangeVisible:v4];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:_UIImagePickerControllerUserDidRejectItemNotification object:0];

  long long v9 = +[MKMapService sharedService];
  [v9 captureUserAction:17 onTarget:620 eventValue:0];

  id v11 = [v6 objectForKeyedSubscript:UIImagePickerControllerOriginalImage];

  uint64_t v10 = +[ParkedCarManager sharedManager];
  [v10 setImage:v11 forParkedCar:self->_parkedCar];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v6 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:_UIImagePickerControllerUserDidRejectItemNotification object:0];

  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:18 onTarget:620 eventValue:0];

  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)locationRefinementViewController:(id)a3 didSelectCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:a3])uint64_t v7 = 2; {
  else
  }
    uint64_t v7 = 1;
  id v8 = +[ParkedCarManager sharedManager];
  [v8 setCoordinate:v7 referenceFrame:self->_parkedCar forParkedCar:latitude, longitude];
}

- (void)parkedCarHeaderButtonsSectionControllerRequestsDirections:(id)a3
{
}

- (void)parkedCarHeaderButtonsSectionControllerRequestsEditLocation:(id)a3
{
}

- (void)parkedCarDetailsSectionControllerDidTapAddPhotos:(id)a3
{
}

- (void)parkedCarDetailsSectionControllerDidTapViewPhoto:(id)a3
{
}

- (void)parkedCarDetailsSectionControllerDidRemovePhoto:(id)a3
{
  id v5 = +[ParkedCarManager sharedManager];
  id v4 = [(ParkedCarViewController *)self parkedCar];
  [v5 removeImageForParkedCar:v4];
}

- (void)parkedCarFooterActionsSectionControllerDidShareLocation:(id)a3
{
  id v4 = [(ParkedCarViewController *)self parkedCarDelegate];
  [v4 parkedCarViewControllerDidSelectShare:self];
}

- (void)parkedCarFooterActionsSectionControllerDidRemoveParkedCar:(id)a3
{
  id v4 = +[MKMapService sharedService];
  LODWORD(v6) = 1;
  [v4 capturePlaceCardUserAction:6033 onTarget:201 eventValue:0 mapItem:0 timestamp:0xFFFFFFFFLL resultIndex:0 targetID:CFAbsoluteTimeGetCurrent() providerID:0 animationID:0 actionURL:0 photoID:0 placeCardType:v6 localizedMapItemCategory:0 availableActions:0 unactionableUIElements:0];

  id v5 = +[ParkedCarManager sharedManager];
  [v5 removeParkedCar];

  uint64_t v7 = [(ParkedCarViewController *)self parkedCarDelegate];
  [v7 parkedCarViewControllerDidRequestDismissal:self];
}

- (void)instrumentDismissAction
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:4 onTarget:201 eventValue:0];
}

- (id)draggableContent
{
  return 0;
}

- (UIView)draggableHeaderView
{
  return 0;
}

- (UIView)viewForHeaderContainmentString
{
  return 0;
}

- (void)updateHeaderTrailingConstant
{
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
}

- (ParkedCarViewControllerDelegate)parkedCarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parkedCarDelegate);

  return (ParkedCarViewControllerDelegate *)WeakRetained;
}

- (void)setParkedCarDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_destroyWeak((id *)&self->_parkedCarDelegate);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_detailsSectionController, 0);
  objc_storeStrong((id *)&self->_headerSectionController, 0);

  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end