@interface PEEditSessionEventBuilder
+ (id)allowedAdjustmentIdentifiers;
- (BOOL)isFirstSinceLaunch;
- (BOOL)shouldReportAdjustmentIdentifierString:(id)a3;
- (CGSize)quickCropSelectedAspectRatio;
- (NSString)adjustmentIdentifierAndVersion;
- (NUComposition)initialComposition;
- (PEAsset)asset;
- (PICompositionController)compositionController;
- (double)autoCalcDuration;
- (double)editSessionDuration;
- (double)enterEditDuration;
- (double)exitEditDuration;
- (double)resourceCheckingDuration;
- (double)resourceDownloadDuration;
- (double)resourceLoadingDuration;
- (id)buildEvent;
- (int64_t)segmentationCount;
- (int64_t)sessionEndReason;
- (int64_t)sessionEntryPoint;
- (unint64_t)saveActionType;
- (void)setAdjustmentIdentifierAndVersion:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAutoCalcDuration:(double)a3;
- (void)setCompositionController:(id)a3;
- (void)setEditSessionDuration:(double)a3;
- (void)setEnterEditDuration:(double)a3;
- (void)setExitEditDuration:(double)a3;
- (void)setFirstSinceLaunch:(BOOL)a3;
- (void)setInitialComposition:(id)a3;
- (void)setQuickCropSelectedAspectRatio:(CGSize)a3;
- (void)setResourceCheckingDuration:(double)a3;
- (void)setResourceDownloadDuration:(double)a3;
- (void)setResourceLoadingDuration:(double)a3;
- (void)setSaveActionType:(unint64_t)a3;
- (void)setSegmentationCount:(int64_t)a3;
- (void)setSessionEndReason:(int64_t)a3;
- (void)setSessionEntryPoint:(int64_t)a3;
@end

@implementation PEEditSessionEventBuilder

+ (id)allowedAdjustmentIdentifiers
{
  if (allowedAdjustmentIdentifiers_onceToken != -1) {
    dispatch_once(&allowedAdjustmentIdentifiers_onceToken, &__block_literal_global_2703);
  }
  v2 = (void *)allowedAdjustmentIdentifiers_identifiers;
  return v2;
}

