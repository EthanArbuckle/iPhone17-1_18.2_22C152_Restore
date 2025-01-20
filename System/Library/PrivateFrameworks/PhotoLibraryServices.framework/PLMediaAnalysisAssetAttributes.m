@interface PLMediaAnalysisAssetAttributes
+ (id)entityName;
+ (id)fetchRequest;
- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)animatedStickerTimeRange;
- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)bestVideoTimeRange;
- (void)prepareForDeletion;
- (void)resetCharacterRecognitionAttributes;
- (void)setAnimatedStickerTimeRange:(id *)a3;
- (void)setBestVideoTimeRange:(id *)a3;
- (void)setCharacterRecognitionData:(id)a3 machineReadableCodeData:(id)a4 algorithmVersion:(signed __int16)a5 adjustmentVersion:(id)a6;
- (void)setStickerConfidenceScore:(float)a3 stickerAlgorithmVersion:(signed __int16)a4;
- (void)setVisualSearchData:(id)a3 algorithmVersion:(signed __int16)a4 adjustmentVersion:(id)a5;
- (void)willSave;
@end

@implementation PLMediaAnalysisAssetAttributes

+ (id)entityName
{
  return @"MediaAnalysisAssetAttributes";
}

- (void)willSave
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)PLMediaAnalysisAssetAttributes;
  [(PLManagedObject *)&v29 willSave];
  v3 = [(PLMediaAnalysisAssetAttributes *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  v4 = [(PLMediaAnalysisAssetAttributes *)self changedValues];
  v5 = [v4 objectForKeyedSubscript:@"syndicationProcessingValue"];

  if (v5)
  {
    v6 = [(PLMediaAnalysisAssetAttributes *)self asset];
    objc_msgSend(v6, "updateSyndicationStateWithSyndicationProcessingValue:", -[PLMediaAnalysisAssetAttributes syndicationProcessingValue](self, "syndicationProcessingValue"));

    if (PLPlatformMomentsSupported())
    {
      if ([(PLMediaAnalysisAssetAttributes *)self isUpdated])
      {
        v7 = [(PLMediaAnalysisAssetAttributes *)self asset];
        char v8 = [v7 needsMomentUpdate];

        if ((v8 & 1) == 0)
        {
          v9 = PLMomentsGetLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v10 = [(PLMediaAnalysisAssetAttributes *)self asset];
            v11 = [v10 objectID];
            *(_DWORD *)buf = 138412290;
            v31 = v11;
            _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Adding asset %@ to be updated in moments due to relevant MediaAnalysisAttributes change", buf, 0xCu);
          }
          v12 = [(PLMediaAnalysisAssetAttributes *)self asset];
          [v12 setNeedsMomentUpdate:1];

          v13 = [v3 delayedSaveActions];
          v14 = [(PLMediaAnalysisAssetAttributes *)self asset];
          [v13 recordAssetForMomentUpdate:v14];
        }
      }
    }
  }
  v15 = [v4 objectForKeyedSubscript:@"exposureScore"];

  if (v15)
  {
    [(PLMediaAnalysisAssetAttributes *)self exposureScore];
    float v17 = v16;
    v18 = [(PLMediaAnalysisAssetAttributes *)self asset];
    v19 = [v18 additionalAttributes];
    v20 = v19;
    if (v17 == 0.0)
    {
      uint64_t v21 = 32;
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v22 = 32;
    }
    [v19 addDuplicateDetectorPerceptualProcessingStates:v21 removeProcessingStates:v22];
  }
  v23 = [v4 objectForKeyedSubscript:@"characterRecognitionAttributes"];
  if (v23)
  {

    goto LABEL_17;
  }
  v24 = [v4 objectForKeyedSubscript:@"mediaAnalysisTimeStamp"];

  if (v24)
  {
LABEL_17:
    v25 = [(PLMediaAnalysisAssetAttributes *)self asset];
    int v26 = [v25 isReadyForPurgeSyndicationResources];

    if (v26)
    {
      v27 = [(PLMediaAnalysisAssetAttributes *)self asset];
      [v27 purgeSyndicationResourcesAfterMediaAnalysisProcessing];
    }
  }
  if (PLPlatformSearchSupported())
  {
    v28 = [v3 delayedSaveActions];
    [v28 recordMediaAnalysisAssetAttributesForSearchIndexUpdate:self];
  }
  if (([(PLMediaAnalysisAssetAttributes *)self isDeleted] & 1) == 0) {
    +[PLDelayedSearchIndexUpdates recordMediaAnalysisAssetAttributesIfNeeded:self];
  }

LABEL_24:
}

- (void)prepareForDeletion
{
  v5.receiver = self;
  v5.super_class = (Class)PLMediaAnalysisAssetAttributes;
  [(PLManagedObject *)&v5 prepareForDeletion];
  objc_opt_class();
  v3 = [(PLMediaAnalysisAssetAttributes *)self managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }

  if (v4) {
    +[PLDelayedSearchIndexUpdates recordMediaAnalysisAssetAttributesIfNeeded:self];
  }
}

- (void)setStickerConfidenceScore:(float)a3 stickerAlgorithmVersion:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v10 = [(PLMediaAnalysisAssetAttributes *)self visualSearchAttributes];
  if (!v10)
  {
    v7 = [(PLMediaAnalysisAssetAttributes *)self managedObjectContext];
    id v10 = +[PLManagedObject insertInManagedObjectContext:v7];
    if (v10) {
      [(PLMediaAnalysisAssetAttributes *)self setVisualSearchAttributes:v10];
    }
  }
  char v8 = [(PLMediaAnalysisAssetAttributes *)self asset];
  *(float *)&double v9 = a3;
  [v8 setStickerConfidenceScore:v9];

  [(PLMediaAnalysisAssetAttributes *)self setVisualSearchStickerConfidenceVersion:v4];
}

