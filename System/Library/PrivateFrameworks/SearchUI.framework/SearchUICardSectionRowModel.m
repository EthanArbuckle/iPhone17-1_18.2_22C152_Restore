@interface SearchUICardSectionRowModel
- (BOOL)allowsAppEntityAnnotation;
- (BOOL)anyCardSectionsAreTappable:(id)a3;
- (BOOL)anyCardSectionsHaveNextCards:(id)a3;
- (BOOL)fillsBackgroundWithContent;
- (BOOL)hasLeadingImage;
- (BOOL)isDraggable;
- (BOOL)isFocusable;
- (BOOL)isHorizontalInLayout;
- (BOOL)isInline;
- (BOOL)isQuerySuggestion;
- (BOOL)isTappable;
- (BOOL)prefersNoSeparatorAbove;
- (BOOL)shouldFillAvailableSpace;
- (BOOL)supportsCustomUserReportRequestAfforance;
- (CGSize)minimumLayoutSize;
- (Class)cardSectionViewClass;
- (Class)cellViewClass;
- (Class)collectionViewCellClass;
- (NSString)cardReuseIdentifier;
- (SearchUICardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
- (id)accessibilityIdentifier;
- (id)backgroundColor;
- (id)backgroundImage;
- (id)contactIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dragSubtitle;
- (id)dragText;
- (id)dragTitle;
- (id)dragURL;
- (id)fallbackCardSectionForCompactResult;
- (id)horizontalRowModel;
- (id)nextCard;
- (id)punchouts;
- (id)reuseIdentifier;
- (int)separatorStyle;
- (void)setCardReuseIdentifier:(id)a3;
- (void)setIsHorizontalInLayout:(BOOL)a3;
- (void)setIsInline:(BOOL)a3;
- (void)setMinimumLayoutSize:(CGSize)a3;
- (void)setShouldFillAvailableSpace:(BOOL)a3;
@end

@implementation SearchUICardSectionRowModel

- (SearchUICardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  BOOL v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)SearchUICardSectionRowModel;
  v8 = [(SearchUIRowModel *)&v11 initWithResult:a3 cardSection:a4 queryId:a6 itemIdentifier:a7];
  v9 = v8;
  if (v8) {
    [(SearchUICardSectionRowModel *)v8 setIsInline:v7];
  }
  return v9;
}

- (id)horizontalRowModel
{
  v2 = (void *)[(SearchUICardSectionRowModel *)self copy];
  [v2 setIsHorizontalInLayout:1];
  return v2;
}

- (id)punchouts
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(SearchUIRowModel *)self cardSection];
  v4 = [v3 punchoutOptions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) urls];
        uint64_t v10 = [v9 count];

        if (v10)
        {

          objc_super v11 = [(SearchUIRowModel *)self cardSection];
          v13 = [v11 punchoutOptions];
          goto LABEL_16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  objc_super v11 = [(SearchUIRowModel *)self identifyingResult];
  v12 = +[SearchUIUtilities cardSectionsForRenderingResult:v11];
  if ([(SearchUICardSectionRowModel *)self anyCardSectionsAreTappable:v12])
  {

LABEL_14:
    v15 = [(SearchUICardSectionRowModel *)self fallbackCardSectionForCompactResult];
    uint64_t v16 = [v15 punchoutOptions];
    goto LABEL_15;
  }
  v14 = [v11 punchout];

  if (!v14) {
    goto LABEL_14;
  }
  v15 = [v11 punchout];
  v22 = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
LABEL_15:
  v13 = (void *)v16;

LABEL_16:
  return v13;
}

- (BOOL)anyCardSectionsAreTappable:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "punchoutOptions", (void)v16);
        if ([v10 count])
        {

LABEL_14:
          BOOL v14 = 1;
          goto LABEL_15;
        }
        objc_super v11 = [v9 command];

        if (v11) {
          goto LABEL_14;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v9 cardSections];
          BOOL v13 = [(SearchUICardSectionRowModel *)self anyCardSectionsAreTappable:v12];

          if (v13) {
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = [(SearchUICardSectionRowModel *)self anyCardSectionsHaveNextCards:v4];
LABEL_15:

  return v14;
}

