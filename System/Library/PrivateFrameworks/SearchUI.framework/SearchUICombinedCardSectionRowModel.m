@interface SearchUICombinedCardSectionRowModel
- (BOOL)isDraggable;
- (BOOL)isTappable;
- (Class)cellViewClass;
- (Class)collectionViewCellClass;
- (NSArray)cardSectionRowModels;
- (NSArray)snippetUICardSections;
- (SearchUICombinedCardSectionRowModel)initWithResult:(id)a3 cardSectionRowModels:(id)a4 cardSection:(id)a5 dataSourceIdentifier:(id)a6;
- (SearchUICombinedCardSectionRowModel)initWithResult:(id)a3 cardSectionRowModels:(id)a4 dataSourceIdentifier:(id)a5;
- (id)backgroundColor;
- (id)backgroundImage;
- (id)cardSection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dragSubtitle;
- (id)dragText;
- (id)dragTitle;
- (id)dragURL;
- (id)firstRowModel;
- (id)nextCard;
- (id)punchouts;
- (id)reuseIdentifier;
- (int)separatorStyle;
- (void)setCardSectionRowModels:(id)a3;
- (void)setIsTopHit:(BOOL)a3;
@end

@implementation SearchUICombinedCardSectionRowModel

- (SearchUICombinedCardSectionRowModel)initWithResult:(id)a3 cardSectionRowModels:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICombinedCardSectionRowModel;
  v9 = [(SearchUIRowModel *)&v12 initWithResult:a3 itemIdentifier:a5];
  v10 = v9;
  if (v9) {
    [(SearchUICombinedCardSectionRowModel *)v9 setCardSectionRowModels:v8];
  }

  return v10;
}

- (SearchUICombinedCardSectionRowModel)initWithResult:(id)a3 cardSectionRowModels:(id)a4 cardSection:(id)a5 dataSourceIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchUICombinedCardSectionRowModel;
  v14 = -[SearchUIRowModel initWithResult:cardSection:queryId:itemIdentifier:](&v16, sel_initWithResult_cardSection_queryId_itemIdentifier_, v13, v12, [v13 queryId], v11);

  if (v14) {
    [(SearchUICombinedCardSectionRowModel *)v14 setCardSectionRowModels:v10];
  }

  return v14;
}

- (id)nextCard
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(SearchUICombinedCardSectionRowModel *)self cardSectionRowModels];
  v4 = (void *)[v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [v7 nextCard];

        if (v8)
        {
          v4 = [v7 nextCard];
          goto LABEL_11;
        }
      }
      v4 = (void *)[v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v9 = [(SearchUIRowModel *)self identifyingResult];
  id v10 = [v9 card];
  id v11 = v10;
  if (!v10) {
    id v10 = v4;
  }
  id v12 = v10;

  return v12;
}

- (BOOL)isTappable
{
  return 1;
}

- (int)separatorStyle
{
  v2 = [(SearchUICombinedCardSectionRowModel *)self cardSectionRowModels];
  v3 = [v2 lastObject];
  int v4 = [v3 separatorStyle];

  return v4;
}

- (NSArray)snippetUICardSections
{
  v3 = objc_opt_new();
  int v4 = +[SnippetUIUtilities supportsConfigurationForCombinedRowModel:self];

  return (NSArray *)v4;
}

- (id)reuseIdentifier
{
  v3 = [(SearchUICombinedCardSectionRowModel *)self snippetUICardSections];
  if ([v3 count])
  {
    int v4 = @"SnippetUICombinedCell";
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICombinedCardSectionRowModel;
    int v4 = [(SearchUIRowModel *)&v6 reuseIdentifier];
  }

  return v4;
}

- (id)punchouts
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SearchUIRowModel *)self identifyingResult];
  uint64_t v4 = [v3 punchout];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    objc_super v6 = [(SearchUIRowModel *)self identifyingResult];
    v7 = [v6 punchout];
    v23[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

    if (v8) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = [(SearchUICombinedCardSectionRowModel *)self cardSectionRowModels];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v8 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = [v14 punchouts];

        if (v15)
        {
          uint64_t v16 = [v14 punchouts];

          id v8 = (void *)v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  else
  {
    id v8 = 0;
  }

LABEL_17:
  return v8;
}

- (id)dragURL
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SearchUICombinedCardSectionRowModel *)self cardSectionRowModels];
  v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v7 = [v6 dragURL];

        if (v7)
        {
          v3 = [v6 dragURL];
          goto LABEL_11;
        }
      }
      v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)firstRowModel
{
  v2 = [(SearchUICombinedCardSectionRowModel *)self cardSectionRowModels];
  v3 = [v2 firstObject];

  return v3;
}

