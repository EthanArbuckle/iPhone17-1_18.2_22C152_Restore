@interface ICDMediaUserStateCenterServer
- (BOOL)_locked_userStatesChanged:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDMediaUserStateCenterServer)init;
- (ICDMediaUserStateCenterServerNotificationsManager)serverNotificationsManager;
- (NSArray)userStatesCache;
- (NSMutableArray)activeConnections;
- (id)_getUserIdentitiesfromDefaultStore;
- (id)_sanitizedUserStatesForRemoteClientConnection:(id)a3;
- (id)_storeRequestContextFromUserIdentity:(id)a3;
- (id)_updatedUserStateFromState:(id)a3 withUserProfile:(id)a4;
- (unint64_t)_userStateAccessForConnection:(id)a3;
- (void)_buildUserStateFromUserIdentity:(id)a3 storeRequestContext:(id)a4 tokensDictionary:(id)a5 ignoreResponseCache:(BOOL)a6 completion:(id)a7;
- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 completion:(id)a4;
- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 ignoreResponseCache:(BOOL)a4 completion:(id)a5;
- (void)_fetchUpdatedUserProfilesForUserStates:(id)a3 completion:(id)a4;
- (void)_getTokenStatusesForDSIDs:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5;
- (void)_getUserStateFromIdentity:(id)a3 tokensDictionary:(id)a4 ignoreResponseCache:(BOOL)a5 completion:(id)a6;
- (void)_notifyServerStateUpdatedIfNeeded:(id)a3;
- (void)getCachedUserStatesWithReply:(id)a3;
- (void)getUserStatesForcingRefresh:(BOOL)a3 withReply:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveNotificationChangingUserState:(id)a4;
- (void)refreshSocialProfilesWithReply:(id)a3;
- (void)setActiveConnections:(id)a3;
- (void)start;
- (void)stop;
- (void)updateUserProfile:(id)a3 forRequestContext:(id)a4;
@end

@implementation ICDMediaUserStateCenterServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_serverNotificationsManager, 0);
  objc_storeStrong((id *)&self->_pendingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_cachedUserStateByDSID, 0);
  objc_storeStrong((id *)&self->_userSocialProfileProvider, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setActiveConnections:(id)a3
{
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (ICDMediaUserStateCenterServerNotificationsManager)serverNotificationsManager
{
  return self->_serverNotificationsManager;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL hasStarted = self->_hasStarted;
  os_unfair_lock_unlock(&self->_lock);
  if (hasStarted
    && [(ICDMediaUserStateCenterServer *)self _userStateAccessForConnection:v5] == -1)
  {
    if (!objc_msgSend(v5, "icd_isConnectionAllowedForService:", 5)) {
      goto LABEL_4;
    }
    unsigned int v9 = [v5 processIdentifier];
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICMediaUserStateCenterServerProtocol];
    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    [v8 setClasses:v11 forSelector:"getUserStatesForcingRefresh:withReply:" argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004E6A8;
    v16[3] = &unk_1001BEE28;
    v16[4] = self;
    unsigned int v17 = v9;
    [v5 setInvalidationHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004E76C;
    v14[3] = &unk_1001BEE28;
    v14[4] = self;
    unsigned int v15 = v9;
    [v5 setInterruptionHandler:v14];
    [v5 resume];
    v12 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = self;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepted new client connection: %{public}@.", buf, 0x16u);
    }

    BOOL v7 = 1;
LABEL_12:

    goto LABEL_13;
  }
  if (![(ICDMediaUserStateCenterServer *)self _userStateAccessForConnection:v5])
  {
    v8 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = self;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Refused new client connection: %{public}@. Entitlements error.", buf, 0x16u);
    }
    BOOL v7 = 0;
    goto LABEL_12;
  }
LABEL_4:
  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (unint64_t)_userStateAccessForConnection:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.itunescloudd.private"];
  if (v3) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_updatedUserStateFromState:(id)a3 withUserProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 music], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    unsigned int v9 = [v6 music];
    id v10 = [v9 userProfile];
    if (v10 == v7)
    {
    }
    else
    {
      v11 = v10;
      unsigned __int8 v12 = [v10 isEqual:v7];

      if ((v12 & 1) == 0)
      {
        v13 = [v6 music];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10004EB20;
        v25[3] = &unk_1001BACA8;
        id v26 = v7;
        id v14 = [v13 copyWithBlock:v25];

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10004EB2C;
        v23[3] = &unk_1001BAC80;
        id v24 = v14;
        id v15 = v14;
        id v16 = [v6 copyWithBlock:v23];

        goto LABEL_13;
      }
    }
    unsigned int v17 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      v18 = "%{public}@ User profile unchanged. Returning state.";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      uint32_t v21 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v17 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v28 = self;
      __int16 v29 = 2114;
      id v30 = v6;
      v18 = "%{public}@ cannot update state. Unexpected nil ICMusicUserState for mediaUserState=%{public}@";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
    }
  }

  id v16 = v6;
