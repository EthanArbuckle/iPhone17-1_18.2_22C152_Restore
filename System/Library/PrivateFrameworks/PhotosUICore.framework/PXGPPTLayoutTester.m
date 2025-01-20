@interface PXGPPTLayoutTester
+ (NSArray)mockPaddingValues;
- (CGRect)generatedLayout:(id)a3 bestCropRectForInputItemAtIndex:(unsigned int)a4 withAspectRatio:(double)a5;
- (NSArray)inputItems;
- (id)generatedLayout:(id)a3 inputItemAtIndex:(unsigned int)a4;
- (id)generatedLayout:(id)a3 objectReferenceAtIndex:(unsigned int)a4;
- (void)_iterateEditorialConfigurationsForItemsCount:(int64_t)a3 itemsIncrement:(int64_t)a4 handler:(id)a5;
- (void)_iterateGridConfigurationsForItemsCount:(int64_t)a3 itemsIncrement:(int64_t)a4 handler:(id)a5;
- (void)runEditorialLayoutTestWithOptions:(id)a3 completionHandler:(id)a4;
- (void)runGridLayoutTestWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setInputItems:(id)a3;
@end

@implementation PXGPPTLayoutTester

- (void).cxx_destruct
{
}

- (void)setInputItems:(id)a3
{
}

- (NSArray)inputItems
{
  return self->_inputItems;
}

- (void)_iterateEditorialConfigurationsForItemsCount:(int64_t)a3 itemsIncrement:(int64_t)a4 handler:(id)a5
{
  v34 = (void (**)(id, int64_t, uint64_t, uint64_t, uint64_t, double, double, double, double, double, double))a5;
  v7 = +[PXLayoutMetricInterpolator allLayoutMetricConfigurationSizes];
  v8 = +[PXGPPTLayoutTester mockPaddingValues];
  int64_t v32 = a3;
  if (a4 < a3)
  {
    int64_t v9 = a4;
    v33 = v7;
    do
    {
      if (objc_msgSend(v7, "count", v32))
      {
        unint64_t v10 = 0;
        do
        {
          v11 = [v7 objectAtIndexedSubscript:v10];
          [v11 CGSizeValue];
          double v13 = v12;
          double v15 = v14;

          if ([v8 count])
          {
            unint64_t v16 = 0;
            do
            {
              v17 = [v8 objectAtIndexedSubscript:v16];
              [v17 PXEdgeInsetsValue];
              double v19 = v18;
              double v21 = v20;
              double v23 = v22;
              double v25 = v24;

              uint64_t v26 = 0;
              char v27 = 1;
              do
              {
                uint64_t v28 = 0;
                char v29 = v27;
                uint64_t v30 = qword_1AB35A220[v26];
                do
                {
                  for (uint64_t i = 1; i != 3; ++i)
                    v34[2](v34, v9, v30, v28, i, v13, v15, v19, v21, v23, v25);
                  ++v28;
                }
                while (v28 != 5);
                char v27 = 0;
                uint64_t v26 = 1;
              }
              while ((v29 & 1) != 0);
              ++v16;
            }
            while (v16 < [v8 count]);
          }
          ++v10;
          v7 = v33;
        }
        while (v10 < [v33 count]);
      }
      v9 += a4;
    }
    while (v9 < v32);
  }
}

