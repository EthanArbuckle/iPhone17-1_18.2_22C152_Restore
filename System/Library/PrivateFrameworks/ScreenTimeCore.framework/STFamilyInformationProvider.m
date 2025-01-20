@interface STFamilyInformationProvider
+ (id)_predicateForFetchingFamilyMemberMe;
+ (id)_predicateForFetchingFamilyMemberWithAppleID:(id)a3;
+ (id)_predicateForFetchingFamilyMemberWithDSID:(id)a3;
+ (id)_targetableMemberFromPrimitiveMember:(id)a3;
- (BOOL)validateAddressIsAllowed:(id)a3;
- (NSArray)queuedCompletionHandlers;
- (NSSet)cachedFamilyMembers;
- (STContactStorePrimitives)contactStorePrimitives;
- (STDeviceInformationPrimitives)deviceInformationPrimitives;
- (STFamilyCirclePrimitives)familyCirclePrimitives;
- (STFamilyInformationProvider)initWithFamilyCirclePrimitives:(id)a3 deviceInformationPrimitives:(id)a4 contactStorePrimitives:(id)a5;
- (STFamilyProvidingObserver)observer;
- (STMessageTransportMessageAddress)returnAddress;
- (atomic_flag)familyCircleCacheRefreshInProgress;
- (id)_fetchFamilyMemberWithPredicate:(id)a3;
- (id)_fetchFamilyMembersWithTimeout:(unint64_t)a3 forceServerCacheRefresh:(BOOL)a4 error:(id *)a5;
- (id)_refreshFamilyMemberCacheWithError:(id *)a3;
- (id)appleIDForUserDSID:(id)a3;
- (id)fetchNumberOfContactsForUserID:(id)a3;
- (id)fetchTargetableFamilyMembersWithError:(id *)a3;
- (id)userDSIDForAppleID:(id)a3;
- (os_unfair_lock_s)queuedCompletionHandlersLock;
- (void)_atomicallyFetchFamilyMembersForcingServerCacheRefresh:(BOOL)a3 completionHandler:(id)a4;
- (void)_fetchFamilyMembersForcingServerCacheRefresh:(BOOL)a3 completionHandler:(id)a4;
- (void)primitives:(id)a3 didFetchFamilyMembers:(id)a4 error:(id)a5;
- (void)setCachedFamilyMembers:(id)a3;
- (void)setFamilyCircleCacheRefreshInProgress:(atomic_flag)a3;
- (void)setObserver:(id)a3;
- (void)setQueuedCompletionHandlers:(id)a3;
- (void)setQueuedCompletionHandlersLock:(os_unfair_lock_s)a3;
@end

@implementation STFamilyInformationProvider

- (STFamilyInformationProvider)initWithFamilyCirclePrimitives:(id)a3 deviceInformationPrimitives:(id)a4 contactStorePrimitives:(id)a5
{
  v8 = (STFamilyCirclePrimitives *)a3;
  v9 = (STDeviceInformationPrimitives *)a4;
  v10 = (STContactStorePrimitives *)a5;
  v21.receiver = self;
  v21.super_class = (Class)STFamilyInformationProvider;
  v11 = [(STFamilyInformationProvider *)&v21 init];
  v11->_queuedCompletionHandlersLock._os_unfair_lock_opaque = 0;
  familyCirclePrimitives = v11->_familyCirclePrimitives;
  v11->_familyCirclePrimitives = v8;
  v13 = v8;

  [(STFamilyCirclePrimitives *)v11->_familyCirclePrimitives setDelegate:v11];
  deviceInformationPrimitives = v11->_deviceInformationPrimitives;
  v11->_deviceInformationPrimitives = v9;
  v15 = v9;

  contactStorePrimitives = v11->_contactStorePrimitives;
  v11->_contactStorePrimitives = v10;
  v17 = v10;

  uint64_t v18 = objc_opt_new();
  cachedFamilyMembers = v11->_cachedFamilyMembers;
  v11->_cachedFamilyMembers = (NSSet *)v18;

  return v11;
}

