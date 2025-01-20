@interface ICPasswordEntryView
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
@end

@implementation ICPasswordEntryView

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end