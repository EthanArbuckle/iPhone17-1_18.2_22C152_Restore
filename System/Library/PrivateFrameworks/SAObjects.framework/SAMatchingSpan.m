@interface SAMatchingSpan
+ (id)matchingSpan;
- (NSURL)domainObjectIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)endIndex;
- (int64_t)startIndex;
- (void)setDomainObjectIdentifier:(id)a3;
- (void)setEndIndex:(int64_t)a3;
- (void)setStartIndex:(int64_t)a3;
@end

@implementation SAMatchingSpan

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"MatchingSpan";
}

+ (id)matchingSpan
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

- (int64_t)endIndex
{
  return AceObjectIntegerForProperty(self, @"endIndex");
}

- (void)setEndIndex:(int64_t)a3
{
}

- (int64_t)startIndex
{
  return AceObjectIntegerForProperty(self, @"startIndex");
}

- (void)setStartIndex:(int64_t)a3
{
}

@end