@interface PLAdditionalAssetAttributes
+ (BOOL)shouldPersistImportedByDisplayName:(id)a3;
+ (id)descriptionForDestinationAssetCopyState:(signed __int16)a3;
+ (id)entityName;
+ (id)listOfSyncedProperties;
+ (id)newExtraDurationDataFromStillDisplayTime:(id *)a3 videoDuration:(id *)a4;
+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToFaceVersion:(id)a3 noindex:(BOOL)a4;
+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestFaceVersionWithNoindex:(BOOL)a3;
+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestSceneVersionWithNoindex:(BOOL)a3;
+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToSceneVersion:(id)a3 noindex:(BOOL)a4;
+ (id)predicateToIncludeOnlyAllowedForAnalysisWithNoindex:(BOOL)a3;
+ (void)fromExtraDurationData:(id)a3 getStillDisplayTime:(id *)a4 videoDuration:(id *)a5;
- (BOOL)containsDuplicateDetectorPerceptualProcessingState:(unsigned __int16)a3;
- (BOOL)hasCloudRecoveryStateFlagSet:(unint64_t)a3;
- (BOOL)hasConsistentCloudState;
- (BOOL)hasDuplicateMatchingData;
- (BOOL)isSyncableChange;
- (BOOL)isUserInterfaceChange;
- (BOOL)supportsCloudUpload;
- (CLLocation)_cachedShiftedLocation;
- (CLLocation)shiftedLocation;
- (CPLScopedIdentifier)sourceAssetForDuplicationCPLScopedIdentifier;
- (NSData)mediaMetadataData;
- (NSString)longDescription;
- (PLSpatialOverCaptureInformation)spatialOverCaptureInformation;
- (id)allSceneClassifications;
- (id)duplicateSortPropertyNames;
- (id)duplicateSortPropertyNamesSkip;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (signed)viewPresentation;
- (void)_setCachedShiftedLocation:(id)a3;
- (void)_updateInferredTimeZoneOffsetWithChangedValues:(id)a3;
- (void)addDuplicateDetectorPerceptualProcessingStates:(unsigned __int16)a3 removeProcessingStates:(unsigned __int16)a4;
- (void)appendLibraryScopeAssetContributorsToUpdate:(id)a3;
- (void)correctOriginalOrientationIfRequired;
- (void)recalculatehasPeopleSceneMidOrGreaterConfidence;
- (void)removeCloudRecoveryStateFlag:(unint64_t)a3;
- (void)resetCloudRecoveryState;
- (void)setCloudRecoveryStateFlag:(unint64_t)a3;
- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4 processingSucceeded:(BOOL)a5;
- (void)setLongDescription:(id)a3;
- (void)setMediaMetadataData:(id)a3;
- (void)setMontage:(id)a3;
- (void)setSceneprintWithData:(id)a3;
- (void)setShiftedLocation:(id)a3;
- (void)setShiftedLocationIsValid:(BOOL)a3;
- (void)setSourceAssetForDuplicationCPLScopedIdentifier:(id)a3;
- (void)truncatedOriginalCheckChangedValues:(id)a3;
- (void)updateAllowedForAnalysis;
- (void)willSave;
@end

@implementation PLAdditionalAssetAttributes

+ (void)fromExtraDurationData:(id)a3 getStillDisplayTime:(id *)a4 videoDuration:(id *)a5
{
  id v7 = a3;
  long long v8 = *MEMORY[0x1E4F1F9F8];
  int64_t v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v10 = v8;
  int64_t v11 = v9;
  if ((unint64_t)[v7 length] >= 0x30) {
    [v7 getBytes:&v8 length:48];
  }
  if (a4)
  {
    *(_OWORD *)&a4->var0 = v8;
    a4->var3 = v9;
  }
  if (a5)
  {
    *(_OWORD *)&a5->var0 = v10;
    a5->var3 = v11;
  }
}

+ (id)newExtraDurationDataFromStillDisplayTime:(id *)a3 videoDuration:(id *)a4
{
  v5[0] = *a3;
  v5[1] = *a4;
  return (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:48];
}