LABEL_13:

  return v16;
}

- (id)_storeRequestContextFromUserIdentity:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)ICStoreRequestContext);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004EBF4;
  v8[3] = &unk_1001BE6B0;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 initWithBlock:v8];

  return v6;
}

- (id)_sanitizedUserStatesForRemoteClientConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDMediaUserStateCenterServer *)self userStatesCache];
  id v6 = [v4 valueForEntitlement:ICMediaUserStateCenterEntitlementSiri];

  if (v4 && !v6)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      __int16 v14 = 1024;
      int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Sanitizing user state for client connection %{public}@. hasSiriDataEntitlement=%{BOOL}u", (uint8_t *)&v10, 0x1Cu);
    }

    uint64_t v8 = objc_msgSend(v5, "msv_map:", &stru_1001BAC18);

    id v5 = (void *)v8;
  }

  return v5;
}

- (BOOL)_locked_userStatesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5 == (id)[(NSDictionary *)self->_cachedUserStateByDSID count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          cachedUserStateByDSID = self->_cachedUserStateByDSID;
          id v13 = objc_msgSend(v11, "dsid", (void)v17);
          __int16 v14 = [(NSDictionary *)cachedUserStateByDSID objectForKeyedSubscript:v13];

          LODWORD(v11) = [v14 isEqual:v11];
          if (!v11)
          {
            BOOL v15 = 1;
            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 0;
LABEL_13:
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (id)_getUserIdentitiesfromDefaultStore
{
  id v3 = +[ICUserIdentityStore defaultIdentityStore];
  id v9 = 0;
  id v4 = [v3 userIdentitiesForManageableAccountsWithError:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = self;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch user state identities, err=%{public}@", buf, 0x16u);
    }

    id v7 = &__NSArray0__struct;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (void)_getUserStateFromIdentity:(id)a3 tokensDictionary:(id)a4 ignoreResponseCache:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(ICDMediaUserStateCenterServer *)self _storeRequestContextFromUserIdentity:v10];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004F2D0;
  v16[3] = &unk_1001BABD8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  [(ICDMediaUserStateCenterServer *)self _buildUserStateFromUserIdentity:v15 storeRequestContext:v13 tokensDictionary:v12 ignoreResponseCache:v7 completion:v16];
}

- (void)_getTokenStatusesForDSIDs:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v17) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ _getTokenStatusesForDSIDs:%{public}@, forceRefresh: %{BOOL}u", buf, 0x1Cu);
  }

  id v11 = +[ICLibraryAuthServiceClientTokenProvider sharedProvider];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v17 = sub_10004FC50;
  id v18 = sub_10004FC60;
  id v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004FC68;
  v13[3] = &unk_1001BABB0;
  v13[4] = self;
  id v12 = v9;
  id v14 = v12;
  id v15 = buf;
  [v11 getTokenStatusForDSIDs:v8 forcingRefresh:v6 completion:v13];

  _Block_object_dispose(buf, 8);
}

