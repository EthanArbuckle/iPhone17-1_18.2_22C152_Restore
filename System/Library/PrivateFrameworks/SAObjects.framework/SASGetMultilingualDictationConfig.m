@interface SASGetMultilingualDictationConfig
+ (id)getMultilingualDictationConfig;
- (BOOL)multilingualDisabled;
- (BOOL)requiresResponse;
- (NSNumber)multilingualTimeoutInMillis;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMultilingualDisabled:(BOOL)a3;
- (void)setMultilingualTimeoutInMillis:(id)a3;
@end

@implementation SASGetMultilingualDictationConfig

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"GetMultilingualDictationConfig";
}

+ (id)getMultilingualDictationConfig
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)multilingualDisabled
{
  return AceObjectBoolForProperty(self, @"multilingualDisabled");
}

- (void)setMultilingualDisabled:(BOOL)a3
{
}

- (NSNumber)multilingualTimeoutInMillis
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"multilingualTimeoutInMillis"];
}

- (void)setMultilingualTimeoutInMillis:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end