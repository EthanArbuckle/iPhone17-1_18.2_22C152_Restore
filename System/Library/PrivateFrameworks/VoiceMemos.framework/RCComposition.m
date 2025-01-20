@interface RCComposition
+ (BOOL)_isSessionWithModificationAccessActiveForComposedAVURL:(id)a3;
+ (BOOL)_markCompositionAVURLsBeingModified:(id)a3;
+ (BOOL)excludeFromBackup:(id)a3 error:(id *)a4;
+ (BOOL)migrateBackupExclusionFlag:(id)a3;
+ (id)_compositionFragmentsFolderForComposedAVURL:(id)a3;
+ (id)_compositionLoadedFromMetadataURL:(id)a3 composedAVURL:(id)a4 savedRecordingUUID:(id)a5 creationDate:(id)a6 createIfNeeded:(BOOL)a7;
+ (id)_compositionLoadedFromMetadataURL:(id)a3 savedRecording:(id)a4;
+ (id)_compositionMetadataURLForCompositionBundleURL:(id)a3;
+ (id)_unitTestingCompositionWithDecomposedFragments:(id)a3;
+ (id)compositionBundleURLForComposedAVURL:(id)a3;
+ (id)compositionLoadedForComposedAVURL:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)compositionLoadedForEditingSavedRecording:(id)a3 error:(id *)a4;
+ (id)compositionLoadedForSavedRecording:(id)a3;
+ (id)compositionLoadedFromCompositionBundleURL:(id)a3;
+ (id)compositionMetadataURLForComposedAVURL:(id)a3;
+ (id)uriRepresentationForLegacyComposedAVURL:(id)a3;
+ (void)deleteFromFilesystem:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)composedTimeRangeForTrackIndex:(unint64_t)a3;
- (BOOL)_enumerateTracksForInsertion:(id)a3 error:(id *)a4;
- (BOOL)cachedComposedAVURLDerivedValuesAreValid;
- (BOOL)cachedHasMultipleTracks;
- (BOOL)composedAssetIsM4a;
- (BOOL)hasMultipleTracks;
- (BOOL)isContentBeingModified;
- (BOOL)rcs_allAssetsAreMissing;
- (BOOL)saveMetadataToDefaultLocation;
- (BOOL)willMigrateFromM4aToQta;
- (NSArray)composedFragments;
- (NSArray)composedWaveformURLs;
- (NSArray)decomposedFragments;
- (NSDate)creationDate;
- (NSDictionary)musicMemoMetadata;
- (NSObject)composedFragmentsMutex;
- (NSString)description;
- (NSString)savedRecordingUUID;
- (NSString)title;
- (NSURL)composedAVURL;
- (RCComposition)initWithDictionaryPListRepresentation:(id)a3;
- (double)_composedDuration;
- (double)cachedComposedAVURLDuration;
- (id)_calculateComposedFragments;
- (id)_compositionAsset:(id *)a3;
- (id)_compositionByReplacingDecomposedFragments:(id)a3;
- (id)_initWithComposedAVURL:(id)a3 savedRecordingUUID:(id)a4 creationDate:(id)a5 title:(id)a6 musicMemoMetadata:(id)a7 decomposedFragments:(id)a8 composedFragments:(id)a9;
- (id)_initWithSavedRecording:(id)a3 decomposedFragments:(id)a4 composedFragments:(id)a5;
- (id)bufferEnumerator:(id)a3 startTime:(double)a4 error:(id *)a5;
- (id)composedFragmentsIntersectingTimeRange:(id)a3;
- (id)composedWaveformURLForTrackIndex:(unint64_t)a3;
- (id)compositionByClippingToComposedTimeRange:(id)a3;
- (id)compositionByDeletingAndSplittingAtComposedTimeRange:(id)a3;
- (id)compositionByOverdubbingWithFragment:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryPListRepresentation;
- (id)moveTo:(id)a3 recordingID:(id)a4 error:(id *)a5;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newRandomFragmentWithInsertionTimeRangeInComposition:(id)a3 trackIndex:(unint64_t)a4 pathExtension:(id)a5;
- (id)playableAsset:(id *)a3;
- (unint64_t)_fileSizeOfComposedAssets;
- (unint64_t)fileSizeOfAssets;
- (void)_calculateComposedAVURLDerivedValues;
- (void)_eaccess_repairDecomposedFragmentMetadataIfNecessary:(id)a3;
- (void)_loadMusicMemoMetadata;
- (void)deleteFromFilesystem;
- (void)enumerateOrphanedFragmentsWithBlock:(id)a3;
- (void)rcs_composeToFinalDestinationWithCompletionBlock:(id)a3;
- (void)rcs_repairDecomposedFragmentMetadataIfNecessary:(id)a3;
- (void)recacheAVURLDerivedValues;
- (void)saveMetadataToDefaultLocation;
- (void)setCachedComposedAVURLDerivedValuesAreValid:(BOOL)a3;
- (void)setCachedComposedAVURLDuration:(double)a3;
- (void)setCachedHasMultipleTracks:(BOOL)a3;
- (void)setComposedAVURL:(id)a3;
- (void)setComposedFragments:(id)a3;
- (void)setComposedFragmentsMutex:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDecomposedFragments:(id)a3;
- (void)setMusicMemoMetadata:(id)a3;
- (void)setSavedRecordingUUID:(id)a3;
- (void)setSavedRecordingUUIDFromRecoveredRecordingUUID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RCComposition

+ (BOOL)_markCompositionAVURLsBeingModified:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke;
  v7[3] = &unk_1E6496A40;
  id v8 = v3;
  v9 = &v10;
  id v4 = v3;
  _accessActiveCaptureCompositionAVURLs(v7);
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isEqual:*(void *)(a1 + 32)] ^ 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v3 removeAllObjects];
    [v3 unionSet:*(void *)(a1 + 32)];
    id v4 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke_cold_1(v3);
    }
  }
}

- (id)_initWithComposedAVURL:(id)a3 savedRecordingUUID:(id)a4 creationDate:(id)a5 title:(id)a6 musicMemoMetadata:(id)a7 decomposedFragments:(id)a8 composedFragments:(id)a9
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v32.receiver = self;
  v32.super_class = (Class)RCComposition;
  v19 = [(RCComposition *)&v32 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_composedAVURL, a3);
    objc_storeStrong((id *)&v20->_savedRecordingUUID, a4);
    objc_storeStrong((id *)&v20->_creationDate, a5);
    objc_storeStrong((id *)&v20->_title, a6);
    objc_storeStrong((id *)&v20->_musicMemoMetadata, a7);
    if (v17)
    {
      v21 = (NSArray *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1C978], "array", v28, v29, v30, v31);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    decomposedFragments = v20->_decomposedFragments;
    v20->_decomposedFragments = v21;

    if (v18)
    {
      v23 = (NSArray *)v18;
    }
    else
    {
      v23 = [(RCComposition *)v20 _calculateComposedFragments];
    }
    composedFragments = v20->_composedFragments;
    v20->_composedFragments = v23;

    uint64_t v25 = objc_opt_new();
    composedFragmentsMutex = v20->_composedFragmentsMutex;
    v20->_composedFragmentsMutex = v25;
  }
  return v20;
}

- (id)_initWithSavedRecording:(id)a3 decomposedFragments:(id)a4 composedFragments:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)RCComposition;
  v11 = [(RCComposition *)&v26 init];
  if (v11)
  {
    uint64_t v12 = [v8 url];
    objc_storeStrong((id *)&v11->_composedAVURL, v12);
    uint64_t v13 = [v8 uuid];
    savedRecordingUUID = v11->_savedRecordingUUID;
    v11->_savedRecordingUUID = (NSString *)v13;

    uint64_t v15 = [v8 creationDate];
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v15;

    uint64_t v17 = [v8 title];
    title = v11->_title;
    v11->_title = (NSString *)v17;

    if ([v8 musicMemo]) {
      [(RCComposition *)v11 _loadMusicMemoMetadata];
    }
    if (v9)
    {
      v19 = (NSArray *)v9;
    }
    else
    {
      v19 = [MEMORY[0x1E4F1C978] array];
    }
    decomposedFragments = v11->_decomposedFragments;
    v11->_decomposedFragments = v19;

    if (v10)
    {
      v21 = (NSArray *)v10;
    }
    else
    {
      v21 = [(RCComposition *)v11 _calculateComposedFragments];
    }
    composedFragments = v11->_composedFragments;
    v11->_composedFragments = v21;

    uint64_t v23 = objc_opt_new();
    composedFragmentsMutex = v11->_composedFragmentsMutex;
    v11->_composedFragmentsMutex = v23;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[RCComposition alloc] _initWithComposedAVURL:self->_composedAVURL savedRecordingUUID:self->_savedRecordingUUID creationDate:self->_creationDate title:self->_title musicMemoMetadata:self->_musicMemoMetadata decomposedFragments:self->_decomposedFragments composedFragments:self->_composedFragments];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(RCComposition *)[RCMutableComposition alloc] _initWithComposedAVURL:self->_composedAVURL savedRecordingUUID:self->_savedRecordingUUID creationDate:self->_creationDate title:self->_title musicMemoMetadata:self->_musicMemoMetadata decomposedFragments:self->_decomposedFragments composedFragments:self->_composedFragments];
}

