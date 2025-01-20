@interface PDFamilyCircleManager
- (PDFamilyCircleManager)init;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addFamilyCircleRequest:(id)a3;
- (void)_executeNextRequestIfPossible;
- (void)_familyMembersWithCachePolicy:(unint64_t)a3 pendingMembers:(BOOL)a4 completion:(id)a5;
- (void)_handleFamilyUpdatedNotification:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)familyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)memberTypeForCurrentUserWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)pendingFamilyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation PDFamilyCircleManager

- (void)_executeNextRequestIfPossible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentRequest)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = [(NSMutableArray *)self->_fetchRequests firstObject];
    currentRequest = self->_currentRequest;
    self->_currentRequest = v4;

    v6 = self->_currentRequest;
    if (v6)
    {
      [(NSMutableArray *)self->_fetchRequests removeObjectAtIndex:0];
      v6 = self->_currentRequest;
    }
    v7 = v6;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100007EB8;
      v8[3] = &unk_10072E1E8;
      v8[4] = self;
      [(PDFamilyCircleRequest *)v7 executeRequestWithManager:self completion:v8];
    }
  }
}

- (void)_addFamilyCircleRequest:(id)a3
{
  v4 = (NSMutableArray *)a3;
  p_super = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Family request incoming %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_fetchRequests;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "coalesceWithRequest:", v4, (void)v12))
        {
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v17 = v4;
            __int16 v18 = 2112;
            v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Family member request request coalesced %@ onto existing request %@", buf, 0x16u);
          }

          p_super = &v4->super.super;
          goto LABEL_18;
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    [(NSMutableArray *)self->_fetchRequests addObject:v4];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Family member request queued %@", buf, 0xCu);
    }
    v6 = v4;
LABEL_18:
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_familyMembersWithCachePolicy:(unint64_t)a3 pendingMembers:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008E40;
  v16[3] = &unk_100736918;
  id v17 = a5;
  id v8 = v17;
  uint64_t v9 = objc_retainBlock(v16);
  v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"default";
    if (a3 == 1) {
      v11 = @"ignoreCache";
    }
    if (a3 == 2) {
      v11 = @"dontLoad";
    }
    long long v12 = v11;
    long long v13 = v12;
    CFStringRef v14 = @"NO";
    if (v5) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    __int16 v20 = 2112;
    CFStringRef v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Family members request cache policy: %@, pendingMembers: %@", buf, 0x16u);
  }
  long long v15 = objc_alloc_init(PDFamilyCircleMembersRequest);
  [(PDFamilyCircleMembersRequest *)v15 addCompletion:v9];
  [(PDFamilyCircleMembersRequest *)v15 setCachePolicy:a3];
  [(PDFamilyCircleMembersRequest *)v15 setPendingMembers:v5];
  [(PDFamilyCircleManager *)self _addFamilyCircleRequest:v15];
  [(PDFamilyCircleManager *)self _executeNextRequestIfPossible];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)familyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
}

- (PDFamilyCircleManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PDFamilyCircleManager;
  v2 = [(PDFamilyCircleManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fetchRequests = v2->_fetchRequests;
    v2->_fetchRequests = v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v7 = +[NSDistributedNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_handleFamilyUpdatedNotification:" name:FAFamilyUpdateNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDFamilyCircleManager;
  [(PDFamilyCircleManager *)&v4 dealloc];
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)pendingFamilyMembersWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v19 = a4;
  id v7 = dispatch_group_create();
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v12);
        dispatch_group_enter(v7);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100363D88;
        v24[3] = &unk_10074B0B0;
        id v25 = v8;
        uint64_t v26 = v13;
        v27 = v7;
        CFStringRef v14 = objc_retainBlock(v24);
        long long v15 = [[PDFamilyCircleMemberPhotoRequest alloc] initWithDSID:v13];
        [(PDFamilyCircleMemberPhotoRequest *)v15 addCompletion:v14];
        [(PDFamilyCircleManager *)self _addFamilyCircleRequest:v15];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  [(PDFamilyCircleManager *)self _executeNextRequestIfPossible];
  v16 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100363DCC;
  block[3] = &unk_10072E598;
  id v22 = v8;
  id v23 = v19;
  id v17 = v8;
  id v18 = v19;
  dispatch_group_notify(v7, v16, block);
}

- (void)memberTypeForCurrentUserWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100363FD4;
  v12[3] = &unk_100731B50;
  id v13 = a4;
  id v6 = v13;
  id v7 = objc_retainBlock(v12);
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"default";
    if (a3 == 1) {
      id v9 = @"ignoreCache";
    }
    if (a3 == 2) {
      id v9 = @"dontLoad";
    }
    id v10 = v9;
    *(_DWORD *)buf = 138412290;
    long long v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Family members type request incoming with cache policy: %@", buf, 0xCu);
  }
  uint64_t v11 = [[PDFamilyCircleMemberTypeRequest alloc] initWithCachePolicy:a3];
  [(PDFamilyCircleMemberTypeRequest *)v11 addCompletion:v7];
  [(PDFamilyCircleManager *)self _addFamilyCircleRequest:v11];
  [(PDFamilyCircleManager *)self _executeNextRequestIfPossible];
}

- (void)_handleFamilyUpdatedNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100364120;
  v3[3] = &unk_10074B0D8;
  v3[4] = self;
  [(PDFamilyCircleManager *)self _accessObserversWithHandler:v3];
}

- (void)_accessObserversWithHandler:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(p_lock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end