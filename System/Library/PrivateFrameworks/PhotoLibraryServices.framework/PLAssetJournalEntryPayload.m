@interface PLAssetJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)modelProperties;
+ (id)modelPropertiesDescription;
+ (id)nonPersistedModelPropertiesDescription;
+ (id)payloadClassID;
+ (id)persistedPropertyNamesForEntityNames;
+ (id)snapshotSortDescriptors;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5;
- (BOOL)hasAdjustments;
- (BOOL)isDefaultAdjustedSlomo;
- (BOOL)isImage;
- (BOOL)isVideo;
- (BOOL)sleetIsReversible;
- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6;
- (NSArray)resources;
- (NSString)mediaGroupUUID;
- (PLAssetJournalEntryPayload)initWithAdditionalAssetAttributes:(id)a3 changedKeys:(id)a4;
- (PLAssetJournalEntryPayload)initWithAssetDescription:(id)a3 changedKeys:(id)a4;
- (PLAssetJournalEntryPayload)initWithCloudMaster:(id)a3 payloadID:(id)a4 changedKeys:(id)a5;
- (PLAssetJournalEntryPayload)initWithCloudMasterMediaMetadata:(id)a3 payloadID:(id)a4 changedKeys:(id)a5 modelProperties:(id)a6;
- (PLAssetJournalEntryPayload)initWithEditedIPTCAttributes:(id)a3 changedKeys:(id)a4;
- (PLAssetJournalEntryPayload)initWithExtendedAttributes:(id)a3 changedKeys:(id)a4;
- (PLAssetJournalEntryPayload)initWithInternalResource:(id)a3 filesystemBookmark:(id)a4 changedKeys:(id)a5;
- (PLAssetJournalEntryPayload)initWithUnmanagedAdjustment:(id)a3 changedKeys:(id)a4;
- (id)_loadOriginalImageMetadataWithPathManager:(id)a3 timezoneLookup:(id)a4;
- (id)_loadOriginalVideoMetadataWithPathManager:(id)a3 timezoneLookup:(id)a4;
- (id)adjustmentFormatIdentifier;
- (id)adjustmentFormatVersion;
- (id)cloudMasterGUID;
- (id)dateCreated;
- (id)directory;
- (id)extendedAttributesLatitude;
- (id)extendedAttributesLongitude;
- (id)filename;
- (id)hdrGain;
- (id)highFrameRateState;
- (id)insertAssetFromDataInManagedObjectContext:(id)a3 keywordUUIDRemapping:(id)a4 rawPayloadAttributesToUpdate:(id)a5;
- (id)latitude;
- (id)locationData;
- (id)longitude;
- (id)originalOrientation;
- (id)originalResourceRelativePathsWithPathManager:(id)a3;
- (id)originalUniformTypeIdentifier;
- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4;
- (id)uniformTypeIdentifier;
- (int64_t)dateCreatedSource;
- (signed)kind;
- (signed)kindSubtype;
- (signed)savedAssetType;
- (unint64_t)bestCPLResourceTypeForAdjustedFingerPrint;
- (unsigned)bundleScope;
- (unsigned)playbackStyle;
- (unsigned)playbackVariation;
- (void)_convertCustomRenderedValueToHDRType;
- (void)_convertDepthStatesToDepthType;
- (void)_convertHasAdjustmentsToAdjustmentsState;
- (void)_filterNonPersistedResources;
- (void)_fixAdjustedAssetUTI;
- (void)_fixDateCreatedSourceWithAdditionalAssetAttributes:(id)a3;
- (void)_fixHDRGainZeroValueToNULL;
- (void)_fixLocationData;
- (void)_fixResourceTypeUnknownValues;
- (void)_fixSleetIsReversibleWithAdditionalAssetAttributes:(id)a3;
- (void)_fixXMPSidecarUTI;
- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5;
- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6;
- (void)mergePayload:(id)a3;
- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3;
- (void)setDateCreatedSource:(int64_t)a3;
- (void)setKind:(signed __int16)a3;
- (void)setLocation:(id)a3;
- (void)setPlaybackStyle:(unsigned __int16)a3;
- (void)setSleetIsReversible:(unsigned __int16)a3;
@end

@implementation PLAssetJournalEntryPayload

- (void).cxx_destruct
{
}

- (id)_loadOriginalImageMetadataWithPathManager:(id)a3 timezoneLookup:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"mediaMetadata"];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F8CC48]);
    v10 = (void *)MEMORY[0x1E4F8CDF8];
    v11 = [(PLAssetJournalEntryPayload *)self originalUniformTypeIdentifier];
    v12 = [v10 typeWithIdentifier:v11];
    v13 = (void *)[v9 initWithImageSourceProxyOrEncodedImagePropertyData:v8 contentType:v12 timeZoneLookup:v7];

    goto LABEL_3;
  }
  [MEMORY[0x1E4F8BA10] maskForReferencedAsset];
  [(PLAssetJournalEntryPayload *)self savedAssetType];
  if (PLValidatedSavedAssetTypeApplies())
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    v36[0] = @"skipping reference asset";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v11 = [v14 errorWithDomain:v15 code:46502 userInfo:v16];
  }
  else
  {
    uint64_t v17 = [(PLAssetJournalEntryPayload *)self directory];
    if (!v17)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v18 = (void *)v17;
    v19 = (void *)MEMORY[0x1E4F1CB10];
    v20 = [(PLAssetJournalEntryPayload *)self directory];
    v21 = [(PLAssetJournalEntryPayload *)self filename];
    v22 = objc_msgSend(v6, "assetMainFilePathWithDirectory:filename:bundleScope:", v20, v21, -[PLAssetJournalEntryPayload bundleScope](self, "bundleScope"));
    v11 = [v19 fileURLWithPath:v22 isDirectory:0];

    if (v11)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithImageURL:v11 contentType:0 options:12 timeZoneLookup:v7 cacheImageSource:0 cacheImageData:0];
LABEL_3:

      if (v13) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  v23 = PLMigrationGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
    v25 = [v11 userInfo];
    int v27 = 136446978;
    v28 = "-[PLAssetJournalEntryPayload _loadOriginalImageMetadataWithPathManager:timezoneLookup:]";
    __int16 v29 = 2114;
    v30 = v24;
    __int16 v31 = 2112;
    v32 = v11;
    __int16 v33 = 2112;
    v34 = v25;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "%{public}s: failed to load metadata for asset with uuid %{public}@, not fatal, will proceed with migration, error: %@ %@", (uint8_t *)&v27, 0x2Au);
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)_loadOriginalVideoMetadataWithPathManager:(id)a3 timezoneLookup:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"mediaMetadata"];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVProxyData:v8 timeZoneLookup:v7];
    if (v9) {
      goto LABEL_14;
    }
  }
  else
  {
    [MEMORY[0x1E4F8BA10] maskForReferencedAsset];
    [(PLAssetJournalEntryPayload *)self savedAssetType];
    if (PLValidatedSavedAssetTypeApplies())
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F8C500];
      uint64_t v30 = *MEMORY[0x1E4F28228];
      v31[0] = @"skipping reference asset";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      id v9 = [v10 errorWithDomain:v11 code:46502 userInfo:v12];
    }
    else
    {
      id v9 = [(PLAssetJournalEntryPayload *)self directory];
      if (v9)
      {
        v13 = (void *)MEMORY[0x1E4F1CB10];
        v14 = [(PLAssetJournalEntryPayload *)self directory];
        uint64_t v15 = [(PLAssetJournalEntryPayload *)self filename];
        v16 = objc_msgSend(v6, "assetMainFilePathWithDirectory:filename:bundleScope:", v14, v15, -[PLAssetJournalEntryPayload bundleScope](self, "bundleScope"));
        uint64_t v17 = [v13 fileURLWithPath:v16 isDirectory:0];

        if (v17)
        {
          id v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVURL:v17 timeZoneLookup:v7];

          if (v9) {
            goto LABEL_14;
          }
        }
        else
        {
          id v9 = 0;
        }
      }
    }
  }
  v18 = PLMigrationGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
    v20 = [v9 userInfo];
    int v22 = 136446978;
    v23 = "-[PLAssetJournalEntryPayload _loadOriginalVideoMetadataWithPathManager:timezoneLookup:]";
    __int16 v24 = 2114;
    v25 = v19;
    __int16 v26 = 2112;
    int v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = v20;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "%{public}s: failed to load metadata for asset with uuid %{public}@, not fatal, will proceed with migration, error: %@ %@", (uint8_t *)&v22, 0x2Au);
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PLManagedObjectJournalEntryPayload *)self payloadVersion];
  unsigned int v6 = [(PLManagedObjectJournalEntryPayload *)self payloadVersion];
  unsigned int v7 = [(PLManagedObjectJournalEntryPayload *)self payloadVersion];
  unsigned int v8 = [(PLManagedObjectJournalEntryPayload *)self payloadVersion];
  BOOL v9 = [(PLManagedObjectJournalEntryPayload *)self payloadVersionIsLessThanVersion:21 forKey:@"hdrGain" inUpdatePayloads:v4];
  BOOL v10 = [(PLManagedObjectJournalEntryPayload *)self payloadVersionIsLessThanVersion:25 forKey:@"depthStates" inUpdatePayloads:v4];
  BOOL v11 = [(PLManagedObjectJournalEntryPayload *)self payloadVersionIsLessThanVersion:101 forKey:@"customRenderedValue" inUpdatePayloads:v4];
  unsigned int v12 = [(PLManagedObjectJournalEntryPayload *)self payloadVersion];
  if ([(PLManagedObjectJournalEntryPayload *)self payloadVersionIsLessThanVersion:300 forKey:@"adjustmentsState" inUpdatePayloads:v4])
  {
    [(PLAssetJournalEntryPayload *)self _convertHasAdjustmentsToAdjustmentsState];
  }
  if (v5 <= 1) {
    [(PLAssetJournalEntryPayload *)self _fixAdjustedAssetUTI];
  }
  if (v6 <= 2) {
    [(PLAssetJournalEntryPayload *)self _fixLocationData];
  }
  if (v7 <= 3) {
    [(PLAssetJournalEntryPayload *)self _fixXMPSidecarUTI];
  }
  if (v8 <= 5)
  {
    [(PLAssetJournalEntryPayload *)self _fixResourceTypeUnknownValues];
    if (!v9)
    {
LABEL_11:
      if (!v10) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if (!v9)
  {
    goto LABEL_11;
  }
  [(PLAssetJournalEntryPayload *)self _fixHDRGainZeroValueToNULL];
  if (!v10)
  {
LABEL_12:
    if (!v11) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  [(PLAssetJournalEntryPayload *)self _convertDepthStatesToDepthType];
  if (v11) {
LABEL_13:
  }
    [(PLAssetJournalEntryPayload *)self _convertCustomRenderedValueToHDRType];
LABEL_14:
  if (v12 <= 0x66) {
    [(PLAssetJournalEntryPayload *)self _filterNonPersistedResources];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLAssetJournalEntryPayload;
  [(PLManagedObjectJournalEntryPayload *)&v13 migrateMergedPayloadWithUpdatePayloads:v4];
}

- (void)setSleetIsReversible:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v4 forKeyedSubscript:@"sleetIsReversible"];
}

- (BOOL)sleetIsReversible
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"sleetIsReversible"];
  char v3 = [v2 isEqual:&unk_1EEBEFB28];

  return v3;
}

- (void)setDateCreatedSource:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v4 forKeyedSubscript:@"dateCreatedSource"];
}

- (int64_t)dateCreatedSource
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"dateCreatedSource"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)originalUniformTypeIdentifier
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"originalUTI"];
  if (!v3)
  {
    if ([(PLAssetJournalEntryPayload *)self hasAdjustments]
      || ([(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"uti"], (int64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      [(PLAssetJournalEntryPayload *)self resources];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
LABEL_9:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
          if (objc_msgSend(v10, "isOriginalResource", (void)v16))
          {
            if ([v10 isPrimaryResource]) {
              break;
            }
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v7) {
              goto LABEL_9;
            }
            goto LABEL_16;
          }
        }
        int64_t v3 = [v10 uniformTypeIdentifierString];

        if (v3) {
          goto LABEL_2;
        }
      }
      else
      {
LABEL_16:
      }
      BOOL v11 = [(PLAssetJournalEntryPayload *)self filename];
      int64_t v3 = [v11 pathExtension];

      if (v3)
      {
        unsigned int v12 = (void *)MEMORY[0x1E4F442D8];
        objc_super v13 = [(PLAssetJournalEntryPayload *)self filename];
        v14 = [v13 pathExtension];
        uint64_t v15 = [v12 typeWithFilenameExtension:v14];

        if ([v15 isDynamic])
        {
          int64_t v3 = 0;
        }
        else
        {
          int64_t v3 = [v15 identifier];
        }
      }
    }
  }
LABEL_2:
  return v3;
}

- (void)setLocation:(id)a3
{
  id v14 = a3;
  id v4 = +[PLManagedAsset newLocationDataFromLocation:](PLManagedAsset, "newLocationDataFromLocation:");
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v4 forKeyedSubscript:@"locationData"];
  id v5 = NSNumber;
  if (v4)
  {
    [v14 coordinate];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
    [(NSMutableDictionary *)self->super._payloadAttributes setObject:v6 forKeyedSubscript:@"latitude"];

    uint64_t v7 = NSNumber;
    [v14 coordinate];
    double v9 = v8;
    BOOL v10 = v7;
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F1E750];
    unsigned int v12 = [NSNumber numberWithDouble:*MEMORY[0x1E4F1E750]];
    [(NSMutableDictionary *)self->super._payloadAttributes setObject:v12 forKeyedSubscript:@"latitude"];

    BOOL v10 = NSNumber;
    double v9 = *(double *)(v11 + 8);
  }
  objc_super v13 = [v10 numberWithDouble:v9];
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v13 forKeyedSubscript:@"longitude"];
}

- (unint64_t)bestCPLResourceTypeForAdjustedFingerPrint
{
  if ([(PLAssetJournalEntryPayload *)self isImage]) {
    return 2;
  }
  if (![(PLAssetJournalEntryPayload *)self isVideo]) {
    return 0;
  }
  if ([(PLAssetJournalEntryPayload *)self isDefaultAdjustedSlomo]) {
    return 0;
  }
  return 16;
}

- (id)filename
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"filename"];
}

- (id)directory
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"directory"];
}

- (id)adjustmentFormatVersion
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"adjustmentFormatVersion"];
}

- (id)adjustmentFormatIdentifier
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"adjustmentFormatIdentifier"];
}

