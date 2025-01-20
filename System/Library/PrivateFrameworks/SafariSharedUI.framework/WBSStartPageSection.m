@interface WBSStartPageSection
+ (id)actionSectionWithIdentifier:(id)a3 actions:(id)a4;
+ (id)attributedRichLinkSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7;
+ (id)attributedRichLinkSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8;
+ (id)bannerSectionWithIdentifier:(id)a3 banner:(id)a4;
+ (id)bannerSectionWithIdentifier:(id)a3 title:(id)a4 banner:(id)a5;
+ (id)cardSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7;
+ (id)cardSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8;
+ (id)footerSectionWithIdentifier:(id)a3 action:(id)a4;
+ (id)headingSectionWithIdentifier:(id)a3 title:(id)a4;
+ (id)iconSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 supplementaryAction:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8;
+ (id)iconSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 supplementaryAction:(id)a7 identifiers:(id)a8 configurationProvider:(id)a9;
+ (id)listSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7;
+ (id)listSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8;
+ (id)separatorSectionWithIdentifier:(id)a3;
+ (id)squareRichLinkSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8;
- (BOOL)expandsModally;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsTopSeparator;
- (BOOL)usesLargeTitle;
- (NSArray)actions;
- (NSArray)itemIdentifiers;
- (NSString)title;
- (UIImage)icon;
- (UIMenu)titleMenu;
- (WBSAction)supplementaryAction;
- (WBSStartPageBanner)banner;
- (WBSStartPageBanner)contentBanner;
- (WBSStartPageSection)initWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 itemType:(int64_t)a7 itemIdentifiers:(id)a8 configurationProvider:(id)a9;
- (id)attributedRichLinkConfigurationProvider;
- (id)contextMenuCommitHandler;
- (id)contextMenuDismissHandler;
- (id)contextMenuProvider;
- (id)description;
- (id)dragItemProvider;
- (id)dropHandler;
- (id)dropOperationProvider;
- (id)effectiveItemIdentifiersWithMaximumCount:(unint64_t)a3;
- (id)identifier;
- (id)siteCardConfigurationProvider;
- (id)siteIconConfigurationProvider;
- (id)siteRowConfigurationProvider;
- (id)squareRichLinkConfigurationProvider;
- (int64_t)effectiveItemIdentifiersCount;
- (int64_t)itemType;
- (int64_t)maximumNumberOfPages;
- (int64_t)numberOfRowsVisibleWhenCollapsed;
- (int64_t)numberOfRowsVisibleWhenCollapsedInCompactWidth;
- (unint64_t)hash;
- (void)setContextMenuCommitHandler:(id)a3;
- (void)setContextMenuDismissHandler:(id)a3;
- (void)setContextMenuProvider:(id)a3;
- (void)setDragItemProvider:(id)a3;
- (void)setDropHandler:(id)a3;
- (void)setDropOperationProvider:(id)a3;
- (void)setExpandsModally:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setMaximumNumberOfPages:(int64_t)a3;
- (void)setNumberOfRowsVisibleWhenCollapsed:(int64_t)a3;
- (void)setNumberOfRowsVisibleWhenCollapsedInCompactWidth:(int64_t)a3;
- (void)setShowsTopSeparator:(BOOL)a3;
- (void)setTitleMenu:(id)a3;
- (void)setUsesLargeTitle:(BOOL)a3;
@end

@implementation WBSStartPageSection

- (int64_t)itemType
{
  return self->_itemType;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)maximumNumberOfPages
{
  return self->_maximumNumberOfPages;
}

- (BOOL)expandsModally
{
  return self->_expandsModally;
}

