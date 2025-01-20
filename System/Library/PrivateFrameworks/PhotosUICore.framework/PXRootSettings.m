@interface PXRootSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (void)_manageHomeScreenQuickActions;
+ (void)_setWantsInternalHomeScreenQuickActions:(BOOL)a3;
- (BOOL)canShowInternalUI;
- (BOOL)hideWIPAlerts;
- (BOOL)private_wantsInternalUI;
- (BOOL)showLibraryFilterTip;
- (BOOL)showWIPAlertRadar;
- (PXAlbumsDebugUISettings)albumsDebugUISettings;
- (PXApplicationSettings)applicationSettings;
- (PXAssetVariationsSettings)variationsSettings;
- (PXAssetsRecoverySettings)assetsRecoverySettings;
- (PXAssetsSceneSettings)assetsScene;
- (PXAudioSettings)audioSettings;
- (PXCPLStatusSettings)cplStatusSettings;
- (PXCompleteMyMomentSettings)completeMyMoment;
- (PXContentPrivacySettings)contentPrivacySettings;
- (PXContentSyndicationSettings)contentSyndicationSettings;
- (PXCuratedLibrarySettings)curatedLibrarySettings;
- (PXCursorInteractionSettings)cursorInteractionSettings;
- (PXDiagnosticsSettings)diagnostics;
- (PXDisplayAssetViewDemoSettings)assetViewDemoSettings;
- (PXDocumentMenuSettings)documentMenuSettings;
- (PXDragAndDropSettings)dragAndDrop;
- (PXDuplicatesSettings)duplicatesSettings;
- (PXFocusSettings)focusSettings;
- (PXFooterSettings)footerSettings;
- (PXForYouSettings)forYou;
- (PXGPPTSettings)tungstenPPTSettings;
- (PXGenerativeStorySettings)generativeStorySettings;
- (PXGridSettings)grid;
- (PXImageModulationSettings)imageModulationSettings;
- (PXImportSettings)importSettings;
- (PXInlineVideoStabilizationSettings)inlineVideoStabilizationSettings;
- (PXKeyboardSettings)keyboardSettings;
- (PXKitSettings)kit;
- (PXLemonadeSettings)lemonadeSettings;
- (PXMacSyncedAlbumsSettings)macSyncedAlbumsSettings;
- (PXMapSettings)mapSettings;
- (PXMediaProviderSettings)mediaProviderSettings;
- (PXMemoriesFeedSettings)memoryFeed;
- (PXMemoriesRelatedSettings)memoriesRelated;
- (PXMessagesUISettings)messagesUISettings;
- (PXModelSettings)model;
- (PXOneUpSettings)oneUpSettings;
- (PXPasteboardAssetSettings)dragDropSettings;
- (PXPeopleDetailSettings)peopleDetail;
- (PXPeopleUISettings)peopleUISettings;
- (PXPhotoPickerSettings)photoPickerSettings;
- (PXPhotosDataSourceSettings)photosDataSource;
- (PXPhotosDetailsHeaderTileSettings)photosDetailsHeaderTile;
- (PXPhotosDetailsNavigationSettings)detailsNavigationSettings;
- (PXPhotosDetailsSettings)photosDetails;
- (PXPhotosGridSettings)photosGridSettings;
- (PXSearchSettings)searchSettings;
- (PXSharedAlbumsSettings)sharedAlbumsSettings;
- (PXSharedLibrarySettings)sharedLibrarySettings;
- (PXSharingSettings)sharingSettings;
- (PXStickersSettings)stickersSettings;
- (PXStorySettings)storySettings;
- (PXSwipeDownSettings)swipeDownSettings;
- (PXSystemNavigationSettings)systemNavigationSettings;
- (PXTilingSettings)tiling;
- (PXUpNextSettings)upNextSettings;
- (PXVideoPlaybackSettings)videoPlaybackSettings;
- (PXWorkaroundSettings)workaroundSettings;
- (PXZoomablePhotosSettings)zoomablePhotosSettings;
- (id)parentSettings;
- (void)createChildren;
- (void)setAlbumsDebugUISettings:(id)a3;
- (void)setApplicationSettings:(id)a3;
- (void)setAssetViewDemoSettings:(id)a3;
- (void)setAssetsRecoverySettings:(id)a3;
- (void)setAssetsScene:(id)a3;
- (void)setAudioSettings:(id)a3;
- (void)setCompleteMyMoment:(id)a3;
- (void)setContentPrivacySettings:(id)a3;
- (void)setContentSyndicationSettings:(id)a3;
- (void)setCplStatusSettings:(id)a3;
- (void)setCuratedLibrarySettings:(id)a3;
- (void)setCursorInteractionSettings:(id)a3;
- (void)setDefaultValues;
- (void)setDetailsNavigationSettings:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setDocumentMenuSettings:(id)a3;
- (void)setDragAndDrop:(id)a3;
- (void)setDragDropSettings:(id)a3;
- (void)setDuplicatesSettings:(id)a3;
- (void)setFocusSettings:(id)a3;
- (void)setFooterSettings:(id)a3;
- (void)setForYou:(id)a3;
- (void)setGenerativeStorySettings:(id)a3;
- (void)setGrid:(id)a3;
- (void)setHideWIPAlerts:(BOOL)a3;
- (void)setImageModulationSettings:(id)a3;
- (void)setImportSettings:(id)a3;
- (void)setInlineVideoStabilizationSettings:(id)a3;
- (void)setKeyboardSettings:(id)a3;
- (void)setKit:(id)a3;
- (void)setLemonadeSettings:(id)a3;
- (void)setMacSyncedAlbumsSettings:(id)a3;
- (void)setMapSettings:(id)a3;
- (void)setMediaProviderSettings:(id)a3;
- (void)setMemoriesRelated:(id)a3;
- (void)setMemoryFeed:(id)a3;
- (void)setMessagesUISettings:(id)a3;
- (void)setModel:(id)a3;
- (void)setOneUpSettings:(id)a3;
- (void)setPeopleDetail:(id)a3;
- (void)setPeopleUISettings:(id)a3;
- (void)setPhotoPickerSettings:(id)a3;
- (void)setPhotosDataSource:(id)a3;
- (void)setPhotosDetails:(id)a3;
- (void)setPhotosDetailsHeaderTile:(id)a3;
- (void)setPhotosGridSettings:(id)a3;
- (void)setPrivate_wantsInternalUI:(BOOL)a3;
- (void)setSearchSettings:(id)a3;
- (void)setSharedAlbumsSettings:(id)a3;
- (void)setSharedLibrarySettings:(id)a3;
- (void)setSharingSettings:(id)a3;
- (void)setShowLibraryFilterTip:(BOOL)a3;
- (void)setShowWIPAlertRadar:(BOOL)a3;
- (void)setStickersSettings:(id)a3;
- (void)setStorySettings:(id)a3;
- (void)setSwipeDownSettings:(id)a3;
- (void)setSystemNavigationSettings:(id)a3;
- (void)setTiling:(id)a3;
- (void)setTungstenPPTSettings:(id)a3;
- (void)setUpNextSettings:(id)a3;
- (void)setVariationsSettings:(id)a3;
- (void)setVideoPlaybackSettings:(id)a3;
- (void)setWorkaroundSettings:(id)a3;
- (void)setZoomablePhotosSettings:(id)a3;
@end

