@interface PUAdjustmentsDataSource
- (BOOL)canModifyAdjustmentAtIndexPath:(id)a3;
- (NSMutableArray)adjustmentInfoSections;
- (NSString)lastAdjustmentLocalizedName;
- (PEAutoAdjustmentController)autoEnhanceController;
- (PEValuesCalculator)valuesCalculator;
- (PICompositionController)compositionController;
- (PUAdjustmentsDataSourceDelegate)delegate;
- (id)_autoEnhanceAdjustmentInfo;
- (id)_colorAdjustmentInfos;
- (id)_debugAdjustmentInfos;
- (id)_detailAdjustmentInfos;
- (id)_headroomAdjustmentInfos;
- (id)_lightAdjustmentInfos;
- (id)_newAdjustmentInfoWithAdjustmentKey:(id)a3 settingKey:(id)a4 attributeKey:(id)a5;
- (id)_newAdjustmentInfoWithIdentifier:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5 attributeKey:(id)a6;
- (id)_smartBlackAndWhiteAdjustmentInfos;
- (id)_vignetteAdjustmentInfos;
- (id)infoForItemAtIndexPath:(id)a3;
- (id)renderer;
- (int64_t)numberOfItemsInAllSections;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)assetType;
- (void)_createAdjustmentInfos;
- (void)_enableNonAutoAdjustments:(BOOL)a3;
- (void)_modifyAdjustmentForInfo:(id)a3;
- (void)_resetEnabledStateForAutoEnhancedInfos;
- (void)_setDefaultsForInfo:(id)a3;
- (void)_updateAdjustmentInfos;
- (void)beginInteractiveChange;
- (void)compositionControllerDidChange;
- (void)endInteractiveChange;
- (void)modifyValue:(double)a3 atIndexPath:(id)a4;
- (void)resetInfoAtIndexPath:(id)a3;
- (void)setAdjustmentEnabled:(BOOL)a3 atIndexPath:(id)a4 completionHandler:(id)a5;
- (void)setAdjustmentInfoSections:(id)a3;
- (void)setAssetType:(unint64_t)a3;
- (void)setAutoEnhanceController:(id)a3;
- (void)setCompositionController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastAdjustmentLocalizedName:(id)a3;
- (void)setValuesCalculator:(id)a3;
- (void)setupWithCompositionController:(id)a3 valuesCalculator:(id)a4 autoAdjustmentController:(id)a5 assetType:(unint64_t)a6;
@end

@implementation PUAdjustmentsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdjustmentLocalizedName, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_autoEnhanceController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_adjustmentInfoSections, 0);
}

- (void)setAssetType:(unint64_t)a3
{
  self->_assetType = a3;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void)setLastAdjustmentLocalizedName:(id)a3
{
}

- (NSString)lastAdjustmentLocalizedName
{
  return self->_lastAdjustmentLocalizedName;
}

- (void)setValuesCalculator:(id)a3
{
}

- (PEValuesCalculator)valuesCalculator
{
  return self->_valuesCalculator;
}

- (void)setAutoEnhanceController:(id)a3
{
}

- (PEAutoAdjustmentController)autoEnhanceController
{
  return self->_autoEnhanceController;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setDelegate:(id)a3
{
}

- (PUAdjustmentsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAdjustmentsDataSourceDelegate *)WeakRetained;
}

- (void)setAdjustmentInfoSections:(id)a3
{
}

- (void)compositionControllerDidChange
{
  [(PUAdjustmentsDataSource *)self _updateAdjustmentInfos];
  id v3 = [(PUAdjustmentsDataSource *)self delegate];
  [v3 adjustmentsDataChanged:self];
}

- (void)_resetEnabledStateForAutoEnhancedInfos
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUAdjustmentsDataSource *)self compositionController];
  v4 = [v3 whiteBalanceAdjustmentController];
  uint64_t v5 = [v4 warmFace];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v39;
    v6 = (void *)*MEMORY[0x1E4F8A598];
    v7 = (void *)*MEMORY[0x1E4F8A590];
    v32 = (void *)*MEMORY[0x1E4F8A598];
    v33 = (void *)*MEMORY[0x1E4F8A5B8];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v8;
        v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v35 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              uint64_t v16 = [v15 identifier];
              v17 = v6;
              if ((void *)v16 == v6) {
                goto LABEL_18;
              }
              v18 = (void *)v16;
              v19 = [v15 identifier];
              if (v19 == v7)
              {

                v17 = v18;
LABEL_18:

LABEL_19:
                [v15 setEnabled:1];
                continue;
              }
              v20 = v19;
              if (v5)
              {
                [v15 identifier];
                uint64_t v21 = v12;
                uint64_t v22 = v13;
                v23 = v7;
                id v24 = v10;
                v26 = uint64_t v25 = v5;

                BOOL v27 = v26 == v33;
                uint64_t v5 = v25;
                id v10 = v24;
                v7 = v23;
                uint64_t v13 = v22;
                uint64_t v12 = v21;
                v6 = v32;
                if (v27) {
                  goto LABEL_19;
                }
              }
              else
              {
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v30);
  }
}

