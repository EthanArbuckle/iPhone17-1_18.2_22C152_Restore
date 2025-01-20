@interface KCSharingDaemonGroupManager
+ (id)sharedInstance;
- (KCSharingDaemonGroupManager)initWithSyncController:(id)a3 messagingdConnection:(id)a4;
- (KCSharingMessagingdConnection)messagingdConnection;
- (KCSharingStore)sharingStore;
- (KCSharingSyncController)syncController;
- (KCSharingXPCListenerDelegate)xpcListenerDelegate;
- (id)fetchLocalShareForGroupID:(id)a3;
- (id)translateSyncErrorForGroupRequest:(id)a3 zoneID:(id)a4;
- (void)acceptGroupInvite:(id)a3 completion:(id)a4;
- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4;
- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4;
- (void)declineGroupInvite:(id)a3 completion:(id)a4;
- (void)declineInviteForGroupID:(id)a3 completion:(id)a4;
- (void)fetchAndUpdateParticipantsForGroup:(id)a3 share:(id)a4 completion:(id)a5;
- (void)fetchCKShareMetadataForGroupInvites:(id)a3 completion:(id)a4;
- (void)fetchReceivedPendingGroupsExcludingGroupIDs:(id)a3 completion:(id)a4;
- (void)fetchShareParticipantsForParticipants:(id)a3 completion:(id)a4;
- (void)getGroupByGroupID:(id)a3 completion:(id)a4;
- (void)handleGroupCreateRequest:(id)a3 completion:(id)a4;
- (void)handleGroupDeleteRequest:(id)a3 completion:(id)a4;
- (void)handleGroupFetchRequest:(id)a3 completion:(id)a4;
- (void)handleGroupLeaveRequest:(id)a3 completion:(id)a4;
- (void)handleGroupUpdateRequest:(id)a3 completion:(id)a4;
- (void)sendGroupsUpdatedNotifications;
- (void)setMessagingdConnection:(id)a3;
- (void)setSharingStore:(id)a3;
- (void)setSyncController:(id)a3;
- (void)setXpcListenerDelegate:(id)a3;
@end

@implementation KCSharingDaemonGroupManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingdConnection, 0);
  objc_destroyWeak((id *)&self->_syncController);
  objc_storeStrong((id *)&self->_sharingStore, 0);

  objc_destroyWeak((id *)&self->_xpcListenerDelegate);
}

- (void)setMessagingdConnection:(id)a3
{
}

- (KCSharingMessagingdConnection)messagingdConnection
{
  return self->_messagingdConnection;
}

- (void)setSyncController:(id)a3
{
}

- (KCSharingSyncController)syncController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncController);

  return (KCSharingSyncController *)WeakRetained;
}

- (void)setSharingStore:(id)a3
{
}

- (KCSharingStore)sharingStore
{
  return self->_sharingStore;
}

- (void)setXpcListenerDelegate:(id)a3
{
}

- (KCSharingXPCListenerDelegate)xpcListenerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcListenerDelegate);

  return (KCSharingXPCListenerDelegate *)WeakRetained;
}

