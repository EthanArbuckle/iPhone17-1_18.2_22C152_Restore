@interface WBSElementTargetingResult
- (BOOL)hasSimilarGeometryInView:(id)a3;
- (BOOL)isBackedByGlobalAction;
- (WBSElementTargetingResult)initWithTarget:(id)a3 element:(id)a4;
- (_WKTargetedElementInfo)target;
- (int64_t)computeURLSimilarity:(id *)a3;
- (void)_forEachPotentiallySimilarElement:(id)a3;
- (void)addElement:(id)a3;
- (void)checkForSimilarRenderedText:(id)a3;
@end

@implementation WBSElementTargetingResult

- (WBSElementTargetingResult)initWithTarget:(id)a3 element:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSElementTargetingResult;
  v9 = [(WBSElementTargetingResult *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_target, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
    globalElements = v10->_globalElements;
    v10->_globalElements = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
    perSiteElements = v10->_perSiteElements;
    v10->_perSiteElements = (NSMutableSet *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)addElement:(id)a3
{
  id v6 = a3;
  int v4 = [v6 isBackedByGlobalAction];
  uint64_t v5 = 16;
  if (v4) {
    uint64_t v5 = 8;
  }
  [*(id *)((char *)&self->super.isa + v5) addObject:v6];
}

- (BOOL)isBackedByGlobalAction
{
  return [(NSMutableSet *)self->_globalElements count] != 0;
}

- (void)_forEachPotentiallySimilarElement:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void, char *))a3;
  char v25 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  perSiteElements = self->_perSiteElements;
  v27[0] = self->_globalElements;
  v27[1] = perSiteElements;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v18 != v15) {
                objc_enumerationMutation(v12);
              }
              v4[2](v4, *(void *)(*((void *)&v17 + 1) + 8 * j), &v25);
              if (v25)
              {

                goto LABEL_18;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v8);
  }
LABEL_18:
}

- (int64_t)computeURLSimilarity:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__7;
  long long v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  uint64_t v5 = [(_WKTargetedElementInfo *)self->_target mediaAndLinkURLs];
  id v6 = __50__WBSElementTargetingResult_computeURLSimilarity___block_invoke((uint64_t)v5, v5);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__WBSElementTargetingResult_computeURLSimilarity___block_invoke_2;
  v10[3] = &unk_1E5E42640;
  id v12 = &__block_literal_global_13;
  id v7 = v6;
  id v11 = v7;
  uint64_t v13 = &v16;
  uint64_t v14 = &v22;
  uint64_t v15 = &v26;
  [(WBSElementTargetingResult *)self _forEachPotentiallySimilarElement:v10];
  if (a3) {
    *a3 = (id) v17[5];
  }
  if (*((unsigned char *)v23 + 24))
  {
    if ([v7 count]) {
      int64_t v8 = 3;
    }
    else {
      int64_t v8 = 2;
    }
  }
  else
  {
    int64_t v8 = *((unsigned __int8 *)v27 + 24);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v8;
}

id __50__WBSElementTargetingResult_computeURLSimilarity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "safari_URLByRemovingQuery", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

void __50__WBSElementTargetingResult_computeURLSimilarity___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  int64_t v8 = [v6 mediaAndLinkURLs];
  uint64_t v9 = (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ([*(id *)(a1 + 32) isEqualToSet:v9])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a3 = 1;
  }
  if ([*(id *)(a1 + 32) isSubsetOfSet:v9])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (BOOL)hasSimilarGeometryInView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__WBSElementTargetingResult_hasSimilarGeometryInView___block_invoke;
  v23[3] = &__block_descriptor_48_e28__CGSize_dd_24__0_CGSize_dd_8l;
  v23[4] = v5;
  v23[5] = v6;
  uint64_t v7 = (double (**)(void, double, double))MEMORY[0x1AD115160](v23);
  [(_WKTargetedElementInfo *)self->_target bounds];
  double v10 = v7[2](v7, v8, v9);
  BOOL v12 = 0;
  if (v10 != 0.0 && v11 != 0.0)
  {
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__WBSElementTargetingResult_hasSimilarGeometryInView___block_invoke_2;
    v14[3] = &unk_1E5E42688;
    v14[4] = self;
    double v17 = v10;
    double v18 = v11;
    uint64_t v15 = v7;
    uint64_t v16 = &v19;
    [(WBSElementTargetingResult *)self _forEachPotentiallySimilarElement:v14];
    BOOL v12 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v12;
}

double __54__WBSElementTargetingResult_hasSimilarGeometryInView___block_invoke(uint64_t a1, double result)
{
  if (*(double *)(a1 + 32) < result) {
    return *(double *)(a1 + 32);
  }
  return result;
}

void __54__WBSElementTargetingResult_hasSimilarGeometryInView___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v16 = a2;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) positionType];
  if (v5 == [v16 positionType])
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) offsetEdges];
    if (v6 == [v16 anchor])
    {
      uint64_t v7 = *(void *)(a1 + 40);
      [v16 geometry];
      double v10 = (*(double (**)(uint64_t, double, double))(v7 + 16))(v7, v8, v9);
      if (v10 != 0.0 && v11 != 0.0)
      {
        double v12 = *(double *)(a1 + 56);
        double v13 = v12 - v10;
        if (v13 < 0.0) {
          double v13 = -v13;
        }
        if (v13 / v12 <= 0.15)
        {
          double v14 = *(double *)(a1 + 64);
          double v15 = v14 - v11;
          if (v15 < 0.0) {
            double v15 = -v15;
          }
          if (v15 / v14 <= 0.15)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            *a3 = 1;
          }
        }
      }
    }
  }
}

- (void)checkForSimilarRenderedText:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  target = self->_target;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__WBSElementTargetingResult_checkForSimilarRenderedText___block_invoke;
  v7[3] = &unk_1E5E426D8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(_WKTargetedElementInfo *)target safari_renderedTextForCheckingSimilarityWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__WBSElementTargetingResult_checkForSimilarRenderedText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  if (![v3 length])
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__7;
  double v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__WBSElementTargetingResult_checkForSimilarRenderedText___block_invoke_2;
  v6[3] = &unk_1E5E426B0;
  id v7 = v3;
  id v8 = &v14;
  id v9 = &v10;
  [WeakRetained _forEachPotentiallySimilarElement:v6];
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *((unsigned char *)v11 + 24) == 0, v15[5]);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

LABEL_7:
}

void __57__WBSElementTargetingResult_checkForSimilarRenderedText___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = (void *)a1[4];
  id v11 = v6;
  id v8 = [v6 imageAnalysisText];
  if (objc_msgSend(v7, "safari_hasSimilarText:", v8))
  {
  }
  else
  {
    id v9 = (void *)a1[4];
    uint64_t v10 = [v11 renderTreeText];
    LODWORD(v9) = objc_msgSend(v9, "safari_hasSimilarText:", v10);

    if (!v9) {
      goto LABEL_5;
    }
  }
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  *a3 = 1;
LABEL_5:
}

- (_WKTargetedElementInfo)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_perSiteElements, 0);
  objc_storeStrong((id *)&self->_globalElements, 0);
}

@end