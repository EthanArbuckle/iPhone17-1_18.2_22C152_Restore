@interface MapsPinsController
+ (id)sharedController;
- (MSPDroppedPin)droppedPin;
- (MapsPinsController)init;
- (NSArray)storeSubscriptionTypes;
- (void)_handleNewOrModifiedCustomSearchResult:(id)a3;
- (void)_notifySearchManager;
- (void)_updatePinsWithCompletion:(id)a3;
- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5;
- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation MapsPinsController

- (MapsPinsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MapsPinsController;
  v2 = [(MapsPinsController *)&v8 init];
  if (v2)
  {
    v3 = +[CustomSearchManager sharedManager];
    [v3 addObserver:v2];

    uint64_t v9 = objc_opt_class();
    uint64_t v4 = +[NSArray arrayWithObjects:&v9 count:1];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v4;

    v6 = +[MapsSyncStore sharedStore];
    [v6 subscribe:v2];

    [(MapsPinsController *)v2 _updatePinsWithCompletion:0];
  }
  return v2;
}

- (void)_updatePinsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
  id v6 = [objc_alloc((Class)_TtC8MapsSync13MapsSyncRange) initWithOffset:0 limit:1];
  id v7 = [v5 initWithPredicate:0 sortDescriptors:0 range:v6];

  id v8 = objc_alloc_init((Class)MSHistoryMarkedLocationRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003F3D4;
  v10[3] = &unk_1012E6EF8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 fetchWithOptions:v7 completionHandler:v10];
}

- (void)_notifySearchManager
{
  v3 = [SearchResult alloc];
  id v4 = [(MapsPinsController *)self droppedPin];
  id v6 = [(SearchResult *)v3 initWithDroppedPin:v4];

  id v5 = +[CustomSearchManager sharedManager];
  [v5 setCustomSearchResult:v6 animated:0 shouldSelectOnMap:0 context:@"com.apple.Maps.MapsPinsController"];
}

- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7
{
  id v9 = a4;
  if (([a7 isEqual:@"com.apple.Maps.MapsPinsController"] & 1) == 0) {
    [(MapsPinsController *)self _handleNewOrModifiedCustomSearchResult:v9];
  }
}

- (MSPDroppedPin)droppedPin
{
  pin = self->_pin;
  if (pin)
  {
    pin = [pin droppedPin];
  }

  return (MSPDroppedPin *)pin;
}

+ (id)sharedController
{
  if (qword_10160FE68 != -1) {
    dispatch_once(&qword_10160FE68, &stru_1012FFA40);
  }
  v2 = (void *)qword_10160FE60;

  return v2;
}

- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5
{
  if (a5) {
    [(MapsPinsController *)self _handleNewOrModifiedCustomSearchResult:a4];
  }
}

- (void)_handleNewOrModifiedCustomSearchResult:(id)a3
{
  id v4 = a3;
  pin = self->_pin;
  if (!v4 && pin)
  {
    id v7 = +[MapsSyncStore sharedStore];
    v14 = self->_pin;
    id v8 = +[NSArray arrayWithObjects:&v14 count:1];
    [v7 deleteWithObjects:v8 completionHandler:&stru_1012FFA60];

    id v9 = self->_pin;
    self->_pin = 0;
LABEL_9:

    goto LABEL_10;
  }
  if (![(MSHistoryMarkedLocation *)pin isEqualToSearchResult:v4])
  {
    id v6 = self->_pin;
    if (v6)
    {
      [(MSHistoryMarkedLocation *)v6 updateWithSearchResult:v4];
    }
    else
    {
      v10 = (MSHistoryMarkedLocation *)[objc_alloc((Class)MSHistoryMarkedLocation) initWithSearchResult:v4];
      id v11 = self->_pin;
      self->_pin = v10;
    }
    id v9 = +[MapsSyncStore sharedStore];
    v13 = self->_pin;
    v12 = +[NSArray arrayWithObjects:&v13 count:1];
    [v9 saveWithObjects:v12 completionHandler:&stru_1012FFA80];

    goto LABEL_9;
  }
LABEL_10:
}

- (void)storeDidChangeWithTypes:(id)a3
{
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);

  objc_storeStrong((id *)&self->_pin, 0);
}

@end