- (void)fetchShareParticipantsForParticipants:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v38 = v6;
  id v39 = a4;
  if (v39)
  {
    if (v6 && [v6 count])
    {
      v40 = self;
      v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v53;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v53 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            v13 = [v12 handle];
            BOOL v14 = v13 == 0;

            if (v14)
            {
              v15 = KCSharingLogObject();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138477827;
                *(void *)((char *)&buf + 4) = v12;
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Skipping participant without handle. This is a bug! %{private}@", (uint8_t *)&buf, 0xCu);
              }
            }
            else
            {
              v15 = [v12 handle];
              [v7 setObject:v12 forKeyedSubscript:v15];
            }
          }
          id v9 = [v8 countByEnumeratingWithState:&v52 objects:v62 count:16];
        }
        while (v9);
      }

      v16 = [(KCSharingDaemonGroupManager *)v40 syncController];
      v37 = [v16 container];

      v41 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v17 = v8;
      id v18 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v49;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v49 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
            if (([v21 isCurrentUser] & 1) == 0)
            {
              id v22 = [v21 handle];
              if (objc_opt_respondsToSelector())
              {
                unsigned int v23 = [v22 _appearsToBeEmail];

                if (v23)
                {
                  id v24 = objc_alloc((Class)CKUserIdentityLookupInfo);
                  v25 = [v21 handle];
                  id v26 = [v24 initWithEmailAddress:v25];
                  [v41 addObject:v26];

LABEL_35:
                  continue;
                }
              }
              else
              {
                v27 = KCSharingLogObject();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "IMFoundation not linked correctly. Returning NO from KCSharingHandleIsEmail", (uint8_t *)&buf, 2u);
                }
              }
              id v28 = [v21 handle];
              if (objc_opt_respondsToSelector())
              {
                unsigned int v29 = [v28 _appearsToBePhoneNumber];

                if (v29)
                {
                  id v30 = objc_alloc((Class)CKUserIdentityLookupInfo);
                  v25 = [v21 handle];
                  id v31 = [v30 initWithPhoneNumber:v25];
                  [v41 addObject:v31];

                  goto LABEL_35;
                }
              }
              else
              {
                v32 = KCSharingLogObject();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "IMFoundation not linked correctly. Returning NO from KCSharingHandleIsPhoneNumber", (uint8_t *)&buf, 2u);
                }
              }
              v25 = KCSharingLogObject();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v33 = [v21 handle];
                LODWORD(buf) = 138477827;
                *(void *)((char *)&buf + 4) = v33;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Participant handle %{private}@ appears to be neither an email or phone number, not looking it up in CloudKit", (uint8_t *)&buf, 0xCu);
              }
              goto LABEL_35;
            }
          }
          id v18 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
        }
        while (v18);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v57 = 0x3032000000;
      v58 = sub_1000C1354;
      v59 = sub_1000C1364;
      id v60 = (id)0xAAAAAAAAAAAAAAAALL;
      +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v17 count]);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      id v34 = [objc_alloc((Class)CKFetchShareParticipantsOperation) initWithUserIdentityLookupInfos:v41];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000C136C;
      v45[3] = &unk_1002F9590;
      id v35 = v7;
      id v46 = v35;
      p_long long buf = &buf;
      [v34 setPerShareParticipantCompletionBlock:v45];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000C15E8;
      v42[3] = &unk_1002F95B8;
      id v43 = v39;
      v44 = &buf;
      [v34 setFetchShareParticipantsCompletionBlock:v42];
      [v37 addOperation:v34];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v36 = KCSharingLogObject();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "No or empty participant list for which to fetch share participants", (uint8_t *)&buf, 2u);
      }

      id v35 = +[NSDictionary dictionary];
      (*((void (**)(id, id, void))v39 + 2))(v39, v35, 0);
    }
  }
}

- (id)fetchLocalShareForGroupID:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingDaemonGroupManager *)self sharingStore];
  id v10 = 0;
  id v6 = [v5 fetchCKShareFromMirrorForGroupID:v4 error:&v10];
  id v7 = v10;

  if (!v6 || v7)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to find local share for groupID %{public}@ (%{public}@)", buf, 0x16u);
    }
  }

  return v6;
}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[NSSet setWithArray:a3];
  id v8 = [v7 allObjects];

  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [objc_alloc((Class)KCSharingParticipant) initWithHandle:*(void *)(*((void *)&v21 + 1) + 8 * (void)v14) permissionLevel:0];
        [v9 addObject:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C1A0C;
  v18[3] = &unk_1002FB198;
  id v19 = v10;
  id v20 = v6;
  id v16 = v10;
  id v17 = v6;
  [(KCSharingDaemonGroupManager *)self fetchShareParticipantsForParticipants:v9 completion:v18];
}

