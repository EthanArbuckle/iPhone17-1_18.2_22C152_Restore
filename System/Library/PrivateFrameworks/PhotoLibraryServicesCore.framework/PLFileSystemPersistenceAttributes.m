@interface PLFileSystemPersistenceAttributes
- (BOOL)getInt32:(int *)a3 forKey:(id)a4;
- (BOOL)getUInt16:(unsigned __int16 *)a3 forKey:(id)a4;
- (BOOL)getUInt64:(unint64_t *)a3 forKey:(id)a4;
- (PLFileSystemPersistenceAttributes)initWithAttributes:(id)a3 unknownAttributes:(id)a4;
- (id)UUIDStringForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)description;
- (id)stringForKey:(id)a3;
- (void)dealloc;
@end

@implementation PLFileSystemPersistenceAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownAttributes, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v98.receiver = self;
  v98.super_class = (Class)PLFileSystemPersistenceAttributes;
  v4 = [(PLFileSystemPersistenceAttributes *)&v98 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(PLFileSystemPersistenceAttributes *)self UUIDStringForKey:@"com.apple.assetsd.UUID"];
  v7 = (void *)v6;
  if (v6) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.UUID", v6];
  }
  unsigned __int16 v97 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v97 forKey:@"com.apple.assetsd.assetType"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.assetType", v97];
  }
  uint64_t v8 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.creatorBundleID"];
  v9 = (void *)v8;
  if (v8) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.creatorBundleID", v8];
  }
  uint64_t v10 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.importedByDisplayName"];
  v11 = (void *)v10;
  if (v10) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.importedByDisplayName", v10];
  }
  uint64_t v12 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.dbRebuildUuid"];
  v13 = (void *)v12;
  if (v12) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.dbRebuildUuid", v12];
  }
  unsigned __int16 v96 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v96 forKey:@"com.apple.assetsd.dbRebuildInProgress"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.dbRebuildInProgress", v96];
  }
  uint64_t v14 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.cloudAsset.UUID"];
  v15 = (void *)v14;
  if (v14) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.cloudAsset.UUID", v14];
  }
  unsigned __int16 v95 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v95 forKey:@"com.apple.assetsd.cloudAsset.placeholderKind"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.cloudAsset.placeholderKind", v95];
  }
  unsigned __int16 v94 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v94 forKey:@"com.apple.assetsd.inProgress.publishable"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.inProgress.publishable", v94];
  }
  v69 = v15;
  uint64_t v16 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.inProgress.destinationPath"];
  v17 = (void *)v16;
  if (v16) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.inProgress.destinationPath", v16];
  }
  v68 = v17;
  v18 = [(PLFileSystemPersistenceAttributes *)self dataForKey:@"com.apple.assetsd.inProgress.cameraAdjustmentsData"];
  v19 = v18;
  if (v18) {
    [v5 appendFormat:@"\n %@ -> %lu bytes", @"com.apple.assetsd.inProgress.cameraAdjustmentsData", objc_msgSend(v18, "length")];
  }
  uint64_t v20 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.inProgress.filteredPreviewImagePath"];
  v21 = (void *)v20;
  if (v20) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.inProgress.filteredPreviewImagePath", v20];
  }
  v66 = v21;
  unsigned __int16 v93 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v93 forKey:@"com.apple.assetsd.cloudJobRecoveryCount"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.cloudJobRecoveryCount", v93];
  }
  uint64_t v22 = [(PLFileSystemPersistenceAttributes *)self UUIDStringForKey:@"com.apple.assetsd.avalanche.UUID"];
  v23 = (void *)v22;
  if (v22) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.avalanche.UUID", v22];
  }
  unsigned __int16 v92 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v92 forKey:@"com.apple.assetsd.avalanche.type"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.avalanche.type", v92];
  }
  unsigned __int16 v91 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v91 forKey:@"com.apple.assetsd.hidden"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.hidden", v91];
  }
  unsigned __int16 v90 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v90 forKey:@"com.apple.assetsd.favorite"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.favorite", v90];
  }
  unsigned __int16 v89 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v89 forKey:@"com.apple.assetsd.trashed"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.trashed", v89];
  }
  v67 = v19;
  unsigned __int16 v88 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v88 forKey:@"com.apple.assetsd.deferredProcessing"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.deferredProcessing", v88];
  }
  uint64_t v24 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.publicGlobalUUID"];
  v25 = (void *)v24;
  if (v24) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.publicGlobalUUID", v24];
  }
  v64 = v25;
  uint64_t v26 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.title"];
  v27 = (void *)v26;
  if (v26) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.title", v26];
  }
  uint64_t v28 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.accessibilityDescription"];
  v29 = (void *)v28;
  if (v28) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.accessibilityDescription", v28];
  }
  v62 = v29;
  uint64_t v30 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.timeZoneName"];
  v31 = (void *)v30;
  if (v30) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.timeZoneName", v30];
  }
  v70 = v13;
  v71 = v11;
  v72 = v9;
  v73 = v7;
  unsigned int v87 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getInt32:&v87 forKey:@"com.apple.assetsd.timeZoneOffset"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.timeZoneOffset", v87];
  }
  v75 = [(PLFileSystemPersistenceAttributes *)self dataForKey:@"com.apple.assetsd.customCreationDate"];
  if (v75)
  {
    id v32 = [MEMORY[0x1E4F28F98] propertyListWithData:v75 options:0 format:0 error:0];

    if (v32)
    {
      v33 = PLMillisecondDateFormatter();
      v34 = [v33 stringFromDate:v32];
      [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.customCreationDate", v34];
    }
  }
  v35 = [(PLFileSystemPersistenceAttributes *)self dataForKey:@"com.apple.assetsd.customLocation"];
  v36 = v35;
  if (v35) {
    [v5 appendFormat:@"\n %@ -> %lu bytes", @"com.apple.assetsd.customLocation", objc_msgSend(v35, "length")];
  }
  v60 = v36;
  uint64_t v37 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.description"];
  v38 = (void *)v37;
  if (v37) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.description", v37];
  }
  v59 = v38;
  v74 = [(PLFileSystemPersistenceAttributes *)self dataForKey:@"com.apple.assetsd.addedDate"];
  if (v74)
  {
    id v39 = [MEMORY[0x1E4F28F98] propertyListWithData:v74 options:0 format:0 error:0];

    if (v39)
    {
      v40 = PLMillisecondDateFormatter();
      v41 = [v40 stringFromDate:v39];
      [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.addedDate", v41];
    }
  }
  uint64_t v42 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.originalFilename"];
  v43 = (void *)v42;
  if (v42) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.originalFilename", v42];
  }
  uint64_t v44 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.mediaGroupUUID"];
  v45 = (void *)v44;
  if (v44) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.mediaGroupUUID", v44];
  }
  uint64_t v46 = [(PLFileSystemPersistenceAttributes *)self dataForKey:@"com.apple.assetsd.extraDurationData"];
  v47 = (void *)v46;
  if (v46) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.extraDurationData", v46];
  }
  v63 = v27;
  unsigned __int16 v86 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v86 forKey:@"com.apple.assetsd.videoComplementVisibility"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.videoComplementVisibility", v86];
  }
  v48 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.placeAnnotationData"];
  v49 = v48;
  if (v48) {
    [v5 appendFormat:@"\n %@ -> %lu bytes", @"com.apple.assetsd.placeAnnotationData", objc_msgSend(v48, "length")];
  }
  v61 = v31;
  unsigned __int16 v85 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v85 forKey:@"com.apple.assetsd.importedBy"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.importedBy", v85];
  }
  v50 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.socGroupIdentifier"];
  v51 = v50;
  if (v50) {
    [v5 appendFormat:@"\n %@ -> %lu bytes", @"com.apple.assetsd.socGroupIdentifier", objc_msgSend(v50, "length")];
  }
  unsigned int v84 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getInt32:&v84 forKey:@"com.apple.assetsd.inProgress.semanticDevelopment"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.inProgress.semanticDevelopment", v84];
  }
  v65 = v23;
  uint64_t v52 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.syndicationIdentifier"];
  v53 = (void *)v52;
  if (v52) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.syndicationIdentifier", v52];
  }
  uint64_t v54 = [(PLFileSystemPersistenceAttributes *)self stringForKey:@"com.apple.assetsd.libraryScopeAssetContributorsToUpdate"];
  v55 = (void *)v54;
  if (v54) {
    [v5 appendFormat:@"\n %@ -> %@", @"com.apple.assetsd.libraryScopeAssetContributorsToUpdate", v54];
  }
  unsigned __int16 v83 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v83 forKey:@"com.apple.assetsd.syndicationHistory"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.syndicationHistory", v83];
  }
  unsigned __int16 v82 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v82 forKey:@"com.apple.assetsd.sceneAnalysisIsFromPreivew"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.sceneAnalysisIsFromPreivew", v82];
  }
  unsigned __int16 v81 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v81 forKey:@"com.apple.assetsd.viewPresentation"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.viewPresentation", v81];
  }
  uint64_t v80 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt64:&v80 forKey:@"com.apple.assetsd.libraryScopeShareState"])
  {
    [v5 appendFormat:@"\n %@ -> %llu", @"com.apple.assetsd.libraryScopeShareState", v80];
  }
  unsigned __int16 v79 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v79 forKey:@"com.apple.assetsd.demoContent"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.demoContent", v79];
  }
  unsigned __int16 v78 = 0;
  if ([(PLFileSystemPersistenceAttributes *)self getUInt16:&v78 forKey:@"com.apple.assetsd.currentSleetCast"])
  {
    [v5 appendFormat:@"\n %@ -> %d", @"com.apple.assetsd.currentSleetCast", v78];
  }
  if ([(NSDictionary *)self->_unknownAttributes count])
  {
    [v5 appendString:@"\n--unknown attributes--"];
    unknownAttributes = self->_unknownAttributes;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __48__PLFileSystemPersistenceAttributes_description__block_invoke;
    v76[3] = &unk_1E58A1228;
    id v77 = v5;
    [(NSDictionary *)unknownAttributes enumerateKeysAndObjectsUsingBlock:v76];
  }
  id v57 = v5;

  return v57;
}

