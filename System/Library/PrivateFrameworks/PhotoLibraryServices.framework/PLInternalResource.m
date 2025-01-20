@interface PLInternalResource
+ (BOOL)batchResetFileIDInManagedObjectContext:(id)a3 error:(id *)a4;
+ (BOOL)deleteObsoleteResourcesInManagedObjectContext:(id)a3 error:(id *)a4;
+ (BOOL)isCPLJPEGThumbnailResource:(id)a3;
+ (BOOL)supportsTrashedStateForResourceIdentity:(id)a3;
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)_obsoleteResourceRecipesWithCPLOff;
+ (id)entityName;
+ (id)insertResourceForAssetObjectID:(id)a3 resourceIdentity:(id)a4 inManagedObjectContext:(id)a5;
+ (id)insertResourceForMasterObjectID:(id)a3 withExternalCPLResource:(id)a4 inManagedObjectContext:(id)a5;
+ (id)listOfSyncedProperties;
+ (id)nonOriginalCPLResourceTypes;
+ (id)originalCPLResourceTypes;
+ (id)originalCPLResourceTypesForAsset;
+ (id)originalCPLResourceTypesForMaster;
+ (id)predicateForAllFullSizeResourcesLocallyAvailable;
+ (id)predicateForAllOriginalResourcesLocallyAvailable;
+ (id)predicateForAvailableResources;
+ (id)predicateForImageResourcePixelsLessOrEqual:(int64_t)a3;
+ (id)predicateForMaxFilesize:(unint64_t)a3;
+ (id)predicateForOriginalsToDownload;
+ (id)predicateForPurgeableOriginalResources;
+ (id)predicateForResourceCreatedAfterDate:(id)a3;
+ (id)predicateForResourceIsNotLocallyAvailableWithCPLResourceType:(unint64_t)a3 version:(unsigned int)a4;
+ (id)predicateForSyndicationResourcesRequiringBackgroundDownload;
+ (id)predicateForSyndicationResourcesRequiringSanitization;
+ (id)prefetchResourcePredicateForCPLResourceType:(unint64_t)a3 isAssetResource:(BOOL)a4 maxRetry:(unint64_t)a5 excludeDynamicResources:(BOOL)a6 additionalResourcePredicates:(id)a7;
+ (id)prunePredicateForCPLResourceTypes:(id)a3;
+ (id)purgeablePushedPredicateForCPLResourceTypes:(id)a3 urgency:(int64_t)a4;
+ (id)resourceForManagedAsset:(id)a3 sharedStreamsType:(unsigned int)a4 managedObjectContext:(id)a5 error:(id *)a6;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (signed)plTrashedStateForCPLExpungedState:(unint64_t)a3;
+ (unint64_t)bytesForAllResourcesInLibrary:(id)a3;
+ (unint64_t)bytesNeededToDownloadOriginalResourcesInLibrary:(id)a3;
+ (unint64_t)cplExpungedStateForTrashedState:(signed __int16)a3;
+ (void)resetCloudResourcesStateForCloudInManagedObjectContext:(id)a3 hardReset:(BOOL)a4;
+ (void)resetPrefetchStateForResourcesWithVersion:(unsigned int)a3 cplType:(unint64_t)a4 assetUuids:(id)a5 inLibrary:(id)a6;
+ (void)triggerBackgroundDownloadFailureForResources:(id)a3 cloudPhotoLibraryManager:(id)a4;
- (BOOL)_colorSpaceIsNativeForDisplay;
- (BOOL)canRepresentAsSidecar;
- (BOOL)copyPurgeabilityFromFileURL:(id)a3;
- (BOOL)hasInvalidFileID;
- (BOOL)isAdjustedFullSizeRenderResource;
- (BOOL)isAdjustedResource;
- (BOOL)isCPLAssetResource;
- (BOOL)isCPLJPEGThumbnail;
- (BOOL)isCPLMasterResource;
- (BOOL)isCPLOriginalResource;
- (BOOL)isCPLOriginalResourceAssetHasAdjustments:(BOOL)a3;
- (BOOL)isCPLResource;
- (BOOL)isDefaultOrientation;
- (BOOL)isDerivative;
- (BOOL)isInCloud;
- (BOOL)isLocallyAvailable;
- (BOOL)isOriginalResource;
- (BOOL)isPlayableVideo;
- (BOOL)isRemotelyAvailable;
- (BOOL)isSyncableChange;
- (BOOL)isTrashedOrExpunged;
- (BOOL)isValidForJournalPersistence;
- (BOOL)isVirtual;
- (BOOL)repairResourceValidationErrors:(id)a3 managedObjectContext:(id)a4;
- (BOOL)shouldPersistTrashedState;
- (BOOL)supportsCloudUpload;
- (BOOL)supportsTrashedState;
- (NSString)cloudUUIDForDeletion;
- (NSString)debugDescription;
- (PLAssetID)assetID;
- (PLInternalResourceSidecarRepresentation)sidecarRepresentation;
- (PLResourceDataStore)dataStore;
- (PLResourceDataStoreKey)dataStoreKey;
- (PLUniformTypeIdentifier)uniformTypeIdentifier;
- (float)scale;
- (id)_avAssetProxyIfTypeIsFullSizeOrOriginal;
- (id)_libraryID;
- (id)cplFileURL;
- (id)cplResourceForFileURL:(id)a3 createDirectoryIfNeeded:(BOOL)a4;
- (id)cplResourceForTimeRange:(id *)a3;
- (id)cplResourceIncludeFile:(BOOL)a3;
- (id)cplResourceIncludeFile:(BOOL)a3 createDirectoryIfNeeded:(BOOL)a4;
- (id)expectedFileURL;
- (id)expungeableResourceStateRepresentation;
- (id)fileURL;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)photosCTLDescription;
- (id)photosCTLJSONDict;
- (id)purgeIfPossibleReturningError:(id *)a3;
- (id)redactedDescription;
- (id)referenceMediaFileURL;
- (id)scopedIdentifier;
- (id)singleLineDescription;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
- (id)validatedExternalResourceRepresentationUsingFileURL:(id)a3;
- (int)qualitySortValue;
- (int64_t)cloudDeletionType;
- (int64_t)orientedHeight;
- (int64_t)orientedWidth;
- (unint64_t)cplType;
- (unsigned)orientation;
- (void)applyTrashedState:(signed __int16)a3;
- (void)applyTrashedState:(signed __int16)a3 trashedDate:(id)a4;
- (void)clearRequiresSanitizationFlag;
- (void)deleteResource;
- (void)ensureInitialValuesForSyndication;
- (void)makeResourceLocallyAvailableWithCompletion:(id)a3;
- (void)markAsNotLocallyAvailable;
- (void)markAsNotLocallyAvailableAfterPurge;
- (void)persistTrashedStateToFilesystem;
- (void)prepareForDeletion;
- (void)resetPrefetchState;
- (void)setCloudAttributesWithExternalResource:(id)a3;
- (void)setDataLength:(int64_t)a3;
- (void)setFingerprint:(id)a3;
- (void)setLocalAvailability:(signed __int16)a3;
- (void)setResourceIdentity:(id)a3 managedObjectContext:(id)a4;
- (void)setSyndicationLocalAvailabilityWithAvailable:(BOOL)a3;
- (void)setSyndicationLocalAvailabilityWithAvailable:(BOOL)a3 additionalFlags:(unsigned __int16)a4;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResourceAtFilePath:(id)a3;
- (void)updateResourceForMasterExternalCPLResource:(id)a3 inManagedObjectContext:(id)a4;
- (void)willSave;
@end

@implementation PLInternalResource

- (void).cxx_destruct
{
}

- (NSString)debugDescription
{
  v3 = [[PLDescriptionBuilder alloc] initWithObject:self style:3 indent:0];
  v4 = [(PLInternalResource *)self asset];

  if (v4)
  {
    v5 = [(PLInternalResource *)self asset];
    v6 = [v5 uuid];
    [(PLDescriptionBuilder *)v3 appendName:@"assetUUID" object:v6];
  }
  v7 = [(PLInternalResource *)self transientCloudMaster];

  if (v7)
  {
    v8 = [(PLInternalResource *)self transientCloudMaster];
    v9 = [v8 scopedIdentifier];
    [(PLDescriptionBuilder *)v3 appendName:@"cloudMasterScopedID" object:v9];
  }
  v10 = [(PLInternalResource *)self objectID];
  [(PLDescriptionBuilder *)v3 appendName:@"objectID" object:v10];

  unsigned int v11 = [(PLInternalResource *)self resourceType];
  if (v11 > 0x1F) {
    v12 = @"invalid";
  }
  else {
    v12 = off_1E58641E0[v11];
  }
  v13 = v12;
  [(PLDescriptionBuilder *)v3 appendName:@"resourceType" object:v13];

  unsigned int v14 = [(PLInternalResource *)self version];
  if (v14 > 2) {
    v15 = @"cur";
  }
  else {
    v15 = off_1E58642E0[v14];
  }
  v16 = v15;
  [(PLDescriptionBuilder *)v3 appendName:@"version" object:v16];

  v17 = [(PLInternalResource *)self dataStore];
  v18 = [v17 name];
  v19 = objc_msgSend(v18, "stringByAppendingFormat:", @" (%ld)", (int)-[PLInternalResource dataStoreClassID](self, "dataStoreClassID"));

  [(PLDescriptionBuilder *)v3 appendName:@"dataStore" object:v19];
  uint64_t v20 = [(PLInternalResource *)self dataStoreSubtype];
  v21 = [v17 descriptionForSubtype:v20];
  v22 = objc_msgSend(v21, "stringByAppendingFormat:", @" (%ld)", v20);

  [(PLDescriptionBuilder *)v3 appendName:@"dataStoreSubtype" object:v22];
  if ([(PLInternalResource *)self recipeID])
  {
    v23 = +[PLResourceRecipe recipeFromID:[(PLInternalResource *)self recipeID]];
    v24 = [v23 description];
    [(PLDescriptionBuilder *)v3 appendName:@"recipeID" object:v24];
  }
  v25 = [(PLInternalResource *)self dataStoreKey];

  if (v25)
  {
    v26 = [(PLInternalResource *)self dataStoreKey];
    v27 = [(PLInternalResource *)self asset];
    v28 = [v27 assetID];
    v29 = [v26 descriptionForAssetID:v28];
    [(PLDescriptionBuilder *)v3 appendName:@"dataStoreKey" object:v29];
  }
  v30 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLInternalResource dataLength](self, "dataLength"));
  [(PLDescriptionBuilder *)v3 appendName:@"dataLength" object:v30];

  v31 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLInternalResource fileID](self, "fileID"));
  [(PLDescriptionBuilder *)v3 appendName:@"fileID" object:v31];

  LODWORD(v31) = [(PLInternalResource *)self dataStoreClassID];
  int v32 = [(PLInternalResource *)self localAvailability];
  if (v31 == 3) {
    PLSyndicationResourceLocalAvailabilityDescription(v32);
  }
  else {
  v33 = PLResourceLocalAvailabilityName(v32);
  }
  [(PLDescriptionBuilder *)v3 appendName:@"localAvailability" object:v33];

  v34 = PLResourceLocalAvailabilityTargetName([(PLInternalResource *)self localAvailabilityTarget]);
  [(PLDescriptionBuilder *)v3 appendName:@"localAvailabilityTarget" object:v34];

  int v35 = [(PLInternalResource *)self remoteAvailability];
  if (v35 == 1) {
    v36 = @"available";
  }
  else {
    v36 = @"missing";
  }
  if (!v35) {
    v36 = @"unavailable";
  }
  v37 = v36;
  [(PLDescriptionBuilder *)v3 appendName:@"remoteAvailability" object:v37];

  int v38 = [(PLInternalResource *)self remoteAvailabilityTarget];
  if (v38 == 1) {
    v39 = @"available";
  }
  else {
    v39 = @"missing";
  }
  if (!v38) {
    v39 = @"unavailable";
  }
  v40 = v39;
  [(PLDescriptionBuilder *)v3 appendName:@"remoteAvailabilityTarget" object:v40];

  [(PLDescriptionBuilder *)v3 appendName:@"isDerivative" BOOLValue:[(PLInternalResource *)self isDerivative]];
  [(PLDescriptionBuilder *)v3 appendName:@"unorientedWidth" integerValue:[(PLInternalResource *)self unorientedWidth]];
  [(PLDescriptionBuilder *)v3 appendName:@"unorientedHeight" integerValue:[(PLInternalResource *)self unorientedHeight]];
  [(PLDescriptionBuilder *)v3 appendName:@"orientation" integerValue:[(PLInternalResource *)self orientation]];
  [(PLDescriptionBuilder *)v3 appendName:@"qualitySortValue" integerValue:[(PLInternalResource *)self qualitySortValue]];
  v41 = [(PLInternalResource *)self fingerprint];
  [(PLDescriptionBuilder *)v3 appendName:@"fingerprint" object:v41];

  v42 = [(PLInternalResource *)self stableHash];
  [(PLDescriptionBuilder *)v3 appendName:@"stableHash" object:v42];

  v43 = [(PLInternalResource *)self uniformTypeIdentifier];
  v44 = [v43 identifier];
  [(PLDescriptionBuilder *)v3 appendName:@"uniformTypeIdentifier" object:v44];

  v45 = [(PLInternalResource *)self codecFourCharCodeName];
  [(PLDescriptionBuilder *)v3 appendName:@"codecFourCharCodeName" object:v45];

  v46 = [(PLInternalResource *)self sidecarIndex];
  [(PLDescriptionBuilder *)v3 appendName:@"sidecarIndex" object:v46];

  char v47 = [(PLInternalResource *)self ptpTrashedState];
  v48 = @"trashed";
  if ((v47 & 1) == 0) {
    v48 = @"untrashed";
  }
  v49 = v48;
  [(PLDescriptionBuilder *)v3 appendName:@"ptpTrashedState" object:v49];

  v50 = objc_msgSend(MEMORY[0x1E4F59940], "shortDescriptionForResourceType:", -[PLInternalResource cplType](self, "cplType"));
  [(PLDescriptionBuilder *)v3 appendName:@"cplType" object:v50];

  if ([(PLInternalResource *)self cloudLocalState]) {
    [(PLDescriptionBuilder *)v3 appendName:@"cloudLocalState" integerValue:(int)[(PLInternalResource *)self cloudLocalState]];
  }
  v51 = [(PLInternalResource *)self cloudMasterDateCreated];

  if (v51)
  {
    v52 = [(PLInternalResource *)self cloudMasterDateCreated];
    [(PLDescriptionBuilder *)v3 appendName:@"cloudMasterDateCreated" object:v52];
  }
  v53 = [(PLInternalResource *)self cloudLastPrefetchDate];
  [v53 timeIntervalSinceReferenceDate];
  double v55 = v54;

  if (v55 > 0.0)
  {
    v56 = [(PLInternalResource *)self cloudLastPrefetchDate];
    [(PLDescriptionBuilder *)v3 appendName:@"cloudLastPrefetchDate" object:v56];
  }
  v57 = [(PLInternalResource *)self cloudLastOnDemandDownloadDate];

  if (v57)
  {
    v58 = [(PLInternalResource *)self cloudLastOnDemandDownloadDate];
    [(PLDescriptionBuilder *)v3 appendName:@"cloudLastOnDemandDownloadDate" object:v58];
  }
  v59 = [(PLInternalResource *)self uniformTypeIdentifier];
  int v60 = [v59 conformsToMovie];

  if (v60)
  {
    v61 = [(PLInternalResource *)self dataStore];
    char v62 = [v61 videoResource:self matchesOrExceedsQualityLevel:0];

    if (v62)
    {
      v63 = @"high";
    }
    else
    {
      v64 = [(PLInternalResource *)self dataStore];
      char v65 = [v64 videoResource:self matchesOrExceedsQualityLevel:1];

      if (v65)
      {
        v63 = @"large";
      }
      else
      {
        v66 = [(PLInternalResource *)self dataStore];
        char v67 = [v66 videoResource:self matchesOrExceedsQualityLevel:2];

        if (v67)
        {
          v63 = @"med";
        }
        else
        {
          v68 = [(PLInternalResource *)self dataStore];
          int v69 = [v68 videoResource:self matchesOrExceedsQualityLevel:3];

          if (v69) {
            v63 = @"low";
          }
          else {
            v63 = @"none";
          }
        }
      }
    }
    [(PLDescriptionBuilder *)v3 appendName:@"video-quality-level" object:v63];
  }
  if ([(PLInternalResource *)self trashedState])
  {
    [(PLDescriptionBuilder *)v3 appendName:@"trashedState" integerValue:(int)[(PLInternalResource *)self trashedState]];
    v70 = [(PLInternalResource *)self trashedDate];
    [(PLDescriptionBuilder *)v3 appendName:@"trashedDate" object:v70];
  }
  v71 = [(PLDescriptionBuilder *)v3 build];

  return (NSString *)v71;
}