- (id)duplicateSortPropertyNamesSkip
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)duplicateSortPropertyNames
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"keywords";
  v4[1] = @"title";
  v4[2] = @"timeZoneOffset";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  v5 = [(PLAdditionalAssetAttributes *)self asset];
  if ([v5 isValidForJournalPersistence]) {
    v6 = [[PLAssetJournalEntryPayload alloc] initWithAdditionalAssetAttributes:self changedKeys:v4];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (id)payloadID
{
  v2 = [(PLAdditionalAssetAttributes *)self asset];
  v3 = [v2 uuid];
  id v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)_setCachedShiftedLocation:(id)a3
{
}

- (CLLocation)_cachedShiftedLocation
{
  return self->__cachedShiftedLocation;
}

- (signed)viewPresentation
{
  [(PLAdditionalAssetAttributes *)self willAccessValueForKey:@"viewPresentation"];
  v3 = [(PLAdditionalAssetAttributes *)self primitiveValueForKey:@"viewPresentation"];
  signed __int16 v4 = [v3 unsignedShortValue];

  [(PLAdditionalAssetAttributes *)self didAccessValueForKey:@"viewPresentation"];
  if (v4 <= 1) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)allSceneClassifications
{
  v3 = [(PLAdditionalAssetAttributes *)self sceneClassifications];
  signed __int16 v4 = [(PLAdditionalAssetAttributes *)self temporalSceneClassifications];
  v5 = [v4 allObjects];
  v6 = [v3 setByAddingObjectsFromArray:v5];

  return v6;
}

- (BOOL)containsDuplicateDetectorPerceptualProcessingState:(unsigned __int16)a3
{
  int v3 = a3;
  int v4 = [(PLAdditionalAssetAttributes *)self duplicateDetectorPerceptualProcessingState];
  if (v3) {
    return (v3 & ~v4) == 0;
  }
  else {
    return v4 == 0;
  }
}

- (void)addDuplicateDetectorPerceptualProcessingStates:(unsigned __int16)a3 removeProcessingStates:(unsigned __int16)a4
{
  uint64_t v5 = ([(PLAdditionalAssetAttributes *)self duplicateDetectorPerceptualProcessingState] | a3) & ~a4;
  if (v5 != [(PLAdditionalAssetAttributes *)self duplicateDetectorPerceptualProcessingState])
  {
    [(PLAdditionalAssetAttributes *)self setDuplicateDetectorPerceptualProcessingState:v5];
  }
}

- (void)appendLibraryScopeAssetContributorsToUpdate:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    int v4 = [(PLAdditionalAssetAttributes *)self libraryScopeAssetContributorsToUpdate];
    id v5 = (id)[v4 mutableCopy];

    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    v6 = [v7 allObjects];
    [v5 addObjectsFromArray:v6];

    [(PLAdditionalAssetAttributes *)self setLibraryScopeAssetContributorsToUpdate:v5];
  }
}

- (void)setShiftedLocationIsValid:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLAdditionalAssetAttributes *)self willChangeValueForKey:@"shiftedLocationIsValid"];
  id v5 = [NSNumber numberWithBool:v3];
  [(PLAdditionalAssetAttributes *)self setPrimitiveValue:v5 forKey:@"shiftedLocationIsValid"];

  [(PLAdditionalAssetAttributes *)self didChangeValueForKey:@"shiftedLocationIsValid"];
  if (!v3)
  {
    v6 = [(PLAdditionalAssetAttributes *)self asset];
    id v13 = [v6 location];

    if (v13)
    {
      [v13 coordinate];
      double v8 = v7;
      double v10 = v9;
    }
    else
    {
      double v8 = *MEMORY[0x1E4F1E750];
      double v10 = *(double *)(MEMORY[0x1E4F1E750] + 8);
    }
    int64_t v11 = [(PLAdditionalAssetAttributes *)self asset];
    [v11 setLatitude:v8];

    v12 = [(PLAdditionalAssetAttributes *)self asset];
    [v12 setLongitude:v10];
  }
}

- (CLLocation)shiftedLocation
{
  [(PLAdditionalAssetAttributes *)self willAccessValueForKey:@"shiftedLocation"];
  id v3 = [(PLAdditionalAssetAttributes *)self _cachedShiftedLocation];
  [(PLAdditionalAssetAttributes *)self didAccessValueForKey:@"shiftedLocation"];
  if (!v3)
  {
    int v4 = [(PLAdditionalAssetAttributes *)self shiftedLocationData];
    id v3 = +[PLManagedAsset newLocationFromLocationData:v4 timestampIfMissing:0];
    if (v3)
    {
      [(PLAdditionalAssetAttributes *)self willChangeValueForKey:@"shiftedLocation"];
      [(PLAdditionalAssetAttributes *)self _setCachedShiftedLocation:v3];
      [(PLAdditionalAssetAttributes *)self didChangeValueForKey:@"shiftedLocation"];
    }
  }
  return (CLLocation *)v3;
}

- (void)updateAllowedForAnalysis
{
  id v5 = [(PLAdditionalAssetAttributes *)self asset];
  uint64_t v3 = [v5 calculateAllowedForAnalysis];
  int v4 = [NSNumber numberWithBool:v3];
  [(PLManagedObject *)self pl_safeSetValue:v4 forKey:@"allowedForAnalysis" valueDidChangeHandler:0];
}

- (void)setMontage:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PLAdditionalAssetAttributes_setMontage___block_invoke;
  v3[3] = &unk_1E5870818;
  v3[4] = self;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"montage" valueDidChangeHandler:v3];
}

uint64_t __42__PLAdditionalAssetAttributes_setMontage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAllowedForAnalysis];
}

