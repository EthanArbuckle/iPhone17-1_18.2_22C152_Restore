@interface SSSectionBuilderHandler
+ (BOOL)isZKWAutoShortcutBundle:(id)a3;
+ (BOOL)isZKWRecentBundle:(id)a3;
+ (Class)sectionBuilderClassForSection:(id)a3 withQueryContext:(id)a4;
+ (id)buildSectionsWithSections:(id)a3 queryContext:(id)a4 searchInAppInfo:(id)a5 renderState:(unint64_t)a6;
+ (id)findDistinctPathIdentifiersForSections:(id)a3;
+ (id)makeClearProactiveCategoryButtonItemWithCategory:(int)a3 shouldClearWholeSection:(BOOL)a4 result:(id)a5;
+ (void)injectRecentsOptionsIntoResult:(id)a3;
- (NSArray)searchInAppInfo;
- (NSArray)sections;
- (NSSet)bundleIdentifiersForHiddenSections;
- (SPSearchContactEntity)contactEntity;
- (SPSearchEntity)searchEntity;
- (SPSearchQueryContext)queryContext;
- (id)buildSections;
- (unint64_t)renderState;
- (void)insertDummySectionsIntoSections:(id)a3;
- (void)setBundleIdentifiersForHiddenSections:(id)a3;
- (void)setContactEntity:(id)a3;
- (void)setQueryContext:(id)a3;
- (void)setRenderState:(unint64_t)a3;
- (void)setSearchEntity:(id)a3;
- (void)setSearchInAppInfo:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation SSSectionBuilderHandler

+ (id)buildSectionsWithSections:(id)a3 queryContext:(id)a4 searchInAppInfo:(id)a5 renderState:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_opt_new();
  [v12 setSections:v11];

  [v12 setQueryContext:v10];
  [v12 setSearchInAppInfo:v9];

  [v12 setRenderState:a6];
  v13 = [v12 buildSections];

  return v13;
}

+ (Class)sectionBuilderClassForSection:(id)a3 withQueryContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (sectionBuilderClassForSection_withQueryContext__onceToken != -1) {
    dispatch_once(&sectionBuilderClassForSection_withQueryContext__onceToken, &__block_literal_global_6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)sectionBuilderClassForSection_withQueryContext__supportedClasses;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      if (objc_msgSend(v12, "supportsSection:", v5, (void)v16)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    if (v12) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  v13 = objc_msgSend(v6, "searchEntities", (void)v16);
  [v13 count];
  v12 = objc_opt_class();

LABEL_14:
  v14 = v12;

  return v14;
}

void __74__SSSectionBuilderHandler_sectionBuilderClassForSection_withQueryContext___block_invoke()
{
  v2[15] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:15];
  v1 = (void *)sectionBuilderClassForSection_withQueryContext__supportedClasses;
  sectionBuilderClassForSection_withQueryContext__supportedClasses = v0;
}

+ (BOOL)isZKWRecentBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.spotlight.dec.zkw.recents"];
}

+ (BOOL)isZKWAutoShortcutBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut"];
}

+ (id)makeClearProactiveCategoryButtonItemWithCategory:(int)a3 shouldClearWholeSection:(BOOL)a4 result:(id)a5
{
  if (a3 == 1)
  {
    BOOL v5 = a4;
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CLEAR" value:&stru_1F1824018 table:@"SpotlightServices"];

    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"CLEAR_ALL_RECENTS" value:&stru_1F1824018 table:@"SpotlightServices"];

    if (v5) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v7;
    }
    id v11 = v10;
    if (v5)
    {
      v12 = objc_opt_new();
      [v12 setSymbolName:@"xmark"];
      [v12 setIsTemplate:1];
    }
    else
    {
      v12 = 0;
    }
    v14 = objc_opt_new();
    [v14 setCategory:1];
    [v14 setShouldClearWholeSection:v5];
    v13 = objc_opt_new();
    [v13 setTitle:v11];
    [v13 setImage:v12];
    [v13 setCommand:v14];
    [v13 setIsDestructive:1];
  }
  else
  {
    id v7 = 0;
    uint64_t v9 = 0;
    v13 = 0;
  }

  return v13;
}

