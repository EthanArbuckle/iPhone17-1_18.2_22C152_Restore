@interface PrintController
- (BOOL)_isInBackground;
- (BOOL)_searchResults:(id)a3 areFarAwayFromView:(id)a4;
- (BOOL)isPrinting;
- (MKMapView)mapView;
- (PrintController)initWithMapView:(id)a3 delegate:(id)a4;
- (PrintControllerDelegate)delegate;
- (UIView)presentationView;
- (id)_printControllerForRoute:(id)a3 searchString:(id)a4;
- (id)_printControllerForSearchString:(id)a3 searchResults:(id)a4 title:(id)a5 subTitle:(id)a6;
- (id)_printInfoForSearchString:(id)a3 route:(id)a4 title:(id)a5;
- (id)_rendererForRoute:(id)a3;
- (id)_rendererForSearchResults:(id)a3 title:(id)a4 subTitle:(id)a5;
- (id)mapRegion:(id)a3 insetLat:(double)a4 insetLng:(double)a5;
- (void)_endBackgroundTask;
- (void)_print:(id)a3;
- (void)orientationDidChange;
- (void)orientationWillChange;
- (void)print;
- (void)printInteractionControllerDidFinishJob:(id)a3;
- (void)printInteractionControllerDidPresentPrinterOptions:(id)a3;
- (void)printInteractionControllerWillStartJob:(id)a3;
- (void)printRoute:(id)a3 searchString:(id)a4;
- (void)printSearchString:(id)a3 searchResults:(id)a4 title:(id)a5 subTitle:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setMapView:(id)a3;
- (void)setPresentationView:(id)a3;
@end

@implementation PrintController

- (PrintController)initWithMapView:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PrintController;
  v9 = [(PrintController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapView, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (BOOL)isPrinting
{
  return self->_printTaskBackgroundIdentifier != UIBackgroundTaskInvalid;
}

- (BOOL)_isInBackground
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 applicationState];

  if (v3 != (id)1) {
    return v3 == (id)2;
  }
  v5 = +[UIApplication sharedApplication];
  unsigned __int8 v6 = [v5 isSuspendedUnderLock];

  return v6;
}

- (void)_endBackgroundTask
{
  if ([(PrintController *)self isPrinting])
  {
    if ([(PrintController *)self _isInBackground])
    {
      id v3 = [UIApp delegate];
      [v3 sendDidEnterBackgroundNotification];
    }
    v4 = +[UIApplication sharedApplication];
    [v4 endBackgroundTask:self->_printTaskBackgroundIdentifier];

    self->_printTaskBackgroundIdentifier = UIBackgroundTaskInvalid;
  }
}

- (id)_printControllerForRoute:(id)a3 searchString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIPrintInteractionController sharedPrintController];
  v9 = [(PrintController *)self _printInfoForSearchString:v6 route:v7 title:0];

  [v8 setPrintInfo:v9];
  v10 = [(PrintController *)self _rendererForRoute:v7];

  [v8 setPrintPageRenderer:v10];

  return v8;
}

- (id)_printControllerForSearchString:(id)a3 searchResults:(id)a4 title:(id)a5 subTitle:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[UIPrintInteractionController sharedPrintController];
  v15 = [(PrintController *)self _printInfoForSearchString:v13 route:0 title:v11];

  [v14 setPrintInfo:v15];
  v16 = [(PrintController *)self _rendererForSearchResults:v12 title:v11 subTitle:v10];

  [v14 setPrintPageRenderer:v16];

  return v14;
}

- (void)printRoute:(id)a3 searchString:(id)a4
{
  v5 = [(PrintController *)self _printControllerForRoute:a3 searchString:a4];
  pic = self->_pic;
  self->_pic = v5;

  id v7 = self->_pic;

  [(PrintController *)self _print:v7];
}

- (void)_print:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10050C024;
  v17[3] = &unk_1012ED870;
  v17[4] = self;
  v5 = objc_retainBlock(v17);
  id v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained popoverPresentationRectForPrintController:self];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    [v4 presentFromRect:self->_presentationView inView:1 v5:v10 v12:v14 v16:v16];
    self->_isShowingPopover = 1;
  }
  else
  {
    [v4 presentAnimated:1 completionHandler:v5];
  }
}

- (void)printSearchString:(id)a3 searchResults:(id)a4 title:(id)a5 subTitle:(id)a6
{
  id v7 = [(PrintController *)self _printControllerForSearchString:a3 searchResults:a4 title:a5 subTitle:a6];
  pic = self->_pic;
  self->_pic = v7;

  double v9 = self->_pic;

  [(PrintController *)self _print:v9];
}

- (void)print
{
}