- (void)setShiftedLocation:(id)a3
{
  id v15 = a3;
  [(PLAdditionalAssetAttributes *)self willChangeValueForKey:@"shiftedLocation"];
  [(PLAdditionalAssetAttributes *)self _setCachedShiftedLocation:v15];
  [(PLAdditionalAssetAttributes *)self didChangeValueForKey:@"shiftedLocation"];
  id v4 = +[PLManagedAsset newLocationDataFromLocation:v15];
  [(PLAdditionalAssetAttributes *)self setShiftedLocationData:v4];
  if (v4)
  {
    [v15 coordinate];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v9 = [(PLAdditionalAssetAttributes *)self asset];
    double v10 = [v9 location];

    if (v10)
    {
      [v10 coordinate];
      double v6 = v11;
      double v8 = v12;
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1E750];
      double v8 = *(double *)(MEMORY[0x1E4F1E750] + 8);
    }
  }
  id v13 = [(PLAdditionalAssetAttributes *)self asset];
  [v13 setLatitude:v6];

  v14 = [(PLAdditionalAssetAttributes *)self asset];
  [v14 setLongitude:v8];
}

- (void)recalculatehasPeopleSceneMidOrGreaterConfidence
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(PLAdditionalAssetAttributes *)self sceneClassifications];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 sceneIdentifier] == 881)
        {
          [v7 confidence];
          if (v8 >= 0.5)
          {
            uint64_t v4 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  double v9 = [NSNumber numberWithBool:v4];
  [(PLManagedObject *)self pl_safeSetValue:v9 forKey:@"hasPeopleSceneMidOrGreaterConfidence" valueDidChangeHandler:0];
}

- (void)willSave
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  v96.receiver = self;
  v96.super_class = (Class)PLAdditionalAssetAttributes;
  [(PLManagedObject *)&v96 willSave];
  uint64_t v3 = [(PLAdditionalAssetAttributes *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_85;
  }
  uint64_t v4 = [(PLAdditionalAssetAttributes *)self asset];
  char v5 = [v4 isDeleted];

  if ((v5 & 1) == 0)
  {
    v94 = v3;
    double v6 = [(PLAdditionalAssetAttributes *)self changedValues];
    BOOL v7 = [(PLAdditionalAssetAttributes *)self isSyncableChange];
    BOOL v8 = [(PLAdditionalAssetAttributes *)self isUserInterfaceChange];
    double v9 = [(PLAdditionalAssetAttributes *)self asset];
    long long v10 = [v9 changedValues];
    long long v11 = [v10 objectForKeyedSubscript:@"modificationDate"];
    if (v11 || !v7 && !v8)
    {
    }
    else
    {
      long long v12 = [(PLAdditionalAssetAttributes *)self asset];
      char v13 = [v12 isFinderSyncedAsset];

      if (v13)
      {
LABEL_9:
        uint64_t v14 = [v6 objectForKeyedSubscript:@"placeAnnotationData"];

        v93 = [v6 objectForKeyedSubscript:@"publicGlobalUUID"];

        uint64_t v15 = [v6 objectForKeyedSubscript:@"title"];

        [v6 objectForKeyedSubscript:@"accessibilityDescription"];
        v83 = uint64_t v82 = v15;
        uint64_t v91 = v15 | v83;

        uint64_t v16 = [v6 objectForKeyedSubscript:@"timeZoneName"];

        v85 = [v6 objectForKeyedSubscript:@"timeZoneOffset"];

        uint64_t v17 = [v6 objectForKeyedSubscript:@"importedBy"];

        uint64_t v18 = [v6 objectForKeyedSubscript:@"spatialOverCaptureGroupIdentifier"];

        uint64_t v19 = [v6 objectForKeyedSubscript:@"syndicationIdentifier"];

        uint64_t v20 = [v6 objectForKeyedSubscript:@"libraryScopeAssetContributorsToUpdate"];

        uint64_t v21 = [v6 objectForKeyedSubscript:@"syndicationHistory"];

        uint64_t v22 = [v6 objectForKeyedSubscript:@"sceneAnalysisIsFromPreview"];

        uint64_t v88 = v14;
        uint64_t v84 = v16;
        uint64_t v86 = v18;
        uint64_t v87 = v19;
        uint64_t v23 = v17 | v18;
        uint64_t v24 = v17;
        uint64_t v25 = v91 | v16 | v14 | v23 | v19;
        uint64_t v90 = v21;
        uint64_t v92 = v22;
        BOOL v26 = (v25 | v20 | v21 | v22) != 0;
        v27 = [v6 objectForKeyedSubscript:@"sceneClassifications"];

        v89 = [v6 objectForKeyedSubscript:@"viewPresentation"];

        if (([(PLAdditionalAssetAttributes *)self isInserted] & 1) != 0 || v27)
        {
          v28 = [(PLAdditionalAssetAttributes *)self asset];
          [v28 recalculateIsDetectedScreenshot];

          [(PLAdditionalAssetAttributes *)self recalculatehasPeopleSceneMidOrGreaterConfidence];
        }
        uint64_t v3 = v94;
        if (v93) {
          int v29 = 1;
        }
        else {
          int v29 = v26;
        }
        if (v29 == 1)
        {
          v30 = [(PLAdditionalAssetAttributes *)self asset];
          int v31 = [v30 isValidTypeForPersistence];

          if (v31)
          {
            if (v26)
            {
              v32 = [(PLAdditionalAssetAttributes *)self asset];
              v33 = [v32 persistedFileSystemAttributesFileURL];

              if (v33)
              {
                v34 = [MEMORY[0x1E4F8B900] filesystemPersistenceBatchItemForFileAtURL:v33];
                if (v82)
                {
                  [(PLAdditionalAssetAttributes *)self title];
                  v36 = v35 = v34;
                  [v35 setString:v36 forKey:*MEMORY[0x1E4F8C458]];

                  v34 = v35;
                }
                if (v83)
                {
                  v37 = [(PLAdditionalAssetAttributes *)self accessibilityDescription];
                  [v34 setString:v37 forKey:*MEMORY[0x1E4F8C308]];
                }
                if (v84)
                {
                  v38 = [(PLAdditionalAssetAttributes *)self timeZoneName];
                  [v34 setString:v38 forKey:*MEMORY[0x1E4F8C448]];
                }
                if (v85)
                {
                  v39 = [(PLAdditionalAssetAttributes *)self timeZoneOffset];
                  uint64_t v40 = [v39 intValue];
                  [v34 setInt32:v40 forKey:*MEMORY[0x1E4F8C450]];
                }
                if (v88)
                {
                  v41 = [(PLAdditionalAssetAttributes *)self placeAnnotationData];
                  [v34 setData:v41 forKey:*MEMORY[0x1E4F8C408]];
                }
                if (v24 && [(PLAdditionalAssetAttributes *)self importedBy])
                {
                  unsigned __int16 v42 = [(PLAdditionalAssetAttributes *)self importedBy];
                  [v34 setUInt16:v42 forKey:*MEMORY[0x1E4F8C3A8]];
                }
                if (v86)
                {
                  v43 = [(PLAdditionalAssetAttributes *)self spatialOverCaptureGroupIdentifier];
                  [v34 setString:v43 forKey:*MEMORY[0x1E4F8C430]];
                }
                if (v87)
                {
                  v44 = [(PLAdditionalAssetAttributes *)self syndicationIdentifier];
                  [v34 setString:v44 forKey:*MEMORY[0x1E4F8C440]];
                }
                if (v20)
                {
                  v45 = (void *)MEMORY[0x1E4F28DB0];
                  v46 = [(PLAdditionalAssetAttributes *)self libraryScopeAssetContributorsToUpdate];
                  id v95 = 0;
                  v47 = [v45 archivedDataWithRootObject:v46 requiringSecureCoding:1 error:&v95];
                  id v48 = v95;

                  if (v48)
                  {
                    v49 = PLBackendGetLog();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v99 = v48;
                      _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "libraryScopeAssetContributorsToUpdate archiving failed: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    [v34 setData:v47 forKey:*MEMORY[0x1E4F8C3D8]];
                  }
                }
                if (v90)
                {
                  uint64_t v50 = [(PLAdditionalAssetAttributes *)self syndicationHistory];
                  [v34 setUInt16:v50 forKey:*MEMORY[0x1E4F8C438]];
                }
                if (v92)
                {
                  uint64_t v51 = [(PLAdditionalAssetAttributes *)self sceneAnalysisIsFromPreview];
                  [v34 setUInt16:v51 forKey:*MEMORY[0x1E4F8C428]];
                }
                if (v89)
                {
                  unsigned __int16 v52 = [(PLAdditionalAssetAttributes *)self viewPresentation];
                  [v34 setUInt16:v52 forKey:*MEMORY[0x1E4F8C480]];
                }
                [v34 persist];
              }
            }
            if (v93)
            {
              v53 = [v94 delayedSaveActions];
              v54 = [(PLAdditionalAssetAttributes *)self asset];
              [v53 recordAssetForFileSystemPersistencyUpdate:v54];
            }
          }
        }
        if (MEMORY[0x19F38BDA0]()
          && [(PLAdditionalAssetAttributes *)self isInserted])
        {
          [(PLAdditionalAssetAttributes *)self truncatedOriginalCheckChangedValues:v6];
        }
        if (PLPlatformMomentsSupported())
        {
          [(PLAdditionalAssetAttributes *)self _updateInferredTimeZoneOffsetWithChangedValues:v6];
          v55 = [v94 delayedSaveActions];
          [v55 recordAdditionalAssetAttributesForMomentUpdate:self];
        }
        v56 = [v6 objectForKeyedSubscript:@"originalOrientation"];

        if (v56) {
          [(PLAdditionalAssetAttributes *)self correctOriginalOrientationIfRequired];
        }
        v57 = [v6 objectForKeyedSubscript:@"keywords"];

        if (v57)
        {
          v58 = [(PLAdditionalAssetAttributes *)self keywords];
          BOOL v59 = [v58 count] != 0;

          v60 = [(PLAdditionalAssetAttributes *)self asset];
          [v60 setKeywordBadgeAttribute:v59];
        }
        v61 = [v6 objectForKeyedSubscript:@"originalResourceChoice"];

        if (v61)
        {
          v62 = [(PLAdditionalAssetAttributes *)self asset];
          [v62 recalculateRAWBadgeAttribute];
        }
        if (+[PLDuplicateAsset isDuplicateAssetSortChangedObject:self])
        {
          v63 = [(PLAdditionalAssetAttributes *)self asset];
          v64 = [v63 duplicateAlbum];

          [v64 sortAssets];
        }
        uint64_t v65 = [v6 objectForKeyedSubscript:@"sceneAnalysisVersion"];
        if (v65)
        {
          v66 = (void *)v65;
          v67 = [(PLAdditionalAssetAttributes *)self asset];
          if ([v67 duplicateAssetVisibilityState])
          {
            v68 = [(PLAdditionalAssetAttributes *)self asset];
            int v69 = [v68 isValidForPerceptualProcessing];

            if (!v69) {
              goto LABEL_74;
            }
            v97 = @"sceneAnalysisVersion";
            v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
            v66 = [(PLAdditionalAssetAttributes *)self committedValuesForKeys:v70];

            v71 = [v66 objectForKeyedSubscript:@"sceneAnalysisVersion"];
            int v72 = [v71 shortValue];

            if (v72)
            {
              v73 = [v6 objectForKeyedSubscript:@"sceneAnalysisVersion"];
              int v74 = [v73 shortValue];

              if (v72 != v74)
              {
                v75 = [(PLAdditionalAssetAttributes *)self asset];
                [v75 removeFromDuplicateAlbum];
              }
            }
            v67 = [(PLManagedObject *)self photoLibrary];
            +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:v67];
          }
        }
LABEL_74:
        v76 = [v6 objectForKeyedSubscript:@"originalStableHash"];

        if (v76)
        {
          v77 = [(PLManagedObject *)self photoLibrary];
          +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:v77];
        }
        if (([(PLAdditionalAssetAttributes *)self isInserted] & 1) == 0)
        {
          v78 = [v6 objectForKeyedSubscript:@"importedBy"];
          if (v78)
          {
          }
          else
          {
            v79 = [v6 objectForKeyedSubscript:@"importedByBundleIdentifier"];

            if (!v79)
            {
LABEL_81:

              goto LABEL_82;
            }
          }
        }
        v80 = [(PLAdditionalAssetAttributes *)self asset];
        [v80 recalculateIsRecentlySaved];

        goto LABEL_81;
      }
      double v9 = [(PLAdditionalAssetAttributes *)self asset];
      long long v10 = [MEMORY[0x1E4F1C9C8] date];
      [v9 setModificationDate:v10];
    }

    goto LABEL_9;
  }