- (id)originalOrientation
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"originalOrientation"];
}

- (id)extendedAttributesLongitude
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"exLongitude"];
}

- (id)extendedAttributesLatitude
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"exLatitude"];
}

- (id)longitude
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"longitude"];
}

- (id)latitude
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"latitude"];
}

- (id)locationData
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"locationData"];
}

- (id)dateCreated
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"dateCreated"];
}

- (id)uniformTypeIdentifier
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"uti"];
}

- (id)hdrGain
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"hdrGain"];
  int64_t v3 = v2;
  if (v2)
  {
    id v4 = NSNumber;
    [v2 floatValue];
    id v5 = objc_msgSend(v4, "numberWithFloat:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasAdjustments
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"adjustmentsState"];
  BOOL v3 = [v2 unsignedShortValue] != 0;

  return v3;
}

- (BOOL)isDefaultAdjustedSlomo
{
  BOOL v3 = [(PLAssetJournalEntryPayload *)self adjustmentFormatIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.video.slomo"];

  id v5 = [(PLAssetJournalEntryPayload *)self adjustmentFormatVersion];
  uint64_t v6 = v5;
  if (v4)
  {
    if ([v5 isEqualToString:@"1.1"]) {
      LOBYTE(v4) = 1;
    }
    else {
      LOBYTE(v4) = [v6 isEqualToString:@"1.0"];
    }
  }
  BOOL v7 = [(PLAssetJournalEntryPayload *)self isVideo] & v4;

  return v7;
}

- (id)highFrameRateState
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"highFrameRateState"];
}

- (unsigned)playbackVariation
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"playbackVariation"];
  unsigned __int16 v3 = [v2 integerValue];

  return v3;
}

- (void)setPlaybackStyle:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v4 forKeyedSubscript:@"playbackStyle"];
}

- (unsigned)playbackStyle
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"playbackStyle"];
  unsigned __int16 v3 = [v2 integerValue];

  return v3;
}

- (BOOL)isImage
{
  return [(PLAssetJournalEntryPayload *)self kind] == 0;
}

- (BOOL)isVideo
{
  return [(PLAssetJournalEntryPayload *)self kind] == 1;
}

- (signed)kindSubtype
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"kindSubtype"];
  signed __int16 v3 = [v2 integerValue];

  return v3;
}

- (void)setKind:(signed __int16)a3
{
  id v4 = [NSNumber numberWithShort:a3];
  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v4 forKeyedSubscript:@"kind"];
}

- (signed)kind
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"kind"];
  signed __int16 v3 = [v2 integerValue];

  return v3;
}

- (id)originalResourceRelativePathsWithPathManager:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"directory"];
  uint64_t v6 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"filename"];
  BOOL v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || ([MEMORY[0x1E4F8BA10] maskForReferencedAsset],
        [(PLAssetJournalEntryPayload *)self savedAssetType],
        (PLValidatedSavedAssetTypeApplies() & 1) != 0))
  {
    id v29 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25 = v7;
    __int16 v26 = v5;
    __int16 v28 = [v5 stringByAppendingPathComponent:v7];
    id v29 = v9;
    objc_msgSend(v9, "addObject:");
    id v27 = v4;
    char v10 = [v4 isUBF];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v11 = [(PLAssetJournalEntryPayload *)self resources];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v16 isOriginalResource])
          {
            unsigned int v17 = [v16 resourceType];
            if (v17 <= 0xB && ((1 << v17) & 0xC3C) != 0)
            {
              long long v19 = [v16 uniformTypeIdentifierString];
              v20 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v19];
              if (v10) {
                [MEMORY[0x1E4F8CDF8] preferredOrFallbackFilenameExtensionForType:v20];
              }
              else {
              uint64_t v21 = +[PLManagedAsset preferredFileExtensionForType:v19];
              }
              if (v21)
              {
                int v22 = [v28 stringByDeletingPathExtension];
                v23 = [v22 stringByAppendingPathExtension:v21];

                [v29 addObject:v23];
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    id v5 = v26;
    id v4 = v27;
    BOOL v7 = v25;
  }

  return v29;
}

- (id)cloudMasterGUID
{
  return (id)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"cloudAssetGUID"];
}

- (NSString)mediaGroupUUID
{
  return (NSString *)[(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"mediaGroupUUID"];
}

- (unsigned)bundleScope
{
  signed __int16 v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"bundleScope"];
  if (v3)
  {
    id v4 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"bundleScope"];
    unsigned __int16 v5 = [v4 integerValue];
  }
  else
  {
    unsigned __int16 v5 = 0;
  }

  return v5;
}

- (signed)savedAssetType
{
  v2 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"savedAssetType"];
  signed __int16 v3 = [v2 integerValue];

  return v3;
}

- (NSArray)resources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"resources", 0];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [[PLAssetJournalEntryPayloadResource alloc] initWithPayloadAttributes:*(void *)(*((void *)&v11 + 1) + 8 * i) payload:self];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  uint64_t v202 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v164 = self;
  if (![v10 requiresConversion])
  {
    if ([v10 isEqualToKey:@"savedAssetType"])
    {
      [MEMORY[0x1E4F8BA10] maskForIsValidForBackup];
      [(PLAssetJournalEntryPayload *)self savedAssetType];
      if (PLValidatedSavedAssetTypeApplies())
      {
        v174.receiver = self;
        v174.super_class = (Class)PLAssetJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v174 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      }
      goto LABEL_39;
    }
    if ([v10 isEqualToKey:@"locationData"])
    {
      id v21 = [(PLAssetJournalEntryPayload *)self locationData];
      if (v21)
      {
        int v22 = [(PLAssetJournalEntryPayload *)self dateCreated];
        id v23 = +[PLManagedAsset newLocationFromLocationData:v21 timestampIfMissing:v22];

        [v23 coordinate];
        if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
        {
          id v24 = v11;
          v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "pl_locationHash"));
          __int16 v26 = [v24 additionalAttributes];
          [v26 setLocationHash:v25];

          [v23 horizontalAccuracy];
          if (v27 != 0.0)
          {
            [v23 horizontalAccuracy];
            double v29 = v28;
            long long v30 = [v24 additionalAttributes];
            [v30 setGpsHorizontalAccuracy:v29];
          }
          self = v164;
        }
      }
      v173.receiver = self;
      v173.super_class = (Class)PLAssetJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v173 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      goto LABEL_31;
    }
    if (([v10 isEqualToKey:@"embeddedThumbnailWidth"] & 1) != 0
      || ([v10 isEqualToKey:@"embeddedThumbnailHeight"] & 1) != 0
      || ([v10 isEqualToKey:@"embeddedThumbnailOffset"] & 1) != 0
      || [v10 isEqualToKey:@"embeddedThumbnailLength"])
    {
      payloadAttributes = self->super._payloadAttributes;
      id v21 = [v10 key];
      long long v32 = [(NSMutableDictionary *)payloadAttributes objectForKeyedSubscript:v21];
      [v11 setValue:v32 forKey:v12];

      goto LABEL_31;
    }
    if ([v10 isEqualToKey:@"originalHash"])
    {
      id v21 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"originalHash"];
      if (v21)
      {
        id v78 = v11;
        v79 = [v78 originalStableHash];

        if (!v79)
        {
          v80 = [v21 base64EncodedStringWithOptions:0];
          [v78 setOriginalStableHash:v80];
        }
      }
      v172.receiver = self;
      v172.super_class = (Class)PLAssetJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v172 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      goto LABEL_31;
    }
    if (![v10 isEqualToKey:@"highFrameRateState"])
    {
      if ([v10 isEqualToKey:@"dateCreatedSource"])
      {
        v92 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"dateCreatedSource"];

        if (!v92)
        {
          [(PLAssetJournalEntryPayload *)self _fixDateCreatedSourceWithAdditionalAssetAttributes:v11];
          v93 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLAssetJournalEntryPayload dateCreatedSource](self, "dateCreatedSource"));
          [v13 setObject:v93 forKeyedSubscript:@"dateCreatedSource"];
        }
        v170.receiver = self;
        v170.super_class = (Class)PLAssetJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v170 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      }
      else if ([v10 isEqualToKey:@"playbackStyle"])
      {
        if (![(PLAssetJournalEntryPayload *)self playbackStyle])
        {
          if ([(PLAssetJournalEntryPayload *)self kind] == 3)
          {
            v114 = [(PLAssetJournalEntryPayload *)self originalUniformTypeIdentifier];
            uint64_t v115 = +[PLManagedAsset assetTypeFromUniformTypeIdentifier:v114];
          }
          else
          {
            uint64_t v115 = [(PLAssetJournalEntryPayload *)self kind];
          }
          if (v115 != 3)
          {
            [(PLAssetJournalEntryPayload *)self setPlaybackStyle:+[PLManagedAsset defaultPlaybackStyleFromAssetType:v115 subtype:[(PLAssetJournalEntryPayload *)self kindSubtype] playbackVariation:[(PLAssetJournalEntryPayload *)self playbackVariation]]];
            if ([(PLAssetJournalEntryPayload *)self playbackStyle])
            {
              v150 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[PLAssetJournalEntryPayload playbackStyle](self, "playbackStyle"));
              [v13 setObject:v150 forKeyedSubscript:@"playbackStyle"];
            }
          }
        }
        v169.receiver = self;
        v169.super_class = (Class)PLAssetJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v169 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      }
      else if ([v10 isEqualToKey:@"kind"])
      {
        if ([(PLAssetJournalEntryPayload *)self kind] == 3)
        {
          v130 = [(PLAssetJournalEntryPayload *)self originalUniformTypeIdentifier];
          [(PLAssetJournalEntryPayload *)self setKind:+[PLManagedAsset assetTypeFromUniformTypeIdentifier:v130]];

          if ([(PLAssetJournalEntryPayload *)self kind] != 3)
          {
            v131 = objc_msgSend(NSNumber, "numberWithShort:", -[PLAssetJournalEntryPayload kind](self, "kind"));
            [v13 setObject:v131 forKeyedSubscript:@"kind"];
          }
        }
        v168.receiver = self;
        v168.super_class = (Class)PLAssetJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v168 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      }
      else if ([v10 isEqualToKey:@"sleetIsReversible"])
      {
        v141 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"sleetIsReversible"];

        if (!v141)
        {
          [(PLAssetJournalEntryPayload *)self _fixSleetIsReversibleWithAdditionalAssetAttributes:v11];
          v142 = objc_msgSend(NSNumber, "numberWithBool:", -[PLAssetJournalEntryPayload sleetIsReversible](self, "sleetIsReversible"));
          [v13 setObject:v142 forKeyedSubscript:@"sleetIsReversible"];
        }
        v167.receiver = self;
        v167.super_class = (Class)PLAssetJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v167 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      }
      else
      {
        v166.receiver = self;
        v166.super_class = (Class)PLAssetJournalEntryPayload;
        [(PLManagedObjectJournalEntryPayload *)&v166 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      }
      goto LABEL_39;
    }
    v84 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"highFrameRateState"];

    if (v84)
    {
      v171.receiver = self;
      v171.super_class = (Class)PLAssetJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v171 applyPayloadProperty:v10 toManagedObject:v11 key:v12 payloadAttributesToUpdate:v13];
      goto LABEL_39;
    }
    v116 = self;
    v38 = v13;
    BOOL v117 = [(PLAssetJournalEntryPayload *)v116 isVideo];
    id v39 = v11;
    if (!v117) {
      goto LABEL_129;
    }
    objc_opt_class();
    v118 = [v39 managedObjectContext];
    if (objc_opt_isKindOfClass()) {
      v119 = v118;
    }
    else {
      v119 = 0;
    }
    id v120 = v119;

    v121 = objc_msgSend(v120, "pl_libraryBundle");

    v122 = [v121 timeZoneLookup];

    if ([(PLAssetJournalEntryPayload *)v116 kindSubtype] == 101)
    {
      v123 = (void *)MEMORY[0x1E4F8CE18];
      v124 = [(PLAssetJournalEntryPayload *)v116 adjustmentFormatIdentifier];
      v125 = [(PLAssetJournalEntryPayload *)v116 adjustmentFormatVersion];
      LOBYTE(v123) = [v123 isRecognizedSlowMotionFormatWithIdentifier:v124 version:v125];

      if (v123)
      {
        unsigned __int16 v126 = 3;
LABEL_157:

        id v152 = v39;
        if (v126)
        {
          v153 = v152;
          [v152 setHighFrameRateState:v126];
          v154 = [NSNumber numberWithUnsignedShort:v126];
          [v38 setObject:v154 forKeyedSubscript:@"highFrameRateState"];

          if ([(PLAssetJournalEntryPayload *)v164 kindSubtype] != 101)
          {
            [(NSMutableDictionary *)v164->super._payloadAttributes setObject:&unk_1EEBEFB10 forKeyedSubscript:@"kindSubtype"];
            [v153 setKindSubtype:101];
            [v38 setObject:&unk_1EEBEFB10 forKeyedSubscript:@"kindSubtype"];
          }
        }
        goto LABEL_129;
      }
      v151 = [v39 pathManager];
      v144 = [(PLAssetJournalEntryPayload *)v164 _loadOriginalVideoMetadataWithPathManager:v151 timezoneLookup:v122];

      if ([v144 isSloMo]) {
        unsigned __int16 v126 = 3;
      }
      else {
        unsigned __int16 v126 = 2;
      }
    }
    else
    {
      if (![(PLAssetJournalEntryPayload *)v116 hasAdjustments])
      {
        unsigned __int16 v126 = 0;
        goto LABEL_157;
      }
      v143 = [v39 pathManager];
      v144 = [(PLAssetJournalEntryPayload *)v164 _loadOriginalVideoMetadataWithPathManager:v143 timezoneLookup:v122];

      unsigned __int16 v126 = [v144 isSloMo];
    }

    goto LABEL_157;
  }
  if (![v10 isEqualToKey:@"inTrash"])
  {
    if ([v10 isEqualToKey:@"assetDescription"])
    {
      v20 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"description"];
      id v16 = v20;
      if (v20 && [v20 length]) {
        [v11 setLongDescription:v16];
      }
      goto LABEL_38;
    }
    if ([v10 isEqualToKey:@"assetMediaMetadataRelationship"])
    {
      id v16 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"assetMediaMetadata"];
      if (v16) {
        [v11 setMediaMetadataData:v16];
      }
      goto LABEL_38;
    }
    if ([v10 isEqualToKey:@"unmanagedAdjustment"])
    {
      if (![(PLAssetJournalEntryPayload *)self hasAdjustments]) {
        goto LABEL_39;
      }
      long long v33 = [v11 managedObjectContext];
      v34 = +[PLManagedObject insertInManagedObjectContext:v33];

      uint64_t v35 = [v10 subRelationshipProperties];
      v189[0] = MEMORY[0x1E4F143A8];
      v189[1] = 3221225472;
      v189[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke;
      v189[3] = &unk_1E5870328;
      v190 = v34;
      id v191 = v13;
      v192 = self;
      id v16 = v34;
      [v35 enumerateKeysAndObjectsUsingBlock:v189];

      [v11 setUnmanagedAdjustment:v16];
      v36 = v190;
LABEL_77:

      goto LABEL_38;
    }
    if ([v10 isEqualToKey:@"master"])
    {
      v37 = self;
      v38 = v13;
      id v39 = [(NSMutableDictionary *)v37->super._payloadAttributes objectForKeyedSubscript:@"cloudMasterGUID"];
      if (v39)
      {
        id v160 = v12;
        id v40 = v11;
        v41 = [v40 managedObjectContext];
        v42 = +[PLCloudMaster cloudMasterWithGUID:v39 inMomentShare:0 prefetchResources:0 inManagedObjectContext:v41];

        if (v42) {
          goto LABEL_128;
        }
        v43 = [v40 managedObjectContext];
        v42 = +[PLManagedObject insertInManagedObjectContext:v43];

        [v42 setCloudMasterGUID:v39];
        v44 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"importedBy"];
        objc_msgSend(v42, "setImportedBy:", (__int16)objc_msgSend(v44, "intValue"));

        v45 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"creatorBundleID"];
        [v42 setImportedByBundleIdentifier:v45];

        v46 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"importedByDisplayName"];
        [v42 setImportedByDisplayName:v46];

        v47 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"originalFilename"];
        [v42 setOriginalFilename:v47];

        v48 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"originalOrientation"];
        objc_msgSend(v42, "setOriginalOrientation:", (__int16)objc_msgSend(v48, "intValue"));

        v49 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"originatingAssetIdentifier"];
        [v42 setOriginatingAssetIdentifier:v49];

        v50 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"creationDate"];
        [v42 setCreationDate:v50];

        v51 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"importDate"];
        [v42 setImportDate:v51];

        v52 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"originalUTI"];
        [v42 setUniformTypeIdentifier:v52];

        v53 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"mediaMetadataType"];
        [v42 setMediaMetadataType:v53];

        v54 = [v42 mediaMetadata];
        v55 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"mediaMetadata"];
        [v54 setValue:v55 forKey:@"data"];

        v56 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"fullSizeJPEGSource"];

        v57 = v164->super._payloadAttributes;
        if (v56)
        {
          v58 = [(NSMutableDictionary *)v57 objectForKeyedSubscript:@"fullSizeJPEGSource"];
          __int16 v59 = [v58 intValue];
        }
        else
        {
          v102 = [(NSMutableDictionary *)v57 objectForKeyedSubscript:@"originalWidth"];
          double v103 = (double)[v102 integerValue];
          v104 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"originalHeight"];
          double v105 = (double)[v104 integerValue];

          v58 = [v42 uniformTypeIdentifier];
          __int16 v59 = +[PLCloudMaster fullSizeJPEGSourceForUTI:andImageDimensions:](PLCloudMaster, "fullSizeJPEGSourceForUTI:andImageDimensions:", v58, v103, v105);
        }
        [v42 setFullSizeJPEGSource:v59];

        v106 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"importSessionID"];
        [v42 setImportSessionID:v106];

        if (![(PLAssetJournalEntryPayload *)v164 isVideo]) {
          goto LABEL_128;
        }
        v107 = [(NSMutableDictionary *)v164->super._payloadAttributes objectForKeyedSubscript:@"mediaMetadata"];
        if (!v107)
        {
          v128 = PLMigrationGetLog();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            v129 = [v40 uuid];
            *(_DWORD *)buf = 138543362;
            uint64_t v194 = (uint64_t)v129;
            _os_log_impl(&dword_19B3C7000, v128, OS_LOG_TYPE_DEFAULT, "Rebuild: unable to find mediaMetadata in master for %{public}@", buf, 0xCu);
          }
          goto LABEL_127;
        }
        id v188 = 0;
        v108 = [MEMORY[0x1E4F28F98] propertyListWithData:v107 options:0 format:0 error:&v188];
        v165 = v188;
        if (v108)
        {
          v109 = [MEMORY[0x1E4F16330] assetProxyWithPropertyList:v108];
          v110 = [v109 plVideoCodecName];
          [v42 setCodecName:v110];

          v111 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v109];
          if ([v111 count])
          {
            [v111 objectAtIndex:0];
            v112 = id v158 = v11;
            [v112 nominalFrameRate];
            [v42 setVideoFrameRate:(int)v113];

            id v11 = v158;
          }
        }
        else
        {
          v109 = PLMigrationGetLog();
          if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
LABEL_126:

            v128 = v165;
LABEL_127:

LABEL_128:
            [v40 setMaster:v42];
            v132 = [v40 additionalAttributes];
            [v132 setOriginalStableHash:v39];

            id v12 = v160;
            goto LABEL_129;
          }
          v111 = [v40 uuid];
          *(_DWORD *)buf = 138543618;
          uint64_t v194 = (uint64_t)v111;
          __int16 v195 = 2114;
          v196 = v165;
          _os_log_impl(&dword_19B3C7000, v109, OS_LOG_TYPE_DEFAULT, "Rebuild: unable to serialize videoProperties for %{public}@: %{public}@", buf, 0x16u);
        }

        goto LABEL_126;
      }
