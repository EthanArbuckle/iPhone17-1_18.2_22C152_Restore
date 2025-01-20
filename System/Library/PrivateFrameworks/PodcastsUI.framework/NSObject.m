@interface NSObject
@end

@implementation NSObject

BOOL __63__NSObject_IMAccessibilitySafeCategory__imaxElementIsAncestor___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

uint64_t __62__NSObject_IMAccessibilitySafeCategory__imaxAncestorIsKindOf___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __62__NSObject_IMAccessibilitySafeCategory__imaxDescendentOfType___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __64__NSObject_IMAccessibilitySafeCategory__imaxUnignoredDescendant__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end