- (BOOL)usesLargeTitle
{
  return self->_usesLargeTitle;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (NSArray)actions
{
  return self->_actions;
}

- (WBSStartPageBanner)contentBanner
{
  return self->_contentBanner;
}

- (UIMenu)titleMenu
{
  return self->_titleMenu;
}

- (UIImage)icon
{
  return self->_icon;
}

- (WBSStartPageBanner)banner
{
  return self->_banner;
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (int64_t)numberOfRowsVisibleWhenCollapsedInCompactWidth
{
  int64_t result = self->_numberOfRowsVisibleWhenCollapsedInCompactWidth;
  if (!result) {
    return self->_numberOfRowsVisibleWhenCollapsed;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBanner, 0);
  objc_storeStrong(&self->_dropHandler, 0);
  objc_storeStrong(&self->_dropOperationProvider, 0);
  objc_storeStrong(&self->_dragItemProvider, 0);
  objc_storeStrong(&self->_contextMenuDismissHandler, 0);
  objc_storeStrong(&self->_contextMenuCommitHandler, 0);
  objc_storeStrong(&self->_contextMenuProvider, 0);
  objc_storeStrong((id *)&self->_titleMenu, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_supplementaryAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong(&self->_configurationProvider, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSStartPageSection *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (WBSIsEqual()) {
        char v6 = WBSIsEqual();
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_identifier hash];
  return [(NSString *)self->_title hash] ^ v3;
}

- (id)siteIconConfigurationProvider
{
  v2 = (void *)MEMORY[0x1AD115160](self->_configurationProvider, a2);
  return v2;
}

- (void)setIcon:(id)a3
{
}

- (id)effectiveItemIdentifiersWithMaximumCount:(unint64_t)a3
{
  v5 = -[NSArray safari_prefixWithMaxLength:](self->_itemIdentifiers, "safari_prefixWithMaxLength:");
  char v6 = v5;
  if (self->_supplementaryAction && [v5 count] < a3)
  {
    v7 = +[WBSStartPageSectionSupplementaryItemIdentifier identifierForAction:self->_supplementaryAction];
    uint64_t v8 = [v6 arrayByAddingObject:v7];

    char v6 = (void *)v8;
  }
  return v6;
}

- (void)setDropOperationProvider:(id)a3
{
}

- (void)setDropHandler:(id)a3
{
}

- (void)setDragItemProvider:(id)a3
{
}

- (void)setContextMenuProvider:(id)a3
{
}

- (void)setContextMenuDismissHandler:(id)a3
{
}

- (void)setContextMenuCommitHandler:(id)a3
{
}

- (int64_t)effectiveItemIdentifiersCount
{
  int64_t result = [(NSArray *)self->_itemIdentifiers count];
  if (self->_supplementaryAction) {
    ++result;
  }
  return result;
}

+ (id)iconSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 supplementaryAction:(id)a7 identifiers:(id)a8 configurationProvider:(id)a9
{
  id v15 = a7;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v21 title:v20 actions:v19 banner:v18 itemType:2 itemIdentifiers:v17 configurationProvider:v16];

  v23 = (void *)v22[7];
  v22[7] = v15;

  return v22;
}

+ (id)bannerSectionWithIdentifier:(id)a3 banner:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = WBSStartPageSectionIdentifierTitle(v7);
  v9 = [a1 bannerSectionWithIdentifier:v7 title:v8 banner:v6];

  return v9;
}

+ (id)bannerSectionWithIdentifier:(id)a3 title:(id)a4 banner:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v16[0] = v8;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v13 = (void *)[v11 initWithIdentifier:v10 title:v9 actions:MEMORY[0x1E4F1CBF0] banner:0 itemType:0 itemIdentifiers:v12 configurationProvider:0];

  v14 = (void *)v13[21];
  v13[21] = v8;

  return v13;
}

- (WBSStartPageSection)initWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 itemType:(int64_t)a7 itemIdentifiers:(id)a8 configurationProvider:(id)a9
{
  id v40 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  v41.receiver = self;
  v41.super_class = (Class)WBSStartPageSection;
  id v21 = [(WBSStartPageSection *)&v41 init];
  if (v21)
  {
    uint64_t v22 = [v17 copy];
    actions = v21->_actions;
    v21->_actions = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_banner, a6);
    uint64_t v24 = MEMORY[0x1AD115160](v20);
    id configurationProvider = v21->_configurationProvider;
    v21->_id configurationProvider = (id)v24;

    objc_storeStrong(&v21->_identifier, a3);
    v26 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v19];
    uint64_t v27 = [v26 count];
    if (v27 != [v19 count])
    {
      v28 = WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[WBSStartPageSection initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:]((uint64_t)v40, v28);
      }
    }
    uint64_t v29 = [v26 array];
    itemIdentifiers = v21->_itemIdentifiers;
    v21->_itemIdentifiers = (NSArray *)v29;

    v21->_itemType = a7;
    *(_OWORD *)&v21->_numberOfRowsVisibleWhenCollapsed = xmmword_1ABC5F8E0;
    uint64_t v31 = [v16 copy];
    title = v21->_title;
    v21->_title = (NSString *)v31;

    id contextMenuProvider = v21->_contextMenuProvider;
    v21->_id contextMenuProvider = &__block_literal_global_39;

    id contextMenuCommitHandler = v21->_contextMenuCommitHandler;
    v21->_id contextMenuCommitHandler = &__block_literal_global_5_0;

    id contextMenuDismissHandler = v21->_contextMenuDismissHandler;
    v21->_id contextMenuDismissHandler = &__block_literal_global_8_1;

    id dragItemProvider = v21->_dragItemProvider;
    v21->_id dragItemProvider = &__block_literal_global_11_0;

    id dropOperationProvider = v21->_dropOperationProvider;
    v21->_id dropOperationProvider = &__block_literal_global_14;

    v38 = v21;
  }

  return v21;
}