- (void)resetInfoAtIndexPath:(id)a3
{
  v4 = [(PUAdjustmentsDataSource *)self infoForItemAtIndexPath:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = [v4 settingKey];

    if (v6)
    {
      v7 = [(PUAdjustmentsDataSource *)self compositionController];
      uint64_t v8 = [v5 adjustmentKey];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __48__PUAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke;
      v9[3] = &unk_1E5F2E620;
      id v10 = v5;
      [v7 modifyAdjustmentWithKey:v8 modificationBlock:v9];
    }
  }
}

void __48__PUAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEnabled:0];
  v4 = NSNumber;
  [*(id *)(a1 + 32) defaultLevel];
  objc_msgSend(v4, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [*(id *)(a1 + 32) settingKey];
  [v3 setObject:v6 forKeyedSubscript:v5];
}

- (void)modifyValue:(double)a3 atIndexPath:(id)a4
{
  id v12 = a4;
  id v6 = -[PUAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:");
  if (([v6 enabled] & 1) == 0) {
    [(PUAdjustmentsDataSource *)self setAdjustmentEnabled:1 atIndexPath:v12 completionHandler:0];
  }
  v7 = [v6 settingKey];

  if (v7)
  {
    uint64_t v8 = [v6 customSettingDelegate];

    if (v8
      && ([v6 customSettingDelegate],
          v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      uint64_t v11 = [v6 customSettingDelegate];
      [v11 dataSource:self adjustmentInfo:v6 modifyValue:a3];
    }
    else
    {
      [v6 setCurrentLevel:a3];
      [(PUAdjustmentsDataSource *)self _modifyAdjustmentForInfo:v6];
    }
  }
}

- (void)_modifyAdjustmentForInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUAdjustmentsDataSource *)self compositionController];
  id v6 = [v4 adjustmentKey];
  v7 = [v5 adjustmentControllerForKey:v6];
  BOOL v8 = v7 != 0;

  v9 = [(PUAdjustmentsDataSource *)self delegate];
  [v9 willModifyAdjustment];

  char v10 = [(PUAdjustmentsDataSource *)self compositionController];
  uint64_t v11 = [v4 adjustmentKey];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__PUAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke;
  v15[3] = &unk_1E5F22ED0;
  BOOL v18 = v8;
  id v16 = v4;
  v17 = self;
  id v12 = v4;
  [v10 modifyAdjustmentWithKey:v11 modificationBlock:v15];

  uint64_t v13 = [v12 localizedActionName];
  v14 = [(PUAdjustmentsDataSource *)self delegate];
  [v14 didModifyAdjustmentWithLocalizedName:v13];

  [(PUAdjustmentsDataSource *)self setLastAdjustmentLocalizedName:v13];
}

