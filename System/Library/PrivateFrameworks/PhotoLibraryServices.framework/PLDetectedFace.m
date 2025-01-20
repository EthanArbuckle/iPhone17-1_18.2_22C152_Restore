@interface PLDetectedFace
+ (CGRect)cgRectFromGazeRectString:(id)a3;
+ (PLDetectedFace)detectedFaceWithUUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)_facesMatchingPredicate:(id)a3 limit:(unint64_t)a4 inPhotoLibrary:(id)a5;
+ (id)_syncableFacesToUploadInitiallyPredicate;
+ (id)assetIDsWithAllPersonsFromPersonIDs:(id)a3 inContext:(id)a4;
+ (id)entityName;
+ (id)fetchDetectedFacesForAssetObjectID:(id)a3 managedObjectContext:(id)a4;
+ (id)findExistingFaceMatchingDimension:(id)a3 inFaces:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5;
+ (id)personIDsByAssetForPersonsVisibleWithPersonIDs:(id)a3 inContext:(id)a4;
+ (id)predicateForArchival;
+ (id)predicateForFaceCountTrigger;
+ (id)predicateForFetchType:(int64_t)a3;
+ (id)predicateForIncludedDetectionTypes:(id)a3;
+ (id)predicateToExcludeBodyOnlyDetection;
+ (id)predicateToExcludeFaceDetection;
+ (id)predicatesForFacesNeedingFaceCropGeneration;
+ (id)predicatesToExcludeNonVisibleFaces;
+ (id)stringFromGazeRect:(CGRect)a3;
+ (id)syncableFacesPredicate;
+ (id)syncableFacesToUploadInitiallyInLibrary:(id)a3 limit:(unint64_t)a4;
+ (int64_t)resetAssetForAllSyncableFacesInManagedObjectContext:(id)a3 error:(id *)a4;
+ (void)batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 fetchType:(int64_t)a5 library:(id)a6 completion:(id)a7;
+ (void)batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs:(id)a3 library:(id)a4 completion:(id)a5;
+ (void)resetCloudStateInPhotoLibrary:(id)a3;
- (BOOL)_faceIsDeletedBecauseAssetForFaceIsDeleted;
- (BOOL)_hasBodyHeightChange;
- (BOOL)_hasBodyWidthChange;
- (BOOL)_hasPersonForFaceChangeWithoutCommittedPersonForFace:(id)a3 oldAssociatedPerson:(id)a4;
- (BOOL)_hasSizeChange;
- (BOOL)_hasSizeOrTorsoDimensionChangeWithAssociatedAssetAndPerson;
- (BOOL)_isFaceAndTorso;
- (BOOL)_isFaceOnly;
- (BOOL)_isInsertedWithAssociatedAssetAndPerson;
- (BOOL)_isNeitherFaceNorTorso;
- (BOOL)_isTemporalFace;
- (BOOL)_startTimeAndDurationAreValid;
- (BOOL)_validateForOperation:(id)a3 error:(id *)a4;
- (BOOL)isSyncableChange;
- (BOOL)isTorsoOnly;
- (BOOL)isTrainingFace;
- (BOOL)isValidForJournalPersistence;
- (BOOL)supportsCloudUpload;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (CGRect)gazeRect;
- (id)associatedAssetForFaceOrTorso:(BOOL)a3 orTemporal:(BOOL)a4;
- (id)associatedPersonForFaceOrTorso:(BOOL)a3 orTemporal:(BOOL)a4;
- (id)cplFullRecord;
- (id)debugLogDescription;
- (id)namingDescription;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)photosFaceRepresentationLocalIdentifier;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (id)syncDescription;
- (int64_t)photosFaceRepresentationClusterSequenceNumber;
- (int64_t)photosFaceRepresentationQualityMeasure;
- (void)_fixUpTemporalRelationships;
- (void)_recordAssetPersonEdgeAndContainmentUpdateForAsset:(id)a3 inContext:(id)a4;
- (void)_recordAssetPersonEdgeUpdatesAndSocialGroupUpdatesIfNeededWithChangedValues:(id)a3;
- (void)_touchPersonForPersistenceIfNeeded;
- (void)_updateFaceGroupIfNeeded;
- (void)_updatePersonForFaceDetectionTypeIfNeededWithPossibleNewPerson:(id)a3;
- (void)_verifyAssetRelationship;
- (void)_verifyTorsoRelationships;
- (void)addClusterRejectedPerson:(id)a3;
- (void)addRejectedPerson:(id)a3;
- (void)addRejectedPersonNeedingFaceCrops:(id)a3;
- (void)awakeFromInsert;
- (void)delete;
- (void)fixAssetRelationshipsForFaceTorsoOrTemporal;
- (void)fixPersonRelationshipsForFaceTorsoOrTemporal;
- (void)migration_setAssetForTorso:(id)a3;
- (void)migration_setPersonForTorso:(id)a3;
- (void)prepareForDeletion;
- (void)removeAllPersonRelationships;
- (void)removeFaceprint;
- (void)setAssociatedAsset:(id)a3;
- (void)setAssociatedPerson:(id)a3;
- (void)setEffectiveNameSource:(int)a3;
- (void)setGazeRect:(CGRect)a3;
- (void)willSave;
@end

@implementation PLDetectedFace

+ (id)predicatesToExcludeNonVisibleFaces
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset predicateToExcludeHiddenAssetsWithHiddenKeyPath:@"assetForFace.hidden"];
  v10[0] = v2;
  v3 = +[PLManagedAsset predicateToExcludeTrashedAssetsWithTrashedStateKeyPath:@"assetForFace.trashedState"];
  v10[1] = v3;
  v4 = +[PLManagedAsset predicateToExcludeNonvisibleBurstAssetsWithAvalanchePickTypeKeyPath:@"assetForFace.avalanchePickType"];
  v10[2] = v4;
  v5 = +[PLManagedAsset predicateToExcludeVideosWithVideoKeyFrameSetWithKeyPathToAsset:@"assetForFace"];
  v10[3] = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NO", @"hidden");
  v10[4] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"assetForFace");
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (CGRect)cgRectFromGazeRectString:(id)a3
{
  if (a3)
  {
    return NSRectFromString((NSString *)a3);
  }
  else
  {
    result.origin.x = -1.0;
    result.origin.y = -1.0;
    result.size.width = -1.0;
    result.size.height = -1.0;
  }
  return result;
}

+ (id)predicateForFetchType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = +[PLDetectedFace predicateToExcludeFaceDetection];
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = +[PLDetectedFace predicateToExcludeBodyOnlyDetection];
  }
  return v3;
}

+ (id)predicateForIncludedDetectionTypes:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:&unk_1EEBEE2C8])
  {
    char v4 = [v3 containsObject:&unk_1EEBEE2E0];

    if (v4)
    {
      v5 = 0;
    }
    else
    {
      v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"detectionType", &unk_1EEBEE2C8];
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"detectionType", v3];
  }
  return v5;
}

- (void)migration_setPersonForTorso:(id)a3
{
  id v4 = a3;
  [(PLDetectedFace *)self willChangeValueForKey:@"personForTorso"];
  [(PLDetectedFace *)self setPrimitiveValue:v4 forKey:@"personForTorso"];

  [(PLDetectedFace *)self didChangeValueForKey:@"personForTorso"];
}

- (void)migration_setAssetForTorso:(id)a3
{
  id v4 = a3;
  [(PLDetectedFace *)self willChangeValueForKey:@"assetForTorso"];
  [(PLDetectedFace *)self setPrimitiveValue:v4 forKey:@"assetForTorso"];

  [(PLDetectedFace *)self didChangeValueForKey:@"assetForFace"];
}

