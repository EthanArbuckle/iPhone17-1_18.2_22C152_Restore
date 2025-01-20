@interface SASPronunciationData
+ (id)pronunciationData;
- (NSArray)ttsPronunciations;
- (NSString)apgId;
- (NSString)language;
- (NSString)orthography;
- (NSString)ttsVersion;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)tokenOffset;
- (void)setApgId:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setTokenOffset:(int64_t)a3;
- (void)setTtsPronunciations:(id)a3;
- (void)setTtsVersion:(id)a3;
@end

@implementation SASPronunciationData

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"PronunciationData";
}

+ (id)pronunciationData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)apgId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"apgId"];
}

- (void)setApgId:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSString)orthography
{
  return (NSString *)[(AceObject *)self propertyForKey:@"orthography"];
}

- (void)setOrthography:(id)a3
{
}

- (int64_t)tokenOffset
{
  return AceObjectIntegerForProperty(self, @"tokenOffset");
}

- (void)setTokenOffset:(int64_t)a3
{
}

- (NSArray)ttsPronunciations
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"ttsPronunciations"];
}

- (void)setTtsPronunciations:(id)a3
{
}

- (NSString)ttsVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"ttsVersion"];
}

- (void)setTtsVersion:(id)a3
{
}

@end