- (id)redactedDescription
{
  v2 = [(PLInternalResource *)self objectID];
  v3 = [v2 description];

  return v3;
}

- (id)singleLineDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  v7 = [(PLInternalResource *)self asset];
  v8 = [v7 uuid];
  [v6 appendFormat:@" assetUUID: %@", v8];

  unsigned int v9 = [(PLInternalResource *)self resourceType];
  if (v9 > 0x1F) {
    v10 = @"invalid";
  }
  else {
    v10 = off_1E58641E0[v9];
  }
  unsigned int v11 = v10;
  [v6 appendFormat:@" type: %@", v11];

  v12 = +[PLResourceRecipe recipeFromID:[(PLInternalResource *)self recipeID]];
  v13 = [v12 description];
  [v6 appendFormat:@" recipeID: %@", v13];

  unsigned int v14 = [(PLInternalResource *)self version];
  if (v14 > 2) {
    v15 = @"cur";
  }
  else {
    v15 = off_1E58642E0[v14];
  }
  v16 = v15;
  [v6 appendFormat:@" ver: %@", v16];

  v17 = [(PLInternalResource *)self dataStore];
  v18 = objc_msgSend(v17, "descriptionForSubtype:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));
  [v6 appendFormat:@" subtype: %@", v18];

  [v6 appendFormat:@" size: (%ld, %ld)", -[PLInternalResource unorientedWidth](self, "unorientedWidth"), -[PLInternalResource unorientedHeight](self, "unorientedHeight")];
  v19 = [(PLInternalResource *)self uniformTypeIdentifier];
  uint64_t v20 = [v19 identifier];
  [v6 appendFormat:@" uti: %@", v20];

  int v21 = [(PLInternalResource *)self localAvailability];
  v22 = @"N";
  if (v21 == 1) {
    v22 = @"Y";
  }
  [v6 appendFormat:@" local: %@", v22];
  v23 = [(PLInternalResource *)self dataStoreKey];
  v24 = [(PLInternalResource *)self asset];
  v25 = [v24 assetID];
  v26 = [v23 fileURLForAssetID:v25];

  if (v26) {
    [v6 appendFormat:@" url: %@", v26];
  }

  return v6;
}

- (id)photosCTLJSONDict
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PLInternalResource *)self codecFourCharCodeName];

  if (v4)
  {
    v5 = [(PLInternalResource *)self codecFourCharCodeName];
  }
  else
  {
    v5 = @"none";
  }
  v6 = [(PLInternalResource *)self uniformTypeIdentifier];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 identifier];
  }
  else
  {
    v8 = @"none";
  }
  unsigned int v9 = [(PLInternalResource *)self objectID];
  v10 = [v9 description];
  [v3 setObject:v10 forKeyedSubscript:@"objectID"];

  unsigned int v11 = [(PLInternalResource *)self asset];

  if (v11)
  {
    v12 = [(PLInternalResource *)self asset];
    v13 = [v12 uuid];
    [v3 setObject:v13 forKeyedSubscript:@"asset"];
  }
  [v3 setObject:v8 forKeyedSubscript:@"uti"];
  unsigned int v14 = objc_msgSend(NSNumber, "numberWithShort:", -[PLInternalResource dataStoreClassID](self, "dataStoreClassID"));
  [v3 setObject:v14 forKeyedSubscript:@"store"];

  v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));
  [v3 setObject:v15 forKeyedSubscript:@"subtype"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLInternalResource version](self, "version"));
  [v3 setObject:v16 forKeyedSubscript:@"version"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLInternalResource recipeID](self, "recipeID"));
  [v3 setObject:v17 forKeyedSubscript:@"recipe"];

  [v3 setObject:v5 forKeyedSubscript:@"codec"];
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLInternalResource orientation](self, "orientation"));
  [v3 setObject:v18 forKeyedSubscript:@"orientation"];

  v19 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLInternalResource unorientedWidth](self, "unorientedWidth"));
  [v3 setObject:v19 forKeyedSubscript:@"unorientedWidth"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLInternalResource unorientedHeight](self, "unorientedHeight"));
  [v3 setObject:v20 forKeyedSubscript:@"unorientedHeight"];

  int v21 = objc_msgSend(NSNumber, "numberWithShort:", -[PLInternalResource localAvailability](self, "localAvailability"));
  [v3 setObject:v21 forKeyedSubscript:@"localAvailability"];

  v22 = objc_msgSend(NSNumber, "numberWithShort:", -[PLInternalResource remoteAvailability](self, "remoteAvailability"));
  [v3 setObject:v22 forKeyedSubscript:@"remoteAvailability"];

  v23 = [(PLInternalResource *)self dataStoreKey];
  v24 = [(PLInternalResource *)self asset];
  v25 = [v24 assetID];
  v26 = [v23 descriptionForAssetID:v25];
  [v3 setObject:v26 forKeyedSubscript:@"dataStoreKey"];

  v27 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLInternalResource ptpTrashedState](self, "ptpTrashedState"));
  [v3 setObject:v27 forKeyedSubscript:@"ptpTrashedState"];

  v28 = [(PLInternalResource *)self sidecarIndex];

  if (v28)
  {
    v29 = [(PLInternalResource *)self sidecarIndex];
    [v3 setObject:v29 forKeyedSubscript:@"sidecarIndex"];
  }
  return v3;
}

- (id)photosCTLDescription
{
  id v3 = [(PLInternalResource *)self asset];
  int v32 = [v3 uuid];

  int v4 = [(PLInternalResource *)self localAvailability];
  v5 = @"NO";
  if (v4 >= 0) {
    v5 = @"YES";
  }
  v28 = v5;
  uint64_t v6 = [(PLInternalResource *)self dataStoreSubtype];
  uint64_t v7 = [(PLInternalResource *)self orientation];
  uint64_t v8 = [(PLInternalResource *)self unorientedWidth];
  uint64_t v9 = [(PLInternalResource *)self unorientedHeight];
  v10 = +[PLResourceRecipe recipeFromID:[(PLInternalResource *)self recipeID]];
  unsigned int v11 = v10;
  if (v10)
  {
    v12 = [v10 description];
  }
  else
  {
    v12 = @"none";
  }
  v13 = [(PLInternalResource *)self codecFourCharCodeName];

  if (v13)
  {
    unsigned int v14 = [(PLInternalResource *)self codecFourCharCodeName];
  }
  else
  {
    unsigned int v14 = @"none";
  }
  v15 = [(PLInternalResource *)self uniformTypeIdentifier];
  v31 = v15;
  if (v15)
  {
    v30 = [v15 identifier];
  }
  else
  {
    v30 = @"none";
  }
  v16 = [(PLInternalResource *)self dataStoreKey];
  v17 = [(PLInternalResource *)self assetID];
  v29 = [v16 descriptionForAssetID:v17];

  v18 = NSString;
  int v19 = [(PLInternalResource *)self dataStoreClassID];
  unsigned int v20 = [(PLInternalResource *)self version];
  if (v20 > 2) {
    int v21 = @"cur";
  }
  else {
    int v21 = off_1E58642E0[v20];
  }
  uint64_t v22 = v8;
  uint64_t v23 = v19;
  double v24 = (double)v22;
  v25 = v21;
  v26 = [v18 stringWithFormat:@"asset: %@, store: %ld, subtype: %ld, version: %@, recipe: %@, uti: %@, codec: %@, orient: %d, size: (%ld, %ld), l-avail: %@, qual: %ld, key: %@", v32, v23, v6, v25, v12, v30, v14, v7, (uint64_t)v24, (uint64_t)(double)v9, v28, -[PLInternalResource qualitySortValue](self, "qualitySortValue"), v29];

  return v26;
}

- (int)qualitySortValue
{
  id v3 = [(PLInternalResource *)self asset];
  [v3 unorientedSize];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(PLInternalResource *)self compactUTI];
  uint64_t v9 = +[PLUniformTypeIdentifier utiWithCompactRepresentation:v8 conformanceHint:[(PLInternalResource *)self utiConformanceHint]];

  int v10 = [v9 isLosslessEncoding];
  int v11 = PLIsResourceMarkedFullSizeFromRecipeID([(PLInternalResource *)self recipeID]);
  uint64_t v12 = [(PLInternalResource *)self unorientedWidth];
  uint64_t v13 = [(PLInternalResource *)self unorientedHeight];
  int v14 = v10 | 2;
  if (!v11) {
    int v14 = v10;
  }
  double v15 = sqrt((double)(v13 * v12)) / sqrt((double)((uint64_t)v7 * (uint64_t)v5));
  if (v15 >= 1.0) {
    double v16 = 32767.0;
  }
  else {
    double v16 = v15 * 32767.0;
  }
  int v17 = v14 | ((int)v16 << 16);

  return v17;
}

- (void)makeResourceLocallyAvailableWithCompletion:(id)a3
{
  id v5 = a3;
  double v6 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
  [(PLResourceLocalAvailabilityRequestOptions *)v6 setNetworkAccessAllowed:1];
  double v7 = [(PLInternalResource *)self dataStore];

  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLInternalResource.m", 1020, @"Invalid parameter not satisfying: %@", @"self.dataStore" object file lineNumber description];
  }
  uint64_t v8 = [(PLInternalResource *)self dataStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PLInternalResource_makeResourceLocallyAvailableWithCompletion___block_invoke;
  v12[3] = &unk_1E58630A8;
  id v13 = v5;
  SEL v14 = a2;
  v12[4] = self;
  id v9 = v5;
  id v10 = (id)[v8 requestLocalAvailabilityChange:1 forResource:self options:v6 completion:v12];
}

void __65__PLInternalResource_makeResourceLocallyAvailableWithCompletion___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  double v7 = v6;
  if (v10)
  {
    uint64_t v8 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    if (!v6)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a1[6], a1[4], @"PLInternalResource.m", 1023, @"Invalid parameter not satisfying: %@", @"fileURL != nil" object file lineNumber description];
    }
    uint64_t v8 = *(void (**)(void))(a1[5] + 16);
  }
  v8();
}

- (BOOL)hasInvalidFileID
{
  return ![(PLInternalResource *)self fileID] || [(PLInternalResource *)self fileID] == -1;
}

