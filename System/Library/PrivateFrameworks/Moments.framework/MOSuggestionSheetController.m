@interface MOSuggestionSheetController
+ (id)processedAssets:(id)a3;
- (BOOL)disableAssetUnwrapping;
- (MOSuggestionSheetControllerDelegate)delegate;
- (id)initForScene:(id)a3;
- (id)server;
- (void)activate;
- (void)addSandboxHandle:(id)a3;
- (void)didActivateConnection;
- (void)didDropConnection;
- (void)getAssetsForSuggestion:(id)a3 withTypes:(id)a4 completion:(id)a5;
- (void)getAssetsForSuggestion:(id)a3 withTypes:(id)a4 onAssetsCallback:(id)a5;
- (void)reconnectIfNecessary;
- (void)releaseSandboxHandles;
- (void)requestPickerWithOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableAssetUnwrapping:(BOOL)a3;
- (void)terminate;
- (void)updatePickerState:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation MOSuggestionSheetController

- (id)initForScene:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOSuggestionSheetController;
  v5 = [(MOSuggestionSheetController *)&v13 init];
  if (v5)
  {
    v6 = [v4 _FBSScene];
    v7 = [v6 identityToken];

    instanceSceneIdentityToken = v5->_instanceSceneIdentityToken;
    v5->_instanceSceneIdentityToken = v7;
    v9 = v7;

    uint64_t v10 = objc_opt_new();
    sandboxTokenHandles = v5->_sandboxTokenHandles;
    v5->_sandboxTokenHandles = (NSMutableArray *)v10;
  }
  return v5;
}

- (void)activate
{
}

void __39__MOSuggestionSheetController_activate__block_invoke()
{
  id v4 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.moments.ui-services.presenter"];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F2940F28];
  [v4 setServer:v0];

  v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F293B830];
  [v4 setClient:v1];

  uint64_t v2 = [v4 copy];
  v3 = (void *)activate___interface;
  activate___interface = v2;
}

void __39__MOSuggestionSheetController_activate__block_invoke_164(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  id v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:activate___interface];
  v5 = [[MOSuggestionsSheetClientProxyTarget alloc] initWithController:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__MOSuggestionSheetController_activate__block_invoke_2;
  v10[3] = &unk_1E69204D8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  [v3 setActivationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__MOSuggestionSheetController_activate__block_invoke_3;
  v8[3] = &unk_1E69204D8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MOSuggestionSheetController_activate__block_invoke_168;
  v6[3] = &unk_1E69204D8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
}

void __39__MOSuggestionSheetController_activate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didActivateConnection];
}

void __39__MOSuggestionSheetController_activate__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D24AE000, v2, OS_LOG_TYPE_DEFAULT, "suggestions sheet service endpoint connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didDropConnection];
}

void __39__MOSuggestionSheetController_activate__block_invoke_168(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D24AE000, v2, OS_LOG_TYPE_DEFAULT, "suggestions sheet service endpoint connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didDropConnection];
}

- (void)didDropConnection
{
  [(BSServiceConnectionClient *)self->_angelConnection invalidate];
  angelConnection = self->_angelConnection;
  self->_angelConnection = 0;

  remoteTarget = self->_remoteTarget;
  self->_remoteTarget = 0;

  v5 = [(MOSuggestionSheetController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MOSuggestionSheetController *)self delegate];
    [v7 suggestionSheetController:self didTransitionTo:0];
  }
}

- (void)didActivateConnection
{
  uint64_t v2 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1D24AE000, v2, OS_LOG_TYPE_DEFAULT, "Activated connection to MomentsUIService process", v3, 2u);
  }
}

- (void)reconnectIfNecessary
{
  if (!self->_angelConnection) {
    [(MOSuggestionSheetController *)self activate];
  }
}

- (id)server
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [(MOSuggestionSheetController *)self reconnectIfNecessary];
  remoteTarget = self->_remoteTarget;
  if (!remoteTarget)
  {
    id v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
    angelConnection = self->_angelConnection;
    v10[0] = v4;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = [(BSServiceConnectionClient *)angelConnection remoteTargetWithLaunchingAssertionAttributes:v6];
    v8 = self->_remoteTarget;
    self->_remoteTarget = v7;

    remoteTarget = self->_remoteTarget;
  }
  return remoteTarget;
}

- (void)requestPickerWithOptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 description];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "controller, requesting sheet with options. %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(MOSuggestionSheetController *)self server];
  [v7 requestPickerForSceneIdentiyToken:self->_instanceSceneIdentityToken withOptions:v4];
}

