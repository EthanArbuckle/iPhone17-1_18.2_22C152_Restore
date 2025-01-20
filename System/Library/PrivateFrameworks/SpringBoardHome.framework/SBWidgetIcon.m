@interface SBWidgetIcon
+ (BOOL)hasIconImage;
- (BOOL)_hasDataSourceThatIgnoresAllOtherDataSources;
- (BOOL)allowsExternalSuggestions;
- (BOOL)allowsSuggestions;
- (BOOL)canBeAddedToMultiItemDrag;
- (BOOL)canBeReceivedByIcon;
- (BOOL)canGenerateIconsInBackground;
- (BOOL)canReceiveGrabbedIcon;
- (BOOL)isWidgetIcon;
- (BOOL)isWidgetStackIcon;
- (BOOL)matchesWidgetIcon:(id)a3;
- (BOOL)supportsConfiguration;
- (NSArray)widgets;
- (SBHWidget)activeWidget;
- (SBHWidget)firstSuggestedWidget;
- (SBLeafIconDataSource)firstSuggestedIconDataSource;
- (SBLeafIconDataSource)lastUserSelectedDataSource;
- (SBWidgetIcon)initWithCHSWidgetDescriptor:(id)a3;
- (SBWidgetIcon)initWithCHSWidgetDescriptor:(id)a3 inDomain:(id)a4;
- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3;
- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 inDomain:(id)a4;
- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 suggestionSource:(int64_t)a4;
- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 suggestionSource:(int64_t)a4 inDomain:(id)a5;
- (SBWidgetIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4;
- (SBWidgetIcon)initWithWidget:(id)a3;
- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4;
- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 widgetContainerBundleIdentifiers:(id)a5;
- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 widgetContainerBundleIdentifiers:(id)a5 suggestionSource:(int64_t)a6;
- (SBWidgetIcon)initWithWidgets:(id)a3;
- (id)_fallbackBestDataSource;
- (id)copyWithSuggestionSource:(int64_t)a3;
- (id)copyWithUniqueLeafIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)firstWidgetPassingTest:(id)a3;
- (id)supportedGridSizeClasses;
- (unint64_t)iconDataSourcesExcludingSuggestionsCount;
- (unint64_t)stackChangeReason;
- (void)_setPropertiesFromIcon:(id)a3;
- (void)addDataSourcesFromWidgetIcons:(id)a3;
- (void)addFirstSuggestedWidget;
- (void)didAddIconDataSource:(id)a3;
- (void)didRemoveIconDataSource:(id)a3;
- (void)didReplaceIconDataSource:(id)a3 withIconDataSource:(id)a4;
- (void)removeFirstSuggestedIconDataSource;
- (void)setAllowsExternalSuggestions:(BOOL)a3;
- (void)setAllowsSuggestions:(BOOL)a3;
- (void)setLastUserSelectedDataSource:(id)a3;
- (void)setStackChangeReason:(unint64_t)a3;
@end

@implementation SBWidgetIcon

- (SBWidgetIcon)initWithCHSWidgetDescriptor:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[SBWidgetIcon initWithCHSWidgetDescriptors:](self, "initWithCHSWidgetDescriptors:", v6, v9, v10);
  return v7;
}

- (SBWidgetIcon)initWithCHSWidgetDescriptor:(id)a3 inDomain:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  uint64_t v10 = -[SBWidgetIcon initWithCHSWidgetDescriptors:inDomain:](self, "initWithCHSWidgetDescriptors:inDomain:", v9, v7, v12, v13);
  return v10;
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3
{
  return [(SBWidgetIcon *)self initWithCHSWidgetDescriptors:a3 suggestionSource:0];
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 inDomain:(id)a4
{
  return [(SBWidgetIcon *)self initWithCHSWidgetDescriptors:a3 suggestionSource:0 inDomain:a4];
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 suggestionSource:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[SBHIconGridSizeClassDomain globalDomain];
  id v8 = [(SBWidgetIcon *)self initWithCHSWidgetDescriptors:v6 suggestionSource:a4 inDomain:v7];

  return v8;
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 suggestionSource:(int64_t)a4 inDomain:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(SBLeafIcon *)self initWithUniqueLeafIdentifier];
  if (v10)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v15), "sbh_iconDataSourceInDomain:", v9);
          if (v16)
          {
            v17 = (void *)v16;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            if (a4 && (isKindOfClass & 1) != 0)
            {
              uint64_t v19 = [v17 copyWithSuggestionSource:a4];

              v17 = (void *)v19;
            }
            [(SBLeafIcon *)v10 addIconDataSource:v17];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v8 = v21;
  }

  return v10;
}

- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4
{
  return [(SBWidgetIcon *)self initWithWidgetExtensionIdentifiers:a3 widgetKinds:a4 widgetContainerBundleIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 widgetContainerBundleIdentifiers:(id)a5
{
  return [(SBWidgetIcon *)self initWithWidgetExtensionIdentifiers:a3 widgetKinds:a4 widgetContainerBundleIdentifiers:a5 suggestionSource:0];
}

- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 widgetContainerBundleIdentifiers:(id)a5 suggestionSource:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(SBLeafIcon *)self initWithUniqueLeafIdentifier];
  if (v13)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __137__SBWidgetIcon_SBHCHSWidgetDescriptor__initWithWidgetExtensionIdentifiers_widgetKinds_widgetContainerBundleIdentifiers_suggestionSource___block_invoke;
    v15[3] = &unk_1E6AAE530;
    id v16 = v11;
    id v17 = v12;
    int64_t v19 = a6;
    v18 = v13;
    [v10 enumerateObjectsUsingBlock:v15];
  }
  return v13;
}

void __137__SBWidgetIcon_SBHCHSWidgetDescriptor__initWithWidgetExtensionIdentifiers_widgetKinds_widgetContainerBundleIdentifiers_suggestionSource___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  id v7 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v8 = SBHSpecialWidgetDescriptorTypeForKind(v6);
    if (v8)
    {
      id v9 = [[SBHSpecialWidgetDescriptor alloc] initWithType:v8];
      id v10 = [(CHSWidgetDescriptor *)v9 sbh_iconDataSource];
    }
    else
    {
      id v11 = *(void **)(a1 + 40);
      if (v11 && [v11 count])
      {
        id v12 = [*(id *)(a1 + 40) objectAtIndex:a3];
        uint64_t v13 = [[SBHWidget alloc] initWithKind:v6 extensionBundleIdentifier:v5 containerBundleIdentifier:v12];
        id v10 = [(SBHWidget *)v13 copyWithSuggestionSource:*(void *)(a1 + 56)];
      }
      else
      {
        id v12 = [[SBHWidget alloc] initWithKind:v6 extensionBundleIdentifier:v5];
        id v10 = [(SBHWidget *)v12 copyWithSuggestionSource:*(void *)(a1 + 56)];
      }

      SBLogWidgets();
      id v9 = (SBHSpecialWidgetDescriptor *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v10 uniqueIdentifier];
        int v15 = 138543618;
        id v16 = v5;
        __int16 v17 = 2114;
        v18 = v14;
        _os_log_impl(&dword_1D7F0A000, &v9->super.super.super, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created for icon through extension identifiers.", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  [*(id *)(a1 + 48) addIconDataSource:v10];
}

- (SBWidgetIcon)initWithWidget:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLeafIcon *)self initWithUniqueLeafIdentifier];
  id v6 = v5;
  if (v5) {
    [(SBLeafIcon *)v5 addIconDataSource:v4];
  }

  return v6;
}

- (SBWidgetIcon)initWithWidgets:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLeafIcon *)self initWithUniqueLeafIdentifier];
  id v6 = v5;
  if (v5) {
    [(SBLeafIcon *)v5 addIconDataSources:v4];
  }

  return v6;
}

- (SBWidgetIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBWidgetIcon;
  id v4 = [(SBLeafIcon *)&v7 initWithLeafIdentifier:a3 applicationBundleID:a4];
  id v5 = v4;
  if (v4)
  {
    [(SBIcon *)v4 setGridSizeClass:@"SBHIconGridSizeClassSmall"];
    v5->_allowsSuggestions = 1;
    v5->_allowsExternalSuggestions = 1;
  }
  return v5;
}