- (id)purgeIfPossibleReturningError:(id *)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(PLInternalResource *)self fileURL];
  id v6 = v5;
  if (!v5)
  {
    double v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    v36 = @"Resource has no file URL (unavailable)";
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    int v19 = &v36;
    unsigned int v20 = &v35;
    goto LABEL_27;
  }
  double v7 = [v5 path];
  id v34 = 0;
  BOOL v8 = +[PLCacheDeleteSupport isPurgeableFile:v7 outIsPhotoType:0 outUrgencyLevel:0 error:&v34];
  id v9 = v34;

  if (!v8)
  {
    if (v9)
    {
      if ((PLIsErrorFileNotFound() & 1) == 0)
      {
        int v21 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = PLResourceIdentityShortDescription(self);
          *(_DWORD *)buf = 138543874;
          int v38 = v22;
          __int16 v39 = 2112;
          v40 = v6;
          __int16 v41 = 2112;
          id v42 = v9;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Unable check purgeable flags requesting make unavailable on resource: %{public}@ with URL: %@, error: %@", buf, 0x20u);
        }
      }
LABEL_28:
      int v15 = 0;
      if (!a3) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    v27 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = PLResourceIdentityShortDescription(self);
      *(_DWORD *)buf = 138543618;
      int v38 = v28;
      __int16 v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Non-derivative resource is not marked as purgeable on purgeability check, resource: %{public}@, URL: %@", buf, 0x16u);
    }
    double v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v43 = *MEMORY[0x1E4F28228];
    v44[0] = @"Purgeable flags not set on resource";
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    int v19 = (__CFString **)v44;
    unsigned int v20 = &v43;
LABEL_27:
    v29 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    id v9 = [v16 errorWithDomain:v17 code:47019 userInfo:v29];

    goto LABEL_28;
  }
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v33 = v9;
  char v11 = [v10 removeItemAtURL:v6 error:&v33];
  id v12 = v33;

  if (v11)
  {
    id v13 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      SEL v14 = PLResourceIdentityShortDescription(self);
      *(_DWORD *)buf = 138543618;
      int v38 = v14;
      __int16 v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Resource purged via explicit purge request: %{public}@, URL %@", buf, 0x16u);
    }
    [(PLInternalResource *)self markAsNotLocallyAvailableAfterPurge];
    int v15 = 1;
  }
  else
  {
    if ((PLIsErrorFileNotFound() & 1) == 0)
    {
      uint64_t v23 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        double v24 = PLResourceIdentityShortDescription(self);
        *(_DWORD *)buf = 138543874;
        int v38 = v24;
        __int16 v39 = 2112;
        v40 = v6;
        __int16 v41 = 2112;
        id v42 = v12;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Unable to remove file for resource: %{public}@, URL: %@, error: %@", buf, 0x20u);
      }
    }
    if (PLIsErrorFileNotFound())
    {
      v25 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = PLResourceIdentityShortDescription(self);
        *(_DWORD *)buf = 138543618;
        int v38 = v26;
        __int16 v39 = 2112;
        v40 = v6;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Resource was marked as locally available but file missing from disk, marking as not locally available, resource: %{public}@, URL: %@", buf, 0x16u);
      }
      [(PLInternalResource *)self markAsNotLocallyAvailable];
    }
    int v15 = 0;
  }
  id v9 = v12;
  if (a3) {
LABEL_29:
  }
    *a3 = v9;
LABEL_30:
  if (v15) {
    v30 = v6;
  }
  else {
    v30 = 0;
  }
  id v31 = v30;

  return v31;
}

- (BOOL)isRemotelyAvailable
{
  return (int)[(PLInternalResource *)self remoteAvailability] > 0;
}

- (BOOL)isLocallyAvailable
{
  return (int)[(PLInternalResource *)self localAvailability] > 0;
}

- (void)deleteResource
{
  double v4 = [(PLInternalResource *)self managedObjectContext];

  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLInternalResource.m" lineNumber:881 description:@"deleteResource requires a managedObjectContext."];
  }
  id v5 = [(PLInternalResource *)self managedObjectContext];
  [v5 deleteObject:self];

  [(PLInternalResource *)self setAsset:0];
  [(PLInternalResource *)self setTransientCloudMaster:0];
}

- (void)markAsNotLocallyAvailableAfterPurge
{
  [(PLInternalResource *)self markAsNotLocallyAvailable];
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [(PLInternalResource *)self setCloudPrunedAt:v3];
}

- (void)markAsNotLocallyAvailable
{
  uint64_t v3 = [(PLInternalResource *)self localAvailability];
  id v9 = [(PLInternalResource *)self dataStoreKey];
  if ([(PLInternalResource *)self dataStoreClassID] == 3) {
    [(PLInternalResource *)self setSyndicationLocalAvailabilityWithAvailable:0];
  }
  else {
    [(PLInternalResource *)self setLocalAvailability:0xFFFFFFFFLL];
  }
  [(PLInternalResource *)self setDataStoreKeyData:0];
  [(PLInternalResource *)self setFileID:-1];
  if ((v3 & 0x80000000) == 0)
  {
    uint64_t v4 = [(PLInternalResource *)self asset];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [(PLInternalResource *)self asset];
      char v7 = [v6 isDeleted];

      if ((v7 & 1) == 0)
      {
        BOOL v8 = [(PLInternalResource *)self asset];
        [v8 recalculateImageRequestHintsForResource:self afterLocalAvailabilityChangeFrom:v3 previousDataStoreKey:v9];
      }
    }
  }
}

- (BOOL)isAdjustedFullSizeRenderResource
{
  if ([(PLInternalResource *)self version] != 2) {
    return 0;
  }
  if ([(PLInternalResource *)self cplType] == 2 || [(PLInternalResource *)self cplType] == 16) {
    return 1;
  }
  return [(PLInternalResource *)self cplType] == 19;
}

- (BOOL)isAdjustedResource
{
  return [(PLInternalResource *)self version] == 3
      || [(PLInternalResource *)self version] == 2
      || [(PLInternalResource *)self version] == 1;
}

- (BOOL)isDefaultOrientation
{
  return [(PLInternalResource *)self orientation] == 1;
}

- (id)expectedFileURL
{
  uint64_t v3 = [(PLInternalResource *)self dataStore];
  uint64_t v4 = [(PLInternalResource *)self asset];
  id v5 = [v3 expectedFileURLForResource:self asset:v4];

  return v5;
}

- (id)fileURL
{
  uint64_t v3 = [(PLInternalResource *)self asset];
  uint64_t v4 = [v3 assetID];

  if (v4)
  {
    id v5 = [(PLInternalResource *)self dataStoreKey];
    id v6 = [v5 fileURLForAssetID:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setResourceIdentity:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  -[PLInternalResource setResourceType:](self, "setResourceType:", [v5 resourceType]);
  -[PLInternalResource setVersion:](self, "setVersion:", [v5 version]);
  -[PLInternalResource setRecipeID:](self, "setRecipeID:", [v5 recipeID]);
  id v6 = [v5 uniformTypeIdentifier];

  [(PLInternalResource *)self setUniformTypeIdentifier:v6];
}

- (BOOL)repairResourceValidationErrors:(id)a3 managedObjectContext:(id)a4
{
  v100[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PLResourceModelValidationError allPossibleErrorCodes];
  if (![v5 count])
  {
    id v7 = v6;

    id v5 = v7;
  }
  BOOL v8 = (void *)[v5 mutableCopy];
  if (![v8 count])
  {
    BOOL v77 = 0;
    goto LABEL_73;
  }
  v81 = v6;
  id v82 = v5;
  char v84 = 0;
  *(void *)&long long v9 = 138543618;
  long long v79 = v9;
  do
  {
    id v10 = objc_msgSend(v8, "anyObject", v79);
    uint64_t v11 = [v10 integerValue];
    if (v11 == 1 || v11 == 3)
    {
      id v13 = [(PLInternalResource *)self asset];

      if (!v13)
      {
        int v19 = PLImageManagerGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          double v24 = [(PLInternalResource *)self objectID];
          *(_DWORD *)buf = 138543362;
          v92 = v24;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Unable to repair resource with objectID: %{public}@, no asset is set.", buf, 0xCu);
        }
        goto LABEL_66;
      }
      SEL v14 = [(PLInternalResource *)self fileURL];
      int v15 = [(PLInternalResource *)self validatedExternalResourceRepresentationUsingFileURL:v14];

      double v16 = [(PLInternalResource *)self asset];
      uint64_t v17 = [v16 master];

      if (v17)
      {
        BOOL v18 = [(PLInternalResource *)self isCPLResource];
        int v19 = MEMORY[0x1E4F1CBF0];
        if (!v18) {
          goto LABEL_33;
        }
        unsigned int v20 = [(PLInternalResource *)self asset];
        int v21 = objc_msgSend(v20, "pathForCPLResourceType:adjusted:", -[PLInternalResource cplType](self, "cplType"), -[PLInternalResource isAdjustedResource](self, "isAdjustedResource"));

        if (v21)
        {
          uint64_t v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21 isDirectory:0];
          [v15 setFileURL:v22];
        }
        else
        {
          [v15 setFileURL:0];
        }
        v100[0] = v15;
        id v31 = (void *)MEMORY[0x1E4F1C978];
        int v32 = (void **)v100;
      }
      else
      {
        if ([(PLInternalResource *)self dataStoreClassID] != 3)
        {
          int v21 = [(PLInternalResource *)self asset];
          uint64_t v34 = +[PLResourceInstaller externalResourcesForExistingAsset:v21 referencedResourceURLs:0];
LABEL_32:
          int v19 = v34;

LABEL_33:
          uint64_t v35 = (void *)MEMORY[0x1E4F28F60];
          v89[0] = MEMORY[0x1E4F143A8];
          v89[1] = 3221225472;
          v89[2] = __74__PLInternalResource_repairResourceValidationErrors_managedObjectContext___block_invoke;
          v89[3] = &unk_1E5863080;
          id v36 = v15;
          id v90 = v36;
          v37 = [v35 predicateWithBlock:v89];
          int v38 = [v19 filteredArrayUsingPredicate:v37];
          __int16 v39 = [v38 firstObject];

          if (v39)
          {
            id v85 = v36;
            int v40 = [v36 isEqualToValidatedExternalResource:v39];
            if ([(PLInternalResource *)self isLocallyAvailable])
            {
              __int16 v41 = [MEMORY[0x1E4F28CB8] defaultManager];
              buf[0] = 0;
              [v39 fileURL];
              id v42 = v8;
              uint64_t v43 = self;
              v44 = v19;
              v46 = v45 = v39;
              char v47 = [v46 path];
              int v48 = [v41 fileExistsAtPath:v47 isDirectory:buf];
              int v49 = (buf[0] == 0) & ~v48;

              __int16 v39 = v45;
              int v19 = v44;
              self = v43;
              BOOL v8 = v42;
            }
            else
            {
              int v49 = 0;
            }
            int v61 = v40 ^ 1 | v49;
            char v62 = PLImageManagerGetLog();
            BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
            if (v61 == 1)
            {
              id v36 = v85;
              if (v63)
              {
                v64 = [(PLInternalResource *)self objectID];
                *(_DWORD *)buf = 138544130;
                v92 = v64;
                __int16 v93 = 2114;
                id v94 = v82;
                __int16 v95 = 2112;
                uint64_t v96 = (uint64_t)v39;
                __int16 v97 = 2112;
                v98 = self;
                _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Storing corrections to objectID: %{public}@ for error codes: %{public}@, using external resource: %@, on target resource: %@.", buf, 0x2Au);
              }
              char v65 = [(PLInternalResource *)self dataStore];
              v66 = [(PLInternalResource *)self asset];
              id v87 = 0;
              id v88 = 0;
              v83 = v39;
              char v67 = [v65 storeExternalResource:v39 forAsset:v66 options:0 error:&v88 resultingResource:&v87];
              id v68 = v88;
              id v69 = v87;

              if (v67)
              {
                char v84 = 1;
              }
              else
              {
                v71 = PLImageManagerGetLog();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                {
                  v72 = [(PLInternalResource *)self objectID];
                  uint64_t v80 = [v68 code];
                  v73 = [v68 domain];
                  *(_DWORD *)buf = 138544130;
                  v92 = v72;
                  __int16 v93 = 2112;
                  id v94 = v68;
                  __int16 v95 = 2048;
                  uint64_t v96 = v80;
                  __int16 v97 = 2114;
                  v98 = v73;
                  _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_ERROR, "[RM]: Repair: Unable to repair resource with objectID: %{public}@, cannot store changes. error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);
                }
              }

              __int16 v39 = v83;
            }
            else
            {
              id v36 = v85;
              if (v63)
              {
                v70 = [(PLInternalResource *)self objectID];
                *(_DWORD *)buf = 138543362;
                v92 = v70;
                _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Unable to repair resource with objectID: %{public}@, could not produce any changes vs stored resource.", buf, 0xCu);
              }
            }
            goto LABEL_65;
          }
          v50 = [(PLInternalResource *)self fileURL];

          if (v50)
          {
            char v86 = 0;
            v51 = [MEMORY[0x1E4F28CB8] defaultManager];
            v52 = [(PLInternalResource *)self fileURL];
            v53 = [v52 path];
            int v54 = [v51 fileExistsAtPath:v53 isDirectory:&v86];

            if (!v54)
            {
              double v55 = PLImageManagerGetLog();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                v56 = [(PLInternalResource *)self fileURL];
                v57 = [v56 path];
                v58 = [(PLInternalResource *)self objectID];
                *(_DWORD *)buf = 138412802;
                v92 = v57;
                __int16 v93 = 2114;
                id v94 = v58;
                __int16 v95 = 2114;
                uint64_t v96 = (uint64_t)v82;
                v59 = v55;
                int v60 = "[RM]: Repair: File not locally available at path: '%@' for resource objectID: %{public}@ for error"
                      " codes: %{public}@, marking as not locally available.";
                goto LABEL_58;
              }
LABEL_59:
              __int16 v39 = 0;

              [(PLInternalResource *)self markAsNotLocallyAvailable];
              goto LABEL_60;
            }
            if (v86)
            {
              double v55 = PLImageManagerGetLog();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                v56 = [(PLInternalResource *)self fileURL];
                v57 = [v56 path];
                v58 = [(PLInternalResource *)self objectID];
                *(_DWORD *)buf = 138412802;
                v92 = v57;
                __int16 v93 = 2114;
                id v94 = v58;
                __int16 v95 = 2114;
                uint64_t v96 = (uint64_t)v82;
                v59 = v55;
                int v60 = "[RM]: Repair: Unexpectedly found directory at resource path: '%@' for resource objectID: %{public}"
                      "@ for error codes: %{public}@, marking as not locally available.";
LABEL_58:
                _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEFAULT, v60, buf, 0x20u);

                goto LABEL_59;
              }
              goto LABEL_59;
            }
            __int16 v39 = 0;
            if (v84) {
              goto LABEL_60;
            }
          }
          else if (v84)
          {
LABEL_60:
            char v84 = 1;
LABEL_65:

LABEL_66:
            [v8 removeObject:&unk_1EEBED0E0];
            [v8 removeObject:&unk_1EEBED0F8];
            goto LABEL_67;
          }
          v74 = PLImageManagerGetLog();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            v75 = [(PLInternalResource *)self objectID];
            *(_DWORD *)buf = v79;
            v92 = v75;
            __int16 v93 = 2114;
            id v94 = v82;
            _os_log_impl(&dword_19B3C7000, v74, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Cannot find external resource match to correct for resource objectID: %{public}@ for error codes: %{public}@, no corrections made.", buf, 0x16u);
          }
          char v84 = 0;
          goto LABEL_65;
        }
        v25 = [(PLInternalResource *)self asset];
        uint64_t v26 = [(PLInternalResource *)self resourceType];
        uint64_t v27 = [(PLInternalResource *)self version];
        uint64_t v28 = [(PLInternalResource *)self recipeID];
        v29 = [(PLInternalResource *)self uniformTypeIdentifier];
        v30 = [v29 identifier];
        int v21 = [v25 syndicationResourceURLForResourceType:v26 version:v27 recipeID:v28 utiString:v30 error:0];

        if (v21) {
          [v15 setFileURL:v21];
        }
        v99 = v15;
        id v31 = (void *)MEMORY[0x1E4F1C978];
        int v32 = &v99;
      }
      uint64_t v34 = [v31 arrayWithObjects:v32 count:1];
      goto LABEL_32;
    }
    if (v11 == 5)
    {
      if (([(PLInternalResource *)self localAvailability] & 0x80000000) != 0
        && ([(PLInternalResource *)self dataStoreKeyData],
            id v33 = objc_claimAutoreleasedReturnValue(),
            v33,
            v33))
      {
        char v84 = 1;
        [(PLInternalResource *)self setLocalAvailability:1];
      }
      else if ([(PLInternalResource *)self isLocallyAvailable])
      {
        uint64_t v23 = [(PLInternalResource *)self dataStoreKeyData];

        if (!v23)
        {
          [(PLInternalResource *)self setLocalAvailability:0xFFFFFFFFLL];
          char v84 = 1;
        }
      }
    }
