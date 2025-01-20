@interface PUOneUpAccessoryViewControllersManager
- (BOOL)_isPhoneAndLandscape;
- (BOOL)photosDetailsUIViewControllerRequestDismissal:(id)a3;
- (BOOL)shouldHideNavigationBarWhenShowingAccessoryViewControllerForAssetReference:(id)a3;
- (BOOL)shouldHideStatusBarWhenShowingAccessoryViewControllerForAssetReference:(id)a3;
- (BOOL)shouldHideToolbarWhenShowingAccessoryViewControllerForAssetReference:(id)a3;
- (NSMapTable)_accessoryViewControllers;
- (PUBrowsingSession)browsingSession;
- (PUOneUpAccessoryViewControllersManager)init;
- (PUOneUpAccessoryViewControllersManager)initWithBrowsingSession:(id)a3 spec:(id)a4;
- (PUOneUpAccessoryViewControllersManagerDelegate)delegate;
- (PUOneUpViewControllerSpec)_spec;
- (id)_createAccessoryViewControllerForAssetReference:(id)a3;
- (id)accessoryViewControllerForAssetReference:(id)a3;
- (id)accessoryViewControllerForAssetReference:(id)a3 createIfNeeded:(BOOL)a4;
- (id)assetReferenceForAccessoryViewController:(id)a3;
- (id)unlockDeviceHandlerWithActionType;
- (id)unlockDeviceStatus;
- (int64_t)_accessoryViewTypeForAsset:(id)a3;
- (int64_t)accessoryViewTypeForAsset:(id)a3;
- (void)_invalidateAccessoryViewControllersForAssetReferences:(id)a3;
- (void)photosDetailsUIViewControllerCompositionDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUnlockDeviceHandlerWithActionType:(id)a3;
- (void)setUnlockDeviceStatus:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpAccessoryViewControllersManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__accessoryViewControllers, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

- (PUOneUpViewControllerSpec)_spec
{
  return self->__spec;
}

- (NSMapTable)_accessoryViewControllers
{
  return self->__accessoryViewControllers;
}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (void)setUnlockDeviceStatus:(id)a3
{
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (PUOneUpAccessoryViewControllersManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOneUpAccessoryViewControllersManagerDelegate *)WeakRetained;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v6 = a4;
  v40 = self;
  v7 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewControllers];
  v41 = v6;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v6 assetsDataSourceDidChange])
  {
    v8 = [v44 assetsDataSource];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v9 = [v7 keyEnumerator];
    v10 = [v9 allObjects];

    id obj = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v58 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          v16 = [v8 assetReferenceForAssetReference:v15];
          v17 = [v15 asset];
          v18 = [v16 asset];
          if ([v17 isEqual:v18])
          {
            uint64_t v19 = [v17 mediaSubtypes];
            if (v19 != [v18 mediaSubtypes]) {
              [v42 addObject:v16];
            }
          }
          if (v16)
          {
            v20 = [v7 objectForKey:v15];
            [v7 setObject:v20 forKey:v16];
          }
          [v7 removeObjectForKey:v15];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      }
      while (v12);
    }
  }
  id obja = [v41 assetViewModelChangesByAssetReference];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v45 = [v7 keyEnumerator];
  uint64_t v21 = [v45 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    v43 = 0;
    uint64_t v46 = *(void *)v54;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v54 != v46) {
          objc_enumerationMutation(v45);
        }
        uint64_t v24 = *(void *)(*((void *)&v53 + 1) + 8 * v23);
        v25 = [obja objectForKeyedSubscript:v24];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          v29 = v7;
          uint64_t v30 = *(void *)v50;
LABEL_22:
          uint64_t v31 = 0;
          while (1)
          {
            if (*(void *)v50 != v30) {
              objc_enumerationMutation(v26);
            }
            v32 = *(void **)(*((void *)&v49 + 1) + 8 * v31);
            int v33 = [v32 focusValueChanged];
            if (v33) {
              break;
            }
            if ([v32 assetChanged])
            {
              int v35 = [v42 containsObject:v24];

              if (!v35)
              {
                v7 = v29;
                goto LABEL_41;
              }
              goto LABEL_33;
            }
            if (v28 == ++v31)
            {
              uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
              if (v28) {
                goto LABEL_22;
              }
              v34 = v26;
              v7 = v29;
              goto LABEL_40;
            }
          }