- (id)firstWidgetPassingTest:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SBWidgetIcon_firstWidgetPassingTest___block_invoke;
  v8[3] = &unk_1E6AB4ED0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(SBLeafIcon *)self firstIconDataSourcePassingTest:v8];

  return v6;
}

uint64_t __39__SBWidgetIcon_firstWidgetPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = self;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (SBHWidget)activeWidget
{
  v2 = [(SBLeafIcon *)self activeDataSource];
  id v3 = self;
  if (objc_opt_isKindOfClass()) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSArray)widgets
{
  id v3 = self;
  id v4 = [(SBLeafIcon *)self iconDataSourcesOfClass:v3];

  return (NSArray *)v4;
}

- (id)_fallbackBestDataSource
{
  id v3 = [(SBWidgetIcon *)self lastUserSelectedDataSource];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBWidgetIcon;
    id v5 = [(SBLeafIcon *)&v8 _fallbackBestDataSource];
  }
  id v6 = v5;

  return v6;
}

- (void)didAddIconDataSource:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBWidgetIcon;
  [(SBLeafIcon *)&v4 didAddIconDataSource:a3];
  [(SBIcon *)self archivableStateDidChange];
  [(SBWidgetIcon *)self setStackChangeReason:4];
}

- (void)didRemoveIconDataSource:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBWidgetIcon;
  objc_super v4 = (SBLeafIconDataSource *)a3;
  [(SBLeafIcon *)&v9 didRemoveIconDataSource:v4];
  lastUserSelectedDataSource = self->_lastUserSelectedDataSource;

  if (lastUserSelectedDataSource == v4)
  {
    id v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v7 = [(SBIcon *)self uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Clearing out last user selected data source for: %@", buf, 0xCu);
    }
    objc_super v8 = self->_lastUserSelectedDataSource;
    self->_lastUserSelectedDataSource = 0;
  }
  [(SBIcon *)self archivableStateDidChange];
  [(SBWidgetIcon *)self setStackChangeReason:6];
}

- (void)didReplaceIconDataSource:(id)a3 withIconDataSource:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBWidgetIcon;
  objc_super v8 = (SBLeafIconDataSource *)a3;
  [(SBLeafIcon *)&v12 didReplaceIconDataSource:v8 withIconDataSource:v7];
  lastUserSelectedDataSource = self->_lastUserSelectedDataSource;

  if (lastUserSelectedDataSource == v8)
  {
    id v10 = SBLogIcon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(SBIcon *)self uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Replacing last user selected data source for: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_lastUserSelectedDataSource, a4);
  }
  [(SBIcon *)self archivableStateDidChange];
  [(SBWidgetIcon *)self setStackChangeReason:6];
}

- (void)setLastUserSelectedDataSource:(id)a3
{
  id v5 = (SBLeafIconDataSource *)a3;
  if (self->_lastUserSelectedDataSource != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_lastUserSelectedDataSource, a3);
    [(SBIcon *)self archivableStateDidChange];
    id v5 = v6;
  }
}

- (unint64_t)iconDataSourcesExcludingSuggestionsCount
{
  v2 = [(SBLeafIcon *)self iconDataSources];
  id v3 = objc_msgSend(v2, "bs_filter:", &__block_literal_global_69);

  unint64_t v4 = [v3 count];
  return v4;
}

BOOL __56__SBWidgetIcon_iconDataSourcesExcludingSuggestionsCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) == 0 || [v2 suggestionSource] != 1;

  return v3;
}

- (BOOL)isWidgetIcon
{
  return 1;
}

- (BOOL)canReceiveGrabbedIcon
{
  return ![(SBWidgetIcon *)self _hasDataSourceThatIgnoresAllOtherDataSources];
}

- (BOOL)canBeReceivedByIcon
{
  return ![(SBWidgetIcon *)self _hasDataSourceThatIgnoresAllOtherDataSources];
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 0;
}

- (id)supportedGridSizeClasses
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(SBLeafIcon *)self iconDataSources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v4)
  {

LABEL_17:
    id v6 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses];
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v3);
      }
      objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if (objc_opt_respondsToSelector()) {
        [v9 supportedGridSizeClassesForIcon:self];
      }
      else {
      id v10 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses];
      }
      id v11 = v10;
      if (v6) {
        [v6 intersectGridSizeClassSet:v10];
      }
      else {
        id v6 = (void *)[v10 mutableCopy];
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_17;
  }
