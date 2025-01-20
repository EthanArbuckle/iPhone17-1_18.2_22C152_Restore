@interface StartPageController
+ (void)initialize;
- (BOOL)_canShowPrivateRelaySection;
- (BOOL)_setFavoritesListToFolderWithServerID:(id)a3;
- (BOOL)_shouldShowConsentUI;
- (BOOL)isBackgroundImageEnabledForStartPageCustomizationViewController:(id)a3;
- (BOOL)isCloudSyncAvailableForStartPageCustomizationViewController:(id)a3;
- (BOOL)isCloudSyncEnabledForStartPageCustomizationViewController:(id)a3;
- (BOOL)isShowingAsPopover;
- (BOOL)isSuggestionsCustomizationAvailableForStartPageCustomizationViewController:(id)a3;
- (BOOL)isTabGroupFavoritesSectionEnabled;
- (BOOL)startPageViewController:(id)a3 isSectionExpanded:(id)a4;
- (BOOL)startPageViewControllerShouldShowSearchField:(id)a3;
- (FrequentlyVisitedSitesController)frequentlyVisitedSitesController;
- (NSArray)cloudTabsSections;
- (NSString)libraryType;
- (SFStartPageViewController)viewController;
- (StartPageController)init;
- (StartPageController)initWithVisualStyleProvider:(id)a3;
- (StartPageDataSource)dataSource;
- (id)_banActionForSiriSuggestion:(id)a3;
- (id)_bookmarkSectionForBookmark:(id)a3 orList:(id)a4 forFavoritesSection:(BOOL)a5 forScopedFavoritesSection:(BOOL)a6 sectionTitle:(id)a7;
- (id)_cloudTabDeviceForIdentifier:(id)a3;
- (id)_cloudTabDevices;
- (id)_cloudTabItemForIdentifier:(id)a3;
- (id)_cloudTabStore;
- (id)_cloudTabsConsentMessage;
- (id)_cloudTabsConsentSection;
- (id)_cloudTabsContextMenuCommitHandler;
- (id)_cloudTabsContextMenuDismissHandler;
- (id)_cloudTabsDragItemProvider;
- (id)_cloudTabsSectionWithDevice:(id)a3;
- (id)_contextMenuConfigurationForCloudTabWithSelectedDevice:(id)a3;
- (id)_contextMenuConfigurationForFrequentlyVisitedSite:(id)a3 previewProvider:(id)a4;
- (id)_contextMenuConfigurationForRecentCloudTab;
- (id)_downvoteActionForSiriSuggestion:(id)a3;
- (id)_effectiveProfile;
- (id)_effectiveProfileIdentifier;
- (id)_favoritesSection;
- (id)_favoritesSectionTitle;
- (id)_frequentlyVisitedSection;
- (id)_highlightsSection;
- (id)_lastCloudDeviceProfileKey;
- (id)_openMenuElementsForSiriSuggestion:(id)a3;
- (id)_privacyReportSection;
- (id)_privateBrowsingExplanationSection;
- (id)_privateBrowsingPersistentModuleSection;
- (id)_privateRelayPromptInPrivateBrowsingSection;
- (id)_readingListSection;
- (id)_recentCloudTabsSection;
- (id)_recentCloudTabsSectionWithDevice:(id)a3;
- (id)_recentItemsForDevice:(id)a3;
- (id)_recentlyClosedTabsForProfile:(id)a3;
- (id)_recentlyClosedTabsSection;
- (id)_selectedCloudTabsDevice;
- (id)_shareActionForHighlight:(id)a3;
- (id)_shareActionForSiriSuggestion:(id)a3;
- (id)_siriSuggestionsSection;
- (id)_tabGroupHeadingSection;
- (id)_tabGroupScopedFavoritesSection;
- (id)backgroundImageAssetControllerForCustomizationViewController:(id)a3;
- (id)backgroundImageForStartPageCustomizationViewController:(id)a3;
- (id)backgroundImageIdentifierForStartPageViewController:(id)a3;
- (id)profileProviderForCustomizationViewController:(id)a3;
- (id)sectionsForStartPageViewController:(id)a3;
- (id)startPageBackgroundImageIdentifier;
- (id)startPageCustomizationViewController:(id)a3 customizationItemsForCustomizationVariant:(int64_t)a4;
- (id)startPageViewController:(id)a3 detailSectionForItemIdentifier:(id)a4;
- (id)startPageViewController:(id)a3 detailSectionsForItemIdentifier:(id)a4;
- (int64_t)effectiveUpdatePolicy;
- (void)_appendSectionModelsForIdentifier:(id)a3 toArray:(id)a4;
- (void)_bookmarkFolderDidChange:(id)a3;
- (void)_bookmarksDidReload:(id)a3;
- (void)_cloudTabsConsentSelected;
- (void)_cloudTabsConsentStateDidChange:(id)a3;
- (void)_cloudTabsDidChange;
- (void)_cloudTabsDidChange:(id)a3;
- (void)_contentBlockerStatisticsStoreDidClose;
- (void)_contextMenuCommitHandlerForFrequentlyVisitedSite:(id)a3 animator:(id)a4 sectionIdentifier:(id)a5;
- (void)_copyBookmark:(id)a3 toFolderWithID:(int)a4;
- (void)_fetchHandoffResult;
- (void)_fetchMetadataIfNeededForReadingListBookmark:(id)a3;
- (void)_frequentlyVisitedSitesDidChange:(id)a3;
- (void)_hideCloudTabsSection;
- (void)_highlightsDidChange:(id)a3;
- (void)_historyWasAltered;
- (void)_historyWasCleared:(id)a3;
- (void)_privacyProxyStateDidChange;
- (void)_privacyReportDataDidChange;
- (void)_readingListBookmarkMetadataDidUpdate:(id)a3;
- (void)_recentCloudTabItemsDidRebuild:(id)a3;
- (void)_recentCloudTabItemsDidReceiveMetadata:(id)a3;
- (void)_refreshSiriSuggestions;
- (void)_reloadPrivacyReportSection;
- (void)_reportBookmarkNavigationAnalytics:(id)a3 withIntent:(id)a4;
- (void)_reportBookmarkNavigationAnalytics:(id)a3 withIntent:(id)a4 bookmarkIsInFavoritesFolder:(BOOL)a5;
- (void)_requestLeadImageForRecommendation:(id)a3;
- (void)_sectionsDidChange:(id)a3;
- (void)_setLeadImageForCard:(id)a3 withRecommendation:(id)a4;
- (void)_setProfileIconOnSectionIfNeeded:(id)a3;
- (void)_setReadingListRecommendationAsReadWithRecommendation:(id)a3;
- (void)_setSiriSuggestions:(id)a3;
- (void)_setUpContextMenuForBookmarksSection:(id)a3;
- (void)_setUpDragItemProviderForBookmarksSection:(id)a3;
- (void)_suggestionsDidChange:(id)a3;
- (void)_updateFavoritesListForActiveProfile;
- (void)_updatePrivacyReportData;
- (void)_updateRecentCloudTabsSection;
- (void)_updateRecentItemsAndDevices;
- (void)_updateRecommendationsForAllTopics;
- (void)_updateRecommendationsForTopics:(id)a3;
- (void)_updateSiriSuggestionsMediator;
- (void)_updateStartPageSectionManager;
- (void)bookmark:(id)a3 didProduceNavigationIntent:(id)a4 userInfo:(id)a5;
- (void)bookmark:(id)a3 shareItems:(id)a4 userInfo:(id)a5;
- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4;
- (void)dealloc;
- (void)deleteBookmark:(id)a3 userInfo:(id)a4;
- (void)didReorderSectionIdentifiersForStartPageCustomizationViewController:(id)a3;
- (void)editBookmark:(id)a3 userInfo:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setLibraryType:(id)a3;
- (void)setShowingAsPopover:(BOOL)a3;
- (void)setTabGroupFavoritesSectionEnabled:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)startPageCustomizationViewController:(id)a3 didCustomizeItems:(id)a4 withVariant:(int64_t)a5;
- (void)startPageCustomizationViewController:(id)a3 didModifyBackgroundImageEnabled:(BOOL)a4;
- (void)startPageCustomizationViewController:(id)a3 didSelectBuiltInBackgroundImageAtURL:(id)a4 precomputedLuminance:(double)a5;
- (void)startPageCustomizationViewController:(id)a3 didSelectCustomBackgroundImage:(id)a4;
- (void)startPageCustomizationViewController:(id)a3 didSelectMobileAssetBackgroundImageWithProvider:(id)a4;
- (void)startPageCustomizationViewController:(id)a3 willModifySectionWithIdentifier:(id)a4 enabled:(BOOL)a5;
- (void)startPageCustomizationViewControllerDidDisableCloudSync:(id)a3;
- (void)startPageCustomizationViewControllerDidEnableCloudSync:(id)a3 withPreference:(int64_t)a4;
- (void)startPageCustomizationViewControllerDidFinish:(id)a3;
- (void)startPageViewController:(id)a3 didSelectItemWithIdentifier:(id)a4 atGridLocation:(id)a5;
- (void)startPageViewController:(id)a3 didUpdateSearchPattern:(id)a4;
- (void)startPageViewController:(id)a3 toggleSectionExpanded:(id)a4;
- (void)startPageViewControllerDidChangeRootViewVisibility:(id)a3;
- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5;
- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4;
- (void)updatePolicyDidChange;
- (void)updatePrivacyReportIfEnabled;
- (void)updatePrivateBrowsingExplanationState;
- (void)updateTabGroupHeading;
@end

@implementation StartPageController

- (id)_effectiveProfile
{
  v3 = +[Application sharedApplication];
  v4 = [v3 tabGroupManager];
  v5 = [(StartPageController *)self _effectiveProfileIdentifier];
  v6 = [v4 profileWithIdentifier:v5];

  return v6;
}

- (id)_effectiveProfileIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ([WeakRetained isPrivateBrowsingEnabled])
  {
    id v3 = (id)*MEMORY[0x1E4F980C8];
  }
  else
  {
    id v3 = [WeakRetained activeProfileIdentifier];
  }
  v4 = v3;

  return v4;
}

- (id)sectionsForStartPageViewController:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int v5 = [WeakRetained isPrivateBrowsingEnabled];
  if (self->_privateBrowsingWasEnabled != v5)
  {
    cachedCloudTabsSection = self->_cachedCloudTabsSection;
    self->_cachedCloudTabsSection = 0;

    self->_privateBrowsingWasEnabled = v5;
  }
  v7 = [MEMORY[0x1E4F1CA48] array];
  libraryType = self->_libraryType;
  if (libraryType)
  {
    v9 = startPageSectionIdentifierForCollectionType(libraryType);
    [(StartPageController *)self _appendSectionModelsForIdentifier:v9 toArray:v7];

    goto LABEL_37;
  }
  if (v5)
  {
    v10 = [(StartPageController *)self _privateBrowsingPersistentModuleSection];
    [v7 addObject:v10];

    if (self->_privateBrowsingExplanationState != 1
      && [WeakRetained startPageControllerActiveTabIsBlank:self])
    {
      v11 = [(StartPageController *)self _privateBrowsingExplanationSection];
      [v7 addObject:v11];
    }
    v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if ([v12 BOOLForKey:*MEMORY[0x1E4F99148]]) {
      goto LABEL_12;
    }
    BOOL v13 = [(StartPageController *)self _canShowPrivateRelaySection];

    if (v13)
    {
      v12 = [(StartPageController *)self _privateRelayPromptInPrivateBrowsingSection];
      [v7 addObject:v12];
LABEL_12:
    }
  }
  v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [(StartPageController *)self _tabGroupScopedFavoritesSection];
  objc_msgSend(v14, "safari_addObjectUnlessNil:", v15);

  uint64_t v16 = [v14 count];
  if (v16)
  {
    v17 = [(StartPageController *)self _tabGroupHeadingSection];
    cachedTabGroupHeadingSection = self->_cachedTabGroupHeadingSection;
    self->_cachedTabGroupHeadingSection = v17;

    [v7 addObject:self->_cachedTabGroupHeadingSection];
    [v7 addObjectsFromArray:v14];
    if (!startPageSeparatorSection(void)::section)
    {
      uint64_t v19 = [MEMORY[0x1E4F98EA8] separatorSectionWithIdentifier:*MEMORY[0x1E4F99700]];
      v20 = (void *)startPageSeparatorSection(void)::section;
      startPageSeparatorSection(void)::section = v19;
    }
    objc_msgSend(v7, "addObject:");
  }
  else
  {
    v21 = self->_cachedTabGroupHeadingSection;
    self->_cachedTabGroupHeadingSection = 0;
  }
  v22 = [MEMORY[0x1E4F1CA48] array];
  v23 = [(WBSStartPageSectionManager *)self->_startPageSectionManager enabledSectionIdentifiers];
  int64_t v24 = [(StartPageController *)self effectiveUpdatePolicy];
  if (v24)
  {
    if (v24 == 1)
    {
      uint64_t v29 = [v23 firstObject];
      v30 = (void *)v29;
      if (!v16 && v29) {
        [(StartPageController *)self _appendSectionModelsForIdentifier:v29 toArray:v22];
      }
    }
    else if (v24 == 2)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v25 = v23;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v34 != v27) {
              objc_enumerationMutation(v25);
            }
            -[StartPageController _appendSectionModelsForIdentifier:toArray:](self, "_appendSectionModelsForIdentifier:toArray:", *(void *)(*((void *)&v33 + 1) + 8 * i), v22, (void)v33);
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v26);
      }
    }
  }
  else
  {
    v31 = self->_cachedSections;

    v22 = v31;
  }
  objc_storeStrong((id *)&self->_cachedSections, v22);
  if ([v22 count]) {
    [v7 addObjectsFromArray:v22];
  }

LABEL_37:
  return v7;
}

- (void)_appendSectionModelsForIdentifier:(id)a3 toArray:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 isEqualToString:*MEMORY[0x1E4F99690]])
  {
    v7 = [(StartPageController *)self _favoritesSection];
    objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
LABEL_3:

    goto LABEL_4;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F99698]])
  {
    if (([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] & 1) == 0)
    {
      v7 = [(StartPageController *)self _frequentlyVisitedSection];
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
      goto LABEL_3;
    }
  }
  else
  {
    if ([v8 isEqualToString:*MEMORY[0x1E4F996B8]] && !self->_showingAsPopover)
    {
      v7 = [(StartPageController *)self _privacyReportSection];
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
      goto LABEL_3;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F996A0]]
      || [v8 isEqualToString:*MEMORY[0x1E4F996F0]])
    {
      v7 = [(StartPageController *)self _highlightsSection];
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
      goto LABEL_3;
    }
    if (!self->_showingAsPopover && [v8 isEqualToString:*MEMORY[0x1E4F996E0]])
    {
      v7 = [(StartPageController *)self _recentlyClosedTabsSection];
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
      goto LABEL_3;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F996E8]])
    {
      v7 = [(StartPageController *)self _siriSuggestionsSection];
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
      goto LABEL_3;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F996D8]])
    {
      v7 = [(StartPageController *)self _readingListSection];
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
      goto LABEL_3;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F99688]])
    {
      v7 = [(StartPageController *)self cloudTabsSections];
      objc_msgSend(v6, "safari_addObjectsFromArrayUnlessNil:", v7);
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (int64_t)effectiveUpdatePolicy
{
  int64_t result = self->_updatePolicy;
  if (!result) {
    return 2 * ([(NSMutableArray *)self->_cachedSections count] == 0);
  }
  return result;
}

- (id)_tabGroupScopedFavoritesSection
{
  if ([(StartPageController *)self isTabGroupFavoritesSectionEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4 = [WeakRetained tabGroupProvider];

    int v5 = [v4 activeTabGroup];
    char v6 = [v5 supportsTabGroupFavorites];

    if (v6)
    {
      v7 = [v4 topScopedBookmarkListForActiveTabGroup];
      tabGroupScopedFavoritesList = self->_tabGroupScopedFavoritesList;
      self->_tabGroupScopedFavoritesList = v7;

      v9 = [v4 activeTabGroup];
      v10 = [v9 displayTitle];

      v11 = NSString;
      v12 = _WBSLocalizedString();
      BOOL v13 = objc_msgSend(v11, "stringWithFormat:", v12, v10);

      v14 = [(StartPageController *)self _bookmarkSectionForBookmark:0 orList:self->_tabGroupScopedFavoritesList forFavoritesSection:0 forScopedFavoritesSection:1 sectionTitle:v13];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)isTabGroupFavoritesSectionEnabled
{
  id v3 = [(StartPageController *)self _effectiveProfile];
  uint64_t v4 = [v3 kind];

  if (v4 == 1)
  {
    int v5 = [(StartPageController *)self _effectiveProfile];
    char v6 = [v5 settingForKey:*MEMORY[0x1E4F99638]];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v7 = [v5 BOOLForKey:*MEMORY[0x1E4F99638]];
  }

  return v7;
}

- (id)_favoritesSection
{
  [(StartPageController *)self _updateFavoritesListForActiveProfile];
  favoritesList = self->_favoritesList;
  if (!favoritesList)
  {
    bookmarkCollection = self->_bookmarkCollection;
    if (isRestricted) {
      [(WebBookmarkCollection *)bookmarkCollection webFilterAllowedSites];
    }
    else {
    int v5 = [(WebBookmarkCollection *)bookmarkCollection favoritesFolderList];
    }
    char v6 = self->_favoritesList;
    self->_favoritesList = v5;

    self->_favoritesFolderIDForDefaultProfile = [(WebBookmarkList *)self->_favoritesList folderID];
    favoritesList = self->_favoritesList;
  }
  if (self->_cachedFavoritesList != favoritesList)
  {
    -[StartPageController _bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:](self, "_bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:", 0);
    char v7 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
    cachedFavoritesSection = self->_cachedFavoritesSection;
    self->_cachedFavoritesSection = v7;

    objc_storeStrong((id *)&self->_cachedFavoritesList, self->_favoritesList);
  }
  v9 = self->_cachedFavoritesSection;
  v10 = [(StartPageController *)self _effectiveProfile];
  v11 = [v10 symbolImage];
  [(WBSStartPageSection *)v9 setIcon:v11];

  v12 = [(StartPageController *)self _effectiveProfile];
  uint64_t v13 = [v12 kind];

  if (!v13)
  {
    v14 = [(WBSStartPageSection *)v9 itemIdentifiers];
    if ([v14 count]) {
      v15 = v9;
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = v15;

    v9 = v16;
  }
  return v9;
}

- (void)_updateFavoritesListForActiveProfile
{
  id v3 = [(StartPageController *)self _effectiveProfile];
  uint64_t v4 = [v3 customFavoritesFolderServerID];
  lastSeenProfileCustomFavoritesServerID = self->_lastSeenProfileCustomFavoritesServerID;
  self->_lastSeenProfileCustomFavoritesServerID = v4;

  if ((!self->_lastSeenProfileCustomFavoritesServerID
     || !-[StartPageController _setFavoritesListToFolderWithServerID:](self, "_setFavoritesListToFolderWithServerID:"))
    && [(WebBookmarkList *)self->_favoritesList folderID] != self->_favoritesFolderIDForDefaultProfile)
  {
    favoritesList = self->_favoritesList;
    self->_favoritesList = 0;

    customFavoritesFolderBookmark = self->_customFavoritesFolderBookmark;
    self->_customFavoritesFolderBookmark = 0;
  }
}

- (void)_setProfileIconOnSectionIfNeeded:(id)a3
{
  id v9 = a3;
  uint64_t v4 = +[Application sharedApplication];
  int v5 = [v4 primaryBrowserController];
  char v6 = [v5 hasMultipleProfiles];

  if (v6)
  {
    char v7 = [(StartPageController *)self _effectiveProfile];
    id v8 = [v7 symbolImage];
    [v9 setIcon:v8];
  }
}

- (void)updateTabGroupHeading
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained tabGroupProvider];
  id v8 = [v4 activeTabGroup];

  if ([v8 isSyncable])
  {
    int v5 = [(WBSStartPageSection *)self->_cachedTabGroupHeadingSection title];
    char v6 = [v8 displayTitle];
    char v7 = WBSIsEqual();

    if ((v7 & 1) == 0) {
      [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:0];
    }
  }
}

- (BOOL)startPageViewController:(id)a3 isSectionExpanded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  libraryType = self->_libraryType;
  if (libraryType && ![(NSString *)libraryType isEqualToString:@"BookmarksCollection"])
  {
    char v9 = 1;
  }
  else if ([v7 expandsModally])
  {
    char v9 = 0;
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v11 = [v10 dictionaryForKey:@"startPageExpansionDictionary"];
    v12 = [v7 identifier];
    char v9 = objc_msgSend(v11, "safari_BOOLForKey:", v12);
  }
  return v9;
}

- (id)_recentlyClosedTabsForProfile:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained tabGroupProvider];
  id v7 = [v6 activeTabGroup];

  id v8 = [v7 uuid];
  char v9 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
  v10 = [v4 identifier];
  v11 = [v9 recentlyClosedTabsForProfileWithIdentifier:v10];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__StartPageController__recentlyClosedTabsForProfile___block_invoke;
  v15[3] = &unk_1E6D7F5D0;
  id v12 = v8;
  id v16 = v12;
  uint64_t v13 = objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", v15);

  return v13;
}

- (id)_recentlyClosedTabsSection
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = [WeakRetained tabGroupProvider];
  int v5 = [v4 activeProfile];
  id v6 = [(StartPageController *)self _recentlyClosedTabsForProfile:v5];

  if ([v6 count])
  {
    objc_initWeak(&location, self);
    id v7 = (void *)MEMORY[0x1E4F98930];
    id v8 = _WBSLocalizedString();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke;
    v22[3] = &unk_1E6D79768;
    objc_copyWeak(&v23, &location);
    char v9 = [v7 actionWithTitle:v8 image:0 identifier:0 handler:v22];

    [v9 setAccessibilityIdentifier:@"StartPageSectionClearAllButton"];
    v10 = _WBSLocalizedString();
    v11 = (void *)MEMORY[0x1E4F98EA8];
    v25[0] = v9;
    id v12 = [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
    v25[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v14 = [v11 listSectionWithIdentifier:*MEMORY[0x1E4F996E0] title:v10 actions:v13 banner:0 identifiers:v6 configurationProvider:&__block_literal_global_148_0];

    [(StartPageController *)self _setProfileIconOnSectionIfNeeded:v14];
    objc_msgSend(v14, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 5, 0));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_3;
    v20[3] = &unk_1E6D7F668;
    objc_copyWeak(&v21, &location);
    [v14 setContextMenuProvider:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_13;
    v18[3] = &unk_1E6D7F690;
    objc_copyWeak(&v19, &location);
    [v14 setContextMenuCommitHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_15;
    v16[3] = &unk_1E6D7F568;
    objc_copyWeak(&v17, &location);
    [v14 setContextMenuDismissHandler:v16];
    [v14 setDragItemProvider:&__block_literal_global_190];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (SFStartPageViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!self->_viewController)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F78378]);
    visualStyleProvider = self->_visualStyleProvider;
    id v6 = [WeakRetained tabGroupProvider];
    id v7 = [v6 activeProfile];
    id v8 = (SFStartPageViewController *)[v4 initWithVisualStyleProvider:visualStyleProvider forProfile:v7];
    viewController = self->_viewController;
    self->_viewController = v8;

    [(SFStartPageViewController *)self->_viewController setCustomizationDataSource:self];
    [(SFStartPageViewController *)self->_viewController setDataSource:self];
    [(StartPageController *)self _updatePrivacyReportData];
  }
  v10 = [WeakRetained tabGroupProvider];
  v11 = [v10 activeProfile];
  [(SFStartPageViewController *)self->_viewController setProfile:v11];

  id v12 = self->_viewController;
  return v12;
}

- (id)startPageBackgroundImageIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v3 = [WeakRetained tabGroupProvider];
  id v4 = [v3 startPageBackgroundImageIdentifier];

  return v4;
}

- (id)backgroundImageIdentifierForStartPageViewController:(id)a3
{
  id v3 = [(StartPageController *)self startPageBackgroundImageIdentifier];
  return v3;
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  int v5 = [v4 title];
  [v6 setTitle:v5];

  [v6 setIconFromBookmark:v4];
}