@implementation PXRootSettings

+ (id)sharedInstance
{
  os_unfair_lock_lock(&PXSettingsSharedInstanceLock);
  if (!sharedInstance_sharedInstance_100199)
  {
    uint64_t v3 = [a1 createSharedInstance];
    v4 = (void *)sharedInstance_sharedInstance_100199;
    sharedInstance_sharedInstance_100199 = v3;
  }
  os_unfair_lock_unlock(&PXSettingsSharedInstanceLock);
  v5 = (void *)sharedInstance_sharedInstance_100199;
  return v5;
}

- (BOOL)private_wantsInternalUI
{
  return self->_private_wantsInternalUI;
}

- (BOOL)canShowInternalUI
{
  int HasInternalUI = PFOSVariantHasInternalUI();
  if (HasInternalUI)
  {
    LOBYTE(HasInternalUI) = [(PXRootSettings *)self private_wantsInternalUI];
  }
  return HasInternalUI;
}

- (void)createChildren
{
  uint64_t v3 = [(PTSettings *)[PXCPLStatusSettings alloc] initWithDefaultValues];
  cplStatusSettings = self->_cplStatusSettings;
  self->_cplStatusSettings = v3;

  v5 = [(PTSettings *)[PXDuplicatesSettings alloc] initWithDefaultValues];
  duplicatesSettings = self->_duplicatesSettings;
  self->_duplicatesSettings = v5;

  v7 = [(PTSettings *)[PXAssetsRecoverySettings alloc] initWithDefaultValues];
  assetsRecoverySettings = self->_assetsRecoverySettings;
  self->_assetsRecoverySettings = v7;

  v9 = [(PTSettings *)[PXDocumentMenuSettings alloc] initWithDefaultValues];
  documentMenuSettings = self->_documentMenuSettings;
  self->_documentMenuSettings = v9;

  v11 = [(PTSettings *)[PXMacSyncedAlbumsSettings alloc] initWithDefaultValues];
  macSyncedAlbumsSettings = self->_macSyncedAlbumsSettings;
  self->_macSyncedAlbumsSettings = v11;

  v13 = [(PTSettings *)[PXImageModulationSettings alloc] initWithDefaultValues];
  imageModulationSettings = self->_imageModulationSettings;
  self->_imageModulationSettings = v13;

  v15 = [(PTSettings *)[PXSharedLibrarySettings alloc] initWithDefaultValues];
  sharedLibrarySettings = self->_sharedLibrarySettings;
  self->_sharedLibrarySettings = v15;

  v17 = [(PTSettings *)[PXAlbumsDebugUISettings alloc] initWithDefaultValues];
  albumsDebugUISettings = self->_albumsDebugUISettings;
  self->_albumsDebugUISettings = v17;

  v19 = [(PTSettings *)[PXDragAndDropSettings alloc] initWithDefaultValues];
  dragAndDrop = self->_dragAndDrop;
  self->_dragAndDrop = v19;

  v21 = [(PTSettings *)[PXForYouSettings alloc] initWithDefaultValues];
  forYou = self->_forYou;
  self->_forYou = v21;

  v23 = [(PTSettings *)[PXPhotoPickerSettings alloc] initWithDefaultValues];
  photoPickerSettings = self->_photoPickerSettings;
  self->_photoPickerSettings = v23;

  v25 = [(PTSettings *)[PXPeopleDetailSettings alloc] initWithDefaultValues];
  peopleDetail = self->_peopleDetail;
  self->_peopleDetail = v25;

  v27 = [(PTSettings *)[PXPhotosDetailsHeaderTileSettings alloc] initWithDefaultValues];
  photosDetailsHeaderTile = self->_photosDetailsHeaderTile;
  self->_photosDetailsHeaderTile = v27;

  v29 = [(PTSettings *)[PXImportSettings alloc] initWithDefaultValues];
  importSettings = self->_importSettings;
  self->_importSettings = v29;

  v31 = [(PTSettings *)[PXDiagnosticsSettings alloc] initWithDefaultValues];
  diagnostics = self->_diagnostics;
  self->_diagnostics = v31;

  v33 = [(PTSettings *)[PXInlineVideoStabilizationSettings alloc] initWithDefaultValues];
  inlineVideoStabilizationSettings = self->_inlineVideoStabilizationSettings;
  self->_inlineVideoStabilizationSettings = v33;

  v35 = [(PTSettings *)[PXPhotosDetailsNavigationSettings alloc] initWithDefaultValues];
  detailsNavigationSettings = self->_detailsNavigationSettings;
  self->_detailsNavigationSettings = v35;

  v37 = [(PTSettings *)[PXPeopleUISettings alloc] initWithDefaultValues];
  peopleUISettings = self->_peopleUISettings;
  self->_peopleUISettings = v37;

  v39 = [(PTSettings *)[PXApplicationSettings alloc] initWithDefaultValues];
  applicationSettings = self->_applicationSettings;
  self->_applicationSettings = v39;

  v41 = [(PTSettings *)[PXAudioSettings alloc] initWithDefaultValues];
  audioSettings = self->_audioSettings;
  self->_audioSettings = v41;

  v43 = [(PTSettings *)[PXStorySettings alloc] initWithDefaultValues];
  storySettings = self->_storySettings;
  self->_storySettings = v43;

  v45 = [(PTSettings *)[PXVideoPlaybackSettings alloc] initWithDefaultValues];
  videoPlaybackSettings = self->_videoPlaybackSettings;
  self->_videoPlaybackSettings = v45;

  v47 = [(PTSettings *)[PXAssetsSceneSettings alloc] initWithDefaultValues];
  assetsScene = self->_assetsScene;
  self->_assetsScene = v47;

  v49 = [(PTSettings *)[PXCompleteMyMomentSettings alloc] initWithDefaultValues];
  completeMyMoment = self->_completeMyMoment;
  self->_completeMyMoment = v49;

  v51 = [(PTSettings *)[PXCuratedLibrarySettings alloc] initWithDefaultValues];
  curatedLibrarySettings = self->_curatedLibrarySettings;
  self->_curatedLibrarySettings = v51;

  v53 = [(PTSettings *)[PXCursorInteractionSettings alloc] initWithDefaultValues];
  cursorInteractionSettings = self->_cursorInteractionSettings;
  self->_cursorInteractionSettings = v53;

  v55 = [(PTSettings *)[PXPasteboardAssetSettings alloc] initWithDefaultValues];
  dragDropSettings = self->_dragDropSettings;
  self->_dragDropSettings = v55;

  v57 = [(PTSettings *)[PXFooterSettings alloc] initWithDefaultValues];
  footerSettings = self->_footerSettings;
  self->_footerSettings = v57;

  v59 = [(PTSettings *)[PXGridSettings alloc] initWithDefaultValues];
  grid = self->_grid;
  self->_grid = v59;

  v61 = [[PXGPPTSettings alloc] initWithDefaultValues];
  tungstenPPTSettings = self->_tungstenPPTSettings;
  self->_tungstenPPTSettings = v61;

  v63 = [(PTSettings *)[PXKeyboardSettings alloc] initWithDefaultValues];
  keyboardSettings = self->_keyboardSettings;
  self->_keyboardSettings = v63;

  v65 = [(PTSettings *)[PXKitSettings alloc] initWithDefaultValues];
  kit = self->_kit;
  self->_kit = v65;

  v67 = [(PTSettings *)[PXWorkaroundSettings alloc] initWithDefaultValues];
  workaroundSettings = self->_workaroundSettings;
  self->_workaroundSettings = v67;

  v69 = [(PTSettings *)[PXMemoriesRelatedSettings alloc] initWithDefaultValues];
  memoriesRelated = self->_memoriesRelated;
  self->_memoriesRelated = v69;

  v71 = [(PTSettings *)[PXUpNextSettings alloc] initWithDefaultValues];
  upNextSettings = self->_upNextSettings;
  self->_upNextSettings = v71;

  v73 = [(PTSettings *)[PXMemoriesFeedSettings alloc] initWithDefaultValues];
  memoryFeed = self->_memoryFeed;
  self->_memoryFeed = v73;

  v75 = [(PTSettings *)[PXContentPrivacySettings alloc] initWithDefaultValues];
  contentPrivacySettings = self->_contentPrivacySettings;
  self->_contentPrivacySettings = v75;

  v77 = [(PTSettings *)[PXContentSyndicationSettings alloc] initWithDefaultValues];
  contentSyndicationSettings = self->_contentSyndicationSettings;
  self->_contentSyndicationSettings = v77;

  v79 = [(PTSettings *)[PXMessagesUISettings alloc] initWithDefaultValues];
  messagesUISettings = self->_messagesUISettings;
  self->_messagesUISettings = v79;

  v81 = [(PTSettings *)[PXModelSettings alloc] initWithDefaultValues];
  model = self->_model;
  self->_model = v81;

  v83 = [(PTSettings *)[PXOneUpSettings alloc] initWithDefaultValues];
  oneUpSettings = self->_oneUpSettings;
  self->_oneUpSettings = v83;

  v85 = [(PTSettings *)[PXPhotosDataSourceSettings alloc] initWithDefaultValues];
  photosDataSource = self->_photosDataSource;
  self->_photosDataSource = v85;

  v87 = [(PTSettings *)[PXPhotosDetailsSettings alloc] initWithDefaultValues];
  photosDetails = self->_photosDetails;
  self->_photosDetails = v87;

  v89 = [(PTSettings *)[PXPhotosGridSettings alloc] initWithDefaultValues];
  photosGridSettings = self->_photosGridSettings;
  self->_photosGridSettings = v89;

  v91 = [(PTSettings *)[PXSearchSettings alloc] initWithDefaultValues];
  searchSettings = self->_searchSettings;
  self->_searchSettings = v91;

  v93 = [(PTSettings *)[PXSharingSettings alloc] initWithDefaultValues];
  sharingSettings = self->_sharingSettings;
  self->_sharingSettings = v93;

  v95 = [(PTSettings *)[PXSharedAlbumsSettings alloc] initWithDefaultValues];
  sharedAlbumsSettings = self->_sharedAlbumsSettings;
  self->_sharedAlbumsSettings = v95;

  v97 = [(PTSettings *)[PXGenerativeStorySettings alloc] initWithDefaultValues];
  generativeStorySettings = self->_generativeStorySettings;
  self->_generativeStorySettings = v97;

  v99 = [(PTSettings *)[PXStickersSettings alloc] initWithDefaultValues];
  stickersSettings = self->_stickersSettings;
  self->_stickersSettings = v99;

  v101 = [(PTSettings *)[PXTilingSettings alloc] initWithDefaultValues];
  tiling = self->_tiling;
  self->_tiling = v101;

  v103 = [(PTSettings *)[PXAssetVariationsSettings alloc] initWithDefaultValues];
  variationsSettings = self->_variationsSettings;
  self->_variationsSettings = v103;

  v105 = [(PTSettings *)[PXSwipeDownSettings alloc] initWithDefaultValues];
  swipeDownSettings = self->_swipeDownSettings;
  self->_swipeDownSettings = v105;

  v107 = [(PTSettings *)[PXZoomablePhotosSettings alloc] initWithDefaultValues];
  zoomablePhotosSettings = self->_zoomablePhotosSettings;
  self->_zoomablePhotosSettings = v107;

  v109 = [(PTSettings *)[PXMediaProviderSettings alloc] initWithDefaultValues];
  mediaProviderSettings = self->_mediaProviderSettings;
  self->_mediaProviderSettings = v109;

  v111 = [(PTSettings *)[PXDisplayAssetViewDemoSettings alloc] initWithDefaultValues];
  assetViewDemoSettings = self->_assetViewDemoSettings;
  self->_assetViewDemoSettings = v111;

  v113 = [(PTSettings *)[PXFocusSettings alloc] initWithDefaultValues];
  focusSettings = self->_focusSettings;
  self->_focusSettings = v113;

  v115 = [(PTSettings *)[PXSystemNavigationSettings alloc] initWithDefaultValues];
  systemNavigationSettings = self->_systemNavigationSettings;
  self->_systemNavigationSettings = v115;

  v117 = [(PTSettings *)[PXLemonadeSettings alloc] initWithDefaultValues];
  lemonadeSettings = self->_lemonadeSettings;
  self->_lemonadeSettings = v117;

  v119 = [(PTSettings *)[PXMapSettings alloc] initWithDefaultValues];
  mapSettings = self->_mapSettings;
  self->_mapSettings = v119;
}