- (void)_iterateGridConfigurationsForItemsCount:(int64_t)a3 itemsIncrement:(int64_t)a4 handler:(id)a5
{
  v35 = (void (**)(id, uint64_t, int64_t, uint64_t, uint64_t, uint64_t, double, double, double, double, double, double))a5;
  v5 = +[PXLayoutMetricInterpolator allLayoutMetricConfigurationSizes];
  v6 = +[PXGPPTLayoutTester mockPaddingValues];
  uint64_t v7 = 0;
  char v8 = 1;
  v34 = v5;
  do
  {
    char v31 = v8;
    if (a4 < a3)
    {
      uint64_t v9 = *((void *)&xmmword_1AB2F42D0 + v7);
      int64_t v10 = a4;
      do
      {
        if ([v5 count])
        {
          unint64_t v11 = 0;
          do
          {
            double v12 = [v5 objectAtIndexedSubscript:v11];
            [v12 CGSizeValue];
            double v14 = v13;
            double v16 = v15;

            if ([v6 count])
            {
              unint64_t v17 = 0;
              do
              {
                double v18 = [v6 objectAtIndexedSubscript:v17];
                [v18 PXEdgeInsetsValue];
                double v20 = v19;
                double v22 = v21;
                double v24 = v23;
                double v26 = v25;

                for (uint64_t i = 1; i != 10; ++i)
                {
                  for (uint64_t j = 0; j != 10; ++j)
                  {
                    for (uint64_t k = 1; k != 3; ++k)
                    {
                      uint64_t v30 = (void *)MEMORY[0x1AD10CB00]();
                      v35[2](v35, v9, v10, i, j, k, v14, v16, v20, v22, v24, v26);
                    }
                  }
                }
                ++v17;
              }
              while (v17 < [v6 count]);
            }
            ++v11;
            v5 = v34;
          }
          while (v11 < [v34 count]);
        }
        v10 += a4;
      }
      while (v10 < a3);
    }
    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v31 & 1) != 0);
}

- (CGRect)generatedLayout:(id)a3 bestCropRectForInputItemAtIndex:(unsigned int)a4 withAspectRatio:(double)a5
{
  v6 = [(PXGPPTLayoutTester *)self inputItems];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];
  [v7 preferredCropRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)generatedLayout:(id)a3 inputItemAtIndex:(unsigned int)a4
{
  v5 = [(PXGPPTLayoutTester *)self inputItems];
  v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (id)generatedLayout:(id)a3 objectReferenceAtIndex:(unsigned int)a4
{
  return 0;
}

- (void)runEditorialLayoutTestWithOptions:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  double v8 = (void (**)(id, PXStatsCalculator *, uint64_t, uint64_t))a4;
  double v9 = [v7 objectForKeyedSubscript:@"itemsCount"];

  if (!v9)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXGPPTLayoutTester.m" lineNumber:71 description:@"itemsCount option is required to run test"];
  }
  double v10 = [v7 objectForKeyedSubscript:@"itemsIncrement"];

  if (!v10)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PXGPPTLayoutTester.m" lineNumber:72 description:@"itemsIncrement option is required to run test"];
  }
  double v11 = [v7 objectForKeyedSubscript:@"itemsCount"];
  uint64_t v12 = [v11 integerValue];

  double v13 = [v7 objectForKeyedSubscript:@"itemsIncrement"];
  uint64_t v14 = [v13 integerValue];

  double v15 = +[PXGPPTLayoutTesterItemInput createItemInputsForCount:v12];
  [(PXGPPTLayoutTester *)self setInputItems:v15];

  double v16 = objc_alloc_init(PXEditorialTungstenLayout);
  [(PXGItemsLayout *)v16 setDelegate:self];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5122;
  v37 = __Block_byref_object_dispose__5123;
  v38 = &stru_1F00B0030;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__5122;
  char v31 = __Block_byref_object_dispose__5123;
  int64_t v32 = &stru_1F00B0030;
  double v17 = objc_alloc_init(PXStatsCalculator);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__PXGPPTLayoutTester_runEditorialLayoutTestWithOptions_completionHandler___block_invoke;
  v22[3] = &unk_1E5DAF168;
  double v18 = v16;
  double v23 = v18;
  double v19 = v17;
  double v24 = v19;
  double v25 = &v33;
  double v26 = &v27;
  [(PXGPPTLayoutTester *)self _iterateEditorialConfigurationsForItemsCount:v12 itemsIncrement:v14 handler:v22];
  v8[2](v8, v19, v34[5], v28[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

void __74__PXGPPTLayoutTester_runEditorialLayoutTestWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  objc_msgSend(*(id *)(a1 + 32), "setReferenceSize:");
  objc_msgSend(*(id *)(a1 + 32), "setPadding:", a8, a9, a10, a11);
  [*(id *)(a1 + 32) setNumberOfColumns:a3];
  [*(id *)(a1 + 32) setNumberOfItems:a2];
  [*(id *)(a1 + 32) setInteritemSpacing:(double)a4];
  [*(id *)(a1 + 32) setDisplayScale:(double)a5];
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) updateIfNeeded];
  double v21 = CFAbsoluteTimeGetCurrent() - Current;
  [*(id *)(a1 + 40) addValue:v21];
  obuint64_t j = [*(id *)(a1 + 32) diagnosticDescription];
  [*(id *)(a1 + 40) min];
  if (v21 == v22) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  }
  [*(id *)(a1 + 40) max];
  if (v21 == v23) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  }
}