- (NSString)description
{
  id v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)RCComposition;
  id v4 = [(RCComposition *)&v12 description];
  savedRecordingUUID = self->_savedRecordingUUID;
  v6 = [(NSURL *)self->_composedAVURL path];
  v7 = [(RCComposition *)self composedWaveformURLs];
  id v8 = (void *)MEMORY[0x1E4F28ED0];
  [(RCComposition *)self composedDuration];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  id v10 = [v3 stringWithFormat:@"%@ savedRecordingUUID = %@, AVURL = %@ (waveformURLs = %@), composedDuration = %@, _decomposedFragments = %@", v4, savedRecordingUUID, v6, v7, v9, self->_decomposedFragments];

  return (NSString *)v10;
}

- (RCComposition)initWithDictionaryPListRepresentation:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)RCComposition;
  char v5 = [(RCComposition *)&v42 init];
  if (!v5) {
    goto LABEL_17;
  }
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [v4 objectForKey:@"RCComposedAVURL"];
  id v8 = [v6 URLWithString:v7];
  uint64_t v9 = objc_msgSend(v8, "rc_URLByFixingUpPersistentMediaRecordingsDirectory");
  composedAVURL = v5->_composedAVURL;
  v5->_composedAVURL = (NSURL *)v9;

  uint64_t v11 = [v4 objectForKey:@"RCSavedRecordingUUID"];
  savedRecordingUUID = v5->_savedRecordingUUID;
  v5->_savedRecordingUUID = (NSString *)v11;

  uint64_t v13 = [v4 objectForKey:@"RCSavedRecordingCreationTime"];
  v37 = v13;
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F1C9C8];
    [v13 doubleValue];
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [v4 objectForKey:@"RCSavedRecordingCreationDate"];
  uint64_t v15 = };
  creationDate = v5->_creationDate;
  v5->_creationDate = (NSDate *)v15;

  uint64_t v17 = [v4 objectForKey:@"RCSavedRecordingTitle"];
  title = v5->_title;
  v5->_title = (NSString *)v17;

  uint64_t v19 = [v4 objectForKey:@"RCSavedRecordingMusicMemoMetadata"];
  musicMemoMetadata = v5->_musicMemoMetadata;
  v5->_musicMemoMetadata = (NSDictionary *)v19;

  v21 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v22 = [v4 objectForKey:@"RCDecomposedFragments"];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [[RCCompositionFragment alloc] initWithDictionaryPListRepresentation:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        [v21 addObject:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v24);
  }

  objc_storeStrong((id *)&v5->_decomposedFragments, v21);
  uint64_t v28 = [(RCComposition *)v5 _calculateComposedFragments];
  composedFragments = v5->_composedFragments;
  v5->_composedFragments = (NSArray *)v28;

  uint64_t v30 = objc_opt_new();
  composedFragmentsMutex = v5->_composedFragmentsMutex;
  v5->_composedFragmentsMutex = v30;

  objc_super v32 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v33 = objc_msgSend(v32, "rc_fileExistsAndIsInValidRecordingURL:", v5->_composedAVURL);

  if (!v33)
  {

LABEL_17:
    v35 = v5;
    goto LABEL_18;
  }
  v34 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[RCComposition initWithDictionaryPListRepresentation:]((id *)&v5->_composedAVURL);
  }

  v35 = 0;
LABEL_18:

  return v35;
}

- (id)dictionaryPListRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NSURL *)self->_composedAVURL absoluteString];
  if (v4) {
    [v3 setObject:v4 forKey:@"RCComposedAVURL"];
  }
  char v5 = self->_savedRecordingUUID;

  if (v5) {
    [v3 setObject:v5 forKey:@"RCSavedRecordingUUID"];
  }
  creationDate = self->_creationDate;
  if (creationDate)
  {
    v7 = (void *)MEMORY[0x1E4F28ED0];
    [(NSDate *)creationDate timeIntervalSinceReferenceDate];
    id v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKey:@"RCSavedRecordingCreationTime"];

    [v3 setObject:self->_creationDate forKey:@"RCSavedRecordingCreationDate"];
  }
  uint64_t v9 = [(RCComposition *)self title];

  if (v9) {
    [v3 setObject:v9 forKey:@"RCSavedRecordingTitle"];
  }
  musicMemoMetadata = self->_musicMemoMetadata;
  if (musicMemoMetadata) {
    [v3 setObject:musicMemoMetadata forKey:@"RCSavedRecordingMusicMemoMetadata"];
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v12 = self->_decomposedFragments;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryPListRepresentation", (void)v19);
        [v11 addObject:v17];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [v3 setObject:v11 forKey:@"RCDecomposedFragments"];
  return v3;
}

+ (id)_unitTestingCompositionWithDecomposedFragments:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  char v5 = [v3 URLWithString:@"*composedAVURL*"];
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithComposedAVURL:v5 savedRecordingUUID:0 creationDate:0 title:0 musicMemoMetadata:0 decomposedFragments:v4 composedFragments:0];

  return v6;
}

+ (id)_compositionLoadedFromMetadataURL:(id)a3 composedAVURL:(id)a4 savedRecordingUUID:(id)a5 creationDate:(id)a6 createIfNeeded:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3];
  if (v14)
  {
    id v22 = 0;
    uint64_t v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:&v22];
    id v16 = v22;
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[RCComposition _compositionLoadedFromMetadataURL:composedAVURL:savedRecordingUUID:creationDate:createIfNeeded:]();
      }

      long long v19 = 0;
    }
    else
    {
      long long v20 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionaryPListRepresentation:v15];
      long long v19 = v20;
      if (v12) {
        [v20 setSavedRecordingUUID:v12];
      }
    }
  }
  else
  {
    long long v19 = 0;
    if (v11 && v7) {
      long long v19 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithComposedAVURL:v11 savedRecordingUUID:v12 creationDate:v13 title:0 musicMemoMetadata:0 decomposedFragments:0 composedFragments:0];
    }
  }

  return v19;
}

+ (id)_compositionLoadedFromMetadataURL:(id)a3 savedRecording:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3];
  if (!v6)
  {
    if (v5)
    {
      id v11 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithSavedRecording:v5 decomposedFragments:0 composedFragments:0];
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  id v16 = 0;
  BOOL v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v16];
  id v8 = v16;
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RCComposition _compositionLoadedFromMetadataURL:savedRecording:]();
    }

LABEL_8:
    id v11 = 0;
    goto LABEL_13;
  }
  id v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionaryPListRepresentation:v7];
  if (v5)
  {
    id v12 = [v5 uuid];
    [v11 setSavedRecordingUUID:v12];

    id v13 = [v5 creationDate];
    [v11 setCreationDate:v13];

    uint64_t v14 = [v5 title];
    [v11 setTitle:v14];

    if ([v5 musicMemo]) {
      [v11 _loadMusicMemoMetadata];
    }
  }

LABEL_13:
  return v11;
}

+ (id)compositionLoadedFromCompositionBundleURL:(id)a3
{
  id v4 = [a1 _compositionMetadataURLForCompositionBundleURL:a3];
  id v5 = [a1 _compositionLoadedFromMetadataURL:v4 composedAVURL:0 savedRecordingUUID:0 creationDate:0 createIfNeeded:0];

  return v5;
}

+ (id)compositionLoadedForComposedAVURL:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = +[RCComposition compositionMetadataURLForComposedAVURL:v6];
  id v8 = [a1 _compositionLoadedFromMetadataURL:v7 composedAVURL:v6 savedRecordingUUID:0 creationDate:0 createIfNeeded:v4];

  return v8;
}

+ (id)uriRepresentationForLegacyComposedAVURL:(id)a3
{
  id v3 = +[RCComposition compositionMetadataURLForComposedAVURL:a3];
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  id v5 = [v4 objectForKeyedSubscript:@"RCSavedRecordingURI"];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)compositionLoadedForSavedRecording:(id)a3
{
  id v4 = a3;
  id v5 = [v4 url];
  id v6 = +[RCComposition compositionMetadataURLForComposedAVURL:v5];

  BOOL v7 = [a1 _compositionLoadedFromMetadataURL:v6 savedRecording:v4];

  return v7;
}