- (BOOL)startPageViewControllerShouldShowSearchField:(id)a3
{
  return [(NSString *)self->_libraryType isEqualToString:@"CloudTabsCollection"];
}

uint64_t __43__StartPageController__cloudTabsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cloudTabsDidChange];
}

- (void)setShowingAsPopover:(BOOL)a3
{
  if (self->_showingAsPopover != a3)
  {
    self->_showingAsPopover = a3;
    viewController = self->_viewController;
    uint64_t v4 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    [(SFStartPageViewController *)viewController reloadDataAnimatingDifferences:v4];
  }
}

- (void)_updatePrivacyReportData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ([WeakRetained isPrivateBrowsingEnabled])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v5 = objc_msgSend(v4, "safari_enableAdvancedPrivacyProtections:", 1);

    if (v5)
    {
      [(StartPageController *)self _privacyReportDataDidChange];
      return;
    }
  }
  else
  {
  }
  objc_initWeak(&location, self);
  id v6 = [(StartPageController *)self _effectiveProfileIdentifier];
  id v7 = [(WBSPrivacyReportData *)self->_privacyReportData profileIdentifiers];
  if ([v7 count] != 1)
  {

LABEL_11:
    v11 = +[Application sharedApplication];
    id v12 = [v11 historyController];
    uint64_t v13 = [v12 historyForProfileIdentifier:v6 loadIfNeeded:1];

    if (v6 && v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F98CF8]);
      v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
      id v17 = (WBSPrivacyReportData *)[v14 initWithProfileIdentifiers:v15 histories:v16];
      privacyReportData = self->_privacyReportData;
      self->_privacyReportData = v17;

      self->_cachedNumberOfTrackers = 0;
    }

    goto LABEL_15;
  }
  id v8 = [(WBSPrivacyReportData *)self->_privacyReportData profileIdentifiers];
  char v9 = [v8 anyObject];
  char v10 = [v9 isEqualToString:v6];

  if ((v10 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_15:
  if ([MEMORY[0x1E4F97EA0] is2024PrivacyReportEnabled])
  {
    id v19 = self->_privacyReportData;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __47__StartPageController__updatePrivacyReportData__block_invoke;
    v27[3] = &unk_1E6D79768;
    objc_copyWeak(&v28, &location);
    [(WBSPrivacyReportData *)v19 loadDataWithCompletionHandler:v27];
    objc_destroyWeak(&v28);
  }
  else
  {
    v20 = [MEMORY[0x1E4F1C9C8] date];
    id v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v22 = [v21 dateByAddingUnit:16 value:-7 toDate:v20 options:0];

    id v23 = [MEMORY[0x1E4F1C9C8] distantFuture];
    int64_t v24 = self->_privacyReportData;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__StartPageController__updatePrivacyReportData__block_invoke_3;
    v25[3] = &unk_1E6D79768;
    objc_copyWeak(&v26, &location);
    [(WBSPrivacyReportData *)v24 loadDataFromStartDate:v22 toEndDate:v23 withCompletionHandler:v25];
    objc_destroyWeak(&v26);
  }
  objc_destroyWeak(&location);
}

- (void)_suggestionsDidChange:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F97EA0], "is2024SuggestionsEnabled", a3))
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      viewController = self->_viewController;
      [(SFStartPageViewController *)viewController reloadDataAnimatingDifferences:1];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__StartPageController__suggestionsDidChange___block_invoke;
      block[3] = &unk_1E6D79060;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (id)_highlightsSection
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[Application sharedApplication];
  uint64_t v4 = [v3 highlightManager];

  long long v33 = [v4 highlights];
  int v5 = WBSIsEqual();
  id v6 = v33;
  id v7 = (id)*MEMORY[0x1E4F996A0];
  id v8 = +[Application sharedApplication];
  char v9 = [(StartPageController *)self dataSource];
  char v10 = [v9 activeProfileIdentifier];
  v11 = [v8 suggestionsManagerForProfileIdentifier:v10];

  v37 = v11;
  long long v35 = [v11 suggestions];
  char v12 = [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] ^ 1 | v5;
  if (v12)
  {
    id v13 = v6;
  }
  else
  {
    id v13 = v35;

    id v14 = (id)*MEMORY[0x1E4F996F0];
    id v7 = v14;
  }
  long long v36 = v13;
  long long v34 = v6;
  if ([v13 count])
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    char v16 = [WeakRetained isPrivateBrowsingEnabled];

    id v17 = (void *)MEMORY[0x1E4F98EA8];
    if (v5)
    {
      id v18 = v7;
      id v19 = v4;
      v20 = (void *)MEMORY[0x1E4F1CBF0];
      id v21 = &stru_1F3C268E8;
    }
    else
    {
      WBSStartPageSectionIdentifierTitle();
      id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
      v32 = id v18 = v7;
      v57[0] = v32;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
      id v19 = v4;
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __41__StartPageController__highlightsSection__block_invoke;
    v49[3] = &unk_1E6D7FBD0;
    char v54 = v12 ^ 1;
    id v50 = v37;
    id v27 = v19;
    id v51 = v27;
    v52 = self;
    uint64_t v4 = v19;
    objc_copyWeak(&v53, &location);
    id v7 = v18;
    char v55 = v16;
    id v26 = [v17 attributedRichLinkSectionWithIdentifier:v18 title:v21 actions:v20 banner:0 identifiers:v36 configurationProvider:v49];
    if ((v5 & 1) == 0)
    {
    }
    objc_msgSend(v26, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 4, 0));
    objc_msgSend(v26, "setNumberOfRowsVisibleWhenCollapsedInCompactWidth:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 4, 1));
    [v26 setMaximumNumberOfPages:4];
    [v26 setExpandsModally:1];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __41__StartPageController__highlightsSection__block_invoke_5;
    v45[3] = &unk_1E6D7FC70;
    v45[4] = self;
    objc_copyWeak(&v47, &location);
    id v28 = v27;
    id v46 = v28;
    char v48 = v16;
    [v26 setContextMenuProvider:v45];
    uint64_t v29 = [v26 identifier];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __41__StartPageController__highlightsSection__block_invoke_2_326;
    v40[3] = &unk_1E6D7FCC0;
    objc_copyWeak(&v43, &location);
    id v30 = v29;
    id v41 = v30;
    id v42 = v28;
    char v44 = v16;
    [v26 setContextMenuCommitHandler:v40];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __41__StartPageController__highlightsSection__block_invoke_4_329;
    v38[3] = &unk_1E6D7F568;
    objc_copyWeak(&v39, &location);
    [v26 setContextMenuDismissHandler:v38];
    [v26 setDragItemProvider:&__block_literal_global_333_0];
    objc_destroyWeak(&v39);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v53);

    objc_destroyWeak(&location);
  }
  else if (v5)
  {
    v22 = (void *)MEMORY[0x1E4F98E90];
    id v23 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"shared.with.you"];
    int64_t v24 = _WBSLocalizedString();
    id v25 = [v22 bannerWithImage:v23 title:&stru_1F3C268E8 message:v24 interactive:0 dismissHandler:0];

    id v26 = [MEMORY[0x1E4F98EA8] bannerSectionWithIdentifier:v7 title:&stru_1F3C268E8 banner:v25];
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (StartPageDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (StartPageDataSource *)WeakRetained;
}

- (FrequentlyVisitedSitesController)frequentlyVisitedSitesController
{
  frequentlyVisitedSitesController = self->_frequentlyVisitedSitesController;
  if (!frequentlyVisitedSitesController)
  {
    uint64_t v4 = +[Application sharedApplication];
    int v5 = [v4 historyController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v7 = [WeakRetained activeProfileIdentifier];
    id v8 = [v5 frequentlyVisitedSitesControllerForProfileIdentifier:v7 loadIfNeeded:1];
    char v9 = self->_frequentlyVisitedSitesController;
    self->_frequentlyVisitedSitesController = v8;

    frequentlyVisitedSitesController = self->_frequentlyVisitedSitesController;
  }
  char v10 = frequentlyVisitedSitesController;
  return v10;
}

- (void)_recentCloudTabItemsDidRebuild:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F97EA0], "is2024CloudTabsEnabled", a3))
  {
    [(StartPageController *)self _updateRecentCloudTabsSection];
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained != obj)
  {
    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"ProfileDidChange" object:WeakRetained];
    [v5 addObserver:self selector:sel__updateStartPageSectionManager name:@"ProfileDidChange" object:obj];
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(StartPageController *)self updatePolicyDidChange];
    [(StartPageController *)self _updateStartPageSectionManager];
    char v6 = [obj isPrivateBrowsingEnabled];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      int v9 = objc_msgSend(v8, "safari_enableAdvancedPrivacyProtections:", 1);

      self->_privateBrowsingWasEnabled = v7;
      if (v9)
      {
        self->_cachedNumberOfTrackers = [MEMORY[0x1E4F98A68] totalBlockedTrackerCount];
LABEL_9:
        id v17 = objc_alloc(MEMORY[0x1E4F98D88]);
        id v18 = [(StartPageController *)self _cloudTabStore];
        id v19 = (WBSRecentCloudTabsProvider *)[v17 initWithCloudTabDeviceProvider:v18];
        recentCloudTabsProvider = self->_recentCloudTabsProvider;
        self->_recentCloudTabsProvider = v19;

        id v21 = [(StartPageController *)self _effectiveProfileIdentifier];
        [(WBSRecentCloudTabsProvider *)self->_recentCloudTabsProvider setActiveProfileIdentifier:v21];

        v22 = +[Application sharedApplication];
        id v23 = [(StartPageController *)self _effectiveProfileIdentifier];
        int64_t v24 = [v22 recentsStoreForProfileWithIdentifier:v23];
        recentsStore = self->_recentsStore;
        self->_recentsStore = v24;

        [(StartPageController *)self _updateRecentItemsAndDevices];
        goto LABEL_10;
      }
    }
    else
    {
      self->_privateBrowsingWasEnabled = v6;
    }
    char v10 = (void *)MEMORY[0x1E4F98CF8];
    v11 = [(StartPageController *)self _effectiveProfileIdentifier];
    char v12 = [v10 cachedNumberOfTrackersOnStartPageForProfileWithIdentifier:v11];

    if (!v12)
    {
      id v13 = (void *)MEMORY[0x1E4F28ED0];
      id v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v15 = *MEMORY[0x1E4F78768];
      char v12 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerForKey:", *MEMORY[0x1E4F78768]));

      char v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v16 removeObjectForKey:v15];
    }
    self->_cachedNumberOfTrackers = [v12 integerValue];

    goto LABEL_9;
  }
LABEL_10:
}

- (void)updatePolicyDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int64_t updatePolicy = self->_updatePolicy;
  id v7 = WeakRetained;
  int64_t v5 = [WeakRetained updatePolicyForStartPageController:self];
  if (updatePolicy != v5)
  {
    self->_int64_t updatePolicy = v5;
    if ([(StartPageController *)self effectiveUpdatePolicy] == 2)
    {
      cachedFavoritesList = self->_cachedFavoritesList;
      self->_cachedFavoritesList = 0;
    }
    if ([(StartPageController *)self effectiveUpdatePolicy]) {
      [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
    }
  }
}

- (void)_updateStartPageSectionManager
{
  uint64_t v15 = self->_startPageSectionManager;
  if ([MEMORY[0x1E4F97EA0] isSafariProfilesEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v4 = [WeakRetained activeProfileIdentifier];

    if ([v4 isEqualToString:*MEMORY[0x1E4F980C8]])
    {
      int64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F98D38]);
      id v8 = +[Application sharedApplication];
      int v9 = [v8 tabGroupManager];
      int64_t v5 = (void *)[v7 initWithProfileIdentifier:v4 tabGroupManager:v9];
    }
    char v10 = (WBSStartPageSectionManager *)[objc_alloc(MEMORY[0x1E4F98EB0]) initWithStorage:v5];
    startPageSectionManager = self->_startPageSectionManager;
    self->_startPageSectionManager = v10;
  }
  else
  {
    char v6 = [MEMORY[0x1E4F98EB0] defaultManager];
    uint64_t v4 = self->_startPageSectionManager;
    self->_startPageSectionManager = v6;
  }

  char v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v13 = *MEMORY[0x1E4F996B0];
  [v12 removeObserver:self name:*MEMORY[0x1E4F996B0] object:v15];
  [v12 addObserver:self selector:sel__sectionsDidChange_ name:v13 object:self->_startPageSectionManager];
  frequentlyVisitedSitesController = self->_frequentlyVisitedSitesController;
  self->_frequentlyVisitedSitesController = 0;

  [(StartPageController *)self _cloudTabsDidChange];
  if ([MEMORY[0x1E4F97EA0] is2024CloudTabsEnabled]) {
    [(StartPageController *)self _updateRecentCloudTabsSection];
  }
  else {
    [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
  }
}

- (void)_updateRecentCloudTabsSection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__StartPageController__updateRecentCloudTabsSection__block_invoke;
  block[3] = &unk_1E6D79060;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_cloudTabsDidChange
{
  if (([MEMORY[0x1E4F97EA0] is2024CloudTabsEnabled] & 1) == 0)
  {
    id v3 = [(WBSStartPageSectionManager *)self->_startPageSectionManager sectionForIdentifier:*MEMORY[0x1E4F99688]];
    char v4 = [v3 isEnabled];

    if (v4)
    {
      int64_t v5 = [(StartPageController *)self _selectedCloudTabsDevice];
      char v6 = [(WBSStartPageSection *)self->_cachedCloudTabsSection itemIdentifiers];
      id v7 = [v5 tabs];
      char v8 = WBSIsEqual();

      if ((v8 & 1) == 0)
      {
        int v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_INFO, "Updating iCloud Tabs for selected device in Start Page", v13, 2u);
        }
        char v10 = [(StartPageController *)self _cloudTabsSectionWithDevice:v5];
        cachedCloudTabsSection = self->_cachedCloudTabsSection;
        self->_cachedCloudTabsSection = v10;

        [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
      }
    }
    else
    {
      char v12 = self->_cachedCloudTabsSection;
      self->_cachedCloudTabsSection = 0;
    }
  }
}

- (NSArray)cloudTabsSections
{
  v50[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F97EA0] is2024CloudTabsEnabled])
  {
    id v3 = +[Application sharedApplication];
    char v4 = [(StartPageController *)self _effectiveProfileIdentifier];
    int64_t v5 = [v3 recentsStoreForProfileWithIdentifier:v4];
    recentsStore = self->_recentsStore;
    self->_recentsStore = v5;

    [(StartPageController *)self _updateRecentItemsAndDevices];
    if ([(StartPageController *)self _shouldShowConsentUI])
    {
      id v7 = [(StartPageController *)self _cloudTabsConsentSection];
      v50[0] = v7;
      char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];

      goto LABEL_31;
    }
    if (self->_libraryType)
    {
      if (![(NSArray *)self->_availableDevices count] && self->_libraryType)
      {
LABEL_35:
        char v8 = 0;
        goto LABEL_31;
      }
      availableDevices = self->_availableDevices;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __40__StartPageController_cloudTabsSections__block_invoke;
      v45[3] = &unk_1E6D7F6D8;
      v45[4] = self;
      uint64_t v16 = [(NSArray *)availableDevices safari_mapObjectsUsingBlock:v45];
    }
    else
    {
      cachedCloudTabsSection = self->_cachedCloudTabsSection;
      if (!cachedCloudTabsSection)
      {
        uint64_t v38 = [(StartPageController *)self _recentCloudTabsSection];
        id v39 = self->_cachedCloudTabsSection;
        self->_cachedCloudTabsSection = v38;

        cachedCloudTabsSection = self->_cachedCloudTabsSection;
        if (!cachedCloudTabsSection) {
          goto LABEL_35;
        }
      }
      v49 = cachedCloudTabsSection;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    }
LABEL_30:
    char v8 = (void *)v16;
    goto LABEL_31;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v10 = [WeakRetained canShowSidebar];

  if (self->_libraryType) {
    char v11 = 0;
  }
  else {
    char v11 = v10;
  }
  if (v11)
  {
    char v12 = self->_cachedCloudTabsSection;
    if (!v12)
    {
      uint64_t v13 = [(StartPageController *)self _selectedCloudTabsDevice];
      id v14 = [(StartPageController *)self _cloudTabsSectionWithDevice:v13];
      uint64_t v15 = self->_cachedCloudTabsSection;
      self->_cachedCloudTabsSection = v14;

      char v12 = self->_cachedCloudTabsSection;
      if (!v12) {
        goto LABEL_35;
      }
    }
    id v46 = v12;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    goto LABEL_30;
  }
  id v17 = [(StartPageController *)self _cloudTabDevices];
  unint64_t v18 = [v17 count];
  if (v18 || !self->_libraryType)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __40__StartPageController_cloudTabsSections__block_invoke_2;
    v44[3] = &unk_1E6D7F6D8;
    v44[4] = self;
    id v19 = objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v44);
    char v8 = (void *)[v19 mutableCopy];

    if (v18 < 5) {
      char v20 = 1;
    }
    else {
      char v20 = v10;
    }
    if ((v20 & 1) == 0)
    {
      objc_msgSend(v8, "removeObjectsInRange:", 4, v18 - 4);
      objc_initWeak(&location, self);
      id v21 = (void *)MEMORY[0x1E4F98930];
      v22 = _WBSLocalizedString();
      id v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __40__StartPageController_cloudTabsSections__block_invoke_3;
      v41[3] = &unk_1E6D79768;
      objc_copyWeak(&v42, &location);
      int64_t v24 = [v21 actionWithTitle:v22 image:v23 identifier:0 handler:v41];

      id v25 = (void *)MEMORY[0x1E4F98EA8];
      char v48 = v24;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      id v27 = [v25 actionSectionWithIdentifier:@"showAllCloudDevices" actions:v26];
      [v8 addObject:v27];

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
    if (![v8 count] && self->_searchPattern && self->_libraryType)
    {
      id v28 = (void *)MEMORY[0x1E4F98E90];
      uint64_t v29 = _WBSLocalizedString();
      id v30 = NSString;
      v31 = _WBSLocalizedString();
      v32 = objc_msgSend(v30, "stringWithFormat:", v31, self->_searchPattern);
      long long v33 = [v28 bannerWithImage:0 title:v29 message:v32 interactive:0 dismissHandler:0];

      long long v34 = [MEMORY[0x1E4F98EA8] bannerSectionWithIdentifier:*MEMORY[0x1E4F99688] title:&stru_1F3C268E8 banner:v33];
      id v47 = v34;
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];

      char v8 = (void *)v35;
    }
  }
  else
  {
    char v8 = 0;
  }

LABEL_31:
  return (NSArray *)v8;
}

- (id)_recentCloudTabsSection
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F97EA0] is2024CloudTabsEnabled]
    && [(NSArray *)self->_recentItems count])
  {
    id v3 = (void *)MEMORY[0x1E4F98EA8];
    char v4 = [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
    v12[0] = v4;
    int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    char v6 = [v3 cardSectionWithIdentifier:*MEMORY[0x1E4F99688] actions:v5 banner:0 identifiers:self->_recentItems configurationProvider:&__block_literal_global_248];

    objc_msgSend(v6, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 0));
    objc_msgSend(v6, "setNumberOfRowsVisibleWhenCollapsedInCompactWidth:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 1));
    [v6 setExpandsModally:1];
    id v7 = [(StartPageController *)self _contextMenuConfigurationForRecentCloudTab];
    [v6 setContextMenuProvider:v7];

    char v8 = [(StartPageController *)self _cloudTabsContextMenuCommitHandler];
    [v6 setContextMenuCommitHandler:v8];

    int v9 = [(StartPageController *)self _cloudTabsContextMenuDismissHandler];
    [v6 setContextMenuDismissHandler:v9];

    char v10 = [(StartPageController *)self _cloudTabsDragItemProvider];
    [v6 setDragItemProvider:v10];

    [v6 setMaximumNumberOfPages:4];
    if (!self->_libraryType) {
      [(StartPageController *)self _setProfileIconOnSectionIfNeeded:v6];
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

uint64_t __52__StartPageController__updateRecentCloudTabsSection__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRecentItemsAndDevices];
  uint64_t v2 = [*(id *)(a1 + 32) _recentCloudTabsSection];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  int64_t v5 = *(void **)(*(void *)(a1 + 32) + 328);
  return [v5 reloadDataAnimatingDifferences:1];
}

- (void)_updateRecentItemsAndDevices
{
  id v8 = [(WBSRecentsStore *)self->_recentsStore displayableRecentItems];
  uint64_t v3 = (NSArray *)[v8 copy];
  recentItems = self->_recentItems;
  self->_recentItems = v3;

  id v9 = [(WBSRecentsStore *)self->_recentsStore availableDevices];
  int64_t v5 = (NSArray *)[v9 copy];
  availableDevices = self->_availableDevices;
  self->_availableDevices = v5;

  recentItemsByDeviceUUID = self->_recentItemsByDeviceUUID;
  self->_recentItemsByDeviceUUID = 0;

  id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  self->_cloudTabsConsentObtained = [v10 BOOLForKey:*MEMORY[0x1E4F990C0]];
}

- (BOOL)_shouldShowConsentUI
{
  return !self->_cloudTabsConsentObtained && [(NSArray *)self->_recentItems count] != 0;
}

- (id)_cloudTabStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v3 = [WeakRetained cloudTabStore];

  return v3;
}

- (NSString)libraryType
{
  return self->_libraryType;
}

- (void)setLibraryType:(id)a3
{
}

- (StartPageController)init
{
  uint64_t v3 = [MEMORY[0x1E4F78260] sharedProvider];
  char v4 = [(StartPageController *)self initWithVisualStyleProvider:v3];

  return v4;
}

- (StartPageController)initWithVisualStyleProvider:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)StartPageController;
  char v6 = [(StartPageController *)&v40 init];
  if (v6)
  {
    objc_initWeak(&location, v6);
    objc_storeStrong((id *)&v6->_visualStyleProvider, a3);
    uint64_t v7 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    bookmarkCollection = v6->_bookmarkCollection;
    v6->_bookmarkCollection = (WebBookmarkCollection *)v7;

    id v9 = +[Application sharedApplication];
    uint64_t v10 = [v9 readingListLeadImageCache];
    readingListLeadImageCache = v6->_readingListLeadImageCache;
    v6->_readingListLeadImageCache = (ReadingListLeadImageCache *)v10;

    [(StartPageController *)v6 _updateStartPageSectionManager];
    char v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v6 selector:sel__cloudTabsDidChange_ name:@"CloudTabStoreDidUpdateNotification" object:0];
    [v12 addObserver:v6 selector:sel__bookmarkFolderDidChange_ name:*MEMORY[0x1E4FB6158] object:v6->_bookmarkCollection];
    [v12 addObserver:v6 selector:sel__bookmarksDidReload_ name:*MEMORY[0x1E4FB6148] object:v6->_bookmarkCollection];
    [v12 addObserver:v6 selector:sel__bookmarksDidReload_ name:*MEMORY[0x1E4FB6180] object:v6->_bookmarkCollection];
    [v12 addObserver:v6 selector:sel__frequentlyVisitedSitesDidChange_ name:*MEMORY[0x1E4F99218] object:0];
    [v12 addObserver:v6 selector:sel__refreshSiriSuggestions name:*MEMORY[0x1E4F99200] object:0];
    uint64_t v13 = [MEMORY[0x1E4F98B90] existingSharedHistory];
    [v12 addObserver:v6 selector:sel__historyWasAltered name:*MEMORY[0x1E4F99258] object:v13];

    [v12 addObserver:v6 selector:sel__historyWasCleared_ name:*MEMORY[0x1E4F99268] object:0];
    [v12 addObserver:v6 selector:sel__readingListBookmarkMetadataDidUpdate_ name:@"ReadingListBookmarkMetadataDidUpdateNotification" object:0];
    [v12 addObserver:v6 selector:sel__contentBlockerStatisticsStoreDidClose name:*MEMORY[0x1E4F990E0] object:0];
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v6 selector:sel__recentCloudTabItemsDidRebuild_ name:*MEMORY[0x1E4F99420] object:0];

    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v6 selector:sel__recentCloudTabItemsDidReceiveMetadata_ name:*MEMORY[0x1E4F99428] object:0];

    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v6 selector:sel__suggestionsDidChange_ name:*MEMORY[0x1E4F99708] object:0];

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28FE0], "safari_suggestionsRelativeDateTimeFormatter");
    relativeDateFormatter = v6->_relativeDateFormatter;
    v6->_relativeDateFormatter = (NSRelativeDateTimeFormatter *)v17;

    siriSuggestions = v6->_siriSuggestions;
    v6->_siriSuggestions = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(StartPageController *)v6 updatePrivateBrowsingExplanationState];
    [v12 addObserver:v6 selector:sel__highlightsDidChange_ name:*MEMORY[0x1E4F99238] object:0];
    char v20 = [MEMORY[0x1E4F98CF0] sharedManager];
    [v12 addObserver:v6 selector:sel__privacyProxyStateDidChange name:*MEMORY[0x1E4F993A0] object:v20];

    id v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v22 = *MEMORY[0x1E4F78778];
    uint64_t v23 = MEMORY[0x1E4F14428];
    id v24 = MEMORY[0x1E4F14428];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __51__StartPageController_initWithVisualStyleProvider___block_invoke;
    v37[3] = &unk_1E6D7F2F8;
    objc_copyWeak(&v38, &location);
    uint64_t v25 = objc_msgSend(v21, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v22, v23, 0, v37);
    selectedCloudDeviceObservation = v6->_selectedCloudDeviceObservation;
    v6->_selectedCloudDeviceObservation = (WBSUserDefaultObservation *)v25;

    id v27 = [(StartPageController *)v6 _effectiveProfile];
    uint64_t v28 = [v27 kind];

    if (v28 != 1)
    {
      uint64_t v29 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v30 = *MEMORY[0x1E4F99638];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __51__StartPageController_initWithVisualStyleProvider___block_invoke_2;
      v35[3] = &unk_1E6D7AEE0;
      objc_copyWeak(&v36, &location);
      uint64_t v31 = objc_msgSend(v29, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v30, MEMORY[0x1E4F14428], 0, v35);
      tabGroupFavoritesObservation = v6->_tabGroupFavoritesObservation;
      v6->_tabGroupFavoritesObservation = (WBSUserDefaultObservation *)v31;

      objc_destroyWeak(&v36);
    }
    long long v33 = v6;
    objc_destroyWeak(&v38);

    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)updatePrivateBrowsingExplanationState
{
  self->_privateBrowsingExplanationState = 1;
}

- (void)_frequentlyVisitedSitesDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v4 = [(StartPageController *)self frequentlyVisitedSitesController];
  id v5 = [v4 frequentlyVisitedSites];
  objc_msgSend(v6, "didRetrieveNumberOfFrequentlyVisitedSites:", objc_msgSend(v5, "count"));
}

- (void)updatePrivacyReportIfEnabled
{
  if ([(NSMutableArray *)self->_cachedSections safari_containsObjectPassingTest:&__block_literal_global_119])
  {
    [(StartPageController *)self _updatePrivacyReportData];
  }
}

- (id)_readingListSection
{
  v18[1] = *MEMORY[0x1E4F143B8];
  readingList = self->_readingList;
  if (!readingList)
  {
    char v4 = [(WebBookmarkCollection *)self->_bookmarkCollection readingListWithUnreadOnly:0 filteredUsingString:0];
    id v5 = self->_readingList;
    self->_readingList = v4;

    readingList = self->_readingList;
  }
  if ([(WebBookmarkList *)readingList bookmarkCount])
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F98EA8];
    uint64_t v7 = [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
    v18[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v9 = [(WebBookmarkList *)self->_readingList bookmarkArrayRequestingCount:50];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __42__StartPageController__readingListSection__block_invoke;
    uint64_t v15 = &unk_1E6D7F4A0;
    objc_copyWeak(&v16, &location);
    uint64_t v10 = [v6 cardSectionWithIdentifier:*MEMORY[0x1E4F996D8] actions:v8 banner:0 identifiers:v9 configurationProvider:&v12];

    objc_msgSend(v10, "setExpandsModally:", 1, v12, v13, v14, v15);
    if ([MEMORY[0x1E4F97EA0] is2024ReadingListEnabled])
    {
      objc_msgSend(v10, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 0));
      objc_msgSend(v10, "setNumberOfRowsVisibleWhenCollapsedInCompactWidth:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 1));
      [v10 setMaximumNumberOfPages:4];
    }
    [(StartPageController *)self _setUpContextMenuForBookmarksSection:v10];
    [(StartPageController *)self _setUpDragItemProviderForBookmarksSection:v10];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (void)_reloadPrivacyReportSection
{
  viewController = self->_viewController;
  id v3 = [(StartPageController *)self _privacyReportSection];
  -[SFStartPageViewController reloadSection:animated:](viewController, "reloadSection:animated:");
}

- (id)_bookmarkSectionForBookmark:(id)a3 orList:(id)a4 forFavoritesSection:(BOOL)a5 forScopedFavoritesSection:(BOOL)a6 sectionTitle:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!v12
    || (-[WebBookmarkCollection listWithID:](self->_bookmarkCollection, "listWithID:", [v12 identifier]),
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v13,
        (id v13 = (id)v15) != 0))
  {
    id v16 = [v13 bookmarkArray];
    if (v9)
    {
      if ([(StartPageController *)self effectiveUpdatePolicy] == 1)
      {
        if ((unint64_t)[v16 count] <= 0xC) {
          uint64_t v17 = [v16 count];
        }
        else {
          uint64_t v17 = 12;
        }
        uint64_t v23 = objc_msgSend(v16, "subarrayWithRange:", 0, v17);

        id v16 = (void *)v23;
      }
      if (v8) {
        goto LABEL_16;
      }
      id v20 = (id)*MEMORY[0x1E4F99690];
    }
    else
    {
      if (v8)
      {
LABEL_16:
        id v20 = (id)*MEMORY[0x1E4F996F8];
        id v38 = v16;
        if (v14)
        {
          id v36 = v14;
        }
        else
        {
          WBSStartPageSectionIdentifierTitle();
          id v36 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_26;
      }
      unint64_t v18 = [v12 UUID];
      id v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        v37 = [v13 bookmarkArray];
        id v24 = [v37 firstObject];
        uint64_t v25 = [v24 UUID];

        id v20 = (id)v25;
      }
    }
    id v38 = v16;
    if (v12) {
      [v12 localizedTitle];
    }
    else {
    id v36 = [(StartPageController *)self _favoritesSectionTitle];
    }
LABEL_26:
    id v26 = [MEMORY[0x1E4F1CA48] array];
    id v35 = v20;
    if (v12)
    {
      if (!v9) {
        goto LABEL_33;
      }
    }
    else
    {
      id v27 = [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
      [v26 addObject:v27];

      if (!v9) {
        goto LABEL_33;
      }
    }
    if (!v8)
    {
      uint64_t v28 = [(StartPageController *)self _effectiveProfile];
      uint64_t v29 = [v28 kind];

      if (v29 == 1)
      {
LABEL_34:
        objc_initWeak(location, self);
        uint64_t v31 = (void *)MEMORY[0x1E4F98930];
        v32 = _WBSLocalizedString();
        long long v33 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke;
        v47[3] = &unk_1E6D7F368;
        objc_copyWeak(&v49, location);
        BOOL v50 = v8;
        id v48 = v13;
        uint64_t v30 = [v31 actionWithTitle:v32 image:v33 identifier:0 handler:v47];

        objc_destroyWeak(&v49);
        objc_destroyWeak(location);
        id v20 = v35;
LABEL_35:
        uint64_t v22 = [MEMORY[0x1E4F98EA8] iconSectionWithIdentifier:v20 title:v36 actions:v26 banner:0 supplementaryAction:v30 identifiers:v38 configurationProvider:&__block_literal_global_77];
        [(StartPageController *)self _setUpContextMenuForBookmarksSection:v22];
        [(StartPageController *)self _setUpDragItemProviderForBookmarksSection:v22];
        if (v9)
        {
          [(StartPageController *)self _setProfileIconOnSectionIfNeeded:v22];
        }
        else if (!v8)
        {
LABEL_40:

          goto LABEL_41;
        }
        if (!isRestricted)
        {
          objc_initWeak(location, v22);
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_4;
          v44[3] = &unk_1E6D7F3D8;
          objc_copyWeak(&v45, location);
          BOOL v46 = v8;
          [v22 setDropOperationProvider:v44];
          objc_initWeak(&from, self);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_6;
          v39[3] = &unk_1E6D7F450;
          objc_copyWeak(&v41, &from);
          id v40 = v13;
          BOOL v42 = v8;
          [v22 setDropHandler:v39];

          objc_destroyWeak(&v41);
          objc_destroyWeak(&from);
          objc_destroyWeak(&v45);
          objc_destroyWeak(location);
          id v20 = v35;
        }
        goto LABEL_40;
      }
LABEL_32:
      uint64_t v30 = 0;
      goto LABEL_35;
    }
LABEL_33:
    if (v8) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  id v21 = WBS_LOG_CHANNEL_PREFIXStartPage();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[StartPageController _bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:](v21);
  }
  uint64_t v22 = emptyBookmarksSection();
LABEL_41:

  return v22;
}

- (id)_privacyReportSection
{
  id v3 = [MEMORY[0x1E4F98CF0] sharedManager];
  char v4 = [v3 initialized];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_initWeak(&location, WeakRetained);
    id v6 = (void *)MEMORY[0x1E4F98E90];
    int64_t cachedNumberOfTrackers = self->_cachedNumberOfTrackers;
    uint64_t v8 = [WeakRetained isPrivateBrowsingEnabled];
    privacyReportData = self->_privacyReportData;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __44__StartPageController__privacyReportSection__block_invoke;
    id v16 = &unk_1E6D79768;
    objc_copyWeak(&v17, &location);
    uint64_t v10 = [v6 privacyReportBannerWithNumberOfTrackers:cachedNumberOfTrackers privateBrowsingEnabled:v8 privacyReportData:privacyReportData selectionHandler:&v13];
    char v11 = objc_msgSend(MEMORY[0x1E4F98EA8], "bannerSectionWithIdentifier:banner:", *MEMORY[0x1E4F996B8], v10, v13, v14, v15, v16);
    [(StartPageController *)self _setProfileIconOnSectionIfNeeded:v11];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    char v11 = 0;
  }
  return v11;
}

- (void)_setUpDragItemProviderForBookmarksSection:(id)a3
{
}

- (void)_setUpContextMenuForBookmarksSection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke;
  v12[3] = &unk_1E6D7F518;
  v12[4] = self;
  [v4 setContextMenuProvider:v12];
  id v5 = [v4 identifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_2;
  v9[3] = &unk_1E6D7F540;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v10 = v6;
  [v4 setContextMenuCommitHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_3;
  v7[3] = &unk_1E6D7F568;
  objc_copyWeak(&v8, &location);
  [v4 setContextMenuDismissHandler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_favoritesSectionTitle
{
  id v3 = WBSStartPageSectionIdentifierTitle();
  customFavoritesFolderBookmark = self->_customFavoritesFolderBookmark;
  if (customFavoritesFolderBookmark)
  {
    if ([(WebBookmark *)customFavoritesFolderBookmark isBookmarksBarFolder])
    {
      id v5 = 0;
    }
    else
    {
      id v6 = [(WebBookmark *)self->_customFavoritesFolderBookmark title];
      id v5 = objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
    }
    if ([v5 length] && (objc_msgSend(v5, "isEqualToString:", v3) & 1) == 0)
    {
      uint64_t v7 = [NSString stringWithFormat:@"%@ - %@", v5, v3];

      id v5 = v3;
      id v3 = (void *)v7;
    }
  }
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
    isRestricted = [v2 usesAllowedSitesOnly];
  }
}

- (void)_cloudTabsDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__StartPageController__cloudTabsDidChange___block_invoke;
  block[3] = &unk_1E6D79060;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_privacyProxyStateDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ([WeakRetained isPrivateBrowsingEnabled])
  {
    int64_t privateBrowsingExplanationState = self->_privateBrowsingExplanationState;

    if (privateBrowsingExplanationState == 1) {
      goto LABEL_5;
    }
    viewController = self->_viewController;
    id WeakRetained = [(StartPageController *)self _privateBrowsingExplanationSection];
    [(SFStartPageViewController *)viewController reloadSection:WeakRetained animated:0];
  }

LABEL_5:
  [(StartPageController *)self _reloadPrivacyReportSection];
}

void __51__StartPageController_initWithVisualStyleProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cloudTabsDidChange];
}

void __51__StartPageController_initWithVisualStyleProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sectionsDidChange:0];
}

- (void)dealloc
{
  [(WBSUserDefaultObservation *)self->_tabGroupFavoritesObservation invalidate];
  [(WBSUserDefaultObservation *)self->_selectedCloudDeviceObservation invalidate];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  [v4 cancelRequestsWithTokens:self->_siriSuggestionsMetadataTokens];

  [(WBSForYouRecommendationMediator *)self->_siriSuggestionsMediator stopListeningForURLSuggestionChanges];
  [(NSTimer *)self->_coalescedRecentCloudTabsSectionUpdateTimer invalidate];
  v5.receiver = self;
  v5.super_class = (Class)StartPageController;
  [(StartPageController *)&v5 dealloc];
}

- (void)_sectionsDidChange:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3))
  {
    viewController = self->_viewController;
    [(SFStartPageViewController *)viewController reloadDataAnimatingDifferences:1];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__StartPageController__sectionsDidChange___block_invoke;
    block[3] = &unk_1E6D79060;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __42__StartPageController__sectionsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 328) reloadDataAnimatingDifferences:1];
}

- (BOOL)_setFavoritesListToFolderWithServerID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WebBookmark *)self->_customFavoritesFolderBookmark serverID];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    uint64_t v7 = self->_customFavoritesFolderBookmark;
  }
  else
  {
    uint64_t v7 = [(WebBookmarkCollection *)self->_bookmarkCollection bookmarkWithServerID:self->_lastSeenProfileCustomFavoritesServerID excludeDeletedBookmarks:1];
  }
  id v8 = v7;
  uint64_t v9 = [(WebBookmark *)v7 identifier];
  if ([(WebBookmarkList *)self->_favoritesList folderID] == v9) {
    goto LABEL_8;
  }
  BOOL v10 = 0;
  if (v8 && v9 != 0x7FFFFFFF)
  {
    objc_storeStrong((id *)&self->_customFavoritesFolderBookmark, v8);
    id v11 = [(WebBookmarkCollection *)self->_bookmarkCollection listWithID:v9];
    favoritesList = self->_favoritesList;
    self->_favoritesList = v11;

LABEL_8:
    BOOL v10 = 1;
  }

  return v10;
}

- (id)_tabGroupHeadingSection
{
  id v2 = (void *)MEMORY[0x1E4F98EA8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = [WeakRetained tabGroupProvider];
  objc_super v5 = [v4 activeTabGroup];
  int v6 = [v5 displayTitle];
  uint64_t v7 = [v2 headingSectionWithIdentifier:*MEMORY[0x1E4F99710] title:v6];

  [v7 setUsesLargeTitle:1];
  return v7;
}

- (void)setTabGroupFavoritesSectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(StartPageController *)self _effectiveProfile];
  uint64_t v6 = [v5 kind];

  if (v6 == 1)
  {
    uint64_t v7 = +[Application sharedApplication];
    id v8 = [v7 tabGroupManager];
    uint64_t v9 = [(StartPageController *)self _effectiveProfile];
    BOOL v10 = [v9 identifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__StartPageController_setTabGroupFavoritesSectionEnabled___block_invoke;
    v13[3] = &__block_descriptor_33_e26_v16__0__WBMutableProfile_8l;
    BOOL v14 = v3;
    id v11 = (id)[v8 updateProfileWithIdentifier:v10 persist:1 usingBlock:v13 completionHandler:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v12 setBool:v3 forKey:*MEMORY[0x1E4F99638]];
  }
}

void __58__StartPageController_setTabGroupFavoritesSectionEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  BOOL v3 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  [v4 setSetting:v3 forKey:*MEMORY[0x1E4F99638]];
}

- (void)_copyBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4FB60E0]);
  id v8 = [v6 title];
  uint64_t v9 = [v6 address];
  BOOL v10 = objc_msgSend(v7, "initWithTitle:address:collectionType:", v8, v9, objc_msgSend(v6, "collectionType"));

  if ([MEMORY[0x1E4FB60E8] lockSync])
  {
    id v11 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    [v11 saveAndMoveBookmark:v10 toFolderID:v4];

    [MEMORY[0x1E4FB60E8] unlockSync];
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[StartPageController _copyBookmark:toFolderWithID:](v12);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__StartPageController__copyBookmark_toFolderWithID___block_invoke;
    block[3] = &unk_1E6D79060;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v13 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v13 didPreventBookmarkActionWithBookmarkType:1 actionType:0];
  }
}

uint64_t __52__StartPageController__copyBookmark_toFolderWithID___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:*(void *)(*(void *)(a1 + 32) + 328)];
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_2;
    v6[3] = &unk_1E6D7F340;
    objc_copyWeak(&v8, v2);
    char v9 = *(unsigned char *)(a1 + 48);
    id v7 = *(id *)(a1 + 32);
    [v5 presentBookmarkPickerWithImportHandler:v6];

    objc_destroyWeak(&v8);
  }
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v4 = +[Application sharedApplication];
      id v5 = [v4 primaryBrowserController];
      id v6 = [v5 tabController];
    }
    else
    {
      objc_msgSend(WeakRetained, "_copyBookmark:toFolderWithID:", v7, objc_msgSend(*(id *)(a1 + 32), "folderID"));
    }
  }
}

uint64_t __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained itemIdentifiers];

  unint64_t v8 = [v7 count];
  char v9 = [v5 items];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_5;
  v15[3] = &unk_1E6D7F3B0;
  id v10 = v7;
  id v16 = v10;
  char v11 = objc_msgSend(v9, "safari_containsObjectPassingTest:", v15);

  uint64_t v12 = 0;
  if (v8 == a2) {
    char v13 = v11;
  }
  else {
    char v13 = 0;
  }
  if (v8 >= a2 && (v13 & 1) == 0) {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB60E0], "_sf_operationForDropSession:destinationSubtype:", v5, *(unsigned __int8 *)(a1 + 40));
  }

  return v12;
}

uint64_t __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = objc_msgSend(a2, "_sf_localBookmark");
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 session];
  id v5 = (void *)MEMORY[0x1E4FB60E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_7;
  v8[3] = &unk_1E6D7F428;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v6 = v3;
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  id v11 = v4;
  char v13 = *(unsigned char *)(a1 + 48);
  id v7 = v4;
  objc_msgSend(v5, "_sf_webBookmarksFromDropSession:completionHandler:", v7, v8);

  objc_destroyWeak(&v12);
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v51 = v2;
  if (![v2 count]) {
    goto LABEL_54;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_53;
  }
  BOOL v50 = [MEMORY[0x1E4F781E8] sharedCoordinator];
  if (([v50 lockBookmarks] & 1) == 0)
  {
    [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:*((void *)WeakRetained + 41)];
    goto LABEL_52;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_8;
  v74[3] = &unk_1E6D79060;
  id v75 = v50;
  id v48 = v3;
  [v3 setHandler:v74];
  v52 = [*(id *)(a1 + 32) destinationIndexPath];
  if (!v52) {
    goto LABEL_51;
  }
  *((unsigned char *)WeakRetained + 112) = 1;
  id v49 = [v2 objectAtIndexedSubscript:0];
  uint64_t v60 = [v52 item];
  id v4 = objc_loadWeakRetained((id *)WeakRetained + 40);
  v59 = [v4 tabGroupProvider];

  id v5 = [WeakRetained frequentlyVisitedSitesController];
  id v6 = [v5 frequentlyVisitedSites];
  int v7 = [v6 containsObject:v49];

  if (v7)
  {
    unint64_t v8 = [WeakRetained frequentlyVisitedSitesController];
    objc_msgSend(v8, "promoteFrequentlyVisitedSite:toFavoriteAtIndex:", v49, objc_msgSend(v52, "item"));
    goto LABEL_47;
  }
  uint64_t v9 = [*(id *)(a1 + 40) folderID];
  id v10 = [*(id *)(a1 + 48) localDragSession];
  id v56 = [v10 localContext];
  id v11 = [*((id *)WeakRetained + 41) view];
  id v55 = [v11 window];

  id v53 = (void *)[v51 mutableCopy];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  id obj = v51;
  uint64_t v12 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (!v12) {
    goto LABEL_25;
  }
  uint64_t v13 = *(void *)v71;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v71 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      if (v56 != v55 && [*(id *)(*((void *)&v70 + 1) + 8 * i) parentID] == v9)
      {
        id v16 = [*(id *)(a1 + 40) bookmarkArray];
        uint64_t v17 = [v16 indexOfObject:v15];
        LODWORD(v17) = v17 < [v52 item];

        uint64_t v60 = (v60 - v17);
      }
      if ([v15 subtype] == 1)
      {
        if (*(unsigned char *)(a1 + 64)) {
          continue;
        }
        id v18 = *((id *)WeakRetained + 2);
        id v19 = objc_alloc(MEMORY[0x1E4FB60E0]);
        id v20 = [v15 title];
        id v21 = [v15 address];
        uint64_t v22 = [v18 configuration];
        uint64_t v23 = objc_msgSend(v19, "initWithTitle:address:parentID:collectionType:", v20, v21, v9, objc_msgSend(v22, "collectionType"));

        [v18 saveBookmark:v23];
        objc_msgSend(v53, "replaceObjectAtIndex:withObject:", objc_msgSend(v53, "indexOfObject:", v15), v23);

        goto LABEL_21;
      }
      if (*(unsigned char *)(a1 + 64))
      {
        id v18 = (id)[v59 copyBookmark:v15 toPerTabGroupBookmarkFolderWithID:v9];
        objc_msgSend(v53, "replaceObjectAtIndex:withObject:", objc_msgSend(v53, "indexOfObject:", v15), v18);
LABEL_21:

        continue;
      }
      [*((id *)WeakRetained + 2) saveAndMoveBookmark:v15 toFolderID:v9];
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
  }
  while (v12);
LABEL_25:

  if (*(unsigned char *)(a1 + 64)) {
    [v59 perTabGroupBookmarkListForFolderID:v9 filteredUsingString:0];
  }
  else {
  id v24 = [*((id *)WeakRetained + 2) listWithID:v9];
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v25 = [v53 reverseObjectEnumerator];
  id v57 = v25;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v67 != v27) {
          objc_enumerationMutation(v57);
        }
        uint64_t v29 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        if (*(unsigned char *)(a1 + 64))
        {
          uint64_t v30 = objc_msgSend(v59, "perTabGroupBookmarkListForFolderID:filteredUsingString:", objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * j), "parentID"), 0);
          int v31 = [obj containsObject:v29];
          if (v31)
          {
            v32 = [v30 bookmarkArray];
            unint64_t v33 = [v32 indexOfObject:v29];
          }
          else
          {
            unint64_t v33 = 0;
          }
          if (v60)
          {
            id v36 = [*(id *)(a1 + 40) bookmarkArray];
            v37 = v36;
            int v38 = v31 ^ 1;
            if (v33 >= v60) {
              int v38 = 1;
            }
            id v39 = [v36 objectAtIndexedSubscript:(v60 - v38)];
          }
          else
          {
            id v39 = 0;
          }
          id v40 = [v29 UUID];
          id v41 = [v39 UUID];
          [v59 reorderScopedBookmarkWithUUID:v40 afterBookmarkWithUUID:v41 notify:1];
        }
        else
        {
          long long v34 = [v24 bookmarkArray];
          uint64_t v35 = [v34 indexOfObject:v29];

          [*((id *)WeakRetained + 2) reorderList:v24 moveBookmarkAtIndex:v35 toIndex:v60];
        }
      }
      uint64_t v25 = v57;
      uint64_t v26 = [v57 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v26);
  }

  unint64_t v8 = v53;
