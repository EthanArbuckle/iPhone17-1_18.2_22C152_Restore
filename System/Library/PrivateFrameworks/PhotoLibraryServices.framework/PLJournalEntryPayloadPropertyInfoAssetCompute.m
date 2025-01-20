@interface PLJournalEntryPayloadPropertyInfoAssetCompute
+ (BOOL)shouldExcludeDetectedFaces;
+ (void)setShouldExcludeDetectedFaces:(BOOL)a3;
- (BOOL)isStillImage;
- (BOOL)shouldApplyWithPayloadProperty:(id)a3 andPayload:(id)a4;
- (BOOL)validForPersistenceWithPayloadProperty:(id)a3 andValue:(id)a4 stop:(BOOL *)a5;
- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAnalysisStage:(signed __int16)a3;
- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAnalysisStage:(signed __int16)a3 versionType:(int64_t)a4;
- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAsset:(id)a3;
- (int64_t)characterRecognitionVersion;
- (int64_t)faceAnalysisVersion;
- (int64_t)mediaAnalysisImageVersion;
- (int64_t)mediaAnalysisVersion;
- (int64_t)sceneAnalysisVersion;
- (int64_t)versionType;
- (int64_t)visualSearchVersion;
- (signed)stage;
@end

@implementation PLJournalEntryPayloadPropertyInfoAssetCompute

- (BOOL)isStillImage
{
  return self->_isStillImage;
}

- (int64_t)visualSearchVersion
{
  return self->_visualSearchVersion;
}

- (int64_t)characterRecognitionVersion
{
  return self->_characterRecognitionVersion;
}

- (int64_t)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (int64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (int64_t)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (int64_t)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (int64_t)versionType
{
  return self->_versionType;
}

- (signed)stage
{
  return self->_stage;
}

- (BOOL)shouldApplyWithPayloadProperty:(id)a3 andPayload:(id)a4
{
  id v6 = a4;
  v7 = [a3 info];
  id v8 = v6;
  if (v7)
  {
    switch([v7 versionType])
    {
      case 1:
        uint64_t v9 = [v8 sceneAnalysisVersion];
        int64_t v10 = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self sceneAnalysisVersion];
        goto LABEL_13;
      case 2:
        uint64_t v9 = [v8 faceAnalysisVersion];
        int64_t v10 = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self faceAnalysisVersion];
        goto LABEL_13;
      case 3:
        v12 = [v8 mediaAnalysisImageVersion];

        if (v12)
        {
          if ([(PLJournalEntryPayloadPropertyInfoAssetCompute *)self isStillImage]
            || (uint64_t v13 = [v8 mediaAnalysisVersion],
                v13 > [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self mediaAnalysisVersion]))
          {
            v14 = [v8 mediaAnalysisImageVersion];
            uint64_t v15 = [v14 integerValue];
            BOOL v11 = v15 > [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self mediaAnalysisImageVersion];
          }
          else
          {
            BOOL v11 = 0;
          }
        }
        else
        {
          uint64_t v9 = [v8 mediaAnalysisVersion];
          int64_t v10 = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self mediaAnalysisVersion];
LABEL_13:
          BOOL v11 = v9 > v10;
        }
        break;
      case 4:
        uint64_t v9 = [v8 characterRecognitionVersion];
        int64_t v10 = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self characterRecognitionVersion];
        goto LABEL_13;
      case 5:
        uint64_t v9 = [v8 visualSearchVersion];
        int64_t v10 = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self visualSearchVersion];
        goto LABEL_13;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)validForPersistenceWithPayloadProperty:(id)a3 andValue:(id)a4 stop:(BOOL *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(id)objc_opt_class() shouldExcludeDetectedFaces]
    && (([v8 isEqualToKey:@"detectedFaces"] & 1) != 0
     || ([v8 isEqualToKey:@"temporalDetectedFaces"] & 1) != 0))
  {
    BOOL v10 = 0;
    goto LABEL_29;
  }
  if ((([v8 isEqualToKey:@"sceneClassifications"] & 1) != 0
     || [v8 isEqualToKey:@"temporalSceneClassifications"])
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v11 = [v9 classificationType];
    int v12 = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self stage];
    BOOL v10 = 0;
    if (v12 > 899)
    {
      if (v12 == 900 || v12 == 950)
      {
        BOOL v13 = (v11 & 0xFFFFFFFD) == 0 || v11 == 3;
        goto LABEL_24;
      }
    }
    else if (v12 == 100 || v12 == 200)
    {
      BOOL v13 = v11 == 0;
LABEL_24:
      BOOL v10 = v13;
    }
  }
  else if ([v8 type] == 1000 && (unint64_t)objc_msgSend(v9, "length") > 0x100000)
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v8 key];
      int v20 = 138543618;
      v21 = v15;
      __int16 v22 = 2048;
      uint64_t v23 = [v9 length];
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "[CCSS] Compute sync payload property value for %{public}@ exceeds size limit, value length: %lu", (uint8_t *)&v20, 0x16u);
    }
    BOOL v10 = 0;
    *a5 = 1;
  }
  else
  {
    v16 = [v8 info];
    if (v16)
    {
      v17 = [v8 info];
      int v18 = [v17 stage];
      BOOL v10 = v18 <= [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self stage];
    }
    else
    {
      BOOL v10 = 1;
    }
  }
