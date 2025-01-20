@interface RTTUIStaticTextView
- (BOOL)_accessibilityTextViewIgnoresValueChanges;
@end

@implementation RTTUIStaticTextView

- (BOOL)_accessibilityTextViewIgnoresValueChanges
{
  return 1;
}

@end