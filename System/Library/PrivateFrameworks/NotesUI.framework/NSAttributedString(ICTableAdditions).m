@interface NSAttributedString(ICTableAdditions)
- (id)ic_nextTableStringFromIndex:()ICTableAdditions tableRange:;
- (id)ic_textTablesInRange:()ICTableAdditions;
- (uint64_t)ic_numRowsForTextTable:()ICTableAdditions outNumColumns:;
- (uint64_t)ic_numberOfTables;
- (uint64_t)ic_rangeofNextTableFromIndex:()ICTableAdditions;
- (uint64_t)ic_tableSizeForTextTable:()ICTableAdditions inRange:;
@end

@implementation NSAttributedString(ICTableAdditions)

- (uint64_t)ic_tableSizeForTextTable:()ICTableAdditions inRange:
{
  id v8 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3010000000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  v24 = &unk_1B0BF84BB;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3010000000;
  v20[4] = 0;
  v20[5] = 0;
  v20[3] = &unk_1B0BF84BB;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 1;
  uint64_t v9 = *MEMORY[0x1E4FB0738];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__NSAttributedString_ICTableAdditions__ic_tableSizeForTextTable_inRange___block_invoke;
  v13[3] = &unk_1E5FDE488;
  id v10 = v8;
  id v14 = v10;
  v15 = v18;
  v16 = &v21;
  v17 = v20;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v9, a4, a5, 0, v13);
  uint64_t v11 = v22[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (uint64_t)ic_numRowsForTextTable:()ICTableAdditions outNumColumns:
{
  uint64_t v26 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v28 = [a1 length];
  if (v28)
  {
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v27 = *MEMORY[0x1E4FB0738];
    while (1)
    {
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v9 = objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v27, v8, &v36, v26);
      id v10 = [v9 textBlocks];
      if ([v10 count]) {
        break;
      }
      unint64_t v8 = v37 + v36;
      if (v6 <= 1) {
        unint64_t v6 = 1;
      }
      ++v7;
LABEL_22:

      if (v8 >= v28) {
        goto LABEL_25;
      }
    }
    v30 = v10;
    v31 = v9;
    uint64_t v11 = [v10 objectAtIndex:0];
    uint64_t v12 = [v11 table];

    v29 = (void *)v12;
    uint64_t v13 = [a1 rangeOfTextTable:v12 atIndex:v36];
    uint64_t v15 = v14;
    v16 = objc_msgSend(a1, "ic_textTablesInRange:", v13, v14);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (!v17) {
      goto LABEL_18;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
LABEL_6:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v33 != v19) {
        objc_enumerationMutation(v16);
      }
      id v21 = *(id *)(*((void *)&v32 + 1) + 8 * v20);
      if (!v5) {
        break;
      }
      if (v21 == v5)
      {
        v22 = a1;
        id v21 = v5;
LABEL_13:
        unint64_t v23 = objc_msgSend(v22, "ic_tableSizeForTextTable:inRange:", v21, v13, v15);
        if (v6 <= v23) {
          unint64_t v6 = v23;
        }
        v7 += v24;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (!v18)
        {
LABEL_18:
          unint64_t v8 = v13 + v15;

          id v10 = v30;
          uint64_t v9 = v31;
          goto LABEL_22;
        }
        goto LABEL_6;
      }
    }
    v22 = a1;
    goto LABEL_13;
  }
  uint64_t v7 = 0;
  unint64_t v6 = 0;
LABEL_25:
  if (v26) {
    *uint64_t v26 = v6;
  }

  return v7;
}

- (id)ic_nextTableStringFromIndex:()ICTableAdditions tableRange:
{
  unint64_t v6 = [a1 length];
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  while (a3 < v6)
  {
    unint64_t v8 = objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v7);
    uint64_t v9 = [v8 textBlocks];
    if ([v9 count])
    {
      id v10 = [v9 objectAtIndex:0];
      uint64_t v11 = [v10 table];

      uint64_t v12 = [a1 rangeOfTextTable:v11 atIndex:a3];
      uint64_t v14 = v13;
      uint64_t v15 = objc_msgSend(a1, "attributedSubstringFromRange:", v12, v13);
      v16 = v15;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v17 = 3;
      }
      else
      {
        if (a4)
        {
          *a4 = v12;
          a4[1] = v14;
        }
        id v22 = v15;
        int v17 = 1;
      }
    }
    else
    {
      int v17 = 0;
    }

    if (v17)
    {
      if (v17 != 3)
      {
        uint64_t v18 = v22;
        goto LABEL_18;
      }
      break;
    }
  }
  uint64_t v18 = 0;
  if (a4)
  {
    unint64_t v19 = v6 - a3;
    if (v6 < a3) {
      unint64_t v19 = 0;
    }
    *a4 = a3;
    a4[1] = v19;
  }
LABEL_18:
  return v18;
}

- (uint64_t)ic_rangeofNextTableFromIndex:()ICTableAdditions
{
  unint64_t v3 = a3;
  unint64_t v14 = a3;
  uint64_t v15 = 0;
  unint64_t v5 = [a1 length];
  if (v5 <= v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  while (1)
  {
    unint64_t v8 = [a1 attribute:v7 atIndex:v3 effectiveRange:&v14];
    uint64_t v9 = [v8 textBlocks];
    if ([v9 count]) {
      break;
    }

    unint64_t v3 = v15 + v14;
    if (v15 + v14 >= v6) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  uint64_t v11 = [v9 objectAtIndex:0];
  uint64_t v12 = [v11 table];

  uint64_t v10 = [a1 rangeOfTextTable:v12 atIndex:v14];
  return v10;
}

- (uint64_t)ic_numberOfTables
{
  if (![a1 length]) {
    return 0;
  }
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 0;
  }
  unint64_t v3 = v2;
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  do
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v6 = objc_msgSend(a1, "ic_nextTableStringFromIndex:tableRange:", v5, &v8);
    if (v6) {
      ++v4;
    }
    unint64_t v5 = v9 + v8;
  }
  while (v5 < v3);
  return v4;
}

- (id)ic_textTablesInRange:()ICTableAdditions
{
  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__77;
  int v17 = __Block_byref_object_dispose__77;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__77;
  v11[4] = __Block_byref_object_dispose__77;
  id v12 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__NSAttributedString_ICTableAdditions__ic_textTablesInRange___block_invoke;
  v10[3] = &unk_1E5FDE4B0;
  v10[4] = v11;
  v10[5] = &v13;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, a3, a4, 0, v10);
  id v8 = (id)v14[5];
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
  return v8;
}

@end