LABEL_67:
    [v8 removeObject:v10];
  }
  while ([v8 count]);
  if (v84)
  {
    v76 = [(PLInternalResource *)self asset];
    [v76 recalculateImageRequestHints];

    BOOL v77 = 1;
  }
  else
  {
    BOOL v77 = 0;
  }
  id v5 = v82;
  id v6 = v81;
LABEL_73:

  return v77;
}

uint64_t __74__PLInternalResource_repairResourceValidationErrors_managedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return PLResourceIdentityIsEqual(a2, *(void **)(a1 + 32));
}

- (id)validatedExternalResourceRepresentationUsingFileURL:(id)a3
{
  id v4 = a3;
  if ([(PLInternalResource *)self isCPLResource]) {
    id v5 = [[PLValidatedExternalCloudResource alloc] initWithInternalResource:self];
  }
  else {
    id v5 = objc_alloc_init(PLValidatedExternalResource);
  }
  id v6 = v5;
  [(PLValidatedExternalResource *)v5 setVersion:[(PLInternalResource *)self version]];
  [(PLValidatedExternalResource *)v6 setResourceType:[(PLInternalResource *)self resourceType]];
  [(PLValidatedExternalResource *)v6 setRecipeID:[(PLInternalResource *)self recipeID]];
  id v7 = [(PLInternalResource *)self uniformTypeIdentifier];
  [(PLValidatedExternalResource *)v6 setUniformTypeIdentifier:v7];

  [(PLValidatedExternalResource *)v6 setFileURL:v4];
  [(PLValidatedExternalResource *)v6 setDataLength:[(PLInternalResource *)self dataLength]];
  [(PLValidatedExternalResource *)v6 setUnorientedWidth:[(PLInternalResource *)self unorientedWidth]];
  [(PLValidatedExternalResource *)v6 setUnorientedHeight:[(PLInternalResource *)self unorientedHeight]];
  BOOL v8 = [(PLInternalResource *)self codecFourCharCodeName];
  [(PLValidatedExternalResource *)v6 setCodecFourCharCode:v8];

  [(PLValidatedExternalResource *)v6 setPtpTrashedState:[(PLInternalResource *)self ptpTrashedState]];
  long long v9 = [(PLInternalResource *)self sidecarIndex];
  [(PLValidatedExternalResource *)v6 setSidecarIndex:v9];

  [(PLValidatedExternalResource *)v6 setTrashedState:[(PLInternalResource *)self trashedState]];
  id v10 = [(PLInternalResource *)self trashedDate];
  [(PLValidatedExternalResource *)v6 setTrashedDate:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = v6;
    [(PLValidatedExternalCloudResource *)v11 setCplType:[(PLInternalResource *)self cplType]];
    [(PLValidatedExternalCloudResource *)v11 setRemoteAvailability:[(PLInternalResource *)self remoteAvailability]];
  }
  return v6;
}

- (PLInternalResourceSidecarRepresentation)sidecarRepresentation
{
  sidecarRepresentation = self->_sidecarRepresentation;
  if (!sidecarRepresentation)
  {
    id v4 = [[PLInternalResourceSidecarRepresentation alloc] initWithResource:self];
    id v5 = self->_sidecarRepresentation;
    self->_sidecarRepresentation = v4;

    sidecarRepresentation = self->_sidecarRepresentation;
  }
  return sidecarRepresentation;
}

- (BOOL)isInCloud
{
  int v3 = (unsigned __int16)[(PLInternalResource *)self dataStoreClassID];
  if ((v3 - 2) < 2)
  {
    id v4 = [(PLInternalResource *)self dataStore];
    char v5 = objc_msgSend(v4, "dataStoreSubtypeIsDownloadable:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));
LABEL_8:

    return v5;
  }
  if (!v3)
  {
    id v4 = [(PLInternalResource *)self dataStore];
    if (objc_msgSend(v4, "dataStoreSubtypeIsDownloadable:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype")))
    {
      id v6 = [(PLInternalResource *)self fingerprint];
      char v5 = v6 != 0;
    }
    else
    {
      char v5 = 0;
    }
    goto LABEL_8;
  }
  return 0;
}

- (void)setLocalAvailability:(signed __int16)a3
{
  uint64_t v3 = a3;
  [(PLInternalResource *)self willAccessValueForKey:@"localAvailability"];
  char v5 = [(PLInternalResource *)self primitiveValueForKey:@"localAvailability"];
  int v6 = [v5 shortValue];

  [(PLInternalResource *)self didAccessValueForKey:@"localAvailability"];
  if (v6 != v3)
  {
    [(PLInternalResource *)self willChangeValueForKey:@"localAvailability"];
    id v7 = [NSNumber numberWithShort:v3];
    [(PLInternalResource *)self setPrimitiveValue:v7 forKey:@"localAvailability"];

    [(PLInternalResource *)self didChangeValueForKey:@"localAvailability"];
    if (([(PLInternalResource *)self isDeleted] & 1) == 0)
    {
      BOOL v8 = [(PLInternalResource *)self asset];

      if (v8)
      {
        if ((int)v3 >= 1 && v6 < 0)
        {
          id v9 = [(PLInternalResource *)self asset];
          [v9 reconsiderLocalAvailabilityTargetsForResourceGeneratableByAvailabilityWorker];
        }
      }
    }
  }
}

- (BOOL)isPlayableVideo
{
  if (![(PLInternalResource *)self isLocallyAvailable]) {
    goto LABEL_13;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F8CC48]);
  id v4 = [(PLInternalResource *)self fileURL];
  char v5 = (void *)[v3 initWithAVURL:v4 options:12 timeZoneLookup:0];

  if (!v5
    || (objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isPlayable")),
        int v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
LABEL_13:
    if ([(PLInternalResource *)self resourceType] != 1) {
      goto LABEL_7;
    }
    id v7 = objc_alloc(MEMORY[0x1E4F8CC48]);
    BOOL v8 = [(PLInternalResource *)self _avAssetProxyIfTypeIsFullSizeOrOriginal];
    id v9 = (void *)[v7 initWithAVAsset:v8 options:12 timeZoneLookup:0];

    if (!v9
      || (objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isPlayable")),
          int v6 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v6))
    {
LABEL_7:
      id v10 = [(PLInternalResource *)self codecFourCharCodeName];

      if (!v10
        || (uint64_t v11 = NSNumber,
            [(PLInternalResource *)self codecFourCharCodeName],
            id v12 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "numberWithBool:", +[PLCodec isPlayableFourCharCodecName:](PLCodec, "isPlayableFourCharCodecName:", v12)), int v6 = objc_claimAutoreleasedReturnValue(), v12, !v6))
      {
        id v13 = [(PLInternalResource *)self uniformTypeIdentifier];
        uint64_t v14 = [v13 isPlayableVideo];

        int v6 = [NSNumber numberWithBool:v14];
      }
    }
  }
  char v15 = [v6 BOOLValue];

  return v15;
}

- (float)scale
{
  id v3 = [(PLInternalResource *)self asset];
  [v3 unorientedSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 * v7;
  float result = 0.0;
  if (v8 > 0.0)
  {
    uint64_t v10 = [(PLInternalResource *)self unorientedWidth];
    uint64_t v11 = [(PLInternalResource *)self unorientedHeight];
    float v12 = v8;
    return (float)(v11 * v10) / v12;
  }
  return result;
}

- (int64_t)orientedHeight
{
  uint64_t v3 = [(PLInternalResource *)self unorientedWidth];
  uint64_t v4 = [(PLInternalResource *)self unorientedHeight];
  if ((unint64_t)[(PLInternalResource *)self orientation] - 5 >= 4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v3;
  }
  return (uint64_t)(double)v5;
}

- (int64_t)orientedWidth
{
  uint64_t v3 = [(PLInternalResource *)self unorientedWidth];
  uint64_t v4 = [(PLInternalResource *)self unorientedHeight];
  if ((unint64_t)[(PLInternalResource *)self orientation] - 5 >= 4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v4;
  }
  return (uint64_t)(double)v5;
}

- (unsigned)orientation
{
  int v3 = [(PLInternalResource *)self resourceType];
  uint64_t v4 = [(PLInternalResource *)self recipeID];
  int v5 = [(PLInternalResource *)self version];
  double v6 = [(PLInternalResource *)self asset];
  unsigned int v7 = [v6 orientation];
  double v8 = [(PLInternalResource *)self asset];
  unsigned int v9 = [v8 originalOrientation];
  uint64_t v10 = [(PLInternalResource *)self asset];
  unsigned int v11 = PLResourceOrientationFromResourceInfo(v3, v4, v5, v7, v9, [v10 hasAdjustments]);

  return v11;
}

- (PLAssetID)assetID
{
  v2 = [(PLInternalResource *)self asset];
  int v3 = [v2 assetID];

  return (PLAssetID *)v3;
}

- (PLResourceDataStoreKey)dataStoreKey
{
  int v3 = [(PLInternalResource *)self dataStoreKeyData];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 bytes];
    double v6 = [(PLInternalResource *)self dataStore];
    unsigned int v7 = [v6 keyFromKeyStruct:v5];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return (PLResourceDataStoreKey *)v7;
}

- (PLResourceDataStore)dataStore
{
  unsigned __int16 v3 = [(PLInternalResource *)self dataStoreClassID];
  uint64_t v4 = [(PLInternalResource *)self _libraryID];
  uint64_t v5 = PLDataStoreForClassIDAndLibraryID(v3, v4);

  return (PLResourceDataStore *)v5;
}

- (BOOL)isDerivative
{
  return [(PLInternalResource *)self recipeID] & 1;
}

- (BOOL)isOriginalResource
{
  v2 = self;
  if ([(PLInternalResource *)v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = ([(PLInternalResource *)v2 recipeID] & 1) == 0;
  }

  return v3;
}

- (void)setFingerprint:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLInternalResource *)self willAccessValueForKey:@"fingerprint"];
  uint64_t v5 = [(PLInternalResource *)self primitiveValueForKey:@"fingerprint"];
  [(PLInternalResource *)self didAccessValueForKey:@"fingerprint"];
  if (([v5 isEqualToString:v4] & 1) == 0)
  {
    if (!v4 && v5)
    {
      double v6 = PLImageManagerGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v7 = [(PLInternalResource *)self objectID];
        int v8 = 138412290;
        unsigned int v9 = v7;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Erasing existing fingerprint on resource: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    [(PLInternalResource *)self willChangeValueForKey:@"fingerprint"];
    [(PLInternalResource *)self setPrimitiveValue:v4 forKey:@"fingerprint"];
    [(PLInternalResource *)self didChangeValueForKey:@"fingerprint"];
  }
}

