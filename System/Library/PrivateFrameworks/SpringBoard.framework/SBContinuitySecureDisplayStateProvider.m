@interface SBContinuitySecureDisplayStateProvider
- (BOOL)isInSecureDisplayMode;
- (BOOL)supportsSecureDisplayMode;
@end

@implementation SBContinuitySecureDisplayStateProvider

- (BOOL)supportsSecureDisplayMode
{
  return 0;
}

- (BOOL)isInSecureDisplayMode
{
  return 0;
}

@end