void __57__PEEditSessionEventBuilder_allowedAdjustmentIdentifiers__block_invoke()
{
  v0 = (void *)allowedAdjustmentIdentifiers_identifiers;
  allowedAdjustmentIdentifiers_identifiers = (uint64_t)&unk_26C8299D0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_initialComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setSegmentationCount:(int64_t)a3
{
  self->_segmentationCount = a3;
}

- (int64_t)segmentationCount
{
  return self->_segmentationCount;
}

- (void)setAdjustmentIdentifierAndVersion:(id)a3
{
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setInitialComposition:(id)a3
{
}

- (NUComposition)initialComposition
{
  return self->_initialComposition;
}

- (void)setSessionEndReason:(int64_t)a3
{
  self->_sessionEndReason = a3;
}

- (int64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (void)setQuickCropSelectedAspectRatio:(CGSize)a3
{
  self->_quickCropSelectedAspectRatio = a3;
}

- (CGSize)quickCropSelectedAspectRatio
{
  double width = self->_quickCropSelectedAspectRatio.width;
  double height = self->_quickCropSelectedAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSaveActionType:(unint64_t)a3
{
  self->_saveActionType = a3;
}

- (unint64_t)saveActionType
{
  return self->_saveActionType;
}

- (void)setSessionEntryPoint:(int64_t)a3
{
  self->_sessionEntryPoint = a3;
}

- (int64_t)sessionEntryPoint
{
  return self->_sessionEntryPoint;
}

- (void)setEditSessionDuration:(double)a3
{
  self->_editSessionDuration = a3;
}

- (double)editSessionDuration
{
  return self->_editSessionDuration;
}

- (void)setExitEditDuration:(double)a3
{
  self->_exitEditDuration = a3;
}

- (double)exitEditDuration
{
  return self->_exitEditDuration;
}

- (void)setAutoCalcDuration:(double)a3
{
  self->_autoCalcDuration = a3;
}

- (double)autoCalcDuration
{
  return self->_autoCalcDuration;
}

- (void)setResourceLoadingDuration:(double)a3
{
  self->_resourceLoadingDuration = a3;
}

- (double)resourceLoadingDuration
{
  return self->_resourceLoadingDuration;
}

- (void)setResourceDownloadDuration:(double)a3
{
  self->_resourceDownloadDuration = a3;
}

- (double)resourceDownloadDuration
{
  return self->_resourceDownloadDuration;
}

- (void)setResourceCheckingDuration:(double)a3
{
  self->_resourceCheckingDuration = a3;
}

- (double)resourceCheckingDuration
{
  return self->_resourceCheckingDuration;
}

- (void)setEnterEditDuration:(double)a3
{
  self->_enterEditDuration = a3;
}

- (double)enterEditDuration
{
  return self->_enterEditDuration;
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

- (PEAsset)asset
{
  return self->_asset;
}

- (BOOL)shouldReportAdjustmentIdentifierString:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend((id)objc_opt_class(), "allowedAdjustmentIdentifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v3 lowercaseString];
        v10 = [v8 lowercaseString];
        char v11 = [v9 hasPrefix:v10];

        if (v11)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)buildEvent
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(PEEditSessionEventBuilder *)self asset];
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F2F9F8]];
    uint64_t v5 = [(PEEditSessionEventBuilder *)self asset];
    uint64_t v6 = [v5 pixelWidth];
    uint64_t v7 = [v4 pixelHeight] * v6;
  }
  else
  {
    v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_ERROR, "PEEditAnalyticsEventBuilder building payload with nil asset", buf, 2u);
    }

    uint64_t v7 = 0;
  }
  v9 = [(PEEditSessionEventBuilder *)self adjustmentIdentifierAndVersion];

  if (v9)
  {
    v10 = [(PEEditSessionEventBuilder *)self adjustmentIdentifierAndVersion];
    BOOL v11 = [(PEEditSessionEventBuilder *)self shouldReportAdjustmentIdentifierString:v10];

    if (v11)
    {
      v73 = [(PEEditSessionEventBuilder *)self adjustmentIdentifierAndVersion];
      goto LABEL_16;
    }
    long long v14 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [(PEEditSessionEventBuilder *)self adjustmentIdentifierAndVersion];
      *(_DWORD *)buf = 138412546;
      v87 = v15;
      __int16 v88 = 2112;
      v89 = @"ThirdPartyEditPlugin";
      _os_log_impl(&dword_217B65000, v14, OS_LOG_TYPE_DEFAULT, "PEEditAnalyticsEventBuilder - adjustmentIdentifierAndVersion (%@) doesn't seem to be part of our allow-list (1st party bundleIDs only), reporting it as \"%@\"", buf, 0x16u);
    }
    long long v13 = @"ThirdPartyEditPlugin";
  }
  else
  {
    v12 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v12, OS_LOG_TYPE_DEFAULT, "PEEditAnalyticsEventBuilder - nil adjustmentIdentifierAndVersionString", buf, 2u);
    }

    long long v13 = &stru_26C820838;
  }
  v73 = v13;