- (id)_fetchFamilyMembersWithTimeout:(unint64_t)a3 forceServerCacheRefresh:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100031590;
  v31 = sub_1000315A0;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100031590;
  v25 = sub_1000315A0;
  id v26 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000315A8;
  v17[3] = &unk_1002FC5A0;
  v19 = &v21;
  v20 = &v27;
  v9 = dispatch_semaphore_create(0);
  uint64_t v18 = v9;
  [(STFamilyInformationProvider *)self _atomicallyFetchFamilyMembersForcingServerCacheRefresh:v6 completionHandler:v17];
  dispatch_time_t v10 = dispatch_time(0, 1000000000 * a3);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v11 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10025E578();
    }

    id v12 = objc_alloc((Class)NSError);
    id v13 = [v12 initWithDomain:STErrorDomain code:31 userInfo:0];
    v14 = (void *)v28[5];
    v28[5] = (uint64_t)v13;
  }
  if (a5) {
    *a5 = (id) v28[5];
  }
  if (v28[5]) {
    id v15 = 0;
  }
  else {
    id v15 = (id)v22[5];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (void)_atomicallyFetchFamilyMembersForcingServerCacheRefresh:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = v6;
  if (atomic_exchange(&self->_familyCircleCacheRefreshInProgress._Value, 1u))
  {
    os_unfair_lock_lock(&self->_queuedCompletionHandlersLock);
    v8 = [(STFamilyInformationProvider *)self queuedCompletionHandlers];
    id v9 = [v8 mutableCopy];

    if (!v9) {
      id v9 = (id)objc_opt_new();
    }
    id v10 = objc_retainBlock(v7);
    [v9 addObject:v10];

    id v11 = [v9 copy];
    [(STFamilyInformationProvider *)self setQueuedCompletionHandlers:v11];

    os_unfair_lock_unlock(&self->_queuedCompletionHandlersLock);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100031788;
    v12[3] = &unk_1002FC5C8;
    v12[4] = self;
    id v13 = v6;
    [(STFamilyInformationProvider *)self _fetchFamilyMembersForcingServerCacheRefresh:v4 completionHandler:v12];
  }
}

- (void)_fetchFamilyMembersForcingServerCacheRefresh:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STFamilyInformationProvider *)self familyCirclePrimitives];
  [v7 fetchFamilyMembersForcingCacheRefresh:v4 completionHandler:v6];
}

- (id)_refreshFamilyMemberCacheWithError:(id *)a3
{
  id v10 = 0;
  v5 = [(STFamilyInformationProvider *)self _fetchFamilyMembersWithTimeout:60 forceServerCacheRefresh:0 error:&v10];
  id v6 = v10;
  if (!v5)
  {
    id v7 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10025E5AC((uint64_t)v6, v7);
    }

    if (a3 && v6) {
      *a3 = v6;
    }
    v5 = objc_opt_new();
  }
  id v8 = [v5 copy];
  [(STFamilyInformationProvider *)self setCachedFamilyMembers:v8];

  return v5;
}

+ (id)_predicateForFetchingFamilyMemberWithDSID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"dsid", a3];
}

+ (id)_predicateForFetchingFamilyMemberWithAppleID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"appleID", a3];
}

+ (id)_predicateForFetchingFamilyMemberMe
{
  return +[NSPredicate predicateWithFormat:@"%K == YES", @"isMe"];
}