- (void)setAssociatedAsset:(id)a3
{
  id v7 = a3;
  BOOL v4 = ![(PLDetectedFace *)self _isTemporalFace];
  if (v4) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }
  if (v4) {
    id v6 = 0;
  }
  else {
    id v6 = v7;
  }
  [(PLDetectedFace *)self setAssetForFace:v5];
  [(PLDetectedFace *)self setAssetForTemporalDetectedFaces:v6];
}

- (id)associatedAssetForFaceOrTorso:(BOOL)a3 orTemporal:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(PLDetectedFace *)self assetForFace];
  if (!a3 && [(PLDetectedFace *)self isTorsoOnly])
  {

    id v7 = 0;
  }
  if (v4 && !v7)
  {
    id v7 = [(PLDetectedFace *)self assetForTemporalDetectedFaces];
  }
  return v7;
}

- (void)setAssociatedPerson:(id)a3
{
  id v7 = a3;
  BOOL v4 = ![(PLDetectedFace *)self _isTemporalFace];
  if (v4) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }
  if (v4) {
    id v6 = 0;
  }
  else {
    id v6 = v7;
  }
  [(PLDetectedFace *)self setPersonForFace:v5];
  [(PLDetectedFace *)self setPersonForTemporalDetectedFaces:v6];
}

- (id)associatedPersonForFaceOrTorso:(BOOL)a3 orTemporal:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(PLDetectedFace *)self personForFace];
  if (!a3 && [(PLDetectedFace *)self isTorsoOnly])
  {

    id v7 = 0;
  }
  if (v4 && !v7)
  {
    id v7 = [(PLDetectedFace *)self personForTemporalDetectedFaces];
  }
  return v7;
}

- (void)setGazeRect:(CGRect)a3
{
  objc_msgSend((id)objc_opt_class(), "stringFromGazeRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PLDetectedFace *)self setGazeRectString:v4];
}

- (CGRect)gazeRect
{
  id v3 = objc_opt_class();
  id v4 = [(PLDetectedFace *)self gazeRectString];
  [v3 cgRectFromGazeRectString:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setEffectiveNameSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[PLDetectedFace setNameSource:](self, "setNameSource:");
  if (v3 != 2)
  {
    [(PLDetectedFace *)self setCloudNameSource:v3];
  }
}

- (void)addClusterRejectedPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(PLDetectedFace *)self mutableSetValueForKey:@"clusterRejectedPersons"];
  [v5 addObject:v4];
}

- (void)addRejectedPersonNeedingFaceCrops:(id)a3
{
  id v4 = a3;
  if ([v4 verifiedType])
  {
    id v5 = [(PLDetectedFace *)self mutableSetValueForKey:@"rejectedPersonsNeedingFaceCrops"];
    [v5 addObject:v4];
  }
  else
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Scheduling a rejected face crop for an unverified Person is an error, returning quietly", v6, 2u);
    }
  }
}

- (void)addRejectedPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(PLDetectedFace *)self rejectedPersons];
  id v6 = (id)[v5 mutableCopy];

  [v6 addObject:v4];
  [(PLDetectedFace *)self setRejectedPersons:v6];
}

- (id)namingDescription
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"uuid";
  v6[1] = @"nameSource";
  v6[2] = @"personForFace";
  v6[3] = @"assetForFace";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v4 = [(NSManagedObject *)self truncatedDescriptionWithPropertyKeys:v3];

  return v4;
}

- (id)debugLogDescription
{
  uint64_t v3 = +[PLDescriptionBuilder plainDescriptionBuilder];
  id v4 = [(PLDetectedFace *)self uuid];
  [v3 appendName:@"uuid" object:v4];

  id v5 = NSString;
  [(PLDetectedFace *)self centerX];
  uint64_t v7 = v6;
  [(PLDetectedFace *)self centerY];
  uint64_t v9 = v8;
  [(PLDetectedFace *)self size];
  double v11 = [v5 stringWithFormat:@"{{%f, %f}, %f, %lldx%lld}", v7, v9, v10, -[PLDetectedFace sourceWidth](self, "sourceWidth"), -[PLDetectedFace sourceHeight](self, "sourceHeight")];
  [v3 appendName:@"circle" object:v11];
  double v12 = NSString;
  [(PLDetectedFace *)self bodyCenterX];
  uint64_t v14 = v13;
  [(PLDetectedFace *)self bodyCenterY];
  uint64_t v16 = v15;
  [(PLDetectedFace *)self bodyWidth];
  uint64_t v18 = v17;
  [(PLDetectedFace *)self bodyHeight];
  v20 = [v12 stringWithFormat:@"{{%f, %f}, %fx%f}", v14, v16, v18, v19];
  [v3 appendName:@"body" object:v20];
  objc_msgSend(v3, "appendName:integerValue:", @"detectionType", (int)-[PLDetectedFace detectionType](self, "detectionType"));
  objc_msgSend(v3, "appendName:BOOLValue:", @"hidden", -[PLDetectedFace hidden](self, "hidden"));
  objc_msgSend(v3, "appendName:BOOLValue:", @"trashed", -[PLDetectedFace isInTrash](self, "isInTrash"));
  objc_msgSend(v3, "appendName:BOOLValue:", @"manual", -[PLDetectedFace manual](self, "manual"));
  v21 = [(PLDetectedFace *)self associatedPersonForFaceOrTorso:1 orTemporal:1];
  v22 = [v21 debugLogDescription];
  [v3 appendName:@"person" object:v22];

  v23 = [(PLDetectedFace *)self personBeingKeyFace];
  v24 = [v23 debugLogDescription];
  [v3 appendName:@"personBeingKeyFace" object:v24];

  objc_msgSend(v3, "appendName:integerValue:", @"nameSource", (int)-[PLDetectedFace nameSource](self, "nameSource"));
  objc_msgSend(v3, "appendName:integerValue:", @"cloudLocalState", (int)-[PLDetectedFace cloudLocalState](self, "cloudLocalState"));
  v25 = [(PLDetectedFace *)self associatedAssetForFaceOrTorso:1 orTemporal:1];
  v26 = [v25 uuid];
  [v3 appendName:@"asset" object:v26];

  objc_msgSend(v3, "appendName:integerValue:", @"confirmedFaceCropGenerationState", (int)-[PLDetectedFace confirmedFaceCropGenerationState](self, "confirmedFaceCropGenerationState"));
  [(PLDetectedFace *)self quality];
  objc_msgSend(v3, "appendName:doubleValue:", @"quality");
  objc_msgSend(v3, "appendName:integerValue:", @"faceExpressionType", -[PLDetectedFace faceExpressionType](self, "faceExpressionType"));
  objc_msgSend(v3, "appendName:integerValue:", @"headgearType", -[PLDetectedFace headgearType](self, "headgearType"));
  objc_msgSend(v3, "appendName:integerValue:", @"hairType", -[PLDetectedFace hairType](self, "hairType"));
  objc_msgSend(v3, "appendName:integerValue:", @"poseType", -[PLDetectedFace poseType](self, "poseType"));
  objc_msgSend(v3, "appendName:integerValue:", @"skintoneType", -[PLDetectedFace skintoneType](self, "skintoneType"));
  objc_msgSend(v3, "appendName:integerValue:", @"ethnicityType", -[PLDetectedFace ethnicityType](self, "ethnicityType"));
  objc_msgSend(v3, "appendName:BOOLValue:", @"hasFaceMask", -[PLDetectedFace hasFaceMask](self, "hasFaceMask"));
  objc_msgSend(v3, "appendName:integerValue:", @"gazeType", -[PLDetectedFace gazeType](self, "gazeType"));
  [(PLDetectedFace *)self gazeCenterX];
  objc_msgSend(v3, "appendName:doubleValue:", @"gazeCenterX");
  [(PLDetectedFace *)self gazeCenterY];
  objc_msgSend(v3, "appendName:doubleValue:", @"gazeCenterY");
  v27 = [(PLDetectedFace *)self gazeRectString];
  [v3 appendName:@"gazeRect" object:v27];

  [(PLDetectedFace *)self gazeAngle];
  [v3 appendName:@"gazeAngle" doubleValue:v28];
  [(PLDetectedFace *)self gazeConfidence];
  [v3 appendName:@"gazeConfidence" doubleValue:v29];
  v30 = NSNumber;
  [(PLDetectedFace *)self startTime];
  v31 = objc_msgSend(v30, "numberWithDouble:");
  [v3 appendName:@"startTime" object:v31];

  v32 = NSNumber;
  [(PLDetectedFace *)self duration];
  v33 = objc_msgSend(v32, "numberWithDouble:");
  [v3 appendName:@"duration" object:v33];

  v34 = [(PLDetectedFace *)self rejectedPersons];
  v35 = objc_msgSend(v34, "_pl_map:", &__block_literal_global_29546);

  [v3 appendName:@"rejectedPersons" object:v35];
  v36 = [(PLDetectedFace *)self detectionTraits];
  v37 = objc_msgSend(v36, "_pl_map:", &__block_literal_global_248);

  [v3 appendName:@"detectionTraits" object:v37];
  v38 = [v3 build];

  return v38;
}