LABEL_18:
  return v6;
}

- (BOOL)isWidgetStackIcon
{
  return [(SBLeafIcon *)self iconDataSourceCount] > 1;
}

- (BOOL)supportsConfiguration
{
  BOOL v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 iconSupportsConfiguration:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (SBHWidget)firstSuggestedWidget
{
  return (SBHWidget *)[(SBWidgetIcon *)self firstWidgetPassingTest:&__block_literal_global_16_1];
}

BOOL __36__SBWidgetIcon_firstSuggestedWidget__block_invoke(uint64_t a1, void *a2)
{
  return [a2 suggestionSource] == 1;
}

- (SBLeafIconDataSource)firstSuggestedIconDataSource
{
  return (SBLeafIconDataSource *)[(SBLeafIcon *)self firstIconDataSourcePassingTest:&__block_literal_global_18_0];
}

BOOL __44__SBWidgetIcon_firstSuggestedIconDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && [v2 suggestionSource] == 1;

  return v3;
}

- (void)removeFirstSuggestedIconDataSource
{
  BOOL v3 = [(SBWidgetIcon *)self firstSuggestedIconDataSource];
  if (v3)
  {
    char v4 = v3;
    [(SBLeafIcon *)self removeIconDataSource:v3];
    BOOL v3 = v4;
  }
}

- (void)addFirstSuggestedWidget
{
  id v4 = [(SBWidgetIcon *)self firstSuggestedWidget];
  BOOL v3 = (void *)[v4 copyWithSuggestionSource:0];
  [(SBLeafIcon *)self replaceIconDataSource:v4 withIconDataSource:v3];
}

- (void)addDataSourcesFromWidgetIcons:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBLeafIcon *)self activeDataSource];
  if (v5)
  {
    id v6 = [(SBLeafIcon *)self iconDataSources];
    uint64_t v7 = [v6 indexOfObject:v5];
  }
  else
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_super v8 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) iconDataSources];
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = [(SBLeafIcon *)self iconDataSourceCount];
  }
  else {
    unint64_t v15 = v7 + 1;
  }
  long long v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v15, objc_msgSend(v8, "count"));
  [(SBLeafIcon *)self insertIconDataSources:v8 atIndexes:v16];

  __int16 v17 = SBLogIcon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Activating data source due to icon insertion", v20, 2u);
  }

  uint64_t v18 = [v9 firstObject];
  uint64_t v19 = [v18 activeDataSource];

  [(SBWidgetIcon *)self setStackChangeReason:4];
  [(SBLeafIcon *)self setActiveDataSource:v19];
}

- (void)setAllowsSuggestions:(BOOL)a3
{
  if (self->_allowsSuggestions != a3)
  {
    self->_allowsSuggestions = a3;
    [(SBIcon *)self archivableStateDidChange];
  }
}

- (void)setAllowsExternalSuggestions:(BOOL)a3
{
  if (self->_allowsExternalSuggestions != a3)
  {
    self->_allowsExternalSuggestions = a3;
    [(SBIcon *)self archivableStateDidChange];
  }
}

- (void)_setPropertiesFromIcon:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWidgetIcon;
  [(SBLeafIcon *)&v9 _setPropertiesFromIcon:v4];
  uint64_t v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = v4;
    -[SBWidgetIcon setAllowsSuggestions:](self, "setAllowsSuggestions:", [v7 allowsSuggestions]);
    uint64_t v8 = [v7 allowsExternalSuggestions];

    [(SBWidgetIcon *)self setAllowsExternalSuggestions:v8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBWidgetIcon;
  id result = [(SBLeafIcon *)&v5 copyWithZone:a3];
  if (result)
  {
    *((unsigned char *)result + 120) = self->_allowsSuggestions;
    *((unsigned char *)result + 121) = self->_allowsExternalSuggestions;
  }
  return result;
}

