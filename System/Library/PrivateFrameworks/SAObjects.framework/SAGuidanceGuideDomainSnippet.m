@interface SAGuidanceGuideDomainSnippet
+ (id)guideDomainSnippet;
- (BOOL)enabledInOfflineMode;
- (BOOL)enabledInOnlineMode;
- (BOOL)iconNeedsProcessing;
- (BOOL)isAppIcon;
- (BOOL)performIntentEnabledAppAuthorizationCheck;
- (NSArray)guideSections;
- (NSString)domainAlternateDisplayName;
- (NSString)domainDisplayName;
- (NSString)domainName;
- (NSString)iconDisplayIdentifier;
- (NSString)iconResourceName;
- (NSString)tagPhrase;
- (NSURL)domainIconURI;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomainAlternateDisplayName:(id)a3;
- (void)setDomainDisplayName:(id)a3;
- (void)setDomainIconURI:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setEnabledInOfflineMode:(BOOL)a3;
- (void)setEnabledInOnlineMode:(BOOL)a3;
- (void)setGuideSections:(id)a3;
- (void)setIconDisplayIdentifier:(id)a3;
- (void)setIconNeedsProcessing:(BOOL)a3;
- (void)setIconResourceName:(id)a3;
- (void)setIsAppIcon:(BOOL)a3;
- (void)setPerformIntentEnabledAppAuthorizationCheck:(BOOL)a3;
- (void)setTagPhrase:(id)a3;
@end

@implementation SAGuidanceGuideDomainSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.guidance";
}

- (id)encodedClassName
{
  return @"GuideDomainSnippet";
}

+ (id)guideDomainSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)domainAlternateDisplayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainAlternateDisplayName"];
}

- (void)setDomainAlternateDisplayName:(id)a3
{
}

- (NSString)domainDisplayName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainDisplayName"];
}

- (void)setDomainDisplayName:(id)a3
{
}

- (NSURL)domainIconURI
{
  return (NSURL *)AceObjectURLForProperty(self, @"domainIconURI");
}

- (void)setDomainIconURI:(id)a3
{
}

- (NSString)domainName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainName"];
}

- (void)setDomainName:(id)a3
{
}

- (BOOL)enabledInOfflineMode
{
  return AceObjectBoolForProperty(self, @"enabledInOfflineMode");
}

- (void)setEnabledInOfflineMode:(BOOL)a3
{
}

- (BOOL)enabledInOnlineMode
{
  return AceObjectBoolForProperty(self, @"enabledInOnlineMode");
}

- (void)setEnabledInOnlineMode:(BOOL)a3
{
}

- (NSArray)guideSections
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"guideSections", v3);
}

- (void)setGuideSections:(id)a3
{
}

- (NSString)iconDisplayIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"iconDisplayIdentifier"];
}

- (void)setIconDisplayIdentifier:(id)a3
{
}

- (BOOL)iconNeedsProcessing
{
  return AceObjectBoolForProperty(self, @"iconNeedsProcessing");
}

- (void)setIconNeedsProcessing:(BOOL)a3
{
}

- (NSString)iconResourceName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"iconResourceName"];
}

- (void)setIconResourceName:(id)a3
{
}

- (BOOL)isAppIcon
{
  return AceObjectBoolForProperty(self, @"isAppIcon");
}

- (void)setIsAppIcon:(BOOL)a3
{
}

- (BOOL)performIntentEnabledAppAuthorizationCheck
{
  return AceObjectBoolForProperty(self, @"performIntentEnabledAppAuthorizationCheck");
}

- (void)setPerformIntentEnabledAppAuthorizationCheck:(BOOL)a3
{
}

- (NSString)tagPhrase
{
  return (NSString *)[(AceObject *)self propertyForKey:@"tagPhrase"];
}

- (void)setTagPhrase:(id)a3
{
}

@end