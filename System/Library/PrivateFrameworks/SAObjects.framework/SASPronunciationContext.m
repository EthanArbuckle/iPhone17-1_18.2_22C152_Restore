@interface SASPronunciationContext
+ (id)pronunciationContext;
- (NSNumber)tokenOffset;
- (NSString)domainObjectPropertyIdentifier;
- (NSString)fullName;
- (NSString)language;
- (NSString)orthography;
- (NSURL)domainObjectIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomainObjectIdentifier:(id)a3;
- (void)setDomainObjectPropertyIdentifier:(id)a3;
- (void)setFullName:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setTokenOffset:(id)a3;
@end

@implementation SASPronunciationContext

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"PronunciationContext";
}

+ (id)pronunciationContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)domainObjectIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"domainObjectIdentifier");
}

- (void)setDomainObjectIdentifier:(id)a3
{
}

- (NSString)domainObjectPropertyIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainObjectPropertyIdentifier"];
}

- (void)setDomainObjectPropertyIdentifier:(id)a3
{
}

- (NSString)fullName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fullName"];
}

- (void)setFullName:(id)a3
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

- (NSNumber)tokenOffset
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"tokenOffset"];
}

- (void)setTokenOffset:(id)a3
{
}

@end