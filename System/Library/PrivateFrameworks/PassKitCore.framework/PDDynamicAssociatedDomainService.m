@interface PDDynamicAssociatedDomainService
- (BOOL)_lock_haveDomainsChanged:(id)a3;
- (PDDynamicAssociatedDomainService)init;
- (id)_aasaFilesForDomains:(id)a3;
- (id)initDatabaseManager:(id)a3;
- (void)_processPendingUpdates;
- (void)_storeDomains:(id)a3;
- (void)setAdditionalAssociatedDomains:(id)a3 completion:(id)a4;
@end

@implementation PDDynamicAssociatedDomainService

- (PDDynamicAssociatedDomainService)init
{
  return 0;
}

- (id)initDatabaseManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDDynamicAssociatedDomainService;
  v6 = [(PDDynamicAssociatedDomainService *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passd.dynamicAssociatedDomainService.reply", 0);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingUpdates = v7->_pendingUpdates;
    v7->_pendingUpdates = v10;
  }
  return v7;
}

- (void)setAdditionalAssociatedDomains:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = objc_alloc_init(PendingDomainUpdate);
  [(PendingDomainUpdate *)v9 setDomains:v7];

  [(PendingDomainUpdate *)v9 setCompletion:v6];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_pendingUpdates addObject:v9];
  id v8 = [(NSMutableArray *)self->_pendingUpdates count];
  os_unfair_lock_unlock(&self->_lock);
  if (v8 == (id)1) {
    [(PDDynamicAssociatedDomainService *)self _processPendingUpdates];
  }
}

- (void)_processPendingUpdates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableArray *)self->_pendingUpdates firstObject];
  if (v4) {
    [(NSMutableArray *)self->_pendingUpdates removeObjectAtIndex:0];
  }
  id v5 = [v4 domains];
  unsigned __int8 v6 = [(PDDynamicAssociatedDomainService *)self _lock_haveDomainsChanged:v5];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10037C4E8;
    v16[3] = &unk_100732CB8;
    v16[4] = self;
    id v17 = v4;
    id v7 = objc_retainBlock(v16);
    if (v6)
    {
      id v8 = [(PDDynamicAssociatedDomainService *)self _aasaFilesForDomains:v5];
      v9 = +[NSSet setWithObject:PKServiceBundleIdentifier];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10037C610;
      v11[3] = &unk_10073C000;
      id v12 = v5;
      objc_super v13 = self;
      v14 = v7;
      +[_SWCServiceDetails setAdditionalServiceDetailsForApplicationIdentifiers:v9 usingContentsOfDictionary:v8 completionHandler:v11];
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDDynamicAssociatedDomainService: domains haven't changed", buf, 2u);
      }

      ((void (*)(void *, uint64_t, void))v7[2])(v7, 1, 0);
    }
  }
}

- (id)_aasaFilesForDomains:(id)a3
{
  id v3 = a3;
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v26 objects:v41 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v27;
    uint64_t v23 = PKServiceBundleIdentifier;
    *(void *)&long long v5 = 138412546;
    long long v21 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "patterns", v21);
        v11 = v10;
        if (v10 && [v10 count])
        {
          id v12 = objc_msgSend(v11, "pk_arrayByApplyingBlock:", &stru_10074BFE0);
          CFStringRef v39 = @"applinks";
          CFStringRef v37 = @"details";
          v34[0] = @"appID";
          v34[1] = @"alwaysEnabled";
          v35[0] = v23;
          v35[1] = &__kCFBooleanTrue;
          v35[2] = v12;
          v34[2] = @"components";
          objc_super v13 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
          v36 = v13;
          v14 = +[NSArray arrayWithObjects:&v36 count:1];
          v38 = v14;
          v15 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          v40 = v15;
          v16 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

          id v25 = 0;
          id v17 = +[NSJSONSerialization dataWithJSONObject:v16 options:8 error:&v25];
          id v18 = v25;
          if (v18 || !v17)
          {
            v19 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v31 = v16;
              __int16 v32 = 2112;
              id v33 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PDDynamicAssociatedDomainService: Unable to serialize associated domain dictionary %@. Error: %@", buf, 0x16u);
            }
          }
          else
          {
            v19 = [v9 host];
            [v22 setObject:v17 forKeyedSubscript:v19];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v41 count:16];
    }
    while (v6);
  }

  return v22;
}

- (void)_storeDomains:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(PDDatabaseManager *)self->_databaseManager insertDynamicAssociatedDomains:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_lock_haveDomainsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PDDatabaseManager *)self->_databaseManager dynamicAssociatedDomains];
  if ((v4 == 0) == (v5 != 0))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    id v6 = [objc_alloc((Class)NSSet) initWithArray:v4];
    id v7 = [objc_alloc((Class)NSSet) initWithArray:v5];
    int v8 = PKEqualObjects() ^ 1;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end