void __52__PUAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke(uint64_t a1, void *a2)
{
  id v39 = a2;
  if (!*(unsigned char *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 32) customSettingDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) customSettingDelegate];
      [v5 dataSource:*(void *)(a1 + 40) adjustmentInfo:*(void *)(a1 + 32) populateNewAdjustmentController:v39];
    }
  }
  id v6 = [*(id *)(a1 + 32) identifier];
  v7 = (void *)*MEMORY[0x1E4F8A5B8];

  if (v6 == v7)
  {
    BOOL v8 = (void *)MEMORY[0x1E4F8A3E0];
    uint64_t v9 = *MEMORY[0x1E4F8A5C0];
    id v10 = v39;
    objc_msgSend(v10, "setColorType:", objc_msgSend(v8, "colorTypeForString:", v9));
  }
  [*(id *)(a1 + 32) currentLevel];
  double v12 = v11;
  uint64_t v13 = [*(id *)(a1 + 32) attributeKey];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F8A748];
    v15 = [*(id *)(a1 + 40) compositionController];
    id v16 = [*(id *)(a1 + 32) adjustmentKey];
    v17 = [*(id *)(a1 + 32) attributeKey];
    BOOL v18 = [v14 valueForCompositionController:v15 adjustmentKey:v16 settingKey:v17];

    v19 = (void *)MEMORY[0x1E4F8A748];
    v20 = [*(id *)(a1 + 40) compositionController];
    uint64_t v21 = [*(id *)(a1 + 32) adjustmentKey];
    uint64_t v22 = [*(id *)(a1 + 32) settingKey];
    v23 = [v19 valueForCompositionController:v20 adjustmentKey:v21 settingKey:v22];

    [v18 doubleValue];
    double v25 = v24;
    [v23 doubleValue];
    double v27 = v25 - v26;
    [*(id *)(a1 + 32) currentLevel];
    double v12 = v28 - v27;
  }
  if ([*(id *)(a1 + 32) enabled])
  {
    uint64_t v29 = 1;
  }
  else if ([*(id *)(a1 + 40) numberOfSections] < 1)
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v30 = 0;
    do
    {
      if ([*(id *)(a1 + 40) numberOfItemsInSection:v30] < 1)
      {
        uint64_t v29 = 0;
      }
      else
      {
        uint64_t v31 = 1;
        do
        {
          v32 = *(void **)(a1 + 40);
          v33 = [MEMORY[0x1E4F28D58] indexPathForItem:v31 - 1 inSection:v30];
          long long v34 = [v32 infoForItemAtIndexPath:v33];

          long long v35 = [v34 adjustmentKey];
          long long v36 = [*(id *)(a1 + 32) adjustmentKey];
          if ([v35 isEqualToString:v36]) {
            uint64_t v29 = [v34 enabled];
          }
          else {
            uint64_t v29 = 0;
          }

          if (v31 >= [*(id *)(a1 + 40) numberOfItemsInSection:v30]) {
            break;
          }
          ++v31;
        }
        while ((v29 & 1) == 0);
      }
      ++v30;
    }
    while (v30 < [*(id *)(a1 + 40) numberOfSections] && (v29 & 1) == 0);
  }
  [v39 setEnabled:v29];
  long long v37 = [NSNumber numberWithDouble:v12];
  long long v38 = [*(id *)(a1 + 32) settingKey];
  [v39 setObject:v37 forKeyedSubscript:v38];
}

- (void)setAdjustmentEnabled:(BOOL)a3 atIndexPath:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(PUAdjustmentsDataSource *)self infoForItemAtIndexPath:a4];
  if ([v9 enabled] == v6)
  {
    if (v8)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke;
      v22[3] = &unk_1E5F2EBA0;
      id v10 = &v23;
      id v23 = v8;
      double v11 = MEMORY[0x1E4F14428];
      double v12 = v22;
LABEL_11:
      dispatch_async(v11, v12);
      goto LABEL_12;
    }
  }
  else
  {
    [v9 setEnabled:v6];
    if ([v9 enabled]) {
      [v9 lastAdjustedLevel];
    }
    else {
      [v9 defaultLevel];
    }
    objc_msgSend(v9, "setCurrentLevel:");
    uint64_t v13 = [v9 customSettingDelegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [v9 customSettingDelegate];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2;
      v19[3] = &unk_1E5F2EBC8;
      id v10 = (id *)v20;
      id v16 = v9;
      v20[0] = v16;
      v20[1] = self;
      id v21 = v8;
      [v15 dataSource:self adjustmentInfo:v16 setEnabled:v6 completionHandler:v19];

LABEL_12:
      goto LABEL_13;
    }
    [(PUAdjustmentsDataSource *)self _modifyAdjustmentForInfo:v9];
    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_4;
      block[3] = &unk_1E5F2EBA0;
      id v10 = &v18;
      id v18 = v8;
      double v11 = MEMORY[0x1E4F14428];
      double v12 = block;
      goto LABEL_11;
    }
  }
LABEL_13:
}

uint64_t __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  id v3 = (void *)*MEMORY[0x1E4F8A3F0];

  if (v2 == v3)
  {
    [*(id *)(a1 + 32) currentLevel];
    objc_msgSend(*(id *)(a1 + 32), "setDefaultLevel:");
  }
  char v4 = [*(id *)(a1 + 40) delegate];
  [v4 adjustmentsDataChanged:*(void *)(a1 + 40)];

  uint64_t v5 = *(void **)(a1 + 48);
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_3;
    block[3] = &unk_1E5F2EBA0;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endInteractiveChange
{
  id v4 = [(PUAdjustmentsDataSource *)self delegate];
  id v3 = [(PUAdjustmentsDataSource *)self lastAdjustmentLocalizedName];
  [v4 didModifyAdjustmentWithLocalizedName:v3];
}

- (void)beginInteractiveChange
{
  id v2 = [(PUAdjustmentsDataSource *)self delegate];
  [v2 willModifyAdjustment];
}

- (BOOL)canModifyAdjustmentAtIndexPath:(id)a3
{
  id v4 = [(PUAdjustmentsDataSource *)self compositionController];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(PUAdjustmentsDataSource *)self autoEnhanceController];
  char v6 = [v5 isBusy];

  return v6 ^ 1;
}

