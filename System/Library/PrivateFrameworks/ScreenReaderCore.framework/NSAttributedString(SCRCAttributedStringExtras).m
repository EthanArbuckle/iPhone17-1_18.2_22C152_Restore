@interface NSAttributedString(SCRCAttributedStringExtras)
- (id)scrcIndexSetForAttributes:()SCRCAttributedStringExtras limit:;
- (id)scrcSplitBasedOnAttribute:()SCRCAttributedStringExtras limit:;
- (id)scrcSplitBasedOnMultipleAttributesWithLimit:()SCRCAttributedStringExtras;
@end

@implementation NSAttributedString(SCRCAttributedStringExtras)

- (id)scrcSplitBasedOnMultipleAttributesWithLimit:()SCRCAttributedStringExtras
{
  v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [a1 length];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __94__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnMultipleAttributesWithLimit___block_invoke;
  v19 = &unk_2643D71E0;
  v20 = a1;
  id v7 = v5;
  id v21 = v7;
  v22 = &v24;
  uint64_t v23 = a3;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, &v16);
  if (v25[3] < v6 && objc_msgSend(v7, "count", v16, v17, v18, v19, v20) == a3 - 1)
  {
    uint64_t v8 = v25[3];
    uint64_t v9 = [a1 length];
    v10 = objc_msgSend(a1, "attributedSubstringFromRange:", v8, v9 - v25[3]);
    v11 = v10;
    if (v10)
    {
      v12 = (void *)[v10 mutableCopy];
      [v7 addObject:v12];
    }
  }
  v13 = v21;
  id v14 = v7;

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (id)scrcSplitBasedOnAttribute:()SCRCAttributedStringExtras limit:
{
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [a1 length];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __82__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnAttribute_limit___block_invoke;
  id v21 = &unk_2643D7208;
  v22 = a1;
  id v9 = v7;
  id v23 = v9;
  uint64_t v24 = &v26;
  uint64_t v25 = a4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v8, 0, &v18);
  if (v27[3] < v8 && objc_msgSend(v9, "count", v18, v19, v20, v21, v22) == a4 - 1)
  {
    uint64_t v10 = v27[3];
    uint64_t v11 = [a1 length];
    v12 = objc_msgSend(a1, "attributedSubstringFromRange:", v10, v11 - v27[3]);
    v13 = v12;
    if (v12)
    {
      id v14 = (void *)[v12 mutableCopy];
      objc_msgSend(v14, "removeAttribute:range:", v6, 0, objc_msgSend(v14, "length"));
      [v9 addObject:v14];
    }
  }
  v15 = v23;
  id v16 = v9;

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (id)scrcIndexSetForAttributes:()SCRCAttributedStringExtras limit:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [a1 length];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndex:0];
  [v8 addIndex:v7];
  if (v7 >= 2)
  {
    uint64_t v23 = a4;
    uint64_t v24 = a1;
    id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v25 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v17 = [MEMORY[0x263EFF9D0] null];
          [v10 setObject:v17 forKeyedSubscript:v16];

          uint64_t v18 = [NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
          [v9 setObject:v18 forKeyedSubscript:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v13);
    }

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke;
    v26[3] = &unk_2643D7258;
    id v27 = v10;
    id v28 = v9;
    id v29 = v8;
    uint64_t v30 = v23;
    id v19 = v9;
    id v20 = v10;
    objc_msgSend(v24, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v26);

    id v6 = v25;
  }
  id v21 = (void *)[v8 copy];

  return v21;
}

@end