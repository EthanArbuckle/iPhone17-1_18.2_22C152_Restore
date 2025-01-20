@interface UNNotificationRequest
+ (BOOL)mt_isPlayerItemRequestIdentifier:(id)a3;
+ (BOOL)mt_isUuidRequestIdentifier:(id)a3 matchForPodcastUuid:(id)a4;
+ (id)mt_uniqueRequestIdentifierForPlayerItem:(id)a3;
+ (id)mt_uniqueRequestIdentifierForPodcastUuid:(id)a3;
+ (void)mt_accessSchedulingOptionsByRequestIdentifier:(id)a3;
- (unint64_t)mt_schedulingOptions;
- (void)mt_setSchedulingOptions:(unint64_t)a3;
@end

@implementation UNNotificationRequest

+ (id)mt_uniqueRequestIdentifierForPodcastUuid:(id)a3
{
  v3 = (__CFString *)a3;
  if (![(__CFString *)v3 length])
  {
    v4 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }
  }
  if (![(__CFString *)v3 length])
  {

    v3 = @"null";
  }
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];

  v7 = +[NSString stringWithFormat:@"podcastUuid-%@/%@", v3, v6];

  return v7;
}

+ (BOOL)mt_isUuidRequestIdentifier:(id)a3 matchForPodcastUuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 length])
  {
    v7 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }
  }
  if ([v6 length])
  {
    v8 = +[NSString stringWithFormat:@"podcastUuid-%@", v6];
    unsigned __int8 v9 = [v5 hasPrefix:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

+ (id)mt_uniqueRequestIdentifierForPlayerItem:(id)a3
{
  return +[NSString stringWithFormat:@"playerItem-%@", a3];
}

+ (BOOL)mt_isPlayerItemRequestIdentifier:(id)a3
{
  return [a3 hasPrefix:@"playerItem"];
}

+ (void)mt_accessSchedulingOptionsByRequestIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_1000373B0 != -1)
  {
    dispatch_once(&qword_1000373B0, &stru_10002CFE8);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    id v5 = qword_1000373B8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011AA0;
    block[3] = &unk_10002D010;
    id v7 = v4;
    dispatch_sync(v5, block);
  }
LABEL_4:
}

- (unint64_t)mt_schedulingOptions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned __int8 v9 = sub_100011BBC;
  v10 = sub_100011BCC;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011BD4;
  v5[3] = &unk_10002D038;
  v5[4] = self;
  v5[5] = &v6;
  [objc_opt_class() mt_accessSchedulingOptionsByRequestIdentifier:v5];
  v2 = (void *)v7[5];
  if (v2) {
    id v3 = [v2 integerValue];
  }
  else {
    id v3 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return (unint64_t)v3;
}

- (void)mt_setSchedulingOptions:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011CE0;
  v3[3] = &unk_10002D060;
  v3[4] = self;
  v3[5] = a3;
  [objc_opt_class() mt_accessSchedulingOptionsByRequestIdentifier:v3];
}

@end