LABEL_33:
          v34 = [v44 assetViewModelForAssetReference:v24];
          [v34 focusValue];
          if (fabs(v36) < 2.0) {
            char v37 = v33;
          }
          else {
            char v37 = 0;
          }
          v7 = v29;
          if ((v37 & 1) == 0)
          {
            v38 = v43;
            if (!v43)
            {
              v38 = [MEMORY[0x1E4F1CA48] array];
            }
            v43 = v38;
            [v38 addObject:v24];
          }
          goto LABEL_40;
        }
        v34 = v26;
LABEL_40:

LABEL_41:
        ++v23;
      }
      while (v23 != v22);
      uint64_t v39 = [v45 countByEnumeratingWithState:&v53 objects:v62 count:16];
      uint64_t v22 = v39;
    }
    while (v39);
  }
  else
  {
    v43 = 0;
  }

  if ([v43 count]) {
    [(PUOneUpAccessoryViewControllersManager *)v40 _invalidateAccessoryViewControllersForAssetReferences:v43];
  }
}

- (void)photosDetailsUIViewControllerCompositionDidChange:(id)a3
{
  if (self->_delegateRespondsTo.invalidateAccessoryLayout)
  {
    id v4 = [(PUOneUpAccessoryViewControllersManager *)self delegate];
    [v4 oneUpAccessoryViewControllersManagerInvalidateAccessoryLayout:self];
  }
}

- (BOOL)photosDetailsUIViewControllerRequestDismissal:(id)a3
{
  if (!self->_delegateRespondsTo.requestDismissal) {
    return 0;
  }
  v3 = self;
  id v4 = [(PUOneUpAccessoryViewControllersManager *)self delegate];
  LOBYTE(v3) = [v4 oneUpAccessoryViewControllersManagerRequestAccessoryDismissal:v3];

  return (char)v3;
}

- (id)_createAccessoryViewControllerForAssetReference:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 asset];
  int64_t v7 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewTypeForAsset:v6];

  switch(v7)
  {
    case 1:
      int v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2 object:self file:@"PUOneUpAccessoryViewControllersManager.m" lineNumber:248 description:@"Code which should be unreachable has been reached"];

      abort();
    case 2:
      v8 = [v5 asset];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v8 canPerformEditOperation:2]) {
          uint64_t v9 = 6;
        }
        else {
          uint64_t v9 = 38;
        }
      }
      else
      {
        v16 = PLUIGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "%@: Unknown asset class: %@", buf, 0x16u);
        }
        uint64_t v9 = 38;
      }
      v18 = [(PUOneUpAccessoryViewControllersManager *)self browsingSession];
      uint64_t v19 = [v18 photosDetailsContext];

      v20 = [MEMORY[0x1E4F90518] photosDetailsContextForAsset:v8 parentContext:v19];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __90__PUOneUpAccessoryViewControllersManager__createAccessoryViewControllerForAssetReference___block_invoke;
      v36[3] = &unk_1E5F2AA40;
      id v21 = v5;
      id v37 = v21;
      [v20 performChanges:v36];
      if (!self->_delegateRespondsTo.preventRevealInMomentActionForAssetReference
        || ([(PUOneUpAccessoryViewControllersManager *)self delegate],
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = [v22 oneUpAccessoryViewControllersManager:self preventRevealInMomentActionForAssetReference:v21], v22, (v23 & 1) == 0))
      {
        v9 |= 0x10uLL;
      }
      if (!self->_delegateRespondsTo.preventInternalFileRadarActionForAssetReference
        || ([(PUOneUpAccessoryViewControllersManager *)self delegate],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = [v24 oneUpAccessoryViewControllersManager:self preventInternalFileRadarActionForAssetReference:v21], v24, (v25 & 1) == 0))
      {
        v9 |= 0x40uLL;
      }
      if (self->_delegateRespondsTo.preventAlbumAttributionWidget)
      {
        id v26 = [(PUOneUpAccessoryViewControllersManager *)self delegate];
        int v27 = [v26 oneUpAccessoryViewControllersManager:self preventAlbumAttributionWidgetForAssetReference:v21];

        if (v27) {
          v9 |= 0x80uLL;
        }
      }
      uint64_t v28 = [(PUOneUpAccessoryViewControllersManager *)self browsingSession];
      v29 = [v28 viewModel];
      uint64_t v30 = [v29 assetViewModelForAssetReference:v21];

      id v31 = objc_alloc_init(MEMORY[0x1E4F90510]);
      [v31 setOptions:v9];
      v32 = [(PUOneUpAccessoryViewControllersManager *)self unlockDeviceStatus];
      [v31 setUnlockDeviceStatus:v32];

      int v33 = [(PUOneUpAccessoryViewControllersManager *)self unlockDeviceHandlerWithActionType];
      [v31 setUnlockDeviceHandlerWithActionType:v33];

      v10 = [[PUPhotosDetailsViewController alloc] initWithContext:v20 configuration:v31 assetViewModel:v30];
      [(PXPhotosDetailsUIViewController *)v10 setDelegate:self];

      break;
    case 3:
      uint64_t v11 = [(PUOneUpAccessoryViewControllersManager *)self browsingSession];
      uint64_t v12 = [v11 viewModel];
      uint64_t v13 = [v12 assetViewModelForAssetReference:v5];

      v10 = [[PUCommentsViewController alloc] initWithAssetViewModel:v13];
      break;
    case 4:
      uint64_t v38 = 0;
      uint64_t v39 = &v38;
      uint64_t v40 = 0x2050000000;
      v14 = (void *)getPUTesterSampleAccessoryViewControllerClass_softClass;
      uint64_t v41 = getPUTesterSampleAccessoryViewControllerClass_softClass;
      if (!getPUTesterSampleAccessoryViewControllerClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getPUTesterSampleAccessoryViewControllerClass_block_invoke;
        v43 = &unk_1E5F2E228;
        id v44 = &v38;
        __getPUTesterSampleAccessoryViewControllerClass_block_invoke((uint64_t)buf);
        v14 = (void *)v39[3];
      }
      id v15 = v14;
      _Block_object_dispose(&v38, 8);
      v10 = (PUPhotosDetailsViewController *)objc_alloc_init((Class)v15);
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

