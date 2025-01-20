@interface PSListController
+ (BOOL)displaysButtonBar;
+ (id)aggregateReportingDomainOverride;
+ (id)appearance;
+ (id)appearanceWhenContainedInInstancesOfClasses:(id)a3;
+ (void)registerDefaultAppearanceProviderClass:(Class)a3;
+ (void)registerDefaultNavigationCoordinatorClass:(Class)a3;
+ (void)setAggregateReportingDomainOverride:(id)a3;
- (BOOL)_getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5 groups:(id)a6;
- (BOOL)_isEmptyGroup:(unint64_t)a3;
- (BOOL)_isRegularWidth;
- (BOOL)containsSpecifier:(id)a3;
- (BOOL)contentSizeDidChange;
- (BOOL)edgeToEdgeCells;
- (BOOL)forceSynchronousIconLoadForCreatedCells;
- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifier:(id)a5;
- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5;
- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierID:(id)a5;
- (BOOL)handlePendingURL;
- (BOOL)isPrefetchingEnabled;
- (BOOL)isShowingSetupController;
- (BOOL)isValidCellStyle:(int64_t)a3;
- (BOOL)performActionForSpecifier:(id)a3;
- (BOOL)performButtonActionForSpecifier:(id)a3;
- (BOOL)performConfirmationActionForSpecifier:(id)a3;
- (BOOL)performConfirmationAlternateActionForSpecifier:(id)a3;
- (BOOL)performConfirmationCancelActionForSpecifier:(id)a3;
- (BOOL)performLoadActionForSpecifier:(id)a3;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldSelectResponderOnAppearance;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)usesDarkTheme;
- (Class)tableViewClass;
- (NSArray)unprotectedSpecifiers;
- (NSDictionary)pendingURLResourceDictionary;
- (NSString)description;
- (NSString)specifierIDPendingPush;
- (PSListController)init;
- (PSListControllerAppearanceProvider)appearanceProvider;
- (PSListControllerNavigationCoordinator)navigationCoordinator;
- (PSSpecifierDataSource)specifierDataSource;
- (PSURLControllerHandler)urlHandler;
- (UIColor)altTextColor;
- (UIColor)backgroundColor;
- (UIColor)buttonTextColor;
- (UIColor)cellAccessoryColor;
- (UIColor)cellAccessoryHighlightColor;
- (UIColor)cellHighlightColor;
- (UIColor)editableInsertionPointColor;
- (UIColor)editablePlaceholderTextColor;
- (UIColor)editableSelectionBarColor;
- (UIColor)editableSelectionHighlightColor;
- (UIColor)editableTextColor;
- (UIColor)footerHyperlinkColor;
- (UIColor)foregroundColor;
- (UIColor)padSelectionColor;
- (UIColor)segmentedSliderTrackColor;
- (UIColor)separatorColor;
- (UIColor)textColor;
- (_NSRange)rangeOfSpecifiersInGroupID:(id)a3;
- (double)_getKeyboardIntersectionHeightFromUserInfo:(id)a3;
- (double)_tableView:(id)a3 estimatedHeightForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5;
- (double)_tableView:(id)a3 heightForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (float)verticalContentOffset;
- (id)_createGroupIndices:(id)a3;
- (id)_customViewForSpecifier:(id)a3 class:(Class)a4 isHeader:(BOOL)a5;
- (id)_tableView:(id)a3 viewForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5;
- (id)bundle;
- (id)cachedCellForSpecifier:(id)a3;
- (id)cachedCellForSpecifierID:(id)a3;
- (id)controllerForRowAtIndexPath:(id)a3;
- (id)controllerForSpecifier:(id)a3;
- (id)findFirstVisibleResponder;
- (id)getGroupSpecifierForSpecifier:(id)a3;
- (id)getGroupSpecifierForSpecifierID:(id)a3;
- (id)indexPathForIndex:(int64_t)a3;
- (id)indexPathForSpecifier:(id)a3;
- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4;
- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5;
- (id)popupStylePopoverController;
- (id)selectSpecifier:(id)a3;
- (id)specifier;
- (id)specifierAtIndex:(int64_t)a3;
- (id)specifierAtIndexPath:(id)a3;
- (id)specifierForID:(id)a3;
- (id)specifierID;
- (id)specifiers;
- (id)specifiersForIDs:(id)a3;
- (id)specifiersInGroup:(int64_t)a3;
- (id)table;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 detailTextForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)urlHandlingCompletion;
- (int64_t)_nextGroupInSpecifiersAfterIndex:(int64_t)a3 inArray:(id)a4;
- (int64_t)indexForIndexPath:(id)a3;
- (int64_t)indexForRow:(int64_t)a3 inGroup:(int64_t)a4;
- (int64_t)indexOfGroup:(int64_t)a3;
- (int64_t)indexOfSpecifier:(id)a3;
- (int64_t)indexOfSpecifierID:(id)a3;
- (int64_t)numberOfGroups;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)observerType;
- (int64_t)rowsForGroup:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (void)_addIdentifierForSpecifier:(id)a3;
- (void)_ensureAppearanceProviderAndNavigationCoordinator;
- (void)_insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)_keyboardDidHide:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_loadBundleControllers;
- (void)_moveSpecifierAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)_performHighlightForSpecifierWithID:(id)a3;
- (void)_performHighlightForSpecifierWithID:(id)a3 tryAgainIfFailed:(BOOL)a4;
- (void)_removeContiguousSpecifiers:(id)a3 animated:(BOOL)a4;
- (void)_removeIdentifierForSpecifier:(id)a3;
- (void)_returnKeyPressed:(id)a3;
- (void)_scrollToSpecifierNamed:(id)a3;
- (void)_scrollToSpecifierWithID:(id)a3 animated:(BOOL)a4;
- (void)_setContentInset:(double)a3;
- (void)_setNotShowingSetupController;
- (void)_unloadBundleControllers;
- (void)_updateSectionContentInsetWithAnimation:(BOOL)a3;
- (void)addSpecifier:(id)a3;
- (void)addSpecifier:(id)a3 animated:(BOOL)a4;
- (void)addSpecifiersFromArray:(id)a3;
- (void)addSpecifiersFromArray:(id)a3 animated:(BOOL)a4;
- (void)beginUpdates;
- (void)clearCache;
- (void)clearPendingURL;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)confirmationViewAlternateAcceptedForSpecifier:(id)a3;
- (void)confirmationViewCancelledForSpecifier:(id)a3;
- (void)contentSizeDidChange:(id)a3;
- (void)createGroupIndices;
- (void)createPrequeuedPSTableCells:(unint64_t)a3;
- (void)dataSource:(id)a3 performUpdates:(id)a4;
- (void)dealloc;
- (void)delayedContentSizeDidChange;
- (void)didBecomeActive:(id)a3;
- (void)dismissConfirmationViewAnimated:(BOOL)a3;
- (void)dismissPopover;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissPopoverWithCompletion:(id)a3;
- (void)endUpdates;
- (void)formSheetViewWillDisappear;
- (void)handleScrollPPTTestName:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)highlightSpecifierWithID:(id)a3;
- (void)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4;
- (void)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4 animated:(BOOL)a5;
- (void)insertContiguousSpecifiers:(id)a3 afterSpecifierID:(id)a4;
- (void)insertContiguousSpecifiers:(id)a3 afterSpecifierID:(id)a4 animated:(BOOL)a5;
- (void)insertContiguousSpecifiers:(id)a3 atEndOfGroup:(int64_t)a4;
- (void)insertContiguousSpecifiers:(id)a3 atEndOfGroup:(int64_t)a4 animated:(BOOL)a5;
- (void)insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4;
- (void)insertSpecifier:(id)a3 afterSpecifier:(id)a4;
- (void)insertSpecifier:(id)a3 afterSpecifier:(id)a4 animated:(BOOL)a5;
- (void)insertSpecifier:(id)a3 afterSpecifierID:(id)a4;
- (void)insertSpecifier:(id)a3 afterSpecifierID:(id)a4 animated:(BOOL)a5;
- (void)insertSpecifier:(id)a3 atEndOfGroup:(int64_t)a4;
- (void)insertSpecifier:(id)a3 atEndOfGroup:(int64_t)a4 animated:(BOOL)a5;
- (void)insertSpecifier:(id)a3 atIndex:(int64_t)a4;
- (void)insertSpecifier:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)lazyLoadBundle:(id)a3;
- (void)loadView;
- (void)loseFocus;
- (void)performSpecifierUpdates:(id)a3;
- (void)popupViewWillDisappear;
- (void)prepareSpecifiersMetadata;
- (void)reload;
- (void)reloadIconForSpecifierForBundle:(id)a3;
- (void)reloadSpecifier:(id)a3;
- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4;
- (void)reloadSpecifierAtIndex:(int64_t)a3;
- (void)reloadSpecifierAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)reloadSpecifierID:(id)a3;
- (void)reloadSpecifierID:(id)a3 animated:(BOOL)a4;
- (void)reloadSpecifiers;
- (void)removeContiguousSpecifiers:(id)a3;
- (void)removeLastSpecifier;
- (void)removeLastSpecifierAnimated:(BOOL)a3;
- (void)removeSpecifier:(id)a3;
- (void)removeSpecifier:(id)a3 animated:(BOOL)a4;
- (void)removeSpecifierAtIndex:(int64_t)a3;
- (void)removeSpecifierAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)removeSpecifierID:(id)a3;
- (void)removeSpecifierID:(id)a3 animated:(BOOL)a4;
- (void)replaceContiguousSpecifiers:(id)a3 withSpecifiers:(id)a4;
- (void)replaceContiguousSpecifiers:(id)a3 withSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)returnPressedAtEnd;
- (void)selectRowForSpecifier:(id)a3;
- (void)setAltTextColor:(id)a3;
- (void)setAppearanceProvider:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonTextColor:(id)a3;
- (void)setCachesCells:(BOOL)a3;
- (void)setCellAccessoryColor:(id)a3;
- (void)setCellAccessoryHighlightColor:(id)a3;
- (void)setCellHighlightColor:(id)a3;
- (void)setContentSizeDidChange:(BOOL)a3;
- (void)setDesiredVerticalContentOffset:(float)a3;
- (void)setDesiredVerticalContentOffsetItemNamed:(id)a3;
- (void)setEdgeToEdgeCells:(BOOL)a3;
- (void)setEditableInsertionPointColor:(id)a3;
- (void)setEditablePlaceholderTextColor:(id)a3;
- (void)setEditableSelectionBarColor:(id)a3;
- (void)setEditableSelectionHighlightColor:(id)a3;
- (void)setEditableTextColor:(id)a3;
- (void)setFooterHyperlinkColor:(id)a3;
- (void)setForceSynchronousIconLoadForCreatedCells:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setNavigationCoordinator:(id)a3;
- (void)setPadSelectionColor:(id)a3;
- (void)setPendingURLResourceDictionary:(id)a3;
- (void)setPrefetchingEnabled:(BOOL)a3;
- (void)setReusesCells:(BOOL)a3;
- (void)setSegmentedSliderTrackColor:(id)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setShowingSetupController:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)setSpecifierDataSource:(id)a3;
- (void)setSpecifierID:(id)a3;
- (void)setSpecifierIDPendingPush:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrlHandler:(id)a3;
- (void)setUrlHandlingCompletion:(id)a3;
- (void)setUsesDarkTheme:(BOOL)a3;
- (void)showConfirmationViewForSpecifier:(id)a3;
- (void)showConfirmationViewForSpecifier:(id)a3 useAlert:(BOOL)a4;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)showPINSheet:(id)a3;
- (void)showPINSheet:(id)a3 allowOptionsButton:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)updateSpecifiers:(id)a3 withSpecifiers:(id)a4;
- (void)updateSpecifiersInRange:(_NSRange)a3 withSpecifiers:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSListController

- (double)_tableView:(id)a3 estimatedHeightForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5
{
  return *MEMORY[0x1E4F43D18];
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  [(PSListController *)self _tableView:a3 estimatedHeightForCustomInSection:a4 isHeader:1];
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  [(PSListController *)self _tableView:a3 estimatedHeightForCustomInSection:a4 isHeader:0];
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return [(PSListController *)self _tableView:a3 viewForCustomInSection:a4 isHeader:0];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return [(PSListController *)self _tableView:a3 viewForCustomInSection:a4 isHeader:1];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  [(PSListController *)self _tableView:a3 heightForCustomInSection:a4 isHeader:1];
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  [(PSListController *)self _tableView:a3 heightForCustomInSection:a4 isHeader:0];
  return result;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  int64_t v5 = [(PSListController *)self indexForIndexPath:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v7 = [(NSArray *)self->_specifiers objectAtIndex:v5];
  BOOL v6 = [v7 cellType] != 13;

  return v6;
}

- (id)_tableView:(id)a3 viewForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(NSArray *)self->_specifiers count])
  {
    specifiers = self->_specifiers;
    v9 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
    v10 = -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", [v9 integerValue]);

    v11 = PSHeaderCellClassGroupKey;
    if (!v5) {
      v11 = PSFooterCellClassGroupKey;
    }
    v12 = [v10 propertyForKey:*v11];
    Class v13 = NSClassFromString(v12);
    if (v13)
    {
      v14 = [(PSListController *)self _customViewForSpecifier:v10 class:v13 isHeader:v5];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v15 = _PSLoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "viewForCustomInSection called while _specifiers is nil or empty", v17, 2u);
    }

    v14 = 0;
  }
  return v14;
}

- (int64_t)indexForIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_groups) {
      [(PSListController *)self createGroupIndices];
    }
    uint64_t v5 = [v4 row];
    int64_t v6 = -[PSListController indexOfGroup:](self, "indexOfGroup:", [v4 section]);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      int64_t v7 = v5 + v6 + 1;
    }
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)indexOfGroup:(int64_t)a3
{
  groups = self->_groups;
  if (!groups)
  {
    [(PSListController *)self createGroupIndices];
    groups = self->_groups;
  }
  unint64_t v6 = [(NSMutableArray *)groups count];
  int64_t v7 = self->_groups;
  if (v6 <= a3)
  {
    uint64_t v10 = [(NSMutableArray *)v7 count];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    NSLog(&cfstr_CriticalErrorA.isa, a3, v10, v12);

    Class v13 = [MEMORY[0x1E4F42948] currentDevice];
    LODWORD(v10) = objc_msgSend(v13, "sf_isInternalInstall");

    if (!v10) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    NSLog(&cfstr_Specifiers.isa, self->_specifiers);
    NSLog(&cfstr_GroupIndices.isa, self->_groups);
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v8 bundlePath];
    v15 = [v14 lastPathComponent];
    NSLog(&cfstr_PleaseFileABug.isa, v15);

    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = [(NSMutableArray *)v7 objectAtIndex:a3];
    int64_t v9 = [v8 integerValue];
  }

  return v9;
}

- (id)table
{
  return self->_table;
}

- (NSArray)unprotectedSpecifiers
{
  return self->_specifiers;
}

- (NSString)specifierIDPendingPush
{
  return self->_specifierIDPendingPush;
}

- (double)_tableView:(id)a3 heightForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5
{
  BOOL v5 = a5;
  specifiers = self->_specifiers;
  v8 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
  int64_t v9 = -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", [v8 integerValue]);

  uint64_t v10 = PSHeaderCellClassGroupKey;
  if (!v5) {
    uint64_t v10 = PSFooterCellClassGroupKey;
  }
  v11 = [v9 propertyForKey:*v10];
  Class v12 = NSClassFromString(v11);
  if (!v12) {
    goto LABEL_15;
  }
  Class v13 = [(PSListController *)self _customViewForSpecifier:v9 class:v12 isHeader:v5];
  [(UITableView *)self->_table _sectionContentInset];
  double v15 = v14;
  double v17 = v16;
  [(UITableView *)self->_table bounds];
  if (v18 - v15 - v17 >= 0.0) {
    double v19 = v18 - v15 - v17;
  }
  else {
    double v19 = 0.0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      [v13 preferredHeightForWidth:v19];
      if (v22 >= *MEMORY[0x1E4F43D18]) {
        double v21 = v22;
      }
      else {
        double v21 = *MEMORY[0x1E4F43D18];
      }
      goto LABEL_13;
    }

LABEL_15:
    double v21 = *MEMORY[0x1E4F43D18];
    goto LABEL_16;
  }
  [v13 preferredHeightForWidth:self->_table inTableView:v19];
  double v21 = v20;
LABEL_13:

LABEL_16:
  return v21;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  specifiers = self->_specifiers;
  BOOL v5 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
  unint64_t v6 = -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", [v5 integerValue]);

  int64_t v7 = [v6 propertyForKey:@"footerText"];
  if ([v7 length]
    && ([v6 propertyForKey:@"footerCellClass"],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)appearance
{
  return +[PSListController appearanceWhenContainedInInstancesOfClasses:MEMORY[0x1E4F1CBF0]];
}

+ (id)appearanceWhenContainedInInstancesOfClasses:(id)a3
{
  if (appearanceWhenContainedInInstancesOfClasses__onceToken != -1) {
    dispatch_once(&appearanceWhenContainedInInstancesOfClasses__onceToken, &__block_literal_global_11);
  }
  v3 = (void *)appearanceWhenContainedInInstancesOfClasses___listController;
  return v3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  specifiers = self->_specifiers;
  BOOL v5 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
  unint64_t v6 = -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", [v5 integerValue]);

  int64_t v7 = [v6 name];
  if ([v7 length])
  {
    v8 = [v6 propertyForKey:@"headerCellClass"];
    if (v8) {
      id v9 = 0;
    }
    else {
      id v9 = v7;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)altTextColor
{
  return self->_altTextColor;
}

- (UIColor)cellHighlightColor
{
  return self->_cellHighlightColor;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  groups = self->_groups;
  if (!groups)
  {
    [(PSListController *)self createGroupIndices];
    groups = self->_groups;
  }
  return [(NSMutableArray *)groups count];
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  specifiers = self->_specifiers;
  BOOL v5 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
  unint64_t v6 = -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", [v5 integerValue]);

  int64_t v7 = [v6 propertyForKey:@"alignment"];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    int64_t v8 = [v7 integerValue];
  }
  else {
    int64_t v8 = 4;
  }

  return v8;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  specifiers = self->_specifiers;
  BOOL v5 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
  unint64_t v6 = -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", [v5 integerValue]);

  int64_t v7 = [v6 propertyForKey:@"footerAlignment"];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    int64_t v8 = [v7 integerValue];
  }
  else {
    int64_t v8 = 4;
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(NSMutableArray *)self->_groups count] - 1 == a4)
  {
    NSUInteger v6 = [(NSArray *)self->_specifiers count];
    int64_t v7 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
    int64_t v8 = v6 + ~[v7 integerValue];
  }
  else
  {
    int64_t v7 = [(NSMutableArray *)self->_groups objectAtIndex:a4 + 1];
    uint64_t v9 = [v7 integerValue];
    id v10 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
    int64_t v8 = v9 + ~[v10 integerValue];
  }
  return v8;
}

