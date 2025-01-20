@interface CSDIDSFirewallManager
+ (id)predicateForUpgrade;
- (CSDCHManager)chManager;
- (CSDConversationServerBag)serverBag;
- (CSDIDSFirewallManager)initWithService:(id)a3 chManager:(id)a4 featureFlags:(id)a5 serverBag:(id)a6 queue:(id)a7;
- (CSDIDSFirewallManager)initWithService:(id)a3 queue:(id)a4;
- (CSDIDSService)service;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)latestRecentOutgoingFacetimeCallWithRemoteParticipantHandle:(id)a3 sinceDate:(id)a4 noDeletedCallsPredicate:(id)a5;
- (void)allCallHistoryDeleted;
- (void)recentCallsDeleted:(id)a3;
- (void)setChManager:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setService:(id)a3;
- (void)updateFirewallWithCallHistoryIfNecessary;
@end

@implementation CSDIDSFirewallManager

- (CSDIDSFirewallManager)initWithService:(id)a3 chManager:(id)a4 featureFlags:(id)a5 serverBag:(id)a6 queue:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CSDIDSFirewallManager;
  v17 = [(CSDIDSFirewallManager *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_service, a3);
    objc_storeStrong((id *)&v18->_queue, a7);
    objc_storeStrong((id *)&v18->_featureFlags, a5);
    objc_storeStrong((id *)&v18->_serverBag, a6);
    objc_storeStrong((id *)&v18->_chManager, a4);
  }

  return v18;
}

- (CSDIDSFirewallManager)initWithService:(id)a3 queue:(id)a4
{
  v6 = (CSDIDSService *)a3;
  v7 = (OS_dispatch_queue *)a4;
  service = self->_service;
  self->_service = v6;
  v9 = v6;

  queue = self->_queue;
  self->_queue = v7;
  v11 = v7;

  id v12 = objc_alloc_init((Class)TUFeatureFlags);
  id v13 = objc_alloc_init(CSDSharedConversationServerBag);
  id v14 = objc_alloc_init((Class)CHManager);
  id v15 = [(CSDIDSFirewallManager *)self initWithService:v9 chManager:v14 featureFlags:v12 serverBag:v13 queue:v11];

  return v15;
}

- (void)updateFirewallWithCallHistoryIfNecessary
{
  v3 = +[NSUserDefaults tu_defaults];
  id v4 = [v3 integerForKey:@"kLastIDSFirewallVersionDefaultsKey"];

  if (!v4)
  {
    v5 = [(CSDIDSFirewallManager *)self featureFlags];
    unsigned int v6 = [v5 offrampEnabled];

    if (v6)
    {
      v7 = [(CSDIDSFirewallManager *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017748C;
      block[3] = &unk_100504EC0;
      block[4] = self;
      dispatch_async(v7, block);
    }
  }
}

- (void)recentCallsDeleted:(id)a3
{
  id v4 = a3;
  v37 = self;
  v5 = [(CSDIDSFirewallManager *)self featureFlags];
  unsigned int v6 = [v5 offrampEnabled];

  if (v6)
  {
    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting calls from IDS firewall if necessary: %@", buf, 0xCu);
    }

    v35 = +[NSMutableDictionary dictionary];
    v36 = +[NSMutableSet set];
    v8 = +[NSCalendar currentCalendar];
    v9 = [(CSDIDSFirewallManager *)v37 serverBag];
    id v10 = [v9 idsFirewallCHExpiryTimeDays];
    v11 = +[NSDate date];
    v34 = [v8 dateByAddingUnit:16 value:v10 toDate:v11 options:0];

    id v12 = +[NSMutableArray array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v32 = v4;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v50;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v49 + 1) + 8 * i) uniqueId];
          v19 = +[NSPredicate predicateWithFormat:@"unique_id != %@", v18];
          [v12 addObject:v19];
        }
        id v15 = [v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v15);
    }

    v33 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v20 = v13;
    id v21 = [v20 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v46;
      uint64_t v24 = kCHServiceProviderFaceTime;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          v27 = [v26 serviceProvider];
          unsigned int v28 = [v27 isEqualToString:v24];

          if (v28)
          {
            v29 = [v26 validRemoteParticipantHandles];
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_100177C8C;
            v38[3] = &unk_100508D30;
            id v39 = v35;
            v40 = v37;
            id v41 = v34;
            id v42 = v33;
            v43 = v26;
            id v44 = v36;
            [v29 enumerateObjectsUsingBlock:v38];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v22);
    }

    v30 = sub_100008DCC();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v36;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Removing handle(s) from firewall %@", buf, 0xCu);
    }

    v31 = [(CSDIDSFirewallManager *)v37 service];
    [v31 removeFirewallEntries:v36];

    id v4 = v32;
  }
}

- (void)allCallHistoryDeleted
{
  v3 = [(CSDIDSFirewallManager *)self featureFlags];
  unsigned int v4 = [v3 offrampEnabled];

  if (v4)
  {
    id v5 = [(CSDIDSFirewallManager *)self service];
    [v5 removeAllFirewallEntries];
  }
}

- (id)latestRecentOutgoingFacetimeCallWithRemoteParticipantHandle:(id)a3 sinceDate:(id)a4 noDeletedCallsPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[CHRecentCall predicateForCallsLessThanDate:a4];
  v11 = +[CHRecentCall predicateForCallsWithRemoteParticipantHandle:v9];

  id v12 = +[CHRecentCall predicateForCallsWithServiceProvider:kCHServiceProviderFaceTime];
  id v13 = +[CHRecentCall predicateForCallsWithStatusOriginated:1];
  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v12;
  v20[3] = v13;
  v20[4] = v8;
  id v14 = +[NSArray arrayWithObjects:v20 count:5];
  id v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];

  uint64_t v16 = [(CSDIDSFirewallManager *)self chManager];
  v17 = [v16 callsWithPredicate:v15 limit:1 offset:0 batchSize:1];
  v18 = [v17 firstObject];

  return v18;
}

+ (id)predicateForUpgrade
{
  v2 = objc_alloc_init(CSDSharedConversationServerBag);
  v3 = +[NSCalendar currentCalendar];
  id v4 = [(CSDSharedConversationServerBag *)v2 idsFirewallCHExpiryTimeDays];
  id v5 = +[NSDate date];
  unsigned int v6 = [v3 dateByAddingUnit:16 value:v4 toDate:v5 options:0];

  v7 = +[CHRecentCall predicateForCallsLessThanDate:v6];
  id v8 = +[CHRecentCall predicateForCallsWithServiceProvider:kCHServiceProviderFaceTime];
  id v9 = +[CHRecentCall predicateForCallsWithStatusOriginated:1];
  id v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v9, 0);
  v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  return v11;
}

- (CSDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (CSDCHManager)chManager
{
  return self->_chManager;
}

- (void)setChManager:(id)a3
{
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_chManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end