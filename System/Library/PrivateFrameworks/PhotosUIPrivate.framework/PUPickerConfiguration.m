@interface PUPickerConfiguration
+ (id)limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier:(id)a3 auditToken:(id *)a4 photoLibrary:(id)a5;
+ (id)limitedLibraryApplicationTrustedIdentifierWithConnection:(id)a3 purposedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)allowsAssetData;
- (BOOL)allowsCollectionNavigation;
- (BOOL)allowsConfidentialWarning;
- (BOOL)allowsContextMenuInteraction;
- (BOOL)allowsDownload;
- (BOOL)allowsDownscaling;
- (BOOL)allowsEncodingPolicyModification;
- (BOOL)allowsInteractivePopGesture;
- (BOOL)allowsNavigationBar;
- (BOOL)allowsNavigationPushPopAnimation;
- (BOOL)allowsOpeningStagingArea;
- (BOOL)allowsSearchBar;
- (BOOL)allowsSelectionStaging;
- (BOOL)allowsSidebar;
- (BOOL)allowsSwipeToSelect;
- (BOOL)allowsToolbar;
- (BOOL)allowsUnlimitedMultipleSelection;
- (BOOL)canIncludeCaptionByDefault;
- (BOOL)canIncludeLocationByDefault;
- (BOOL)didDismissOnboardingHeaderView;
- (BOOL)didDismissOnboardingOverlayView;
- (BOOL)didShowPhotosIndicator;
- (BOOL)excludeConfirmationButton;
- (BOOL)excludeStagingSubtitle;
- (BOOL)excludesHiddenAlbum;
- (BOOL)excludesLocationMetadataSubtitle;
- (BOOL)excludesNewAlbumCreation;
- (BOOL)excludesOptionsMenu;
- (BOOL)excludesSharedAlbums;
- (BOOL)excludesSortAndFilterMenu;
- (BOOL)hasClearBackgroundColor;
- (BOOL)hasFilterablePHPickerFilter;
- (BOOL)hasPreselection;
- (BOOL)isAddToAlbumPicker;
- (BOOL)isAlbumPicker;
- (BOOL)isAssetPicker;
- (BOOL)isCollectionsPicker;
- (BOOL)isFollowupSingleSelectionPeoplePicker;
- (BOOL)isLimitedLibraryPicker;
- (BOOL)isOrderedSelection;
- (BOOL)isPeopleAndPetsPicker;
- (BOOL)isPeopleOrPetsPicker;
- (BOOL)isPeoplePicker;
- (BOOL)isPetsPicker;
- (BOOL)isProcessingSuggestions;
- (BOOL)isSharedAlbumPicker;
- (BOOL)isSingleSelection;
- (BOOL)isValidConfiguration;
- (BOOL)onlyReturnsIdentifiers;
- (BOOL)pickerClientHasFullLibraryAccess;
- (BOOL)pickerClientHasLibraryAccess;
- (BOOL)pickerClientHasLibraryAccessWithoutPrivateEntitlements;
- (BOOL)pickerClientIsEntitledForOrHasPrivateLibraryAccess;
- (BOOL)pickerClientShouldRespectOptionsMenu;
- (BOOL)receivedPhotoLibrary;
- (BOOL)shouldDisableInlinePlayback;
- (BOOL)shouldPassthroughSelection;
- (BOOL)shouldScrollToSelectedItemInitially;
- (BOOL)shouldShowCommunicationSafetyIntervention;
- (BOOL)shouldShowOnboardingHeaderView;
- (BOOL)shouldShowOnboardingOverlayView;
- (BOOL)shouldShowPhotosIndicator;
- (BOOL)showsWallpaperSuggestions;
- (BOOL)supportsInteractiveBarTransition;
- (BOOL)useSystemBackgroundColorBar;
- (BOOL)usesMemoriesLayout;
- (NSArray)customSortDescriptors;
- (NSArray)peopleConfigurations;
- (NSError)LimitedLibraryError;
- (NSOrderedSet)allPersonIdentifiers;
- (NSOrderedSet)preselectedItemIdentifiers;
- (NSOrderedSet)preselectedItemObjectIDs;
- (NSOrderedSet)suggestedItemObjectIDs;
- (NSString)fetchType;
- (NSString)limitedLibraryClientIdentifier;
- (NSString)pickerClientBundleIdentifier;
- (NSString)pickerClientDisplayName;
- (PHAssetCollection)allPhotosVirtualCollection;
- (PHFetchResult)containerCollectionFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PHPickerConfiguration)phPickerConfiguration;
- (PLClientIdentification)pickerClientIdentification;
- (PUPickerConfiguration)init;
- (PUPickerConfiguration)initWithPHPickerConfiguration:(id)a3 connection:(id)a4;
- (PUPickerConfiguration)initWithPHPickerConfiguration:(id)a3 connection:(id)a4 overriddenGeneratedFilter:(id)a5 allowsDownload:(BOOL)a6 usesMemoriesLayout:(BOOL)a7;
- (PUPickerGeneratedFilter)generatedFilter;
- (_PHPickerCollectionConfiguration)albumsConfiguration;
- (_PHPickerSuggestionGroup)suggestionGroup;
- (double)interactiveBarTransitionFractionExpanded;
- (double)interactiveBarTransitionWindowHeight;
- (id)initForUIImagePickerControllerWithPHPickerConfiguration:(id)a3 connection:(id)a4 overriddenGeneratedFilter:(id)a5;
- (int64_t)cancellationBehaviorWithTraitCollection:(id)a3;
- (int64_t)clientEncodingPolicy;
- (int64_t)confirmationBehavior;
- (int64_t)minimumSelectionLimit;
- (int64_t)mode;
- (int64_t)pickerClientAccessAllowedResult;
- (int64_t)preferredAssetRepresentationMode;
- (int64_t)selection;
- (int64_t)selectionLimit;
- (int64_t)sourceType;
- (unint64_t)disabledCapabilities;
- (unint64_t)edgesWithoutContentMargins;
- (void)setDidDismissOnboardingHeaderView:(BOOL)a3;
- (void)setDidDismissOnboardingOverlayView:(BOOL)a3;
- (void)setDidShowPhotosIndicator:(BOOL)a3;
- (void)setEdgesWithoutContentMargins:(unint64_t)a3;
- (void)setInteractiveBarTransitionFractionExpanded:(double)a3;
- (void)setInteractiveBarTransitionWindowHeight:(double)a3;
- (void)setMinimumSelectionLimit:(int64_t)a3;
- (void)setSelectionLimit:(int64_t)a3;
- (void)setSupportsInteractiveBarTransition:(BOOL)a3;
@end

@implementation PUPickerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_LimitedLibraryError, 0);
  objc_storeStrong((id *)&self->_limitedLibraryClientIdentifier, 0);
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_allPhotosVirtualCollection, 0);
  objc_storeStrong((id *)&self->_pickerClientDisplayName, 0);
  objc_storeStrong((id *)&self->_suggestedItemObjectIDs, 0);
  objc_storeStrong((id *)&self->_preselectedItemObjectIDs, 0);
  objc_storeStrong((id *)&self->_preselectedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_pickerClientIdentification, 0);
  objc_storeStrong((id *)&self->_containerCollectionFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_generatedFilter, 0);
  objc_storeStrong((id *)&self->_peopleConfigurations, 0);
  objc_storeStrong((id *)&self->_albumsConfiguration, 0);
  objc_storeStrong((id *)&self->_suggestionGroup, 0);

  objc_storeStrong((id *)&self->_phPickerConfiguration, 0);
}

- (BOOL)usesMemoriesLayout
{
  return self->_usesMemoriesLayout;
}

- (int64_t)pickerClientAccessAllowedResult
{
  return self->_pickerClientAccessAllowedResult;
}

- (NSOrderedSet)allPersonIdentifiers
{
  return self->_allPersonIdentifiers;
}

- (NSError)LimitedLibraryError
{
  return self->_LimitedLibraryError;
}

- (NSString)limitedLibraryClientIdentifier
{
  return self->_limitedLibraryClientIdentifier;
}

- (BOOL)isLimitedLibraryPicker
{
  return self->_isLimitedLibraryPicker;
}

- (double)interactiveBarTransitionWindowHeight
{
  return self->_interactiveBarTransitionWindowHeight;
}

- (double)interactiveBarTransitionFractionExpanded
{
  return self->_interactiveBarTransitionFractionExpanded;
}

