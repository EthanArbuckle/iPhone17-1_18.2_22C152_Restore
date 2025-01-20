@interface UNNotificationRequest(Analytics)
- (uint64_t)hksp_analyticsSleepNotificationType;
- (uint64_t)hksp_shouldSubmitAnalytics;
@end

@implementation UNNotificationRequest(Analytics)

- (uint64_t)hksp_shouldSubmitAnalytics
{
  v2 = [a1 content];
  v3 = [v2 categoryIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x263F75A48]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [a1 content];
    v6 = [v5 categoryIdentifier];
    if ([v6 isEqualToString:*MEMORY[0x263F75D88]])
    {
      uint64_t v4 = 1;
    }
    else
    {
      v7 = [a1 content];
      v8 = [v7 categoryIdentifier];
      uint64_t v4 = [v8 isEqualToString:*MEMORY[0x263F75AA8]];
    }
  }

  return v4;
}

- (uint64_t)hksp_analyticsSleepNotificationType
{
  v1 = [a1 content];
  v2 = [v1 categoryIdentifier];
  unsigned int v3 = [v2 isEqualToString:*MEMORY[0x263F75AA8]];

  return v3;
}

@end