- (id)infoForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  unint64_t v6 = [v4 section];
  id v7 = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  unint64_t v8 = [v7 count];

  if (v6 >= v8) {
    goto LABEL_5;
  }
  unint64_t v9 = [v5 item];
  id v10 = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  unint64_t v12 = [v11 count];

  if (v9 < v12)
  {
    uint64_t v13 = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
    char v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  }
  else
  {
LABEL_5:
    v15 = 0;
  }

  return v15;
}

- (int64_t)numberOfItemsInAllSections
{
  if ([(PUAdjustmentsDataSource *)self numberOfSections] < 1) {
    return 0;
  }
  int64_t v3 = 0;
  int64_t v4 = 0;
  do
    v4 += [(PUAdjustmentsDataSource *)self numberOfItemsInSection:v3++];
  while (v3 < [(PUAdjustmentsDataSource *)self numberOfSections]);
  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  uint64_t v5 = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  unint64_t v6 = [v5 count];

  if (a3 < 0 || v6 <= a3) {
    return 0;
  }
  id v7 = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  unint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  int64_t v9 = [v8 count];

  return v9;
}

- (int64_t)numberOfSections
{
  id v2 = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSMutableArray)adjustmentInfoSections
{
  adjustmentInfoSections = self->_adjustmentInfoSections;
  if (!adjustmentInfoSections)
  {
    int64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = self->_adjustmentInfoSections;
    self->_adjustmentInfoSections = v4;

    [(PUAdjustmentsDataSource *)self _createAdjustmentInfos];
    adjustmentInfoSections = self->_adjustmentInfoSections;
  }
  return adjustmentInfoSections;
}

- (void)_updateAdjustmentInfos
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PUAdjustmentsDataSource *)self compositionController];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v26 = self;
  id obj = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v33;
    int64_t v4 = (void *)*MEMORY[0x1E4F8A3F0];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v5;
        unint64_t v6 = *(void **)(*((void *)&v32 + 1) + 8 * v5);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v27 = v6;
        uint64_t v7 = [v27 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v29 != v9) {
                objc_enumerationMutation(v27);
              }
              double v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              unint64_t v12 = [v11 identifier];

              if (v12 == v4)
              {
                objc_msgSend(v11, "setEnabled:", objc_msgSend(MEMORY[0x1E4F91118], "isAutoEnhanceEnabledForCompositionController:", v3));
                uint64_t v13 = [(PUAdjustmentsDataSource *)v26 autoEnhanceController];
                [v13 defaultAutoEnhanceIntensityForCompositionController:v3];
                objc_msgSend(v11, "setDefaultLevel:");
              }
              char v14 = [v11 attributeKey];
              if (!v14)
              {
                char v14 = [v11 settingKey];
                if (!v14) {
                  continue;
                }
              }
              v15 = (void *)MEMORY[0x1E4F8A748];
              id v16 = [v11 adjustmentKey];
              v17 = [v15 valueForCompositionController:v3 adjustmentKey:v16 settingKey:v14];

              if (v17)
              {
                [v17 floatValue];
                [v11 setCurrentLevel:v18];
                if (v12 != v4 && ([v11 enabled] & 1) == 0)
                {
                  [v11 currentLevel];
                  double v20 = v19;
                  [v11 defaultLevel];
                  [v11 setEnabled:v20 != v21];
                }
              }
              else
              {
                [v11 defaultLevel];
                objc_msgSend(v11, "setCurrentLevel:");
              }
            }
            uint64_t v8 = [v27 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v24);
  }
}

- (void)_enableNonAutoAdjustments:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PUAdjustmentsDataSource *)self adjustmentInfoSections];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v17 = *(void *)v23;
    unint64_t v6 = (void *)*MEMORY[0x1E4F8A3F0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              char v14 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              v15 = [v14 identifier];

              if (v15 != v6) {
                [v14 setEnabled:v3];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
}

- (id)_headroomAdjustmentInfos
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = +[PUPhotoEditProtoSettings sharedInstance];
  int v5 = [v4 showHDRHeadroomControl];

  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F8A420];
    uint64_t v7 = [MEMORY[0x1E4F8A2A0] headroomAdjustmentKey];
    id v8 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v6 settingKey:v7 attributeKey:0];

    [v8 setIconName:@"PUExposureAdjustment"];
    [v8 setLocalizedName:@"HDR Highlight Brightness"];
    [v3 addObject:v8];
  }
  return v3;
}

