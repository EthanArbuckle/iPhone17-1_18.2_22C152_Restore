@interface VenueCardCoordinator
+ (id)searchResultForPlaceCardItem:(id)a3;
- (BOOL)isCardStackEmpty;
- (BOOL)venuesStackContainsCategoryListCard;
- (ContaineeProtocol)topViewController;
- (VenueCardCoordinator)initWithActionCoordinator:(id)a3 venueChangeNotifier:(id)a4;
- (VenueCardCoordinatorDataSource)dataSource;
- (id)routePlanningOverviewViewControllerForCardFactory:(id)a3;
- (id)shareDelegateForCardFactory:(id)a3;
- (id)stateForNewCardItem:(id)a3 previousItemInStack:(id)a4 savePlaceCardSelectionState:(BOOL)a5;
- (id)viewControllerForCardItem:(id)a3;
- (unint64_t)pushVenueCardItem:(id)a3 source:(unint64_t)a4;
- (unint64_t)pushVenueCardItem:(id)a3 source:(unint64_t)a4 savePlaceCardSelectionState:(BOOL)a5;
- (unint64_t)venueIdForCurrentCardStack;
- (void)popVenueCardItem:(id)a3;
- (void)removeAllCards;
- (void)setDataSource:(id)a3;
- (void)venuesStack:(id)a3 reorderedStackAndRemovedCardItems:(id)a4;
@end

@implementation VenueCardCoordinator

- (VenueCardCoordinator)initWithActionCoordinator:(id)a3 venueChangeNotifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VenueCardCoordinator;
  v8 = [(VenueCardCoordinator *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_actionCoordinator, v6);
    v10 = objc_alloc_init(VenueCardDealer);
    v11 = [[VenuesStack alloc] initWithCardDealer:v10];
    cardStack = v9->_cardStack;
    v9->_cardStack = v11;

    [(VenuesStack *)v9->_cardStack setDelegate:v9];
    [(VenuesStack *)v9->_cardStack setDataSource:v9];
    v13 = [[VenueCardFactory alloc] initWithChangeNotifier:v7];
    cardFactory = v9->_cardFactory;
    v9->_cardFactory = v13;

    [(VenueCardFactory *)v9->_cardFactory setDelegate:v9];
    [(VenuesStack *)v9->_cardStack addStackObserver:v9->_cardFactory];
    v15 = v9->_cardStack;
    v16 = [v6 venuesManager];
    [v16 setVenueCardStack:v15];
  }
  return v9;
}

+ (id)searchResultForPlaceCardItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 mapItem];

    if (v5)
    {
      id v6 = [SearchResult alloc];
      id v7 = [v4 mapItem];
      v8 = [(SearchResult *)v6 initWithMapItem:v7];
    }
    else
    {
      v8 = [v4 searchResult];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCardStackEmpty
{
  v2 = [(VenuesStack *)self->_cardStack allItems];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (unint64_t)pushVenueCardItem:(id)a3 source:(unint64_t)a4
{
  return [(VenuesStack *)self->_cardStack pushVenueCardItem:a3 withSource:a4];
}

- (unint64_t)pushVenueCardItem:(id)a3 source:(unint64_t)a4 savePlaceCardSelectionState:(BOOL)a5
{
  return [(VenuesStack *)self->_cardStack pushVenueCardItem:a3 withSource:a4 savePlaceCardSelectionState:a5];
}

- (void)popVenueCardItem:(id)a3
{
  id v4 = a3;
  cardStack = self->_cardStack;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005F309C;
  v7[3] = &unk_1012F1D38;
  id v8 = v4;
  id v6 = v4;
  [(VenuesStack *)cardStack popVenueCard:v7];
}

- (void)removeAllCards
{
}

- (id)viewControllerForCardItem:(id)a3
{
  return [(VenueCardFactory *)self->_cardFactory viewControllerForCardItem:a3];
}

- (ContaineeProtocol)topViewController
{
  BOOL v3 = [(VenuesStack *)self->_cardStack allItems];
  id v4 = [v3 lastObject];

  if (v4)
  {
    v5 = [(VenueCardFactory *)self->_cardFactory existingViewControllerForCardItem:v4];
  }
  else
  {
    v5 = 0;
  }

  return (ContaineeProtocol *)v5;
}

- (unint64_t)venueIdForCurrentCardStack
{
  return [(VenuesStack *)self->_cardStack venueIdForCurrentCardStack];
}

- (BOOL)venuesStackContainsCategoryListCard
{
  BOOL v3 = [(VenuesStack *)self->_cardStack lastCardConformingToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem];

  if (v3) {
    return 1;
  }
  v5 = [(VenuesStack *)self->_cardStack lastCardConformingToProtocol:&OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem];
  BOOL v4 = v5 != 0;

  return v4;
}

- (VenueCardCoordinatorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (VenueCardCoordinatorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cardStack, 0);
  objc_storeStrong((id *)&self->_cardFactory, 0);

  objc_destroyWeak((id *)&self->_actionCoordinator);
}

- (void)venuesStack:(id)a3 reorderedStackAndRemovedCardItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 allObjects];
  v9 = +[VenuesStack cards:v8 lastCardConformingToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem];
  if (v9)
  {
  }
  else
  {
    v10 = [v7 allObjects];
    v11 = +[VenuesStack cards:v10 lastCardConformingToProtocol:&OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem];

    if (!v11) {
      goto LABEL_7;
    }
  }
  v12 = [v6 allItems];
  v13 = [v12 lastObject];

  v14 = +[VenueCardCoordinator searchResultForPlaceCardItem:v13];
  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    v16 = [WeakRetained searchPinsManager];
    v33 = v14;
    v17 = +[NSArray arrayWithObjects:&v33 count:1];
    [v16 setSearchPins:v17 selectedPin:v14 animated:1];
  }
LABEL_7:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v7;
  id v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = -[VenueCardFactory existingViewControllerForCardItem:](self->_cardFactory, "existingViewControllerForCardItem:", *(void *)(*((void *)&v28 + 1) + 8 * (void)v22), (void)v28);
        id v24 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
        v25 = [v24 currentViewController];

        if (v23 != v25)
        {
          id v26 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
          v27 = [v26 containerViewController];
          [v27 removeControllerFromStack:v23];
        }
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v20);
  }
}

- (id)stateForNewCardItem:(id)a3 previousItemInStack:(id)a4 savePlaceCardSelectionState:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(VenueCardCoordinator *)self dataSource];
  v11 = [v10 mapSelectionStateForVenueCardItem:v9 savePlaceCardSelectionState:v5];

  v12 = [(VenueCardCoordinator *)self dataSource];
  v13 = [v12 searchFieldItemForVenueCardItem:v9 previousItemInStack:v8];

  v14 = [(VenueCardCoordinator *)self dataSource];
  v15 = [v14 searchInfoForVenueCardItem:v9 previousItemInStack:v8];

  v16 = +[VenueMapSearchState stateWithMapSelectionState:v11 searchFieldItem:v13 searchInfo:v15];

  return v16;
}

- (id)shareDelegateForCardFactory:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  BOOL v4 = [WeakRetained appCoordinator];

  return v4;
}

- (id)routePlanningOverviewViewControllerForCardFactory:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  BOOL v4 = [WeakRetained routePlanningOverviewViewController];

  return v4;
}

@end