@interface SIActivityJournalGetOIDs
@end

@implementation SIActivityJournalGetOIDs

void ___SIActivityJournalGetOIDs_block_invoke(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = *a2;
  if (v2 > 0x36) {
    return;
  }
  if (((1 << v2) & 0xFE000F0007800) != 0)
  {
    int v5 = 1;
    goto LABEL_4;
  }
  if (((1 << v2) & 0x40000000060000) != 0)
  {
    int v5 = 0;
LABEL_4:
    unint64_t v6 = *((void *)a2 + 3);
    if (v6)
    {
      Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)HIDWORD(v6));
      if (!Value)
      {
        v8 = (const void *)SIUINT64SetCreate();
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), (const void *)HIDWORD(v6), v8);
        CFRelease(v8);
        Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)HIDWORD(v6));
      }
      if (v5 == (*(unsigned char *)(a1 + 48) != 0))
      {
        SIUINT64SetRemoveValue((uint64_t)Value, v6);
      }
      else
      {
        v9 = (unint64_t *)(Value + 16);
        SIValueSet<unsigned long long>::SIValueSetInsert(v9, v6);
      }
    }
    return;
  }
  if (v2 == 23)
  {
    CFStringRef v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *((const char **)a2 + 4), 0x8000100u);
    if (v10)
    {
      CFStringRef v11 = v10;
      if (!CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), (const void *)(int)a2[7])) {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), (const void *)(int)a2[7], v11);
      }
      CFRelease(v11);
    }
  }
}

@end