uint64_t __37__PLDetectedFace_debugLogDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 debugLogDescription];
}

uint64_t __37__PLDetectedFace_debugLogDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugLogDescription];
}

- (void)removeFaceprint
{
  id v3 = [(PLDetectedFace *)self faceprint];
  [v3 setFace:0];
  v2 = [v3 managedObjectContext];
  [v2 deleteObject:v3];
}

- (BOOL)_startTimeAndDurationAreValid
{
  [(PLDetectedFace *)self startTime];
  if (v3 >= 0.0)
  {
    [(PLDetectedFace *)self duration];
    if (v4 > 0.0) {
      return 1;
    }
  }
  [(PLDetectedFace *)self startTime];
  if (v6 != 0.0) {
    return 0;
  }
  [(PLDetectedFace *)self duration];
  return v7 == 0.0;
}

- (BOOL)_isTemporalFace
{
  [(PLDetectedFace *)self duration];
  return v2 != 0.0;
}

- (BOOL)_isNeitherFaceNorTorso
{
  [(PLDetectedFace *)self centerX];
  if (v3 != 0.0) {
    return 0;
  }
  [(PLDetectedFace *)self bodyCenterX];
  return v4 == 0.0;
}

- (BOOL)_isFaceAndTorso
{
  [(PLDetectedFace *)self centerX];
  if (v3 == 0.0) {
    return 0;
  }
  [(PLDetectedFace *)self bodyCenterX];
  return v4 != 0.0;
}

- (BOOL)_isFaceOnly
{
  [(PLDetectedFace *)self centerX];
  if (v3 == 0.0) {
    return 0;
  }
  [(PLDetectedFace *)self bodyCenterX];
  return v4 == 0.0;
}

- (BOOL)isTorsoOnly
{
  [(PLDetectedFace *)self centerX];
  if (v3 != 0.0) {
    return 0;
  }
  [(PLDetectedFace *)self bodyCenterX];
  return v4 != 0.0;
}

- (BOOL)isTrainingFace
{
  return [(PLDetectedFace *)self trainingType] != 0;
}

- (void)_recordAssetPersonEdgeUpdatesAndSocialGroupUpdatesIfNeededWithChangedValues:(id)a3
{
  id v25 = a3;
  double v4 = (void *)MEMORY[0x19F38D3B0]();
  if (![(PLDetectedFace *)self _faceIsDeletedBecauseAssetForFaceIsDeleted])
  {
    id v5 = [(PLDetectedFace *)self managedObjectContext];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && !MEMORY[0x19F38C0C0]()) {
      goto LABEL_9;
    }
    double v6 = [(PLDetectedFace *)self assetForFace];
    double v7 = [v25 objectForKey:@"personForFace"];
    uint64_t v8 = [(PLManagedObject *)self pl_committedValueForKey:@"personForFace"];
    uint64_t v9 = [v25 objectForKey:@"assetForFace"];
    if ([(PLDetectedFace *)self _isInsertedWithAssociatedAssetAndPerson]
      || [(PLDetectedFace *)self _hasSizeOrTorsoDimensionChangeWithAssociatedAssetAndPerson]|| [(PLDetectedFace *)self _hasPersonForFaceChangeWithoutCommittedPersonForFace:v7 oldAssociatedPerson:v8])
    {
      [(PLDetectedFace *)self _recordAssetPersonEdgeAndContainmentUpdateForAsset:v6 inContext:v5];
      goto LABEL_8;
    }
    if ([(PLDetectedFace *)self isUpdated]
      && v9
      && ([(PLDetectedFace *)self personForFace],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = v10 | v8,
          (id)v10,
          v11))
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      if (v9 == (void *)v12)
      {
      }
      else
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = [(PLDetectedFace *)self personForFace];

        if (v14) {
          [(PLDetectedFace *)self _recordAssetPersonEdgeAndContainmentUpdateForAsset:v9 inContext:v5];
        }
      }
      v21 = [(PLManagedObject *)self pl_committedValueForKey:@"assetForFace"];
      v24 = PLNullToNil();

      if (v24) {
        [(PLDetectedFace *)self _recordAssetPersonEdgeAndContainmentUpdateForAsset:v21 inContext:v5];
      }
    }
    else
    {
      if ([(PLDetectedFace *)self isUpdated] && v7 && v6 && v8)
      {
        uint64_t v15 = [v5 delayedSaveActions];
        [v15 recordAssetPersonEdgeUpdateNeededForAsset:v6];

        uint64_t v16 = [MEMORY[0x1E4F1CA98] null];

        if (v7 != v16)
        {
          uint64_t v17 = [v5 delayedSaveActions];
          [v17 recordSocialGroupContainmentUpdateNeededForPerson:v7 andAsset:v6];
        }
        uint64_t v18 = [(id)v8 mergeTargetPerson];
        uint64_t v19 = PLNullToNil();

        if (!v19)
        {
          v20 = [v5 delayedSaveActions];
          [v20 recordSocialGroupContainmentUpdateNeededForPerson:v8 andAsset:v6];
        }
        goto LABEL_8;
      }
      if (![(PLDetectedFace *)self isDeleted])
      {
LABEL_8:

LABEL_9:
        goto LABEL_10;
      }
      v21 = [(PLManagedObject *)self pl_committedValueForKey:@"assetForFace"];
      uint64_t v22 = [(PLManagedObject *)self pl_committedValueForKey:@"personForFace"];
      v23 = (void *)v22;
      if (v21 && v22) {
        [(PLDetectedFace *)self _recordAssetPersonEdgeAndContainmentUpdateForAsset:v21 inContext:v5];
      }
    }
    goto LABEL_8;
  }
LABEL_10:
}

