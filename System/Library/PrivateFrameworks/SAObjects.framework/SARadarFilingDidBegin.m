@interface SARadarFilingDidBegin
+ (id)filingDidBegin;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SARadarFilingDidBegin

- (id)groupIdentifier
{
  return @"com.apple.ace.radar";
}

- (id)encodedClassName
{
  return @"FilingDidBegin";
}

+ (id)filingDidBegin
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end