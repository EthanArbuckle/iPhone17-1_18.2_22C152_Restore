@interface CarMapPanningViewController
- (CarChromeViewController)chromeViewController;
- (CarMapNudgerizer)nudgerizer;
- (CarMapPanningViewControllerDelegate)panDelegate;
- (MKMapView)mapView;
- (NSArray)carFocusOrderSequences;
- (NSArray)preferredFocusEnvironments;
- (void)_beginImpulseDown;
- (void)_beginImpulseLeft;
- (void)_beginImpulseRight;
- (void)_beginImpulseUp;
- (void)_createViewsIfNeeded;
- (void)_endImpulseDown;
- (void)_endImpulseLeft;
- (void)_endImpulseRight;
- (void)_endImpulseUp;
- (void)_momentaryImpulseDown;
- (void)_momentaryImpulseLeft;
- (void)_momentaryImpulseRight;
- (void)_momentaryImpulseUp;
- (void)_tappedDone;
- (void)_updateContentViewIfNeeded;
- (void)nudgerizer:(id)a3 didGestureMapView:(id)a4 inDirection:(int64_t)a5;
- (void)setChromeViewController:(id)a3;
- (void)setMapView:(id)a3;
- (void)setNudgerizer:(id)a3;
- (void)setPanDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarMapPanningViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarMapPanningViewController;
  [(CarMapPanningViewController *)&v4 viewWillAppear:a3];
  [(CarMapPanningViewController *)self _updateContentViewIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CarMapPanningViewController *)self navigationController];
  [v5 setNeedsFocusUpdate];

  v6.receiver = self;
  v6.super_class = (Class)CarMapPanningViewController;
  [(CarMapPanningViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarMapPanningViewController;
  [(CarMapPanningViewController *)&v6 viewWillDisappear:a3];
  [(CarDoneButton *)self->_doneButton removeFromSuperview];
  [(CarPanButtonContainer *)self->_panButtonContainer removeFromSuperview];
  doneButton = self->_doneButton;
  self->_doneButton = 0;

  panButtonContainer = self->_panButtonContainer;
  self->_panButtonContainer = 0;
}

- (void)_updateContentViewIfNeeded
{
  BOOL v3 = [(CarMapPanningViewController *)self chromeViewController];
  objc_super v4 = [v3 viewport];

  v5 = [(CarMapPanningViewController *)self chromeViewController];
  objc_super v6 = [v5 viewportLayoutGuide];

  if (self->_doneButton) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0;
  }
  BOOL v8 = v7 || v6 == 0;
  if (!v8 && [(CarMapPanningViewController *)self isViewLoaded])
  {
    [(CarMapPanningViewController *)self _createViewsIfNeeded];
    [v4 addSubview:self->_doneButton];
    [v4 addSubview:self->_panButtonContainer];
    v30 = [(CarDoneButton *)self->_doneButton _maps_rightRHDAnchor];
    v31 = [v4 safeAreaLayoutGuide];
    v29 = [v31 _maps_rightRHDAnchor];
    LODWORD(v9) = 1148846080;
    v28 = [v30 _maps_constraintWithRHDAnchor:v29 relation:0 constant:-10.0 priority:v9];
    v32[0] = v28;
    v27 = [(CarDoneButton *)self->_doneButton topAnchor];
    v26 = [v6 topAnchor];
    v25 = [v27 constraintEqualToAnchor:v26 constant:10.0];
    v32[1] = v25;
    v24 = [(CarDoneButton *)self->_doneButton heightAnchor];
    v23 = [v24 constraintEqualToConstant:28.0];
    v32[2] = v23;
    v22 = [(CarPanButtonContainer *)self->_panButtonContainer topAnchor];
    v21 = [v6 topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v32[3] = v20;
    v19 = [(CarPanButtonContainer *)self->_panButtonContainer bottomAnchor];
    v18 = [v6 bottomAnchor];
    v10 = [v19 constraintEqualToAnchor:v18];
    v32[4] = v10;
    v11 = [(CarPanButtonContainer *)self->_panButtonContainer leadingAnchor];
    v12 = [v6 leadingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v32[5] = v13;
    v14 = [(CarPanButtonContainer *)self->_panButtonContainer trailingAnchor];
    v15 = [v6 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v32[6] = v16;
    v17 = +[NSArray arrayWithObjects:v32 count:7];
    +[NSLayoutConstraint activateConstraints:v17];
  }
}

- (void)_createViewsIfNeeded
{
  if (!self->_doneButton)
  {
    BOOL v3 = -[CarDoneButton initWithFrame:]([CarDoneButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    doneButton = self->_doneButton;
    self->_doneButton = v3;

    [(CarDoneButton *)self->_doneButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarDoneButton *)self->_doneButton addTarget:self action:"_tappedDone" forControlEvents:64];
  }
  if (!self->_panButtonContainer)
  {
    v5 = -[CarPanButtonContainer initWithFrame:]([CarPanButtonContainer alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    panButtonContainer = self->_panButtonContainer;
    self->_panButtonContainer = v5;

    [(CarPanButtonContainer *)self->_panButtonContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v7 = [(CarPanButtonContainer *)self->_panButtonContainer panUpButton];
    [v7 addTarget:self action:"_beginImpulseUp" forControlEvents:0x2000000];

    BOOL v8 = [(CarPanButtonContainer *)self->_panButtonContainer panUpButton];
    [v8 addTarget:self action:"_endImpulseUp" forControlEvents:0x4000000];

    double v9 = [(CarPanButtonContainer *)self->_panButtonContainer panUpButton];
    [v9 addTarget:self action:"_momentaryImpulseUp" forControlEvents:0x1000000];

    v10 = [(CarPanButtonContainer *)self->_panButtonContainer panLeftButton];
    [v10 addTarget:self action:"_beginImpulseLeft" forControlEvents:0x2000000];

    v11 = [(CarPanButtonContainer *)self->_panButtonContainer panLeftButton];
    [v11 addTarget:self action:"_endImpulseLeft" forControlEvents:0x4000000];

    v12 = [(CarPanButtonContainer *)self->_panButtonContainer panLeftButton];
    [v12 addTarget:self action:"_momentaryImpulseLeft" forControlEvents:0x1000000];

    v13 = [(CarPanButtonContainer *)self->_panButtonContainer panRightButton];
    [v13 addTarget:self action:"_beginImpulseRight" forControlEvents:0x2000000];

    v14 = [(CarPanButtonContainer *)self->_panButtonContainer panRightButton];
    [v14 addTarget:self action:"_endImpulseRight" forControlEvents:0x4000000];

    v15 = [(CarPanButtonContainer *)self->_panButtonContainer panRightButton];
    [v15 addTarget:self action:"_momentaryImpulseRight" forControlEvents:0x1000000];

    v16 = [(CarPanButtonContainer *)self->_panButtonContainer panDownButton];
    [v16 addTarget:self action:"_beginImpulseDown" forControlEvents:0x2000000];

    v17 = [(CarPanButtonContainer *)self->_panButtonContainer panDownButton];
    [v17 addTarget:self action:"_endImpulseDown" forControlEvents:0x4000000];

    id v18 = [(CarPanButtonContainer *)self->_panButtonContainer panDownButton];
    [v18 addTarget:self action:"_momentaryImpulseDown" forControlEvents:0x1000000];
  }
}

- (NSArray)preferredFocusEnvironments
{
  if (self->_panButtonContainer)
  {
    panButtonContainer = self->_panButtonContainer;
    v2 = +[NSArray arrayWithObjects:&panButtonContainer count:1];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(CarMapPanningViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  panButtonContainer = self->_panButtonContainer;

  -[CarPanButtonContainer setFrame:](panButtonContainer, "setFrame:", v5, v7, v9, v11);
}

- (void)_tappedDone
{
  BOOL v3 = [(CarMapPanningViewController *)self panDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CarMapPanningViewController *)self panDelegate];
    [v5 carMapPanningViewControllerDidTapDone:self];
  }
}

- (void)_beginImpulseUp
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 beginImpulseInDirection:1];
}

- (void)_endImpulseUp
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 endImpluseInDirection:1];
}

- (void)_momentaryImpulseUp
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 momentaryImpulseInDirection:1];
}

- (void)_beginImpulseDown
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 beginImpulseInDirection:2];
}