- (void)_updatePersonForFaceDetectionTypeIfNeededWithPossibleNewPerson:(id)a3
{
  id v14 = a3;
  uint64_t v4 = PLNullToNil();
  if (v4
    && (id v5 = (void *)v4,
        int v6 = [v14 detectionType],
        int v7 = [(PLDetectedFace *)self detectionType],
        v5,
        v6 != v7))
  {
    [v14 updateDetectionTypeIfNeeded];
  }
  else if ([(PLDetectedFace *)self isInserted])
  {
    uint64_t v8 = [(PLDetectedFace *)self personForFace];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(PLDetectedFace *)self personForFace];
      int v11 = [v10 detectionType];
      int v12 = [(PLDetectedFace *)self detectionType];

      if (v11 != v12)
      {
        uint64_t v13 = [(PLDetectedFace *)self personForFace];
        [v13 updateDetectionTypeIfNeeded];
      }
    }
  }
}

- (void)_recordAssetPersonEdgeAndContainmentUpdateForAsset:(id)a3 inContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 delayedSaveActions];
  [v7 recordAssetPersonEdgeUpdateNeededForAsset:v6];

  id v8 = [v5 delayedSaveActions];

  [v8 recordSocialGroupContainmentUpdateNeededForAsset:v6];
}

- (BOOL)_hasBodyHeightChange
{
  double v2 = [(PLDetectedFace *)self changedValues];
  double v3 = [v2 objectForKey:@"bodyHeight"];
  uint64_t v4 = PLNullToNil();
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_hasBodyWidthChange
{
  double v2 = [(PLDetectedFace *)self changedValues];
  double v3 = [v2 objectForKey:@"bodyWidth"];
  uint64_t v4 = PLNullToNil();
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_hasSizeChange
{
  double v2 = [(PLDetectedFace *)self changedValues];
  double v3 = [v2 objectForKey:@"size"];
  uint64_t v4 = PLNullToNil();
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_hasSizeOrTorsoDimensionChangeWithAssociatedAssetAndPerson
{
  if (![(PLDetectedFace *)self isUpdated]) {
    return 0;
  }
  double v3 = [(PLDetectedFace *)self personForFace];
  if (v3)
  {
    uint64_t v4 = [(PLDetectedFace *)self assetForFace];
    if (v4) {
      BOOL v5 = [(PLDetectedFace *)self _hasSizeChange]
    }
        || [(PLDetectedFace *)self _hasBodyWidthChange]
        || [(PLDetectedFace *)self _hasBodyHeightChange];
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_hasPersonForFaceChangeWithoutCommittedPersonForFace:(id)a3 oldAssociatedPerson:(id)a4
{
  int v7 = [(PLDetectedFace *)self isUpdated];
  BOOL v8 = 0;
  if (!a4 && a3 && v7)
  {
    uint64_t v9 = [(PLDetectedFace *)self assetForFace];
    BOOL v8 = v9 != 0;
  }
  return v8;
}

- (BOOL)_isInsertedWithAssociatedAssetAndPerson
{
  if (![(PLDetectedFace *)self isInserted]) {
    return 0;
  }
  double v3 = [(PLDetectedFace *)self personForFace];
  if (v3)
  {
    uint64_t v4 = [(PLDetectedFace *)self assetForFace];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_faceIsDeletedBecauseAssetForFaceIsDeleted
{
  if ([(PLDetectedFace *)self isDeleted])
  {
    double v3 = [(PLManagedObject *)self pl_committedValueForKey:@"assetForFace"];
    uint64_t v4 = v3;
    if (v3) {
      int v5 = (int)([v3 isDeleted] << 31) >> 31;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (void)_verifyTorsoRelationships
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"assetForTorso"];
  uint64_t v4 = [v3 firstObject];

  int v5 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"personForTorso"];
  id v6 = [v5 firstObject];

  if (v4)
  {
    int v7 = [(PLDetectedFace *)self assetForTorso];
    BOOL v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = [(PLDetectedFace *)self uuid];
      uint64_t v10 = [v7 uuid];
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_FAULT, "assetForTorso is unexpected set on face %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (v6)
  {
    int v11 = [(PLDetectedFace *)self personForTorso];
    int v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = [(PLDetectedFace *)self uuid];
      id v14 = [v11 personUUID];
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_FAULT, "personForTorso is unexpected set on face %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_fixUpTemporalRelationships
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v3 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"assetForFace"];
  uint64_t v4 = [v3 firstObject];

  int v5 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"assetForTemporalDetectedFaces"];
  uint64_t v6 = [v5 firstObject];

  int v7 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"personForFace"];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"personForTemporalDetectedFaces"];
  uint64_t v10 = [v9 firstObject];

  if ([(PLDetectedFace *)self _isTemporalFace])
  {
    if (v4 | v8)
    {
      if (!v6 && v4)
      {
        int v11 = [(PLDetectedFace *)self assetForFace];
        int v12 = PLBackendGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = [(PLDetectedFace *)self uuid];
          id v14 = [v11 uuid];
          int v26 = 138543618;
          v27 = v13;
          __int16 v28 = 2114;
          float v29 = v14;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up temporal face %{public}@, moving asset %{public}@ to temporal", (uint8_t *)&v26, 0x16u);
        }
        [(PLDetectedFace *)self setAssetForTemporalDetectedFaces:v11];
        [(PLDetectedFace *)self setAssetForFace:0];
      }
      if (!v10 && v8)
      {
        int v15 = [(PLDetectedFace *)self personForFace];
        uint64_t v16 = PLBackendGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = [(PLDetectedFace *)self uuid];
          uint64_t v18 = [v15 personUUID];
          int v26 = 138543618;
          v27 = v17;
          __int16 v28 = 2114;
          float v29 = v18;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up temporal face %{public}@, moving person %{public}@ to temporal", (uint8_t *)&v26, 0x16u);
        }
        [(PLDetectedFace *)self setPersonForTemporalDetectedFaces:v15];
        [(PLDetectedFace *)self setPersonForFace:0];
LABEL_24:
      }
    }
  }
  else if (v6 | v10)
  {
    if (!v4 && v6)
    {
      uint64_t v19 = [(PLDetectedFace *)self assetForTemporalDetectedFaces];
      v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [(PLDetectedFace *)self uuid];
        uint64_t v22 = [v19 uuid];
        int v26 = 138543618;
        v27 = v21;
        __int16 v28 = 2114;
        float v29 = v22;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up still face %{public}@, moving asset %{public}@ from temporal", (uint8_t *)&v26, 0x16u);
      }
      [(PLDetectedFace *)self setAssetForFace:v19];
      [(PLDetectedFace *)self setAssetForTemporalDetectedFaces:0];
    }
    if (!v8 && v10)
    {
      int v15 = [(PLDetectedFace *)self personForTemporalDetectedFaces];
      v23 = PLBackendGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [(PLDetectedFace *)self uuid];
        id v25 = [v15 personUUID];
        int v26 = 138543618;
        v27 = v24;
        __int16 v28 = 2114;
        float v29 = v25;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up still face %{public}@, moving person %{public}@ from temporal", (uint8_t *)&v26, 0x16u);
      }
      [(PLDetectedFace *)self setPersonForFace:v15];
      [(PLDetectedFace *)self setPersonForTemporalDetectedFaces:0];
      goto LABEL_24;
    }
  }
}

- (void)_verifyAssetRelationship
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([(PLDetectedFace *)self isDeleted] & 1) == 0
    && ![(PLDetectedFace *)self isTrainingFace])
  {
    uint64_t v4 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"assetForFace"];
    if ([v4 count])
    {
      int v5 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"assetForTemporalDetectedFaces"];
      uint64_t v6 = [v5 count];

      if (!v6) {
        return;
      }
    }
    else
    {
    }
    int v7 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"assetForFace"];
    if ([v7 count])
    {
    }
    else
    {
      int v12 = [(PLDetectedFace *)self objectIDsForRelationshipNamed:@"assetForTemporalDetectedFaces"];
      uint64_t v13 = [v12 count];

      if (v13) {
        return;
      }
    }
    if ((PLIsSuppressingLogsForUnitTesting() & 1) == 0)
    {
      uint64_t v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int v15 = self;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Face unexpectedly has no asset: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v10 = [v9 BOOLForKey:@"EnableFaceAssertions"];

    if (v10)
    {
      int v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PLDetectedFace.m", 445, @"Face unexpectedly has no asset: %@", self object file lineNumber description];
    }
  }
}

