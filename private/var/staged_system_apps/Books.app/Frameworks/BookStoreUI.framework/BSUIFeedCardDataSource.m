@interface BSUIFeedCardDataSource
- (BOOL)alwaysPresentNewCardSetForFeedOptions:(id)a3;
- (BSUIFeedCardDataSource)initWithFeedArray:(id)a3 syncLayoutController:(id)a4 options:(id)a5;
- (Class)cardNavigationControllerClass:(id)a3;
- (NSArray)cardArray;
- (NSDictionary)options;
- (NSString)identifier;
- (TUISyncLayoutController)syncLayoutController;
- (id)contentViewControllerForCardAtIndex:(int64_t)a3 cardContentScrollManager:(id)a4;
- (id)representedObjectForCardAtIndex:(int64_t)a3;
- (int64_t)_cardIndexForTarget:(id)a3 withKeyPath:(id)a4;
- (int64_t)cardIndexForFeedOptions:(id)a3;
- (int64_t)numberOfCards:(id)a3;
- (void)appendNewDataToExistingDataSource:(id)a3 cardStackViewController:(id)a4;
- (void)setCardArray:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation BSUIFeedCardDataSource

- (BSUIFeedCardDataSource)initWithFeedArray:(id)a3 syncLayoutController:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BSUIFeedCardDataSource;
  v11 = [(BSUIFeedCardDataSource *)&v17 init];
  if (v11)
  {
    v12 = (NSArray *)[v8 copy];
    cardArray = v11->_cardArray;
    v11->_cardArray = v12;

    objc_storeStrong((id *)&v11->_syncLayoutController, a4);
    v14 = (NSDictionary *)[v10 copy];
    options = v11->_options;
    v11->_options = v14;
  }
  return v11;
}

- (void)appendNewDataToExistingDataSource:(id)a3 cardStackViewController:(id)a4
{
  -[NSArray arrayByAddingObjectsFromArray:](self->_cardArray, "arrayByAddingObjectsFromArray:", a3, a4);
  self->_cardArray = (NSArray *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

- (int64_t)numberOfCards:(id)a3
{
  v3 = [(BSUIFeedCardDataSource *)self cardArray];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (NSString)identifier
{
  objc_opt_class();
  v3 = [(BSUIFeedCardDataSource *)self options];
  id v4 = [v3 objectForKeyedSubscript:BCCardStackIdentifierKey];
  v5 = BUDynamicCast();

  return (NSString *)v5;
}

- (int64_t)cardIndexForFeedOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"url"];
    int64_t v7 = [(BSUIFeedCardDataSource *)self _cardIndexForTarget:v6 withKeyPath:@"url"];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [v5 objectForKeyedSubscript:@"storeId"];
      int64_t v7 = [(BSUIFeedCardDataSource *)self _cardIndexForTarget:v8 withKeyPath:@"storeId"];

      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v9 = [v5 objectForKeyedSubscript:@"storeId"];
        int64_t v7 = [(BSUIFeedCardDataSource *)self _cardIndexForTarget:v9 withKeyPath:@"resource.@unionOfObjects.id"];

        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_opt_class();
          id v10 = [v5 objectForKeyedSubscript:@"resource"];
          v11 = BUDynamicCast();

          v12 = [v11 objectForKeyedSubscript:@"id"];
          int64_t v7 = [(BSUIFeedCardDataSource *)self _cardIndexForTarget:v12 withKeyPath:@"resource.@unionOfObjects.id"];
        }
      }
    }
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)alwaysPresentNewCardSetForFeedOptions:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"alwaysPresentNewCardSet"];

  v5 = BUDynamicCast();
  LOBYTE(v3) = [v5 BOOLValue];

  return (char)v3;
}

- (id)representedObjectForCardAtIndex:(int64_t)a3
{
  id v4 = [(BSUIFeedCardDataSource *)self cardArray];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)contentViewControllerForCardAtIndex:(int64_t)a3 cardContentScrollManager:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(BSUIFeedCardDataSource *)self cardArray];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  id v9 = [v8 objectForKeyedSubscript:@"isInCard"];

  if (!v9)
  {
    id v10 = [v8 mutableCopy];
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isInCard"];
    id v11 = [v10 copy];

    id v8 = v11;
  }
  v12 = [[BSUIFeedViewController alloc] initWithOptions:v8];
  [(BSUIFeedViewController *)v12 configureWithSyncLayoutController:self->_syncLayoutController];
  [(BSUIFeedViewController *)v12 setCardContentScrollManager:v6];

  [(BSUIFeedViewController *)v12 setOptions:1];
  v13 = [(BSUIFeedViewController *)v12 suspendUpdatesUntilContentExceedsHeightWithCompletion:0];
  [(BSUIFeedViewController *)v12 setAssertionForSuspendingLayoutUpdates:v13];

  return v12;
}

- (Class)cardNavigationControllerClass:(id)a3
{
  return (Class)objc_opt_class();
}

- (int64_t)_cardIndexForTarget:(id)a3 withKeyPath:(id)a4
{
  cardArray = self->_cardArray;
  id v6 = a3;
  int64_t v7 = [(NSArray *)cardArray valueForKeyPath:a4];
  id v8 = [v7 indexOfObject:v6];

  return (int64_t)v8;
}

- (NSArray)cardArray
{
  return self->_cardArray;
}

- (void)setCardArray:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (TUISyncLayoutController)syncLayoutController
{
  return self->_syncLayoutController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncLayoutController, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_cardArray, 0);
}

@end