- (void)_endImpulseDown
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 endImpluseInDirection:2];
}

- (void)_momentaryImpulseDown
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 momentaryImpulseInDirection:2];
}

- (void)_beginImpulseLeft
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 beginImpulseInDirection:3];
}

- (void)_endImpulseLeft
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 endImpluseInDirection:3];
}

- (void)_momentaryImpulseLeft
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 momentaryImpulseInDirection:3];
}

- (void)_beginImpulseRight
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 beginImpulseInDirection:4];
}

- (void)_endImpulseRight
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 endImpluseInDirection:4];
}

- (void)_momentaryImpulseRight
{
  id v2 = [(CarMapPanningViewController *)self nudgerizer];
  [v2 momentaryImpulseInDirection:4];
}

- (NSArray)carFocusOrderSequences
{
  if ([(CarMapPanningViewController *)self isViewLoaded])
  {
    BOOL v3 = +[MapsExternalDevice sharedInstance];
    unsigned int v4 = [v3 rightHandDrive];

    v21 = [(CarPanButtonContainer *)self->_panButtonContainer panRightButton];
    uint64_t v5 = +[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:");
    v20 = (void *)v5;
    if (v4)
    {
      v24[0] = v5;
      v19 = [(CarPanButtonContainer *)self->_panButtonContainer panDownButton];
      id v18 = +[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:");
      v24[1] = v18;
      v17 = [(CarMapPanningViewController *)self chromeViewController];
      double v6 = [v17 itemRepresentingMapControls];
      double v7 = [v6 itemFlippedForRHD];
      v24[2] = v7;
      double v8 = [(CarPanButtonContainer *)self->_panButtonContainer panLeftButton];
      double v9 = +[CarFocusOrderItem itemWithFocusItem:v8];
      v24[3] = v9;
      double v10 = +[CarFocusOrderItem itemWithFocusItem:self->_doneButton];
      v24[4] = v10;
      double v11 = [(CarPanButtonContainer *)self->_panButtonContainer panUpButton];
      v12 = +[CarFocusOrderItem itemWithFocusItem:v11];
      v24[5] = v12;
      v13 = +[NSArray arrayWithObjects:v24 count:6];
      v14 = +[CarFocusOrderSequence sequenceWithItems:v13 options:10];
      v25 = v14;
      v15 = +[NSArray arrayWithObjects:&v25 count:1];
    }
    else
    {
      v22[0] = v5;
      v19 = [(CarMapPanningViewController *)self chromeViewController];
      id v18 = [v19 itemRepresentingMapControls];
      v22[1] = v18;
      v17 = [(CarPanButtonContainer *)self->_panButtonContainer panDownButton];
      double v6 = +[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:");
      v22[2] = v6;
      double v7 = [(CarPanButtonContainer *)self->_panButtonContainer panLeftButton];
      double v8 = +[CarFocusOrderItem itemWithFocusItem:v7];
      v22[3] = v8;
      double v9 = [(CarPanButtonContainer *)self->_panButtonContainer panUpButton];
      double v10 = +[CarFocusOrderItem itemWithFocusItem:v9];
      v22[4] = v10;
      double v11 = +[CarFocusOrderItem itemWithFocusItem:self->_doneButton];
      v22[5] = v11;
      v12 = +[NSArray arrayWithObjects:v22 count:6];
      v13 = +[CarFocusOrderSequence sequenceWithItems:v12 options:9];
      v23 = v13;
      v15 = +[NSArray arrayWithObjects:&v23 count:1];
    }
  }
  else
  {
    v15 = 0;
  }

  return (NSArray *)v15;
}

- (void)nudgerizer:(id)a3 didGestureMapView:(id)a4 inDirection:(int64_t)a5
{
  double v7 = [(CarMapPanningViewController *)self panDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(CarMapPanningViewController *)self panDelegate];
    [v9 carMapPanningViewControllerDidPan:self inDirection:a5];
  }
  double v10 = +[CarDisplayController sharedInstance];
  double v11 = [v10 window];
  v12 = [v11 windowScene];
  v13 = [v12 focusSystem];
  v14 = [v13 focusedItem];

  v15 = [(CarPanButtonContainer *)self->_panButtonContainer panUpButton];
  v20[0] = v15;
  v16 = [(CarPanButtonContainer *)self->_panButtonContainer panLeftButton];
  v20[1] = v16;
  v17 = [(CarPanButtonContainer *)self->_panButtonContainer panRightButton];
  v20[2] = v17;
  id v18 = [(CarPanButtonContainer *)self->_panButtonContainer panDownButton];
  v20[3] = v18;
  v19 = +[NSArray arrayWithObjects:v20 count:4];

  if ([v19 containsObject:v14] && objc_msgSend(v14, "direction") != (id)a5)
  {
    [(CarPanButtonContainer *)self->_panButtonContainer setLastNudgedDirection:a5];
    [(CarPanButtonContainer *)self->_panButtonContainer setNeedsFocusUpdate];
  }
}

- (CarChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (CarChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (CarMapNudgerizer)nudgerizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nudgerizer);

  return (CarMapNudgerizer *)WeakRetained;
}

- (void)setNudgerizer:(id)a3
{
}

- (CarMapPanningViewControllerDelegate)panDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panDelegate);

  return (CarMapPanningViewControllerDelegate *)WeakRetained;
}

- (void)setPanDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_panDelegate);
  objc_destroyWeak((id *)&self->_nudgerizer);
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_doneButton, 0);

  objc_storeStrong((id *)&self->_panButtonContainer, 0);
}

@end