+ (id)compositionLoadedForEditingSavedRecording:(id)a3 error:(id *)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [a1 compositionLoadedForSavedRecording:v6];
  id v8 = [v7 composedFragments];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    id v10 = [v6 url];
    [v6 length];
    double v12 = v11;
    v13.n128_u64[0] = 0;
    double v14 = RCTimeRangeMake(v13, v12);
    double v16 = v15;
    uint64_t v17 = [v10 pathExtension];
    id v18 = objc_msgSend(v7, "newRandomFragmentWithInsertionTimeRangeInComposition:trackIndex:pathExtension:", 0, v17, v14, v16);
    long long v19 = (void *)[v18 mutableCopy];

    [v19 setContentDuration:v12];
    objc_msgSend(v19, "setTimeRangeInContentToUse:", v14, v16);
    long long v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v21 = [v19 AVOutputURL];
    int v22 = [v20 moveItemAtURL:v10 toURL:v21 error:a4];

    if (!v22)
    {

      id v25 = 0;
      goto LABEL_9;
    }
    if ([v7 hasMultipleTracks])
    {
      uint64_t v23 = (void *)[v19 mutableCopy];
      [v23 setTrackIndex:1];
      v28[0] = v19;
      v28[1] = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      [v7 setDecomposedFragments:v24];
    }
    else
    {
      v27 = v19;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      [v7 setDecomposedFragments:v23];
    }

    [v7 saveMetadataToDefaultLocation];
  }
  id v25 = v7;
LABEL_9:

  return v25;
}

- (BOOL)isContentBeingModified
{
  id v3 = objc_opt_class();
  id v4 = [(RCComposition *)self composedAVURL];
  LOBYTE(v3) = [v3 _isSessionWithModificationAccessActiveForComposedAVURL:v4];

  return (char)v3;
}

- (void)setSavedRecordingUUIDFromRecoveredRecordingUUID:(id)a3
{
}

- (void)setDecomposedFragments:(id)a3
{
  id v5 = (NSArray *)a3;
  p_decomposedFragments = &self->_decomposedFragments;
  if (self->_decomposedFragments != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_decomposedFragments, a3);
    BOOL v7 = [(RCComposition *)self _calculateComposedFragments];
    [(RCComposition *)self setComposedFragments:v7];

    p_decomposedFragments = (NSArray **)[(RCComposition *)self recacheAVURLDerivedValues];
    id v5 = v8;
  }
  MEMORY[0x1F41817F8](p_decomposedFragments, v5);
}

- (NSArray)composedFragments
{
  id v3 = self->_composedFragmentsMutex;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSArray *)self->_composedFragments copy];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (void)setComposedFragments:(id)a3
{
  id v4 = (NSArray *)a3;
  id v5 = self->_composedFragmentsMutex;
  objc_sync_enter(v5);
  composedFragments = self->_composedFragments;
  self->_composedFragments = v4;
  BOOL v7 = v4;

  objc_sync_exit(v5);
}

- (NSArray)composedWaveformURLs
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = objc_opt_new();
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v6 = [(RCComposition *)self composedWaveformURLForTrackIndex:qword_1C39B1858[i]];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = [v6 path];
      int v9 = [v3 fileExistsAtPath:v8];

      if (v9) {
        [v4 addObject:v7];
      }
    }
  }
  return (NSArray *)v4;
}

- (id)composedWaveformURLForTrackIndex:(unint64_t)a3
{
  return +[RCWaveform waveformURLForAVURL:self->_composedAVURL trackIndex:a3];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)composedTimeRangeForTrackIndex:(unint64_t)a3
{
  [(RCComposition *)self _calculateComposedAVURLDerivedValues];
  id v5 = &self->_cachedTrackRanges[a3];
  if (a3 >= 2) {
    id v5 = ($93AB83F55FD8EAABF5C634313E89AB95 *)&RCTimeRangeZero;
  }
  double beginTime = v5->beginTime;
  double endTime = v5->endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (unint64_t)fileSizeOfAssets
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v3 = [(RCComposition *)self decomposedFragments];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__RCComposition_fileSizeOfAssets__block_invoke;
  v7[3] = &unk_1E64969F0;
  void v7[4] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];

  uint64_t v4 = v9[3];
  unint64_t v5 = [(RCComposition *)self _fileSizeOfComposedAssets] + v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__RCComposition_fileSizeOfAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 fileSizeOfAssets];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)_fileSizeOfComposedAssets
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(NSURL *)self->_composedAVURL path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [(NSURL *)self->_composedAVURL path];
    BOOL v7 = [v3 attributesOfItemAtPath:v6 error:0];
    uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F28390]];
    unint64_t v9 = [v8 longLongValue];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)composedFragmentsIntersectingTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  BOOL v7 = [(RCComposition *)self composedFragments];
  uint64_t v8 = [v7 objectEnumerator];

  unint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = v9;
    unint64_t v9 = [v8 nextObject];

    if (!v9) {
      break;
    }
    [v9 timeRangeInComposition];
    if (RCTimeRangeIntersectsRange(v11, v12, var0, var1))
    {
      [v6 addObject:v9];
      __n128 v13 = [v8 nextObject];

      if (v13)
      {
        do
        {
          [v13 timeRangeInComposition];
          if (v14 >= var1) {
            break;
          }
          [v6 addObject:v13];
          uint64_t v15 = [v8 nextObject];

          __n128 v13 = (void *)v15;
        }
        while (v15);
      }
      break;
    }
  }

  return v6;
}

- (id)compositionByDeletingAndSplittingAtComposedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  a3.double var0 = -3.40282347e38;
  id v6 = [(RCComposition *)self compositionByClippingToComposedTimeRange:RCTimeRangeMake((__n128)a3, var0)];
  v7.n128_f64[0] = var1;
  uint64_t v8 = [(RCComposition *)self compositionByClippingToComposedTimeRange:RCTimeRangeMake(v7, 3.40282347e38)];
  unint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = (void *)[v6 mutableCopy];
    v36 = [v9 decomposedFragments];
    if (v36)
    {
      int v33 = v9;
      v34 = v6;
      double v11 = [v10 decomposedFragments];
      double v12 = (void *)[v11 mutableCopy];

      uint64_t v13 = 0;
      char v14 = 1;
      v35 = v10;
      do
      {
        char v38 = v14;
        uint64_t v15 = [v10 composedFragments];
        double v16 = [v15 fragmentsWithTrackIndex:v13];

        v37 = v16;
        uint64_t v17 = [v16 lastObject];
        [v17 timeRangeInComposition];
        double v19 = v18;

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v20 = [v36 fragmentsWithTrackIndex:v13];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v49 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v40;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v40 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v24) mutableCopy];
              [v25 timeRangeInComposition];
              double v28 = RCTimeRangeShift(v26, v27, v19);
              if (var0 >= v28) {
                double v29 = var0;
              }
              else {
                double v29 = v28;
              }
              [v25 setTimeRangeInComposition:v29];
              [v12 addObject:v25];
              if (v29 < var0)
              {
                uint64_t v30 = OSLogForCategory(@"Default");
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  id v31 = NSStringFromRCTimeRange(var0, var1);
                  *(_DWORD *)buf = 136315650;
                  uint64_t v44 = "-[RCComposition compositionByDeletingAndSplittingAtComposedTimeRange:]";
                  __int16 v45 = 2112;
                  v46 = v25;
                  __int16 v47 = 2112;
                  v48 = v31;
                  _os_log_error_impl(&dword_1C3964000, v30, OS_LOG_TYPE_ERROR, "%s -- Invalid fragment times:  %@, composedTimeRange = %@", buf, 0x20u);
                }
              }

              ++v24;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v49 count:16];
          }
          while (v22);
        }

        char v14 = 0;
        uint64_t v13 = 1;
        uint64_t v10 = v35;
      }
      while ((v38 & 1) != 0);
      [v35 setDecomposedFragments:v12];

      unint64_t v9 = v33;
      id v6 = v34;
    }
  }
  else
  {
    uint64_t v10 = (void *)[v8 mutableCopy];
  }

  return v10;
}

- (id)compositionByClippingToComposedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = -[RCComposition composedFragmentsIntersectingTimeRange:](self, "composedFragmentsIntersectingTimeRange:");
  __n128 v7 = [v6 firstObject];
  if ((unint64_t)[v6 count] < 2)
  {
    BOOL v9 = 0;
    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = [v6 lastObject];

    BOOL v9 = v8 != 0;
    if (v7) {
      goto LABEL_7;
    }
  }
  if (!v9)
  {
    uint64_t v10 = 0;
    goto LABEL_19;
  }
LABEL_7:
  double v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = 0;
  char v13 = 1;
  do
  {
    char v14 = v13;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v15 = objc_msgSend(v6, "fragmentsWithTrackIndex:", v12, 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      double v19 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) mutableCopy];
          if (objc_msgSend(v21, "intersectWithTimeRange:", var0, var1))
          {
            [v21 timeRangeInComposition];
            double v24 = v19 + RCTimeRangeDeltaWithExactPrecision(v22, v23);
            v25.n128_f64[0] = v19;
            objc_msgSend(v21, "setTimeRangeInComposition:", RCTimeRangeMake(v25, v24));
            [v11 addObject:v21];
            double v19 = v24;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v17);
    }

    char v13 = 0;
    uint64_t v12 = 1;
  }
  while ((v14 & 1) != 0);
  uint64_t v10 = (void *)[(RCComposition *)self mutableCopy];
  [v10 setDecomposedFragments:v11];
  [v10 recacheAVURLDerivedValues];

