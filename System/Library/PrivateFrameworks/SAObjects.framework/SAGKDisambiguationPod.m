@interface SAGKDisambiguationPod
+ (id)disambiguationPod;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setText:(id)a3;
@end

@implementation SAGKDisambiguationPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"DisambiguationPod";
}

+ (id)disambiguationPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end