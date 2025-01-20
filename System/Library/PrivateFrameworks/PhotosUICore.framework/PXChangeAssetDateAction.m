@interface PXChangeAssetDateAction
- (NSDate)changeDate;
- (NSDictionary)originalDateByLocalIdentifier;
- (NSDictionary)originalTimeZoneByLocalIdentifier;
- (NSTimeZone)timeZone;
- (PXChangeAssetDateAction)initWithAssets:(id)a3 date:(id)a4 timeZone:(id)a5;
- (PXChangeAssetDateAction)initWithAssets:(id)a3 dateOffset:(double)a4 timeZone:(id)a5;
- (double)dateOffset;
- (id)_timeZoneForAsset:(id)a3;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)_setDate:(id)a3 timeZone:(id)a4 forAsset:(id)a5;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setOriginalDateByLocalIdentifier:(id)a3;
- (void)setOriginalTimeZoneByLocalIdentifier:(id)a3;
@end

@implementation PXChangeAssetDateAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalTimeZoneByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_originalDateByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_changeDate, 0);
}

- (void)setOriginalTimeZoneByLocalIdentifier:(id)a3
{
}

- (NSDictionary)originalTimeZoneByLocalIdentifier
{
  return self->_originalTimeZoneByLocalIdentifier;
}

- (void)setOriginalDateByLocalIdentifier:(id)a3
{
}

- (NSDictionary)originalDateByLocalIdentifier
{
  return self->_originalDateByLocalIdentifier;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (double)dateOffset
{
  return self->_dateOffset;
}

- (NSDate)changeDate
{
  return self->_changeDate;
}

- (void)_setDate:(id)a3 timeZone:(id)a4 forAsset:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v8];
  v10 = v9;
  if (v11)
  {
    objc_msgSend(v9, "setCreationDate:");
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v11 = [v8 creationDate];
  if (v7) {
LABEL_3:
  }
    [v10 setTimeZone:v7 withDate:v11];
LABEL_4:
}

- (id)_timeZoneForAsset:(id)a3
{
  id v3 = a3;
  [v3 fetchPropertySetsIfNeeded];
  v4 = [v3 originalMetadataProperties];

  v5 = [v4 timeZone];

  return v5;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXChangeAssetDateAction *)self originalDateByLocalIdentifier];
  v6 = [(PXChangeAssetDateAction *)self originalTimeZoneByLocalIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PXChangeAssetDateAction_performUndo___block_invoke;
  v9[3] = &unk_1E5DD0F30;
  v9[4] = self;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [(PXPhotosAction *)self performChanges:v9 completionHandler:v4];
}

uint64_t __39__PXChangeAssetDateAction_performUndo___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(a1[4], "assets", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [v7 localIdentifier];
        v9 = [a1[5] objectForKeyedSubscript:v8];
        id v10 = [a1[6] objectForKeyedSubscript:v8];
        [a1[4] _setDate:v9 timeZone:v10 forAsset:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  [a1[4] setOriginalDateByLocalIdentifier:0];
  return [a1[4] setOriginalTimeZoneByLocalIdentifier:0];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXAssetsAction *)self assets];
  uint64_t v6 = [v5 count];
  id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
  id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__PXChangeAssetDateAction_performAction___block_invoke;
  v12[3] = &unk_1E5DCAEC8;
  id v13 = v5;
  id v14 = v7;
  id v15 = v8;
  v16 = self;
  id v9 = v8;
  id v10 = v7;
  id v11 = v5;
  [(PXPhotosAction *)self performChanges:v12 completionHandler:v4];
}

uint64_t __41__PXChangeAssetDateAction_performAction___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a1[4];
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v7 = [v6 localIdentifier];
        id v8 = [v6 creationDate];
        [a1[5] setObject:v8 forKeyedSubscript:v7];
        id v9 = [a1[7] _timeZoneForAsset:v6];
        [a1[6] setObject:v9 forKeyedSubscript:v7];

        id v10 = [a1[7] changeDate];
        id v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          [a1[7] dateOffset];
          objc_msgSend(v8, "dateByAddingTimeInterval:");
          id v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v13 = v12;

        id v14 = a1[7];
        id v15 = [v14 timeZone];
        [v14 _setDate:v13 timeZone:v15 forAsset:v6];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }

  [a1[7] setOriginalDateByLocalIdentifier:a1[5]];
  return [a1[7] setOriginalTimeZoneByLocalIdentifier:a1[6]];
}

- (id)actionNameLocalizationKey
{
  return @"PXAdjustDateAndTimeActionName";
}

- (id)actionIdentifier
{
  return @"ChangeAssetDate";
}

- (PXChangeAssetDateAction)initWithAssets:(id)a3 dateOffset:(double)a4 timeZone:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXChangeAssetDateAction;
  id v10 = [(PXAssetsAction *)&v13 initWithAssets:a3];
  id v11 = v10;
  if (v10)
  {
    v10->_dateOffset = a4;
    objc_storeStrong((id *)&v10->_timeZone, a5);
  }

  return v11;
}

- (PXChangeAssetDateAction)initWithAssets:(id)a3 date:(id)a4 timeZone:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXChangeAssetDateAction;
  id v11 = [(PXAssetsAction *)&v14 initWithAssets:a3];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_changeDate, a4);
    objc_storeStrong((id *)&v12->_timeZone, a5);
  }

  return v12;
}

@end