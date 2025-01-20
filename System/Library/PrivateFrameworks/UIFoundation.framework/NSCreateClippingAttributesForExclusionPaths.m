@interface NSCreateClippingAttributesForExclusionPaths
@end

@implementation NSCreateClippingAttributesForExclusionPaths

void ____NSCreateClippingAttributesForExclusionPaths_block_invoke(uint64_t a1, void *a2)
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  v4 = (void *)*MEMORY[0x1E4F24760];
  keys[0] = *(void **)MEMORY[0x1E4F24758];
  keys[1] = v4;
  uint64_t v9 = 0;
  values = (void *)[a2 CGPath];
  if ([a2 usesEvenOddFillRule])
  {
    CFIndex v5 = 1;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(NSNumber) initWithInteger:1];
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    uint64_t v9 = v6;
    CFIndex v5 = 2;
  }
  CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, v5, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v7);
  if (v7) {
    CFRelease(v7);
  }
}

@end