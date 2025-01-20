@interface MusicKit
@end

@implementation MusicKit

void __63__MusicKit_SoftLinking_MPCPlayerRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 _errorFromUnderlyingError:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __100__MusicKit_SoftLinking_MPModelLibraryTransientStateController_sharedLibraryTransientStateController__block_invoke()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getMPModelLibraryTransientStateControllerClass_softClass;
  uint64_t v9 = getMPModelLibraryTransientStateControllerClass_softClass;
  if (!getMPModelLibraryTransientStateControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMPModelLibraryTransientStateControllerClass_block_invoke;
    v5[3] = &unk_1E6D453B0;
    v5[4] = &v6;
    __getMPModelLibraryTransientStateControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  v2 = [v1 sharedDeviceLibraryController];
  id v3 = [[MusicKit_SoftLinking_MPModelLibraryTransientStateController alloc] _initWithUnderlyingLibraryTransientStateController:v2];
  v4 = (void *)sharedLibraryTransientStateController_sSharedDeviceLibraryController;
  sharedLibraryTransientStateController_sSharedDeviceLibraryController = (uint64_t)v3;
}

void __71__MusicKit_SoftLinking_MPRestrictionsMonitor_sharedRestrictionsMonitor__block_invoke()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getMPRestrictionsMonitorClass_softClass;
  uint64_t v9 = getMPRestrictionsMonitorClass_softClass;
  if (!getMPRestrictionsMonitorClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMPRestrictionsMonitorClass_block_invoke;
    v5[3] = &unk_1E6D453B0;
    v5[4] = &v6;
    __getMPRestrictionsMonitorClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  v2 = [v1 sharedRestrictionsMonitor];
  id v3 = [[MusicKit_SoftLinking_MPRestrictionsMonitor alloc] _initWithUnderlyingRestrictionsMonitor:v2];
  v4 = (void *)sharedRestrictionsMonitor_sSharedRestrictionsMonitor;
  sharedRestrictionsMonitor_sSharedRestrictionsMonitor = (uint64_t)v3;
}

void __63__MusicKit_SoftLinking_MPCloudController_sharedCloudController__block_invoke()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getMPCloudControllerClass_softClass;
  uint64_t v9 = getMPCloudControllerClass_softClass;
  if (!getMPCloudControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMPCloudControllerClass_block_invoke;
    v5[3] = &unk_1E6D453B0;
    v5[4] = &v6;
    __getMPCloudControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  v2 = [v1 sharedCloudController];
  id v3 = [[MusicKit_SoftLinking_MPCloudController alloc] _initWithUnderlyingCloudController:v2];
  v4 = (void *)sharedCloudController_sSharedCloudController;
  sharedCloudController_sSharedCloudController = (uint64_t)v3;
}

void __77__MusicKit_SoftLinking_MPContentTasteController_sharedContentTasteController__block_invoke()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getMPContentTasteControllerClass_softClass;
  uint64_t v9 = getMPContentTasteControllerClass_softClass;
  if (!getMPContentTasteControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMPContentTasteControllerClass_block_invoke;
    v5[3] = &unk_1E6D453B0;
    v5[4] = &v6;
    __getMPContentTasteControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  v2 = [v1 sharedController];
  id v3 = [[MusicKit_SoftLinking_MPContentTasteController alloc] _initWithUnderlyingContentTasteController:v2];
  v4 = (void *)sharedContentTasteController_sSharedContentTasteController;
  sharedContentTasteController_sSharedContentTasteController = (uint64_t)v3;
}

void __71__MusicKit_SoftLinking_MPCloudServiceStatusController_sharedController__block_invoke()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getMPCloudServiceStatusControllerClass_softClass;
  uint64_t v9 = getMPCloudServiceStatusControllerClass_softClass;
  if (!getMPCloudServiceStatusControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMPCloudServiceStatusControllerClass_block_invoke;
    v5[3] = &unk_1E6D453B0;
    v5[4] = &v6;
    __getMPCloudServiceStatusControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  v2 = [v1 sharedController];
  id v3 = [[MusicKit_SoftLinking_MPCloudServiceStatusController alloc] _initWithUnderlyingServiceStatusController:v2];
  v4 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v3;
}