void __90__PUOneUpAccessoryViewControllersManager__createAccessoryViewControllerForAssetReference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setViewSourceOrigin:1];
  id v4 = [*(id *)(a1 + 32) assetCollection];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  [v3 setContainingAlbum:v5];
}

- (int64_t)_accessoryViewTypeForAsset:(id)a3
{
  id v3 = a3;
  id v4 = +[PUOneUpSettings sharedInstance];
  int64_t v5 = [v4 accessoryViewType];

  if (v5 == 1)
  {
    if (+[PUCommentsViewController canShowCommentsForAsset:v3])
    {
      int64_t v5 = 3;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v3;
        if ([v6 isTrashed])
        {
          int64_t v5 = 0;
        }
        else if ([v6 isRecoveredAsset])
        {
          int64_t v5 = 0;
        }
        else
        {
          int64_t v5 = 2;
        }
      }
      else
      {
        int64_t v5 = 0;
      }
    }
  }

  return v5;
}

- (void)_invalidateAccessoryViewControllersForAssetReferences:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        v10 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewControllers];
        [v10 removeObjectForKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)assetReferenceForAccessoryViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewControllers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(v5, "keyEnumerator", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v5 objectForKey:v10];

        if (v11 == v4)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)accessoryViewControllerForAssetReference:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PUOneUpAccessoryViewControllersManager *)self browsingSession];
  uint64_t v8 = [v7 viewModel];
  uint64_t v9 = [v8 assetsDataSource];

  v29 = v9;
  v10 = [v9 assetReferenceForAssetReference:v6];

  id v11 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewControllers];
  long long v12 = [v11 objectForKey:v10];
  if (!v12)
  {
    BOOL v26 = v4;
    int v27 = self;
    uint64_t v28 = v11;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v13 = [v11 keyEnumerator];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      long long v12 = 0;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v19 = [v18 asset];
          v20 = [v10 asset];
          int v21 = [v19 isEqual:v20];

          if (v21)
          {
            uint64_t v22 = [v29 assetReferenceForAssetReference:v18];
            int v23 = [v22 isEqual:v10];

            if (v23)
            {
              uint64_t v24 = [v28 objectForKey:v18];

              long long v12 = (void *)v24;
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }
    else
    {
      long long v12 = 0;
    }

    if (v12)
    {
      id v11 = v28;
    }
    else
    {
      id v11 = v28;
      if (v26)
      {
        long long v12 = [(PUOneUpAccessoryViewControllersManager *)v27 _createAccessoryViewControllerForAssetReference:v10];
        [v28 setObject:v12 forKey:v10];
      }
    }
  }

  return v12;
}

