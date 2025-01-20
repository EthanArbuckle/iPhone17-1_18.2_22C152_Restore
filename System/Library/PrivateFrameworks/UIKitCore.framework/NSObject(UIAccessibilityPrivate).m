@interface NSObject(UIAccessibilityPrivate)
+ (uint64_t)__accessibilityGuidedAccessRestrictionStateForIdentifier:()UIAccessibilityPrivate;
+ (uint64_t)__accessibilityGuidedAccessStateEnabled;
+ (void)__accessibilityRequestGuidedAccessSession:()UIAccessibilityPrivate completion:;
- (id)accessibilityIdentification;
- (void)accessibilitySetIdentification:()UIAccessibilityPrivate;
@end

@implementation NSObject(UIAccessibilityPrivate)

- (id)accessibilityIdentification
{
  return objc_getAssociatedObject(a1, &AXIdentificationIdentifier);
}

- (void)accessibilitySetIdentification:()UIAccessibilityPrivate
{
}

+ (uint64_t)__accessibilityGuidedAccessStateEnabled
{
  return 0;
}

+ (uint64_t)__accessibilityGuidedAccessRestrictionStateForIdentifier:()UIAccessibilityPrivate
{
  return 0;
}

+ (void)__accessibilityRequestGuidedAccessSession:()UIAccessibilityPrivate completion:
{
  if (a4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__NSObject_UIAccessibilityPrivate____accessibilityRequestGuidedAccessSession_completion___block_invoke;
    block[3] = &unk_1E52D9B58;
    block[4] = a4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

@end