void __87__MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest_performWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    v5 = (objc_class *)MEMORY[0x1E4F38660];
    id v6 = a2;
    a2 = (void *)[[v5 alloc] initWithUnderlyingResponse:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_initWithPlaylist_initialTracklist_authorProfile_library___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __117__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_initWithPlaylist_initialTracklist_authorProfile_library___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __78__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_isCuratorPlaylist__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) isCuratorPlaylist];
  return MEMORY[0x1F41817F8]();
}

uint64_t __91__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_appendModelObjects_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __102__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_insertModelObjects_afterEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __75__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_removeEntries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

void __82__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    v5 = (objc_class *)MEMORY[0x1E4F38620];
    id v6 = a2;
    a2 = (void *)[[v5 alloc] initWithUnderlyingModelObject:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __134__MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest_initWithPlaylist_songIdentifiers_representativeObject_referralObject___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v3 = (void *)getMPModelSongClass_softClass;
  uint64_t v11 = getMPModelSongClass_softClass;
  if (!getMPModelSongClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getMPModelSongClass_block_invoke;
    v7[3] = &unk_1E6D453B0;
    v7[4] = &v8;
    __getMPModelSongClass_block_invoke((uint64_t)v7);
    id v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = (void *)[[v4 alloc] initWithIdentifiers:v2];

  return v5;
}

void __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    v4 = (void *)getMPModelLibraryRequestClass_softClass;
    uint64_t v40 = getMPModelLibraryRequestClass_softClass;
    if (!getMPModelLibraryRequestClass_softClass)
    {
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __getMPModelLibraryRequestClass_block_invoke;
      v35 = &unk_1E6D453B0;
      v36 = &v37;
      __getMPModelLibraryRequestClass_block_invoke((uint64_t)&v32);
      v4 = (void *)v38[3];
    }
    v5 = v4;
    _Block_object_dispose(&v37, 8);
    id v6 = objc_alloc_init(v5);
    id v7 = [MEMORY[0x1E4F38610] _defaultPlaylistKind];
    [v6 setItemKind:v7];

    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    uint64_t v8 = (void *)getMPPropertySetClass_softClass;
    uint64_t v40 = getMPPropertySetClass_softClass;
    if (!getMPPropertySetClass_softClass)
    {
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __getMPPropertySetClass_block_invoke;
      v35 = &unk_1E6D453B0;
      v36 = &v37;
      __getMPPropertySetClass_block_invoke((uint64_t)&v32);
      uint64_t v8 = (void *)v38[3];
    }
    uint64_t v9 = v8;
    _Block_object_dispose(&v37, 8);
    id v10 = [v9 alloc];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v11 = (id *)getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
    uint64_t v40 = getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
    if (!getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr)
    {
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_block_invoke;
      v35 = &unk_1E6D453B0;
      v36 = &v37;
      v12 = (void *)MediaPlayerLibrary_3();
      v13 = dlsym(v12, "MPModelPropertyPlaylistLastModifiedDateComponents");
      *(void *)(v36[1] + 24) = v13;
      getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr = *(void *)(v36[1] + 24);
      uint64_t v11 = (id *)v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v11) {
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    }
    id v14 = *v11;
    v42[0] = v14;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    v15 = (id *)getMPModelPropertyPlaylistArtworkSymbolLoc_ptr;
    uint64_t v40 = getMPModelPropertyPlaylistArtworkSymbolLoc_ptr;
    if (!getMPModelPropertyPlaylistArtworkSymbolLoc_ptr)
    {
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __getMPModelPropertyPlaylistArtworkSymbolLoc_block_invoke;
      v35 = &unk_1E6D453B0;
      v36 = &v37;
      v16 = (void *)MediaPlayerLibrary_3();
      v17 = dlsym(v16, "MPModelPropertyPlaylistArtwork");
      *(void *)(v36[1] + 24) = v17;
      getMPModelPropertyPlaylistArtworkSymbolLoc_ptr = *(void *)(v36[1] + 24);
      v15 = (id *)v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v15) {
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    }
    id v18 = *v15;
    v42[1] = v18;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    v19 = (id *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
    uint64_t v40 = getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
    if (!getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr)
    {
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_block_invoke;
      v35 = &unk_1E6D453B0;
      v36 = &v37;
      v20 = (void *)MediaPlayerLibrary_3();
      v21 = dlsym(v20, "MPModelPropertyPlaylistTracksTiledArtwork");
      *(void *)(v36[1] + 24) = v21;
      getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr = *(void *)(v36[1] + 24);
      v19 = (id *)v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v19) {
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    }
    id v43 = *v19;
    v22 = (void *)MEMORY[0x1E4F1C978];
    id v23 = v43;
    v24 = [v22 arrayWithObjects:v42 count:3];

    v25 = (void *)[v10 initWithProperties:v24 relationships:MEMORY[0x1E4F1CC08]];
    [v6 setItemProperties:v25];

    v26 = [*(id *)(a1 + 32) _underlyingLibraryAddToPlaylistChangeRequest];
    v27 = [v26 playlist];
    v28 = [v27 identifiers];
    v41 = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v6 setAllowedItemIdentifiers:v29];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke_2;
    v30[3] = &unk_1E6D45688;
    id v31 = *(id *)(a1 + 40);
    [v6 performWithResponseHandler:v30];
  }
}

