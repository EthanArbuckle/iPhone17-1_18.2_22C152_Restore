@interface SAUIAppPunchOut
+ (id)appPunchOut;
- (BOOL)appAvailableInStorefront;
- (BOOL)appInstalled;
- (BOOL)launchOverSiri;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)launchOptions;
- (NSArray)themeIcons;
- (NSDictionary)appIconMap;
- (NSString)appDisplayName;
- (NSString)bundleId;
- (NSString)predefinedButtonType;
- (NSString)providerId;
- (NSString)punchOutName;
- (NSString)subtitle;
- (NSURL)appStoreUri;
- (NSURL)punchOutUri;
- (SAUIAddViews)alternativePunchOut;
- (SAUIImageResource)appIcon;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlternativePunchOut:(id)a3;
- (void)setAppAvailableInStorefront:(BOOL)a3;
- (void)setAppDisplayName:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setAppIconMap:(id)a3;
- (void)setAppInstalled:(BOOL)a3;
- (void)setAppStoreUri:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setLaunchOverSiri:(BOOL)a3;
- (void)setPredefinedButtonType:(id)a3;
- (void)setProviderId:(id)a3;
- (void)setPunchOutName:(id)a3;
- (void)setPunchOutUri:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThemeIcons:(id)a3;
@end

@implementation SAUIAppPunchOut

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AppPunchOut";
}

+ (id)appPunchOut
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAddViews)alternativePunchOut
{
  return (SAUIAddViews *)AceObjectAceObjectForProperty(self, @"alternativePunchOut");
}

- (void)setAlternativePunchOut:(id)a3
{
}

- (BOOL)appAvailableInStorefront
{
  return AceObjectBoolForProperty(self, @"appAvailableInStorefront");
}

- (void)setAppAvailableInStorefront:(BOOL)a3
{
}

- (NSString)appDisplayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appDisplayName"];
}

- (void)setAppDisplayName:(id)a3
{
}

- (SAUIImageResource)appIcon
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"appIcon");
}

- (void)setAppIcon:(id)a3
{
}

- (NSDictionary)appIconMap
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"appIconMap", v3);
}

- (void)setAppIconMap:(id)a3
{
}

- (BOOL)appInstalled
{
  return AceObjectBoolForProperty(self, @"appInstalled");
}

- (void)setAppInstalled:(BOOL)a3
{
}

- (NSURL)appStoreUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"appStoreUri");
}

- (void)setAppStoreUri:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (NSArray)launchOptions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"launchOptions"];
}

- (void)setLaunchOptions:(id)a3
{
}

- (BOOL)launchOverSiri
{
  return AceObjectBoolForProperty(self, @"launchOverSiri");
}

- (void)setLaunchOverSiri:(BOOL)a3
{
}

- (NSString)predefinedButtonType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"predefinedButtonType"];
}

- (void)setPredefinedButtonType:(id)a3
{
}

- (NSString)providerId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerId"];
}

- (void)setProviderId:(id)a3
{
}

- (NSString)punchOutName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"punchOutName"];
}

- (void)setPunchOutName:(id)a3
{
}

- (NSURL)punchOutUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"punchOutUri");
}

- (void)setPunchOutUri:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subtitle"];
}

- (void)setSubtitle:(id)a3
{
}

- (NSArray)themeIcons
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"themeIcons", v3);
}

- (void)setThemeIcons:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end