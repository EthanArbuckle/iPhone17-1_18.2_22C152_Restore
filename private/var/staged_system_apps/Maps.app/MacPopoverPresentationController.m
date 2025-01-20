@interface MacPopoverPresentationController
- (BOOL)_isCoordinateVisibleInContainerViewController:(id)a3;
- (BOOL)isDismissing;
- (BOOL)isPresented;
- (CGRect)anchorRect;
- (CGSize)preferredContentSize;
- (CLLocationCoordinate2D)coordinate;
- (ContaineeViewController)containeeViewController;
- (ContainerViewController)containerViewController;
- (MacPopoverPresentationController)initWithContaineeViewController:(id)a3;
- (MacPopoverPresentationControllerDelegate)delegate;
- (NSArray)passthroughViews;
- (void)_didDismiss;
- (void)_willDismiss;
- (void)configurePopoverPosition;
- (void)configurePopoverSize;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAnchorRect:(CGRect)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDelegate:(id)a3;
- (void)setPassthroughViews:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation MacPopoverPresentationController

- (MacPopoverPresentationController)initWithContaineeViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MacPopoverPresentationController;
  v5 = [(MacPopoverPresentationController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_containeeViewController, v4);
    [v4 setModalPresentationStyle:7];

    v6->_coordinate = kCLLocationCoordinate2DInvalid;
    CGSize size = CGRectZero.size;
    v6->_anchorRect.origin = CGRectZero.origin;
    v6->_anchorRect.CGSize size = size;
  }

  return v6;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->_preferredContentSize.width || a3.height != self->_preferredContentSize.height)
  {
    self->_preferredContentSize = a3;
    p_containeeViewController = &self->_containeeViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    [WeakRetained setPreferredContentSize:width, height];

    id v10 = objc_loadWeakRetained((id *)p_containeeViewController);
    v8 = [v10 popoverPresentationController];
    v9 = [v8 presentedViewController];
    [v9 setPreferredContentSize:CGSizeMake(width, height)];
  }
}

- (NSArray)passthroughViews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
  v3 = [WeakRetained popoverPresentationController];
  id v4 = [v3 passthroughViews];

  return (NSArray *)v4;
}

- (void)setPassthroughViews:(id)a3
{
  p_containeeViewController = &self->_containeeViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containeeViewController);
  v5 = [WeakRetained popoverPresentationController];
  [v5 setPassthroughViews:v4];
}

- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id obj = a3;
  id v8 = a5;
  if (!*(_WORD *)&self->_isPresented)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    id v10 = [WeakRetained presentingViewController];

    if (!v10
      && CLLocationCoordinate2DIsValid(self->_coordinate)
      && [(MacPopoverPresentationController *)self _isCoordinateVisibleInContainerViewController:obj])
    {
      self->_isPresented = 1;
      objc_storeWeak((id *)&self->_containerViewController, obj);
      id v11 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      v12 = [v11 popoverPresentationController];
      [v12 setDelegate:self];

      [(MacPopoverPresentationController *)self configurePopoverPosition];
      [(MacPopoverPresentationController *)self configurePopoverSize];
      id v13 = objc_loadWeakRetained((id *)&self->_containerViewController);
      id v14 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      [v13 _maps_topMostPresentViewController:v14 animated:v6 completion:v8];

      v15 = +[NSNotificationCenter defaultCenter];
      [v15 postNotificationName:@"MacPopoverPresentationControllerDidPresentPopover" object:self];
    }
  }
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_isPresented)
  {
    objc_initWeak(&location, self);
    [(MacPopoverPresentationController *)self _willDismiss];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100671A74;
    v10[3] = &unk_1012E9950;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    id v7 = objc_retainBlock(v10);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v9 = [WeakRetained presentingViewController];

    if (v9) {
      [v9 dismissViewControllerAnimated:v4 completion:v7];
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_willDismiss
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 macPopoverPresentationControllerWillDismiss:self];
  }
  *(_WORD *)&self->_isPresented = 256;
}

- (void)_didDismiss
{
  self->_isDismissing = 0;
  objc_storeWeak((id *)&self->_containerViewController, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 macPopoverPresentationControllerDidDismiss:self];
  }
}

