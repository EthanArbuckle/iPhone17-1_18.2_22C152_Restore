@interface PUCropPerspectiveAdjustmentsDataSource
- (BOOL)canModifyAdjustmentAtIndexPath:(id)a3;
- (NSMutableArray)adjustmentInfoSections;
- (NSString)lastAdjustmentLocalizedName;
- (PEValuesCalculator)valuesCalculator;
- (PICompositionController)compositionController;
- (PUCropPerspectiveAdjustmentsDataSource)init;
- (PUCropPerspectiveAdjustmentsDataSourceDelegate)delegate;
- (id)_geometryAdjustmentInfos;
- (id)_newAdjustmentInfoWithAdjustmentKey:(id)a3 settingKey:(id)a4 attributeKey:(id)a5;
- (id)_newAdjustmentInfoWithIdentifier:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5 attributeKey:(id)a6;
- (id)infoForItemAtIndexPath:(id)a3;
- (id)renderer;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_createAdjustmentInfos;
- (void)_enableNonAutoAjustments:(BOOL)a3;
- (void)_modifyAdjustmentForInfo:(id)a3;
- (void)_setDefaultsForInfo:(id)a3;
- (void)_updateAdjustmentInfos;
- (void)beginInteractiveChange;
- (void)endInteractiveChange;
- (void)modifyValue:(double)a3 atIndexPath:(id)a4;
- (void)resetInfoAtIndexPath:(id)a3;
- (void)setAdjustmentEnabled:(BOOL)a3 atIndexPath:(id)a4 completionHandler:(id)a5;
- (void)setAdjustmentInfoSections:(id)a3;
- (void)setCompositionController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastAdjustmentLocalizedName:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setValuesCalculator:(id)a3;
- (void)setupWithCompositionController:(id)a3 valuesCalculator:(id)a4;
@end

@implementation PUCropPerspectiveAdjustmentsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdjustmentLocalizedName, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_adjustmentInfoSections, 0);
  objc_storeStrong((id *)&self->_valueScaleForKey, 0);
  objc_storeStrong((id *)&self->_yawAngleInfo, 0);
  objc_storeStrong((id *)&self->_pitchAngleInfo, 0);
  objc_storeStrong((id *)&self->_straightenAngleInfo, 0);
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

- (PUCropPerspectiveAdjustmentsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCropPerspectiveAdjustmentsDataSourceDelegate *)WeakRetained;
}

- (void)setAdjustmentInfoSections:(id)a3
{
}

- (void)resetInfoAtIndexPath:(id)a3
{
  v4 = [(PUCropPerspectiveAdjustmentsDataSource *)self infoForItemAtIndexPath:a3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 settingKey];

    if (v6)
    {
      v7 = [(PUCropPerspectiveAdjustmentsDataSource *)self compositionController];
      v8 = [v5 adjustmentKey];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__PUCropPerspectiveAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke;
      v9[3] = &unk_1E5F2E620;
      id v10 = v5;
      [v7 modifyAdjustmentWithKey:v8 modificationBlock:v9];
    }
  }
}

void __63__PUCropPerspectiveAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEnabled:0];
  v4 = NSNumber;
  [*(id *)(a1 + 32) defaultLevel];
  objc_msgSend(v4, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [*(id *)(a1 + 32) settingKey];
  [v3 setObject:v6 forKeyedSubscript:v5];
}

