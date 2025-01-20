@interface CarPreciseLocationOffButtonCardViewController
- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3;
- (BOOL)isTransitioning;
- (BOOL)shouldBeVisible;
- (CarPreciseLocationOffButton)preciseLocationOffButton;
- (CarPreciseLocationOffButtonCardViewController)initWithDelegate:(id)a3;
- (CarPreciseLocationOffButtonCardViewControllerDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (UIStackView)buttonStack;
- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5;
- (void)_buttonTapped:(id)a3;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)setButtonStack:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreciseLocationOffButton:(id)a3;
- (void)setShouldBeVisible:(BOOL)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CarPreciseLocationOffButtonCardViewController

- (CarPreciseLocationOffButtonCardViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarPreciseLocationOffButtonCardViewController;
  v5 = [(CarPreciseLocationOffButtonCardViewController *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[MKLocationManager sharedLocationManager];
    if ([v7 isAuthorizedForPreciseLocation])
    {
      [(CarPreciseLocationOffButtonCardViewController *)v6 setShouldBeVisible:0];
    }
    else
    {
      v8 = +[MKLocationManager sharedLocationManager];
      -[CarPreciseLocationOffButtonCardViewController setShouldBeVisible:](v6, "setShouldBeVisible:", [v8 isLocationServicesApproved]);
    }
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v6 selector:"locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];
  }
  return v6;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)CarPreciseLocationOffButtonCardViewController;
  [(CarPreciseLocationOffButtonCardViewController *)&v25 viewDidLoad];
  v3 = [(CarPreciseLocationOffButtonCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarPreciseLocationOffButtonCard"];

  id v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"CarPlay_PreciseLocationOffButton" value:@"localized string not found" table:0];
  v6 = +[CarPreciseLocationOffButton preciseLocationOffButtonWithTitle:v5];
  [(CarPreciseLocationOffButtonCardViewController *)self setPreciseLocationOffButton:v6];

  v7 = [(CarPreciseLocationOffButtonCardViewController *)self preciseLocationOffButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(CarPreciseLocationOffButtonCardViewController *)self preciseLocationOffButton];
  [v8 addTarget:self action:"_buttonTapped:" forControlEvents:64];

  id v9 = objc_alloc((Class)UIStackView);
  v10 = [(CarPreciseLocationOffButtonCardViewController *)self preciseLocationOffButton];
  v26 = v10;
  objc_super v11 = +[NSArray arrayWithObjects:&v26 count:1];
  id v12 = [v9 initWithArrangedSubviews:v11];
  [(CarPreciseLocationOffButtonCardViewController *)self setButtonStack:v12];

  v13 = [(CarPreciseLocationOffButtonCardViewController *)self buttonStack];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(CarPreciseLocationOffButtonCardViewController *)self buttonStack];
  [v14 setAxis:1];

  v15 = [(CarPreciseLocationOffButtonCardViewController *)self buttonStack];
  [v15 setDistribution:2];

  v16 = [(CarPreciseLocationOffButtonCardViewController *)self buttonStack];
  [v16 setSpacing:2.0];

  v17 = [(CarPreciseLocationOffButtonCardViewController *)self buttonStack];
  [v17 setAccessibilityIdentifier:@"CarPreciseLocationOffCard"];

  v18 = [(CarPreciseLocationOffButtonCardViewController *)self view];
  v19 = [(CarPreciseLocationOffButtonCardViewController *)self buttonStack];
  [v18 addSubview:v19];

  v20 = [(CarPreciseLocationOffButtonCardViewController *)self buttonStack];
  v21 = [(CarPreciseLocationOffButtonCardViewController *)self view];
  LODWORD(v22) = 1148846080;
  v23 = [v20 _maps_constraintsEqualToEdgesOfView:v21 priority:v22];
  v24 = [v23 allConstraints];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (void)setShouldBeVisible:(BOOL)a3
{
  if (self->_shouldBeVisible != a3)
  {
    self->_shouldBeVisible = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained preciseLocationOffButtonCard:self visibilityUpdated:self->_shouldBeVisible];
  }
}

- (void)_buttonTapped:(id)a3
{
  id v4 = [(CarPreciseLocationOffButtonCardViewController *)self delegate];
  [v4 preciseLocationOffButtonCardDidSelectAction:self];
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  id v5 = +[MKLocationManager sharedLocationManager];
  if ([v5 isAuthorizedForPreciseLocation])
  {
    [(CarPreciseLocationOffButtonCardViewController *)self setShouldBeVisible:0];
  }
  else
  {
    id v4 = +[MKLocationManager sharedLocationManager];
    -[CarPreciseLocationOffButtonCardViewController setShouldBeVisible:](self, "setShouldBeVisible:", [v4 isLocationServicesApproved]);
  }
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  return 0;
}

- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3
{
  retstr->var0 = 15;
  retstr->var1 = 14.0;
  retstr->var2 = kCACornerCurveContinuous;

  id var9 = a4->var9;

  return result;
}

- (NSArray)focusOrderSubItems
{
  v2 = [(CarPreciseLocationOffButtonCardViewController *)self preciseLocationOffButton];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = [(CarPreciseLocationOffButtonCardViewController *)self preciseLocationOffButton];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)shouldBeVisible
{
  return self->_shouldBeVisible;
}

- (CarPreciseLocationOffButtonCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarPreciseLocationOffButtonCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CarPreciseLocationOffButton)preciseLocationOffButton
{
  return self->_preciseLocationOffButton;
}

- (void)setPreciseLocationOffButton:(id)a3
{
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_preciseLocationOffButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end