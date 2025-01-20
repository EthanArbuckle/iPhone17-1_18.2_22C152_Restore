@interface SFSearchResult(SSFeedbackSupport)
- (__CFString)feedbackSectionIdentifier;
- (uint64_t)isAppClip;
- (uint64_t)isWebClip;
@end

@implementation SFSearchResult(SSFeedbackSupport)

- (uint64_t)isAppClip
{
  return 0;
}

- (uint64_t)isWebClip
{
  return 0;
}

- (__CFString)feedbackSectionIdentifier
{
  if ([a1 isAppClip])
  {
    v2 = @"com.apple.app-clips";
  }
  else if ([a1 isLocalApplicationResult])
  {
    v2 = @"com.apple.application";
  }
  else
  {
    v2 = [a1 sectionBundleIdentifier];
  }
  if ([(__CFString *)v2 isEqualToString:@"com.apple.DocumentsApp"])
  {
    uint64_t v3 = [a1 resultBundleId];

    v2 = (__CFString *)v3;
  }
  return v2;
}

@end