- (void)modifyValue:(double)a3 atIndexPath:(id)a4
{
  id v8 = a4;
  id v6 = -[PUCropPerspectiveAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:");
  if (([v6 enabled] & 1) == 0) {
    [(PUCropPerspectiveAdjustmentsDataSource *)self setAdjustmentEnabled:1 atIndexPath:v8 completionHandler:0];
  }
  v7 = [v6 settingKey];

  if (v7)
  {
    [v6 setCurrentLevel:a3];
    [(PUCropPerspectiveAdjustmentsDataSource *)self _modifyAdjustmentForInfo:v6];
  }
}

- (void)_modifyAdjustmentForInfo:(id)a3
{
  id v4 = a3;
  v5 = [(PUCropPerspectiveAdjustmentsDataSource *)self delegate];
  [v5 willModifyAdjustment];

  id v6 = [(PUCropPerspectiveAdjustmentsDataSource *)self compositionController];
  v7 = [v4 adjustmentKey];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __67__PUCropPerspectiveAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke;
  v14 = &unk_1E5F2E5F8;
  id v15 = v4;
  v16 = self;
  id v8 = v4;
  [v6 modifyAdjustmentWithKey:v7 modificationBlock:&v11];

  v9 = objc_msgSend(v8, "localizedActionName", v11, v12, v13, v14);
  id v10 = [(PUCropPerspectiveAdjustmentsDataSource *)self delegate];
  [v10 didModifyAdjustmentWithLocalizedName:v9];

  [(PUCropPerspectiveAdjustmentsDataSource *)self setLastAdjustmentLocalizedName:v9];
}

void __67__PUCropPerspectiveAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEnabled:1];
  id v4 = NSNumber;
  [*(id *)(a1 + 32) currentLevel];
  double v6 = v5;
  v7 = *(void **)(*(void *)(a1 + 40) + 40);
  id v8 = [*(id *)(a1 + 32) settingKey];
  v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = objc_msgSend(v4, "numberWithDouble:", v6 * (double)(int)objc_msgSend(v9, "intValue"));
  uint64_t v11 = [*(id *)(a1 + 32) settingKey];
  [v3 setObject:v10 forKeyedSubscript:v11];

  id v12 = [*(id *)(a1 + 40) delegate];
  [v12 adjustmentsDataChanged:*(void *)(a1 + 40)];
}

- (void)setAdjustmentEnabled:(BOOL)a3 atIndexPath:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [(PUCropPerspectiveAdjustmentsDataSource *)self infoForItemAtIndexPath:a4];
  if ([v9 enabled] == v6)
  {
    if (v8)
    {
      id v10 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      uint64_t v11 = __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke;
LABEL_9:
      v10[2] = v11;
      v10[3] = &unk_1E5F2EBA0;
      v10[4] = v8;
      dispatch_async(MEMORY[0x1E4F14428], v10);
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
    [(PUCropPerspectiveAdjustmentsDataSource *)self _modifyAdjustmentForInfo:v9];
    if (v8)
    {
      id v10 = v12;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      uint64_t v11 = __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2;
      goto LABEL_9;
    }
  }
}

uint64_t __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endInteractiveChange
{
  id v4 = [(PUCropPerspectiveAdjustmentsDataSource *)self delegate];
  id v3 = [(PUCropPerspectiveAdjustmentsDataSource *)self lastAdjustmentLocalizedName];
  [v4 didModifyAdjustmentWithLocalizedName:v3];
}

- (void)beginInteractiveChange
{
  id v2 = [(PUCropPerspectiveAdjustmentsDataSource *)self delegate];
  [v2 willModifyAdjustment];
}

- (BOOL)canModifyAdjustmentAtIndexPath:(id)a3
{
  id v3 = [(PUCropPerspectiveAdjustmentsDataSource *)self compositionController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)infoForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  unint64_t v6 = [v4 section];
  v7 = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
  unint64_t v8 = [v7 count];

  if (v6 >= v8) {
    goto LABEL_5;
  }
  unint64_t v9 = [v5 item];
  id v10 = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
  uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  unint64_t v12 = [v11 count];

  if (v9 < v12)
  {
    v13 = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
    v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  }
  else
  {
LABEL_5:
    id v15 = 0;
  }

  return v15;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  double v5 = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
  unint64_t v6 = [v5 count];

  if (a3 < 0 || v6 <= a3) {
    return 0;
  }
  v7 = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
  unint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  int64_t v9 = [v8 count];

  return v9;
}

- (int64_t)numberOfSections
{
  id v2 = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSMutableArray)adjustmentInfoSections
{
  adjustmentInfoSections = self->_adjustmentInfoSections;
  if (!adjustmentInfoSections)
  {
    id v4 = (NSMutableArray *)objc_opt_new();
    double v5 = self->_adjustmentInfoSections;
    self->_adjustmentInfoSections = v4;

    [(PUCropPerspectiveAdjustmentsDataSource *)self _createAdjustmentInfos];
    adjustmentInfoSections = self->_adjustmentInfoSections;
  }
  return adjustmentInfoSections;
}