LABEL_82:
  if (PLPlatformSearchSupported())
  {
    v81 = [v3 delayedSaveActions];
    [v81 recordAdditionalAssetAttributesForSearchIndexUpdate:self];

    if (([(PLAdditionalAssetAttributes *)self isDeleted] & 1) == 0) {
      +[PLDelayedSearchIndexUpdates recordAdditionalAssetAttributesIfNeeded:self];
    }
  }
LABEL_85:
}

- (void)correctOriginalOrientationIfRequired
{
  uint64_t v3 = [(PLAdditionalAssetAttributes *)self asset];
  uint64_t v4 = [v3 extendedAttributes];
  char v5 = [v4 orientation];
  uint64_t v6 = [v5 shortValue];

  LODWORD(v4) = +[PLManagedAsset correctedOrientation:v6];
  BOOL v7 = [(PLAdditionalAssetAttributes *)self originalOrientation];
  uint64_t v8 = [v7 shortValue];

  uint64_t v9 = +[PLManagedAsset correctedOrientation:v8];
  if (v4 == v6)
  {
    uint64_t v10 = v6;
    if (v8 == v6) {
      return;
    }
  }
  else
  {
    uint64_t v10 = v9;
    if (v9 == v8) {
      return;
    }
  }
  id v11 = [NSNumber numberWithShort:v10];
  [(PLAdditionalAssetAttributes *)self setOriginalOrientation:v11];
}