- (id)dragTitle
{
  v2 = [(SearchUICombinedCardSectionRowModel *)self firstRowModel];
  v3 = [v2 dragTitle];

  return v3;
}

- (id)dragText
{
  v2 = [(SearchUICombinedCardSectionRowModel *)self firstRowModel];
  v3 = [v2 dragText];

  return v3;
}

- (id)dragSubtitle
{
  v2 = [(SearchUICombinedCardSectionRowModel *)self firstRowModel];
  v3 = [v2 dragSubtitle];

  return v3;
}

- (BOOL)isDraggable
{
  v2 = [(SearchUICombinedCardSectionRowModel *)self firstRowModel];
  char v3 = [v2 isDraggable];

  return v3;
}

- (Class)cellViewClass
{
  return (Class)objc_opt_class();
}

- (id)cardSection
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUICombinedCardSectionRowModel;
  char v3 = [(SearchUIRowModel *)&v8 cardSection];

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICombinedCardSectionRowModel;
    uint64_t v4 = [(SearchUIRowModel *)&v7 cardSection];
  }
  else
  {
    uint64_t v5 = [(SearchUICombinedCardSectionRowModel *)self firstRowModel];
    uint64_t v4 = [v5 cardSection];
  }
  return v4;
}

- (id)backgroundColor
{
  if ([(SearchUIRowModel *)self allowBackgroundColor])
  {
    v12.receiver = self;
    v12.super_class = (Class)SearchUICombinedCardSectionRowModel;
    char v3 = [(SearchUIRowModel *)&v12 cardSection];

    if (!v3
      || (v11.receiver = self,
          v11.super_class = (Class)SearchUICombinedCardSectionRowModel,
          [(SearchUIRowModel *)&v11 backgroundColor],
          (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v5 = [(SearchUIRowModel *)self identifyingResult];
      objc_super v6 = +[SearchUIUtilities cardForRenderingResult:v5];
      objc_super v7 = [v6 backgroundColor];
      objc_super v8 = v7;
      if (v7)
      {
        id v4 = v7;
      }
      else
      {
        long long v9 = [(SearchUICombinedCardSectionRowModel *)self firstRowModel];
        id v4 = [v9 backgroundColor];
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)backgroundImage
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUICombinedCardSectionRowModel;
  char v3 = [(SearchUIRowModel *)&v12 cardSection];

  if (!v3
    || (v11.receiver = self,
        v11.super_class = (Class)SearchUICombinedCardSectionRowModel,
        [(SearchUIRowModel *)&v11 backgroundImage],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = [(SearchUIRowModel *)self identifyingResult];
    objc_super v6 = +[SearchUIUtilities cardForRenderingResult:v5];
    objc_super v7 = [v6 backgroundImage];
    objc_super v8 = v7;
    if (v7)
    {
      id v4 = v7;
    }
    else
    {
      long long v9 = [(SearchUICombinedCardSectionRowModel *)self firstRowModel];
      id v4 = [v9 backgroundImage];
    }
  }
  return v4;
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUICombinedCardSectionRowModel;
  id v4 = [(SearchUIRowModel *)&v7 copyWithZone:a3];
  uint64_t v5 = [(SearchUICombinedCardSectionRowModel *)self cardSectionRowModels];
  [v4 setCardSectionRowModels:v5];

  return v4;
}

- (void)setIsTopHit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SearchUICombinedCardSectionRowModel;
  -[SearchUIRowModel setIsTopHit:](&v14, sel_setIsTopHit_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(SearchUICombinedCardSectionRowModel *)self cardSectionRowModels];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setIsTopHit:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSArray)cardSectionRowModels
{
  return self->_cardSectionRowModels;
}

- (void)setCardSectionRowModels:(id)a3
{
}

- (void).cxx_destruct
{
}

@end