+ (id)footerSectionWithIdentifier:(id)a3 action:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v14[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v13 = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];

  id v11 = (void *)[v8 initWithIdentifier:v7 title:&stru_1F031A860 actions:v9 banner:0 itemType:1 itemIdentifiers:v10 configurationProvider:0];
  return v11;
}

+ (id)headingSectionWithIdentifier:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = (void *)[v8 initWithIdentifier:v7 title:v6 actions:MEMORY[0x1E4F1CBF0] banner:0 itemType:0 itemIdentifiers:0 configurationProvider:0];

  return v9;
}

+ (id)separatorSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = (unsigned char *)[v5 initWithIdentifier:v4 title:&stru_1F031A860 actions:MEMORY[0x1E4F1CBF0] banner:0 itemType:0 itemIdentifiers:0 configurationProvider:0];

  v6[17] = 1;
  return v6;
}

+ (id)actionSectionWithIdentifier:(id)a3 actions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 title:&stru_1F031A860 actions:v6 banner:0 itemType:0 itemIdentifiers:0 configurationProvider:0];

  return v8;
}

+ (id)iconSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 supplementaryAction:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = WBSStartPageSectionIdentifierTitle(v19);
  id v21 = [a1 iconSectionWithIdentifier:v19 title:v20 actions:v18 banner:v17 supplementaryAction:v16 identifiers:v15 configurationProvider:v14];

  return v21;
}

+ (id)cardSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v19 title:v18 actions:v17 banner:v16 itemType:3 itemIdentifiers:v15 configurationProvider:v14];

  [v20 setNumberOfRowsVisibleWhenCollapsed:3];
  return v20;
}

+ (id)cardSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = WBSStartPageSectionIdentifierTitle(v16);
  id v18 = [a1 cardSectionWithIdentifier:v16 title:v17 actions:v15 banner:v14 identifiers:v13 configurationProvider:v12];

  return v18;
}

+ (id)attributedRichLinkSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v19 title:v18 actions:v17 banner:v16 itemType:4 itemIdentifiers:v15 configurationProvider:v14];

  return v20;
}

+ (id)attributedRichLinkSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = WBSStartPageSectionIdentifierTitle(v16);
  id v18 = [a1 attributedRichLinkSectionWithIdentifier:v16 title:v17 actions:v15 banner:v14 identifiers:v13 configurationProvider:v12];

  return v18;
}

+ (id)squareRichLinkSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v19 title:v18 actions:v17 banner:v16 itemType:6 itemIdentifiers:v15 configurationProvider:v14];

  return v20;
}

+ (id)listSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v19 title:v18 actions:v17 banner:v16 itemType:5 itemIdentifiers:v15 configurationProvider:v14];

  return v20;
}

+ (id)listSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = WBSStartPageSectionIdentifierTitle(v16);
  id v18 = [a1 listSectionWithIdentifier:v16 title:v17 actions:v15 banner:v14 identifiers:v13 configurationProvider:v12];

  return v18;
}

uint64_t __110__WBSStartPageSection_initWithIdentifier_title_actions_banner_itemType_itemIdentifiers_configurationProvider___block_invoke()
{
  return 0;
}