- (void)updatePickerState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    unint64_t v19 = a3;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "controller, requesting sheet view transition to state=%lu", (uint8_t *)&v18, 0xCu);
  }

  if (a3 || self->_angelConnection)
  {
    int v8 = [(MOSuggestionSheetController *)self server];
    id v9 = [NSNumber numberWithUnsignedInt:a3];
    uint64_t v10 = [NSNumber numberWithBool:v4];
    [v8 updatePickerState:v9 animated:v10];
  }
  else
  {
    int v8 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOSuggestionSheetController updatePickerState:animated:](v8, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)terminate
{
  id v2 = [(MOSuggestionSheetController *)self server];
  [v2 terminate];
}

- (void)getAssetsForSuggestion:(id)a3 withTypes:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 suggestionIdentifier];
    uint64_t v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "(Legacy) controller, requesting assets for suggestion identifier=%@", buf, 0xCu);
  }
  uint64_t v14 = objc_opt_new();
  [v14 setRequestedTypes:v10];

  uint64_t v15 = [(MOSuggestionSheetController *)self server];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_completion___block_invoke;
  v18[3] = &unk_1E6920528;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [v15 fetchAssets:v17 withTypes:v14 completion:v18];
}

void __75__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) suggestionIdentifier];
      id v10 = [v9 UUIDString];
      uint64_t v11 = [v5 debugDescription];
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "Received assets for suggestion ID=%@ with assets=%@", (uint8_t *)&v12, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    id v9 = [*(id *)(a1 + 32) suggestionIdentifier];
    id v10 = [v9 UUIDString];
    int v12 = 138412290;
    uint64_t v13 = v10;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "Received nil assets for suggestion ID=%@", (uint8_t *)&v12, 0xCu);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getAssetsForSuggestion:(id)a3 withTypes:(id)a4 onAssetsCallback:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v8 suggestionIdentifier];
    uint64_t v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "controller, requesting assets for suggestion identifier=%@", buf, 0xCu);
  }
  __int16 v14 = objc_opt_new();
  [v14 setRequestedTypes:v10];

  uint64_t v15 = [(MOSuggestionSheetController *)self server];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_onAssetsCallback___block_invoke;
  v18[3] = &unk_1E6920550;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v16 = v9;
  id v17 = v8;
  [v15 fetchAssets:v17 withTypes:v14 onAssetsCallback:v18];
}

void __81__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_onAssetsCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && ([v5 assets], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) suggestionIdentifier];
      id v10 = [v9 UUIDString];
      uint64_t v11 = [v5 assets];
      int v18 = 138412546;
      id v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = [v11 count];
      _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "Received assets for suggestionID=%@, count=%lu", (uint8_t *)&v18, 0x16u);
    }
    if ([*(id *)(a1 + 40) disableAssetUnwrapping])
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = [v5 assets];
      (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v6);
    }
    else
    {
      id v17 = [v5 assets];
      uint64_t v13 = +[MOSuggestionSheetController processedAssets:v17];

      (*(void (**)(void, void *, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v13, v6);
    }
  }
  else
  {
    __int16 v14 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [*(id *)(a1 + 32) suggestionIdentifier];
      id v16 = [v15 UUIDString];
      int v18 = 138412290;
      id v19 = v16;
      _os_log_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_DEFAULT, "Received nil assets for suggestion ID=%@", (uint8_t *)&v18, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)processedAssets:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v49 = [v3 count];
    _os_log_impl(&dword_1D24AE000, v4, OS_LOG_TYPE_DEFAULT, "Processing assets for count=%lu", buf, 0xCu);
  }

  id v5 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    v30 = v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        uint64_t v12 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v11 debugDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v49 = (uint64_t)v13;
          _os_log_impl(&dword_1D24AE000, v12, OS_LOG_TYPE_DEFAULT, "--%@", buf, 0xCu);
        }
        __int16 v14 = [v11 assetType];
        int v15 = [v14 isEqualToString:MOSuggestionAssetsTypeMotionActivity];

        if (v15)
        {
          id v16 = +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:v11];
          if (!v16)
          {
            id v17 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              +[MOSuggestionSheetController processedAssets:](&v41, v42);
            }
            goto LABEL_38;
          }
LABEL_32:
          objc_msgSend(v5, "addObject:", v16, v30);
