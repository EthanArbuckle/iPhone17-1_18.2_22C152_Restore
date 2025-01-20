@interface SASiriKitSetting
+ (id)siriKitSetting;
- (BOOL)applySASToFirstPartyDomains;
- (BOOL)useSASAutoSelectionFeature;
- (NSArray)listOfSiriKitEnabledDomains;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplySASToFirstPartyDomains:(BOOL)a3;
- (void)setListOfSiriKitEnabledDomains:(id)a3;
- (void)setUseSASAutoSelectionFeature:(BOOL)a3;
@end

@implementation SASiriKitSetting

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SiriKitSetting";
}

+ (id)siriKitSetting
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)applySASToFirstPartyDomains
{
  return AceObjectBoolForProperty(self, @"applySASToFirstPartyDomains");
}

- (void)setApplySASToFirstPartyDomains:(BOOL)a3
{
}

- (NSArray)listOfSiriKitEnabledDomains
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"listOfSiriKitEnabledDomains"];
}

- (void)setListOfSiriKitEnabledDomains:(id)a3
{
}

- (BOOL)useSASAutoSelectionFeature
{
  return AceObjectBoolForProperty(self, @"useSASAutoSelectionFeature");
}

- (void)setUseSASAutoSelectionFeature:(BOOL)a3
{
}

@end