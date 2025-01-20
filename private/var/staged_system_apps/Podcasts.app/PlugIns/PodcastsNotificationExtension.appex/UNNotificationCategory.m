@interface UNNotificationCategory
+ (id)mt_allSupportedLocalNotificationCategories;
+ (id)mt_allSupportedNotificationCategories;
+ (id)mt_localNotificationForAnnouncements;
+ (id)mt_localNotificationForNewEpisodesAvailable;
@end

@implementation UNNotificationCategory

+ (id)mt_allSupportedLocalNotificationCategories
{
  v2 = +[UNNotificationCategory mt_localNotificationForNewEpisodesAvailable];
  v6[0] = v2;
  v3 = +[UNNotificationCategory mt_localNotificationForAnnouncements];
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)mt_allSupportedNotificationCategories
{
  v2 = [a1 mt_allSupportedLocalNotificationCategories];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (id)mt_localNotificationForAnnouncements
{
  return +[UNNotificationCategory categoryWithIdentifier:@"com.apple.podcasts.announcement" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct hiddenPreviewsBodyPlaceholder:0 categorySummaryFormat:0 options:0];
}

+ (id)mt_localNotificationForNewEpisodesAvailable
{
  v2 = +[NSString localizedUserNotificationStringForKey:@"NOTIFICATION_EPISODES_AVAILABLE_COALESCING_SUMMARY_FORMAT" arguments:0];
  v3 = +[NSString localizedUserNotificationStringForKey:@"NOTIFICATION_HIDDEN_PREVIEWS_BODY" arguments:0];
  v4 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.podcasts.newEpisodesAvailable" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct hiddenPreviewsBodyPlaceholder:v3 categorySummaryFormat:v2 options:0];

  return v4;
}

@end