- (PXPhotosDetailsNavigationSettings)detailsNavigationSettings
{
  return self->_detailsNavigationSettings;
}

- (PXContentSyndicationSettings)contentSyndicationSettings
{
  return self->_contentSyndicationSettings;
}

- (PXCursorInteractionSettings)cursorInteractionSettings
{
  return self->_cursorInteractionSettings;
}

- (PXMacSyncedAlbumsSettings)macSyncedAlbumsSettings
{
  return self->_macSyncedAlbumsSettings;
}

- (PXGenerativeStorySettings)generativeStorySettings
{
  return self->_generativeStorySettings;
}

- (PXZoomablePhotosSettings)zoomablePhotosSettings
{
  return self->_zoomablePhotosSettings;
}

- (PXCuratedLibrarySettings)curatedLibrarySettings
{
  return self->_curatedLibrarySettings;
}

- (PXContentPrivacySettings)contentPrivacySettings
{
  return self->_contentPrivacySettings;
}

- (PXSharedLibrarySettings)sharedLibrarySettings
{
  return self->_sharedLibrarySettings;
}

- (PXPhotosDetailsSettings)photosDetails
{
  return self->_photosDetails;
}

- (PXSharedAlbumsSettings)sharedAlbumsSettings
{
  return self->_sharedAlbumsSettings;
}