+ (void)injectRecentsOptionsIntoResult:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 shouldUseCompactDisplay]
    && ([v4 compactCard], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    id v7 = [v4 compactCard];
  }
  else
  {
    id v7 = [v4 inlineCard];
  }
  uint64_t v8 = [v7 cardSections];
  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = [v4 sectionBundleIdentifier];
  if ([a1 isZKWRecentBundle:v10])
  {
    id v11 = [a1 makeClearProactiveCategoryButtonItemWithCategory:1 shouldClearWholeSection:1 result:v4];
    v12 = [a1 makeClearProactiveCategoryButtonItemWithCategory:1 shouldClearWholeSection:0 result:v4];
    v13 = [v9 previewButtonItems];
    if (v13)
    {
      v14 = [v9 previewButtonItems];
      v15 = [v14 arrayByAddingObject:v11];
      [v9 setPreviewButtonItems:v15];
    }
    else
    {
      v20[0] = v11;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v9 setPreviewButtonItems:v14];
    }

    long long v16 = [v9 trailingSwipeButtonItems];
    if (v16)
    {
      long long v17 = [v9 trailingSwipeButtonItems];
      long long v18 = [v17 arrayByAddingObject:v12];
      [v9 setTrailingSwipeButtonItems:v18];
    }
    else
    {
      long long v19 = v12;
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      [v9 setTrailingSwipeButtonItems:v17];
    }
  }
}

+ (id)findDistinctPathIdentifiersForSections:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return v3;
}

- (void)insertDummySectionsIntoSections:(id)a3
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SFMutableResultSection mutableSectionWithBundleId:@"com.apple.spotlight.contactHeader"];
  [v4 insertObject:v5 atIndex:0];

  uint64_t v6 = [(SSSectionBuilderHandler *)self searchEntity];
  id v7 = [v4 lastObject];
  uint64_t v8 = [v7 bundleIdentifier];
  if (objc_msgSend(v8, "isEqualToString:")) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if ((isMacOS() & 1) == 0 && !v6)
  {
    id v11 = [(SSSectionBuilderHandler *)self bundleIdentifiersForHiddenSections];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = [v4 count] - (v10 != 0);
      v14 = +[SFMutableResultSection mutableSectionWithBundleId:@"com.apple.other:show_more"];
      [v4 insertObject:v14 atIndex:v13];
    }
  }
  v30 = self;
  v31 = v10;
  v15 = (void *)v6;
  long long v16 = [v7 bundleIdentifier];
  unsigned int v17 = [v16 isEqualToString:@"com.apple.spotlight.related_search"];

  if (v7) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [v4 count];
  v32[0] = @"com.apple.MobileAddressBook.SocialMedia";
  v32[1] = @"com.apple.spotlight.contactInfo";
  v32[2] = @"com.apple.searchd.searchThroughSuggestions";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  int v21 = [v20 count];
  uint64_t v22 = (v21 - 1);
  if (v21 - 1 >= 0)
  {
    uint64_t v23 = v19 - v18;
    do
    {
      v24 = [v20 objectAtIndexedSubscript:v22];
      v25 = +[SFMutableResultSection mutableSectionWithBundleId:v24];
      [v4 insertObject:v25 atIndex:v23];

      --v22;
      --v21;
    }
    while (v21);
  }
  v26 = v15;
  if ((isMacOS() & 1) == 0)
  {
    v27 = [(SSSectionBuilderHandler *)v30 queryContext];
    if ((unint64_t)([v27 queryKind] - 5) >= 4) {
      char v28 = [v26 isContactEntitySearch] ^ 1;
    }
    else {
      char v28 = 0;
    }

    if ((v28 & 1) == 0 && !v31)
    {
      v29 = +[SFMutableResultSection mutableSectionWithBundleId:@"com.apple.parsec.related_search"];
      [v4 addObject:v29];
    }
  }
}