LABEL_129:

      id v13 = v38;
      goto LABEL_39;
    }
    if ([v10 isEqualToKey:@"keywords"])
    {
      id v159 = v13;
      id v60 = v11;
      v61 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"keywords"];
      v62 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v61];

      if ([v62 count])
      {
        id v161 = v12;
        id v156 = v10;
        id v157 = v11;
        id v163 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v184 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        v155 = v62;
        id obj = v62;
        uint64_t v63 = [obj countByEnumeratingWithState:&v184 objects:v201 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v185;
          do
          {
            for (uint64_t i = 0; i != v64; ++i)
            {
              if (*(void *)v185 != v65) {
                objc_enumerationMutation(obj);
              }
              v67 = *(NSObject **)(*((void *)&v184 + 1) + 8 * i);
              uint64_t v68 = [(NSDictionary *)self->_keywordUUIDRemapping objectForKeyedSubscript:v67];
              v69 = (void *)v68;
              if (v68) {
                uint64_t v70 = v68;
              }
              else {
                uint64_t v70 = (uint64_t)v67;
              }
              v71 = [v60 managedObjectContext];
              v72 = +[PLManagedKeyword keywordForUuid:v70 context:v71];

              if (v72)
              {
                if (v69)
                {
                  v73 = PLMigrationGetLog();
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                  {
                    v74 = [v72 title];
                    v75 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
                    *(_DWORD *)buf = 138413058;
                    uint64_t v194 = (uint64_t)v74;
                    __int16 v195 = 2112;
                    v196 = v67;
                    __int16 v197 = 2112;
                    v198 = v69;
                    __int16 v199 = 2112;
                    v200 = v75;
                    _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_DEFAULT, "Rebuild: using re-mapped uuid for keyword %@, %@ -> %@, for asset: %@", buf, 0x2Au);

                    self = v164;
                  }
                }
                [v163 addObject:v72];
              }
              else
              {
                v76 = PLMigrationGetLog();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                {
                  v77 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v194 = v70;
                  __int16 v195 = 2112;
                  v196 = v77;
                  _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_ERROR, "Rebuild: could not find keyword for uuid: %@ for asset: %@", buf, 0x16u);

                  self = v164;
                }
              }
            }
            uint64_t v64 = [obj countByEnumeratingWithState:&v184 objects:v201 count:16];
          }
          while (v64);
        }

        [v60 setKeywords:v163];
        id v10 = v156;
        id v11 = v157;
        id v12 = v161;
        v62 = v155;
      }

LABEL_68:
      id v13 = v159;
      goto LABEL_39;
    }
    if ([v10 isEqualToKey:@"extendedAttributes"])
    {
      v81 = [v11 managedObjectContext];
      v82 = +[PLManagedObject insertInManagedObjectContext:v81];

      v83 = [v10 subRelationshipProperties];
      v180[0] = MEMORY[0x1E4F143A8];
      v180[1] = 3221225472;
      v180[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_1542;
      v180[3] = &unk_1E5870328;
      v181 = v82;
      id v182 = v13;
      v183 = self;
      id v16 = v82;
      [v83 enumerateKeysAndObjectsUsingBlock:v180];

      [v11 setExtendedAttributes:v16];
      v36 = v181;
      goto LABEL_77;
    }
    if ([v10 isEqualToKey:@"editedIPTCAttributes"])
    {
      v85 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"iptcData"];

      if (!v85) {
        goto LABEL_39;
      }
      v86 = [v11 managedObjectContext];
      v87 = +[PLManagedObject insertInManagedObjectContext:v86];

      v88 = [v10 subRelationshipProperties];
      v176[0] = MEMORY[0x1E4F143A8];
      v176[1] = 3221225472;
      v176[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_2;
      v176[3] = &unk_1E5870328;
      id v21 = v87;
      id v177 = v21;
      id v178 = v13;
      v179 = self;
      [v88 enumerateKeysAndObjectsUsingBlock:v176];

      id v89 = v11;
      v90 = [v21 data];

      if (v90)
      {
        v91 = [v21 data];
        [v21 setIPTCData:v91];
      }
      [v89 setEditedIPTCAttributes:v21];
    }
    else
    {
      if ([v10 isEqualToKey:@"resources"]
        && [(PLAssetJournalEntryPayload *)self hasAdjustments])
      {
        id v159 = v13;
        unint64_t v94 = [(PLAssetJournalEntryPayload *)self bestCPLResourceTypeForAdjustedFingerPrint];
        v95 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"resources"];
        v175[0] = MEMORY[0x1E4F143A8];
        v175[1] = 3221225472;
        v175[2] = __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_3;
        v175[3] = &__block_descriptor_40_e29_B32__0__NSDictionary_8Q16_B24l;
        v175[4] = v94;
        v96 = [v95 indexesOfObjectsPassingTest:v175];
        id v97 = v11;
        uint64_t v98 = [v96 count];
        if (v98 == 1)
        {
          objc_msgSend(v95, "objectAtIndexedSubscript:", objc_msgSend(v96, "firstIndex"));
          self = (PLAssetJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
          v99 = [(PLAssetJournalEntryPayload *)self objectForKeyedSubscript:@"fingerprint"];
        }
        else
        {
          v99 = 0;
        }
        v140 = [v97 additionalAttributes];
        [v140 setAdjustedStableHash:v99];

        if (v98 == 1)
        {
        }
        goto LABEL_68;
      }
      if ([v10 isEqualToKey:@"bundleScope"])
      {
        id v16 = v11;
        v100 = self->super._payloadAttributes;
        v101 = [v10 key];
        id v18 = [(NSMutableDictionary *)v100 objectForKeyedSubscript:v101];

        if (v18) {
          objc_msgSend(v16, "setBundleScope:", (unsigned __int16)objc_msgSend(v18, "integerValue"));
        }
        goto LABEL_37;
      }
      if ([v10 isEqualToKey:@"libraryScopeAssetContributorsToUpdate"])
      {
        v127 = self->super._payloadAttributes;
        id v18 = v11;
        id v16 = [(PLAssetJournalEntryPayload *)self payloadValueFromAttributes:v127 forPayloadProperty:v10];
        [v18 setLibraryScopeAssetContributorsToUpdate:v16];
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      if (![v10 isEqualToKey:@"avalancheUUID"])
      {
        if ([v10 isEqualToKey:@"avalanchePickType"])
        {
          v145 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"avalancheUUID"];

          if (v145)
          {
            v146 = self->super._payloadAttributes;
            id v147 = v11;
            v148 = [v10 key];
            v149 = [(NSMutableDictionary *)v146 objectForKeyedSubscript:v148];
            objc_msgSend(v147, "setAvalanchePickType:", objc_msgSend(v149, "integerValue"));
          }
        }
        goto LABEL_39;
      }
      id v21 = v11;
      v133 = self->super._payloadAttributes;
      v134 = [v10 key];
      v135 = [(NSMutableDictionary *)v133 objectForKeyedSubscript:v134];

      if (v135)
      {
        v136 = self->super._payloadAttributes;
        v137 = [v10 key];
        v138 = [(NSMutableDictionary *)v136 objectForKeyedSubscript:v137];
        [v21 setAvalancheUUID:v138];

        uint64_t v139 = 1;
      }
      else
      {
        uint64_t v139 = 0;
      }
      [v21 setAvalancheKind:v139];
    }
LABEL_31:

    goto LABEL_39;
  }
  long long v14 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"inTrash"];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    id v16 = v11;
    unsigned int v17 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"trashedReason"];
    id v18 = v17;
    if (v17) {
      uint64_t v19 = [v17 unsignedShortValue];
    }
    else {
      uint64_t v19 = 0;
    }
    [v16 trashWithReason:v19];
    goto LABEL_37;
  }
LABEL_39:
}

id __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)PLAssetJournalEntryPayload;
  return objc_msgSendSuper2(&v6, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, a3, v4, a2, v3);
}

id __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_1542(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)PLAssetJournalEntryPayload;
  return objc_msgSendSuper2(&v6, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, a3, v4, a2, v3);
}

id __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)PLAssetJournalEntryPayload;
  return objc_msgSendSuper2(&v6, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, a3, v4, a2, v3);
}

BOOL __97__PLAssetJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"subType"];
  uint64_t v5 = [v4 integerValue];

  objc_super v6 = [v3 objectForKeyedSubscript:@"version"];

  int v7 = [v6 intValue];
  return v5 == *(void *)(a1 + 32) && v7 == 2;
}

