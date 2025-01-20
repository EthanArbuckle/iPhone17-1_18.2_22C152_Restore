@interface NSAttributedString
@end

@implementation NSAttributedString

void __94__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnMultipleAttributesWithLimit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9) {
    [*(id *)(a1 + 40) addObject:v9];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + a4;
  if ([*(id *)(a1 + 40) count] >= (unint64_t)(*(void *)(a1 + 56) - 1)) {
    *a5 = 1;
  }
}

void __82__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnAttribute_limit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9) {
    [*(id *)(a1 + 40) addObject:v9];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + a4;
  if ([*(id *)(a1 + 40) count] >= (unint64_t)(*(void *)(a1 + 56) - 1)) {
    *a5 = 1;
  }
}

void __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  v10 = *(void **)(a1 + 32);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke_2;
  v15 = &unk_2643D7230;
  id v11 = v9;
  id v16 = v11;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 32);
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  [v10 enumerateKeysAndObjectsUsingBlock:&v12];
  if (objc_msgSend(*(id *)(a1 + 48), "count", v12, v13, v14, v15) >= (unint64_t)(*(void *)(a1 + 56) - 1)) {
    *a5 = 1;
  }
}

void __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKey:v17];
  v7 = [*(id *)(a1 + 40) objectForKey:v17];
  uint64_t v8 = [v7 integerValue];

  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 72) + *(void *)(a1 + 64);
    uint64_t v10 = [MEMORY[0x263EFF9D0] null];
    if ((id)v10 == v5)
    {
    }
    else
    {
      id v11 = (void *)v10;
      char v12 = [v5 isEqual:v6];

      if (v12) {
        goto LABEL_9;
      }
    }
    v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v17];
    [*(id *)(a1 + 56) setObject:v15 forKeyedSubscript:v17];

    [*(id *)(a1 + 48) addIndex:*(void *)(a1 + 64)];
  }
  else
  {
    id v13 = [MEMORY[0x263EFF9D0] null];

    if (v13 == v5) {
      goto LABEL_10;
    }
    [*(id *)(a1 + 48) addIndex:v8];
    v14 = [MEMORY[0x263EFF9D0] null];
    [*(id *)(a1 + 56) setObject:v14 forKeyedSubscript:v17];

    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_9:
  id v16 = [NSNumber numberWithInteger:v9];
  [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:v17];

LABEL_10:
}

@end