- (void)_fetchUpdatedUserProfilesForUserStates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  BOOL v7 = [(ICDMediaUserStateCenterServer *)self _getUserIdentitiesfromDefaultStore];
  id v24 = [v6 mutableCopy];
  id v8 = dispatch_group_create();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v14 = [(ICDMediaUserStateCenterServer *)self _storeRequestContextFromUserIdentity:v13];
        id v15 = [v13 DSID];
        id v16 = [v6 objectForKeyedSubscript:v15];

        if (v16
          && ([v16 music], id v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
        {
          dispatch_group_enter(v8);
          userSocialProfileProvider = self->_userSocialProfileProvider;
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000504FC;
          v29[3] = &unk_1001BAB10;
          v29[4] = self;
          id v30 = v24;
          v31 = v13;
          id v32 = v16;
          v33 = v8;
          [(ICDMusicUserSocialProfileProvider *)userSocialProfileProvider fetchMusicUserProfileWithStoreRequestContext:v14 ignoreCache:1 completion:v29];
        }
        else
        {
          id v19 = os_log_create("com.apple.amp.itunescloudd", "UserState");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543619;
            v39 = self;
            __int16 v40 = 2113;
            v41 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@ No ICMusicUserState for userIdentity=%{private}@ Returning cached userState.", buf, 0x16u);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v10);
  }

  long long v20 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050740;
  block[3] = &unk_1001BEC48;
  id v27 = v24;
  id v28 = v23;
  id v21 = v24;
  id v22 = v23;
  dispatch_group_notify(v8, v20, block);
}

- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 ignoreResponseCache:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    long long v35 = self;
    __int16 v36 = 1024;
    *(_DWORD *)long long v37 = v6;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _fetchAccountsWithForceRefresh: %{BOOL}u ignoreResponseCache:%{BOOL}u", buf, 0x18u);
  }

  id v10 = [(ICDMediaUserStateCenterServer *)self _getUserIdentitiesfromDefaultStore];
  if ([v10 count])
  {
    os_unfair_lock_lock(&self->_lock);
    id v11 = [(NSMutableArray *)self->_pendingCompletionHandlers count];
    if (v11)
    {
      id v12 = v11;
      self->_coalescedIgnoreCacheValue |= v5;
      self->_coalescedForceRefreshValue |= v6;
      pendingCompletionHandlers = self->_pendingCompletionHandlers;
      id v14 = objc_retainBlock(v8);
      [(NSMutableArray *)pendingCompletionHandlers addObject:v14];

      os_unfair_lock_unlock(&self->_lock);
      id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        long long v35 = self;
        __int16 v36 = 2048;
        *(void *)long long v37 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ userState account fetch in-flight with %lu pending completions. Coalescing request.", buf, 0x16u);
      }
    }
    else
    {
      id v17 = self->_pendingCompletionHandlers;
      id v18 = objc_retainBlock(v8);
      [(NSMutableArray *)v17 addObject:v18];

      os_unfair_lock_unlock(&self->_lock);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100050B78;
      v31[3] = &unk_1001BAA58;
      v31[4] = self;
      BOOL v32 = v6;
      BOOL v33 = v5;
      id v19 = objc_retainBlock(v31);
      long long v20 = objc_msgSend(v10, "msv_map:", &stru_1001BAA98);
      id v21 = +[NSSet setWithArray:v20];

      id v22 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100050DE0;
      v25[3] = &unk_1001BAAE8;
      id v29 = v19;
      id v26 = v10;
      id v27 = self;
      BOOL v30 = v5;
      id v28 = v22;
      id v23 = v22;
      id v24 = v19;
      [(ICDMediaUserStateCenterServer *)self _getTokenStatusesForDSIDs:v21 forceRefresh:v6 completion:v25];
    }
  }
  else
  {
    id v16 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v35 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@ No user identities are found.", buf, 0xCu);
    }

    (*((void (**)(id, void *, void))v8 + 2))(v8, &__NSArray0__struct, 0);
  }
}