void __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 results];
  v4 = [v3 allItems];
  id v6 = [v4 firstObject];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F385C0] code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __112__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performDeleteEntityWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __119__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryImportChangeWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __119__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryImportChangeWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __122__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryKeepLocalChangeWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __158__MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __158__MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest_initWithPlaylist_entriesToRemove___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

void __116__MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  id v5 = [v3 identifiers];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__MusicKit_SoftLinking_MPAVRoutingController_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRoutesDidChange:v3];
}

BOOL __69__MusicKit_RemotePlaybackQueue_extractDialogFromCommandResult_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 dialog];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __69__MusicKit_RemotePlaybackQueue_extractDialogFromCommandResult_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 commandError];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __97__MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__MusicKit_RemoteRadioStationPlaybackQueue_setQueueWithPath_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = 0;
  BOOL v3 = +[MusicKit_RemotePlaybackQueue extractDialogFromCommandResult:a2 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __129__MusicKit_SoftLinking_MPSectionedCollection_MusicKit_SoftLinking_MPCPlayerResponseTracklist__enumeratePlayerSectionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v4 = (void *)getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr;
  uint64_t v17 = getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr;
  if (!getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr)
  {
    id v5 = (void *)MediaPlaybackCoreLibrary_1();
    v15[3] = (uint64_t)dlsym(v5, "MPCPlayerResponseTracklistDisplaySectionPreviousItems");
    getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr = v15[3];
    id v4 = (void *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v4) {
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  }
  if (([v3 isEqualToString:*v4] & 1) == 0)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    id v6 = (void *)getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr;
    uint64_t v17 = getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr;
    if (!getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr)
    {
      id v7 = (void *)MediaPlaybackCoreLibrary_1();
      v15[3] = (uint64_t)dlsym(v7, "MPCPlayerResponseTracklistDisplaySectionPlayingItem");
      getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr = v15[3];
      id v6 = (void *)v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v6) {
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    }
    if (([v3 isEqualToString:*v6] & 1) == 0)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2020000000;
      uint64_t v8 = (void *)getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr;
      uint64_t v17 = getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr;
      if (!getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr)
      {
        uint64_t v9 = (void *)MediaPlaybackCoreLibrary_1();
        v15[3] = (uint64_t)dlsym(v9, "MPCPlayerResponseTracklistDisplaySectionUpNextItems");
        getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr = v15[3];
        uint64_t v8 = (void *)v15[3];
      }
      _Block_object_dispose(&v14, 8);
      if (!v8) {
        getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
      }
      if (([v3 isEqualToString:*v8] & 1) == 0)
      {
        uint64_t v14 = 0;
        v15 = &v14;
        uint64_t v16 = 0x2020000000;
        id v10 = (void *)getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr;
        uint64_t v17 = getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr;
        if (!getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr)
        {
          uint64_t v11 = (void *)MediaPlaybackCoreLibrary_1();
          v15[3] = (uint64_t)dlsym(v11, "MPCPlayerResponseTracklistDisplaySectionNextItems");
          getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr = v15[3];
          id v10 = (void *)v15[3];
        }
        _Block_object_dispose(&v14, 8);
        if (!v10) {
          getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
        }
        if (([v3 isEqualToString:*v10] & 1) == 0)
        {
          uint64_t v14 = 0;
          v15 = &v14;
          uint64_t v16 = 0x2020000000;
          v12 = (void *)getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr;
          uint64_t v17 = getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr;
          if (!getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr)
          {
            v13 = (void *)MediaPlaybackCoreLibrary_1();
            v15[3] = (uint64_t)dlsym(v13, "MPCPlayerResponseTracklistDisplaySectionAutoPlayItems");
            getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr = v15[3];
            v12 = (void *)v15[3];
          }
          _Block_object_dispose(&v14, 8);
          if (!v12) {
            getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
          }
          [v3 isEqualToString:*v12];
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __143__MusicKit_SoftLinking_MPSectionedCollection_MusicKit_SoftLinking_MPCPlayerResponseTracklist__enumeratePlayerItemsInSectionAtIndex_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _underlyingModelObject];
  uint64_t v2 = [v5 newKeepLocalStatusObserverConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleUpdatedUnderlyingActiveKeepLocalStatus:", a2, a3);
}

void __83__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_setIdentifyingModelObject___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _underlyingModelObject];
  uint64_t v2 = [v5 newKeepLocalStatusObserverConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting alloc] initWithModelObject:*(void *)(a1 + 32) children:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 48));
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke_2;
  uint64_t v8 = &unk_1E6D45998;
  objc_copyWeak(&v9, &location);
  id v3 = [(MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting *)v2 newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:0 responseHandler:&v5];
  id v4 = +[MusicKit_SoftLinking_MPModelLibraryTransientStateController sharedLibraryTransientStateController];
  [v4 performOperation:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke_3;
  v5[3] = &unk_1E6D45970;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "setConfiguration:");
    id WeakRetained = v3;
  }
}