uint64_t __64__PSListController_appearanceWhenContainedInInstancesOfClasses___block_invoke()
{
  appearanceWhenContainedInInstancesOfClasses___listController = objc_alloc_init(PSListController);
  return MEMORY[0x1F41817F8]();
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v5.receiver = self;
    v5.super_class = (Class)PSListController;
    [(PSListController *)&v5 setTitle:v4];
  }
}

- (void)createPrequeuedPSTableCells:(unint64_t)a3
{
  prequeuedReusablePSTableCells = self->_prequeuedReusablePSTableCells;
  if (prequeuedReusablePSTableCells)
  {
    self->_prequeuedReusablePSTableCells = 0;
  }
  NSUInteger v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  for (i = objc_alloc_init(PSSpecifier); a3; --a3)
  {
    int64_t v7 = [[PSTableCell alloc] initWithStyle:+[PSTableCell cellStyle] reuseIdentifier:@"PSTableCell" specifier:i];
    [(NSMutableArray *)v6 addObject:v7];
  }
  int64_t v8 = self->_prequeuedReusablePSTableCells;
  self->_prequeuedReusablePSTableCells = v6;
}

- (void)insertSpecifier:(id)a3 afterSpecifierID:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(PSListController *)self specifierForID:a4];
  [(PSListController *)self insertSpecifier:v8 afterSpecifier:v9 animated:v5];
}

- (id)specifierForID:(id)a3
{
  specifiersByID = self->_specifiersByID;
  id v5 = a3;
  if (specifiersByID)
  {
    NSUInteger v6 = [(NSMutableDictionary *)specifiersByID objectForKey:v5];
  }
  else
  {
    int64_t v7 = [(PSListController *)self specifiers];
    NSUInteger v6 = [v7 specifierForID:v5];

    id v5 = v7;
  }

  return v6;
}

- (void)insertSpecifier:(id)a3 afterSpecifier:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  specifiers = self->_specifiers;
  if (specifiers)
  {
    if (v8) {
      uint64_t v10 = [(NSArray *)specifiers indexOfObject:v8] + 1;
    }
    else {
      uint64_t v10 = [(NSArray *)specifiers count];
    }
    [(PSListController *)self insertSpecifier:v11 atIndex:v10 animated:v5];
  }
}

- (void)insertSpecifier:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5
{
  if (self->_specifiers)
  {
    BOOL v5 = a5;
    id v8 = (objc_class *)MEMORY[0x1E4F1C978];
    id v9 = a3;
    id v10 = (id)objc_msgSend([v8 alloc], "initWithObjects:", v9, 0);

    [(PSListController *)self insertContiguousSpecifiers:v10 atIndex:a4 animated:v5];
  }
}

- (void)prepareSpecifiersMetadata
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (objc_class *)objc_opt_class();
    NSUInteger v6 = NSStringFromClass(v5);
    int64_t v7 = NSStringFromSelector(a2);
    id v8 = [(PSListController *)self viewIfLoaded];
    id v9 = @"View is loaded";
    *(_DWORD *)buf = 138543874;
    v29 = v6;
    if (!v8) {
      id v9 = @"View is not loaded";
    }
    __int16 v30 = 2114;
    v31 = v7;
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ %@", buf, 0x20u);
  }
  id v10 = self;
  objc_sync_enter(v10);
  specifiers = v10->_specifiers;
  if (specifiers && [(NSArray *)specifiers count])
  {
    uint64_t v12 = [(NSArray *)v10->_specifiers objectAtIndex:0];
    Class v13 = (void *)v12;
    if (v12 && *(void *)(v12 + 56))
    {
      double v14 = (NSArray *)[(NSArray *)v10->_specifiers mutableCopy];
      double v15 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [(NSArray *)v14 insertObject:v15 atIndex:0];

      double v16 = v10->_specifiers;
      v10->_specifiers = v14;
    }
  }
  else
  {
    Class v13 = 0;
  }
  objc_sync_exit(v10);

  [(PSListController *)v10 createGroupIndices];
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](v10->_specifiers, "count"));
  specifiersByID = v10->_specifiersByID;
  v10->_specifiersByID = (NSMutableDictionary *)v17;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v19 = v10->_specifiers;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v19);
        }
        [(PSListController *)v10 _addIdentifierForSpecifier:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }
}

- (void)_insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  v48 = self;
  p_specifiers = &self->_specifiers;
  if (self->_specifiers)
  {
    uint64_t v11 = [v8 count];
    if ((a4 & 0x8000000000000000) == 0 && v11 && [(NSArray *)*p_specifiers count] >= a4)
    {
      uint64_t v53 = -1;
      uint64_t v54 = -1;
      uint64_t v43 = [(NSArray *)*p_specifiers count];
      id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      Class v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
      id v14 = v9;
      double v15 = v14;
      v41 = v13;
      v37 = v9;
      BOOL v39 = a5;
      int64_t v44 = a4;
      if (a4)
      {
        [(PSListController *)self getGroup:&v53 row:&v54 ofSpecifierAtIndex:a4 - 1];
        uint64_t v17 = v53;
        uint64_t v16 = v54;
      }
      else
      {
        double v18 = [v14 objectAtIndex:0];
        if (v18[7])
        {
          double v19 = (void *)[v15 mutableCopy];
          +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
          v21 = id v20 = v12;
          [v19 insertObject:v21 atIndex:0];

          id v12 = v20;
          Class v13 = v41;

          double v15 = v19;
        }

        uint64_t v17 = -1;
        uint64_t v16 = -1;
      }
      uint64_t v46 = v16;
      location = (id *)p_specifiers;
      id v47 = (id)[(NSArray *)*p_specifiers mutableCopy];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = v15;
      uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        char v24 = 0;
        uint64_t v25 = *(void *)v50;
        id v42 = v12;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v50 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            [v47 insertObject:v27 atIndex:a4];
            [(PSListController *)v48 _addIdentifierForSpecifier:v27];
            if (*(void *)(v27 + 56))
            {
              if ((v24 & 1) == 0)
              {
                ++v46;
                v28 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
                [v13 addObject:v28];

                char v24 = 0;
                goto LABEL_28;
              }
LABEL_26:
              char v24 = 1;
              goto LABEL_28;
            }
            [v12 addIndex:++v17];
            if ([v12 count] != 1) {
              goto LABEL_26;
            }
            uint64_t v29 = v43;
            if (v17 != [(NSMutableArray *)v48->_groups count])
            {
              __int16 v30 = [(NSMutableArray *)v48->_groups objectAtIndex:v17];
              uint64_t v29 = [v30 integerValue];
            }
            uint64_t v31 = v29 - v44;
            if (v29 == v44 || v31 < 1)
            {
              char v24 = 1;
              id v12 = v42;
            }
            else
            {
              uint64_t v32 = v54;
              do
              {
                v33 = [MEMORY[0x1E4F28D58] indexPathForRow:++v32 inSection:v53];
                [v40 addObject:v33];
              }
              while (v32 < v31 + v54);
              char v24 = 1;
              Class v13 = v41;
              id v12 = v42;
            }
LABEL_28:
            ++a4;
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        }
        while (v23);
      }

      uint64_t v34 = v48;
      objc_sync_enter(v34);
      objc_storeStrong(location, v47);
      objc_sync_exit(v34);

      [v34 createGroupIndices];
      if (v39)
      {
        uint64_t v35 = 0;
      }
      else
      {
        [MEMORY[0x1E4F42FF0] setAnimationsEnabled:0];
        uint64_t v35 = 5;
      }
      id v9 = v37;
      [v34[131] beginUpdates];
      if ([v40 count]) {
        [v34[131] deleteRowsAtIndexPaths:v40 withRowAnimation:v35];
      }
      if ([v12 count]) {
        [v34[131] insertSections:v12 withRowAnimation:v35];
      }
      if ([v41 count]) {
        [v34[131] insertRowsAtIndexPaths:v41 withRowAnimation:v35];
      }
      [v34[131] endUpdates];
      if (!v39) {
        [MEMORY[0x1E4F42FF0] setAnimationsEnabled:1];
      }
    }
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v36 = _PSLoggingFacility();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[PSListController _insertContiguousSpecifiers:atIndex:animated:](v36);
    }
  }
}

- (void)_addIdentifierForSpecifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  if (!v5)
  {
    BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", v4));
    [v4 setProperty:v5 forKey:@"id"];
  }
  id v6 = v5;
  uint64_t v7 = 0;
  id v8 = v6;
  do
  {
    id v9 = [(NSMutableDictionary *)self->_specifiersByID objectForKey:v8];

    if (!v9)
    {
      id v10 = v8;
      goto LABEL_10;
    }
    id v10 = [NSString stringWithFormat:@"%@.%lu", v6, v7];

    uint64_t v11 = [(NSMutableDictionary *)self->_specifiersByID objectForKey:v10];

    ++v7;
    id v8 = v10;
  }
  while (v11);
  [v4 setProperty:v10 forKey:@"id"];
  id v12 = _PSLoggingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    Class v13 = [v4 name];
    *(_DWORD *)buf = 138413058;
    double v15 = v13;
    __int16 v16 = 2048;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "re-assigned ID for %@ <%p> from %@ to %@", buf, 0x2Au);
  }
LABEL_10:
  [(NSMutableDictionary *)self->_specifiersByID setObject:v4 forKey:v10];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PSListController *)self indexForIndexPath:v7];
  id v9 = self;
  objc_sync_enter(v9);
  id v10 = [(NSArray *)v9->_specifiers objectAtIndex:v8];
  objc_sync_exit(v9);

  if (v9->_cachesCells)
  {
    uint64_t v11 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
    id v12 = [(NSMutableDictionary *)v9->_cells objectForKey:v11];
    if (v12) {
      goto LABEL_29;
    }
    goto LABEL_14;
  }
  if (v9->_reusesCells)
  {
    Class v13 = +[PSTableCell reuseIdentifierForSpecifier:v10];
    id v12 = [v6 dequeueReusableCellWithIdentifier:v13];
    if (v12)
    {
LABEL_6:
      [v10 setProperty:v12 forKey:@"cellObject"];
      goto LABEL_13;
    }
    if ([(NSMutableArray *)v9->_prequeuedReusablePSTableCells count]
      && [v13 isEqualToString:@"PSTableCell"])
    {
      id v12 = [(NSMutableArray *)v9->_prequeuedReusablePSTableCells lastObject];
      [(NSMutableArray *)v9->_prequeuedReusablePSTableCells removeLastObject];
      if (v12) {
        goto LABEL_6;
      }
    }
    else
    {
      id v12 = 0;
    }
LABEL_13:

    uint64_t v11 = 0;
    if (v12) {
      goto LABEL_29;
    }
    goto LABEL_14;
  }
  uint64_t v11 = 0;
LABEL_14:
  id v14 = +[PSTableCell cellClassForSpecifier:v10];
  if ([(objc_class *)v14 isSubclassOfClass:objc_opt_class()])
  {
    [(objc_class *)v14 cellStyle];
    double v15 = [v10 propertyForKey:@"styleOverride"];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (-[PSListController isValidCellStyle:](v9, "isValidCellStyle:", [v15 integerValue])) {
          [v15 integerValue];
        }
      }
    }
  }
  id v12 = [(PSListControllerAppearanceProvider *)v9->_appearanceProvider cellForSpecifier:v10 inController:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 setReusedCell:v9->_reusesCells];
  }
  objc_msgSend(v12, "_accessibilitySetInterfaceStyleIntent:", objc_msgSend(v6, "_accessibilityInterfaceStyleIntent"));
  [v10 setProperty:v12 forKey:@"cellObject"];
  if (v12 && v9->_cachesCells) {
    [(NSMutableDictionary *)v9->_cells setObject:v12 forKey:v11];
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if ([(PSListController *)v9 getGroup:&v20 row:&v19 ofSpecifier:v10])
  {
    __int16 v16 = [(NSArray *)v9->_specifiers objectAtIndex:[(PSListController *)v9 indexOfGroup:v20]];
    id v17 = [v16 propertyForKey:@"radioGroupCheckedSpecifier"];
    if (v10 == v17) {
      [v12 setChecked:1];
    }
  }
LABEL_29:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 setSpecifier:v10];
    [v12 refreshCellContentsWithSpecifier:v10];
    if (v9->_forceSynchronousIconLoadForCreatedCells) {
      [v12 forceSynchronousIconLoadOnNextIconLoad];
    }
  }

  return v12;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5
{
  if (a5 == 0x7FFFFFFFFFFFFFFFLL || !self->_specifiers) {
    return 0;
  }
  groups = self->_groups;
  if (!groups)
  {
    [(PSListController *)self createGroupIndices];
    groups = self->_groups;
  }
  return [(PSListController *)self _getGroup:a3 row:a4 ofSpecifierAtIndex:a5 groups:groups];
}

- (BOOL)_getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5 groups:(id)a6
{
  id v9 = a6;
  int64_t v10 = [v9 count];
  while (1)
  {
    int64_t v11 = v10;
    if (v10-- < 1) {
      break;
    }
    Class v13 = [v9 objectAtIndex:v10];
    int64_t v14 = [v13 integerValue];

    if (v14 <= a5)
    {
      if (a3) {
        *a3 = v10;
      }
      if (a4) {
        *a4 = ~v14 + a5;
      }
      break;
    }
  }

  return v11 > 0;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifier:(id)a5
{
  NSUInteger v8 = [(NSArray *)self->_specifiers indexOfObject:a5];
  return [(PSListController *)self getGroup:a3 row:a4 ofSpecifierAtIndex:v8];
}

- (void)createGroupIndices
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [(PSListController *)obj _createGroupIndices:obj->_specifiers];
  groups = obj->_groups;
  obj->_groups = (NSMutableArray *)v2;

  objc_sync_exit(obj);
}

- (id)_createGroupIndices:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  BOOL v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v7 = [v3 objectAtIndex:i];
      if (!v7[7])
      {
        NSUInteger v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        [v5 addObject:v8];
      }
    }
  }

  return v5;
}

- (PSListController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSListController;
  uint64_t v2 = [(PSViewController *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    v2->_cachesCells = 1;
    v2->_reusesCells = 0;
    [(PSListController *)v2 _ensureAppearanceProviderAndNavigationCoordinator];
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__returnKeyPressed_ name:*MEMORY[0x1E4F43B48] object:0];
    [v4 addObserver:v3 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
    [v4 addObserver:v3 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
    [v4 addObserver:v3 selector:sel__keyboardDidHide_ name:*MEMORY[0x1E4F43AC0] object:0];
    [v4 addObserver:v3 selector:sel_contentSizeDidChange_ name:*MEMORY[0x1E4F43788] object:0];
    [v4 addObserver:v3 selector:sel_didBecomeActive_ name:*MEMORY[0x1E4F43648] object:0];
    BOOL v5 = objc_opt_new();
    [(PSListController *)v3 setUrlHandler:v5];

    id v6 = [(PSListController *)v3 urlHandler];
    [v6 setDelegate:v3];
  }
  return v3;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  [(PSListController *)self _ensureAppearanceProviderAndNavigationCoordinator];
  [(PSListControllerAppearanceProvider *)self->_appearanceProvider estimatedHeightOfRowForCellWithIndexPath:v5 inController:self];
  double v7 = v6;

  return v7;
}

- (void)_ensureAppearanceProviderAndNavigationCoordinator
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1) {
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_876);
  }
  if (!self->_appearanceProvider)
  {
    id v3 = (PSListControllerAppearanceProvider *)objc_alloc_init((Class)defaultAppearanceProviderClass);
    appearanceProvider = self->_appearanceProvider;
    self->_appearanceProvider = v3;
  }
  if (!self->_navigationCoordinator)
  {
    self->_navigationCoordinator = (PSListControllerNavigationCoordinator *)objc_alloc_init((Class)defaultNavigationCoordinatorClass);
    MEMORY[0x1F41817F8]();
  }
}

- (PSURLControllerHandler)urlHandler
{
  return self->_urlHandler;
}

- (void)setUrlHandler:(id)a3
{
}

- (int64_t)indexOfSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  specifiers = v5->_specifiers;
  if (specifiers) {
    int64_t v7 = [(NSArray *)specifiers indexOfObject:v4];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)reloadSpecifier:(id)a3
{
}

- (void)setCellHighlightColor:(id)a3
{
}

- (void)setTextColor:(id)a3
{
}

- (void)setSeparatorColor:(id)a3
{
}

- (void)setForegroundColor:(id)a3
{
}

- (void)setFooterHyperlinkColor:(id)a3
{
}