- (PXDragAndDropSettings)dragAndDrop
{
  return self->_dragAndDrop;
}

- (PXDiagnosticsSettings)diagnostics
{
  return self->_diagnostics;
}

- (PXApplicationSettings)applicationSettings
{
  return self->_applicationSettings;
}

- (PXPhotosGridSettings)photosGridSettings
{
  return self->_photosGridSettings;
}

- (PXCPLStatusSettings)cplStatusSettings
{
  return self->_cplStatusSettings;
}

- (PXLemonadeSettings)lemonadeSettings
{
  return self->_lemonadeSettings;
}

- (PXFooterSettings)footerSettings
{
  return self->_footerSettings;
}

- (PXFocusSettings)focusSettings
{
  return self->_focusSettings;
}

- (PXKitSettings)kit
{
  return self->_kit;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXRootSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXRootSettings *)self setPrivate_wantsInternalUI:1];
  [(PXRootSettings *)self setShowLibraryFilterTip:0];
}

- (void)setShowLibraryFilterTip:(BOOL)a3
{
  if (self->_showLibraryFilterTip != a3)
  {
    self->_showLibraryFilterTip = a3;
    if (a3) {
      objc_super v3 = @"PhotosLibraryTipContextMock";
    }
    else {
      objc_super v3 = 0;
    }
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setValue:v3 forKey:@"TipKitOverrideAlwaysDisplayContentForContext"];
  }
}

- (void)setPrivate_wantsInternalUI:(BOOL)a3
{
  self->_private_wantsInternalUI = a3;
}

- (PXPhotosDataSourceSettings)photosDataSource
{
  return self->_photosDataSource;
}

- (PXStorySettings)storySettings
{
  return self->_storySettings;
}

