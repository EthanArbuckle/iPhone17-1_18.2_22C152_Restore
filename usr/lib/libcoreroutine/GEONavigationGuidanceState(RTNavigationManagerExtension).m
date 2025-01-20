@interface GEONavigationGuidanceState(RTNavigationManagerExtension)
- (id)description;
@end

@implementation GEONavigationGuidanceState(RTNavigationManagerExtension)

- (id)description
{
  v1 = NSString;
  uint64_t v2 = [a1 navigationState];
  if (v2 >= 9)
  {
    [NSString stringWithFormat:@"(unknown: %i)", v2];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6B9B820[(int)v2];
  }
  v4 = [v1 stringWithFormat:@"navigation state, %@", v3];

  return v4;
}

@end