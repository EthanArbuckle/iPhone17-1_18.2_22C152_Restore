@interface AXRemoteElement
@end

@implementation AXRemoteElement

uint64_t __120__AXRemoteElement_UIAccessibility___handleElementTraversalRequestMovingForward_count_shouldIncludeSelf_wantsContainers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsTouchContainer];
}

uint64_t __80__AXRemoteElement_UIAccessibility___ancestorElementThatSupportsActivationAction__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilitySupportsActivateAction];
}

@end