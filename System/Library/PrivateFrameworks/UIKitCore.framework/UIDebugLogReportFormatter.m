@interface UIDebugLogReportFormatter
@end

@implementation UIDebugLogReportFormatter

void __52___UIDebugLogReportFormatter__componentsFromReport___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (![v5 type])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, a3);
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    uint64_t v16 = 0;
    uint64_t v16 = [v5 indentLevel];
    v7 = [*(id *)(a1 + 32) _statements];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52___UIDebugLogReportFormatter__componentsFromReport___block_invoke_2;
    v14[3] = &unk_1E52EE320;
    v14[4] = v15;
    v14[5] = &v17;
    [v7 enumerateObjectsAtIndexes:v6 options:2 usingBlock:v14];

    if (v18[3])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%*s", v18[3], " ");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &stru_1ED0E84C0;
    }
    v9 = (void *)MEMORY[0x1E4F28E78];
    v10 = [v5 prefix];
    v11 = [v5 text];
    v12 = [v9 stringWithFormat:@"%@%@%@", v8, v10, v11];

    v13 = [NSString stringWithFormat:@"\n%@", v8];
    objc_msgSend(v12, "replaceOccurrencesOfString:withString:options:range:", @"\n", v13, 0, 0, objc_msgSend(v12, "length"));

    [*(id *)(a1 + 40) appendString:v12];
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v17, 8);
  }
  if (*(void *)(a1 + 48) - 1 > a3) {
    [*(id *)(a1 + 40) appendString:@"\n"];
  }
}

void __52___UIDebugLogReportFormatter__componentsFromReport___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v6 = v3;
  if (v4 > [v3 indentLevel])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 indentLevel];
    id v5 = [v6 prefix];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 length];
  }
}

@end