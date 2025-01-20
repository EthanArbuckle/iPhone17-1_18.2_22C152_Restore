@interface PLUnmanagedAdjustment
+ (BOOL)_assetAdjustmentsHasValidDataType:(id)a3;
+ (id)_convertRedEyeCorrection:(id)a3 withOrientation:(int64_t)a4;
+ (id)_convertRedEyeCorrections:(id)a3 withOrientation:(int64_t)a4;
+ (id)addUnmanagedAdjustmentFromXMPDataIfNeededForAsset:(id)a3;
+ (id)copyUnmanagedAdjustmentFromSourceAsset:(id)a3 forPlaceholderAsset:(id)a4 inLibrary:(id)a5 error:(id *)a6;
+ (id)entityName;
- (BOOL)isSyncableChange;
- (BOOL)supportsCloudUpload;
- (BOOL)updateRenderTypeFlagsForAssetAdjustments:(id)a3 checkFlag:(unsigned __int16)a4 settingPayload:(id)a5;
- (id)_adjustmentEnvelopeFromAssetAdjustments:(id)a3 error:(id *)a4;
- (id)_deserializeAdjustmentEnvelopeIfNeededFromAssetAdjustments:(id)a3 adjustmentEnvelope:(id *)a4 error:(id *)a5;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (unsigned)_cameraAutoRenderTypeFromAssetAdjustments:(id)a3 adjustmentEnvelope:(id *)a4;
- (unsigned)_processEnabledAdjustmentFromAssetAdjustments:(id)a3 identifier:(id)a4 adjustmentEnvelope:(id *)a5 processingBlock:(id)a6;
- (unsigned)_styleCastRenderTypeFromAssetAdjustments:(id)a3 settingPayload:(id)a4 adjustmentEnvelope:(id *)a5;
- (void)awakeFromInsert;
- (void)willSave;
@end

@implementation PLUnmanagedAdjustment

- (void)willSave
{
  v11.receiver = self;
  v11.super_class = (Class)PLUnmanagedAdjustment;
  [(PLManagedObject *)&v11 willSave];
  v3 = [(PLUnmanagedAdjustment *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([(PLUnmanagedAdjustment *)self isDeleted] & 1) == 0)
  {
    v4 = [(PLUnmanagedAdjustment *)self changedValues];
    v5 = [v4 objectForKeyedSubscript:@"adjustmentTimestamp"];

    if (v5)
    {
      v6 = [(PLUnmanagedAdjustment *)self assetAttributes];
      v7 = [v6 asset];

      if (v7 && ([v7 isDeleted] & 1) == 0)
      {
        v8 = [(PLUnmanagedAdjustment *)self adjustmentTimestamp];
        v9 = [v7 adjustmentTimestamp];
        [v9 timeIntervalSinceDate:v8];
        if (!v9 || fabs(v10) > 2.22044605e-16) {
          [v7 setAdjustmentTimestamp:v8];
        }
      }
    }
  }
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLUnmanagedAdjustment;
  [(PLUnmanagedAdjustment *)&v4 awakeFromInsert];
  v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLUnmanagedAdjustment *)self setUuid:v3];
}

- (BOOL)isSyncableChange
{
  v3 = [(PLUnmanagedAdjustment *)self assetAttributes];
  objc_super v4 = [v3 asset];
  int v5 = [v4 isPlaceholderAsset];

  if (!v5) {
    return 1;
  }
  v6 = [(PLUnmanagedAdjustment *)self assetAttributes];
  v7 = [v6 asset];
  BOOL v8 = +[PLManagedAsset validMomentShareForPlaceholderAsset:v7];

  return v8;
}

- (BOOL)supportsCloudUpload
{
  v2 = [(PLUnmanagedAdjustment *)self assetAttributes];
  char v3 = [v2 supportsCloudUpload];

  return v3;
}