- (id)_fetchFamilyMemberWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = [(STFamilyInformationProvider *)self cachedFamilyMembers];
  id v6 = [v5 filteredSetUsingPredicate:v4];
  id v7 = [v6 anyObject];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to find family member in cache. Attempting to fault in family member with cache refresh.", buf, 2u);
    }

    id v10 = [(STFamilyInformationProvider *)self cachedFamilyMembers];
    id v11 = [v10 copy];

    id v20 = 0;
    id v12 = [(STFamilyInformationProvider *)self _refreshFamilyMemberCacheWithError:&v20];
    id v13 = v20;
    if ([v11 isEqualToSet:v12])
    {
      id v14 = v13;
    }
    else
    {
      id v19 = v13;
      id v15 = [(STFamilyInformationProvider *)self fetchTargetableFamilyMembersWithError:&v19];
      id v14 = v19;

      if (v14 && [v14 code] == (id)31)
      {
        v16 = +[STLog familyInformationProvider];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Family cache refresh timed out.", buf, 2u);
        }
      }
      else
      {
        v16 = [(STFamilyInformationProvider *)self observer];
        [v16 familyProvider:self didUpdateTargetableFamilyMembers:v15];
      }
    }
    v17 = [v12 filteredSetUsingPredicate:v4];
    id v8 = [v17 anyObject];
  }
  return v8;
}

- (id)fetchTargetableFamilyMembersWithError:(id *)a3
{
  v5 = [(STFamilyInformationProvider *)self cachedFamilyMembers];
  if (![v5 count])
  {
    uint64_t v6 = [(STFamilyInformationProvider *)self _refreshFamilyMemberCacheWithError:a3];

    v5 = (void *)v6;
  }
  id v7 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v5 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[STFamilyInformationProvider _targetableMemberFromPrimitiveMember:](STFamilyInformationProvider, "_targetableMemberFromPrimitiveMember:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [v7 copy];
  return v14;
}

+ (id)_targetableMemberFromPrimitiveMember:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dsid];
  uint64_t v5 = [v3 altDSID];
  uint64_t v6 = (void *)v5;
  if (v4 && v5)
  {
    id v7 = (char *)[v3 memberType];
    if ((unint64_t)(v7 - 1) >= 3) {
      id v8 = 0;
    }
    else {
      id v8 = v7;
    }
    id v9 = [STTargetableFamilyMember alloc];
    id v10 = [v3 firstName];
    uint64_t v11 = -[STTargetableFamilyMember initWithDSID:altDSID:firstName:memberType:isSignedInMember:isParent:](v9, "initWithDSID:altDSID:firstName:memberType:isSignedInMember:isParent:", v4, v6, v10, v8, [v3 isMe], objc_msgSend(v3, "isParent"));
  }
  else
  {
    id v12 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10025E624((uint64_t)v3, v12);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)fetchNumberOfContactsForUserID:(id)a3
{
  id v4 = a3;
  [(STFamilyInformationProvider *)self cachedFamilyMembers];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "dsid", (void)v20);
        id v12 = [v4 dsid];
        unsigned __int8 v13 = [v11 isEqualToNumber:v12];

        if (v13)
        {
          long long v17 = [(STFamilyInformationProvider *)self contactStorePrimitives];
          long long v18 = [v10 opaqueMember];
          long long v16 = [v17 numberOfContactsForOpaqueFamilyMember:v18];

          id v15 = v5;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v14 = objc_alloc((Class)NSError);
  id v15 = [v14 initWithDomain:STErrorDomain code:11 userInfo:0];
  long long v16 = +[STResult failure:v15];
LABEL_11:

  return v16;
}

- (BOOL)validateAddressIsAllowed:(id)a3
{
  id v4 = +[STFamilyInformationProvider _predicateForFetchingFamilyMemberWithAppleID:a3];
  id v5 = [(STFamilyInformationProvider *)self _fetchFamilyMemberWithPredicate:v4];

  return v5 != 0;
}

- (STMessageTransportMessageAddress)returnAddress
{
  id v3 = +[STFamilyInformationProvider _predicateForFetchingFamilyMemberMe];
  id v4 = [(STFamilyInformationProvider *)self _fetchFamilyMemberWithPredicate:v3];

  if (v4)
  {
    id v5 = [STMessageTransportMessageAddress alloc];
    id v6 = [v4 dsid];
    id v7 = [(STFamilyInformationProvider *)self deviceInformationPrimitives];
    uint64_t v8 = [v7 deviceUUID];
    id v9 = [(STMessageTransportMessageAddress *)v5 initWithUserDSID:v6 deviceIdentifier:v8];
  }
  else
  {
    id v10 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10025E69C();
    }

    id v9 = 0;
  }

  return v9;
}