- (void)setEditableTextColor:(id)a3
{
}

- (void)setEditablePlaceholderTextColor:(id)a3
{
}

- (void)setButtonTextColor:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setAltTextColor:(id)a3
{
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PSListController;
  [(PSListController *)&v22 viewDidLayoutSubviews];
  id v3 = [(PSListController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_msgSend(v12, "sf_isiPad"))
  {
    int v13 = PSIsRunningInAssistant();

    if (v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v24 = 0;
        uint64_t v25 = &v24;
        uint64_t v26 = 0x2050000000;
        __int16 v16 = (void *)getBFFStyleClass_softClass;
        uint64_t v27 = getBFFStyleClass_softClass;
        if (!getBFFStyleClass_softClass)
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __getBFFStyleClass_block_invoke;
          v23[3] = &unk_1E5C5D4D8;
          v23[4] = &v24;
          __getBFFStyleClass_block_invoke((uint64_t)v23);
          __int16 v16 = (void *)v25[3];
        }
        id v17 = v16;
        _Block_object_dispose(&v24, 8);
        __int16 v18 = [v17 sharedStyle];
        [v18 edgeInsetsForTable:self->_table];
        double v5 = v19;
        double v21 = v20;

        double v9 = v9 - (v5 + v21);
      }
    }
  }
  else
  {
  }
  -[UITableView setFrame:](self->_table, "setFrame:", v5, v7, v9, v11);
  [(PSListController *)self _updateSectionContentInsetWithAnimation:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v27.receiver = self;
  v27.super_class = (Class)PSListController;
  [(PSViewController *)&v27 viewDidAppear:a3];
  double v4 = [MEMORY[0x1E4F42738] sharedApplication];
  int v5 = [v4 isRunningTest:@"EnterMMCPane"];

  double v6 = [MEMORY[0x1E4F42738] sharedApplication];
  double v7 = v6;
  if (v5)
  {
    double v8 = @"EnterMMCPane";
LABEL_5:
    [v7 finishedTest:v8 extraResults:0];
LABEL_6:

    goto LABEL_7;
  }
  int v9 = [v6 isRunningTest:@"EnterGeneralPane"];

  double v10 = [MEMORY[0x1E4F42738] sharedApplication];
  double v7 = v10;
  if (v9)
  {
    double v8 = @"EnterGeneralPane";
    goto LABEL_5;
  }
  int v26 = [v10 isRunningTest:@"EnteriCloudPane"];

  if (v26)
  {
    double v7 = [MEMORY[0x1E4F42738] sharedApplication];
    [v7 finishedTest:@"EnteriCloudPane"];
    goto LABEL_6;
  }
LABEL_7:
  if (self->_verticalContentOffset == 0.0)
  {
    offsetItemName = self->_offsetItemName;
    if (!offsetItemName) {
      goto LABEL_18;
    }
    [(PSListController *)self _scrollToSpecifierWithID:offsetItemName animated:0];
    double v11 = self->_offsetItemName;
    self->_offsetItemName = 0;
  }
  else
  {
    double v11 = [(PSListController *)self table];
    [v11 contentSize];
    double v13 = v12;
    [v11 contentInset];
    double v15 = v13 + v14;
    [v11 contentInset];
    double v17 = v15 + v16;
    [v11 frame];
    double v19 = v17 - v18;
    float verticalContentOffset = self->_verticalContentOffset;
    if (v17 - v18 > 0.0 && v19 < verticalContentOffset)
    {
      float verticalContentOffset = v19;
      self->_float verticalContentOffset = verticalContentOffset;
    }
    objc_msgSend(v11, "setContentOffset:", 0.0, verticalContentOffset);
    self->_float verticalContentOffset = 0.0;
  }

LABEL_18:
  if ([(PSListController *)self shouldSelectResponderOnAppearance])
  {
    uint64_t v23 = [(PSListController *)self findFirstVisibleResponder];
    [v23 becomeFirstResponder];
  }
  self->_showingSetupController = 0;
  [(UITableView *)self->_table flashScrollIndicators];
  self->_isVisible = 1;
  highlightItemName = self->_highlightItemName;
  if (highlightItemName)
  {
    [(PSListController *)self _performHighlightForSpecifierWithID:highlightItemName tryAgainIfFailed:1];
    uint64_t v25 = self->_highlightItemName;
    self->_highlightItemName = 0;
  }
}

- (BOOL)shouldSelectResponderOnAppearance
{
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_msgSend(v3, "sf_isiPad") && !self->_hasAppeared)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_updateSectionContentInsetWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(PSListController *)self _ensureAppearanceProviderAndNavigationCoordinator];
  appearanceProvider = self->_appearanceProvider;
  BOOL v6 = [(PSListController *)self _isRegularWidth];
  BOOL sectionContentInsetInitialized = self->_sectionContentInsetInitialized;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PSListController__updateSectionContentInsetWithAnimation___block_invoke;
  v8[3] = &unk_1E5C5D680;
  v8[4] = self;
  [(PSListControllerAppearanceProvider *)appearanceProvider listController:self updateSectionContentInsetAnimated:v3 isRegularWidth:v6 contentInsetInitialized:sectionContentInsetInitialized contentInsetInitializedApplicator:v8];
}

- (BOOL)_isRegularWidth
{
  BOOL v3 = [MEMORY[0x1E4F42F80] traitCollectionWithHorizontalSizeClass:2];
  double v4 = [(PSListController *)self splitViewController];
  int v5 = [v4 traitCollection];
  char v6 = [v5 containsTraitsInCollection:v3];

  return v6;
}

uint64_t __60__PSListController__updateSectionContentInsetWithAnimation___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1161) = 1;
  return result;
}

- (void)loadView
{
  [(PSListController *)self _ensureAppearanceProviderAndNavigationCoordinator];
  BOOL v3 = +[PSListController appearance];
  -[PSListController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", [v3 extendedLayoutIncludesOpaqueBars]);

  id v4 = objc_alloc([(PSListController *)self tableViewClass]);
  int64_t v5 = [(PSListController *)self tableViewStyle];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v10 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  table = self->_table;
  self->_table = v10;

  [(UITableView *)self->_table setDataSource:self];
  [(UITableView *)self->_table setDelegate:self];
  if (self->_prefetchingEnabled) {
    [(UITableView *)self->_table setPrefetchDataSource:self];
  }
  double v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  [(PSListControllerAppearanceProvider *)self->_appearanceProvider customizeTableView:self->_table inContainerView:v12 hostedInSetupController:isKindOfClass & 1 forListController:self];
  [(UIView *)v12 addSubview:self->_table];
  containerView = self->_containerView;
  self->_containerView = v12;
  double v16 = v12;

  [(PSListController *)self setView:self->_containerView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PSListController;
  -[PSViewController viewWillAppear:](&v23, sel_viewWillAppear_);
  if ([MEMORY[0x1E4F42738] shouldMakeUIForDefaultPNG])
  {
    int64_t v5 = [(PSListController *)self table];
    [v5 setShowsVerticalScrollIndicator:0];
  }
  int v6 = [(PSListControllerNavigationCoordinator *)self->_navigationCoordinator listControllerShouldNotDeselectAfterAppearing:self];
  double v7 = [(UITableView *)self->_table indexPathForSelectedRow];
  if (v7)
  {
    if (v6)
    {
      table = self->_table;
      double v9 = [(UITableView *)table indexPathForSelectedRow];
      [(UITableView *)table scrollToRowAtIndexPath:v9 atScrollPosition:1 animated:1];
    }
    else if (v3)
    {
      double v10 = [(PSListController *)self transitionCoordinator];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __35__PSListController_viewWillAppear___block_invoke;
      v21[3] = &unk_1E5C5E038;
      v21[4] = self;
      id v22 = v7;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      double v17 = __35__PSListController_viewWillAppear___block_invoke_2;
      double v18 = &unk_1E5C5E038;
      double v19 = self;
      id v20 = v22;
      [v10 animateAlongsideTransition:v21 completion:&v15];
    }
    else
    {
      [(UITableView *)self->_table deselectRowAtIndexPath:v7 animated:0];
    }
  }
  double v11 = +[PSListController appearance];
  int v12 = [v11 usesDarkTheme];

  if (v12)
  {
    double v13 = [(PSListController *)self table];
    [v13 setIndicatorStyle:2];

    double v14 = [(PSListController *)self table];
    [v14 _accessibilitySetInterfaceStyleIntent:2];
  }
  self->_hasAppeared = 1;
  if ([(PSListController *)self contentSizeDidChange])
  {
    [(PSListController *)self delayedContentSizeDidChange];
    [(PSListController *)self setContentSizeDidChange:0];
  }
}

- (void)didBecomeActive:(id)a3
{
  if ([(PSListController *)self contentSizeDidChange])
  {
    [(PSListController *)self delayedContentSizeDidChange];
    [(PSListController *)self setContentSizeDidChange:0];
  }
}

- (BOOL)contentSizeDidChange
{
  return self->_contentSizeDidChange;
}

- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  int v6 = self;
  objc_sync_enter(v6);
  specifiers = v6->_specifiers;
  if (specifiers) {
    uint64_t v8 = [(NSArray *)specifiers indexOfObject:v9];
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_sync_exit(v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [(PSListController *)v6 reloadSpecifierAtIndex:v8 animated:v4];
  }
}

- (void)reloadSpecifierAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v6 = self;
  objc_sync_enter(v6);
  specifiers = v6->_specifiers;
  int64_t v31 = a3;
  if (specifiers)
  {
    uint64_t v32 = [(NSArray *)specifiers objectAtIndex:a3];
  }
  else
  {
    uint64_t v32 = 0;
  }
  objc_sync_exit(v6);

  unsigned int v28 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
  BOOL v30 = v4;
  if (!v4) {
    [MEMORY[0x1E4F42FF0] setAnimationsEnabled:0];
  }
  v33 = [(UITableView *)v6->_table indexPathForSelectedRow];
  uint64_t v29 = [(PSListController *)v6 indexForIndexPath:v33];
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  if ([(PSListController *)v6 getGroup:&v40 row:&v39 ofSpecifierAtIndex:a3])
  {
    if (v39 < 0)
    {
      id obj = [(PSListController *)v6 specifiersInGroup:v40];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(obj);
            }
            double v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            cells = v6->_cells;
            uint64_t v15 = [MEMORY[0x1E4F29238] valueWithPointer:v13];
            [(NSMutableDictionary *)cells removeObjectForKey:v15];

            [v13 removePropertyForKey:@"cellObject"];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v10);
      }
      [(UITableView *)v6->_table beginUpdates];
      uint64_t v16 = [v32 objectForKeyedSubscript:@"headerView"];
      if ([v16 conformsToProtocol:&unk_1EFBA21A0]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v16 refreshContentsWithSpecifier:v32];
      }
      double v17 = [v32 objectForKeyedSubscript:@"footerView"];
      if ([v17 conformsToProtocol:&unk_1EFBA21A0]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v17 refreshContentsWithSpecifier:v32];
      }
      table = v6->_table;
      double v19 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v40];
      if (v4) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = 5;
      }
      [(UITableView *)table reloadSections:v19 withRowAnimation:v20];

      [(UITableView *)v6->_table endUpdates];
      goto LABEL_38;
    }
    if (v6->_reusesCells)
    {
      uint64_t v8 = v6->_table;
      id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      id obj = [(UITableView *)v8 cellForRowAtIndexPath:v9];
    }
    else
    {
      id obj = [v32 propertyForKey:@"cellObject"];
      if (obj) {
        goto LABEL_29;
      }
      objc_super v27 = v6->_table;
      id v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v39 inSection:v40];
      id obj = [(UITableView *)v27 cellForRowAtIndexPath:v9];
    }

LABEL_29:
    if ([obj canReload] && objc_msgSend(obj, "type") == v32[7])
    {
      [obj reloadWithSpecifier:v32 animated:v4];
    }
    else if (obj || !v6->_reusesCells)
    {
      double v21 = [MEMORY[0x1E4F29238] valueWithPointer:v32];
      [(NSMutableDictionary *)v6->_cells removeObjectForKey:v21];
      [v32 removePropertyForKey:@"cellObject"];
      [(UITableView *)v6->_table beginUpdates];
      id v22 = v6->_table;
      objc_super v23 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v24 = [MEMORY[0x1E4F28D58] indexPathForRow:v39 inSection:v40];
      uint64_t v25 = [v23 arrayWithObject:v24];
      if (v30) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = 5;
      }
      [(UITableView *)v22 reloadRowsAtIndexPaths:v25 withRowAnimation:v26];

      [(UITableView *)v6->_table endUpdates];
    }
LABEL_38:
  }
  if (!v30) {
    [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v28];
  }
  if (v29 == v31) {
    [(UITableView *)v6->_table selectRowAtIndexPath:v33 animated:0 scrollPosition:0];
  }
}

- (id)bundle
{
  if ([(PSListController *)self isMemberOfClass:objc_opt_class()]) {
    [MEMORY[0x1E4F28B50] mainBundle];
  }
  else {
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  }
  return v2;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)viewDidLoad
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_class();
  objc_sync_enter(v3);
  v29.receiver = self;
  v29.super_class = (Class)PSListController;
  [(PSViewController *)&v29 viewDidLoad];
  BOOL v4 = PKLogForCategory(6);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, "PSListController.loadSpecifiersInViewDidLoad");

  int v6 = PKLogForCategory(6);
  double v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v8 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v8;
    __int16 v32 = 2082;
    v33 = "-[PSListController viewDidLoad]";
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PSListController.loadSpecifiersInViewDidLoad", "%{public}@: %{public}s", buf, 0x16u);
  }

  id v9 = [(PSListController *)self specifiers];
  [(PSListController *)self _loadBundleControllers];
  uint64_t v10 = PKLogForCategory(6);
  uint64_t v11 = v10;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v11, OS_SIGNPOST_INTERVAL_END, v5, "PSListController.loadSpecifiersInViewDidLoad", (const char *)&unk_1A6690B76, buf, 2u);
  }

  if (!self->_specifiers)
  {
    specifier = self->super._specifier;
    if (specifier)
    {
      if (specifier->getter)
      {
        id WeakRetained = objc_loadWeakRetained(&specifier->target);
        SFPerformSelector();
        objc_super v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
        specifiers = self->_specifiers;
        self->_specifiers = v27;
      }
    }
  }
  [(PSListController *)self prepareSpecifiersMetadata];
  [(PSListController *)self reload];
  id v12 = objc_loadWeakRetained((id *)&self->super._rootController);
  if (v12)
  {
    double v13 = [(PSViewController *)self rootController];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      uint64_t v15 = [(PSViewController *)self rootController];
      [v15 logSettingsPath];
    }
  }
  id v16 = objc_loadWeakRetained((id *)&self->super._rootController);
  if (v16)
  {
    double v17 = [(PSViewController *)self rootController];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      double v19 = [(PSViewController *)self rootController];
      uint64_t v20 = [v19 aggregateDictionaryPath];

      if ([v20 length])
      {
        double v21 = NSString;
        id v22 = +[PSListController aggregateReportingDomainOverride];
        objc_super v23 = [v21 stringWithFormat:@"%@.%@", v22, v20];

        ADClientAddValueForScalarKey();
        uint64_t v24 = _PSLoggingFacility();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = (uint64_t)v23;
          _os_log_impl(&dword_1A6597000, v24, OS_LOG_TYPE_DEFAULT, "viewDidLoad \"%@\"", buf, 0xCu);
        }
      }
    }
  }
  objc_sync_exit(v3);
}

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (void)reload
{
  [(PSListController *)self clearCache];
  BOOL cachesCells = self->_cachesCells;
  if (self->_cachesCells) {
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_specifiers, "count"));
  }
  else {
    BOOL v4 = 0;
  }
  objc_storeStrong((id *)&self->_cells, v4);
  if (cachesCells) {

  }
  table = self->_table;
  [(UITableView *)table reloadData];
}

- (BOOL)edgeToEdgeCells
{
  return self->_edgeToEdgeCells;
}

- (void)clearCache
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  cells = self->_cells;
  self->_cells = 0;

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v4 = (void *)[(NSArray *)self->_specifiers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removePropertyForKey:@"cellObject"];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_loadBundleControllers
{
  if (!self->_bundlesLoaded)
  {
    uint64_t v3 = [(NSMutableArray *)self->_bundleControllers count];
    self->_bundlesLoaded = 1;
    if (v3)
    {
      uint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = [(NSMutableArray *)self->_bundleControllers objectAtIndex:i];
        [v6 load];
      }
    }
  }
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (void)setEdgeToEdgeCells:(BOOL)a3
{
  self->_edgeToEdgeCells = a3;
}

- (void)setSpecifierID:(id)a3
{
}

- (void)setSegmentedSliderTrackColor:(id)a3
{
}

- (void)setEditableSelectionHighlightColor:(id)a3
{
}

- (void)setEditableSelectionBarColor:(id)a3
{
}

- (void)setEditableInsertionPointColor:(id)a3
{
}

- (void)setCellAccessoryColor:(id)a3
{
}

- (void)setSpecifier:(id)a3
{
  if (self->super._specifier != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PSListController;
    id v4 = a3;
    [(PSViewController *)&v10 setSpecifier:v4];
    BOOL v5 = ([(UITableView *)self->_table _displaysCellContentStringsOnTapAndHold] & 1) != 0|| [(PSSpecifier *)self->super._specifier showContentString];
    [(UITableView *)self->_table _setDisplaysCellContentStringsOnTapAndHold:v5];
    uint64_t v6 = [v4 propertyForKey:@"dataSourceClass"];

    if (v6)
    {
      uint64_t v7 = [NSClassFromString(v6) sharedInstance];
      [(PSListController *)self setSpecifierDataSource:v7];
    }
    else
    {
      [(PSListController *)self setSpecifierDataSource:0];
    }
    uint64_t v8 = [(PSListController *)self title];

    if (!v8)
    {
      long long v9 = [(PSSpecifier *)self->super._specifier name];
      [(PSListController *)self setTitle:v9];
    }
  }
}

