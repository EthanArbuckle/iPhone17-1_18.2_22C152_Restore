@interface LineCardViewController
- (BOOL)lineItemIsLoading;
- (BOOL)supportsSharing;
- (GEOTransitLineItem)lineItem;
- (LineCardViewController)init;
- (LineCardViewControllerDelegate)lineCardDelegate;
- (MUTransitLineItemViewController)lineItemViewController;
- (VKLabelMarker)labelMarker;
- (double)lineItemViewControllerHeaderTitleTrailingConstant:(id)a3;
- (id)headerActionItems;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (void)insertInHistory;
- (void)lineItemViewController:(id)a3 didSelectDetailsForIncidents:(id)a4;
- (void)lineItemViewController:(id)a3 didSelectDirectionsToNearestStation:(id)a4 withTransportTypePreference:(id)a5;
- (void)lineItemViewController:(id)a3 didSelectNearestStation:(id)a4;
- (void)lineItemViewController:(id)a3 openURL:(id)a4;
- (void)lineItemViewControllerDidAppear:(id)a3;
- (void)lineItemViewControllerDidSelectReportAProblem:(id)a3;
- (void)lineItemViewControllerDidSelectViewOnMap:(id)a3;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)resetNearestStation;
- (void)setLineCardDelegate:(id)a3;
- (void)setLineItem:(id)a3 labelMarker:(id)a4 loading:(BOOL)a5 preferredLayout:(unint64_t)a6;
- (void)setLineItem:(id)a3 loading:(BOOL)a4;
- (void)viewDidLoad;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation LineCardViewController

- (LineCardViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)LineCardViewController;
  v2 = [(LineCardViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(ContaineeViewController *)v2 cardPresentationController];
    [v4 setAlwaysUseDefaultContaineeLayout:1];
  }
  return v3;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)LineCardViewController;
  [(InfoCardViewController *)&v9 viewDidLoad];
  v3 = self->_lineItem;
  v4 = [(GEOTransitLineItem *)v3 name];
  id v5 = [v4 length];

  if (!v5)
  {
    uint64_t v6 = [(GEOTransitLineItem *)v3 system];

    v3 = (GEOTransitLineItem *)v6;
  }
  v7 = [(GEOTransitLineItem *)v3 name];

  v8 = [(InfoCardViewController *)self titleHeaderView];
  [v8 setTitle:v7];
}

- (BOOL)lineItemIsLoading
{
  v2 = [(LineCardViewController *)self lineItemViewController];
  unsigned __int8 v3 = [v2 isLoading];

  return v3;
}

- (void)setLineItem:(id)a3 loading:(BOOL)a4
{
}

- (void)setLineItem:(id)a3 labelMarker:(id)a4 loading:(BOOL)a5 preferredLayout:(unint64_t)a6
{
  BOOL v7 = a5;
  v20 = (GEOTransitLineItem *)a3;
  id v11 = a4;
  if (self->_lineItem != v20 || [(LineCardViewController *)self lineItemIsLoading] != v7)
  {
    objc_storeStrong((id *)&self->_lineItem, a3);
    objc_storeStrong((id *)&self->_labelMarker, a4);
    v12 = [(LineCardViewController *)self lineItemViewController];
    [v12 setTransitLineItem:v20 loading:v7];

    v13 = self->_lineItem;
    v14 = [(GEOTransitLineItem *)v13 name];
    id v15 = [v14 length];

    if (!v15)
    {
      uint64_t v16 = [(GEOTransitLineItem *)v13 system];

      v13 = (GEOTransitLineItem *)v16;
    }
    v17 = [(GEOTransitLineItem *)v13 name];

    v18 = [(InfoCardViewController *)self titleHeaderView];
    [v18 setTitle:v17];

    v19 = [(InfoCardViewController *)self titleHeaderView];
    [v19 setHairLineAlpha:0.0];

    [(InfoCardViewController *)self rebuildHeaderMenu];
    self->_didInsertInHistory = 0;
    self->_preferredLayout = a6;
    if ((sub_1003A1138(v20) & 1) == 0) {
      [(LineCardViewController *)self insertInHistory];
    }
  }
}

- (void)resetNearestStation
{
  id v2 = [(LineCardViewController *)self lineItemViewController];
  [v2 resetNearestStation];
}

