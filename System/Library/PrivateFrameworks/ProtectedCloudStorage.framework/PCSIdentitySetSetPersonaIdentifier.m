@interface PCSIdentitySetSetPersonaIdentifier
@end

@implementation PCSIdentitySetSetPersonaIdentifier

void ___PCSIdentitySetSetPersonaIdentifier_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
      int v7 = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v2;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Identity set persona changed: %@ to %@", (uint8_t *)&v7, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(const void **)(v4 + 80);
    if (v5)
    {
      *(void *)(v4 + 80) = 0;
      CFRelease(v5);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  *(void *)(*(void *)(a1 + 32) + 80) = v6;
}

@end