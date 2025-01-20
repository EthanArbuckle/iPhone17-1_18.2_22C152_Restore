@interface PUExitEditPerformanceEventBuilder
- (BOOL)isEditingWithRaw;
- (BOOL)isFirstSinceLaunch;
- (PICompositionController)compositionController;
- (PUEditableAsset)asset;
- (double)exitEditDuration;
- (id)buildEvent;
- (int64_t)sessionEndReason;
- (unint64_t)saveActionType;
- (void)setAsset:(id)a3;
- (void)setCompositionController:(id)a3;
- (void)setEditingWithRaw:(BOOL)a3;
- (void)setExitEditDuration:(double)a3;
- (void)setFirstSinceLaunch:(BOOL)a3;
- (void)setSaveActionType:(unint64_t)a3;
- (void)setSessionEndReason:(int64_t)a3;
@end

@implementation PUExitEditPerformanceEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setSaveActionType:(unint64_t)a3
{
  self->_saveActionType = a3;
}

- (unint64_t)saveActionType
{
  return self->_saveActionType;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setExitEditDuration:(double)a3
{
  self->_exitEditDuration = a3;
}

- (double)exitEditDuration
{
  return self->_exitEditDuration;
}

- (void)setSessionEndReason:(int64_t)a3
{
  self->_sessionEndReason = a3;
}

- (int64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (void)setEditingWithRaw:(BOOL)a3
{
  self->_editingWithRaw = a3;
}

- (BOOL)isEditingWithRaw
{
  return self->_editingWithRaw;
}

- (void)setFirstSinceLaunch:(BOOL)a3
{
  self->_firstSinceLaunch = a3;
}

- (BOOL)isFirstSinceLaunch
{
  return self->_firstSinceLaunch;
}

- (void)setAsset:(id)a3
{
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (id)buildEvent
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v76 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [(PUExitEditPerformanceEventBuilder *)self compositionController];
  v4 = [v3 adjustmentConstants];

  v74 = v4;
  v5 = [v4 allAdjustmentTypes];
  v73 = self;
  v6 = [(PUExitEditPerformanceEventBuilder *)self compositionController];
  v7 = (void *)MEMORY[0x1E4F1CA80];
  v8 = [v6 compositionKeys];
  v9 = [v7 setWithArray:v8];

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v10 = [v6 compositionKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v85 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        v16 = [v6 adjustmentControllerForKey:v15];
        if (![v16 canBeEnabled] || objc_msgSend(v16, "enabled")) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v84 objects:v93 count:16];
    }
    while (v12);
  }

  v17 = (void *)[v9 copy];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v5;
  uint64_t v18 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v81 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v80 + 1) + 8 * j);
        v23 = [NSString stringWithFormat:@"adjustment_%@", v22];
        v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "containsObject:", v22));
        [v76 setObject:v24 forKeyedSubscript:v23];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v19);
  }

  v25 = [(PUExitEditPerformanceEventBuilder *)v73 asset];
  [v25 duration];
  double v27 = v26;

  v28 = [(PUExitEditPerformanceEventBuilder *)v73 compositionController];
  v29 = [v28 trimAdjustmentController];

  double Seconds = v27;
  if (v29)
  {
    [v29 endTime];
    [v29 startTime];
    CMTimeSubtract(&time, &lhs, &rhs);
    double Seconds = CMTimeGetSeconds(&time);
  }
  v72 = v29;
  v31 = [(PUExitEditPerformanceEventBuilder *)v73 asset];
  uint64_t v32 = [v31 pixelWidth];
  v33 = [(PUExitEditPerformanceEventBuilder *)v73 asset];
  uint64_t v34 = [v33 pixelHeight] * v32;

  v35 = [(PUExitEditPerformanceEventBuilder *)v73 compositionController];
  v36 = [v35 cropAdjustmentController];

  unint64_t v37 = v34;
  if (v36)
  {
    [v36 cropRect];
    CGRect v97 = CGRectStandardize(v96);
    CGFloat x = v97.origin.x;
    CGFloat y = v97.origin.y;
    CGFloat width = v97.size.width;
    CGFloat height = v97.size.height;
    double v42 = CGRectGetWidth(v97);
    v98.origin.CGFloat x = x;
    v98.origin.CGFloat y = y;
    v98.size.CGFloat width = width;
    v98.size.CGFloat height = height;
    unint64_t v37 = (unint64_t)(v42 * CGRectGetHeight(v98));
  }
  v71 = v36;
  v90[0] = @"assetInputDuration";
  v70 = [NSNumber numberWithDouble:v27];
  v91[0] = v70;
  v90[1] = @"assetInputPixelCount";
  v69 = [NSNumber numberWithUnsignedInteger:v34];
  v91[1] = v69;
  v90[2] = @"assetOutputDuration";
  v68 = [NSNumber numberWithDouble:Seconds];
  v91[2] = v68;
  v90[3] = @"assetOutputPixelCount";
  v67 = [NSNumber numberWithUnsignedInteger:v37];
  v91[3] = v67;
  v90[4] = @"assetSubtypes";
  BOOL v66 = [(PUExitEditPerformanceEventBuilder *)v73 isEditingWithRaw];
  if (v66)
  {
    v43 = @"raw";
  }
  else
  {
    v44 = (void *)MEMORY[0x1E4F38EB8];
    v61 = [(PUExitEditPerformanceEventBuilder *)v73 asset];
    objc_msgSend(v44, "descriptionForMediaSubtypes:", objc_msgSend(v61, "mediaSubtypes"));
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v62 = v43;
  v91[4] = v43;
  v90[5] = @"assetType";
  v45 = (void *)MEMORY[0x1E4F38EB8];
  v65 = [(PUExitEditPerformanceEventBuilder *)v73 asset];
  v64 = objc_msgSend(v45, "descriptionForMediaType:", objc_msgSend(v65, "mediaType"));
  v91[5] = v64;
  v90[6] = @"bundleIdentifier";
  v63 = [MEMORY[0x1E4F28B50] mainBundle];
  v46 = [v63 bundleIdentifier];
  v91[6] = v46;
  v90[7] = @"iCPLEnabled";
  v47 = NSNumber;
  v48 = [(PUExitEditPerformanceEventBuilder *)v73 asset];
  v49 = objc_msgSend(v47, "numberWithBool:", objc_msgSend(v48, "isCloudPhotoLibraryEnabled"));
  v91[7] = v49;
  v90[8] = @"isFirstSinceLaunch";
  v50 = objc_msgSend(NSNumber, "numberWithBool:", -[PUExitEditPerformanceEventBuilder isFirstSinceLaunch](v73, "isFirstSinceLaunch"));
  v91[8] = v50;
  v90[9] = @"reason";
  [(PUExitEditPerformanceEventBuilder *)v73 sessionEndReason];
  v51 = PEPhotoEditSessionEndString();
  v91[9] = v51;
  v90[10] = @"totalDuration";
  v52 = NSNumber;
  [(PUExitEditPerformanceEventBuilder *)v73 exitEditDuration];
  v53 = objc_msgSend(v52, "numberWithDouble:");
  v91[10] = v53;
  v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:11];
  [v76 addEntriesFromDictionary:v54];

  if (!v66)
  {
  }
  v55 = (void *)MEMORY[0x1E4F91110];
  v56 = [(PUExitEditPerformanceEventBuilder *)v73 asset];
  v57 = [v55 semanticStylesIdentifierForItem:v56];

  if (v57 && [v57 length])
  {
    v88 = @"photoedit_asset_semantic_style";
    v89 = v57;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    [v76 addEntriesFromDictionary:v58];
  }
  v59 = (void *)[v76 copy];

  return v59;
}

@end