@interface CNVCardRangeFinder
+ (id)allRangesInData:(id)a3;
+ (id)rangesInData:(id)a3;
@end

@implementation CNVCardRangeFinder

+ (id)allRangesInData:(id)a3
{
  v3 = [a1 rangesInData:a3];
  id v8 = 0;
  v4 = [v3 allObjects:&v8];
  id v5 = v8;

  v6 = [MEMORY[0x1E4F5A3B8] eitherWithLeft:v4 right:v5];

  return v6;
}

+ (id)rangesInData:(id)a3
{
  id v3 = a3;
  int v4 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A268] + 16))();
  id v5 = (void *)MEMORY[0x1E4F5A480];
  if (v4)
  {
    v6 = [MEMORY[0x1E4F5A480] emptyObservable];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__CNVCardRangeFinder_rangesInData___block_invoke;
    v8[3] = &unk_1E6C2D008;
    id v9 = v3;
    v6 = [v5 observableWithBlock:v8];
  }
  return v6;
}

id __35__CNVCardRangeFinder_rangesInData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) length];
  uint64_t v5 = +[CNVCardDataAnalyzer analyzeData:*(void *)(a1 + 32)];
  v6 = [@"BEGIN:VCARD" dataUsingEncoding:v5];
  v7 = [@"END:VCARD" dataUsingEncoding:v5];
  id v8 = [@"\r" dataUsingEncoding:v5];
  id v9 = [@"\n" dataUsingEncoding:v5];
  if (v4)
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v6, 0, v10, v4);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v13 = v11;
      uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v7, 0, v11 + v12, objc_msgSend(*(id *)(a1 + 32), "length") - (v11 + v12));
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      do
      {
        do
        {
          uint64_t v10 = v14 + v15;
          uint64_t v16 = [*(id *)(a1 + 32) length];
          uint64_t v4 = v16 - v10;
          uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v8, 2, v10, v16 - v10);
        }
        while (v14 != 0x7FFFFFFFFFFFFFFFLL);
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v9, 2, v10, v4);
      }
      while (v14 != 0x7FFFFFFFFFFFFFFFLL);
      v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v13, v10 - v13);
      [v3 observerDidReceiveResult:v17];
    }
    while (v4);
  }
  [v3 observerDidComplete];
  id v18 = objc_alloc_init(MEMORY[0x1E4F5A368]);

  return v18;
}

@end