- (MUTransitLineItemViewController)lineItemViewController
{
  lineItemViewController = self->_lineItemViewController;
  if (!lineItemViewController)
  {
    id v4 = objc_alloc((Class)MUTransitLineItemViewController);
    id v5 = [(LineCardViewController *)self lineItem];
    uint64_t v6 = (MUTransitLineItemViewController *)[v4 initWithTransitLineItem:v5];
    BOOL v7 = self->_lineItemViewController;
    self->_lineItemViewController = v6;

    [(MUTransitLineItemViewController *)self->_lineItemViewController setDelegate:self];
    v8 = +[UIColor clearColor];
    objc_super v9 = [(MUTransitLineItemViewController *)self->_lineItemViewController view];
    [v9 setBackgroundColor:v8];

    [(InfoCardViewController *)self setContentViewController:self->_lineItemViewController];
    lineItemViewController = self->_lineItemViewController;
  }

  return lineItemViewController;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LineCardViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v7, "willChangeContainerStyle:");
  if (a3 == 6)
  {
    unint64_t preferredLayout = 4;
  }
  else if (self->_preferredLayout)
  {
    unint64_t preferredLayout = self->_preferredLayout;
  }
  else
  {
    unint64_t preferredLayout = 2;
  }
  uint64_t v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setDefaultContaineeLayout:preferredLayout];
}

- (void)insertInHistory
{
  if (!self->_didInsertInHistory)
  {
    unsigned __int8 v3 = [(LineCardViewController *)self lineItem];

    if (v3)
    {
      id v4 = [(LineCardViewController *)self lineItem];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1007490B8;
      v5[3] = &unk_1012EB010;
      v5[4] = self;
      +[HistoryEntryRecentsItem saveLineItem:v4 completion:v5];
    }
  }
}

- (BOOL)supportsSharing
{
  return 0;
}

- (id)headerActionItems
{
  return [(MUTransitLineItemViewController *)self->_lineItemViewController createMenuActions];
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (void)lineItemViewControllerDidSelectReportAProblem:(id)a3
{
  id v4 = [(LineCardViewController *)self _maps_mapsSceneDelegate];
  id v5 = [v4 rapPresenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10074919C;
  v6[3] = &unk_1012ED628;
  v6[4] = self;
  [v5 presentReportAProblemFromTransitLineCardWithEditingContext:v6 completion:0];
}

- (void)lineItemViewController:(id)a3 didSelectDirectionsToNearestStation:(id)a4 withTransportTypePreference:(id)a5
{
  id v7 = a5;
  if (a4)
  {
    id v8 = a4;
    objc_super v9 = objc_alloc_init(SearchFieldItem);
    v10 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v9 setSearchResult:v10];

    id v11 = objc_alloc_init(SearchFieldItem);
    v12 = [[SearchResult alloc] initWithMapItem:v8];

    [(SearchFieldItem *)v11 setSearchResult:v12];
    if (v7)
    {
      v13 = (char *)[v7 integerValue];
      if ((unint64_t)(v13 - 1) < 4) {
        uint64_t v14 = (uint64_t)(v13 + 1);
      }
      else {
        uint64_t v14 = 1;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v15 = [DirectionItem alloc];
    v19[0] = v9;
    v19[1] = v11;
    uint64_t v16 = +[NSArray arrayWithObjects:v19 count:2];
    v17 = [(DirectionItem *)v15 initWithItems:v16 transportType:v14];

    v18 = [(LineCardViewController *)self lineCardDelegate];
    [v18 lineCardViewController:self doDirectionItem:v17];
  }
}

- (void)lineItemViewController:(id)a3 didSelectNearestStation:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = [(LineCardViewController *)self lineCardDelegate];
    [v6 lineCardViewController:self selectMapItem:v5];
  }
}

- (void)lineItemViewController:(id)a3 didSelectDetailsForIncidents:(id)a4
{
  id v5 = a4;
  id v6 = [(LineCardViewController *)self lineCardDelegate];
  [v6 lineCardViewController:self showIncidents:v5];
}

- (void)lineItemViewControllerDidSelectViewOnMap:(id)a3
{
  id v11 = a3;
  id v4 = [v11 transitLineItem];
  id v5 = [v4 mapRegion];

  if (v5)
  {
    if ([v11 conformsToProtocol:&OBJC_PROTOCOL____MKInfoCardAnalyticsDelegate])
    {
      id v6 = v11;
      [v6 infoCardAnalyticsDidSelectAction:7004 target:[self currentUITargetForAnalytics] eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
    }
    id v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 wantsLayout:1];

    id v8 = [(LineCardViewController *)self lineCardDelegate];
    objc_super v9 = [v11 transitLineItem];
    v10 = [v9 mapRegion];
    [v8 lineCardViewController:self displayMapRegion:v10];
  }
}

- (double)lineItemViewControllerHeaderTitleTrailingConstant:(id)a3
{
  return 35.0;
}

- (void)lineItemViewControllerDidAppear:(id)a3
{
  id v4 = [(LineCardViewController *)self lineCardDelegate];
  [v4 lineCardViewControllerDidAppear:self];
}

- (void)lineItemViewController:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [(LineCardViewController *)self lineCardDelegate];
  [v6 lineCardViewController:self openURL:v5];
}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (LineCardViewControllerDelegate)lineCardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lineCardDelegate);

  return (LineCardViewControllerDelegate *)WeakRetained;
}

- (void)setLineCardDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lineCardDelegate);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);

  objc_storeStrong((id *)&self->_lineItemViewController, 0);
}

@end