- (id)_adjustmentEnvelopeFromAssetAdjustments:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 371, @"Invalid parameter not satisfying: %@", @"adjustments" object file lineNumber description];
  }
  if ([(id)objc_opt_class() _assetAdjustmentsHasValidDataType:v7])
  {
    BOOL v8 = (void *)MEMORY[0x1E4F8DCE0];
    v9 = [v7 adjustmentData];
    double v10 = [v7 editorBundleID];
    objc_super v11 = [v7 adjustmentFormatIdentifier];
    v12 = [v7 adjustmentFormatVersion];
    id v22 = 0;
    v13 = [v8 deserialize:v9 originator:v10 format:v11 formatVersion:v12 error:&v22];
    id v14 = v22;

    id v15 = v14;
    if (v13) {
      goto LABEL_9;
    }
    if (a4) {
      goto LABEL_6;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Failed to deserialize adjustment data envelope (adjustmentData is not an NSData subclass)";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v19 = [v16 errorWithDomain:v17 code:47016 userInfo:v18];

    id v15 = v19;
    if (a4)
    {
LABEL_6:
      id v15 = v15;
      v13 = 0;
      *a4 = v15;
      goto LABEL_9;
    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (id)_deserializeAdjustmentEnvelopeIfNeededFromAssetAdjustments:(id)a3 adjustmentEnvelope:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 360, @"Invalid parameter not satisfying: %@", @"adjustments" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 361, @"Invalid parameter not satisfying: %@", @"envelope" object file lineNumber description];

LABEL_3:
  id v10 = *a4;
  if (!v10)
  {
    id v10 = [(PLUnmanagedAdjustment *)self _adjustmentEnvelopeFromAssetAdjustments:v9 error:a5];
    *a4 = v10;
  }

  return v10;
}

- (unsigned)_processEnabledAdjustmentFromAssetAdjustments:(id)a3 identifier:(id)a4 adjustmentEnvelope:(id *)a5 processingBlock:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v42 = (uint64_t (**)(id, void *, uint8_t *, unsigned char *))a6;
  if (v11)
  {
    if (a5) {
      goto LABEL_3;
    }
LABEL_41:
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 319, @"Invalid parameter not satisfying: %@", @"envelope" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_42;
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 318, @"Invalid parameter not satisfying: %@", @"adjustments" object file lineNumber description];

  if (!a5) {
    goto LABEL_41;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_42:
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 320, @"Invalid parameter not satisfying: %@", @"matchingIdentifier" object file lineNumber description];

LABEL_4:
  if (!v42)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 321, @"Invalid parameter not satisfying: %@", @"processingBlock" object file lineNumber description];
  }
  v13 = [v11 adjustmentFormatIdentifier];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F8CE98]];

  if (v14)
  {
    id v48 = 0;
    id v15 = [(PLUnmanagedAdjustment *)self _deserializeAdjustmentEnvelopeIfNeededFromAssetAdjustments:v11 adjustmentEnvelope:a5 error:&v48];
    id v16 = v48;
    uint64_t v17 = v16;
    if (v15)
    {
      id v40 = v16;
      v41 = v15;
      [v15 adjustmentStack];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v39 = long long v47 = 0u;
      v18 = [v39 adjustments];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        unsigned int v21 = 0;
        uint64_t v22 = *(void *)v45;
LABEL_10:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v18);
          }
          v24 = *(void **)(*((void *)&v44 + 1) + 8 * v23);
          v25 = [v24 identifier];
          int v26 = [v25 isEqualToString:v12];

          if (v26)
          {
            if ([v24 enabled])
            {
              buf[0] = 0;
              char v43 = 0;
              int v27 = v42[2](v42, v24, buf, &v43);
              int v28 = buf[0] ? 10 : 0;
              int v29 = v43 ? 11 : v28;
              int v30 = v43 ? 0 : v27;
              v21 |= v30;
              if (v29 != 11 && v29 != 0) {
                break;
              }
            }
          }
          if (v20 == ++v23)
          {
            uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (v20) {
              goto LABEL_10;
            }
            break;
          }
        }
      }
      else
      {
        unsigned int v21 = 0;
      }

      id v15 = v41;
      v32 = v39;
      uint64_t v17 = v40;
    }
    else
    {
      v32 = PLBackendGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = [(PLUnmanagedAdjustment *)self uuid];
        *(_DWORD *)buf = 138543618;
        v50 = v33;
        __int16 v51 = 2112;
        v52 = v17;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data envelope. Adjustment uuid: %{public}@, error: %@", buf, 0x16u);
      }
      unsigned int v21 = 0;
    }
  }
  else
  {
    unsigned int v21 = 0;
  }

  return v21;
}