- (void)setUniformTypeIdentifier:(id)a3
{
  id v9 = a3;
  id v4 = [(PLInternalResource *)self uniformTypeIdentifier];
  char v5 = [v4 isEqualToUniformTypeIdentifier:v9];

  double v6 = v9;
  if ((v5 & 1) == 0)
  {
    if (v9)
    {
      unsigned int v7 = [v9 compactRepresentation];
      [(PLInternalResource *)self setCompactUTI:v7];

      uint64_t v8 = [v9 conformanceHint];
    }
    else
    {
      [(PLInternalResource *)self setCompactUTI:0];
      uint64_t v8 = 0;
    }
    [(PLInternalResource *)self setUtiConformanceHint:v8];
    double v6 = v9;
  }
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  BOOL v3 = [(PLInternalResource *)self compactUTI];

  if (v3)
  {
    id v4 = [(PLInternalResource *)self compactUTI];
    char v5 = +[PLUniformTypeIdentifier utiWithCompactRepresentation:v4 conformanceHint:[(PLInternalResource *)self utiConformanceHint]];
  }
  else
  {
    char v5 = 0;
  }
  return (PLUniformTypeIdentifier *)v5;
}

- (BOOL)isVirtual
{
  return 0;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v5 = a3;
  double v6 = [(PLInternalResource *)self dataStoreKeyData];

  if ([(PLInternalResource *)self isLocallyAvailable] && !v6
    || (int v7 = [(PLInternalResource *)self localAvailability], v8 = (void *)MEMORY[0x1E4F1CBF0],
                                                                                 v7 < 0)
    && v6)
  {
    id v9 = +[PLResourceModelValidationError localAvailabilityInconsistencyErrorForResource:self];
    uint64_t v8 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v9];
  }
  if (![(PLInternalResource *)self dataStoreClassID]
    && ![(PLInternalResource *)self isCPLResource]
    && ![(PLInternalResource *)self isDerivative]
    && ([(PLInternalResource *)self localAvailability] & 0x80000000) != 0)
  {
    uint64_t v10 = +[PLResourceModelValidationError unexpectedLocalResourceError:self];
    uint64_t v11 = [v8 arrayByAddingObject:v10];

    uint64_t v8 = (void *)v11;
  }
  float v12 = [(PLInternalResource *)self dataStoreKey];
  id v13 = [v12 validateForAssetID:v5 resourceIdentity:self];

  uint64_t v14 = [v8 arrayByAddingObjectsFromArray:v13];

  return v14;
}

- (NSString)cloudUUIDForDeletion
{
  BOOL v3 = [(PLInternalResource *)self cloudDeleteAssetUUIDWithResourceType];

  if (!v3)
  {
    id v4 = NSString;
    id v5 = [(PLInternalResource *)self asset];
    double v6 = [v5 uuid];
    int v7 = [v4 stringWithFormat:@"%@%s%tu", v6, "-@-", -[PLInternalResource cplType](self, "cplType")];

    [(PLInternalResource *)self setCloudDeleteAssetUUIDWithResourceType:v7];
  }
  return (NSString *)[(PLInternalResource *)self cloudDeleteAssetUUIDWithResourceType];
}

- (int64_t)cloudDeletionType
{
  return 10;
}

- (void)willSave
{
  v10.receiver = self;
  v10.super_class = (Class)PLInternalResource;
  [(PLManagedObject *)&v10 willSave];
  BOOL v3 = [(PLInternalResource *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([(PLInternalResource *)self isDeleted] & 1) == 0)
  {
    if ([(PLInternalResource *)self isInserted])
    {
      [(PLInternalResource *)self persistTrashedStateToFilesystem];
    }
    else if ([(PLInternalResource *)self shouldPersistTrashedState])
    {
      id v4 = [(PLInternalResource *)self fileURL];
      if (v4)
      {
        id v5 = [(PLInternalResource *)self changedValues];
        double v6 = [v5 objectForKeyedSubscript:@"trashedState"];

        if (v6)
        {
          int v7 = [MEMORY[0x1E4F8B900] filesystemPersistenceBatchItemForFileAtURL:v4];
          BOOL v8 = [(PLInternalResource *)self isTrashedOrExpunged];
          uint64_t v9 = *MEMORY[0x1E4F8C460];
          if (v8) {
            [v7 setUInt16:1 forKey:v9];
          }
          else {
            [v7 setData:0 forKey:v9];
          }
          [v7 persist];
        }
      }
    }
  }
}

- (void)prepareForDeletion
{
  v6.receiver = self;
  v6.super_class = (Class)PLInternalResource;
  [(PLManagedObject *)&v6 prepareForDeletion];
  BOOL v3 = [(PLInternalResource *)self asset];

  if (v3)
  {
    [(PLInternalResource *)self markAsNotLocallyAvailable];
    id v4 = [(PLInternalResource *)self cloudUUIDForDeletion];
    [(PLInternalResource *)self setCloudDeleteAssetUUIDWithResourceType:v4];
  }
  id v5 = [(PLInternalResource *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 mergingChanges] & 1) == 0
    && [(PLInternalResource *)self supportsTrashedState])
  {
    [v5 recordCloudDeletionForObject:self];
  }
}

- (void)persistTrashedStateToFilesystem
{
  if ([(PLInternalResource *)self shouldPersistTrashedState])
  {
    uint64_t v6 = [(PLInternalResource *)self fileURL];
    BOOL v3 = [(PLInternalResource *)self isTrashedOrExpunged];
    id v4 = (void *)v6;
    if (v6 && v3)
    {
      id v5 = [MEMORY[0x1E4F8B900] filesystemPersistenceBatchItemForFileAtURL:v6];
      [v5 setUInt16:1 forKey:*MEMORY[0x1E4F8C460]];
      [v5 persist];

      id v4 = (void *)v6;
    }
  }
}

- (BOOL)shouldPersistTrashedState
{
  if (![(PLInternalResource *)self supportsTrashedState]) {
    return 0;
  }
  BOOL v3 = [(PLInternalResource *)self fileSystemBookmark];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)applyTrashedState:(signed __int16)a3 trashedDate:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(PLInternalResource *)self supportsTrashedState])
  {
    int v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v27 = v4;
      *(_WORD *)&v27[4] = 2048;
      *(void *)&v27[6] = [(PLInternalResource *)self dataStoreSubtype];
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Unexpected resource type for trash state: %d, with CPL resource type: %lld, ignoring", buf, 0x12u);
    }
    goto LABEL_30;
  }
  int v7 = [(PLInternalResource *)self asset];
  if (v4 == 2)
  {
    if ([(PLInternalResource *)self trashedState] == 1)
    {
      id v13 = PLBackendGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(PLInternalResource *)self objectID];
        char v15 = [(PLInternalResource *)self asset];
        double v16 = [v15 uuid];
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v27 = v14;
        *(_WORD *)&v27[8] = 2114;
        *(void *)&v27[10] = v16;
        uint64_t v17 = "Expunging already trashed resource %{public}@ on asset %{public}@";
LABEL_20:
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
      }
    }
    else
    {
      if ([(PLInternalResource *)self trashedState]) {
        goto LABEL_22;
      }
      id v13 = PLBackendGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(PLInternalResource *)self objectID];
        char v15 = [(PLInternalResource *)self asset];
        double v16 = [v15 uuid];
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v27 = v14;
        *(_WORD *)&v27[8] = 2114;
        *(void *)&v27[10] = v16;
        uint64_t v17 = "Expunging resource, skipping trash state on resource %{public}@ on asset %{public}@";
        goto LABEL_20;
      }
    }

LABEL_22:
    [(PLInternalResource *)self setTrashedState:v4];
    BOOL v8 = [(PLInternalResource *)self fileURL];
    [(PLInternalResource *)self deleteResource];
    if (!v8)
    {
      unsigned int v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = [(PLInternalResource *)self objectID];
        uint64_t v22 = [(PLInternalResource *)self asset];
        uint64_t v23 = [v22 uuid];
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v27 = v21;
        *(_WORD *)&v27[8] = 2114;
        *(void *)&v27[10] = v23;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Cannot delete resource file for resource: %{public}@ on asset: %{public}@ because fileURL is nil.", buf, 0x16u);
      }
      goto LABEL_28;
    }
    BOOL v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v25 = 0;
    char v19 = [v18 removeItemAtURL:v8 error:&v25];
    unsigned int v20 = v25;
    if ((v19 & 1) == 0)
    {
      char v24 = PLIsErrorFileNotFound();

      if (v24) {
        goto LABEL_28;
      }
      BOOL v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v27 = v8;
        *(_WORD *)&v27[8] = 2112;
        *(void *)&v27[10] = v20;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Cannot delete resource file: %@, %@", buf, 0x16u);
      }
    }

LABEL_28:
    [v7 reevaluateCameraProcessingAdjustmentState];
    goto LABEL_29;
  }
  if (v4 == 1)
  {
    if (![(PLInternalResource *)self trashedState])
    {
      [(PLInternalResource *)self setTrashedState:v4];
      [(PLInternalResource *)self setTrashedDate:v6];
      BOOL v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(PLInternalResource *)self objectID];
        objc_super v10 = [(PLInternalResource *)self asset];
        uint64_t v11 = [v10 uuid];
        *(_DWORD *)buf = 138543618;
        *(void *)uint64_t v27 = v9;
        *(_WORD *)&v27[8] = 2114;
        *(void *)&v27[10] = v11;
        float v12 = "Trashed resource %{public}@ on asset %{public}@";
        goto LABEL_16;
      }
LABEL_29:
    }
  }
  else if (!v4 && [(PLInternalResource *)self trashedState] == 1)
  {
    [(PLInternalResource *)self setTrashedState:v4];
    [(PLInternalResource *)self setTrashedDate:0];
    BOOL v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(PLInternalResource *)self objectID];
      objc_super v10 = [(PLInternalResource *)self asset];
      uint64_t v11 = [v10 uuid];
      *(_DWORD *)buf = 138543618;
      *(void *)uint64_t v27 = v9;
      *(_WORD *)&v27[8] = 2114;
      *(void *)&v27[10] = v11;
      float v12 = "Untrashed resource %{public}@ on asset %{public}@";
LABEL_16:
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);

      goto LABEL_29;
    }
    goto LABEL_29;
  }
LABEL_30:
}

- (void)applyTrashedState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2592000.0];
  [(PLInternalResource *)self applyTrashedState:v3 trashedDate:v5];
}

- (BOOL)isTrashedOrExpunged
{
  return [(PLInternalResource *)self trashedState] != 0;
}

- (BOOL)supportsTrashedState
{
  uint64_t v3 = objc_opt_class();
  return [v3 supportsTrashedStateForResourceIdentity:self];
}

- (BOOL)isSyncableChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(PLInternalResource *)self changedValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = +[PLInternalResource listOfSyncedProperties];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = [v2 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * i)];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)supportsCloudUpload
{
  return 1;
}

- (id)_avAssetProxyIfTypeIsFullSizeOrOriginal
{
  unint64_t v3 = [(PLInternalResource *)self cplType];
  if (v3 == 16)
  {
    id v6 = [(PLInternalResource *)self asset];
    int v7 = [v6 hasAdjustments];

    if (v7)
    {
      uint64_t v4 = [(PLInternalResource *)self asset];
      uint64_t v5 = [v4 avAssetProxyForFullSizeAllowReadFromFile:0];
      goto LABEL_6;
    }
  }
  else if (v3 == 1)
  {
    uint64_t v4 = [(PLInternalResource *)self asset];
    uint64_t v5 = [v4 avAssetProxyForOriginalAllowReadFromFile:0];
LABEL_6:
    BOOL v8 = (void *)v5;

    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_8:
  return v8;
}

- (BOOL)_colorSpaceIsNativeForDisplay
{
  BOOL v3 = [(PLInternalResource *)self isDerivative];
  if (v3)
  {
    uint64_t v4 = +[PLResourceRecipe recipeFromID:[(PLInternalResource *)self recipeID]];
    char v5 = [v4 colorSpaceIsNativeForDisplay];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_libraryID
{
  uint64_t v4 = [(PLInternalResource *)self managedObjectContext];
  char v5 = [v4 pathManager];

  if (!v5)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PLInternalResource.m" lineNumber:140 description:@"Unexpected nil pathManager on managed object context."];
  }
  id v6 = PLLibraryIDFromPathManager();

  return v6;
}

+ (BOOL)batchResetFileIDInManagedObjectContext:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F1C038];
  id v7 = a3;
  id v8 = [v6 alloc];
  long long v9 = [a1 entityName];
  long long v10 = (void *)[v8 initWithEntityName:v9];

  long long v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %lld", @"fileID", -1);
  [v10 setPredicate:v11];
  [v10 setResultType:2];
  int v21 = @"fileID";
  v22[0] = &unk_1EEBED170;
  long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  [v10 setPropertiesToUpdate:v12];

  id v18 = 0;
  id v13 = [v7 executeRequest:v10 error:&v18];

  id v14 = v18;
  if (v14)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_9;
    }
    char v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to batch reset fileID for internal resources: %@", buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_9;
    }
    char v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [v13 result];
      *(_DWORD *)buf = 138412290;
      id v20 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Batch reset fileID for %@ internal resources", buf, 0xCu);
    }
  }

LABEL_9:
  if (a4) {
    *a4 = v14;
  }

  return v14 == 0;
}

+ (BOOL)deleteObsoleteResourcesInManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 fetchRequest];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  long long v9 = [a1 _obsoleteResourceRecipesWithCPLOff];
  long long v10 = [v8 predicateWithFormat:@"%K in %@ AND %K == %d", @"recipeID", v9, @"dataStoreClassID", 0];

  [v7 setPredicate:v10];
  id v20 = 0;
  long long v11 = [v6 executeFetchRequest:v7 error:&v20];
  id v12 = v20;
  id v13 = PLBackendGetLog();
  id v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v11 count];
      double v16 = [a1 _obsoleteResourceRecipesWithCPLOff];
      *(_DWORD *)buf = 134218242;
      uint64_t v22 = (const char *)v15;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v16;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Deleting obsolete resources, deleting %ld resources with the following recipe IDs: %@", buf, 0x16u);
    }
    BOOL v17 = 1;
    uint64_t v18 = [v6 enumerateWithIncrementalSaveUsingObjects:v11 shouldRefreshAfterSave:1 withBlock:&__block_literal_global_111];

    if (!v18)
    {
      id v12 = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    id v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "+[PLInternalResource deleteObsoleteResourcesInManagedObjectContext:error:]";
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "%s: Error saving resource deletes: %@", buf, 0x16u);
    }
    id v12 = (id)v18;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "+[PLInternalResource deleteObsoleteResourcesInManagedObjectContext:error:]";
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v12;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "%s: Error fetching resources: %@", buf, 0x16u);
  }

  BOOL v17 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v12;