- (BOOL)supportsInteractiveBarTransition
{
  return self->_supportsInteractiveBarTransition;
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (PHAssetCollection)allPhotosVirtualCollection
{
  return self->_allPhotosVirtualCollection;
}

- (NSString)pickerClientDisplayName
{
  return self->_pickerClientDisplayName;
}

- (BOOL)pickerClientIsEntitledForOrHasPrivateLibraryAccess
{
  return self->_pickerClientIsEntitledForOrHasPrivateLibraryAccess;
}

- (BOOL)didShowPhotosIndicator
{
  return self->_didShowPhotosIndicator;
}

- (BOOL)didDismissOnboardingHeaderView
{
  return self->_didDismissOnboardingHeaderView;
}

- (BOOL)didDismissOnboardingOverlayView
{
  return self->_didDismissOnboardingOverlayView;
}

- (BOOL)allowsDownload
{
  return self->_allowsDownload;
}

- (BOOL)allowsEncodingPolicyModification
{
  return self->_allowsEncodingPolicyModification;
}

- (BOOL)allowsDownscaling
{
  return self->_allowsDownscaling;
}

- (NSOrderedSet)suggestedItemObjectIDs
{
  return self->_suggestedItemObjectIDs;
}

- (NSOrderedSet)preselectedItemObjectIDs
{
  return self->_preselectedItemObjectIDs;
}

- (NSOrderedSet)preselectedItemIdentifiers
{
  return self->_preselectedItemIdentifiers;
}

- (PLClientIdentification)pickerClientIdentification
{
  return self->_pickerClientIdentification;
}

- (BOOL)onlyReturnsIdentifiers
{
  return self->_onlyReturnsIdentifiers;
}

- (BOOL)receivedPhotoLibrary
{
  return self->_receivedPhotoLibrary;
}

- (PHFetchResult)containerCollectionFetchResult
{
  return self->_containerCollectionFetchResult;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PUPickerGeneratedFilter)generatedFilter
{
  return self->_generatedFilter;
}

- (NSArray)peopleConfigurations
{
  return self->_peopleConfigurations;
}

- (_PHPickerCollectionConfiguration)albumsConfiguration
{
  return self->_albumsConfiguration;
}

- (_PHPickerSuggestionGroup)suggestionGroup
{
  return self->_suggestionGroup;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)selection
{
  return self->_selection;
}

- (int64_t)preferredAssetRepresentationMode
{
  return self->_preferredAssetRepresentationMode;
}

- (PHPickerConfiguration)phPickerConfiguration
{
  return self->_phPickerConfiguration;
}

- (BOOL)isSharedAlbumPicker
{
  return [(PUPickerConfiguration *)self sourceType] == 6;
}

- (BOOL)isCollectionsPicker
{
  return [(PUPickerConfiguration *)self sourceType] == 5;
}

- (BOOL)isAlbumPicker
{
  return [(PUPickerConfiguration *)self sourceType] == 2;
}

- (BOOL)isAddToAlbumPicker
{
  int64_t v3 = [(PUPickerConfiguration *)self sourceType];
  if ([(PUPickerConfiguration *)self excludesNewAlbumCreation]) {
    return 0;
  }
  BOOL result = [(PUPickerConfiguration *)self isSingleSelection];
  if (v3 != 2) {
    return 0;
  }
  return result;
}

- (BOOL)isAssetPicker
{
  return [(PUPickerConfiguration *)self sourceType] == 0;
}

- (BOOL)isFollowupSingleSelectionPeoplePicker
{
  if (![(PUPickerConfiguration *)self isPeopleOrPetsPicker]) {
    return 0;
  }
  int64_t v3 = [(PUPickerConfiguration *)self phPickerConfiguration];
  v4 = [v3 _followupPeopleConfigurations];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isPeopleOrPetsPicker
{
  int64_t v3 = [(PUPickerConfiguration *)self sourceType];
  if (v3 != 1) {
    LOBYTE(v3) = [(PUPickerConfiguration *)self sourceType] == 4
  }
              || [(PUPickerConfiguration *)self sourceType] == 3;
  return v3;
}

- (BOOL)isPeopleAndPetsPicker
{
  return [(PUPickerConfiguration *)self sourceType] == 4;
}

- (BOOL)isPetsPicker
{
  return [(PUPickerConfiguration *)self sourceType] == 3;
}

- (BOOL)isPeoplePicker
{
  return [(PUPickerConfiguration *)self sourceType] == 1;
}

- (BOOL)showsWallpaperSuggestions
{
  v2 = [(PUPickerConfiguration *)self suggestionGroup];
  char v3 = [v2 isForWallpaper];

  return v3;
}

- (int64_t)clientEncodingPolicy
{
  int64_t result = [(PUPickerConfiguration *)self preferredAssetRepresentationMode];
  if ((unint64_t)result >= 3) {
    return 0;
  }
  return result;
}

- (NSArray)customSortDescriptors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if ([(PUPickerConfiguration *)self usesMemoriesLayout])
  {
    v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
    char v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"addedDate", 1, v2);
    v7[1] = v3;
    v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
    v7[2] = v4;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSArray *)v5;
}

- (BOOL)isProcessingSuggestions
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([(PUPickerConfiguration *)self showsWallpaperSuggestions])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = [(PUPickerConfiguration *)self generatedFilter];
    LODWORD(v3) = [v4 containsStickersFilter];

    if (v3)
    {
      BOOL v5 = [(PUPickerConfiguration *)self photoLibrary];
      v6 = [v5 librarySpecificFetchOptions];

      [v6 setIncludeAssetSourceTypes:5];
      v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
      [v6 setInternalPredicate:v7];

      [v6 setIncludeGuestAssets:1];
      [v6 setShouldPrefetchCount:1];
      v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
      unint64_t v3 = [v8 count];

      v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= 0", @"stickerConfidenceScore");
      v10 = (void *)MEMORY[0x1E4F28BA0];
      v11 = [v6 internalPredicate];
      v17[0] = v11;
      v17[1] = v9;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      v13 = [v10 andPredicateWithSubpredicates:v12];
      [v6 setInternalPredicate:v13];

      v14 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
      unint64_t v15 = [v14 count];

      LOBYTE(v3) = v3 >= 0xB && (double)v15 / (double)v3 < 0.9;
    }
  }
  return v3;
}

- (BOOL)shouldDisableInlinePlayback
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = ((unint64_t)[v2 _disabledPrivateCapabilities] >> 3) & 1;

  return v3;
}