- (unsigned)_styleCastRenderTypeFromAssetAdjustments:(id)a3 settingPayload:(id)a4 adjustmentEnvelope:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 289, @"Invalid parameter not satisfying: %@", @"adjustments" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 290, @"Invalid parameter not satisfying: %@", @"envelope" object file lineNumber description];

LABEL_3:
  id v11 = [v9 editorBundleID];
  char v12 = [v11 isEqual:@"com.apple.camera"];

  if (v12)
  {
    unsigned int v13 = 0;
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F8CE68];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__PLUnmanagedAdjustment__styleCastRenderTypeFromAssetAdjustments_settingPayload_adjustmentEnvelope___block_invoke;
    v18[3] = &unk_1E586B108;
    v18[4] = self;
    id v19 = v10;
    unsigned int v13 = [(PLUnmanagedAdjustment *)self _processEnabledAdjustmentFromAssetAdjustments:v9 identifier:v14 adjustmentEnvelope:a5 processingBlock:v18];
  }
  return v13;
}

uint64_t __100__PLUnmanagedAdjustment__styleCastRenderTypeFromAssetAdjustments_settingPayload_adjustmentEnvelope___block_invoke(uint64_t a1, void *a2, unsigned char *a3, unsigned char *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  BOOL v8 = [v7 settings];
  objc_opt_class();
  uint64_t v9 = *MEMORY[0x1E4F8D248];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8D248]];
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    unsigned int v13 = [NSNumber numberWithShort:PFAdjustmentStyleCastFromString()];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F8CE70]];

    uint64_t v14 = 0x8000;
    a4 = a3;
  }
  else
  {
    id v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 objectForKeyedSubscript:v9];
      uint64_t v17 = [v8 objectForKeyedSubscript:v9];
      v18 = objc_opt_class();
      id v22 = v18;
      id v19 = [v7 identifier];
      uint64_t v20 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138544130;
      v24 = v16;
      __int16 v25 = 2114;
      int v26 = v18;
      __int16 v27 = 2114;
      int v28 = v19;
      __int16 v29 = 2114;
      int v30 = v20;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to determine name of cast due to invalid cast type: %{public}@ (%{public}@). Expected NSString. IPAPhotoAdjustment identifier: %{public}@ Adjustment uuid: %{public}@", buf, 0x2Au);
    }
    uint64_t v14 = 0;
  }
  *a4 = 1;

  return v14;
}

- (unsigned)_cameraAutoRenderTypeFromAssetAdjustments:(id)a3 adjustmentEnvelope:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 254, @"Invalid parameter not satisfying: %@", @"adjustments" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  int v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PLUnmanagedAdjustment.m", 255, @"Invalid parameter not satisfying: %@", @"envelope" object file lineNumber description];

LABEL_3:
  BOOL v8 = [v7 adjustmentFormatIdentifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F8CE98]];

  if (v9)
  {
    id v10 = [v7 editorBundleID];
    int v11 = [v10 isEqual:@"com.apple.camera"];

    if (v11)
    {
      id v27 = 0;
      id v12 = [(PLUnmanagedAdjustment *)self _deserializeAdjustmentEnvelopeIfNeededFromAssetAdjustments:v7 adjustmentEnvelope:a4 error:&v27];
      id v13 = v27;
      if (v12)
      {
        uint64_t v14 = [v12 adjustmentStack];
        id v15 = [v14 versionInfo];
        uint64_t v16 = [v15 appVersion];
        if (v16
          && (uint64_t v17 = (void *)v16,
              [v15 appVersion],
              v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 isEqualToString:&stru_1EEB2EB80],
              v18,
              v17,
              !v19))
        {
          unsigned int v20 = 0;
        }
        else
        {
          unsigned int v20 = 0x2000;
        }
      }
      else
      {
        uint64_t v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [(PLUnmanagedAdjustment *)self uuid];
          *(_DWORD *)buf = 138543618;
          __int16 v29 = v23;
          __int16 v30 = 2112;
          id v31 = v13;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data envelope. Adjustment uuid: %{public}@, error: %@", buf, 0x16u);
        }
        unsigned int v20 = 0;
      }
    }
    else
    {
      unsigned int v20 = 0;
    }
  }
  else
  {
    unsigned int v21 = [v7 adjustmentFormatIdentifier];
    int v22 = [v21 isEqualToString:*MEMORY[0x1E4F8DCB8]];

    if (v22) {
      unsigned int v20 = 0x2000;
    }
    else {
      unsigned int v20 = 0;
    }
  }

  return v20;
}

