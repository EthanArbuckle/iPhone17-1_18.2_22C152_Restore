@interface VKCImageTextSelectionViewAccessibilityElement
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (unint64_t)accessibilityTraits;
@end

@implementation VKCImageTextSelectionViewAccessibilityElement

- (id)accessibilityIdentifier
{
  return @"com.apple.visionkit.textElement";
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4F43550];
}

@end