LABEL_19:
  return v10;
}

- (id)compositionByOverdubbingWithFragment:(id)a3
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[RCComposition hasMultipleTracks](self, "hasMultipleTracks") || [v4 trackIndex])
  {
    int v5 = (void *)[(RCComposition *)self mutableCopy];
    id v6 = [(RCComposition *)self decomposedFragments];
    __n128 v7 = (void *)[v6 mutableCopy];

    [v7 addObject:v4];
    [v5 setDecomposedFragments:v7];
    uint64_t v8 = [v5 _calculateComposedFragments];
    [v5 setComposedFragments:v8];

    [v5 recacheAVURLDerivedValues];
  }
  else
  {
    [v4 timeRangeInComposition];
    double v11 = v10;
    double v13 = v12;
    [(RCComposition *)self composedDuration];
    double v15 = v14;
    v16.n128_u64[0] = 0;
    double v17 = RCTimeRangeMake(v16, v15);
    if (RCTimeRangeContainsRange(v11, v13, v17, v18))
    {
      int v5 = (void *)[(RCComposition *)self mutableCopy];
      v65[0] = v4;
      long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
      [v5 setDecomposedFragments:v20];
    }
    else
    {
      v19.n128_u64[0] = 0xC7EFFFFFE0000000;
      uint64_t v21 = [(RCComposition *)self compositionByClippingToComposedTimeRange:RCTimeRangeMake(v19, v11)];
      v22.n128_f64[0] = v13;
      double v23 = [(RCComposition *)self compositionByClippingToComposedTimeRange:RCTimeRangeMake(v22, 3.40282347e38)];
      double v24 = v23;
      if (v21)
      {
        int v5 = (void *)[v21 mutableCopy];
        __n128 v25 = [v21 decomposedFragments];
        double v26 = [v25 lastObject];
        [v26 timeRangeInComposition];
        if (v27 != v11)
        {
          long long v28 = OSLogForCategory(@"Default");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[RCComposition compositionByOverdubbingWithFragment:](v11, v13);
          }
        }
        long long v29 = [v25 arrayByAddingObject:v4];
        [v5 setDecomposedFragments:v29];
      }
      else
      {
        int v5 = (void *)[v23 mutableCopy];
        id v64 = v4;
        __n128 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
        [v5 setDecomposedFragments:v25];
      }

      long long v30 = [v24 decomposedFragments];
      if (v30)
      {
        uint64_t v50 = v24;
        v51 = v21;
        id v52 = v4;
        id v31 = [v5 decomposedFragments];
        uint64_t v32 = (void *)[v31 mutableCopy];

        int v33 = [v5 composedFragments];
        v34 = [v33 lastObject];
        [v34 timeRangeInComposition];
        double v36 = v35;

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v49 = v30;
        id v37 = v30;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v54;
          do
          {
            uint64_t v41 = 0;
            do
            {
              if (*(void *)v54 != v40) {
                objc_enumerationMutation(v37);
              }
              long long v42 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * v41), "mutableCopy", v49);
              [v42 timeRangeInComposition];
              double v45 = RCTimeRangeShift(v43, v44, v36);
              if (v13 >= v45) {
                double v46 = v13;
              }
              else {
                double v46 = v45;
              }
              [v42 setTimeRangeInComposition:v46];
              [v32 addObject:v42];
              if (v46 < v13)
              {
                __int16 v47 = OSLogForCategory(@"Default");
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  v48 = NSStringFromRCTimeRange(v11, v13);
                  *(_DWORD *)buf = 136315650;
                  v58 = "-[RCComposition compositionByOverdubbingWithFragment:]";
                  __int16 v59 = 2112;
                  v60 = v42;
                  __int16 v61 = 2112;
                  v62 = v48;
                  _os_log_error_impl(&dword_1C3964000, v47, OS_LOG_TYPE_ERROR, "%s -- Invalid fragment times:  %@, composedTimeRange = %@", buf, 0x20u);
                }
              }

              ++v41;
            }
            while (v39 != v41);
            uint64_t v39 = [v37 countByEnumeratingWithState:&v53 objects:v63 count:16];
          }
          while (v39);
        }

        [v5 setDecomposedFragments:v32];
        uint64_t v21 = v51;
        id v4 = v52;
        long long v30 = v49;
        double v24 = v50;
      }
    }
  }

  return v5;
}

- (id)newRandomFragmentWithInsertionTimeRangeInComposition:(id)a3 trackIndex:(unint64_t)a4 pathExtension:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  BOOL v9 = (void *)MEMORY[0x1E4F29128];
  id v10 = a5;
  double v11 = [v9 UUID];
  double v12 = [v11 UUIDString];

  double v13 = [(id)objc_opt_class() _compositionFragmentsFolderForComposedAVURL:self->_composedAVURL];
  uint64_t v14 = [v13 URLByAppendingPathComponent:v12];
  double v15 = [(id)v14 URLByAppendingPathExtension:v10];

  [(RCComposition *)self composedDuration];
  double v17 = v16;
  double v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  __n128 v19 = [v15 URLByDeletingLastPathComponent];
  id v26 = 0;
  LOBYTE(v14) = [v18 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v20 = v26;

  if ((v14 & 1) == 0)
  {
    uint64_t v21 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[RCComposition newRandomFragmentWithInsertionTimeRangeInComposition:trackIndex:pathExtension:](v15);
    }
  }
  if (var1 >= v17) {
    double v22 = var1;
  }
  else {
    double v22 = v17;
  }
  if (var0 < v17 && var0 + 0.0500000007 < v17) {
    double v22 = var1;
  }
  else {
    double var0 = v17;
  }
  if (v17 >= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v17;
  }
  double v24 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:]([RCCompositionFragment alloc], "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:", v15, a4, 0.0, -1.79769313e308, 1.79769313e308, var0, v23);

  return v24;
}

- (void)enumerateOrphanedFragmentsWithBlock:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v28 = (void (**)(id, RCCompositionFragment *, unsigned char *))a3;
  long long v29 = +[RCCaptureFormat fileExtensionsSupported];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  if ([(NSArray *)self->_decomposedFragments count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    int v5 = self->_decomposedFragments;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) AVOutputURL];
          double v11 = [v10 lastPathComponent];
          [v4 addObject:v11];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v7);
    }
  }
  double v12 = [(NSURL *)self->_composedAVURL lastPathComponent];
  [v4 addObject:v12];

  double v13 = [(id)objc_opt_class() _compositionFragmentsFolderForComposedAVURL:self->_composedAVURL];
  uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v15 = [MEMORY[0x1E4F1C978] array];
  double v16 = [v14 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:v15 options:5 error:0];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        double v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        double v23 = [v22 lastPathComponent];
        if ([v4 containsObject:v23])
        {
        }
        else
        {
          double v24 = [v22 pathExtension];
          int v25 = [v29 containsObject:v24];

          if (v25)
          {
            unsigned __int8 v30 = 0;
            id v26 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:]([RCCompositionFragment alloc], "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:trackIndex:", v22, 0, 0.0, -1.79769313e308, 1.79769313e308, -1.79769313e308, 1.79769313e308);
            v28[2](v28, v26, &v30);
            int v27 = v30;

            if (v27) {
              goto LABEL_21;
            }
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v19);
  }
LABEL_21:
}

- (void)deleteFromFilesystem
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[RCComposition deleteFromFilesystem]";
    __int16 v6 = 2112;
    uint64_t v7 = self;
    _os_log_impl(&dword_1C3964000, v3, OS_LOG_TYPE_INFO, "%s -- deleting all composition assets for %@", (uint8_t *)&v4, 0x16u);
  }

  +[RCComposition deleteFromFilesystem:self->_composedAVURL];
}

+ (void)deleteFromFilesystem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    double v11 = "+[RCComposition deleteFromFilesystem:]";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1C3964000, v4, OS_LOG_TYPE_INFO, "%s -- deleting all composition assets for %@", (uint8_t *)&v10, 0x16u);
  }

  int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v6 = +[RCWaveform waveformURLForAVURL:v3 trackIndex:-1];
  [v5 removeItemAtURL:v6 error:0];
  uint64_t v7 = +[RCWaveform waveformURLForAVURL:v3 trackIndex:0];

  [v5 removeItemAtURL:v7 error:0];
  uint64_t v8 = +[RCWaveform waveformURLForAVURL:v3 trackIndex:1];

  [v5 removeItemAtURL:v8 error:0];
  BOOL v9 = objc_msgSend(v3, "rc_URLByReplacingPathExtensionWithExtension:", @"composition");
  [v5 removeItemAtURL:v3 error:0];
  [v5 removeItemAtURL:v9 error:0];
}

