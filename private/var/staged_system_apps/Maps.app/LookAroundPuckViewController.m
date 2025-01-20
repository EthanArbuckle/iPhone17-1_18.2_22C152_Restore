@interface LookAroundPuckViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canEnterLookAroundPIP;
- (BOOL)isDimmed;
- (LookAroundPuckView)puckView;
- (MKHapticEngine)hapticEngine;
- (double)pitch;
- (id)didEnterLookAroundPIP;
- (int64_t)lookAroundAvailability;
- (void)lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidPanLookAroundView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidSynchronizeMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:(id)a3;
- (void)lookAroundPIPDataCoordinatorIsMovingLookAroundView:(id)a3;
- (void)lookAroundPIPDataCoordinatorIsPanningMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorIsRotatingMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorWillEnterLookArounPIP:(id)a3;
- (void)lookAroundPIPDataCoordinatorWillExitLookAroundPIP:(id)a3;
- (void)setCanEnterLookAroundPIP;
- (void)setCanEnterLookAroundPIP:(BOOL)a3;
- (void)setDidEnterLookAroundPIP:(id)a3;
- (void)setHapticEngine:(id)a3;
- (void)setLookAroundAvailability:(int64_t)a3;
- (void)setPitch:(double)a3;
- (void)setPuckView:(id)a3;
- (void)viewDidLoad;
@end

