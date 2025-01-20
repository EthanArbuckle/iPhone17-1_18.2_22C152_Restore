@interface SADonateRankedQueriesToPortrait
+ (id)donateRankedQueriesToPortrait;
- (BOOL)requiresResponse;
- (NSArray)queryDonations;
- (NSString)resultCandidateId;
- (NSString)utterance;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setQueryDonations:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation SADonateRankedQueriesToPortrait

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DonateRankedQueriesToPortrait";
}

+ (id)donateRankedQueriesToPortrait
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)queryDonations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"queryDonations", v3);
}

- (void)setQueryDonations:(id)a3
{
}

- (NSString)resultCandidateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultCandidateId"];
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)utterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utterance"];
}

- (void)setUtterance:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end