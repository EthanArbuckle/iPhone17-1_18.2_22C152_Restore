@interface SBForceTouchAppIconInfoProvider
- (BOOL)isHighlighted;
- (NSCopying)overrideBadgeNumberOrString;
- (NSString)location;
- (SBIconContinuityItem)continuityItem;
@end

@implementation SBForceTouchAppIconInfoProvider

- (NSString)location
{
  return (NSString *)(id)*MEMORY[0x1E4FA66D0];
}

- (BOOL)isHighlighted
{
  return 0;
}

- (SBIconContinuityItem)continuityItem
{
  return 0;
}

- (NSCopying)overrideBadgeNumberOrString
{
  return 0;
}

@end