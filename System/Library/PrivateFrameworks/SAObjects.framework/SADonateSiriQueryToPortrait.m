@interface SADonateSiriQueryToPortrait
+ (id)donateSiriQueryToPortrait;
- (BOOL)requiresResponse;
- (NSString)domain;
- (NSString)originalQuery;
- (NSString)qid;
- (double)rankerConfidence;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)rank;
- (void)setDomain:(id)a3;
- (void)setOriginalQuery:(id)a3;
- (void)setQid:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setRankerConfidence:(double)a3;
@end

@implementation SADonateSiriQueryToPortrait

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DonateSiriQueryToPortrait";
}

+ (id)donateSiriQueryToPortrait
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)domain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domain"];
}

- (void)setDomain:(id)a3
{
}

- (NSString)originalQuery
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originalQuery"];
}

- (void)setOriginalQuery:(id)a3
{
}

- (NSString)qid
{
  return (NSString *)[(AceObject *)self propertyForKey:@"qid"];
}

- (void)setQid:(id)a3
{
}

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, @"rank");
}

- (void)setRank:(int64_t)a3
{
}

- (double)rankerConfidence
{
  return AceObjectDoubleForProperty(self, @"rankerConfidence");
}

- (void)setRankerConfidence:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end