- (void)_updateAdjustmentInfos
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  int64_t v3 = 0;
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v4;
        double v5 = *(void **)(*((void *)&v35 + 1) + 8 * v4);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v30 = v5;
        uint64_t v6 = [v30 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v32 != v8) {
                objc_enumerationMutation(v30);
              }
              id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v11 = [v10 attributeKey];

              if (v11)
              {
                unint64_t v12 = (void *)MEMORY[0x1E4F8A748];
                v13 = [(PUCropPerspectiveAdjustmentsDataSource *)self compositionController];
                v14 = [v10 adjustmentKey];
                id v15 = [v10 attributeKey];
                v16 = [v12 valueForCompositionController:v13 adjustmentKey:v14 settingKey:v15];

                if (v16)
                {
                  [v16 floatValue];
                  float v18 = v17;
                  valueScaleForKey = self->_valueScaleForKey;
                  v20 = [v10 settingKey];
                  v21 = [(NSMutableDictionary *)valueScaleForKey objectForKeyedSubscript:v20];
                  objc_msgSend(v10, "setCurrentLevel:", (float)(v18 * (float)(int)objc_msgSend(v21, "intValue")));

                  if ([v10 enabled])
                  {
                    BOOL v22 = 1;
                  }
                  else
                  {
                    [v10 currentLevel];
                    double v24 = v23;
                    [v10 defaultLevel];
                    BOOL v22 = v24 != v25;
                  }
                  [v10 setEnabled:v22];
                  int64_t v3 = v16;
                }
                else
                {
                  [v10 defaultLevel];
                  objc_msgSend(v10, "setCurrentLevel:");
                  int64_t v3 = 0;
                }
              }
            }
            uint64_t v7 = [v30 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v28);
  }
}

- (void)_enableNonAutoAjustments:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PUCropPerspectiveAdjustmentsDataSource *)self adjustmentInfoSections];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v17 = *(void *)v23;
    uint64_t v6 = (void *)*MEMORY[0x1E4F8A3F0];
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
              v14 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              id v15 = [v14 identifier];

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

- (id)_geometryAdjustmentInfos
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PULocalizedString(@"PHOTOEDIT_CROP_ADJUSTMENTS");
  uint64_t v4 = *MEMORY[0x1E4F8A418];
  uint64_t v5 = [MEMORY[0x1E4F8A298] angleKey];
  uint64_t v6 = [MEMORY[0x1E4F8A298] angleKey];
  uint64_t v7 = [(PUCropPerspectiveAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v5 attributeKey:v6];
  straightenAngleInfo = self->_straightenAngleInfo;
  self->_straightenAngleInfo = v7;

  valueScaleForKey = self->_valueScaleForKey;
  uint64_t v10 = [(PUAdjustmentInfo *)self->_straightenAngleInfo settingKey];
  [(NSMutableDictionary *)valueScaleForKey setObject:&unk_1F078D0D0 forKeyedSubscript:v10];

  [(PUAdjustmentInfo *)self->_straightenAngleInfo setIconName:@"PUPerspectiveToolRoll"];
  uint64_t v11 = PULocalizedString(@"PHOTOEDIT_CROP_ADJUSTMENTS_STRAIGHTEN");
  [(PUAdjustmentInfo *)self->_straightenAngleInfo setLocalizedName:v11];

  uint64_t v12 = PULocalizedString(@"PHOTOEDIT_CROP_ADJUSTMENTS_STRAIGHTEN_ACTION");
  [(PUAdjustmentInfo *)self->_straightenAngleInfo setLocalizedActionName:v12];

  [(PUAdjustmentInfo *)self->_straightenAngleInfo setLocalizedSectionName:v3];
  v13 = self->_valueScaleForKey;
  v14 = [(PUAdjustmentInfo *)self->_straightenAngleInfo settingKey];
  [(NSMutableDictionary *)v13 setObject:&unk_1F078D0D0 forKeyedSubscript:v14];

  id v15 = [MEMORY[0x1E4F8A298] pitchKey];
  v16 = [MEMORY[0x1E4F8A298] pitchKey];
  uint64_t v17 = [(PUCropPerspectiveAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v15 attributeKey:v16];
  pitchAngleInfo = self->_pitchAngleInfo;
  self->_pitchAngleInfo = v17;

  [(PUAdjustmentInfo *)self->_pitchAngleInfo setIconName:@"PUPerspectiveToolPitch"];
  long long v19 = PULocalizedString(@"PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_VERTICAL");
  [(PUAdjustmentInfo *)self->_pitchAngleInfo setLocalizedName:v19];

  long long v20 = PULocalizedString(@"PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_VERTICAL_ACTION");
  [(PUAdjustmentInfo *)self->_pitchAngleInfo setLocalizedActionName:v20];

  [(PUAdjustmentInfo *)self->_pitchAngleInfo setLocalizedSectionName:v3];
  long long v21 = self->_valueScaleForKey;
  long long v22 = [(PUAdjustmentInfo *)self->_pitchAngleInfo settingKey];
  [(NSMutableDictionary *)v21 setObject:&unk_1F078D0D0 forKeyedSubscript:v22];

  long long v23 = [MEMORY[0x1E4F8A298] yawKey];
  long long v24 = [MEMORY[0x1E4F8A298] yawKey];
  long long v25 = [(PUCropPerspectiveAdjustmentsDataSource *)self _newAdjustmentInfoWithAdjustmentKey:v4 settingKey:v23 attributeKey:v24];
  yawAngleInfo = self->_yawAngleInfo;
  self->_yawAngleInfo = v25;

  [(PUAdjustmentInfo *)self->_yawAngleInfo setIconName:@"PUPerspectiveToolYaw"];
  uint64_t v27 = PULocalizedString(@"PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_HORIZONTAL");
  [(PUAdjustmentInfo *)self->_yawAngleInfo setLocalizedName:v27];

  uint64_t v28 = PULocalizedString(@"PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_HORIZONTAL_ACTION");
  [(PUAdjustmentInfo *)self->_yawAngleInfo setLocalizedActionName:v28];

  [(PUAdjustmentInfo *)self->_yawAngleInfo setLocalizedSectionName:v3];
  uint64_t v29 = self->_valueScaleForKey;
  id v30 = [(PUAdjustmentInfo *)self->_yawAngleInfo settingKey];
  [(NSMutableDictionary *)v29 setObject:&unk_1F078D0D0 forKeyedSubscript:v30];

  long long v33 = *(_OWORD *)&self->_straightenAngleInfo;
  long long v34 = self->_yawAngleInfo;
  long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:3];

  return v31;
}

