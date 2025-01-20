@interface CollectionEditSession
+ (id)collectionSessionWithSession:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isObjectSelected:(id)a3;
- (BOOL)suppressAnalytics;
- (CollectionEditSession)init;
- (CollectionEditSession)initWithCollection:(id)a3;
- (CollectionEditSessionProtocol)delegate;
- (CollectionHandler)collection;
- (NSMutableSet)selectedObjectSet;
- (id)analyticsHandler;
- (id)resultBlock;
- (int)analyticsTarget;
- (void)addSelectedObject:(id)a3;
- (void)addSelectedObjects:(id)a3;
- (void)clearSelectedobjects;
- (void)markAllSelected;
- (void)removeSelectedObject:(id)a3;
- (void)setAnalyticsHandler:(id)a3;
- (void)setAnalyticsTarget:(int)a3;
- (void)setCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResultBlock:(id)a3;
- (void)setSelectedObjectSet:(id)a3;
- (void)setSuppressAnalytics:(BOOL)a3;
@end

@implementation CollectionEditSession

- (CollectionEditSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)CollectionEditSession;
  result = [(CollectionEditSession *)&v3 init];
  if (result) {
    result->_analyticsTarget = 201;
  }
  return result;
}

- (CollectionEditSession)initWithCollection:(id)a3
{
  id v5 = a3;
  v6 = [(CollectionEditSession *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collection, a3);
  }

  return v7;
}

+ (id)collectionSessionWithSession:(id)a3
{
  objc_super v3 = (id *)a3;
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 5, v3[5]);
  id v5 = [v3[4] mutableCopy];
  id v6 = v4[4];
  v4[4] = v5;

  *((unsigned char *)v4 + 8) = *((unsigned char *)v3 + 8);
  *((_DWORD *)v4 + 3) = *((_DWORD *)v3 + 3);
  id v7 = [v3[3] copy];
  id v8 = v4[3];
  v4[3] = v7;

  id WeakRetained = objc_loadWeakRetained(v3 + 2);
  objc_storeWeak(v4 + 2, WeakRetained);

  return v4;
}

- (void)clearSelectedobjects
{
  [(NSMutableSet *)self->_selectedObjectSet removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained collectionEditSessionUpdated:self];
}

- (NSMutableSet)selectedObjectSet
{
  selectedObjectSet = self->_selectedObjectSet;
  if (!selectedObjectSet)
  {
    v4 = +[NSMutableSet set];
    id v5 = self->_selectedObjectSet;
    self->_selectedObjectSet = v4;

    selectedObjectSet = self->_selectedObjectSet;
  }

  return selectedObjectSet;
}

- (BOOL)isEmpty
{
  v2 = [(CollectionEditSession *)self selectedObjectSet];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isObjectSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionEditSession *)self selectedObjectSet];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)addSelectedObject:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
  {
    id WeakRetained = sub_1000B944C();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v6 = [(CollectionEditSession *)self collection];
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Attempting to add an object to an unsupported collection. Cannot add %@ to %@", (uint8_t *)&v8, 0x16u);
    }
    goto LABEL_6;
  }
  if (v4)
  {
    id v7 = [(CollectionEditSession *)self selectedObjectSet];
    [v7 addObject:v4];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained collectionEditSessionUpdated:self];
LABEL_6:
  }
}

- (void)addSelectedObjects:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine, (void)v14))
        {
          v12 = sub_1000B944C();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = [(CollectionEditSession *)self collection];
            *(_DWORD *)buf = 138412546;
            v19 = v9;
            __int16 v20 = 2112;
            v21 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Attempting to add an object to an unsupported collection. Cannot add %@ to %@", buf, 0x16u);
          }
          id WeakRetained = v4;
          goto LABEL_14;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if ([v4 count])
  {
    __int16 v10 = [(CollectionEditSession *)self selectedObjectSet];
    [v10 addObjectsFromArray:v4];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained collectionEditSessionUpdated:self];
LABEL_14:
  }
}

- (void)removeSelectedObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CollectionEditSession *)self selectedObjectSet];
    [v5 removeObject:v4];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained collectionEditSessionUpdated:self];
  }
}

- (void)markAllSelected
{
  BOOL v3 = [(CollectionHandler *)self->_collection content];
  id v4 = +[NSMutableSet setWithArray:v3];
  [(CollectionEditSession *)self setSelectedObjectSet:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained collectionEditSessionUpdated:self];
}

- (CollectionEditSessionProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CollectionEditSessionProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
}

- (void)setSelectedObjectSet:(id)a3
{
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (BOOL)suppressAnalytics
{
  return self->_suppressAnalytics;
}

- (void)setSuppressAnalytics:(BOOL)a3
{
  self->_suppressAnalytics = a3;
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (id)analyticsHandler
{
  return self->_analyticsHandler;
}

- (void)setAnalyticsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyticsHandler, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_selectedObjectSet, 0);
  objc_storeStrong(&self->_resultBlock, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end