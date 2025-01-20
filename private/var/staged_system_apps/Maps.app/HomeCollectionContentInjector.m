@interface HomeCollectionContentInjector
- (ActionCoordination)actionCoordinator;
- (CollectionHandler)collection;
- (HomeCollectionContentInjector)initWithCollection:(id)a3;
- (HomeCollectionContentInjector)initWithCollection:(id)a3 selectedMapItem:(id)a4;
- (MKMapItem)selectedMapItem;
- (SearchResult)selectedSearchResult;
- (id)_searchResults;
- (id)updateContentInjection;
- (void)addContentToMapView;
- (void)collectionHandlerContentUpdated:(id)a3;
- (void)removeContentFromMapView;
- (void)setActionCoordinator:(id)a3;
- (void)setUpdateContentInjection:(id)a3;
@end

@implementation HomeCollectionContentInjector

- (HomeCollectionContentInjector)initWithCollection:(id)a3
{
  return [(HomeCollectionContentInjector *)self initWithCollection:a3 selectedMapItem:0];
}

- (HomeCollectionContentInjector)initWithCollection:(id)a3 selectedMapItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HomeCollectionContentInjector;
  v9 = [(HomeCollectionContentInjector *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    [(CollectionHandler *)v10->_collection addObserver:v10];
    objc_storeStrong((id *)&v10->_selectedMapItem, a4);
    if (v8)
    {
      v11 = [[SearchResult alloc] initWithMapItem:v8];
      selectedSearchResult = v10->_selectedSearchResult;
      v10->_selectedSearchResult = v11;
    }
  }

  return v10;
}

- (id)_searchResults
{
  v3 = +[NSMutableArray array];
  if ((id)[(CollectionHandler *)self->_collection contentType] == (id)1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(CollectionHandler *)self->_collection content];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [[SearchResult alloc] initWithMapItem:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          [v3 addObject:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  id v10 = [v3 copy];

  return v10;
}

- (void)addContentToMapView
{
  id v7 = [(HomeCollectionContentInjector *)self _searchResults];
  if ([v7 count])
  {
    v3 = +[SearchInfo searchInfoWithResults:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    id v5 = [WeakRetained searchPinsManager];
    id v6 = [(HomeCollectionContentInjector *)self selectedSearchResult];
    [v5 setCollectionsPinsFromSearchInfo:v3 scrollToResults:1 displayPlaceCardForResult:v6 animated:1];
  }
}

- (void)removeContentFromMapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  v2 = [WeakRetained searchPinsManager];
  [v2 clearCollectionPins];
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  updateContentInjection = (void (**)(id, HomeCollectionContentInjector *))self->_updateContentInjection;
  if (updateContentInjection) {
    updateContentInjection[2](updateContentInjection, self);
  }
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (MKMapItem)selectedMapItem
{
  return self->_selectedMapItem;
}

- (ActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (ActionCoordination *)WeakRetained;
}

- (void)setActionCoordinator:(id)a3
{
}

- (SearchResult)selectedSearchResult
{
  return self->_selectedSearchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSearchResult, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_selectedMapItem, 0);
  objc_storeStrong((id *)&self->_collection, 0);

  objc_storeStrong(&self->_updateContentInjection, 0);
}

@end