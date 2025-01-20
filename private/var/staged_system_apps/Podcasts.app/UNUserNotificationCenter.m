@interface UNUserNotificationCenter
+ (id)workQueue;
- (id)_mt_identifiersMatchingPlayerItemsInNotificationRequests:(id)a3;
- (id)_mt_identifiersMatchingPodcastUuid:(id)a3 inNotificationRequests:(id)a4;
- (void)_mt_identifiersMatchingDeletedEpisodesOnPodcastUuid:(id)a3 inNotificationRequests:(id)a4 ctx:(id)a5 completion:(id)a6;
- (void)mt_removeAllNotificationsForDeletedEpisodesOnPodcastUuid:(id)a3 ctx:(id)a4;
- (void)mt_removeAllNotificationsForPodcastUuid:(id)a3;
- (void)mt_removeDeliveredNotificationsForPlayerItemsWithCompletion:(id)a3;
@end

@implementation UNUserNotificationCenter

+ (id)workQueue
{
  if (qword_10060A998 != -1) {
    dispatch_once(&qword_10060A998, &stru_100553638);
  }
  v2 = (void *)qword_10060A990;

  return v2;
}

- (void)mt_removeAllNotificationsForPodcastUuid:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    v5 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }
  }
  if ([v4 length])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10016BF48;
    v9[3] = &unk_100553660;
    v9[4] = self;
    id v6 = v4;
    id v10 = v6;
    [(UNUserNotificationCenter *)self getPendingNotificationRequestsWithCompletionHandler:v9];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10016BFB0;
    v7[3] = &unk_100553660;
    v7[4] = self;
    id v8 = v6;
    [(UNUserNotificationCenter *)self getDeliveredNotificationsWithCompletionHandler:v7];
  }
}

- (void)mt_removeAllNotificationsForDeletedEpisodesOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to remove notifications that contain deleted episodes for podcastUuid: %@ ", buf, 0xCu);
  }

  if (![v6 length])
  {
    v9 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }
  }
  if ([v6 length])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10016C24C;
    v15[3] = &unk_100550198;
    v15[4] = self;
    id v10 = v6;
    id v16 = v10;
    id v11 = v7;
    id v17 = v11;
    [(UNUserNotificationCenter *)self getPendingNotificationRequestsWithCompletionHandler:v15];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10016C468;
    v12[3] = &unk_100550198;
    v12[4] = self;
    id v13 = v10;
    id v14 = v11;
    [(UNUserNotificationCenter *)self getDeliveredNotificationsWithCompletionHandler:v12];
  }
}

- (void)mt_removeDeliveredNotificationsForPlayerItemsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016C730;
  v4[3] = &unk_100551D20;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(UNUserNotificationCenter *)v5 getDeliveredNotificationsWithCompletionHandler:v4];
}

- (id)_mt_identifiersMatchingPodcastUuid:(id)a3 inNotificationRequests:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10016C87C;
  v8[3] = &unk_100553708;
  id v9 = a3;
  id v5 = v9;
  id v6 = [a4 mt_compactMap:v8];

  return v6;
}

- (void)_mt_identifiersMatchingDeletedEpisodesOnPodcastUuid:(id)a3 inNotificationRequests:(id)a4 ctx:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v28 = a5;
  id v27 = a6;
  id v11 = dispatch_group_create();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_1000571D8;
  v44[4] = sub_1000573A8;
  id v45 = objc_alloc_init((Class)NSMutableArray);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v41;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        dispatch_group_enter(v11);
        id v16 = [v15 identifier];
        if (+[UNNotificationRequest mt_isUuidRequestIdentifier:v16 matchForPodcastUuid:v9])
        {
          id v17 = [v15 content];
          v18 = [v17 mt_notificationEpisodes];

          id v19 = [v18 mt_compactMap:&stru_100553728];
          v20 = +[NSSet setWithArray:v19];

          v21 = _MTLogCategoryNotifications();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [v20 count];
            *(_DWORD *)buf = 134218498;
            id v47 = v22;
            __int16 v48 = 2112;
            id v49 = v9;
            __int16 v50 = 2112;
            v51 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found notification with %lu episodes for podcastUuid: %@. Episode uuids in notification: %@", buf, 0x20u);
          }

          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10016CD4C;
          v33[3] = &unk_100553750;
          id v23 = v20;
          id v34 = v23;
          id v24 = v28;
          id v35 = v24;
          id v36 = v9;
          v37 = v11;
          v39 = v44;
          id v38 = v16;
          [v24 performBlock:v33];
        }
        else
        {
          dispatch_group_leave(v11);
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v12);
  }

  v25 = +[UNUserNotificationCenter workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016CEA4;
  block[3] = &unk_100551ED8;
  v32 = v44;
  id v31 = v27;
  id v26 = v27;
  dispatch_group_notify(v11, v25, block);

  _Block_object_dispose(v44, 8);
}

- (id)_mt_identifiersMatchingPlayerItemsInNotificationRequests:(id)a3
{
  return [a3 mt_compactMap:&stru_100553790];
}

@end