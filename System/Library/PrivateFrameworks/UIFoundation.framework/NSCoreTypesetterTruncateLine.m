@interface NSCoreTypesetterTruncateLine
@end

@implementation NSCoreTypesetterTruncateLine

const void *____NSCoreTypesetterTruncateLine_block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  uint64_t IsRightToLeft = CTLineIsRightToLeft();
  v9 = (void *)[a4 objectForKeyedSubscript:@"NSParagraphStyle"];
  v10 = v9;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v11 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    v11 = &v24;
    uint64_t v26 = 0;
  }
  if ([v9 baseWritingDirection] == IsRightToLeft
    && [v10 lineBreakMode] == *(void *)(a1 + 64))
  {
    v12 = 0;
    v13 = a4;
  }
  else
  {
    v14 = (void *)[v10 mutableCopy];
    [v14 setLineBreakMode:*(void *)(a1 + 64)];
    [v14 setBaseWritingDirection:IsRightToLeft];
    v12 = (void *)[a4 mutableCopy];
    [v12 setObject:v14 forKeyedSubscript:@"NSParagraphStyle"];

    v13 = v12;
  }
  uint64_t v15 = *MEMORY[0x1E4F247B0];
  unint64_t Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x1E4F247B0]);
  uint64_t v17 = *MEMORY[0x1E4F243C0];
  unint64_t v18 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x1E4F243C0]);
  if (Value | v18)
  {
    unint64_t v19 = v18;
    if (v12)
    {
      if (!Value) {
        goto LABEL_12;
      }
    }
    else
    {
      v12 = (void *)[v13 mutableCopy];
      v13 = v12;
      if (!Value)
      {
LABEL_12:
        if (v19) {
          [v12 removeObjectForKey:v17];
        }
        goto LABEL_14;
      }
    }
    [v12 removeObjectForKey:v15];
    goto LABEL_12;
  }
LABEL_14:
  v20 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_truncationTokenRunRefWithContext:token:attributes:", v11, objc_msgSend(*(id *)(a1 + 32), "_truncationTokenForRange:attributes:originalLineRef:", a3, v13, a2), v13);
  v21 = v20;
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v20)
  {
    *(_OWORD *)(v22 + 32) = *a3;
    CFRetain(v20);
  }
  else
  {
    *(_OWORD *)(v22 + 32) = xmmword_18E5F72A0;
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    __NSCoreTypesetterTruncationTokenContextDeallocate((uint64_t)&v24);
  }
  return v21;
}

@end