- (void)declineGroupInvite:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = KCSharingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 groupID];
    *(_DWORD *)long long buf = 138543619;
    id v19 = v9;
    __int16 v20 = 2113;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Declining invite for group: %{public}@, %{private}@", buf, 0x16u);
  }
  id v17 = v6;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C1E38;
  v13[3] = &unk_1002F9518;
  id v15 = self;
  id v16 = v7;
  id v14 = v6;
  id v11 = v7;
  id v12 = v6;
  [(KCSharingDaemonGroupManager *)self fetchCKShareMetadataForGroupInvites:v10 completion:v13];
}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Declining group invite for %{public}@", buf, 0xCu);
    }

    id v9 = [(KCSharingDaemonGroupManager *)self messagingdConnection];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C2888;
    v10[3] = &unk_1002F9478;
    id v13 = v7;
    id v11 = v6;
    id v12 = self;
    [v9 fetchReceivedInviteWithGroupID:v11 completion:v10];
  }
}

- (void)acceptGroupInvite:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = KCSharingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 groupID];
    *(_DWORD *)long long buf = 138543619;
    id v19 = v9;
    __int16 v20 = 2113;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accepting invite for %{public}@: %{private}@", buf, 0x16u);
  }
  id v17 = v6;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C2BF8;
  v13[3] = &unk_1002F9518;
  id v15 = self;
  id v16 = v7;
  id v14 = v6;
  id v11 = v7;
  id v12 = v6;
  [(KCSharingDaemonGroupManager *)self fetchCKShareMetadataForGroupInvites:v10 completion:v13];
}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accepting group invite for %{public}@", buf, 0xCu);
    }

    id v9 = [(KCSharingDaemonGroupManager *)self messagingdConnection];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C36F8;
    v10[3] = &unk_1002F9478;
    id v13 = v7;
    id v11 = v6;
    id v12 = self;
    [v9 fetchReceivedInviteWithGroupID:v11 completion:v10];
  }
}

- (id)translateSyncErrorForGroupRequest:(id)a3 zoneID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_19;
  }
  id v7 = [v5 domain];
  if (v7 != @"KCSharingErrorDomain")
  {

LABEL_19:
    id v21 = v5;
    goto LABEL_20;
  }
  id v8 = [v5 code];

  if (v8 != (id)14) {
    goto LABEL_19;
  }
  id v9 = [v5 userInfo];
  id v10 = [v9 objectForKeyedSubscript:NSMultipleUnderlyingErrorsKey];

  if (!v10 || ![v10 count])
  {
    id v21 = v5;
    goto LABEL_32;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (!v12) {
    goto LABEL_16;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v26;
  long long v24 = v10;
  while (2)
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v26 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if ((CKErrorIsCode() & 1) == 0)
      {
        id v21 = v5;
        id v10 = v24;
LABEL_31:

        goto LABEL_32;
      }
      id v17 = [v16 userInfo];
      id v18 = [v17 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
      id v19 = [v18 objectForKeyedSubscript:v6];

      if (v19)
      {
        if (CKErrorIsCode())
        {
          long long v23 = KCSharingLogObject();
          id v10 = v24;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            id v30 = v6;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sync error translation: seems we were offline for zoneID=%{public}@, returning translated error", buf, 0xCu);
          }

          id v21 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:36 userInfo:0];
        }
        else
        {
          id v21 = v5;
          id v10 = v24;
        }

        goto LABEL_31;
      }
    }
    id v13 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
    id v10 = v24;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_16:

  __int16 v20 = KCSharingLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sync error translation: zoneID=%{public}@ did not error, returning nil", buf, 0xCu);
  }

  id v21 = 0;
LABEL_32:

LABEL_20:

  return v21;
}

