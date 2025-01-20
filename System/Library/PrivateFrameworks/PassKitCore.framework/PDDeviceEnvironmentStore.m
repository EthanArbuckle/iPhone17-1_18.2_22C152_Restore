@interface PDDeviceEnvironmentStore
- (PDDeviceEnvironmentStore)initWithDatabaseManager:(id)a3;
- (id)fetchCurrentEnviroment;
- (void)notifyClients:(id)a3 currentEnvironment:(id)a4;
- (void)registerClient:(id)a3 withIdentifier:(int64_t)a4;
- (void)start;
@end

@implementation PDDeviceEnvironmentStore

- (PDDeviceEnvironmentStore)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDDeviceEnvironmentStore;
  v6 = [(PDDeviceEnvironmentStore *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clients = v7->_clients;
    v7->_clients = v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)registerClient:(id)a3 withIdentifier:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL didStart = self->_didStart;
    clients = self->_clients;
    v9 = +[NSNumber numberWithInteger:a4];
    v10 = [(NSMutableDictionary *)clients objectForKeyedSubscript:v9];

    if (v10)
    {
      +[NSException raise:NSInternalInconsistencyException format:@"don't register clients twice"];
    }
    else
    {
      objc_super v11 = self->_clients;
      v12 = +[NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)v11 setObject:v6 forKeyedSubscript:v12];
    }
    os_unfair_lock_unlock(&self->_lock);
    if (didStart)
    {
      v13 = +[NSNumber numberWithInteger:a4];
      v16 = v13;
      id v17 = v6;
      v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      v15 = [(PDDeviceEnvironmentStore *)self fetchCurrentEnviroment];
      [(PDDeviceEnvironmentStore *)self notifyClients:v14 currentEnvironment:v15];
    }
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"provide a non-null client"];
  }
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didStart) {
    +[NSException raise:NSInternalInconsistencyException format:@"don't start the store twice"];
  }
  id v5 = [(NSMutableDictionary *)self->_clients copy];
  self->_BOOL didStart = 1;
  os_unfair_lock_unlock(p_lock);
  v4 = [(PDDeviceEnvironmentStore *)self fetchCurrentEnviroment];
  [(PDDeviceEnvironmentStore *)self notifyClients:v5 currentEnvironment:v4];
}

- (void)notifyClients:(id)a3 currentEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = v6;
  id obj = [v6 allKeys];
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v21 = 0;
        id v14 = [v13 integerValue];
        v15 = [(PDDatabaseManager *)self->_databaseManager fetchDeviceEnviromentForClient:v14 andCompareToCurrentEnvironment:v7 didChange:&v21];
        if (v21)
        {
          v16 = [v8 objectForKeyedSubscript:v13];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1003A43C8;
          v18[3] = &unk_10072F7D0;
          v18[4] = self;
          id v19 = v7;
          id v20 = v14;
          [v16 environmentStore:self storedEnvironment:v15 differsFromCurrent:v19 commitBlock:v18];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (id)fetchCurrentEnviroment
{
  id v2 = objc_alloc((Class)PKDeviceEnvironment);
  v3 = PKCurrentRegion();
  v4 = +[NSLocale pk_deviceLanguage];
  id v5 = [v2 initWithCountryCode:v3 deviceLanguage:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end