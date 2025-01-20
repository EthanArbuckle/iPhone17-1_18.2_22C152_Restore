@interface UNMutableNotificationContent
- (void)mt_setUserInfoEpisode:(id)a3;
- (void)mt_setUserInfoPodcastUuid:(id)a3 episodes:(id)a4;
@end

@implementation UNMutableNotificationContent

- (void)mt_setUserInfoPodcastUuid:(id)a3 episodes:(id)a4
{
  id v6 = a4;
  v7 = (__CFString *)a3;
  v8 = [(UNMutableNotificationContent *)self userInfo];
  id v9 = [v8 mutableCopy];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSMutableDictionary dictionary];
  }
  id v16 = v11;

  if (v7) {
    CFStringRef v12 = v7;
  }
  else {
    CFStringRef v12 = &stru_10056A8A0;
  }
  [v16 setObject:v12 forKeyedSubscript:@"podcastUuid"];

  v13 = NSStringFromSelector("dictionaryRepresentation");
  v14 = [v6 valueForKey:v13];

  if (v14) {
    v15 = v14;
  }
  else {
    v15 = &__NSDictionary0__struct;
  }
  [v16 setObject:v15 forKeyedSubscript:@"notificationEpisodeDictionaryRepresentations"];
  [(UNMutableNotificationContent *)self setUserInfo:v16];
}

- (void)mt_setUserInfoEpisode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 podcastUuid];
  id v6 = (void *)v5;
  v7 = &stru_10056A8A0;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  id v10 = v4;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];

  [(UNMutableNotificationContent *)self mt_setUserInfoPodcastUuid:v8 episodes:v9];
}

@end