- (void)_createAdjustmentInfos
{
  adjustmentInfoSections = self->_adjustmentInfoSections;
  id v3 = [(PUCropPerspectiveAdjustmentsDataSource *)self _geometryAdjustmentInfos];
  [(NSMutableArray *)adjustmentInfoSections addObject:v3];
}

- (id)_newAdjustmentInfoWithAdjustmentKey:(id)a3 settingKey:(id)a4 attributeKey:(id)a5
{
  return [(PUCropPerspectiveAdjustmentsDataSource *)self _newAdjustmentInfoWithIdentifier:a3 adjustmentKey:a3 settingKey:a4 attributeKey:a5];
}

- (id)_newAdjustmentInfoWithIdentifier:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5 attributeKey:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(PUAdjustmentInfo);
  [(PUAdjustmentInfo *)v14 setIdentifier:v13];

  [(PUAdjustmentInfo *)v14 setAdjustmentKey:v12];
  [(PUAdjustmentInfo *)v14 setSettingKey:v11];
  if (v10) {
    id v15 = v10;
  }
  else {
    id v15 = v11;
  }
  [(PUAdjustmentInfo *)v14 setAttributeKey:v15];

  [(PUCropPerspectiveAdjustmentsDataSource *)self _setDefaultsForInfo:v14];
  return v14;
}

- (void)_setDefaultsForInfo:(id)a3
{
  id v21 = a3;
  uint64_t v3 = [v21 attributeKey];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [v21 adjustmentKey];

    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F8A748];
      uint64_t v7 = [v21 adjustmentKey];
      uint64_t v8 = [v21 attributeKey];
      id v9 = [v6 valueForType:2 adjustmentKey:v7 settingKey:v8];
      [v9 floatValue];
      [v21 setMinimumLevel:v10];

      id v11 = (void *)MEMORY[0x1E4F8A748];
      id v12 = [v21 adjustmentKey];
      id v13 = [v21 attributeKey];
      v14 = [v11 valueForType:3 adjustmentKey:v12 settingKey:v13];
      [v14 floatValue];
      [v21 setMaximumLevel:v15];

      v16 = (void *)MEMORY[0x1E4F8A748];
      uint64_t v17 = [v21 adjustmentKey];
      long long v18 = [v21 attributeKey];
      long long v19 = [v16 valueForType:1 adjustmentKey:v17 settingKey:v18];
      [v19 floatValue];
      [v21 setDefaultLevel:v20];

      [v21 defaultLevel];
      objc_msgSend(v21, "setCurrentLevel:");
    }
  }
}