- (void)handleGroupDeleteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 groupID];
      *(_DWORD *)long long buf = 138543362;
      v36 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Group delete request for %{public}@", buf, 0xCu);
    }
    id v10 = [v6 groupID];
    id v11 = [(KCSharingDaemonGroupManager *)self fetchLocalShareForGroupID:v10];

    if (v11)
    {
      id v12 = [v11 owner];
      id v13 = [v11 currentUserParticipant];
      unsigned __int8 v14 = [v12 isEqual:v13];

      if (v14)
      {
        id v15 = [(KCSharingDaemonGroupManager *)self sharingStore];
        id v39 = v11;
        id v16 = +[NSArray arrayWithObjects:&v39 count:1];
        id v34 = 0;
        unsigned __int8 v17 = [v15 stageOutgoingShares:0 deletionsForShares:v16 error:&v34];
        id v18 = v34;

        if (v17)
        {
          id v19 = sub_100046CF4(v11);
          __int16 v20 = [(KCSharingDaemonGroupManager *)self syncController];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000C401C;
          v29[3] = &unk_1002F94C8;
          v29[4] = self;
          id v30 = v11;
          id v31 = v6;
          id v32 = v19;
          id v33 = v7;
          id v21 = v19;
          [v20 saveStagedOutgoingChangesWithCompletion:v29];

LABEL_16:
          goto LABEL_17;
        }
        long long v25 = KCSharingLogObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          long long v28 = [v6 groupID];
          *(_DWORD *)long long buf = 138543618;
          v36 = v28;
          __int16 v37 = 2114;
          id v38 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to stage outgoing changes for group delete request for %{public}@: %{public}@", buf, 0x16u);
        }
LABEL_15:
        (*((void (**)(id, id))v7 + 2))(v7, v18);
        goto LABEL_16;
      }
      long long v24 = KCSharingLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        long long v27 = [v6 groupID];
        *(_DWORD *)long long buf = 138543362;
        v36 = v27;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Rejected group delete request for non-owned group: %{public}@", buf, 0xCu);
      }
      uint64_t v23 = 15;
    }
    else
    {
      long long v22 = KCSharingLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v26 = [v6 groupID];
        *(_DWORD *)long long buf = 138543362;
        v36 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to fetch local share for %{public}@", buf, 0xCu);
      }
      uint64_t v23 = 9;
    }
    id v18 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:v23 userInfo:0];
    goto LABEL_15;
  }
LABEL_17:
}

- (void)handleGroupLeaveRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 groupID];
      *(_DWORD *)long long buf = 138543362;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Group leave request for %{public}@", buf, 0xCu);
    }
    id v10 = [v6 groupID];
    id v11 = [(KCSharingDaemonGroupManager *)self fetchLocalShareForGroupID:v10];

    if (v11)
    {
      id v12 = [v11 owner];
      id v13 = [v11 currentUserParticipant];
      unsigned int v14 = [v12 isEqual:v13];

      if (!v14)
      {
        id v19 = [(KCSharingDaemonGroupManager *)self sharingStore];
        v36 = v11;
        __int16 v20 = +[NSArray arrayWithObjects:&v36 count:1];
        id v31 = 0;
        unsigned __int8 v21 = [v19 stageOutgoingShares:0 deletionsForShares:v20 error:&v31];
        id v18 = v31;

        if (v21)
        {
          long long v22 = [(KCSharingDaemonGroupManager *)self syncController];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1000C47E0;
          v27[3] = &unk_1002F9450;
          v27[4] = self;
          id v28 = v11;
          id v29 = v6;
          id v30 = v7;
          [v22 saveStagedOutgoingChangesWithCompletion:v27];

          goto LABEL_14;
        }
        uint64_t v23 = KCSharingLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          long long v26 = [v6 groupID];
          *(_DWORD *)long long buf = 138543618;
          id v33 = v26;
          __int16 v34 = 2114;
          id v35 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to stage outgoing changes for group leave request for %{public}@: %{public}@", buf, 0x16u);
        }
LABEL_13:
        (*((void (**)(id, id))v7 + 2))(v7, v18);
LABEL_14:

        goto LABEL_15;
      }
      id v15 = KCSharingLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        long long v25 = [v6 groupID];
        *(_DWORD *)long long buf = 138543362;
        id v33 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Rejected group leave request for owned group: %{public}@", buf, 0xCu);
      }
      uint64_t v16 = 15;
    }
    else
    {
      unsigned __int8 v17 = KCSharingLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v6 groupID];
        *(_DWORD *)long long buf = 138543362;
        id v33 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to fetch local share for %{public}@", buf, 0xCu);
      }
      uint64_t v16 = 9;
    }
    id v18 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:v16 userInfo:0];
    goto LABEL_13;
  }
