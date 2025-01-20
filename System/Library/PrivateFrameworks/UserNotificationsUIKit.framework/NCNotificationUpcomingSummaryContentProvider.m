@interface NCNotificationUpcomingSummaryContentProvider
- (BOOL)isIconViewLeading;
- (id)_summaryStringForNotificationRequest:(id)a3;
@end

@implementation NCNotificationUpcomingSummaryContentProvider

- (BOOL)isIconViewLeading
{
  return 1;
}

- (id)_summaryStringForNotificationRequest:(id)a3
{
  id v4 = a3;
  v5 = [(NCNotificationSummaryContentProvider *)self _summaryStringForCommunicationNotificationRequest:v4];
  if ([(NCNotificationSummaryContentProvider *)self _shouldShowContentForNotificationRequest:v4]&& v5)
  {
    id v6 = v5;
  }
  else
  {
    v7 = [v4 content];
    id v6 = [v7 defaultHeader];
  }

  return v6;
}

@end