- (void)_updateInferredTimeZoneOffsetWithChangedValues:(id)a3
{
  id v20 = a3;
  int v4 = [(PLAdditionalAssetAttributes *)self isUpdated];
  char v5 = v20;
  if (v4)
  {
    uint64_t v6 = [v20 objectForKeyedSubscript:@"timeZoneOffset"];
    char v5 = v20;
    if (v6)
    {
      BOOL v7 = (void *)v6;
      uint64_t v8 = [v20 objectForKeyedSubscript:@"inferredTimeZoneOffset"];
      if (v8)
      {

LABEL_5:
        char v5 = v20;
        goto LABEL_6;
      }
      uint64_t v9 = [(PLAdditionalAssetAttributes *)self timeZoneOffset];

      char v5 = v20;
      if (v9)
      {
        uint64_t v10 = [(PLAdditionalAssetAttributes *)self asset];
        BOOL v7 = [v10 metadataFromMediaPropertiesOrOriginalResource];

        id v11 = [v7 timeZoneOffset];
        uint64_t v12 = [v11 integerValue];
        char v13 = [(PLAdditionalAssetAttributes *)self timeZoneOffset];
        uint64_t v14 = [v13 integerValue];

        uint64_t v15 = [(PLAdditionalAssetAttributes *)self inferredTimeZoneOffset];
        uint64_t v16 = v15;
        if (v12 == v14)
        {

          if (v16) {
            [(PLAdditionalAssetAttributes *)self setInferredTimeZoneOffset:0];
          }
        }
        else
        {
          uint64_t v17 = [(PLAdditionalAssetAttributes *)self timeZoneOffset];
          char v18 = [v16 isEqualToNumber:v17];

          if ((v18 & 1) == 0)
          {
            uint64_t v19 = [(PLAdditionalAssetAttributes *)self timeZoneOffset];
            [(PLAdditionalAssetAttributes *)self setInferredTimeZoneOffset:v19];
          }
        }
        goto LABEL_5;
      }
    }
  }
LABEL_6:
}