+ (BOOL)excludeFromBackup:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v6 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    uint64_t v18 = "+[RCComposition excludeFromBackup:error:]";
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1C3964000, v6, OS_LOG_TYPE_DEFAULT, "%s -- excluding from backup %@", (uint8_t *)&v17, 0x16u);
  }

  id v7 = [v5 path];
  int v8 = chmod((const char *)[v7 fileSystemRepresentation], 0x1A4u);

  if (v8)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      char v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F1CE10];
    uint64_t v11 = MEMORY[0x1E4F1CC38];
    char v9 = [v5 setResourceValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1CE10] error:a4];
    __int16 v12 = +[RCWaveform waveformURLForAVURL:v5 trackIndex:-1];
    [v12 setResourceValue:v11 forKey:v10 error:0];
    id v13 = +[RCWaveform waveformURLForAVURL:v5 trackIndex:0];

    [v13 setResourceValue:v11 forKey:v10 error:0];
    uint64_t v14 = +[RCWaveform waveformURLForAVURL:v5 trackIndex:1];

    [v14 setResourceValue:v11 forKey:v10 error:0];
    double v15 = objc_msgSend(v5, "rc_URLByReplacingPathExtensionWithExtension:", @"composition");
    [v15 setResourceValue:v11 forKey:v10 error:0];
  }
  return v9;
}

+ (BOOL)migrateBackupExclusionFlag:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "+[RCComposition migrateBackupExclusionFlag:]";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1C3964000, v4, OS_LOG_TYPE_DEFAULT, "%s -- migrating backup exclusion flag %@", (uint8_t *)&v10, 0x16u);
  }

  migrateBackupExclusionFlag(v3);
  id v5 = +[RCWaveform waveformURLForAVURL:v3 trackIndex:-1];
  migrateBackupExclusionFlag(v5);

  __int16 v6 = +[RCWaveform waveformURLForAVURL:v3 trackIndex:0];
  migrateBackupExclusionFlag(v6);

  id v7 = +[RCWaveform waveformURLForAVURL:v3 trackIndex:1];
  migrateBackupExclusionFlag(v7);

  int v8 = objc_msgSend(v3, "rc_URLByReplacingPathExtensionWithExtension:", @"composition");
  migrateBackupExclusionFlag(v8);

  return 1;
}

- (BOOL)saveMetadataToDefaultLocation
{
  id v3 = [(RCComposition *)self dictionaryPListRepresentation];
  if (v3)
  {
    id v17 = 0;
    int v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:100 options:0 error:&v17];
    id v5 = v17;
    if (v5)
    {
      __int16 v6 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[RCComposition saveMetadataToDefaultLocation].cold.4();
      }
      char v7 = 0;
      goto LABEL_21;
    }
    int v8 = [(RCComposition *)self composedAVURL];
    __int16 v6 = +[RCComposition compositionMetadataURLForComposedAVURL:v8];

    char v9 = OSLogForCategory(@"Default");
    int v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[RCComposition saveMetadataToDefaultLocation](v6);
      }

      if (![v4 length])
      {
        char v7 = 1;
        goto LABEL_21;
      }
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      __int16 v12 = [v6 URLByDeletingLastPathComponent];
      id v16 = 0;
      char v13 = [v11 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v16];
      int v10 = v16;

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[RCComposition saveMetadataToDefaultLocation](v6);
        }
      }
      char v7 = [v4 writeToURL:v6 atomically:1];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RCComposition saveMetadataToDefaultLocation](v10);
      }
      char v7 = 0;
    }

LABEL_21:
    goto LABEL_22;
  }
  char v7 = 0;
LABEL_22:

  return v7;
}

- (void)recacheAVURLDerivedValues
{
  self->_cachedComposedAVURLDuration = -1.0;
  self->_cachedTrackRanges[0] = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeZero;
  self->_cachedTrackRanges[1] = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeZero;
  self->_cachedComposedAVURLDerivedValuesAreValid = 0;
  [(RCComposition *)self _calculateComposedAVURLDerivedValues];
}

- (void)_loadMusicMemoMetadata
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(NSURL *)self->_composedAVURL path];
  int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  if (v5)
  {
    __int16 v6 = [MEMORY[0x1E4F166C8] assetWithURL:self->_composedAVURL];
    if (RCMusicMemosKeys_onceToken != -1) {
      dispatch_once(&RCMusicMemosKeys_onceToken, &__block_literal_global_3);
    }
    id v7 = (id)RCMusicMemosKeys_musicMemosKeys;
    int v8 = objc_msgSend(v6, "rc_recordingMetadata");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__RCComposition__loadMusicMemoMetadata__block_invoke;
    v12[3] = &unk_1E6496A18;
    id v13 = v7;
    id v9 = v7;
    objc_msgSend(v8, "na_filter:", v12);
    int v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    musicMemoMetadata = self->_musicMemoMetadata;
    self->_musicMemoMetadata = v10;
  }
}

uint64_t __39__RCComposition__loadMusicMemoMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

+ (id)compositionBundleURLForComposedAVURL:(id)a3
{
  return (id)objc_msgSend(a3, "rc_URLByReplacingPathExtensionWithExtension:", @"composition");
}

+ (id)_compositionMetadataURLForCompositionBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"manifest.plist"];
}

+ (id)compositionMetadataURLForComposedAVURL:(id)a3
{
  id v3 = [a1 compositionBundleURLForComposedAVURL:a3];
  int v4 = [v3 URLByAppendingPathComponent:@"manifest.plist"];

  return v4;
}

+ (id)_compositionFragmentsFolderForComposedAVURL:(id)a3
{
  id v3 = [a1 compositionBundleURLForComposedAVURL:a3];
  int v4 = [v3 URLByAppendingPathComponent:@"fragments"];

  return v4;
}

- (BOOL)hasMultipleTracks
{
  return self->_cachedHasMultipleTracks;
}

- (BOOL)composedAssetIsM4a
{
  v2 = [(RCComposition *)self composedAVURL];
  id v3 = [v2 pathExtension];
  int v4 = [v3 lowercaseString];
  char v5 = [v4 isEqualToString:@"m4a"];

  return v5;
}

- (BOOL)willMigrateFromM4aToQta
{
  BOOL v3 = [(RCComposition *)self hasMultipleTracks];
  if (v3)
  {
    LOBYTE(v3) = [(RCComposition *)self composedAssetIsM4a];
  }
  return v3;
}

- (double)_composedDuration
{
  return self->_cachedComposedAVURLDuration;
}

- (void)_calculateComposedAVURLDerivedValues
{
  id v7 = [*a1 path];
  OUTLINED_FUNCTION_1_0(&dword_1C3964000, v1, v2, "%s -- could not open audio file path = %@, error = %@", v3, v4, v5, v6, 2u);
}

- (id)_calculateComposedFragments
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_decomposedFragments count])
  {
    id v119 = (id)objc_opt_new();
    v123 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v2 = 0;
    char v3 = 1;
    while (1)
    {
      char v120 = v3;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      obuint64_t j = [(NSArray *)self->_decomposedFragments fragmentsWithTrackIndex:v2];
      uint64_t v124 = [obj countByEnumeratingWithState:&v131 objects:v147 count:16];
      if (!v124) {
        goto LABEL_76;
      }
      uint64_t v122 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v124; ++i)
        {
          if (*(void *)v132 != v122) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v131 + 1) + 8 * i);
          id v6 = v123;
          id v7 = v5;
          id v8 = v6;
          id v9 = v7;
          if ([v8 count] && (uint64_t v10 = objc_msgSend(v8, "count")) != 0)
          {
            uint64_t v11 = v10;
            uint64_t v12 = 0;
            uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            while (1)
            {
              while (1)
              {
                uint64_t v14 = [v8 objectAtIndexedSubscript:v12];
                [v14 timeRangeInComposition];
                double v16 = v15;
                if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
                  break;
                }
                [v9 timeRangeInComposition];
                if (v12 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v13 = v12;
                  if (v17 <= v16) {
                    break;
                  }
                }

                ++v12;
                uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
                if (v12 == v11)
                {
                  uint64_t v20 = 0;
                  goto LABEL_27;
                }
              }
              [v9 timeRangeInComposition];
              if (v18 == v16) {
                break;
              }
              [v9 timeRangeInComposition];
              if (v19 < v16) {
                goto LABEL_24;
              }

              if (++v12 == v11) {
                goto LABEL_25;
              }
            }
            uint64_t v21 = [v8 count];
            if (v12 + 1 < (unint64_t)(v21 - 1)) {
              ++v12;
            }
            else {
              uint64_t v12 = v21 - 1;
            }