- (void)_fetchAccountsWithForceRefresh:(BOOL)a3 completion:(id)a4
{
}

- (void)_buildUserStateFromUserIdentity:(id)a3 storeRequestContext:(id)a4 tokensDictionary:(id)a5 ignoreResponseCache:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v36 = a5;
  id v14 = (void (**)(id, void, id))a7;
  id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ _buildUserStateFromUserIdentity: building userState for userIdentity=%{public}@", buf, 0x16u);
  }

  group = dispatch_group_create();
  v39 = +[ICUserIdentityStore defaultIdentityStore];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v86 = sub_10004FC50;
  v87 = sub_10004FC60;
  id v88 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = sub_10004FC50;
  v78[4] = sub_10004FC60;
  id v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = sub_10004FC50;
  v76[4] = sub_10004FC60;
  id v77 = 0;
  id v75 = 0;
  long long v37 = [v39 getPropertiesForUserIdentity:v12 error:&v75];
  id v16 = v75;
  if (v16)
  {
    v14[2](v14, 0, v16);
  }
  else
  {
    id v17 = +[ICAgeVerificationManager defaultManager];
    id v18 = [v17 ageVerificationStateForUserIdentity:v12];
    BOOL v34 = [v18 status] == (id)2;

    dispatch_group_enter(group);
    id v35 = [objc_alloc((Class)ICMusicSubscriptionStatusRequest) initWithStoreRequestContext:v13];
    id v19 = +[ICMusicSubscriptionStatusController sharedStatusController];
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100051B44;
    v69[3] = &unk_1001BA888;
    v69[4] = self;
    id v20 = v13;
    id v70 = v20;
    v72 = buf;
    v73 = v76;
    id v21 = group;
    v71 = v21;
    v74 = v78;
    [v19 performSubscriptionStatusRequest:v35 withCompletionHandler:v69];

    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = sub_10004FC50;
    v67[4] = sub_10004FC60;
    id v68 = 0;
    dispatch_group_enter(v21);
    userSocialProfileProvider = self->_userSocialProfileProvider;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100051E84;
    v63[3] = &unk_1001BA8B0;
    v63[4] = self;
    id v23 = v20;
    id v64 = v23;
    v66 = v67;
    id v24 = v21;
    v65 = v24;
    [(ICDMusicUserSocialProfileProvider *)userSocialProfileProvider fetchMusicUserProfileWithStoreRequestContext:v23 ignoreCache:v8 completion:v63];
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = sub_10004FC50;
    v61[4] = sub_10004FC60;
    id v62 = 0;
    dispatch_group_enter(v24);
    v25 = +[ICURLBagProvider sharedBagProvider];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000520BC;
    v58[3] = &unk_1001BA8D8;
    v58[4] = self;
    v60 = v61;
    id v26 = v24;
    v59 = v26;
    [v25 getBagForRequestContext:v23 withCompletionHandler:v58];

    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    char v57 = 0;
    if ([v37 isActive] && (MSVDeviceIsAudioAccessory() & 1) == 0)
    {
      uint64_t v81 = 0;
      v82 = &v81;
      uint64_t v83 = 0x2050000000;
      id v27 = (void *)qword_1001F3830;
      uint64_t v84 = qword_1001F3830;
      if (!qword_1001F3830)
      {
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_1000521D0;
        v80[3] = &unk_1001BE9E8;
        v80[4] = &v81;
        sub_1000521D0((uint64_t)v80);
        id v27 = (void *)v82[3];
      }
      id v28 = v27;
      _Block_object_dispose(&v81, 8);
      id v29 = [v28 sharedInstance];
      BOOL v30 = [v29 storedConfiguration];

      if (v30)
      {
        unsigned __int8 v31 = [v30 activeUser];
        *((unsigned char *)v55 + 24) = v31;
      }
      else if (sub_100052298())
      {
        dispatch_group_enter(v26);
        BOOL v32 = [sub_100052298() sharedInstance];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_10005237C;
        v51[3] = &unk_1001BA900;
        v53 = &v54;
        v52 = v26;
        [v32 fetchConfigurationWithCompletionHandler:v51];
      }
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000523C4;
    block[3] = &unk_1001BAA08;
    id v41 = v37;
    v44 = v61;
    BOOL v50 = v34;
    v45 = v78;
    v46 = v76;
    id v42 = v36;
    v47 = v67;
    v48 = &v54;
    v43 = v14;
    v49 = buf;
    dispatch_group_notify(v26, queue, block);

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(v61, 8);

    _Block_object_dispose(v67, 8);
  }

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_notifyServerStateUpdatedIfNeeded:(id)a3
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100054490;
  v22[3] = &unk_1001BA818;
  id v4 = a3;
  id v23 = v4;
  BOOL v5 = objc_msgSend(v4, "msv_filter:", v22);
  os_unfair_lock_lock(&self->_lock);
  if ([(ICDMediaUserStateCenterServer *)self _locked_userStatesChanged:v5])
  {
    BOOL v6 = +[NSMutableDictionary dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v13 = [v12 dsid];
          [(NSDictionary *)v6 setObject:v12 forKeyedSubscript:v13];
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v9);
    }

    cachedUserStateByDSID = self->_cachedUserStateByDSID;
    self->_cachedUserStateByDSID = v6;

    os_unfair_lock_unlock(&self->_lock);
    id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ User states changed - posting notification", buf, 0xCu);
    }

    id v16 = dispatch_get_global_queue(0, 0);
    dispatch_async(v16, &stru_1001BA838);
    BOOL v5 = v17;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v16 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ No change in user state detected", buf, 0xCu);
    }
  }
}

