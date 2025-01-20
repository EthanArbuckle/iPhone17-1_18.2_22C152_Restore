@interface RAPFixedProblemViewController
- (GEORPProblemStatusResponse)problemStatusResponse;
- (MKMapView)mapView;
- (RAPFixedProblemViewController)init;
- (id)labelMarkerOnMapViewWithText:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setAnnotationsWithDetails:(id)a3;
- (void)_setHeaderText:(id)a3 footerText:(id)a4;
- (void)_updateMapViewIfLoaded;
- (void)_updateTextFieldIfLoaded;
- (void)addRouteOverlayOnView:(id)a3;
- (void)dealloc;
- (void)handleDone:(id)a3;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMapView:(id)a3;
- (void)setProblemStatusResponse:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RAPFixedProblemViewController

- (RAPFixedProblemViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)RAPFixedProblemViewController;
  result = [(RAPFixedProblemViewController *)&v4 init];
  if (result)
  {
    MKMapSize size = MKMapRectNull.size;
    result->_mapRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapRectNull.origin;
    result->_mapRect.MKMapSize size = ($D4775485B13497D55C4F339E01923D43)size;
  }
  return result;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  [(UITextView *)self->_textView removeObserver:self forKeyPath:@"contentSize"];
  v4.receiver = self;
  v4.super_class = (Class)RAPFixedProblemViewController;
  [(RAPFixedProblemViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v83.receiver = self;
  v83.super_class = (Class)RAPFixedProblemViewController;
  [(RAPFixedProblemViewController *)&v83 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"Reported Issue" value:@"localized string not found" table:0];
  v5 = [(RAPFixedProblemViewController *)self navigationItem];
  [v5 setTitle:v4];

  id v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = [(RAPFixedProblemViewController *)self navigationController];
  id v8 = [v6 initWithBarButtonSystemItem:0 target:v7 action:"handleDone:"];
  v9 = [(RAPFixedProblemViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  v10 = +[UIColor systemBackgroundColor];
  v11 = [(RAPFixedProblemViewController *)self view];
  [v11 setBackgroundColor:v10];

  id v12 = objc_alloc((Class)UIView);
  v13 = [(RAPFixedProblemViewController *)self view];
  [v13 bounds];
  id v14 = [v12 initWithFrame:];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = +[UIColor labelColor];
  [v14 setBackgroundColor:v15];

  v16 = [(RAPFixedProblemViewController *)self view];
  [v16 addSubview:v14];

  v17 = (UITextView *)objc_alloc_init((Class)UITextView);
  textView = self->_textView;
  self->_textView = v17;

  [(UITextView *)self->_textView setAlwaysBounceVertical:1];
  [(UITextView *)self->_textView setEditable:0];
  v19 = +[UIColor labelColor];
  [(UITextView *)self->_textView setTextColor:v19];

  v20 = +[UIColor secondarySystemBackgroundColor];
  [(UITextView *)self->_textView setBackgroundColor:v20];

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_textView addObserver:self forKeyPath:@"contentSize" options:1 context:0];
  [v14 addSubview:self->_textView];
  v21 = [(GEORPProblemStatusResponse *)self->_problemStatusResponse problemStatus];
  v22 = [v21 objectAtIndexedSubscript:0];

  v76 = v22;
  v23 = [v22 details];
  LODWORD(v22) = [v23 displayStyle];

  if (v22 == 5)
  {
    v24 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v25 = +[UIImage imageNamed:@"RAPRouteFixed"];
    [(MKMapView *)v24 setImage:v25];
  }
  else
  {
    v26 = [objc_alloc((Class)MKMapView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    mapView = self->_mapView;
    self->_mapView = v26;

    [(MKMapView *)self->_mapView setCompassEnabled:0];
    [(MKMapView *)self->_mapView setDelegate:self];
    [(MKMapView *)self->_mapView setShowsAttribution:0];
    [(MKMapView *)self->_mapView setBackdropViewQualityChangingDisabled:1];
    v24 = self->_mapView;
  }
  [(MKMapView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKMapView *)v24 setUserInteractionEnabled:0];
  [v14 addSubview:v24];
  uint64_t v28 = _NSDictionaryOfVariableBindings(@"viewToShow, _textView, borderView", v24, self->_textView, v14, 0);
  v29 = _NSDictionaryOfVariableBindings(@"spacing, borderSpacing, actionButtonHeight, textViewMinimumHeight", &off_1013AA318, &off_1013AA330, &off_1013AA348, &off_1013AA360, 0);
  v30 = self->_textView;
  v75 = v24;
  v86[0] = v24;
  v86[1] = v30;
  v31 = +[NSArray arrayWithObjects:v86 count:2];
  id v71 = [v31 mutableCopy];

  v74 = (void *)v28;
  v73 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(borderSpacing)-[viewToShow]-0-[_textView(>=textViewMinimumHeight)]-(borderSpacing)-|", 0, v29, v28);
  v32 = +[NSMutableArray array];
  v33 = +[NSMutableArray array];
  v68 = [v14 topAnchor];
  v70 = [(RAPFixedProblemViewController *)self view];
  v69 = [v70 safeAreaLayoutGuide];
  v67 = [v69 topAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:5.0];
  v85[0] = v66;
  v63 = [v14 bottomAnchor];
  v65 = [(RAPFixedProblemViewController *)self view];
  v64 = [v65 safeAreaLayoutGuide];
  v62 = [v64 bottomAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:-5.0];
  v85[1] = v61;
  v58 = [v14 leadingAnchor];
  v60 = [(RAPFixedProblemViewController *)self view];
  v59 = [v60 safeAreaLayoutGuide];
  v57 = [v59 leadingAnchor];
  [&off_1013AA318 floatValue];
  v35 = [v58 constraintEqualToAnchor:v57 constant:v34];
  v85[2] = v35;
  v77 = v14;
  v36 = [v14 trailingAnchor];
  v78 = self;
  v37 = [(RAPFixedProblemViewController *)self view];
  v38 = [v37 safeAreaLayoutGuide];
  v39 = [v38 trailingAnchor];
  [&off_1013AA318 floatValue];
  v41 = [v36 constraintEqualToAnchor:v39 constant:(float)-v40];
  v85[3] = v41;
  v42 = +[NSArray arrayWithObjects:v85 count:4];
  v72 = v33;
  [v33 addObjectsFromArray:v42];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v43 = v71;
  id v44 = [v43 countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v80;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(void *)v80 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = _NSDictionaryOfVariableBindings(@"view", *(id *)(*((void *)&v79 + 1) + 8 * i), 0);
        v49 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(borderSpacing)-[view]-(borderSpacing)-|", 0, v29, v48);
        [v32 addObjectsFromArray:v49];
      }
      id v45 = [v43 countByEnumeratingWithState:&v79 objects:v84 count:16];
    }
    while (v45);
  }

  [v32 addObjectsFromArray:v73];
  uint64_t v50 = +[NSLayoutConstraint constraintWithItem:v75 attribute:8 relatedBy:0 toItem:v75 attribute:7 multiplier:1.0 constant:0.0];
  mapHeightConstraint = v78->_mapHeightConstraint;
  v78->_mapHeightConstraint = (NSLayoutConstraint *)v50;

  LODWORD(v52) = 1144750080;
  [(NSLayoutConstraint *)v78->_mapHeightConstraint setPriority:v52];
  [v32 addObject:v78->_mapHeightConstraint];
  +[NSLayoutConstraint activateConstraints:v32];
  +[NSLayoutConstraint activateConstraints:v72];
  v53 = [(RAPFixedProblemViewController *)v78 view];
  [v53 setNeedsUpdateConstraints];

  [(RAPFixedProblemViewController *)v78 _updateMapViewIfLoaded];
  [(RAPFixedProblemViewController *)v78 _updateTextFieldIfLoaded];
  v54 = [v76 details];
  unsigned int v55 = [v54 displayStyle];

  if (v55 == 5) {
    [(RAPFixedProblemViewController *)v78 addRouteOverlayOnView:v75];
  }
  v56 = +[NSNotificationCenter defaultCenter];
  [v56 addObserver:v78 selector:"_contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)addRouteOverlayOnView:(id)a3
{
  id v38 = a3;
  if ([(GEORPProblemStatusResponse *)self->_problemStatusResponse problemStatusCount])
  {
    objc_super v4 = [(GEORPProblemStatusResponse *)self->_problemStatusResponse problemStatus];
    v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v5 details];

    v7 = +[MKMapService sharedService];
    id v8 = [v7 mapItemsForPlacesInDetails:v6];

    if ((unint64_t)[v8 count] >= 2)
    {
      v9 = [v8 firstObject];
      v10 = (UILabel *)objc_alloc_init((Class)UILabel);
      startLabel = self->_startLabel;
      self->_startLabel = v10;

      id v12 = +[UIFont systemFontOfSize:17.0];
      [(UILabel *)self->_startLabel setFont:v12];

      [(UILabel *)self->_startLabel setNumberOfLines:2];
      [(UILabel *)self->_startLabel setTextAlignment:1];
      v13 = +[UIColor secondaryLabelColor];
      [(UILabel *)self->_startLabel setTextColor:v13];

      [(UILabel *)self->_startLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v37 = v9;
      id v14 = [v9 notificationDisplayName];
      [(UILabel *)self->_startLabel setText:v14];

      v15 = [v8 lastObject];
      v16 = (UILabel *)objc_alloc_init((Class)UILabel);
      destinationLabel = self->_destinationLabel;
      self->_destinationLabel = v16;

      v18 = [(UILabel *)self->_startLabel font];
      [(UILabel *)self->_destinationLabel setFont:v18];

      [(UILabel *)self->_destinationLabel setNumberOfLines:[(UILabel *)self->_startLabel numberOfLines]];
      [(UILabel *)self->_destinationLabel setTextAlignment:[(UILabel *)self->_startLabel textAlignment]];
      v19 = [(UILabel *)self->_startLabel textColor];
      [(UILabel *)self->_destinationLabel setTextColor:v19];

      [(UILabel *)self->_destinationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v20 = [v15 notificationDisplayName];
      [(UILabel *)self->_destinationLabel setText:v20];

      v21 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      transitIconImageView = self->_transitIconImageView;
      self->_transitIconImageView = v21;

      [(UIImageView *)self->_transitIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      v23 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      transitIconBackgroundImageView = self->_transitIconBackgroundImageView;
      self->_transitIconBackgroundImageView = v23;

      [(UIImageView *)self->_transitIconBackgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      if ([v6 directionsType] == 1)
      {
        v25 = +[UIImage imageNamed:@"RAPTransit"];
        CFStringRef v26 = @"RAPTransitBgd";
      }
      else if ([v6 directionsType] == 2)
      {
        v25 = +[UIImage imageNamed:@"RAPWalking"];
        CFStringRef v26 = @"RAPWalkBgd";
      }
      else
      {
        v25 = +[UIImage imageNamed:@"RAPCar"];
        CFStringRef v26 = @"RAPCarBgd";
      }
      [(UIImageView *)self->_transitIconImageView setImage:v25];

      v27 = +[UIImage imageNamed:v26];
      [(UIImageView *)self->_transitIconBackgroundImageView setImage:v27];

      [v38 addSubview:self->_startLabel];
      [v38 addSubview:self->_destinationLabel];
      [v38 addSubview:self->_transitIconBackgroundImageView];
      [v38 addSubview:self->_transitIconImageView];
      uint64_t v28 = _NSDictionaryOfVariableBindings(@"_startLabel, _destinationLabel, _transitIconImageView, _transitIconBackgroundImageView", self->_startLabel, self->_destinationLabel, self->_transitIconImageView, self->_transitIconBackgroundImageView, 0);
      v29 = +[NSMutableArray array];
      v30 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_startLabel]|" options:0 metrics:0 views:v28];
      [v29 addObjectsFromArray:v30];

      v31 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_destinationLabel]|" options:0 metrics:0 views:v28];
      [v29 addObjectsFromArray:v31];

      v32 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=0)-[_startLabel]-(verticalSpacing)-[_transitIconBackgroundImageView]-(verticalSpacing)-[_destinationLabel]-(>=0)-|", 0, &off_1013AEE20, v28);
      [v29 addObjectsFromArray:v32];

      v33 = +[NSLayoutConstraint constraintWithItem:self->_transitIconImageView attribute:9 relatedBy:0 toItem:v38 attribute:9 multiplier:1.0 constant:0.0];
      [v29 addObject:v33];

      float v34 = +[NSLayoutConstraint constraintWithItem:self->_transitIconImageView attribute:10 relatedBy:0 toItem:v38 attribute:10 multiplier:1.0 constant:0.0];
      [v29 addObject:v34];

      v35 = +[NSLayoutConstraint constraintWithItem:self->_transitIconBackgroundImageView attribute:9 relatedBy:0 toItem:v38 attribute:9 multiplier:1.0 constant:0.0];
      [v29 addObject:v35];

      v36 = +[NSLayoutConstraint constraintWithItem:self->_transitIconBackgroundImageView attribute:10 relatedBy:0 toItem:v38 attribute:10 multiplier:1.0 constant:0.0];
      [v29 addObject:v36];

      +[NSLayoutConstraint activateConstraints:v29];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_textView == a4)
  {
    [a4 bounds:a3];
    double v8 = v7;
    [(UITextView *)self->_textView contentSize];
    double v10 = v9;
    [(UITextView *)self->_textView zoomScale];
    double v12 = (v8 - v10 * v11) * 0.5;
    double v13 = v12 + -4.0;
    BOOL v14 = v12 < 4.0;
    double v15 = 0.0;
    textView = self->_textView;
    if (!v14) {
      double v15 = v13;
    }
    -[UITextView setContentInset:](textView, "setContentInset:", v15, 0.0, 0.0, 0.0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RAPFixedProblemViewController;
  -[RAPFixedProblemViewController viewDidAppear:](&v6, "viewDidAppear:");
  annotation = self->_annotation;
  if (annotation) {
    [(MKMapView *)self->_mapView selectAnnotation:annotation animated:v3];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPFixedProblemViewController;
  [(RAPFixedProblemViewController *)&v5 traitCollectionDidChange:a3];
  if ([(RAPFixedProblemViewController *)self isViewLoaded])
  {
    objc_super v4 = [(RAPFixedProblemViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AF364C;
  v4[3] = &unk_1012E81F8;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:0];
}

- (void)setProblemStatusResponse:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_problemStatusResponse, a3);
  objc_super v5 = [v14 problemStatus];
  id v6 = [v5 count];

  if (v6)
  {
    double v7 = [v14 problemStatus];
    double v8 = [v7 objectAtIndexedSubscript:0];

    double v9 = [v8 details];
    double v10 = [v9 localizedTitle];

    double v11 = [v8 details];
    double v12 = [v11 localizedDescription];

    double v13 = [v8 details];
    [(RAPFixedProblemViewController *)self _setAnnotationsWithDetails:v13];

    [(RAPFixedProblemViewController *)self _setHeaderText:v10 footerText:v12];
  }
}

- (void)_setAnnotationsWithDetails:(id)a3
{
  id v4 = a3;
  id v24 = [v4 displayRegion];
  [v24 southLat];
  double v6 = v5;
  [v24 northLat];
  if (v6 == v7)
  {
    [v24 westLng];
    double v9 = v8;
    [v24 eastLng];
    if (v9 == v10)
    {
      [v24 southLat];
      [v24 westLng];
      MKMapRectMakeWithRadialDistance();
      id v15 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v11, v12, v13, v14];

      id v24 = v15;
    }
  }
  v16 = +[MKMapService sharedService];
  v17 = [v16 mapItemsForPlacesInDetails:v4];

  v18 = [v17 firstObject];
  v19 = [[RAPAnnotation alloc] initWithMapItem:v18];
  if (self->_annotation) {
    -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:");
  }
  [(RAPAnnotation *)v19 coordinate];
  if (CLLocationCoordinate2DIsValid(v26)) {
    objc_storeStrong((id *)&self->_annotation, v19);
  }
  GEOMapRectForMapRegion();
  self->_mapRect.origin.x = v20;
  self->_mapRect.origin.y = v21;
  self->_mapRect.size.width = v22;
  self->_mapRect.size.height = v23;
  [(RAPFixedProblemViewController *)self _updateMapViewIfLoaded];
}

- (void)_updateMapViewIfLoaded
{
  if (self->_mapView
    && [(GEORPProblemStatusResponse *)self->_problemStatusResponse problemStatusCount])
  {
    BOOL v3 = [(GEORPProblemStatusResponse *)self->_problemStatusResponse problemStatus];
    id v4 = [v3 objectAtIndexedSubscript:0];

    if (self->_annotation)
    {
      double v5 = [v4 details];
      unsigned int v6 = [v5 displayStyle];

      if (v6 != 4)
      {
        mapView = self->_mapView;
        if (self->_mapRect.size.width == 0.0 || self->_mapRect.size.height == 0.0)
        {
          annotation = self->_annotation;
          double v8 = +[NSArray arrayWithObjects:&annotation count:1];
          [(MKMapView *)mapView showAnnotations:v8 animated:0];
        }
        else
        {
          [(MKMapView *)self->_mapView addAnnotation:self->_annotation];
        }
      }
    }
    double v9 = [v4 details];
    unsigned int v10 = [v9 mapType];

    if (v10 - 2 > 2) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_100F735B0[v10 - 2];
    }
    [(MKMapView *)self->_mapView setMapType:v11];
    p_mapRect = &self->_mapRect;
    BOOL v13 = self->_mapRect.origin.y == MKMapRectNull.origin.y && self->_mapRect.origin.x == MKMapRectNull.origin.x;
    if (!v13 && self->_mapRect.size.width != 0.0 && self->_mapRect.size.height != 0.0)
    {
      double v14 = self->_mapView;
      id v15 = [(RAPFixedProblemViewController *)self view];
      v16 = [v15 safeAreaLayoutGuide];
      [v16 layoutFrame];
      -[MKMapView setVisibleMapRect:edgePadding:animated:](v14, "setVisibleMapRect:edgePadding:animated:", 0, p_mapRect->origin.x, p_mapRect->origin.y, p_mapRect->size.width, p_mapRect->size.height, v17, 0.0, 0.0, 0.0);
    }
  }
}

- (void)_setHeaderText:(id)a3 footerText:(id)a4
{
  id v6 = a4;
  double v7 = (NSString *)[a3 copy];
  headerText = self->_headerText;
  self->_headerText = v7;

  double v9 = (NSString *)[v6 copy];
  footerText = self->_footerText;
  self->_footerText = v9;

  [(RAPFixedProblemViewController *)self _updateTextFieldIfLoaded];
}

- (void)_updateTextFieldIfLoaded
{
  if (self->_textView)
  {
    footerText = self->_footerText;
    id v4 = self->_headerText;
    double v23 = footerText;
    id v25 = objc_alloc_init((Class)NSMutableAttributedString);
    uint64_t v5 = +[UIFont _maps_systemFontWithFixedSize:23.0];
    id v6 = +[NSParagraphStyle defaultParagraphStyle];
    id v7 = [v6 mutableCopy];

    [v7 setAlignment:1];
    v28[0] = NSFontAttributeName;
    v28[1] = NSParagraphStyleAttributeName;
    double v22 = (void *)v5;
    v29[0] = v5;
    v29[1] = v7;
    v28[2] = NSForegroundColorAttributeName;
    double v8 = +[UIColor labelColor];
    v29[2] = v8;
    double v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];

    if (v4)
    {
      id v10 = objc_alloc((Class)NSAttributedString);
      uint64_t v11 = [(NSString *)v4 stringByAppendingString:@"\n"];
      id v12 = [v10 initWithString:v11 attributes:v9];
      [v25 appendAttributedString:v12];
    }
    id v24 = v4;
    BOOL v13 = +[UIFont system15];
    [v13 _mapkit_scaledValueForValue:20.0];
    double v15 = v14;
    v16 = +[NSParagraphStyle defaultParagraphStyle];
    id v17 = [v16 mutableCopy];

    [v17 setAlignment:1];
    [v17 setParagraphSpacingBefore:v15];
    v26[0] = NSFontAttributeName;
    v26[1] = NSParagraphStyleAttributeName;
    v27[0] = v13;
    v27[1] = v17;
    v26[2] = NSForegroundColorAttributeName;
    v18 = +[UIColor secondaryLabelColor];
    v27[2] = v18;
    v19 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

    if (v23)
    {
      id v20 = [objc_alloc((Class)NSAttributedString) initWithString:v23 attributes:v19];
      [v25 appendAttributedString:v20];
    }
    [(UITextView *)self->_textView setAttributedText:v25];

    double v21 = [(UITextView *)self->_textView textContainer];
    [v21 setLineFragmentPadding:v15];
  }
}

- (void)handleDone:(id)a3
{
  id v4 = [(RAPFixedProblemViewController *)self navigationController];
  [v4 handleDone:self];
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AF4084;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)labelMarkerOnMapViewWithText:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  dispatch_time_t v5 = [(MKMapView *)self->_mapView _mapLayer];
  id v6 = [v5 labelMarkers];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 text];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (GEORPProblemStatusResponse)problemStatusResponse
{
  return self->_problemStatusResponse;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_problemStatusResponse, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_transitIconBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_transitIconImageView, 0);
  objc_storeStrong((id *)&self->_destinationLabel, 0);
  objc_storeStrong((id *)&self->_startLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonSeparator, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_storeStrong((id *)&self->_mapHeightConstraint, 0);
}

@end