- (void)truncatedOriginalCheckChangedValues:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 objectForKeyedSubscript:@"originalFilesize"];
  uint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedIntegerValue];
    if (v7 <= 0x10000 && (v7 & 0xFFF) == 0)
    {
      uint64_t v9 = [(PLAdditionalAssetAttributes *)self asset];
      uint64_t v10 = [v9 addedDate];
      id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-60.0];
      if ((unsigned __int16)([v9 importedBy] - 1) <= 1u && objc_msgSend(v10, "compare:", v11) == 1)
      {
        uint64_t v12 = [v9 pathForOriginalFile];
        char v13 = PLBackendGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          char v18 = v6;
          __int16 v19 = 2112;
          id v20 = v12;
          __int16 v21 = 2112;
          uint64_t v22 = self;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "rdar://39848396: truncated original originalFilesize=%@ path=%@ %@", buf, 0x20u);
        }

        uint64_t v14 = NSString;
        uint64_t v15 = [v4 objectForKeyedSubscript:@"originalFilename"];
        uint64_t v16 = [v14 stringWithFormat:@"Captured truncated original with originalFilesize=%@ originalFilename=%@ path=%@. See rdar://39848396.", v6, v15, v12];

        +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Photos Data Loss Issue Detected!" message:@"Please file a Radar for critical truncated original issue." radarTitle:@"TTR Photos Framework: captured truncated original" radarDescription:v16];
      }
    }
  }
}

- (BOOL)isUserInterfaceChange
{
  v2 = [(PLAdditionalAssetAttributes *)self changedValues];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"variationSuggestionStates"];

  if (v3) {
    goto LABEL_5;
  }
  id v4 = [v2 objectForKeyedSubscript:@"reverseLocationData"];

  if (v4
    || ([v2 objectForKeyedSubscript:@"reverseLocationDataIsValid"],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5)
    || ([v2 objectForKeyedSubscript:@"destinationAssetCopyState"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
LABEL_5:
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v9 = [v2 objectForKeyedSubscript:@"lastViewedDate"];
    BOOL v7 = v9 != 0;
  }
  return v7;
}

- (BOOL)isSyncableChange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLAdditionalAssetAttributes *)self asset];
  int v4 = [v3 savedAssetTypeIsSupportedForUpload];

  if (!v4) {
    return 0;
  }
  char v5 = [(PLAdditionalAssetAttributes *)self changedValues];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = +[PLAdditionalAssetAttributes listOfSyncedProperties];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = [v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v10)];

      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }

    char v13 = [(PLAdditionalAssetAttributes *)self asset];
    int v14 = [v13 isPlaceholderAsset];

    if (v14)
    {
      char v5 = [(PLAdditionalAssetAttributes *)self asset];
      BOOL v12 = +[PLManagedAsset validMomentShareForPlaceholderAsset:v5];
      goto LABEL_14;
    }
    return 1;
  }
  else
  {
LABEL_10:

    BOOL v12 = 0;
LABEL_14:
  }
  return v12;
}

