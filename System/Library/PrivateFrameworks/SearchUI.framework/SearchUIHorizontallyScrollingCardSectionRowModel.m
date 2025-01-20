@interface SearchUIHorizontallyScrollingCardSectionRowModel
- (BOOL)hasLeadingImage;
- (NSArray)cardSectionRowModels;
- (SearchUIHorizontallyScrollingCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6 builder:(id)a7;
- (SearchUIHorizontallyScrollingCardSectionRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4 builder:(id)a5;
- (id)cardSection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reuseIdentifier;
- (int64_t)numberOfRows;
- (void)setCardSectionRowModels:(id)a3;
@end

@implementation SearchUIHorizontallyScrollingCardSectionRowModel

- (SearchUIHorizontallyScrollingCardSectionRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4 builder:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v36.receiver = self;
  v36.super_class = (Class)SearchUIHorizontallyScrollingCardSectionRowModel;
  v10 = [(SearchUIRowModel *)&v36 initWithResults:v8 itemIdentifier:a4];
  v11 = v10;
  if (v10)
  {
    v24 = v10;
    v12 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v8;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v27 = *(void *)v33;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * v15);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v17 = +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v16, v24);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v29;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v29 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = [v9 buildRowModelFromCardSection:*(void *)(*((void *)&v28 + 1) + 8 * v21) result:v16];
                [v12 addObject:v22];

                ++v21;
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
            }
            while (v19);
          }

          ++v15;
        }
        while (v15 != v14);
        uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v14);
    }

    v11 = v24;
    [(SearchUIHorizontallyScrollingCardSectionRowModel *)v24 setCardSectionRowModels:v12];
    v24->_numberOfRows = 1;

    id v8 = v25;
  }

  return v11;
}

- (SearchUIHorizontallyScrollingCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6 builder:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SearchUIHorizontallyScrollingCardSectionRowModel;
  uint64_t v15 = [(SearchUIRowModel *)&v29 initWithResult:v12 cardSection:v13 queryId:a5 itemIdentifier:a6];
  if (v15)
  {
    uint64_t v16 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = objc_msgSend(v13, "cardSections", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [v14 buildRowModelFromCardSection:*(void *)(*((void *)&v25 + 1) + 8 * v21) result:v12];
          [v16 addObject:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v19);
    }

    [(SearchUIHorizontallyScrollingCardSectionRowModel *)v15 setCardSectionRowModels:v16];
    if ([v13 numberOfRows]) {
      uint64_t v23 = (int)[v13 numberOfRows];
    }
    else {
      uint64_t v23 = 1;
    }
    v15->_numberOfRows = v23;
  }
  return v15;
}

- (id)cardSection
{
  v2 = [(SearchUIHorizontallyScrollingCardSectionRowModel *)self cardSectionRowModels];
  v3 = [v2 firstObject];
  v4 = [v3 cardSection];

  return v4;
}

- (id)reuseIdentifier
{
  return 0;
}

- (BOOL)hasLeadingImage
{
  v2 = [(SearchUIHorizontallyScrollingCardSectionRowModel *)self cardSectionRowModels];
  v3 = [v2 firstObject];
  char v4 = [v3 hasLeadingImage];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIHorizontallyScrollingCardSectionRowModel;
  id v4 = [(SearchUIRowModel *)&v7 copyWithZone:a3];
  v5 = [(SearchUIHorizontallyScrollingCardSectionRowModel *)self cardSectionRowModels];
  [v4 setCardSectionRowModels:v5];

  return v4;
}

- (NSArray)cardSectionRowModels
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCardSectionRowModels:(id)a3
{
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void).cxx_destruct
{
}

@end