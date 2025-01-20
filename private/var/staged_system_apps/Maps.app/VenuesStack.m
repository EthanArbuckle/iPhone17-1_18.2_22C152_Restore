@interface VenuesStack
+ (id)cards:(id)a3 lastCardConformingToProtocol:(id)a4;
+ (id)cardsFromArray:(id)a3 passingTest:(id)a4 ascending:(BOOL)a5;
- (BOOL)canPushVenueCardItem:(id)a3;
- (NSArray)allItems;
- (VenuesStack)init;
- (VenuesStack)initWithCardDealer:(id)a3;
- (VenuesStackDataSource)dataSource;
- (VenuesStackDelegate)delegate;
- (id)lastCardConformingToProtocol:(id)a3;
- (unint64_t)pushVenueCardItem:(id)a3 withSource:(unint64_t)a4;
- (unint64_t)pushVenueCardItem:(id)a3 withSource:(unint64_t)a4 savePlaceCardSelectionState:(BOOL)a5;
- (unint64_t)venueIdForCurrentCardStack;
- (void)_notifyObserversStackDidChange;
- (void)addStackObserver:(id)a3;
- (void)clearStack;
- (void)popVenueCard:(id)a3;
- (void)removeStackObserver:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation VenuesStack

- (VenuesStack)initWithCardDealer:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VenuesStack;
  v6 = [(VenuesStack *)&v15 init];
  v7 = v6;
  if (v6)
  {
    cardStack = v6->_cardStack;
    v6->_cardStack = (NSArray *)&__NSArray0__struct;

    uint64_t v9 = +[NSMapTable weakToStrongObjectsMapTable];
    cardToPreviousStateMapping = v7->_cardToPreviousStateMapping;
    v7->_cardToPreviousStateMapping = (NSMapTable *)v9;

    objc_storeStrong((id *)&v7->_dealer, a3);
    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    stackObservers = v7->_stackObservers;
    v7->_stackObservers = (NSHashTable *)v11;

    stateFromBeforeTheStack = v7->_stateFromBeforeTheStack;
    v7->_stateFromBeforeTheStack = 0;

    objc_storeWeak((id *)&v7->_dataSource, 0);
  }

  return v7;
}

- (VenuesStack)init
{
  return 0;
}

- (NSArray)allItems
{
  return self->_cardStack;
}

- (unint64_t)pushVenueCardItem:(id)a3 withSource:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = -[VenuesStack pushVenueCardItem:withSource:savePlaceCardSelectionState:](self, "pushVenueCardItem:withSource:savePlaceCardSelectionState:", v6, a4, [v6 conformsToProtocol:&OBJC_PROTOCOL___VenuePlaceCardItem]);

  return v7;
}

- (unint64_t)pushVenueCardItem:(id)a3 withSource:(unint64_t)a4 savePlaceCardSelectionState:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(VenueCardDealer *)self->_dealer newHandFromExistingHand:self->_cardStack nextTopCard:v8 source:a4];
  if (v9 == self->_cardStack)
  {
    unint64_t v13 = 1;
  }
  else
  {
    v10 = [(VenueCardDealer *)self->_dealer existingCardForHand:v9 cardItem:v8];
    if (v10)
    {
      uint64_t v11 = [(NSArray *)v9 indexOfObject:v10];
      if (v11)
      {
        uint64_t v12 = [(NSArray *)v9 objectAtIndexedSubscript:v11 - 1];
      }
      else
      {
        uint64_t v12 = 0;
      }
      v14 = [(VenuesStack *)self dataSource];
      objc_super v15 = [v14 stateForNewCardItem:v10 previousItemInStack:v12 savePlaceCardSelectionState:v5];

      v16 = [(NSArray *)self->_cardStack lastObject];
      v28 = (void *)v12;
      if ([(NSArray *)v9 containsObject:v16])
      {
        [(NSMapTable *)self->_cardToPreviousStateMapping setObject:v15 forKey:v16];
      }
      else if (![(NSArray *)self->_cardStack count])
      {
        objc_storeStrong((id *)&self->_stateFromBeforeTheStack, v15);
      }
      v17 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_cardStack, v15);
      [v17 removeObjectsInArray:v9];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            [(NSMapTable *)self->_cardToPreviousStateMapping removeObjectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          }
          id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v20);
      }

      v23 = (NSArray *)[(NSArray *)v9 copy];
      cardStack = self->_cardStack;
      self->_cardStack = v23;

      if ([v18 count]
        && ([(VenuesStack *)self delegate],
            v25 = objc_claimAutoreleasedReturnValue(),
            [v25 venuesStack:self reorderedStackAndRemovedCardItems:v18],
            v25,
            a4 == 1))
      {
        unint64_t v13 = 3;
      }
      else
      {
        [(VenuesStack *)self _notifyObserversStackDidChange];
        unint64_t v13 = 2;
      }
    }
    else
    {
      unint64_t v13 = 0;
    }
  }
  return v13;
}