LABEL_16:
  v84[0] = @"assetInputPixelCount";
  v70 = [NSNumber numberWithUnsignedInteger:v7];
  v85[0] = v70;
  v84[1] = @"bundleIdentifier";
  v69 = [MEMORY[0x263F086E0] mainBundle];
  v68 = [v69 bundleIdentifier];
  v85[1] = v68;
  v84[2] = @"isFirstSinceLaunch";
  v67 = objc_msgSend(NSNumber, "numberWithBool:", -[PEEditSessionEventBuilder isFirstSinceLaunch](self, "isFirstSinceLaunch"));
  v85[2] = v67;
  v84[3] = @"sessionEndReason";
  int64_t v16 = [(PEEditSessionEventBuilder *)self sessionEndReason];
  v71 = v4;
  v72 = v3;
  if ((unint64_t)(v16 - 1) > 4) {
    v17 = @"Saved";
  }
  else {
    v17 = off_2642BF678[v16 - 1];
  }
  v85[3] = v17;
  v84[4] = @"exitEditDuration";
  uint64_t v18 = NSNumber;
  [(PEEditSessionEventBuilder *)self exitEditDuration];
  v66 = objc_msgSend(v18, "numberWithDouble:");
  v85[4] = v66;
  v84[5] = @"editSessionDuration";
  v19 = NSNumber;
  [(PEEditSessionEventBuilder *)self editSessionDuration];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  v85[5] = v20;
  v84[6] = @"resourceLoadingDuration";
  v21 = NSNumber;
  [(PEEditSessionEventBuilder *)self resourceLoadingDuration];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  v85[6] = v22;
  v84[7] = @"resourceDownloadDuration";
  v23 = NSNumber;
  [(PEEditSessionEventBuilder *)self resourceDownloadDuration];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  v85[7] = v24;
  v84[8] = @"resourceCheckingDuration";
  v25 = NSNumber;
  [(PEEditSessionEventBuilder *)self resourceCheckingDuration];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v85[8] = v26;
  v84[9] = @"enterEditDuration";
  v27 = NSNumber;
  [(PEEditSessionEventBuilder *)self enterEditDuration];
  v28 = objc_msgSend(v27, "numberWithDouble:");
  v85[9] = v28;
  v84[10] = @"autoCalcDuration";
  v29 = NSNumber;
  [(PEEditSessionEventBuilder *)self autoCalcDuration];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  v85[10] = v30;
  v85[11] = v73;
  v84[11] = @"adjustmentIdentifierAndVersion";
  v84[12] = @"sessionEntryPoint";
  int64_t v31 = [(PEEditSessionEventBuilder *)self sessionEntryPoint];
  v32 = @"1UPButton";
  if (v31 == 1) {
    v32 = @"1UPQuickCrop";
  }
  if (v31 == 2) {
    v32 = @"Arrowing";
  }
  v85[12] = v32;
  v33 = NSDictionary;
  v34 = v32;
  v35 = [v33 dictionaryWithObjects:v85 forKeys:v84 count:13];

  [v72 addEntriesFromDictionary:v35];
  if (![(PEEditSessionEventBuilder *)self sessionEndReason])
  {
    unint64_t v36 = [(PEEditSessionEventBuilder *)self saveActionType];
    v37 = @"Save";
    if (v36 == 2) {
      v37 = @"SaveAsDuplicate";
    }
    if (v36 == 1) {
      v37 = @"SaveAsNewClip";
    }
    v82 = @"saveActionType";
    v83 = v37;
    v38 = NSDictionary;
    v39 = v37;
    v40 = [v38 dictionaryWithObjects:&v83 forKeys:&v82 count:1];

    [v72 addEntriesFromDictionary:v40];
  }
  if ([(PEEditSessionEventBuilder *)self sessionEntryPoint] == 1)
  {
    [(PEEditSessionEventBuilder *)self quickCropSelectedAspectRatio];
    if (v41 == 0.0
      || ([(PEEditSessionEventBuilder *)self quickCropSelectedAspectRatio], v42 == 0.0))
    {
      [v72 addEntriesFromDictionary:&unk_26C829A10];
    }
    else
    {
      id v58 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v58 setMinimumFractionDigits:1];
      [v58 setMaximumFractionDigits:2];
      v80 = @"quickCropSelectedAspectRatio";
      v59 = NSNumber;
      [(PEEditSessionEventBuilder *)self quickCropSelectedAspectRatio];
      double v61 = v60;
      [(PEEditSessionEventBuilder *)self quickCropSelectedAspectRatio];
      v63 = [v59 numberWithDouble:v61 / v62];
      v64 = [v58 stringFromNumber:v63];
      v81 = v64;
      v65 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      [v72 addEntriesFromDictionary:v65];
    }
  }
  v43 = [(PEEditSessionEventBuilder *)self initialComposition];
  v44 = [(PEEditSessionEventBuilder *)self compositionController];
  v45 = [v44 composition];
  v46 = +[PEAnalyticsUtility diffKeysFromInitialComposition:v43 toFinalComposition:v45];

  [v72 addEntriesFromDictionary:v46];
  if (v71)
  {
    v47 = +[PEAnalyticsUtility semanticStylesIdentifierForItem:v71];
    v48 = v47;
    if (v47 && [v47 length])
    {
      v78 = @"semantic_style";
      v79 = v48;
      v49 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      [v72 addEntriesFromDictionary:v49];
    }
    v50 = +[PEAnalyticsUtility semanticStyleCapturedCastForItem:v71];
    v51 = v50;
    if (v50 && [v50 length])
    {
      v76 = @"captured_style_cast";
      v77 = v51;
      v52 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      [v72 addEntriesFromDictionary:v52];
    }
  }
  if ([(PEEditSessionEventBuilder *)self segmentationCount])
  {
    v74 = @"cleanup_presegmented_count";
    v53 = objc_msgSend(NSNumber, "numberWithInteger:", -[PEEditSessionEventBuilder segmentationCount](self, "segmentationCount"));
    v75 = v53;
    v54 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    [v72 addEntriesFromDictionary:v54];
  }
  v55 = [(PEEditSessionEventBuilder *)self compositionController];
  v56 = +[PEAnalyticsUtility analyticPayloadForCompositionController:v55];

  [v72 addEntriesFromDictionary:v56];
  return v72;
}

@end