- (void)setSpecifierDataSource:(id)a3
{
  BOOL v5 = (PSSpecifierDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    uint64_t v7 = v5;
    [(PSSpecifierDataSource *)dataSource removeObserver:self];
    objc_storeStrong((id *)&self->_dataSource, a3);
    dataSource = (PSSpecifierDataSource *)[(PSSpecifierDataSource *)self->_dataSource addObserver:self];
    BOOL v5 = v7;
  }
  MEMORY[0x1F41817F8](dataSource, v5);
}

+ (void)registerDefaultNavigationCoordinatorClass:(Class)a3
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1) {
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_876);
  }
  defaultNavigationCoordinatorClass = (uint64_t)a3;
}

- (id)tableView:(id)a3 detailTextForHeaderInSection:(int64_t)a4
{
  if ([(NSMutableArray *)self->_groups count] <= (unint64_t)a4
    || ([(NSMutableArray *)self->_groups objectAtIndex:a4],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 integerValue],
        NSUInteger v8 = [(NSArray *)self->_specifiers count],
        v6,
        v7 >= v8))
  {
    id v13 = 0;
  }
  else
  {
    specifiers = self->_specifiers;
    objc_super v10 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
    long long v11 = -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", [v10 integerValue]);

    long long v12 = [v11 propertyForKey:@"headerDetailText"];
    if ([v12 length]) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  return v13;
}

- (void)setUrlHandlingCompletion:(id)a3
{
}

- (void)setSpecifierIDPendingPush:(id)a3
{
}

- (void)setPendingURLResourceDictionary:(id)a3
{
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
  id v10 = a6;
  BOOL v11 = [(PSListController *)self prepareHandlingURLForSpecifierID:a3 resourceDictionary:a4 animatePush:a5];
  if (!v11) {
    [(PSListController *)self setUrlHandlingCompletion:v10];
  }

  return v11;
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(PSListController *)self shouldDeferPushForSpecifierID:v8 urlDictionary:v9];
  if (v10)
  {
    [(PSListController *)self setPendingURLResourceDictionary:v9];
    [(PSListController *)self setSpecifierIDPendingPush:v8];
    if (a5) {
      *a5 = 1;
    }
    id v11 = [(PSListController *)self specifiers];
  }

  return !v10;
}

- (id)indexPathForIndex:(int64_t)a3
{
  uint64_t v7 = -1;
  uint64_t v8 = -1;
  if ([(PSListController *)self getGroup:&v8 row:&v7 ofSpecifierAtIndex:a3])
  {
    if (v7 < 0) {
      uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v3 = v7;
    }
    if (v8 < 0) {
      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v4 = v8;
    }
    BOOL v5 = [MEMORY[0x1E4F28D58] indexPathForRow:v3 inSection:v4];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

+ (BOOL)displaysButtonBar
{
  return 0;
}

+ (void)setAggregateReportingDomainOverride:(id)a3
{
  if ((id)AggregateReportingDomainOverride != a3)
  {
    uint64_t v3 = [a3 copy];
    uint64_t v4 = AggregateReportingDomainOverride;
    AggregateReportingDomainOverride = v3;
    MEMORY[0x1F41817F8](v3, v4);
  }
}

+ (id)aggregateReportingDomainOverride
{
  if (AggregateReportingDomainOverride) {
    return (id)AggregateReportingDomainOverride;
  }
  else {
    return @"com.apple.Preferences.Views";
  }
}

- (void)setReusesCells:(BOOL)a3
{
  if (self->_reusesCells != a3)
  {
    self->_reusesCells = a3;
    if (a3) {
      [(PSListController *)self setCachesCells:0];
    }
  }
}

- (void)setCachesCells:(BOOL)a3
{
  if (self->_cachesCells != a3)
  {
    self->_BOOL cachesCells = a3;
    if (a3)
    {
      [(PSListController *)self setReusesCells:0];
      if (!self->_cells)
      {
        uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        cells = self->_cells;
        self->_cells = v4;
        MEMORY[0x1F41817F8](v4, cells);
      }
    }
    else
    {
      [(PSListController *)self clearCache];
    }
  }
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(PSListController *)self navigationItem];
  [v3 appendFormat:@"<%@ %p: navItem %@, view %p>", v4, self, v5, self->_table];

  return (NSString *)v3;
}

- (id)specifier
{
  return self->super._specifier;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PSListController *)self bundle];
  id v9 = [(PSListController *)self loadSpecifiersFromPlistName:v7 target:v6 bundle:v8];

  return v9;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v22 = 0;
  objc_super v23 = 0;
  id v10 = a4;
  id v11 = [v9 pathForResource:v8 ofType:@"plist"];
  if (!v11)
  {
    long long v12 = _PSLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v9 bundlePath];
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      objc_super v27 = v13;
      _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "Warning: failed to load preferences plist '%@.plist' for bundle %@", buf, 0x16u);
    }
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v11];
  uint64_t v15 = objc_opt_new();
  specifier = self->super._specifier;
  double v21 = v15;
  double v17 = SpecifiersFromPlist(v14, specifier, v10, v8, v9, &v22, &v23, self, &v21);

  char v18 = v21;
  double v19 = v21;

  if (self->_bundleControllers) {
    [(NSMutableArray *)self->_bundleControllers addObjectsFromArray:v19];
  }
  else {
    objc_storeStrong((id *)&self->_bundleControllers, v18);
  }
  [(PSListController *)self setSpecifierID:v23];
  [(PSListController *)self setTitle:v22];

  return v17;
}

- (id)specifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_specifiers)
  {
    if (v2->_dataSource)
    {
      v2->_requestingSpecifiersFromDataSource = 1;
      dataSource = v2->_dataSource;
      uint64_t v4 = [(PSListController *)v2 specifier];
      uint64_t v5 = [(PSSpecifierDataSource *)dataSource specifiersForSpecifier:v4 observer:v2];
      specifiers = v2->_specifiers;
      v2->_specifiers = (NSArray *)v5;

      v2->_requestingSpecifiersFromDataSource = 0;
    }
    else
    {
      id v7 = [(PSSpecifier *)v2->super._specifier propertyForKey:@"label"];
      id v8 = [(PSSpecifier *)v2->super._specifier target];
      uint64_t v9 = [(PSListController *)v2 loadSpecifiersFromPlistName:v7 target:v8];
      id v10 = v2->_specifiers;
      v2->_specifiers = (NSArray *)v9;
    }
  }
  objc_sync_exit(v2);

  id v11 = v2->_specifiers;
  return v11;
}

- (void)_removeIdentifierForSpecifier:(id)a3
{
  uint64_t v4 = [a3 identifier];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(NSMutableDictionary *)self->_specifiersByID removeObjectForKey:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setSpecifiers:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_specifiers == v6)
  {
    objc_sync_exit(v5);
  }
  else
  {
    objc_storeStrong((id *)&v5->_specifiers, a3);
    objc_sync_exit(v5);

    [(PSListController *)v5 prepareSpecifiersMetadata];
    [(PSListController *)v5 reload];
  }
}

- (id)indexPathForSpecifier:(id)a3
{
  int64_t v4 = [(PSListController *)self indexOfSpecifier:a3];
  return [(PSListController *)self indexPathForIndex:v4];
}

- (void)beginUpdates
{
}

- (void)endUpdates
{
}

- (void)reloadSpecifierAtIndex:(int64_t)a3
{
}

- (void)reloadSpecifierID:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PKLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = " not";
    id v11 = "-[PSListController reloadSpecifierID:animated:]";
    int v10 = 136446722;
    if (v4) {
      id v8 = "";
    }
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2082;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_INFO, "%{public}s: identifier: '%{public}@';%{public}s animated",
      (uint8_t *)&v10,
      0x20u);
  }

  uint64_t v9 = [(PSListController *)self specifierForID:v6];
  [(PSListController *)self reloadSpecifier:v9 animated:v4];
}

- (void)reloadSpecifierID:(id)a3
{
}

- (int64_t)indexOfSpecifierID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSListController *)self specifierForID:v4];
  id v6 = self;
  objc_sync_enter(v6);
  if (v5) {
    int64_t v7 = [(NSArray *)v6->_specifiers indexOfObject:v5];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_sync_exit(v6);

  return v7;
}

- (BOOL)containsSpecifier:(id)a3
{
  return [(PSListController *)self indexOfSpecifier:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)numberOfGroups
{
  groups = self->_groups;
  if (!groups)
  {
    [(PSListController *)self createGroupIndices];
    groups = self->_groups;
  }
  return [(NSMutableArray *)groups count];
}

- (id)specifierAtIndexPath:(id)a3
{
  int64_t v4 = [(PSListController *)self indexForIndexPath:a3];
  return [(PSListController *)self specifierAtIndex:v4];
}

- (id)specifierAtIndex:(int64_t)a3
{
  int64_t v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = [(NSArray *)v4->_specifiers count];
  id v6 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    id v6 = [(NSArray *)v4->_specifiers objectAtIndex:a3];
  }
  objc_sync_exit(v4);

  return v6;
}

- (id)getGroupSpecifierForSpecifier:(id)a3
{
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    [(PSListController *)self getGroup:&v8 row:&v7 ofSpecifier:a3];
    int64_t v4 = [(PSListController *)self specifiersInGroup:v8];
    if ([v4 count])
    {
      unint64_t v5 = [v4 objectAtIndexedSubscript:0];
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)getGroupSpecifierForSpecifierID:(id)a3
{
  int64_t v4 = [(PSListController *)self specifierForID:a3];
  unint64_t v5 = [(PSListController *)self getGroupSpecifierForSpecifier:v4];

  return v5;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierID:(id)a5
{
  uint64_t v8 = [(PSListController *)self specifierForID:a5];
  LOBYTE(a4) = [(PSListController *)self getGroup:a3 row:a4 ofSpecifier:v8];

  return (char)a4;
}

- (int64_t)indexForRow:(int64_t)a3 inGroup:(int64_t)a4
{
  unint64_t v5 = [(NSMutableArray *)self->_groups objectAtIndex:a4];
  uint64_t v6 = [v5 integerValue];

  return a3 + v6 + 1;
}

- (int64_t)rowsForGroup:(int64_t)a3
{
  if (!self->_groups) {
    [(PSListController *)self createGroupIndices];
  }
  table = self->_table;
  return [(UITableView *)table numberOfRowsInSection:a3];
}

- (id)specifiersInGroup:(int64_t)a3
{
  if (!self->_groups) {
    [(PSListController *)self createGroupIndices];
  }
  specifiers = self->_specifiers;
  int64_t v6 = [(PSListController *)self indexOfGroup:a3];
  int64_t v7 = [(PSListController *)self rowsForGroup:a3] + 1;
  return -[NSArray subarrayWithRange:](specifiers, "subarrayWithRange:", v6, v7);
}

- (_NSRange)rangeOfSpecifiersInGroupID:(id)a3
{
  int64_t v4 = [(PSListController *)self indexOfSpecifierID:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = 0;
  }
  else
  {
    uint64_t v6 = 1;
    do
    {
      NSUInteger v5 = v6;
      unint64_t v7 = v4 + v6;
      uint64_t v8 = [(PSListController *)self specifiers];
      unint64_t v9 = [v8 count];

      if (v7 >= v9) {
        break;
      }
      int v10 = [(PSListController *)self specifierAtIndex:v7];
      uint64_t v11 = [v10 cellType];

      uint64_t v6 = v5 + 1;
    }
    while (v11);
  }
  NSUInteger v12 = v4;
  NSUInteger v13 = v5;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)insertSpecifier:(id)a3 atEndOfGroup:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v10 = [(NSArray *)self->_specifiers objectAtIndex:[(PSListController *)self tableView:self->_table numberOfRowsInSection:a4]+ [(PSListController *)self indexOfGroup:a4]];
  unint64_t v9 = [v10 identifier];
  [(PSListController *)self insertSpecifier:v8 afterSpecifierID:v9 animated:v5];
}

- (void)insertSpecifier:(id)a3 atIndex:(int64_t)a4
{
}

- (void)insertSpecifier:(id)a3 afterSpecifier:(id)a4
{
}

- (void)insertSpecifier:(id)a3 afterSpecifierID:(id)a4
{
}

- (void)insertSpecifier:(id)a3 atEndOfGroup:(int64_t)a4
{
}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  specifiers = self->_specifiers;
  if (specifiers)
  {
    uint64_t v10 = v8 ? [(NSArray *)specifiers indexOfObject:v8] : [(NSArray *)specifiers count] - 1;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [(PSListController *)self insertContiguousSpecifiers:v11 atIndex:v10 + 1 animated:v5];
    }
  }
}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifierID:(id)a4 animated:(BOOL)a5
{
  if (self->_specifiers)
  {
    BOOL v5 = a5;
    id v8 = a3;
    id v9 = [(PSListController *)self specifierForID:a4];
    [(PSListController *)self insertContiguousSpecifiers:v8 afterSpecifier:v9 animated:v5];
  }
}

- (void)insertContiguousSpecifiers:(id)a3 atEndOfGroup:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v10 = [(NSArray *)self->_specifiers objectAtIndex:[(PSListController *)self tableView:self->_table numberOfRowsInSection:a4]+ [(PSListController *)self indexOfGroup:a4]];
  id v9 = [v10 identifier];
  [(PSListController *)self insertContiguousSpecifiers:v8 afterSpecifierID:v9 animated:v5];
}

- (void)insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4
{
}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4
{
}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifierID:(id)a4
{
}

- (void)insertContiguousSpecifiers:(id)a3 atEndOfGroup:(int64_t)a4
{
}

- (void)addSpecifier:(id)a3
{
}

- (void)addSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  specifiers = self->_specifiers;
  id v7 = a3;
  [(PSListController *)self insertSpecifier:v7 atIndex:[(NSArray *)specifiers count] animated:v4];
}

- (void)addSpecifiersFromArray:(id)a3
{
}

- (void)addSpecifiersFromArray:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  specifiers = self->_specifiers;
  id v7 = a3;
  [(PSListController *)self insertContiguousSpecifiers:v7 atIndex:[(NSArray *)specifiers count] animated:v4];
}

- (void)removeSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = (id)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

  [(PSListController *)self removeContiguousSpecifiers:v8 animated:v4];
}

- (void)removeSpecifierID:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PSListController *)self specifierForID:a3];
  [(PSListController *)self removeSpecifier:v6 animated:v4];
}

- (void)removeSpecifierAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  specifiers = self->_specifiers;
  if (specifiers)
  {
    BOOL v6 = a4;
    unint64_t v8 = [(NSArray *)specifiers count];
    if ((a3 & 0x8000000000000000) == 0 && v8 > a3)
    {
      id v9 = [(NSArray *)self->_specifiers objectAtIndex:a3];
      [(PSListController *)self removeSpecifier:v9 animated:v6];
    }
  }
}

- (void)removeSpecifier:(id)a3
{
}

- (void)removeSpecifierID:(id)a3
{
}

- (void)removeSpecifierAtIndex:(int64_t)a3
{
}

- (void)removeLastSpecifier
{
}

- (void)removeLastSpecifierAnimated:(BOOL)a3
{
  specifiers = self->_specifiers;
  if (specifiers)
  {
    BOOL v5 = a3;
    id v6 = [(NSArray *)specifiers lastObject];
    [(PSListController *)self removeSpecifier:v6 animated:v5];
  }
}

- (void)_removeContiguousSpecifiers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 count];
  location = (id *)&self->_specifiers;
  if (self->_specifiers) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_52;
  }
  uint64_t v60 = -1;
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  id v10 = [MEMORY[0x1E4F28E60] indexSet];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v56 objects:v62 count:16];
  long long v51 = self;
  if (!v12)
  {

    uint64_t v48 = 0;
    goto LABEL_29;
  }
  uint64_t v13 = v12;
  BOOL v42 = v4;
  id v44 = v6;
  uint64_t v46 = v9;
  uint64_t v48 = 0;
  __int16 v14 = 0;
  LOBYTE(v15) = 0;
  uint64_t v16 = *(void *)v57;
  uint64_t v17 = -1;
  uint64_t v18 = -1;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v57 != v16) {
        objc_enumerationMutation(v11);
      }
      id v20 = *(id *)(*((void *)&v56 + 1) + 8 * i);

      long long v50 = v20;
      uint64_t v21 = [*location indexOfObject:v20];
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_27:

        id v6 = v44;
        id v9 = v46;
        goto LABEL_51;
      }
      uint64_t v22 = v21;
      if (v18 == -1)
      {
        [(PSListController *)v51 getGroup:&v60 row:0 ofSpecifierAtIndex:v21];
        objc_super v23 = [(NSMutableArray *)v51->_groups objectAtIndex:v60];
        uint64_t v17 = [v23 integerValue];

        uint64_t v18 = v22;
        uint64_t v48 = v22;
      }
      else if (v21 != v18)
      {
        goto LABEL_27;
      }
      __int16 v14 = v20;
      if (*((void *)v20 + 7))
      {
        if ((v15 & 1) == 0)
        {
          uint64_t v24 = [MEMORY[0x1E4F28D58] indexPathForRow:v18 + ~v17 inSection:v60];
          [v46 insertObject:v24 atIndex:0];

          __int16 v14 = v20;
          int v15 = 0;
          goto LABEL_22;
        }
      }
      else
      {
        if (v48 != v18) {
          ++v60;
        }
        objc_msgSend(v10, "addIndex:");
      }
      int v15 = 1;
