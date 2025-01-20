@interface ParkedCarLocationRefinementViewController
- (ParkedCarLocationRefinementViewController)initWithCamera:(id)a3 crosshairType:(unint64_t)a4;
- (ParkedCarLocationRefinementViewController)initWithCamera:(id)a3 parkedCar:(id)a4;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ParkedCarLocationRefinementViewController

- (ParkedCarLocationRefinementViewController)initWithCamera:(id)a3 parkedCar:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ParkedCarLocationRefinementViewController;
  v8 = [(LocationRefinementViewController *)&v12 initWithCamera:a3 crosshairType:4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parkedCar, a4);
    v10 = v9;
  }

  return v9;
}

- (ParkedCarLocationRefinementViewController)initWithCamera:(id)a3 crosshairType:(unint64_t)a4
{
  return [(ParkedCarLocationRefinementViewController *)self initWithCamera:a3 parkedCar:0];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)ParkedCarLocationRefinementViewController;
  [(LocationRefinementViewController *)&v20 viewDidLoad];
  v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];

  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = [(LocationRefinementViewController *)self mapView];
  [v6 setMapType:v5];

  id v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Parked Car [Location Refinement]" value:@"localized string not found" table:0];
  [(ParkedCarLocationRefinementViewController *)self setTitle:v8];

  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancel:"];
  v10 = [(ParkedCarLocationRefinementViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v9];

  id v11 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_done:"];
  objc_super v12 = [(ParkedCarLocationRefinementViewController *)self navigationItem];
  [v12 setRightBarButtonItem:v11];

  id v13 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v13 configureWithDefaultBackground];
  v14 = [(ParkedCarLocationRefinementViewController *)self navigationItem];
  [v14 setScrollEdgeAppearance:v13];

  v15 = (MKMarkerAnnotationView *)[objc_alloc((Class)MKMarkerAnnotationView) initWithAnnotation:0 reuseIdentifier:0];
  annotationView = self->_annotationView;
  self->_annotationView = v15;

  [(MKMarkerAnnotationView *)self->_annotationView setHidden:1];
  [(MKMarkerAnnotationView *)self->_annotationView setSelected:1];
  v17 = [(ParkedCarLocationRefinementViewController *)self view];
  [v17 addSubview:self->_annotationView];

  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"ParkedCar_LocationRefinement_Instructions" value:@"localized string not found" table:0];
  [(LocationRefinementViewController *)self setInstructionsText:v19];
}

- (void)viewWillAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)ParkedCarLocationRefinementViewController;
  [(LocationRefinementViewController *)&v20 viewWillAppear:a3];
  unsigned int v4 = [(ParkedCarLocationRefinementViewController *)self presentingViewController];
  uint64_t v5 = [v4 view];
  v6 = [v5 window];
  id v7 = [v6 screen];
  [v7 scale];
  double v9 = v8;

  v10 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
  id v11 = +[GEOFeatureStyleAttributes styleAttributesForCalloutWithAttributes:v10];

  objc_super v12 = [(LocationRefinementViewController *)self mapView];
  id v13 = [v12 _mapLayer];
  v14 = [v13 iconForStyleAttributes:v11 contentScale:8 size:1 transparent:v9];

  if (v14)
  {
    v15 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v14 fillColor]);
    [(MKMarkerAnnotationView *)self->_annotationView setMarkerTintColor:v15];

    v16 = CGImageRetain((CGImageRef)[v14 image]);
    CGFloat v17 = ((double)CGImageGetWidth(v16) + v9 * -40.0) * 0.5;
    v21.origin.y = ((double)CGImageGetHeight(v16) + v9 * -40.0) * 0.5;
    v21.size.width = v9 * 40.0;
    v21.origin.x = v17;
    v21.size.height = v9 * 40.0;
    v18 = CGImageCreateWithImageInRect(v16, v21);
    CGImageRelease(v16);
    v19 = +[UIImage imageWithCGImage:v18 scale:0 orientation:v9];
    [(MKMarkerAnnotationView *)self->_annotationView setGlyphImage:v19];

    CGImageRelease(v18);
    [(MKMarkerAnnotationView *)self->_annotationView prepareForDisplay];
  }
}

- (void)viewDidLayoutSubviews
{
  if ([(LocationRefinementViewController *)self needsInitialCameraPosition])
  {
    v3 = [(LocationRefinementViewController *)self instructionsContainer];
    [v3 frame];
    double MaxY = CGRectGetMaxY(v28);
    uint64_t v5 = [(LocationRefinementViewController *)self mapView];
    [v5 frame];
    double v6 = MaxY - CGRectGetMinY(v29);
    id v7 = [(LocationRefinementViewController *)self mapView];
    [v7 _setEdgeInsets:v6, 0.0, 0.0, 0.0];

    double v8 = [(LocationRefinementViewController *)self mapView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGFloat v17 = [(LocationRefinementViewController *)self mapView];
    [v17 _edgeInsets];
    CGFloat v19 = v10 + v18;
    CGFloat v21 = v12 + v20;
    CGFloat v23 = v14 - (v18 + v22);
    CGFloat v25 = v16 - (v20 + v24);

    v30.origin.x = v19;
    v30.origin.y = v21;
    v30.size.width = v23;
    v30.size.height = v25;
    double MidX = CGRectGetMidX(v30);
    v31.origin.x = v19;
    v31.origin.y = v21;
    v31.size.width = v23;
    v31.size.height = v25;
    -[MKMarkerAnnotationView setCenter:](self->_annotationView, "setCenter:", MidX, CGRectGetMidY(v31));
    [(MKMarkerAnnotationView *)self->_annotationView setHidden:0];
  }
  v27.receiver = self;
  v27.super_class = (Class)ParkedCarLocationRefinementViewController;
  [(LocationRefinementViewController *)&v27 viewDidLayoutSubviews];
}

- (void)_done:(id)a3
{
  unsigned int v4 = +[MKMapService sharedService];
  [v4 captureUserAction:17 onTarget:623 eventValue:0];

  uint64_t v5 = [(LocationRefinementViewController *)self mapView];
  [(MKMarkerAnnotationView *)self->_annotationView center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(ParkedCarLocationRefinementViewController *)self view];
  [v5 convertPoint:v10 toCoordinateFromView:v7];
  double v12 = v11;
  double v14 = v13;

  double v15 = [(LocationRefinementViewController *)self delegate];
  [v15 locationRefinementViewController:self didSelectCoordinate:v12 v14];

  id v16 = [(ParkedCarLocationRefinementViewController *)self presentingViewController];
  [v16 dismissViewControllerAnimated:1 completion:0];
}

- (void)_cancel:(id)a3
{
  unsigned int v4 = +[MKMapService sharedService];
  [v4 captureUserAction:18 onTarget:623 eventValue:0];

  id v5 = [(ParkedCarLocationRefinementViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_annotationView, 0);

  objc_storeStrong((id *)&self->_parkedCar, 0);
}

@end