- (BOOL)_isCoordinateVisibleInContainerViewController:(id)a3
{
  char v4 = [a3 chromeViewController];
  id v5 = [v4 mapView];
  [v5 visibleMapRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  MKMapPoint v15 = MKMapPointForCoordinate(self->_coordinate);
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.double width = v11;
  v16.size.double height = v13;
  LOBYTE(self) = MKMapRectContainsPoint(v16, v15);

  return (char)self;
}

- (void)configurePopoverPosition
{
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  v75.origin.double x = CGRectZero.origin.x;
  v75.origin.CGFloat y = y;
  v75.size.CGFloat width = width;
  v75.size.CGFloat height = height;
  BOOL v6 = CGRectEqualToRect(self->_anchorRect, v75);
  BOOL v7 = CLLocationCoordinate2DIsValid(self->_coordinate);
  if (!v6 || v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v63 = [WeakRetained chromeViewController];

    double v10 = [v63 view];
    double v11 = [v63 mapView];
    double v12 = v11;
    CGFloat v56 = width;
    CGFloat v57 = y;
    if (v6)
    {
      [v11 convertCoordinate:self->_coordinate.latitude toPointToView:self->_coordinate.longitude];
      double x = v13 + -30.0;
      double v16 = v15 + -60.0 + -6.0 + -6.0 + -2.0;
      double v17 = 60.0;
      double v18 = 60.0;
    }
    else
    {
      double x = self->_anchorRect.origin.x;
      double v16 = self->_anchorRect.origin.y;
      double v18 = self->_anchorRect.size.width;
      double v17 = self->_anchorRect.size.height;
    }
    id v19 = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v20 = [v19 popoverPresentationController];

    [v20 setSourceView:v10];
    double v60 = v16;
    double v58 = v18;
    double v59 = v17;
    [v20 setSourceRect:x, v16, v18, v17];
    v21 = [v63 viewportLayoutGuide];
    [v21 layoutFrame];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    v30 = [v21 owningView];
    [v30 bounds];
    CGFloat v50 = v32;
    CGFloat v51 = v31;
    CGFloat v54 = v34;
    CGFloat v55 = v33;
    CGFloat left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
    v65.origin.double x = v23;
    v65.origin.CGFloat y = v25;
    v65.size.CGFloat width = v27;
    v65.size.CGFloat height = v29;
    v76.origin.double x = CGRectZero.origin.x;
    v76.origin.CGFloat y = v57;
    v76.size.CGFloat width = v56;
    v76.size.CGFloat height = height;
    if (CGRectEqualToRect(v65, v76))
    {
      double MinX = left;
      double top = UIEdgeInsetsZero.top;
      double v37 = right;
    }
    else
    {
      CGFloat v49 = v29;
      CGFloat v38 = v23;
      v66.origin.CGFloat y = v50;
      v66.origin.double x = v51;
      v66.size.CGFloat height = v54;
      v66.size.CGFloat width = v55;
      v77.origin.double x = CGRectZero.origin.x;
      v77.origin.CGFloat y = v57;
      v77.size.CGFloat width = v56;
      v77.size.CGFloat height = height;
      double MinX = left;
      double top = UIEdgeInsetsZero.top;
      double v37 = right;
      if (!CGRectEqualToRect(v66, v77))
      {
        CGFloat v39 = v38;
        v67.origin.double x = v38;
        v67.origin.CGFloat y = v25;
        v67.size.CGFloat width = v27;
        v67.size.CGFloat height = v49;
        double top = CGRectGetMinY(v67);
        v68.origin.double x = v38;
        v68.origin.CGFloat y = v25;
        v68.size.CGFloat width = v27;
        v68.size.CGFloat height = v49;
        double MinX = CGRectGetMinX(v68);
        v69.origin.double x = v51;
        v69.origin.CGFloat y = v50;
        v69.size.CGFloat height = v54;
        v69.size.CGFloat width = v55;
        double v62 = CGRectGetHeight(v69);
        v70.origin.double x = v38;
        v70.origin.CGFloat y = v25;
        v70.size.CGFloat width = v27;
        v70.size.CGFloat height = v49;
        double bottom = v62 - CGRectGetMaxY(v70);
        v71.origin.double x = v51;
        v71.origin.CGFloat y = v50;
        v71.size.CGFloat height = v54;
        v71.size.CGFloat width = v55;
        double v40 = CGRectGetWidth(v71);
        v72.origin.double x = v39;
        v72.origin.CGFloat y = v25;
        v72.size.CGFloat width = v27;
        v72.size.CGFloat height = v49;
        double v37 = v40 - CGRectGetMaxX(v72);
      }
    }

    [v10 convertRect:v12 toView:x v60 v58 v59];
    CGRectGetMidX(v73);
    [v12 bounds];
    v74.origin.double x = MinX + v41;
    v74.origin.CGFloat y = top + v42;
    v74.size.CGFloat width = v43 - (v37 + MinX);
    v74.size.CGFloat height = v44 - (bottom + top);
    CGRectGetMidX(v74);
    UIFloorToViewScale();
    double v46 = v45;
    UIFloorToViewScale();
    if (v46 > v47) {
      uint64_t v48 = 8;
    }
    else {
      uint64_t v48 = 4;
    }
    [v20 setPermittedArrowDirections:v48, *(void *)&v49];
  }
}

- (void)configurePopoverSize
{
  p_containeeViewController = &self->_containeeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
  [WeakRetained macContaineeWidth];
  double v6 = v5;
  id v7 = objc_loadWeakRetained((id *)p_containeeViewController);
  [v7 heightForLayout:2];
  double v9 = v8;

  id v10 = objc_loadWeakRetained((id *)p_containeeViewController);
  [v10 preferredContentSize];
  if (v12 == CGSizeZero.width && v11 == CGSizeZero.height)
  {
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v14 preferredContentSize];
    double v16 = v15;
    double v18 = v17;

    if (v16 == v6 && v18 == v9) {
      return;
    }
  }

  -[MacPopoverPresentationController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v9);
}

- (ContaineeViewController)containeeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);

  return (ContaineeViewController *)WeakRetained;
}

- (ContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ContainerViewController *)WeakRetained;
}

- (MacPopoverPresentationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MacPopoverPresentationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (CGRect)anchorRect
{
  double x = self->_anchorRect.origin.x;
  double y = self->_anchorRect.origin.y;
  double width = self->_anchorRect.size.width;
  double height = self->_anchorRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_containerViewController);

  objc_destroyWeak((id *)&self->_containeeViewController);
}

@end