- (BOOL)supportsCloudUpload
{
  v2 = [(PLAdditionalAssetAttributes *)self asset];
  char v3 = [v2 supportsCloudUpload];

  return v3;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToFaceVersion:(id)a3 noindex:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6) {
    uint64_t v8 = (__int16)[v6 intValue];
  }
  else {
    uint64_t v8 = 1;
  }
  if (v4) {
    uint64_t v9 = @"noindex:(%K) >= %d";
  }
  else {
    uint64_t v9 = @"%K >= %d";
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v9, @"faceAnalysisVersion", v8);
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v12 = [a1 predicateToIncludeOnlyAllowedForAnalysisWithNoindex:v4];
  v16[0] = v12;
  v16[1] = v10;
  char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v14 = [v11 andPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestFaceVersionWithNoindex:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = +[PLMediaAnalysisServiceRequestAdapter currentFaceVersion];
  id v6 = [a1 predicateToIncludeOnlyAllowedForAnalysisAndProcessedToFaceVersion:v5 noindex:v3];

  return v6;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToSceneVersion:(id)a3 noindex:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6) {
    uint64_t v8 = (__int16)[v6 intValue];
  }
  else {
    uint64_t v8 = 1;
  }
  if (v4) {
    uint64_t v9 = @"noindex:(%K) >= %d";
  }
  else {
    uint64_t v9 = @"%K >= %d";
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v9, @"sceneAnalysisVersion", v8);
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v12 = [a1 predicateToIncludeOnlyAllowedForAnalysisWithNoindex:v4];
  v16[0] = v12;
  v16[1] = v10;
  char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v14 = [v11 andPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestSceneVersionWithNoindex:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = +[PLMediaAnalysisServiceRequestAdapter currentSceneVersion];
  id v6 = [a1 predicateToIncludeOnlyAllowedForAnalysisAndProcessedToSceneVersion:v5 noindex:v3];

  return v6;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisWithNoindex:(BOOL)a3
{
  if (a3) {
    BOOL v3 = @"noindex:(%K) == YES";
  }
  else {
    BOOL v3 = @"%K == YES";
  }
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, @"allowedForAnalysis");
  return v4;
}

+ (BOOL)shouldPersistImportedByDisplayName:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    int v4 = [v3 hasPrefix:@"com.apple."] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)entityName
{
  return @"AdditionalAssetAttributes";
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  v2 = (void *)listOfSyncedProperties_result_86995;
  return v2;
}

void __53__PLAdditionalAssetAttributes_listOfSyncedProperties__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"title", @"accessibilityDescription", @"keywords", @"longDescription", @"personReferences", @"videoCpDurationTimescale", @"videoCpDisplayValue", @"videoCpDisplayTimescale", @"playCount", @"shareCount", @"viewCount", @"originatingAssetIdentifier", @"originalResourceChoice", @"assetDescription", @"syndicationIdentifier", @"syndicationHistory", @"timeZoneName",
         @"timeZoneOffset",
         @"viewPresentation",
         0);
  v1 = (void *)listOfSyncedProperties_result_86995;
  listOfSyncedProperties_result_86995 = v0;
}

- (PLSpatialOverCaptureInformation)spatialOverCaptureInformation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLAdditionalAssetAttributes *)self asset];
  int v4 = [v3 pathForSpatialOverCaptureContentFile];

  if (!v4)
  {
    id v13 = 0;
    goto LABEL_12;
  }
  char v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
  uint64_t v7 = [(PLAdditionalAssetAttributes *)self asset];
  int v8 = [v7 isVideo];

  id v9 = objc_alloc(MEMORY[0x1E4F8CC48]);
  if (!v8)
  {
    id v11 = [v9 initWithImageURL:v6 contentType:0 timeZoneLookup:0];
    int v14 = [v11 spatialOverCaptureIdentifier];
    [v5 setSpatialOverCaptureGroupIdentifier:v14];

    uint64_t v15 = [v11 livePhotoPairingIdentifier];
    [v5 setSpatialOverCaptureLivePhotoPairingIdentifier:v15];

    if (v11) {
      goto LABEL_7;
    }
LABEL_8:
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      long long v18 = v4;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to read metadata for %@", (uint8_t *)&v17, 0xCu);
    }
    id v13 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = [v9 initWithAVURL:v6 timeZoneLookup:0];
  if (!v10) {
    goto LABEL_8;
  }
  id v11 = v10;
  BOOL v12 = [v10 spatialOverCaptureIdentifier];
  [v5 setSpatialOverCaptureGroupIdentifier:v12];

LABEL_7:
  id v13 = v5;
LABEL_11:

LABEL_12:
  return (PLSpatialOverCaptureInformation *)v13;
}

- (BOOL)hasDuplicateMatchingData
{
  id v3 = [(PLAdditionalAssetAttributes *)self sceneprint];
  int v4 = [v3 duplicateMatchingData];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(PLAdditionalAssetAttributes *)self sceneprint];
    uint64_t v7 = [v6 duplicateMatchingAlternateData];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4 processingSucceeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = [(PLAdditionalAssetAttributes *)self sceneprint];
  if (!v9)
  {
    uint64_t v10 = [(PLAdditionalAssetAttributes *)self managedObjectContext];
    id v9 = +[PLSceneprint insertInCurrentManagedObjectContext:v10 withAdditionalAssetAttributes:self];
  }
  [v9 setDuplicateMatchingData:v11 duplicateMatchingAlternateData:v8];
  [(PLAdditionalAssetAttributes *)self addDuplicateDetectorPerceptualProcessingStates:v5 ^ 1 removeProcessingStates:v5];
}

- (void)setSceneprintWithData:(id)a3
{
  id v6 = a3;
  int v4 = [(PLAdditionalAssetAttributes *)self sceneprint];
  if (!v4)
  {
    BOOL v5 = [(PLAdditionalAssetAttributes *)self managedObjectContext];
    int v4 = +[PLSceneprint insertInCurrentManagedObjectContext:v5 withAdditionalAssetAttributes:self];
  }
  [v4 setData:v6];
}

- (void)setSourceAssetForDuplicationCPLScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    BOOL v5 = [v4 identifier];
    [(PLAdditionalAssetAttributes *)self setSourceAssetForDuplicationIdentifier:v5];

    id v6 = [v7 scopeIdentifier];
    [(PLAdditionalAssetAttributes *)self setSourceAssetForDuplicationScopeIdentifier:v6];
  }
  else
  {
    [(PLAdditionalAssetAttributes *)self setSourceAssetForDuplicationIdentifier:0];
    [(PLAdditionalAssetAttributes *)self setSourceAssetForDuplicationScopeIdentifier:0];
  }
}

- (CPLScopedIdentifier)sourceAssetForDuplicationCPLScopedIdentifier
{
  id v3 = [(PLAdditionalAssetAttributes *)self sourceAssetForDuplicationIdentifier];
  id v4 = [(PLAdditionalAssetAttributes *)self sourceAssetForDuplicationScopeIdentifier];
  if (v3) {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v4 identifier:v3];
  }
  else {
    BOOL v5 = 0;
  }

  return (CPLScopedIdentifier *)v5;
}

- (void)setMediaMetadataData:(id)a3
{
  id v13 = a3;
  id v4 = [(PLAdditionalAssetAttributes *)self asset];
  int v5 = [v4 hasAdjustments];

  id v6 = [(PLAdditionalAssetAttributes *)self mediaMetadata];

  if (!v6 && v5)
  {
    id v7 = [(PLAdditionalAssetAttributes *)self managedObjectContext];
    id v8 = +[PLManagedObject insertInManagedObjectContext:v7];
    [(PLAdditionalAssetAttributes *)self setMediaMetadata:v8];
  }
  if (v13)
  {
    id v9 = [(PLAdditionalAssetAttributes *)self mediaMetadata];

    if (!v9)
    {
      uint64_t v10 = [(PLAdditionalAssetAttributes *)self managedObjectContext];
      id v11 = +[PLManagedObject insertInManagedObjectContext:v10];
      [(PLAdditionalAssetAttributes *)self setMediaMetadata:v11];
    }
    BOOL v12 = [(PLAdditionalAssetAttributes *)self mediaMetadata];
    [v12 setValue:v13 forKey:@"data"];
    goto LABEL_10;
  }
  if (v5)
  {
    BOOL v12 = [(PLAdditionalAssetAttributes *)self mediaMetadata];
    [v12 setData:0];
LABEL_10:

    goto LABEL_12;
  }
  [(PLAdditionalAssetAttributes *)self setMediaMetadata:0];
LABEL_12:
}

- (NSData)mediaMetadataData
{
  v2 = [(PLAdditionalAssetAttributes *)self mediaMetadata];
  id v3 = [v2 valueForKey:@"data"];

  return (NSData *)v3;
}

- (void)setLongDescription:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 length];
  int v5 = [(PLAdditionalAssetAttributes *)self assetDescription];
  id v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      id v7 = [(PLAdditionalAssetAttributes *)self managedObjectContext];
      id v8 = +[PLAssetDescription entityName];
      id v6 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);

      if (v6) {
        [(PLAdditionalAssetAttributes *)self setAssetDescription:v6];
      }
    }
    [v6 setLongDescription:v10];
  }
  else
  {

    if (!v6) {
      goto LABEL_10;
    }
    id v6 = [(PLAdditionalAssetAttributes *)self managedObjectContext];
    id v9 = [(PLAdditionalAssetAttributes *)self assetDescription];
    [v6 deleteObject:v9];
  }
LABEL_10:
}

- (NSString)longDescription
{
  v2 = [(PLAdditionalAssetAttributes *)self assetDescription];
  id v3 = [v2 longDescription];

  return (NSString *)v3;
}

- (void)resetCloudRecoveryState
{
}

- (BOOL)hasCloudRecoveryStateFlagSet:(unint64_t)a3
{
  return ([(PLAdditionalAssetAttributes *)self cloudRecoveryState] & a3) != 0;
}

- (void)removeCloudRecoveryStateFlag:(unint64_t)a3
{
  unint64_t v4 = [(PLAdditionalAssetAttributes *)self cloudRecoveryState] & ~a3;
  [(PLAdditionalAssetAttributes *)self setCloudRecoveryState:v4];
}

- (void)setCloudRecoveryStateFlag:(unint64_t)a3
{
  unint64_t v4 = [(PLAdditionalAssetAttributes *)self cloudRecoveryState] | a3;
  [(PLAdditionalAssetAttributes *)self setCloudRecoveryState:v4];
}

- (BOOL)hasConsistentCloudState
{
  return [(PLAdditionalAssetAttributes *)self cloudRecoveryState] == 0;
}

+ (id)descriptionForDestinationAssetCopyState:(signed __int16)a3
{
  if ((a3 + 1) > 3) {
    return &stru_1EEB2EB80;
  }
  else {
    return off_1E5870838[a3 + 1];
  }
}

@end