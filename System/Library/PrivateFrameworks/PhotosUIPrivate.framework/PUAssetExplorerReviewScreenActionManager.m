@interface PUAssetExplorerReviewScreenActionManager
- (BOOL)_hasReviewScreenActionTypeForAssetActionType:(unint64_t)a3;
- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5;
- (Class)_actionPerformerClassForActionType:(unint64_t)a3;
- (PUAssetExplorerReviewScreenActionManager)initWithSourceType:(unint64_t)a3;
- (PUAssetExplorerReviewScreenActionManagerDelegate)reviewScreenActionManagerDelegate;
- (PUReviewAssetProvider)reviewAssetProvider;
- (PUUUIDSelectionManager)disableLivePhotosSelectionManager;
- (PUUUIDSelectionManager)selectionManager;
- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4;
- (unint64_t)_reviewScreenActionTypeForAssetActionType:(unint64_t)a3;
- (unint64_t)_sourceType;
- (void)setReviewAssetProvider:(id)a3;
- (void)setReviewScreenActionManagerDelegate:(id)a3;
@end

@implementation PUAssetExplorerReviewScreenActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableLivePhotosSelectionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_destroyWeak((id *)&self->_reviewAssetProvider);
  objc_destroyWeak((id *)&self->_reviewScreenActionManagerDelegate);
}

- (unint64_t)_sourceType
{
  return self->__sourceType;
}

- (PUUUIDSelectionManager)disableLivePhotosSelectionManager
{
  return self->_disableLivePhotosSelectionManager;
}

- (PUUUIDSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setReviewAssetProvider:(id)a3
{
}

- (PUReviewAssetProvider)reviewAssetProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reviewAssetProvider);
  return (PUReviewAssetProvider *)WeakRetained;
}

- (void)setReviewScreenActionManagerDelegate:(id)a3
{
}

- (PUAssetExplorerReviewScreenActionManagerDelegate)reviewScreenActionManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reviewScreenActionManagerDelegate);
  return (PUAssetExplorerReviewScreenActionManagerDelegate *)WeakRetained;
}

- (id)actionPerformerForSimpleActionType:(unint64_t)a3 onAssetsByAssetCollection:(id)a4
{
  id v7 = a4;
  v8 = [(PUAssetExplorerReviewScreenActionManager *)self _actionPerformerClassForActionType:a3];
  if (v8)
  {
    uint64_t v9 = [[v8 alloc] initWithActionType:a3 assets:0 orAssetsByAssetCollection:v7];
  }
  else
  {
    v46.receiver = self;
    v46.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
    uint64_t v9 = [(PUAssetActionManager *)&v46 actionPerformerForSimpleActionType:a3 onAssetsByAssetCollection:v7];
  }
  v10 = (void *)v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    v12 = [(PUAssetExplorerReviewScreenActionManager *)self reviewScreenActionManagerDelegate];
    v13 = [(PUAssetExplorerReviewScreenActionManager *)self reviewAssetProvider];
    switch(a3)
    {
      case '*':
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke;
        v42[3] = &unk_1E5F2E908;
        id v43 = v7;
        id v44 = v12;
        v45 = self;
        [v11 setPerformUserInteractionTaskBlock:v42];

        id v14 = v43;
        goto LABEL_24;
      case '+':
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_2;
        v39[3] = &unk_1E5F2ECC8;
        id v40 = v12;
        v41 = self;
        [v11 setPerformUserInteractionTaskBlock:v39];
        id v14 = v40;
        goto LABEL_24;
      case ',':
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_3;
        v36[3] = &unk_1E5F2ECC8;
        id v37 = v12;
        v38 = self;
        [v11 setPerformUserInteractionTaskBlock:v36];
        id v14 = v37;
        goto LABEL_24;
      case '-':
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_4;
        v33[3] = &unk_1E5F2ECC8;
        id v34 = v12;
        v35 = self;
        [v11 setPerformUserInteractionTaskBlock:v33];
        id v14 = v34;
        goto LABEL_24;
      case '.':
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_5;
        v29[3] = &unk_1E5F2E908;
        id v30 = v7;
        id v31 = v12;
        v32 = self;
        [v11 setPerformUserInteractionTaskBlock:v29];

        id v14 = v30;
        goto LABEL_24;
      case '/':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenActionManager.m" lineNumber:467 description:@"Expecting markup action performer"];
        }
        id v14 = v11;
        [v14 setReviewAssetProvider:v13];
        [v14 setMarkupObserver:v12];
        goto LABEL_24;
      case '0':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenActionManager.m" lineNumber:476 description:@"Expecting edit action performer"];
        }
        id v15 = v11;
        [v15 setReviewAssetProvider:v13];
        id v14 = [(PUAssetExplorerReviewScreenActionManager *)self reviewScreenActionManagerDelegate];
        [v15 setPhotoDelegate:v14];
        goto LABEL_20;
      case '1':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenActionManager.m" lineNumber:487 description:@"Expecting fun effects action performer"];
        }
        id v15 = v11;
        [v15 setReviewAssetProvider:v13];
        [v15 setFunEffectsObserver:v12];
        id v14 = [v12 reviewScreenBarsModelForAssetExplorerReviewScreenActionManager:self];
        [v15 setReviewBarsModel:v14];