void __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v6 = (void *)getMPIdentifierSetClass_softClass;
  uint64_t v22 = getMPIdentifierSetClass_softClass;
  if (!getMPIdentifierSetClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __getMPIdentifierSetClass_block_invoke;
    uint64_t v17 = &unk_1E6D453B0;
    id v18 = &v19;
    __getMPIdentifierSetClass_block_invoke((uint64_t)&v14);
    id v6 = (void *)v20[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v19, 8);
  id v8 = [v7 alloc];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v9 = (void *)getMPModelPlaylistKindClass_softClass;
  uint64_t v22 = getMPModelPlaylistKindClass_softClass;
  if (!getMPModelPlaylistKindClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __getMPModelPlaylistKindClass_block_invoke;
    uint64_t v17 = &unk_1E6D453B0;
    id v18 = &v19;
    __getMPModelPlaylistKindClass_block_invoke((uint64_t)&v14);
    id v9 = (void *)v20[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v19, 8);
  uint64_t v11 = [v10 identityKind];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_2;
  v13[3] = &unk_1E6D45A20;
  v13[4] = *(void *)(a1 + 32);
  v13[5] = a2;
  v12 = (void *)[v8 initWithSource:@"MusicKit_Duplicate_Playlist" modelKind:v11 block:v13];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id v5 = [v3 mediaLibrary];
  id v6 = [v5 uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_3;
  v7[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v7[4] = *(void *)(a1 + 40);
  [v4 setLibraryIdentifiersWithDatabaseID:v6 block:v7];
}

uint64_t __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

void __88__MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest_performWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F38660]) initWithUnderlyingResponse:v13];
  if (*(id *)(*(void *)(a1 + 32) + 16) != v13)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
    id v10 = getMPModelResponseDidInvalidateNotification();
    [v8 removeObserver:v9 name:v10 object:*(void *)(*(void *)(a1 + 32) + 16)];

    uint64_t v11 = *(void *)(a1 + 32);
    v12 = getMPModelResponseDidInvalidateNotification();
    [v8 addObserver:v11 selector:sel__handleDownloadQueueDidChangeNotification_ name:v12 object:v13];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __98__MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__MusicKit_SoftLinking_MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getMPServerObjectDatabaseClass_softClass;
  uint64_t v9 = getMPServerObjectDatabaseClass_softClass;
  if (!getMPServerObjectDatabaseClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMPServerObjectDatabaseClass_block_invoke;
    v5[3] = &unk_1E6D453B0;
    void v5[4] = &v6;
    __getMPServerObjectDatabaseClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  uint64_t v2 = [v1 sharedServerObjectDatabase];
  id v3 = [[MusicKit_SoftLinking_MPServerObjectDatabase alloc] _initWithUnderlyingServerObjectDatabase:v2];
  id v4 = (void *)sharedServerObjectDatabase_sSharedServerObjectDatabase;
  sharedServerObjectDatabase_sSharedServerObjectDatabase = (uint64_t)v3;
}