- (PXPeopleUISettings)peopleUISettings
{
  return self->_peopleUISettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbumsSettings, 0);
  objc_storeStrong((id *)&self->_mapSettings, 0);
  objc_storeStrong((id *)&self->_stickersSettings, 0);
  objc_storeStrong((id *)&self->_systemNavigationSettings, 0);
  objc_storeStrong((id *)&self->_focusSettings, 0);
  objc_storeStrong((id *)&self->_assetViewDemoSettings, 0);
  objc_storeStrong((id *)&self->_dragDropSettings, 0);
  objc_storeStrong((id *)&self->_mediaProviderSettings, 0);
  objc_storeStrong((id *)&self->_audioSettings, 0);
  objc_storeStrong((id *)&self->_inlineVideoStabilizationSettings, 0);
  objc_storeStrong((id *)&self->_macSyncedAlbumsSettings, 0);
  objc_storeStrong((id *)&self->_documentMenuSettings, 0);
  objc_storeStrong((id *)&self->_duplicatesSettings, 0);
  objc_storeStrong((id *)&self->_cplStatusSettings, 0);
  objc_storeStrong((id *)&self->_lemonadeSettings, 0);
  objc_storeStrong((id *)&self->_generativeStorySettings, 0);
  objc_storeStrong((id *)&self->_sharedLibrarySettings, 0);
  objc_storeStrong((id *)&self->_photosGridSettings, 0);
  objc_storeStrong((id *)&self->_footerSettings, 0);
  objc_storeStrong((id *)&self->_applicationSettings, 0);
  objc_storeStrong((id *)&self->_albumsDebugUISettings, 0);
  objc_storeStrong((id *)&self->_searchSettings, 0);
  objc_storeStrong((id *)&self->_importSettings, 0);
  objc_storeStrong((id *)&self->_grid, 0);
  objc_storeStrong((id *)&self->_forYou, 0);
  objc_storeStrong((id *)&self->_completeMyMoment, 0);
  objc_storeStrong((id *)&self->_assetsRecoverySettings, 0);
  objc_storeStrong((id *)&self->_variationsSettings, 0);
  objc_storeStrong((id *)&self->_sharingSettings, 0);
  objc_storeStrong((id *)&self->_cursorInteractionSettings, 0);
  objc_storeStrong((id *)&self->_dragAndDrop, 0);
  objc_storeStrong((id *)&self->_peopleUISettings, 0);
  objc_storeStrong((id *)&self->_peopleDetail, 0);
  objc_storeStrong((id *)&self->_swipeDownSettings, 0);
  objc_storeStrong((id *)&self->_tungstenPPTSettings, 0);
  objc_storeStrong((id *)&self->_workaroundSettings, 0);
  objc_storeStrong((id *)&self->_kit, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_tiling, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_assetsScene, 0);
  objc_storeStrong((id *)&self->_messagesUISettings, 0);
  objc_storeStrong((id *)&self->_contentSyndicationSettings, 0);
  objc_storeStrong((id *)&self->_contentPrivacySettings, 0);
  objc_storeStrong((id *)&self->_upNextSettings, 0);
  objc_storeStrong((id *)&self->_memoriesRelated, 0);
  objc_storeStrong((id *)&self->_memoryFeed, 0);
  objc_storeStrong((id *)&self->_photosDetailsHeaderTile, 0);
  objc_storeStrong((id *)&self->_photosDetails, 0);
  objc_storeStrong((id *)&self->_oneUpSettings, 0);
  objc_storeStrong((id *)&self->_videoPlaybackSettings, 0);
  objc_storeStrong((id *)&self->_keyboardSettings, 0);
  objc_storeStrong((id *)&self->_photoPickerSettings, 0);
  objc_storeStrong((id *)&self->_curatedLibrarySettings, 0);
  objc_storeStrong((id *)&self->_zoomablePhotosSettings, 0);
  objc_storeStrong((id *)&self->_imageModulationSettings, 0);
  objc_storeStrong((id *)&self->_storySettings, 0);
  objc_storeStrong((id *)&self->_detailsNavigationSettings, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
}

- (void)setShowWIPAlertRadar:(BOOL)a3
{
  self->_showWIPAlertRadar = a3;
}

- (BOOL)showWIPAlertRadar
{
  return self->_showWIPAlertRadar;
}

- (void)setSharedAlbumsSettings:(id)a3
{
}

- (void)setMapSettings:(id)a3
{
}

- (PXMapSettings)mapSettings
{
  return self->_mapSettings;
}

- (void)setStickersSettings:(id)a3
{
}

- (PXStickersSettings)stickersSettings
{
  return self->_stickersSettings;
}

- (void)setSystemNavigationSettings:(id)a3
{
}

- (PXSystemNavigationSettings)systemNavigationSettings
{
  return self->_systemNavigationSettings;
}

- (void)setFocusSettings:(id)a3
{
}

- (void)setAssetViewDemoSettings:(id)a3
{
}

- (PXDisplayAssetViewDemoSettings)assetViewDemoSettings
{
  return self->_assetViewDemoSettings;
}

- (void)setDragDropSettings:(id)a3
{
}

- (PXPasteboardAssetSettings)dragDropSettings
{
  return self->_dragDropSettings;
}

- (void)setMediaProviderSettings:(id)a3
{
}

- (PXMediaProviderSettings)mediaProviderSettings
{
  return self->_mediaProviderSettings;
}

- (void)setAudioSettings:(id)a3
{
}

- (PXAudioSettings)audioSettings
{
  return self->_audioSettings;
}

- (BOOL)showLibraryFilterTip
{
  return self->_showLibraryFilterTip;
}

- (void)setInlineVideoStabilizationSettings:(id)a3
{
}

- (PXInlineVideoStabilizationSettings)inlineVideoStabilizationSettings
{
  return self->_inlineVideoStabilizationSettings;
}

- (void)setMacSyncedAlbumsSettings:(id)a3
{
}

- (void)setDocumentMenuSettings:(id)a3
{
}

- (PXDocumentMenuSettings)documentMenuSettings
{
  return self->_documentMenuSettings;
}

- (void)setDuplicatesSettings:(id)a3
{
}

- (PXDuplicatesSettings)duplicatesSettings
{
  return self->_duplicatesSettings;
}

- (void)setCplStatusSettings:(id)a3
{
}

- (void)setLemonadeSettings:(id)a3
{
}

- (void)setGenerativeStorySettings:(id)a3
{
}

- (void)setSharedLibrarySettings:(id)a3
{
}

- (void)setPhotosGridSettings:(id)a3
{
}

- (void)setFooterSettings:(id)a3
{
}

- (void)setApplicationSettings:(id)a3
{
}

- (void)setAlbumsDebugUISettings:(id)a3
{
}

- (PXAlbumsDebugUISettings)albumsDebugUISettings
{
  return self->_albumsDebugUISettings;
}

- (void)setSearchSettings:(id)a3
{
}

- (PXSearchSettings)searchSettings
{
  return self->_searchSettings;
}

- (void)setImportSettings:(id)a3
{
}

- (PXImportSettings)importSettings
{
  return self->_importSettings;
}

- (void)setGrid:(id)a3
{
}

- (PXGridSettings)grid
{
  return self->_grid;
}

- (void)setForYou:(id)a3
{
}

- (PXForYouSettings)forYou
{
  return self->_forYou;
}

- (void)setCompleteMyMoment:(id)a3
{
}

- (PXCompleteMyMomentSettings)completeMyMoment
{
  return self->_completeMyMoment;
}

- (void)setAssetsRecoverySettings:(id)a3
{
}

- (PXAssetsRecoverySettings)assetsRecoverySettings
{
  return self->_assetsRecoverySettings;
}