- (void)popVenueCard:(id)a3
{
  uint64_t v12 = (void (**)(id, void *, void *, VenueMapSearchState *))a3;
  v4 = [(NSArray *)self->_cardStack lastObject];
  if (v4)
  {
    NSUInteger v5 = [(NSArray *)self->_cardStack count];
    NSUInteger v6 = v5 - 1;
    if (v5 == 1)
    {
      id v8 = self->_stateFromBeforeTheStack;
      stateFromBeforeTheStack = self->_stateFromBeforeTheStack;
      self->_stateFromBeforeTheStack = 0;

      unint64_t v7 = 0;
    }
    else
    {
      unint64_t v7 = [(NSArray *)self->_cardStack objectAtIndexedSubscript:v5 - 2];
      id v8 = [(NSMapTable *)self->_cardToPreviousStateMapping objectForKey:v7];
      [(NSMapTable *)self->_cardToPreviousStateMapping removeObjectForKey:v7];
    }
    -[NSArray subarrayWithRange:](self->_cardStack, "subarrayWithRange:", 0, v6);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cardStack = self->_cardStack;
    self->_cardStack = v10;

    [(VenuesStack *)self _notifyObserversStackDidChange];
    if (v12) {
      v12[2](v12, v4, v7, v8);
    }
  }
  else if (v12)
  {
    v12[2](v12, 0, 0, 0);
  }
}

- (void)clearStack
{
  [(NSMapTable *)self->_cardToPreviousStateMapping removeAllObjects];
  cardStack = self->_cardStack;
  self->_cardStack = (NSArray *)&__NSArray0__struct;

  [(VenuesStack *)self _notifyObserversStackDidChange];
}

- (void)addStackObserver:(id)a3
{
}

- (void)removeStackObserver:(id)a3
{
}

- (BOOL)canPushVenueCardItem:(id)a3
{
  return [a3 isVenueItem];
}

- (unint64_t)venueIdForCurrentCardStack
{
  v2 = [(NSArray *)self->_cardStack firstObject];
  v3 = v2;
  if (v2) {
    id v4 = [v2 venueID];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (id)lastCardConformingToProtocol:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(id)objc_opt_class() cards:self->_cardStack lastCardConformingToProtocol:v4];

  return v5;
}

+ (id)cards:(id)a3 lastCardConformingToProtocol:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100ACAA64;
  v9[3] = &unk_101316BE8;
  id v10 = a4;
  id v6 = v10;
  unint64_t v7 = [a1 cardsFromArray:a3 passingTest:v9 ascending:0];

  return v7;
}

+ (id)cardsFromArray:(id)a3 passingTest:(id)a4 ascending:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100104320;
  id v20 = sub_100104A00;
  id v21 = 0;
  if (v5) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 2;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100ACABB8;
  v13[3] = &unk_101316C10;
  id v10 = v8;
  id v14 = v10;
  objc_super v15 = &v16;
  [v7 enumerateObjectsWithOptions:v9 usingBlock:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)_notifyObserversStackDidChange
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_stackObservers;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) cardStack:didChangeStack:self self->_cardStack (void)v8];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (VenuesStackDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (VenuesStackDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (VenuesStackDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VenuesStackDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stateFromBeforeTheStack, 0);
  objc_storeStrong((id *)&self->_stackObservers, 0);
  objc_storeStrong((id *)&self->_dealer, 0);
  objc_storeStrong((id *)&self->_cardToPreviousStateMapping, 0);

  objc_storeStrong((id *)&self->_cardStack, 0);
}

@end