LABEL_22:
      ++v18;
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v13) {
      continue;
    }
    break;
  }

  if (v15)
  {
    uint64_t v25 = v60;
    self = v51;
    BOOL v4 = v42;
    if (v25 == [(NSMutableArray *)v51->_groups count] - 1)
    {
      uint64_t v26 = [*location count] - v48;
    }
    else
    {
      uint64_t v40 = [(NSMutableArray *)v51->_groups objectAtIndex:v60 + 1];
      uint64_t v26 = [v40 integerValue] - v48;
    }
    id v6 = v44;
    id v9 = v46;
    goto LABEL_30;
  }
  id v6 = v44;
  id v9 = v46;
  self = v51;
  BOOL v4 = v42;
LABEL_29:
  uint64_t v26 = [v11 count];
LABEL_30:
  if (v4) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = 5;
  }
  if (!v4) {
    [MEMORY[0x1E4F42FF0] setAnimationsEnabled:0];
  }
  [(UITableView *)self->_table beginUpdates];
  uint64_t v28 = (void *)[*location mutableCopy];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v50 = v28;
  objc_super v29 = objc_msgSend(v28, "subarrayWithRange:", v48, v26);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v41 = v26;
    id v45 = v6;
    id v47 = v9;
    BOOL v43 = v4;
    __int16 v32 = 0;
    uint64_t v33 = *(void *)v53;
    do
    {
      uint64_t v34 = 0;
      long long v35 = v32;
      do
      {
        if (*(void *)v53 != v33) {
          objc_enumerationMutation(v29);
        }
        __int16 v32 = *(id *)(*((void *)&v52 + 1) + 8 * v34);

        if (v32[7])
        {
          cells = self->_cells;
          long long v37 = [MEMORY[0x1E4F29238] valueWithPointer:v32];
          [(NSMutableDictionary *)cells removeObjectForKey:v37];

          self = v51;
          [v32 removePropertyForKey:@"cellObject"];
        }
        [(PSListController *)self _removeIdentifierForSpecifier:v32];
        ++v34;
        long long v35 = v32;
      }
      while (v31 != v34);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v31);

    id v6 = v45;
    id v9 = v47;
    LOBYTE(v4) = v43;
    uint64_t v26 = v41;
  }

  objc_msgSend(v50, "removeObjectsInRange:", v48, v26);
  long long v38 = self;
  objc_sync_enter(v38);
  objc_storeStrong(location, v50);
  objc_sync_exit(v38);

  [(PSListController *)v38 createGroupIndices];
  if ([v10 count]) {
    [(UITableView *)self->_table deleteSections:v10 withRowAnimation:v27];
  }
  if ([v9 count]) {
    [(UITableView *)self->_table deleteRowsAtIndexPaths:v9 withRowAnimation:v27];
  }
  [(UITableView *)self->_table endUpdates];
  if (!v4) {
    [MEMORY[0x1E4F42FF0] setAnimationsEnabled:1];
  }
LABEL_51:

LABEL_52:
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v39 = _PSLoggingFacility();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
      -[PSListController _removeContiguousSpecifiers:animated:](v39);
    }
  }
}

- (void)removeContiguousSpecifiers:(id)a3
{
}

- (void)replaceContiguousSpecifiers:(id)a3 withSpecifiers:(id)a4
{
}

- (void)replaceContiguousSpecifiers:(id)a3 withSpecifiers:(id)a4 animated:(BOOL)a5
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 count];
  uint64_t v10 = [v13 count];
  if (v9 && v10)
  {
    id v11 = [v13 objectAtIndex:0];
    int64_t v12 = [(PSListController *)self indexOfSpecifier:v11];
    if (a5)
    {
      [(UITableView *)self->_table beginUpdates];
      [(PSListController *)self _removeContiguousSpecifiers:v13 animated:1];
      [(PSListController *)self _insertContiguousSpecifiers:v8 atIndex:v12 animated:1];
      [(UITableView *)self->_table endUpdates];
    }
    else
    {
      [MEMORY[0x1E4F42FF0] setAnimationsEnabled:0];
      [(UITableView *)self->_table beginUpdates];
      [(PSListController *)self _removeContiguousSpecifiers:v13 animated:0];
      [(PSListController *)self _insertContiguousSpecifiers:v8 atIndex:v12 animated:0];
      [(UITableView *)self->_table endUpdates];
      [MEMORY[0x1E4F42FF0] setAnimationsEnabled:1];
    }
  }
}

- (int64_t)_nextGroupInSpecifiersAfterIndex:(int64_t)a3 inArray:(id)a4
{
  id v5 = a4;
  unint64_t v6 = a3 + 1;
  do
  {
    int64_t v7 = v6;
    if (v6 >= [v5 count]) {
      break;
    }
    id v8 = [v5 objectAtIndex:v7];
    uint64_t v9 = v8[7];

    unint64_t v6 = v7 + 1;
  }
  while (v9);

  return v7;
}

- (void)updateSpecifiers:(id)a3 withSpecifiers:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    int64_t v7 = [v8 objectAtIndex:0];
    if ([(NSArray *)self->_specifiers containsObject:v7]) {
      -[PSListController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", -[NSArray indexOfObject:](self->_specifiers, "indexOfObject:", v7), [v8 count], v6);
    }
  }
}

- (void)updateSpecifiersInRange:(_NSRange)a3 withSpecifiers:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v85 = a4;
  if ([v85 count])
  {
    if (length)
    {
      p_specifiers = &self->_specifiers;
      specifiers = self->_specifiers;
      if (specifiers)
      {
        if (location <= [(NSArray *)specifiers count])
        {
          NSUInteger v8 = length + location;
          if (length + location <= [(NSArray *)*p_specifiers count])
          {
            NSUInteger v66 = length;
            uint64_t v67 = [v85 objectAtIndex:0];
            uint64_t v91 = -1;
            uint64_t v92 = -1;
            BOOL v9 = [(PSListController *)self getGroup:&v91 row:&v92 ofSpecifierAtIndex:location];
            uint64_t v10 = v91;
            uint64_t v89 = -1;
            uint64_t v90 = -1;
            if (v8 == [(NSArray *)*p_specifiers count])
            {
              uint64_t v89 = [(NSMutableArray *)self->_groups count];
            }
            else if (v9)
            {
              BOOL v9 = [(PSListController *)self getGroup:&v89 row:&v90 ofSpecifierAtIndex:v8];
            }
            int64_t v12 = (void *)v67;
            if (*(void *)(v67 + 56)) {
              BOOL v13 = 0;
            }
            else {
              BOOL v13 = v92 == -1;
            }
            if (v13 && v90 == -1 && v9)
            {
              id v16 = objc_alloc_init(MEMORY[0x1E4F28E60]);
              id v17 = objc_alloc_init(MEMORY[0x1E4F28E60]);
              id v70 = objc_alloc_init(MEMORY[0x1E4F28E60]);
              id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              int64_t v79 = [(PSListController *)self _nextGroupInSpecifiersAfterIndex:0 inArray:v85];
              v69 = v16;
              if (![v85 count]) {
                goto LABEL_71;
              }
              unint64_t v78 = 0;
              v71 = v17;
              v81 = v18;
              v82 = self;
              NSUInteger v68 = location;
              while (1)
              {
                uint64_t v19 = v91;
                if (v91 >= v89)
                {
                  uint64_t v20 = v10;
                  goto LABEL_69;
                }
                uint64_t v20 = v10;
                do
                {
                  uint64_t v21 = *p_specifiers;
                  uint64_t v22 = [(NSMutableArray *)self->_groups objectAtIndex:v19];
                  objc_super v23 = -[NSArray objectAtIndex:](v21, "objectAtIndex:", [v22 integerValue]);

                  uint64_t v24 = [v85 objectAtIndex:v78];
                  uint64_t v25 = [v23 identifier];
                  v80 = v24;
                  uint64_t v26 = [v24 identifier];
                  int v27 = [v25 isEqualToString:v26];

                  if (v27)
                  {
                    int v76 = v27;
                    for (uint64_t i = v91; i < v19; ++i)
                      [v71 addIndex:i];
                    objc_super v29 = [v23 propertyForKey:@"footerText"];
                    uint64_t v30 = [v80 propertyForKey:@"footerText"];
                    v77 = v23;
                    uint64_t v31 = [v23 name];
                    __int16 v32 = [v80 name];
                    v74 = (void *)v30;
                    v75 = v29;
                    if (![v31 isEqualToString:v32] || (v29 != 0) != (v30 != 0))
                    {

                      int v27 = v76;
                      goto LABEL_32;
                    }
                    if (v29 && v30)
                    {
                      char v34 = [v29 isEqualToString:v30];

                      int v27 = v76;
                      if (v34)
                      {
LABEL_45:
                        long long v35 = [(NSMutableArray *)self->_groups objectAtIndex:v19];
                        uint64_t v36 = [v35 integerValue];

                        if (v19 + 1 == [(NSMutableArray *)self->_groups count])
                        {
                          uint64_t v37 = [(NSArray *)*p_specifiers count];
                        }
                        else
                        {
                          long long v38 = [(NSMutableArray *)self->_groups objectAtIndex:v19 + 1];
                          uint64_t v39 = [v38 integerValue];

                          uint64_t v37 = v39;
                        }
                        unint64_t v40 = 0x1E4F28000;
                        uint64_t v41 = v73;
                        uint64_t v42 = v36 + 1;
                        uint64_t v83 = v37;
                        if ((uint64_t)(v78 + 1) < v79)
                        {
                          uint64_t v43 = 0;
                          unint64_t v86 = v78 + 1;
                          uint64_t v72 = v20;
                          do
                          {
                            if (v42 >= v37) {
                              goto LABEL_62;
                            }
                            uint64_t v44 = v42;
                            do
                            {
                              id v45 = [v85 objectAtIndex:v86];
                              uint64_t v46 = [(NSArray *)*p_specifiers objectAtIndex:v44];
                              id v47 = [v45 identifier];
                              uint64_t v48 = [v46 identifier];
                              int v49 = [v47 isEqualToString:v48];

                              if (v49)
                              {
                                for (; v42 < v44; ++v42)
                                {
                                  long long v50 = (void *)MEMORY[0x1E4F28D58];
                                  long long v51 = [(NSMutableArray *)v82->_groups objectAtIndex:v19];
                                  long long v52 = objc_msgSend(v50, "indexPathForRow:inSection:", ~objc_msgSend(v51, "integerValue") + v42, v19);
                                  [v81 addObject:v52];
                                }
                                ++v44;
                                ++v43;
                                uint64_t v42 = v44;
                                uint64_t v37 = v83;
                              }
                              else
                              {
                                ++v44;
                              }

                              if (v44 >= v37) {
                                int v53 = 1;
                              }
                              else {
                                int v53 = v49;
                              }
                            }
                            while (v53 != 1);
                            id v18 = v81;
                            self = v82;
                            char v54 = v49;
                            uint64_t v20 = v72;
                            uint64_t v41 = v73;
                            unint64_t v40 = 0x1E4F28000uLL;
                            if ((v54 & 1) == 0)
                            {
LABEL_62:
                              [*(id *)(v40 + 3416) indexPathForRow:v43 inSection:v20];
                              long long v56 = v55 = v43;
                              [v41 addObject:v56];

                              uint64_t v43 = v55 + 1;
                            }
                            ++v86;
                          }
                          while (v86 != v79);
                        }
                        if (v42 < v37)
                        {
                          do
                          {
                            long long v57 = *(void **)(v40 + 3416);
                            long long v58 = [(NSMutableArray *)self->_groups objectAtIndex:v19];
                            long long v59 = objc_msgSend(v57, "indexPathForRow:inSection:", ~objc_msgSend(v58, "integerValue") + v42, v19);
                            [v18 addObject:v59];

                            ++v42;
                          }
                          while (v83 != v42);
                        }
                        objc_super v23 = v77;
                        int v27 = v76;
                        ++v19;
                      }
                      else
                      {
LABEL_32:
                        [v70 addIndex:v19++];
                      }
                      uint64_t v91 = v19;
                      ++v20;

                      goto LABEL_35;
                    }

                    goto LABEL_45;
                  }
                  ++v19;
LABEL_35:

                  if (v19 >= v89) {
                    int v33 = 1;
                  }
                  else {
                    int v33 = v27;
                  }
                }
                while (v33 != 1);
                NSUInteger location = v68;
                id v16 = v69;
                id v17 = v71;
                if ((v27 & 1) == 0) {
LABEL_69:
                }
                  [v16 addIndex:v20++];
                uint64_t v10 = v20;
                unint64_t v78 = v79;
                int64_t v79 = [(PSListController *)self _nextGroupInSpecifiersAfterIndex:v79 inArray:v85];
                if (v78 >= [v85 count])
                {
LABEL_71:
                  for (uint64_t j = v91; j < v89; ++j)
                    [v17 addIndex:j];
                  v61 = -[NSArray subarrayWithRange:](*p_specifiers, "subarrayWithRange:", location, v66);
                  v88[0] = MEMORY[0x1E4F143A8];
                  v88[1] = 3221225472;
                  v88[2] = __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke;
                  v88[3] = &unk_1E5C5E010;
                  v88[4] = self;
                  [v61 enumerateObjectsUsingBlock:v88];

                  v87[0] = MEMORY[0x1E4F143A8];
                  v87[1] = 3221225472;
                  v87[2] = __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke_2;
                  v87[3] = &unk_1E5C5E010;
                  v87[4] = self;
                  [v85 enumerateObjectsUsingBlock:v87];
                  v62 = (void *)[(NSArray *)*p_specifiers mutableCopy];
                  NSUInteger v63 = location;
                  v64 = v62;
                  objc_msgSend(v62, "replaceObjectsInRange:withObjectsFromArray:", v63, v66, v85);
                  v65 = self;
                  objc_sync_enter(v65);
                  objc_storeStrong((id *)p_specifiers, v64);
                  objc_sync_exit(v65);

                  [(PSListController *)v65 createGroupIndices];
                  [(UITableView *)v65->_table beginUpdates];
                  if ([v70 count]) {
                    [(UITableView *)v65->_table reloadSections:v70 withRowAnimation:0];
                  }
                  if ([v73 count]) {
                    [(UITableView *)v65->_table insertRowsAtIndexPaths:v73 withRowAnimation:0];
                  }
                  if ([v69 count]) {
                    [(UITableView *)v65->_table insertSections:v69 withRowAnimation:0];
                  }
                  if ([v18 count]) {
                    [(UITableView *)v65->_table deleteRowsAtIndexPaths:v18 withRowAnimation:0];
                  }
                  if ([v17 count]) {
                    [(UITableView *)v65->_table deleteSections:v17 withRowAnimation:0];
                  }
                  [(UITableView *)v65->_table endUpdates];

                  int64_t v12 = (void *)v67;
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    id v11 = -[NSArray subarrayWithRange:](self->_specifiers, "subarrayWithRange:", location, length);
    [(PSListController *)self removeContiguousSpecifiers:v11 animated:1];
  }
}

void __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5[7])
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1032);
    BOOL v4 = [MEMORY[0x1E4F29238] valueWithPointer:v5];
    [v3 removeObjectForKey:v4];

    [v5 removePropertyForKey:@"cellObject"];
  }
  [*(id *)(a1 + 32) _removeIdentifierForSpecifier:v5];
}

uint64_t __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addIdentifierForSpecifier:a2];
}

- (void)_unloadBundleControllers
{
  if (self->_bundlesLoaded)
  {
    uint64_t v3 = [(NSMutableArray *)self->_bundleControllers count];
    if (v3)
    {
      uint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
      {
        id v6 = [(NSMutableArray *)self->_bundleControllers objectAtIndex:i];
        [v6 unload];
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(PSListController *)self dismissConfirmationViewAnimated:0];
  [(PSSpecifierDataSource *)self->_dataSource removeObserver:self];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PSListController *)self clearCache];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_specifiers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 removePropertyForKey:@"footerView"];
        [v9 removePropertyForKey:@"cellObject"];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(PSListController *)self _unloadBundleControllers];
  [(UITableView *)self->_table setDataSource:0];
  [(UITableView *)self->_table setDelegate:0];
  [(UITableView *)self->_table setDataSource:0];
  v10.receiver = self;
  v10.super_class = (Class)PSListController;
  [(PSListController *)&v10 dealloc];
}

- (void)delayedContentSizeDidChange
{
  [(UITableView *)self->_table _purgeReuseQueues];
  [(PSListController *)self reload];
}

- (void)contentSizeDidChange:(id)a3
{
  if ([(PSListControllerNavigationCoordinator *)self->_navigationCoordinator listControllerIsOnTopOfNavigationStack:self searchTopMostViewControllerChildren:0])
  {
    [(PSListController *)self delayedContentSizeDidChange];
  }
  else
  {
    [(PSListController *)self setContentSizeDidChange:1];
  }
}

- (int64_t)tableViewStyle
{
  [(PSListController *)self _ensureAppearanceProviderAndNavigationCoordinator];
  appearanceProvider = self->_appearanceProvider;
  return [(PSListControllerAppearanceProvider *)appearanceProvider tableViewStyleForListController:self];
}

- (void)viewDidUnload
{
  [(UITableView *)self->_table setDelegate:0];
  [(UITableView *)self->_table setDataSource:0];
  table = self->_table;
  self->_table = 0;

  [(PSListController *)self _unloadBundleControllers];
  v4.receiver = self;
  v4.super_class = (Class)PSListController;
  [(PSListController *)&v4 viewDidUnload];
}

- (void)loseFocus
{
  id v4 = [(UITableView *)self->_table indexPathForSelectedRow];
  [(UITableView *)self->_table endEditing:0];
  uint64_t v3 = v4;
  if (v4)
  {
    [(UITableView *)self->_table deselectRowAtIndexPath:v4 animated:0];
    uint64_t v3 = v4;
  }
}

