@interface HomeCuratedCollectionsTableViewCellModel
- (BOOL)isEqual:(id)a3;
- (GEOExploreGuides)exploreGuides;
- (GEOObserverHashTable)observers;
- (HomeCuratedCollectionsTableViewCellDelegate)delegate;
- (HomeCuratedCollectionsTableViewCellModel)initWithResultDataProvider:(id)a3 delegate:(id)a4;
- (HomeResultDataProvider)resultDataProvider;
- (MKCuratedCollectionsSyncCoordinator)syncCoordinator;
- (NSArray)curatedCollections;
- (unint64_t)hash;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
@end

@implementation HomeCuratedCollectionsTableViewCellModel

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeCuratedCollectionsTableViewCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(HomeCuratedCollectionsTableViewCellModel *)v6 resultDataProvider];
    v8 = v7;
    if (v7 == self->_resultDataProvider || -[HomeResultDataProvider isEqual:](v7, "isEqual:"))
    {
      id v9 = [(HomeCuratedCollectionsTableViewCellModel *)v6 delegate];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (v9 == WeakRetained) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = [v9 isEqual:WeakRetained];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeCuratedCollectionsTableViewCellModelObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (HomeCuratedCollectionsTableViewCellModel)initWithResultDataProvider:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HomeCuratedCollectionsTableViewCellModel;
  id v9 = [(HomeCuratedCollectionsTableViewCellModel *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultDataProvider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    unsigned __int8 v11 = [(HomeResultDataProvider *)v10->_resultDataProvider observers];
    [v11 registerObserver:v10];
  }
  return v10;
}

- (GEOExploreGuides)exploreGuides
{
  v2 = [(HomeResultDataProvider *)self->_resultDataProvider homeResult];
  v3 = [v2 exploreGuides];

  return (GEOExploreGuides *)v3;
}

- (HomeCuratedCollectionsTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HomeCuratedCollectionsTableViewCellDelegate *)WeakRetained;
}

- (NSArray)curatedCollections
{
  v2 = [(HomeResultDataProvider *)self->_resultDataProvider homeResult];
  v3 = [v2 curatedCollections];

  return (NSArray *)v3;
}

- (MKCuratedCollectionsSyncCoordinator)syncCoordinator
{
  return (MKCuratedCollectionsSyncCoordinator *)+[CuratedCollectionSyncManager sharedManager];
}

- (unint64_t)hash
{
  return (unint64_t)[(HomeResultDataProvider *)self->_resultDataProvider hash];
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
}

- (HomeResultDataProvider)resultDataProvider
{
  return self->_resultDataProvider;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultDataProvider, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end