LABEL_20:

        goto LABEL_24;
      case '2':
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_6;
        v26[3] = &unk_1E5F2ECC8;
        id v27 = v12;
        v28 = self;
        [v11 setPerformUserInteractionTaskBlock:v26];
        id v14 = v27;
        goto LABEL_24;
      case '3':
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_7;
        v23[3] = &unk_1E5F2ECC8;
        id v24 = v12;
        v25 = self;
        [v11 setPerformUserInteractionTaskBlock:v23];
        id v14 = v24;
        goto LABEL_24;
      case '4':
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_8;
        v20[3] = &unk_1E5F2ECC8;
        id v21 = v12;
        v22 = self;
        [v11 setPerformUserInteractionTaskBlock:v20];
        id v14 = v21;
LABEL_24:

        break;
      default:
        break;
    }
  }
  return v10;
}

void __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(a1 + 32) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(a1 + 40) assetExplorerReviewScreenActionManager:*(void *)(a1 + 48) didPressSelectForAsset:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetExplorerReviewScreenActionManagerDidPressCancel:*(void *)(a1 + 40)];
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetExplorerReviewScreenActionManagerDidPressDone:*(void *)(a1 + 40)];
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetExplorerReviewScreenActionManagerDidPressRetake:*(void *)(a1 + 40)];
}

void __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_5(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(a1 + 32) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(a1 + 40) assetExplorerReviewScreenActionManager:*(void *)(a1 + 48) didToggleLivePhoto:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetExplorerReviewScreenActionManagerDidPressSend:*(void *)(a1 + 40)];
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetExplorerReviewScreenActionManagerDidPressSelectAll:*(void *)(a1 + 40)];
}