- (void)reloadSpecifiers
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v3 = PKLogForCategory(6);
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, "PSListController.reloadSpecifiers");

  uint64_t v5 = PKLogForCategory(6);
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = self;
    __int16 v32 = 2082;
    int v33 = "-[PSListController reloadSpecifiers]";
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PSListController.reloadSpecifiers", "%{public}@: %{public}s", buf, 0x16u);
  }

  uint64_t v7 = [(UITableView *)self->_table indexPathForSelectedRow];
  if (v7)
  {
    NSUInteger v8 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:v7]];
    BOOL v9 = [v8 identifier];
  }
  else
  {
    BOOL v9 = 0;
  }
  objc_super v10 = self;
  objc_sync_enter(v10);
  specifiers = v10->_specifiers;
  v10->_specifiers = 0;

  specifiersByID = v10->_specifiersByID;
  v10->_specifiersByID = 0;

  groups = v10->_groups;
  v10->_groups = 0;

  objc_sync_exit(v10);
  id v14 = [(PSListController *)v10 specifiers];
  [(PSListController *)v10 prepareSpecifiersMetadata];
  [(PSListController *)v10 reload];
  id WeakRetained = objc_loadWeakRetained((id *)&v10->super._rootController);
  uint64_t v16 = [WeakRetained viewControllers];

  uint64_t v17 = [v16 indexOfObject:v10];
  if ([v16 count] > (unint64_t)(v17 + 1))
  {
    id v18 = objc_msgSend(v16, "objectAtIndex:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v18 specifier];
      uint64_t v20 = [v19 identifier];
      uint64_t v21 = [(PSListController *)v10 specifierForID:v20];

      if (objc_opt_respondsToSelector())
      {
        uint64_t v22 = [v18 specifier];
        [v18 migrateSpecifierMetadataFrom:v22 to:v21];
      }
      [v18 setSpecifier:v21];
    }
  }
  if (v9)
  {
    objc_super v23 = [(PSListController *)v10 specifierForID:v9];
    if (v23)
    {
      table = self->_table;
      uint64_t v25 = [(PSListController *)v10 indexPathForIndex:[(PSListController *)v10 indexOfSpecifier:v23]];
      [(UITableView *)table selectRowAtIndexPath:v25 animated:0 scrollPosition:0];
    }
  }
  [(PSListController *)v10 setForceSynchronousIconLoadForCreatedCells:1];
  id v26 = [(UITableView *)self->_table visibleCells];
  [(PSListController *)v10 setForceSynchronousIconLoadForCreatedCells:0];
  int v27 = PKLogForCategory(6);
  uint64_t v28 = v27;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v28, OS_SIGNPOST_INTERVAL_END, v4, "PSListController.reloadSpecifiers", (const char *)&unk_1A6690B76, buf, 2u);
  }

  objc_sync_exit(obj);
}

- (id)specifierID
{
  return self->_specifierID;
}

- (id)cachedCellForSpecifier:(id)a3
{
  cells = self->_cells;
  os_signpost_id_t v4 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  uint64_t v5 = [(NSMutableDictionary *)cells objectForKey:v4];

  return v5;
}

- (id)cachedCellForSpecifierID:(id)a3
{
  os_signpost_id_t v4 = [(PSListController *)self specifierForID:a3];
  uint64_t v5 = [(PSListController *)self cachedCellForSpecifier:v4];

  return v5;
}

- (BOOL)isValidCellStyle:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  os_signpost_id_t v4 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:a4]];
  uint64_t v5 = [v4 properties];
  uint64_t v6 = [v5 objectForKey:@"enabled"];

  BOOL v7 = !v6 || [v6 BOOLValue];
  return v7;
}

- (id)_customViewForSpecifier:(id)a3 class:(Class)a4 isHeader:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = v8;
  objc_super v10 = PSHeaderViewKey;
  if (!v5) {
    objc_super v10 = PSFooterViewKey;
  }
  long long v11 = *v10;
  long long v12 = [v8 propertyForKey:*v10];
  if (!v12)
  {
    long long v12 = (void *)[[a4 alloc] initWithSpecifier:v9];
    [v9 setProperty:v12 forKey:v11];
  }
  objc_msgSend(v12, "_accessibilitySetInterfaceStyleIntent:", -[UITableView _accessibilityInterfaceStyleIntent](self->_table, "_accessibilityInterfaceStyleIntent"));
  [v12 setAlpha:1.0];

  return v12;
}

uint64_t __35__PSListController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1048) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
}

uint64_t __35__PSListController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    BOOL v5 = *(void **)(*(void *)(a1 + 32) + 1048);
    return [v5 selectRowAtIndexPath:v4 animated:0 scrollPosition:0];
  }
  return result;
}

- (void)_scrollToSpecifierWithID:(id)a3 animated:(BOOL)a4
{
  uint64_t v6 = [(PSListController *)self specifierForID:a3];
  if (v6)
  {
    NSUInteger v7 = [(NSArray *)self->_specifiers indexOfObject:v6];
    id v8 = [(PSListController *)self indexPathForIndex:v7];
    if (v8)
    {
      BOOL v9 = v8;
      if ([v8 row] == 0x7FFFFFFFFFFFFFFFLL
        && ![(PSListController *)self _isEmptyGroup:v7])
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(v9, "section"));

        BOOL v9 = (void *)v10;
      }
      dispatch_time_t v11 = dispatch_time(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PSListController__scrollToSpecifierWithID_animated___block_invoke;
      block[3] = &unk_1E5C5E060;
      id v14 = v9;
      int v15 = self;
      BOOL v16 = a4;
      id v12 = v9;
      dispatch_after(v11, MEMORY[0x1E4F14428], block);
    }
  }
}

void __54__PSListController__scrollToSpecifierWithID_animated___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) section];
  if (v2 >= [*(id *)(*(void *)(a1 + 40) + 1048) numberOfSections])
  {
    NSUInteger v7 = _PSLoggingFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      return;
    }
    uint64_t v8 = [*(id *)(a1 + 32) section];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 1048) numberOfSections];
    int v16 = 134218240;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    uint64_t v10 = "Scroll target index path section %ld is out of bounds. Current number of sections is %ld.";
    dispatch_time_t v11 = v7;
    uint32_t v12 = 22;
LABEL_11:
    _os_log_error_impl(&dword_1A6597000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, v12);
    goto LABEL_9;
  }
  uint64_t v3 = [*(id *)(a1 + 32) row];
  if (v3 >= objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1048), "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section")))
  {
    NSUInteger v7 = _PSLoggingFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v13 = [*(id *)(a1 + 32) row];
    uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1048), "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
    uint64_t v15 = [*(id *)(a1 + 32) section];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    uint64_t v19 = v14;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    uint64_t v10 = "Scroll target index path row %ld is out of bounds. Current number of row is %ld for section %ld.";
    dispatch_time_t v11 = v7;
    uint32_t v12 = 32;
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(*(void *)(a1 + 40) + 1048);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  [v5 scrollToRowAtIndexPath:v4 atScrollPosition:1 animated:v6];
}

- (BOOL)_isEmptyGroup:(unint64_t)a3
{
  unint64_t v4 = a3 + 1;
  if (a3 + 1 >= [(NSArray *)self->_specifiers count]) {
    return 1;
  }
  BOOL v5 = [(NSArray *)self->_specifiers objectAtIndexedSubscript:v4];
  BOOL v6 = [v5 cellType] == 0;

  return v6;
}

- (void)_scrollToSpecifierNamed:(id)a3
{
}

- (id)findFirstVisibleResponder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(UITableView *)self->_table visibleCells];
  id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = 0;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      BOOL v6 = 0;
      NSUInteger v7 = v4;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v4 = *(id *)(*((void *)&v9 + 1) + 8 * (void)v6);

        if ([v4 canBecomeFirstResponder])
        {
          id v3 = v4;
          goto LABEL_11;
        }
        BOOL v6 = (char *)v6 + 1;
        NSUInteger v7 = v4;
      }
      while (v3 != v6);
      id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PSListController *)self isMovingFromParentViewController]) {
    [(PSListController *)self dismissConfirmationViewAnimated:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)PSListController;
  [(PSViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSListController;
  [(PSViewController *)&v4 viewDidDisappear:a3];
  self->_isVisible = 0;
}

- (void)formSheetViewWillDisappear
{
  v7.receiver = self;
  v7.super_class = (Class)PSListController;
  [(PSViewController *)&v7 formSheetViewWillDisappear];
  self->_showingSetupController = 0;
  navigationCoordinator = self->_navigationCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
  LODWORD(navigationCoordinator) = [(PSListControllerNavigationCoordinator *)navigationCoordinator listControllerShouldDeselectAfterFormSheetDisappearance:self givenRootController:WeakRetained];

  if (navigationCoordinator)
  {
    table = self->_table;
    BOOL v6 = [(UITableView *)table indexPathForSelectedRow];
    [(UITableView *)table deselectRowAtIndexPath:v6 animated:1];
  }
}

- (void)popupViewWillDisappear
{
  v3.receiver = self;
  v3.super_class = (Class)PSListController;
  [(PSViewController *)&v3 popupViewWillDisappear];
  self->_showingSetupController = 0;
}

- (void)returnPressedAtEnd
{
  id v9 = [(PSListController *)self navigationItem];
  uint64_t v2 = [v9 rightBarButtonItem];
  int v3 = [v2 isEnabled];

  if (v3)
  {
    objc_super v4 = [v9 rightBarButtonItem];
    [v4 action];
    objc_super v5 = [v9 rightBarButtonItem];
    BOOL v6 = [v5 target];
    objc_super v7 = [v9 rightBarButtonItem];
    id v8 = (id)SFPerformSelector();
  }
}

- (void)_returnKeyPressed:(id)a3
{
  if ([(UITableView *)self->_table _isAncestorOfFirstResponder])
  {
    objc_super v4 = [MEMORY[0x1E4F42B20] activeInstance];
    id v7 = [v4 delegate];

    NSClassFromString(&cfstr_Uifieldeditor.isa);
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(&cfstr_Uitextfield.isa), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = [v7 _nextKeyResponder];
      if (v5) {
        BOOL v6 = v5 == v7;
      }
      else {
        BOOL v6 = 1;
      }
      if (!v6 && TopToBottomLeftToRightViewCompare(v7, v5) == -1) {
        [v5 becomeFirstResponder];
      }
      else {
        [(PSListController *)self returnPressedAtEnd];
      }
    }
  }
}

- (BOOL)performActionForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 performLegacyAction];
    BOOL v6 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(&cfstr_SSpecifierIsNi.isa, Name);
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)performLoadActionForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 controllerLoadAction])
    {
      [v5 performControllerLoadAction];
    }
    else if (!CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0))
    {
      [v5 performLegacyAction];
    }
    BOOL v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(&cfstr_SSpecifierIsNi.isa, Name);
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)performButtonActionForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 buttonAction])
    {
      [v5 performButtonAction];
    }
    else if (!CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0))
    {
      [v5 performLegacyAction];
    }
    BOOL v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(&cfstr_SSpecifierIsNi.isa, Name);
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)performConfirmationActionForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 confirmationAction])
    {
      [v5 performConfirmationAction];
    }
    else if ([v5 buttonAction] && objc_msgSend(v5, "cellType") == 13)
    {
      [v5 performButtonAction];
    }
    else if (!CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0))
    {
      [v5 performLegacyAction];
    }
    BOOL v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(&cfstr_SSpecifierIsNi.isa, Name);
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)performConfirmationAlternateActionForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 confirmationAlternateAction])
    {
      [v5 performConfirmationAlternateAction];
    }
    else if ([v5 buttonAction] && objc_msgSend(v5, "cellType") == 13)
    {
      [v5 performButtonAction];
    }
    else if (!CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0))
    {
      [v5 performLegacyAction];
    }
    BOOL v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(&cfstr_SSpecifierIsNi.isa, Name);
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)performConfirmationCancelActionForSpecifier:(id)a3
{
  id v4 = (id *)a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 confirmationCancelAction])
    {
      [v5 performConfirmationCancelAction];
    }
    else if ([v5 legacyCancel] {
           && !CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0))
    }
    {
      [v5 legacyCancel];
      id WeakRetained = objc_loadWeakRetained(v5 + 1);
      id v10 = (id)SFPerformSelector();
    }
    BOOL v6 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(&cfstr_SSpecifierIsNi.isa, Name);
    BOOL v6 = 0;
  }

  return v6;
}

- (void)showConfirmationViewForSpecifier:(id)a3 useAlert:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(PSListController *)self presentedViewController];

  if (v8)
  {
    Name = sel_getName(a2);
    id v10 = [(PSListController *)self presentedViewController];
    NSLog(&cfstr_SOnWhileAlread.isa, Name, self, v10);
  }
  else
  {
    long long v11 = (void *)MEMORY[0x1E4F42728];
    if (v4)
    {
      long long v12 = [v7 title];
      uint64_t v13 = [v7 prompt];
      uint64_t v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

      uint64_t v15 = (void *)MEMORY[0x1E4F42720];
      [v7 okButton];
    }
    else
    {
      int v16 = [v7 prompt];
      uint64_t v14 = [v11 alertControllerWithTitle:v16 message:0 preferredStyle:0];

      uint64_t v15 = (void *)MEMORY[0x1E4F42720];
      [v7 title];
    uint64_t v17 = };
    if ([v7 isDestructive]) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 0;
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke;
    v34[3] = &unk_1E5C5D860;
    v34[4] = self;
    id v19 = v7;
    id v35 = v19;
    __int16 v20 = [v15 actionWithTitle:v17 style:v18 handler:v34];
    [v14 addAction:v20];

    uint64_t v21 = [v19 alternateButton];

    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F42720];
      objc_super v23 = [v19 alternateButton];
      if ([v19 isAlternateDestructive]) {
        uint64_t v24 = 2;
      }
      else {
        uint64_t v24 = 0;
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_2;
      v32[3] = &unk_1E5C5D860;
      v32[4] = self;
      id v33 = v19;
      uint64_t v25 = [v22 actionWithTitle:v23 style:v24 handler:v32];
      [v14 addAction:v25];
    }
    id v26 = [v19 cancelButton];

    if (v26)
    {
      int v27 = (void *)MEMORY[0x1E4F42720];
      uint64_t v28 = [v19 cancelButton];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_3;
      v30[3] = &unk_1E5C5D860;
      v30[4] = self;
      id v31 = v19;
      objc_super v29 = [v27 actionWithTitle:v28 style:1 handler:v30];
      [v14 addAction:v29];
    }
    [(PSListController *)self presentViewController:v14 animated:1 completion:0];
  }
}

uint64_t __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) confirmationViewAcceptedForSpecifier:*(void *)(a1 + 40)];
}

uint64_t __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) confirmationViewAlternateAcceptedForSpecifier:*(void *)(a1 + 40)];
}

uint64_t __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) confirmationViewCancelledForSpecifier:*(void *)(a1 + 40)];
}

- (void)showConfirmationViewForSpecifier:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F42948];
  id v5 = a3;
  id v6 = [v4 currentDevice];
  -[PSListController showConfirmationViewForSpecifier:useAlert:](self, "showConfirmationViewForSpecifier:useAlert:", v5, objc_msgSend(v6, "sf_isiPad"));
}

- (void)dismissConfirmationViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PSListController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(PSListController *)self dismissViewControllerAnimated:v3 completion:0];
  }
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  if ([(PSListController *)self performConfirmationActionForSpecifier:a3])
  {
    table = self->_table;
    [(UITableView *)table selectRowAtIndexPath:0 animated:1 scrollPosition:0];
  }
}

- (void)confirmationViewAlternateAcceptedForSpecifier:(id)a3
{
  if ([(PSListController *)self performConfirmationAlternateActionForSpecifier:a3])
  {
    table = self->_table;
    [(UITableView *)table selectRowAtIndexPath:0 animated:1 scrollPosition:0];
  }
}

- (void)confirmationViewCancelledForSpecifier:(id)a3
{
  if ([(PSListController *)self performConfirmationCancelActionForSpecifier:a3])
  {
    table = self->_table;
    [(UITableView *)table selectRowAtIndexPath:0 animated:1 scrollPosition:0];
  }
}

- (void)lazyLoadBundle:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (id *)a3;
  id v5 = PKLogForCategory(6);
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, "PSListController.lazyLoadBundle");

  id v7 = PKLogForCategory(6);
  id v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v22 = 138543618;
    objc_super v23 = self;
    __int16 v24 = 2114;
    uint64_t v25 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PSListController.lazyLoadBundle", "%{public}@: lazyLoadBundleWithSpecifier '%{public}@'", (uint8_t *)&v22, 0x16u);
  }

  id v10 = [v4 propertyForKey:@"lazy-bundle"];
  if (v10)
  {
    long long v11 = [MEMORY[0x1E4F28B50] bundleWithPath:v10];
    long long v12 = [v4 propertyForKey:@"overridePrincipalClass"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      uint64_t v14 = [v4 propertyForKey:@"detail"];
      if (v14)
      {
        uint64_t v15 = v14;
        Class v16 = NSClassFromString(v14);
        if (v16)
        {
          Class v17 = v16;

LABEL_14:
          v4[6] = v17;
          if (!v4[8])
          {
            id v19 = [v4 propertyForKey:@"pane"];
            v4[8] = (id)[v11 classNamed:v19];
          }
          [v4 setLegacyAction:0];
          [v4 setControllerLoadAction:0];
          [v4 removePropertyForKey:@"lazy-bundle"];
          if (objc_opt_respondsToSelector()) {
            [v4[6] validateSpecifier:v4];
          }
          __int16 v20 = PKLogForCategory(6);
          uint64_t v21 = v20;
          if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            int v22 = 138543362;
            objc_super v23 = self;
            _os_signpost_emit_with_name_impl(&dword_1A6597000, v21, OS_SIGNPOST_INTERVAL_END, v6, "PSListController.lazyLoadBundle", "%{public}@: Loaded bundle successfully.", (uint8_t *)&v22, 0xCu);
          }

          goto LABEL_22;
        }
        [v11 load];
        Class v17 = NSClassFromString(v15);

        if (v17) {
          goto LABEL_14;
        }
      }
    }
    Class v17 = (Class)[v11 principalClass];
    goto LABEL_14;
  }
  [v4 setLegacyAction:0];
  [v4 setControllerLoadAction:0];
  uint64_t v18 = PKLogForCategory(6);
  long long v11 = v18;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    int v22 = 138543362;
    objc_super v23 = self;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v11, OS_SIGNPOST_INTERVAL_END, v6, "PSListController.lazyLoadBundle", "%{public}@: No bundle path found.", (uint8_t *)&v22, 0xCu);
  }