- (void)setVariationsSettings:(id)a3
{
}

- (PXAssetVariationsSettings)variationsSettings
{
  return self->_variationsSettings;
}

- (void)setSharingSettings:(id)a3
{
}

- (PXSharingSettings)sharingSettings
{
  return self->_sharingSettings;
}

- (void)setCursorInteractionSettings:(id)a3
{
}

- (void)setDragAndDrop:(id)a3
{
}

- (void)setPeopleUISettings:(id)a3
{
}

- (void)setPeopleDetail:(id)a3
{
}

- (PXPeopleDetailSettings)peopleDetail
{
  return self->_peopleDetail;
}

- (void)setSwipeDownSettings:(id)a3
{
}

- (PXSwipeDownSettings)swipeDownSettings
{
  return self->_swipeDownSettings;
}

- (void)setTungstenPPTSettings:(id)a3
{
}

- (PXGPPTSettings)tungstenPPTSettings
{
  return self->_tungstenPPTSettings;
}

- (void)setWorkaroundSettings:(id)a3
{
}

- (PXWorkaroundSettings)workaroundSettings
{
  return self->_workaroundSettings;
}

- (void)setKit:(id)a3
{
}

- (void)setModel:(id)a3
{
}

- (PXModelSettings)model
{
  return self->_model;
}

- (void)setTiling:(id)a3
{
}

- (PXTilingSettings)tiling
{
  return self->_tiling;
}

- (void)setPhotosDataSource:(id)a3
{
}

- (void)setAssetsScene:(id)a3
{
}

- (PXAssetsSceneSettings)assetsScene
{
  return self->_assetsScene;
}

- (void)setMessagesUISettings:(id)a3
{
}

- (PXMessagesUISettings)messagesUISettings
{
  return self->_messagesUISettings;
}

- (void)setContentSyndicationSettings:(id)a3
{
}

- (void)setContentPrivacySettings:(id)a3
{
}

- (void)setUpNextSettings:(id)a3
{
}

- (PXUpNextSettings)upNextSettings
{
  return self->_upNextSettings;
}

- (void)setMemoriesRelated:(id)a3
{
}

- (PXMemoriesRelatedSettings)memoriesRelated
{
  return self->_memoriesRelated;
}

- (void)setMemoryFeed:(id)a3
{
}

- (PXMemoriesFeedSettings)memoryFeed
{
  return self->_memoryFeed;
}

- (void)setPhotosDetailsHeaderTile:(id)a3
{
}

- (PXPhotosDetailsHeaderTileSettings)photosDetailsHeaderTile
{
  return self->_photosDetailsHeaderTile;
}

- (void)setPhotosDetails:(id)a3
{
}

- (void)setOneUpSettings:(id)a3
{
}

- (PXOneUpSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (void)setVideoPlaybackSettings:(id)a3
{
}

- (PXVideoPlaybackSettings)videoPlaybackSettings
{
  return self->_videoPlaybackSettings;
}

- (void)setKeyboardSettings:(id)a3
{
}

- (PXKeyboardSettings)keyboardSettings
{
  return self->_keyboardSettings;
}

- (void)setPhotoPickerSettings:(id)a3
{
}

- (PXPhotoPickerSettings)photoPickerSettings
{
  return self->_photoPickerSettings;
}

- (void)setCuratedLibrarySettings:(id)a3
{
}

- (void)setZoomablePhotosSettings:(id)a3
{
}

- (void)setImageModulationSettings:(id)a3
{
}

- (PXImageModulationSettings)imageModulationSettings
{
  return self->_imageModulationSettings;
}

- (void)setStorySettings:(id)a3
{
}

- (void)setDetailsNavigationSettings:(id)a3
{
}

- (void)setDiagnostics:(id)a3
{
}

- (BOOL)hideWIPAlerts
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PXRootSettingsHideWIPAlerts"];

  return v3;
}

- (void)setHideWIPAlerts:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PXRootSettingsHideWIPAlerts"];
}

- (id)parentSettings
{
  return 0;
}

+ (void)_setWantsInternalHomeScreenQuickActions:(BOOL)a3
{
  [MEMORY[0x1E4F8AB18] setShouldShowInternalQuickActions:a3];
  id v3 = +[PXAlert show:&__block_literal_global_152212];
}

uint64_t __62__PXRootSettings_UI___setWantsInternalHomeScreenQuickActions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTitle:@"It can take several seconds for Quick Actions to update"];
}

+ (void)_manageHomeScreenQuickActions
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke;
  v3[3] = &__block_descriptor_40_e30_v16__0__PXAlertConfiguration_8l;
  v3[4] = a1;
  id v2 = +[PXAlert show:v3];
}

void __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:@"Home Screen Quick Actions"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_2;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = *(void *)(a1 + 32);
  [v3 addActionWithTitle:@"Show Internal Quick Actions" style:0 action:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_3;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(void *)(a1 + 32);
  [v3 addActionWithTitle:@"Hide Internal Quick Actions" style:0 action:v4];
  [v3 addActionWithTitle:@"Cancel" style:1 action:0];
}

uint64_t __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setWantsInternalHomeScreenQuickActions:1];
}

uint64_t __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setWantsInternalHomeScreenQuickActions:0];
}