- (id)buildSections
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = SSGeneralLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  uint64_t v6 = v5;
  unint64_t v46 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "buildSections", (const char *)&unk_1BDC948EA, buf, 2u);
  }
  os_signpost_id_t spid = v4;
  log = v6;

  id v7 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v8 = [(SSSectionBuilderHandler *)self sections];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v14 = [v13 results];
        uint64_t v15 = [v14 count];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v10);
  }

  if ([(SSSectionBuilderHandler *)self renderState] != 1) {
    [(SSSectionBuilderHandler *)self insertDummySectionsIntoSections:v7];
  }
  long long v16 = [(SSSectionBuilderHandler *)self queryContext];
  uint64_t v17 = [(SSSectionBuilderHandler *)self contactEntity];
  v45 = (void *)v17;
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [SSContactResultBuilder alloc];
    v20 = [v18 contact];
    uint64_t v21 = [v20 mutableCopy];
    uint64_t v22 = v18;
    uint64_t v23 = (void *)v21;
    v24 = [(SSContactResultBuilder *)v19 initWithResult:0 contactEntity:v22 contact:v21];

    v47 = v24;
    [(SSResultBuilder *)v24 setQueryContext:v16];
  }
  else
  {
    v47 = 0;
  }
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v25 = v7;
  uint64_t v52 = [v25 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v54;
    obuint64_t j = v25;
    do
    {
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v54 != v50) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(id *)(*((void *)&v53 + 1) + 8 * j);
        uint64_t v28 = [(id)objc_opt_class() sectionBuilderClassForSection:v27 withQueryContext:v16];
        v29 = objc_opt_new();
        [v29 setQueryContext:v16];
        [v29 setSection:v27];
        objc_msgSend(v29, "setRenderState:", -[SSSectionBuilderHandler renderState](self, "renderState"));
        v30 = [v27 bundleIdentifier];
        objc_msgSend(v29, "setIsTopHitSection:", objc_msgSend(v30, "isEqualToString:", @"com.apple.spotlight.tophits"));

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v29 setContactResultBuilder:v47];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v31 = [(SSSectionBuilderHandler *)self bundleIdentifiersForHiddenSections];
            [v29 setBundleIdentifiersForHiddenSections:v31];

            v32 = [(SSSectionBuilderHandler *)self searchInAppInfo];
            [v29 setSearchInAppInfo:v32];
          }
        }
        os_signpost_id_t v33 = os_signpost_id_generate(log);
        v34 = log;
        v35 = v34;
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v62 = v28;
          _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "SSSectionBuilder: buildSection", "%@", buf, 0xCu);
        }

        v36 = [v29 buildSection];
        v37 = v35;
        v38 = v37;
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v62 = v28;
          _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v38, OS_SIGNPOST_INTERVAL_END, v33, "SSSectionBuilder: buildSection", "%@", buf, 0xCu);
        }

        v39 = [v36 results];
        uint64_t v40 = [v39 count];

        if (v40) {
          [v49 addObject:v36];
        }
      }
      id v25 = obj;
      uint64_t v52 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v52);
  }

  v41 = log;
  v42 = v41;
  if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v62 = (uint64_t)v25;
    _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v42, OS_SIGNPOST_INTERVAL_END, spid, "SSSectionBuilder, buildSections", "%@", buf, 0xCu);
  }

  return v49;
}

- (NSSet)bundleIdentifiersForHiddenSections
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  bundleIdentifiersForHiddenSections = self->_bundleIdentifiersForHiddenSections;
  if (!bundleIdentifiersForHiddenSections)
  {
    os_signpost_id_t v4 = (NSSet *)objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [(SSSectionBuilderHandler *)self sections];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 isInitiallyHidden])
          {
            uint64_t v11 = [v10 bundleIdentifier];
            [(NSSet *)v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v12 = self->_bundleIdentifiersForHiddenSections;
    self->_bundleIdentifiersForHiddenSections = v4;

    bundleIdentifiersForHiddenSections = self->_bundleIdentifiersForHiddenSections;
  }
  return bundleIdentifiersForHiddenSections;
}

- (SPSearchEntity)searchEntity
{
  searchEntity = self->_searchEntity;
  if (!searchEntity)
  {
    os_signpost_id_t v4 = [(SSSectionBuilderHandler *)self queryContext];
    uint64_t v5 = [v4 searchEntities];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = self->_searchEntity;
    self->_searchEntity = v6;

    searchEntity = self->_searchEntity;
  }
  return searchEntity;
}

- (SPSearchContactEntity)contactEntity
{
  p_contactEntity = &self->_contactEntity;
  contactEntity = self->_contactEntity;
  if (!contactEntity)
  {
    uint64_t v5 = [(SSSectionBuilderHandler *)self searchEntity];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = [(SSSectionBuilderHandler *)self queryContext];
      uint64_t v9 = [v8 searchEntities];
      id v7 = [v9 firstObject];
    }
    if ([v7 isContactEntitySearch]) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 0;
    }
    objc_storeStrong((id *)p_contactEntity, v10);

    contactEntity = *p_contactEntity;
  }
  return contactEntity;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)searchInAppInfo
{
  return self->_searchInAppInfo;
}

- (void)setSearchInAppInfo:(id)a3
{
}

- (void)setBundleIdentifiersForHiddenSections:(id)a3
{
}

- (void)setContactEntity:(id)a3
{
}

- (void)setSearchEntity:(id)a3
{
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)setQueryContext:(id)a3
{
}

- (unint64_t)renderState
{
  return self->_renderState;
}

- (void)setRenderState:(unint64_t)a3
{
  self->_renderState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_storeStrong((id *)&self->_contactEntity, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersForHiddenSections, 0);
  objc_storeStrong((id *)&self->_searchInAppInfo, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end