- (id)appleIDForUserDSID:(id)a3
{
  id v4 = +[STFamilyInformationProvider _predicateForFetchingFamilyMemberWithDSID:a3];
  id v5 = [(STFamilyInformationProvider *)self _fetchFamilyMemberWithPredicate:v4];

  if (v5)
  {
    id v6 = [v5 appleID];
    id v7 = [v6 copy];
  }
  else
  {
    uint64_t v8 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10025E6D0();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)userDSIDForAppleID:(id)a3
{
  id v4 = +[STFamilyInformationProvider _predicateForFetchingFamilyMemberWithAppleID:a3];
  id v5 = [(STFamilyInformationProvider *)self _fetchFamilyMemberWithPredicate:v4];

  if (v5)
  {
    id v6 = [v5 dsid];
    id v7 = [v6 copy];
  }
  else
  {
    uint64_t v8 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10025E704();
    }

    id v7 = 0;
  }

  return v7;
}

- (void)primitives:(id)a3 didFetchFamilyMembers:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    long long v16 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v10;
      long long v17 = "Family circle fetched empty family - error: %{public}@";
      long long v18 = v16;
      uint32_t v19 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
LABEL_12:

    long long v20 = objc_opt_new();
    [(STFamilyInformationProvider *)self setCachedFamilyMembers:v20];

    id v14 = [(STFamilyInformationProvider *)self observer];
    [v14 familyProviderDidLeaveFamily:self];
    goto LABEL_13;
  }
  if (![v9 count])
  {
    long long v16 = +[STLog familyInformationProvider];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v17 = "Family circle fetched empty family";
      long long v18 = v16;
      uint32_t v19 = 2;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v11 = [v9 copy];
  [(STFamilyInformationProvider *)self setCachedFamilyMembers:v11];

  id v21 = 0;
  id v12 = [(STFamilyInformationProvider *)self fetchTargetableFamilyMembersWithError:&v21];
  id v13 = v21;
  id v14 = v13;
  if (!v13 || [v13 code] != (id)31)
  {
    id v15 = [(STFamilyInformationProvider *)self observer];
    [v15 familyProvider:self didUpdateTargetableFamilyMembers:v12];
  }
LABEL_13:
}

- (STFamilyProvidingObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->observer);
  return (STFamilyProvidingObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (STFamilyCirclePrimitives)familyCirclePrimitives
{
  return (STFamilyCirclePrimitives *)objc_getProperty(self, a2, 24, 1);
}

- (STDeviceInformationPrimitives)deviceInformationPrimitives
{
  return (STDeviceInformationPrimitives *)objc_getProperty(self, a2, 32, 1);
}

- (STContactStorePrimitives)contactStorePrimitives
{
  return (STContactStorePrimitives *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)cachedFamilyMembers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedFamilyMembers:(id)a3
{
}

- (NSArray)queuedCompletionHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueuedCompletionHandlers:(id)a3
{
}

- (os_unfair_lock_s)queuedCompletionHandlersLock
{
  return self->_queuedCompletionHandlersLock;
}

- (void)setQueuedCompletionHandlersLock:(os_unfair_lock_s)a3
{
  self->_queuedCompletionHandlersLock = a3;
}

- (atomic_flag)familyCircleCacheRefreshInProgress
{
  return self->_familyCircleCacheRefreshInProgress;
}

- (void)setFamilyCircleCacheRefreshInProgress:(atomic_flag)a3
{
  self->_familyCircleCacheRefreshInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_cachedFamilyMembers, 0);
  objc_storeStrong((id *)&self->_contactStorePrimitives, 0);
  objc_storeStrong((id *)&self->_deviceInformationPrimitives, 0);
  objc_storeStrong((id *)&self->_familyCirclePrimitives, 0);
  objc_destroyWeak((id *)&self->observer);
}

@end