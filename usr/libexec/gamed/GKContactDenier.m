@interface GKContactDenier
- (id)deniedContactIdentifiers;
- (id)denyListLocation:(id)a3;
- (id)friendSuggestionsDenyListLocation;
- (void)clearFriendSuggestionsDenyList;
- (void)denyContact:(id)a3 replyQueue:(id)a4 handler:(id)a5;
@end

@implementation GKContactDenier

- (void)denyContact:(id)a3 replyQueue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  v12 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[GKContactDenier denyContact:replyQueue:handler:]";
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Attempting to deny contact: %@", buf, 0x16u);
  }
  if (v8)
  {
    [(GKContactDenier *)self friendSuggestionsDenyListLocation];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D768C;
    block[3] = &unk_1002D3A48;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v8;
    id v17 = v10;
    id v13 = v15;
    dispatch_async(v9, block);
  }
  else
  {
    id v13 = +[NSError errorWithDomain:@"gamed" code:17 userInfo:0];
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }
}

- (id)denyListLocation:(id)a3
{
  id v3 = a3;
  v4 = GKInsecureCacheRoot();
  v5 = [v4 stringByAppendingPathComponent:v3];

  v6 = GKInsecureCacheRoot();
  id v7 = (id)gkEnsureDirectory();

  return v5;
}

- (void)clearFriendSuggestionsDenyList
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7814;
  block[3] = &unk_1002D40E0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)deniedContactIdentifiers
{
  v2 = [(GKContactDenier *)self friendSuggestionsDenyListLocation];
  id v3 = +[NSURL fileURLWithPath:v2];

  id v9 = 0;
  v4 = +[NSDictionary dictionaryWithContentsOfURL:v3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1000D7974((uint64_t)v5, v7);
    }
  }

  return v4;
}

- (id)friendSuggestionsDenyListLocation
{
  return [(GKContactDenier *)self denyListLocation:@"friendSuggestionsDenyList.plist"];
}

@end