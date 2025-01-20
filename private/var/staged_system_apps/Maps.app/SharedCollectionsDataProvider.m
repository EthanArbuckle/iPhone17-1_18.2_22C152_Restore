@interface SharedCollectionsDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (GEOObserverHashTable)observers;
- (NSArray)sharedCollections;
- (SharedCollectionsDataProvider)init;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)addSharedCollection:(id)a3;
- (void)collectionHandlerContentUpdated:(id)a3;
- (void)collectionHandlerInfoUpdated:(id)a3;
- (void)removeSharedCollection:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation SharedCollectionsDataProvider

- (SharedCollectionsDataProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SharedCollectionsDataProvider;
  v2 = [(SharedCollectionsDataProvider *)&v8 init];
  v3 = v2;
  if (v2)
  {
    sharedCollections = v2->_sharedCollections;
    v2->_sharedCollections = (NSArray *)&__NSArray0__struct;

    uint64_t v5 = +[NSMutableArray array];
    mutableCollections = v3->_mutableCollections;
    v3->_mutableCollections = (NSMutableArray *)v5;
  }
  return v3;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(SharedCollectionsDataProvider *)self _updateAndNotifyObservers:0];
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    uint64_t v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    sub_1000AC254(self->_mutableCollections, &stru_1013161A8);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == self->_sharedCollections) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = -[NSArray isEqual:](v6, "isEqual:");
    }
    v9 = sub_1000AA148();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_opt_class();
      id v17 = v10;
      v11 = NSStringFromSelector(a2);
      v12 = sub_100097E28(v3);
      v13 = sub_100097E28(v8 ^ 1);
      unsigned int v14 = [(NSMutableArray *)self->_mutableCollections count];
      *(_DWORD *)buf = 138413570;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v13;
      __int16 v26 = 1024;
      unsigned int v27 = v14 - [(NSArray *)v7 count];
      __int16 v28 = 1024;
      unsigned int v29 = [(NSArray *)v7 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@%@, collectionDidChange = %@, # loading collections = %d, # loaded collections = %d", buf, 0x36u);
    }
    if ((v8 & 1) == 0)
    {
      v15 = (NSArray *)[(NSArray *)v7 copy];
      sharedCollections = self->_sharedCollections;
      self->_sharedCollections = v15;

      if (v3) {
        [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
      }
    }
  }
}

- (void)addSharedCollection:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_mutableCollections, "containsObject:") & 1) == 0)
  {
    [(NSMutableArray *)self->_mutableCollections addObject:v4];
    [v4 addObserver:self];
    [(SharedCollectionsDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)removeSharedCollection:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_mutableCollections, "containsObject:"))
  {
    [(NSMutableArray *)self->_mutableCollections removeObject:v4];
    [v4 removeObserver:self];
    [(SharedCollectionsDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)collectionHandlerInfoUpdated:(id)a3
{
}

- (void)collectionHandlerContentUpdated:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (NSArray)sharedCollections
{
  return self->_sharedCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedCollections, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_mutableCollections, 0);
}

@end