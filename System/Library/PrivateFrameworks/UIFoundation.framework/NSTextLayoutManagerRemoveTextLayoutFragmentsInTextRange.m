@interface NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange
@end

@implementation NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange

uint64_t ____NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _updateRangeInElement];
}

id ____NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange_block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[6];
  if (v6 && !(*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, a2))
  {
    id result = (id)[a2 _updateRangeInElement];
    v9 = *(void **)(*(void *)(a1[8] + 8) + 40);
    if (v9)
    {
      if (objc_msgSend(v9, "compare:", objc_msgSend(a3, "location")) == -1)
      {
        v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(void *)(*(void *)(a1[8] + 8) + 40), [a3 location]);
        v11 = *(void **)(*(void *)(a1[9] + 8) + 40);
        if (!v11)
        {
          *(void *)(*(void *)(a1[9] + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v11 = *(void **)(*(void *)(a1[9] + 8) + 40);
        }
        [v11 addObject:v10];
      }
      if (a1[5] && objc_msgSend((id)objc_msgSend(a3, "endLocation"), "compare:", a1[5]) == -1) {
        id result = (id)[a3 endLocation];
      }
      else {
        id result = 0;
      }
      *(void *)(*(void *)(a1[8] + 8) + 40) = result;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1[7] + 8) + 40);
    if (v7 != [a2 textElement])
    {
      *(void *)(*(void *)(a1[7] + 8) + 40) = [a2 textElement];
      [*(id *)(a1[4] + 88) removeObjectForKey:*(void *)(*(void *)(a1[7] + 8) + 40)];
    }
    if (!*(void *)(*(void *)(a1[8] + 8) + 40)) {
      *(void *)(*(void *)(a1[8] + 8) + 40) = (id)[a3 location];
    }
    return (id)[a2 setTextElement:0];
  }
  return result;
}

@end