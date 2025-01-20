@interface VenueCardFactory
- (VenueCardFactory)init;
- (VenueCardFactory)initWithChangeNotifier:(id)a3;
- (VenueCardFactoryDelegate)delegate;
- (id)existingViewControllerForCardItem:(id)a3;
- (id)viewControllerForCardItem:(id)a3;
- (void)cardStack:(id)a3 didChangeStack:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation VenueCardFactory

- (VenueCardFactory)initWithChangeNotifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VenueCardFactory;
  v5 = [(VenueCardFactory *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_changeNotifier, v4);
    uint64_t v7 = +[NSMapTable weakToStrongObjectsMapTable];
    cardItemToViewControllerMapping = v6->_cardItemToViewControllerMapping;
    v6->_cardItemToViewControllerMapping = (NSMapTable *)v7;
  }
  return v6;
}

- (VenueCardFactory)init
{
  return 0;
}

- (id)viewControllerForCardItem:(id)a3
{
  id v4 = a3;
  if (![v4 isVenueItem])
  {
    v6 = 0;
    goto LABEL_19;
  }
  v5 = [(VenueCardFactory *)self existingViewControllerForCardItem:v4];
  if (!v5)
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___VenuePlaceCardItem])
    {
      v5 = objc_alloc_init(PlaceCardViewController);
LABEL_17:
      [(NSMapTable *)self->_cardItemToViewControllerMapping setObject:v5 forKey:v4];
      goto LABEL_18;
    }
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem])
    {
      id v7 = v4;
      v8 = [[VenueCategoryViewController alloc] initWithCategoryCardItem:v7];
    }
    else if ([v4 conformsToProtocol:&OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem])
    {
      id v7 = v4;
      v8 = [[VenueCategoryViewController alloc] initWithAutoCompleteCategoryCardItem:v7];
    }
    else
    {
      if ([v4 conformsToProtocol:&OBJC_PROTOCOL___VenueClusterCardItem])
      {
        v9 = [v4 venueLabelMarker];
        unsigned int v10 = [v9 isCluster];

        if (v10)
        {
          v11 = [(VenueCardFactory *)self delegate];
          id v7 = [v11 shareDelegateForCardFactory:self];

          v5 = [[SimpleResultsViewController alloc] initWithShareDelegate:v7];
          [(PlaceCardViewController *)v5 setIsPresentingVenueClusterResults:1];
LABEL_16:

          goto LABEL_17;
        }
      }
      if (![v4 conformsToProtocol:&OBJC_PROTOCOL___VenueRoutePlanningCardItem])
      {
        v5 = 0;
        goto LABEL_17;
      }
      id v7 = [(VenueCardFactory *)self delegate];
      v8 = [v7 routePlanningOverviewViewControllerForCardFactory:self];
    }
    v5 = (PlaceCardViewController *)v8;
    goto LABEL_16;
  }
LABEL_18:
  v6 = v5;

LABEL_19:

  return v6;
}

- (id)existingViewControllerForCardItem:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_cardItemToViewControllerMapping objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if ([v4 conformsToProtocol:&OBJC_PROTOCOL___VenueRoutePlanningCardItem])
  {
    v8 = [(VenueCardFactory *)self delegate];
    uint64_t v9 = [v8 routePlanningOverviewViewControllerForCardFactory:self];
LABEL_21:
    id v7 = (id)v9;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = [(NSMapTable *)self->_cardItemToViewControllerMapping keyEnumerator];
    id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(id *)(*((void *)&v20 + 1) + 8 * i);
          id v15 = v4;
          v16 = v15;
          if (v14 == v15)
          {

            id v14 = v16;
LABEL_20:
            uint64_t v9 = [(NSMapTable *)self->_cardItemToViewControllerMapping objectForKey:v14];
            goto LABEL_21;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (id v17 = [v14 venueCardID], v17 == objc_msgSend(v16, "venueCardID")))
          {
            id v18 = [v14 venueCardID];

            if (v18) {
              goto LABEL_20;
            }
          }
          else
          {
          }
        }
        id v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v7 = 0;
  }

  return v7;
}

- (void)cardStack:(id)a3 didChangeStack:(id)a4
{
  id v5 = a4;
  v6 = +[NSMutableSet set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(NSMapTable *)self->_cardItemToViewControllerMapping keyEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (([v5 containsObject:v12] & 1) == 0) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[NSMapTable removeObjectForKey:](self->_cardItemToViewControllerMapping, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), (void)v18);
      }
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (VenueCardFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VenueCardFactoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cardItemToViewControllerMapping, 0);

  objc_destroyWeak((id *)&self->_changeNotifier);
}

@end