- (id)accessoryViewControllerForAssetReference:(id)a3
{
  return [(PUOneUpAccessoryViewControllersManager *)self accessoryViewControllerForAssetReference:a3 createIfNeeded:1];
}

- (BOOL)shouldHideStatusBarWhenShowingAccessoryViewControllerForAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUOneUpAccessoryViewControllersManager *)self _spec];
  char v6 = [v5 hideStatusBarWhenShowingAccessoryView];

  id v7 = [v4 asset];

  int64_t v8 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewTypeForAsset:v7];
  if (v8 == 3) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6;
  }
  return v8 && v9;
}

- (BOOL)shouldHideNavigationBarWhenShowingAccessoryViewControllerForAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUOneUpAccessoryViewControllersManager *)self _spec];
  char v6 = [v5 hideNavigationBarWhenShowingAccessoryView];

  id v7 = [v4 asset];

  int64_t v8 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewTypeForAsset:v7];
  if (!v8) {
    return 0;
  }
  if (v8 == 3)
  {
    BOOL v9 = [MEMORY[0x1E4F90300] sharedInstance];
    if ([v9 enableSideCommentsInLandscape]) {
      char v6 = [(PUOneUpAccessoryViewControllersManager *)self _isPhoneAndLandscape];
    }
    else {
      char v6 = 0;
    }
  }
  return v6;
}

- (BOOL)shouldHideToolbarWhenShowingAccessoryViewControllerForAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PUOneUpSettings sharedInstance];
  char v6 = [v5 hideToolbarWhenShowingAccessoryView];

  id v7 = [v4 asset];
  int64_t v8 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewTypeForAsset:v7];

  if (v8)
  {
    if (v8 == 3)
    {
      BOOL v9 = [(PUOneUpAccessoryViewControllersManager *)self browsingSession];
      v10 = [v9 viewModel];
      id v11 = [v10 assetViewModelForAssetReference:v4];

      char v12 = [v11 isInEditMode];
    }
    else if (v6)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = [(PUOneUpAccessoryViewControllersManager *)self _isPhoneAndLandscape];
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)_isPhoneAndLandscape
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 0;
  }
  uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 orientation];

  if ((unint64_t)(v6 - 1) > 3)
  {
    int64_t v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    BOOL v9 = [v8 windows];
    v10 = [v9 firstObject];
    id v11 = [v10 windowScene];
    uint64_t v12 = [v11 interfaceOrientation];

    unint64_t v7 = v12 - 3;
  }
  else
  {
    unint64_t v7 = v6 - 3;
  }
  return v7 < 2;
}

- (int64_t)accessoryViewTypeForAsset:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(PUOneUpAccessoryViewControllersManager *)self _accessoryViewTypeForAsset:v5];
  switch(v6)
  {
    case 1:
      int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PUOneUpAccessoryViewControllersManager.m" lineNumber:84 description:@"Code which should be unreachable has been reached"];

      abort();
    case 2:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_6;
      }
      goto LABEL_5;
    case 3:
      if (!+[PUCommentsViewController canShowCommentsForAsset:v5])goto LABEL_5; {
      goto LABEL_6;
      }
    case 4:
      goto LABEL_6;
    default:
LABEL_5:
      int64_t v6 = 0;
LABEL_6:

      return v6;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.preventRevealInMomentActionForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.preventInternalFileRadarActionForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.requestDismissal = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.invalidateAccessoryLayout = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.preventAlbumAttributionWidget = objc_opt_respondsToSelector() & 1;
  }
}

- (PUOneUpAccessoryViewControllersManager)initWithBrowsingSession:(id)a3 spec:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUOneUpAccessoryViewControllersManager;
  BOOL v9 = [(PUOneUpAccessoryViewControllersManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_browsingSession, a3);
    id v11 = [(PUBrowsingSession *)v10->_browsingSession viewModel];
    [v11 registerChangeObserver:v10];

    objc_storeStrong((id *)&v10->__spec, a4);
    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    accessoryViewControllers = v10->__accessoryViewControllers;
    v10->__accessoryViewControllers = (NSMapTable *)v12;

    [MEMORY[0x1E4F90548] preloadResources];
  }

  return v10;
}

- (PUOneUpAccessoryViewControllersManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUOneUpAccessoryViewControllersManager.m", 46, @"%s is not available as initializer", "-[PUOneUpAccessoryViewControllersManager init]");

  abort();
}

@end