@interface SASVSpeechMetadata
+ (id)speechMetadata;
- (NSArray)phraseDataList;
- (NSString)preITN;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPhraseDataList:(id)a3;
- (void)setPreITN:(id)a3;
@end

@implementation SASVSpeechMetadata

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"SpeechMetadata";
}

+ (id)speechMetadata
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)phraseDataList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"phraseDataList", v3);
}

- (void)setPhraseDataList:(id)a3
{
}

- (NSString)preITN
{
  return (NSString *)[(AceObject *)self propertyForKey:@"preITN"];
}

- (void)setPreITN:(id)a3
{
}

@end