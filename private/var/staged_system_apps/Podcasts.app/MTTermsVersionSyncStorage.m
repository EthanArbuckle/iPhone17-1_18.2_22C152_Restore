@interface MTTermsVersionSyncStorage
- (BOOL)cloudSyncIsDirty;
- (NSNumber)accountAgreedTermsVersion;
- (NSNumber)deviceAgreedTermsVersion;
- (NSString)cloudSyncVersion;
- (NSString)podcastsDomainVersion;
- (void)setAccountAgreedTermsVersion:(id)a3;
- (void)setCloudSyncIsDirty:(BOOL)a3;
- (void)setCloudSyncVersion:(id)a3;
- (void)setDeviceAgreedTermsVersion:(id)a3;
- (void)setPodcastsDomainVersion:(id)a3;
@end

@implementation MTTermsVersionSyncStorage

- (BOOL)cloudSyncIsDirty
{
  return +[MTPrivacyUtil cloudSyncIsDirty];
}

- (void)setCloudSyncIsDirty:(BOOL)a3
{
}

- (NSString)cloudSyncVersion
{
  return +[MTPrivacyUtil cloudSyncVersion];
}

- (void)setCloudSyncVersion:(id)a3
{
}

- (NSNumber)deviceAgreedTermsVersion
{
  return +[MTPrivacyUtil deviceAgreedTermsVersion];
}

- (void)setDeviceAgreedTermsVersion:(id)a3
{
}

- (NSNumber)accountAgreedTermsVersion
{
  return +[MTPrivacyUtil accountAgreedTermsVersion];
}

- (void)setAccountAgreedTermsVersion:(id)a3
{
}

- (NSString)podcastsDomainVersion
{
  v2 = +[SyncKeysRepository shared];
  v3 = [v2 podcastsDomainVersion];

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3 = a3;
  id v4 = +[SyncKeysRepository shared];
  [v4 setPodcastsDomainVersion:v3];
}

@end