- (id)_debugAdjustmentInfos
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = +[PUPhotoEditProtoSettings sharedInstance];
  int v5 = [v4 showHDRDebugAdjustments];

  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F8A420];
    uint64_t v7 = [MEMORY[0x1E4F8A2A0] inputExposureKey];
    id v8 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v6 settingKey:v7 attributeKey:0];

    [v8 setIconName:@"PUExposureAdjustment"];
    [v8 setLocalizedName:@"Input Exposure"];
    id v9 = [MEMORY[0x1E4F8A2A0] outputExposureKey];
    id v10 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v6 settingKey:v9 attributeKey:0];

    [v10 setIconName:@"PUExposureAdjustment"];
    [v10 setLocalizedName:@"Output Exposure"];
    uint64_t v11 = [MEMORY[0x1E4F8A2A0] falseColorHDRKey];
    id v12 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v6 settingKey:v11 attributeKey:0];

    [v12 setIconName:@"PUSaturationAdjustment"];
    [v12 setLocalizedName:@"False Color HDR"];
    [v12 setIconIsColor:1];
    uint64_t v13 = [MEMORY[0x1E4F8A2A0] inputRAWGamutMapMaxKey];
    id v14 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v6 settingKey:v13 attributeKey:0];

    [v14 setIconName:@"PUExposureAdjustment"];
    [v14 setLocalizedName:@"RAW HDR"];
    [v3 addObject:v8];
    [v3 addObject:v10];
    [v3 addObject:v12];
    if ([(PUAdjustmentsDataSource *)self assetType]) {
      [v3 addObject:v14];
    }
  }
  return v3;
}

- (id)_smartBlackAndWhiteAdjustmentInfos
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = *MEMORY[0x1E4F8A588];
  int v5 = [MEMORY[0x1E4F8A3B0] hueKey];
  id v6 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v5 attributeKey:0];

  [v6 setIconName:@"PUExposureAdjustment"];
  [v6 setLocalizedName:@"SmartBW Hue"];
  uint64_t v7 = [MEMORY[0x1E4F8A3B0] strengthKey];
  id v8 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v7 attributeKey:0];

  [v8 setIconName:@"PUExposureAdjustment"];
  [v8 setLocalizedName:@"SmartBW Strength"];
  id v9 = [MEMORY[0x1E4F8A3B0] neutralKey];
  id v10 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v9 attributeKey:0];

  [v10 setIconName:@"PUExposureAdjustment"];
  [v10 setLocalizedName:@"SmartBW Neutral"];
  uint64_t v11 = [MEMORY[0x1E4F8A3B0] toneKey];
  id v12 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v11 attributeKey:0];

  [v12 setIconName:@"PUExposureAdjustment"];
  [v12 setLocalizedName:@"SmartBW Tone"];
  uint64_t v13 = [MEMORY[0x1E4F8A3B0] grainKey];
  id v14 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v13 attributeKey:0];

  [v14 setIconName:@"PUExposureAdjustment"];
  [v14 setLocalizedName:@"SmartBW Grain"];
  [v3 addObject:v8];
  [v3 addObject:v6];
  [v3 addObject:v10];
  [v3 addObject:v12];
  [v3 addObject:v14];

  return v3;
}

- (id)_vignetteAdjustmentInfos
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  uint64_t v4 = *MEMORY[0x1E4F8A5B0];
  int v5 = [MEMORY[0x1E4F8A3D8] intensityKey];
  id v6 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v5 attributeKey:0];

  [v6 setIconName:@"PUVignetteTransitionAdjustment"];
  uint64_t v7 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_VIGNETTE");
  [v6 setLocalizedName:v7];

  [v6 setCustomSettingDelegate:v3];
  v10[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

- (id)_detailAdjustmentInfos
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_DETAIL");
  uint64_t v4 = *MEMORY[0x1E4F8A578];
  int v5 = [MEMORY[0x1E4F8A3A8] intensityKey];
  id v6 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v5 attributeKey:0];

  [v6 setIconName:@"PUSharpenAdjustment"];
  uint64_t v7 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_DETAIL_SHARPNESS");
  [v6 setLocalizedName:v7];

  [v6 setLocalizedSectionName:v3];
  uint64_t v8 = *MEMORY[0x1E4F8A428];
  id v9 = [MEMORY[0x1E4F8A2A8] intensityKey];
  id v10 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v8 settingKey:v9 attributeKey:0];

  [v10 setIconName:@"PUDefinitionAdjustment"];
  uint64_t v11 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_DETAIL_DEFINITION");
  [v10 setLocalizedName:v11];

  [v10 setLocalizedSectionName:v3];
  if ([(PUAdjustmentsDataSource *)self assetType])
  {
    uint64_t v12 = *MEMORY[0x1E4F8A4E8];
    [MEMORY[0x1E4F8A368] luminanceKey];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F8A4A0];
    [MEMORY[0x1E4F8A2E0] amountKey];
  uint64_t v13 = };
  id v14 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v12 settingKey:v13 attributeKey:0];

  [v14 setIconName:@"PUNoiseReductionAdjustment"];
  v15 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_DETAIL_NOISE_REDUCTION");
  [v14 setLocalizedName:v15];

  [v14 setLocalizedSectionName:v3];
  id v16 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:*MEMORY[0x1E4F8A588] settingKey:0 attributeKey:0];
  [v16 setIconName:@"PUGrainAdjustment"];
  uint64_t v17 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_BLACK_AND_WHITE_GRAIN");
  [v16 setLocalizedName:v17];

  [v16 setLocalizedSectionName:v3];
  v20[0] = v6;
  v20[1] = v10;
  void v20[2] = v14;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

  return v18;
}

