@interface WFLSMScoreNormalizedMap
- (WFLSMScoreNormalizedMap)initWithMap:(__LSMMap *)a3;
- (id)evaluate:(id)a3;
- (void)dealloc;
@end

@implementation WFLSMScoreNormalizedMap

- (WFLSMScoreNormalizedMap)initWithMap:(__LSMMap *)a3
{
  *(void *)&v40[20] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)WFLSMScoreNormalizedMap;
  v3 = [(WFLSMMap *)&v28 initWithMap:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(WFLSMMap *)v3 numberOfCategories];
    v4->maxScore = (float *)malloc_type_malloc(4 * v5 + 4, 0x100004052888210uLL);
    v6 = (float *)malloc_type_malloc(4 * v5 + 4, 0x100004052888210uLL);
    v4->minScore = v6;
    if ((v5 & 0x8000000000000000) == 0)
    {
      uint64_t v7 = 0;
      maxScore = v4->maxScore;
      do
      {
        maxScore[v7] = -1.0;
        v6[v7++] = -1.0;
      }
      while (v5 + 1 != v7);
      if (v5 >= 1)
      {
        uint64_t v9 = 0;
        v26 = (uint64_t *)v40;
        for (uint64_t i = 1; i <= v5; ++i)
        {
          id v11 = +[WFWebPageToTrainingText signatureForCategory:](WFWebPageToTrainingText, "signatureForCategory:", i, v26);
          v27.receiver = v4;
          v27.super_class = (Class)WFLSMScoreNormalizedMap;
          id v12 = [(WFLSMMap *)&v27 evaluate:v11];
          if ([v12 bestMatchingCategory] == i)
          {
            [v12 scoreForCategory:i];
            v4->maxScore[i] = v13;
            for (uint64_t j = 1; j <= v5; ++j)
            {
              if (v9 + j != 1)
              {
                [v12 scoreForCategory:j];
                minScore = v4->minScore;
                float v17 = minScore[j];
                if (v17 <= 0.0 || v15 < v17) {
                  minScore[j] = v15;
                }
              }
            }
          }
          else
          {
            v19 = __WFDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[WFLSMScoreNormalizedMap initWithMap:](v39, (uint64_t)v4, v26, v19);
            }
          }
          --v9;
        }
        for (uint64_t k = 1; k <= v5; ++k)
        {
          v21 = __WFDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = [(id)objc_opt_class() description];
            float v23 = v4->minScore[k];
            float v24 = v4->maxScore[k];
            *(_DWORD *)buf = 138413314;
            uint64_t v30 = v22;
            __int16 v31 = 1024;
            int v32 = k;
            __int16 v33 = 2048;
            double v34 = v23;
            __int16 v35 = 2048;
            double v36 = v24;
            __int16 v37 = 2048;
            double v38 = (float)(v24 - v23);
            _os_log_impl(&dword_217734000, v21, OS_LOG_TYPE_INFO, "%@ category:%d min:%f max:%f scope:%f", buf, 0x30u);
          }
        }
      }
    }
  }
  return v4;
}

- (id)evaluate:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)WFLSMScoreNormalizedMap;
  id v4 = [(WFLSMMap *)&v18 evaluate:a3];
  uint64_t v5 = [(WFLSMMap *)self numberOfCategories];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    float v8 = 0.0;
    do
    {
      uint64_t v9 = v7 + 1;
      [v4 scoreForCategory:v7 + 1];
      float v10 = self->minScore[v7 + 1];
      float v12 = (float)(v11 - v10) / (float)(self->maxScore[v7 + 1] - v10);
      if (v12 < 0.0) {
        float v12 = 0.0;
      }
      float v8 = v8 + v12;
      objc_msgSend(v4, "setScore:forCategory:", ++v7);
    }
    while (v6 != v9);
    uint64_t v13 = 0;
    float v14 = 1.0 / v8;
    do
    {
      [v4 scoreForCategory:++v13];
      *(float *)&double v16 = v14 * v15;
      [v4 setScore:v13 forCategory:v16];
    }
    while (v6 != v13);
  }
  return v4;
}

- (void)dealloc
{
  free(self->maxScore);
  free(self->minScore);
  v3.receiver = self;
  v3.super_class = (Class)WFLSMScoreNormalizedMap;
  [(WFLSMMap *)&v3 dealloc];
}

- (void)initWithMap:(uint64_t *)a3 .cold.1(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = [(id)objc_opt_class() description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_217734000, a4, OS_LOG_TYPE_ERROR, "**** %@ ERROR: bestMatchingCategory doesn't match category_i, error in the creating of the map", a1, 0xCu);
}

@end