- (BOOL)anyCardSectionsHaveNextCards:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "nextCard", (void)v9);

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)reuseIdentifier
{
  id v3 = [(SearchUICardSectionRowModel *)self cardReuseIdentifier];

  if (!v3)
  {
    uint64_t v4 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
    uint64_t v5 = [(SearchUIRowModel *)self cardSection];
    int v6 = [(objc_class *)v4 supportsRecyclingForCardSection:v5];

    if (!reuseIdentifier_cardSectionReuseDict)
    {
      uint64_t v7 = objc_opt_new();
      v8 = (void *)reuseIdentifier_cardSectionReuseDict;
      reuseIdentifier_cardSectionReuseDict = v7;
    }
    if (v4) {
      int v9 = v6;
    }
    else {
      int v9 = 0;
    }
    if (v9 == 1)
    {
      long long v10 = [(id)reuseIdentifier_cardSectionReuseDict objectForKeyedSubscript:v4];
      if (!v10)
      {
        long long v10 = NSStringFromClass(v4);
        [(id)reuseIdentifier_cardSectionReuseDict setObject:v10 forKeyedSubscript:v4];
      }
      long long v11 = NSString;
      v16.receiver = self;
      v16.super_class = (Class)SearchUICardSectionRowModel;
      long long v12 = [(SearchUIRowModel *)&v16 reuseIdentifier];
      BOOL v13 = [v11 stringWithFormat:@"%@-%@", v12, v10];
      [(SearchUICardSectionRowModel *)self setCardReuseIdentifier:v13];
    }
  }
  uint64_t v14 = [(SearchUICardSectionRowModel *)self cardReuseIdentifier];
  return v14;
}

- (BOOL)isFocusable
{
  id v3 = [(SearchUIRowModel *)self cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICardSectionRowModel;
    BOOL v4 = [(SearchUIRowModel *)&v6 isFocusable];
  }

  return v4;
}

- (BOOL)isQuerySuggestion
{
  v2 = [(SearchUIRowModel *)self cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    int v4 = [v3 suggestionType];
    if (v4)
    {
      int v5 = v4;

      if (v5 == 1) {
        goto LABEL_11;
      }
    }
    else
    {
      objc_super v6 = [v3 thumbnail];
      if (!v6) {
        goto LABEL_8;
      }
    }
  }
  id v3 = [v2 command];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    LOBYTE(v5) = objc_opt_isKindOfClass();
    goto LABEL_10;
  }
LABEL_8:
  LOBYTE(v5) = 1;
LABEL_10:

LABEL_11:
  return v5 & 1;
}

- (Class)cellViewClass
{
  return (Class)objc_opt_class();
}

