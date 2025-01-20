@interface MarkedLocationRefinementViewController
- (MarkedLocationRefinementViewController)initWithCamera:(id)a3 crosshairType:(unint64_t)a4;
- (MarkedLocationRefinementViewController)initWithMarkedLocation:(id)a3;
- (SearchResult)originalMarkedLocation;
- (UIViewController)originalPresenterViewController;
- (double)footerHeight;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)_removeMarkedLocation:(id)a3;
- (void)setOriginalPresenterViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation MarkedLocationRefinementViewController

- (MarkedLocationRefinementViewController)initWithCamera:(id)a3 crosshairType:(unint64_t)a4
{
  return 0;
}

- (MarkedLocationRefinementViewController)initWithMarkedLocation:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)MKMapCamera);
  [v5 coordinate];
  [v6 setCenterCoordinate:];
  [v6 setAltitude:941.0];
  v10.receiver = self;
  v10.super_class = (Class)MarkedLocationRefinementViewController;
  v7 = [(LocationRefinementViewController *)&v10 initWithCamera:v6 crosshairType:0];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_originalMarkedLocation, a3);
  }

  return v8;
}

- (void)viewDidLoad
{
  v78.receiver = self;
  v78.super_class = (Class)MarkedLocationRefinementViewController;
  [(LocationRefinementViewController *)&v78 viewDidLoad];
  v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];

  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [(LocationRefinementViewController *)self mapView];
  [v6 setMapType:v5];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Edit Location Instructions [Marked Location]" value:@"localized string not found" table:0];
  [(LocationRefinementViewController *)self setInstructionsText:v8];

  LODWORD(v8) = +[LibraryUIUtilities isMyPlacesEnabled];
  v9 = +[NSBundle mainBundle];
  objc_super v10 = v9;
  if (v8) {
    CFStringRef v11 = @"Move Location [Marked Location][Title]";
  }
  else {
    CFStringRef v11 = @"Move Pin [Dropped Pin][Title]";
  }
  v12 = [v9 localizedStringForKey:v11 value:@"localized string not found" table:0];
  v13 = [(MarkedLocationRefinementViewController *)self navigationItem];
  [v13 setTitle:v12];

  id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_done:"];
  v15 = [(MarkedLocationRefinementViewController *)self navigationItem];
  [v15 setRightBarButtonItem:v14];

  id v16 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancel:"];
  v17 = [(MarkedLocationRefinementViewController *)self navigationItem];
  [v17 setLeftBarButtonItem:v16];

  id v73 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v73 configureWithDefaultBackground];
  v18 = [(MarkedLocationRefinementViewController *)self navigationItem];
  [v18 setScrollEdgeAppearance:v73];

  v19 = [(LocationRefinementViewController *)self userLocationButtonBottomConstraint];
  [v19 setActive:0];

  v77 = +[NSMutableArray array];
  v20 = [(MarkedLocationRefinementViewController *)self view];
  v21 = +[MapsTheme visualEffectViewAllowingBlur:1];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v20 addSubview:v21];
  v22 = [v21 heightAnchor];
  [(MarkedLocationRefinementViewController *)self footerHeight];
  [v22 constraintEqualToConstant:];
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightBarConstraint = self->_heightBarConstraint;
  self->_heightBarConstraint = v23;

  v81[0] = self->_heightBarConstraint;
  v74 = [v21 leadingAnchor];
  v25 = [v20 leadingAnchor];
  v26 = [v74 constraintEqualToAnchor:v25];
  v81[1] = v26;
  v76 = v21;
  v27 = [v21 trailingAnchor];
  v28 = v20;
  v72 = v20;
  v29 = [v20 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  v81[2] = v30;
  v31 = [v21 bottomAnchor];
  v32 = [v28 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v81[3] = v33;
  v34 = +[NSArray arrayWithObjects:v81 count:4];
  [v77 addObjectsFromArray:v34];

  id v35 = objc_alloc_init((Class)MKViewWithHairline);
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v35 setTopHairlineHidden:0];
  [v35 setBottomHairlineHidden:1];
  v36 = +[UIColor _barHairlineShadowColor];
  [v35 setHairlineColor:v36];

  v37 = [(MarkedLocationRefinementViewController *)self view];
  [v37 addSubview:v35];

  v70 = [v76 topAnchor];
  v68 = [v35 topAnchor];
  v66 = [v70 constraintEqualToAnchor:v68];
  v80[0] = v66;
  v65 = [v76 leadingAnchor];
  v38 = [v35 leadingAnchor];
  v39 = [v65 constraintEqualToAnchor:v38];
  v80[1] = v39;
  v40 = [v76 trailingAnchor];
  v75 = v35;
  v41 = [v35 trailingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  v80[2] = v42;
  v43 = [v76 bottomAnchor];
  v44 = [v35 bottomAnchor];
  [v43 constraintEqualToAnchor:v44];
  v45 = self;
  v46 = v67 = self;
  v80[3] = v46;
  v47 = +[NSArray arrayWithObjects:v80 count:4];
  [v77 addObjectsFromArray:v47];

  id v48 = [objc_alloc((Class)UIButton) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v48 _mapkit_addPointerInteraction];
  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v42) = +[LibraryUIUtilities isMyPlacesEnabled];
  v49 = +[NSBundle mainBundle];
  v50 = v49;
  if (v42) {
    CFStringRef v51 = @"Remove Location [Marked Location]";
  }
  else {
    CFStringRef v51 = @"Remove Pin [Dropped Pin]";
  }
  v71 = [v49 localizedStringForKey:v51 value:@"localized string not found" table:0];

  v52 = +[UIColor systemRedColor];
  [v48 setTitleColor:v52 forState:0];

  [v48 setTitle:v71 forState:0];
  [v48 addTarget:v45 action:"_removeMarkedLocation:" forControlEvents:64];
  [v75 addSubview:v48];
  v69 = [v48 heightAnchor];
  v53 = [v69 constraintEqualToConstant:49.0];
  v79[0] = v53;
  v54 = [v76 centerXAnchor];
  v55 = [v48 centerXAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  v79[1] = v56;
  v57 = [v76 topAnchor];
  v58 = [v48 topAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  v79[2] = v59;
  v60 = +[NSArray arrayWithObjects:v79 count:3];
  [v77 addObjectsFromArray:v60];

  v61 = [(LocationRefinementViewController *)v67 snapToUserLocationContainerView];
  v62 = [v61 bottomAnchor];
  v63 = [v76 topAnchor];
  v64 = [v62 constraintEqualToAnchor:v63 constant:-12.0];
  [v77 addObject:v64];

  +[NSLayoutConstraint activateConstraints:v77];
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MarkedLocationRefinementViewController;
  [(MarkedLocationRefinementViewController *)&v3 viewLayoutMarginsDidChange];
  [(MarkedLocationRefinementViewController *)self footerHeight];
  -[NSLayoutConstraint setConstant:](self->_heightBarConstraint, "setConstant:");
}

- (double)footerHeight
{
  v2 = [(MarkedLocationRefinementViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3 + 49.0;

  return v4;
}

- (void)_done:(id)a3
{
  double v4 = [(LocationRefinementViewController *)self delegate];
  [(LocationRefinementViewController *)self selectedCoordinate];
  [v4 locationRefinementViewController:didSelectCoordinate:self];

  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:1030 onTarget:623 eventValue:0];
}

- (void)_cancel:(id)a3
{
  double v4 = [(LocationRefinementViewController *)self delegate];
  [v4 markedLocationRefinementViewControllerDidCancel:self];

  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:18 onTarget:623 eventValue:0];
}

- (void)_removeMarkedLocation:(id)a3
{
  double v4 = [(LocationRefinementViewController *)self delegate];
  [v4 markedLocationRefinementViewControllerSelectedRemoveMarkedLocation:self];

  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:6005 onTarget:623 eventValue:0];
}

- (UIViewController)originalPresenterViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalPresenterViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setOriginalPresenterViewController:(id)a3
{
}

- (SearchResult)originalMarkedLocation
{
  return self->_originalMarkedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMarkedLocation, 0);
  objc_destroyWeak((id *)&self->_originalPresenterViewController);

  objc_storeStrong((id *)&self->_heightBarConstraint, 0);
}

@end