void __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_2;
  v11[3] = &unk_1E6D45C28;
  id v4 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v12 = v4;
  [v3 setUniversalStoreIdentifiersWithBlock:v11];
  if ((*(unsigned char *)(a1 + 40) & 0x40) != 0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_3;
    v9[3] = &unk_1E6D45C50;
    id v10 = *(id *)(a1 + 32);
    [v3 setRadioIdentifiersWithBlock:v9];
  }
  id v5 = [MEMORY[0x1E4FB87B8] activeAccount];
  uint64_t v6 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v7 = [v6 DSIDForUserIdentity:v5 outError:0];
  uint64_t v8 = [v7 stringValue];

  if (v8) {
    [v3 setPersonalStoreIdentifiersWithPersonID:v8 block:&__block_literal_global_13_0];
  }
}

void __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(void **)(a1 + 32);
  if ((*(unsigned char *)(a1 + 40) & 0x20) != 0)
  {
    [v3 setSocialProfileID:v5];
    goto LABEL_15;
  }
  id v6 = v5;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v7 = (uint64_t (*)(id))getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr;
  uint64_t v14 = getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr;
  if (!getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr)
  {
    uint64_t v8 = (void *)MediaPlayerLibrary_13();
    v12[3] = (uint64_t)dlsym(v8, "MPStoreItemMetadataInt64NormalizeStoreIDValue");
    getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    id v7 = (uint64_t (*)(id))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v7) {
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  }
  uint64_t v9 = v7(v6);

  uint64_t v10 = *(void *)(a1 + 40);
  if (!v10)
  {
    if (!v9)
    {
LABEL_14:
      [v4 setGlobalPlaylistID:*(void *)(a1 + 32)];
      goto LABEL_15;
    }
LABEL_13:
    [v4 setAdamID:v9];
    [v4 setSubscriptionAdamID:v9];
    goto LABEL_15;
  }
  if ((v10 & 1) != 0 && v9) {
    goto LABEL_13;
  }
  if ((v10 & 0x10) != 0 && !v9) {
    goto LABEL_14;
  }
LABEL_15:
}

uint64_t __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setStationStringID:*(void *)(a1 + 32)];
}