LABEL_47:

  BOOL v42 = (void *)*((void *)WeakRetained + 7);
  *((void *)WeakRetained + 7) = 0;

  [*((id *)WeakRetained + 41) reloadDataAnimatingDifferences:1];
  id v43 = [*(id *)(a1 + 48) items];
  char v44 = (void *)MEMORY[0x1E4F28D60];
  unint64_t v45 = [v43 count];
  if (v45 >= [v51 count]) {
    BOOL v46 = v51;
  }
  else {
    BOOL v46 = v43;
  }
  id v47 = objc_msgSend(v44, "indexSetWithIndexesInRange:", 0, objc_msgSend(v46, "count"));
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_9;
  v62[3] = &unk_1E6D7F400;
  int v65 = v60;
  id v63 = v52;
  id v64 = *(id *)(a1 + 32);
  [v43 enumerateObjectsAtIndexes:v47 options:0 usingBlock:v62];
  *((unsigned char *)WeakRetained + 112) = 0;

LABEL_51:
LABEL_52:

LABEL_53:
  id v2 = v51;
LABEL_54:
}

uint64_t __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlockBookmarksSoon];
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", *(unsigned int *)(a1 + 48) + a3, objc_msgSend(*(id *)(a1 + 32), "section"));
  id v6 = (id)[*(id *)(a1 + 40) dropItem:v7 toItemAtIndexPath:v5];
}

- (id)_frequentlyVisitedSection
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(StartPageController *)self frequentlyVisitedSitesController];
  id v4 = [v3 frequentlyVisitedSites];

  if ([v4 count])
  {
    id v5 = (void *)MEMORY[0x1E4F98EA8];
    id v6 = [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    unint64_t v8 = [v5 iconSectionWithIdentifier:*MEMORY[0x1E4F99698] actions:v7 banner:0 supplementaryAction:0 identifiers:v4 configurationProvider:&__block_literal_global_88_0];

    objc_msgSend(v8, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 2, 0));
    [(StartPageController *)self _setUpContextMenuForBookmarksSection:v8];
    [(StartPageController *)self _setUpDragItemProviderForBookmarksSection:v8];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

void __48__StartPageController__frequentlyVisitedSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  id v5 = [v4 title];
  [v6 setTitle:v5];

  [v6 setIconFromBookmark:v4];
}

void __42__StartPageController__readingListSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([MEMORY[0x1E4F97EA0] is2024ReadingListEnabled])
  {
    id v7 = [v6 previewText];
    [v5 setSubtitle:v7];

    unint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [v6 address];
    id v10 = objc_msgSend(v8, "safari_URLWithDataAsString:", v9);
    id v11 = [v10 host];
    uint64_t v12 = objc_msgSend(v11, "safari_highLevelDomainFromHost");
    [v5 setCaptionText:v12 icon:0];
  }
  else
  {
    uint64_t v13 = [v6 address];
    BOOL v14 = objc_msgSend(v13, "safari_domainFromHost");
    [v5 setSubtitle:v14];

    [v5 setCaption:&stru_1F3C268E8];
  }
  uint64_t v15 = [v6 title];
  [v5 setTitle:v15];

  id v16 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__StartPageController__readingListSection__block_invoke_2;
  block[3] = &unk_1E6D79E08;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  id v20 = v6;
  id v21 = v5;
  id v17 = v5;
  id v18 = v6;
  dispatch_async(v16, block);

  objc_destroyWeak(&v22);
}

void __42__StartPageController__readingListSection__block_invoke_2(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = [a1[4] readingListIconUUID];
    uint64_t v5 = [v4 length];

    if (!v5
      || (id v6 = (void *)WeakRetained[37],
          [a1[4] readingListIconUUID],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v6 loadImageSynchronouslyForIconUUID:v7],
          unint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
      unint64_t v8 = [a1[4] iconData];

      if (v8)
      {
        uint64_t v9 = (void *)MEMORY[0x1E4FB1818];
        id v10 = [a1[4] iconData];
        unint64_t v8 = [v9 imageWithData:v10];
      }
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __42__StartPageController__readingListSection__block_invoke_3;
    v12[3] = &unk_1E6D7F478;
    objc_copyWeak(&v16, v2);
    id v13 = v8;
    id v14 = a1[5];
    id v15 = a1[4];
    id v11 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v12);

    objc_destroyWeak(&v16);
  }
}

void __42__StartPageController__readingListSection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = *(void **)(a1 + 40);
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(v2, "setImage:");
    }
    else
    {
      [v2 setImageFromBookmark:*(void *)(a1 + 48)];
      [WeakRetained _fetchMetadataIfNeededForReadingListBookmark:*(void *)(a1 + 48)];
    }
  }
}

- (void)_fetchMetadataIfNeededForReadingListBookmark:(id)a3
{
  id v11 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_readingListBookmarksToMetadataStates, "objectForKeyedSubscript:");
  uint64_t v5 = [v4 integerValue];

  if (!v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v7 = objc_msgSend(v6, "safari_shouldAutomaticallyDownloadReadingListItems");

    if ((v7 & 1) == 0)
    {
      if (!self->_readingListBookmarksToMetadataStates)
      {
        unint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
        readingListBookmarksToMetadataStates = self->_readingListBookmarksToMetadataStates;
        self->_readingListBookmarksToMetadataStates = v8;
      }
      if (+[ReadingListMetadataFetcher shouldFetchMetadataForBookmark:v11])
      {
        [(NSMutableDictionary *)self->_readingListBookmarksToMetadataStates setObject:&unk_1F3C73C50 forKeyedSubscript:v11];
        id v10 = +[ReadingListMetadataFetcher sharedMetadataFetcher];
        [v10 fetchMetadataForReadingListBookmark:v11 withProvider:0];
      }
      else
      {
        if (!+[ReadingListMetadataFetcher shouldFetchThumbnailForBookmark:v11])goto LABEL_10; {
        [(NSMutableDictionary *)self->_readingListBookmarksToMetadataStates setObject:&unk_1F3C73C50 forKeyedSubscript:v11];
        }
        id v10 = +[ReadingListMetadataFetcher sharedMetadataFetcher];
        [v10 fetchThumbnailForReadingListBookmark:v11 withProvider:0];
      }
    }
  }
LABEL_10:
}

- (void)_contextMenuCommitHandlerForFrequentlyVisitedSite:(id)a3 animator:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [v7 setPreferredCommitStyle:1];
  uint64_t v9 = [v7 previewViewController];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __100__StartPageController__contextMenuCommitHandlerForFrequentlyVisitedSite_animator_sectionIdentifier___block_invoke;
  id v18 = &unk_1E6D791E8;
  id v19 = self;
  id v10 = v9;
  id v20 = v10;
  [v7 addAnimations:&v15];
  if ((id)*MEMORY[0x1E4F99690] == v8)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", v15, v16, v17, v18, v19);
    [v13 didSelectFavoriteWithOpenLocation:0];
    goto LABEL_5;
  }
  if ((id)*MEMORY[0x1E4F99698] == v8)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F97EB0]);
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "now", v15, v16, v17, v18, v19);
    id v13 = (void *)[v11 initWithItemPosition:0 lastVisitedDate:v12 score:0];

    id v14 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v14 didSelectFrequentlyVisitedSiteWithOpenLocation:0 analyticsPayload:v13];

LABEL_5:
  }
}

void __100__StartPageController__contextMenuCommitHandlerForFrequentlyVisitedSite_animator_sectionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 320));
  [WeakRetained commitLinkPreviewViewController:*(void *)(a1 + 40)];
}

- (id)_contextMenuConfigurationForFrequentlyVisitedSite:(id)a3 previewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4FB1678];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke;
  v17[3] = &unk_1E6D7F4C8;
  objc_copyWeak(&v20, &location);
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke_2;
  v14[3] = &unk_1E6D7F4F0;
  objc_copyWeak(&v16, &location);
  id v15 = v9;
  id v11 = v9;
  uint64_t v12 = [v8 configurationWithIdentifier:0 previewProvider:v17 actionProvider:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v12;
}

id __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  if ([a1[4] isFolder])
  {
    id v3 = objc_msgSend(WeakRetained[2], "listWithID:", objc_msgSend(a1[4], "identifier"));
    int v4 = [v3 bookmarkCount];

    if (v4)
    {
      uint64_t v5 = [a1[5] previewViewControllerForItemIdentifier:a1[4]];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v6 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
  id v7 = [v6 navigationIntentWithBookmark:a1[4]];

  id v8 = objc_loadWeakRetained(WeakRetained + 40);
  uint64_t v5 = [v8 linkPreviewViewControllerForNavigationIntent:v7];

LABEL_7:
  return v5;
}

id __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F97EB0]);
    int v4 = [WeakRetained frequentlyVisitedSitesController];
    uint64_t v5 = [v4 displayIndexOfFrequentlyVisitedSite:*(void *)(a1 + 32)];
    id v6 = [*(id *)(a1 + 32) historyItem];
    id v7 = [v6 lastVisitedDate];
    id v8 = [*(id *)(a1 + 32) frequentlyVisitedSiteScore];
    id v9 = (void *)[v3 initWithItemPosition:v5 lastVisitedDate:v7 score:v8];

    id v10 = *(void **)(a1 + 32);
    id v11 = WeakRetained[2];
    id v12 = objc_loadWeakRetained(WeakRetained + 40);
    id v13 = [v12 tabGroupProvider];
    id v14 = objc_msgSend(v10, "_sf_contextMenuUsingCollection:tabGroupActionProvider:analyticsPayload:withUserInfo:handler:", v11, v13, v9, 0, WeakRetained);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

id __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [*(id *)(a1 + 32) _contextMenuConfigurationForFrequentlyVisitedSite:a2 previewProvider:a3];
  return v3;
}

void __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _contextMenuCommitHandlerForFrequentlyVisitedSite:v9 animator:v6 sectionIdentifier:*(void *)(a1 + 32)];
  }
}

void __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && ([v6 isFolder] & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 40);
    [v5 linkPreviewProviderWillDismissPreview];
  }
}

id __65__StartPageController__setUpDragItemProviderForBookmarksSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1710]), "_sf_initWithBookmark:", v2);

  return v3;
}

- (void)_bookmarkFolderDidChange:(id)a3
{
  int v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:*MEMORY[0x1E4FB6130]];

  if (v8)
  {
    int v5 = [v8 intValue];
    p_favoritesList = &self->_favoritesList;
    if (v5 == [(WebBookmarkList *)self->_favoritesList folderID])
    {
      if (self->_isDroppingFavorites) {
        goto LABEL_9;
      }
    }
    else
    {
      if (v5 != [(WebBookmarkCollection *)self->_bookmarkCollection readingListFolderBookmarkID])
      {
LABEL_8:
        [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
        goto LABEL_9;
      }
      p_favoritesList = &self->_readingList;
    }
    id v7 = *p_favoritesList;
    *p_favoritesList = 0;

    goto LABEL_8;
  }
LABEL_9:
}

- (void)_bookmarksDidReload:(id)a3
{
  favoritesList = self->_favoritesList;
  self->_favoritesList = 0;

  readingList = self->_readingList;
  self->_readingList = 0;

  viewController = self->_viewController;
  [(SFStartPageViewController *)viewController reloadDataAnimatingDifferences:1];
}

- (void)_readingListBookmarkMetadataDidUpdate:(id)a3
{
  int v4 = [a3 userInfo];
  id v10 = [v4 objectForKeyedSubscript:@"BookmarkWithUpdatedMetadataKey"];

  if (v10)
  {
    int v5 = [(NSMutableDictionary *)self->_readingListBookmarksToMetadataStates objectForKeyedSubscript:v10];
    uint64_t v6 = [v5 integerValue];

    if (v6 == 1)
    {
      [(NSMutableDictionary *)self->_readingListBookmarksToMetadataStates setObject:&unk_1F3C73C68 forKeyedSubscript:v10];
      id v7 = [v10 readingListIconUUID];
      if ([v7 length])
      {
      }
      else
      {
        id v8 = [v10 iconData];

        if (!v8) {
          goto LABEL_7;
        }
      }
      readingList = self->_readingList;
      self->_readingList = 0;

      [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
    }
  }
LABEL_7:
}

void __44__StartPageController__privacyReportSection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentPrivacyReport];

  id v2 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v2 didEngageWithStartPageSection:3];
}

void __47__StartPageController__updatePrivacyReportData__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__StartPageController__updatePrivacyReportData__block_invoke_2;
  block[3] = &unk_1E6D79768;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __47__StartPageController__updatePrivacyReportData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _privacyReportDataDidChange];
}

void __47__StartPageController__updatePrivacyReportData__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__StartPageController__updatePrivacyReportData__block_invoke_4;
  block[3] = &unk_1E6D79768;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __47__StartPageController__updatePrivacyReportData__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _privacyReportDataDidChange];
}

- (void)_historyWasAltered
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__StartPageController__historyWasAltered__block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__StartPageController__historyWasAltered__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePrivacyReportData];
}

- (void)_historyWasCleared:(id)a3
{
  int v4 = [a3 object];
  int v5 = (void *)MEMORY[0x1E4F98CF8];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [v4 profileLocalIdentifier];
  id v8 = [v6 setWithObject:v7];
  [v5 clearCachedDataForProfilesWithIdentifiers:v8];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__StartPageController__historyWasCleared___block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __42__StartPageController__historyWasCleared___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = 0;
  [*(id *)(a1 + 32) _reloadPrivacyReportSection];
  id v2 = *(void **)(*(void *)(a1 + 32) + 328);
  return [v2 reloadDataAnimatingDifferences:1];
}

uint64_t __51__StartPageController_updatePrivacyReportIfEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

- (void)_privacyReportDataDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (([WeakRetained isPrivateBrowsingEnabled] & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v4 = objc_msgSend(v3, "safari_enableAdvancedPrivacyProtections:", 1);

  if (!v4)
  {
LABEL_5:
    id v11 = [(WBSPrivacyReportData *)self->_privacyReportData knownTrackers];
    int64_t v5 = [v11 count];

    char v6 = 0;
    goto LABEL_6;
  }
  int64_t v5 = [MEMORY[0x1E4F98A68] totalBlockedTrackerCount];
  char v6 = 1;
LABEL_6:
  if (v5 != self->_cachedNumberOfTrackers)
  {
    self->_int64_t cachedNumberOfTrackers = v5;
    [(StartPageController *)self _reloadPrivacyReportSection];
    if ((v6 & 1) == 0)
    {
      id v7 = [(StartPageController *)self _effectiveProfileIdentifier];
      if (v7)
      {
        id v12 = v7;
        id v8 = (void *)MEMORY[0x1E4F98CF8];
        id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5];
        [v8 setCachedNumberOfTrackersOnStartPage:v9 forProfileWithIdentifier:v12];

        id v7 = v12;
      }
    }
  }
}

- (void)_contentBlockerStatisticsStoreDidClose
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v4 = [WeakRetained isPrivateBrowsingEnabled];

  if (v4)
  {
    [(StartPageController *)self _privacyReportDataDidChange];
  }
}

- (id)_privateRelayPromptInPrivateBrowsingSection
{
  uint64_t v3 = (void *)-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section;
  if (!-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section)
  {
    char v4 = NSString;
    int64_t v5 = _WBSLocalizedString();
    char v6 = objc_msgSend(v4, "stringWithFormat:", v5, @" ");

    objc_initWeak(&location, self);
    id v7 = (void *)MEMORY[0x1E4F98E90];
    id v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"network.badge.shield.half.filled"];
    id v9 = _WBSLocalizedString();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__StartPageController__privateRelayPromptInPrivateBrowsingSection__block_invoke;
    v14[3] = &unk_1E6D79768;
    objc_copyWeak(&v15, &location);
    id v10 = [v7 privateRelayPromptBannerWithImage:v8 title:v9 message:v6 dismissHandler:v14];

    [v10 setUserInterfaceStyle:2];
    uint64_t v11 = [MEMORY[0x1E4F98EA8] bannerSectionWithIdentifier:*MEMORY[0x1E4F996D0] title:&stru_1F3C268E8 banner:v10];
    id v12 = (void *)-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section;
    -[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    uint64_t v3 = (void *)-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section;
  }
  return v3;
}

void __66__StartPageController__privateRelayPromptInPrivateBrowsingSection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v2 setBool:1 forKey:*MEMORY[0x1E4F99148]];

    uint64_t v3 = [v4 viewController];
    [v3 reloadDataAnimatingDifferences:1];

    id WeakRetained = v4;
  }
}

- (BOOL)_canShowPrivateRelaySection
{
  uint64_t v3 = [MEMORY[0x1E4F98CF0] sharedManager];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int v5 = [v3 shouldPromptUsersToTurnOnPrivateRelayForSafari];
  if ([WeakRetained startPageControllerActiveTabIsBlank:self] & v5) {
    char v6 = [WeakRetained isPrivateBrowsingEnabled];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

id __53__StartPageController__recentlyClosedTabsForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  int v5 = [v3 tabGroupUUID];
  if (([v4 isEqual:v5] & 1) == 0) {
    goto LABEL_10;
  }
  char v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = [v3 url];
  id v8 = [v6 URLWithString:v7];
  if ((objc_msgSend(v8, "safari_isHTTPFamilyURL") & 1) == 0)
  {

LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  id v9 = [v3 title];
  uint64_t v10 = [v9 length];

  if (v10) {
    uint64_t v11 = v3;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    id v3 = 0;
  }
LABEL_11:

  return v11;
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 40);
    id v4 = [v3 tabGroupProvider];
    int v5 = [v4 activeProfile];
    char v6 = [v2 _recentlyClosedTabsForProfile:v5];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          id v12 = objc_msgSend(MEMORY[0x1E4F78550], "sharedBrowserSavedState", (void)v13);
          [v12 removeRecentlyClosedTabWithStateData:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v2[41] reloadDataAnimatingDifferences:1];
  }
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = [a3 title];
  [v5 setTitle:v4];
}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB1678];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_4;
  v12[3] = &unk_1E6D7F618;
  a1 += 4;
  objc_copyWeak(&v14, a1);
  id v5 = v3;
  id v13 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_5;
  v9[3] = &unk_1E6D7F4F0;
  objc_copyWeak(&v11, a1);
  id v10 = v5;
  id v6 = v5;
  id v7 = [v4 configurationWithIdentifier:0 previewProvider:v12 actionProvider:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  return v7;
}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    id v5 = [*(id *)(a1 + 32) url];
    id v6 = [v4 URLWithString:v5];
    id v7 = [v3 navigationIntentWithURL:v6];

    id v8 = objc_loadWeakRetained(WeakRetained + 40);
    uint64_t v9 = [v8 linkPreviewViewControllerForNavigationIntent:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_5(uint64_t a1)
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v41 = WeakRetained;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_6;
    v56[3] = &unk_1E6D7F640;
    objc_copyWeak(&v58, v2);
    id v57 = *(id *)(a1 + 32);
    int v38 = (void *)MEMORY[0x1E4E42950](v56);
    id v4 = objc_loadWeakRetained(v41 + 40);
    id v40 = [v4 tabGroupProvider];

    id v5 = (void *)MEMORY[0x1E4FB13F0];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_7;
    v54[3] = &unk_1E6D79320;
    id v6 = v38;
    id v55 = v6;
    id v7 = objc_msgSend(v5, "_sf_openInNewTabActionWithHandler:", v54);
    v61[0] = v7;
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [*(id *)(a1 + 32) url];
    id v10 = [v8 URLWithString:v9];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_8;
    v52[3] = &unk_1E6D79320;
    id v35 = v6;
    id v53 = v35;
    id v11 = [v40 openInTabGroupMenuWithNewTabGroupName:0 URL:v10 descendantCount:0 handler:v52];
    v61[1] = v11;
    id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];

    id v12 = (void *)MEMORY[0x1E4FB13F0];
    v37 = _WBSLocalizedString();
    uint64_t v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eyeglasses"];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    void v50[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_9;
    v50[3] = &unk_1E6D79830;
    id v51 = *(id *)(a1 + 32);
    id v36 = (void *)v13;
    id v14 = [v12 actionWithTitle:v37 image:v13 identifier:0 handler:v50];
    v60[0] = v14;
    long long v15 = (void *)MEMORY[0x1E4FB13F0];
    long long v16 = _WBSLocalizedString();
    id v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_10;
    v48[3] = &unk_1E6D79830;
    id v49 = *(id *)(a1 + 32);
    uint64_t v18 = [v15 actionWithTitle:v16 image:v17 identifier:0 handler:v48];
    v60[1] = v18;
    id v19 = (void *)MEMORY[0x1E4FB13F0];
    id v20 = _WBSLocalizedString();
    id v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_11;
    v45[3] = &unk_1E6D7D3A0;
    objc_copyWeak(&v47, v2);
    id v46 = *(id *)(a1 + 32);
    id v22 = [v19 actionWithTitle:v20 image:v21 identifier:0 handler:v45];
    v60[2] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];

    id v24 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v25 = _WBSLocalizedString();
    uint64_t v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_12;
    v42[3] = &unk_1E6D7D3A0;
    objc_copyWeak(&v44, v2);
    id v43 = *(id *)(a1 + 32);
    uint64_t v27 = [v24 actionWithTitle:v25 image:v26 identifier:0 handler:v42];

    [v27 setAttributes:2];
    uint64_t v28 = [v23 arrayByAddingObject:v27];

    uint64_t v29 = (void *)MEMORY[0x1E4FB1970];
    uint64_t v30 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v39];
    v59[0] = v30;
    int v31 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v28];
    v59[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    unint64_t v33 = [v29 menuWithTitle:&stru_1F3C268E8 children:v32];

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v47);

    objc_destroyWeak(&v58);
    id WeakRetained = v41;
  }
  else
  {
    unint64_t v33 = 0;
  }

  return v33;
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    id v7 = objc_loadWeakRetained(WeakRetained + 40);
    id v8 = [MEMORY[0x1E4F78598] builder];
    [v8 setPreferredTabOrder:a2];
    [v8 setPrefersOpenInNewTab:a3];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = [*(id *)(a1 + 32) url];
    id v11 = [v9 URLWithString:v10];
    id v12 = [v8 navigationIntentWithURL:v11];

    [v7 handleNavigationIntent:v12 completion:0];
    if ([v12 shouldOrderToForeground] && (a3 & 1) == 0)
    {
      uint64_t v13 = [v7 tabGroupProvider];
      [v13 removeSingleBlankTabFromActiveTabGroup];
    }
    [v14[41] reloadDataAnimatingDifferences:1];

    id WeakRetained = v14;
  }
}

uint64_t __49__StartPageController__recentlyClosedTabsSection__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__StartPageController__recentlyClosedTabsSection__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_9(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F3AED0] defaultReadingList];
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [*(id *)(a1 + 32) url];
  id v4 = [v2 URLWithString:v3];
  id v5 = [*(id *)(a1 + 32) title];
  [v6 addReadingListItemWithURL:v4 title:v5 previewText:0 error:0];
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_10(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [*(id *)(a1 + 32) url];
  id v2 = objc_msgSend(v1, "URLWithString:");
  id v3 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v3 setURL:v2];
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_11(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    id v4 = [*(id *)(a1 + 32) url];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v6 = (void *)[v3 initWithActivityItems:v5 applicationActivities:0];

    [WeakRetained[41] presentViewController:v6 fromItemWithIdentifier:*(void *)(a1 + 32)];
  }
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_12(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
    [v2 removeRecentlyClosedTabWithStateData:*(void *)(a1 + 32)];

    [WeakRetained[41] reloadDataAnimatingDifferences:1];
  }
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  [v5 setPreferredCommitStyle:1];
  id v6 = [v5 previewViewController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_14;
  v8[3] = &unk_1E6D79A60;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v9 = v6;
  id v7 = v6;
  [v5 addAnimations:v8];

  objc_destroyWeak(&v10);
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_14(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 40);
    [v3 commitLinkPreviewViewController:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_15(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 40);
    [v2 linkPreviewProviderWillDismissPreview];

    id WeakRetained = v3;
  }
}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1E4F28D78];
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [v2 url];
  id v6 = objc_msgSend(v4, "safari_URLWithDataAsString:", v5);
  id v7 = [v2 title];
  id v8 = [v3 itemProviderWithURL:v6 title:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v8];
  return v9;
}