- (id)insertAssetFromDataInManagedObjectContext:(id)a3 keywordUUIDRemapping:(id)a4 rawPayloadAttributesToUpdate:(id)a5
{
  BOOL v8 = (NSDictionary *)a4;
  id v9 = a5;
  id v10 = +[PLManagedObject insertInManagedObjectContext:a3];
  id v11 = [(PLManagedObjectJournalEntryPayload *)self payloadID];
  id v12 = [v11 payloadIDString];
  [v10 setUuid:v12];

  keywordUUIDRemapping = self->_keywordUUIDRemapping;
  self->_keywordUUIDRemapping = v8;

  [(PLManagedObjectJournalEntryPayload *)self applyPayloadToManagedObject:v10 payloadAttributesToUpdate:v9];
  return v10;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"resource"])
  {
    uint64_t v11 = [v10 style];
    uint64_t v12 = [v10 indent];
    if (v11 == 1) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v12 + 1;
    }
    long long v14 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", v9, [v10 style], v13);
    int v15 = [[PLAssetJournalEntryPayloadResource alloc] initWithPayloadAttributes:v9 payload:self];
    [(PLAssetJournalEntryPayloadResource *)v15 appendToDescriptionBuilder:v14];
    id v16 = [(PLDescriptionBuilder *)v14 build];
    [v10 appendName:v8 object:v16];

    goto LABEL_6;
  }
  if (![v8 isEqualToString:@"resources"])
  {
    if ([v8 isEqualToString:@"keywords"])
    {
      long long v14 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v9];
      v43.receiver = self;
      v43.super_class = (Class)PLAssetJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v43 appendAttributeKey:v8 value:v14 toDescriptionBuilder:v10];
      goto LABEL_7;
    }
    if (![v8 isEqualToString:@"libraryScopeAssetContributorsToUpdate"])
    {
      v41.receiver = self;
      v41.super_class = (Class)PLAssetJournalEntryPayload;
      [(PLManagedObjectJournalEntryPayload *)&v41 appendAttributeKey:v8 value:v9 toDescriptionBuilder:v10];
      goto LABEL_30;
    }
    long long v14 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4F288C0]];
    int v15 = [(PLDescriptionBuilder *)v14 transformedValue:v9];
    v42.receiver = self;
    v42.super_class = (Class)PLAssetJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v42 appendAttributeKey:v8 value:v15 toDescriptionBuilder:v10];
LABEL_6:

LABEL_7:
    goto LABEL_30;
  }
  if ([v10 style] == 1)
  {
    v44.receiver = self;
    v44.super_class = (Class)PLAssetJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v44 appendAttributeKey:v8 value:v9 toDescriptionBuilder:v10];
  }
  else
  {
    id v37 = v8;
    unsigned int v17 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", v9, [v10 style], objc_msgSend(v10, "indent") + 1);
    id v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"version" ascending:1];
    v50[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"subType" ascending:1];
    v50[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    id v36 = v9;
    id v21 = [v9 sortedArrayUsingDescriptors:v20];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v21;
    uint64_t v22 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      uint64_t v39 = *(void *)v46;
      id v40 = self;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v46 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          double v27 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", v26, [v10 style], -[PLDescriptionBuilder indent](v17, "indent") + 1);
          double v28 = [[PLAssetJournalEntryPayloadResource alloc] initWithPayloadAttributes:v26 payload:self];
          [(PLAssetJournalEntryPayloadResource *)v28 appendToDescriptionBuilder:v27];
          if ([v10 style] == 2)
          {
            double v29 = NSString;
            long long v30 = [(PLDescriptionBuilder *)v27 build];
            long long v31 = [v29 stringWithFormat:@"\n%@", v30];
          }
          else
          {
            long long v31 = [(PLDescriptionBuilder *)v27 build];
          }
          long long v32 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v24 + i);
          [(PLDescriptionBuilder *)v17 appendName:v32 object:v31];

          self = v40;
        }
        v24 += i;
        uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v23);
    }

    if ([v10 style] == 2)
    {
      long long v33 = NSString;
      v34 = [(PLDescriptionBuilder *)v17 build];
      uint64_t v35 = [v33 stringWithFormat:@"\n%@", v34];
    }
    else
    {
      uint64_t v35 = [(PLDescriptionBuilder *)v17 build];
    }
    id v9 = v36;
    id v8 = v37;
    [v10 appendName:v37 object:v35];
  }
LABEL_30:
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 parentProperty];
  int v12 = [v11 isEqualToKey:@"resources"];

  if (v12)
  {
    if ([v10 isEqualToKey:@"uti"])
    {
      uint64_t v13 = [v9 description];
      long long v14 = +[PLUniformTypeIdentifierIntegratedLookup identifierFromCompactRepresentation:v13];
      LOBYTE(v15) = [v14 isEqualToString:v8];

      goto LABEL_18;
    }
    if ([v10 isEqualToKey:@"inTrash"])
    {
LABEL_8:
      __int16 v17 = [v9 integerValue];
      int v15 = [v8 BOOLValue] ^ (v17 == 0);
      goto LABEL_18;
    }
    unsigned __int8 v19 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v26, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, v24.receiver, v24.super_class, v25.receiver, v25.super_class, self, PLAssetJournalEntryPayload);
LABEL_17:
    LOBYTE(v15) = v19;
    goto LABEL_18;
  }
  if ([v10 isEqualToKey:@"inTrash"]) {
    goto LABEL_8;
  }
  if ([v10 isEqualToKey:@"keywords"])
  {
    id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    LOBYTE(v15) = [v16 isEqualToSet:v8];

    goto LABEL_18;
  }
  if (![v10 isEqualToKey:@"dateCreatedSource"])
  {
    if ([v10 isEqualToKey:@"duration"])
    {
      [v9 doubleValue];
      double v21 = round(v20 * 1000.0);
      [v8 doubleValue];
      LOBYTE(v15) = v21 - round(v22 * 1000.0) == 0.0;
      goto LABEL_18;
    }
    unsigned __int8 v19 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v24, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, self, PLAssetJournalEntryPayload, v25.receiver, v25.super_class, v26.receiver, v26.super_class);
    goto LABEL_17;
  }
  uint64_t v18 = [v9 integerValue];
  LOBYTE(v15) = 1;
  if (v8 && v18)
  {
    unsigned __int8 v19 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v25, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, v24.receiver, v24.super_class, self, PLAssetJournalEntryPayload, v26.receiver, v26.super_class);
    goto LABEL_17;
  }
LABEL_18:

  return v15;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 parentProperty];
  int v9 = [v8 isEqualToKey:@"resources"];

  if (v9)
  {
    if ([v7 isEqualToKey:@"volume"])
    {
      id v10 = [v7 key];
      uint64_t v11 = [v6 objectForKeyedSubscript:v10];
      uint64_t v12 = [(PLManagedObjectJournalEntryPayload *)self UUIDStringForData:v11];
LABEL_6:
      uint64_t v13 = (void *)v12;
LABEL_10:

      goto LABEL_13;
    }
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v18, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7, v17.receiver, v17.super_class, self, PLAssetJournalEntryPayload);
  }
  else
  {
    if ([v7 isEqualToKey:@"keywords"])
    {
      id v10 = [v7 key];
      uint64_t v11 = [v6 objectForKeyedSubscript:v10];
      uint64_t v12 = [(PLManagedObjectJournalEntryPayload *)self setForUUIDEncodedData:v11];
      goto LABEL_6;
    }
    if ([v7 isEqualToKey:@"libraryScopeAssetContributorsToUpdate"])
    {
      id v10 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4F288C0]];
      payloadAttributes = self->super._payloadAttributes;
      uint64_t v11 = [v7 key];
      int v15 = [(NSMutableDictionary *)payloadAttributes objectForKeyedSubscript:v11];
      uint64_t v13 = [v10 transformedValue:v15];

      goto LABEL_10;
    }
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v17, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7, self, PLAssetJournalEntryPayload, v18.receiver, v18.super_class);
  uint64_t v13 = };
LABEL_13:

  return v13;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v13 parentProperty];
  int v15 = [v14 isEqualToKey:@"resources"];

  if (!v15)
  {
    if ([v13 isEqualToKey:@"inTrash"])
    {
      double v20 = NSNumber;
      uint64_t v21 = [v12 isInTrash];
LABEL_15:
      id v16 = [v20 numberWithBool:v21];
      objc_super v18 = [v13 key];
      [v10 setObject:v16 forKeyedSubscript:v18];
      goto LABEL_16;
    }
    if ([v13 isEqualToKey:@"keywords"])
    {
      objc_super v24 = [v12 keywords];
      objc_super v25 = [v13 relatedEntityPropertyNames];
      objc_super v26 = [v25 anyObject];
      id v16 = [v24 valueForKey:v26];

      objc_super v18 = [(PLManagedObjectJournalEntryPayload *)self encodedDataForUUIDStringSet:v16];
      [(PLManagedObjectJournalEntryPayload *)self updatePayloadAttributes:v10 andNilAttributes:v11 forPayloadProperty:v13 withUUIDStringData:v18];
      goto LABEL_16;
    }
    if ([v13 isEqualToKey:@"bundleScope"])
    {
      id v16 = v12;
      if ([v16 bundleScope])
      {
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v16, "bundleScope"));
        goto LABEL_4;
      }
    }
    else
    {
      if ([v13 isEqualToKey:@"avalancheUUID"])
      {
        id v16 = v12;
        unsigned int v29 = [v16 avalancheKind];
        BOOL v30 = v29 == 2;
        if (v29 < 2)
        {
          uint64_t v17 = [v16 avalancheUUID];
          goto LABEL_4;
        }
      }
      else
      {
        if (![v13 isEqualToKey:@"avalanchePickType"])
        {
          if ([v13 isEqualToKey:@"libraryScopeAssetContributorsToUpdate"])
          {
            long long v32 = (void *)MEMORY[0x1E4F29248];
            uint64_t v33 = *MEMORY[0x1E4F288C0];
            id v34 = v12;
            id v16 = [v32 valueTransformerForName:v33];
            objc_super v18 = [v34 libraryScopeAssetContributorsToUpdate];

            uint64_t v22 = [v16 reverseTransformedValue:v18];
            goto LABEL_9;
          }
          goto LABEL_33;
        }
        id v16 = v12;
        unsigned int v31 = [v16 avalancheKind];
        BOOL v30 = v31 == 2;
        if (v31 < 2)
        {
          uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "avalanchePickType"));
          goto LABEL_4;
        }
      }
      if (!v30) {
        goto LABEL_17;
      }
    }
    objc_super v18 = [v13 key];
    [v11 addObject:v18];
    goto LABEL_16;
  }
  if (![v13 isEqualToKey:@"uti"])
  {
    if ([v13 isEqualToKey:@"volume"])
    {
      id v16 = [v12 fileSystemVolume];
      objc_super v18 = [v16 uuid];
      uint64_t v22 = [(PLManagedObjectJournalEntryPayload *)self UUIDDataForString:v18];
LABEL_9:
      unsigned __int8 v19 = (void *)v22;
      uint64_t v23 = [v13 key];
      [v10 setObject:v19 forKeyedSubscript:v23];

      goto LABEL_10;
    }
    if ([v13 isEqualToKey:@"inTrash"])
    {
      double v20 = NSNumber;
      uint64_t v21 = [v12 isTrashedOrExpunged];
      goto LABEL_15;
    }
LABEL_33:
    BOOL v27 = 0;
    goto LABEL_18;
  }
  id v16 = [v12 uniformTypeIdentifier];
  uint64_t v17 = [v16 identifier];
LABEL_4:
  objc_super v18 = (void *)v17;
  unsigned __int8 v19 = [v13 key];
  [v10 setObject:v18 forKeyedSubscript:v19];
LABEL_10:

LABEL_16:
LABEL_17:

  BOOL v27 = 1;
LABEL_18:

  return v27;
}

- (void)mergePayload:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  id v5 = v4[1];
  id v6 = [v5 objectForKeyedSubscript:@"resource"];
  if (v6)
  {
    id v16 = v5;
    id v7 = [[PLAssetJournalEntryPayloadResource alloc] initWithPayloadAttributes:v6 payload:self];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v9 = [(PLAssetJournalEntryPayload *)self resources];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v14 isEqualToPayloadResource:v7]) {
            [v14 mergePayloadResource:v7 nilAttributes:v4[2]];
          }
          int v15 = [v14 payloadAttributes];
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [(NSMutableDictionary *)self->super._payloadAttributes setObject:v8 forKeyedSubscript:@"resources"];
    id v5 = v16;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    [(PLManagedObjectJournalEntryPayload *)&v17 mergePayload:v4];
  }
}

- (PLAssetJournalEntryPayload)initWithEditedIPTCAttributes:(id)a3 changedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 payloadID];
    uint64_t v9 = [(id)objc_opt_class() payloadVersion];
    uint64_t v10 = [(id)objc_opt_class() modelProperties];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"additionalAttributes"];
    uint64_t v12 = [v11 subRelationshipProperties];
    id v13 = [v12 objectForKeyedSubscript:@"editedIPTCAttributes"];
    long long v14 = [v13 subRelationshipProperties];
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    int v15 = [(PLManagedObjectJournalEntryPayload *)&v17 initWithPayloadID:v8 payloadVersion:v9 managedObject:v6 changedKeys:v7 modelProperties:v14];
  }
  else
  {

    int v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithExtendedAttributes:(id)a3 changedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 payloadID];
    uint64_t v9 = [(id)objc_opt_class() payloadVersion];
    uint64_t v10 = [(id)objc_opt_class() modelProperties];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"extendedAttributes"];
    uint64_t v12 = [v11 subRelationshipProperties];
    v15.receiver = self;
    v15.super_class = (Class)PLAssetJournalEntryPayload;
    id v13 = [(PLManagedObjectJournalEntryPayload *)&v15 initWithPayloadID:v8 payloadVersion:v9 managedObject:v6 changedKeys:v7 modelProperties:v12];
  }
  else
  {

    id v13 = 0;
  }

  return v13;
}