LABEL_29:

  return v10;
}

- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAsset:(id)a3
{
  id v4 = a3;
  v5 = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self initWithAnalysisStage:0 versionType:0];
  if (v5)
  {
    id v6 = [v4 additionalAttributes];
    v5->_sceneAnalysisVersion = (int)[v6 sceneAnalysisVersion];

    v7 = [v4 additionalAttributes];
    v5->_faceAnalysisVersion = (int)[v7 faceAnalysisVersion];

    id v8 = [v4 mediaAnalysisAttributes];
    v5->_mediaAnalysisVersion = [v8 mediaAnalysisVersion];

    id v9 = [v4 mediaAnalysisAttributes];
    v5->_mediaAnalysisImageVersion = (int)[v9 mediaAnalysisImageVersion];

    BOOL v10 = [v4 mediaAnalysisAttributes];
    v5->_characterRecognitionVersion = (int)[v10 characterRecognitionVersion];

    int v11 = [v4 mediaAnalysisAttributes];
    v5->_visualSearchVersion = (int)[v11 visualSearchVersion];

    if ([v4 isPhoto]) {
      char v12 = [v4 isPhotoIris] ^ 1;
    }
    else {
      char v12 = 0;
    }
    v5->_isStillImage = v12;
  }

  return v5;
}

- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAnalysisStage:(signed __int16)a3
{
  return [(PLJournalEntryPayloadPropertyInfoAssetCompute *)self initWithAnalysisStage:a3 versionType:0];
}

- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAnalysisStage:(signed __int16)a3 versionType:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PLJournalEntryPayloadPropertyInfoAssetCompute;
  result = [(PLJournalEntryPayloadPropertyInfoAssetCompute *)&v7 init];
  if (result)
  {
    result->_stage = a3;
    result->_versionType = a4;
  }
  return result;
}

+ (void)setShouldExcludeDetectedFaces:(BOOL)a3
{
  if (MEMORY[0x19F38C0C0](a1, a2)) {
    shouldExcludeDetectedFaces = a3;
  }
}

+ (BOOL)shouldExcludeDetectedFaces
{
  if ((MEMORY[0x19F38C0C0](a1, a2) & 1) == 0 && shouldExcludeDetectedFaces_onceToken != -1) {
    dispatch_once(&shouldExcludeDetectedFaces_onceToken, &__block_literal_global_47227);
  }
  return shouldExcludeDetectedFaces;
}

void __75__PLJournalEntryPayloadPropertyInfoAssetCompute_shouldExcludeDetectedFaces__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  shouldExcludeDetectedFaces = [v0 BOOLForKey:@"PLExcludeDetectedFaceFromComputeSyncPayload"];
}

@end