- (id)_cloudTabDevices
{
  id v3 = [(StartPageController *)self _cloudTabStore];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [WeakRetained activeProfileIdentifier];
  id v6 = [v3 syncedRemoteCloudTabDevicesForProfileWithIdentifier:v5];

  return v6;
}

id __40__StartPageController_cloudTabsSections__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _recentCloudTabsSectionWithDevice:a2];
  return v2;
}

id __40__StartPageController_cloudTabsSections__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _cloudTabsSectionWithDevice:a2];
  return v2;
}

void __40__StartPageController_cloudTabsSections__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 40);
    [v2 presentCloudTabsPickerWithPrimaryDeviceUUID:0];

    id WeakRetained = v3;
  }
}

- (id)_cloudTabsConsentSection
{
  id v3 = (void *)MEMORY[0x1E4F98E90];
  id v4 = _WBSLocalizedString();
  id v5 = [(StartPageController *)self _cloudTabsConsentMessage];
  id v6 = _WBSLocalizedString();
  id v7 = _WBSLocalizedString();
  void v16[4] = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke;
  v17[3] = &unk_1E6D79060;
  void v17[4] = self;
  void v15[4] = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke_2;
  v16[3] = &unk_1E6D79060;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke_3;
  v15[3] = &unk_1E6D7F700;
  id v8 = [v3 bannerWithTitle:v4 attributedMessage:v5 primaryButtonTitle:v6 secondaryButtonTitle:v7 primaryButtonHandler:v17 secondaryButtonHandler:v16 messageTextItemHandler:v15];

  id v9 = (void *)MEMORY[0x1E4F98EA8];
  uint64_t v10 = *MEMORY[0x1E4F99688];
  libraryType = (__CFString *)self->_libraryType;
  if (libraryType == @"CloudTabsCollection")
  {
    id v12 = &stru_1F3C268E8;
  }
  else
  {
    WBSStartPageSectionIdentifierTitle();
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = [v9 bannerSectionWithIdentifier:v10 title:v12 banner:v8];
  if (libraryType != @"CloudTabsCollection") {

  }
  return v13;
}

uint64_t __47__StartPageController__cloudTabsConsentSection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cloudTabsConsentSelected];
}

uint64_t __47__StartPageController__cloudTabsConsentSection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideCloudTabsSection];
}

id __47__StartPageController__cloudTabsConsentSection__block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke_4;
  v3[3] = &unk_1E6D79830;
  v3[4] = *(void *)(a1 + 32);
  v1 = [MEMORY[0x1E4FB13F0] actionWithHandler:v3];
  return v1;
}

void __47__StartPageController__cloudTabsConsentSection__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)getOBPrivacyPresenterClass(void)::softClass;
  uint64_t v12 = getOBPrivacyPresenterClass(void)::softClass;
  if (!getOBPrivacyPresenterClass(void)::softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___ZL26getOBPrivacyPresenterClassv_block_invoke;
    v8[3] = &unk_1E6D79088;
    void v8[4] = &v9;
    ___ZL26getOBPrivacyPresenterClassv_block_invoke((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [v5 presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.safari"];
  id v7 = [*(id *)(a1 + 32) viewController];
  [v6 setPresentingViewController:v7];

  [v6 present];
}

- (id)_cloudTabsConsentMessage
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v2 = _WBSLocalizedString();
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v3 setAlignment:1];
  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  id v6 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  v20[0] = *MEMORY[0x1E4FB0738];
  v20[1] = v7;
  v21[0] = v3;
  v21[1] = v4;
  v20[2] = *MEMORY[0x1E4FB0700];
  v21[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  uint64_t v9 = (void *)[v6 initWithString:v2 attributes:v8];

  uint64_t v10 = [v9 string];
  uint64_t v11 = [v10 rangeOfString:@"{about-safari-privacy-link}"];
  uint64_t v13 = v12;

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"about-safari-privacy://"];
    uint64_t v18 = *MEMORY[0x1E4FB0720];
    id v19 = v14;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    objc_msgSend(v9, "addAttributes:range:", v15, v11, v13);

    long long v16 = _WBSLocalizedString();
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, v13, v16);
  }
  return v9;
}

- (void)_cloudTabsConsentSelected
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v3, "safari_setBool:andNotifyForKey:", 1, *MEMORY[0x1E4F990C0]);

  [(StartPageController *)self _updateRecentCloudTabsSection];
  recentsStore = self->_recentsStore;
  [(WBSRecentsStore *)recentsStore fetchMetadata];
}

- (void)_hideCloudTabsSection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = +[Application sharedApplication];
  id v3 = [v2 tabGroupManager];
  id v4 = [v3 profiles];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = *MEMORY[0x1E4F99688];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v9 isDefault])
        {
          uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        }
        else
        {
          id v11 = objc_alloc(MEMORY[0x1E4F98D38]);
          uint64_t v12 = [v9 identifier];
          uint64_t v13 = +[Application sharedApplication];
          id v14 = [v13 tabGroupManager];
          uint64_t v10 = (void *)[v11 initWithProfileIdentifier:v12 tabGroupManager:v14];
        }
        long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F98EB0]) initWithStorage:v10];
        [v15 setSectionIdentifier:v7 enabled:0];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

void __46__StartPageController__recentCloudTabsSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  uint64_t v5 = [v4 metadata];
  [v8 setMetadata:v5];

  uint64_t v6 = [v4 deviceLocationDescription];
  uint64_t v7 = [v4 icon];
  [v8 setCaptionText:v6 icon:v7];
}

- (id)_recentCloudTabsSectionWithDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_availableDevices;
  if ([(NSArray *)v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v7 = [(StartPageController *)self _recentItemsForDevice:v4];
    if ([(NSString *)self->_searchPattern length])
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __57__StartPageController__recentCloudTabsSectionWithDevice___block_invoke;
      void v20[3] = &unk_1E6D7F748;
      id v21 = WeakRetained;
      id v22 = self;
      uint64_t v8 = objc_msgSend(v7, "safari_filterObjectsUsingBlock:", v20);

      uint64_t v7 = (void *)v8;
    }
    if ([v7 count])
    {
      uint64_t v9 = NSString;
      uint64_t v10 = [v4 uuid];
      id v11 = [v9 stringWithFormat:@"%@-%@", *MEMORY[0x1E4F99688], v10];

      uint64_t v12 = (void *)MEMORY[0x1E4F98EA8];
      uint64_t v13 = [v4 disambiguatedName];
      id v14 = [v12 cardSectionWithIdentifier:v11 title:v13 actions:MEMORY[0x1E4F1CBF0] banner:0 identifiers:v7 configurationProvider:&__block_literal_global_254];

      objc_msgSend(v14, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 6, 0));
      [v14 setExpandsModally:1];
      long long v15 = [(StartPageController *)self _contextMenuConfigurationForRecentCloudTab];
      [v14 setContextMenuProvider:v15];

      long long v16 = [(StartPageController *)self _cloudTabsContextMenuCommitHandler];
      [v14 setContextMenuCommitHandler:v16];

      long long v17 = [(StartPageController *)self _cloudTabsContextMenuDismissHandler];
      [v14 setContextMenuDismissHandler:v17];

      long long v18 = [(StartPageController *)self _cloudTabsDragItemProvider];
      [v14 setDragItemProvider:v18];

      if (!self->_libraryType) {
        [(StartPageController *)self _setProfileIconOnSectionIfNeeded:v14];
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __57__StartPageController__recentCloudTabsSectionWithDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 cloudTab];
  uint64_t v5 = [v3 tabItem:v4 matchesSearchText:*(void *)(*(void *)(a1 + 40) + 152)];

  return v5;
}

void __57__StartPageController__recentCloudTabsSectionWithDevice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  uint64_t v5 = [v4 metadata];
  [v8 setMetadata:v5];

  uint64_t v6 = [v4 deviceLocationDescription];
  uint64_t v7 = [v4 icon];
  [v8 setCaptionText:v6 icon:v7];
}

- (id)_cloudTabsSectionWithDevice:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(StartPageController *)self _cloudTabDevices];
  if ([v5 count])
  {
    if (self->_libraryType)
    {
      int v31 = [v4 disambiguatedName];
    }
    else
    {
      uint64_t v7 = NSString;
      id v8 = _WBSLocalizedString();
      uint64_t v9 = [v4 disambiguatedName];
      int v31 = objc_msgSend(v7, "stringWithFormat:", v8, v9);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v11 = [v4 tabs];
    uint64_t v12 = [v11 reverseObjectEnumerator];
    uint64_t v13 = [v12 allObjects];

    if ([(NSString *)self->_searchPattern length])
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke;
      v35[3] = &unk_1E6D7F770;
      id v36 = WeakRetained;
      v37 = self;
      uint64_t v14 = objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v35);

      uint64_t v13 = (void *)v14;
    }
    if ([v13 count])
    {
      int v15 = [WeakRetained canShowSidebar];
      long long v16 = (void *)MEMORY[0x1E4F99688];
      if (v15 && !self->_libraryType)
      {
        id v19 = (id)*MEMORY[0x1E4F99688];
      }
      else
      {
        long long v17 = NSString;
        long long v18 = [v4 uuid];
        id v19 = [v17 stringWithFormat:@"%@-%@", *v16, v18];
      }
      if (self->_libraryType)
      {
        id v20 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v21 = [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
        v38[0] = v21;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      }
      id v22 = [MEMORY[0x1E4F98EA8] listSectionWithIdentifier:v19 title:v31 actions:v20 banner:0 identifiers:v13 configurationProvider:&__block_literal_global_264];
      uint64_t v6 = v22;
      if (v15) {
        uint64_t v23 = 8;
      }
      else {
        uint64_t v23 = 4;
      }
      [v22 setNumberOfRowsVisibleWhenCollapsed:v23];
      [v6 setExpandsModally:v15 ^ 1u];
      id v24 = [(StartPageController *)self _contextMenuConfigurationForCloudTabWithSelectedDevice:v4];
      [v6 setContextMenuProvider:v24];

      uint64_t v25 = [(StartPageController *)self _cloudTabsContextMenuCommitHandler];
      [v6 setContextMenuCommitHandler:v25];

      uint64_t v26 = [(StartPageController *)self _cloudTabsContextMenuDismissHandler];
      [v6 setContextMenuDismissHandler:v26];

      uint64_t v27 = [(StartPageController *)self _cloudTabsDragItemProvider];
      [v6 setDragItemProvider:v27];

      if (!self->_libraryType) {
        [(StartPageController *)self _setProfileIconOnSectionIfNeeded:v6];
      }
      if (v15 && !self->_libraryType && (unint64_t)[v5 count] >= 2)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_3;
        v32[3] = &unk_1E6D7F7E0;
        id v33 = v4;
        long long v34 = self;
        uint64_t v28 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v32);
        uint64_t v29 = [MEMORY[0x1E4FB1970] menuWithChildren:v28];
        [v6 setTitleMenu:v29];
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __51__StartPageController__cloudTabsSectionWithDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) tabItem:a2 matchesSearchText:*(void *)(*(void *)(a1 + 40) + 152)];
}

void __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = [a3 title];
  [v5 setTitle:v4];
}

id __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  if (*(id *)(a1 + 32) == v3)
  {
    id v8 = [v3 disambiguatedName];
    uint64_t v7 = [v5 actionWithTitle:v8 image:0 identifier:0 handler:&__block_literal_global_266];

    [v7 setState:1];
  }
  else
  {
    uint64_t v6 = [v3 disambiguatedName];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_5;
    v10[3] = &unk_1E6D79808;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v4;
    uint64_t v7 = [v5 actionWithTitle:v6 image:0 identifier:0 handler:v10];
  }
  return v7;
}

void __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_5(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v3 = *MEMORY[0x1E4F78778];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_6;
  v5[3] = &unk_1E6D7F7B8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(v2, "safari_modifyDictionaryForKey:block:", v3, v5);
}

void __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [*(id *)(a1 + 32) _lastCloudDeviceProfileKey];
  [v5 setObject:v3 forKeyedSubscript:v4];
}

- (id)_contextMenuConfigurationForRecentCloudTab
{
  return [(StartPageController *)self _contextMenuConfigurationForCloudTabWithSelectedDevice:0];
}

- (id)_cloudTabsContextMenuDismissHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__StartPageController__cloudTabsContextMenuDismissHandler__block_invoke;
  v4[3] = &unk_1E6D7F568;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)MEMORY[0x1E4E42950](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __58__StartPageController__cloudTabsContextMenuDismissHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 40);
    [v2 linkPreviewProviderWillDismissPreview];

    id WeakRetained = v3;
  }
}

- (id)_cloudTabsDragItemProvider
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__StartPageController__cloudTabsDragItemProvider__block_invoke;
  v4[3] = &unk_1E6D7F808;
  void v4[4] = self;
  id v2 = (void *)MEMORY[0x1E4E42950](v4, a2);
  return v2;
}

id __49__StartPageController__cloudTabsDragItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _cloudTabItemForIdentifier:a2];
  uint64_t v3 = (void *)MEMORY[0x1E4F28D78];
  id v4 = [v2 url];
  id v5 = [v2 title];
  id v6 = [v3 itemProviderWithURL:v4 title:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v6];
  return v7;
}

- (id)_cloudTabsContextMenuCommitHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke;
  v4[3] = &unk_1E6D7F830;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)MEMORY[0x1E4E42950](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  [v5 setPreferredCommitStyle:1];
  id v6 = [v5 previewViewController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke_2;
  v8[3] = &unk_1E6D79A60;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v9 = v6;
  id v7 = v6;
  [v5 addAnimations:v8];

  objc_destroyWeak(&v10);
}

void __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 40);
    [v3 commitLinkPreviewViewController:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (id)_cloudTabItemForIdentifier:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
  {
    uint64_t v4 = [v3 cloudTab];

    id v3 = (id)v4;
  }
  return v3;
}

- (id)_cloudTabDeviceForIdentifier:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
  {
    uint64_t v4 = [v3 device];

    id v3 = (id)v4;
  }
  return v3;
}

- (id)_contextMenuConfigurationForCloudTabWithSelectedDevice:(id)a3
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke;
  v6[3] = &unk_1E6D7F8D0;
  void v6[4] = self;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = (void *)MEMORY[0x1E4E42950](v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

id __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _cloudTabItemForIdentifier:v3];
  id v5 = [*(id *)(a1 + 32) _cloudTabDeviceForIdentifier:v3];
  id v6 = (void *)MEMORY[0x1E4FB1678];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_2;
  v18[3] = &unk_1E6D7F618;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  id v7 = v4;
  id v19 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_3;
  v13[3] = &unk_1E6D7F8A8;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v8 = v7;
  id v14 = v8;
  id v9 = v3;
  id v15 = v9;
  id v16 = v5;
  id v10 = v5;
  id v11 = [v6 configurationWithIdentifier:0 previewProvider:v18 actionProvider:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);

  return v11;
}

id __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
    uint64_t v4 = [v3 navigationIntentWithCloudTab:*(void *)(a1 + 32)];

    id v5 = objc_loadWeakRetained(WeakRetained + 40);
    id v6 = [v5 linkPreviewViewControllerForNavigationIntent:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_3(id *a1)
{
  void v59[2] = *MEMORY[0x1E4F143B8];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_4;
  v54[3] = &unk_1E6D7F858;
  objc_copyWeak(&v56, a1 + 7);
  id v55 = a1[4];
  id v36 = (void *)MEMORY[0x1E4E42950](v54);
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v37 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 40);
    id v35 = [v3 tabGroupProvider];

    uint64_t v4 = (void *)MEMORY[0x1E4FB13F0];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_5;
    v52[3] = &unk_1E6D79320;
    id v5 = v36;
    id v53 = v5;
    id v6 = objc_msgSend(v4, "_sf_openInNewTabActionWithHandler:", v52);
    v59[0] = v6;
    id v7 = [a1[4] url];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    void v50[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_6;
    v50[3] = &unk_1E6D79320;
    id v51 = v5;
    id v8 = [v35 openInTabGroupMenuWithNewTabGroupName:0 URL:v7 descendantCount:0 handler:v50];
    v59[1] = v8;
    long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];

    id v9 = (void *)MEMORY[0x1E4FB13F0];
    id v33 = _WBSLocalizedString();
    uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eyeglasses"];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_7;
    v48[3] = &unk_1E6D79830;
    id v49 = a1[4];
    v32 = (void *)v10;
    id v11 = [v9 actionWithTitle:v33 image:v10 identifier:0 handler:v48];
    v58[0] = v11;
    uint64_t v12 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v13 = _WBSLocalizedString();
    id v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_8;
    v46[3] = &unk_1E6D79830;
    id v47 = a1[4];
    id v15 = [v12 actionWithTitle:v13 image:v14 identifier:0 handler:v46];
    v58[1] = v15;
    id v16 = (void *)MEMORY[0x1E4FB13F0];
    id v17 = _WBSLocalizedString();
    long long v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_9;
    v42[3] = &unk_1E6D7F880;
    objc_copyWeak(&v45, a1 + 7);
    id v43 = a1[4];
    id v44 = a1[5];
    id v19 = [v16 actionWithTitle:v17 image:v18 identifier:0 handler:v42];
    v58[2] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:3];

    if ([a1[6] isCloseRequestSupported])
    {
      id v21 = (void *)MEMORY[0x1E4FB13F0];
      id v22 = _WBSLocalizedString();
      uint64_t v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      void v38[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_10;
      v38[3] = &unk_1E6D7F880;
      objc_copyWeak(&v41, a1 + 7);
      id v39 = a1[4];
      id v40 = a1[6];
      id v24 = [v21 actionWithTitle:v22 image:v23 identifier:0 handler:v38];

      [v24 setAttributes:2];
      uint64_t v25 = [v20 arrayByAddingObject:v24];

      objc_destroyWeak(&v41);
      id v20 = (void *)v25;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4FB1970];
    uint64_t v27 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v34];
    v57[0] = v27;
    uint64_t v28 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v20];
    v57[1] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    uint64_t v30 = [v26 menuWithTitle:&stru_1F3C268E8 children:v29];

    objc_destroyWeak(&v45);
  }
  else
  {
    uint64_t v30 = 0;
  }

  objc_destroyWeak(&v56);
  return v30;
}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v5 = objc_loadWeakRetained(WeakRetained + 40);
    id v6 = [MEMORY[0x1E4F78598] builder];
    [v6 setPrefersOpenInNewTab:1];
    [v6 setPreferredTabOrder:a2];
    id v7 = [v6 navigationIntentWithCloudTab:*(void *)(a1 + 32)];
    [v5 handleNavigationIntent:v7 completion:0];
    if ([v7 shouldOrderToForeground])
    {
      id v8 = [v5 tabGroupProvider];
      [v8 removeSingleBlankTabFromActiveTabGroup];
    }
    id WeakRetained = v9;
  }
}

uint64_t __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_7(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F3AED0] defaultReadingList];
  id v2 = [*(id *)(a1 + 32) url];
  id v3 = [*(id *)(a1 + 32) title];
  [v4 addReadingListItemWithURL:v2 title:v3 previewText:0 error:0];
}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) url];
  v1 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v1 setURL:v2];
}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_9(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    id v4 = [*(id *)(a1 + 32) url];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v6 = (void *)[v3 initWithActivityItems:v5 applicationActivities:0];

    [WeakRetained[41] presentViewController:v6 fromItemWithIdentifier:*(void *)(a1 + 40)];
  }
}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained _cloudTabStore];
    [v3 closeTab:*(void *)(a1 + 32) onDevice:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (id)_lastCloudDeviceProfileKey
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v3 = [WeakRetained activeProfileIdentifier];
  id v4 = v3;
  if (!v3) {
    id v3 = &stru_1F3C268E8;
  }
  id v5 = v3;

  return v5;
}

- (id)_selectedCloudTabsDevice
{
  id v3 = [(StartPageController *)self _cloudTabDevices];
  if ([v3 count])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v5 = *MEMORY[0x1E4F78778];
    id v6 = [v4 stringForKey:*MEMORY[0x1E4F78778]];
    id v7 = v6;
    if (v6)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __47__StartPageController__selectedCloudTabsDevice__block_invoke;
      v18[3] = &unk_1E6D7F8F8;
      id v19 = v6;
      objc_msgSend(v4, "safari_modifyDictionaryForKey:block:", v5, v18);
    }
    id v8 = [v4 dictionaryForKey:v5];
    id v9 = [(StartPageController *)self _lastCloudDeviceProfileKey];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (!v10) {
      goto LABEL_6;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__StartPageController__selectedCloudTabsDevice__block_invoke_2;
    v16[3] = &unk_1E6D7F920;
    id v17 = v10;
    objc_msgSend(v3, "safari_firstObjectPassingTest:", v16);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_6:
      uint64_t v12 = [v3 objectAtIndexedSubscript:0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__StartPageController__selectedCloudTabsDevice__block_invoke_3;
      v14[3] = &unk_1E6D7F7B8;
      void v14[4] = self;
      id v11 = v12;
      id v15 = v11;
      objc_msgSend(v4, "safari_modifyDictionaryForKey:block:", v5, v14);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __47__StartPageController__selectedCloudTabsDevice__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F980C8]];
}

uint64_t __47__StartPageController__selectedCloudTabsDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

void __47__StartPageController__selectedCloudTabsDevice__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 40) uuid];
  uint64_t v4 = [*(id *)(a1 + 32) _lastCloudDeviceProfileKey];
  [v5 setObject:v3 forKeyedSubscript:v4];
}

uint64_t __45__StartPageController__suggestionsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 328) reloadDataAnimatingDifferences:1];
}

- (void)_cloudTabsConsentStateDidChange:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F97EA0], "is2024CloudTabsEnabled", a3))
  {
    [(StartPageController *)self _updateRecentCloudTabsSection];
    recentsStore = self->_recentsStore;
    [(WBSRecentsStore *)recentsStore fetchMetadata];
  }
}

- (void)_recentCloudTabItemsDidReceiveMetadata:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F97EA0], "is2024CloudTabsEnabled", a3))
  {
    objc_initWeak(&location, self);
    [(NSTimer *)self->_coalescedRecentCloudTabsSectionUpdateTimer invalidate];
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB00];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __62__StartPageController__recentCloudTabItemsDidReceiveMetadata___block_invoke;
    v7[3] = &unk_1E6D7D060;
    objc_copyWeak(&v8, &location);
    id v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:1.0];
    coalescedRecentCloudTabsSectionUpdateTimer = self->_coalescedRecentCloudTabsSectionUpdateTimer;
    self->_coalescedRecentCloudTabsSectionUpdateTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __62__StartPageController__recentCloudTabItemsDidReceiveMetadata___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateRecentCloudTabsSection];
}