LABEL_24:

            if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_25:
            }
              uint64_t v12 = [v8 count] - 1;
            uint64_t v20 = v12 - v13 + 1;
          }
          else
          {
            uint64_t v20 = 0;
            uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
LABEL_27:

          if (!v20) {
            goto LABEL_61;
          }
          v130 = v9;
          uint64_t v128 = i;
          double v22 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v126 = v13;
          v127 = v8;
          uint64_t v125 = v20;
          double v23 = objc_msgSend(v8, "subarrayWithRange:", v13, v20);
          long long v143 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          id v129 = v23;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v143 objects:v150 count:16];
          if (!v24) {
            goto LABEL_60;
          }
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v144;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v144 != v26) {
                objc_enumerationMutation(v129);
              }
              long long v28 = *(void **)(*((void *)&v143 + 1) + 8 * v27);
              [v130 timeRangeInComposition];
              double v30 = v29;
              double v32 = v31;
              id v33 = v28;
              [v33 timeRangeInComposition];
              double v35 = v34;
              double v37 = v36;
              [v33 timeRangeInComposition];
              unint64_t v39 = v38;
              [v33 timeRangeInContentToUse];
              double v42 = RCTimeRangeDeltaWithExactPrecision(v40, v41);
              v43.n128_u64[0] = v39;
              double v44 = RCTimeRangeMake(v43, v42);
              if (v30 >= v37 || v32 <= v35)
              {
                __int16 v47 = objc_msgSend(v33, "mutableCopy", v44);
                v148[0] = v47;
                goto LABEL_38;
              }
              unint64_t v49 = *(void *)&v44;
              double v50 = v45;
              BOOL v51 = RCTimeRangeContainsRange(v30, v32, v35, v37);
              v48 = (void *)MEMORY[0x1E4F1CBF0];
              if (!v51)
              {
                if (RCTimeRangeContainsRange(v35, v37, v30, v32))
                {
                  double v60 = v37 - v32;
                  __int16 v47 = (void *)[v33 mutableCopy];
                  [v33 timeRangeInContentToUse];
                  unint64_t v62 = v61;
                  [v33 timeRangeInContentToUse];
                  double v64 = v30 - v35 + v63;
                  v65.n128_u64[0] = v62;
                  objc_msgSend(v47, "setTimeRangeInContentToUse:", RCTimeRangeMake(v65, v64));
                  v66.n128_u64[0] = v49;
                  objc_msgSend(v47, "setTimeRangeInComposition:", RCTimeRangeMake(v66, v30));
                  v67 = (void *)[v33 mutableCopy];
                  [v33 timeRangeInContentToUse];
                  double v69 = v68 - v60;
                  [v33 timeRangeInContentToUse];
                  v70.n128_f64[0] = v69;
                  objc_msgSend(v67, "setTimeRangeInContentToUse:", RCTimeRangeMake(v70, v71));
                  v72.n128_f64[0] = v32;
                  objc_msgSend(v67, "setTimeRangeInComposition:", RCTimeRangeMake(v72, v50));
                  v148[0] = v47;
                  v148[1] = v67;
                  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:2];

                  goto LABEL_39;
                }
                if (v32 < v37)
                {
                  __int16 v47 = (void *)[v33 mutableCopy];
                  [v33 timeRangeInContentToUse];
                  double v74 = v32 - v35 + v73;
                  [v33 timeRangeInContentToUse];
                  v75.n128_f64[0] = v74;
                  objc_msgSend(v47, "setTimeRangeInContentToUse:", RCTimeRangeMake(v75, v76));
                  v77.n128_f64[0] = v32;
                  double v78 = v50;
LABEL_58:
                  objc_msgSend(v47, "setTimeRangeInComposition:", RCTimeRangeMake(v77, v78));
                  v148[0] = v47;
LABEL_38:
                  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:1];
LABEL_39:

                  goto LABEL_41;
                }
                if (v30 > v35)
                {
                  __int16 v47 = (void *)[v33 mutableCopy];
                  [v33 timeRangeInContentToUse];
                  unint64_t v80 = v79;
                  [v33 timeRangeInContentToUse];
                  v82.n128_u64[0] = v80;
                  objc_msgSend(v47, "setTimeRangeInContentToUse:", RCTimeRangeMake(v82, v81 - (v37 - v30)));
                  v77.n128_u64[0] = v49;
                  double v78 = v30;
                  goto LABEL_58;
                }
              }
LABEL_41:

              long long v139 = 0u;
              long long v140 = 0u;
              long long v141 = 0u;
              long long v142 = 0u;
              id v52 = v48;
              uint64_t v53 = [v52 countByEnumeratingWithState:&v139 objects:v149 count:16];
              if (v53)
              {
                uint64_t v54 = v53;
                uint64_t v55 = *(void *)v140;
                do
                {
                  for (uint64_t j = 0; j != v54; ++j)
                  {
                    if (*(void *)v140 != v55) {
                      objc_enumerationMutation(v52);
                    }
                    v57 = *(void **)(*((void *)&v139 + 1) + 8 * j);
                    [v57 timeRangeInContentToUse];
                    if (RCTimeRangeDeltaWithExactPrecision(v58, v59) > 2.22044605e-16) {
                      [v22 addObject:v57];
                    }
                  }
                  uint64_t v54 = [v52 countByEnumeratingWithState:&v139 objects:v149 count:16];
                }
                while (v54);
              }

              ++v27;
            }
            while (v27 != v25);
            uint64_t v83 = [v129 countByEnumeratingWithState:&v143 objects:v150 count:16];
            uint64_t v25 = v83;
          }
          while (v83);
LABEL_60:
          id v8 = v127;
          objc_msgSend(v127, "replaceObjectsInRange:withObjectsFromArray:", v126, v125, v22);

          uint64_t i = v128;
          id v9 = v130;
LABEL_61:
          for (unint64_t k = 0; k < [v8 count]; ++k)
          {
            v85 = [v8 objectAtIndexedSubscript:k];
            [v9 timeRangeInComposition];
            double v87 = v86;
            [v85 timeRangeInComposition];
            double v89 = v88;

            if (v87 <= v89) {
              break;
            }
          }
          v90 = (void *)[v9 mutableCopy];
          [v9 timeRangeInComposition];
          objc_msgSend(v90, "setTimeRangeInComposition:", RCTimeRangeMake(v91, 0.0));
          [v8 insertObject:v90 atIndex:k];
          [v9 timeRangeInContentToUse];
          double v94 = RCTimeRangeDeltaWithExactPrecision(v92, v93);
          [v9 timeRangeInComposition];
          double v97 = RCTimeRangeDeltaWithExactPrecision(v95, v96);
          unint64_t v98 = k + 1;
          if (v98 < [v8 count])
          {
            double v99 = v94 - v97;
            do
            {
              v100 = [v8 objectAtIndexedSubscript:v98];
              [v100 timeRangeInComposition];
              objc_msgSend(v100, "setTimeRangeInComposition:", RCTimeRangeShift(v101, v102, v99));

              ++v98;
            }
            while (v98 < [v8 count]);
          }
          long long v137 = 0u;
          long long v138 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          id v103 = v8;
          uint64_t v104 = [v103 countByEnumeratingWithState:&v135 objects:v148 count:16];
          if (v104)
          {
            uint64_t v105 = v104;
            uint64_t v106 = *(void *)v136;
            do
            {
              for (uint64_t m = 0; m != v105; ++m)
              {
                if (*(void *)v136 != v106) {
                  objc_enumerationMutation(v103);
                }
                v108 = *(void **)(*((void *)&v135 + 1) + 8 * m);
                [v108 timeRangeInContentToUse];
                double v111 = RCTimeRangeDeltaWithExactPrecision(v109, v110);
                [v108 timeRangeInComposition];
                unint64_t v113 = v112;
                [v108 timeRangeInComposition];
                double v115 = v111 + v114;
                v116.n128_u64[0] = v113;
                objc_msgSend(v108, "setTimeRangeInComposition:", RCTimeRangeMake(v116, v115));
              }
              uint64_t v105 = [v103 countByEnumeratingWithState:&v135 objects:v148 count:16];
            }
            while (v105);
          }
        }
        uint64_t v124 = [obj countByEnumeratingWithState:&v131 objects:v147 count:16];
      }
      while (v124);
LABEL_76:

      [v119 addObjectsFromArray:v123];
      [v123 removeAllObjects];
      char v3 = 0;
      uint64_t v2 = 1;
      if ((v120 & 1) == 0)
      {

        goto LABEL_79;
      }
    }
  }
  id v119 = [MEMORY[0x1E4F1C978] array];
LABEL_79:
  return v119;
}

+ (BOOL)_isSessionWithModificationAccessActiveForComposedAVURL:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__RCComposition__isSessionWithModificationAccessActiveForComposedAVURL___block_invoke;
  v7[3] = &unk_1E6496A40;
  id v8 = v3;
  id v9 = &v10;
  id v4 = v3;
  _accessActiveCaptureCompositionAVURLs(v7);
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __72__RCComposition__isSessionWithModificationAccessActiveForComposedAVURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_compositionByReplacingDecomposedFragments:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[(RCComposition *)self mutableCopy];
  [v5 setDecomposedFragments:v4];

  return v5;
}