LABEL_15:
}

- (void)fetchAndUpdateParticipantsForGroup:(id)a3 share:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = KCSharingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 groupID];
    *(_DWORD *)long long buf = 138543875;
    uint64_t v23 = v12;
    __int16 v24 = 2113;
    id v25 = v8;
    __int16 v26 = 2113;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching and updating participants for %{public}@, %{private}@\n%{private}@", buf, 0x20u);
  }
  id v13 = [v8 participants];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C4AF8;
  v17[3] = &unk_1002F9428;
  id v18 = v8;
  id v19 = v9;
  __int16 v20 = self;
  id v21 = v10;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  [(KCSharingDaemonGroupManager *)self fetchShareParticipantsForParticipants:v13 completion:v17];
}

- (void)handleGroupUpdateRequest:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  if (v6)
  {
    id v7 = [a3 group];
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 groupID];
      int v20 = 138543362;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Group update request for %{public}@", (uint8_t *)&v20, 0xCu);
    }
    id v10 = [v7 groupID];
    id v11 = [(KCSharingDaemonGroupManager *)self fetchLocalShareForGroupID:v10];

    if (v11)
    {
      id v12 = [v11 owner];
      id v13 = [v11 currentUserParticipant];
      unsigned __int8 v14 = [v12 isEqual:v13];

      if (v14)
      {
        sub_100046A00(v11, v7);
        [(KCSharingDaemonGroupManager *)self fetchAndUpdateParticipantsForGroup:v7 share:v11 completion:v6];
LABEL_14:

        goto LABEL_15;
      }
      unsigned __int8 v17 = KCSharingLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v7 groupID];
        int v20 = 138543619;
        id v21 = v19;
        __int16 v22 = 2113;
        uint64_t v23 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Rejected group update request for non-owned group: %{public}@, %{private}@", (uint8_t *)&v20, 0x16u);
      }
      id v15 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:15 userInfo:0];
    }
    else
    {
      id v15 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:9 userInfo:0];
      id v16 = KCSharingLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v7 groupID];
        int v20 = 138543362;
        id v21 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to fetch local share for %{public}@", (uint8_t *)&v20, 0xCu);
      }
    }
    v6[2](v6, 0, v15);

    goto LABEL_14;
  }
LABEL_15:
}

- (void)handleGroupCreateRequest:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [a3 group];
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 groupID];
      *(_DWORD *)long long buf = 138543362;
      unsigned __int8 v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Group create request for %{public}@", buf, 0xCu);
    }
    id v10 = v7;
    id v11 = objc_alloc((Class)CKRecordZoneID);
    id v12 = [v10 groupID];
    id v13 = +[NSString stringWithFormat:@"%@%@", @"group-", v12];
    id v14 = [v11 initWithZoneName:v13 ownerName:CKCurrentUserDefaultName];

    id v15 = [objc_alloc((Class)CKShare) initWithRecordZoneID:v14];
    [v15 setParticipantSelfRemovalBehavior:3];
    sub_100046A00(v15, v10);

    [(KCSharingDaemonGroupManager *)self fetchAndUpdateParticipantsForGroup:v10 share:v15 completion:v6];
  }
}

