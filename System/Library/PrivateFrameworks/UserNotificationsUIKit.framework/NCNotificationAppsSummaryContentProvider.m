@interface NCNotificationAppsSummaryContentProvider
- (BOOL)hideSummaryIconViews;
- (BOOL)isIconViewLeading;
- (id)_summaryStringForNotificationRequest:(id)a3;
- (id)summaryTitle;
- (unint64_t)maxNumberOfSummaryItems;
@end

@implementation NCNotificationAppsSummaryContentProvider

- (id)summaryTitle
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"NOTIFICATION_SUMMARY_APP_TITLE" value:&stru_1F2F516F8 table:0];

  return v3;
}

- (BOOL)isIconViewLeading
{
  return 0;
}

- (id)_summaryStringForNotificationRequest:(id)a3
{
  v3 = [a3 content];
  v4 = [v3 defaultHeader];

  return v4;
}

- (unint64_t)maxNumberOfSummaryItems
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hideSummaryIconViews
{
  return 1;
}

@end