- (void)_eaccess_repairDecomposedFragmentMetadataIfNecessary:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  char v5 = [(RCComposition *)self decomposedFragments];
  uint64_t v6 = [v5 count];
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  id v8 = [(RCComposition *)self decomposedFragments];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke;
  v11[3] = &unk_1E6496A68;
  char v13 = &v15;
  uint64_t v14 = v6;
  id v9 = v7;
  id v12 = v9;
  [v8 enumerateObjectsUsingBlock:v11];

  if (v4)
  {
    uint64_t v10 = [(RCComposition *)self _compositionByReplacingDecomposedFragments:v9];
    v4[2](v4, v10, *((unsigned __int8 *)v16 + 24));
  }
  _Block_object_dispose(&v15, 8);
}

void __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  id v7 = v5;
  if (*(void *)(a1 + 48) - 1 == a3)
  {
    [v5 contentDuration];
    id v7 = v6;
    if (v8 < 0.00000011920929)
    {
      id v9 = (void *)MEMORY[0x1E4F166C8];
      uint64_t v10 = [v6 AVOutputURL];
      uint64_t v11 = objc_msgSend(v9, "rc_preciseTimingAssetWithURL:", v10);

      if (v11)
      {
        id v7 = (void *)[v6 mutableCopy];
        objc_msgSend(v11, "rc_durationInSeconds");
        objc_msgSend(v7, "setContentDuration:");
        [v6 timeRangeInComposition];
        unint64_t v13 = v12;
        [v6 timeRangeInComposition];
        double v15 = v14;
        [v6 contentDuration];
        double v17 = v15 + v16;
        v18.n128_u64[0] = v13;
        objc_msgSend(v7, "setTimeRangeInComposition:", RCTimeRangeMake(v18, v17));
        [v7 contentDuration];
        double v20 = v19;
        v21.n128_u64[0] = 0;
        objc_msgSend(v7, "setTimeRangeInContentToUse:", RCTimeRangeMake(v21, v20));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        double v22 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke_cold_1(v6, v22);
        }

        id v7 = v6;
      }
    }
  }
  [v7 contentDuration];
  if (v23 <= 0.0) {
    [v6 deleteFromFilesystem];
  }
  else {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (void)rcs_composeToFinalDestinationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(RCComposition *)self _eaccess_repairDecomposedFragmentMetadataIfNecessary:0];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [(RCComposition *)self composedAVURL];
  id v7 = [v6 path];
  int v8 = [v5 fileExistsAtPath:v7 isDirectory:0];

  id v9 = [(RCComposition *)self decomposedFragments];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [[RCCompositionComposedAssetWriter alloc] initWithComposition:self];
    if (RCTestSlowMessageExportSeconds() > 0.0) {
      objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:");
    }
    int out_token = 0;
    if (RCRunningInSavedRecordingDaemon())
    {
      unint64_t v12 = NSString;
      unint64_t v13 = [(RCComposition *)self savedRecordingUUID];
      double v14 = [v12 stringWithFormat:@"%@.%@", @"RCFinalizationProgressNotificationName", v13];

      id v15 = v14;
      notify_register_check((const char *)[v15 UTF8String], &out_token);
      double v16 = (void *)MEMORY[0x1E4F1CB00];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke;
      void v28[3] = &unk_1E6496A90;
      double v17 = v11;
      int v31 = out_token;
      double v29 = v17;
      id v30 = v15;
      id v18 = v15;
      double v19 = [v16 timerWithTimeInterval:1 repeats:v28 block:0.1];
      double v20 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v20 addTimer:v19 forMode:*MEMORY[0x1E4F1C3A0]];
    }
    else
    {
      double v19 = 0;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke_2;
    v23[3] = &unk_1E6496AB8;
    int v27 = out_token;
    id v24 = v19;
    uint64_t v25 = self;
    id v26 = v4;
    id v22 = v19;
    [(RCCompositionComposedAssetWriter *)v11 writeCompositionWithCompletionBlock:v23];
  }
  else
  {
    if (v8) {
      __n128 v21 = self;
    }
    else {
      __n128 v21 = 0;
    }
    (*((void (**)(id, RCComposition *, void, void))v4 + 2))(v4, v21, 0, 0);
  }
}

uint64_t __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) progress];
  notify_set_state(*(_DWORD *)(a1 + 48), v2);
  id v3 = (const char *)[*(id *)(a1 + 40) UTF8String];
  return notify_post(v3);
}

void __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    [v7 invalidate];
    notify_cancel(*(_DWORD *)(a1 + 56));
  }
  id v8 = v6;
  id v9 = v8;
  if (v5)
  {
    uint64_t v10 = [*(id *)(a1 + 40) _compositionByReplacingDecomposedFragments:MEMORY[0x1E4F1CBF0]];
    uint64_t v11 = (void *)[v10 mutableCopy];

    unint64_t v12 = [v11 composedAVURL];
    unint64_t v13 = [v5 pathExtension];
    double v14 = objc_msgSend(v12, "rc_URLByReplacingPathExtensionWithExtension:", v13);
    [v11 setComposedAVURL:v14];

    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    double v16 = [v11 composedAVURL];
    id v22 = 0;
    int v17 = [v15 moveItemAtURL:v5 toURL:v16 error:&v22];
    id v18 = v22;

    if (v17)
    {
      [v11 saveMetadataToDefaultLocation];
      id v19 = v11;
      id v20 = v9;
    }
    else
    {
      id v20 = v18;

      __n128 v21 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke_2_cold_1();
      }

      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
    id v20 = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)rcs_repairDecomposedFragmentMetadataIfNecessary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__RCComposition_rcs_repairDecomposedFragmentMetadataIfNecessary___block_invoke;
  v6[3] = &unk_1E6496AE0;
  id v7 = v4;
  id v5 = v4;
  [(RCComposition *)self _eaccess_repairDecomposedFragmentMetadataIfNecessary:v6];
}

void __65__RCComposition_rcs_repairDecomposedFragmentMetadataIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [v6 saveMetadataToDefaultLocation];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v6, a3);
  }
}

- (BOOL)rcs_allAssetsAreMissing
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(RCComposition *)self composedAVURL];
  char v4 = [v3 checkResourceIsReachableAndReturnError:0];

  if (v4) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(RCComposition *)self decomposedFragments];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) AVOutputURL];
        char v12 = [v11 checkResourceIsReachableAndReturnError:0];

        if (v12)
        {
          BOOL v5 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

- (id)moveTo:(id)a3 recordingID:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = [(RCComposition *)self composedAVURL];
  unint64_t v13 = +[RCComposition compositionBundleURLForComposedAVURL:v12];

  long long v14 = +[RCComposition compositionBundleURLForComposedAVURL:v9];
  if ([v11 moveItemAtURL:v13 toURL:v14 error:a5])
  {
    id v30 = v14;
    double v32 = v13;
    id v33 = v11;
    id v34 = v10;
    long long v15 = (id *)[(RCComposition *)self mutableCopy];
    objc_storeStrong(v15 + 7, a3);
    objc_storeStrong(v15 + 8, a4);
    id v35 = v9;
    long long v16 = [(id)objc_opt_class() _compositionFragmentsFolderForComposedAVURL:v9];
    long long v17 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v31 = v15;
    id v18 = [v15 decomposedFragments];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v24 = (void *)[v23 mutableCopy];
          uint64_t v25 = [v23 AVOutputURL];
          id v26 = [v25 lastPathComponent];
          int v27 = [v16 URLByAppendingPathComponent:v26];
          [v24 setAVOutputURL:v27];

          [v17 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v20);
    }

    long long v28 = v31;
    [v31 setDecomposedFragments:v17];
    [v31 saveMetadataToDefaultLocation];

    id v10 = v34;
    id v9 = v35;
    unint64_t v13 = v32;
    uint64_t v11 = v33;
    long long v14 = v30;
  }
  else
  {
    long long v28 = 0;
  }

  return v28;
}

- (NSURL)composedAVURL
{
  return self->_composedAVURL;
}

- (void)setComposedAVURL:(id)a3
{
}

- (NSString)savedRecordingUUID
{
  return self->_savedRecordingUUID;
}

- (void)setSavedRecordingUUID:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDictionary)musicMemoMetadata
{
  return self->_musicMemoMetadata;
}

- (void)setMusicMemoMetadata:(id)a3
{
}

- (NSArray)decomposedFragments
{
  return self->_decomposedFragments;
}

- (BOOL)cachedComposedAVURLDerivedValuesAreValid
{
  return self->_cachedComposedAVURLDerivedValuesAreValid;
}

- (void)setCachedComposedAVURLDerivedValuesAreValid:(BOOL)a3
{
  self->_cachedComposedAVURLDerivedValuesAreValid = a3;
}

- (double)cachedComposedAVURLDuration
{
  return self->_cachedComposedAVURLDuration;
}

- (void)setCachedComposedAVURLDuration:(double)a3
{
  self->_cachedComposedAVURLDuration = a3;
}

- (BOOL)cachedHasMultipleTracks
{
  return self->_cachedHasMultipleTracks;
}

- (void)setCachedHasMultipleTracks:(BOOL)a3
{
  self->_cachedHasMultipleTracks = a3;
}