- (void)setVisualSearchData:(id)a3 algorithmVersion:(signed __int16)a4 adjustmentVersion:(id)a5
{
  uint64_t v6 = a4;
  id v11 = a3;
  id v8 = a5;
  double v9 = [(PLMediaAnalysisAssetAttributes *)self visualSearchAttributes];
  if (!v9)
  {
    id v10 = [(PLMediaAnalysisAssetAttributes *)self managedObjectContext];
    double v9 = +[PLManagedObject insertInManagedObjectContext:v10];
    if (v9) {
      [(PLMediaAnalysisAssetAttributes *)self setVisualSearchAttributes:v9];
    }
  }
  [v9 setVisualSearchData:v11];
  [(PLMediaAnalysisAssetAttributes *)self setVisualSearchVersion:v6];
  [v9 setAdjustmentVersion:v8];
}

- (void)resetCharacterRecognitionAttributes
{
  id v4 = [(PLMediaAnalysisAssetAttributes *)self characterRecognitionAttributes];
  if (v4)
  {
    v3 = [(PLMediaAnalysisAssetAttributes *)self managedObjectContext];
    [v3 deleteObject:v4];

    [(PLMediaAnalysisAssetAttributes *)self setCharacterRecognitionAttributes:0];
  }
  [(PLMediaAnalysisAssetAttributes *)self setCharacterRecognitionVersion:0];
}

- (void)setCharacterRecognitionData:(id)a3 machineReadableCodeData:(id)a4 algorithmVersion:(signed __int16)a5 adjustmentVersion:(id)a6
{
  uint64_t v7 = a5;
  id v14 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = [(PLMediaAnalysisAssetAttributes *)self characterRecognitionAttributes];
  if (!v12)
  {
    v13 = [(PLMediaAnalysisAssetAttributes *)self managedObjectContext];
    v12 = +[PLManagedObject insertInManagedObjectContext:v13];
    if (v12) {
      [(PLMediaAnalysisAssetAttributes *)self setCharacterRecognitionAttributes:v12];
    }
  }
  [v12 setCharacterRecognitionData:v14];
  [v12 setMachineReadableCodeData:v11];

  [v12 setAdjustmentVersion:v10];
  [(PLMediaAnalysisAssetAttributes *)self setCharacterRecognitionVersion:v7];
}

- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)animatedStickerTimeRange
{
  memset(&v9, 0, sizeof(v9));
  CMTimeMake(&v9, [(PLMediaAnalysisAssetAttributes *)self animatedStickerRangeStartValue], [(PLMediaAnalysisAssetAttributes *)self animatedStickerRangeStartTimeScale]);
  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, [(PLMediaAnalysisAssetAttributes *)self animatedStickerRangeDurationValue], [(PLMediaAnalysisAssetAttributes *)self animatedStickerRangeDurationTimeScale]);
  CMTime start = v9;
  CMTime v6 = v8;
  return ($73DE6CFC58B34F5FFCF9CF852B54AD9C *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v6);
}

- (void)setAnimatedStickerTimeRange:(id *)a3
{
  uint64_t var1 = a3->var0.var1;
  [(PLMediaAnalysisAssetAttributes *)self setAnimatedStickerRangeStartValue:a3->var0.var0];
  [(PLMediaAnalysisAssetAttributes *)self setAnimatedStickerRangeStartTimeScale:var1];
  int64_t var0 = a3->var1.var0;
  uint64_t v7 = a3->var1.var1;
  [(PLMediaAnalysisAssetAttributes *)self setAnimatedStickerRangeDurationValue:var0];
  [(PLMediaAnalysisAssetAttributes *)self setAnimatedStickerRangeDurationTimeScale:v7];
}

- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)bestVideoTimeRange
{
  memset(&v9, 0, sizeof(v9));
  CMTimeMake(&v9, [(PLMediaAnalysisAssetAttributes *)self bestVideoRangeStartValue], [(PLMediaAnalysisAssetAttributes *)self bestVideoRangeStartTimeScale]);
  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, [(PLMediaAnalysisAssetAttributes *)self bestVideoRangeDurationValue], [(PLMediaAnalysisAssetAttributes *)self bestVideoRangeDurationTimeScale]);
  CMTime start = v9;
  CMTime v6 = v8;
  return ($73DE6CFC58B34F5FFCF9CF852B54AD9C *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v6);
}

- (void)setBestVideoTimeRange:(id *)a3
{
  uint64_t var1 = a3->var0.var1;
  [(PLMediaAnalysisAssetAttributes *)self setBestVideoRangeStartValue:a3->var0.var0];
  [(PLMediaAnalysisAssetAttributes *)self setBestVideoRangeStartTimeScale:var1];
  int64_t var0 = a3->var1.var0;
  uint64_t v7 = a3->var1.var1;
  [(PLMediaAnalysisAssetAttributes *)self setBestVideoRangeDurationValue:var0];
  [(PLMediaAnalysisAssetAttributes *)self setBestVideoRangeDurationTimeScale:v7];
}

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"MediaAnalysisAssetAttributes"];
  return v2;
}

@end