@interface SearchUIRowModel
- (BOOL)allowBackgroundColor;
- (BOOL)allowsAppEntityAnnotation;
- (BOOL)contextualActionLoaded;
- (BOOL)fillsBackgroundWithContent;
- (BOOL)hasCustomCornerRounding;
- (BOOL)hasLeadingImage;
- (BOOL)hasValidCommandHandler;
- (BOOL)isDraggable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModel:(id)a3;
- (BOOL)isQuerySuggestion;
- (BOOL)isTappable;
- (BOOL)isTopHit;
- (BOOL)prefersNoSeparatorAbove;
- (BOOL)supportsCustomUserReportRequestAfforance;
- (Class)cellViewClass;
- (Class)collectionViewCellClass;
- (NSArray)contactIdentifiers;
- (NSArray)punchouts;
- (NSArray)results;
- (NSString)accessibilityIdentifier;
- (NSString)applicationBundleIdentifier;
- (NSString)coreSpotlightIdentifier;
- (NSString)displayTitle;
- (NSString)dragAppBundleID;
- (NSString)dragSubtitle;
- (NSString)dragText;
- (NSString)dragTitle;
- (NSString)fileProviderIdentifier;
- (NSString)itemIdentifier;
- (NSString)launchActivityAppBundleId;
- (NSString)previewItemTitle;
- (NSString)reuseIdentifier;
- (NSURL)dragURL;
- (NSUserActivity)launchActivity;
- (SFCard)nextCard;
- (SFCardSection)cardSection;
- (SFColor)backgroundColor;
- (SFImage)backgroundImage;
- (SFSearchResult)identifyingResult;
- (SearchUIRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5;
- (SearchUIRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6;
- (SearchUIRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4;
- (SearchUIRowModel)initWithResults:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6;
- (SearchUIRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4;
- (WFContextualAction)contextualAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)requestAppClipObjects;
- (int)separatorStyle;
- (int64_t)sectionType;
- (unint64_t)cornerMask;
- (unint64_t)hash;
- (unint64_t)queryId;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setContextualAction:(id)a3;
- (void)setContextualActionLoaded:(BOOL)a3;
- (void)setCornerMask:(unint64_t)a3;
- (void)setHasCustomCornerRounding:(BOOL)a3;
- (void)setHasValidCommandHandler:(BOOL)a3;
- (void)setIdentifyingResult:(id)a3;
- (void)setIsTopHit:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLaunchActivity:(id)a3;
- (void)setLaunchActivityAppBundleId:(id)a3;
- (void)setPreviewItemTitle:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setResults:(id)a3;
- (void)setSectionType:(int64_t)a3;
- (void)updateWithEnvironment:(id)a3;
@end

@implementation SearchUIRowModel

- (SFSearchResult)identifyingResult
{
  v2 = [(SearchUIRowModel *)self results];
  v3 = [v2 firstObject];

  return (SFSearchResult *)v3;
}

- (NSArray)results
{
  return self->_results;
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)hasCustomCornerRounding
{
  return self->_hasCustomCornerRounding;
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setIsTopHit:(BOOL)a3
{
  self->_isTopHit = a3;
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (SearchUIRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[SearchUIRowModel initWithResult:cardSection:queryId:itemIdentifier:](self, "initWithResult:cardSection:queryId:itemIdentifier:", v7, 0, [v7 queryId], v6);

  return v8;
}

- (SearchUIRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 firstObject];
  v9 = -[SearchUIRowModel initWithResults:cardSection:queryId:itemIdentifier:](self, "initWithResults:cardSection:queryId:itemIdentifier:", v7, 0, [v8 queryId], v6);

  return v9;
}

- (SearchUIRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = v10;
  if (v10)
  {
    id v22 = v10;
    v12 = (void *)MEMORY[0x1E4F1C978];
    id v13 = a6;
    id v14 = a4;
    v15 = [v12 arrayWithObjects:&v22 count:1];
    v16 = -[SearchUIRowModel initWithResults:cardSection:queryId:itemIdentifier:](self, "initWithResults:cardSection:queryId:itemIdentifier:", v15, v14, a5, v13, v22, v23);

    v17 = v16;
  }
  else
  {
    id v18 = a6;
    id v19 = a4;
    v20 = [(SearchUIRowModel *)self initWithResults:0 cardSection:v19 queryId:a5 itemIdentifier:v18];

    v17 = v20;
  }

  return v17;
}

- (SearchUIRowModel)initWithResults:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SearchUIRowModel;
  id v13 = [(SearchUIRowModel *)&v17 init];
  id v14 = v13;
  if (v13)
  {
    [(SearchUIRowModel *)v13 setResults:v10];
    v15 = [v10 firstObject];
    [(SearchUIRowModel *)v14 setIdentifyingResult:v15];

    [(SearchUIRowModel *)v14 setCardSection:v11];
    [(SearchUIRowModel *)v14 setItemIdentifier:v12];
    v14->_queryId = a5;
  }

  return v14;
}

- (void)setResults:(id)a3
{
}

- (void)setItemIdentifier:(id)a3
{
}

- (void)setIdentifyingResult:(id)a3
{
}

- (void)setCardSection:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (id)requestAppClipObjects
{
  return 0;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SearchUIRowModel *)self itemIdentifier];
    id v7 = [v5 itemIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SearchUIRowModel *)self itemIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)reuseIdentifier
{
  unint64_t v3 = NSStringFromClass([(SearchUIRowModel *)self cellViewClass]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    NSStringFromClass([(SearchUIRowModel *)self collectionViewCellClass]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (SFCard)nextCard
{
  return self->_nextCard;
}

- (SearchUIRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5
{
  return [(SearchUIRowModel *)self initWithResults:0 cardSection:a3 queryId:a4 itemIdentifier:a5];
}

- (int)separatorStyle
{
  return 0;
}

- (BOOL)fillsBackgroundWithContent
{
  v2 = [(SearchUIRowModel *)self backgroundColor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)allowBackgroundColor
{
  if (allowBackgroundColor_onceToken != -1) {
    dispatch_once(&allowBackgroundColor_onceToken, &__block_literal_global_20);
  }
  if ([(SearchUIRowModel *)self isTopHit])
  {
    BOOL v3 = [(SearchUIRowModel *)self identifyingResult];
    int v4 = [v3 usesCompactDisplay];

    if (!v4) {
      return 1;
    }
  }
  if (allowBackgroundColor_isSafariProcess) {
    return 1;
  }
  id v5 = (void *)MEMORY[0x1E4FAE198];
  return [v5 isSiri];
}

void __40__SearchUIRowModel_allowBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v2 bundleIdentifier];
  v1 = +[SearchUIUtilities bundleIdentifierForApp:14];
  allowBackgroundColor_isSafariProcess = [v0 isEqualToString:v1];
}

- (BOOL)isQuerySuggestion
{
  return 0;
}

- (NSString)accessibilityIdentifier
{
  id v2 = [(SearchUIRowModel *)self identifyingResult];
  int v3 = [v2 type];

  if ((v3 - 16) > 0x13) {
    return (NSString *)@"ResultCell";
  }
  else {
    return &off_1E6E73698[v3 - 16]->isa;
  }
}

- (BOOL)isEqualToModel:(id)a3
{
  id v6 = (SearchUIRowModel *)a3;
  id v7 = v6;
  if (v6 != self)
  {
    identifyingResult = self->_identifyingResult;
    v9 = [(SearchUIRowModel *)v6 identifyingResult];
    if (identifyingResult != v9)
    {
      id v10 = self->_identifyingResult;
      int v3 = [(SearchUIRowModel *)v7 identifyingResult];
      if (![(SFSearchResult *)v10 isEqual:v3])
      {
        char v11 = 0;
        goto LABEL_15;
      }
    }
    cardSection = self->_cardSection;
    id v13 = [(SearchUIRowModel *)v7 cardSection];
    if (cardSection == v13
      || (id v14 = self->_cardSection,
          [(SearchUIRowModel *)v7 cardSection],
          int v4 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v14 isEqual:v4]))
    {
      results = self->_results;
      uint64_t v16 = [(SearchUIRowModel *)v7 results];
      if (results == (NSArray *)v16)
      {

        char v11 = 1;
      }
      else
      {
        objc_super v17 = (void *)v16;
        id v18 = self->_results;
        id v19 = [(SearchUIRowModel *)v7 results];
        char v11 = [(NSArray *)v18 isEqual:v19];
      }
      if (cardSection == v13)
      {
LABEL_14:

        if (identifyingResult == v9)
        {
LABEL_16:

          goto LABEL_17;
        }
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      char v11 = 0;
    }

    goto LABEL_14;
  }
  char v11 = 1;
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(SearchUIRowModel *)self results];
  [v4 setResults:v5];

  id v6 = [(SearchUIRowModel *)self cardSection];
  [v4 setCardSection:v6];

  objc_msgSend(v4, "setQueryId:", -[SearchUIRowModel queryId](self, "queryId"));
  id v7 = [(SearchUIRowModel *)self itemIdentifier];
  [v4 setItemIdentifier:v7];

  objc_msgSend(v4, "setCornerMask:", -[SearchUIRowModel cornerMask](self, "cornerMask"));
  objc_msgSend(v4, "setHasCustomCornerRounding:", -[SearchUIRowModel hasCustomCornerRounding](self, "hasCustomCornerRounding"));
  objc_msgSend(v4, "setHasValidCommandHandler:", -[SearchUIRowModel hasValidCommandHandler](self, "hasValidCommandHandler"));
  char v8 = [(SearchUIRowModel *)self contextualAction];
  [v4 setContextualAction:v8];

  objc_msgSend(v4, "setContextualActionLoaded:", -[SearchUIRowModel contextualActionLoaded](self, "contextualActionLoaded"));
  return v4;
}

- (NSString)applicationBundleIdentifier
{
  int v3 = [(SearchUIRowModel *)self identifyingResult];
  int v4 = [v3 applicationBundleIdentifier];

  if (!v4)
  {
    id v5 = [(SearchUIRowModel *)self cardSection];
    id v6 = [v5 command];

    objc_opt_class();
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    id v8 = v7;

    int v4 = [v8 applicationBundleIdentifier];

    if (!v4)
    {
      v9 = [(SearchUIRowModel *)self cardSection];
      id v10 = [v9 command];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v11 = v10;
      }
      else {
        char v11 = 0;
      }
      id v12 = v11;

      int v4 = [v12 fileProviderIdentifier];
      if (v4)
      {
        id v13 = [v12 coreSpotlightIdentifier];

        if (v13)
        {
          int v4 = +[SearchUIUtilities bundleIdentifierForApp:6];
        }
        else
        {
          int v4 = 0;
        }
      }
    }
  }
  return (NSString *)v4;
}

- (NSString)coreSpotlightIdentifier
{
  int v3 = [(SearchUIRowModel *)self identifyingResult];
  int v4 = [v3 identifier];

  if (!v4)
  {
    id v5 = [(SearchUIRowModel *)self cardSection];
    id v6 = [v5 command];

    objc_opt_class();
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    id v8 = v7;

    int v4 = [v8 coreSpotlightIdentifier];

    if (!v4)
    {
      v9 = [(SearchUIRowModel *)self cardSection];
      id v10 = [v9 command];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v11 = v10;
      }
      else {
        char v11 = 0;
      }
      id v12 = v11;

      int v4 = [v12 coreSpotlightIdentifier];
    }
  }
  return (NSString *)v4;
}

- (NSString)displayTitle
{
  id v2 = [(SearchUIRowModel *)self identifyingResult];
  int v3 = [v2 title];
  int v4 = [v3 text];

  return (NSString *)v4;
}

- (NSString)fileProviderIdentifier
{
  int v3 = [(SearchUIRowModel *)self identifyingResult];
  int v4 = [v3 fileProviderIdentifier];

  if (!v4)
  {
    id v5 = [(SearchUIRowModel *)self cardSection];
    id v6 = [v5 command];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    int v4 = [v8 fileProviderIdentifier];
  }
  return (NSString *)v4;
}

- (BOOL)allowsAppEntityAnnotation
{
  return 0;
}

- (WFContextualAction)contextualAction
{
  if ([(SearchUIRowModel *)self contextualActionLoaded])
  {
    int v3 = self->_contextualAction;
  }
  else
  {
    int v4 = +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:self];
    [(SearchUIRowModel *)self setContextualActionLoaded:1];
    id v5 = [v4 intentMessageData];

    if (!v5) {
      goto LABEL_7;
    }
    id v6 = (void *)MEMORY[0x1E4E84260]();
    id v7 = [v4 intentMessageData];
    id v5 = WFSpotlightResultRunnableFromData();

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v3 = [v5 settingBiomeStreamIdentifier];

      if (v3)
      {
        int v3 = v5;
        objc_storeStrong((id *)&self->_contextualAction, v5);
        id v5 = v3;
      }
    }
    else
    {
LABEL_7:
      int v3 = 0;
    }
  }
  return v3;
}