+ (id)settingsControllerModule
{
  v123[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  id v3 = (void *)MEMORY[0x1E4F941F0];
  id v4 = NSStringFromSelector(sel_private_wantsInternalUI);
  v5 = [v3 rowWithTitle:@"Internal UI" valueKeyPath:v4];
  v123[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:1];
  v117 = [v2 sectionWithRows:v6];

  v118 = [MEMORY[0x1E4F1CA48] array];
  v7 = (void *)MEMORY[0x1E4F94130];
  v114 = NSStringFromSelector(sel_lemonadeSettings);
  v112 = [v7 rowWithTitle:@"Lemonade" childSettingsKeyPath:v114];
  v122[0] = v112;
  v111 = [MEMORY[0x1E4F94130] rowWithTitle:@"Diagnostics" childSettingsKeyPath:@"diagnostics"];
  v122[1] = v111;
  v8 = (void *)MEMORY[0x1E4F94130];
  v110 = NSStringFromSelector(sel_detailsNavigationSettings);
  v109 = [v8 rowWithTitle:@"Details Navigation" childSettingsKeyPath:v110];
  v122[2] = v109;
  v9 = (void *)MEMORY[0x1E4F94130];
  v108 = NSStringFromSelector(sel_storySettings);
  v107 = [v9 rowWithTitle:@"Interactive Memories" childSettingsKeyPath:v108];
  v122[3] = v107;
  v10 = (void *)MEMORY[0x1E4F94130];
  v106 = NSStringFromSelector(sel_photosGridSettings);
  v105 = [v10 rowWithTitle:@"Photos Grid" childSettingsKeyPath:v106];
  v122[4] = v105;
  v104 = [MEMORY[0x1E4F94130] rowWithTitle:@"Zoomable Photos" childSettingsKeyPath:@"zoomablePhotosSettings"];
  v122[5] = v104;
  v103 = [MEMORY[0x1E4F94130] rowWithTitle:@"Curated Library" childSettingsKeyPath:@"curatedLibrarySettings"];
  v122[6] = v103;
  v102 = [MEMORY[0x1E4F94130] rowWithTitle:@"Footer" childSettingsKeyPath:@"footerSettings"];
  v122[7] = v102;
  v101 = [MEMORY[0x1E4F94130] rowWithTitle:@"Photo Picker" childSettingsKeyPath:@"photoPickerSettings"];
  v122[8] = v101;
  v100 = [MEMORY[0x1E4F94130] rowWithTitle:@"Image Modulation Settings" childSettingsKeyPath:@"imageModulationSettings"];
  v122[9] = v100;
  v99 = [MEMORY[0x1E4F94130] rowWithTitle:@"Tungsten PPT" childSettingsKeyPath:@"tungstenPPTSettings"];
  v122[10] = v99;
  v98 = [MEMORY[0x1E4F94130] rowWithTitle:@"Keyboard" childSettingsKeyPath:@"keyboardSettings"];
  v122[11] = v98;
  v97 = [MEMORY[0x1E4F94130] rowWithTitle:@"Photos Details" childSettingsKeyPath:@"photosDetails"];
  v122[12] = v97;
  v96 = [MEMORY[0x1E4F94130] rowWithTitle:@"Photos Details Header Tile" childSettingsKeyPath:@"photosDetailsHeaderTile"];
  v122[13] = v96;
  v95 = [MEMORY[0x1E4F94130] rowWithTitle:@"Memory Feed" childSettingsKeyPath:@"memoryFeed"];
  v122[14] = v95;
  v94 = [MEMORY[0x1E4F94130] rowWithTitle:@"Memories & Related" childSettingsKeyPath:@"memoriesRelated"];
  v122[15] = v94;
  v11 = (void *)MEMORY[0x1E4F94130];
  v93 = NSStringFromSelector(sel_upNextSettings);
  v92 = [v11 rowWithTitle:@"Up Next" childSettingsKeyPath:v93];
  v122[16] = v92;
  v91 = [MEMORY[0x1E4F94130] rowWithTitle:@"Content Privacy" childSettingsKeyPath:@"contentPrivacySettings"];
  v122[17] = v91;
  v90 = [MEMORY[0x1E4F94130] rowWithTitle:@"Content Syndication" childSettingsKeyPath:@"contentSyndicationSettings"];
  v122[18] = v90;
  v12 = (void *)MEMORY[0x1E4F94130];
  v89 = NSStringFromSelector(sel_messagesUISettings);
  v88 = [v12 rowWithTitle:@"Messages UI" childSettingsKeyPath:v89];
  v122[19] = v88;
  v87 = [MEMORY[0x1E4F94130] rowWithTitle:@"Assets Scene" childSettingsKeyPath:@"assetsScene"];
  v122[20] = v87;
  v13 = (void *)MEMORY[0x1E4F94130];
  v86 = NSStringFromSelector(sel_assetsRecoverySettings);
  v85 = [v13 rowWithTitle:@"Assets Recovery" childSettingsKeyPath:v86];
  v122[21] = v85;
  v14 = (void *)MEMORY[0x1E4F94130];
  v84 = NSStringFromSelector(sel_oneUpSettings);
  v83 = [v14 rowWithTitle:@"One Up" childSettingsKeyPath:v84];
  v122[22] = v83;
  v82 = [MEMORY[0x1E4F94130] rowWithTitle:@"Photos Data Source" childSettingsKeyPath:@"photosDataSource"];
  v122[23] = v82;
  v81 = [MEMORY[0x1E4F94130] rowWithTitle:@"Tiling" childSettingsKeyPath:@"tiling"];
  v122[24] = v81;
  v80 = [MEMORY[0x1E4F94130] rowWithTitle:@"Model" childSettingsKeyPath:@"model"];
  v122[25] = v80;
  v79 = [MEMORY[0x1E4F94130] rowWithTitle:@"Kit" childSettingsKeyPath:@"kit"];
  v122[26] = v79;
  v15 = (void *)MEMORY[0x1E4F94130];
  v78 = NSStringFromSelector(sel_workaroundSettings);
  v77 = [v15 rowWithTitle:@"Workarounds" childSettingsKeyPath:v78];
  v122[27] = v77;
  v76 = [MEMORY[0x1E4F94130] rowWithTitle:@"Drag & Drop" childSettingsKeyPath:@"dragAndDrop"];
  v122[28] = v76;
  v75 = [MEMORY[0x1E4F94130] rowWithTitle:@"Cursor Interaction" childSettingsKeyPath:@"cursorInteractionSettings"];
  v122[29] = v75;
  v74 = [MEMORY[0x1E4F94130] rowWithTitle:@"People Debug" childSettingsKeyPath:@"peopleDetail"];
  v122[30] = v74;
  v16 = (void *)MEMORY[0x1E4F94130];
  v73 = NSStringFromSelector(sel_peopleUISettings);
  v72 = [v16 rowWithTitle:@"People UI" childSettingsKeyPath:v73];
  v122[31] = v72;
  v71 = [MEMORY[0x1E4F94130] rowWithTitle:@"Sharing" childSettingsKeyPath:@"sharingSettings"];
  v122[32] = v71;
  v70 = [MEMORY[0x1E4F94130] rowWithTitle:@"Variations" childSettingsKeyPath:@"variationsSettings"];
  v122[33] = v70;
  v17 = (void *)MEMORY[0x1E4F94130];
  v69 = NSStringFromSelector(sel_swipeDownSettings);
  v68 = [v17 rowWithTitle:@"Swipe Down" childSettingsKeyPath:v69];
  v122[34] = v68;
  v67 = [MEMORY[0x1E4F94130] rowWithTitle:@"Complete My Moment" childSettingsKeyPath:@"completeMyMoment"];
  v122[35] = v67;
  v66 = [MEMORY[0x1E4F94130] rowWithTitle:@"For You" childSettingsKeyPath:@"forYou"];
  v122[36] = v66;
  v65 = [MEMORY[0x1E4F94130] rowWithTitle:@"Grid" childSettingsKeyPath:@"grid"];
  v122[37] = v65;
  v64 = [MEMORY[0x1E4F94130] rowWithTitle:@"Search" childSettingsKeyPath:@"searchSettings"];
  v122[38] = v64;
  v63 = [MEMORY[0x1E4F94130] rowWithTitle:@"Stickers" childSettingsKeyPath:@"stickersSettings"];
  v122[39] = v63;
  v62 = [MEMORY[0x1E4F94130] rowWithTitle:@"Albums Debug UI" childSettingsKeyPath:@"albumsDebugUISettings"];
  v122[40] = v62;
  v61 = [MEMORY[0x1E4F94130] rowWithTitle:@"Application" childSettingsKeyPath:@"applicationSettings"];
  v122[41] = v61;
  v60 = [MEMORY[0x1E4F94130] rowWithTitle:@"Import" childSettingsKeyPath:@"importSettings"];
  v122[42] = v60;
  v18 = (void *)MEMORY[0x1E4F94130];
  v59 = NSStringFromSelector(sel_systemNavigationSettings);
  v58 = [v18 rowWithTitle:@"System Navigation" childSettingsKeyPath:v59];
  v122[43] = v58;
  v19 = (void *)MEMORY[0x1E4F94130];
  v57 = NSStringFromSelector(sel_mediaProviderSettings);
  v56 = [v19 rowWithTitle:@"Media Provider" childSettingsKeyPath:v57];
  v122[44] = v56;
  v20 = (void *)MEMORY[0x1E4F94130];
  v55 = NSStringFromSelector(sel_videoPlaybackSettings);
  v54 = [v20 rowWithTitle:@"Video Playback" childSettingsKeyPath:v55];
  v122[45] = v54;
  v53 = [MEMORY[0x1E4F94130] rowWithTitle:@"Inline Video Stabilization" childSettingsKeyPath:@"inlineVideoStabilizationSettings"];
  v122[46] = v53;
  v21 = (void *)MEMORY[0x1E4F94130];
  v22 = NSStringFromSelector(sel_mapSettings);
  v23 = [v21 rowWithTitle:@"Maps" childSettingsKeyPath:v22];
  v122[47] = v23;
  v24 = (void *)MEMORY[0x1E4F94130];
  v25 = NSStringFromSelector(sel_sharedAlbumsSettings);
  v26 = [v24 rowWithTitle:@"Shared Albums" childSettingsKeyPath:v25];
  v122[48] = v26;
  v27 = (void *)MEMORY[0x1E4F94130];
  v28 = NSStringFromSelector(sel_macSyncedAlbumsSettings);
  v29 = [v27 rowWithTitle:@"Mac-Synced Albums" childSettingsKeyPath:v28];
  v122[49] = v29;
  v30 = (void *)MEMORY[0x1E4F94130];
  v31 = NSStringFromSelector(sel_sharedLibrarySettings);
  v32 = [v30 rowWithTitle:@"Shared Library" childSettingsKeyPath:v31];
  v122[50] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:51];
  [v118 addObjectsFromArray:v33];

  v34 = (void *)MEMORY[0x1E4F94130];
  v115 = NSStringFromSelector(sel_cplStatusSettings);
  v113 = [v34 rowWithTitle:@"CPL Status" childSettingsKeyPath:v115];
  v121[0] = v113;
  v35 = (void *)MEMORY[0x1E4F941F0];
  v36 = NSStringFromSelector(sel_showLibraryFilterTip);
  v37 = [v35 rowWithTitle:@"Library Filter Tip" valueKeyPath:v36];
  v121[1] = v37;
  v38 = (void *)MEMORY[0x1E4F94130];
  v39 = NSStringFromSelector(sel_audioSettings);
  v40 = [v38 rowWithTitle:@"Audio" childSettingsKeyPath:v39];
  v121[2] = v40;
  v41 = [MEMORY[0x1E4F94130] rowWithTitle:@"Duplicates" childSettingsKeyPath:@"duplicatesSettings"];
  v121[3] = v41;
  v42 = [MEMORY[0x1E4F94130] rowWithTitle:@"Document Menu" childSettingsKeyPath:@"documentMenuSettings"];
  v121[4] = v42;
  v43 = (void *)MEMORY[0x1E4F940F8];
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __46__PXRootSettings_UI__settingsControllerModule__block_invoke;
  v119[3] = &__block_descriptor_40_e11_B24__0_8_16l;
  v119[4] = a1;
  v44 = [MEMORY[0x1E4F94190] actionWithHandler:v119];
  v45 = [v43 rowWithTitle:@"Home Screen Quick Actions" action:v44];
  v121[5] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:6];
  [v118 addObjectsFromArray:v46];

  v47 = [MEMORY[0x1E4F94160] sectionWithRows:v118];
  v48 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v49 = (void *)MEMORY[0x1E4F94160];
  v120[0] = v117;
  v120[1] = v47;
  v120[2] = v48;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:3];
  v51 = [v49 moduleWithTitle:@"PhotosUICore" contents:v50];

  return v51;
}

uint64_t __46__PXRootSettings_UI__settingsControllerModule__block_invoke(uint64_t a1)
{
  return 1;
}

@end