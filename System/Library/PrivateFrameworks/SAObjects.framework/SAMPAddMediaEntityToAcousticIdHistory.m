@interface SAMPAddMediaEntityToAcousticIdHistory
+ (id)addMediaEntityToAcousticIdHistory;
- (BOOL)requiresResponse;
- (NSString)adamId;
- (NSString)affiliateId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdamId:(id)a3;
- (void)setAffiliateId:(id)a3;
@end

@implementation SAMPAddMediaEntityToAcousticIdHistory

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"AddMediaEntityToAcousticIdHistory";
}

+ (id)addMediaEntityToAcousticIdHistory
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)adamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"adamId"];
}

- (void)setAdamId:(id)a3
{
}

- (NSString)affiliateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"affiliateId"];
}

- (void)setAffiliateId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end