@interface NCNotificationCommunicationsSummaryContentProvider
- (BOOL)isIconViewLeading;
- (id)_summaryStringForNotificationRequest:(id)a3;
- (id)summaryTitle;
@end

@implementation NCNotificationCommunicationsSummaryContentProvider

- (id)summaryTitle
{
  v3 = [(NCNotificationSummaryContentProvider *)self notificationRequests];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_36];

  v5 = [(NCNotificationSummaryContentProvider *)self notificationRequests];
  uint64_t v6 = [v5 indexOfObjectPassingTest:&__block_literal_global_165];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = NCUserNotificationsUIKitFrameworkBundle();
    v9 = [v8 localizedStringForKey:@"NOTIFICATION_SUMMARY_COMMUNICATION_CALLS" value:&stru_1F2F516F8 table:0];
    v7 = [&stru_1F2F516F8 stringByAppendingString:v9];

    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    v10 = NCUserNotificationsUIKitFrameworkBundle();
    v11 = [v10 localizedStringForKey:@"NOTIFICATION_SUMMARY_CONNECTOR_AND" value:&stru_1F2F516F8 table:0];
    uint64_t v12 = [(__CFString *)v7 stringByAppendingFormat:@" %@ ", v11];

    v7 = (__CFString *)v12;
    goto LABEL_6;
  }
  v7 = &stru_1F2F516F8;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    v13 = NCUserNotificationsUIKitFrameworkBundle();
    v14 = [v13 localizedStringForKey:@"NOTIFICATION_SUMMARY_COMMUNICATION_MESSAGES" value:&stru_1F2F516F8 table:0];
    uint64_t v15 = [(__CFString *)v7 stringByAppendingString:v14];

    v7 = (__CFString *)v15;
  }
LABEL_7:

  return v7;
}

uint64_t __66__NCNotificationCommunicationsSummaryContentProvider_summaryTitle__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 content];
  uint64_t v3 = [v2 isMessagingType];

  return v3;
}

uint64_t __66__NCNotificationCommunicationsSummaryContentProvider_summaryTitle__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 content];
  uint64_t v3 = [v2 isCallType];

  return v3;
}

- (BOOL)isIconViewLeading
{
  return 0;
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