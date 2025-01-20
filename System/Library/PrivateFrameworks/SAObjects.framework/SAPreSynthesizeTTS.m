@interface SAPreSynthesizeTTS
+ (id)preSynthesizeTTS;
- (BOOL)requiresResponse;
- (NSArray)aceAudioData;
- (NSArray)dialogStrings;
- (NSArray)streamIds;
- (NSDictionary)speakableContextInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceAudioData:(id)a3;
- (void)setDialogStrings:(id)a3;
- (void)setSpeakableContextInfo:(id)a3;
- (void)setStreamIds:(id)a3;
@end

@implementation SAPreSynthesizeTTS

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PreSynthesizeTTS";
}

+ (id)preSynthesizeTTS
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)aceAudioData
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"aceAudioData", v3);
}

- (void)setAceAudioData:(id)a3
{
}

- (NSArray)dialogStrings
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"dialogStrings"];
}

- (void)setDialogStrings:(id)a3
{
}

- (NSDictionary)speakableContextInfo
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"speakableContextInfo"];
}

- (void)setSpeakableContextInfo:(id)a3
{
}

- (NSArray)streamIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"streamIds"];
}

- (void)setStreamIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end