- (id)_colorAdjustmentInfos
{
  void v22[4] = *MEMORY[0x1E4F143B8];
  id v3 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_COLOR");
  uint64_t v4 = *MEMORY[0x1E4F8A590];
  int v5 = [MEMORY[0x1E4F8A3B8] offsetSaturationKey];
  id v6 = [MEMORY[0x1E4F8A3B8] attributeVibrancyKey];
  id v7 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v5 attributeKey:v6];

  [v7 setIconName:@"PUSaturationAdjustment"];
  uint64_t v8 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_COLOR_SATURATION");
  [v7 setLocalizedName:v8];

  [v7 setLocalizedSectionName:v3];
  [v7 setIconIsColor:1];
  id v9 = [MEMORY[0x1E4F8A3B8] offsetContrastKey];
  id v10 = [MEMORY[0x1E4F8A3B8] attributeContrastKey];
  id v11 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v9 attributeKey:v10];

  [v11 setIconName:@"PUVibranceAdjustment"];
  uint64_t v12 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_COLOR_VIBRANCY");
  [v11 setLocalizedName:v12];

  [v11 setLocalizedSectionName:v3];
  [v11 setIconIsColor:1];
  uint64_t v13 = *MEMORY[0x1E4F8A5B8];
  id v14 = [MEMORY[0x1E4F8A3E0] warmTempKey];
  id v15 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v13 settingKey:v14 attributeKey:0];

  [v15 setIconName:@"PUTemperatureAdjustment"];
  id v16 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_WHITE_BALANCE_WARMTH");
  [v15 setLocalizedName:v16];

  [v15 setLocalizedSectionName:v3];
  uint64_t v17 = [MEMORY[0x1E4F8A3E0] warmTintKey];
  id v18 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v13 settingKey:v17 attributeKey:0];

  [v18 setIconName:@"PUTintAdjustment"];
  long long v19 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_WHITE_BALANCE_TINT");
  [v18 setLocalizedName:v19];

  [v18 setLocalizedSectionName:v3];
  v22[0] = v7;
  v22[1] = v11;
  v22[2] = v15;
  v22[3] = v18;
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  return v20;
}