- (BOOL)pickerClientShouldRespectOptionsMenu
{
  unint64_t v3 = [(PUPickerConfiguration *)self pickerClientIdentification];
  v4 = [v3 trustedCallerBundleID];

  if (pickerClientShouldRespectOptionsMenu_onceToken != -1) {
    dispatch_once(&pickerClientShouldRespectOptionsMenu_onceToken, &__block_literal_global_43326);
  }
  if ((PLIsPhotosMessagesApp() & 1) != 0
    || ([(id)pickerClientShouldRespectOptionsMenu_supportedBundleIDs containsObject:v4] & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v5 = ![(PUPickerConfiguration *)self pickerClientHasFullLibraryAccess];
  }

  return v5;
}

void __61__PUPickerConfiguration_pickerClientShouldRespectOptionsMenu__block_invoke()
{
  v0 = (void *)pickerClientShouldRespectOptionsMenu_supportedBundleIDs;
  pickerClientShouldRespectOptionsMenu_supportedBundleIDs = (uint64_t)&unk_1F078AE38;
}

- (BOOL)pickerClientHasFullLibraryAccess
{
  [(PUPickerConfiguration *)self pickerClientAccessAllowedResult];
  if (PLPhotosFullAccessAllowed()) {
    return 1;
  }

  return [(PUPickerConfiguration *)self pickerClientIsEntitledForOrHasPrivateLibraryAccess];
}

- (BOOL)pickerClientHasLibraryAccess
{
  [(PUPickerConfiguration *)self pickerClientAccessAllowedResult];
  if (PLPhotosAccessAllowed()) {
    return 1;
  }

  return [(PUPickerConfiguration *)self pickerClientIsEntitledForOrHasPrivateLibraryAccess];
}

- (BOOL)pickerClientHasLibraryAccessWithoutPrivateEntitlements
{
  [(PUPickerConfiguration *)self pickerClientAccessAllowedResult];

  return PLPhotosAccessAllowed();
}

- (BOOL)shouldShowOnboardingHeaderView
{
  if ([(PUPickerConfiguration *)self isLimitedLibraryPicker])
  {
    unint64_t v3 = [(PUPickerConfiguration *)self phPickerConfiguration];
    char v4 = [v3 _limitedLibraryHeaderDismissedBefore];

    if (v4) {
      return 0;
    }
  }
  if (![(PUPickerConfiguration *)self isLimitedLibraryPicker])
  {
    BOOL v5 = [(PUPickerConfiguration *)self phPickerConfiguration];
    char v6 = [v5 _onboardingHeaderDismissedBefore];

    if (v6) {
      return 0;
    }
  }
  if ([(PUPickerConfiguration *)self pickerClientHasFullLibraryAccess]
    || ([(PUPickerConfiguration *)self edgesWithoutContentMargins] & 1) != 0
    || [(PUPickerConfiguration *)self mode] == 1
    || [(PUPickerConfiguration *)self supportsInteractiveBarTransition])
  {
    return 0;
  }
  else
  {
    return ![(PUPickerConfiguration *)self didDismissOnboardingHeaderView];
  }
}

- (BOOL)shouldShowOnboardingOverlayView
{
  if ([(PUPickerConfiguration *)self pickerClientHasFullLibraryAccess]
    || (PLIsPhotosAppAnyPlatform() & 1) != 0
    || ([(PUPickerConfiguration *)self phPickerConfiguration],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 _onboardingOverlayDismissedBefore],
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 0;
  }
  else if (([(PUPickerConfiguration *)self edgesWithoutContentMargins] & 1) != 0 {
         || [(PUPickerConfiguration *)self mode] == 1
  }
         || (BOOL v5 = [(PUPickerConfiguration *)self supportsInteractiveBarTransition]))
  {
    LOBYTE(v5) = ![(PUPickerConfiguration *)self didDismissOnboardingOverlayView];
  }
  return v5;
}

- (BOOL)shouldShowPhotosIndicator
{
  if ([(PUPickerConfiguration *)self didShowPhotosIndicator]) {
    return 0;
  }
  else {
    return ![(PUPickerConfiguration *)self pickerClientHasFullLibraryAccess];
  }
}

- (BOOL)shouldScrollToSelectedItemInitially
{
  return ![(PUPickerConfiguration *)self isLimitedLibraryPicker];
}

- (BOOL)shouldShowCommunicationSafetyIntervention
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  char v3 = [v2 disabledCapabilities];

  if ((v3 & 0x10) != 0) {
    return 0;
  }
  char v4 = (void *)MEMORY[0x1E4F906A8];

  return [v4 userSafetyInterventionCheckRequired];
}

- (BOOL)allowsConfidentialWarning
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  BOOL v3 = ([v2 _disabledPrivateCapabilities] & 0x80) == 0;

  return v3;
}

- (BOOL)excludeStagingSubtitle
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = ((unint64_t)[v2 _disabledPrivateCapabilities] >> 11) & 1;

  return v3;
}

- (BOOL)excludeConfirmationButton
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = ((unint64_t)[v2 _disabledPrivateCapabilities] >> 10) & 1;

  return v3;
}

- (BOOL)useSystemBackgroundColorBar
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = ((unint64_t)[v2 _disabledPrivateCapabilities] >> 9) & 1;

  return v3;
}

- (BOOL)hasClearBackgroundColor
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = ((unint64_t)[v2 _disabledPrivateCapabilities] >> 4) & 1;

  return v3;
}

- (BOOL)canIncludeCaptionByDefault
{
  if (!_os_feature_enabled_impl() || !PLIsLockdownMode()) {
    return 1;
  }
  v2 = PLPickerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding caption metadata by default.", v4, 2u);
  }

  return 0;
}

- (BOOL)canIncludeLocationByDefault
{
  if (!_os_feature_enabled_impl() || !PLIsLockdownMode()) {
    return 1;
  }
  v2 = PLPickerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding location metadata by default.", v4, 2u);
  }

  return 0;
}

- (BOOL)excludesNewAlbumCreation
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = ((unint64_t)[v2 _disabledPrivateCapabilities] >> 5) & 1;

  return v3;
}

- (BOOL)excludesLocationMetadataSubtitle
{
  if ([(PUPickerConfiguration *)self isLimitedLibraryPicker]
    || [(PUPickerConfiguration *)self sourceType])
  {
    return 1;
  }
  else
  {
    return ![(PUPickerConfiguration *)self pickerClientShouldRespectOptionsMenu];
  }
}

- (BOOL)excludesSortAndFilterMenu
{
  unint64_t v3 = [(PUPickerConfiguration *)self phPickerConfiguration];
  __int16 v4 = [v3 _disabledPrivateCapabilities];

  return (v4 & 0x100) != 0 || [(PUPickerConfiguration *)self sourceType] == 2;
}

- (BOOL)excludesOptionsMenu
{
  if ([(PUPickerConfiguration *)self sourceType]
    || ![(PUPickerConfiguration *)self pickerClientShouldRespectOptionsMenu])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    unint64_t v3 = [(PUPickerConfiguration *)self phPickerConfiguration];
    unint64_t v4 = ((unint64_t)[v3 _disabledPrivateCapabilities] >> 2) & 1;
  }
  return v4;
}

- (BOOL)excludesHiddenAlbum
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = ((unint64_t)[v2 _disabledPrivateCapabilities] >> 1) & 1;

  return v3;
}

- (BOOL)excludesSharedAlbums
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  BOOL v3 = [v2 _disabledPrivateCapabilities] & 1;

  return v3;
}

- (BOOL)allowsOpeningStagingArea
{
  if (([(PUPickerConfiguration *)self disabledCapabilities] & 2) != 0
    || [(PUPickerConfiguration *)self sourceType]
    || [(PUPickerConfiguration *)self mode] == 1)
  {
    return 0;
  }
  else
  {
    return ![(PUPickerConfiguration *)self isSingleSelection];
  }
}

- (BOOL)allowsSelectionStaging
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  char v3 = [v2 _usesOpenPanelLayout] ^ 1;

  return v3;
}

- (BOOL)allowsSearchBar
{
  return ([(PUPickerConfiguration *)self disabledCapabilities] & 1) == 0
      && ([(PUPickerConfiguration *)self edgesWithoutContentMargins] & 1) == 0
      && ![(PUPickerConfiguration *)self sourceType]
      && [(PUPickerConfiguration *)self mode] != 1;
}

- (BOOL)allowsSidebar
{
  if (([(PUPickerConfiguration *)self edgesWithoutContentMargins] & 2) != 0) {
    return 0;
  }
  char v3 = [(PUPickerConfiguration *)self albumsConfiguration];
  if (v3)
  {

    return 0;
  }
  unint64_t v4 = [(PUPickerConfiguration *)self peopleConfigurations];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 0;
  }

  return [(PUPickerConfiguration *)self allowsCollectionNavigation];
}

- (BOOL)allowsCollectionNavigation
{
  if (([(PUPickerConfiguration *)self disabledCapabilities] & 4) != 0
    || [(PUPickerConfiguration *)self hasClearBackgroundColor]
    || [(PUPickerConfiguration *)self sourceType]
    || [(PUPickerConfiguration *)self mode] == 1)
  {
    return 0;
  }
  unint64_t v4 = [(PUPickerConfiguration *)self generatedFilter];
  char v5 = [v4 allowsAlbums];

  return v5;
}

- (BOOL)allowsNavigationPushPopAnimation
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  char v3 = [v2 _usesOpenPanelLayout] ^ 1;

  return v3;
}

- (BOOL)allowsInteractivePopGesture
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  char v3 = [v2 _usesOpenPanelLayout] ^ 1;

  return v3;
}

- (BOOL)allowsToolbar
{
  return ([(PUPickerConfiguration *)self edgesWithoutContentMargins] & 4) == 0;
}

- (BOOL)allowsNavigationBar
{
  return ([(PUPickerConfiguration *)self edgesWithoutContentMargins] & 1) == 0;
}

- (BOOL)allowsSwipeToSelect
{
  if ([(PUPickerConfiguration *)self mode] == 1
    || [(PUPickerConfiguration *)self sourceType] == 1
    || [(PUPickerConfiguration *)self sourceType] == 3
    || [(PUPickerConfiguration *)self sourceType] == 4
    || [(PUPickerConfiguration *)self isOrderedSelection])
  {
    return 0;
  }
  else
  {
    return ![(PUPickerConfiguration *)self shouldPassthroughSelection];
  }
}