- (PLAssetJournalEntryPayload)initWithCloudMasterMediaMetadata:(id)a3 payloadID:(id)a4 changedKeys:(id)a5 modelProperties:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    uint64_t v14 = [(id)objc_opt_class() payloadVersion];
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    objc_super v15 = [(PLManagedObjectJournalEntryPayload *)&v17 initWithPayloadID:v11 payloadVersion:v14 managedObject:v10 changedKeys:v12 modelProperties:v13];
  }
  else
  {

    objc_super v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithCloudMaster:(id)a3 payloadID:(id)a4 changedKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(id)objc_opt_class() payloadVersion];
    id v12 = [(id)objc_opt_class() modelProperties];
    id v13 = [v12 objectForKeyedSubscript:@"master"];
    uint64_t v14 = [v13 subRelationshipProperties];
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    objc_super v15 = [(PLManagedObjectJournalEntryPayload *)&v17 initWithPayloadID:v9 payloadVersion:v11 managedObject:v8 changedKeys:v10 modelProperties:v14];
  }
  else
  {

    objc_super v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithInternalResource:(id)a3 filesystemBookmark:(id)a4 changedKeys:(id)a5
{
  v33[5] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v30 = v8;
  if (v8)
  {
    double v28 = [PLManagedObjectJournalEntryPayload alloc];
    id v10 = [v8 payloadID];
    uint64_t v11 = [(id)objc_opt_class() payloadVersion];
    id v12 = [(id)objc_opt_class() modelProperties];
    id v13 = [v12 objectForKeyedSubscript:@"modernResources"];
    uint64_t v14 = [v13 subRelationshipProperties];
    [v14 objectForKeyedSubscript:@"fileSystemBookmark"];
    v16 = objc_super v15 = v9;
    objc_super v17 = [v16 subRelationshipProperties];
    unsigned int v29 = [(PLManagedObjectJournalEntryPayload *)v28 initWithPayloadID:v10 payloadVersion:v11 managedObject:v8 changedKeys:v15 modelProperties:v17];

    id v9 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    unsigned int v29 = 0;
  }
  long long v18 = [v31 payloadID];
  uint64_t v19 = [(id)objc_opt_class() payloadVersion];
  v33[0] = @"resourceType";
  v33[1] = @"version";
  v33[2] = @"recipeID";
  v33[3] = @"compactUTI";
  v33[4] = @"dataStoreSubtype";
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
  long long v21 = [v9 setByAddingObjectsFromArray:v20];
  uint64_t v22 = [(id)objc_opt_class() modelProperties];
  uint64_t v23 = [v22 objectForKeyedSubscript:@"modernResources"];
  objc_super v24 = [v23 subRelationshipProperties];
  v32.receiver = self;
  v32.super_class = (Class)PLAssetJournalEntryPayload;
  objc_super v25 = [(PLManagedObjectJournalEntryPayload *)&v32 initWithPayloadID:v18 payloadVersion:v19 managedObject:v31 changedKeys:v21 modelProperties:v24];

  if (v25)
  {
    if (v29)
    {
      [(NSMutableDictionary *)v25->super._payloadAttributes addEntriesFromDictionary:v29->_payloadAttributes];
      [(NSMutableSet *)v25->super._nilAttributes unionSet:v29->_nilAttributes];
    }
    objc_super v26 = (void *)[(NSMutableDictionary *)v25->super._payloadAttributes mutableCopy];
    [(NSMutableDictionary *)v25->super._payloadAttributes removeAllObjects];
    [(NSMutableDictionary *)v25->super._payloadAttributes setObject:v26 forKeyedSubscript:@"resource"];
  }
  return v25;
}

- (PLAssetJournalEntryPayload)initWithUnmanagedAdjustment:(id)a3 changedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 payloadID];
    uint64_t v9 = [(id)objc_opt_class() payloadVersion];
    id v10 = [(id)objc_opt_class() modelProperties];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"additionalAttributes"];
    id v12 = [v11 subRelationshipProperties];
    id v13 = [v12 objectForKeyedSubscript:@"unmanagedAdjustment"];
    uint64_t v14 = [v13 subRelationshipProperties];
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    objc_super v15 = [(PLManagedObjectJournalEntryPayload *)&v17 initWithPayloadID:v8 payloadVersion:v9 managedObject:v6 changedKeys:v7 modelProperties:v14];
  }
  else
  {

    objc_super v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithAssetDescription:(id)a3 changedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 payloadID];
    uint64_t v9 = [(id)objc_opt_class() payloadVersion];
    id v10 = [(id)objc_opt_class() modelProperties];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"additionalAttributes"];
    id v12 = [v11 subRelationshipProperties];
    id v13 = [v12 objectForKeyedSubscript:@"assetDescription"];
    uint64_t v14 = [v13 subRelationshipProperties];
    v17.receiver = self;
    v17.super_class = (Class)PLAssetJournalEntryPayload;
    objc_super v15 = [(PLManagedObjectJournalEntryPayload *)&v17 initWithPayloadID:v8 payloadVersion:v9 managedObject:v6 changedKeys:v7 modelProperties:v14];
  }
  else
  {

    objc_super v15 = 0;
  }

  return v15;
}

- (PLAssetJournalEntryPayload)initWithAdditionalAssetAttributes:(id)a3 changedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 payloadID];
    uint64_t v9 = [(id)objc_opt_class() payloadVersion];
    id v10 = [(id)objc_opt_class() modelProperties];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"additionalAttributes"];
    id v12 = [v11 subRelationshipProperties];
    v15.receiver = self;
    v15.super_class = (Class)PLAssetJournalEntryPayload;
    id v13 = [(PLManagedObjectJournalEntryPayload *)&v15 initWithPayloadID:v8 payloadVersion:v9 managedObject:v6 changedKeys:v7 modelProperties:v12];
  }
  else
  {

    id v13 = 0;
  }

  return v13;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PLInternalResource entityName];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"recipeID"];

    char v10 = +[PLAssetJournalEntryPayloadResource isValidForPersistenceWithRecipeID:](PLAssetJournalEntryPayloadResource, "isValidForPersistenceWithRecipeID:", [v9 integerValue]);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F8B980];
    uint64_t v9 = [v6 objectForKeyedSubscript:@"bundleScope"];

    char v10 = objc_msgSend(v11, "bundleScopeShouldBePersistedForRebuild:", (unsigned __int16)objc_msgSend(v9, "integerValue"));
  }
  BOOL v12 = v10;

  return v12;
}

+ (id)snapshotSortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 10;
}

+ (unsigned)payloadVersion
{
  return 300;
}

+ (id)payloadClassID
{
  return +[PLManagedAsset entityName];
}

+ (id)persistedPropertyNamesForEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PLAssetJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_82517 != -1) {
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_82517, block);
  }
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_82518;
  return v2;
}

void __66__PLAssetJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) persistedPropertyNamesForEntityNamesFromModelProperties];
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_82518;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_82518 = v1;
}

+ (id)modelProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PLAssetJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_82519 != -1) {
    dispatch_once(&modelProperties_onceToken_82519, block);
  }
  v2 = (void *)modelProperties_modelProperties_82520;
  return v2;
}

uint64_t __45__PLAssetJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelPropertiesDescription];
  id v3 = (void *)modelProperties_modelProperties_82520;
  modelProperties_modelProperties_82520 = v2;

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = modelProperties_modelProperties_82520;
  return [v4 loadModelPropertiesDescription:v5 parentPayloadProperty:0];
}