uint64_t __110__WBSStartPageSection_initWithIdentifier_title_actions_banner_itemType_itemIdentifiers_configurationProvider___block_invoke_4()
{
  return 0;
}

uint64_t __110__WBSStartPageSection_initWithIdentifier_title_actions_banner_itemType_itemIdentifiers_configurationProvider___block_invoke_5()
{
  return 0;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; identifier = %@; title = %@",
    objc_opt_class(),
    self,
    self->_identifier,
  uint64_t v3 = self->_title);
  id v4 = v3;
  if (self->_actions) {
    [v3 appendFormat:@"; actions = %@", self->_actions];
  }
  if (self->_banner) {
    [v4 appendFormat:@"; banner = %@", self->_banner];
  }
  objc_msgSend(v4, "appendFormat:", @"; numberOfRowsVisibleWhenCollapsed = %zd",
    self->_numberOfRowsVisibleWhenCollapsed);
  objc_msgSend(v4, "appendFormat:", @"; numberOfRowsVisibleWhenCollapsedInCompactWidth = %zd",
    [(WBSStartPageSection *)self numberOfRowsVisibleWhenCollapsedInCompactWidth]);
  if (self->_titleMenu) {
    [v4 appendString:@"; has-title-menu"];
  }
  if (self->_contextMenuProvider)
  {
    [v4 appendString:@"; items-have-context-menu"];
    if (self->_contextMenuProvider) {
      [v4 appendString:@"; items-have-preview"];
    }
  }
  [v4 appendString:@">"];
  if (self->_contentBanner) {
    [v4 appendFormat:@"\n\t%@", self->_contentBanner];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_itemIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 appendFormat:@"\n\t%@", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)siteCardConfigurationProvider
{
  v2 = (void *)MEMORY[0x1AD115160](self->_configurationProvider, a2);
  return v2;
}

- (id)attributedRichLinkConfigurationProvider
{
  v2 = (void *)MEMORY[0x1AD115160](self->_configurationProvider, a2);
  return v2;
}

- (id)squareRichLinkConfigurationProvider
{
  v2 = (void *)MEMORY[0x1AD115160](self->_configurationProvider, a2);
  return v2;
}

- (id)siteRowConfigurationProvider
{
  v2 = (void *)MEMORY[0x1AD115160](self->_configurationProvider, a2);
  return v2;
}

- (WBSAction)supplementaryAction
{
  return self->_supplementaryAction;
}

- (int64_t)numberOfRowsVisibleWhenCollapsed
{
  return self->_numberOfRowsVisibleWhenCollapsed;
}

- (void)setNumberOfRowsVisibleWhenCollapsed:(int64_t)a3
{
  self->_numberOfRowsVisibleWhenCollapsed = a3;
}

- (void)setNumberOfRowsVisibleWhenCollapsedInCompactWidth:(int64_t)a3
{
  self->_numberOfRowsVisibleWhenCollapsedInCompactWidth = a3;
}

- (void)setUsesLargeTitle:(BOOL)a3
{
  self->_usesLargeTitle = a3;
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  self->_showsTopSeparator = a3;
}

- (void)setExpandsModally:(BOOL)a3
{
  self->_expandsModally = a3;
}

- (void)setMaximumNumberOfPages:(int64_t)a3
{
  self->_maximumNumberOfPages = a3;
}

- (void)setTitleMenu:(id)a3
{
}

- (id)contextMenuProvider
{
  return self->_contextMenuProvider;
}

- (id)contextMenuCommitHandler
{
  return self->_contextMenuCommitHandler;
}

- (id)contextMenuDismissHandler
{
  return self->_contextMenuDismissHandler;
}

- (id)dragItemProvider
{
  return self->_dragItemProvider;
}

- (id)dropOperationProvider
{
  return self->_dropOperationProvider;
}

- (id)dropHandler
{
  return self->_dropHandler;
}

- (void)initWithIdentifier:(uint64_t)a1 title:(NSObject *)a2 actions:banner:itemType:itemIdentifiers:configurationProvider:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "%@ section has duplicate item identifiers.", (uint8_t *)&v2, 0xCu);
}

@end