- (id)_lightAdjustmentInfos
{
  v44[6] = *MEMORY[0x1E4F143B8];
  id v3 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_LIGHT");
  uint64_t v4 = *MEMORY[0x1E4F8A598];
  int v5 = [MEMORY[0x1E4F8A3C0] offsetExposureKey];
  id v6 = [MEMORY[0x1E4F8A3C0] attributeExposureKey];
  id v7 = self;
  id v8 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v5 attributeKey:v6];

  [v8 setIconName:@"PUExposureAdjustment"];
  id v9 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_EXPOSURE");
  [v8 setLocalizedName:v9];

  id v42 = v8;
  [v8 setLocalizedSectionName:v3];
  id v10 = [MEMORY[0x1E4F8A3C0] offsetHighlightsKey];
  id v11 = [MEMORY[0x1E4F8A3C0] attributeHighlightsKey];
  uint64_t v12 = v7;
  id v13 = [(PUAdjustmentsDataSource *)v7 _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v10 attributeKey:v11];

  [v13 setIconName:@"PUHighlightsAdjustment"];
  [v13 setAltIconName:@"PUShadowsAdjustment"];
  [v13 setAltImageTransformBlock:&__block_literal_global_5447];
  id v14 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_HIGHLIGHTS");
  [v13 setLocalizedName:v14];

  long long v41 = v13;
  [v13 setLocalizedSectionName:v3];
  id v15 = [MEMORY[0x1E4F8A3C0] offsetShadowsKey];
  id v16 = [MEMORY[0x1E4F8A3C0] attributeShadowsKey];
  id v17 = [(PUAdjustmentsDataSource *)v7 _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v15 attributeKey:v16];

  [v17 setIconName:@"PUShadowsAdjustment"];
  [v17 setAltIconName:@"PUHighlightsAdjustment"];
  [v17 setAltImageTransformBlock:&__block_literal_global_62];
  id v18 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_SHADOWS");
  [v17 setLocalizedName:v18];

  [v17 setLocalizedSectionName:v3];
  long long v19 = objc_opt_new();
  [v17 setCustomSettingDelegate:v19];

  long long v20 = [MEMORY[0x1E4F8A3C0] offsetContrastKey];
  long long v21 = [MEMORY[0x1E4F8A3C0] attributeContrastKey];
  id v22 = [(PUAdjustmentsDataSource *)v12 _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v20 attributeKey:v21];

  [v22 setIconName:@"PUContrastAdjustment"];
  long long v23 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_CONTRAST");
  [v22 setLocalizedName:v23];

  [v22 setAltImageTransformBlock:&__block_literal_global_74];
  [v22 setLocalizedSectionName:v3];
  long long v24 = [MEMORY[0x1E4F8A3C0] offsetBrightnessKey];
  long long v25 = [MEMORY[0x1E4F8A3C0] attributeBrightnessKey];
  id v26 = [(PUAdjustmentsDataSource *)v12 _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v24 attributeKey:v25];

  [v26 setIconName:@"PUBrightnessAdjustment"];
  id v27 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_BRIGHTNESS");
  [v26 setLocalizedName:v27];

  [v26 setLocalizedSectionName:v3];
  uint64_t v28 = [MEMORY[0x1E4F8A3C0] offsetBlackKey];
  long long v29 = [MEMORY[0x1E4F8A3C0] attributeBlackPointKey];
  id v30 = [(PUAdjustmentsDataSource *)v12 _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v28 attributeKey:v29];

  [v30 setIconName:@"PUBlackPointAdjustment"];
  long long v31 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_BLACK_POINT");
  [v30 setLocalizedName:v31];

  [v30 setLocalizedSectionName:v3];
  if (([(PUAdjustmentsDataSource *)v12 assetType] & 2) != 0)
  {
    uint64_t v38 = v41;
    long long v37 = v42;
    v44[0] = v42;
    v44[1] = v41;
    v44[2] = v17;
    v44[3] = v22;
    v44[4] = v26;
    v44[5] = v30;
    id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];
  }
  else
  {
    long long v32 = [MEMORY[0x1E4F8A3C0] offsetLocalLightKey];
    long long v33 = [MEMORY[0x1E4F8A3C0] attributeLocalLightKey];
    id v34 = [(PUAdjustmentsDataSource *)v12 _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v32 attributeKey:v33];

    [v34 setIconName:@"PUBrillianceAdjustment"];
    long long v35 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_LOCAL_LIGHT");
    [v34 setLocalizedName:v35];

    [v34 setLocalizedSectionName:v3];
    long long v36 = objc_opt_new();
    [v34 setCustomSettingDelegate:v36];

    uint64_t v38 = v41;
    long long v37 = v42;
    v43[0] = v42;
    v43[1] = v34;
    v43[2] = v41;
    v43[3] = v17;
    v43[4] = v22;
    v43[5] = v26;
    v43[6] = v30;
    id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:7];
  }
  return v39;
}

uint64_t __48__PUAdjustmentsDataSource__lightAdjustmentInfos__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 imageWithHorizontallyFlippedOrientation];
}

uint64_t __48__PUAdjustmentsDataSource__lightAdjustmentInfos__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 imageWithHorizontallyFlippedOrientation];
}

uint64_t __48__PUAdjustmentsDataSource__lightAdjustmentInfos__block_invoke(uint64_t a1, void *a2)
{
  return [a2 imageWithHorizontallyFlippedOrientation];
}

- (id)_autoEnhanceAdjustmentInfo
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F8A3F0];
  uint64_t v4 = *MEMORY[0x1E4F8A598];
  int v5 = [MEMORY[0x1E4F8A3C0] inputLightKey];
  id v6 = [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithIdentifier:v3 adjustmentKey:v4 settingKey:v5 attributeKey:0];

  id v7 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_AUTO");
  [v6 setLocalizedName:v7];

  id v8 = PULocalizedString(@"MENU_ITEM_TITLE_AUTO_ENHANCE");
  [v6 setLocalizedActionName:v8];

  [v6 setIconName:@"PUAutoEnhanceAdjustment"];
  id v9 = objc_opt_new();
  [v9 setDataSource:self];
  [v6 setCustomSettingDelegate:v9];
  v12[0] = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

