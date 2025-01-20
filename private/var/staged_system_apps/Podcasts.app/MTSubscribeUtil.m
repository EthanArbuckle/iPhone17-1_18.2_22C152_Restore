@interface MTSubscribeUtil
+ (BOOL)isSubscribedToPodcastWithFeedUrl:(id)a3;
+ (BOOL)isSubscribedToPodcastWithStorePlatformDictionary:(id)a3;
+ (BOOL)isSubscribedToPodcastWithUuid:(id)a3;
+ (id)_identifierForDictionary:(id)a3;
+ (void)subscribeToPodcastWithAdamID:(id)a3 completion:(id)a4;
+ (void)subscribeToPodcastWithFeedUrl:(id)a3 completion:(id)a4;
+ (void)subscribeToPodcastWithStorePlatformDictionary:(id)a3 completion:(id)a4;
+ (void)unsubscribeToPodcastWithStorePlatformDictionary:(id)a3;
@end

@implementation MTSubscribeUtil

+ (BOOL)isSubscribedToPodcastWithUuid:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v4 = +[MTDB sharedInstance];
    v5 = [v4 mainOrPrivateContext];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000630F8;
    v9[3] = &unk_10054DA00;
    id v10 = v3;
    id v6 = v5;
    id v11 = v6;
    v12 = &v13;
    [v6 performBlockAndWait:v9];
    BOOL v7 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)isSubscribedToPodcastWithFeedUrl:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = +[MTDB sharedInstance];
    id v6 = [v5 mainOrPrivateContext];
    BOOL v7 = +[MTPodcast podcastUuidForFeedUrlString:v4 ctx:v6];

    unsigned __int8 v8 = [a1 isSubscribedToPodcastWithUuid:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)isSubscribedToPodcastWithStorePlatformDictionary:(id)a3
{
  id v4 = a3;
  v5 = [a1 _identifierForDictionary:v4];
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v6 = +[MTDB sharedInstance];
  BOOL v7 = [v6 mainOrPrivateContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100063394;
  v11[3] = &unk_10054DA00;
  id v8 = v5;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

+ (void)subscribeToPodcastWithFeedUrl:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  BOOL v7 = +[MTDB sharedInstance];
  id v8 = [v7 mainOrPrivateContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100063674;
  v15[3] = &unk_10054DA28;
  id v9 = v5;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  char v18 = &v24;
  v19 = &v20;
  [v10 performBlockAndWait:v15];
  if (!*((unsigned char *)v25 + 24))
  {
    if ([v9 length])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100063794;
      v12[3] = &unk_10054D738;
      id v13 = v9;
      id v14 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

      goto LABEL_7;
    }
    if (!v6) {
      goto LABEL_7;
    }
    BOOL v11 = 0;
    goto LABEL_4;
  }
  if (v6)
  {
    BOOL v11 = *((unsigned char *)v21 + 24) == 0;
LABEL_4:
    (*((void (**)(id, BOOL))v6 + 2))(v6, v11);
  }
LABEL_7:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

+ (void)subscribeToPodcastWithAdamID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = objc_alloc_init(MTAddPodcastParams);
  id v8 = [v6 longLongValue];

  [(MTAddPodcastParams *)v7 setStoreCollectionId:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100063990;
  v11[3] = &unk_10054DA50;
  id v12 = v5;
  id v9 = v5;
  [(MTAddPodcastParams *)v7 setCompletion:v11];
  id v10 = +[MTSubscriptionManager sharedInstance];
  [v10 subscribeToPodcastWithParams:v7];
}

+ (void)subscribeToPodcastWithStorePlatformDictionary:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[MTSubscribeUtil _identifierForDictionary:v5];
  id v8 = [v5 objectForKeyedSubscript:@"isNotSubscribeable"];
  unsigned int v9 = [v8 BOOLValue];

  if (!v9)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    id v10 = +[MTDB sharedInstance];
    BOOL v11 = [v10 mainOrPrivateContext];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100063C58;
    v20[3] = &unk_10054DA28;
    id v12 = v7;
    id v21 = v12;
    id v13 = v11;
    id v22 = v13;
    char v23 = &v29;
    uint64_t v24 = &v25;
    [v13 performBlockAndWait:v20];
    if (*((unsigned char *)v30 + 24))
    {
      if (!v6)
      {
LABEL_10:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v29, 8);
        goto LABEL_11;
      }
      BOOL v14 = *((unsigned char *)v26 + 24) == 0;
    }
    else
    {
      uint64_t v15 = [v12 feedUrl];
      id v16 = [v15 length];

      if (v16)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100063D78;
        v17[3] = &unk_10054D738;
        id v18 = v12;
        id v19 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);

        goto LABEL_10;
      }
      if (!v6) {
        goto LABEL_10;
      }
      BOOL v14 = 0;
    }
    (*((void (**)(id, BOOL))v6 + 2))(v6, v14);
    goto LABEL_10;
  }
  if (v6) {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, 3);
  }
LABEL_11:
}

+ (void)unsubscribeToPodcastWithStorePlatformDictionary:(id)a3
{
  id v3 = [a1 _identifierForDictionary:a3];
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 privateQueueContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100063F94;
  v8[3] = &unk_10054D9B0;
  id v9 = v3;
  id v10 = v5;
  id v6 = v5;
  id v7 = v3;
  [v6 performBlockAndWait:v8];
}

+ (id)_identifierForDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:AMSLookupPropertyItemIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 longLongValue]);
    id v7 = [v6 stringValue];
    unsigned int v8 = [v7 isEqualToString:v5];

    id v4 = v5;
    if (v8)
    {
      id v4 = v6;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = 0;
  }
  id v9 = [v3 objectForKey:@"feedUrl"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
  }
  id v10 = +[MTStoreIdentifier identifierWithFeedUrl:v9 storeIdentifier:v4];

  return v10;
}

@end