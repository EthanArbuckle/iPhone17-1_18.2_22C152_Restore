@interface NSTextLayoutManagerFillSoftInvalidationToLocation
@end

@implementation NSTextLayoutManagerFillSoftInvalidationToLocation

uint64_t ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke(void *a1, void *a2, void *a3, char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "location"), "compare:", a1[4]);
  if (result != -1)
  {
    uint64_t result = [a2 state];
    if (!result)
    {
      char v10 = 0;
      goto LABEL_6;
    }
    [a2 layoutFragmentFrame];
    *(double *)(*(void *)(a1[5] + 8) + 24) = v8 + v9;
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation");
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  }
  char v10 = 1;
LABEL_6:
  *a4 = v10;
  return result;
}

uint64_t ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke_2(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(double *)(*(void *)(*(void *)(result + 40) + 8) + 24) >= *(double *)(result + 64))
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v5 = result;
    uint64_t result = [a2 state];
    if (result)
    {
      v6 = (void *)[a2 rangeInElement];
      [a2 layoutFragmentFrame];
      double v8 = v7;
      double v10 = v9;
      if (objc_msgSend(*(id *)(*(void *)(*(void *)(v5 + 48) + 8) + 40), "compare:", objc_msgSend(v6, "location")) == -1)
      {
        v11 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 40), [v6 location]);
        [*(id *)(v5 + 32) _estimatedVerticalSizeForTextRange:v11 adjustedTextRange:0];
        *(double *)(*(void *)(*(void *)(v5 + 40) + 8) + 24) = v12
                                                                    + *(double *)(*(void *)(*(void *)(v5 + 40) + 8)
                                                                                + 24);
      }
      double v13 = *(double *)(*(void *)(*(void *)(v5 + 40) + 8) + 24);
      objc_msgSend(a2, "setLayoutFragmentFrameOrigin:", v8, v13);
      *(double *)(*(void *)(*(void *)(v5 + 40) + 8) + 24) = v10 + v13;
      uint64_t result = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation");
      *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 40) = result;
      *(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8) + 24) = 1;
    }
  }
  return result;
}

@end