LABEL_12:

  return v17;
}

void __74__PLInternalResource_deleteObsoleteResourcesInManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = [v2 fileURL];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = 0;
    char v5 = [v4 removeItemAtURL:v3 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0)
    {
      char v7 = PLIsErrorFileNotFound();

      if (v7) {
        goto LABEL_6;
      }
      uint64_t v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v10 = v3;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Could not delete obsolete resource at URL: %@", buf, 0xCu);
      }
    }

LABEL_6:
    [v2 deleteResource];

    goto LABEL_7;
  }
  [v2 deleteResource];
LABEL_7:
}

+ (id)_obsoleteResourceRecipesWithCPLOff
{
  if (_obsoleteResourceRecipesWithCPLOff_onceToken != -1) {
    dispatch_once(&_obsoleteResourceRecipesWithCPLOff_onceToken, &__block_literal_global_3953);
  }
  id v2 = (void *)_obsoleteResourceRecipesWithCPLOff_recipes;
  return v2;
}

void __56__PLInternalResource__obsoleteResourceRecipesWithCPLOff__block_invoke()
{
  v0 = (void *)_obsoleteResourceRecipesWithCPLOff_recipes;
  _obsoleteResourceRecipesWithCPLOff_recipes = (uint64_t)&unk_1EEBF1580;
}

+ (id)insertResourceForAssetObjectID:(id)a3 resourceIdentity:(id)a4 inManagedObjectContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLInternalResource.m", 592, @"Invalid parameter not satisfying: %@", @"assetObjectID" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  double v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"PLInternalResource.m", 593, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

LABEL_3:
  id v12 = [a1 insertInManagedObjectContext:v11];
  id v13 = [v11 objectWithID:v9];
  [v12 setAsset:v13];
  [v12 setResourceIdentity:v10 managedObjectContext:v11];

  return v12;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"cloudDeleteAssetUUIDWithResourceType";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 10;
}

+ (BOOL)supportsTrashedStateForResourceIdentity:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 resourceType] & 0xFFFFFFFE) == 0xA && objc_msgSend(v3, "version") == 0;

  return v4;
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  id v2 = (void *)listOfSyncedProperties_result;
  return v2;
}

void __44__PLInternalResource_listOfSyncedProperties__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"trashedDate", @"trashedState", 0);
  v1 = (void *)listOfSyncedProperties_result;
  listOfSyncedProperties_float result = v0;
}

+ (id)entityName
{
  return @"InternalResource";
}

- (void)clearRequiresSanitizationFlag
{
  uint64_t v3 = [(PLInternalResource *)self localAvailability] & 0xFFFFFFFDLL;
  [(PLInternalResource *)self setLocalAvailability:v3];
}

- (void)setSyndicationLocalAvailabilityWithAvailable:(BOOL)a3
{
}

- (void)setSyndicationLocalAvailabilityWithAvailable:(BOOL)a3 additionalFlags:(unsigned __int16)a4
{
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v7 = [(PLInternalResource *)self localAvailability];
  if (v5) {
    unsigned int v8 = ((unsigned __int16)v7 | a4) & 0x7FF8 | 1;
  }
  else {
    unsigned int v8 = ((unsigned __int16)v7 | a4) & 0x7FFE | 0xFFFF8000;
  }
  if (v7 != v8)
  {
    [(PLInternalResource *)self setLocalAvailability:(__int16)v8];
    id v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = PLSyndicationResourceLocalAvailabilityDescription(v8);
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "[resource] setting syndication local availability to %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)ensureInitialValuesForSyndication
{
  [(PLInternalResource *)self setDataStoreClassID:3];
  int v3 = [(PLInternalResource *)self resourceType];
  int v4 = [(PLInternalResource *)self recipeID];
  uint64_t v5 = 18;
  if (v4) {
    uint64_t v5 = 0;
  }
  BOOL v6 = v4 == 0;
  uint64_t v7 = 4 * (v4 == 65741);
  if (!v4) {
    uint64_t v7 = 1;
  }
  if (v3) {
    uint64_t v7 = 0;
  }
  if (v3 != 1) {
    BOOL v6 = v7;
  }
  if (v3 == 3) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  [(PLInternalResource *)self setDataStoreSubtype:v8];
  [(PLInternalResource *)self setLocalAvailability:4294934528];
}

+ (id)predicateForSyndicationResourcesRequiringBackgroundDownload
{
  v13[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  int v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreClassID", 3);
  int v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreSubtype", 4, v3);
  v13[1] = v4;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %d", @"localAvailability", 1);
  v13[2] = v5;
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"cloudPrunedAt");
  v13[3] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v7 predicateWithFormat:@"%K < %@", @"cloudLastPrefetchDate", v8];
  v13[4] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  int v11 = [v2 andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)predicateForSyndicationResourcesRequiringSanitization
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  int v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreClassID", 3);
  v8[0] = v3;
  int v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"localAvailability", 4294934530);
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  BOOL v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

- (id)referenceMediaFileURL
{
  int v3 = [(PLInternalResource *)self dataStoreKey];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
    uint64_t v5 = [(PLInternalResource *)self asset];
    BOOL v6 = [v5 assetID];
    uint64_t v7 = [(PLInternalResource *)self managedObjectContext];
    uint64_t v8 = [v4 fileURLForAssetID:v6 inContext:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)canRepresentAsSidecar
{
  return ![(PLInternalResource *)self version]
      && ![(PLInternalResource *)self isDerivative]
      && [(PLInternalResource *)self resourceType] - 2 < 4;
}

- (id)scopedIdentifier
{
  int v3 = [(PLInternalResource *)self asset];
  if ([(PLInternalResource *)self isCPLMasterResource])
  {
    id v4 = [v3 master];
    uint64_t v5 = [v4 scopedIdentifier];
  }
  else if (v3)
  {
    uint64_t v5 = [v3 scopedIdentifier];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setDataLength:(int64_t)a3
{
  if (a3) {
    -[PLInternalResource managedObjectOriginal_setDataLength:](self, "managedObjectOriginal_setDataLength:");
  }
}

- (BOOL)copyPurgeabilityFromFileURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = -1;
  uint64_t v5 = [v4 path];
  BOOL v6 = +[PLCacheDeleteSupport isPurgeableFile:v5 outIsPhotoType:0 outUrgencyLevel:&v17 error:0];

  uint64_t v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 path];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)char v19 = v6;
      *(_WORD *)&v19[4] = 2112;
      *(void *)&v19[6] = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "source file purgeable:%d at %@", buf, 0x12u);
    }
  }
  if (v6)
  {
    uint64_t v16 = 0;
    id v10 = [(PLInternalResource *)self cplFileURL];
    BOOL v11 = +[PLCacheDeleteSupport markPurgeableForFileAtURL:v10 withUrgency:v17 outInode:&v16];

    if (v11)
    {
      [(PLInternalResource *)self setFileID:v16];
      if (!*v7)
      {
        id v12 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [(PLInternalResource *)self fileURL];
          id v14 = [v13 path];
          *(_DWORD *)buf = 138412546;
          *(void *)char v19 = v14;
          *(_WORD *)&v19[8] = 2048;
          *(void *)&v19[10] = v16;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "updated purgeable file at %@ to inode %lld", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)resetPrefetchState
{
  if ([(PLInternalResource *)self cloudPrefetchCount]) {
    [(PLInternalResource *)self setCloudPrefetchCount:0];
  }
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  int v3 = [(PLInternalResource *)self cloudLastPrefetchDate];
  char v4 = [v3 isEqualToDate:v6];

  if ((v4 & 1) == 0) {
    [(PLInternalResource *)self setCloudLastPrefetchDate:v6];
  }
  uint64_t v5 = [(PLInternalResource *)self cloudPrunedAt];

  if (v5) {
    [(PLInternalResource *)self setCloudPrunedAt:0];
  }
}

- (id)cplFileURL
{
  int v3 = [(PLInternalResource *)self fileURL];
  if (!v3)
  {
    if ([(PLInternalResource *)self isCPLResource])
    {
      char v4 = [(PLInternalResource *)self asset];
      uint64_t v5 = objc_msgSend(v4, "pathForCPLResourceType:adjusted:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"), -[PLInternalResource isAdjustedResource](self, "isAdjustedResource"));

      if (v5)
      {
        int v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
      }
      else
      {
        int v3 = 0;
      }
    }
    else
    {
      int v3 = 0;
    }
  }
  return v3;
}

- (void)transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResourceAtFilePath:(id)a3
{
  id v10 = a3;
  if (![(PLInternalResource *)self dataStoreClassID])
  {
    char v4 = [(PLInternalResource *)self asset];

    if (v4)
    {
      uint64_t v5 = [(PLInternalResource *)self localAvailability];
      id v6 = [(PLInternalResource *)self dataStoreKey];
      uint64_t v7 = [(PLInternalResource *)self dataStore];
      objc_msgSend(v7, "transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResource:givenFilePath:", self, v10);
      int v8 = [(PLInternalResource *)self localAvailability];
      if ((v5 & 0x80000000) != 0)
      {
        if (v8 < 0) {
          goto LABEL_9;
        }
      }
      else if ((v8 & 0x80000000) == 0)
      {
        goto LABEL_8;
      }
      id v9 = [(PLInternalResource *)self asset];
      [v9 recalculateImageRequestHintsForResource:self afterLocalAvailabilityChangeFrom:v5 previousDataStoreKey:v6];

LABEL_8:
      if ((int)v5 > 0)
      {
LABEL_11:

        goto LABEL_12;
      }
LABEL_9:
      if ([(PLInternalResource *)self isLocallyAvailable]) {
        [(PLInternalResource *)self persistTrashedStateToFilesystem];
      }
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (id)cplResourceForFileURL:(id)a3 createDirectoryIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(PLInternalResource *)self isCPLResource])
  {
    uint64_t v7 = [(PLInternalResource *)self fingerprint];

    if (v7)
    {
      if (v6 && v4)
      {
        int v8 = [v6 URLByDeletingLastPathComponent];
        id v9 = [v8 path];

        id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v24 = 0;
        char v11 = [v10 createDirectoryIfNeededAtPath:v9 error:&v24];
        id v12 = v24;

        if ((v11 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
        {
          uint64_t v13 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = [(PLInternalResource *)self singleLineDescription];
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = v14;
            __int16 v27 = 2112;
            id v28 = v12;
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Unable to create directory for resource %@: %@.", buf, 0x16u);
          }
        }
      }
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F59948]) initWithFileURL:v6];
      [v15 setFileSize:[(PLInternalResource *)self dataLength]];
      -[NSObject setImageDimensions:](v15, "setImageDimensions:", (double)[(PLInternalResource *)self unorientedWidth], (double)[(PLInternalResource *)self unorientedHeight]);
      [v15 setAvailable:[(PLInternalResource *)self remoteAvailability] == 1];
      uint64_t v16 = [(PLInternalResource *)self uniformTypeIdentifier];
      uint64_t v17 = [v16 identifier];
      [v15 setFileUTI:v17];

      uint64_t v18 = [(PLInternalResource *)self fingerprint];
      [v15 setFingerPrint:v18];

      char v19 = [(PLInternalResource *)self stableHash];
      [v15 setStableHash:v19];

      uint64_t v20 = [(PLInternalResource *)self scopedIdentifier];
      int v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F59940]), "initWithResourceIdentity:itemScopedIdentifier:resourceType:", v15, v20, -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));

LABEL_16:
      goto LABEL_18;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v15 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [(PLInternalResource *)self singleLineDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v22;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Resource %@ has no fingerprint", buf, 0xCu);
      }
      int v21 = 0;
      goto LABEL_16;
    }
  }
  int v21 = 0;
LABEL_18:

  return v21;
}

- (id)cplResourceIncludeFile:(BOOL)a3 createDirectoryIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v6 = [(PLInternalResource *)self cplFileURL];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [(PLInternalResource *)self cplResourceForFileURL:v6 createDirectoryIfNeeded:v4];

  return v7;
}

- (id)cplResourceIncludeFile:(BOOL)a3
{
  return [(PLInternalResource *)self cplResourceIncludeFile:a3 createDirectoryIfNeeded:1];
}

- (id)cplResourceForTimeRange:(id *)a3
{
  uint64_t v5 = [(PLManagedObject *)self pathManager];
  id v6 = [(PLInternalResource *)self fingerprint];
  uint64_t v7 = [(PLInternalResource *)self asset];
  int v8 = [v7 uuid];
  long long v9 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v9;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  id v10 = [v5 URLForPartialVideoWithResourceFingerprint:v6 assetUUID:v8 timeRange:v13];

  char v11 = [(PLInternalResource *)self cplResourceForFileURL:v10 createDirectoryIfNeeded:1];

  return v11;
}