- (BOOL)allowsContextMenuInteraction
{
  if (![(PUPickerConfiguration *)self supportsInteractiveBarTransition]
    || ([(PUPickerConfiguration *)self interactiveBarTransitionFractionExpanded], (int v3 = PXFloatApproximatelyEqualToFloat()) != 0))
  {
    LOBYTE(v3) = (~[(PUPickerConfiguration *)self edgesWithoutContentMargins] & 0xF) != 0;
  }
  return v3;
}

- (BOOL)allowsAssetData
{
  return ![(PUPickerConfiguration *)self onlyReturnsIdentifiers];
}

- (BOOL)allowsUnlimitedMultipleSelection
{
  return [(PUPickerConfiguration *)self selectionLimit] == 0;
}

- (BOOL)shouldPassthroughSelection
{
  return (unint64_t)([(PUPickerConfiguration *)self confirmationBehavior] - 2) < 3;
}

- (BOOL)isOrderedSelection
{
  int64_t v3 = [(PUPickerConfiguration *)self selection];
  if (v3 != 1) {
    LOBYTE(v3) = [(PUPickerConfiguration *)self selection] == 3;
  }
  return v3;
}

- (BOOL)isSingleSelection
{
  return [(PUPickerConfiguration *)self selectionLimit] == 1;
}

- (BOOL)hasPreselection
{
  int64_t v3 = [(PUPickerConfiguration *)self preselectedItemIdentifiers];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(PUPickerConfiguration *)self preselectedItemObjectIDs];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (BOOL)hasFilterablePHPickerFilter
{
  v2 = [(PUPickerConfiguration *)self generatedFilter];
  BOOL v3 = [v2 requiredAssetTypes] != 131070;

  return v3;
}

- (int64_t)minimumSelectionLimit
{
  BOOL v3 = [(PUPickerConfiguration *)self phPickerConfiguration];
  uint64_t v4 = [v3 minimumSelectionLimit];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return [(PUPickerConfiguration *)self hasPreselection] ^ 1;
  }
  char v6 = [(PUPickerConfiguration *)self phPickerConfiguration];
  int64_t v7 = [v6 minimumSelectionLimit];

  return v7;
}

- (int64_t)selectionLimit
{
  v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  int64_t v3 = [v2 selectionLimit];

  return v3;
}

- (NSString)fetchType
{
  int64_t v2 = [(PUPickerConfiguration *)self sourceType];
  if ((unint64_t)(v2 - 1) > 5) {
    int64_t v3 = (void **)MEMORY[0x1E4F39648];
  }
  else {
    int64_t v3 = (void **)qword_1E5F27648[v2 - 1];
  }
  uint64_t v4 = *v3;

  return (NSString *)v4;
}

- (int64_t)sourceType
{
  int64_t v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  int64_t v3 = [v2 _sourceType];

  return v3;
}

- (unint64_t)disabledCapabilities
{
  int64_t v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = [v2 disabledCapabilities];

  return v3;
}

- (unint64_t)edgesWithoutContentMargins
{
  int64_t v2 = [(PUPickerConfiguration *)self phPickerConfiguration];
  unint64_t v3 = [v2 edgesWithoutContentMargins];

  return v3;
}

- (int64_t)confirmationBehavior
{
  if ([(PUPickerConfiguration *)self isSingleSelection]) {
    return 4;
  }
  if ([(PUPickerConfiguration *)self selection] == 2
    || [(PUPickerConfiguration *)self selection] == 3)
  {
    if (([(PUPickerConfiguration *)self disabledCapabilities] & 8) != 0) {
      return 2;
    }
    else {
      return 3;
    }
  }
  else
  {
    return [(PUPickerConfiguration *)self hasPreselection]
        || [(PUPickerConfiguration *)self minimumSelectionLimit] == 0;
  }
}

- (int64_t)cancellationBehaviorWithTraitCollection:(id)a3
{
  uint64_t v4 = [a3 _presentationSemanticContext];
  char v5 = [(PUPickerConfiguration *)self disabledCapabilities];
  int64_t result = 0;
  if (v4 != 3 && (v5 & 8) == 0)
  {
    if ([(PUPickerConfiguration *)self selection] == 2
      || [(PUPickerConfiguration *)self selection] == 3)
    {
      int64_t v7 = [(PUPickerConfiguration *)self phPickerConfiguration];
      __int16 v8 = [v7 _disabledPrivateCapabilities];

      if ((v8 & 0x400) != 0) {
        return 2;
      }
      else {
        return 1;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (void)setInteractiveBarTransitionWindowHeight:(double)a3
{
  self->_interactiveBarTransitionWindowHeight = a3;
  [(PUPickerConfiguration *)self signalChange:128];
}

- (void)setInteractiveBarTransitionFractionExpanded:(double)a3
{
  if (self->_interactiveBarTransitionFractionExpanded != a3)
  {
    self->_interactiveBarTransitionFractionExpanded = a3;
    [(PUPickerConfiguration *)self signalChange:64];
  }
}

- (void)setSupportsInteractiveBarTransition:(BOOL)a3
{
  if (self->_supportsInteractiveBarTransition != a3)
  {
    self->_supportsInteractiveBarTransition = a3;
    [(PUPickerConfiguration *)self signalChange:32];
  }
}

- (void)setDidShowPhotosIndicator:(BOOL)a3
{
  if (self->_didShowPhotosIndicator != a3)
  {
    self->_didShowPhotosIndicator = a3;
    [(PUPickerConfiguration *)self signalChange:16];
  }
}

- (void)setDidDismissOnboardingHeaderView:(BOOL)a3
{
  if (self->_didDismissOnboardingHeaderView != a3)
  {
    self->_didDismissOnboardingHeaderView = a3;
    [(PUPickerConfiguration *)self signalChange:8];
  }
}

- (void)setDidDismissOnboardingOverlayView:(BOOL)a3
{
  if (self->_didDismissOnboardingOverlayView != a3)
  {
    self->_didDismissOnboardingOverlayView = a3;
    [(PUPickerConfiguration *)self signalChange:4];
  }
}

- (void)setMinimumSelectionLimit:(int64_t)a3
{
  if ([(PHPickerConfiguration *)self->_phPickerConfiguration minimumSelectionLimit] != a3)
  {
    [(PHPickerConfiguration *)self->_phPickerConfiguration setMinimumSelectionLimit:a3];
    [(PUPickerConfiguration *)self signalChange:256];
  }
}

- (void)setSelectionLimit:(int64_t)a3
{
  if ([(PHPickerConfiguration *)self->_phPickerConfiguration selectionLimit] != a3)
  {
    [(PHPickerConfiguration *)self->_phPickerConfiguration setSelectionLimit:a3];
    [(PUPickerConfiguration *)self signalChange:2];
  }
}

- (void)setEdgesWithoutContentMargins:(unint64_t)a3
{
  if ([(PHPickerConfiguration *)self->_phPickerConfiguration edgesWithoutContentMargins] != a3)
  {
    [(PHPickerConfiguration *)self->_phPickerConfiguration setEdgesWithoutContentMargins:a3];
    [(PUPickerConfiguration *)self signalChange:1];
  }
}

- (BOOL)isValidConfiguration
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PUPickerConfiguration *)self preferredAssetRepresentationMode];
  BOOL v4 = v3 >= *MEMORY[0x1E4F399E0];
  if (v3 < *MEMORY[0x1E4F399E0])
  {
    char v5 = PLPickerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "asset representation mode too small", buf, 2u);
    }
  }
  int64_t v6 = [(PUPickerConfiguration *)self preferredAssetRepresentationMode];
  if (v6 > *MEMORY[0x1E4F399D8])
  {
    int64_t v7 = PLPickerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "asset representation mode too big", buf, 2u);
    }

    BOOL v4 = 0;
  }
  int64_t v8 = [(PUPickerConfiguration *)self selection];
  if (v8 < *MEMORY[0x1E4F399F0])
  {
    v9 = PLPickerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "selection too small", buf, 2u);
    }

    BOOL v4 = 0;
  }
  int64_t v10 = [(PUPickerConfiguration *)self selection];
  if (v10 > *MEMORY[0x1E4F399E8])
  {
    v11 = PLPickerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "selection too big", buf, 2u);
    }

    BOOL v4 = 0;
  }
  int64_t v12 = [(PUPickerConfiguration *)self mode];
  if (v12 < *MEMORY[0x1E4F39A00])
  {
    v13 = PLPickerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "mode too small", buf, 2u);
    }

    BOOL v4 = 0;
  }
  int64_t v14 = [(PUPickerConfiguration *)self mode];
  if (v14 > *MEMORY[0x1E4F399F8])
  {
    unint64_t v15 = PLPickerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "mode too big", buf, 2u);
    }

    BOOL v4 = 0;
  }
  int64_t v16 = [(PUPickerConfiguration *)self sourceType];
  if (v16 < *MEMORY[0x1E4F39AA0])
  {
    v17 = PLPickerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "source type too small", buf, 2u);
    }

    BOOL v4 = 0;
  }
  int64_t v18 = [(PUPickerConfiguration *)self sourceType];
  if (v18 > *MEMORY[0x1E4F39A98])
  {
    v19 = PLPickerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "source type too big", buf, 2u);
    }

    BOOL v4 = 0;
  }
  if ([(PUPickerConfiguration *)self selectionLimit] < 0)
  {
    v20 = PLPickerGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "selection limit is negative", buf, 2u);
    }

    BOOL v4 = 0;
  }
  if ([(PUPickerConfiguration *)self minimumSelectionLimit] < 0)
  {
    v21 = PLPickerGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_ERROR, "lower selection limit is negative", buf, 2u);
    }

    BOOL v4 = 0;
  }
  if (![(PUPickerConfiguration *)self receivedPhotoLibrary]
    && [(PUPickerConfiguration *)self onlyReturnsIdentifiers])
  {
    v22 = PLPickerGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, "requested identifiers without specified photo library", buf, 2u);
    }

    BOOL v4 = 0;
  }
  v23 = [(PUPickerConfiguration *)self phPickerConfiguration];
  v24 = [v23 filter];
  uint64_t v25 = [v24 _puPickerFilter];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(PUPickerConfiguration *)self phPickerConfiguration];
    v28 = [v27 filter];
    v29 = [v28 _puPickerFilter];
    char v30 = [v29 isValidFilter];

    if (v30) {
      goto LABEL_53;
    }
    v23 = PLPickerGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_ERROR, "invalid filter", buf, 2u);
    }
    BOOL v4 = 0;
  }
  else
  {
  }