- (BOOL)updateRenderTypeFlagsForAssetAdjustments:(id)a3 checkFlag:(unsigned __int16)a4 settingPayload:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = 0;
  if (v8 && v6)
  {
    uint64_t v11 = [(PLUnmanagedAdjustment *)self adjustmentRenderTypes];
    uint64_t v12 = v11;
    id v13 = 0;
    if ((v6 & 1) != 0 && (v11 & 0x4000) == 0)
    {
      int v14 = v11 & 0xFFFF9FFF;
      id v26 = 0;
      unsigned int v15 = [(PLUnmanagedAdjustment *)self _cameraAutoRenderTypeFromAssetAdjustments:v8 adjustmentEnvelope:&v26];
      id v13 = v26;
      uint64_t v12 = v14 | v15 | 0x4000;
    }
    if ((v6 & 2) != 0)
    {
      int v16 = v12 & 0xFFFF7FFF;
      id v25 = v13;
      unsigned int v17 = [(PLUnmanagedAdjustment *)self _styleCastRenderTypeFromAssetAdjustments:v8 settingPayload:v9 adjustmentEnvelope:&v25];
      id v18 = v25;

      uint64_t v12 = v17 | v16;
      id v13 = v18;
    }
    if ((v6 & 4) != 0)
    {
      uint64_t v19 = *MEMORY[0x1E4F8CE60];
      id v24 = v13;
      unsigned int v20 = [(PLUnmanagedAdjustment *)self _processEnabledAdjustmentFromAssetAdjustments:v8 identifier:v19 adjustmentEnvelope:&v24 processingBlock:&__block_literal_global_52230];
      id v21 = v24;

      uint64_t v12 = v20 | v12 & 0xFFFEFFFF;
      id v13 = v21;
    }
    int v22 = [(PLUnmanagedAdjustment *)self adjustmentRenderTypes];
    BOOL v10 = v22 != v12;
    if (v22 != v12) {
      [(PLUnmanagedAdjustment *)self setAdjustmentRenderTypes:v12];
    }
  }
  return v10;
}

uint64_t __91__PLUnmanagedAdjustment_updateRenderTypeFlagsForAssetAdjustments_checkFlag_settingPayload___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 1;
  return 0x10000;
}

+ (id)copyUnmanagedAdjustmentFromSourceAsset:(id)a3 forPlaceholderAsset:(id)a4 inLibrary:(id)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 additionalAttributes];
  uint64_t v12 = [v11 unmanagedAdjustment];

  id v13 = [v10 managedObjectContext];

  int v14 = +[PLManagedObject insertInManagedObjectContext:v13];

  unsigned int v15 = [v12 adjustmentBaseImageFormat];
  [v14 setAdjustmentBaseImageFormat:v15];

  int v16 = [v12 adjustmentFormatIdentifier];
  [v14 setAdjustmentFormatIdentifier:v16];

  unsigned int v17 = [v12 adjustmentFormatVersion];
  [v14 setAdjustmentFormatVersion:v17];

  id v18 = [v12 adjustmentTimestamp];
  [v14 setAdjustmentTimestamp:v18];

  uint64_t v19 = [v12 editorLocalizedName];
  [v14 setEditorLocalizedName:v19];

  unsigned int v20 = [v12 otherAdjustmentsFingerprint];
  [v14 setOtherAdjustmentsFingerprint:v20];

  id v21 = [v12 similarToOriginalAdjustmentsFingerprint];
  [v14 setSimilarToOriginalAdjustmentsFingerprint:v21];

  objc_msgSend(v14, "setAdjustmentRenderTypes:", objc_msgSend(v12, "adjustmentRenderTypes"));
  int v22 = [v12 uuid];

  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4F8BA08] UUIDString];
    [v14 setUuid:v23];
  }
  id v24 = (void *)MEMORY[0x1E4F1CB10];
  id v25 = [v8 pathForAdjustmentFile];
  id v26 = [v24 fileURLWithPath:v25];

  id v27 = (void *)MEMORY[0x1E4F1CB10];
  int v28 = [v9 pathForAdjustmentFile];
  __int16 v29 = [v27 fileURLWithPath:v28];

  __int16 v30 = (void *)MEMORY[0x1E4F8B908];
  id v31 = [v29 path];
  uint64_t v32 = [v31 stringByDeletingLastPathComponent];
  id v43 = 0;
  [v30 createDirectoryAtPath:v32 error:&v43];
  id v33 = v43;

  if (!v33)
  {
    id v42 = 0;
    [MEMORY[0x1E4F8B908] copyItemAtURL:v26 toURL:v29 error:&v42];
    v39 = v42;
    v34 = v39;
    if (!v39) {
      goto LABEL_17;
    }
    if (a6) {
      *a6 = v39;
    }
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_17;
    }
    v35 = __CPLAssetsdOSLogDomain();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    long long v45 = v34;
    v36 = "Failed to copy adjustment file for adjusted source asset: %@";
    v37 = v35;
    uint32_t v38 = 12;
