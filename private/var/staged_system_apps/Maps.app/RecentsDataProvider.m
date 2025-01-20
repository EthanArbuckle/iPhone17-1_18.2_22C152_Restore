@interface RecentsDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)initialDataHasBeenLoaded;
- (GEOObserverHashTable)observers;
- (NSArray)recents;
- (RecentsDataProvider)init;
- (id)_recentsEngine;
- (void)_recentsDidChange:(id)a3;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)deleteAllRecentsWithCompletion:(id)a3;
- (void)deleteRecents:(id)a3 completion:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setInitialDataHasBeenLoaded:(BOOL)a3;
@end

@implementation RecentsDataProvider

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (RecentsDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)RecentsDataProvider;
  v2 = [(RecentsDataProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    recents = v2->_recents;
    v2->_recents = (NSArray *)&__NSArray0__struct;
  }
  return v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v5 = +[NSNotificationCenter defaultCenter];
    id v7 = v5;
    if (v3)
    {
      objc_super v6 = [(RecentsDataProvider *)self _recentsEngine];
      [v7 addObserver:self selector:"_recentsDidChange:" name:@"RecentsDidChangeNotification" object:v6];

      [(RecentsDataProvider *)self _updateAndNotifyObservers:0];
    }
    else
    {
      [v5 removeObserver:self];
    }
  }
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    objc_super v6 = [(RecentsDataProvider *)self _recentsEngine];
    uint64_t v7 = [v6 orderedRecents];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&self->_recents, v9);

    self->_hasInitialData = 1;
    v10 = sub_1000AA148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = NSStringFromSelector(a2);
      unsigned int v14 = [(NSArray *)self->_recents count];
      int v15 = 138412802;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      __int16 v19 = 1024;
      unsigned int v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@, # recents = %d", (uint8_t *)&v15, 0x1Cu);
    }
    if (v3) {
      [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
    }
  }
}

- (id)_recentsEngine
{
  return +[Recents sharedRecents];
}

- (NSArray)recents
{
  return self->_recents;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (BOOL)active
{
  return self->_active;
}

- (void)_recentsDidChange:(id)a3
{
  [(RecentsDataProvider *)self setInitialDataHasBeenLoaded:1];

  [(RecentsDataProvider *)self _updateAndNotifyObservers:1];
}

- (void)setInitialDataHasBeenLoaded:(BOOL)a3
{
  self->_initialDataHasBeenLoaded = a3;
}

- (void)deleteRecents:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = sub_1000AA148();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = NSStringFromSelector(a2);
    int v14 = 138412546;
    int v15 = v11;
    __int16 v16 = 2112;
    __int16 v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v14, 0x16u);
  }
  v13 = [(RecentsDataProvider *)self _recentsEngine];
  [v13 deleteRecents:v8 completion:v7];
}

- (void)deleteAllRecentsWithCompletion:(id)a3
{
  id v5 = a3;
  objc_super v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(RecentsDataProvider *)self _recentsEngine];
  [v10 deleteAllRecentsWithCompletion:v5];
}

- (BOOL)initialDataHasBeenLoaded
{
  return self->_initialDataHasBeenLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recents, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end