- (id)renderer
{
  uint64_t v3 = [(PUCropPerspectiveAdjustmentsDataSource *)self delegate];
  uint64_t v4 = [v3 adjustmentsRenderer:self];

  return v4;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    uint64_t v5 = PLOrientationBetweenOrientations();
    self->_orientation = a3;
    [(PUAdjustmentInfo *)self->_straightenAngleInfo currentLevel];
    double v7 = v6;
    [(PUAdjustmentInfo *)self->_straightenAngleInfo lastAdjustedLevel];
    double v9 = v8;
    id v47 = [(PUAdjustmentInfo *)self->_straightenAngleInfo settingKey];
    float v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_valueScaleForKey, "objectForKeyedSubscript:");
    int v11 = [v10 intValue];

    [(PUAdjustmentInfo *)self->_yawAngleInfo currentLevel];
    double v13 = v12;
    [(PUAdjustmentInfo *)self->_yawAngleInfo lastAdjustedLevel];
    double v15 = v14;
    v16 = [(PUAdjustmentInfo *)self->_yawAngleInfo settingKey];
    uint64_t v17 = [(PUAdjustmentInfo *)self->_yawAngleInfo attributeKey];
    long long v18 = [(NSMutableDictionary *)self->_valueScaleForKey objectForKeyedSubscript:v16];
    uint64_t v19 = [v18 intValue];

    [(PUAdjustmentInfo *)self->_pitchAngleInfo currentLevel];
    double v21 = v20;
    [(PUAdjustmentInfo *)self->_pitchAngleInfo lastAdjustedLevel];
    double v23 = v22;
    long long v24 = [(PUAdjustmentInfo *)self->_pitchAngleInfo settingKey];
    long long v25 = [(PUAdjustmentInfo *)self->_pitchAngleInfo attributeKey];
    v26 = [(NSMutableDictionary *)self->_valueScaleForKey objectForKeyedSubscript:v24];
    uint64_t v27 = [v26 intValue];

    switch(v5)
    {
      case 2:
        [(PUAdjustmentInfo *)self->_yawAngleInfo setCurrentLevel:-v13];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setLastAdjustedLevel:-v15];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setCurrentLevel:-v7];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setLastAdjustedLevel:-v9];
        uint64_t v28 = [NSNumber numberWithInt:-(int)v19];
        [(NSMutableDictionary *)self->_valueScaleForKey setObject:v28 forKeyedSubscript:v16];

        uint64_t v29 = NSNumber;
        goto LABEL_11;
      case 3:
        [(PUAdjustmentInfo *)self->_yawAngleInfo setCurrentLevel:-v13];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setLastAdjustedLevel:-v15];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setCurrentLevel:-v21];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setLastAdjustedLevel:-v23];
        id v30 = [NSNumber numberWithInt:-(int)v19];
        [(NSMutableDictionary *)self->_valueScaleForKey setObject:v30 forKeyedSubscript:v16];

        long long v31 = [NSNumber numberWithInt:-(int)v27];
        valueScaleForKey = self->_valueScaleForKey;
        long long v33 = v31;
        id v34 = v24;
        goto LABEL_14;
      case 4:
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setCurrentLevel:-v21];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setLastAdjustedLevel:-v23];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setCurrentLevel:-v7];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setLastAdjustedLevel:-v9];
        uint64_t v35 = [NSNumber numberWithInt:-(int)v27];
        long long v36 = self->_valueScaleForKey;
        long long v37 = v35;
        long long v38 = v24;
        goto LABEL_10;
      case 5:
        [(PUAdjustmentInfo *)self->_yawAngleInfo setCurrentLevel:v21];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setLastAdjustedLevel:v23];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setSettingKey:v24];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setAttributeKey:v25];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setCurrentLevel:v13];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setLastAdjustedLevel:v15];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setSettingKey:v16];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setAttributeKey:v17];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setCurrentLevel:-v7];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setLastAdjustedLevel:-v9];
        v39 = [NSNumber numberWithInt:v27];
        [(NSMutableDictionary *)self->_valueScaleForKey setObject:v39 forKeyedSubscript:v24];

        v40 = NSNumber;
        uint64_t v41 = v19;
        goto LABEL_9;
      case 6:
        [(PUAdjustmentInfo *)self->_yawAngleInfo setCurrentLevel:-v21];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setLastAdjustedLevel:-v23];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setSettingKey:v24];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setAttributeKey:v25];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setCurrentLevel:v13];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setLastAdjustedLevel:v15];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setSettingKey:v16];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setAttributeKey:v17];
        v42 = [NSNumber numberWithInt:-(int)v27];
        [(NSMutableDictionary *)self->_valueScaleForKey setObject:v42 forKeyedSubscript:v24];

        v43 = NSNumber;
        uint64_t v44 = v19;
        goto LABEL_13;
      case 7:
        [(PUAdjustmentInfo *)self->_yawAngleInfo setCurrentLevel:-v21];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setLastAdjustedLevel:-v23];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setSettingKey:v24];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setAttributeKey:v25];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setCurrentLevel:-v13];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setLastAdjustedLevel:-v15];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setSettingKey:v16];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setAttributeKey:v17];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setCurrentLevel:-v7];
        [(PUAdjustmentInfo *)self->_straightenAngleInfo setLastAdjustedLevel:-v9];
        v45 = [NSNumber numberWithInt:-(int)v27];
        [(NSMutableDictionary *)self->_valueScaleForKey setObject:v45 forKeyedSubscript:v24];

        v40 = NSNumber;
        uint64_t v41 = -(int)v19;