+ (id)nonPersistedModelPropertiesDescription
{
  MEMORY[0x1F4188790](a1);
  v294[105] = *MEMORY[0x1E4F143B8];
  v293[0] = @"adjustmentTimestamp";
  v272 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[0] = v272;
  v293[1] = @"analysisStateModificationDate";
  v271 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[1] = v271;
  v293[2] = @"avalancheKind";
  v270 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[2] = v270;
  v293[3] = @"cloudBatchID";
  v269 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[3] = v269;
  v293[4] = @"cloudBatchPublishDate";
  v268 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[4] = v268;
  v293[5] = @"cloudCollectionGUID";
  v267 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[5] = v267;
  v293[6] = @"cloudDeleteState";
  v266 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[6] = v266;
  v293[7] = @"cloudDownloadRequests";
  v265 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[7] = v265;
  v293[8] = @"cloudHasCommentsByMe";
  v264 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[8] = v264;
  v293[9] = @"cloudHasCommentsConversation";
  v263 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[9] = v263;
  v293[10] = @"cloudHasUnseenComments";
  v262 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[10] = v262;
  v293[11] = @"cloudIsDeletable";
  v261 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[11] = v261;
  v293[12] = @"cloudIsMyAsset";
  v260 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[12] = v260;
  v293[13] = @"cloudLastViewedCommentDate";
  v259 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[13] = v259;
  v293[14] = @"cloudLocalState";
  v258 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[14] = v258;
  v293[15] = @"cloudOwnerHashedPersonID";
  v257 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[15] = v257;
  v293[16] = @"cloudPlaceholderKind";
  v256 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[16] = v256;
  v293[17] = @"cloudServerPublishDate";
  v255 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[17] = v255;
  v293[18] = @"complete";
  v254 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[18] = v254;
  v293[19] = @"curationScore";
  v253 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[19] = v253;
  v293[20] = @"duplicateAssetVisibilityState";
  v252 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[20] = v252;
  v293[21] = @"faceAdjustmentVersion";
  v251 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[21] = v251;
  v293[22] = @"faceAreaPoints";
  v250 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[22] = v250;
  v293[23] = @"highlightVisibilityScore";
  v249 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[23] = v249;
  v293[24] = @"imageRequestHints";
  v248 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[24] = v248;
  v293[25] = @"overallAestheticScore";
  v247 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[25] = v247;
  v293[26] = @"packedAcceptableCropRect";
  v246 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[26] = v246;
  v293[27] = @"packedPreferredCropRect";
  v245 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[27] = v245;
  v293[28] = @"promotionScore";
  v244 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[28] = v244;
  v293[29] = @"thumbnailIndex";
  v243 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[29] = v243;
  v293[30] = @"trashedDate";
  v242 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[30] = v242;
  v293[31] = @"videoDeferredProcessingNeeded";
  v241 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[31] = v241;
  v293[32] = @"deleteReason";
  v240 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[32] = v240;
  v293[33] = @"iconicScore";
  v239 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[33] = v239;
  v293[34] = @"captureSessionIdentifier";
  v238 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[34] = v238;
  v293[35] = @"generativeMemoryCreationEligibilityState";
  v237 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[35] = v237;
  v293[36] = @"albums";
  v236 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[36] = v236;
  v293[37] = @"albumsBeingCustomKeyAsset";
  v235 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[37] = v235;
  v293[38] = @"albumsBeingKeyAssets";
  v234 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[38] = v234;
  v293[39] = @"analysisStates";
  v233 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[39] = v233;
  v293[40] = @"cloudComments";
  v232 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[40] = v232;
  v293[41] = @"cloudFeedAssetsEntry";
  v231 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[41] = v231;
  v293[42] = @"computedAttributes";
  v230 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[42] = v230;
  v293[43] = @"destinationAssetsForDuplication";
  v229 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[43] = v229;
  v293[44] = @"detectedFaces";
  v228 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[44] = v228;
  v293[45] = @"temporalDetectedFaces";
  v227 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[45] = v227;
  v293[46] = @"detectedTorsos";
  v226 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[46] = v226;
  v293[47] = @"faceCrops";
  v225 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[47] = v225;
  v293[48] = @"highlightBeingAssets";
  v224 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[48] = v224;
  v293[49] = @"videoKeyFrameTimeScale";
  v223 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[49] = v223;
  v293[50] = @"videoKeyFrameValue";
  v222 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[50] = v222;
  v293[51] = @"dayGroupHighlightBeingAssets";
  v221 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[51] = v221;
  v293[52] = @"dayGroupHighlightBeingKeyAssetPrivate";
  v220 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[52] = v220;
  v293[53] = @"dayGroupHighlightBeingKeyAssetShared";
  v219 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[53] = v219;
  v293[54] = @"dayGroupHighlightBeingExtendedAssets";
  v218 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[54] = v218;
  v293[55] = @"dayGroupHighlightBeingSummaryAssets";
  v217 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[55] = v217;
  v293[56] = @"duplicateMetadataMatchingAlbum";
  v216 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[56] = v216;
  v293[57] = @"duplicatePerceptualMatchingAlbum";
  v215 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[57] = v215;
  v293[58] = @"highlightBeingExtendedAssets";
  v214 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[58] = v214;
  v293[59] = @"highlightBeingKeyAssetPrivate";
  v213 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[59] = v213;
  v293[60] = @"highlightBeingKeyAssetShared";
  v212 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[60] = v212;
  v293[61] = @"highlightBeingSummaryAssets";
  v211 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[61] = v211;
  v293[62] = @"monthHighlightBeingKeyAssetPrivate";
  v210 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[62] = v210;
  v293[63] = @"monthHighlightBeingKeyAssetShared";
  v209 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[63] = v209;
  v293[64] = @"yearHighlightBeingKeyAssetPrivate";
  v208 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[64] = v208;
  v293[65] = @"yearHighlightBeingKeyAssetShared";
  v207 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[65] = v207;
  v293[66] = @"dayHighlightBeingCollageAssetsPrivate";
  v206 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[66] = v206;
  v293[67] = @"dayHighlightBeingCollageAssetsShared";
  v205 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[67] = v205;
  v293[68] = @"dayHighlightBeingCollageAssetsMixed";
  v204 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[68] = v204;
  v293[69] = @"importSession";
  v203 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[69] = v203;
  v293[70] = @"conversation";
  uint64_t v202 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[70] = v202;
  v293[71] = @"legacyFaces";
  v201 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[71] = v201;
  v293[72] = @"likeComments";
  v200 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[72] = v200;
  v293[73] = @"mediaAnalysisAttributes";
  __int16 v199 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[73] = v199;
  v293[74] = @"computeSyncAttributes";
  v198 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[74] = v198;
  v293[75] = @"photoAnalysisAttributes";
  __int16 v197 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[75] = v197;
  v293[76] = @"isDetectedScreenshot";
  v196 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[76] = v196;
  v293[77] = @"isRecentlySaved";
  __int16 v195 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[77] = v195;
  v293[78] = @"memoriesBeingCuratedAssets";
  uint64_t v194 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[78] = v194;
  v293[79] = @"memoriesBeingExtendedCuratedAssets";
  v193 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[79] = v193;
  v293[80] = @"memoriesBeingKeyAsset";
  v192 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[80] = v192;
  v293[81] = @"memoriesBeingMovieCuratedAssets";
  id v191 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[81] = v191;
  v293[82] = @"memoriesBeingUserCuratedAssets";
  v190 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[82] = v190;
  v293[83] = @"memoriesBeingRepresentativeAssets";
  v189 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[83] = v189;
  v293[84] = @"memoriesBeingCustomUserAssets";
  id v188 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[84] = v188;
  v293[85] = @"memoriesBeingUserRemovedAssets";
  long long v187 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[85] = v187;
  v293[86] = @"moment";
  long long v186 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[86] = v186;
  v293[87] = @"momentShare";
  long long v185 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[87] = v185;
  v293[88] = @"libraryScope";
  long long v184 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[88] = v184;
  v293[89] = @"activeLibraryScopeParticipationState";
  v183 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[89] = v183;
  v293[90] = @"libraryScopeContributors";
  id v182 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[90] = v182;
  v293[91] = @"libraryScopeAssetContributors";
  v181 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[91] = v181;
  v293[92] = @"trashedByParticipant";
  v180 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[92] = v180;
  v293[93] = @"resources";
  v179 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[93] = v179;
  v293[94] = @"suggestionsBeingKeyAssets";
  id v178 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[94] = v178;
  v293[95] = @"suggestionsBeingRepresentativeAssets";
  id v177 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[95] = v177;
  v293[96] = @"packedBadgeAttributes";
  v176 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[96] = v176;
  v293[97] = @"derivedCameraCaptureDevice";
  v175 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[97] = v175;
  v293[98] = @"syndicationState";
  objc_super v174 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[98] = v174;
  v293[99] = @"searchIndexRebuildState";
  objc_super v173 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[99] = v173;
  v293[100] = @"stickerConfidenceScore";
  objc_super v172 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v294[100] = v172;
  v293[101] = @"extendedAttributes";
  v291 = @"asset";
  objc_super v171 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v292 = v171;
  objc_super v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v292 forKeys:&v291 count:1];
  objc_super v169 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v170 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v294[101] = v169;
  v293[102] = @"additionalAttributes";
  v289[0] = @"hasPeopleSceneMidOrGreaterConfidence";
  objc_super v168 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[0] = v168;
  v289[1] = @"adjustedStableHash";
  objc_super v167 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[1] = v167;
  v289[2] = @"allowedForAnalysis";
  objc_super v166 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[2] = v166;
  v289[3] = @"cloudAvalanchePickType";
  v165 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[3] = v165;
  v289[4] = @"cloudKindSubtype";
  v164 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[4] = v164;
  v289[5] = @"cloudRecoveryState";
  id v163 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[5] = v163;
  v289[6] = @"cloudStateRecoveryAttemptsCount";
  v162 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[6] = v162;
  v289[7] = @"destinationAssetCopyState";
  id v161 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[7] = v161;
  v289[8] = @"distanceIdentity";
  id v160 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[8] = v160;
  v289[9] = @"faceRegions";
  id v159 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[9] = v159;
  v289[10] = @"gpsHorizontalAccuracy";
  id v158 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[10] = v158;
  v289[11] = @"importSessionID";
  id v157 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[11] = v157;
  v289[12] = @"lastUploadAttemptDate";
  id v156 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[12] = v156;
  v289[13] = @"locationHash";
  v155 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[13] = v155;
  v289[14] = @"originalStableHash";
  v154 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[14] = v154;
  v289[15] = @"pendingPlayCount";
  v153 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[15] = v153;
  v289[16] = @"pendingShareCount";
  id v152 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[16] = v152;
  v289[17] = @"pendingViewCount";
  v151 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[17] = v151;
  v289[18] = @"reverseLocationData";
  v150 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[18] = v150;
  v289[19] = @"reverseLocationDataIsValid";
  v149 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[19] = v149;
  v289[20] = @"sceneAnalysisTimestamp";
  v148 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[20] = v148;
  v289[21] = @"sceneAnalysisVersion";
  id v147 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[21] = v147;
  v289[22] = @"sceneAnalysisIsFromPreview";
  v146 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[22] = v146;
  v289[23] = @"shiftedLocationData";
  v145 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[23] = v145;
  v289[24] = @"shiftedLocationIsValid";
  v144 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[24] = v144;
  v289[25] = @"objectSaliencyRectsData";
  v143 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[25] = v143;
  v289[26] = @"uploadAttempts";
  v142 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[26] = v142;
  v289[27] = @"variationSuggestionStates";
  v141 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[27] = v141;
  v289[28] = @"inferredTimeZoneOffset";
  v140 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[28] = v140;
  v289[29] = @"deferredProcessingCandidateOptions";
  uint64_t v139 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[29] = v139;
  v289[30] = @"sourceAssetForDuplicationScopeIdentifier";
  v138 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[30] = v138;
  v289[31] = @"sourceAssetForDuplicationIdentifier";
  v137 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[31] = v137;
  v289[32] = @"faceAnalysisVersion";
  v136 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[32] = v136;
  v289[33] = @"duplicateDetectorPerceptualProcessingState";
  v135 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[33] = v135;
  v289[34] = @"asset";
  v134 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[34] = v134;
  v289[35] = @"personReferences";
  v133 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[35] = v133;
  v289[36] = @"sceneClassifications";
  v132 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[36] = v132;
  v289[37] = @"temporalSceneClassifications";
  v131 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[37] = v131;
  v289[38] = @"sceneprint";
  v130 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v290[38] = v130;
  v289[39] = @"assetDescription";
  v287 = @"assetAttributes";
  v129 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v288 = v129;
  v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v288 forKeys:&v287 count:1];
  v127 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v128 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v290[39] = v127;
  v289[40] = @"unmanagedAdjustment";
  v285[0] = @"assetAttributes";
  unsigned __int16 v126 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v286[0] = v126;
  v285[1] = @"uuid";
  v125 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v286[1] = v125;
  v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v286 forKeys:v285 count:2];
  v123 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v124 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v290[40] = v123;
  v289[41] = @"mediaMetadata";
  v283[0] = @"additionalAssetAttributes";
  v122 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v284[0] = v122;
  v283[1] = @"cloudMaster";
  v121 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v284[1] = v121;
  id v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v284 forKeys:v283 count:2];
  v119 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v120 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v290[41] = v119;
  v289[42] = @"editedIPTCAttributes";
  v281[0] = @"caption";
  v118 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[0] = v118;
  v281[1] = @"byLine";
  BOOL v117 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[1] = v117;
  v281[2] = @"copyrightNotice";
  v116 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[2] = v116;
  v281[3] = @"keywords";
  uint64_t v115 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[3] = v115;
  v281[4] = @"urgency";
  v114 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[4] = v114;
  v281[5] = @"dateCreated";
  float v113 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[5] = v113;
  v281[6] = @"digitalCreationDate";
  v112 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[6] = v112;
  v281[7] = @"digitalCreationTime";
  v111 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[7] = v111;
  v281[8] = @"digitalSourceType";
  v110 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[8] = v110;
  v281[9] = @"expirationDate";
  v109 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[9] = v109;
  v281[10] = @"expirationTime";
  v108 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[10] = v108;
  v281[11] = @"referenceDate";
  v107 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[11] = v107;
  v281[12] = @"releaseDate";
  v106 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[12] = v106;
  v281[13] = @"releaseTime";
  double v105 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[13] = v105;
  v281[14] = @"timeCreated";
  v104 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[14] = v104;
  v281[15] = @"editStatus";
  double v103 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[15] = v103;
  v281[16] = @"contentLocationCode";
  v102 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[16] = v102;
  v281[17] = @"contentLocationName";
  v101 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[17] = v101;
  v281[18] = @"countryPrimaryLocationCode";
  v100 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[18] = v100;
  v281[19] = @"objectAttributeReference";
  v99 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[19] = v99;
  v281[20] = @"objectTypeReference";
  uint64_t v98 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[20] = v98;
  v281[21] = @"subjectReference";
  id v97 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[21] = v97;
  v281[22] = @"subLocation";
  v96 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[22] = v96;
  v281[23] = @"scene";
  v95 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[23] = v95;
  v281[24] = @"creatorContactInfo";
  unint64_t v94 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[24] = v94;
  v281[25] = @"ciAdrCity";
  v93 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[25] = v93;
  v281[26] = @"ciAdrCtry";
  v92 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[26] = v92;
  v281[27] = @"ciAdrExtadr";
  v91 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[27] = v91;
  v281[28] = @"ciAdrPcode";
  v90 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[28] = v90;
  v281[29] = @"ciAdrRegion";
  id v89 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[29] = v89;
  v281[30] = @"ciEmailWork";
  v88 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[30] = v88;
  v281[31] = @"ciTelWork";
  v87 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[31] = v87;
  v281[32] = @"ciUrlWork";
  v86 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[32] = v86;
  v281[33] = @"actionAdvised";
  v85 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[33] = v85;
  v281[34] = @"audioDuration";
  v84 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[34] = v84;
  v281[35] = @"audioOutcue";
  v83 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[35] = v83;
  v281[36] = @"audioSamplingRate";
  v82 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[36] = v82;
  v281[37] = @"audioSamplingRes";
  v81 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[37] = v81;
  v281[38] = @"audioType";
  v80 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[38] = v80;
  v281[39] = @"byLineTitle";
  v79 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[39] = v79;
  v281[40] = @"category";
  id v78 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[40] = v78;
  v281[41] = @"city";
  v77 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[41] = v77;
  v281[42] = @"contact";
  v76 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[42] = v76;
  v281[43] = @"countryPrimaryLocationName";
  v75 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[43] = v75;
  v281[44] = @"credit";
  v74 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[44] = v74;
  v281[45] = @"editorialUpdate";
  v73 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[45] = v73;
  v281[46] = @"fixtureIdentifier";
  v72 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[46] = v72;
  v281[47] = @"headline";
  v71 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[47] = v71;
  v281[48] = @"imageOrientation";
  uint64_t v70 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[48] = v70;
  v281[49] = @"imageType";
  v69 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[49] = v69;
  v281[50] = @"languageIdentifier";
  uint64_t v68 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[50] = v68;
  v281[51] = @"objectCycle";
  v67 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[51] = v67;
  v281[52] = @"originatingProgram";
  v66 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[52] = v66;
  v281[53] = @"originalTransmissionReference";
  uint64_t v65 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[53] = v65;
  v281[54] = @"programVersion";
  uint64_t v64 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[54] = v64;
  v281[55] = @"provinceState";
  uint64_t v63 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[55] = v63;
  v281[56] = @"objectName";
  v62 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[56] = v62;
  v281[57] = @"referenceNumber";
  v61 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[57] = v61;
  v281[58] = @"referenceService";
  id v60 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[58] = v60;
  v281[59] = @"source";
  __int16 v59 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[59] = v59;
  v281[60] = @"specialInstructions";
  v58 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[60] = v58;
  v281[61] = @"supplementalCategory";
  v57 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[61] = v57;
  v281[62] = @"writerEditor";
  v56 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[62] = v56;
  v281[63] = @"usageTerms";
  v55 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[63] = v55;
  v281[64] = @"starRating";
  v54 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[64] = v54;
  v281[65] = @"assetAttributes";
  v53 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v282[65] = v53;
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v282 forKeys:v281 count:66];
  v51 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v52 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v290[42] = v51;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v290 forKeys:v289 count:43];
  v49 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v50 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v294[102] = v49;
  v293[103] = @"modernResources";
  v279[0] = @"cloudDeleteAssetUUIDWithResourceType";
  long long v48 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[0] = v48;
  v279[1] = @"cloudDeleteState";
  long long v47 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[1] = v47;
  v279[2] = @"cloudLastOnDemandDownloadDate";
  long long v46 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[2] = v46;
  v279[3] = @"cloudLastPrefetchDate";
  long long v45 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[3] = v45;
  v279[4] = @"cloudPrunedAt";
  objc_super v44 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[4] = v44;
  v279[5] = @"cloudMasterDateCreated";
  objc_super v43 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[5] = v43;
  v279[6] = @"cloudPrefetchCount";
  objc_super v42 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[6] = v42;
  v279[7] = @"cloudSourceType";
  objc_super v41 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[7] = v41;
  v279[8] = @"dataStoreKeyData";
  id v40 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[8] = v40;
  v279[9] = @"fileID";
  uint64_t v39 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[9] = v39;
  v279[10] = @"localAvailability";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[10] = v38;
  v279[11] = @"localAvailabilityTarget";
  id v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[11] = v37;
  v279[12] = @"remoteAvailabilityTarget";
  id v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[12] = v36;
  v279[13] = @"asset";
  uint64_t v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[13] = v35;
  v279[14] = @"transientCloudMaster";
  id v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[14] = v34;
  v279[15] = @"dataStoreClassID";
  uint64_t v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[15] = v33;
  v279[16] = @"trashedDate";
  objc_super v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[16] = v32;
  v279[17] = @"utiConformanceHint";
  id v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v280[17] = v31;
  v279[18] = @"fileSystemBookmark";
  v277 = @"resource";
  BOOL v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v278 = v30;
  unsigned int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v278 forKeys:&v277 count:1];
  double v28 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v29 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v280[18] = v28;
  BOOL v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v280 forKeys:v279 count:19];
  objc_super v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v27 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v294[103] = v26;
  v293[104] = @"master";
  v275[0] = @"cloudLocalState";
  objc_super v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[0] = v25;
  v275[1] = @"importedBy";
  objc_super v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[1] = v24;
  v275[2] = @"importedByBundleIdentifier";
  uint64_t v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[2] = v23;
  v275[3] = @"importedByDisplayName";
  uint64_t v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[3] = v22;
  v275[4] = @"originalFilename";
  long long v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[4] = v21;
  v275[5] = @"originalOrientation";
  long long v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[5] = v20;
  v275[6] = @"originatingAssetIdentifier";
  uint64_t v19 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[6] = v19;
  v275[7] = @"placeholderState";
  long long v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[7] = v18;
  v275[8] = @"assets";
  objc_super v17 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[8] = v17;
  v275[9] = @"momentShare";
  id v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[9] = v16;
  v275[10] = @"resources";
  objc_super v15 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[10] = v15;
  v275[11] = @"transientModernResources";
  uint64_t v14 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[11] = v14;
  v275[12] = @"videoFrameRate";
  id v13 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[12] = v13;
  v275[13] = @"codecName";
  uint64_t v2 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[13] = v2;
  v275[14] = @"sourceMasterForDuplicationScopeIdentifier";
  id v3 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[14] = v3;
  v275[15] = @"sourceMasterForDuplicationIdentifier";
  uint64_t v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v276[15] = v4;
  v275[16] = @"mediaMetadata";
  v273[0] = @"additionalAssetAttributes";
  uint64_t v5 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v274[0] = v5;
  v273[1] = @"cloudMaster";
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 andType:0 info:0];
  v274[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v274 forKeys:v273 count:2];
  int v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v7 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v276[16] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v276 forKeys:v275 count:17];
  char v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v9 subRelationshipEntityName:0 isToMany:0 isAdditionalEntityName:1 info:0];
  v294[104] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v294 forKeys:v293 count:105];

  return v11;
}

