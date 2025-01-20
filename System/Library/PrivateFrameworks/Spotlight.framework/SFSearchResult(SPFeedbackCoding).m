@interface SFSearchResult(SPFeedbackCoding)
- (id)replacementObjectForCoder:()SPFeedbackCoding;
@end

@implementation SFSearchResult(SPFeedbackCoding)

- (id)replacementObjectForCoder:()SPFeedbackCoding
{
  if (runningInSpotlight)
  {
    id v1 = [a1 objectForFeedback];
  }
  else
  {
    id v1 = a1;
  }

  return v1;
}

@end