- (id)copyWithUniqueLeafIdentifier
{
  BOOL v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  v7.receiver = self;
  v7.super_class = (Class)SBWidgetIcon;
  objc_super v5 = [(SBLeafIcon *)&v7 copyWithLeafIdentifier:v4];

  if (v5)
  {
    objc_storeStrong(v5 + 16, self->_lastUserSelectedDataSource);
    [v5 _updateActiveDataSource];
  }
  return v5;
}

- (id)copyWithSuggestionSource:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(SBLeafIcon *)self iconDataSources];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    objc_super v7 = (void *)[(SBWidgetIcon *)self copy];
    uint64_t v8 = [(SBIcon *)self gridSizeClass];
    [v7 setGridSizeClass:v8];

    if (v7)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      objc_super v9 = [(SBWidgetIcon *)self widgets];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            unint64_t v15 = (void *)[v14 copyWithSuggestionSource:a3];
            [v7 replaceIconDataSource:v14 withIconDataSource:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v11);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v16 = self;
      __int16 v17 = -[SBLeafIcon iconDataSourcesOfClass:](self, "iconDataSourcesOfClass:", v16, 0);

      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            long long v23 = (void *)[v22 copyWithSuggestionSource:a3];
            [v7 replaceIconDataSource:v22 withIconDataSource:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v19);
      }
    }
    return v7;
  }
  else
  {
    return [(SBWidgetIcon *)self copyWithUniqueLeafIdentifier];
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBWidgetIcon;
  id v4 = [(SBIcon *)&v11 descriptionBuilderWithMultilinePrefix:a3];
  objc_super v5 = [(SBLeafIcon *)self activeDataSource];
  uint64_t v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v5 extensionBundleIdentifier];
    objc_super v9 = @"widget";
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v8 = [v5 icon:self displayNameForLocation:@"SBIconLocationNone"];
    objc_super v9 = @"fakeWidget";
  }
  [v4 appendString:v8 withName:v9];

LABEL_6:
  return v4;
}

- (BOOL)matchesWidgetIcon:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBLeafIcon *)self leafIdentifier];
  uint64_t v6 = [v4 leafIdentifier];
  int v7 = BSEqualObjects();

  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [(SBLeafIcon *)self iconDataSources];
  objc_super v9 = [v4 iconDataSources];
  int v10 = BSEqualArrays();

  if (!v10) {
    goto LABEL_6;
  }
  objc_super v11 = [(SBLeafIcon *)self activeDataSource];
  uint64_t v12 = [v4 activeDataSource];
  int v13 = BSEqualObjects();

  if (!v13) {
    goto LABEL_6;
  }
  int v14 = [(SBWidgetIcon *)self allowsSuggestions];
  if (v14 == [v4 allowsSuggestions]
    && (int v15 = [(SBWidgetIcon *)self allowsExternalSuggestions],
        v15 == [v4 allowsExternalSuggestions]))
  {
    uint64_t v18 = [(SBIcon *)self gridSizeClass];
    uint64_t v19 = [v4 gridSizeClass];
    if (v18 == (void *)v19)
    {
      char v16 = 1;
      uint64_t v20 = v18;
    }
    else
    {
      uint64_t v20 = (void *)v19;
      long long v21 = [(SBIcon *)self gridSizeClass];
      long long v22 = [v4 gridSizeClass];
      char v16 = [v21 isEqualToString:v22];
    }
  }
  else
  {
LABEL_6:
    char v16 = 0;
  }

  return v16;
}

- (BOOL)canGenerateIconsInBackground
{
  return 1;
}

+ (BOOL)hasIconImage
{
  return 0;
}

- (BOOL)_hasDataSourceThatIgnoresAllOtherDataSources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(SBLeafIcon *)self iconDataSources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v8 iconShouldIgnoreOtherDataSources:self] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (SBLeafIconDataSource)lastUserSelectedDataSource
{
  return self->_lastUserSelectedDataSource;
}

- (unint64_t)stackChangeReason
{
  return self->_stackChangeReason;
}

- (void)setStackChangeReason:(unint64_t)a3
{
  self->_stackChangeReason = a3;
}

- (BOOL)allowsSuggestions
{
  return self->_allowsSuggestions;
}

- (BOOL)allowsExternalSuggestions
{
  return self->_allowsExternalSuggestions;
}

- (void).cxx_destruct
{
}

@end