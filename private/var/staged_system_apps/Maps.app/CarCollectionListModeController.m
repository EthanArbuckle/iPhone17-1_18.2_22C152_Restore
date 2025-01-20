@interface CarCollectionListModeController
- (BOOL)allowKnobNudgeMapPanning;
- (BOOL)shouldAllowKnobFocusMovement;
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsMapView;
- (CarCollectionListCardViewController)collectionListCard;
- (CarCollectionListModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)collections;
- (NSArray)preferredCarFocusEnvironments;
- (id)desiredCards;
- (int)currentUsageTarget;
- (int64_t)autohideBehavior;
- (void)_updateCollections:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)collectionListCard:(id)a3 didSelectCollection:(id)a4;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setCollectionListCard:(id)a3;
- (void)setCollections:(id)a3;
@end

@implementation CarCollectionListModeController

- (CarCollectionListModeController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CarCollectionListModeController;
  v2 = [(CarCollectionListModeController *)&v7 init];
  if (v2)
  {
    v3 = +[CollectionManager sharedManager];
    uint64_t v4 = [v3 currentCollectionsForCarPlay];
    collections = v2->_collections;
    v2->_collections = (NSArray *)v4;
  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v5 = [CarCollectionListCardViewController alloc];
  v6 = [(CarCollectionListModeController *)self collections];
  objc_super v7 = [(CarCollectionListCardViewController *)v5 initWithCollections:v6 delegate:self];
  [(CarCollectionListModeController *)self setCollectionListCard:v7];

  id v8 = +[CollectionManager sharedManager];
  [v8 addObserver:self];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = +[CollectionManager sharedManager];
  [v5 removeObserver:self];
}

- (id)desiredCards
{
  CFStringRef v4 = @"primary";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"primary"])
  {
    objc_super v7 = [(CarCollectionListModeController *)self collectionListCard];
    [v6 setContent:v7];

    id v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"CarPlay_Guides_List_Title" value:@"localized string not found" table:0];
    [v6 setTitle:v9];

    HIDWORD(v25) = 0;
    *(_DWORD *)((char *)&v25 + 1) = 0;
    long long v15 = xmmword_100F6F1C0;
    long long v16 = xmmword_100F67600;
    uint64_t v17 = 3;
    uint64_t v18 = 1148846080;
    uint64_t v19 = 2;
    LODWORD(v20) = 1148846080;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v23 = _Q0;
    long long v24 = _Q0;
    LOBYTE(v25) = 1;
    uint64_t v26 = 8;
    LOBYTE(v27) = 0;
    if (v6) {
      [v6 setLayout:&v15];
    }
    [v6 setAccessory:1 v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27];
  }
}

- (void)_updateCollections:(id)a3
{
  id v8 = a3;
  CFStringRef v4 = [(CarCollectionListModeController *)self collections];
  unsigned __int8 v5 = [v8 isEqualToArray:v4];

  if ((v5 & 1) == 0)
  {
    [(CarCollectionListModeController *)self setCollections:v8];
    id v6 = [(CarCollectionListModeController *)self collectionListCard];
    objc_super v7 = [(CarCollectionListModeController *)self collections];
    [v6 setCollections:v7];
  }
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
}

- (void)collectionListCard:(id)a3 didSelectCollection:(id)a4
{
  id v4 = a4;
  unsigned __int8 v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "searchCategoriesCard:didSelectCollection: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[CarChromeModeCoordinator sharedInstance];
  [v6 displaySearchResultsWithCollection:v4];
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (NSArray)preferredCarFocusEnvironments
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)carFocusOrderSequences
{
  v3 = [(CarCollectionListModeController *)self chromeViewController];
  id v4 = [v3 itemRepresentingStatusBanner];
  unsigned __int8 v5 = [(CarCollectionListModeController *)self chromeViewController];
  id v6 = [v5 itemRepresentingOverlays];
  v11[1] = v6;
  int v7 = +[NSArray arrayWithObjects:v11 count:2];
  id v8 = +[CarFocusOrderSequence sequenceWithItems:v7 options:5];
  v12 = v8;
  v9 = +[NSArray arrayWithObjects:&v12 count:1];

  return (NSArray *)v9;
}

- (int)currentUsageTarget
{
  return 0;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (CarCollectionListCardViewController)collectionListCard
{
  return self->_collectionListCard;
}

- (void)setCollectionListCard:(id)a3
{
}

- (NSArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_collectionListCard, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end