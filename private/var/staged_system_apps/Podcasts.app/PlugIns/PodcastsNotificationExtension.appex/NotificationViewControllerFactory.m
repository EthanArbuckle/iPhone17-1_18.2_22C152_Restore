@interface NotificationViewControllerFactory
+ (id)contentAvailableViewControllerForNotification:(id)a3;
+ (id)viewControllerMultipleNotificationEpisodes:(id)a3 notification:(id)a4;
+ (id)viewControllerSingleNotificationEpisode:(id)a3 notification:(id)a4;
@end

@implementation NotificationViewControllerFactory

+ (id)contentAvailableViewControllerForNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 request];
  v6 = [v5 content];
  v7 = [v6 mt_notificationEpisodes];

  if ((unint64_t)[v7 count] < 2)
  {
    v9 = [v7 firstObject];
    v8 = [a1 viewControllerSingleNotificationEpisode:v9 notification:v4];
  }
  else
  {
    v8 = [a1 viewControllerMultipleNotificationEpisodes:v7 notification:v4];
  }

  return v8;
}

+ (id)viewControllerSingleNotificationEpisode:(id)a3 notification:(id)a4
{
  id v4 = a4;
  v5 = [[EpisodeAvailableViewController alloc] initWithNotification:v4];

  return v5;
}

+ (id)viewControllerMultipleNotificationEpisodes:(id)a3 notification:(id)a4
{
  id v5 = a4;
  v6 = [a3 mt_compactMap:&stru_10002CBA0];
  v7 = +[NSSet setWithArray:v6];
  id v8 = [v7 count];

  if ((unint64_t)v8 >= 2)
  {
    v9 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Stack of multiple notifications referencing multiple podcast is not supported", v12, 2u);
    }
  }
  v10 = [[EpisodeListAvailableViewController alloc] initWithNotification:v5];

  return v10;
}

@end