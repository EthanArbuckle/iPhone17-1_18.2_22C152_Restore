@interface NSObject(UIAccessibility_Dragging)
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (void)setAccessibilityDragSourceDescriptors:()UIAccessibility_Dragging;
- (void)setAccessibilityDropPointDescriptors:()UIAccessibility_Dragging;
@end

@implementation NSObject(UIAccessibility_Dragging)

- (void)setAccessibilityDragSourceDescriptors:()UIAccessibility_Dragging
{
}

- (id)accessibilityDragSourceDescriptors
{
  return objc_getAssociatedObject(a1, &AXDragSourceDescriptorsIdentifier);
}

- (void)setAccessibilityDropPointDescriptors:()UIAccessibility_Dragging
{
}

- (id)accessibilityDropPointDescriptors
{
  return objc_getAssociatedObject(a1, &AXDropPointDescriptorsIdentifier);
}

@end