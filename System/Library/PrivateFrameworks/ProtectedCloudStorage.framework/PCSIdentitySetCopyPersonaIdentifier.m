@interface PCSIdentitySetCopyPersonaIdentifier
@end

@implementation PCSIdentitySetCopyPersonaIdentifier

void *___PCSIdentitySetCopyPersonaIdentifier_block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[5];
  uint64_t v3 = *(void *)(v2 + 80);
  if (v3) {
    result = CFRetain(*(CFTypeRef *)(v2 + 80));
  }
  *(void *)(*(void *)(v1[4] + 8) + 24) = v3;
  return result;
}

@end