- (void)updateWithEnvironment:(id)a3
{
  BOOL v4 = +[SearchUICommandHandler hasValidHandlerForRowModel:self environment:a3];
  [(SearchUIRowModel *)self setHasValidCommandHandler:v4];
}

- (NSArray)punchouts
{
  return self->_punchouts;
}

- (Class)cellViewClass
{
  return self->_cellViewClass;
}

- (Class)collectionViewCellClass
{
  return self->_collectionViewCellClass;
}

- (BOOL)isTappable
{
  return self->_isTappable;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (BOOL)isDraggable
{
  return self->_isDraggable;
}

- (NSString)dragTitle
{
  return self->_dragTitle;
}

- (NSString)dragSubtitle
{
  return self->_dragSubtitle;
}

- (NSString)dragText
{
  return self->_dragText;
}

- (NSURL)dragURL
{
  return self->_dragURL;
}

- (NSString)dragAppBundleID
{
  return self->_dragAppBundleID;
}

- (BOOL)supportsCustomUserReportRequestAfforance
{
  return self->_supportsCustomUserReportRequestAfforance;
}

- (BOOL)hasLeadingImage
{
  return self->_hasLeadingImage;
}

- (BOOL)prefersNoSeparatorAbove
{
  return self->_prefersNoSeparatorAbove;
}

- (NSString)previewItemTitle
{
  return self->_previewItemTitle;
}

- (void)setPreviewItemTitle:(id)a3
{
}

- (NSUserActivity)launchActivity
{
  return self->_launchActivity;
}

- (void)setLaunchActivity:(id)a3
{
}

- (NSString)launchActivityAppBundleId
{
  return self->_launchActivityAppBundleId;
}

- (void)setLaunchActivityAppBundleId:(id)a3
{
}

- (SFImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (void)setCornerMask:(unint64_t)a3
{
  self->_cornerMask = a3;
}

- (void)setHasCustomCornerRounding:(BOOL)a3
{
  self->_hasCustomCornerRounding = a3;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)hasValidCommandHandler
{
  return self->_hasValidCommandHandler;
}

- (void)setHasValidCommandHandler:(BOOL)a3
{
  self->_hasValidCommandHandler = a3;
}

- (void)setContextualAction:(id)a3
{
}

- (BOOL)contextualActionLoaded
{
  return self->_contextualActionLoaded;
}

- (void)setContextualActionLoaded:(BOOL)a3
{
  self->_contextualActionLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_launchActivityAppBundleId, 0);
  objc_storeStrong((id *)&self->_launchActivity, 0);
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_dragAppBundleID, 0);
  objc_storeStrong((id *)&self->_dragURL, 0);
  objc_storeStrong((id *)&self->_dragText, 0);
  objc_storeStrong((id *)&self->_dragSubtitle, 0);
  objc_storeStrong((id *)&self->_dragTitle, 0);
  objc_storeStrong((id *)&self->_nextCard, 0);
  objc_storeStrong((id *)&self->_collectionViewCellClass, 0);
  objc_storeStrong((id *)&self->_cellViewClass, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_punchouts, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_identifyingResult, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end