uint64_t __105__PUAssetExplorerReviewScreenActionManager_actionPerformerForSimpleActionType_onAssetsByAssetCollection___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetExplorerReviewScreenActionManagerDidPressDeselectAll:*(void *)(a1 + 40)];
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (-[PUAssetExplorerReviewScreenActionManager _hasReviewScreenActionTypeForAssetActionType:](self, "_hasReviewScreenActionTypeForAssetActionType:", a3)&& (v10 = -[PUAssetExplorerReviewScreenActionManager _reviewScreenActionTypeForAssetActionType:](self, "_reviewScreenActionTypeForAssetActionType:", a3), -[PUAssetExplorerReviewScreenActionManager reviewScreenActionManagerDelegate](self, "reviewScreenActionManagerDelegate"), uint64_t v11 = objc_claimAutoreleasedReturnValue(), LODWORD(v10) = [v11 assetExplorerReviewScreenActionManager:self shouldEnableActionType:v10 onAsset:v8 inAssetCollection:v9], v11,
        !v10))
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v12 = [(PUAssetExplorerReviewScreenActionManager *)self _actionPerformerClassForActionType:a3];
    if (v12)
    {
      unsigned __int8 v13 = [(objc_class *)v12 shouldEnableOnAsset:v8 inAssetCollection:v9];
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
      unsigned __int8 v13 = [(PUAssetActionManager *)&v16 shouldEnableActionType:a3 onAsset:v8 inAssetCollection:v9];
    }
    BOOL v14 = v13;
  }

  return v14;
}

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (-[PUAssetExplorerReviewScreenActionManager _hasReviewScreenActionTypeForAssetActionType:](self, "_hasReviewScreenActionTypeForAssetActionType:", a3)&& ((v10 = -[PUAssetExplorerReviewScreenActionManager _reviewScreenActionTypeForAssetActionType:](self, "_reviewScreenActionTypeForAssetActionType:", a3), unint64_t v11 = v10, v10 - 3 >= 9)&& v10 != 1|| v8)&& (-[PUAssetExplorerReviewScreenActionManager reviewScreenActionManagerDelegate](self, "reviewScreenActionManagerDelegate"), v12 = objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "assetExplorerReviewScreenActionManager:canPerformActionType:onAsset:inAssetCollection:", self,
                v11,
                v8,
                v9),
        v12,
        v13))
  {
    BOOL v14 = [(PUAssetExplorerReviewScreenActionManager *)self _actionPerformerClassForActionType:a3];
    if (v14)
    {
      unsigned __int8 v15 = [(objc_class *)v14 canPerformOnAsset:v8 inAssetCollection:v9];
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
      unsigned __int8 v15 = [(PUAssetActionManager *)&v18 canPerformActionType:a3 onAsset:v8 inAssetCollection:v9];
    }
    BOOL v16 = v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)_reviewScreenActionTypeForAssetActionType:(unint64_t)a3
{
  unint64_t result = 0;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3DuLL:
    case 0x3EuLL:
    case 0x3FuLL:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAssetExplorerReviewScreenActionManager.m", 326, @"Unexpected action type %lu", a3);

      unint64_t result = 0;
      break;
    case 0x2AuLL:
      unint64_t result = 3;
      break;
    case 0x2CuLL:
      unint64_t result = 1;
      break;
    case 0x2DuLL:
      unint64_t result = 2;
      break;
    case 0x2EuLL:
      unint64_t result = 4;
      break;
    case 0x2FuLL:
      unint64_t result = 5;
      break;
    case 0x30uLL:
      unint64_t result = 6;
      break;
    case 0x31uLL:
      unint64_t result = 7;
      break;
    case 0x32uLL:
      unint64_t result = 8;
      break;
    case 0x33uLL:
      unint64_t result = 9;
      break;
    case 0x34uLL:
      unint64_t result = 10;
      break;
    case 0x35uLL:
      unint64_t result = 11;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_hasReviewScreenActionTypeForAssetActionType:(unint64_t)a3
{
  return a3 - 42 < 0xC;
}

- (Class)_actionPerformerClassForActionType:(unint64_t)a3
{
  if (a3 - 42 > 0xB)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (PUAssetExplorerReviewScreenActionManager)initWithSourceType:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUAssetExplorerReviewScreenActionManager;
  uint64_t v4 = [(PUAssetExplorerReviewScreenActionManager *)&v11 init];
  if (v4)
  {
    uint64_t v5 = [[PUUUIDSelectionManager alloc] initWithSelectedUUIDs:0];
    selectionManager = v4->_selectionManager;
    v4->_selectionManager = v5;

    id v7 = [[PUUUIDSelectionManager alloc] initWithSelectedUUIDs:0];
    disableLivePhotosSelectionManager = v4->_disableLivePhotosSelectionManager;
    v4->_disableLivePhotosSelectionManager = v7;

    v4->__sourceType = a3;
    id v9 = v4;
  }

  return v4;
}

@end