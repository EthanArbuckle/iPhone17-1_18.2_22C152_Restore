@interface ParkedCarInfoCardViewController
- (ActionCoordination)delegate;
- (BOOL)_canShowWhileLocked;
- (ParkedCar)parkedCar;
- (void)_loadParkedCarViewControllerIfNeeded;
- (void)didBecomeCurrent;
- (void)didResignCurrent;
- (void)handleDismissAction:(id)a3;
- (void)handleShareWithPresentationOptions:(id)a3;
- (void)hideHeader;
- (void)parkedCarViewControllerDidBeginEditing:(id)a3;
- (void)parkedCarViewControllerDidRequestDismissal:(id)a3;
- (void)parkedCarViewControllerDidSelectShare:(id)a3;
- (void)parkerCarViewControllerDidSelectDoDirections:(id)a3 transportType:(int64_t)a4;
- (void)performAction:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setParkedCar:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation ParkedCarInfoCardViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ParkedCarInfoCardViewController;
  [(InfoCardViewController *)&v3 viewDidLoad];
  [(ParkedCarInfoCardViewController *)self _loadParkedCarViewControllerIfNeeded];
}

- (void)didBecomeCurrent
{
  v3.receiver = self;
  v3.super_class = (Class)ParkedCarInfoCardViewController;
  [(ContaineeViewController *)&v3 didBecomeCurrent];
  [(ParkedCarViewController *)self->_parkedCarViewController setActive:1];
}

- (void)didResignCurrent
{
  [(ParkedCarViewController *)self->_parkedCarViewController setActive:0];
  v3.receiver = self;
  v3.super_class = (Class)ParkedCarInfoCardViewController;
  [(ContaineeViewController *)&v3 didResignCurrent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ParkedCarInfoCardViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  [(ParkedCarViewController *)self->_parkedCarViewController setActive:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ParkedCarInfoCardViewController;
  [(InfoCardViewController *)&v4 viewDidDisappear:a3];
  [(ParkedCarViewController *)self->_parkedCarViewController setActive:0];
}

- (void)_loadParkedCarViewControllerIfNeeded
{
  if (!self->_parkedCarViewController)
  {
    objc_super v3 = objc_alloc_init(ParkedCarViewController);
    parkedCarViewController = self->_parkedCarViewController;
    self->_parkedCarViewController = v3;

    [(ParkedCarViewController *)self->_parkedCarViewController setParkedCarDelegate:self];
    v5 = self->_parkedCarViewController;
    [(InfoCardViewController *)self setContentViewController:v5];
  }
}

- (void)performAction:(int64_t)a3
{
}

- (void)handleDismissAction:(id)a3
{
  [(ParkedCarViewController *)self->_parkedCarViewController instrumentDismissAction];
  id v4 = [(ParkedCarInfoCardViewController *)self delegate];
  [v4 viewControllerClosed:self animated:1];
}

- (void)setParkedCar:(id)a3
{
  id v4 = a3;
  [(ParkedCarInfoCardViewController *)self _loadParkedCarViewControllerIfNeeded];
  [(ParkedCarViewController *)self->_parkedCarViewController setParkedCar:v4];
  v5 = [v4 title];

  v6 = [(InfoCardViewController *)self titleHeaderView];
  [v6 setTitle:v5];

  [(ParkedCarInfoCardViewController *)self hideHeader];
}

- (void)hideHeader
{
  objc_super v3 = [(InfoCardViewController *)self titleHeaderView];
  [v3 setHideTitleLabel:1];

  id v4 = +[UIColor clearColor];
  v5 = [(InfoCardViewController *)self titleHeaderView];
  [v5 setBackgroundColor:v4];

  id v6 = [(InfoCardViewController *)self titleHeaderView];
  [v6 setHairLineAlpha:0.0];
}

- (ParkedCar)parkedCar
{
  return [(ParkedCarViewController *)self->_parkedCarViewController parkedCar];
}

- (void)willChangeLayout:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ParkedCarInfoCardViewController;
  [(InfoCardViewController *)&v5 willChangeLayout:"willChangeLayout:"];
  if (a3 - 1 <= 1) {
    [(ParkedCarViewController *)self->_parkedCarViewController dismissTextField];
  }
}

- (void)handleShareWithPresentationOptions:(id)a3
{
}

- (void)parkedCarViewControllerDidSelectShare:(id)a3
{
  id v4 = [SearchResult alloc];
  objc_super v5 = [(ParkedCarInfoCardViewController *)self parkedCar];
  id v6 = [v5 mapItem];
  v10 = [(SearchResult *)v4 initWithMapItem:v6];

  [(SearchResult *)v10 setReverseGeocoded:1];
  v7 = [(SearchResult *)v10 contactForSharingToMessages];
  v8 = +[ShareItem shareItemWithSearchResult:v10 contact:v7 includePrintActivity:0];

  v9 = [(ParkedCarInfoCardViewController *)self delegate];
  [v9 viewController:0 doShareSheetForShareItem:v8 completion:0];
}

- (void)parkerCarViewControllerDidSelectDoDirections:(id)a3 transportType:(int64_t)a4
{
  id v6 = objc_alloc_init(SearchFieldItem);
  v7 = +[SearchResult currentLocationSearchResult];
  [(SearchFieldItem *)v6 setSearchResult:v7];

  v8 = objc_alloc_init(SearchFieldItem);
  v9 = [SearchResult alloc];
  v10 = [(ParkedCarInfoCardViewController *)self parkedCar];
  v11 = [(SearchResult *)v9 initWithParkedCar:v10];
  [(SearchFieldItem *)v8 setSearchResult:v11];

  v12 = [DirectionItem alloc];
  v19[0] = v6;
  v19[1] = v8;
  v13 = +[NSArray arrayWithObjects:v19 count:2];
  v14 = [(DirectionItem *)v12 initWithItems:v13 transportType:a4];

  CFStringRef v17 = @"DirectionsSessionInitiatorKey";
  v18 = &off_1013A73D8;
  v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v16 = [(ParkedCarInfoCardViewController *)self delegate];
  [v16 viewController:self doDirectionItem:v14 withUserInfo:v15];
}

- (void)parkedCarViewControllerDidRequestDismissal:(id)a3
{
  id v4 = [(ParkedCarInfoCardViewController *)self delegate];
  [v4 viewControllerClosed:self animated:1];
}

- (void)parkedCarViewControllerDidBeginEditing:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsLayout:3];
}

- (ActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_parkedCarViewController, 0);
}

@end