@interface SearchUIImageGridRowModel
- (BOOL)isTappable;
- (Class)cardSectionViewClass;
- (NSArray)cardSectionRowModels;
- (SearchUIImageGridRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7 builder:(id)a8;
- (SearchUIImageGridRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4 builder:(id)a5;
- (id)cardSection;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCardSectionRowModels:(id)a3;
@end

@implementation SearchUIImageGridRowModel

- (SearchUIImageGridRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4 builder:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v28 = a5;
  v41.receiver = self;
  v41.super_class = (Class)SearchUIImageGridRowModel;
  v9 = [(SearchUIRowModel *)&v41 initWithResults:v8 itemIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    v24 = v9;
    v27 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v25 = v8;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v38;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * v14);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __68__SearchUIImageGridRowModel_initWithResults_itemIdentifier_builder___block_invoke;
          aBlock[3] = &unk_1E6E74440;
          id v16 = v27;
          id v34 = v16;
          id v35 = v28;
          uint64_t v36 = v15;
          v17 = (void (**)(void *, void))_Block_copy(aBlock);
          [v16 count];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          v18 = +[SearchUIUtilities cardSectionsForRenderingResult:v15];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v42 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v30;
            do
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v30 != v21) {
                  objc_enumerationMutation(v18);
                }
                v17[2](v17, *(void *)(*((void *)&v29 + 1) + 8 * v22++));
              }
              while (v20 != v22);
              uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v42 count:16];
            }
            while (v20);
          }

          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v12);
    }

    v10 = v24;
    [(SearchUIImageGridRowModel *)v24 setCardSectionRowModels:v27];

    id v8 = v25;
  }

  return v10;
}

void __68__SearchUIImageGridRowModel_initWithResults_itemIdentifier_builder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = objc_msgSend(v3, "cardSections", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(a1 + 32);
          v10 = [*(id *)(a1 + 40) buildRowModelFromCardSection:*(void *)(*((void *)&v11 + 1) + 8 * v8) result:*(void *)(a1 + 48)];
          [v9 addObject:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (SearchUIImageGridRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7 builder:(id)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  v29.receiver = self;
  v29.super_class = (Class)SearchUIImageGridRowModel;
  uint64_t v16 = [(SearchUIRowModel *)&v29 initWithResult:v13 cardSection:v14 queryId:a6 itemIdentifier:a7];
  if (v16)
  {
    v17 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v18 = objc_msgSend(v14, "cardSections", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [v15 buildRowModelFromCardSection:*(void *)(*((void *)&v25 + 1) + 8 * v22) result:v13];
          [v17 addObject:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v20);
    }

    [(SearchUIImageGridRowModel *)v16 setCardSectionRowModels:v17];
  }

  return v16;
}

- (id)cardSection
{
  id v3 = [(SearchUIRowModel *)self identifyingResult];
  v4 = +[SearchUIUtilities cardSectionsForRenderingResult:v3];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIImageGridRowModel;
    id v7 = [(SearchUIRowModel *)&v10 cardSection];
  }
  uint64_t v8 = v7;

  return v8;
}

- (Class)cardSectionViewClass
{
  v2 = objc_opt_new();
  id v3 = +[SearchUICardSectionCreator viewClassForCardSection:v2 horizontal:0];

  return (Class)v3;
}

- (BOOL)isTappable
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIImageGridRowModel;
  id v4 = [(SearchUICardSectionRowModel *)&v7 copyWithZone:a3];
  uint64_t v5 = [(SearchUIImageGridRowModel *)self cardSectionRowModels];
  [v4 setCardSectionRowModels:v5];

  return v4;
}

- (NSArray)cardSectionRowModels
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCardSectionRowModels:(id)a3
{
}

- (void).cxx_destruct
{
}

@end