- (id)expungeableResourceStateRepresentation
{
  if ([(PLInternalResource *)self supportsTrashedState])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F59870]);
    objc_msgSend(v3, "setResourceType:", -[PLInternalResource cplType](self, "cplType"));
    objc_msgSend(v3, "setExpungedState:", +[PLInternalResource cplExpungedStateForTrashedState:](PLInternalResource, "cplExpungedStateForTrashedState:", -[PLInternalResource trashedState](self, "trashedState")));
    BOOL v4 = [(PLInternalResource *)self trashedDate];
    [v3 setExpungedDate:v4];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isCPLOriginalResourceAssetHasAdjustments:(BOOL)a3
{
  BOOL v5 = a3;
  BOOL v7 = [(PLInternalResource *)self isCPLMasterResource];
  if (v7)
  {
    id v3 = [(id)objc_opt_class() originalCPLResourceTypesForMaster];
    BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLInternalResource cplType](self, "cplType"));
    if ([v3 containsObject:v4])
    {
      char v8 = 1;
      goto LABEL_9;
    }
  }
  if (!v5 || ![(PLInternalResource *)self isCPLAssetResource])
  {
    char v8 = 0;
    BOOL result = 0;
    if (!v7) {
      return result;
    }
    goto LABEL_9;
  }
  long long v9 = [(id)objc_opt_class() originalCPLResourceTypesForAsset];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLInternalResource cplType](self, "cplType"));
  char v8 = [v9 containsObject:v10];

  BOOL result = v8;
  if (v7)
  {
LABEL_9:

    return v8;
  }
  return result;
}

- (BOOL)isCPLOriginalResource
{
  return [(PLInternalResource *)self isCPLOriginalResourceAssetHasAdjustments:1];
}

- (BOOL)isCPLJPEGThumbnail
{
  return [(PLInternalResource *)self cplType] == 5;
}

- (BOOL)isCPLAssetResource
{
  BOOL v3 = [(PLInternalResource *)self isAdjustedResource];
  if (v3)
  {
    LOBYTE(v3) = [(PLInternalResource *)self isCPLResource];
  }
  return v3;
}

- (BOOL)isCPLMasterResource
{
  if ([(PLInternalResource *)self version]) {
    return 0;
  }
  return [(PLInternalResource *)self isCPLResource];
}

- (BOOL)isCPLResource
{
  return [(PLInternalResource *)self cplType] != 0;
}

- (unint64_t)cplType
{
  if ([(PLInternalResource *)self dataStoreClassID]) {
    return 0;
  }
  return [(PLInternalResource *)self dataStoreSubtype];
}

- (void)setCloudAttributesWithExternalResource:(id)a3
{
  id v16 = a3;
  if ([v16 cloudLocalState]) {
    -[PLInternalResource setCloudLocalState:](self, "setCloudLocalState:", [v16 cloudLocalState]);
  }
  BOOL v4 = [v16 masterDateCreated];

  if (v4)
  {
    BOOL v5 = [v16 masterDateCreated];
    [(PLInternalResource *)self setCloudMasterDateCreated:v5];
  }
  if ((int)[v16 prefetchCount] >= 1) {
    -[PLInternalResource setCloudPrefetchCount:](self, "setCloudPrefetchCount:", [v16 prefetchCount]);
  }
  id v6 = [v16 prunedAt];

  if (v6)
  {
    BOOL v7 = [v16 prunedAt];
    [(PLInternalResource *)self setCloudPrunedAt:v7];
  }
  char v8 = [v16 lastOnDemandDownloadDate];

  if (v8)
  {
    long long v9 = [v16 lastOnDemandDownloadDate];
    [(PLInternalResource *)self setCloudLastOnDemandDownloadDate:v9];
  }
  id v10 = [v16 lastPrefetchDate];

  if (v10)
  {
    char v11 = [v16 lastPrefetchDate];
    [(PLInternalResource *)self setCloudLastPrefetchDate:v11];
  }
  if ([v16 sourceCplType]) {
    -[PLInternalResource setCloudSourceType:](self, "setCloudSourceType:", [v16 sourceCplType]);
  }
  id v12 = [v16 fingerprint];

  if (v12)
  {
    uint64_t v13 = [v16 fingerprint];
    [(PLInternalResource *)self setFingerprint:v13];
  }
  id v14 = [v16 stableHash];

  if (v14)
  {
    uint64_t v15 = [v16 stableHash];
    [(PLInternalResource *)self setStableHash:v15];
  }
}

- (void)updateResourceForMasterExternalCPLResource:(id)a3 inManagedObjectContext:(id)a4
{
  id v9 = a3;
  -[PLInternalResource setResourceType:](self, "setResourceType:", [v9 resourceType]);
  -[PLInternalResource setVersion:](self, "setVersion:", [v9 version]);
  -[PLInternalResource setRecipeID:](self, "setRecipeID:", [v9 recipeID]);
  -[PLInternalResource setUnorientedWidth:](self, "setUnorientedWidth:", [v9 unorientedWidth]);
  -[PLInternalResource setUnorientedHeight:](self, "setUnorientedHeight:", [v9 unorientedHeight]);
  -[PLInternalResource setDataStoreSubtype:](self, "setDataStoreSubtype:", [v9 cplType]);
  BOOL v5 = [v9 uniformTypeIdentifier];

  if (v5)
  {
    id v6 = [v9 uniformTypeIdentifier];
    [(PLInternalResource *)self setUniformTypeIdentifier:v6];
  }
  BOOL v7 = [v9 codecFourCharCode];

  if (v7)
  {
    char v8 = [v9 codecFourCharCode];
    [(PLInternalResource *)self setCodecFourCharCodeName:v8];
  }
  -[PLInternalResource setRemoteAvailability:](self, "setRemoteAvailability:", [v9 remoteAvailability]);
  -[PLInternalResource setDataLength:](self, "setDataLength:", [v9 dataLength]);
  [(PLInternalResource *)self setCloudAttributesWithExternalResource:v9];
}

+ (void)triggerBackgroundDownloadFailureForResources:(id)a3 cloudPhotoLibraryManager:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    char v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
    *(void *)&long long v8 = 138412290;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (!*v11)
        {
          id v14 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = [v13 singleLineDescription];
            *(_DWORD *)buf = v17;
            __int16 v23 = v15;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Triggering failure for resource %@ download, detecting change/delete", buf, 0xCu);
          }
        }
        id v16 = objc_msgSend(v13, "cplResourceIncludeFile:", 0, v17);
        [v6 libraryManager:0 backgroundDownloadDidFailForResource:v16];
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }
}

+ (id)purgeablePushedPredicateForCPLResourceTypes:(id)a3 urgency:(int64_t)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  uint64_t v7 = [v5 predicateWithFormat:@"%K > %@ AND %K >= %@ AND fingerprint != NULL", @"localAvailability", &unk_1EEBEF300, @"remoteAvailability", &unk_1EEBEF318];
  long long v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %d AND %K in %@", @"dataStoreClassID", 0, @"dataStoreSubtype", v6];

  if (a4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
    v19[0] = v7;
    v19[1] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    char v11 = [v9 andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [v12 dateByAddingTimeInterval:-86400.0];

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = [v13 dateByAddingTimeInterval:-259200.0];

    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated <= %@ AND cloudLastOnDemandDownloadDate <= %@", v10, v14];
    id v16 = (void *)MEMORY[0x1E4F28BA0];
    v20[0] = v7;
    v20[1] = v8;
    v20[2] = v15;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    char v11 = [v16 andPredicateWithSubpredicates:v17];
  }
  return v11;
}

+ (id)predicateForPurgeableOriginalResources
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  BOOL v3 = [a1 originalCPLResourceTypes];
  BOOL v4 = [v2 predicateWithFormat:@"dataStoreClassID == %d AND dataStoreSubtype IN %@ AND localAvailability == %d AND remoteAvailability == %d", 0, v3, 1, 1];

  return v4;
}

+ (id)predicateForAvailableResources
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"dataStoreClassID == %d AND dataStoreSubtype != %d AND localAvailability == %d AND remoteAvailability == %d", 0, 0, 1, 1);
}

+ (id)predicateForOriginalsToDownload
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K == %ul AND %K <= %d AND %K >= %d AND %K == %d", @"dataStoreClassID", 0, @"dataStoreSubtype", 1, @"localAvailability", 0xFFFFFFFFLL, @"remoteAvailability", 1, @"asset.trashedState", 0);
  v8[0] = v3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForMomentSharedAsset"), 1, @"asset");
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)prunePredicateForCPLResourceTypes:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"dataStoreClassID == %d AND dataStoreSubtype IN %@ AND localAvailability > %d AND remoteAvailability >= %d AND (noindex:(cloudLocalState) == %d OR noindex:(cloudLocalState) == %d) AND dataStoreKeyData != NULL AND fingerprint != NULL", 0, a3, 0xFFFFFFFFLL, 1, 1, 3];
}

+ (id)predicateForResourceIsNotLocallyAvailableWithCPLResourceType:(unint64_t)a3 version:(unsigned int)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(asset.modernResources, $r, $r.dataStoreClassID == %d AND ($r.dataStoreSubtype == %lu) AND $r.localAvailability == %d AND $r.version == %d).@count == 0)", 0, a3, 1, *(void *)&a4];
}

+ (id)predicateForMaxFilesize:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"dataLength <= %llu", a3);
}

+ (id)predicateForResourceCreatedAfterDate:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"cloudMasterDateCreated >= %@", a3];
}

+ (id)predicateForImageResourcePixelsLessOrEqual:(int64_t)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(id)*MEMORY[0x1E4F44410] identifier];
  uint64_t v5 = *MEMORY[0x1E4F15A98];
  v11[0] = v4;
  v11[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F15A70];
  v11[2] = *MEMORY[0x1E4F15AA0];
  v11[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  long long v8 = +[PLUniformTypeIdentifierIntegratedLookup compactRepresentationsForIdentifiers:v7];

  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"unorientedWidth * unorientedHeight <= %d AND compactUTI IN %@", a3, v8];

  return v9;
}

+ (id)prefetchResourcePredicateForCPLResourceType:(unint64_t)a3 isAssetResource:(BOOL)a4 maxRetry:(unint64_t)a5 excludeDynamicResources:(BOOL)a6 additionalResourcePredicates:(id)a7
{
  BOOL v7 = a6;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v13 = [v12 dateByAddingTimeInterval:-86400.0];

  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dataStoreClassID == %d AND dataStoreSubtype == %d AND localAvailability == %d AND remoteAvailability == %d AND cloudPrefetchCount <= %d AND cloudLastPrefetchDate <= %@ AND fingerprint != NULL", 0, a3, 0xFFFFFFFFLL, 1, a5, v13];
  if (a4) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(version == %d OR version == %d)", 2, 1);
  }
  else {
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"version == %d", 0, v30);
  }
  id v16 = (void *)MEMORY[0x1E4F28BA0];
  v33[0] = v14;
  v33[1] = v15;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  long long v18 = [v16 andPredicateWithSubpredicates:v17];

  if (v7)
  {
    long long v19 = (void *)MEMORY[0x1E4F28BA0];
    long long v20 = [MEMORY[0x1E4F59940] predicateMatchingDynamicFingerprintForKey:@"fingerprint"];
    long long v21 = [v19 notPredicateWithSubpredicate:v20];

    uint64_t v22 = (void *)MEMORY[0x1E4F28BA0];
    v32[0] = v18;
    v32[1] = v21;
    __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    uint64_t v24 = [v22 andPredicateWithSubpredicates:v23];

    long long v18 = (void *)v24;
  }
  if ([v11 count])
  {
    uint64_t v25 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v11];
    uint64_t v26 = (void *)MEMORY[0x1E4F28BA0];
    v31[0] = v18;
    v31[1] = v25;
    __int16 v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    uint64_t v28 = [v26 andPredicateWithSubpredicates:v27];

    long long v18 = (void *)v28;
  }

  return v18;
}

+ (id)predicateForAllFullSizeResourcesLocallyAvailable
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  BOOL v3 = [a1 originalCPLResourceTypesForAsset];
  BOOL v4 = [v2 predicateWithFormat:@"(SUBQUERY(modernResources, $r, $r.dataStoreClassID == %d AND ($r.dataStoreSubtype IN %@) AND $r.localAvailability == %d AND ($r.version == %d OR $r.version == %d)).@count == 0)", 0, v3, 0xFFFFFFFFLL, 2, 1];

  return v4;
}

+ (id)predicateForAllOriginalResourcesLocallyAvailable
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  BOOL v3 = [a1 originalCPLResourceTypesForMaster];
  BOOL v4 = [v2 predicateWithFormat:@"(SUBQUERY(modernResources, $r, $r.dataStoreClassID == %d AND ($r.dataStoreSubtype IN %@) AND $r.localAvailability == %d AND $r.version == %d).@count == 0)", 0, v3, 0xFFFFFFFFLL, 0];

  return v4;
}

+ (unint64_t)bytesNeededToDownloadOriginalResourcesInLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PLInternalResource_CPL__bytesNeededToDownloadOriginalResourcesInLibrary___block_invoke;
  void v8[3] = &unk_1E5873ED8;
  id v11 = a1;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v12;
  [v5 performTransactionAndWait:v8];
  unint64_t v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __75__PLInternalResource_CPL__bytesNeededToDownloadOriginalResourcesInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v3 = [*(id *)(a1 + 48) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"dataStoreClassID == %d AND dataStoreSubtype == %d AND localAvailability <= %d", 0, 1, 0xFFFFFFFFLL);
  [v4 setPredicate:v5];
  [v4 setFetchBatchSize:100];
  unint64_t v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v27 = 0;
  BOOL v7 = [v6 executeFetchRequest:v4 error:&v27];
  id v8 = v27;
  if (v7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v11 = v10;
    id v20 = v8;
    long long v21 = v6;
    uint64_t v22 = v5;
    uint64_t v12 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x19F38D3B0]();
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v14 dataLength];
        id v16 = [v14 asset];
        if ([v16 hasAdjustments])
        {
          if ([v16 isPhoto])
          {
            uint64_t v17 = 2;
          }
          else
          {
            if ([v16 isDefaultAdjustedSlomo]) {
              goto LABEL_14;
            }
            uint64_t v17 = 16;
          }
          long long v18 = [v16 assetResourceForCPLType:v17];
          if (v18)
          {
            long long v19 = v18;
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v18 dataLength];
          }
        }
LABEL_14:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (!v11)
      {
        unint64_t v6 = v21;
        id v5 = v22;
        id v8 = v20;
        goto LABEL_20;
      }
    }
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching Cloud Resources for non-local original size estimate: %@", buf, 0xCu);
    }
