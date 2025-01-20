@interface NSObject(UIAccessibilityContainer)
- (id)accessibilityElements;
- (id)automationElements;
- (id)storedAccessibilityContainerType;
- (uint64_t)accessibilityContainerType;
- (uint64_t)accessibilityElementAtIndex:()UIAccessibilityContainer;
- (uint64_t)accessibilityElementCount;
- (uint64_t)indexOfAccessibilityElement:()UIAccessibilityContainer;
- (void)setAccessibilityContainerType:()UIAccessibilityContainer;
- (void)setAccessibilityElements:()UIAccessibilityContainer;
- (void)setAutomationElements:()UIAccessibilityContainer;
@end

@implementation NSObject(UIAccessibilityContainer)

- (void)setAccessibilityElements:()UIAccessibilityContainer
{
}

- (void)setAutomationElements:()UIAccessibilityContainer
{
}

- (void)setAccessibilityContainerType:()UIAccessibilityContainer
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AXContainerTypeIdentifier, v2, (void *)1);
}

- (uint64_t)accessibilityElementCount
{
  return 0;
}

- (uint64_t)accessibilityElementAtIndex:()UIAccessibilityContainer
{
  return 0;
}

- (uint64_t)indexOfAccessibilityElement:()UIAccessibilityContainer
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)accessibilityElements
{
  return objc_getAssociatedObject(a1, &AXAccessibilityElementsIdentifier);
}

- (id)automationElements
{
  return objc_getAssociatedObject(a1, &AXAutomationElementsIdentifier);
}

- (id)storedAccessibilityContainerType
{
  return objc_getAssociatedObject(a1, &AXContainerTypeIdentifier);
}

- (uint64_t)accessibilityContainerType
{
  v1 = [a1 storedAccessibilityContainerType];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

@end