+ (id)modelPropertiesDescription
{
  MEMORY[0x1F4188790](a1);
  v224[49] = *MEMORY[0x1E4F143B8];
  v223[0] = @"uuid";
  v201 = +[PLJournalEntryPayloadProperty payloadPropertyForUUID];
  v224[0] = v201;
  v223[1] = @"directory";
  v200 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[1] = v200;
  v223[2] = @"filename";
  __int16 v199 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[2] = v199;
  v223[3] = @"savedAssetType";
  v198 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[3] = v198;
  v223[4] = @"bundleScope";
  __int16 v197 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:");
  v224[4] = v197;
  v223[5] = @"cloudAssetGUID";
  v196 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[5] = v196;
  v223[6] = @"avalancheUUID";
  __int16 v195 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:");
  v224[6] = v195;
  v223[7] = @"avalanchePickType";
  uint64_t v194 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:");
  v224[7] = v194;
  v223[8] = @"hidden";
  v193 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[8] = v193;
  v223[9] = @"favorite";
  v192 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[9] = v192;
  v223[10] = @"trashedState";
  id v191 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"inTrash" andType:100 requiresConversion:1 info:0];
  v224[10] = v191;
  v223[11] = @"trashedReason";
  v190 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[11] = v190;
  v223[12] = @"dateCreated";
  v189 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[12] = v189;
  v223[13] = @"addedDate";
  id v188 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[13] = v188;
  v223[14] = @"locationData";
  long long v187 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[14] = v187;
  v223[15] = @"mediaGroupUUID";
  long long v186 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[15] = v186;
  v223[16] = @"videoCpVisibilityState";
  long long v185 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"videoCpVisibility" andType:100 info:0];
  v224[16] = v185;
  v223[17] = @"videoCpDurationValue";
  long long v184 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"videoCpDuration" andType:300 info:0];
  v224[17] = v184;
  v223[18] = @"currentSleetCast";
  v183 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[18] = v183;
  v223[19] = @"hdrType";
  id v182 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"customRenderedValue" andType:100 info:0];
  v224[19] = v182;
  v223[20] = @"spatialType";
  v181 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[20] = v181;
  v223[21] = @"depthType";
  v180 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"depthStates" andType:100 info:0];
  v224[21] = v180;
  v223[22] = @"duration";
  v179 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"duration" andType:500 info:0];
  v224[22] = v179;
  v223[23] = @"adjustmentsState";
  id v178 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[23] = v178;
  v223[24] = @"hdrGain";
  id v177 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[24] = v177;
  v223[25] = @"height";
  v176 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[25] = v176;
  v223[26] = @"kind";
  v175 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[26] = v175;
  v223[27] = @"kindSubtype";
  objc_super v174 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[27] = v174;
  v223[28] = @"lastSharedDate";
  objc_super v173 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[28] = v173;
  v223[29] = @"latitude";
  objc_super v172 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"latitude" andType:500 info:0];
  v224[29] = v172;
  v223[30] = @"longitude";
  objc_super v171 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"longitude" andType:500 info:0];
  v224[30] = v171;
  v223[31] = @"modificationDate";
  objc_super v170 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[31] = v170;
  v223[32] = @"orientation";
  objc_super v169 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[32] = v169;
  v223[33] = @"originalColorSpace";
  objc_super v168 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[33] = v168;
  v223[34] = @"playbackStyle";
  objc_super v167 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[34] = v167;
  v223[35] = @"playbackVariation";
  objc_super v166 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[35] = v166;
  v223[36] = @"sortToken";
  v165 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[36] = v165;
  v223[37] = @"uniformTypeIdentifier";
  v164 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"uti" andType:700 info:0];
  v224[37] = v164;
  v223[38] = @"visibilityState";
  id v163 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[38] = v163;
  v223[39] = @"width";
  v162 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[39] = v162;
  v223[40] = @"deferredProcessingNeeded";
  id v161 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[40] = v161;
  v223[41] = @"cameraProcessingAdjustmentState";
  id v160 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"snowplowState" andType:100 info:0];
  v224[41] = v160;
  v223[42] = @"highFrameRateState";
  id v159 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[42] = v159;
  v223[43] = @"isMagicCarpet";
  id v158 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[43] = v158;
  v223[44] = @"libraryScopeShareState";
  id v157 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v224[44] = v157;
  v223[45] = @"master";
  v148 = +[PLCloudMaster entityName];
  v221[0] = @"cloudMasterGUID";
  id v156 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v222[0] = v156;
  v221[1] = @"uniformTypeIdentifier";
  v155 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"originalUTI" andType:700 info:0];
  v222[1] = v155;
  v221[2] = @"creationDate";
  v154 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v222[2] = v154;
  v221[3] = @"importDate";
  v153 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v222[3] = v153;
  v221[4] = @"mediaMetadataType";
  id v152 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v222[4] = v152;
  v221[5] = @"importSessionID";
  v151 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v222[5] = v151;
  v221[6] = @"fullSizeJPEGSource";
  v150 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v222[6] = v150;
  v221[7] = @"mediaMetadata";
  id v147 = +[PLCloudMasterMediaMetadata entityName];
  v219 = @"data";
  v149 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"mediaMetadata" andType:1000 info:0];
  v220 = v149;
  v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v220 forKeys:&v219 count:1];
  v145 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v146 subRelationshipEntityName:v147 isToMany:0 isAdditionalEntityName:1 info:0];
  v222[7] = v145;
  v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v222 forKeys:v221 count:8];
  v143 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"master" subRelationshipProperties:v144 subRelationshipEntityName:v148 isToMany:0 isAdditionalEntityName:1 info:0];
  v224[45] = v143;
  v223[46] = @"modernResources";
  v125 = +[PLInternalResource entityName];
  v217[0] = @"resourceType";
  v142 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"type" andType:200 info:0];
  v218[0] = v142;
  v217[1] = @"version";
  v141 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v218[1] = v141;
  v217[2] = @"recipeID";
  v140 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v218[2] = v140;
  v217[3] = @"dataStoreSubtype";
  uint64_t v139 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"subType" andType:300 info:0];
  v218[3] = v139;
  v217[4] = @"unorientedWidth";
  v138 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"uwidth" andType:300 info:0];
  v218[4] = v138;
  v217[5] = @"unorientedHeight";
  v137 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"uheight" andType:300 info:0];
  v218[5] = v137;
  v217[6] = @"dataLength";
  v136 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"length" andType:300 info:0];
  v218[6] = v136;
  v217[7] = @"fingerprint";
  v135 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v218[7] = v135;
  v217[8] = @"stableHash";
  v134 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v218[8] = v134;
  v217[9] = @"sidecarIndex";
  v133 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v218[9] = v133;
  v217[10] = @"ptpTrashedState";
  v132 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"ptpTrashedState" andType:300 info:0];
  v218[10] = v132;
  v217[11] = @"trashedState";
  v131 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"inTrash" andType:100 requiresConversion:1 info:0];
  v218[11] = v131;
  v217[12] = @"remoteAvailability";
  v130 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v218[12] = v130;
  v217[13] = @"cloudLocalState";
  v129 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v218[13] = v129;
  v217[14] = @"compactUTI";
  v128 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"uti" andType:700 requiresConversion:1 info:0];
  v218[14] = v128;
  v217[15] = @"codecFourCharCodeName";
  v127 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"codec" andType:700 info:0];
  v218[15] = v127;
  v217[16] = @"fileSystemVolume";
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  unsigned __int16 v126 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"volume" relatedEntityPropertyNames:v2 shouldPrefetchRelationship:1];

  v218[16] = v126;
  v217[17] = @"fileSystemBookmark";
  v122 = +[PLFileSystemBookmark entityName];
  v215[0] = @"bookmarkData";
  v124 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v216[0] = v124;
  v215[1] = @"pathRelativeToVolume";
  v123 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"bookmarkPath" andType:700 info:0];
  v216[1] = v123;
  v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v216 forKeys:v215 count:2];
  id v120 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"bookmark" subRelationshipProperties:v121 subRelationshipEntityName:v122 isToMany:0 isAdditionalEntityName:1 info:0];
  v218[17] = v120;
  v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v218 forKeys:v217 count:18];
  v118 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"resources" subRelationshipProperties:v119 subRelationshipEntityName:v125 isToMany:1 isAdditionalEntityName:1 info:0];
  v224[46] = v118;
  v223[47] = @"extendedAttributes";
  id v89 = +[PLExtendedAttributes entityName];
  v213[0] = @"aperture";
  BOOL v117 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exAperture" andType:500 info:0];
  v214[0] = v117;
  v213[1] = @"bitrate";
  v116 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exBitrate" andType:500 info:0];
  v214[1] = v116;
  v213[2] = @"cameraModel";
  uint64_t v115 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exCameraModel" andType:700 info:0];
  v214[2] = v115;
  v213[3] = @"cameraMake";
  v114 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exCameraMake" andType:700 info:0];
  v214[3] = v114;
  v213[4] = @"codec";
  float v113 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exCodec" andType:700 info:0];
  v214[4] = v113;
  v213[5] = @"credit";
  v112 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exCredit" andType:700 info:0];
  v214[5] = v112;
  v213[6] = @"dateCreated";
  v111 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exDateCreated" andType:900 info:0];
  v214[6] = v111;
  v213[7] = @"duration";
  v110 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exDuration" andType:500 info:0];
  v214[7] = v110;
  v213[8] = @"exposureBias";
  v109 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exExposureBias" andType:500 info:0];
  v214[8] = v109;
  v213[9] = @"flashFired";
  v108 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exFlashFired" andType:800 info:0];
  v214[9] = v108;
  v213[10] = @"focalLength";
  v107 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exFocalLength" andType:500 info:0];
  v214[10] = v107;
  v213[11] = @"focalLengthIn35mm";
  v106 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exFocalLengthIn35mm" andType:300 info:0];
  v214[11] = v106;
  v213[12] = @"fps";
  double v105 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exFps" andType:500 info:0];
  v214[12] = v105;
  v213[13] = @"generativeAIType";
  v104 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exGenerativeAIType" andType:200 info:0];
  v214[13] = v104;
  v213[14] = @"iso";
  double v103 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exIso" andType:300 info:0];
  v214[14] = v103;
  v213[15] = @"lensModel";
  v102 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exLensModel" andType:700 info:0];
  v214[15] = v102;
  v213[16] = @"meteringMode";
  v101 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exMeteringMode" andType:300 info:0];
  v214[16] = v101;
  v213[17] = @"sampleRate";
  v100 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exSampleRate" andType:300 info:0];
  v214[17] = v100;
  v213[18] = @"shutterSpeed";
  v99 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exShutterSpeed" andType:500 info:0];
  v214[18] = v99;
  v213[19] = @"trackFormat";
  uint64_t v98 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exTrackFormat" andType:300 info:0];
  v214[19] = v98;
  v213[20] = @"whiteBalance";
  id v97 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exWhiteBalance" andType:300 info:0];
  v214[20] = v97;
  v213[21] = @"latitude";
  v96 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exLatitude" andType:500 info:0];
  v214[21] = v96;
  v213[22] = @"longitude";
  v95 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exLongitude" andType:500 info:0];
  v214[22] = v95;
  v213[23] = @"slushSceneBias";
  unint64_t v94 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v214[23] = v94;
  v213[24] = @"slushWarmthBias";
  v93 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v214[24] = v93;
  v213[25] = @"slushVersion";
  v92 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v214[25] = v92;
  v213[26] = @"slushPreset";
  v91 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v214[26] = v91;
  v213[27] = @"timezoneName";
  v90 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exTimezoneName" andType:700 info:0];
  v214[27] = v90;
  v213[28] = @"timezoneOffset";
  v88 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exTimezoneOffset" andType:200 info:0];
  v214[28] = v88;
  v213[29] = @"digitalZoomRatio";
  v87 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exDigitalZoomRatio" andType:500 info:0];
  v214[29] = v87;
  v213[30] = @"orientation";
  v86 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exOrientation" andType:100 info:0];
  v214[30] = v86;
  v213[31] = @"sleetCast";
  v85 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exSleetCast" andType:100 info:0];
  v214[31] = v85;
  v213[32] = @"sleetToneBias";
  v84 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exSleetToneBias" andType:500 info:0];
  v214[32] = v84;
  v213[33] = @"sleetColorBias";
  v83 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exSleetColorBias" andType:500 info:0];
  v214[33] = v83;
  v213[34] = @"sleetIntensity";
  v82 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exSleetIntensity" andType:500 info:0];
  v214[34] = v82;
  v213[35] = @"sleetRenderingVersion";
  v81 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"exSleetRenderingVersion" andType:100 info:0];
  v214[35] = v81;
  v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v214 forKeys:v213 count:36];
  v79 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"extendedAttributes" subRelationshipProperties:v80 subRelationshipEntityName:v89 isToMany:0 isAdditionalEntityName:1 info:0];
  v224[47] = v79;
  v223[48] = @"additionalAttributes";
  uint64_t v202 = +[PLAdditionalAssetAttributes entityName];
  v211[0] = @"importedByBundleIdentifier";
  id v78 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"creatorBundleID" andType:700 info:0];
  v212[0] = v78;
  v211[1] = @"importedByDisplayName";
  v77 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[1] = v77;
  v211[2] = @"originalAssetsUUID";
  v76 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"originalAssetUUID" andType:700 info:0];
  v212[2] = v76;
  v211[3] = @"publicGlobalUUID";
  v75 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[3] = v75;
  v211[4] = @"title";
  v74 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[4] = v74;
  v211[5] = @"accessibilityDescription";
  v73 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[5] = v73;
  v211[6] = @"timeZoneName";
  v72 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[6] = v72;
  v211[7] = @"timeZoneOffset";
  v71 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[7] = v71;
  v211[8] = @"originalFilename";
  uint64_t v70 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[8] = v70;
  v211[9] = @"placeAnnotationData";
  v69 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[9] = v69;
  v211[10] = @"videoCpDurationTimescale";
  uint64_t v68 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[10] = v68;
  v211[11] = @"videoCpDisplayValue";
  v67 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[11] = v67;
  v211[12] = @"videoCpDisplayTimescale";
  v66 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[12] = v66;
  v211[13] = @"importedBy";
  uint64_t v65 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[13] = v65;
  v211[14] = @"cameraCaptureDevice";
  uint64_t v64 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[14] = v64;
  v211[15] = @"alternateImportImageDate";
  uint64_t v63 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[15] = v63;
  v211[16] = @"editorBundleID";
  v62 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[16] = v62;
  v211[17] = @"embeddedThumbnailHeight";
  v61 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[17] = v61;
  v211[18] = @"embeddedThumbnailLength";
  id v60 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[18] = v60;
  v211[19] = @"embeddedThumbnailOffset";
  __int16 v59 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[19] = v59;
  v211[20] = @"embeddedThumbnailWidth";
  v58 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[20] = v58;
  v211[21] = @"exifTimestampString";
  v57 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[21] = v57;
  v211[22] = @"montage";
  v56 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[22] = v56;
  v211[23] = @"originalFilesize";
  v55 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[23] = v55;
  v211[24] = @"originalHeight";
  v54 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[24] = v54;
  v211[25] = @"originalOrientation";
  v53 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[25] = v53;
  v211[26] = @"originalResourceChoice";
  v52 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[26] = v52;
  v211[27] = @"originalWidth";
  v51 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[27] = v51;
  v211[28] = @"sleetIsReversible";
  v50 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[28] = v50;
  v211[29] = @"originatingAssetIdentifier";
  v49 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[29] = v49;
  v211[30] = @"ptpTrashedState";
  long long v48 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"ptpTrashedState" andType:300 info:0];
  v212[30] = v48;
  v211[31] = @"shareOriginator";
  long long v47 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[31] = v47;
  v211[32] = @"shareType";
  long long v46 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[32] = v46;
  v211[33] = @"playCount";
  long long v45 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[33] = v45;
  v211[34] = @"shareCount";
  objc_super v44 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[34] = v44;
  v211[35] = @"viewCount";
  objc_super v43 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[35] = v43;
  v211[36] = @"lastViewedDate";
  objc_super v42 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[36] = v42;
  v211[37] = @"deferredPhotoIdentifier";
  objc_super v41 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"snowdayIdentifier" andType:700 info:0];
  v212[37] = v41;
  v211[38] = @"mediaMetadataType";
  id v40 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"assetMediaMetadataType" andType:700 info:0];
  v212[38] = v40;
  v211[39] = @"photoStreamTagId";
  uint64_t v39 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[39] = v39;
  v211[40] = @"originalHash";
  v38 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[40] = v38;
  v211[41] = @"spatialOverCaptureGroupIdentifier";
  id v37 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"snowplowGroupUUID" andType:700 info:0];
  v212[41] = v37;
  v211[42] = @"syndicationIdentifier";
  id v36 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[42] = v36;
  v211[43] = @"syndicationHistory";
  uint64_t v35 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[43] = v35;
  v211[44] = @"libraryScopeAssetContributorsToUpdate";
  id v34 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[44] = v34;
  v211[45] = @"dateCreatedSource";
  uint64_t v33 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[45] = v33;
  v211[46] = @"viewPresentation";
  objc_super v32 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v212[46] = v32;
  v211[47] = @"keywords";
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"uuid"];
  id v31 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"keywords" relatedEntityPropertyNames:v3 shouldPrefetchRelationship:1];

  v212[47] = v31;
  v211[48] = @"assetDescription";
  unsigned int v29 = +[PLAssetDescription entityName];
  v209 = @"longDescription";
  BOOL v30 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"description" andType:700 info:0];
  v210 = v30;
  double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v210 forKeys:&v209 count:1];
  BOOL v27 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"assetDescription" subRelationshipProperties:v28 subRelationshipEntityName:v29 isToMany:0 isAdditionalEntityName:1 info:0];
  v212[48] = v27;
  v211[49] = @"unmanagedAdjustment";
  uint64_t v19 = +[PLUnmanagedAdjustment entityName];
  v207[0] = @"adjustmentBaseImageFormat";
  objc_super v26 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[0] = v26;
  v207[1] = @"adjustmentFormatIdentifier";
  objc_super v25 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[1] = v25;
  v207[2] = @"adjustmentFormatVersion";
  objc_super v24 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[2] = v24;
  v207[3] = @"adjustmentRenderTypes";
  uint64_t v23 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[3] = v23;
  v207[4] = @"adjustmentTimestamp";
  uint64_t v22 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[4] = v22;
  v207[5] = @"editorLocalizedName";
  long long v21 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[5] = v21;
  v207[6] = @"otherAdjustmentsFingerprint";
  long long v20 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[6] = v20;
  v207[7] = @"similarToOriginalAdjustmentsFingerprint";
  long long v18 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v208[7] = v18;
  objc_super v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v208 forKeys:v207 count:8];
  id v16 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"unmanagedAdjustment" subRelationshipProperties:v17 subRelationshipEntityName:v19 isToMany:0 isAdditionalEntityName:1 info:0];
  v212[49] = v16;
  v211[50] = @"mediaMetadata";
  objc_super v15 = +[PLCloudMasterMediaMetadata entityName];
  v205 = @"data";
  uint64_t v4 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"assetMediaMetadata" andType:1000 info:0];
  v206 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v206 forKeys:&v205 count:1];
  id v6 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"assetMediaMetadataRelationship" subRelationshipProperties:v5 subRelationshipEntityName:v15 isToMany:0 isAdditionalEntityName:1 info:0];
  v212[50] = v6;
  v211[51] = @"editedIPTCAttributes";
  id v7 = +[PLEditedIPTCAttributes entityName];
  v203 = @"data";
  int v8 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"iptcData" andType:1000 info:0];
  v204 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v204 forKeys:&v203 count:1];
  char v10 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:@"editedIPTCAttributes" subRelationshipProperties:v9 subRelationshipEntityName:v7 isToMany:0 isAdditionalEntityName:1 info:0];
  v212[51] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v212 forKeys:v211 count:52];
  BOOL v12 = +[PLJournalEntryPayloadProperty payloadPropertyWithKey:0 subRelationshipProperties:v11 subRelationshipEntityName:v202 isToMany:0 isAdditionalEntityName:1 info:0];
  v224[48] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v224 forKeys:v223 count:49];

  return v13;
}