- (void)runGridLayoutTestWithOptions:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  double v8 = (void (**)(id, PXStatsCalculator *, uint64_t, uint64_t))a4;
  double v9 = [v7 objectForKeyedSubscript:@"itemsCount"];

  if (!v9)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PXGPPTLayoutTester.m" lineNumber:34 description:@"itemsCount option is required to run test"];
  }
  double v10 = [v7 objectForKeyedSubscript:@"itemsIncrement"];

  if (!v10)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXGPPTLayoutTester.m" lineNumber:35 description:@"itemsIncrement option is required to run test"];
  }
  double v11 = [v7 objectForKeyedSubscript:@"itemsCount"];
  uint64_t v12 = [v11 integerValue];

  double v13 = [v7 objectForKeyedSubscript:@"itemsIncrement"];
  uint64_t v14 = [v13 integerValue];

  double v15 = objc_alloc_init(PXGGridLayout);
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__5122;
  v36 = __Block_byref_object_dispose__5123;
  v37 = &stru_1F00B0030;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__5122;
  uint64_t v30 = __Block_byref_object_dispose__5123;
  char v31 = &stru_1F00B0030;
  double v16 = objc_alloc_init(PXStatsCalculator);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__PXGPPTLayoutTester_runGridLayoutTestWithOptions_completionHandler___block_invoke;
  v21[3] = &unk_1E5DAF140;
  double v17 = v15;
  double v22 = v17;
  double v18 = v16;
  double v23 = v18;
  double v24 = &v32;
  double v25 = &v26;
  [(PXGPPTLayoutTester *)self _iterateGridConfigurationsForItemsCount:v12 itemsIncrement:v14 handler:v21];
  v8[2](v8, v18, v33[5], v27[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

void __69__PXGPPTLayoutTester_runGridLayoutTestWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  [*(id *)(a1 + 32) setStyle:a2];
  objc_msgSend(*(id *)(a1 + 32), "setReferenceSize:", a7, a8);
  objc_msgSend(*(id *)(a1 + 32), "setPadding:", a9, a10, a11, a12);
  [*(id *)(a1 + 32) setNumberOfColumns:a4];
  [*(id *)(a1 + 32) setNumberOfItems:a3];
  objc_msgSend(*(id *)(a1 + 32), "setInterItemSpacing:", (double)a5, (double)a5);
  [*(id *)(a1 + 32) setDisplayScale:(double)a6];
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) updateIfNeeded];
  double v24 = CFAbsoluteTimeGetCurrent() - Current;
  [*(id *)(a1 + 40) addValue:v24];
  obuint64_t j = [*(id *)(a1 + 32) diagnosticDescription];
  [*(id *)(a1 + 40) min];
  if (v24 == v25) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  }
  [*(id *)(a1 + 40) max];
  if (v24 == v26) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  }
}

+ (NSArray)mockPaddingValues
{
  if (mockPaddingValues_onceToken != -1) {
    dispatch_once(&mockPaddingValues_onceToken, &__block_literal_global_5144);
  }
  v2 = (void *)mockPaddingValues_paddingValues;
  return (NSArray *)v2;
}

void __39__PXGPPTLayoutTester_mockPaddingValues__block_invoke()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPXEdgeInsets:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  PXEdgeInsetsMake();
}

@end