- (id)_recentItemsForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  if (v5)
  {
    recentItemsByDeviceUUID = self->_recentItemsByDeviceUUID;
    if (!recentItemsByDeviceUUID)
    {
      id v7 = [MEMORY[0x1E4F1CA60] dictionary];
      id v8 = self->_recentItemsByDeviceUUID;
      self->_recentItemsByDeviceUUID = v7;

      recentItemsByDeviceUUID = self->_recentItemsByDeviceUUID;
    }
    id v9 = [(NSMutableDictionary *)recentItemsByDeviceUUID objectForKeyedSubscript:v5];
    if (!v9)
    {
      recentItems = self->_recentItems;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __45__StartPageController__recentItemsForDevice___block_invoke;
      v14[3] = &unk_1E6D7F948;
      id v11 = v5;
      id v15 = v11;
      uint64_t v12 = [(NSArray *)recentItems safari_filterObjectsUsingBlock:v14];
      [(NSMutableDictionary *)self->_recentItemsByDeviceUUID setObject:v12 forKeyedSubscript:v11];

      id v9 = [(NSMutableDictionary *)self->_recentItemsByDeviceUUID objectForKeyedSubscript:v11];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

uint64_t __45__StartPageController__recentItemsForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  id v4 = [v3 uuid];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)_siriSuggestionsSection
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] & 1) != 0
    || ![(NSArray *)self->_siriSuggestions count])
  {
    id v7 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x1E4F98EA8];
    id v4 = [MEMORY[0x1E4F98930] toggleSectionExpandedAction];
    v18[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    siriSuggestions = self->_siriSuggestions;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__StartPageController__siriSuggestionsSection__block_invoke;
    v15[3] = &unk_1E6D7F970;
    objc_copyWeak(&v16, &location);
    id v7 = [v3 cardSectionWithIdentifier:*MEMORY[0x1E4F996E8] actions:v5 banner:0 identifiers:siriSuggestions configurationProvider:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_2;
    v13[3] = &unk_1E6D7F998;
    objc_copyWeak(&v14, &location);
    [v7 setContextMenuProvider:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_7;
    v11[3] = &unk_1E6D7F9C0;
    objc_copyWeak(&v12, &location);
    [v7 setContextMenuCommitHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_9;
    v9[3] = &unk_1E6D7F568;
    objc_copyWeak(&v10, &location);
    [v7 setContextMenuDismissHandler:v9];
    [v7 setDragItemProvider:&__block_literal_global_284];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __46__StartPageController__siriSuggestionsSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = [v5 appIcon];
    [v16 setBadge:v7];

    [WeakRetained _setLeadImageForCard:v16 withRecommendation:v5];
    id v8 = titleForSiriSuggestion(v5);
    [v16 setTitle:v8];

    id v9 = v5;
    id v10 = [v9 pageURL];
    id v11 = objc_msgSend(v10, "safari_highLevelDomain");

    if ([v11 length])
    {
      id v12 = v11;
    }
    else
    {
      uint64_t v13 = [v9 pageURL];
      id v12 = [v13 absoluteString];
    }
    [v16 setSubtitle:v12];

    id v14 = [v9 footnote];
    id v15 = [v9 sourceIcon];
    [v16 setCaptionText:v14 icon:v15];
  }
}

id __46__StartPageController__siriSuggestionsSection__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB1678];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_3;
  v12[3] = &unk_1E6D7F618;
  a1 += 4;
  objc_copyWeak(&v14, a1);
  id v5 = v3;
  id v13 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_4;
  v9[3] = &unk_1E6D7F4F0;
  objc_copyWeak(&v11, a1);
  id v10 = v5;
  id v6 = v5;
  id v7 = [v4 configurationWithIdentifier:0 previewProvider:v12 actionProvider:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  return v7;
}

id __46__StartPageController__siriSuggestionsSection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
    id v4 = [*(id *)(a1 + 32) pageURL];
    id v5 = [v3 navigationIntentWithURL:v4];

    id v6 = objc_loadWeakRetained(WeakRetained + 40);
    id v7 = [v6 linkPreviewViewControllerForNavigationIntent:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __46__StartPageController__siriSuggestionsSection__block_invoke_4(uint64_t a1)
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1E4FB1970];
    id v24 = [WeakRetained _openMenuElementsForSiriSuggestion:*(void *)(a1 + 32)];
    id v22 = objc_msgSend(v4, "menuWithTitle:image:identifier:options:children:", &stru_1F3C268E8, 0, 0, 1);
    v35[0] = v22;
    id v5 = (void *)MEMORY[0x1E4FB1970];
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v28 = _WBSLocalizedString();
    uint64_t v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eyeglasses"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_5;
    v31[3] = &unk_1E6D79830;
    id v32 = *(id *)(a1 + 32);
    id v21 = (void *)v7;
    uint64_t v25 = [v6 actionWithTitle:v28 image:v7 identifier:0 handler:v31];
    v34[0] = v25;
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v27 = _WBSLocalizedString();
    uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_6;
    v29[3] = &unk_1E6D79830;
    id v30 = *(id *)(a1 + 32);
    uint64_t v23 = (void *)v9;
    uint64_t v26 = [v8 actionWithTitle:v27 image:v9 identifier:0 handler:v29];
    v34[1] = v26;
    id v10 = [v3 _shareActionForSiriSuggestion:*(void *)(a1 + 32)];
    v34[2] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    id v12 = [v5 menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v11];
    v35[1] = v12;
    id v13 = (void *)MEMORY[0x1E4FB1970];
    id v14 = [v3 _downvoteActionForSiriSuggestion:*(void *)(a1 + 32)];
    v33[0] = v14;
    id v15 = [v3 _banActionForSiriSuggestion:*(void *)(a1 + 32)];
    v33[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    id v17 = [v13 menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v16];
    v35[2] = v17;
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    id v19 = [v4 menuWithTitle:&stru_1F3C268E8 children:v18];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __46__StartPageController__siriSuggestionsSection__block_invoke_5(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F3AED0] defaultReadingList];
  id v2 = [*(id *)(a1 + 32) pageURL];
  id v3 = [*(id *)(a1 + 32) title];
  [v4 addReadingListItemWithURL:v2 title:v3 previewText:0 error:0];
}

void __46__StartPageController__siriSuggestionsSection__block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pageURL];
  v1 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v1 setURL:v2];
}

void __46__StartPageController__siriSuggestionsSection__block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setReadingListRecommendationAsReadWithRecommendation:v6];
    [v7 setPreferredCommitStyle:1];
    id v10 = [v7 previewViewController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_8;
    v12[3] = &unk_1E6D791E8;
    void v12[4] = v9;
    id v13 = v10;
    id v11 = v10;
    [v7 addAnimations:v12];
  }
}

void __46__StartPageController__siriSuggestionsSection__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 320));
  [WeakRetained commitLinkPreviewViewController:*(void *)(a1 + 40)];
}

void __46__StartPageController__siriSuggestionsSection__block_invoke_9(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 40);
    [v2 linkPreviewProviderWillDismissPreview];

    id WeakRetained = v3;
  }
}

id __46__StartPageController__siriSuggestionsSection__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1710]), "_sf_initWithSiriSuggestion:", v2);

  return v3;
}

- (void)_setLeadImageForCard:(id)a3 withRecommendation:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4FB60E0]);
  id v8 = titleForSiriSuggestion(v6);
  uint64_t v9 = [v6 pageURL];
  id v10 = objc_msgSend(v9, "safari_originalDataAsString");
  id v11 = [(WebBookmarkCollection *)self->_bookmarkCollection configuration];
  id v12 = objc_msgSend(v7, "initWithTitle:address:collectionType:", v8, v10, objc_msgSend(v11, "collectionType"));

  [v16 setImageFromBookmark:v12];
  if ([v6 prefersLeadImage]
    && ([v6 image], id v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    id v14 = [v6 image];
    [v16 setImage:v14];
  }
  else
  {
    id v15 = [v6 imageURL];

    if (v15) {
      [(StartPageController *)self _requestLeadImageForRecommendation:v6];
    }
  }
}

- (void)_requestLeadImageForRecommendation:(id)a3
{
  id v4 = a3;
  if (!self->_siriSuggestionsMetadataTokens)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    siriSuggestionsMetadataTokens = self->_siriSuggestionsMetadataTokens;
    self->_siriSuggestionsMetadataTokens = v5;
  }
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4F98C00];
  id v8 = [v4 imageURL];
  uint64_t v9 = [v7 requestWithURL:v8];

  id v10 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__StartPageController__requestLeadImageForRecommendation___block_invoke;
  v13[3] = &unk_1E6D7FA30;
  objc_copyWeak(&v15, &location);
  id v11 = v4;
  id v14 = v11;
  id v12 = [v10 registerRequest:v9 priority:2 responseHandler:v13];

  [(NSMutableArray *)self->_siriSuggestionsMetadataTokens addObject:v12];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __58__StartPageController__requestLeadImageForRecommendation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [v3 thumbnail];
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)WeakRetained[41];
      uint64_t v8 = *(void *)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__StartPageController__requestLeadImageForRecommendation___block_invoke_2;
      v9[3] = &unk_1E6D7FA08;
      id v10 = v5;
      [v7 configureModelWithIdentifier:v8 usingBlock:v9];
    }
  }
}

uint64_t __58__StartPageController__requestLeadImageForRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setImage:*(void *)(a1 + 32)];
}

- (id)_openMenuElementsForSiriSuggestion:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke;
  v21[3] = &unk_1E6D7F858;
  objc_copyWeak(&v23, &location);
  id v5 = v4;
  id v22 = v5;
  id v6 = (void *)MEMORY[0x1E4E42950](v21);
  id v7 = (void *)MEMORY[0x1E4FB13F0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_2;
  v19[3] = &unk_1E6D79320;
  id v8 = v6;
  id v20 = v8;
  uint64_t v9 = objc_msgSend(v7, "_sf_openInNewTabActionWithHandler:", v19);
  v25[0] = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v11 = [WeakRetained tabGroupProvider];
  id v12 = [v5 pageURL];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_3;
  v17[3] = &unk_1E6D79320;
  id v13 = v8;
  id v18 = v13;
  id v14 = [v11 openInTabGroupMenuWithNewTabGroupName:0 URL:v12 descendantCount:0 handler:v17];
  v25[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v15;
}

void __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [MEMORY[0x1E4F78598] builder];
    [v4 setPrefersOpenInNewTab:1];
    [v4 setPreferredTabOrder:a2];
    id v5 = [*(id *)(a1 + 32) pageURL];
    id v6 = [v4 navigationIntentWithURL:v5];

    id v7 = [WeakRetained dataSource];
    [v7 handleNavigationIntent:v6 completion:0];

    [WeakRetained _setReadingListRecommendationAsReadWithRecommendation:*(void *)(a1 + 32)];
    if (a2 == 1)
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 40);
      uint64_t v9 = [v8 tabGroupProvider];
      [v9 removeSingleBlankTabFromActiveTabGroup];
    }
  }
}

uint64_t __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_shareActionForHighlight:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = _WBSLocalizedString();
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__StartPageController__shareActionForHighlight___block_invoke;
  v11[3] = &unk_1E6D7D3A0;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v5 actionWithTitle:v6 image:v7 identifier:0 handler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __48__StartPageController__shareActionForHighlight___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    id v4 = [*(id *)(a1 + 32) resourceURL];
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = (void *)[v3 initWithActivityItems:v5 applicationActivities:0];

    id v7 = [WeakRetained viewController];
    [v7 presentViewController:v6 fromItemWithIdentifier:*(void *)(a1 + 32)];
  }
}

- (id)_shareActionForSiriSuggestion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = _WBSLocalizedString();
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__StartPageController__shareActionForSiriSuggestion___block_invoke;
  v11[3] = &unk_1E6D7D3A0;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v5 actionWithTitle:v6 image:v7 identifier:0 handler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __53__StartPageController__shareActionForSiriSuggestion___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    id v4 = [*(id *)(a1 + 32) pageURL];
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = (void *)[v3 initWithActivityItems:v5 applicationActivities:0];

    id v7 = [WeakRetained viewController];
    [v7 presentViewController:v6 fromItemWithIdentifier:*(void *)(a1 + 32)];
  }
}

- (id)_downvoteActionForSiriSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 source];
  id v6 = WBSForYouLinkRecommendationSourceDownvoteActionTitle();
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsdown"];
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4FB13F0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke;
  v11[3] = &unk_1E6D7FA78;
  objc_copyWeak(v12, &location);
  v12[1] = v5;
  uint64_t v9 = [v8 actionWithTitle:v6 image:v7 identifier:0 handler:v11];
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

  return v9;
}

void __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 12) downvoteSource:*(void *)(a1 + 40) postingChangeNotificationWhenDone:0];
    id v4 = (void *)v3[11];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke_2;
    v6[3] = &__block_descriptor_40_e37_B16__0__WBSForYouLinkRecommendation_8l;
    void v6[4] = *(void *)(a1 + 40);
    id v5 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", v6);
    [v3 _setSiriSuggestions:v5];
  }
}

BOOL __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 source] == *(void *)(a1 + 32);
}

- (id)_banActionForSiriSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = _WBSLocalizedString();
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsdown"];
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4FB13F0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__StartPageController__banActionForSiriSuggestion___block_invoke;
  v11[3] = &unk_1E6D7D3A0;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v7 actionWithTitle:v5 image:v6 identifier:0 handler:v11];
  [v9 setAttributes:2];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __51__StartPageController__banActionForSiriSuggestion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[12];
    id v5 = [*(id *)(a1 + 32) pageURL];
    [v4 banURLsOfSameDomainAsURL:v5 postingChangeNotificationWhenDone:0];

    id v6 = [*(id *)(a1 + 32) pageURL];
    id v7 = objc_msgSend(v6, "safari_userVisibleHostWithoutWWWSubdomain");
    id v8 = [v7 lowercaseString];

    uint64_t v9 = (void *)v3[11];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __51__StartPageController__banActionForSiriSuggestion___block_invoke_2;
    v12[3] = &unk_1E6D7FAA0;
    id v10 = v8;
    id v13 = v10;
    id v11 = objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v12);
    [v3 _setSiriSuggestions:v11];
  }
}

uint64_t __51__StartPageController__banActionForSiriSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 pageURL];
  id v4 = objc_msgSend(v3, "safari_userVisibleHostWithoutWWWSubdomain");
  id v5 = [v4 lowercaseString];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v6;
}

- (void)_setReadingListRecommendationAsReadWithRecommendation:(id)a3
{
  id v6 = a3;
  if ([v6 source] == 1)
  {
    id v4 = [v6 sourceID];
    if ([v4 length])
    {
      id v5 = [(WebBookmarkCollection *)self->_bookmarkCollection bookmarkWithUUID:v4];
      if (v5) {
        -[WebBookmarkCollection markReadingListBookmark:asRead:postNotification:](self->_bookmarkCollection, v5, 1, 1);
      }
    }
  }
}

- (void)_setSiriSuggestions:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_siriSuggestions, "isEqual:") & 1) == 0)
  {
    id v4 = (NSArray *)[v6 copy];
    siriSuggestions = self->_siriSuggestions;
    self->_siriSuggestions = v4;

    [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
  }
}

- (void)_updateSiriSuggestionsMediator
{
  if (!self->_siriSuggestionsMediator)
  {
    id v3 = +[Application sharedApplication];
    id v4 = [v3 createRecommendationMediatorOrReuseExistingOneIfPossible];
    siriSuggestionsMediator = self->_siriSuggestionsMediator;
    self->_siriSuggestionsMediator = v4;
  }
  if ([(SFStartPageViewController *)self->_viewController isShowingRootView])
  {
    objc_initWeak(&location, self);
    [(WBSForYouRecommendationMediator *)self->_siriSuggestionsMediator beginListeningForURLSuggestionChanges];
    id v6 = +[History sharedHistory];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __53__StartPageController__updateSiriSuggestionsMediator__block_invoke;
    v8[3] = &unk_1E6D79768;
    objc_copyWeak(&v9, &location);
    [v6 performBlockAfterHistoryHasLoaded:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = self->_siriSuggestionsMediator;
    [(WBSForYouRecommendationMediator *)v7 stopListeningForURLSuggestionChanges];
  }
}

void __53__StartPageController__updateSiriSuggestionsMediator__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__StartPageController__updateSiriSuggestionsMediator__block_invoke_2;
  block[3] = &unk_1E6D79768;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __53__StartPageController__updateSiriSuggestionsMediator__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshSiriSuggestions];
}

- (void)_refreshSiriSuggestions
{
  if (([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] & 1) != 0
    || ([MEMORY[0x1E4F98E40] areLocalSiriSuggestionsEnabled] & 1) == 0)
  {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [(StartPageController *)self _setSiriSuggestions:v6];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __46__StartPageController__refreshSiriSuggestions__block_invoke;
    id v10 = &unk_1E6D79D90;
    objc_copyWeak(&v11, &location);
    id v3 = (void *)MEMORY[0x1E4E42950](&v7);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    char v5 = objc_msgSend(WeakRetained, "getContextForCurrentPageWithCompletionHandler:", v3, v7, v8, v9, v10);

    if ((v5 & 1) == 0) {
      [(StartPageController *)self _updateRecommendationsForAllTopics];
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __46__StartPageController__refreshSiriSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__StartPageController__refreshSiriSuggestions__block_invoke_2;
  v5[3] = &unk_1E6D79A60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __46__StartPageController__refreshSiriSuggestions__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = [v3 results];
      char v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_303_0);

      if ([v5 count])
      {
        id v6 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v7 = 134217984;
          uint64_t v8 = [v5 count];
          _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Obtained %ld ContextKit topics related to the current page.", (uint8_t *)&v7, 0xCu);
        }

        [WeakRetained _updateRecommendationsForTopics:v5];
      }
      else
      {
        [WeakRetained _updateRecommendationsForAllTopics];
      }
    }
    else
    {
      [WeakRetained _updateRecommendationsForAllTopics];
    }
  }
}

id __46__StartPageController__refreshSiriSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 title];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F98B28]);
    id v6 = [v2 title];
    int v7 = [v2 topicId];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = (void *)[v5 initWithTitle:v6 identifier:v7 relevancyDate:v8 source:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_updateRecommendationsForAllTopics
{
  objc_initWeak(&location, self);
  siriSuggestionsMediator = self->_siriSuggestionsMediator;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__StartPageController__updateRecommendationsForAllTopics__block_invoke;
  v4[3] = &unk_1E6D7FAE8;
  objc_copyWeak(&v5, &location);
  [(WBSForYouRecommendationMediator *)siriSuggestionsMediator updatedTopicsWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__StartPageController__updateRecommendationsForAllTopics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateRecommendationsForTopics:v3];
}

- (void)_updateRecommendationsForTopics:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  siriSuggestionsMediator = self->_siriSuggestionsMediator;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__StartPageController__updateRecommendationsForTopics___block_invoke;
  v6[3] = &unk_1E6D7FAE8;
  objc_copyWeak(&v7, &location);
  [(ForYouRecommendationMediator *)siriSuggestionsMediator updatedRecommendationsForTopics:v4 withCompletionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__StartPageController__updateRecommendationsForTopics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__StartPageController__updateRecommendationsForTopics___block_invoke_2;
  v5[3] = &unk_1E6D79A60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __55__StartPageController__updateRecommendationsForTopics___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained _setSiriSuggestions:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 32) count]) {
      [WeakRetained _fetchHandoffResult];
    }
  }
}

- (void)_fetchHandoffResult
{
  objc_initWeak(&location, self);
  siriSuggestionsMediator = self->_siriSuggestionsMediator;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__StartPageController__fetchHandoffResult__block_invoke;
  v4[3] = &unk_1E6D7FB30;
  objc_copyWeak(&v5, &location);
  [(WBSForYouRecommendationMediator *)siriSuggestionsMediator retrieveHandoffRecommendationWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__StartPageController__fetchHandoffResult__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__StartPageController__fetchHandoffResult__block_invoke_2;
    v4[3] = &unk_1E6D79A60;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    objc_destroyWeak(&v6);
  }
}

void __42__StartPageController__fetchHandoffResult__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = (void *)[WeakRetained[11] mutableCopy];
    objc_msgSend(v3, "safari_removeObjectsPassingTest:", &__block_literal_global_308);
    [v3 addObject:*(void *)(a1 + 32)];
    [v4 _setSiriSuggestions:v3];

    id WeakRetained = v4;
  }
}

BOOL __42__StartPageController__fetchHandoffResult__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 source] == 3;
}

void __41__StartPageController__highlightsSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v24 = a3;
  objc_opt_class();
  LOBYTE(a3) = objc_opt_isKindOfClass();
  id v6 = v24;
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    uint64_t v9 = 0;
    id v10 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v6;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    id v8 = 0;
    if (*(unsigned char *)(a1 + 64)) {
      objc_msgSend(*(id *)(a1 + 32), "attributionViewForSuggestion:", v6, v24);
    }
    else {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "attributionViewForHighlight:", v12, v24);
    }
    id v10 = v12;
  }
  uint64_t v25 = v10;
  [v5 setHighlight:v24];
  [v5 setAttributionView:v9];
  id v13 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v5 setRelativeDateString:&stru_1F3C268E8];
  if (v8)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v15 = [v8 address];
    id v16 = (void *)[v14 initWithString:v15];

    [v13 setOriginalURL:v16];
    [v13 setURL:v16];
    id v17 = [v8 title];
    [v13 setTitle:v17];

    id v18 = *(void **)(*(void *)(a1 + 48) + 264);
    id v19 = [v8 historyItem];
    id v20 = [v19 lastVisitedDate];
    id v21 = objc_msgSend(v18, "safari_suggestionsLocalizedStringRelativeToNowForDate:", v20);
    [v5 setRelativeDateString:v21];
  }
  [v5 setMetadata:v13];
  if (*(unsigned char *)(a1 + 64))
  {
    id v22 = *(void **)(a1 + 32);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    void v33[2] = __41__StartPageController__highlightsSection__block_invoke_2;
    v33[3] = &unk_1E6D7FB58;
    id v34 = v8;
    id v35 = v5;
    [v22 fetchMetadataForSuggestion:v6 completionHandler:v33];
  }
  else
  {
    id v23 = *(void **)(a1 + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __41__StartPageController__highlightsSection__block_invoke_3;
    v26[3] = &unk_1E6D7FBA8;
    objc_copyWeak(&v31, (id *)(a1 + 56));
    id v27 = *(id *)(a1 + 40);
    id v28 = v25;
    char v32 = *(unsigned char *)(a1 + 65);
    id v29 = v9;
    id v30 = v5;
    [v23 fetchMetadataForHighlight:v28 completionHandler:v26];

    objc_destroyWeak(&v31);
  }
}

void __41__StartPageController__highlightsSection__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = [v3 title];
      uint64_t v5 = [v4 length];

      if (v5)
      {
        id v6 = [*(id *)(a1 + 32) title];
        [v7 setTitle:v6];
      }
      else
      {
        id v6 = [v7 title];
        [*(id *)(a1 + 32) setTitle:v6];
      }
    }
    [*(id *)(a1 + 40) setMetadata:v7];
  }
}

void __41__StartPageController__highlightsSection__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__StartPageController__highlightsSection__block_invoke_4;
    v9[3] = &unk_1E6D7FB80;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    char v14 = *(unsigned char *)(a1 + 72);
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    id v6 = (void (**)(void, void))MEMORY[0x1E4E42950](v9);
    id v7 = [*(id *)(a1 + 56) highlight];
    int v8 = WBSIsEqual();

    if (v8) {
      v6[2](v6, *(void *)(a1 + 56));
    }
    else {
      [v5[41] configureModelWithIdentifier:*(void *)(a1 + 40) usingBlock:v6];
    }
  }
}

void __41__StartPageController__highlightsSection__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) sendFeedbackForHighlight:*(void *)(a1 + 40) withType:0 inPrivateBrowsing:*(unsigned __int8 *)(a1 + 64)];
  [v3 setMetadata:*(void *)(a1 + 48)];
  [v3 setHighlight:*(void *)(a1 + 40)];
  [v3 setAttributionView:*(void *)(a1 + 56)];
}

id __41__StartPageController__highlightsSection__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [*(id *)(a1 + 32) _contextMenuConfigurationForFrequentlyVisitedSite:v5 previewProvider:v6];
  }
  else
  {
    id v8 = v5;
    uint64_t v9 = (void *)MEMORY[0x1E4FB1678];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __41__StartPageController__highlightsSection__block_invoke_6;
    v18[3] = &unk_1E6D7F618;
    objc_copyWeak(&v20, (id *)(a1 + 48));
    id v10 = v8;
    id v19 = v10;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__StartPageController__highlightsSection__block_invoke_7;
    v13[3] = &unk_1E6D7FC48;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    id v14 = v10;
    id v15 = *(id *)(a1 + 40);
    char v17 = *(unsigned char *)(a1 + 56);
    id v11 = v10;
    id v7 = [v9 configurationWithIdentifier:0 previewProvider:v18 actionProvider:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v20);
  }

  return v7;
}