- (void)fixAssetRelationshipsForFaceTorsoOrTemporal
{
  double v3 = [(PLDetectedFace *)self associatedAssetForFaceOrTorso:1 orTemporal:1];
  if (v3)
  {
    uint64_t v4 = v3;
    [(PLDetectedFace *)self setAssociatedAsset:v3];
    double v3 = v4;
  }
}

- (void)fixPersonRelationshipsForFaceTorsoOrTemporal
{
  double v3 = [(PLDetectedFace *)self associatedPersonForFaceOrTorso:1 orTemporal:1];
  if (v3)
  {
    uint64_t v4 = v3;
    [(PLDetectedFace *)self setAssociatedPerson:v3];
    double v3 = v4;
  }
}

- (void)removeAllPersonRelationships
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = [(PLDetectedFace *)self entity];
  uint64_t v4 = +[PLPerson entity];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v5 = objc_msgSend(v3, "relationshipsByName", 0);
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = [v11 destinationEntity];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = [v11 name];
          [(PLDetectedFace *)self setValue:0 forKey:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_updateFaceGroupIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = [(PLDetectedFace *)self associatedPersonForFaceOrTorso:1 orTemporal:0];

  if (!v3)
  {
    uint64_t v4 = [(PLDetectedFace *)self faceGroup];
    int v5 = PLBackendGetLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = [(NSManagedObject *)self pl_shortDescription];
        int v10 = 138412546;
        int v11 = v7;
        __int16 v12 = 2112;
        int v13 = v4;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Moving face %@ to algorithmic face group: %@", (uint8_t *)&v10, 0x16u);
      }
      int v5 = [v4 associatedPerson];
      uint64_t v8 = [v5 mutableFaces];
      if (([v8 containsObject:self] & 1) == 0) {
        [v8 addObject:self];
      }
    }
    else if (v6)
    {
      uint64_t v9 = [(NSManagedObject *)self pl_shortDescription];
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Unable to find algorithmic face group for face: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_touchPersonForPersistenceIfNeeded
{
  double v3 = [(PLManagedObject *)self pathManager];
  int v4 = [v3 isDCIM];

  if (v4)
  {
    id v5 = [(PLDetectedFace *)self associatedPersonForFaceOrTorso:1 orTemporal:0];
    if (([v5 isInserted] & 1) == 0 && (objc_msgSend(v5, "isUpdated") & 1) == 0) {
      objc_msgSend(v5, "setEffectiveVerifiedType:", objc_msgSend(v5, "verifiedType"));
    }
  }
}

- (void)willSave
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)PLDetectedFace;
  [(PLManagedObject *)&v43 willSave];
  [(PLDetectedFace *)self _fixUpTemporalRelationships];
  [(PLDetectedFace *)self _verifyTorsoRelationships];
  double v3 = [(PLDetectedFace *)self changedValues];
  int v4 = [v3 objectForKeyedSubscript:@"centerX"];
  id v5 = [v3 objectForKey:@"personForFace"];
  if ((_os_feature_enabled_impl() & 1) != 0
    || ([(PLManagedObject *)self photoLibrary],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isUnitTesting],
        v6,
        v7))
  {
    [(PLDetectedFace *)self _recordAssetPersonEdgeUpdatesAndSocialGroupUpdatesIfNeededWithChangedValues:v3];
  }
  [(PLDetectedFace *)self _updatePersonForFaceDetectionTypeIfNeededWithPossibleNewPerson:v5];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  if (v5 == (void *)v8)
  {
  }
  else
  {
    uint64_t v9 = (void *)v8;
    int v10 = [v5 verifiedType];

    if (v10)
    {
LABEL_7:
      int v11 = [(PLDetectedFace *)self trainingType];
      int v12 = 0;
      goto LABEL_14;
    }
  }
  if ([(PLDetectedFace *)self nameSource]) {
    [(PLDetectedFace *)self setNameSource:0];
  }
  if ([(PLDetectedFace *)self confirmedFaceCropGenerationState]) {
    [(PLDetectedFace *)self setConfirmedFaceCropGenerationState:0];
  }
  int v11 = [(PLDetectedFace *)self trainingType];
  int v13 = [MEMORY[0x1E4F1CA98] null];
  int v12 = [v5 isEqual:v13] ^ 1;

LABEL_14:
  if (v11) {
    BOOL v14 = v5 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 || v12)
  {
    long long v15 = [(PLDetectedFace *)self faceGroup];
    long long v16 = v15;
    if (v15 && [v15 personBuilderState] != 1) {
      [v16 setPersonBuilderState:1];
    }
  }
  if (v5)
  {
    uint64_t v17 = [(PLDetectedFace *)self personBeingKeyFace];
    if (v17)
    {
      long long v18 = (void *)v17;
      uint64_t v19 = [(PLDetectedFace *)self personBeingKeyFace];
      char v20 = [v19 isEqual:v5];

      if ((v20 & 1) == 0) {
        [(PLDetectedFace *)self setPersonBeingKeyFace:0];
      }
    }
  }
  v21 = [v3 objectForKey:@"rejectedPersons"];

  if (v21)
  {
    uint64_t v22 = [(PLDetectedFace *)self rejectedPersons];
    v23 = [(PLDetectedFace *)self clusterRejectedPersons];
    v24 = (void *)[v23 mutableCopy];
    [v24 intersectSet:v22];
    if ((v23 != 0) != (v24 != 0)
      || ![v23 isEqualToSet:v24]
      || ([v24 isEqualToSet:v23] & 1) == 0)
    {
      [(PLDetectedFace *)self setClusterRejectedPersons:v24];
    }
  }
  if ([(PLDetectedFace *)self isSyncableChange])
  {
    id v25 = [(PLDetectedFace *)self associatedAssetForFaceOrTorso:1 orTemporal:0];

    if (v25)
    {
      int v26 = [(PLDetectedFace *)self associatedAssetForFaceOrTorso:1 orTemporal:0];
      v27 = [v26 changedValues];
      __int16 v28 = [v27 objectForKeyedSubscript:@"modificationDate"];

      if (!v28)
      {
        float v29 = [MEMORY[0x1E4F1C9C8] date];
        [v26 setModificationDate:v29];
      }
    }
  }
  if (!v4)
  {
    uint64_t v30 = [v3 objectForKeyedSubscript:@"centerY"];
    if (v30)
    {
    }
    else
    {
      v31 = [v3 objectForKeyedSubscript:@"size"];

      if (!v31) {
        goto LABEL_44;
      }
    }
  }
  v32 = [(PLDetectedFace *)self associatedAssetForFaceOrTorso:1 orTemporal:1];
  [v32 revalidateFaceAreaPoints];