- (NSObject)composedFragmentsMutex
{
  return self->_composedFragmentsMutex;
}

- (void)setComposedFragmentsMutex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedFragmentsMutex, 0);
  objc_storeStrong((id *)&self->_decomposedFragments, 0);
  objc_storeStrong((id *)&self->_musicMemoMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_savedRecordingUUID, 0);
  objc_storeStrong((id *)&self->_composedAVURL, 0);
  objc_storeStrong((id *)&self->_composedFragments, 0);
}

- (id)playableAsset:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(RCComposition *)self composedAVURL];
  uint64_t v7 = [v6 path];
  int v8 = [v5 fileExistsAtPath:v7 isDirectory:0];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F166C8];
    id v10 = [(RCComposition *)self composedAVURL];
    uint64_t v11 = [v9 assetWithURL:v10];

    char v12 = objc_msgSend(v11, "rc_audioTracks");
    uint64_t v13 = [v12 count];

    if (v13)
    {
      a3 = v11;
    }
    else if (a3)
    {
      long long v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F289D0];
      long long v15 = [(RCComposition *)self composedAVURL];
      v19[0] = v15;
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a3 = [v14 errorWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:1 userInfo:v16];

      a3 = 0;
    }
  }
  else
  {
    a3 = [(RCComposition *)self _compositionAsset:a3];
  }

  return a3;
}

- (id)_compositionAsset:(id *)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F16590];
  uint64_t v25 = *MEMORY[0x1E4F16148];
  v26[0] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  uint64_t v7 = [v5 compositionWithURLAssetInitializationOptions:v6];

  int v8 = [(RCComposition *)self composedAVURL];
  objc_msgSend(v7, "rc_setComposedAVURL:", v8);

  id v9 = objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__RCComposition_RCAVFoundation___compositionAsset___block_invoke;
  v22[3] = &unk_1E6497098;
  id v10 = v9;
  id v23 = v10;
  id v11 = v7;
  id v24 = v11;
  char v12 = (void *)MEMORY[0x1C8778060](v22);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __51__RCComposition_RCAVFoundation___compositionAsset___block_invoke_2;
  v20[3] = &unk_1E64970C0;
  id v13 = v12;
  id v21 = v13;
  id v19 = 0;
  BOOL v14 = [(RCComposition *)self _enumerateTracksForInsertion:v20 error:&v19];
  id v15 = v19;
  if (v14)
  {
    id v16 = v11;
  }
  else
  {
    long long v17 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[RCComposition(RCAVFoundation) _compositionAsset:]((uint64_t)v15, v17);
    }

    id v16 = 0;
    if (a3) {
      *a3 = v15;
    }
  }

  return v16;
}

id __51__RCComposition_RCAVFoundation___compositionAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  char v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    char v4 = [*(id *)(a1 + 40) addMutableTrackWithMediaType:*MEMORY[0x1E4F15BA8] preferredTrackID:0];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

uint64_t __51__RCComposition_RCAVFoundation___compositionAsset___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _OWORD *a4, long long *a5, uint64_t a6)
{
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void (**)(uint64_t, uint64_t))(v10 + 16);
  id v12 = a3;
  id v13 = v11(v10, a2);
  long long v14 = a4[1];
  v19[0] = *a4;
  v19[1] = v14;
  void v19[2] = a4[2];
  long long v17 = *a5;
  uint64_t v18 = *((void *)a5 + 2);
  uint64_t v15 = [v13 insertTimeRange:v19 ofTrack:v12 atTime:&v17 error:a6];

  return v15;
}

- (BOOL)_enumerateTracksForInsertion:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  id v6 = [(RCComposition *)self composedFragments];
  if ([v6 count])
  {
    uint64_t v7 = objc_opt_new();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __68__RCComposition_RCAVFoundation___enumerateTracksForInsertion_error___block_invoke;
    v48[3] = &unk_1E64970E8;
    id v36 = v7;
    id v49 = v36;
    int v8 = (void (**)(void, void))MEMORY[0x1C8778060](v48);
    unint64_t v9 = 0;
    char v10 = 1;
    long long v11 = 0uLL;
    do
    {
      char v12 = v10;
      long long v46 = v11;
      long long v47 = v11;
      long long v44 = v11;
      long long v45 = v11;
      obuint64_t j = [v6 fragmentsWithTrackIndex:v9];
      uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v45;
        long long v37 = v6;
        char v35 = v12;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v45 != v15) {
              objc_enumerationMutation(obj);
            }
            long long v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v18 = [v17 AVOutputURL];
            id v19 = ((void (**)(void, void *))v8)[2](v8, v18);

            uint64_t v20 = objc_msgSend(v19, "rc_audioTracks");
            uint64_t v21 = [v20 count];
            if (!v21)
            {
              id v30 = OSLogForCategory(@"Service");
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
                -[RCComposition(RCAVFoundation) _enumerateTracksForInsertion:error:](v30);
              }

              if (a4)
              {
                int v31 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v50 = *MEMORY[0x1E4F289D0];
                double v32 = [v17 AVOutputURL];
                BOOL v51 = v32;
                id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
                *a4 = [v31 errorWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:1 userInfo:v33];
              }
LABEL_22:

              LOBYTE(v9) = 0;
              id v6 = v37;
              goto LABEL_23;
            }
            unint64_t v22 = v21;
            memset(&v43, 0, sizeof(v43));
            [v17 timeRangeInContentToUse];
            CMTimeRangeFromRCTimeRange(&v43, v23, v24);
            memset(&v42, 0, sizeof(v42));
            [v17 timeRangeInComposition];
            CMTimeMakeWithSeconds(&v42, v25, kCMDefaultTimeScale);
            if (v9 >= v22) {
              unint64_t v26 = 0;
            }
            else {
              unint64_t v26 = v9;
            }
            int v27 = [v20 objectAtIndexedSubscript:v26];
            long long v28 = (uint64_t (*)(void *, unint64_t, void *, CMTimeRange *, CMTime *, id *))v5[2];
            CMTimeRange v41 = v43;
            CMTime v40 = v42;
            int v29 = v28(v5, v9, v27, &v41, &v40, a4);

            if (!v29) {
              goto LABEL_22;
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
          id v6 = v37;
          char v12 = v35;
          if (v14) {
            continue;
          }
          break;
        }
      }

      char v10 = 0;
      unint64_t v9 = 1;
      long long v11 = 0uLL;
    }
    while ((v12 & 1) != 0);
LABEL_23:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

id __68__RCComposition_RCAVFoundation___enumerateTracksForInsertion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F166C8], "rc_preciseTimingAssetWithURL:", v3);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

- (id)bufferEnumerator:(id)a3 startTime:(double)a4 error:(id *)a5
{
  id v8 = a3;
  unint64_t v9 = [[RCAudioBufferEnumerator alloc] initWithComposition:self processingFormat:v8 startTime:a5 error:a4];

  return v9;
}

- (void)initWithDictionaryPListRepresentation:(id *)a1 .cold.1(id *a1)
{
  uint64_t v1 = [*a1 path];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1C3964000, v2, v3, "%s -- WARNING: bogus path (%@) detected for composition %@", v4, v5, v6, v7, 2u);
}

+ (void)_compositionLoadedFromMetadataURL:composedAVURL:savedRecordingUUID:creationDate:createIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- ERROR: unable to load composition.  Encountered error = %@ while loading.", v2, v3, v4, v5, 2u);
}

+ (void)_compositionLoadedFromMetadataURL:savedRecording:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- ERROR: unable to load composition.  Encountered error = %@ while loading.", v2, v3, v4, v5, 2u);
}

- (void)compositionByOverdubbingWithFragment:(double)a1 .cold.1(double a1, double a2)
{
  id v8 = NSStringFromRCTimeRange(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_1C3964000, v2, v3, "%s -- Invalid fragment times:  %@, composedTimeRange = %@", v4, v5, v6, v7, 2u);
}

- (void)newRandomFragmentWithInsertionTimeRangeInComposition:(void *)a1 trackIndex:pathExtension:.cold.1(void *a1)
{
  uint64_t v1 = [a1 URLByDeletingLastPathComponent];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1C3964000, v2, v3, "%s -- ERROR: couldn't createDirectoryAtURL %@, error = %@", v4, v5, v6, v7, 2u);
}

- (void)saveMetadataToDefaultLocation
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- ERROR: unable to convert property list to data, error = %@", v2, v3, v4, v5, 2u);
}

void __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 valueForKeyPath:@"path.lastPathComponent"];
  uint64_t v2 = [v1 allObjects];
  uint64_t v3 = [v2 componentsJoinedByString:@", "];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v4, v5, "%s -- current compositionAVURLs being modified: [ %@ ]", v6, v7, v8, v9, 2u);
}

void __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 AVOutputURL];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR:  could not open fragment URL = %@", (uint8_t *)v4, 0x16u);
}

void __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1C3964000, v0, v1, "%s -- ERROR: moveError = %@", v2, v3, v4, v5, 2u);
}

@end