- (void)fetchCKShareMetadataForGroupInvites:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v32 = a4;
  id v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  id v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v12);
        id v14 = objc_alloc((Class)CKDeviceToDeviceShareInvitationToken);
        id v15 = [v13 inviteToken];
        id v16 = [v13 shareURL];
        id v17 = [v14 initWithSharingInvitationData:v15 shareURL:v16];

        id v18 = [v13 shareURL];
        [v6 setObject:v17 forKeyedSubscript:v18];

        id v19 = [v13 shareURL];
        [v7 addObject:v19];

        int v20 = [v13 groupID];
        id v21 = [v13 shareURL];
        [v8 setObject:v20 forKeyedSubscript:v21];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v10);
  }

  __int16 v22 = v7;
  id v23 = [objc_alloc((Class)CKFetchShareMetadataOperation) initWithShareURLs:v7 invitationTokensByShareURL:v6];
  __int16 v24 = [(KCSharingDaemonGroupManager *)self syncController];
  id v25 = [v24 container];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000C6054;
  v38[3] = &unk_1002F93D8;
  id v39 = v8;
  v40 = self;
  id v26 = objc_alloc_init((Class)NSMutableArray);
  id v41 = v26;
  id v27 = v8;
  [v23 setPerShareMetadataBlock:v38];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C6268;
  v34[3] = &unk_1002F9400;
  id v36 = v26;
  id v37 = v32;
  id v35 = obj;
  id v28 = v26;
  id v29 = v32;
  id v30 = obj;
  [v23 setFetchShareMetadataCompletionBlock:v34];
  [v25 addOperation:v23];
}

- (void)fetchReceivedPendingGroupsExcludingGroupIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(KCSharingDaemonGroupManager *)self messagingdConnection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C666C;
  v11[3] = &unk_1002F9518;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 fetchReceivedInvitesWithCompletion:v11];
}

- (void)handleGroupFetchRequest:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  if (v5)
  {
    id v6 = [(KCSharingDaemonGroupManager *)self sharingStore];
    id v27 = 0;
    id v7 = [v6 fetchAllSharingGroupsInMirrorWithError:&v27];
    id v8 = v27;
    id v9 = [v7 mutableCopy];

    if (!v9 || v8)
    {
      id v18 = KCSharingLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v30 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to fetch groups from mirror: %{public}@", buf, 0xCu);
      }

      if (v8)
      {
        v5[2](v5, 0, v8);
      }
      else
      {
        id v19 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:20 userInfo:0];
        v5[2](v5, 0, v19);
      }
    }
    else
    {
      id v10 = +[NSMutableArray array];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          id v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v15) groupID];
            [v10 addObject:v16];

            id v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }

      if ([v11 count])
      {
        id v17 = [(KCSharingDaemonGroupManager *)self syncController];
        [v17 setFeatureInUse];
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000C6E30;
      v20[3] = &unk_1002F93B0;
      id v21 = v11;
      __int16 v22 = v5;
      [(KCSharingDaemonGroupManager *)self fetchReceivedPendingGroupsExcludingGroupIDs:v10 completion:v20];
    }
  }
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(KCSharingDaemonGroupManager *)self fetchLocalShareForGroupID:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = sub_100046CF4(v8);
    id v11 = KCSharingLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Got group for groupID %{public}@: %@", (uint8_t *)&v12, 0x16u);
    }

    v7[2](v7, v10, 0);
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)sendGroupsUpdatedNotifications
{
  v2 = [(KCSharingDaemonGroupManager *)self xpcListenerDelegate];
  [v2 groupsUpdated];

  v3 = KCSharingLogObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  id v5 = (void *)KCSharingGroupsUpdatedNotification;
  if (v4)
  {
    int v6 = 138412290;
    uint64_t v7 = KCSharingGroupsUpdatedNotification;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "posting notification %@", (uint8_t *)&v6, 0xCu);
  }

  notify_post((const char *)[v5 UTF8String]);
}

- (KCSharingDaemonGroupManager)initWithSyncController:(id)a3 messagingdConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KCSharingDaemonGroupManager;
  id v8 = [(KCSharingDaemonGroupManager *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 store];
    sharingStore = v8->_sharingStore;
    v8->_sharingStore = (KCSharingStore *)v9;

    objc_storeWeak((id *)&v8->_syncController, v6);
    objc_storeStrong((id *)&v8->_messagingdConnection, a4);
  }

  return v8;
}

+ (id)sharedInstance
{
  if (qword_10035CE40 != -1) {
    dispatch_once(&qword_10035CE40, &stru_1002F9388);
  }
  v2 = (void *)qword_10035CE48;

  return v2;
}

@end