LABEL_44:
  v33 = [(PLDetectedFace *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (PLPlatformSearchSupported())
    {
      v34 = [v33 delayedSaveActions];
      [v34 recordDetectedFaceForSearchIndexUpdate:self];
    }
    v42 = v4;
    if (([(PLDetectedFace *)self isDeleted] & 1) == 0) {
      +[PLDelayedSearchIndexUpdates recordDetectedFaceIfNeeded:self];
    }
    [(PLDetectedFace *)self _updateFaceGroupIfNeeded];
    [(PLDetectedFace *)self _verifyAssetRelationship];
    v35 = [v3 objectForKey:@"nameSource"];
    v36 = v35;
    if (v35)
    {
      uint64_t v37 = [v35 integerValue];
      v44[0] = @"nameSource";
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      v39 = [(PLDetectedFace *)self committedValuesForKeys:v38];
      v40 = [v39 objectForKey:@"nameSource"];
      uint64_t v41 = [v40 integerValue];

      if (v37 == 5 || (v37 & 0xFFFFFFFFFFFFFFFDLL) == 1 || v41 == 3 || v41 == 1 || v41 == 5) {
        [(PLDetectedFace *)self _touchPersonForPersistenceIfNeeded];
      }
    }

    int v4 = v42;
  }
}

- (void)prepareForDeletion
{
  v5.receiver = self;
  v5.super_class = (Class)PLDetectedFace;
  [(PLManagedObject *)&v5 prepareForDeletion];
  objc_opt_class();
  double v3 = [(PLDetectedFace *)self managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }

  if (v4) {
    +[PLDelayedSearchIndexUpdates recordDetectedFaceIfNeeded:self];
  }
}

- (BOOL)_validateForOperation:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PLDetectedFace *)self _startTimeAndDurationAreValid];
  if (!v7)
  {
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(NSManagedObject *)self pl_shortDescription];
      [(PLDetectedFace *)self startTime];
      uint64_t v11 = v10;
      [(PLDetectedFace *)self duration];
      *(_DWORD *)buf = 138544130;
      v27 = v9;
      __int16 v28 = 2114;
      id v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = v11;
      __int16 v32 = 2048;
      uint64_t v33 = v12;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "PLDetectedFace %{public}@ failed validation for %{public}@, startTime: %g, duration: %g", buf, 0x2Au);
    }
    if (a4)
    {
      int v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F8C500];
      uint64_t v24 = *MEMORY[0x1E4F28228];
      long long v15 = NSString;
      [(PLDetectedFace *)self startTime];
      uint64_t v17 = v16;
      [(PLDetectedFace *)self duration];
      uint64_t v19 = [v15 stringWithFormat:@"There was a validation issue when attempting to %@ PLDetectedFace (startTime: %g, duration: %g)", v6, v17, v18];
      id v25 = v19;
      char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v21 = [v13 errorWithDomain:v14 code:46502 userInfo:v20];

      id v22 = v21;
      *a4 = v22;
    }
  }

  return v7;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLDetectedFace;
  BOOL v5 = -[PLDetectedFace validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5) {
    LOBYTE(v5) = [(PLDetectedFace *)self _validateForOperation:@"update" error:a3];
  }
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLDetectedFace;
  BOOL v5 = -[PLDetectedFace validateForInsert:](&v7, sel_validateForInsert_);
  if (v5) {
    LOBYTE(v5) = [(PLDetectedFace *)self _validateForOperation:@"insert" error:a3];
  }
  return v5;
}

- (void)delete
{
  id v3 = [(PLDetectedFace *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLDetectedFace;
  [(PLDetectedFace *)&v4 awakeFromInsert];
  id v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLDetectedFace *)self setUuid:v3];
}

+ (id)assetIDsWithAllPersonsFromPersonIDs:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:2];
  [v9 becomeCurrentWithPendingUnitCount:1];
  uint64_t v10 = [a1 personIDsByAssetForPersonsVisibleWithPersonIDs:v6 inContext:v7];
  [v9 resignCurrent];
  [v9 becomeCurrentWithPendingUnitCount:1];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v10, "count"));
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  char v20 = __64__PLDetectedFace_assetIDsWithAllPersonsFromPersonIDs_inContext___block_invoke;
  v21 = &unk_1E58680F8;
  id v12 = v11;
  id v22 = v12;
  id v25 = &v26;
  id v13 = v6;
  id v23 = v13;
  id v14 = v8;
  id v24 = v14;
  [v10 enumerateKeysAndObjectsUsingBlock:&v18];
  objc_msgSend(v9, "resignCurrent", v18, v19, v20, v21);
  if (*((unsigned char *)v27 + 24))
  {
    id v15 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    id v15 = v14;
  }
  uint64_t v16 = v15;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __64__PLDetectedFace_assetIDsWithAllPersonsFromPersonIDs_inContext___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  if ([v7 isCancelled])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  [*(id *)(a1 + 32) becomeCurrentWithPendingUnitCount:1];
  uint64_t v9 = [v8 count];

  if (v9 == [*(id *)(a1 + 40) count]) {
    [*(id *)(a1 + 48) addObject:v10];
  }
  [*(id *)(a1 + 32) resignCurrent];
}

+ (id)personIDsByAssetForPersonsVisibleWithPersonIDs:(id)a3 inContext:(id)a4
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = +[PLDetectedFace entityName];
  uint64_t v9 = [v7 fetchRequestWithEntityName:v8];

  v41[0] = @"assetForFace";
  v41[1] = @"personForFace";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v9 setPropertiesToFetch:v10];

  [v9 setResultType:2];
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"personForFace", v5];
  [v9 setPredicate:v11];

  id v37 = 0;
  id v12 = [v6 executeFetchRequest:v9 error:&v37];
  id v13 = v37;
  id v14 = v13;
  if (v12)
  {
    id v28 = v13;
    id v30 = v5;
    id v15 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v12, "count"));
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __75__PLDetectedFace_personIDsByAssetForPersonsVisibleWithPersonIDs_inContext___block_invoke;
    v35[3] = &unk_1E58680D0;
    id v27 = v16;
    id v36 = v27;
    uint64_t v17 = (void (**)(void, void, void, void))MEMORY[0x19F38D650](v35);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    char v29 = v12;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          if ([v15 isCancelled])
          {
            id v25 = [MEMORY[0x1E4F1CA60] dictionary];

            id v24 = v27;
            goto LABEL_12;
          }
          [v15 becomeCurrentWithPendingUnitCount:1];
          ((void (**)(void, __CFString *, __CFString *, uint64_t))v17)[2](v17, @"assetForFace", @"personForFace", v23);
          [v15 resignCurrent];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v24 = v27;
    id v25 = v27;
LABEL_12:

    id v5 = v30;
    id v12 = v29;
    id v14 = v28;
  }
  else
  {
    id v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unable to fetch: %@", buf, 0xCu);
    }
    id v25 = 0;
  }

  return v25;
}

uint64_t __75__PLDetectedFace_personIDsByAssetForPersonsVisibleWithPersonIDs_inContext___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 objectForKeyedSubscript:a2];
  id v10 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    if (!v13)
    {
      id v13 = [MEMORY[0x1E4F1CA80] set];
      [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v9];
    }
    [v13 addObject:v10];
  }
  return v12;
}

+ (id)predicateToExcludeFaceDetection
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 0 AND (%K > 0)", @"centerX", @"bodyCenterX");
}

+ (id)predicateToExcludeBodyOnlyDetection
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0 OR (%K == 0 AND %K == 0)", @"centerX", @"centerX", @"bodyCenterX");
}

+ (id)predicateForFaceCountTrigger
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NO && %K == YES && %K != 0", @"hidden", @"assetVisible", @"centerX");
}

+ (id)predicateForArchival
{
  v13[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"manual");
  v13[0] = v3;
  objc_super v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"nameSource", &unk_1EEBF1C10];
  v12[0] = v5;
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trainingType", 0);
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v8 = [v4 andPredicateWithSubpredicates:v7];
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v10 = [v2 orPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)predicatesForFacesNeedingFaceCropGeneration
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"confirmedFaceCropGenerationState == %d", 1);
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"rejectedPersonsNeedingFaceCrops.@count > 0"];
  objc_super v4 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v2;
  v12[1] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v6 = [v4 orPredicateWithSubpredicates:v5];

  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"faceCrop == NULL"];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"manual == NO"];
  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  return v9;
}