LABEL_39:

          goto LABEL_40;
        }
        int v18 = [v11 assetType];
        int v19 = [v18 isEqualToString:MOSuggestionAssetsTypeMediaCoverArt];

        if (v19)
        {
          id v16 = +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:v11];
          if (v16) {
            goto LABEL_32;
          }
          id v17 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[MOSuggestionSheetController processedAssets:](&v39, v40);
          }
LABEL_38:

          goto LABEL_39;
        }
        __int16 v20 = [v11 assetType];
        int v21 = [v20 isEqualToString:MOSuggestionAssetsTypeWorkoutGroup];

        if (v21)
        {
          id v16 = +[MOSuggestionAssetUtilities unwrappeCombinedWorkoutObjectFrom:v11];
          if (v16) {
            goto LABEL_32;
          }
          id v17 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[MOSuggestionSheetController processedAssets:](&v37, v38);
          }
          goto LABEL_38;
        }
        uint64_t v22 = [v11 assetType];
        int v23 = [v22 isEqualToString:MOSuggestionAssetsTypeWorkout];

        if (v23)
        {
          id v16 = +[MOSuggestionAssetUtilities unwrappedWorkoutObjectFrom:v11];
          if (v16) {
            goto LABEL_32;
          }
          id v17 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[MOSuggestionSheetController processedAssets:].cold.4(&v35, v36);
          }
          goto LABEL_38;
        }
        uint64_t v24 = [v11 assetType];
        int v25 = [v24 isEqualToString:MOSuggestionAssetsTypeContactPhoto];

        if (v25)
        {
          id v16 = +[MOSuggestionAssetUtilities unwrappedContactPhotoFrom:v11];
          if (v16) {
            goto LABEL_32;
          }
          id v17 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[MOSuggestionSheetController processedAssets:].cold.5(&v33, v34);
          }
          goto LABEL_38;
        }
        v26 = [v11 assetType];
        int v27 = [v26 isEqualToString:MOSuggestionAssetsTypeStateOfMindAsset];

        if (v27)
        {
          id v16 = +[MOSuggestionAssetUtilities unwrappedStateOfMindFrom:v11];
          if (v16) {
            goto LABEL_32;
          }
          id v17 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[MOSuggestionSheetController processedAssets:].cold.6(&v31, v30);
          }
          goto LABEL_38;
        }
        v28 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D24AE000, v28, OS_LOG_TYPE_DEFAULT, "Pass through without further unwrapping", buf, 2u);
        }

        [v5 addObject:v11];
LABEL_40:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)addSandboxHandle:(id)a3
{
}

- (void)releaseSandboxHandles
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_sandboxTokenHandles;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "intValue", (void)v7);
        sandbox_extension_release();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (MOSuggestionSheetControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MOSuggestionSheetControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disableAssetUnwrapping
{
  return self->_disableAssetUnwrapping;
}

- (void)setDisableAssetUnwrapping:(BOOL)a3
{
  self->_disableAssetUnwrapping = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sandboxTokenHandles, 0);
  objc_storeStrong((id *)&self->_remoteTarget, 0);
  objc_storeStrong((id *)&self->_instanceSceneIdentityToken, 0);
  objc_storeStrong((id *)&self->_angelConnectionQueue, 0);
  objc_storeStrong((id *)&self->_angelConnection, 0);
  objc_storeStrong((id *)&self->_localTarget, 0);
}

- (void)updatePickerState:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)processedAssets:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_7(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_1D24AE000, v2, v3, "(MotionActivity) Unwrapping failed, dropping", v4);
}

+ (void)processedAssets:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_7(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_1D24AE000, v2, v3, "(MediaItem) Unwrapping failed, dropping", v4);
}

+ (void)processedAssets:(unsigned char *)a1 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_7(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_1D24AE000, v2, v3, "(CombinedWorkoutGlyph) Unwrapping failed, dropping", v4);
}

+ (void)processedAssets:(unsigned char *)a1 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_7(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_1D24AE000, v2, v3, "(WorkoutObject) Unwrapping failed, dropping", v4);
}

+ (void)processedAssets:(unsigned char *)a1 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_7(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_1D24AE000, v2, v3, "(ContactPhoto) Unwrapping failed, dropping", v4);
}

+ (void)processedAssets:(unsigned char *)a1 .cold.6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_7(a1, a2);
  OUTLINED_FUNCTION_1_6(&dword_1D24AE000, v2, v3, "(StateOfMind) Unwrapping failed, dropping", v4);
}

@end