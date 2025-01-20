@interface UITextLayoutDrawRangeInContext
@end

@implementation UITextLayoutDrawRangeInContext

uint64_t ___UITextLayoutDrawRangeInContext_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 rangeInElement];
  v5 = [*(id *)(a1 + 32) textRangeByIntersectingWithTextRange:v4];
  v6 = v5;
  if (v5 && ([v5 isEmpty] & 1) == 0)
  {
    [v3 layoutFragmentFrame];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    v12 = *(void **)(a1 + 40);
    v13 = [v4 location];
    v14 = [v6 location];
    uint64_t v15 = [v12 offsetFromLocation:v13 toLocation:v14];

    v16 = *(void **)(a1 + 40);
    v17 = [v4 location];
    v18 = [v6 endLocation];
    uint64_t v19 = [v16 offsetFromLocation:v17 toLocation:v18] - v15;

    v20 = [v3 textLineFragments];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___UITextLayoutDrawRangeInContext_block_invoke_2;
    v22[3] = &__block_descriptor_72_e35_v32__0__NSTextLineFragment_8Q16_B24l;
    v22[4] = v15;
    v22[5] = v19;
    v22[6] = v9;
    v22[7] = v11;
    v22[8] = *(void *)(a1 + 48);
    [v20 enumerateObjectsUsingBlock:v22];

    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void ___UITextLayoutDrawRangeInContext_block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v7.location = [v5 characterRange];
  if (NSIntersectionRange(v7, *(NSRange *)(a1 + 32)).length)
  {
    [v5 typographicBounds];
    objc_msgSend(v5, "drawAtPoint:inContext:", *(void *)(a1 + 64), *(double *)(a1 + 48) + v3, v4 + *(double *)(a1 + 56));
  }
}

@end