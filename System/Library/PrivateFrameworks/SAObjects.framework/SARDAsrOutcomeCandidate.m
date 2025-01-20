@interface SARDAsrOutcomeCandidate
+ (id)asrOutcomeCandidate;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SARDAsrOutcomeCandidate

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"AsrOutcomeCandidate";
}

+ (id)asrOutcomeCandidate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end