- (id)nextCard
{
  id v3 = [(SearchUIRowModel *)self cardSection];
  int v4 = [v3 command];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 card];
    if (v5) {
      goto LABEL_9;
    }
  }
  int v5 = [v3 nextCard];
  if (v5) {
    goto LABEL_9;
  }
  objc_super v6 = [(SearchUIRowModel *)self cardSection];
  uint64_t v7 = [v6 punchoutOptions];
  if ([v7 count])
  {

LABEL_8:
    BOOL v13 = [(SearchUICardSectionRowModel *)self fallbackCardSectionForCompactResult];
    int v5 = [v13 nextCard];

    goto LABEL_9;
  }
  v8 = [(SearchUIRowModel *)self identifyingResult];
  int v9 = [v8 inlineCard];
  long long v10 = [v9 cardSections];
  BOOL v11 = [(SearchUICardSectionRowModel *)self anyCardSectionsHaveNextCards:v10];

  if (v11) {
    goto LABEL_8;
  }
  long long v12 = [(SearchUIRowModel *)self identifyingResult];
  int v5 = [v12 card];

  if (!v5) {
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)fallbackCardSectionForCompactResult
{
  id v3 = [(SearchUIRowModel *)self identifyingResult];
  int v4 = [v3 inlineCard];
  int v5 = [v4 cardSections];

  objc_super v6 = [(SearchUIRowModel *)self identifyingResult];
  if ([v6 usesCompactDisplay] && objc_msgSend(v5, "count") == 1)
  {
    uint64_t v7 = [v5 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isTappable
{
  id v3 = [(SearchUIRowModel *)self identifyingResult];
  int v4 = +[SearchUIUtilities cardForRenderingResult:v3];
  int v5 = [(SearchUICardSectionRowModel *)self nextCard];
  if (!v5 && ![(SearchUICardSectionRowModel *)self isQuerySuggestion])
  {
    v8 = [(SearchUICardSectionRowModel *)self punchouts];
    if ([v8 count])
    {
      BOOL v6 = 1;
LABEL_30:

      goto LABEL_4;
    }
    int v9 = [v3 userActivityRequiredString];
    if ([v9 length])
    {
      BOOL v6 = 1;
LABEL_29:

      goto LABEL_30;
    }
    long long v10 = [v3 applicationBundleIdentifier];
    if (v10)
    {
      BOOL v6 = 1;
LABEL_28:

      goto LABEL_29;
    }
    BOOL v11 = [v4 intentMessageName];
    if (v11 && ([v4 intentMessageData], (long long v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v6 = 1;
    }
    else
    {
      BOOL v13 = [(SearchUIRowModel *)self cardSection];
      uint64_t v14 = [v13 userReportRequest];
      if (v14
        && ![(SearchUICardSectionRowModel *)self supportsCustomUserReportRequestAfforance])
      {

        BOOL v6 = 1;
        if (!v11) {
          goto LABEL_27;
        }
      }
      else
      {
        long long v20 = v13;
        long long v19 = [(SearchUIRowModel *)self cardSection];
        v15 = [v19 commands];
        if ([v15 count])
        {
          BOOL v6 = 1;
        }
        else
        {
          long long v18 = [v3 identifier];
          if ([v18 hasPrefix:@"com.apple.other"])
          {
            BOOL v6 = 1;
          }
          else
          {
            long long v17 = [(SearchUIRowModel *)self cardSection];
            objc_super v16 = [v17 command];
            BOOL v6 = v16 != 0;
          }
        }

        if (!v11) {
          goto LABEL_27;
        }
      }
      long long v12 = 0;
    }

LABEL_27:
    goto LABEL_28;
  }
  BOOL v6 = 1;
LABEL_4:

  return v6;
}

- (BOOL)isDraggable
{
  if ([(SearchUICardSectionRowModel *)self isQuerySuggestion])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v4 = [(SearchUIRowModel *)self identifyingResult];
    if (+[SearchUIUtilities resultIsSiriAction:v4])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      int v5 = [(SearchUIRowModel *)self identifyingResult];
      BOOL v6 = [v5 sectionBundleIdentifier];
      int v3 = [v6 hasSuffix:@"search-through"] ^ 1;
    }
  }
  return v3;
}

- (id)dragTitle
{
  int v3 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
  int v4 = [(SearchUIRowModel *)self cardSection];
  int v5 = [(objc_class *)v3 dragTitleForCardSection:v4];

  return v5;
}

- (id)dragSubtitle
{
  int v3 = [(SearchUICardSectionRowModel *)self dragURL];
  int v4 = [v3 host];

  if (!v4)
  {
    int v5 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
    BOOL v6 = [(SearchUIRowModel *)self cardSection];
    int v4 = [(objc_class *)v5 dragSubtitleForCardSection:v6];
  }
  return v4;
}

- (id)dragText
{
  int v3 = objc_opt_new();
  int v4 = [(SearchUICardSectionRowModel *)self dragTitle];
  int v5 = [(SearchUICardSectionRowModel *)self dragSubtitle];
  if ([v4 length]) {
    [v3 appendString:v4];
  }
  if ([v3 length]) {
    [v3 appendString:@"\n"];
  }
  if ([v5 length]) {
    [v3 appendString:v5];
  }

  return v3;
}

- (id)dragURL
{
  int v3 = [(SearchUICardSectionRowModel *)self punchouts];
  int v4 = [v3 firstObject];
  int v5 = [v4 preferredOpenableURL];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(SearchUIRowModel *)self identifyingResult];
    int v9 = [v8 punchout];
    id v7 = [v9 preferredOpenableURL];
  }
  return v7;
}

- (int)separatorStyle
{
  int v3 = [(SearchUIRowModel *)self cardSection];
  int v4 = [v3 separatorStyle];

  int v5 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
  if (v4 || !v5) {
    return v4;
  }
  return [(objc_class *)v5 defaultSeparatorStyleForRowModel:self];
}

- (BOOL)fillsBackgroundWithContent
{
  int v3 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
  return [(objc_class *)v3 fillsBackgroundWithContentForRowModel:self];
}

- (BOOL)hasLeadingImage
{
  int v3 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
  int v4 = [(SearchUIRowModel *)self cardSection];
  LOBYTE(v3) = [(objc_class *)v3 hasLeadingImageForCardSection:v4];

  return (char)v3;
}

- (BOOL)prefersNoSeparatorAbove
{
  int v3 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
  return [(objc_class *)v3 prefersNoSeparatorAboveRowModel:self];
}

- (BOOL)supportsCustomUserReportRequestAfforance
{
  v2 = [(SearchUICardSectionRowModel *)self cardSectionViewClass];
  return [(objc_class *)v2 supportsCustomUserReportRequestAfforance];
}

- (id)backgroundColor
{
  if ([(SearchUIRowModel *)self allowBackgroundColor])
  {
    int v3 = [(SearchUIRowModel *)self identifyingResult];
    int v4 = +[SearchUIUtilities cardForRenderingResult:v3];

    int v5 = [v4 cardSections];
    if ([v5 count] == 1)
    {
      BOOL v6 = [v4 backgroundColor];
    }
    else
    {
      BOOL v6 = 0;
    }

    v12.receiver = self;
    v12.super_class = (Class)SearchUICardSectionRowModel;
    v8 = [(SearchUIRowModel *)&v12 backgroundColor];
    int v9 = v8;
    if (v8 || (int v9 = v6) != 0)
    {
      id v7 = v9;
    }
    else
    {
      BOOL v11 = [(SearchUIRowModel *)self cardSection];
      id v7 = [v11 backgroundColor];
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)backgroundImage
{
  int v3 = [(SearchUIRowModel *)self identifyingResult];
  int v4 = +[SearchUIUtilities cardForRenderingResult:v3];

  int v5 = [v4 cardSections];
  if ([v5 count] == 1)
  {
    BOOL v6 = [v4 backgroundImage];
  }
  else
  {
    BOOL v6 = 0;
  }

  id v7 = [(SearchUICardSectionRowModel *)self backgroundColor];
  if (v7) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (Class)cardSectionViewClass
{
  int v3 = [(SearchUIRowModel *)self cardSection];
  int v4 = +[SearchUICardSectionCreator viewClassForCardSection:v3 horizontal:[(SearchUICardSectionRowModel *)self isHorizontalInLayout]];

  return (Class)v4;
}

- (id)accessibilityIdentifier
{
  int v3 = [(SearchUIRowModel *)self cardSection];
  int v4 = [(SearchUIRowModel *)self identifyingResult];
  if (([v4 usesCompactDisplay] & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v3 shouldUseCompactDisplay] & 1) == 0)
    {

LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = @"PersonEntityHeaderCell";
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = @"EntityInfoCell";
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = @"ImageCell";
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_16;
            }
            long long v10 = [v3 punchoutOptions];
            BOOL v11 = [v10 firstObject];
            objc_super v12 = [v11 urls];
            uint64_t v13 = [v12 count];

            if (v13)
            {
              id v9 = @"WebPunchOutCell";
            }
            else
            {
LABEL_16:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v9 = @"MapViewCell";
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v9 = @"HeroCardCell";
                }
                else
                {
                  v15.receiver = self;
                  v15.super_class = (Class)SearchUICardSectionRowModel;
                  id v9 = [(SearchUIRowModel *)&v15 accessibilityIdentifier];
                }
              }
            }
          }
        }
      }
      goto LABEL_21;
    }
  }
  int v5 = [(SearchUICardSectionRowModel *)self punchouts];
  BOOL v6 = [v5 firstObject];
  id v7 = [v6 urls];
  uint64_t v8 = [v7 count];

  if (!v8) {
    goto LABEL_7;
  }
  id v9 = @"CompactPunchoutTopHitCell";