LABEL_22:
}

- (id)controllerForRowAtIndexPath:(id)a3
{
  int64_t v4 = [(PSListController *)self indexForIndexPath:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || self->_showingSetupController)
  {
    id v5 = 0;
  }
  else
  {
    os_signpost_id_t v6 = [(NSArray *)self->_specifiers objectAtIndex:v4];
    id v5 = [(PSListController *)self selectSpecifier:v6];
  }
  return v5;
}

- (id)selectSpecifier:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = PKLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    unint64_t v9 = NSStringFromSelector(a2);
    id v10 = [(PSListController *)self viewIfLoaded];
    long long v11 = [v10 window];
    long long v12 = [(PSListController *)self navigationController];
    int v13 = [(PSListController *)self parentViewController];
    uint64_t v14 = [(PSViewController *)self parentController];
    int v17 = 138546178;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    __int16 v20 = v9;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2160;
    uint64_t v26 = 1752392040;
    __int16 v27 = 2112;
    uint64_t v28 = v11;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2112;
    __int16 v32 = v12;
    __int16 v33 = 2160;
    uint64_t v34 = 1752392040;
    __int16 v35 = 2112;
    uint64_t v36 = v13;
    __int16 v37 = 2160;
    uint64_t v38 = 1752392040;
    __int16 v39 = 2112;
    unint64_t v40 = v14;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { specifier: %{mask.hash}@, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", (uint8_t *)&v17, 0x7Au);
  }
  uint64_t v15 = [(PSListController *)self controllerForSpecifier:v5];

  return v15;
}

- (id)controllerForSpecifier:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0)
    && ![v4 confirmationAction]
    && ![v4 controllerLoadAction]
    && ![v4 buttonAction])
  {
    if (*((void *)v4 + 7) == 4 && ![v4 legacyAction])
    {
      __int16 v29 = PKLogForCategory(7);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[PSListController controllerForSpecifier:]();
      }

      goto LABEL_16;
    }
    if ([v4 legacyAction]
      && [(PSListController *)self performActionForSpecifier:v4]
      && [v4 legacyAction])
    {
      id v5 = PKLogForCategory(7);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[PSListController controllerForSpecifier:].cold.8();
      }
      goto LABEL_9;
    }
  }
  if ([v4 buttonAction]
    && [(PSListController *)self performButtonActionForSpecifier:v4])
  {
    id v5 = PKLogForCategory(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PSListController controllerForSpecifier:].cold.7();
    }
LABEL_9:

    [(UITableView *)self->_table selectRowAtIndexPath:0 animated:0 scrollPosition:0];
LABEL_16:
    unint64_t v9 = 0;
    goto LABEL_50;
  }
  if ([v4 controllerLoadAction]
    && [(PSListController *)self performLoadActionForSpecifier:v4])
  {
    uint64_t v6 = [v4 controllerLoadAction];
    id v7 = PKLogForCategory(7);
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PSListController controllerForSpecifier:].cold.6(v4, v8);
      }

      goto LABEL_16;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PSListController controllerForSpecifier:].cold.5();
    }
  }
  unint64_t v10 = [v4 cellType];
  long long v11 = [(PSListController *)self table];
  long long v12 = [(PSListController *)self indexPathForSpecifier:v4];
  int v13 = [v11 cellForRowAtIndexPath:v12];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 8) {
    [v13 becomeFirstResponder];
  }
  if (v10 <= 0xB && ((1 << v10) & 0xC0E) != 0)
  {
    int v14 = v10 == 3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v14 = [v13 canBeChecked];
    }
    if (v13 && v14)
    {
      uint64_t v30 = 0;
      *(void *)buf = 0;
      if ([(PSListController *)self getGroup:buf row:&v30 ofSpecifier:v4])
      {
        uint64_t v15 = [(NSArray *)self->_specifiers objectAtIndex:[(PSListController *)self indexOfGroup:*(void *)buf]];
        Class v16 = [v15 propertyForKey:@"isRadioGroup"];
        if ([v16 BOOLValue])
        {
          id v17 = [v15 propertyForKey:@"radioGroupCheckedSpecifier"];
          uint64_t v18 = v17;
          if (v17 != v4)
          {
            __int16 v19 = [v17 propertyForKey:@"cellObject"];
            [v19 setChecked:0];
            [v19 setValue:0];
            __int16 v20 = [v4 propertyForKey:@"cellObject"];
            [v20 setChecked:1];
          }
          [v15 setProperty:v4 forKey:@"radioGroupCheckedSpecifier"];
        }
      }
      __int16 v21 = PKLogForCategory(7);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PSListController controllerForSpecifier:]();
      }

      unint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_49;
    }
    if (!v13 || ([v13 isUserInteractionEnabled] & 1) != 0)
    {
      unint64_t v9 = CreateDetailControllerInstanceWithClass(*((objc_class **)v4 + 6));
      uint64_t v22 = +[PSListController appearance];
      objc_msgSend(v9, "setExtendedLayoutIncludesOpaqueBars:", objc_msgSend(v22, "extendedLayoutIncludesOpaqueBars"));

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      self->_BOOL showingSetupController = isKindOfClass & 1;
      if ((isKindOfClass & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
        [v9 setRootController:WeakRetained];
      }
      [v9 setParentController:self];
      [v9 setSpecifier:v4];
      __int16 v25 = PKLogForCategory(7);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        BOOL showingSetupController = self->_showingSetupController;
        *(_DWORD *)buf = 141559554;
        *(void *)&uint8_t buf[4] = 1752392040;
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2160;
        uint64_t v35 = 1752392040;
        __int16 v36 = 2112;
        __int16 v37 = v9;
        __int16 v38 = 2160;
        uint64_t v39 = 1752392040;
        __int16 v40 = 2112;
        uint64_t v41 = self;
        __int16 v42 = 1024;
        BOOL v43 = showingSetupController;
        _os_log_debug_impl(&dword_1A6597000, v25, OS_LOG_TYPE_DEBUG, "%{mask.hash}@: Action created target controller %{mask.hash}@, set showingSetupController of presenting controller %{mask.hash}@ to %{BOOL}d.", buf, 0x44u);
      }

      goto LABEL_49;
    }
    uint64_t v26 = PKLogForCategory(7);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[PSListController controllerForSpecifier:].cold.4();
    }
  }
  else
  {
    uint64_t v26 = PKLogForCategory(7);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[PSListController controllerForSpecifier:]();
    }
  }

  unint64_t v9 = 0;
LABEL_49:

LABEL_50:
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  int64_t v5 = [(PSListController *)self indexForIndexPath:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || self->_showingSetupController)
  {
    id v14 = 0;
LABEL_4:
    table = self->_table;
    id v7 = [(UITableView *)table indexPathForSelectedRow];
    id v8 = [MEMORY[0x1E4F1CA98] null];
    [(UITableView *)table deselectRowAtIndexPath:v7 animated:v14 == v8];

    goto LABEL_5;
  }
  unint64_t v9 = [(NSArray *)self->_specifiers objectAtIndex:v5];
  id v7 = v9;
  uint64_t v10 = v9[7];
  if (v10 == 4)
  {
    if (![v9 controllerLoadAction])
    {
      id v14 = 0;
      if (CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0)) {
        goto LABEL_21;
      }
    }
  }
  else if (v10 == 13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PSListController *)self showConfirmationViewForSpecifier:v7];
      id v14 = 0;
      goto LABEL_5;
    }
    [(PSListController *)self performButtonActionForSpecifier:v7];
    goto LABEL_19;
  }
  uint64_t v11 = [(PSListController *)self selectSpecifier:v7];
  if (!v11)
  {
LABEL_19:
    id v14 = 0;
    goto LABEL_21;
  }
  id v14 = (id)v11;
  id v12 = [MEMORY[0x1E4F1CA98] null];
  if (v14 == v12)
  {

    goto LABEL_21;
  }
  int v13 = [(PSListControllerNavigationCoordinator *)self->_navigationCoordinator listControllerIsOnTopOfNavigationStack:self searchTopMostViewControllerChildren:1];

  if (!v13)
  {
LABEL_21:

    goto LABEL_4;
  }
  [(PSListController *)self showController:v14];
LABEL_5:
}

- (id)specifiersForIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[PSListController specifierForID:](self, "specifierForID:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(PSListController *)self navigationController];
    uint64_t v9 = [v8 childViewControllers];

    if ([v9 containsObject:v7])
    {
      uint64_t v10 = _PSLoggingFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PSListController showController:animate:](v10);
      }

      uint64_t v11 = _PSLoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PSListController showController:animate:]();
      }

      id v12 = _PSLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PSListController showController:animate:]();
      }
    }
    long long v13 = PKLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      long long v15 = (char *)objc_claimAutoreleasedReturnValue();
      long long v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138544386;
      uint64_t v22 = v15;
      __int16 v23 = 2114;
      id v24 = v16;
      __int16 v25 = 2160;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 1024;
      BOOL v30 = v4;
      _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ called with %{mask.hash}@, %{BOOL}d", buf, 0x30u);
    }
    objc_initWeak((id *)buf, self);
    navigationCoordinator = self->_navigationCoordinator;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__PSListController_showController_animate___block_invoke;
    v19[3] = &unk_1E5C5E088;
    objc_copyWeak(&v20, (id *)buf);
    [(PSListControllerNavigationCoordinator *)navigationCoordinator listController:self pushViewController:v7 givenRootController:WeakRetained withModalStylePopupStateApplicator:v19 animated:v4];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v9 = _PSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[PSListController showController:animate:]";
      _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "%s: attempted to push nil controller", buf, 0xCu);
    }
  }
}

void __43__PSListController_showController_animate___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[1098] = a2;
  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return !self->_popupIsModal;
}

- (void)dismissPopover
{
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
}

- (void)dismissPopoverWithCompletion:(id)a3
{
}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  int64_t v5 = [(PSListController *)self presentedViewController];
  uint64_t v6 = [v5 modalPresentationStyle];

  if (v6 == 7)
  {
    [(PSListController *)self dismissViewControllerAnimated:1 completion:v7];
    self->_popupIsModal = 0;
  }
}

- (void)showController:(id)a3
{
}

- (void)clearPendingURL
{
  [(PSListController *)self setPendingURLResourceDictionary:0];
  [(PSListController *)self setSpecifierIDPendingPush:0];
  [(PSListController *)self setUrlHandlingCompletion:0];
}

- (BOOL)handlePendingURL
{
  pendingURLResourceDictionary = self->_pendingURLResourceDictionary;
  if (pendingURLResourceDictionary)
  {
    BOOL v4 = [(PSListController *)self urlHandlingCompletion];
    [(PSListController *)self handleURL:pendingURLResourceDictionary withCompletion:v4];

    [(PSListController *)self clearPendingURL];
  }
  return pendingURLResourceDictionary != 0;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 0;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (-[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment")&& (-[PSListController viewIfLoaded](self, "viewIfLoaded"), id v7 = objc_claimAutoreleasedReturnValue(), [v7 window], v8 = objc_claimAutoreleasedReturnValue(), v8, v7, !v8))
  {
    [(PSViewController *)self setUrlResourceDictionaryPendingViewControllerContainment:v10];
    [(PSViewController *)self setUrlCompletionHandlerPendingViewControllerContainment:v6];
  }
  else
  {
    uint64_t v9 = [(PSListController *)self urlHandler];
    [v9 handleURL:v10 withCompletion:v6];
  }
}

- (void)reloadIconForSpecifierForBundle:(id)a3
{
  id v14 = a3;
  BOOL v4 = self->_specifiers;
  uint64_t v5 = [(NSArray *)v4 count];
  if (v5 < 1)
  {
LABEL_5:
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._parentController);
    [WeakRetained reloadIconForSpecifierForBundle:v14];
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 1;
    while (1)
    {
      id WeakRetained = [(NSArray *)v4 objectAtIndex:v7 - 1];
      uint64_t v9 = [WeakRetained propertyForKey:@"bundle"];
      int v10 = [v9 isEqual:v14];

      if (v10) {
        break;
      }

      if (v7++ >= v6) {
        goto LABEL_5;
      }
    }
    id v12 = [(PSListController *)self bundle];
    long long v13 = [v12 resourcePath];
    [WeakRetained setupIconImageWithPath:v13];

    [(PSListController *)self reload];
  }
}

- (double)_getKeyboardIntersectionHeightFromUserInfo:(id)a3
{
  BOOL v4 = [a3 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  long long v13 = (void *)MEMORY[0x1E4F42D90];
  id v14 = [(PSListController *)self view];
  objc_msgSend(v13, "convertRect:toView:", v14, v6, v8, v10, v12);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  BOOL IsEmpty = CGRectIsEmpty(v28);
  double result = 0.0;
  if (!IsEmpty)
  {
    __int16 v25 = [(PSListController *)self view];
    [v25 bounds];
    double MaxY = CGRectGetMaxY(v29);
    v30.origin.x = v16;
    v30.origin.y = v18;
    v30.size.width = v20;
    v30.size.height = v22;
    double v27 = MaxY - CGRectGetMinY(v30);

    return fmax(v27, 0.0);
  }
  return result;
}

- (void)_setContentInset:(double)a3
{
  [(UITableView *)self->_table contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UITableView setContentInset:](self->_table, "setContentInset:");
  table = self->_table;
  -[UITableView setScrollIndicatorInsets:](table, "setScrollIndicatorInsets:", v6, v8, a3, v10);
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UITableView *)self->_table superview];

  if (v5)
  {
    double v6 = [v4 userInfo];
    double v7 = [v6 objectForKey:*MEMORY[0x1E4F43AF0]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    objc_msgSend(MEMORY[0x1E4F42D90], "convertRect:toView:", self->_table, v9, v11, v13, v15);
    double v17 = v16;
    CGFloat v18 = [v6 objectForKey:*MEMORY[0x1E4F43AE8]];
    [v18 CGRectValue];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    objc_msgSend(MEMORY[0x1E4F42D90], "convertRect:toView:", self->_table, v20, v22, v24, v26);
    double v27 = (CGPoint *)MEMORY[0x1E4F1DAD8];
    if (v28 == v17)
    {
      [(PSListController *)self _getKeyboardIntersectionHeightFromUserInfo:v6];
      -[PSListController _setContentInset:](self, "_setContentInset:");
      p_contentOffsetWithKeyboard = &self->_contentOffsetWithKeyboard;
      if (self->_contentOffsetWithKeyboard.x != v27->x || self->_contentOffsetWithKeyboard.y != v27->y)
      {
        [(UITableView *)self->_table frame];
        v54.x = p_contentOffsetWithKeyboard->x;
        v54.y = self->_contentOffsetWithKeyboard.y;
        if (CGRectContainsPoint(v55, v54)) {
          -[UITableView setContentOffset:](self->_table, "setContentOffset:", p_contentOffsetWithKeyboard->x, self->_contentOffsetWithKeyboard.y);
        }
      }
    }
    else
    {
      CGRect v29 = [(UITableView *)self->_table visibleCells];
      CGRect v30 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v31 = [v6 objectForKey:*MEMORY[0x1E4F43AA0]];
      [v31 floatValue];
      double v33 = v32;
      __int16 v34 = [v6 objectForKey:*MEMORY[0x1E4F43A98]];
      uint64_t v35 = PSAnimationOptionsFromAnimationCurve([v34 integerValue]);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __38__PSListController__keyboardWillShow___block_invoke;
      v50[3] = &unk_1E5C5DDD0;
      v50[4] = self;
      id v51 = v6;
      [v30 animateWithDuration:v35 delay:v50 options:0 animations:v33 completion:0.0];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v36 = v29;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v47 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if (objc_msgSend(v41, "_isAncestorOfFirstResponder", (void)v46))
            {
              table = self->_table;
              BOOL v43 = [(UITableView *)table indexPathForCell:v41];
              [(UITableView *)table scrollToRowAtIndexPath:v43 atScrollPosition:3 animated:1];

              goto LABEL_13;
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v46 objects:v52 count:16];
          if (v38) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    self->_contentOffsetWithKeyboard = *v27;
  }
}

uint64_t __38__PSListController__keyboardWillShow___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _getKeyboardIntersectionHeightFromUserInfo:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_setContentInset:");
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = a3;
  double v5 = [(UITableView *)self->_table superview];

  if (v5)
  {
    double v6 = [v4 userInfo];
    double v7 = [v6 objectForKey:*MEMORY[0x1E4F43AF0]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    objc_msgSend(MEMORY[0x1E4F42D90], "convertRect:toView:", self->_table, v9, v11, v13, v15);
    double v17 = v16;
    CGFloat v18 = [v6 objectForKey:*MEMORY[0x1E4F43AE8]];
    [v18 CGRectValue];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    objc_msgSend(MEMORY[0x1E4F42D90], "convertRect:toView:", self->_table, v20, v22, v24, v26);
    if (v27 == v17)
    {
      [(UITableView *)self->_table contentOffset];
      self->_contentOffsetWithKeyboard.x = v34;
      self->_contentOffsetWithKeyboard.y = v35;
    }
    else
    {
      double v28 = (void *)MEMORY[0x1E4F42FF0];
      CGRect v29 = [v6 objectForKey:*MEMORY[0x1E4F43AA0]];
      [v29 floatValue];
      double v31 = v30;
      float v32 = [v6 objectForKey:*MEMORY[0x1E4F43A98]];
      uint64_t v33 = PSAnimationOptionsFromAnimationCurve([v32 integerValue]);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __38__PSListController__keyboardWillHide___block_invoke;
      v36[3] = &unk_1E5C5D680;
      v36[4] = self;
      [v28 animateWithDuration:v33 delay:v36 options:0 animations:v31 completion:0.0];
    }
  }
}

uint64_t __38__PSListController__keyboardWillHide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setContentInset:0.0];
}