LABEL_53:
  v31 = [(PUPickerConfiguration *)self phPickerConfiguration];
  v32 = [v31 _aspectRatio];
  [v32 _aspectRatio];
  if (v33 > 0.0)
  {

LABEL_59:
    goto LABEL_60;
  }
  v34 = [(PUPickerConfiguration *)self phPickerConfiguration];
  v35 = [v34 _aspectRatio];
  [v35 _aspectRatio];
  double v37 = v36;
  double v38 = *MEMORY[0x1E4F399D0];

  if (v37 != v38)
  {
    v31 = PLPickerGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_ERROR, "aspect ratio too small", buf, 2u);
    }
    BOOL v4 = 0;
    goto LABEL_59;
  }
LABEL_60:
  if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
  {
    v39 = [(PUPickerConfiguration *)self preselectedItemIdentifiers];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      v41 = PLPickerGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v41, OS_LOG_TYPE_ERROR, "provided preselection without specified photo library", buf, 2u);
      }

      BOOL v4 = 0;
    }
  }
  if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
  {
    v42 = [(PUPickerConfiguration *)self preselectedItemObjectIDs];
    uint64_t v43 = [v42 count];

    if (v43)
    {
      v44 = PLPickerGetLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v44, OS_LOG_TYPE_ERROR, "provided preselection without specified photo library", buf, 2u);
      }

      BOOL v4 = 0;
    }
  }
  if (![(PUPickerConfiguration *)self isLimitedLibraryPicker])
  {
    v45 = [(PUPickerConfiguration *)self preselectedItemObjectIDs];
    unint64_t v46 = [v45 count];
    v47 = [(PUPickerConfiguration *)self preselectedItemIdentifiers];
    unint64_t v48 = [v47 count];

    if (v46 > v48)
    {
      v49 = PLPickerGetLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v49, OS_LOG_TYPE_ERROR, "found more preselection than expected", buf, 2u);
      }

      BOOL v4 = 0;
    }
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v50 = [(PUPickerConfiguration *)self peopleConfigurations];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v98 objects:v103 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v99;
    uint64_t v97 = *MEMORY[0x1E4F91000];
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v99 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = *(void **)(*((void *)&v98 + 1) + 8 * v54);
        if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
        {
          v56 = [v55 _identifiers];
          uint64_t v57 = [v56 count];

          if (v57)
          {
            v58 = PLPickerGetLog();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE9F8000, v58, OS_LOG_TYPE_ERROR, "provided people without specified photo library", buf, 2u);
            }

            BOOL v4 = 0;
          }
        }
        if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
        {
          v59 = [v55 preselectedIdentifiers];
          uint64_t v60 = [v59 count];

          if (v60)
          {
            v61 = PLPickerGetLog();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE9F8000, v61, OS_LOG_TYPE_ERROR, "provided preselected people without specified photo library", buf, 2u);
            }

            BOOL v4 = 0;
          }
        }
        if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
        {
          v62 = [v55 suggestedIdentifiers];
          uint64_t v63 = [v62 count];

          if (v63)
          {
            v64 = PLPickerGetLog();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE9F8000, v64, OS_LOG_TYPE_ERROR, "provided suggested people without specified photo library", buf, 2u);
            }

            BOOL v4 = 0;
          }
        }
        if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
        {
          v65 = [v55 disabledIdentifiers];
          uint64_t v66 = [v65 count];

          if (v66)
          {
            v67 = PLPickerGetLog();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE9F8000, v67, OS_LOG_TYPE_ERROR, "provided disabled people without specified photo library", buf, 2u);
            }

            BOOL v4 = 0;
          }
        }
        v68 = [(PUPickerConfiguration *)self pickerClientIdentification];
        v69 = [v68 trustedCallerBundleID];

        if (([v69 isEqualToString:@"com.apple.Preferences"] & 1) == 0
          && ([v69 isEqualToString:@"com.apple.Photos"] & 1) == 0
          && ([v69 isEqualToString:v97] & 1) == 0
          && ([v69 isEqualToString:@"com.apple.mobileslideshow"] & 1) == 0
          && ([v69 isEqualToString:@"com.apple.Bridge"] & 1) == 0)
        {
          v70 = [v55 suggestedIdentifiers];
          uint64_t v71 = [v70 count];

          if (v71)
          {
            v72 = PLPickerGetLog();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE9F8000, v72, OS_LOG_TYPE_ERROR, "untrusted caller provided people suggestion", buf, 2u);
            }

            BOOL v4 = 0;
          }
        }

        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [v50 countByEnumeratingWithState:&v98 objects:v103 count:16];
    }
    while (v52);
  }

  v73 = [(PUPickerConfiguration *)self albumsConfiguration];

  if (v73)
  {
    if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
    {
      v74 = [(PUPickerConfiguration *)self albumsConfiguration];
      v75 = [v74 _identifiers];
      uint64_t v76 = [v75 count];

      if (v76)
      {
        v77 = PLPickerGetLog();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v77, OS_LOG_TYPE_ERROR, "provided albums without specified photo library", buf, 2u);
        }

        BOOL v4 = 0;
      }
    }
    if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
    {
      v78 = [(PUPickerConfiguration *)self albumsConfiguration];
      v79 = [v78 preselectedIdentifiers];
      uint64_t v80 = [v79 count];

      if (v80)
      {
        v81 = PLPickerGetLog();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v81, OS_LOG_TYPE_ERROR, "provided preselected albums without specified photo library", buf, 2u);
        }

        BOOL v4 = 0;
      }
    }
    if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
    {
      v82 = [(PUPickerConfiguration *)self albumsConfiguration];
      v83 = [v82 suggestedIdentifiers];
      uint64_t v84 = [v83 count];

      if (v84)
      {
        v85 = PLPickerGetLog();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v85, OS_LOG_TYPE_ERROR, "provided suggested albums without specified photo library", buf, 2u);
        }

        BOOL v4 = 0;
      }
    }
    if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
    {
      v86 = [(PUPickerConfiguration *)self albumsConfiguration];
      v87 = [v86 disabledIdentifiers];
      uint64_t v88 = [v87 count];

      if (v88)
      {
        v89 = PLPickerGetLog();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v89, OS_LOG_TYPE_ERROR, "provided disabled albums without specified photo library", buf, 2u);
        }

        BOOL v4 = 0;
      }
    }
  }
  if ([(PUPickerConfiguration *)self isLimitedLibraryPicker])
  {
    if (![(PUPickerConfiguration *)self receivedPhotoLibrary])
    {
      v90 = PLPickerGetLog();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v90, OS_LOG_TYPE_ERROR, "limited library picker without specified photo library", buf, 2u);
      }

      BOOL v4 = 0;
    }
    v91 = [(PUPickerConfiguration *)self limitedLibraryClientIdentifier];
    uint64_t v92 = [v91 length];

    if (!v92)
    {
      v93 = PLPickerGetLog();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v93, OS_LOG_TYPE_ERROR, "limited library picker without client identifier", buf, 2u);
      }

      BOOL v4 = 0;
    }
    v94 = [(PUPickerConfiguration *)self LimitedLibraryError];

    if (v94)
    {
      v95 = PLPickerGetLog();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v95, OS_LOG_TYPE_ERROR, "limited library picker with client error", buf, 2u);
      }

      return 0;
    }
  }
  return v4;
}