+ (void)batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs:(id)a3 library:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"PLDetectedFace.m" lineNumber:861 description:@"Completion handler is mandatory"];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLDetectedFace.m", 862, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke;
  v17[3] = &unk_1E5873510;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  id v21 = a1;
  id v12 = v11;
  id v13 = v9;
  id v14 = v10;
  [v14 performBlockAndWait:v17];
}

void __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"personBeingKeyFace", *(void *)(a1 + 40)];
  objc_super v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = +[PLDetectedFace entityName];
  id v6 = [v4 fetchRequestWithEntityName:v5];

  v15[0] = @"personBeingKeyFace";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v6 setRelationshipKeyPathsForPrefetching:v7];

  [v6 setPredicate:v3];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke_2;
  void v12[3] = &unk_1E58680A8;
  uint64_t v14 = *(void *)(a1 + 56);
  id v9 = v8;
  id v13 = v9;
  id v10 = [v2 enumerateObjectsFromFetchRequest:v6 count:0 usingDefaultBatchSizeWithBlock:v12];
  if (v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v9];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectIDsForRelationshipNamed:@"personBeingKeyFace"];
  objc_super v4 = [v3 firstObject];

  if (v4) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
}

+ (void)batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 fetchType:(int64_t)a5 library:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"PLDetectedFace.m" lineNumber:824 description:@"Completion handler is mandatory"];

    if (v15) {
      goto LABEL_3;
    }
LABEL_5:
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PLDetectedFace.m", 825, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v15) {
    goto LABEL_5;
  }
LABEL_3:
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke;
  v23[3] = &unk_1E586DE10;
  id v24 = v15;
  id v25 = v13;
  id v28 = a1;
  int64_t v29 = a5;
  id v26 = v14;
  id v27 = v16;
  id v17 = v16;
  id v18 = v14;
  id v19 = v13;
  id v20 = v15;
  [v20 performBlockAndWait:v23];
}

void __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  objc_super v4 = +[PLDetectedFace entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  v16[0] = @"assetForFace";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v5 setRelationshipKeyPathsForPrefetching:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K IN %@", @"assetForFace", @"uuid", *(void *)(a1 + 40)];
  [v7 addObject:v8];

  id v9 = +[PLDetectedFace predicateForFetchType:*(void *)(a1 + 72)];
  objc_msgSend(v7, "_pl_addNonNilObject:", v9);

  objc_msgSend(v7, "_pl_addNonNilObject:", *(void *)(a1 + 48));
  id v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  [v5 setPredicate:v10];
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke_2;
  v14[3] = &unk_1E5874A10;
  id v12 = v11;
  id v15 = v12;
  id v13 = [v2 enumerateObjectsFromFetchRequest:v5 count:0 usingDefaultBatchSizeWithBlock:v14];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = [v3 assetForFace];
  id v5 = [v4 uuid];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) objectForKey:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 32) setObject:v6 forKey:v5];
    }
    [v6 addObject:v3];
  }
  else
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "assetUUID is nil for face %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

+ (id)stringFromGazeRect:(CGRect)a3
{
  __asm { FMOV            V4.2D, #-1.0 }
  if (*(void *)&a3.origin.x == (void)_Q4
    && *(void *)&a3.origin.y == *((void *)&_Q4 + 1)
    && *(void *)&a3.size.width == (void)_Q4
    && *(void *)&a3.size.height == *((void *)&_Q4 + 1))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = DCIM_NSStringFromCGRect();
  }
  return v10;
}

+ (PLDetectedFace)detectedFaceWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = (void *)MEMORY[0x19F38D3B0]();
    id v9 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v10 = [a1 entityName];
    id v11 = [v9 fetchRequestWithEntityName:v10];

    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v6];
    [v11 setPredicate:v12];
    [v11 setFetchLimit:1];
    uint64_t v16 = 0;
    id v13 = [v7 executeFetchRequest:v11 error:&v16];
    if ([v13 count])
    {
      id v14 = [v13 firstObject];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return (PLDetectedFace *)v14;
}

+ (id)entityName
{
  return @"DetectedFace";
}

+ (id)fetchDetectedFacesForAssetObjectID:(id)a3 managedObjectContext:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  id v7 = a3;
  int v8 = +[PLDetectedFace entityName];
  id v9 = [v5 fetchRequestWithEntityName:v8];

  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ OR %K == %@", @"assetForFace", v7, @"assetForTemporalDetectedFaces", v7];

  [v9 setPredicate:v10];
  v19[0] = @"personForFace";
  v19[1] = @"personForTemporalDetectedFaces";
  v19[2] = @"detectionTraits";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  v18[0] = @"detectionType";
  v18[1] = @"ageType";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v9 setPropertiesToFetch:v12];

  id v17 = 0;
  id v13 = [v6 executeFetchRequest:v9 error:&v17];

  id v14 = v17;
  if (v13) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v13];
  }
  else {
  id v15 = [MEMORY[0x1E4F8B9B8] failureWithError:v14];
  }

  return v15;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:@"manual"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsObject:@"nameSource"];
  }

  return v4;
}

- (id)payloadIDForTombstone:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"uuid"];
  char v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLDetectedFace *)self isValidForJournalPersistence]) {
    id v5 = [(PLManagedObjectJournalEntryPayload *)[PLDetectedFaceJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)payloadID
{
  double v2 = [(PLDetectedFace *)self uuid];
  id v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  return v3;
}

- (BOOL)isValidForJournalPersistence
{
  if (([(PLDetectedFace *)self manual] & 1) == 0
    && [(PLDetectedFace *)self nameSource] != 3
    && [(PLDetectedFace *)self nameSource] != 1
    && [(PLDetectedFace *)self nameSource] != 5)
  {
    return 0;
  }
  id v3 = [(PLDetectedFace *)self assetForFace];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)photosFaceRepresentationLocalIdentifier
{
  Class v4 = NSClassFromString(&cfstr_Phface.isa);
  if (!v4)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PLDetectedFace+CPL.m" lineNumber:306 description:@"photosFaceLocalIdentifier: cannot load PHFace class."];
  }
  id v5 = [(PLDetectedFace *)self uuid];
  id v6 = [(objc_class *)v4 localIdentifierWithUUID:v5];

  return v6;
}

- (int64_t)photosFaceRepresentationClusterSequenceNumber
{
  return (int)[(PLDetectedFace *)self clusterSequenceNumber];
}

- (int64_t)photosFaceRepresentationQualityMeasure
{
  return (int)[(PLDetectedFace *)self qualityMeasure];
}

- (id)syncDescription
{
  v6[11] = *MEMORY[0x1E4F143B8];
  v6[0] = @"uuid";
  v6[1] = @"nameSource";
  v6[2] = @"manual";
  v6[3] = @"assetForFace";
  v6[4] = @"personForFace";
  void v6[5] = @"personBeingKeyFace";
  v6[6] = @"cloudLocalState";
  v6[7] = @"cloudNameSource";
  v6[8] = @"centerX";
  v6[9] = @"centerY";
  v6[10] = @"size";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:11];
  Class v4 = [(NSManagedObject *)self truncatedDescriptionWithPropertyKeys:v3];

  return v4;
}

- (id)cplFullRecord
{
  Class v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PLDetectedFace+CPL.m", 206, @"Faces don't produce a change record, they are appended to assets if they are synced at all" object file lineNumber description];

  return 0;
}