LABEL_9:
        uint64_t v35 = [v40 numberWithInt:v41];
        long long v36 = self->_valueScaleForKey;
        long long v37 = v35;
        long long v38 = v16;
LABEL_10:
        [(NSMutableDictionary *)v36 setObject:v37 forKeyedSubscript:v38];

        uint64_t v29 = NSNumber;
LABEL_11:
        long long v31 = [v29 numberWithInt:-v11];
        valueScaleForKey = self->_valueScaleForKey;
        long long v33 = v31;
        id v34 = v47;
        goto LABEL_14;
      case 8:
        [(PUAdjustmentInfo *)self->_yawAngleInfo setCurrentLevel:v21];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setLastAdjustedLevel:v23];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setSettingKey:v24];
        [(PUAdjustmentInfo *)self->_yawAngleInfo setAttributeKey:v25];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setCurrentLevel:-v13];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setLastAdjustedLevel:-v15];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setSettingKey:v16];
        [(PUAdjustmentInfo *)self->_pitchAngleInfo setAttributeKey:v17];
        v46 = [NSNumber numberWithInt:v27];
        [(NSMutableDictionary *)self->_valueScaleForKey setObject:v46 forKeyedSubscript:v24];

        v43 = NSNumber;
        uint64_t v44 = -(int)v19;
LABEL_13:
        long long v31 = [v43 numberWithInt:v44];
        valueScaleForKey = self->_valueScaleForKey;
        long long v33 = v31;
        id v34 = v16;
LABEL_14:
        [(NSMutableDictionary *)valueScaleForKey setObject:v33 forKeyedSubscript:v34];

        break;
      default:
        break;
    }
  }
}

- (void)setupWithCompositionController:(id)a3 valuesCalculator:(id)a4
{
  double v9 = (PICompositionController *)a3;
  double v7 = (PEValuesCalculator *)a4;
  if (self->_compositionController == v9)
  {
    p_valuesCalculator = &self->_valuesCalculator;
    if (self->_valuesCalculator == v7) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_compositionController, a3);
    p_valuesCalculator = &self->_valuesCalculator;
    if (self->_valuesCalculator == v7) {
      goto LABEL_6;
    }
  }
  objc_storeStrong((id *)p_valuesCalculator, a4);
LABEL_6:
  [(PUCropPerspectiveAdjustmentsDataSource *)self _enableNonAutoAjustments:1];
  [(PUCropPerspectiveAdjustmentsDataSource *)self _updateAdjustmentInfos];
LABEL_7:
}

- (PUCropPerspectiveAdjustmentsDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveAdjustmentsDataSource;
  id v2 = [(PUCropPerspectiveAdjustmentsDataSource *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_orientation = 1;
    uint64_t v4 = objc_opt_new();
    valueScaleForKey = v3->_valueScaleForKey;
    v3->_valueScaleForKey = (NSMutableDictionary *)v4;
  }
  return v3;
}

@end