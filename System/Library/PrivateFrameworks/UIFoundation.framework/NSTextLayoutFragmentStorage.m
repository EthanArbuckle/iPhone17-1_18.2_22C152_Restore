@interface NSTextLayoutFragmentStorage
@end

@implementation NSTextLayoutFragmentStorage

void __91___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = v9;
  if (*(unsigned char *)(a1 + 40))
  {
    id v11 = v8;
    if (!*(unsigned char *)(a1 + 41))
    {
      v12 = objc_msgSend(v9, "textElement", v8);
      if (v12)
      {
        v13 = [v14 rangeInElement];
        (*(void (**)(uint64_t, id, void *, uint64_t))(v10 + 16))(v10, v14, v13, a4);
      }
      else
      {
        (*(void (**)(uint64_t, id, id, uint64_t))(v10 + 16))(v10, v14, v8, a4);
      }

      goto LABEL_9;
    }
  }
  else
  {
    id v11 = 0;
  }
  (*(void (**)(uint64_t, id, id, uint64_t))(v10 + 16))(v10, v9, v11, a4);
LABEL_9:
}

void __73___NSTextLayoutFragmentStorage_revalidateLayoutFragmentRangeForLocation___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v11 = v8;
  uint64_t v10 = [v11 rangeInElement];
  if (([v9 isEqual:v10] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v10);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  *a4 = 1;
}

void __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  if (([v8 containsLocation:*(void *)(a1 + 32)] & 1) != 0
    || *(unsigned char *)(a1 + 48)
    && ([v8 endLocation],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqual:*(void *)(a1 + 32)],
        v9,
        v10))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  *a4 = 1;
}

void __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke_1(uint64_t a1, int a2, id obj, unsigned char *a4)
{
  *a4 = 1;
}

void __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsLocation:*(void *)(a1 + 32)]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  *a4 = 1;
}

void __68___NSTextLayoutFragmentStorage_offsetDeltaForLastTextLayoutFragment__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = [v13 textElement];

  if (v8)
  {
    id v9 = [v13 rangeInElement];
    int v10 = [*(id *)(a1 + 32) dataSource];
    id v11 = [v7 location];
    v12 = [v9 location];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 offsetFromLocation:v11 toLocation:v12];

    *a4 = 1;
  }
}

void __90___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentInTextRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  id v15 = v9;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v9 rangeInElement];
  }
  id v11 = v10;
  if (*(unsigned char *)(a1 + 56)) {
    [v10 location];
  }
  else {
  v12 = [v10 endLocation];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);

  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) compare:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = 1;
  }
  if (v13 == v14) {
    *a4 = 1;
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  uint64_t v6 = a3 ^ 1u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke_1;
  v11[3] = &unk_1E55C5C80;
  v11[4] = &v12;
  id v8 = (id)[WeakRetained enumerateTextLayoutFragmentFromLocation:v5 options:v6 usingBlock:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __55___NSTextLayoutFragmentStorage_setTextLayoutFragments___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 rangeInElement];
  [v2 setObject:v3 forRange:v4];
}

@end