- (PUPickerConfiguration)initWithPHPickerConfiguration:(id)a3 connection:(id)a4 overriddenGeneratedFilter:(id)a5 allowsDownload:(BOOL)a6 usesMemoriesLayout:(BOOL)a7
{
  BOOL v183 = a7;
  v203[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v13)
  {
    v166 = [MEMORY[0x1E4F28B00] currentHandler];
    [v166 handleFailureInMethod:a2, self, @"PUPickerConfiguration.m", 188, @"Invalid parameter not satisfying: %@", @"phPickerConfiguration != nil" object file lineNumber description];
  }
  v193.receiver = self;
  v193.super_class = (Class)PUPickerConfiguration;
  int64_t v16 = [(PUPickerConfiguration *)&v193 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_phPickerConfiguration, a3);
    v17->_preferredAssetRepresentationMode = [v13 preferredAssetRepresentationMode];
    v17->_selection = [v13 selection];
    v17->_mode = [v13 mode];
    if (v15)
    {
      int64_t v18 = (PUPickerGeneratedFilter *)v15;
    }
    else
    {
      v19 = [PUPickerGeneratedFilter alloc];
      v20 = [v13 filter];
      a2 = [v20 _puPickerFilter];
      int64_t v18 = [(PUPickerGeneratedFilter *)v19 initWithFilter:a2];
    }
    objc_storeStrong((id *)&v17->_generatedFilter, v18);
    v21 = [v13 photoLibrary];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [MEMORY[0x1E4F39228] imagePickerPhotoLibrary];
    }
    v24 = v23;
    v185 = v18;
    id v177 = v15;

    objc_storeStrong((id *)&v17->_photoLibrary, v24);
    uint64_t v25 = [v13 photoLibrary];
    v17->_receivedPhotoLibrary = v25 != 0;

    v17->_onlyReturnsIdentifiers = [v13 _onlyReturnsIdentifiers];
    v17->_allowsDownscaling = [v13 _allowsDownscaling];
    v17->_allowsEncodingPolicyModification = [v13 _allowsEncodingPolicyModification];
    uint64_t v26 = [v13 _suggestionGroup];
    suggestionGroup = v17->_suggestionGroup;
    v17->_suggestionGroup = (_PHPickerSuggestionGroup *)v26;

    uint64_t v28 = [v13 _albumsConfiguration];
    albumsConfiguration = v17->_albumsConfiguration;
    v17->_albumsConfiguration = (_PHPickerCollectionConfiguration *)v28;

    char v30 = [v13 _peopleConfiguration];
    if (v30)
    {
      a2 = [v13 _peopleConfiguration];
      v203[0] = a2;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:1];
    }
    else
    {
      [v13 _followupPeopleConfigurations];
    v31 = };
    objc_storeStrong((id *)&v17->_peopleConfigurations, v31);
    if (v30)
    {

      v31 = (void *)a2;
    }

    v17->_usesMemoriesLayout = v183;
    v32 = [v13 _peopleConfiguration];

    if (v32)
    {
      double v33 = [v13 _peopleConfiguration];
      v34 = [v33 suggestedIdentifiers];

      v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v34];
      double v36 = [v13 _peopleConfiguration];
      double v37 = [v36 _identifiers];

      if ([v37 count]) {
        [v35 addObjectsFromArray:v37];
      }
      uint64_t v38 = [v35 copy];
      allPersonIdentifiers = v17->_allPersonIdentifiers;
      v17->_allPersonIdentifiers = (NSOrderedSet *)v38;
    }
    v17->_allowsDownload = a6;
    v184 = v24;
    if (v14)
    {
      uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F8B8B0]) initWithConnection:v14];
      v41 = [v40 trustedCallerBundleID];
      *(_OWORD *)v201 = 0u;
      long long v202 = 0u;
      if (v40) {
        [v40 clientAuditToken];
      }
      *(_OWORD *)buf = *(_OWORD *)v201;
      long long v200 = v202;
      uint64_t v42 = PLPhotosAccessAllowedResultForClientAuditToken();
      *(_OWORD *)buf = *(_OWORD *)v201;
      long long v200 = v202;
      char v43 = [MEMORY[0x1E4F8B9D8] isEntitledForPhotoKitOrPrivatePhotosTCCForToken:buf];
      id v192 = 0;
      *(_OWORD *)buf = *(_OWORD *)v201;
      long long v200 = v202;
      v44 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:buf error:&v192];
      id v45 = v192;
      if (v44)
      {
        uint64_t v46 = [v44 localizedName];
        pickerClientDisplayName = v17->_pickerClientDisplayName;
        v17->_pickerClientDisplayName = (NSString *)v46;

        if (!v41)
        {
          v41 = [v44 bundleIdentifier];
        }
      }
      else
      {
        unint64_t v48 = PLPickerGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v45;
          _os_log_impl(&dword_1AE9F8000, v48, OS_LOG_TYPE_ERROR, "Failed to obtain bundle record: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v41 = 0;
      char v43 = 0;
      uint64_t v40 = 0;
      uint64_t v42 = 1;
    }
    v176 = v40;
    objc_storeStrong((id *)&v17->_pickerClientIdentification, v40);
    v17->_pickerClientAccessAllowedResult = v42;
    v17->_pickerClientIsEntitledForOrHasPrivateLibraryAccess = v43;
    v179 = v41;
    objc_storeStrong((id *)&v17->_pickerClientBundleIdentifier, v41);
    id v49 = [v13 _purposedLimitedLibraryApplicationIdentifier];
    BOOL v50 = v49 != 0;

    if (v49)
    {
      uint64_t v51 = [v13 _purposedLimitedLibraryApplicationIdentifier];
      id v191 = 0;
      uint64_t v52 = v14;
      uint64_t v53 = +[PUPickerConfiguration limitedLibraryApplicationTrustedIdentifierWithConnection:v14 purposedIdentifier:v51 error:&v191];
      id v49 = v191;
    }
    else
    {
      uint64_t v52 = v14;
      uint64_t v53 = 0;
    }
    v17->_isLimitedLibraryPicker = v50;
    objc_storeStrong((id *)&v17->_limitedLibraryClientIdentifier, v53);
    v175 = v49;
    objc_storeStrong((id *)&v17->_LimitedLibraryError, v49);
    uint64_t v54 = (void *)MEMORY[0x1E4F1CAA0];
    uint64_t v55 = [v13 preselectedAssetIdentifiers];
    v56 = (void *)v55;
    uint64_t v57 = MEMORY[0x1E4F1CBF0];
    if (v55) {
      uint64_t v58 = v55;
    }
    else {
      uint64_t v58 = MEMORY[0x1E4F1CBF0];
    }
    [v54 orderedSetWithArray:v58];
    uint64_t v60 = v59 = v53;

    v61 = (void *)MEMORY[0x1E4F1CAA0];
    v62 = [v13 _peopleConfiguration];
    uint64_t v63 = [v62 preselectedIdentifiers];
    v64 = (void *)v63;
    if (v63) {
      uint64_t v65 = v63;
    }
    else {
      uint64_t v65 = v57;
    }
    v180 = [v61 orderedSetWithArray:v65];

    uint64_t v66 = (void *)MEMORY[0x1E4F1CAA0];
    v67 = [v13 _albumsConfiguration];
    uint64_t v68 = [v67 preselectedIdentifiers];
    v69 = (void *)v68;
    if (v68) {
      uint64_t v70 = v68;
    }
    else {
      uint64_t v70 = v57;
    }
    uint64_t v71 = [v66 orderedSetWithArray:v70];

    id obj = v71;
    v182 = v59;
    v178 = v52;
    if (v59)
    {
      if (v52) {
        [v52 auditToken];
      }
      else {
        memset(v190, 0, sizeof(v190));
      }
      uint64_t v86 = MEMORY[0x1E4F1CBF0];
      unint64_t v87 = 0x1E4F1C000;
      uint64_t v85 = +[PUPickerConfiguration limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier:v182 auditToken:v190 photoLibrary:v184];
      goto LABEL_59;
    }
    if ([v71 count])
    {
      v72 = v71;
      id v173 = v13;
      v73 = [(PUPickerConfiguration *)v17 photoLibrary];
      v74 = [v73 librarySpecificFetchOptions];

      v75 = [MEMORY[0x1E4F1CA48] array];
      long long v186 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      uint64_t v76 = [v72 array];
      uint64_t v77 = [v76 countByEnumeratingWithState:&v186 objects:v198 count:16];
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v187;
        do
        {
          for (uint64_t i = 0; i != v78; ++i)
          {
            if (*(void *)v187 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = (void *)MEMORY[0x1E4F38EE8];
            uint64_t v197 = *(void *)(*((void *)&v186 + 1) + 8 * i);
            v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
            v83 = [v81 fetchAssetCollectionsWithLocalIdentifiers:v82 options:v74];

            uint64_t v84 = objc_msgSend(v83, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v60);
            [v75 addObjectsFromArray:v84];
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v186 objects:v198 count:16];
        }
        while (v78);
      }

      uint64_t v85 = [v75 mutableCopy];
      objc_storeStrong((id *)&v17->_preselectedItemIdentifiers, obj);

      id v13 = v173;
    }
    else
    {
      if (![v60 count])
      {
        unint64_t v87 = 0x1E4F1C000;
        if ([v180 count])
        {
          v132 = [(PUPickerConfiguration *)v17 photoLibrary];
          v133 = [v132 librarySpecificFetchOptions];

          v134 = (void *)MEMORY[0x1E4F391F0];
          v135 = [v180 array];
          v136 = [v134 fetchPersonsWithLocalIdentifiers:v135 options:v133];

          uint64_t v85 = objc_msgSend(v136, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v180);
          objc_storeStrong((id *)&v17->_preselectedItemIdentifiers, v180);
        }
        else
        {
          objc_storeStrong((id *)&v17->_preselectedItemIdentifiers, v60);
          uint64_t v85 = MEMORY[0x1E4F1CBF0];
        }
        uint64_t v86 = MEMORY[0x1E4F1CBF0];
LABEL_59:
        uint64_t v93 = [*(id *)(v87 + 2720) orderedSetWithArray:v85];
        preselectedItemObjectIDs = v17->_preselectedItemObjectIDs;
        v17->_preselectedItemObjectIDs = (NSOrderedSet *)v93;

        v174 = (void *)v85;
        if ([v13 _sourceType] == 1
          || [v13 _sourceType] == 3
          || [v13 _sourceType] == 4)
        {
          v95 = 0;
          goto LABEL_63;
        }
        v113 = [v184 librarySpecificFetchOptions];
        [v113 setIncludeAllPhotosSmartAlbum:1];
        v172 = [v13 _containerIdentifier];
        if (!v172)
        {
          v95 = 0;
          v137 = 0;
LABEL_133:
          v161 = [(PHFetchResult *)v137 firstObject];

          if (!v161)
          {
            v162 = PLPickerGetLog();
            if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v201 = 0;
              _os_log_impl(&dword_1AE9F8000, v162, OS_LOG_TYPE_DEFAULT, "No custom collection specified/found. Using all photos asset collection.", v201, 2u);
            }

            uint64_t v163 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000205 options:v113];

            v137 = (PHFetchResult *)v163;
          }
          containerCollectionFetchResult = v17->_containerCollectionFetchResult;
          v17->_containerCollectionFetchResult = v137;

LABEL_63:
          v96 = [v13 _peopleConfiguration];
          uint64_t v97 = [v96 suggestedIdentifiers];
          long long v98 = (void *)v97;
          if (v97) {
            long long v99 = (void *)v97;
          }
          else {
            long long v99 = (void *)v86;
          }
          id v100 = v99;

          if ([v100 count])
          {
            long long v101 = [(PUPickerConfiguration *)v17 photoLibrary];
            v102 = [v101 librarySpecificFetchOptions];

            v103 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v100 options:v102];
            uint64_t v104 = [*(id *)(v87 + 2720) orderedSetWithArray:v100];
            uint64_t v86 = objc_msgSend(v103, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v104);

            unint64_t v87 = 0x1E4F1C000uLL;
          }
          v105 = (void *)v86;
          uint64_t v106 = [*(id *)(v87 + 2720) orderedSetWithArray:v86];
          suggestedItemObjectIDs = v17->_suggestedItemObjectIDs;
          v17->_suggestedItemObjectIDs = (NSOrderedSet *)v106;

          uint64_t v108 = [(PUPickerGeneratedFilter *)v185 possibleAssetTypes];
          [(PUPickerGeneratedFilter *)v185 displayAssetMediaType];
          id v109 = v95;
          id v110 = v13;
          v111 = v110;
          if (v108 <= 127)
          {
            if (v108 > 15)
            {
              v112 = v179;
              if (v108 == 16 || v108 == 32 || v108 == 64) {
                goto LABEL_121;
              }
            }
            else
            {
              v112 = v179;
              if (!v108 || v108 == 4 || v108 == 8) {
                goto LABEL_121;
              }
            }
LABEL_103:
            if ((v108 & 0x3FE) != 0 && (v108 & 0x1FC00) != 0)
            {
              if (!v183
                || ([v110 _suggestionGroup],
                    v130 = objc_claimAutoreleasedReturnValue(),
                    v130,
                    v130))
              {
                if (v109)
                {
                  v131 = objc_msgSend(v109, "px_localizedName");
                  v112 = v179;
                  if ([v131 length])
                  {
                    v129 = objc_msgSend(v109, "px_localizedName");
                  }
                  else
                  {
                    *(void *)v201 = v109;
                    v165 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:1];
                    v129 = PXLocalizedStringForPeople();

                    v112 = v179;
                  }

                  goto LABEL_122;
                }
              }
              goto LABEL_100;
            }
LABEL_121:
            v129 = PXLocalizedString();
            goto LABEL_122;
          }
          if (v108 >= 0x2000)
          {
            if (v108 != 0x2000)
            {
              v112 = v179;
              if (v108 == 0x4000 || v108 == 0x8000) {
                goto LABEL_121;
              }
              goto LABEL_103;
            }
          }
          else if (v108 != 128)
          {
            if (v108 == 256)
            {
              v128 = PXLocalizedString();
              uint64_t v167 = [v111 selectionLimit];
              v129 = PXLocalizedStringWithValidatedFormat();

LABEL_101:
              v112 = v179;
LABEL_122:

              uint64_t v149 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:v129 identifier:*MEMORY[0x1E4F91068] photoLibrary:v184];
              allPhotosVirtualCollection = v17->_allPhotosVirtualCollection;
              v17->_allPhotosVirtualCollection = (PHAssetCollection *)v149;

              v17->_supportsInteractiveBarTransition = 0;
              v17->_interactiveBarTransitionFractionExpanded = 1.0;
              v17->_interactiveBarTransitionWindowHeight = 0.0;

              id v15 = v177;
              id v14 = v178;
              goto LABEL_123;
            }
            v112 = v179;
            if (v108 == 2048) {
              goto LABEL_121;
            }
            goto LABEL_103;
          }