- (void)_createAdjustmentInfos
{
  adjustmentInfoSections = self->_adjustmentInfoSections;
  uint64_t v4 = [(PUAdjustmentsDataSource *)self _autoEnhanceAdjustmentInfo];
  [(NSMutableArray *)adjustmentInfoSections addObject:v4];

  int v5 = self->_adjustmentInfoSections;
  id v6 = [(PUAdjustmentsDataSource *)self _lightAdjustmentInfos];
  [(NSMutableArray *)v5 addObject:v6];

  id v7 = self->_adjustmentInfoSections;
  id v8 = [(PUAdjustmentsDataSource *)self _colorAdjustmentInfos];
  [(NSMutableArray *)v7 addObject:v8];

  id v9 = self->_adjustmentInfoSections;
  id v10 = [(PUAdjustmentsDataSource *)self _detailAdjustmentInfos];
  [(NSMutableArray *)v9 addObject:v10];

  id v11 = self->_adjustmentInfoSections;
  uint64_t v12 = [(PUAdjustmentsDataSource *)self _vignetteAdjustmentInfos];
  [(NSMutableArray *)v11 addObject:v12];

  id v13 = +[PUPhotoEditProtoSettings sharedInstance];
  LODWORD(v12) = [v13 showSmartBlackAndWhiteAdjustment];

  if (v12)
  {
    id v14 = self->_adjustmentInfoSections;
    id v15 = [(PUAdjustmentsDataSource *)self _smartBlackAndWhiteAdjustmentInfos];
    [(NSMutableArray *)v14 addObject:v15];
  }
  id v16 = self->_adjustmentInfoSections;
  id v17 = [(PUAdjustmentsDataSource *)self _debugAdjustmentInfos];
  [(NSMutableArray *)v16 addObject:v17];

  id v18 = self->_adjustmentInfoSections;
  id v19 = [(PUAdjustmentsDataSource *)self _headroomAdjustmentInfos];
  [(NSMutableArray *)v18 addObject:v19];
}

- (id)_newAdjustmentInfoWithAdjustmentKey:(id)a3 settingKey:(id)a4 attributeKey:(id)a5
{
  return [(PUAdjustmentsDataSource *)self _newAdjustmentInfoWithIdentifier:a3 adjustmentKey:a3 settingKey:a4 attributeKey:a5];
}

- (id)_newAdjustmentInfoWithIdentifier:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5 attributeKey:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(PUAdjustmentInfo);
  [(PUAdjustmentInfo *)v14 setIdentifier:v13];

  [(PUAdjustmentInfo *)v14 setAdjustmentKey:v12];
  [(PUAdjustmentInfo *)v14 setSettingKey:v11];

  [(PUAdjustmentInfo *)v14 setAttributeKey:v10];
  [(PUAdjustmentsDataSource *)self _setDefaultsForInfo:v14];
  return v14;
}

- (void)_setDefaultsForInfo:(id)a3
{
  id v18 = a3;
  uint64_t v3 = [v18 attributeKey];
  if (v3 || ([v18 settingKey], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v4 = [v18 adjustmentKey];

    if (v4)
    {
      int v5 = (void *)MEMORY[0x1E4F8A748];
      id v6 = [v18 adjustmentKey];
      id v7 = [v5 valueForType:2 adjustmentKey:v6 settingKey:v3];
      [v7 floatValue];
      [v18 setMinimumLevel:v8];

      id v9 = (void *)MEMORY[0x1E4F8A748];
      id v10 = [v18 adjustmentKey];
      id v11 = [v9 valueForType:3 adjustmentKey:v10 settingKey:v3];
      [v11 floatValue];
      [v18 setMaximumLevel:v12];

      id v13 = (void *)MEMORY[0x1E4F8A748];
      id v14 = [v18 adjustmentKey];
      id v15 = [v13 valueForType:1 adjustmentKey:v14 settingKey:v3];
      [v15 floatValue];
      double v17 = v16;

      [v18 setIdentityLevel:v17];
      [v18 setDefaultLevel:v17];
      [v18 setCurrentLevel:v17];
      [v18 setLastAdjustedLevel:v17];
    }
  }
}

- (id)renderer
{
  uint64_t v3 = [(PUAdjustmentsDataSource *)self delegate];
  uint64_t v4 = [v3 adjustmentsRenderer:self];

  return v4;
}

- (void)setupWithCompositionController:(id)a3 valuesCalculator:(id)a4 autoAdjustmentController:(id)a5 assetType:(unint64_t)a6
{
  id v15 = (PICompositionController *)a3;
  id v11 = (PEValuesCalculator *)a4;
  id v12 = a5;
  compositionController = self->_compositionController;
  BOOL v14 = compositionController != v15;
  if (compositionController != v15) {
    objc_storeStrong((id *)&self->_compositionController, a3);
  }
  if (self->_valuesCalculator != v11)
  {
    objc_storeStrong((id *)&self->_valuesCalculator, a4);
    BOOL v14 = 1;
  }
  if ([(PUAdjustmentsDataSource *)self assetType] != a6)
  {
    [(PUAdjustmentsDataSource *)self setAssetType:a6];
    objc_storeStrong((id *)&self->_autoEnhanceController, a5);
    goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_autoEnhanceController, a5);
  if (v14)
  {
LABEL_9:
    [(PUAdjustmentsDataSource *)self _enableNonAutoAdjustments:1];
    [(PUAdjustmentsDataSource *)self _updateAdjustmentInfos];
  }
}

@end