- (void)_keyboardDidHide:(id)a3
{
}

- (void)selectRowForSpecifier:(id)a3
{
  if (a3)
  {
    -[PSListController indexPathForIndex:](self, "indexPathForIndex:", -[NSArray indexOfObject:](self->_specifiers, "indexOfObject:"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UITableView *)self->_table selectRowAtIndexPath:v4 animated:0 scrollPosition:0];
  }
}

- (float)verticalContentOffset
{
  uint64_t v2 = [(PSListController *)self table];
  [v2 contentOffset];
  float v4 = v3;

  return v4;
}

- (void)setDesiredVerticalContentOffset:(float)a3
{
  self->_float verticalContentOffset = a3;
}

- (void)setDesiredVerticalContentOffsetItemNamed:(id)a3
{
  float v4 = (NSString *)[a3 copy];
  offsetItemName = self->_offsetItemName;
  self->_offsetItemName = v4;
  MEMORY[0x1F41817F8](v4, offsetItemName);
}

- (void)highlightSpecifierWithID:(id)a3
{
  if (self->_isVisible)
  {
    [(PSListController *)self _performHighlightForSpecifierWithID:a3 tryAgainIfFailed:1];
  }
  else
  {
    float v4 = (NSString *)[a3 copy];
    highlightItemName = self->_highlightItemName;
    self->_highlightItemName = v4;
    MEMORY[0x1F41817F8](v4, highlightItemName);
  }
}

- (void)_performHighlightForSpecifierWithID:(id)a3
{
}

- (void)_performHighlightForSpecifierWithID:(id)a3 tryAgainIfFailed:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  double v6 = -[PSListController indexPathForIndex:](self, "indexPathForIndex:", -[PSListController indexOfSpecifierID:](self, "indexOfSpecifierID:"));
  if (v6)
  {
    double v7 = v6;
    if ([v6 row] == 0x7FFFFFFFFFFFFFFFLL
      && ![(PSListController *)self _isEmptyGroup:[(PSListController *)self indexForIndexPath:v7]])
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(v7, "section"));

      double v7 = (void *)v8;
    }
    double v9 = [(UITableView *)self->_table cellForRowAtIndexPath:v7];
    UIAnimationDragCoefficient();
    double v11 = v10 * 0.5;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      double v12 = [(UITableView *)self->_table visibleCells];
      int v13 = [v12 containsObject:v9];

      if (v13)
      {
        [v9 highlightCellForDuration:1 animateUnighlight:0.5];
        goto LABEL_12;
      }
    }
    else
    {
      [(UITableView *)self->_table scrollToRowAtIndexPath:v7 atScrollPosition:2 animated:1];
    }
    if (v4) {
      [(PSListController *)self performSelector:sel__performHighlightForSpecifierWithID_ withObject:v14 afterDelay:v11];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)_setNotShowingSetupController
{
  self->_BOOL showingSetupController = 0;
}

- (void)_moveSpecifierAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if ([(NSArray *)v8->_specifiers count] <= a3 || [(NSArray *)v8->_specifiers count] < a4)
  {
    double v9 = 0;
    id v14 = 0;
LABEL_4:
    objc_sync_exit(v8);

    goto LABEL_5;
  }
  id v14 = [(PSListController *)v8 indexPathForIndex:a3];
  double v9 = [(PSListController *)v8 indexPathForIndex:a4];
  if (!v14 || !v9) {
    goto LABEL_4;
  }
  float v10 = (NSArray *)[(NSArray *)v8->_specifiers mutableCopy];
  double v11 = [(NSArray *)v10 objectAtIndexedSubscript:a3];
  [(NSArray *)v10 removeObjectAtIndex:a3];
  [(NSArray *)v10 insertObject:v11 atIndex:a4];
  specifiers = v8->_specifiers;
  v8->_specifiers = v10;

  objc_sync_exit(v8);
  uint64_t v13 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
  [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v5];
  [(UITableView *)v8->_table moveRowAtIndexPath:v14 toIndexPath:v9];
  [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v13];
LABEL_5:
}

- (PSSpecifierDataSource)specifierDataSource
{
  return self->_dataSource;
}

- (int64_t)observerType
{
  return 1;
}

- (void)dataSource:(id)a3 performUpdates:(id)a4
{
  if (!self->_requestingSpecifiersFromDataSource) {
    [(PSListController *)self performSpecifierUpdates:a4];
  }
}

- (void)performSpecifierUpdates:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 originalSpecifiers];
  char v6 = [v5 isEqual:self->_specifiers];

  if (v6)
  {
    double v7 = [v4 context];
    int v8 = [v7 updateModelOnly];

    if (v8)
    {
      double v9 = [v4 currentSpecifiers];
      float v10 = (NSArray *)[v9 mutableCopy];
      specifiers = self->_specifiers;
      self->_specifiers = v10;

      [(PSListController *)self createGroupIndices];
    }
    else
    {
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      char v23 = 0;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __44__PSListController_performSpecifierUpdates___block_invoke;
      v21[3] = &unk_1E5C5E0B0;
      v21[4] = self;
      void v21[5] = v22;
      double v12 = (void *)MEMORY[0x1AD0BE2A0](v21);
      uint64_t v13 = [v4 context];
      char v14 = [v13 animated];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __44__PSListController_performSpecifierUpdates___block_invoke_2;
      v18[3] = &unk_1E5C5E0D8;
      id v15 = v12;
      v18[4] = self;
      id v19 = v15;
      char v20 = v14;
      [v4 enumerateUpdatesUsingBlock:v18];
      double v16 = self->_specifiers;
      double v17 = [v4 currentSpecifiers];
      LOBYTE(v16) = [(NSArray *)v16 isEqual:v17];

      if (v16) {
        (*((void (**)(id, void))v15 + 2))(v15, 0);
      }
      else {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Specifier updates resulted in inconsistent specifier arrays."];
      }

      _Block_object_dispose(v22, 8);
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Attempting to perform specifier updates on list controller with inconsistent specifiers."];
  }
}

uint64_t __44__PSListController_performSpecifierUpdates___block_invoke(uint64_t result, int a2)
{
  if (*(unsigned __int8 *)(*(void *)(*(void *)(result + 40) + 8) + 24) != a2)
  {
    char v2 = a2;
    uint64_t v3 = result;
    id v4 = *(void **)(result + 32);
    if (a2) {
      double result = [v4 beginUpdates];
    }
    else {
      double result = [v4 endUpdates];
    }
    *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = v2;
  }
  return result;
}

void __44__PSListController_performSpecifierUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v11 operation] != 2);
  switch([v11 operation])
  {
    case 1:
      uint64_t v3 = *(void **)(a1 + 32);
      id v4 = [v11 specifier];
      BOOL v5 = [v11 index];
      objc_msgSend(v3, "insertSpecifier:atIndex:animated:", v4, objc_msgSend(v5, "integerValue"), *(unsigned __int8 *)(a1 + 48));

      goto LABEL_6;
    case 2:
      char v6 = *(void **)(a1 + 32);
      id v4 = [v11 index];
      uint64_t v7 = [v4 integerValue];
      int v8 = [v11 toIndex];
      objc_msgSend(v6, "_moveSpecifierAtIndex:toIndex:animated:", v7, objc_msgSend(v8, "integerValue"), *(unsigned __int8 *)(a1 + 48));

      goto LABEL_6;
    case 3:
      double v9 = *(void **)(a1 + 32);
      id v4 = [v11 index];
      objc_msgSend(v9, "reloadSpecifierAtIndex:animated:", objc_msgSend(v4, "integerValue"), *(unsigned __int8 *)(a1 + 48));
      goto LABEL_6;
    case 4:
      float v10 = *(void **)(a1 + 32);
      id v4 = [v11 index];
      objc_msgSend(v10, "removeSpecifierAtIndex:animated:", objc_msgSend(v4, "integerValue"), *(unsigned __int8 *)(a1 + 48));
LABEL_6:

      break;
    default:
      break;
  }
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        float v10 = [(PSListController *)self specifierAtIndexPath:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        if (v10) {
          [(PSListController *)self prefetchResourcesFor:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setPrefetchingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_prefetchingEnabled = a3;
  id v5 = _PSLoggingFacility();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "background prefetching enabled", buf, 2u);
    }

    table = self->_table;
    uint64_t v8 = self;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "background prefetching disabled", v9, 2u);
    }

    table = self->_table;
    uint64_t v8 = 0;
  }
  [(UITableView *)table setPrefetchDataSource:v8];
}

- (BOOL)forceSynchronousIconLoadForCreatedCells
{
  return self->_forceSynchronousIconLoadForCreatedCells;
}

- (void)setForceSynchronousIconLoadForCreatedCells:(BOOL)a3
{
  self->_forceSynchronousIconLoadForCreatedCells = a3;
}

- (BOOL)isShowingSetupController
{
  return self->_showingSetupController;
}

- (void)setShowingSetupController:(BOOL)a3
{
  self->_BOOL showingSetupController = a3;
}

- (NSDictionary)pendingURLResourceDictionary
{
  return self->_pendingURLResourceDictionary;
}

- (id)urlHandlingCompletion
{
  return self->_urlHandlingCompletion;
}

- (BOOL)isPrefetchingEnabled
{
  return self->_prefetchingEnabled;
}

- (void)setContentSizeDidChange:(BOOL)a3
{
  self->_contentSizeDidChange = a3;
}

- (UIColor)padSelectionColor
{
  return self->_padSelectionColor;
}

- (void)setPadSelectionColor:(id)a3
{
}

- (UIColor)cellAccessoryColor
{
  return self->_cellAccessoryColor;
}

- (UIColor)cellAccessoryHighlightColor
{
  return self->_cellAccessoryHighlightColor;
}

- (void)setCellAccessoryHighlightColor:(id)a3
{
}

- (UIColor)editableTextColor
{
  return self->_editableTextColor;
}

- (UIColor)editablePlaceholderTextColor
{
  return self->_editablePlaceholderTextColor;
}

- (UIColor)editableInsertionPointColor
{
  return self->_editableInsertionPointColor;
}

- (UIColor)editableSelectionBarColor
{
  return self->_editableSelectionBarColor;
}

- (UIColor)editableSelectionHighlightColor
{
  return self->_editableSelectionHighlightColor;
}

- (UIColor)footerHyperlinkColor
{
  return self->_footerHyperlinkColor;
}

- (UIColor)segmentedSliderTrackColor
{
  return self->_segmentedSliderTrackColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedSliderTrackColor, 0);
  objc_storeStrong((id *)&self->_footerHyperlinkColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionBarColor, 0);
  objc_storeStrong((id *)&self->_editableInsertionPointColor, 0);
  objc_storeStrong((id *)&self->_editablePlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_altTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_cellAccessoryHighlightColor, 0);
  objc_storeStrong((id *)&self->_cellAccessoryColor, 0);
  objc_storeStrong((id *)&self->_padSelectionColor, 0);
  objc_storeStrong((id *)&self->_cellHighlightColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong(&self->_urlHandlingCompletion, 0);
  objc_storeStrong((id *)&self->_specifierIDPendingPush, 0);
  objc_storeStrong((id *)&self->_pendingURLResourceDictionary, 0);
  objc_storeStrong((id *)&self->_navigationCoordinator, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_savedSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_highlightItemName, 0);
  objc_storeStrong((id *)&self->_offsetItemName, 0);
  objc_storeStrong((id *)&self->_bundleControllers, 0);
  objc_storeStrong((id *)&self->_specifierID, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_specifiersByID, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_prequeuedReusablePSTableCells, 0);
}

- (void)showPINSheet:(id)a3 allowOptionsButton:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (id *)a3;
  if ([(PSListControllerNavigationCoordinator *)self->_navigationCoordinator listControllerIsOnTopOfNavigationStack:self searchTopMostViewControllerChildren:0])
  {
    BOOL v6 = objc_alloc_init(DevicePINSetupController);
    [(DevicePINSetupController *)v6 setAllowOptionsButton:v4];
    self->_BOOL showingSetupController = 1;
    [(PSSetupController *)v6 setParentController:self];
    [v7 setProperty:self forKey:@"PINControllerDelegate"];
    [(PSRootController *)v6 setSpecifier:v7];
    objc_storeWeak(v7 + 1, self);
    [(PSListController *)self showController:v6];
  }
}

- (void)showPINSheet:(id)a3
{
}

- (id)popupStylePopoverController
{
  return 0;
}

+ (void)registerDefaultAppearanceProviderClass:(Class)a3
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1) {
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_876);
  }
  defaultAppearanceProviderClass = (uint64_t)a3;
}

- (void)setAppearanceProvider:(id)a3
{
  BOOL v4 = (PSListControllerAppearanceProvider *)a3;
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1) {
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_876);
  }
  appearanceProvider = self->_appearanceProvider;
  self->_appearanceProvider = v4;
}

- (PSListControllerAppearanceProvider)appearanceProvider
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1) {
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_876);
  }
  appearanceProvider = self->_appearanceProvider;
  return appearanceProvider;
}

- (void)setNavigationCoordinator:(id)a3
{
  BOOL v4 = (PSListControllerNavigationCoordinator *)a3;
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1) {
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_876);
  }
  navigationCoordinator = self->_navigationCoordinator;
  self->_navigationCoordinator = v4;
}

- (PSListControllerNavigationCoordinator)navigationCoordinator
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1) {
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_876);
  }
  navigationCoordinator = self->_navigationCoordinator;
  return navigationCoordinator;
}

- (void)handleScrollPPTTestName:(id)a3
{
  id v6 = a3;
  if (objc_opt_class() && objc_opt_class() && [MEMORY[0x1E4F94858] isRecapAvailable])
  {
    BOOL v4 = [(PSListController *)self table];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F94848]) initWithTestName:v6 scrollView:v4 completionHandler:0];
    [MEMORY[0x1E4F94858] runTestWithParameters:v5];
  }
}

- (void)_insertContiguousSpecifiers:(os_log_t)log atIndex:animated:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A6597000, log, OS_LOG_TYPE_FAULT, "Inserting specifier off of main thread", v1, 2u);
}

- (void)_removeContiguousSpecifiers:(os_log_t)log animated:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A6597000, log, OS_LOG_TYPE_FAULT, "Removing specifier off of main thread", v1, 2u);
}

- (void)controllerForSpecifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEBUG, "%{mask.hash}@: No Action, legacyAction is nil, returning nil.", v1, 0x16u);
}

- (void)controllerForSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_4();
  v1 = +[PSTableCell reuseIdentifierForClassAndType:v0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A6597000, v2, v3, "%{mask.hash}@: Cell type %{public}@ does not expect navigation semantics. Returning nil.", v4, v5, v6, v7, v8);
}

- (void)controllerForSpecifier:.cold.3()
{
  OUTLINED_FUNCTION_4();
  v1 = +[PSTableCell reuseIdentifierForClassAndType:v0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A6597000, v2, v3, "%{mask.hash}@: Cell type %{public}@ supports being checked, returning non-nil value.", v4, v5, v6, v7, v8);
}

- (void)controllerForSpecifier:.cold.4()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_6();
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEBUG, "%{mask.hash}@: Cell %{mask.hash}@ has interactivity disabled. Returning nil.", v3, 0x2Au);
}

- (void)controllerForSpecifier:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEBUG, "%{mask.hash}@: Performed controllerLoadAction, continuing.", v1, 0x16u);
}

- (void)controllerForSpecifier:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 target];
  OUTLINED_FUNCTION_3();
  uint64_t v7 = a1;
  OUTLINED_FUNCTION_6();
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "%{mask.hash}@: Performed controllerLoadAction but target %{mask.hash}@ did not unset controllerLoadAction. Returning nil", v6, 0x2Au);
}

- (void)controllerForSpecifier:.cold.7()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [*(id *)(v0 + 1048) indexPathForSelectedRow];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A6597000, v2, v3, "%{mask.hash}@: Performed buttonAction, deselecting any selected row %{public}@ and returning nil.", v4, v5, v6, v7, v8);
}

- (void)controllerForSpecifier:.cold.8()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [*(id *)(v0 + 1048) indexPathForSelectedRow];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A6597000, v2, v3, "%{mask.hash}@: Performed legacyAction, deselecting any selected row %{public}@ and returning nil.", v4, v5, v6, v7, v8);
}

- (void)showController:animate:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_5(&dword_1A6597000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);
}

- (void)showController:animate:.cold.2()
{
  uint64_t v0 = [MEMORY[0x1E4F42FF8] _printHierarchy];
  OUTLINED_FUNCTION_5(&dword_1A6597000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);
}

- (void)showController:(os_log_t)log animate:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[PSListController showController:animate:]";
  _os_log_error_impl(&dword_1A6597000, log, OS_LOG_TYPE_ERROR, "%s: pushing a view controller that's already in the stack.", (uint8_t *)&v1, 0xCu);
}

@end