LABEL_20:
  }
}

+ (unint64_t)bytesForAllResourcesInLibrary:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PLInternalResource_CPL__bytesForAllResourcesInLibrary___block_invoke;
  v9[3] = &unk_1E5873C08;
  id v12 = a1;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = &v14;
  SEL v13 = a2;
  [v6 performTransactionAndWait:v9];
  unint64_t v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

void __57__PLInternalResource_CPL__bytesForAllResourcesInLibrary___block_invoke(uint64_t a1)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v3 = [*(id *)(a1 + 48) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"dataStoreClassID == %d", 0);
  [v4 setPredicate:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v6 setName:@"totalResourceSize"];
  unint64_t v7 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"@sum.dataLength"];
  [v6 setExpression:v7];

  [v6 setExpressionResultType:300];
  v31[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v4 setPropertiesToFetch:v8];

  [v4 setResultType:2];
  id v9 = [*(id *)(a1 + 32) managedObjectContext];
  id v25 = 0;
  id v10 = [v9 executeFetchRequest:v4 error:&v25];
  id v11 = v25;
  if (v10)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v19 = v9;
      id v20 = v5;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForKeyedSubscript:@"totalResourceSize"];
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v17 longLongValue];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v14);
      id v9 = v19;
      id v5 = v20;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v12 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v27 = v18;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "%@ failed to calculate totalResourceSize %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

+ (void)resetPrefetchStateForResourcesWithVersion:(unsigned int)a3 cplType:(unint64_t)a4 assetUuids:(id)a5 inLibrary:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__PLInternalResource_CPL__resetPrefetchStateForResourcesWithVersion_cplType_assetUuids_inLibrary___block_invoke;
  v14[3] = &unk_1E586CC18;
  id v17 = a1;
  unint64_t v18 = a4;
  unsigned int v19 = a3;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [v12 performTransactionAndWait:v14];
}

void __98__PLInternalResource_CPL__resetPrefetchStateForResourcesWithVersion_cplType_assetUuids_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v3 = [*(id *)(a1 + 48) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(dataStoreClassID) == %d AND noindex:(version) == %d AND noindex:(dataStoreSubtype) == %d AND asset.uuid IN %@", 0, *(void *)(a1 + 56), *(unsigned int *)(a1 + 64), *(void *)(a1 + 32)];
  [v4 setPredicate:v5];
  [v4 setFetchBatchSize:100];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v24 = 0;
  unint64_t v7 = [v6 executeFetchRequest:v4 error:&v24];
  id v8 = v24;
  if (v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v19 = v8;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v15 = (void *)MEMORY[0x19F38D3B0]();
          [v14 resetPrefetchState];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
      id v8 = v19;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(_DWORD *)(a1 + 64);
      uint64_t v18 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      uint64_t v27 = v16;
      __int16 v28 = 1024;
      int v29 = v17;
      __int16 v30 = 2048;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching Cloud Resources for %@-%d-%ld: %@", buf, 0x26u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

+ (void)resetCloudResourcesStateForCloudInManagedObjectContext:(id)a3 hardReset:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"soft";
      if (v4) {
        id v9 = @"hard";
      }
      *(_DWORD *)buf = 138412290;
      v56 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Resetting (%@) all cpl resources", buf, 0xCu);
    }
  }
  char v47 = v7;
  if (v4)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v11 = [a1 entityName];
    uint64_t v12 = [v10 fetchRequestWithEntityName:v11];

    uint64_t v44 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K != %d AND %K <= %d AND %K == nil AND %K == %d", @"dataStoreClassID", 0, @"dataStoreSubtype", 0, @"localAvailability", 0xFFFFFFFFLL, @"fileSystemBookmark", @"cloudLocalState", 3);
    objc_msgSend(v12, "setPredicate:");
    v45 = v12;
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v12];
    [v13 setResultType:2];
    id v50 = 0;
    v46 = v6;
    uint64_t v14 = [v6 executeRequest:v13 error:&v50];
    id v15 = (__CFString *)v50;
    if (v15)
    {
      if (*MEMORY[0x1E4F59AC0]) {
        goto LABEL_20;
      }
      uint64_t v16 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to batch delete non-local Resources: Error: %@", buf, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F59AC0]) {
        goto LABEL_20;
      }
      uint64_t v16 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = [(__CFString *)v14 result];
        *(_DWORD *)buf = 138412290;
        v56 = v32;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Batch deleted %@ non-local Resources", buf, 0xCu);
      }
    }

LABEL_20:
    int v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K != %d", @"dataStoreClassID", 0, @"dataStoreSubtype", 0);
    id v33 = objc_alloc(MEMORY[0x1E4F1C038]);
    uint64_t v34 = [a1 entityName];
    uint64_t v35 = (void *)[v33 initWithEntityName:v34];

    [v35 setResultType:2];
    [v35 setPredicate:v31];
    v53[0] = @"remoteAvailability";
    v53[1] = @"cloudLocalState";
    v54[0] = &unk_1EEBEF2B8;
    v54[1] = &unk_1EEBEF2B8;
    v53[2] = @"cloudPrefetchCount";
    v53[3] = @"cloudLastPrefetchDate";
    v54[2] = &unk_1EEBEF2D0;
    v54[3] = v29;
    v53[4] = @"cloudMasterDateCreated";
    id v36 = [MEMORY[0x1E4F1CA98] null];
    v54[4] = v36;
    v53[5] = @"cloudPrunedAt";
    v37 = [MEMORY[0x1E4F1CA98] null];
    v54[5] = v37;
    v53[6] = @"cloudLastOnDemandDownloadDate";
    int v38 = [MEMORY[0x1E4F1CA98] null];
    v53[7] = @"cloudSourceType";
    v54[6] = v38;
    v54[7] = &unk_1EEBEF2E8;
    __int16 v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:8];
    [v35 setPropertiesToUpdate:v39];

    int v49 = v15;
    int v40 = [v46 executeRequest:v35 error:&v49];
    long long v22 = v49;

    if (v22)
    {
      long long v26 = (void *)v44;
      long long v21 = v45;
      if (!*MEMORY[0x1E4F59AC0])
      {
        __int16 v41 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v22;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Failed to batch update cpl resources: Error: %@", buf, 0xCu);
        }
LABEL_31:
      }
    }
    else
    {
      long long v26 = (void *)v44;
      long long v21 = v45;
      if (!*MEMORY[0x1E4F59AC0])
      {
        __int16 v41 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = [v40 result];
          *(_DWORD *)buf = 138412290;
          v56 = v43;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "Batch updated %@ cpl resources", buf, 0xCu);

          long long v22 = 0;
        }
        goto LABEL_31;
      }
    }

    long long v23 = v46;
LABEL_33:

    unint64_t v7 = v47;
    goto LABEL_34;
  }
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  id v18 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v51[0] = @"cloudPrefetchCount";
  v51[1] = @"cloudLastPrefetchDate";
  v52[0] = &unk_1EEBEF2D0;
  v52[1] = v17;
  v51[2] = @"cloudPrunedAt";
  id v19 = [MEMORY[0x1E4F1CA98] null];
  v52[2] = v19;
  long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
  long long v21 = (void *)[v18 initWithDictionary:v20];

  long long v22 = (__CFString *)v17;
  long long v23 = v6;

  id v24 = (void *)MEMORY[0x1E4F28F60];
  id v25 = [MEMORY[0x1E4F1CA98] null];
  long long v26 = [v24 predicateWithFormat:@"%K == %d AND %K != %d AND (%K != 0 OR %K != %@ OR %K != %@)", @"dataStoreClassID", 0, @"dataStoreSubtype", 0, @"cloudPrefetchCount", @"cloudLastPrefetchDate", v22, @"cloudPrunedAt", v25];

  id v27 = objc_alloc(MEMORY[0x1E4F1C038]);
  __int16 v28 = +[PLInternalResource entityName];
  id v13 = (void *)[v27 initWithEntityName:v28];

  [v13 setResultType:2];
  [v13 setPredicate:v26];
  [v13 setPropertiesToUpdate:v21];
  id v48 = 0;
  int v29 = [v6 executeRequest:v13 error:&v48];
  __int16 v30 = (__CFString *)v48;
  if (!v30)
  {
    if (*MEMORY[0x1E4F59AC0])
    {
      uint64_t v14 = 0;
      goto LABEL_34;
    }
    uint64_t v31 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [v29 result];
      *(_DWORD *)buf = 138412290;
      v56 = v42;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Batch updated %@ cpl attributes", buf, 0xCu);
    }
    uint64_t v14 = 0;
    goto LABEL_33;
  }
  uint64_t v14 = v30;
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v31 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v14;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Failed to batch update cpl attributes: Error: %@", buf, 0xCu);
    }
    goto LABEL_33;
  }
LABEL_34:
}

+ (signed)plTrashedStateForCPLExpungedState:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (unint64_t)cplExpungedStateForTrashedState:(signed __int16)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (id)nonOriginalCPLResourceTypes
{
  if (nonOriginalCPLResourceTypes_onceToken != -1) {
    dispatch_once(&nonOriginalCPLResourceTypes_onceToken, &__block_literal_global_60_63921);
  }
  id v2 = (void *)nonOriginalCPLResourceTypes_resourceTypes;
  return v2;
}

uint64_t __54__PLInternalResource_CPL__nonOriginalCPLResourceTypes__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = (void *)nonOriginalCPLResourceTypes_resourceTypes;
  nonOriginalCPLResourceTypes_resourceTypes = v0;

  id v2 = (void *)MEMORY[0x1E4F59940];
  return [v2 enumerateResourceTypesWithBlock:&__block_literal_global_64_63923];
}

void __54__PLInternalResource_CPL__nonOriginalCPLResourceTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3 = +[PLInternalResource originalCPLResourceTypes];
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a2];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)nonOriginalCPLResourceTypes_resourceTypes;
    id v7 = [NSNumber numberWithUnsignedInteger:a2];
    [v6 addObject:v7];
  }
}

+ (id)originalCPLResourceTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLInternalResource_CPL__originalCPLResourceTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (originalCPLResourceTypes_onceToken != -1) {
    dispatch_once(&originalCPLResourceTypes_onceToken, block);
  }
  id v2 = (void *)originalCPLResourceTypes_resourceTypes;
  return v2;
}

void __51__PLInternalResource_CPL__originalCPLResourceTypes__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [*(id *)(a1 + 32) originalCPLResourceTypesForMaster];
  [v2 addObjectsFromArray:v3];

  BOOL v4 = [*(id *)(a1 + 32) originalCPLResourceTypesForAsset];
  [v2 addObjectsFromArray:v4];

  char v5 = (void *)originalCPLResourceTypes_resourceTypes;
  originalCPLResourceTypes_resourceTypes = (uint64_t)v2;
}

+ (id)originalCPLResourceTypesForAsset
{
  if (originalCPLResourceTypesForAsset_onceToken != -1) {
    dispatch_once(&originalCPLResourceTypesForAsset_onceToken, &__block_literal_global_38_63926);
  }
  id v2 = (void *)originalCPLResourceTypesForAsset_resourceTypes;
  return v2;
}

void __59__PLInternalResource_CPL__originalCPLResourceTypesForAsset__block_invoke()
{
  uint64_t v0 = (void *)originalCPLResourceTypesForAsset_resourceTypes;
  originalCPLResourceTypesForAsset_resourceTypes = (uint64_t)&unk_1EEBF1FD0;
}

+ (id)originalCPLResourceTypesForMaster
{
  if (originalCPLResourceTypesForMaster_onceToken != -1) {
    dispatch_once(&originalCPLResourceTypesForMaster_onceToken, &__block_literal_global_63947);
  }
  id v2 = (void *)originalCPLResourceTypesForMaster_resourceTypes;
  return v2;
}

void __60__PLInternalResource_CPL__originalCPLResourceTypesForMaster__block_invoke()
{
  uint64_t v0 = (void *)originalCPLResourceTypesForMaster_resourceTypes;
  originalCPLResourceTypesForMaster_resourceTypes = (uint64_t)&unk_1EEBF1FB8;
}

+ (BOOL)isCPLJPEGThumbnailResource:(id)a3
{
  return [a3 cplType] == 5;
}

+ (id)insertResourceForMasterObjectID:(id)a3 withExternalCPLResource:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [a1 insertInManagedObjectContext:v8];
  uint64_t v12 = [v8 objectWithID:v10];

  [v11 updateResourceForMasterExternalCPLResource:v9 inManagedObjectContext:v8];
  [v11 setDataStoreClassID:0];
  [v11 setTransientCloudMaster:v12];

  return v11;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLInternalResource *)self isValidForJournalPersistence])
  {
    char v5 = [(PLInternalResource *)self asset];
    if ([v5 isValidForJournalPersistence]) {
      id v6 = [[PLAssetJournalEntryPayload alloc] initWithInternalResource:self filesystemBookmark:0 changedKeys:v4];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)payloadID
{
  id v2 = [(PLInternalResource *)self asset];
  BOOL v3 = [v2 uuid];
  id v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (BOOL)isValidForJournalPersistence
{
  uint64_t v2 = [(PLInternalResource *)self recipeID];
  return +[PLAssetJournalEntryPayloadResource isValidForPersistenceWithRecipeID:v2];
}

+ (id)resourceForManagedAsset:(id)a3 sharedStreamsType:(unsigned int)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = a5;
  uint64_t v11 = [v9 predicateWithFormat:@"%K == %@ AND %K == %d", @"asset", a3, @"dataStoreSubtype", v7];
  uint64_t v12 = [(id)objc_opt_class() fetchRequest];
  [v12 setPredicate:v11];
  id v13 = [v10 executeFetchRequest:v12 error:a6];

  uint64_t v14 = [v13 firstObject];

  return v14;
}

@end