- (void)_fixSleetIsReversibleWithAdditionalAssetAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 asset];
  id v14 = [v5 pathManager];

  objc_opt_class();
  id v6 = [v4 managedObjectContext];

  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = objc_msgSend(v8, "pl_libraryBundle");
  char v10 = [v9 timeZoneLookup];

  [(PLAssetJournalEntryPayload *)self setSleetIsReversible:0];
  uint64_t v11 = 0;
  if ([(PLAssetJournalEntryPayload *)self isImage])
  {
    BOOL v12 = [(PLAssetJournalEntryPayload *)self _loadOriginalImageMetadataWithPathManager:v14 timezoneLookup:v10];
    uint64_t v11 = v12;
    if (v12)
    {
      id v13 = [v12 smartStyleIsReversible];

      if (v13) {
        [(PLAssetJournalEntryPayload *)self setSleetIsReversible:1];
      }
    }
  }
}

- (void)_fixDateCreatedSourceWithAdditionalAssetAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 asset];
  id v14 = [v5 pathManager];

  objc_opt_class();
  id v6 = [v4 managedObjectContext];

  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = objc_msgSend(v8, "pl_libraryBundle");
  char v10 = [v9 timeZoneLookup];

  if ([(PLAssetJournalEntryPayload *)self isImage])
  {
    uint64_t v11 = [(PLAssetJournalEntryPayload *)self _loadOriginalImageMetadataWithPathManager:v14 timezoneLookup:v10];
  }
  else
  {
    if (![(PLAssetJournalEntryPayload *)self isVideo]) {
      goto LABEL_10;
    }
    uint64_t v11 = [(PLAssetJournalEntryPayload *)self _loadOriginalVideoMetadataWithPathManager:v14 timezoneLookup:v10];
  }
  BOOL v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 creationDateSource];

    goto LABEL_11;
  }
LABEL_10:
  uint64_t v13 = 0;
LABEL_11:
  [(PLAssetJournalEntryPayload *)self setDateCreatedSource:v13];
}

- (void)_filterNonPersistedResources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PLAssetJournalEntryPayload *)self resources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isValidForPersistence])
        {
          char v10 = [v9 payloadAttributes];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->super._payloadAttributes setObject:v3 forKeyedSubscript:@"resources"];
}

- (void)_convertCustomRenderedValueToHDRType
{
  id v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"customRenderedValue"];
  if ([(PLAssetJournalEntryPayload *)self isImage]
    && ([&unk_1EEBF21F8 containsObject:v3] & 1) == 0)
  {
    [(NSMutableDictionary *)self->super._payloadAttributes setObject:&unk_1EEBEFBD0 forKeyedSubscript:@"customRenderedValue"];
  }
}

- (void)_convertDepthStatesToDepthType
{
  id v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"customRenderedValue"];
  int v4 = [v3 intValue];

  uint64_t v5 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"depthStates"];
  __int16 v6 = [v5 unsignedIntValue];

  if (v6 == 2 || v4 << 16 == 458752 || (v4 << 16 != 0x80000 ? (BOOL v7 = v6 == 3) : (BOOL v7 = 1), v7))
  {
    payloadAttributes = self->super._payloadAttributes;
    [(NSMutableDictionary *)payloadAttributes setObject:&unk_1EEBEFBB8 forKeyedSubscript:@"depthStates"];
  }
}

- (void)_fixHDRGainZeroValueToNULL
{
  id v3 = [(PLAssetJournalEntryPayload *)self hdrGain];
  if (v3 && PLNumberIsEqual(v3, &unk_1EEBF2710)) {
    [(NSMutableDictionary *)self->super._payloadAttributes removeObjectForKey:@"hdrGain"];
  }
  MEMORY[0x1F4181820]();
}

- (void)_fixResourceTypeUnknownValues
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v13 = self;
  int v4 = [(PLAssetJournalEntryPayload *)self resources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 resourceType] == 32)
        {
          id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
          long long v11 = [v9 payloadAttributes];
          long long v12 = (void *)[v10 initWithDictionary:v11];

          [v12 setObject:&unk_1EEBEFBA0 forKeyedSubscript:@"type"];
        }
        else
        {
          long long v12 = [v9 payloadAttributes];
        }
        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)v13->super._payloadAttributes setObject:v3 forKeyedSubscript:@"resources"];
}

- (void)_fixXMPSidecarUTI
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v21 = self;
  int v4 = [(PLAssetJournalEntryPayload *)self resources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    uint64_t v22 = (void *)*MEMORY[0x1E4F44378];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v9 resourceType] != 5)
        {
          long long v12 = [v9 payloadAttributes];
          [v3 addObject:v12];
          goto LABEL_16;
        }
        id v10 = (void *)MEMORY[0x1E4F8CDF8];
        long long v11 = [v9 uniformTypeIdentifierString];
        long long v12 = [v10 typeWithIdentifier:v11];

        if ([v12 isDynamic])
        {
          id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
          long long v14 = [v9 payloadAttributes];
          long long v15 = (void *)[v13 initWithDictionary:v14];

          long long v16 = [v22 identifier];
          [v15 setObject:v16 forKeyedSubscript:@"uti"];
        }
        else
        {
          long long v17 = [MEMORY[0x1E4F8CDF8] supplementalResourceAAEType];
          if (![v12 isEqual:v17])
          {

LABEL_14:
            long long v15 = [v9 payloadAttributes];
            goto LABEL_15;
          }
          uint64_t v18 = [v9 cplType];

          if (v18 == 22) {
            goto LABEL_14;
          }
          id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
          long long v20 = [v9 payloadAttributes];
          long long v15 = (void *)[v19 initWithDictionary:v20];

          [v15 setObject:&unk_1EEBEFB88 forKeyedSubscript:@"subType"];
        }
LABEL_15:
        [v3 addObject:v15];

LABEL_16:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)v21->super._payloadAttributes setObject:v3 forKeyedSubscript:@"resources"];
}

- (void)_fixLocationData
{
  id v13 = [(PLAssetJournalEntryPayload *)self extendedAttributesLatitude];
  id v3 = [(PLAssetJournalEntryPayload *)self locationData];

  int v4 = v13;
  if (!v3 && v13)
  {
    uint64_t v5 = [(PLAssetJournalEntryPayload *)self extendedAttributesLongitude];
    if (v5)
    {
      [v13 doubleValue];
      CLLocationDegrees v7 = v6;
      [v5 doubleValue];
      CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(v7, v8);
      if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        long long v11 = [(PLAssetJournalEntryPayload *)self dateCreated];
        long long v12 = objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v11, v9.latitude, v9.longitude, 0.0, 0.0, 0.0);
      }
      else
      {
        long long v12 = 0;
      }
      [(PLAssetJournalEntryPayload *)self setLocation:v12];
    }
    int v4 = v13;
  }
}

- (void)_fixAdjustedAssetUTI
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(PLAssetJournalEntryPayload *)self hasAdjustments])
  {
    if ([(PLAssetJournalEntryPayload *)self isImage])
    {
      id v14 = [(id)*MEMORY[0x1E4F44410] identifier];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:");
    }
    else if ([(PLAssetJournalEntryPayload *)self isVideo])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v3 = [(PLAssetJournalEntryPayload *)self resources];
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v16 != v6) {
              objc_enumerationMutation(v3);
            }
            CLLocationDegrees v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (![v8 dataStoreClassID]
              && [v8 version] == 2
              && [v8 cplType] == 16)
            {
              id v10 = [v8 uniformTypeIdentifierString];
              CLLocationCoordinate2D v9 = (void *)*MEMORY[0x1E4F44490];
              long long v11 = [(id)*MEMORY[0x1E4F44490] identifier];
              char v12 = [v10 isEqualToString:v11];

              if ((v12 & 1) == 0) {
                [(NSMutableDictionary *)self->super._payloadAttributes setObject:&unk_1EEBEFB58 forKeyedSubscript:@"deferredProcessingNeeded"];
              }

              goto LABEL_21;
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }

      CLLocationCoordinate2D v9 = (void *)*MEMORY[0x1E4F44490];
LABEL_21:
      id v13 = [v9 identifier];
      [(NSMutableDictionary *)self->super._payloadAttributes setObject:v13 forKeyedSubscript:@"uti"];
    }
  }
}

- (void)_convertHasAdjustmentsToAdjustmentsState
{
  id v3 = [(NSMutableDictionary *)self->super._payloadAttributes objectForKeyedSubscript:@"hasAdjustments"];
  if (v3)
  {
    id v9 = v3;
    int v4 = [v3 BOOLValue];
    payloadAttributes = self->super._payloadAttributes;
    if (v4)
    {
      uint64_t v6 = [(NSMutableDictionary *)payloadAttributes objectForKeyedSubscript:@"adjustmentRenderTypes"];
      int v7 = [v6 unsignedIntegerValue];

      if ((v7 & 0x2000) != 0)
      {
        payloadAttributes = self->super._payloadAttributes;
        CLLocationDegrees v8 = &unk_1EEBEFB40;
      }
      else
      {
        payloadAttributes = self->super._payloadAttributes;
        if (v7) {
          CLLocationDegrees v8 = &unk_1EEBEFB58;
        }
        else {
          CLLocationDegrees v8 = &unk_1EEBEFB28;
        }
      }
    }
    else
    {
      CLLocationDegrees v8 = &unk_1EEBEFB70;
    }
    [(NSMutableDictionary *)payloadAttributes setObject:v8 forKeyedSubscript:@"adjustmentsState"];
    id v3 = v9;
  }
}

@end