LABEL_15:
    _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
LABEL_16:

    goto LABEL_17;
  }
  if (a6) {
    *a6 = v33;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    v34 = __CPLAssetsdOSLogDomain();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_18;
    }
    v35 = [v9 uuid];
    *(_DWORD *)buf = 138412546;
    long long v45 = v35;
    __int16 v46 = 2112;
    id v47 = v33;
    v36 = "Failed to create adjustment directory for placeholder asset %@: %@";
    v37 = v34;
    uint32_t v38 = 22;
    goto LABEL_15;
  }
LABEL_18:

  return v14;
}

+ (id)_convertRedEyeCorrection:(id)a3 withOrientation:(int64_t)a4
{
  int v5 = (void *)[a3 mutableCopy];
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"pointX", @"pointY");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"snappedX", @"snappedY");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"bitmaskX", @"bitmaskY");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"cornealReflectionX", @"cornealReflectionY");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"repairRectangleMaximumX", @"repairRectangleMaximumY");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"repairRectangleMinimumX", @"repairRectangleMinimumY");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"searchRectangleMaximumX", @"searchRectangleMaximumY");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, @"searchRectangleMinimumX", @"searchRectangleMinimumY");
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", @"repairRectangleMinimumX", @"repairRectangleMaximumX");
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", @"searchRectangleMinimumX", @"searchRectangleMaximumX");
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", @"repairRectangleMaximumY", @"repairRectangleMinimumY");
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", @"searchRectangleMaximumY", @"searchRectangleMinimumY");
  int v6 = (void *)[v5 copy];

  return v6;
}

+ (id)_convertRedEyeCorrections:(id)a3 withOrientation:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(a1, "_convertRedEyeCorrection:withOrientation:", *(void *)(*((void *)&v16 + 1) + 8 * i), a4, (void)v16);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  int v14 = (void *)[v7 copy];
  return v14;
}

+ (BOOL)_assetAdjustmentsHasValidDataType:(id)a3
{
  char v3 = [a3 adjustmentData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)addUnmanagedAdjustmentFromXMPDataIfNeededForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 orientation];
  if (v4 != [v3 originalOrientation]) {
    [v3 setOriginalOrientation:v4];
  }

  return 0;
}

+ (id)entityName
{
  return @"UnmanagedAdjustment";
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  int v5 = [(PLUnmanagedAdjustment *)self assetAttributes];
  id v6 = [v5 asset];
  if ([v6 isValidForJournalPersistence]) {
    id v7 = [[PLAssetJournalEntryPayload alloc] initWithUnmanagedAdjustment:self changedKeys:v4];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)payloadID
{
  v2 = [(PLUnmanagedAdjustment *)self assetAttributes];
  id v3 = [v2 asset];
  id v4 = [v3 uuid];
  int v5 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v4];

  return v5;
}

@end