@interface MFMimePart(FormatFlowedSupportInternal)
- (uint64_t)formatFlowedOptions;
@end

@implementation MFMimePart(FormatFlowedSupportInternal)

- (uint64_t)formatFlowedOptions
{
  v2 = [a1 bodyParameterForKey:@"format"];
  int v3 = [v2 isEqualToString:@"flowed"];

  if (!v3) {
    return 0;
  }
  v4 = [a1 bodyParameterForKey:@"delsp"];
  v5 = v4;
  if (!v4
    || [v4 caseInsensitiveCompare:@"yes"]
    && [v5 caseInsensitiveCompare:@"y"])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 3;
  }

  return v6;
}

@end