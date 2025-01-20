@interface SWDatastoreManager
- (NSHashTable)observers;
- (SWDatastore)datastore;
- (SWDatastore)privateDatastore;
- (SWDatastoreManager)initWithLogger:(id)a3 documentStateProvider:(id)a4 datastoreSynchronizationManager:(id)a5;
- (SWDatastoreSynchronizationManager)datastoreSynchronizationManager;
- (SWDocumentStateProviding)documentStateProvider;
- (SWLogger)logger;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setPrivateDatastore:(id)a3;
- (void)updateDatastore:(id)a3 originatingSession:(id)a4 completion:(id)a5;
- (void)updateDatastore:(id)a3 originatingSession:(id)a4 forceUpdate:(BOOL)a5 completion:(id)a6;
@end

@implementation SWDatastoreManager

- (SWDatastoreManager)initWithLogger:(id)a3 documentStateProvider:(id)a4 datastoreSynchronizationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SWDatastoreManager;
  v12 = [(SWDatastoreManager *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_logger, a3);
    objc_storeStrong((id *)&v13->_documentStateProvider, a4);
    objc_storeStrong((id *)&v13->_datastoreSynchronizationManager, a5);
    uint64_t v14 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;
  }
  return v13;
}

- (SWDatastore)datastore
{
  privateDatastore = self->_privateDatastore;
  if (privateDatastore)
  {
    v3 = privateDatastore;
  }
  else
  {
    v3 = +[SWDatastore emptyDatastore];
  }
  return v3;
}

- (void)updateDatastore:(id)a3 originatingSession:(id)a4 completion:(id)a5
{
}

- (void)updateDatastore:(id)a3 originatingSession:(id)a4 forceUpdate:(BOOL)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(void))a6;
  if (a5 || v11 && ![(SWDatastore *)self->_privateDatastore isEqual:v11])
  {
    uint64_t v14 = [(SWDatastoreManager *)self logger];
    v15 = NSString;
    v16 = [v12 identifier];
    objc_super v17 = [v15 stringWithFormat:@"Processing datastore update message from session: %@", v16];
    [v14 log:v17];

    v18 = [(SWDatastoreManager *)self datastore];
    objc_storeStrong((id *)&self->_privateDatastore, a3);
    v19 = [(SWDatastoreManager *)self logger];
    v20 = [NSString stringWithFormat:@"Notifying observers and updating datastore to store"];
    [v19 log:v20];

    v21 = [(SWDatastoreManager *)self datastoreSynchronizationManager];
    [v21 synchronizeDatastore:v11 from:self previousDatastore:v18 originatingSession:v12 completion:v13];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = [(SWDatastoreManager *)self observers];
    v23 = [v22 allObjects];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v29;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v27++) datastoreManager:self didChangeFromDatastore:v18 toDatastore:v11 originatingSession:v12];
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v25);
    }
  }
  else if (v13)
  {
    v13[2](v13);
  }
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SWDatastoreManager *)self observers];
    [v5 addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SWDatastoreManager *)self observers];
    [v5 removeObject:v4];
  }
}

- (SWDatastore)privateDatastore
{
  return self->_privateDatastore;
}

- (void)setPrivateDatastore:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (SWDocumentStateProviding)documentStateProvider
{
  return self->_documentStateProvider;
}

- (SWDatastoreSynchronizationManager)datastoreSynchronizationManager
{
  return self->_datastoreSynchronizationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastoreSynchronizationManager, 0);
  objc_storeStrong((id *)&self->_documentStateProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_privateDatastore, 0);
}

@end