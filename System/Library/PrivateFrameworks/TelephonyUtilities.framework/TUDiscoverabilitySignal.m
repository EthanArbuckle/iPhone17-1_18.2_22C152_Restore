@interface TUDiscoverabilitySignal
+ (BOOL)isSeniorUser;
+ (void)logAnalyticsEventFaceTimeLink;
+ (void)logAnalyticsEventNamed:(id)a3;
+ (void)logAnalyticsEventPhoneAddFavorites;
+ (void)logAnalyticsEventPhoneRecentlyDialed;
+ (void)logAnalyticsEventSpeakerphone;
@end

@implementation TUDiscoverabilitySignal

+ (void)logAnalyticsEventNamed:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 isSeniorUser];
  v9 = @"u65_flag";
  v6 = [NSNumber numberWithBool:v5];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v8 = v7;
  AnalyticsSendEventLazy();
}

id __50__TUDiscoverabilitySignal_logAnalyticsEventNamed___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)isSeniorUser
{
  if (isSeniorUser_predicate != -1) {
    dispatch_once(&isSeniorUser_predicate, &__block_literal_global_8);
  }
  return isSeniorUser_kIsSeniorUser;
}

void __39__TUDiscoverabilitySignal_isSeniorUser__block_invoke()
{
  id v1 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v0 = [v1 primaryAuthKitAccount];
  isSeniorUser_kIsSeniorUser = [v1 userIsSeniorForAccount:v0];
}

+ (void)logAnalyticsEventFaceTimeLink
{
}

+ (void)logAnalyticsEventPhoneAddFavorites
{
}

+ (void)logAnalyticsEventPhoneRecentlyDialed
{
}

+ (void)logAnalyticsEventSpeakerphone
{
}

@end