@interface MTPrivacyUtil
+ (BOOL)allowReporting;
+ (BOOL)cloudSyncIsDirty;
+ (BOOL)privacyAcknowledgementNeeded;
+ (BOOL)shouldShowPodcastsTermsScreen;
+ (NSNumber)accountAgreedTermsVersion;
+ (NSNumber)deviceAgreedTermsVersion;
+ (NSString)cloudSyncVersion;
+ (void)markAsAgreedToLatestTerms;
+ (void)resetToInitialState;
+ (void)setAccountAgreedTermsVersion:(id)a3;
+ (void)setCloudSyncIsDirty:(BOOL)a3;
+ (void)setCloudSyncVersion:(id)a3;
+ (void)setDeviceAgreedTermsVersion:(id)a3;
@end

@implementation MTPrivacyUtil

+ (BOOL)shouldShowPodcastsTermsScreen
{
  v2 = [a1 deviceAgreedTermsVersion];
  BOOL v3 = (uint64_t)[v2 integerValue] < 2;

  return v3;
}

+ (NSNumber)deviceAgreedTermsVersion
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  BOOL v3 = [v2 objectForKey:@"MTDeviceAgreedTermsVersion"];

  return (NSNumber *)v3;
}

+ (NSString)cloudSyncVersion
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  BOOL v3 = [v2 objectForKey:@"MTAgreedTermsCloudSyncVersion"];

  return (NSString *)v3;
}

+ (BOOL)privacyAcknowledgementNeeded
{
  if ([a1 shouldShowPodcastsTermsScreen]) {
    return 1;
  }
  uint64_t v3 = kMTPodcastsPrivacyIdentifier;

  return +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:v3];
}

+ (void)markAsAgreedToLatestTerms
{
  uint64_t v3 = [a1 deviceAgreedTermsVersion];
  uint64_t v4 = (uint64_t)[v3 integerValue];

  if (v4 <= 1)
  {
    [a1 setDeviceAgreedTermsVersion:&off_1005799C8];
    [a1 setCloudSyncIsDirty:1];
    id v5 = +[SyncControllerFactory resolvedSyncController];
    [v5 syncTermsVersion];
  }
}

+ (void)resetToInitialState
{
  [a1 setDeviceAgreedTermsVersion:0];
  [a1 setAccountAgreedTermsVersion:0];
  [a1 setCloudSyncVersion:0];

  [a1 setCloudSyncIsDirty:0];
}

+ (BOOL)allowReporting
{
  v2 = [a1 deviceAgreedTermsVersion];
  BOOL v3 = (uint64_t)[v2 integerValue] > 1;

  return v3;
}

+ (void)setDeviceAgreedTermsVersion:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  uint64_t v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"MTDeviceAgreedTermsVersion"];
  }
  else {
    [v3 removeObjectForKey:@"MTDeviceAgreedTermsVersion"];
  }
}

+ (NSNumber)accountAgreedTermsVersion
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  BOOL v3 = [v2 objectForKey:@"MTAccountAgreedTermsVersion"];

  return (NSNumber *)v3;
}

+ (void)setAccountAgreedTermsVersion:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  uint64_t v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"MTAccountAgreedTermsVersion"];
  }
  else {
    [v3 removeObjectForKey:@"MTAccountAgreedTermsVersion"];
  }
}

+ (BOOL)cloudSyncIsDirty
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"MTAgreedTermsCloudSyncIsDirty"];

  return v3;
}

+ (void)setCloudSyncIsDirty:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  [v4 setBool:v3 forKey:@"MTAgreedTermsCloudSyncIsDirty"];
}

+ (void)setCloudSyncVersion:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  id v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"MTAgreedTermsCloudSyncVersion"];
  }
  else {
    [v3 removeObjectForKey:@"MTAgreedTermsCloudSyncVersion"];
  }
}

@end