- (void)updateUserProfile:(id)a3 forRequestContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSDictionary *)self->_cachedUserStateByDSID mutableCopy];
  os_unfair_lock_unlock(&self->_lock);
  id v9 = [v7 identity];

  uint64_t v10 = [v9 DSID];

  id v11 = [v8 objectForKeyedSubscript:v10];
  id v12 = v11;
  if (v11 && ([v11 music], id v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    id v14 = [(ICDMediaUserStateCenterServer *)self _updatedUserStateFromState:v12 withUserProfile:v6];
    [v8 setObject:v14 forKeyedSubscript:v10];

    id v15 = [v8 allValues];
    [(ICDMediaUserStateCenterServer *)self _notifyServerStateUpdatedIfNeeded:v15];
  }
  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      long long v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ updateUserProfile:forRequestContext: unexpected nil ICMusicUserState for cachedUserState=%{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)notificationsManager:(id)a3 didReceiveNotificationChangingUserState:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100054794;
  v4[3] = &unk_1001BE1C0;
  v4[4] = self;
  [(ICDMediaUserStateCenterServer *)self _fetchAccountsWithForceRefresh:0 completion:v4];
}

- (void)stop
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping server:", (uint8_t *)&v5, 0xCu);
  }

  serverNotificationsManager = self->_serverNotificationsManager;
  self->_serverNotificationsManager = 0;
}

- (void)start
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting server:", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [[ICDMediaUserStateCenterServerNotificationsManager alloc] initWithDelegate:self];
  serverNotificationsManager = self->_serverNotificationsManager;
  self->_serverNotificationsManager = v4;

  os_unfair_lock_lock(&self->_lock);
  self->_BOOL hasStarted = 1;
  os_unfair_lock_unlock(&self->_lock);
  [(ICDMediaUserStateCenterServer *)self getUserStatesForcingRefresh:0 withReply:&stru_1001BA7F0];
}