- (id)scopedIdentifier
{
  Class v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PLDetectedFace+CPL.m", 201, @"Faces don't produce a change record, they are appended to assets if they are synced at all" object file lineNumber description];

  return 0;
}

- (id)scopeIdentifier
{
  Class v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PLDetectedFace+CPL.m", 196, @"Faces don't produce a change record, they are appended to assets if they are synced at all" object file lineNumber description];

  return 0;
}

- (BOOL)isSyncableChange
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PLDetectedFace *)self changedValues];
  Class v4 = [v3 objectForKey:@"nameSource"];

  if (v4)
  {
    v17[0] = @"nameSource";
    LODWORD(v4) = 1;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    id v6 = [(PLDetectedFace *)self committedValuesForKeys:v5];

    id v7 = [v6 objectForKey:@"nameSource"];
    uint64_t v8 = [v7 intValue];

    if ((PLNameSourceIsSyncable([(PLDetectedFace *)self nameSource]) & 1) == 0) {
      LODWORD(v4) = PLNameSourceIsSyncable(v8);
    }
  }
  id v9 = [v3 objectForKey:@"rejectedPersons"];

  uint64_t v10 = [v3 objectForKey:@"personBeingKeyFace"];
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
    BOOL v12 = v10 == v11 || [v10 keyFacePickSource] == 1;
  }
  else
  {
    BOOL v12 = 0;
  }
  BOOL v13 = [(PLDetectedFace *)self isTrainingFace];
  if (v9) {
    char v14 = 1;
  }
  else {
    char v14 = v12;
  }
  if (v13 | v4) {
    char v15 = !v13;
  }
  else {
    char v15 = v14;
  }

  return v15;
}

- (BOOL)supportsCloudUpload
{
  int v3 = [MEMORY[0x1E4F59840] serverSupportsVision];
  if (v3) {
    LOBYTE(v3) = ![(PLDetectedFace *)self isTrainingFace];
  }
  return v3;
}

+ (void)resetCloudStateInPhotoLibrary:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v7 = [a1 entityName];
  uint64_t v8 = (void *)[v6 initWithEntityName:v7];

  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"cloudLocalState", 0);
  [v8 setResultType:2];
  id v19 = @"cloudLocalState";
  v20[0] = &unk_1EEBF07B8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v8 setPropertiesToUpdate:v10];

  [v8 setPredicate:v9];
  id v11 = [v4 managedObjectContext];
  id v16 = 0;
  BOOL v12 = [v11 executeRequest:v8 error:&v16];
  id v13 = v16;

  if (v12)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      char v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        char v15 = [v12 result];
        *(_DWORD *)buf = 138412290;
        id v18 = v15;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Batch updated %@ detectedFaces", buf, 0xCu);
      }
LABEL_8:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    char v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to batch update detectedFaces: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
}

+ (int64_t)resetAssetForAllSyncableFacesInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"cloudLocalState", 1);
  uint64_t v8 = [v6 photoLibrary];
  id v9 = [a1 _facesMatchingPredicate:v7 limit:0 inPhotoLibrary:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __81__PLDetectedFace_CPL__resetAssetForAllSyncableFacesInManagedObjectContext_error___block_invoke;
  v15[3] = &unk_1E5872848;
  v15[4] = &v16;
  uint64_t v10 = [v6 enumerateWithIncrementalSaveUsingObjects:v9 withBlock:v15];
  id v11 = v10;
  BOOL v12 = v17;
  if (v10)
  {
    v17[3] = 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
    {
      *a4 = v10;
      BOOL v12 = v17;
    }
  }
  int64_t v13 = v12[3];

  _Block_object_dispose(&v16, 8);
  return v13;
}

void __81__PLDetectedFace_CPL__resetAssetForAllSyncableFacesInManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 assetForFace];
  if ([v4 cloudLocalState] == 1)
  {
    int v3 = [MEMORY[0x1E4F1C9C8] date];
    [v4 setModificationDate:v3];

    [v4 setCloudLocalState:0];
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

+ (id)syncableFacesToUploadInitiallyInLibrary:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _syncableFacesToUploadInitiallyPredicate];
  uint64_t v8 = [a1 _facesMatchingPredicate:v7 limit:a4 inPhotoLibrary:v6];

  return v8;
}

+ (id)_syncableFacesToUploadInitiallyPredicate
{
  v14[2] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"cloudLocalState", 0);
  v14[0] = v4;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"assetForFace.cloudLocalState", &unk_1EEBF2360];
  v14[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v7 = [v3 andPredicateWithSubpredicates:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v7;
  id v9 = [a1 syncableFacesPredicate];
  v13[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v11 = [v8 andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)syncableFacesPredicate
{
  pl_dispatch_once();
  double v2 = (void *)syncableFacesPredicate_predicate;
  return v2;
}

void __45__PLDetectedFace_CPL__syncableFacesPredicate__block_invoke()
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"nameSource", &unk_1EEBF2378];
  v1 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 1 OR %K.@count > 0", @"manual", @"rejectedPersons");
  double v2 = (void *)MEMORY[0x1E4F28BA0];
  v15[0] = v0;
  v15[1] = v1;
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v4 = [v2 orPredicateWithSubpredicates:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trainingType", 0);
  if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType]) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K > %d", @"detectionType", 1, @"detectionType", 2);
  }
  else {
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"detectionType", 1, v12, v13);
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 0", @"duration");
  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v4;
  v14[1] = v5;
  v14[2] = v6;
  void v14[3] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];
  id v11 = (void *)syncableFacesPredicate_predicate;
  syncableFacesPredicate_predicate = v10;
}

+ (id)_facesMatchingPredicate:(id)a3 limit:(unint64_t)a4 inPhotoLibrary:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 managedObjectContext];
  id v11 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v12 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v13 = [a1 entityName];
  char v14 = [v12 fetchRequestWithEntityName:v13];

  if (v8) {
    [v14 setPredicate:v8];
  }
  [v14 setFetchBatchSize:100];
  if (a4) {
    [v14 setFetchLimit:a4];
  }
  id v19 = 0;
  char v15 = [v10 executeFetchRequest:v14 error:&v19];
  id v16 = v19;
  if (!v15 && !*MEMORY[0x1E4F59AC0])
  {
    id v17 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v16;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch faces: %@", buf, 0xCu);
    }
  }

  return v15;
}

+ (id)findExistingFaceMatchingDimension:(id)a3 inFaces:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v17 = 0;
  id v9 = [MEMORY[0x1E4F8CCF0] sortedViableMergeCandidateFacesFor:v7 from:v8 ignoreSourceAssetDimensions:v5 matchScores:&v17];
  id v10 = v17;
  if ((unint64_t)[v9 count] >= 2)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_12;
    }
    id v11 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "More than 1 viable face matches query face %@, matching scores: %@ for faces: %@", buf, 0x20u);
    }
    goto LABEL_11;
  }
  if ([v9 count]) {
    goto LABEL_12;
  }
  id v16 = v10;
  uint64_t v12 = [MEMORY[0x1E4F8CCF0] sortedViableMergeCandidateTorsosFor:v7 from:v8 ignoreSourceAssetDimensions:v5 matchScores:&v16];
  id v13 = v16;

  if ((unint64_t)[v12 count] >= 2 && !*MEMORY[0x1E4F59AC0])
  {
    id v11 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "More than 1 viable torso matches query face %@, matching scores: %@ for faces: %@", buf, 0x20u);
    }
    id v9 = v12;
    id v10 = v13;
LABEL_11:

    goto LABEL_12;
  }
  id v9 = v12;
  id v10 = v13;
LABEL_12:
  char v14 = [v9 firstObject];

  return v14;
}

@end