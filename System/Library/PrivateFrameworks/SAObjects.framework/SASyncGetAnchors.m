@interface SASyncGetAnchors
+ (id)getAnchors;
- (BOOL)companionOfMUDevice;
- (BOOL)includeAllKnownAnchors;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)appMetaDataList;
- (NSArray)sources;
- (NSArray)watchAppMetaDataList;
- (NSDictionary)customVocabSources;
- (NSString)authToken;
- (NSString)primeToken;
- (NSString)syncReason;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppMetaDataList:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setCompanionOfMUDevice:(BOOL)a3;
- (void)setCustomVocabSources:(id)a3;
- (void)setIncludeAllKnownAnchors:(BOOL)a3;
- (void)setPrimeToken:(id)a3;
- (void)setSources:(id)a3;
- (void)setSyncReason:(id)a3;
- (void)setWatchAppMetaDataList:(id)a3;
@end

@implementation SASyncGetAnchors

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"GetAnchors";
}

+ (id)getAnchors
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appMetaDataList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"appMetaDataList", v3);
}

- (void)setAppMetaDataList:(id)a3
{
}

- (NSString)authToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"authToken"];
}

- (void)setAuthToken:(id)a3
{
}

- (BOOL)companionOfMUDevice
{
  return AceObjectBoolForProperty(self, @"companionOfMUDevice");
}

- (void)setCompanionOfMUDevice:(BOOL)a3
{
}

- (NSDictionary)customVocabSources
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"customVocabSources"];
}

- (void)setCustomVocabSources:(id)a3
{
}

- (BOOL)includeAllKnownAnchors
{
  return AceObjectBoolForProperty(self, @"includeAllKnownAnchors");
}

- (void)setIncludeAllKnownAnchors:(BOOL)a3
{
}

- (NSString)primeToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"primeToken"];
}

- (void)setPrimeToken:(id)a3
{
}

- (NSArray)sources
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"sources"];
}

- (void)setSources:(id)a3
{
}

- (NSString)syncReason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"syncReason"];
}

- (void)setSyncReason:(id)a3
{
}

- (NSArray)watchAppMetaDataList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"watchAppMetaDataList", v3);
}

- (void)setWatchAppMetaDataList:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end