id __41__StartPageController__highlightsSection__block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F78598] builder];
    id v4 = [v3 navigationIntentWithHighlight:*(void *)(a1 + 32)];

    id v5 = objc_loadWeakRetained(WeakRetained + 40);
    id v6 = [v5 linkPreviewViewControllerForNavigationIntent:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __41__StartPageController__highlightsSection__block_invoke_7(uint64_t a1, void *a2)
{
  v83[2] = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x1E4FB13F0];
    id v4 = _WBSLocalizedString();
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __41__StartPageController__highlightsSection__block_invoke_8;
    v69[3] = &unk_1E6D79830;
    id v70 = *(id *)(a1 + 32);
    BOOL v42 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v69];

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __41__StartPageController__highlightsSection__block_invoke_9;
    v64[3] = &unk_1E6D7FBF8;
    objc_copyWeak(&v67, (id *)(a1 + 48));
    id v65 = *(id *)(a1 + 32);
    id v66 = *(id *)(a1 + 40);
    char v68 = *(unsigned char *)(a1 + 56);
    id v39 = (void *)MEMORY[0x1E4E42950](v64);
    id v6 = objc_loadWeakRetained(WeakRetained + 40);
    id v7 = [v6 tabGroupProvider];
    id v8 = WBSURLForHighlight();
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __41__StartPageController__highlightsSection__block_invoke_10;
    v62[3] = &unk_1E6D79320;
    id v9 = v39;
    id v63 = v9;
    id v43 = [v7 openInTabGroupMenuWithNewTabGroupName:0 URL:v8 descendantCount:0 handler:v62];

    id v10 = (void *)MEMORY[0x1E4FB13F0];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __41__StartPageController__highlightsSection__block_invoke_11;
    void v60[3] = &unk_1E6D79320;
    id v11 = v9;
    id v61 = v11;
    id v12 = objc_msgSend(v10, "_sf_openInNewTabActionWithHandler:", v60);
    int v38 = v11;
    v83[0] = v12;
    v83[1] = v43;
    id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];

    id v13 = (void *)MEMORY[0x1E4FB1970];
    v82 = v42;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
    id v40 = [v13 menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v14];

    id v41 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v44];
    uint64_t v54 = 0;
    id v55 = &v54;
    uint64_t v56 = 0x3032000000;
    id v57 = __Block_byref_object_copy__18;
    id v58 = __Block_byref_object_dispose__18;
    id v59 = 0;
    id v15 = [WeakRetained viewController];
    uint64_t v16 = *(void *)(a1 + 32);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __41__StartPageController__highlightsSection__block_invoke_321;
    v53[3] = &unk_1E6D7FC20;
    v53[4] = &v54;
    [v15 configureModelWithIdentifier:v16 usingBlock:v53];

    char v17 = (void *)MEMORY[0x1E4F1CA48];
    id v18 = [WeakRetained _shareActionForHighlight:*(void *)(a1 + 32)];
    id v47 = [v17 arrayWithObject:v18];

    id v19 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)v55[5];
    uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v81 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v24 = [v23 identifier];
          uint64_t v76 = 0;
          v77 = &v76;
          uint64_t v78 = 0x2020000000;
          uint64_t v25 = (id *)getSLHideContextMenuIdentifierSymbolLoc(void)::ptr;
          uint64_t v79 = getSLHideContextMenuIdentifierSymbolLoc(void)::ptr;
          if (!getSLHideContextMenuIdentifierSymbolLoc(void)::ptr)
          {
            uint64_t v71 = MEMORY[0x1E4F143A8];
            uint64_t v72 = 3221225472;
            long long v73 = ___ZL39getSLHideContextMenuIdentifierSymbolLocv_block_invoke;
            v74 = &unk_1E6D79088;
            id v75 = &v76;
            uint64_t v26 = (void *)SocialLayerLibrary();
            id v27 = dlsym(v26, "SLHideContextMenuIdentifier");
            *(void *)(v75[1] + 24) = v27;
            getSLHideContextMenuIdentifierSymbolLoc(void)::ptr = *(void *)(v75[1] + 24);
            uint64_t v25 = (id *)v77[3];
          }
          _Block_object_dispose(&v76, 8);
          if (!v25)
          {
            dlerror();
            abort_report_np();
            __break(1u);
          }
          id v28 = *v25;
          int v29 = [v24 isEqualToString:v28];

          id v30 = v19;
          if (v29)
          {
            id v31 = _WBSLocalizedString();
            [v23 setTitle:v31];

            id v30 = v47;
          }
          [v30 addObject:v23];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v81 count:16];
      }
      while (v20);
    }

    char v32 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v19];
    id v33 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v47];
    id v34 = (void *)MEMORY[0x1E4FB1970];
    v80[0] = v40;
    v80[1] = v41;
    v80[2] = v32;
    v80[3] = v33;
    id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:4];
    id v36 = [v34 menuWithTitle:&stru_1F3C268E8 children:v35];

    _Block_object_dispose(&v54, 8);
    objc_destroyWeak(&v67);
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

void __41__StartPageController__highlightsSection__block_invoke_8()
{
  WBSURLForHighlight();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v0 setURL:v1];
}

void __41__StartPageController__highlightsSection__block_invoke_9(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v5 = [MEMORY[0x1E4F78598] builder];
    [v5 setPrefersOpenInNewTab:1];
    [v5 setPreferredTabOrder:a2];
    id v6 = [v5 navigationIntentWithHighlight:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) sendFeedbackForHighlight:*(void *)(a1 + 32) withType:1 inPrivateBrowsing:*(unsigned __int8 *)(a1 + 56)];
    id v7 = objc_loadWeakRetained(v9 + 40);
    [v7 dispatchNavigationIntent:v6];
    if (a2 == 1)
    {
      id v8 = [v7 tabGroupProvider];
      [v8 removeSingleBlankTabFromActiveTabGroup];
    }
    id WeakRetained = v9;
  }
}

uint64_t __41__StartPageController__highlightsSection__block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__StartPageController__highlightsSection__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__StartPageController__highlightsSection__block_invoke_321(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 attributionView];
  uint64_t v4 = [v3 contextMenuItems];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __41__StartPageController__highlightsSection__block_invoke_2_326(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _contextMenuCommitHandlerForFrequentlyVisitedSite:v6 animator:v7 sectionIdentifier:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v9 = v6;
    id v10 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v10)
    {
      [v7 setPreferredCommitStyle:1];
      id v11 = [v7 previewViewController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __41__StartPageController__highlightsSection__block_invoke_3_327;
      v14[3] = &unk_1E6D7FC98;
      id v15 = *(id *)(a1 + 40);
      id v12 = v9;
      char v19 = *(unsigned char *)(a1 + 56);
      id v16 = v12;
      id v17 = v10;
      id v18 = v11;
      id v13 = v11;
      [v7 addAnimations:v14];
    }
  }
}

void __41__StartPageController__highlightsSection__block_invoke_3_327(uint64_t a1)
{
  [*(id *)(a1 + 32) sendFeedbackForHighlight:*(void *)(a1 + 40) withType:1 inPrivateBrowsing:*(unsigned __int8 *)(a1 + 64)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 320));
  [WeakRetained commitLinkPreviewViewController:*(void *)(a1 + 56)];
}

void __41__StartPageController__highlightsSection__block_invoke_4_329(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 40);
    [v2 linkPreviewProviderWillDismissPreview];

    id WeakRetained = v3;
  }
}

id __41__StartPageController__highlightsSection__block_invoke_5_330(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = [v2 address];
    uint64_t v5 = [v3 URLWithString:v4];
  }
  else
  {
    uint64_t v5 = [v2 resourceURL];
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithContentsOfURL:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v6];

  return v7;
}

- (void)_highlightsDidChange:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F97EA0], "is2024SuggestionsEnabled", a3) & 1) == 0)
  {
    viewController = self->_viewController;
    [(SFStartPageViewController *)viewController reloadDataAnimatingDifferences:1];
  }
}

- (id)_privateBrowsingPersistentModuleSection
{
  id v2 = (void *)MEMORY[0x1E4F98EA8];
  uint64_t v3 = *MEMORY[0x1E4F996C8];
  uint64_t v4 = [MEMORY[0x1E4F98E90] privateBrowsingPersistentModule];
  uint64_t v5 = [v2 bannerSectionWithIdentifier:v3 banner:v4];

  return v5;
}

- (id)_privateBrowsingExplanationSection
{
  int64_t privateBrowsingExplanationState = self->_privateBrowsingExplanationState;
  if (privateBrowsingExplanationState == 1)
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else if (privateBrowsingExplanationState)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F98D10];
    uint64_t v5 = [MEMORY[0x1E4F98D08] defaultConfiguration];
    id v6 = [v4 itemsForConfiguration:v5];
  }
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4F98E90];
  int64_t v8 = self->_privateBrowsingExplanationState;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __57__StartPageController__privateBrowsingExplanationSection__block_invoke;
  id v15 = &unk_1E6D79768;
  objc_copyWeak(&v16, &location);
  id v9 = [v7 privateBrowsingExplanationBannerWithState:v8 explanationItems:v6 dismissHandler:&v12];
  id v10 = objc_msgSend(MEMORY[0x1E4F98EA8], "bannerSectionWithIdentifier:title:banner:", *MEMORY[0x1E4F996C0], &stru_1F3C268E8, v9, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __57__StartPageController__privateBrowsingExplanationSection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v2 setInteger:1 forKey:*MEMORY[0x1E4F993B0]];

    [WeakRetained updatePrivateBrowsingExplanationState];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __57__StartPageController__privateBrowsingExplanationSection__block_invoke_2;
    v3[3] = &unk_1E6D79060;
    v3[4] = WeakRetained;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v3 completion:0];
  }
}

uint64_t __57__StartPageController__privateBrowsingExplanationSection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 328) reloadDataAnimatingDifferences:1];
}

- (id)profileProviderForCustomizationViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained tabGroupProvider];

  return v4;
}

- (id)backgroundImageAssetControllerForCustomizationViewController:(id)a3
{
  uint64_t v3 = +[Application sharedApplication];
  uint64_t v4 = [v3 backgroundImageAssetController];

  return v4;
}

- (BOOL)isCloudSyncAvailableForStartPageCustomizationViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained tabGroupProvider];
  uint64_t v5 = [v4 activeProfile];
  uint64_t v6 = [v5 kind];

  if (v6) {
    return 0;
  }
  int64_t v8 = +[Application sharedApplication];
  char v7 = [v8 isCloudHistoryEnabled];

  return v7;
}

- (BOOL)isSuggestionsCustomizationAvailableForStartPageCustomizationViewController:(id)a3
{
  uint64_t v3 = [(WBSStartPageSectionManager *)self->_startPageSectionManager enabledSectionIdentifiers];
  char v4 = [v3 containsObject:*MEMORY[0x1E4F996F0]];

  return v4;
}

- (BOOL)isCloudSyncEnabledForStartPageCustomizationViewController:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults", a3);
  char v4 = [v3 BOOLForKey:*MEMORY[0x1E4F980D8]];

  return v4;
}

- (void)startPageCustomizationViewControllerDidDisableCloudSync:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setBool:0 forKey:*MEMORY[0x1E4F980D8]];
}

- (void)startPageCustomizationViewControllerDidEnableCloudSync:(id)a3 withPreference:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  uint64_t v6 = *MEMORY[0x1E4F980D8];
  id v8 = v5;
  [v5 setBool:1 forKey:*MEMORY[0x1E4F980D8]];

  id v9 = [MEMORY[0x1E4F28C40] defaultCenter];
  char v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_notificationNameForUserDefaultsKey:", v6);
  [v9 postNotificationName:v7 object:0];

  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    id v10 = [MEMORY[0x1E4F97FB8] sharedProxy];
    [v10 syncUpSafariSettingsSyncWithCompletion:&__block_literal_global_339];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F97FB8] sharedProxy];
    [v10 syncDownSafariSettingsSyncWithCompletion:&__block_literal_global_341];
  }
}

- (id)startPageCustomizationViewController:(id)a3 customizationItemsForCustomizationVariant:(int64_t)a4
{
  id v7 = a3;
  if (!a4)
  {
    id v10 = [(WBSStartPageSectionManager *)self->_startPageSectionManager sections];
    uint64_t v14 = objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_345);
LABEL_8:
    char v4 = (void *)v14;
    goto LABEL_9;
  }
  if (a4 == 2)
  {
    id v10 = [(WBSStartPageSectionManager *)self->_startPageSectionManager suggestionsDataSourceSections];
    uint64_t v14 = objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_347_0);
    goto LABEL_8;
  }
  if (a4 != 1) {
    goto LABEL_10;
  }
  char v4 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v9 = [WeakRetained tabGroupProvider];
  id v10 = [v9 activeTabGroup];

  if ([v10 supportsTabGroupFavorites])
  {
    id v11 = (void *)MEMORY[0x1E4F98E98];
    BOOL v12 = [(StartPageController *)self isTabGroupFavoritesSectionEnabled];
    uint64_t v13 = [v11 itemWithIdentifier:*MEMORY[0x1E4F996F8] enabled:v12];
    [v4 addObject:v13];
  }
LABEL_9:

LABEL_10:
  return v4;
}

id __102__StartPageController_startPageCustomizationViewController_customizationItemsForCustomizationVariant___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 identifier];
  if (([v3 isEqual:*MEMORY[0x1E4F996F8]] & 1) != 0
    || (([v3 isEqualToString:*MEMORY[0x1E4F99698]] & 1) == 0
      ? (int v5 = [v3 isEqualToString:*MEMORY[0x1E4F996E8]])
      : (int v5 = 1),
        (v5 | [v3 isEqualToString:*MEMORY[0x1E4F996A0]]) == 1
     && ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] & 1) != 0
     || [v3 isEqual:*MEMORY[0x1E4F996F0]]
     && ![MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled]))
  {
    char v4 = 0;
  }
  else
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F98E98], "itemWithIdentifier:enabled:", v3, objc_msgSend(v2, "isEnabled"));
  }

  return v4;
}

id __102__StartPageController_startPageCustomizationViewController_customizationItemsForCustomizationVariant___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1E4F98E98];
  char v4 = [v2 identifier];
  int v5 = objc_msgSend(v3, "itemWithIdentifier:enabled:", v4, objc_msgSend(v2, "isEnabled"));

  return v5;
}

- (void)startPageCustomizationViewController:(id)a3 didCustomizeItems:(id)a4 withVariant:(int64_t)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!a5 || a5 == 2)
  {
    uint64_t v13 = (void *)[v8 mutableCopy];
    id v34 = [(WBSStartPageSectionManager *)self->_startPageSectionManager sections];
    unint64_t v14 = [v34 indexOfObjectPassingTest:&__block_literal_global_352];
    unint64_t v15 = [v34 indexOfObjectPassingTest:&__block_literal_global_354_0];
    uint64_t v16 = [v9 indexOfObjectPassingTest:&__block_literal_global_357];
    uint64_t v17 = [v9 indexOfObjectPassingTest:&__block_literal_global_359];
    id v36 = [v9 objectAtIndexedSubscript:v16];
    id v35 = [v9 objectAtIndexedSubscript:v17];
    [v13 removeObject:v36];
    [v13 removeObject:v35];
    if (v14 >= v15) {
      id v18 = v35;
    }
    else {
      id v18 = v36;
    }
    if (v14 >= v15) {
      unint64_t v19 = v15;
    }
    else {
      unint64_t v19 = v14;
    }
    if (v14 >= v15) {
      uint64_t v20 = v36;
    }
    else {
      uint64_t v20 = v35;
    }
    if (v14 <= v15) {
      unint64_t v21 = v15;
    }
    else {
      unint64_t v21 = v14;
    }
    id v22 = v18;
    id v23 = v20;
    if (v22)
    {
      unint64_t v24 = [v13 count];
      uint64_t v25 = v19;
      if (v19 >= v24) {
        uint64_t v25 = [v13 count];
      }
      [v13 insertObject:v22 atIndex:v25];
    }
    if (v23)
    {
      unint64_t v26 = [v13 count];
      uint64_t v27 = v21;
      if (v21 >= v26) {
        uint64_t v27 = [v13 count];
      }
      [v13 insertObject:v23 atIndex:v27];
    }
    if (!v22
      || !v23
      || v19 == 0x7FFFFFFFFFFFFFFFLL
      || v21 == 0x7FFFFFFFFFFFFFFFLL
      || v16 == 0x7FFFFFFFFFFFFFFFLL
      || v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v28 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v33 = [v22 description];
        [v23 description];
        *(_DWORD *)buf = 138544642;
        id v43 = v33;
        v45 = __int16 v44 = 2114;
        __int16 v46 = 2048;
        unint64_t v47 = v19;
        __int16 v48 = 2048;
        unint64_t v49 = v21;
        __int16 v50 = 2048;
        uint64_t v51 = v16;
        __int16 v52 = 2048;
        uint64_t v53 = v17;
        char v32 = (void *)v45;
        _os_log_error_impl(&dword_1E102C000, v28, OS_LOG_TYPE_ERROR, "Unexpected Suggestions sections state: Item1:%{public}@, Item2:%{public}@, Index1:%ld, Index2:%ld, Frecents:%ld, Highlights:%ld", buf, 0x3Eu);
      }
    }
    id v29 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    void v38[2] = __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_361;
    v38[3] = &unk_1E6D7FDB8;
    id v30 = v29;
    id v39 = v30;
    id v31 = objc_msgSend(v13, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v38);
    [(WBSStartPageSectionManager *)self->_startPageSectionManager setSectionsIdentifiers:v31 enabledIndexes:v30];

    goto LABEL_37;
  }
  if (a5 == 1)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke;
    v40[3] = &unk_1E6D7FD50;
    id v41 = v8;
    id v10 = (void (**)(void, void))MEMORY[0x1E4E42950](v40);
    id v11 = v10[2](v10, *MEMORY[0x1E4F996F8]);
    BOOL v12 = v11;
    if (v11) {
      -[StartPageController setTabGroupFavoritesSectionEnabled:](self, "setTabGroupFavoritesSectionEnabled:", [v11 isEnabled]);
    }

    uint64_t v13 = v41;
LABEL_37:
  }
  [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
}

id __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_2;
  v8[3] = &unk_1E6D7FD28;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "safari_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F99698]];

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F996A0]];

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F99698]];

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F996A0]];

  return v3;
}

id __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_361(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 isEnabled]) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
  uint64_t v6 = [v5 identifier];

  return v6;
}

- (BOOL)isBackgroundImageEnabledForStartPageCustomizationViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v4 = [WeakRetained tabGroupProvider];
  id v5 = [v4 activeProfileIdentifier];

  uint64_t v6 = +[Application sharedApplication];
  id v7 = [v6 tabGroupManager];
  id v8 = [v7 profileWithIdentifier:v5];

  if ([v8 kind] == 1)
  {
    id v9 = [v8 settingForKey:*MEMORY[0x1E4F99628]];
    char v10 = [v9 BOOLValue];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v10 = [v9 BOOLForKey:*MEMORY[0x1E4F99628]];
  }
  BOOL v11 = v10;

  return v11;
}

- (id)backgroundImageForStartPageCustomizationViewController:(id)a3
{
  cachedItemProvider = self->_cachedItemProvider;
  if (cachedItemProvider)
  {
    char v4 = cachedItemProvider;
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F98E88], "defaultManager", a3);
    id v7 = +[Application sharedApplication];
    id v8 = [v7 tabGroupManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    char v10 = [WeakRetained activeProfileIdentifier];
    BOOL v11 = [v8 profileWithIdentifier:v10];

    BOOL v12 = [(StartPageController *)self startPageBackgroundImageIdentifier];
    uint64_t v13 = [v6 imageForIdentifier:v12 forProfile:v11];

    if (v13)
    {
      unint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v13, "CGImage"));
      char v4 = (NSItemProvider *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v14];
      unint64_t v15 = [v6 prefetchedImageNameForProfile:v11];
      [(NSItemProvider *)v4 setSuggestedName:v15];

      uint64_t v16 = [v6 prefetchedImageThumbnailForProfile:v11];
      uint64_t v17 = (void *)v16;
      if (v16) {
        id v18 = (void *)v16;
      }
      else {
        id v18 = v13;
      }
      id v19 = v18;

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__StartPageController_backgroundImageForStartPageCustomizationViewController___block_invoke;
      v22[3] = &unk_1E6D7FDE0;
      id v23 = v19;
      id v20 = v19;
      [(NSItemProvider *)v4 setPreviewImageHandler:v22];
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

void __78__StartPageController_backgroundImageForStartPageCustomizationViewController___block_invoke(uint64_t a1, void *a2)
{
  char v4 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(*(id *)(a1 + 32), "CGImage"));
  v4[2](v4, v3, 0);
}

- (void)startPageCustomizationViewController:(id)a3 willModifySectionWithIdentifier:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setBool:1 forKey:*MEMORY[0x1E4F99680]];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v10 = [WeakRetained activeProfileIdentifier];
  char v11 = [v10 isEqualToString:*MEMORY[0x1E4F980C8]];

  if (v11)
  {
    v15[0] = @"section";
    v15[1] = @"isEnabled";
    v16[0] = v7;
    BOOL v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    v16[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    unint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:*MEMORY[0x1E4F994B8] object:0 userInfo:v13];
  }
}

- (void)didReorderSectionIdentifiersForStartPageCustomizationViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v4 = [WeakRetained activeProfileIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F980C8]];

  if (v5)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:*MEMORY[0x1E4F996A8] object:self];
  }
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setBool:1 forKey:*MEMORY[0x1E4F99680]];
}

- (void)startPageCustomizationViewControllerDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v3 = [WeakRetained activeProfileIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F980C8]];

  if (v4)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:*MEMORY[0x1E4F994C0] object:0];
  }
}

- (void)startPageCustomizationViewController:(id)a3 didModifyBackgroundImageEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = [WeakRetained tabGroupProvider];
  id v8 = [v7 activeProfileIdentifier];

  if ([v8 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v9 setBool:v4 forKey:*MEMORY[0x1E4F99628]];
  }
  else
  {
    char v10 = +[Application sharedApplication];
    char v11 = [v10 tabGroupManager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke;
    void v16[3] = &__block_descriptor_33_e26_v16__0__WBMutableProfile_8l;
    BOOL v17 = v4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke_2;
    v14[3] = &unk_1E6D797B8;
    void v14[4] = self;
    id v15 = v8;
    id v12 = (id)[v11 updateProfileWithIdentifier:v15 persist:1 usingBlock:v16 completionHandler:v14];
  }
  uint64_t v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v13 setBool:1 forKey:*MEMORY[0x1E4F99680]];
}

void __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  [v4 setSetting:v3 forKey:*MEMORY[0x1E4F99628]];
}

void __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[Application sharedApplication];
    id v2 = [v4 tabGroupManager];
    uint64_t v3 = [v2 profileWithIdentifier:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 328) setProfile:v3];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:*MEMORY[0x1E4F993D8] object:0];
  }
}

