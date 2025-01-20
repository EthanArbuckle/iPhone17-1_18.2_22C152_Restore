@interface PKWebServiceSharingFeature
- (BOOL)enabled;
- (NSArray)activationCodeConfigurations;
- (NSArray)allowedRelayServerHosts;
- (NSArray)relayServerHostsToHandleUniversalLinks;
- (NSArray)relayServerHostsToUseThirdPartyPushTopic;
- (NSDictionary)openGraphPreviewUrls;
- (NSString)relayServerHost;
- (NSURL)staticContentBaseURL;
- (PKWebServiceSharingFeature)initWithDictionary:(id)a3 region:(id)a4;
- (unint64_t)relayServerPasswordLength;
@end

@implementation PKWebServiceSharingFeature

- (PKWebServiceSharingFeature)initWithDictionary:(id)a3 region:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PKWebServiceRegionFeature *)self initWithFeatureType:5 dictionary:v6 region:a4];
  if (v7)
  {
    v7->_relayServerPasswordLength = [v6 PKIntegerForKey:@"relayServerPasswordLength"];
    v8 = [v6 PKArrayContaining:objc_opt_class() forKey:@"activationCodeConfigurations"];
    if (v8)
    {
      v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v34;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
            v16 = [PKWebServiceSharingActivationConfiguration alloc];
            v17 = -[PKWebServiceSharingActivationConfiguration initWithDictionary:](v16, "initWithDictionary:", v15, (void)v33);
            [(NSArray *)v9 safelyAddObject:v17];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v12);
      }

      activationCodeConfigurations = v7->_activationCodeConfigurations;
      v7->_activationCodeConfigurations = v9;
    }
    uint64_t v19 = objc_msgSend(v6, "PKStringForKey:", @"relayServerHost", (void)v33);
    relayServerHost = v7->_relayServerHost;
    v7->_relayServerHost = (NSString *)v19;

    uint64_t v21 = [v6 PKArrayContaining:objc_opt_class() forKey:@"allowedRelayServerHosts"];
    allowedRelayServerHosts = v7->_allowedRelayServerHosts;
    v7->_allowedRelayServerHosts = (NSArray *)v21;

    uint64_t v23 = [v6 PKArrayContaining:objc_opt_class() forKey:@"relayServerHostsToHandleUniversalLinks"];
    relayServerHostsToHandleUniversalLinks = v7->_relayServerHostsToHandleUniversalLinks;
    v7->_relayServerHostsToHandleUniversalLinks = (NSArray *)v23;

    uint64_t v25 = [v6 PKArrayContaining:objc_opt_class() forKey:@"relayServerHostsToUseThirdPartyPushTopic"];
    relayServerHostsToUseThirdPartyPushTopic = v7->_relayServerHostsToUseThirdPartyPushTopic;
    v7->_relayServerHostsToUseThirdPartyPushTopic = (NSArray *)v25;

    uint64_t v27 = [v6 PKURLForKey:@"staticContentBaseURL"];
    staticContentBaseURL = v7->_staticContentBaseURL;
    v7->_staticContentBaseURL = (NSURL *)v27;

    uint64_t v29 = [v6 PKDictionaryForKey:@"openGraphPreviewUrls"];
    openGraphPreviewUrls = v7->_openGraphPreviewUrls;
    v7->_openGraphPreviewUrls = (NSDictionary *)v29;

    v31 = [v6 objectForKeyedSubscript:@"enabled"];

    if (v31) {
      v7->_enabled = [v6 PKBoolForKey:@"enabled"];
    }
    else {
      v7->_enabled = 1;
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openGraphPreviewUrls, 0);
  objc_storeStrong((id *)&self->_staticContentBaseURL, 0);
  objc_storeStrong((id *)&self->_relayServerHostsToUseThirdPartyPushTopic, 0);
  objc_storeStrong((id *)&self->_relayServerHostsToHandleUniversalLinks, 0);
  objc_storeStrong((id *)&self->_activationCodeConfigurations, 0);
  objc_storeStrong((id *)&self->_allowedRelayServerHosts, 0);
  objc_storeStrong((id *)&self->_relayServerHost, 0);
}

- (NSArray)activationCodeConfigurations
{
  return self->_activationCodeConfigurations;
}

- (unint64_t)relayServerPasswordLength
{
  return self->_relayServerPasswordLength;
}

- (NSString)relayServerHost
{
  return self->_relayServerHost;
}

- (NSArray)allowedRelayServerHosts
{
  return self->_allowedRelayServerHosts;
}

- (NSArray)relayServerHostsToHandleUniversalLinks
{
  return self->_relayServerHostsToHandleUniversalLinks;
}

- (NSArray)relayServerHostsToUseThirdPartyPushTopic
{
  return self->_relayServerHostsToUseThirdPartyPushTopic;
}

- (NSURL)staticContentBaseURL
{
  return self->_staticContentBaseURL;
}

- (NSDictionary)openGraphPreviewUrls
{
  return self->_openGraphPreviewUrls;
}

- (BOOL)enabled
{
  return self->_enabled;
}

@end