void __96__MusicKit_RemoteLibraryPlaybackQueue_setQueueWithPath_shuffleMode_sessionID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) _setQueueWithPath:*(void *)(a1 + 40) shuffleMode:*(void *)(a1 + 64) sessionID:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __97__MusicKit_RemoteLibraryPlaybackQueue__setQueueWithPath_shuffleMode_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = 0;
  id v3 = +[MusicKit_RemotePlaybackQueue extractDialogFromCommandResult:a2 error:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

void __96__MusicKit_RemoteLibraryPlaybackQueue_insertQueueWithPath_position_sessionID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) _insertQueueWithPath:*(void *)(a1 + 40) position:*(void *)(a1 + 64) sessionID:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __97__MusicKit_RemoteLibraryPlaybackQueue__insertQueueWithPath_position_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = 0;
  id v3 = +[MusicKit_RemotePlaybackQueue extractDialogFromCommandResult:a2 error:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

void __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 results];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke_2;
  v9[3] = &unk_1E6D45CD8;
  id v10 = v5;
  id v7 = v5;
  [v6 enumerateItemsUsingBlock:v9];

  uint64_t v8 = (void *)[objc_alloc((Class)getMPMediaQueryClass()) initWithEntities:v7 entityType:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = [v16 identifiers];
  id v4 = [v3 library];
  uint64_t v5 = [v4 persistentID];

  getMPModelPlaylistEntryClass_0();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v16;
    id v7 = [v6 song];

    if (v7)
    {
      uint64_t v8 = [v6 song];
    }
    else
    {
      uint64_t v9 = [v6 tvEpisode];

      if (v9)
      {
        uint64_t v8 = [v6 tvEpisode];
      }
      else
      {
        id v10 = [v6 movie];

        if (!v10)
        {
LABEL_9:

          goto LABEL_10;
        }
        uint64_t v8 = [v6 movie];
      }
    }
    uint64_t v11 = v8;
    id v12 = [v8 identifiers];
    uint64_t v13 = [v12 library];
    uint64_t v5 = [v13 persistentID];

    goto LABEL_9;
  }
LABEL_10:
  uint64_t v14 = [getMPMediaLibraryClass_0() defaultMediaLibrary];
  uint64_t v15 = [v14 entityWithPersistentID:v5 entityType:0];

  [*(id *)(a1 + 32) addObject:v15];
}

void __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _underlyingModelObject];
  uint64_t v2 = [v4 libraryAddStatusObserverConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(unsigned char *)(v3 + 36) = BYTE4(v2);
  *(_DWORD *)(v3 + 32) = v2;
}

void __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleUpdatedUnderlyingLibraryAddStatus:a2];
}

void __77__MusicKit_SoftLinking_MPLibraryAddStatusObserver_setIdentifyingModelObject___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _underlyingModelObject];
  uint64_t v2 = [v4 libraryAddStatusObserverConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(unsigned char *)(v3 + 36) = BYTE4(v2);
  *(_DWORD *)(v3 + 32) = v2;
}

uint64_t __74__MusicKit_SoftLinking_MPModelLibraryImportChangeRequest_setModelObjects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _underlyingModelObject];
}

uint64_t __57__MusicKit_PlayerPathSessionManager_sharedSessionManager__block_invoke()
{
  sharedSessionManager_sSharedSessionManager = objc_alloc_init(MusicKit_PlayerPathSessionManager);
  return MEMORY[0x1F41817F8]();
}

uint64_t __100__MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__MusicKit_SoftLinking_MPCPlayerChangeRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v10, "dialog", (void)v13);

      if (v11)
      {
        [v4 addObject:v10];
        goto LABEL_12;
      }
      if ([v10 type] == 2) {
        break;
      }
      [v4 addObject:v10];
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v12 = [v10 error];

    if (!v12) {
      goto LABEL_13;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
LABEL_12:

LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __128__MusicKit_SoftLinking_MPCPlaybackIntent_initWithLegacyLibraryRequest_allowedIdentifiers_startIdentifierSet_onlyLibraryContent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __107__MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest_performWithAlbum_appData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end