- (void)startPageCustomizationViewController:(id)a3 didSelectCustomBackgroundImage:(id)a4
{
  id v6 = a4;
  objc_storeStrong((id *)&self->_cachedItemProvider, a4);
  id v7 = [MEMORY[0x1E4F98E88] defaultManager];
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
    id v8 = (void *)++generationToken;
    os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
    objc_initWeak(&location, self);
    id v9 = [(id)*MEMORY[0x1E4F44400] identifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke;
    void v20[3] = &unk_1E6D7FE80;
    v22[1] = v8;
    id v21 = v7;
    objc_copyWeak(v22, &location);
    id v10 = (id)[v6 loadFileRepresentationForTypeIdentifier:v9 completionHandler:v20];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v12 = [WeakRetained tabGroupProvider];
    uint64_t v13 = [v12 activeProfile];
    uint64_t v14 = [v13 kind];

    id v15 = [WeakRetained tabGroupProvider];
    uint64_t v16 = [v15 activeTabGroup];
    int v17 = [v16 isUnnamed];

    if (v14) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    if (v18 == 1)
    {
      id v19 = [(StartPageController *)self startPageBackgroundImageIdentifier];
      [v7 clearImageWithIdentifier:v19 withinProfile:1];
    }
    else
    {
      id v19 = [(StartPageController *)self startPageBackgroundImageIdentifier];
      [v7 clearImageWithIdentifier:v19 withinProfile:0];
    }
  }
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = generationToken;
  os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
  if (v7 == v8)
  {
    if (v6)
    {
      id v9 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_msgSend(v6, "safari_privacyPreservingDescription");
        __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_cold_1(v10, buf, v9);
      }
    }
    char v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = NSTemporaryDirectory();
    uint64_t v13 = [v11 fileURLWithPath:v12];
    uint64_t v14 = [MEMORY[0x1E4F28F80] processInfo];
    id v15 = [v14 globallyUniqueString];
    uint64_t v16 = [v13 URLByAppendingPathComponent:v15 isDirectory:0];

    int v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v18 = v17;
    if (v5)
    {
      id v32 = v6;
      [v17 moveItemAtURL:v5 toURL:v16 error:&v32];
      id v19 = v32;

      id v6 = v19;
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_374;
    v29[3] = &unk_1E6D791E8;
    id v21 = v18;
    id v30 = v21;
    id v31 = v5;
    [v20 setHandler:v29];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_375;
    v24[3] = &unk_1E6D7FE58;
    id v25 = *(id *)(a1 + 32);
    id v26 = v16;
    id v27 = v20;
    id v22 = v20;
    id v23 = v16;
    objc_copyWeak(v28, (id *)(a1 + 40));
    v28[1] = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v24);
    objc_destroyWeak(v28);
  }
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_374(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v7 = 0;
  char v3 = [v2 removeItemAtURL:v1 error:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(v4, "safari_privacyPreservingDescription");
      __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_374_cold_1(v6, buf, v5);
    }
  }
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_375(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_2;
  v4[3] = &unk_1E6D7FE30;
  id v5 = *(id *)(a1 + 48);
  objc_copyWeak(v7, (id *)(a1 + 56));
  v7[1] = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 32);
  [v2 cacheImageFromURL:v3 completion:v4];

  objc_destroyWeak(v7);
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_3;
  block[3] = &unk_1E6D7FE08;
  id v6 = a1[4];
  objc_copyWeak(v9, a1 + 6);
  v9[1] = a1[7];
  id v7 = v3;
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v9);
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
    uint64_t v2 = *(void *)(a1 + 64);
    uint64_t v3 = generationToken;
    os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
    if (v2 == v3)
    {
      id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v4 removeObjectForKey:*MEMORY[0x1E4F99288]];
      if (*(void *)(a1 + 40))
      {
        [v4 setBool:1 forKey:*MEMORY[0x1E4F99628]];
        id v5 = objc_loadWeakRetained(WeakRetained + 40);
        id v6 = [v5 tabGroupProvider];
        id v7 = [v6 activeProfile];
        uint64_t v8 = [v7 kind];

        uint64_t v9 = [v5 tabGroupProvider];
        id v10 = [v9 activeTabGroup];
        int v11 = [v10 isUnnamed];

        if (v8) {
          int v12 = v11;
        }
        else {
          int v12 = 0;
        }
        uint64_t v13 = *(void **)(a1 + 48);
        if (v12 == 1)
        {
          uint64_t v14 = [WeakRetained startPageBackgroundImageIdentifier];
          [v13 processImageForIdentifier:v14 isGeneratedImage:0 withinProfile:1];
        }
        else
        {
          uint64_t v14 = [WeakRetained startPageBackgroundImageIdentifier];
          [v13 processImageForIdentifier:v14 isGeneratedImage:0 withinProfile:0];
        }

        id v15 = WeakRetained[5];
        WeakRetained[5] = 0;

        uint64_t v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v16 setBool:1 forKey:*MEMORY[0x1E4F99680]];
      }
      else
      {
        [*(id *)(a1 + 48) clearPrefetchedImage];
        [v4 setBool:0 forKey:*MEMORY[0x1E4F99628]];
      }
    }
  }
}

- (void)startPageCustomizationViewController:(id)a3 didSelectBuiltInBackgroundImageAtURL:(id)a4 precomputedLuminance:(double)a5
{
  id v7 = a4;
  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E4F28D78]);
  cachedItemProvider = self->_cachedItemProvider;
  self->_cachedItemProvider = v9;

  [(NSItemProvider *)self->_cachedItemProvider setSuggestedName:v8];
  os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
  int v11 = (void *)++generationToken;
  os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
  int v12 = [MEMORY[0x1E4F98E88] defaultManager];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke;
  v15[3] = &unk_1E6D7FED0;
  objc_copyWeak(v18, &location);
  v18[1] = v11;
  id v13 = v8;
  id v16 = v13;
  id v17 = v12;
  void v18[2] = *(id *)&a5;
  id v14 = v12;
  [v14 prefetchImage:v7 luminance:v15 completion:a5];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke(id *a1, uint64_t a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_2;
    block[3] = &unk_1E6D7FEA8;
    objc_copyWeak(v6, a1 + 6);
    v6[1] = a1[7];
    id v4 = a1[4];
    id v5 = a1[5];
    v6[2] = a1[8];
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v6);
  }
}

void __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = generationToken;
    os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
    if (v3 == v4)
    {
      id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v5 setObject:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4F99288]];
      id v6 = objc_loadWeakRetained(WeakRetained + 40);
      id v7 = [v6 tabGroupProvider];
      uint64_t v8 = [v7 activeProfileIdentifier];

      if ([v8 isEqualToString:*MEMORY[0x1E4F980C8]])
      {
        [v5 setBool:1 forKey:*MEMORY[0x1E4F99628]];
      }
      else
      {
        uint64_t v9 = +[Application sharedApplication];
        id v10 = [v9 tabGroupManager];
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        id v26 = __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_4;
        id v27 = &unk_1E6D797B8;
        id v28 = WeakRetained;
        id v29 = v8;
        id v11 = (id)[v10 updateProfileWithIdentifier:v29 persist:1 usingBlock:&__block_literal_global_379 completionHandler:&v24];
      }
      int v12 = objc_msgSend(v6, "tabGroupProvider", v24, v25, v26, v27, v28);
      id v13 = [v12 activeProfile];
      uint64_t v14 = [v13 kind];

      id v15 = [v6 tabGroupProvider];
      id v16 = [v15 activeTabGroup];
      unsigned int v17 = [v16 isUnnamed];

      int v18 = *(void **)(a1 + 40);
      double v19 = *(double *)(a1 + 64);
      id v20 = [WeakRetained startPageBackgroundImageIdentifier];
      if (v14) {
        uint64_t v21 = v17;
      }
      else {
        uint64_t v21 = 0;
      }
      [v18 commitPrefetchedImageWithLuminance:v20 forIdentifier:0 isGeneratedImage:v21 withinProfile:v19];

      id v22 = WeakRetained[5];
      WeakRetained[5] = 0;

      id v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v23 setBool:1 forKey:*MEMORY[0x1E4F99680]];
    }
  }
}

uint64_t __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setSetting:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F99628]];
}

void __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_4(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[Application sharedApplication];
    uint64_t v2 = [v4 tabGroupManager];
    uint64_t v3 = [v2 profileWithIdentifier:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 328) setProfile:v3];
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F993D8] object:0];
}

- (void)startPageCustomizationViewController:(id)a3 didSelectMobileAssetBackgroundImageWithProvider:(id)a4
{
}

- (void)startPageViewController:(id)a3 toggleSectionExpanded:(id)a4
{
  id v24 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (![v24 expandsModally])
  {
    uint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v15 = [v14 dictionaryForKey:@"startPageExpansionDictionary"];
    id v16 = (void *)[v15 mutableCopy];
    unsigned int v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    double v19 = v18;

    id v20 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v21 = [v24 identifier];
    id v22 = objc_msgSend(v20, "numberWithBool:", objc_msgSend(v19, "safari_BOOLForKey:", v21) ^ 1);
    id v23 = [v24 identifier];
    [v19 setObject:v22 forKeyedSubscript:v23];

    [v14 setObject:v19 forKey:@"startPageExpansionDictionary"];
    goto LABEL_11;
  }
  id v6 = [v24 identifier];
  id v7 = (void *)*MEMORY[0x1E4F99688];
  int v8 = [v6 hasPrefix:*MEMORY[0x1E4F99688]];

  if (v8)
  {
    uint64_t v9 = [v24 identifier];
    id v10 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v7, "length") + 1);
    [WeakRetained presentCloudTabsPickerWithPrimaryDeviceUUID:v10];
  }
  id v11 = [v24 identifier];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F996D8]];

  if (v12)
  {
    if ([WeakRetained canShowSidebar])
    {
      viewController = self->_viewController;
      uint64_t v14 = [v24 identifier];
      [(SFStartPageViewController *)viewController showDetailForItemWithIdentifier:v14];
LABEL_11:

      goto LABEL_12;
    }
    [WeakRetained setPresentingModalBookmarksController:1 withExclusiveCollection:@"ReadingListCollection" bookmarkUUIDString:0 animated:1];
  }
LABEL_12:
}

- (id)startPageViewController:(id)a3 detailSectionForItemIdentifier:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(StartPageController *)self _bookmarkSectionForBookmark:v5 orList:0 forFavoritesSection:1 forScopedFavoritesSection:0 sectionTitle:0];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 isEqualToString:*MEMORY[0x1E4F996F0]])
    {
      id v7 = [(StartPageController *)self _highlightsSection];
      [v7 setMaximumNumberOfPages:1];
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 isEqualToString:*MEMORY[0x1E4F996D8]])
    {
      id v7 = [(StartPageController *)self _readingListSection];
      [v7 setMaximumNumberOfPages:1];
      goto LABEL_11;
    }
    uint64_t v6 = emptyBookmarksSection();
  }
  id v7 = (void *)v6;
LABEL_11:

  return v7;
}

- (id)startPageViewController:(id)a3 detailSectionsForItemIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F99688]])
  {
    availableDevices = self->_availableDevices;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __79__StartPageController_startPageViewController_detailSectionsForItemIdentifier___block_invoke;
    v10[3] = &unk_1E6D7F6D8;
    v10[4] = self;
    id v7 = [(NSArray *)availableDevices safari_mapObjectsUsingBlock:v10];
  }
  else
  {
    int v8 = emptyBookmarksSection();
    v11[0] = v8;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  return v7;
}

id __79__StartPageController_startPageViewController_detailSectionsForItemIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _recentCloudTabsSectionWithDevice:a2];
  return v2;
}

- (void)startPageViewController:(id)a3 didSelectItemWithIdentifier:(id)a4 atGridLocation:(id)a5
{
  int64_t var1 = a5.var1;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    if ([v11 isFolder]
      && ([MEMORY[0x1E4F78598] shouldOpenBookmarkFolderAsTabs] & 1) == 0)
    {
      [v8 showDetailForItemWithIdentifier:v11];
    }
    else
    {
      int v12 = [MEMORY[0x1E4F78598] builder];
      id v13 = [v12 navigationIntentWithBookmark:v11];

      if (v13)
      {
        [WeakRetained dispatchNavigationIntent:v13];
        uint64_t v14 = [(WebBookmarkCollection *)self->_bookmarkCollection bookmarkIsInFavoritesFolder:v11];
        [(StartPageController *)self _reportBookmarkNavigationAnalytics:v11 withIntent:v13 bookmarkIsInFavoritesFolder:v14];
        if (v14)
        {
          id v15 = [MEMORY[0x1E4F97E48] sharedLogger];
          [v15 didSelectFavoritesRow:var1];
        }
      }
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    id v16 = [MEMORY[0x1E4F78598] builder];
    unsigned int v17 = [v11 pageURL];
    id v18 = [v16 navigationIntentWithURL:v17];

    [WeakRetained dispatchNavigationIntent:v18];
    double v19 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v19 didEngageWithStartPageSection:2];
  }
  else
  {
    if ([v9 conformsToProtocol:&unk_1F3D3AF78])
    {
      id v20 = [MEMORY[0x1E4F78598] builder];
      id v11 = [v20 navigationIntentWithCloudTab:v9];

      [WeakRetained dispatchNavigationIntent:v11];
      id v18 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v18 didEngageWithStartPageSection:5];
      goto LABEL_13;
    }
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x2050000000;
    uint64_t v21 = (void *)getSLHighlightClass(void)::softClass;
    uint64_t v36 = getSLHighlightClass(void)::softClass;
    if (!getSLHighlightClass(void)::softClass)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = ___ZL19getSLHighlightClassv_block_invoke;
      v32[3] = &unk_1E6D79088;
      void v32[4] = &v33;
      ___ZL19getSLHighlightClassv_block_invoke((uint64_t)v32);
      uint64_t v21 = (void *)v34[3];
    }
    id v22 = v21;
    _Block_object_dispose(&v33, 8);
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      id v23 = [MEMORY[0x1E4F78598] builder];
      id v18 = [v23 navigationIntentWithHighlight:v11];

      id v24 = +[Application sharedApplication];
      uint64_t v25 = [v24 highlightManager];
      objc_msgSend(v25, "sendFeedbackForHighlight:withType:inPrivateBrowsing:", v11, 1, objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));

      [WeakRetained dispatchNavigationIntent:v18];
      double v19 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v19 didEngageWithStartPageSection:7];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_16;
        }
        id v30 = [MEMORY[0x1E4F78598] builder];
        id v31 = [(StartPageController *)self _cloudTabItemForIdentifier:v9];
        id v11 = [v30 navigationIntentWithCloudTab:v31];

        [WeakRetained dispatchNavigationIntent:v11];
        id v18 = [MEMORY[0x1E4F97E48] sharedLogger];
        [v18 didEngageWithStartPageSection:5];
        goto LABEL_13;
      }
      id v11 = v9;
      id v26 = [MEMORY[0x1E4F78598] builder];
      id v27 = (void *)MEMORY[0x1E4F1CB10];
      id v28 = [v11 url];
      id v29 = [v27 URLWithString:v28];
      id v18 = [v26 navigationIntentWithURL:v29];

      [WeakRetained dispatchNavigationIntent:v18];
      [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
      double v19 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v19 didEngageWithStartPageSection:8];
    }
  }

LABEL_13:
LABEL_15:

LABEL_16:
}

- (void)startPageViewControllerDidChangeRootViewVisibility:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] & 1) == 0) {
    [(StartPageController *)self _updateSiriSuggestionsMediator];
  }
  if ([v5 isShowingRootView])
  {
    id v4 = [(StartPageController *)self frequentlyVisitedSitesController];
    [v4 recomputeFrequentlyVisitedSitesIfNecessary];
  }
}

- (void)startPageViewController:(id)a3 didUpdateSearchPattern:(id)a4
{
  id v7 = a4;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v5 = (NSString *)[v7 copy];
    searchPattern = self->_searchPattern;
    self->_searchPattern = v5;

    [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
  }
}

- (void)editBookmark:(id)a3 userInfo:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained editBookmark:v5];
}

- (void)deleteBookmark:(id)a3 userInfo:(id)a4
{
  id v14 = a3;
  if ([v14 subtype] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v6 = [WeakRetained tabGroupProvider];
    id v7 = [v14 UUID];
    [v6 deleteScopedBookmarkWithUUID:v7 completionHandler:0];

LABEL_3:
    goto LABEL_8;
  }
  id v8 = [(StartPageController *)self frequentlyVisitedSitesController];
  int v9 = [v8 bookmarkIsFrequentlyVistedSite:v14];

  if (v9)
  {
    id v10 = [(StartPageController *)self frequentlyVisitedSitesController];
    id v11 = +[FeatureManager sharedFeatureManager];
    objc_msgSend(v10, "banFrequentlyVisitedSite:inMemoryBookmarkChangeTrackingAvailable:", v14, objc_msgSend(v11, "isInMemoryBookmarkChangeTrackingAvailable"));
  }
  if (![MEMORY[0x1E4FB60E8] lockSync])
  {
    int v12 = +[FeatureManager sharedFeatureManager];
    int v13 = [v12 isInMemoryBookmarkChangeTrackingAvailable];

    if (v13)
    {
      [(WebBookmarkCollection *)self->_bookmarkCollection deleteBookmarkInMemory:v14];
      id WeakRetained = [MEMORY[0x1E4F97E48] sharedLogger];
      [WeakRetained didDeleteBookmarkInMemory];
    }
    else
    {
      [MEMORY[0x1E4F781E8] showLockedDatabaseAlertForAction:0 fromViewController:self->_viewController];
      id WeakRetained = [MEMORY[0x1E4F97E48] sharedLogger];
      [WeakRetained didPreventBookmarkActionWithBookmarkType:1 actionType:1];
    }
    goto LABEL_3;
  }
  [(WebBookmarkCollection *)self->_bookmarkCollection deleteBookmark:v14];
  [MEMORY[0x1E4FB60E8] unlockSync];
LABEL_8:
}

- (void)bookmark:(id)a3 didProduceNavigationIntent:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained dispatchNavigationIntent:v7];

  [(StartPageController *)self _reportBookmarkNavigationAnalytics:v9 withIntent:v7];
}

- (void)bookmark:(id)a3 shareItems:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItems:v7 applicationActivities:0];
  [(SFStartPageViewController *)self->_viewController presentViewController:v8 fromItemWithIdentifier:v9];
}

- (void)_reportBookmarkNavigationAnalytics:(id)a3 withIntent:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(StartPageController *)self _reportBookmarkNavigationAnalytics:v7 withIntent:v6 bookmarkIsInFavoritesFolder:[(WebBookmarkCollection *)self->_bookmarkCollection bookmarkIsInFavoritesFolder:v7]];
}

- (void)_reportBookmarkNavigationAnalytics:(id)a3 withIntent:(id)a4 bookmarkIsInFavoritesFolder:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(WebBookmarkCollection *)self->_bookmarkCollection bookmarkIsFrequentlyVisitedSite:v8];
  id v11 = [(StartPageController *)self frequentlyVisitedSitesController];
  uint64_t v12 = [v11 displayIndexOfFrequentlyVisitedSite:v8];

  int v13 = [MEMORY[0x1E4F97E48] sharedLogger];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__StartPageController__reportBookmarkNavigationAnalytics_withIntent_bookmarkIsInFavoritesFolder___block_invoke;
  v17[3] = &unk_1E6D7FEF8;
  id v14 = v9;
  BOOL v22 = a5;
  id v18 = v14;
  id v19 = v13;
  char v23 = v10;
  uint64_t v21 = v12;
  id v15 = v8;
  id v20 = v15;
  id v16 = v13;
  [v16 performOnAnalyticsQueueWithDelay:0 block:v17];
}

void __97__StartPageController__reportBookmarkNavigationAnalytics_withIntent_bookmarkIsInFavoritesFolder___block_invoke(uint64_t a1)
{
  switch([*(id *)(a1 + 32) policy])
  {
    case 1:
    case 3:
      uint64_t v2 = 1;
      goto LABEL_6;
    case 2:
      uint64_t v2 = 2;
      goto LABEL_6;
    case 4:
      uint64_t v2 = 3;
      goto LABEL_6;
    case 5:
      return;
    default:
      uint64_t v2 = 0;
LABEL_6:
      if (*(unsigned char *)(a1 + 64))
      {
        [*(id *)(a1 + 40) didSelectFavoriteWithOpenLocation:v2];
        uint64_t v3 = *(void **)(a1 + 40);
        uint64_t v4 = 0;
LABEL_8:
        [v3 didEngageWithStartPageSection:v4];
        return;
      }
      if (!*(unsigned char *)(a1 + 65))
      {
        if (![*(id *)(a1 + 48) isReadingListItem]) {
          return;
        }
        uint64_t v3 = *(void **)(a1 + 40);
        uint64_t v4 = 4;
        goto LABEL_8;
      }
      id v5 = objc_alloc(MEMORY[0x1E4F97EB0]);
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = [*(id *)(a1 + 48) historyItem];
      id v8 = [v7 lastVisitedDate];
      id v9 = [*(id *)(a1 + 48) frequentlyVisitedSiteScore];
      id v10 = (id)[v5 initWithItemPosition:v6 lastVisitedDate:v8 score:v9];

      [*(id *)(a1 + 40) didSelectFrequentlyVisitedSiteWithOpenLocation:v2 analyticsPayload:v10];
      [*(id *)(a1 + 40) didEngageWithStartPageSection:1];

      return;
  }
}

- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4
{
  id v6 = a4;
  int v5 = [v6 folderID];
  if (v5 == [(WebBookmarkList *)self->_tabGroupScopedFavoritesList folderID]) {
    [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
  }
}

- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5
{
  id v24 = a3;
  id v7 = a4;
  id v8 = [(StartPageController *)self _effectiveProfileIdentifier];
  char v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [v24 profileWithIdentifier:v7];
    id v11 = [(SFStartPageViewController *)self->_viewController profile];
    uint64_t v12 = *MEMORY[0x1E4F99628];
    int v13 = [v11 settingForKey:*MEMORY[0x1E4F99628]];
    int v14 = [v13 BOOLValue];

    id v15 = [v10 settingForKey:v12];
    LODWORD(v13) = [v15 BOOLValue];

    uint64_t v16 = *MEMORY[0x1E4F99638];
    unsigned int v17 = [v11 settingForKey:*MEMORY[0x1E4F99638]];
    int v18 = [v17 BOOLValue];

    id v19 = [v10 settingForKey:v16];
    int v20 = [v19 BOOLValue];

    [(SFStartPageViewController *)self->_viewController setProfile:v10];
    if (v14 != v13)
    {
      uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 postNotificationName:*MEMORY[0x1E4F993D8] object:0];
    }
    if (v18 != v20
      || ([v10 customFavoritesFolderServerID],
          BOOL v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = [v22 isEqual:self->_lastSeenProfileCustomFavoritesServerID],
          v22,
          (v23 & 1) == 0))
    {
      [(StartPageController *)self _sectionsDidChange:0];
    }
  }
}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
  id v9 = a4;
  if (([MEMORY[0x1E4F97EA0] is2024CloudTabsEnabled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v6 = [WeakRetained tabGroupProvider];
    id v7 = [v6 activeProfileIdentifier];
    char v8 = WBSIsEqual();

    if (v8)
    {
      [(StartPageController *)self _cloudTabsDidChange];
      [(SFStartPageViewController *)self->_viewController reloadDataAnimatingDifferences:1];
    }
  }
}

- (void)setViewController:(id)a3
{
}

- (BOOL)isShowingAsPopover
{
  return self->_showingAsPopover;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryType, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_readingListBookmarksToMetadataStates, 0);
  objc_storeStrong((id *)&self->_readingListLeadImageCache, 0);
  objc_storeStrong((id *)&self->_cachedFavoritesList, 0);
  objc_storeStrong((id *)&self->_cachedFavoritesSection, 0);
  objc_storeStrong((id *)&self->_relativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_coalescedRecentCloudTabsSectionUpdateTimer, 0);
  objc_storeStrong((id *)&self->_recentItemsByDeviceUUID, 0);
  objc_storeStrong((id *)&self->_availableDevices, 0);
  objc_storeStrong((id *)&self->_recentItems, 0);
  objc_storeStrong((id *)&self->_recentsStore, 0);
  objc_storeStrong((id *)&self->_recentCloudTabsProvider, 0);
  objc_storeStrong((id *)&self->_cachedGeneratedBackgroundItemProvider, 0);
  objc_storeStrong((id *)&self->_lastSeenProfileCustomFavoritesServerID, 0);
  objc_storeStrong((id *)&self->_customFavoritesFolderBookmark, 0);
  objc_storeStrong((id *)&self->_tabGroupScopedFavoritesList, 0);
  objc_storeStrong((id *)&self->_tabGroupFavoritesObservation, 0);
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_startPageSectionManager, 0);
  objc_storeStrong((id *)&self->_siriSuggestionsMetadataTokens, 0);
  objc_storeStrong((id *)&self->_selectedCloudDeviceObservation, 0);
  objc_storeStrong((id *)&self->_siriSuggestionsMediator, 0);
  objc_storeStrong((id *)&self->_siriSuggestions, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_privacyReportData, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesController, 0);
  objc_storeStrong((id *)&self->_favoritesList, 0);
  objc_storeStrong((id *)&self->_cachedSections, 0);
  objc_storeStrong((id *)&self->_cachedItemProvider, 0);
  objc_storeStrong((id *)&self->_cachedTabGroupHeadingSection, 0);
  objc_storeStrong((id *)&self->_cachedCloudTabsSection, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
}

- (void)_copyBookmark:(os_log_t)log toFolderWithID:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Could not lock sync when adding bookmark to Favorites.", v1, 2u);
}

- (void)_bookmarkSectionForBookmark:(os_log_t)log orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Failed to load bookmarks in folder.", v1, 2u);
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Failed to load background image from item provider: %{public}@", buf, 0xCu);
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_374_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Failed to remove temporary background image file: %{public}@", buf, 0xCu);
}

@end