@implementation LookAroundPuckViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)LookAroundPuckViewController;
  [(LookAroundPuckViewController *)&v26 viewDidLoad];
  v3 = [(LookAroundPuckViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  v4 = (MKHapticEngine *)objc_alloc_init((Class)MKHapticEngine);
  hapticEngine = self->_hapticEngine;
  self->_hapticEngine = v4;

  v6 = -[LookAroundPuckView initWithFrame:]([LookAroundPuckView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  puckView = self->_puckView;
  self->_puckView = v6;

  [(LookAroundPuckView *)self->_puckView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(LookAroundPuckView *)self->_puckView setUserInteractionEnabled:0];
  v8 = [(LookAroundPuckViewController *)self view];
  [v8 addSubview:self->_puckView];

  v24 = [(LookAroundPuckView *)self->_puckView bottomAnchor];
  v25 = [(LookAroundPuckViewController *)self view];
  v23 = [v25 bottomAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[0] = v22;
  v20 = [(LookAroundPuckView *)self->_puckView topAnchor];
  v21 = [(LookAroundPuckViewController *)self view];
  v19 = [v21 topAnchor];
  v9 = [v20 constraintEqualToAnchor:v19];
  v27[1] = v9;
  v10 = [(LookAroundPuckView *)self->_puckView leadingAnchor];
  v11 = [(LookAroundPuckViewController *)self view];
  v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v27[2] = v13;
  v14 = [(LookAroundPuckView *)self->_puckView trailingAnchor];
  v15 = [(LookAroundPuckViewController *)self view];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v27[3] = v17;
  v18 = +[NSArray arrayWithObjects:v27 count:4];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (BOOL)isDimmed
{
  return self->_lookAroundAvailability != 2;
}

- (void)setPitch:(double)a3
{
  if (self->_pitch != a3)
  {
    self->_pitch = a3;
    [(LookAroundPuckView *)self->_puckView setPitch:a3 * 0.0174532925];
    puckView = self->_puckView;
    [(LookAroundPuckView *)puckView updateSubviewsIfNeeded];
  }
}

- (void)setCanEnterLookAroundPIP
{
  if (!self->_canEnterLookAroundPIP)
  {
    self->_canEnterLookAroundPIP = 1;
    v3 = [(LookAroundPuckViewController *)self didEnterLookAroundPIP];

    if (v3)
    {
      v4 = [(LookAroundPuckViewController *)self didEnterLookAroundPIP];
      v4[2]();

      [(LookAroundPuckViewController *)self setDidEnterLookAroundPIP:0];
    }
  }
}

- (void)lookAroundPIPDataCoordinatorWillEnterLookArounPIP:(id)a3
{
  v4 = [a3 mapView];
  self->_lookAroundAvailability = (int64_t)[v4 _lookAroundAvailability];

  [(LookAroundPuckView *)self->_puckView setState:1];
  puckView = self->_puckView;

  [(LookAroundPuckView *)puckView updateSubviewsIfNeeded];
}

- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3
{
  id v4 = a3;
  v5 = [v4 mapView];
  self->_lookAroundAvailability = (int64_t)[v5 _lookAroundAvailability];

  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100D39430;
  v12 = &unk_1012E5D58;
  v13 = self;
  id v14 = v4;
  id v6 = v4;
  v7 = objc_retainBlock(&v9);
  v8 = v7;
  if (self->_canEnterLookAroundPIP) {
    ((void (*)(void ***))v7[2])(v7);
  }
  else {
    -[LookAroundPuckViewController setDidEnterLookAroundPIP:](self, "setDidEnterLookAroundPIP:", v7, v9, v10, v11, v12, v13, v14);
  }
}

- (void)lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:(id)a3
{
  id v4 = [a3 mapView];
  self->_lookAroundAvailability = (int64_t)[v4 _lookAroundAvailability];

  [(LookAroundPuckView *)self->_puckView setDimmed:1];
  puckView = self->_puckView;

  [(LookAroundPuckView *)puckView updateSubviewsIfNeededAnimated:1];
}

- (void)lookAroundPIPDataCoordinatorWillExitLookAroundPIP:(id)a3
{
  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", a3, 3.14159265);
  puckView = self->_puckView;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D395F8;
  v5[3] = &unk_1012E7D28;
  v5[4] = self;
  [(LookAroundPuckView *)puckView updateSubviewsIfNeededAnimated:1 completion:v5];
}

- (void)lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_lookAroundAvailability != 2;
  id v9 = v4;
  id v6 = [v4 mapView];
  self->_lookAroundAvailability = (int64_t)[v6 _lookAroundAvailability];

  if (v5 == (self->_lookAroundAvailability == 2) || ([(LookAroundPuckView *)self->_puckView alpha], v7 == 0.0))
  {
    if ([(LookAroundPuckViewController *)self isDimmed]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = [v9 isMapViewInSyncWithLookAroundView] ^ 1;
    }
    [(LookAroundPuckView *)self->_puckView setDimmed:v8];
    [(LookAroundPuckView *)self->_puckView updateSubviewsIfNeededAnimated:1];
  }
}

- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3
{
  id v4 = a3;
  [(MKHapticEngine *)self->_hapticEngine draggedObjectLifted];
  id v10 = v4;
  [v10 lookAroundViewHeading];
  double v6 = v5;
  double v7 = [v10 mapView];

  [v7 presentationYaw];
  double v9 = (v6 - v8) * 0.0174532925;

  [(LookAroundPuckView *)self->_puckView setHeading:v9];
  [(LookAroundPuckView *)self->_puckView setState:3];
  [(LookAroundPuckView *)self->_puckView updateSubviewsIfNeededAnimated:1];
}

- (void)lookAroundPIPDataCoordinatorIsPanningMapView:(id)a3
{
  id v4 = a3;
  [(LookAroundPuckView *)self->_puckView setDimmed:[(LookAroundPuckViewController *)self isDimmed]];
  id v10 = v4;
  [v10 lookAroundViewHeading];
  double v6 = v5;
  double v7 = [v10 mapView];

  [v7 presentationYaw];
  double v9 = (v6 - v8) * 0.0174532925;

  [(LookAroundPuckView *)self->_puckView setHeading:v9];
  [(LookAroundPuckView *)self->_puckView updateSubviewsIfNeededAnimated:1];
}

- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3
{
  id v4 = a3;
  [(MKHapticEngine *)self->_hapticEngine draggedObjectLanded];
  id v10 = v4;
  [v10 lookAroundViewHeading];
  double v6 = v5;
  double v7 = [v10 mapView];

  [v7 presentationYaw];
  double v9 = (v6 - v8) * 0.0174532925;

  [(LookAroundPuckView *)self->_puckView setHeading:v9];
  [(LookAroundPuckView *)self->_puckView setState:2];
  [(LookAroundPuckView *)self->_puckView updateSubviewsIfNeededAnimated:1];
}

- (void)lookAroundPIPDataCoordinatorIsRotatingMapView:(id)a3
{
  id v4 = a3;
  [v4 lookAroundViewHeading];
  double v6 = v5;
  double v7 = [v4 mapView];

  [v7 presentationYaw];
  double v9 = (v6 - v8) * 0.0174532925;

  [(LookAroundPuckView *)self->_puckView setHeading:v9];
  puckView = self->_puckView;

  [(LookAroundPuckView *)puckView updateSubviewsIfNeeded];
}

- (void)lookAroundPIPDataCoordinatorDidPanLookAroundView:(id)a3
{
  id v4 = a3;
  [v4 lookAroundViewHeading];
  double v6 = v5;
  double v7 = [v4 mapView];

  [v7 presentationYaw];
  double v9 = (v6 - v8) * 0.0174532925;

  [(LookAroundPuckView *)self->_puckView setHeading:v9];
  puckView = self->_puckView;

  [(LookAroundPuckView *)puckView updateSubviewsIfNeeded];
}

- (void)lookAroundPIPDataCoordinatorDidSynchronizeMapView:(id)a3
{
  id v12 = a3;
  unsigned int v4 = [v12 isMapViewInSyncWithLookAroundView];
  unsigned int v5 = [v12 isLookAroundDataAvailable];
  if (v4 && v5)
  {
    id v6 = v12;
    [v6 lookAroundViewHeading];
    double v8 = v7;
    double v9 = [v6 mapView];

    [v9 presentationYaw];
    double v11 = (v8 - v10) * 0.0174532925;

    [(LookAroundPuckView *)self->_puckView setHeading:v11];
    [(LookAroundPuckView *)self->_puckView updateSubviewsIfNeededAnimated:1];
  }
}

- (void)lookAroundPIPDataCoordinatorIsMovingLookAroundView:(id)a3
{
  id v4 = a3;
  [v4 lookAroundViewHeading];
  double v6 = v5;
  double v7 = [v4 mapView];

  [v7 presentationYaw];
  double v9 = (v6 - v8) * 0.0174532925;

  [(LookAroundPuckView *)self->_puckView setHeading:v9];
  puckView = self->_puckView;

  [(LookAroundPuckView *)puckView updateSubviewsIfNeeded];
}

- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3
{
  id v12 = a3;
  unsigned int v4 = [v12 isMapViewInSyncWithLookAroundView];
  unsigned int v5 = [v12 isLookAroundDataAvailable];
  [(LookAroundPuckView *)self->_puckView setDimmed:[(LookAroundPuckViewController *)self isDimmed]];
  if (v4 && v5)
  {
    id v6 = v12;
    [v6 lookAroundViewHeading];
    double v8 = v7;
    double v9 = [v6 mapView];

    [v9 presentationYaw];
    double v11 = (v8 - v10) * 0.0174532925;

    [(LookAroundPuckView *)self->_puckView setHeading:v11];
  }
  [(LookAroundPuckView *)self->_puckView updateSubviewsIfNeededAnimated:1];
}

- (double)pitch
{
  return self->_pitch;
}

- (int64_t)lookAroundAvailability
{
  return self->_lookAroundAvailability;
}

- (void)setLookAroundAvailability:(int64_t)a3
{
  self->_lookAroundAvailability = a3;
}

- (LookAroundPuckView)puckView
{
  return self->_puckView;
}

- (void)setPuckView:(id)a3
{
}

- (MKHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
}

- (BOOL)canEnterLookAroundPIP
{
  return self->_canEnterLookAroundPIP;
}

- (void)setCanEnterLookAroundPIP:(BOOL)a3
{
  self->_canEnterLookAroundPIP = a3;
}

- (id)didEnterLookAroundPIP
{
  return self->_didEnterLookAroundPIP;
}

- (void)setDidEnterLookAroundPIP:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEnterLookAroundPIP, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);

  objc_storeStrong((id *)&self->_puckView, 0);
}

@end