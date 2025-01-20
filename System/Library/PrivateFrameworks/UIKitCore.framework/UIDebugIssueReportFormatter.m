@interface UIDebugIssueReportFormatter
@end

@implementation UIDebugIssueReportFormatter

void __54___UIDebugIssueReportFormatter__componentsFromReport___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  v6 = [v5 prefix];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) defaultIssuePrefix];
  }
  id v19 = v8;

  v9 = *(void **)(a1 + 40);
  v10 = [v5 description];
  [v9 appendFormat:@"%@%@", v19, v10];

  v11 = [v5 _subissueReport];

  if (v11)
  {
    v12 = [v11 issues];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v14)
      {
        v15 = objc_alloc_init(_UIDebugIssueReportFormatter);
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setIndentLevel:1];
        v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      v18 = [v14 stringFromReport:v11];
      [*(id *)(a1 + 40) appendFormat:@"\n%@", v18];
    }
  }
  if (*(void *)(a1 + 56) - 1 > a3) {
    [*(id *)(a1 + 40) appendString:@"\n"];
  }
}

@end