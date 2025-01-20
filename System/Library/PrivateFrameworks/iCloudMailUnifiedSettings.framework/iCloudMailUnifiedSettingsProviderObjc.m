@interface iCloudMailUnifiedSettingsProviderObjc
- (iCloudMailUnifiedSettingsProviderObjc)initWithAccountManager:(id)a3 presenter:(id)a4;
- (iCloudMailUnifiedSettingsProviderObjc)initWithPresenter:(id)a3;
- (void)navigateToiCloudMailSettings;
- (void)navigateToiCloudMailSettingsWithDeeplink:(id)a3;
@end

@implementation iCloudMailUnifiedSettingsProviderObjc

- (iCloudMailUnifiedSettingsProviderObjc)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)iCloudMailUnifiedSettingsProviderObjc;
  v8 = [(iCloudMailUnifiedSettingsProviderObjc *)&v12 init];
  if (v8)
  {
    v9 = [[iCloudMailUnifiedSettingsProvider alloc] initWithAccountManager:v6 presenter:v7];
    provider = v8->provider;
    v8->provider = v9;
  }
  return v8;
}

- (iCloudMailUnifiedSettingsProviderObjc)initWithPresenter:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)iCloudMailUnifiedSettingsProviderObjc;
  v5 = [(iCloudMailUnifiedSettingsProviderObjc *)&v9 init];
  if (v5)
  {
    id v6 = [[iCloudMailUnifiedSettingsProvider alloc] initWithPresenter:v4];
    provider = v5->provider;
    v5->provider = v6;
  }
  return v5;
}

- (void)navigateToiCloudMailSettings
{
}

- (void)navigateToiCloudMailSettingsWithDeeplink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end