void __48__PLFileSystemPersistenceAttributes_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 appendFormat:@"\n %@ -> %lu bytes", v5, objc_msgSend(a3, "length")];
}

- (id)stringForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_attributes objectForKey:a3];
  v4 = v3;
  if (v3 && [v3 length])
  {
    char v7 = 0;
    [v4 getBytes:&v7 length:1];
    if (v7) {
      id v5 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
    }
    else {
      id v5 = @"\\0";
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)getUInt64:(unint64_t *)a3 forKey:(id)a4
{
  unint64_t v9 = 0;
  id v5 = [(PLFileSystemPersistenceAttributes *)self dataForKey:a4];
  uint64_t v6 = v5;
  if (v5 && [v5 length] == 8)
  {
    [v6 getBytes:&v9 length:8];
    *a3 = v9;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)getInt32:(int *)a3 forKey:(id)a4
{
  int v9 = 0;
  id v5 = [(PLFileSystemPersistenceAttributes *)self dataForKey:a4];
  uint64_t v6 = v5;
  if (v5 && [v5 length] == 4)
  {
    [v6 getBytes:&v9 length:4];
    *a3 = v9;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)getUInt16:(unsigned __int16 *)a3 forKey:(id)a4
{
  unsigned __int16 v9 = 0;
  id v5 = [(PLFileSystemPersistenceAttributes *)self dataForKey:a4];
  uint64_t v6 = v5;
  if (v5 && [v5 length] == 2)
  {
    [v6 getBytes:&v9 length:2];
    *a3 = v9;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)UUIDStringForKey:(id)a3
{
  v3 = [(PLFileSystemPersistenceAttributes *)self dataForKey:a3];
  v4 = PLStringFromUUIDData(v3);

  return v4;
}

- (id)dataForKey:(id)a3
{
  return [(NSDictionary *)self->_attributes objectForKey:a3];
}

- (void)dealloc
{
  attributes = self->_attributes;
  self->_attributes = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLFileSystemPersistenceAttributes;
  [(PLFileSystemPersistenceAttributes *)&v4 dealloc];
}

- (PLFileSystemPersistenceAttributes)initWithAttributes:(id)a3 unknownAttributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLFileSystemPersistenceAttributes;
  unsigned __int16 v9 = [(PLFileSystemPersistenceAttributes *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributes, a3);
    objc_storeStrong((id *)&v10->_unknownAttributes, a4);
  }

  return v10;
}

@end