@interface SAAppInfo
+ (id)appInfo;
- (BOOL)betaApp;
- (BOOL)hasSiriIntegration;
- (BOOL)hidden;
- (BOOL)isMacApp;
- (BOOL)isNanoApp;
- (BOOL)supportsUniversalSearchSubscription;
- (NSArray)appNameSynonyms;
- (NSArray)supportedCommands;
- (NSArray)supportedSchemes;
- (NSDictionary)appNameMap;
- (NSDictionary)appNameSynonymsMap;
- (NSDictionary)carPlayAlternativeDisplayNameMap;
- (NSDictionary)displayAppNameMap;
- (NSDictionary)spokenNameMap;
- (NSDictionary)spotlightNameMap;
- (NSNumber)nowPlayingAppWithBrowsableContent;
- (NSString)adamId;
- (NSString)appId;
- (NSString)appName;
- (NSString)appVersion;
- (NSString)carPlayAlternativeDisplayName;
- (NSString)containerName;
- (NSString)displayAppName;
- (NSString)providerName;
- (NSString)spokenName;
- (NSString)spotlightName;
- (SAGlance)glance;
- (SASiriSupport)siriSupport;
- (SAStarkSupport)starkSupport;
- (SASyncAppIdentifyingInfo)appIdentifyingInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdamId:(id)a3;
- (void)setAppId:(id)a3;
- (void)setAppIdentifyingInfo:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppNameMap:(id)a3;
- (void)setAppNameSynonyms:(id)a3;
- (void)setAppNameSynonymsMap:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setBetaApp:(BOOL)a3;
- (void)setCarPlayAlternativeDisplayName:(id)a3;
- (void)setCarPlayAlternativeDisplayNameMap:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setDisplayAppName:(id)a3;
- (void)setDisplayAppNameMap:(id)a3;
- (void)setGlance:(id)a3;
- (void)setHasSiriIntegration:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsMacApp:(BOOL)a3;
- (void)setIsNanoApp:(BOOL)a3;
- (void)setNowPlayingAppWithBrowsableContent:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setSiriSupport:(id)a3;
- (void)setSpokenName:(id)a3;
- (void)setSpokenNameMap:(id)a3;
- (void)setSpotlightName:(id)a3;
- (void)setSpotlightNameMap:(id)a3;
- (void)setStarkSupport:(id)a3;
- (void)setSupportedCommands:(id)a3;
- (void)setSupportedSchemes:(id)a3;
- (void)setSupportsUniversalSearchSubscription:(BOOL)a3;
@end

@implementation SAAppInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AppInfo";
}

+ (id)appInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)adamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"adamId"];
}

- (void)setAdamId:(id)a3
{
}

- (NSString)appId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appId"];
}

- (void)setAppId:(id)a3
{
}

- (SASyncAppIdentifyingInfo)appIdentifyingInfo
{
  return (SASyncAppIdentifyingInfo *)AceObjectAceObjectForProperty(self, @"appIdentifyingInfo");
}

- (void)setAppIdentifyingInfo:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appName"];
}

- (void)setAppName:(id)a3
{
}

- (NSDictionary)appNameMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"appNameMap"];
}

- (void)setAppNameMap:(id)a3
{
}

- (NSArray)appNameSynonyms
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"appNameSynonyms", v3);
}

- (void)setAppNameSynonyms:(id)a3
{
}

- (NSDictionary)appNameSynonymsMap
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassArrayDictionaryForProperty(self, @"appNameSynonymsMap", v3);
}

- (void)setAppNameSynonymsMap:(id)a3
{
}

- (NSString)appVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appVersion"];
}

- (void)setAppVersion:(id)a3
{
}

- (BOOL)betaApp
{
  return AceObjectBoolForProperty(self, @"betaApp");
}

- (void)setBetaApp:(BOOL)a3
{
}

- (NSString)carPlayAlternativeDisplayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"carPlayAlternativeDisplayName"];
}

- (void)setCarPlayAlternativeDisplayName:(id)a3
{
}

- (NSDictionary)carPlayAlternativeDisplayNameMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"carPlayAlternativeDisplayNameMap"];
}

- (void)setCarPlayAlternativeDisplayNameMap:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"containerName"];
}

- (void)setContainerName:(id)a3
{
}

- (NSString)displayAppName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayAppName"];
}

- (void)setDisplayAppName:(id)a3
{
}

- (NSDictionary)displayAppNameMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"displayAppNameMap"];
}

- (void)setDisplayAppNameMap:(id)a3
{
}

- (SAGlance)glance
{
  return (SAGlance *)AceObjectAceObjectForProperty(self, @"glance");
}

- (void)setGlance:(id)a3
{
}

- (BOOL)hasSiriIntegration
{
  return AceObjectBoolForProperty(self, @"hasSiriIntegration");
}

- (void)setHasSiriIntegration:(BOOL)a3
{
}

- (BOOL)hidden
{
  return AceObjectBoolForProperty(self, @"hidden");
}

- (void)setHidden:(BOOL)a3
{
}

- (BOOL)isMacApp
{
  return AceObjectBoolForProperty(self, @"isMacApp");
}

- (void)setIsMacApp:(BOOL)a3
{
}

- (BOOL)isNanoApp
{
  return AceObjectBoolForProperty(self, @"isNanoApp");
}

- (void)setIsNanoApp:(BOOL)a3
{
}

- (NSNumber)nowPlayingAppWithBrowsableContent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"nowPlayingAppWithBrowsableContent"];
}

- (void)setNowPlayingAppWithBrowsableContent:(id)a3
{
}

- (NSString)providerName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerName"];
}

- (void)setProviderName:(id)a3
{
}

- (SASiriSupport)siriSupport
{
  return (SASiriSupport *)AceObjectAceObjectForProperty(self, @"siriSupport");
}

- (void)setSiriSupport:(id)a3
{
}

- (NSString)spokenName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"spokenName"];
}

- (void)setSpokenName:(id)a3
{
}

- (NSDictionary)spokenNameMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"spokenNameMap"];
}

- (void)setSpokenNameMap:(id)a3
{
}

- (NSString)spotlightName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"spotlightName"];
}

- (void)setSpotlightName:(id)a3
{
}

- (NSDictionary)spotlightNameMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"spotlightNameMap"];
}

- (void)setSpotlightNameMap:(id)a3
{
}

- (SAStarkSupport)starkSupport
{
  return (SAStarkSupport *)AceObjectAceObjectForProperty(self, @"starkSupport");
}

- (void)setStarkSupport:(id)a3
{
}

- (NSArray)supportedCommands
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"supportedCommands", v3);
}

- (void)setSupportedCommands:(id)a3
{
}

- (NSArray)supportedSchemes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"supportedSchemes"];
}

- (void)setSupportedSchemes:(id)a3
{
}

- (BOOL)supportsUniversalSearchSubscription
{
  return AceObjectBoolForProperty(self, @"supportsUniversalSearchSubscription");
}

- (void)setSupportsUniversalSearchSubscription:(BOOL)a3
{
}

@end