LABEL_100:
          v129 = PXLocalizedString();
          goto LABEL_101;
        }
        v114 = PUPickerConfigurationGetFetchType(v13);
        uint64_t v115 = *MEMORY[0x1E4F39670];
        v170 = v114;
        v171 = v113;
        if (![v114 isEqualToString:*MEMORY[0x1E4F39670]])
        {
          if (![v114 isEqualToString:*MEMORY[0x1E4F39680]])
          {
            v145 = PLPickerGetLog();
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v201 = 138412290;
              *(void *)&v201[4] = v172;
              _os_log_impl(&dword_1AE9F8000, v145, OS_LOG_TYPE_DEFAULT, "Looking for custom asset collection with identifier: %@", v201, 0xCu);
            }

            v146 = (void *)MEMORY[0x1E4F38EE8];
            v194 = v172;
            uint64_t v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1];
            v148 = v146;
            v144 = (void *)v147;
            v113 = v171;
            v137 = [v148 fetchAssetCollectionsWithLocalIdentifiers:v147 options:v171];
            v95 = 0;
            goto LABEL_132;
          }
          uint64_t v168 = PUPickerConfigurationGetSocialGroup(v13);
          v169 = [v184 librarySpecificFetchOptions];
          v138 = [MEMORY[0x1E4F38EB8] fetchExclusiveAssetsForSocialGroup:v168 options:v169];
          v139 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v138 title:&stru_1F06BE7B8 identifier:v172];
          v140 = (void *)MEMORY[0x1E4F39008];
          v195 = v139;
          v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v195 count:1];
          v142 = [v140 transientCollectionListWithCollections:v141 title:&stru_1F06BE7B8];

          v143 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:v184 orObject:0];
          v137 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v142 options:v143];

          v144 = (void *)v168;
          unint64_t v87 = 0x1E4F1C000;

          v95 = 0;