- (void)refreshSocialProfilesWithReply:(id)a3
{
  id v4 = a3;
  int v5 = +[NSXPCConnection currentConnection];
  int v6 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v21 = self;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ refreshSocialProfilesWithReply: Received request for social profile refresh from client connection %{public}@.", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSDictionary *)self->_cachedUserStateByDSID copy];
  os_unfair_lock_unlock(&self->_lock);
  if ([v7 count])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100054C50;
    v17[3] = &unk_1001BA7B0;
    id v8 = &v18;
    v17[4] = self;
    __int16 v18 = v5;
    id v9 = &v19;
    id v19 = v4;
    id v10 = v4;
    id v11 = v5;
    [(ICDMediaUserStateCenterServer *)self _fetchUpdatedUserProfilesForUserStates:v7 completion:v17];
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100054D58;
    v14[3] = &unk_1001BA788;
    id v8 = &v16;
    id v15 = v5;
    id v16 = v4;
    id v9 = &v15;
    v14[4] = self;
    id v12 = v4;
    id v13 = v5;
    [(ICDMediaUserStateCenterServer *)self _fetchAccountsWithForceRefresh:1 ignoreResponseCache:1 completion:v14];
  }
}

- (void)getUserStatesForcingRefresh:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[NSXPCConnection currentConnection];
  id v8 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 1024;
    LODWORD(v21) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request for user states from client connection %{public}@. forceRefresh=%{BOOL}u", buf, 0x1Cu);
  }

  if (v4
    || ([(ICDMediaUserStateCenterServer *)self userStatesCache],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 count],
        v9,
        !v10))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100055150;
    v13[3] = &unk_1001BA788;
    v13[4] = self;
    id v15 = v6;
    id v14 = v7;
    [(ICDMediaUserStateCenterServer *)self _fetchAccountsWithForceRefresh:v4 completion:v13];
  }
  else
  {
    id v11 = [(ICDMediaUserStateCenterServer *)self _sanitizedUserStatesForRemoteClientConnection:v7];
    id v12 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v7;
      __int16 v20 = 2114;
      long long v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Returning cached user states to client connection %{public}@: %{public}@", buf, 0x20u);
    }

    (*((void (**)(id, void *, void))v6 + 2))(v6, v11, 0);
  }
}

- (void)getCachedUserStatesWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  int v5 = +[NSXPCConnection currentConnection];
  id v6 = [(ICDMediaUserStateCenterServer *)self _sanitizedUserStatesForRemoteClientConnection:v5];

  v4[2](v4, v6);
  if (!v6)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@ Lazily fetching user states", buf, 0xCu);
    }

    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005547C;
    block[3] = &unk_1001BEC20;
    void block[4] = self;
    dispatch_async(v8, block);
  }
}

- (NSArray)userStatesCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(NSDictionary *)self->_cachedUserStateByDSID allValues];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (ICDMediaUserStateCenterServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)ICDMediaUserStateCenterServer;
  v2 = [(ICDMediaUserStateCenterServer *)&v13 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_BOOL hasStarted = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICDMediaUserStateCenterServer", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSDictionary dictionary];
    cachedUserStateByDSID = v3->_cachedUserStateByDSID;
    v3->_cachedUserStateByDSID = (NSDictionary *)v6;

    id v8 = [[ICDMusicUserSocialProfileProvider alloc] initWithDelegate:v3];
    userSocialProfileProvider = v3->_userSocialProfileProvider;
    v3->_userSocialProfileProvider = v8;

    uint64_t v10 = +[NSMutableArray array];
    pendingCompletionHandlers = v3->_pendingCompletionHandlers;
    v3->_pendingCompletionHandlers = (NSMutableArray *)v10;

    *(_WORD *)&v3->_coalescedForceRefreshValue = 0;
  }
  return v3;
}

@end