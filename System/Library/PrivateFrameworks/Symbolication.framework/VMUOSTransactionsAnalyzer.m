@interface VMUOSTransactionsAnalyzer
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMUOSTransactionsAnalyzer

- (const)analyzerName
{
  return "LONG-LIVED XPC TRANSACTIONS";
}

- (id)analysisSummaryWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__5;
  v54 = __Block_byref_object_dispose__5;
  id v55 = 0;
  v4 = [(VMUProcessObjectGraph *)self->super._graph realizedClasses];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke;
  v49[3] = &unk_1E5D23F08;
  v49[4] = &v50;
  [v4 enumerateInfosWithBlock:v49];
  if (!v51[5])
  {
    id v13 = 0;
    goto LABEL_28;
  }
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  v5 = objc_opt_new();
  v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v7 = [v6 invertedSet];

  graph = self->super._graph;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_2;
  v30[3] = &unk_1E5D23F30;
  v33 = &v50;
  v34 = &v41;
  v30[4] = self;
  v35 = &v45;
  id v9 = v5;
  id v31 = v9;
  id v10 = v7;
  id v32 = v10;
  v36 = &v37;
  [(VMUObjectGraph *)graph enumerateObjectsWithBlock:v30];
  v11 = objc_opt_new();
  if ([v9 count])
  {
    if (*((_DWORD *)v38 + 6)
      && [(VMUProcessObjectGraph *)self->super._graph objectContentLevelForNodeLabels] != 3)
    {
      v19 = [NSString stringWithFormat:@"Memory graph was not recorded with -fullContent so no transaction descriptions are available"];
      v20 = [VMUAnalyzerSummaryField alloc];
      uint64_t v12 = [(VMUAnalyzerSummaryField *)v20 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v19 fieldType:0];
      [v11 addObject:v12];
    }
    else
    {
      uint64_t v12 = 0;
    }
    [v9 sortUsingComparator:&__block_literal_global_7];
    v28 = (void *)v12;
    id v29 = v10;
    v16 = objc_opt_new();
    unsigned int v21 = 0;
    uint64_t v22 = 0;
    while ([v9 count] > (unint64_t)v21)
    {
      if (v21 >= 5 && [v9 count] - 5 >= (unint64_t)v21)
      {
        if (v21 == 6) {
          [v16 appendFormat:@"%.*s...\n", v22, "                "];
        }
      }
      else
      {
        v23 = [v9 objectAtIndexedSubscript:v21];
        uint64_t v24 = [v23 rangeOfString:@"]"];
        if ((unint64_t)(v46[3] - v24) >= 7) {
          uint64_t v22 = 7;
        }
        else {
          uint64_t v22 = v46[3] - v24;
        }
        [v16 appendFormat:@"%.*s%@\n", v22, "                ", v23, v28];
      }
      ++v21;
    }
    id v10 = v29;
    v25 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", @"Count", [v9 count], 0, 1);

    [v11 addObject:v25];
    v26 = [VMUAnalyzerSummaryField alloc];
    v18 = [(VMUAnalyzerSummaryField *)v26 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v16 fieldType:0];

    [v11 addObject:v18];
  }
  else
  {
    int v14 = *((_DWORD *)v42 + 6);
    if (!v14)
    {
      id v13 = 0;
      goto LABEL_27;
    }
    v15 = "transactions exist";
    if (v14 == 1) {
      v15 = "transaction exists";
    }
    v16 = [NSString stringWithFormat:@"%u %s but no object content labels are available to determine the duration or description.", *((unsigned int *)v42 + 6), v15];
    v17 = [VMUAnalyzerSummaryField alloc];
    v18 = [(VMUAnalyzerSummaryField *)v17 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v16 fieldType:0];
    [v11 addObject:v18];
  }
  id v13 = v11;

LABEL_27:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
LABEL_28:

  _Block_object_dispose(&v50, 8);

  return v13;
}

void __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v11 = a3;
  if ([v11 infoType] == 1)
  {
    v8 = [v11 className];
    if ([v8 isEqualToString:@"OS_os_transaction"])
    {
      id v9 = [v11 binaryName];
      int v10 = [v9 isEqualToString:@"libxpc.dylib"];

      if (v10)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
        *a5 = 1;
      }
    }
    else
    {
    }
  }
}

void __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3[1] >> 60 != 1 || a3[2] != *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    return;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v5 = NSString;
  v6 = [*(id *)(*(void *)(a1 + 32) + 8) labelForNode:a2];
  id v18 = [v5 stringWithFormat:@"%@  %#llx", v6, *a3];

  unint64_t v7 = [v18 rangeOfString:@"]"];
  v8 = v18;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v18 substringFromIndex:1];
    [v9 floatValue];
    float v11 = v10;

    if (v11 < 10.0)
    {
      v16 = (_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v17 = -1;
      v8 = v18;
    }
    else
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      unint64_t v13 = *(void *)(v12 + 24);
      if (v7 > v13) {
        unint64_t v13 = v7;
      }
      *(void *)(v12 + 24) = v13;
      [*(id *)(a1 + 40) addObject:v18];
      int v14 = [v18 substringFromIndex:v7 + 1];
      uint64_t v15 = [v14 rangeOfCharacterFromSet:*(void *)(a1 + 48)];

      v8 = v18;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
      v16 = (_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      int v17 = 1;
    }
    *v16 += v17;
  }
LABEL_12:
}

uint64_t __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 substringFromIndex:1];
  [v5 floatValue];
  float v7 = v6;

  v8 = [v4 substringFromIndex:1];

  [v8 floatValue];
  float v10 = v9;

  if (v7 > v10) {
    return -1;
  }
  else {
    return v7 < v10;
  }
}

@end