- (void)orientationWillChange
{
  id v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1)
  {
  }
  else
  {
    id v4 = +[UIDevice currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    if (v5 != (id)5) {
      return;
    }
  }
  BOOL isShowingPopover = self->_isShowingPopover;
  self->_shouldShowPopoverAfterOrientationChange = isShowingPopover;
  if (isShowingPopover)
  {
    id v8 = [(UIPrintInteractionController *)self->_pic printPageRenderer];
    id v7 = +[UIPrintInteractionController sharedPrintController];
    [v7 dismissAnimated:0];

    [(UIPrintInteractionController *)self->_pic setPrintPageRenderer:v8];
  }
}

- (void)orientationDidChange
{
  id v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1)
  {
  }
  else
  {
    id v4 = +[UIDevice currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    if (v5 != (id)5) {
      return;
    }
  }
  if (self->_shouldShowPopoverAfterOrientationChange)
  {
    [(PrintController *)self print];
  }
}

- (id)mapRegion:(id)a3 insetLat:(double)a4 insetLng:(double)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)GEOMapRegion);
  [v7 southLat];
  double v9 = a4 * 0.5;
  double v11 = v9 + v10;
  double v12 = -90.0;
  if (v11 > -90.0)
  {
    [v7 southLat];
    double v12 = v9 + v13;
  }
  [v8 setSouthLat:v12];
  [v7 northLat];
  double v15 = v14 - v9;
  double v16 = 90.0;
  if (v15 < 90.0)
  {
    [v7 northLat];
    double v16 = v17 - v9;
  }
  [v8 setNorthLat:v16];
  [v7 westLng];
  double v18 = a5 * 0.5;
  double v20 = v18 + v19;
  double v21 = -180.0;
  if (v20 > -180.0)
  {
    [v7 westLng];
    double v21 = v18 + v22;
  }
  [v8 setWestLng:v21];
  [v7 eastLng];
  double v24 = v23 - v18;
  double v25 = 180.0;
  if (v24 < 180.0)
  {
    [v7 eastLng];
    double v25 = v26 - v18;
  }
  [v8 setEastLng:v25];

  return v8;
}

- (BOOL)_searchResults:(id)a3 areFarAwayFromView:(id)a4
{
  id v5 = a3;
  [a4 visibleMapRect];
  MKMapRect v25 = MKMapRectInset(v24, -v24.size.width, -v24.size.height);
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) coordinate:v17];
        MKMapPoint v23 = MKMapPointForCoordinate(v22);
        v26.origin.double x = x;
        v26.origin.double y = y;
        v26.size.double width = width;
        v26.size.double height = height;
        if (MKMapRectContainsPoint(v26, v23))
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (id)_rendererForRoute:(id)a3
{
  id v4 = a3;
  id v5 = [[MapRoutePageRenderer alloc] initWithRoute:v4 mapView:self->_mapView];

  return v5;
}

- (id)_rendererForSearchResults:(id)a3 title:(id)a4 subTitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count]
    && ![(PrintController *)self _searchResults:v8 areFarAwayFromView:self->_mapView])
  {
    id v11 = [[SearchResultsPageRenderer alloc] initWithSearchResults:v8 title:v9 subTitle:v10 mapView:self->_mapView];
  }
  else
  {
    id v11 = [[SimpleMapPageRenderer alloc] initWithMapView:self->_mapView];
  }
  id v12 = v11;

  return v12;
}

- (id)_printInfoForSearchString:(id)a3 route:(id)a4 title:(id)a5
{
  id v6 = a3;
  id v7 = +[UIPrintInfo printInfo];
  [v7 setOutputType:0];
  [v7 setOrientation:1];
  if (v6)
  {
    id v8 = +[NSBundle mainBundle];
    id v9 = v8;
    if (a4) {
      CFStringRef v10 = @"Directions Title [Printing]";
    }
    else {
      CFStringRef v10 = @"Search Result Title [Printing]";
    }
    uint64_t v13 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
    double v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v6);
    [v7 setJobName:v14];
  }
  else
  {
    id v11 = +[NSBundle mainBundle];
    id v9 = v11;
    if (a4) {
      CFStringRef v12 = @"PrintController_Directions";
    }
    else {
      CFStringRef v12 = @"PrintController_Untitled";
    }
    uint64_t v13 = [v11 localizedStringForKey:v12 value:@"localized string not found" table:0];
    [v7 setJobName:v13];
  }

  return v7;
}

- (void)printInteractionControllerDidPresentPrinterOptions:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained printControllerDidPresentPrinterOptions:self];
}

- (void)printInteractionControllerWillStartJob:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10050C894;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  self->_printTaskBackgroundIdentifier = (unint64_t)[v4 beginBackgroundTaskWithExpirationHandler:v5];
}

- (void)printInteractionControllerDidFinishJob:(id)a3
{
}

- (PrintControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PrintControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pic, 0);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end