LABEL_21:

  return v9;
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  int v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)SearchUICardSectionRowModel;
  int v4 = [(SearchUICardSectionRowModel *)&v10 description];
  int v5 = [v3 stringWithString:v4];

  BOOL v6 = [(SearchUIRowModel *)self cardSection];

  if (v6)
  {
    id v7 = [(SearchUIRowModel *)self cardSection];
    uint64_t v8 = [v7 description];
    [v5 appendString:v8];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionRowModel;
  id v4 = [(SearchUIRowModel *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setIsInline:", -[SearchUICardSectionRowModel isInline](self, "isInline"));
  objc_msgSend(v4, "setIsHorizontalInLayout:", -[SearchUICardSectionRowModel isHorizontalInLayout](self, "isHorizontalInLayout"));
  return v4;
}

- (id)contactIdentifiers
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(SearchUIRowModel *)self cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v5 = [(SearchUIRowModel *)self cardSection];
    objc_super v6 = [v5 person];

    id v7 = [v6 contactIdentifier];
    if (v7)
    {
      uint64_t v8 = [v6 contactIdentifier];
      v11[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (BOOL)allowsAppEntityAnnotation
{
  return 1;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setIsInline:(BOOL)a3
{
  self->_isInline = a3;
}

- (BOOL)isHorizontalInLayout
{
  return self->_isHorizontalInLayout;
}

- (void)setIsHorizontalInLayout:(BOOL)a3
{
  self->_isHorizontalInLayout = a3;
}

- (CGSize)minimumLayoutSize
{
  double width = self->_minimumLayoutSize.width;
  double height = self->_minimumLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumLayoutSize:(CGSize)a3
{
  self->_minimumLayoutSize = a3;
}

- (BOOL)shouldFillAvailableSpace
{
  return self->_shouldFillAvailableSpace;
}

- (void)setShouldFillAvailableSpace:(BOOL)a3
{
  self->_shouldFillAvailableSpace = a3;
}

- (NSString)cardReuseIdentifier
{
  return self->_cardReuseIdentifier;
}

- (void)setCardReuseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end