LABEL_131:
          v113 = v171;
LABEL_132:

          goto LABEL_133;
        }
        id v116 = v13;
        v117 = PUPickerConfigurationGetFetchType(v116);
        v118 = [v116 _containerIdentifier];
        if (v118)
        {
          int v119 = [v117 isEqualToString:v115];
          v120 = v184;
          if (!v119)
          {
            v95 = 0;
            goto LABEL_130;
          }
          v121 = PLPickerGetLog();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v201 = 138412290;
            *(void *)&v201[4] = v118;
            _os_log_impl(&dword_1AE9F8000, v121, OS_LOG_TYPE_DEFAULT, "Looking for person with identifier: %@", v201, 0xCu);
          }

          v122 = [v116 photoLibrary];
          v123 = [v122 librarySpecificFetchOptions];

          [v123 setFetchLimit:1];
          [v123 setPersonContext:5];
          v124 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
          [v123 setIncludedDetectionTypes:v124];

          v125 = (void *)MEMORY[0x1E4F391F0];
          *(void *)v201 = v118;
          v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:1];
          v127 = [v125 fetchPersonsWithLocalIdentifiers:v126 options:v123];
          v95 = [v127 firstObject];
        }
        else
        {
          v95 = 0;
        }
        v120 = v184;
LABEL_130:

        v154 = [v120 librarySpecificFetchOptions];
        [v154 setIncludeTorsoAndFaceDetectionData:1];
        v155 = [MEMORY[0x1E4F38EB8] fetchAssetsForPerson:v95 options:v154];
        v156 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v155 title:&stru_1F06BE7B8 identifier:v172];
        v157 = (void *)MEMORY[0x1E4F39008];
        v196 = v156;
        v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v196 count:1];
        v159 = [v157 transientCollectionListWithCollections:v158 title:&stru_1F06BE7B8];

        v160 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:v184 orObject:0];
        v137 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v159 options:v160];

        v144 = v154;
        uint64_t v86 = MEMORY[0x1E4F1CBF0];
        unint64_t v87 = 0x1E4F1C000;
        goto LABEL_131;
      }
      uint64_t v88 = [(PUPickerConfiguration *)v17 photoLibrary];
      v89 = [v88 librarySpecificFetchOptions];

      v90 = (void *)MEMORY[0x1E4F38EB8];
      v91 = [v60 array];
      uint64_t v92 = [v90 fetchAssetsWithLocalIdentifiers:v91 options:v89];

      uint64_t v85 = objc_msgSend(v92, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v60);
      objc_storeStrong((id *)&v17->_preselectedItemIdentifiers, v60);
    }
    uint64_t v86 = MEMORY[0x1E4F1CBF0];
    unint64_t v87 = 0x1E4F1C000uLL;
    goto LABEL_59;
  }
LABEL_123:
  if ([(PUPickerConfiguration *)v17 isValidConfiguration]) {
    v151 = v17;
  }
  else {
    v151 = 0;
  }
  v152 = v151;

  return v152;
}

- (id)initForUIImagePickerControllerWithPHPickerConfiguration:(id)a3 connection:(id)a4 overriddenGeneratedFilter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUPickerConfiguration.m", 173, @"Invalid parameter not satisfying: %@", @"phPickerConfiguration != nil" object file lineNumber description];
  }
  int64_t v12 = -[PUPickerConfiguration initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:](self, "initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:", v9, v10, v11, [v9 _onlyReturnsIdentifiers] ^ 1, objc_msgSend(v9, "_usesMemoriesLayout"));

  return v12;
}

- (PUPickerConfiguration)initWithPHPickerConfiguration:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUPickerConfiguration.m", 160, @"Invalid parameter not satisfying: %@", @"phPickerConfiguration != nil" object file lineNumber description];
  }
  id v9 = -[PUPickerConfiguration initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:](self, "initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:", v7, v8, 0, 0, [v7 _usesMemoriesLayout]);

  return v9;
}

- (PUPickerConfiguration)init
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F39930]);
  char v5 = [(PUPickerConfiguration *)self initWithPHPickerConfiguration:v4 connection:0];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:0 file:@"PUPickerConfiguration.m" lineNumber:153 description:@"Self must not be nil."];
  }
  return v5;
}

+ (id)limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier:(id)a3 auditToken:(id *)a4 photoLibrary:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F8A910];
  id v10 = [v8 managedObjectContextForCurrentQueueQoS];
  id v11 = [v9 fetchLimitedLibraryFetchFilterWithApplicationIdentifier:v7 inManagedObjectContext:v10];

  int64_t v12 = PLPickerGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "Fetching existing selection for client: %@", buf, 0xCu);
    }

    id v14 = [MEMORY[0x1E4F8A950] entityName];
    id v15 = [v11 predicateForEntityName:v14];

    if (!v15)
    {
      v22 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_14;
    }
    int64_t v16 = [v8 librarySpecificFetchOptions];
    v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    uint64_t v28 = v17;
    int64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [v16 setSortDescriptors:v18];

    [v16 setInternalPredicate:v15];
    [v16 setIncludeAssetSourceTypes:5];
    v19 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v16];
    v20 = [v19 fetchedObjectIDs];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      v22 = [v19 fetchedObjectIDs];
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "Creating initial empty fetch filter for client: %@", buf, 0xCu);
    }

    id v23 = [v8 assetsdClient];
    id v15 = [v23 libraryInternalClient];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __138__PUPickerConfiguration_limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier_auditToken_photoLibrary___block_invoke;
    v26[3] = &unk_1E5F2E3B8;
    id v27 = v7;
    long long v24 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    long long v30 = v24;
    v22 = (void *)MEMORY[0x1E4F1CBF0];
    [v15 setFetchFilterWithAssets:MEMORY[0x1E4F1CBF0] forApplication:v27 withAuditToken:buf completionHandler:v26];
    int64_t v16 = v27;
  }

LABEL_14:

  return v22;
}

void __138__PUPickerConfiguration_limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier_auditToken_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = PLPickerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int64_t v6 = [NSNumber numberWithBool:a2];
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Created initial empty fetch filter for client: %@, success: %@", (uint8_t *)&v7, 0x16u);
  }
}

+ (id)limitedLibraryApplicationTrustedIdentifierWithConnection:(id)a3 purposedIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PUPickerConfiguration.m", 441, @"Invalid parameter not satisfying: %@", @"outError != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_12:
    v17 = (void *)MEMORY[0x1E4F28C58];
    int64_t v18 = @"Missing XPC connection.";
    goto LABEL_13;
  }
  if (!v9) {
    goto LABEL_12;
  }
LABEL_3:
  if (![v10 length])
  {
    id v15 = PLClientApplicationIdentifierFromXPCConnection();
    id v13 = v15;
    if (v15)
    {
      id v16 = v15;
      id v14 = 0;
    }
    else
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Missing trusted bundle identifier.");
    }

    goto LABEL_14;
  }
  uint64_t v11 = [v9 valueForEntitlement:*MEMORY[0x1E4F8BAB8]];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    id v13 = v10;
    id v14 = 0;
    goto LABEL_14;
  }
  v17 = (void *)MEMORY[0x1E4F28C58];
  int64_t v18 = @"Missing entitlement.";
LABEL_13:
  id v14 = objc_msgSend(v17, "px_genericErrorWithDebugDescription:", v18);
  id v13 = 0;
LABEL_14:
  id v20 = v14;
  *a5 = v20;

  return v13;
}

@end