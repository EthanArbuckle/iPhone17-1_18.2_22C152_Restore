@interface VSIdentityProviderChannelAppsResponse
- (NSArray)allApps;
- (NSDictionary)appsByChannelID;
- (VSIdentityProviderChannelAppsResponse)init;
- (void)setAllApps:(id)a3;
- (void)setAppsByChannelID:(id)a3;
@end

@implementation VSIdentityProviderChannelAppsResponse

- (VSIdentityProviderChannelAppsResponse)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSIdentityProviderChannelAppsResponse;
  v2 = [(VSIdentityProviderChannelAppsResponse *)&v7 init];
  v3 = v2;
  if (v2)
  {
    allApps = v2->_allApps;
    v2->_allApps = (NSArray *)MEMORY[0x263EFFA68];

    appsByChannelID = v3->_appsByChannelID;
    v3->_appsByChannelID = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v3;
}

- (NSArray)allApps
{
  return self->_allApps;
}

- (void)setAllApps:(id)a3
{
}

- (NSDictionary)appsByChannelID
{
  return self->_appsByChannelID;
}

- (void)setAppsByChannelID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsByChannelID, 0);
  objc_storeStrong((id *)&self->_allApps, 0);
}

@end