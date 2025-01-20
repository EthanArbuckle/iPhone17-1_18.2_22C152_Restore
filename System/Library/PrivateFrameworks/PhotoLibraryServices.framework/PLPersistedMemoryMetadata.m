@interface PLPersistedMemoryMetadata
+ (BOOL)isValidPath:(id)a3;
- (BOOL)_readMetadata;
- (BOOL)_updateAssetsInMemory:(id)a3 relationshipName:(id)a4 persistedAssetUUIDs:(id)a5 includePendingChanges:(BOOL)a6;
- (BOOL)_updateAssetsInMemory:(id)a3 relationshipName:(id)a4 persistedOrderedAssetUUIDs:(id)a5 includePendingChanges:(BOOL)a6;
- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4;
- (BOOL)isFavorite;
- (BOOL)isObsolete;
- (BOOL)isRejected;
- (BOOL)updateAssetsInMemory:(id)a3 includePendingAssetChanges:(BOOL)a4;
- (NSArray)userFeedbacksDictionaryArray;
- (NSData)assetListPredicate;
- (NSData)blacklistedFeature;
- (NSData)movieData;
- (NSData)photosGraphData;
- (NSDate)creationDate;
- (NSDictionary)movieAssetState;
- (NSOrderedSet)customUserAssetUUIDs;
- (NSSet)curatedAssetUUIDs;
- (NSSet)extendedCuratedAssetUUIDs;
- (NSSet)movieCuratedAssetUUIDs;
- (NSSet)representativeAssetUUIDs;
- (NSSet)userCuratedAssetUUIDs;
- (NSSet)userFeedbacks;
- (NSSet)userRemovedAssetUUIDs;
- (NSString)keyAssetUUID;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uuid;
- (NSURL)metadataURL;
- (PLMemory)memory;
- (PLPersistedMemoryMetadata)init;
- (PLPersistedMemoryMetadata)initWithPLMemory:(id)a3 metadataURL:(id)a4;
- (PLPersistedMemoryMetadata)initWithPLMemory:(id)a3 pathManager:(id)a4;
- (PLPersistedMemoryMetadata)initWithPersistedDataAtURL:(id)a3;
- (double)score;
- (id)_metadataData;
- (id)description;
- (id)insertMemoryFromDataInManagedObjectContext:(id)a3;
- (int64_t)pendingPlayCount;
- (int64_t)pendingShareCount;
- (int64_t)pendingViewCount;
- (int64_t)photosGraphVersion;
- (int64_t)playCount;
- (int64_t)shareCount;
- (int64_t)version;
- (int64_t)viewCount;
- (signed)category;
- (signed)creationType;
- (signed)featuredState;
- (signed)notificationState;
- (signed)pendingState;
- (signed)subcategory;
- (signed)userActionOptions;
- (void)_saveMetadata;
- (void)removePersistedData;
- (void)setAssetListPredicate:(id)a3;
- (void)setBlacklistedFeature:(id)a3;
- (void)setCategory:(signed __int16)a3;
- (void)setCreationDate:(id)a3;
- (void)setCreationType:(signed __int16)a3;
- (void)setCuratedAssetUUIDs:(id)a3;
- (void)setCustomUserAssetUUIDs:(id)a3;
- (void)setExtendedCuratedAssetUUIDs:(id)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setFeaturedState:(signed __int16)a3;
- (void)setKeyAssetUUID:(id)a3;
- (void)setMemory:(id)a3;
- (void)setMetadataURL:(id)a3;
- (void)setMovieAssetState:(id)a3;
- (void)setMovieCuratedAssetUUIDs:(id)a3;
- (void)setMovieData:(id)a3;
- (void)setNotificationState:(signed __int16)a3;
- (void)setPendingPlayCount:(int64_t)a3;
- (void)setPendingShareCount:(int64_t)a3;
- (void)setPendingState:(signed __int16)a3;
- (void)setPendingViewCount:(int64_t)a3;
- (void)setPhotosGraphData:(id)a3;
- (void)setPhotosGraphVersion:(int64_t)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setRejected:(BOOL)a3;
- (void)setRepresentativeAssetUUIDs:(id)a3;
- (void)setScore:(double)a3;
- (void)setShareCount:(int64_t)a3;
- (void)setSubcategory:(signed __int16)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserActionOptions:(signed __int16)a3;
- (void)setUserCuratedAssetUUIDs:(id)a3;
- (void)setUserFeedbacks:(id)a3;
- (void)setUserFeedbacksDictionaryArray:(id)a3;
- (void)setUserRemovedAssetUUIDs:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)setViewCount:(int64_t)a3;
@end

@implementation PLPersistedMemoryMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_userFeedbacksDictionaryArray, 0);
  objc_storeStrong((id *)&self->_userFeedbacks, 0);
  objc_storeStrong((id *)&self->_blacklistedFeature, 0);
  objc_storeStrong((id *)&self->_assetListPredicate, 0);
  objc_storeStrong((id *)&self->_photosGraphData, 0);
  objc_storeStrong((id *)&self->_movieAssetState, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_customUserAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_userRemovedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_userCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_movieCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_curatedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_representativeAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_keyAssetUUID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setMetadataURL:(id)a3
{
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setMemory:(id)a3
{
}

- (PLMemory)memory
{
  return self->_memory;
}

- (void)setUserFeedbacksDictionaryArray:(id)a3
{
}

- (NSArray)userFeedbacksDictionaryArray
{
  return self->_userFeedbacksDictionaryArray;
}

- (void)setUserFeedbacks:(id)a3
{
}

- (NSSet)userFeedbacks
{
  return self->_userFeedbacks;
}

- (void)setFeaturedState:(signed __int16)a3
{
  self->_featuredState = a3;
}

- (signed)featuredState
{
  return self->_featuredState;
}

- (void)setPendingViewCount:(int64_t)a3
{
  self->_pendingViewCount = a3;
}

- (int64_t)pendingViewCount
{
  return self->_pendingViewCount;
}

- (void)setPendingShareCount:(int64_t)a3
{
  self->_pendingShareCount = a3;
}

- (int64_t)pendingShareCount
{
  return self->_pendingShareCount;
}

- (void)setPendingPlayCount:(int64_t)a3
{
  self->_pendingPlayCount = a3;
}

- (int64_t)pendingPlayCount
{
  return self->_pendingPlayCount;
}

- (void)setViewCount:(int64_t)a3
{
  self->_viewCount = a3;
}

- (int64_t)viewCount
{
  return self->_viewCount;
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setBlacklistedFeature:(id)a3
{
}

- (NSData)blacklistedFeature
{
  return self->_blacklistedFeature;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setNotificationState:(signed __int16)a3
{
  self->_notificationState = a3;
}

- (signed)notificationState
{
  return self->_notificationState;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setAssetListPredicate:(id)a3
{
}

- (NSData)assetListPredicate
{
  return self->_assetListPredicate;
}

- (void)setPhotosGraphData:(id)a3
{
}

- (NSData)photosGraphData
{
  return self->_photosGraphData;
}

- (void)setPhotosGraphVersion:(int64_t)a3
{
  self->_photosGraphVersion = a3;
}

- (int64_t)photosGraphVersion
{
  return self->_photosGraphVersion;
}

- (void)setMovieAssetState:(id)a3
{
}

- (NSDictionary)movieAssetState
{
  return self->_movieAssetState;
}

- (void)setMovieData:(id)a3
{
}

- (NSData)movieData
{
  return self->_movieData;
}

- (void)setCustomUserAssetUUIDs:(id)a3
{
}

- (NSOrderedSet)customUserAssetUUIDs
{
  return self->_customUserAssetUUIDs;
}

- (void)setUserRemovedAssetUUIDs:(id)a3
{
}

- (NSSet)userRemovedAssetUUIDs
{
  return self->_userRemovedAssetUUIDs;
}

- (void)setUserCuratedAssetUUIDs:(id)a3
{
}

- (NSSet)userCuratedAssetUUIDs
{
  return self->_userCuratedAssetUUIDs;
}

- (void)setMovieCuratedAssetUUIDs:(id)a3
{
}

- (NSSet)movieCuratedAssetUUIDs
{
  return self->_movieCuratedAssetUUIDs;
}

- (void)setExtendedCuratedAssetUUIDs:(id)a3
{
}

- (NSSet)extendedCuratedAssetUUIDs
{
  return self->_extendedCuratedAssetUUIDs;
}

- (void)setCuratedAssetUUIDs:(id)a3
{
}

- (NSSet)curatedAssetUUIDs
{
  return self->_curatedAssetUUIDs;
}

- (void)setRepresentativeAssetUUIDs:(id)a3
{
}

- (NSSet)representativeAssetUUIDs
{
  return self->_representativeAssetUUIDs;
}

- (void)setKeyAssetUUID:(id)a3
{
}

- (NSString)keyAssetUUID
{
  return self->_keyAssetUUID;
}

- (void)setSubcategory:(signed __int16)a3
{
  self->_subcategory = a3;
}

- (signed)subcategory
{
  return self->_subcategory;
}

- (void)setCategory:(signed __int16)a3
{
  self->_category = a3;
}

- (signed)category
{
  return self->_category;
}

- (void)setUserActionOptions:(signed __int16)a3
{
  self->_userActionOptions = a3;
}

- (signed)userActionOptions
{
  return self->_userActionOptions;
}

- (void)setCreationType:(signed __int16)a3
{
  self->_creationType = a3;
}

- (signed)creationType
{
  return self->_creationType;
}

- (void)setPendingState:(signed __int16)a3
{
  self->_pendingState = a3;
}

- (signed)pendingState
{
  return self->_pendingState;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (BOOL)isRejected
{
  return self->_rejected;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)_saveMetadata
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = [(PLPersistedMemoryMetadata *)self _metadataData];
  v5 = (void *)MEMORY[0x1E4F8B900];
  v6 = [(PLPersistedMemoryMetadata *)self metadataURL];
  [v5 persistMetadata:v4 fileURL:v6];

  v7 = (void *)MEMORY[0x1E4F8B908];
  v8 = [(PLPersistedMemoryMetadata *)self metadataURL];
  v9 = [v8 path];
  [v7 changeFileOwnerToMobileAtPath:v9 error:0];
}

- (id)_metadataData
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeInteger:2 forKey:@"version"];
  if (self->_memory) {
    memory = self->_memory;
  }
  else {
    memory = self;
  }
  id v5 = [memory uuid];

  if (v5) {
    [v3 encodeObject:v5 forKey:@"uuid"];
  }
  if (self->_memory) {
    v6 = self->_memory;
  }
  else {
    v6 = self;
  }
  id v7 = [v6 title];

  if (v7) {
    [v3 encodeObject:v7 forKey:@"title"];
  }
  if (self->_memory) {
    v8 = self->_memory;
  }
  else {
    v8 = self;
  }
  id v9 = [v8 subtitle];

  if (v9) {
    [v3 encodeObject:v9 forKey:@"subtitle"];
  }
  if (self->_memory) {
    v10 = self->_memory;
  }
  else {
    v10 = self;
  }
  id v11 = [v10 creationDate];

  if (v11) {
    [v3 encodeObject:v11 forKey:@"creationDate"];
  }
  v12 = self->_memory;
  unint64_t v13 = 0x1E4F28000uLL;
  if (v12)
  {
    if (([(PLMemory *)v12 rejected] & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if ([(PLPersistedMemoryMetadata *)self isRejected])
  {
LABEL_23:
    v14 = [NSNumber numberWithBool:1];
    [v3 encodeObject:v14 forKey:@"isRejected"];
  }
LABEL_24:
  v15 = self->_memory;
  if (v15)
  {
    if (([(PLMemory *)v15 favorite] & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if ([(PLPersistedMemoryMetadata *)self isFavorite])
  {
LABEL_26:
    v16 = [NSNumber numberWithBool:1];
    [v3 encodeObject:v16 forKey:@"isFavorite"];
  }
LABEL_27:
  v17 = self->_memory;
  if (!v17) {
    v17 = self;
  }
  __int16 v18 = [v17 pendingState];
  if (v18)
  {
    v19 = [NSNumber numberWithShort:v18];
    [v3 encodeObject:v19 forKey:@"isPending"];
  }
  v20 = self->_memory;
  if (!v20) {
    v20 = self;
  }
  __int16 v21 = [v20 creationType];
  if (v21)
  {
    v22 = [NSNumber numberWithShort:v21];
    [v3 encodeObject:v22 forKey:@"creationType"];
  }
  v23 = self->_memory;
  if (!v23) {
    v23 = self;
  }
  __int16 v24 = [v23 userActionOptions];
  if (v24)
  {
    v25 = [NSNumber numberWithShort:v24];
    [v3 encodeObject:v25 forKey:@"isUserCreated"];
  }
  if (self->_memory) {
    v26 = self->_memory;
  }
  else {
    v26 = self;
  }
  uint64_t v27 = [v26 category];
  if (v27)
  {
    v28 = [NSNumber numberWithShort:v27];
    [v3 encodeObject:v28 forKey:@"category"];
  }
  if (self->_memory) {
    v29 = self->_memory;
  }
  else {
    v29 = self;
  }
  uint64_t v30 = [v29 subcategory];
  if (v30)
  {
    v31 = [NSNumber numberWithShort:v30];
    [v3 encodeObject:v31 forKey:@"subcategory"];
  }
  v32 = self->_memory;
  if (v32)
  {
    id v33 = [(PLMemory *)v32 keyAsset];
    id v34 = [v33 uuid];
  }
  else
  {
    id v33 = [(PLPersistedMemoryMetadata *)self keyAssetUUID];
    id v34 = v33;
  }

  if (v34) {
    [v3 encodeObject:v34 forKey:@"keyAssetUUID"];
  }
  v35 = self->_memory;
  v123 = v34;
  v124 = v11;
  v130 = v5;
  v125 = v9;
  v126 = v7;
  if (v35)
  {
    v36 = [(PLMemory *)v35 representativeAssets];
    uint64_t v37 = [v36 valueForKey:@"uuid"];

    uint64_t v38 = PLArchiveDataFromUUIDStringsSet();
    if (v38) {
      [v3 encodeObject:v38 forKey:@"representativeAssetUUIDs"];
    }
    v39 = [(PLMemory *)self->_memory curatedAssets];
    uint64_t v40 = [v39 valueForKey:@"uuid"];

    uint64_t v41 = PLArchiveDataFromUUIDStringsSet();
    if (v41) {
      [v3 encodeObject:v41 forKey:@"curatedAssetUUIDs"];
    }
    v121 = (void *)v41;
    v42 = [(PLMemory *)self->_memory extendedCuratedAssets];
    uint64_t v43 = [v42 valueForKey:@"uuid"];

    v44 = PLArchiveDataFromUUIDStringsSet();
    if (v44) {
      [v3 encodeObject:v44 forKey:@"extendedCuratedAssetUUIDs"];
    }
    v119 = (void *)v43;
    v129 = (void *)v38;
    v45 = [(PLMemory *)self->_memory movieCuratedAssets];
    uint64_t v46 = [v45 valueForKey:@"uuid"];

    v117 = (void *)v46;
    v47 = PLArchiveDataFromUUIDStringsSet();
    if (v47) {
      [v3 encodeObject:v47 forKey:@"movieCuratedAssetUUIDs"];
    }
    v116 = (void *)v37;
    v48 = [(PLMemory *)self->_memory userCuratedAssets];
    uint64_t v49 = [v48 valueForKey:@"uuid"];

    v50 = (void *)v49;
    v51 = PLArchiveDataFromUUIDStringsSet();
    if (v51) {
      [v3 encodeObject:v47 forKey:@"userCuratedAssetUUIDs"];
    }
    v127 = (void *)v40;
    v52 = [(PLMemory *)self->_memory userRemovedAssets];
    v53 = [v52 valueForKey:@"uuid"];

    v54 = PLArchiveDataFromUUIDStringsSet();
    if (v54) {
      [v3 encodeObject:v54 forKey:@"userRemovedAssetUUIDs"];
    }
    v55 = [(PLMemory *)self->_memory customUserAssets];
    v56 = [v55 valueForKey:@"uuid"];

    if (v56) {
      [v3 encodeObject:v56 forKey:@"customUserAssetUUIDs"];
    }

    unint64_t v13 = 0x1E4F28000;
    v57 = v116;
    v59 = v127;
    v58 = v129;
    v60 = v119;
    v61 = v121;
  }
  else
  {
    v62 = [(PLPersistedMemoryMetadata *)self representativeAssetUUIDs];
    v57 = PLArchiveDataFromUUIDStringsSet();

    if (v57) {
      [v3 encodeObject:v57 forKey:@"representativeAssetUUIDs"];
    }
    v63 = [(PLPersistedMemoryMetadata *)self curatedAssetUUIDs];
    v58 = PLArchiveDataFromUUIDStringsSet();

    if (v58) {
      [v3 encodeObject:v58 forKey:@"curatedAssetUUIDs"];
    }
    v64 = [(PLPersistedMemoryMetadata *)self extendedCuratedAssetUUIDs];
    v59 = PLArchiveDataFromUUIDStringsSet();

    if (v59) {
      [v3 encodeObject:v59 forKey:@"extendedCuratedAssetUUIDs"];
    }
    v65 = [(PLPersistedMemoryMetadata *)self movieCuratedAssetUUIDs];
    v61 = PLArchiveDataFromUUIDStringsSet();

    if (v61) {
      [v3 encodeObject:v61 forKey:@"movieCuratedAssetUUIDs"];
    }
    v66 = [(PLPersistedMemoryMetadata *)self userCuratedAssetUUIDs];
    v60 = PLArchiveDataFromUUIDStringsSet();

    if (v60) {
      [v3 encodeObject:v60 forKey:@"userCuratedAssetUUIDs"];
    }
    v67 = [(PLMemory *)self->_memory customUserAssets];
    v44 = [v67 valueForKey:@"uuid"];

    if (v44) {
      [v3 encodeObject:v44 forKey:@"customUserAssetUUIDs"];
    }
  }

  if (self->_memory) {
    v68 = self->_memory;
  }
  else {
    v68 = self;
  }
  id v69 = [v68 movieData];

  if (v69) {
    [v3 encodeObject:v69 forKey:@"movieData"];
  }
  if (self->_memory) {
    v70 = self->_memory;
  }
  else {
    v70 = self;
  }
  id v71 = [v70 movieAssetState];

  if (v71) {
    [v3 encodeObject:v71 forKey:@"movieAssetState"];
  }
  if (self->_memory) {
    v72 = self->_memory;
  }
  else {
    v72 = self;
  }
  uint64_t v73 = [v72 photosGraphVersion];
  if (v73)
  {
    v74 = [*(id *)(v13 + 3792) numberWithLongLong:v73];
    [v3 encodeObject:v74 forKey:@"photosGraphVersion"];
  }
  if (self->_memory) {
    v75 = self->_memory;
  }
  else {
    v75 = self;
  }
  id v76 = [v75 photosGraphData];

  if (v76) {
    [v3 encodeObject:v76 forKey:@"photosGraphData"];
  }
  if (self->_memory) {
    v77 = self->_memory;
  }
  else {
    v77 = self;
  }
  id v78 = [v77 assetListPredicate];

  if (v78) {
    [v3 encodeObject:v78 forKey:@"assetListPredicate"];
  }
  if (self->_memory) {
    v79 = self->_memory;
  }
  else {
    v79 = self;
  }
  [v79 score];
  if (v80 != 0.0)
  {
    v81 = objc_msgSend(*(id *)(v13 + 3792), "numberWithDouble:");
    [v3 encodeObject:v81 forKey:@"score"];
  }
  if (self->_memory) {
    v82 = self->_memory;
  }
  else {
    v82 = self;
  }
  uint64_t v83 = [v82 notificationState];
  if (v83)
  {
    v84 = [*(id *)(v13 + 3792) numberWithShort:v83];
    [v3 encodeObject:v84 forKey:@"notificationState"];
  }
  if (self->_memory) {
    v85 = self->_memory;
  }
  else {
    v85 = self;
  }
  id v86 = [v85 blacklistedFeature];

  if (v86) {
    [v3 encodeObject:v86 forKey:@"blacklistedFeature"];
  }
  if (self->_memory) {
    v87 = self->_memory;
  }
  else {
    v87 = self;
  }
  uint64_t v88 = [v87 playCount];
  if (v88) {
    [v3 encodeInt64:v88 forKey:@"playCount"];
  }
  if (self->_memory) {
    v89 = self->_memory;
  }
  else {
    v89 = self;
  }
  uint64_t v90 = [v89 shareCount];
  if (v90) {
    [v3 encodeInt64:v90 forKey:@"shareCount"];
  }
  if (self->_memory) {
    v91 = self->_memory;
  }
  else {
    v91 = self;
  }
  uint64_t v92 = [v91 viewCount];
  if (v92) {
    [v3 encodeInt64:v92 forKey:@"viewCount"];
  }
  if (self->_memory) {
    v93 = self->_memory;
  }
  else {
    v93 = self;
  }
  uint64_t v94 = [v93 pendingPlayCount];
  if (v94) {
    [v3 encodeInt64:v94 forKey:@"pendingPlayCount"];
  }
  if (self->_memory) {
    v95 = self->_memory;
  }
  else {
    v95 = self;
  }
  uint64_t v96 = [v95 pendingShareCount];
  if (v96) {
    [v3 encodeInt64:v96 forKey:@"pendingShareCount"];
  }
  if (self->_memory) {
    v97 = self->_memory;
  }
  else {
    v97 = self;
  }
  uint64_t v98 = objc_msgSend(v97, "pendingViewCount", v86);
  if (v98) {
    [v3 encodeInt64:v98 forKey:@"pendingViewCount"];
  }
  v118 = v76;
  v120 = v71;
  v122 = v69;
  if (self->_memory) {
    v99 = self->_memory;
  }
  else {
    v99 = self;
  }
  int v100 = [v99 featuredState];
  if (v100) {
    [v3 encodeInt64:v100 forKey:@"featuredState"];
  }
  v128 = v3;
  if (self->_memory) {
    v101 = self->_memory;
  }
  else {
    v101 = self;
  }
  id v102 = [v101 userFeedbacks];

  v103 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v102, "count"));
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v104 = v102;
  uint64_t v105 = [v104 countByEnumeratingWithState:&v131 objects:v139 count:16];
  if (v105)
  {
    uint64_t v106 = v105;
    uint64_t v107 = *(void *)v132;
    do
    {
      for (uint64_t i = 0; i != v106; ++i)
      {
        if (*(void *)v132 != v107) {
          objc_enumerationMutation(v104);
        }
        v109 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        v110 = [v109 dictionaryRepresentation];
        if (v110)
        {
          [v103 addObject:v110];
        }
        else
        {
          v111 = PLMigrationGetLog();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            v112 = [v109 uuid];
            *(_DWORD *)buf = 138543618;
            v136 = v130;
            __int16 v137 = 2114;
            v138 = v112;
            _os_log_impl(&dword_19B3C7000, v111, OS_LOG_TYPE_INFO, "Missing user feedback dictionary representation for memory %{public}@, userFeedback: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v106 = [v104 countByEnumeratingWithState:&v131 objects:v139 count:16];
    }
    while (v106);
  }

  if ([v103 count]) {
    [v128 encodeObject:v103 forKey:@"userFeedbacks"];
  }
  v113 = [v128 encodedData];

  return v113;
}

- (BOOL)_readMetadata
{
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(PLPersistedMemoryMetadata *)self metadataURL];
  id v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DC0]), "pl_safeInitForReadingFromData:", v5);
    BOOL v7 = v6 != 0;
    if (v6)
    {
      v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
      [(PLPersistedMemoryMetadata *)self setUuid:v8];

      id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
      [(PLPersistedMemoryMetadata *)self setTitle:v9];

      v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
      [(PLPersistedMemoryMetadata *)self setSubtitle:v10];

      id v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
      [(PLPersistedMemoryMetadata *)self setCreationDate:v11];

      v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isRejected"];
      -[PLPersistedMemoryMetadata setRejected:](self, "setRejected:", [v12 BOOLValue]);

      unint64_t v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isFavorite"];
      -[PLPersistedMemoryMetadata setFavorite:](self, "setFavorite:", [v13 BOOLValue]);

      v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isPending"];
      -[PLPersistedMemoryMetadata setPendingState:](self, "setPendingState:", (__int16)[v14 intValue]);

      v15 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"creationType"];
      -[PLPersistedMemoryMetadata setCreationType:](self, "setCreationType:", (__int16)[v15 intValue]);

      v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isUserCreated"];
      -[PLPersistedMemoryMetadata setUserActionOptions:](self, "setUserActionOptions:", [v16 BOOLValue]);

      v17 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
      -[PLPersistedMemoryMetadata setCategory:](self, "setCategory:", (__int16)[v17 intValue]);

      __int16 v18 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"subcategory"];
      -[PLPersistedMemoryMetadata setSubcategory:](self, "setSubcategory:", (__int16)[v18 intValue]);

      v19 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"keyAssetUUID"];
      [(PLPersistedMemoryMetadata *)self setKeyAssetUUID:v19];

      v20 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"representativeAssetUUIDs"];
      v55 = PLUnarchiveUUIDStringsSetFromData();

      [(PLPersistedMemoryMetadata *)self setRepresentativeAssetUUIDs:v55];
      __int16 v21 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"curatedAssetUUIDs"];
      v54 = PLUnarchiveUUIDStringsSetFromData();

      [(PLPersistedMemoryMetadata *)self setCuratedAssetUUIDs:v54];
      v22 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"extendedCuratedAssetUUIDs"];
      v53 = PLUnarchiveUUIDStringsSetFromData();

      [(PLPersistedMemoryMetadata *)self setExtendedCuratedAssetUUIDs:v53];
      v23 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"movieCuratedAssetUUIDs"];
      v52 = PLUnarchiveUUIDStringsSetFromData();

      [(PLPersistedMemoryMetadata *)self setMovieCuratedAssetUUIDs:v52];
      __int16 v24 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"userCuratedAssetUUIDs"];
      v51 = PLUnarchiveUUIDStringsSetFromData();

      [(PLPersistedMemoryMetadata *)self setUserCuratedAssetUUIDs:v51];
      v25 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"userRemovedAssetUUIDs"];
      v50 = PLUnarchiveUUIDStringsSetFromData();

      [(PLPersistedMemoryMetadata *)self setUserRemovedAssetUUIDs:v50];
      v26 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v27 = objc_opt_class();
      v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      v29 = [v6 decodeObjectOfClasses:v28 forKey:@"customUserAssetUUIDs"];

      [(PLPersistedMemoryMetadata *)self setCustomUserAssetUUIDs:v29];
      uint64_t v30 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"movieData"];
      [(PLPersistedMemoryMetadata *)self setMovieData:v30];

      v31 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = objc_opt_class();
      id v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
      v35 = [v6 decodeObjectOfClasses:v34 forKey:@"movieAssetState"];
      [(PLPersistedMemoryMetadata *)self setMovieAssetState:v35];

      v36 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"photosGraphVersion"];
      -[PLPersistedMemoryMetadata setPhotosGraphVersion:](self, "setPhotosGraphVersion:", [v36 longLongValue]);

      uint64_t v37 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"photosGraphData"];
      [(PLPersistedMemoryMetadata *)self setPhotosGraphData:v37];

      uint64_t v38 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"assetListPredicate"];
      [(PLPersistedMemoryMetadata *)self setAssetListPredicate:v38];

      v39 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
      [v39 doubleValue];
      -[PLPersistedMemoryMetadata setScore:](self, "setScore:");

      uint64_t v40 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"notificationState"];
      -[PLPersistedMemoryMetadata setNotificationState:](self, "setNotificationState:", (__int16)[v40 intValue]);

      -[PLPersistedMemoryMetadata setVersion:](self, "setVersion:", [v6 decodeIntegerForKey:@"version"]);
      uint64_t v41 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"blacklistedFeature"];
      [(PLPersistedMemoryMetadata *)self setBlacklistedFeature:v41];

      -[PLPersistedMemoryMetadata setPlayCount:](self, "setPlayCount:", [v6 decodeInt64ForKey:@"playCount"]);
      -[PLPersistedMemoryMetadata setShareCount:](self, "setShareCount:", [v6 decodeInt64ForKey:@"shareCount"]);
      -[PLPersistedMemoryMetadata setViewCount:](self, "setViewCount:", [v6 decodeInt64ForKey:@"viewCount"]);
      -[PLPersistedMemoryMetadata setPendingPlayCount:](self, "setPendingPlayCount:", [v6 decodeInt64ForKey:@"pendingPlayCount"]);
      -[PLPersistedMemoryMetadata setPendingShareCount:](self, "setPendingShareCount:", [v6 decodeInt64ForKey:@"pendingShareCount"]);
      -[PLPersistedMemoryMetadata setPendingViewCount:](self, "setPendingViewCount:", [v6 decodeInt64ForKey:@"pendingViewCount"]);
      -[PLPersistedMemoryMetadata setFeaturedState:](self, "setFeaturedState:", (__int16)[v6 decodeInt64ForKey:@"featuredState"]);
      v42 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v43 = objc_opt_class();
      uint64_t v44 = objc_opt_class();
      uint64_t v45 = objc_opt_class();
      uint64_t v46 = objc_opt_class();
      v47 = objc_msgSend(v42, "setWithObjects:", v43, v44, v45, v46, objc_opt_class(), 0);
      v48 = [v6 decodeObjectOfClasses:v47 forKey:@"userFeedbacks"];
      [(PLPersistedMemoryMetadata *)self setUserFeedbacksDictionaryArray:v48];

      BOOL v7 = v6 != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v2 = self;
  if (self->_memory) {
    self = (PLPersistedMemoryMetadata *)self->_memory;
  }
  v3 = [(PLPersistedMemoryMetadata *)self title];
  if (v2->_memory) {
    memory = v2->_memory;
  }
  else {
    memory = v2;
  }
  id v5 = [memory subtitle];
  if (v2->_memory) {
    v6 = v2->_memory;
  }
  else {
    v6 = v2;
  }
  int v28 = [v6 category];
  if (v2->_memory) {
    BOOL v7 = v2->_memory;
  }
  else {
    BOOL v7 = v2;
  }
  int v27 = [v7 subcategory];
  if (v2->_memory) {
    v8 = v2->_memory;
  }
  else {
    v8 = v2;
  }
  id v9 = [v8 uuid];
  v10 = v2->_memory;
  if (v10) {
    unsigned int v11 = [(PLMemory *)v10 favorite];
  }
  else {
    unsigned int v11 = [(PLPersistedMemoryMetadata *)v2 isFavorite];
  }
  unsigned int v12 = v11;
  unint64_t v13 = v2->_memory;
  if (!v13) {
    unint64_t v13 = v2;
  }
  uint64_t v14 = [v13 pendingState];
  v15 = v2->_memory;
  if (!v15) {
    v15 = v2;
  }
  uint64_t v16 = [v15 creationType];
  v17 = v2->_memory;
  if (v17) {
    unsigned int v18 = [(PLMemory *)v17 rejected];
  }
  else {
    unsigned int v18 = [(PLPersistedMemoryMetadata *)v2 isRejected];
  }
  unsigned int v19 = v18;
  v20 = v2->_memory;
  if (!v20) {
    v20 = v2;
  }
  __int16 v21 = [v20 userActionOptions];
  v29.receiver = v2;
  v29.super_class = (Class)PLPersistedMemoryMetadata;
  v22 = [(PLPersistedMemoryMetadata *)&v29 description];
  v23 = v2->_memory;
  if (v23) {
    [(PLMemory *)v23 objectID];
  }
  else {
  __int16 v24 = [(NSURL *)v2->_metadataURL path];
  }
  v25 = [v22 stringByAppendingFormat:@" memory %@: uuid:%@ title:%@ / %@, category:%d/%d [fav:%d,rej:%d,pend:%d,user:%d,creaType:%d]", v24, v9, v3, v5, v28, v27, v12, v19, v14, v21, v16];

  return v25;
}

- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  v8 = [v6 set];
  id v9 = [(PLPersistedMemoryMetadata *)self representativeAssetUUIDs];
  [v8 unionSet:v9];

  v10 = [(PLPersistedMemoryMetadata *)self curatedAssetUUIDs];
  [v8 unionSet:v10];

  unsigned int v11 = [(PLPersistedMemoryMetadata *)self extendedCuratedAssetUUIDs];
  [v8 unionSet:v11];

  unsigned int v12 = [(PLPersistedMemoryMetadata *)self movieCuratedAssetUUIDs];
  [v8 unionSet:v12];

  unint64_t v13 = [(PLPersistedMemoryMetadata *)self userCuratedAssetUUIDs];
  [v8 unionSet:v13];

  uint64_t v14 = [(PLPersistedMemoryMetadata *)self userRemovedAssetUUIDs];
  [v8 unionSet:v14];

  v15 = [(PLPersistedMemoryMetadata *)self customUserAssetUUIDs];
  uint64_t v16 = [v15 set];
  [v8 unionSet:v16];

  v17 = [(PLPersistedMemoryMetadata *)self keyAssetUUID];
  if (v17) {
    [v8 addObject:v17];
  }
  unsigned int v18 = [v8 allObjects];
  id v24 = 0;
  unint64_t v19 = +[PLManagedAsset countForAssetsWithUUIDs:v18 includePendingChanges:v4 inManagedObjectContext:v7 error:&v24];

  id v20 = v24;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v21 = PLMigrationGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch count for assets in memory metadata %@, %@", buf, 0x16u);
    }
  }
  BOOL v22 = v19 == [v8 count];

  return v22;
}

- (BOOL)updateAssetsInMemory:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  BOOL v4 = a4;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PLPersistedMemoryMetadata *)self representativeAssetUUIDs];
  BOOL v8 = [(PLPersistedMemoryMetadata *)self _updateAssetsInMemory:v6 relationshipName:@"representativeAssets" persistedAssetUUIDs:v7 includePendingChanges:v4];

  uint64_t v9 = [(PLPersistedMemoryMetadata *)self curatedAssetUUIDs];
  LODWORD(v7) = [(PLPersistedMemoryMetadata *)self _updateAssetsInMemory:v6 relationshipName:@"curatedAssets" persistedAssetUUIDs:v9 includePendingChanges:v4];

  uint64_t v10 = [(PLPersistedMemoryMetadata *)self extendedCuratedAssetUUIDs];
  LODWORD(v9) = [(PLPersistedMemoryMetadata *)self _updateAssetsInMemory:v6 relationshipName:@"extendedCuratedAssets" persistedAssetUUIDs:v10 includePendingChanges:v4];

  unsigned int v11 = [(PLPersistedMemoryMetadata *)self movieCuratedAssetUUIDs];
  LODWORD(v10) = [(PLPersistedMemoryMetadata *)self _updateAssetsInMemory:v6 relationshipName:@"movieCuratedAssets" persistedAssetUUIDs:v11 includePendingChanges:v4];

  unsigned int v12 = [(PLPersistedMemoryMetadata *)self userCuratedAssetUUIDs];
  BOOL v13 = [(PLPersistedMemoryMetadata *)self _updateAssetsInMemory:v6 relationshipName:@"userCuratedAssets" persistedAssetUUIDs:v12 includePendingChanges:v4];

  uint64_t v14 = [(PLPersistedMemoryMetadata *)self userRemovedAssetUUIDs];
  BOOL v15 = [(PLPersistedMemoryMetadata *)self _updateAssetsInMemory:v6 relationshipName:@"userRemovedAssets" persistedAssetUUIDs:v14 includePendingChanges:v4];

  uint64_t v16 = [(PLPersistedMemoryMetadata *)self customUserAssetUUIDs];
  BOOL v17 = ([(PLPersistedMemoryMetadata *)self _updateAssetsInMemory:v6 relationshipName:@"customUserAssets" persistedOrderedAssetUUIDs:v16 includePendingChanges:v4]&& v15) & v13 & v10 & v9 & v7 & v8;

  unsigned int v18 = [(PLPersistedMemoryMetadata *)self keyAssetUUID];
  if (v18)
  {
    unint64_t v19 = [v6 keyAsset];
    id v20 = v19;
    if (!v19
      || ([v19 uuid],
          __int16 v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 isEqualToString:v18],
          v21,
          (v22 & 1) == 0))
    {
      v36[0] = v18;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      id v24 = [v6 photoLibrary];
      v25 = +[PLManagedAsset assetsWithUUIDs:v23 options:v4 inLibrary:v24];

      if ([v25 count])
      {
        v26 = PLMigrationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          __int16 v27 = [v6 uuid];
          id v28 = [(PLPersistedMemoryMetadata *)self metadataURL];
          uint64_t v29 = [v28 path];
          int v32 = 138412546;
          uint64_t v33 = v27;
          __int16 v34 = 2112;
          v35 = v29;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "Updating key asset in memory %@ to match persisted UUID from %@", (uint8_t *)&v32, 0x16u);
        }
        uint64_t v30 = [v25 objectAtIndexedSubscript:0];
        [v6 setKeyAsset:v30];
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
  }

  return v17;
}

- (BOOL)_updateAssetsInMemory:(id)a3 relationshipName:(id)a4 persistedOrderedAssetUUIDs:(id)a5 includePendingChanges:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [v10 valueForKey:v11];
  uint64_t v14 = [v13 valueForKey:@"uuid"];

  LODWORD(v13) = [v12 isEqual:v14];
  BOOL v15 = PLMigrationGetLog();
  uint64_t v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v17 = [v14 count];
      unsigned int v18 = [v10 uuid];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v67 = v17;
      *(_WORD *)&v67[4] = 2112;
      *(void *)&v67[6] = v11;
      *(_WORD *)&v67[14] = 2112;
      *(void *)&v67[16] = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Persisted asset UUIDs (%d total) match database for memory %@ %@", buf, 0x1Cu);
    }
    BOOL v19 = 1;
  }
  else
  {
    v52 = v14;
    id v53 = v11;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v20 = [v10 uuid];
      __int16 v21 = [(PLPersistedMemoryMetadata *)self metadataURL];
      char v22 = [v21 path];
      *(_DWORD *)buf = 138412546;
      *(void *)v67 = v20;
      *(_WORD *)&v67[8] = 2112;
      *(void *)&v67[10] = v22;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Updating assets in memory %@ to match persisted UUIDs from %@", buf, 0x16u);
    }
    v54 = v12;
    v23 = [v12 array];
    v55 = v10;
    id v24 = [v10 photoLibrary];
    v25 = +[PLManagedAsset assetsWithUUIDs:v23 options:v6 inLibrary:v24];

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v25, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v16 = v25;
    uint64_t v27 = [v16 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v61 != v29) {
            objc_enumerationMutation(v16);
          }
          v31 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v32 = [v31 uuid];
          uint64_t v33 = (void *)v32;
          if (v31) {
            BOOL v34 = v32 == 0;
          }
          else {
            BOOL v34 = 1;
          }
          if (!v34) {
            [v26 setObject:v31 forKey:v32];
          }

          v35 = [v31 uuid];

          if (!v35)
          {
            v36 = PLMigrationGetLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              uint64_t v37 = [v55 uuid];
              *(_DWORD *)buf = 138543362;
              *(void *)v67 = v37;
              _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Missing asset or asset.uuid for memory %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v28 = [v16 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v28);
    }

    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v26, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v39 = v54;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v56 + 1) + 8 * j);
          uint64_t v45 = [v38 count];
          uint64_t v46 = [v26 objectForKey:v44];
          if (v46) {
            [v38 addObject:v46];
          }

          if ([v38 count] == v45)
          {
            v47 = PLMigrationGetLog();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              v48 = [v55 uuid];
              *(_DWORD *)buf = 138543362;
              *(void *)v67 = v48;
              _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_INFO, "Missing asset for persisted asset uuids for memory %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v41);
    }

    id v10 = v55;
    id v11 = v53;
    uint64_t v49 = [v55 mutableOrderedSetValueForKey:v53];
    [v49 addObjectsFromArray:v38];
    uint64_t v50 = [v16 count];
    BOOL v19 = v50 == [v39 count];

    id v12 = v54;
    uint64_t v14 = v52;
  }

  return v19;
}

- (BOOL)_updateAssetsInMemory:(id)a3 relationshipName:(id)a4 persistedAssetUUIDs:(id)a5 includePendingChanges:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [v10 valueForKey:v11];
  uint64_t v14 = [v13 valueForKey:@"uuid"];

  int v15 = [v12 isEqual:v14];
  uint64_t v16 = PLMigrationGetLog();
  int v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = [v14 count];
      BOOL v19 = [v10 uuid];
      int v29 = 67109634;
      *(_DWORD *)uint64_t v30 = v18;
      *(_WORD *)&v30[4] = 2112;
      *(void *)&v30[6] = v11;
      *(_WORD *)&v30[14] = 2112;
      *(void *)&v30[16] = v19;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Persisted asset UUIDs (%d total) match database for memory %@ %@", (uint8_t *)&v29, 0x1Cu);
    }
    BOOL v20 = 1;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = [v10 uuid];
      char v22 = [(PLPersistedMemoryMetadata *)self metadataURL];
      v23 = [v22 path];
      int v29 = 138412546;
      *(void *)uint64_t v30 = v21;
      *(_WORD *)&v30[8] = 2112;
      *(void *)&v30[10] = v23;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "Updating assets in memory %@ to match persisted UUIDs from %@", (uint8_t *)&v29, 0x16u);
    }
    id v24 = [v12 allObjects];
    v25 = [v10 photoLibrary];
    int v17 = +[PLManagedAsset assetsWithUUIDs:v24 options:v6 inLibrary:v25];

    v26 = [v10 mutableSetValueForKey:v11];
    [v26 addObjectsFromArray:v17];
    uint64_t v27 = [v17 count];
    BOOL v20 = v27 == [v12 count];
  }
  return v20;
}

- (id)insertMemoryFromDataInManagedObjectContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLPersistedMemoryMetadata *)self uuid];
  BOOL v6 = [(PLPersistedMemoryMetadata *)self title];
  uint64_t v7 = [(PLPersistedMemoryMetadata *)self subtitle];
  BOOL v8 = [(PLPersistedMemoryMetadata *)self creationDate];
  uint64_t v9 = +[PLMemory insertIntoContext:v4 withUUID:v5 title:v6 subtitle:v7 creationDate:v8];

  objc_msgSend(v9, "setRejected:", -[PLPersistedMemoryMetadata isRejected](self, "isRejected"));
  objc_msgSend(v9, "setFavorite:", -[PLPersistedMemoryMetadata isFavorite](self, "isFavorite"));
  objc_msgSend(v9, "setPendingState:", (unsigned __int16)-[PLPersistedMemoryMetadata pendingState](self, "pendingState"));
  objc_msgSend(v9, "setCreationType:", (unsigned __int16)-[PLPersistedMemoryMetadata creationType](self, "creationType"));
  objc_msgSend(v9, "setUserActionOptions:", (unsigned __int16)-[PLPersistedMemoryMetadata userActionOptions](self, "userActionOptions"));
  objc_msgSend(v9, "setCategory:", -[PLPersistedMemoryMetadata category](self, "category"));
  objc_msgSend(v9, "setSubcategory:", -[PLPersistedMemoryMetadata subcategory](self, "subcategory"));
  id v10 = [(PLPersistedMemoryMetadata *)self movieData];
  [v9 setMovieData:v10];

  id v11 = [(PLPersistedMemoryMetadata *)self movieAssetState];
  [v9 setMovieAssetState:v11];

  objc_msgSend(v9, "setPhotosGraphVersion:", -[PLPersistedMemoryMetadata photosGraphVersion](self, "photosGraphVersion"));
  id v12 = [(PLPersistedMemoryMetadata *)self photosGraphData];
  [v9 setPhotosGraphData:v12];

  BOOL v13 = [(PLPersistedMemoryMetadata *)self assetListPredicate];
  [v9 setAssetListPredicate:v13];

  objc_msgSend(v9, "setNotificationState:", -[PLPersistedMemoryMetadata notificationState](self, "notificationState"));
  [(PLPersistedMemoryMetadata *)self score];
  objc_msgSend(v9, "setScore:");
  uint64_t v14 = [(PLPersistedMemoryMetadata *)self blacklistedFeature];
  [v9 setBlacklistedFeature:v14];

  objc_msgSend(v9, "setPlayCount:", -[PLPersistedMemoryMetadata playCount](self, "playCount"));
  objc_msgSend(v9, "setShareCount:", -[PLPersistedMemoryMetadata shareCount](self, "shareCount"));
  objc_msgSend(v9, "setViewCount:", -[PLPersistedMemoryMetadata viewCount](self, "viewCount"));
  objc_msgSend(v9, "setPendingPlayCount:", -[PLPersistedMemoryMetadata pendingPlayCount](self, "pendingPlayCount"));
  objc_msgSend(v9, "setPendingShareCount:", -[PLPersistedMemoryMetadata pendingShareCount](self, "pendingShareCount"));
  objc_msgSend(v9, "setPendingViewCount:", -[PLPersistedMemoryMetadata pendingViewCount](self, "pendingViewCount"));
  v25 = v9;
  objc_msgSend(v9, "setFeaturedState:", -[PLPersistedMemoryMetadata featuredState](self, "featuredState"));
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v26 = self;
  uint64_t v16 = [(PLPersistedMemoryMetadata *)self userFeedbacksDictionaryArray];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        __int16 v21 = +[PLUserFeedback insertIntoManagedObjectContext:v4 withDictionaryRepresentation:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        if (v21)
        {
          [v15 addObject:v21];
        }
        else
        {
          char v22 = PLMigrationGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = [(PLPersistedMemoryMetadata *)v26 uuid];
            *(_DWORD *)buf = 138543362;
            uint64_t v32 = v23;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Missing user feedback for memory %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v18);
  }

  [v25 setUserFeedbacks:v15];
  return v25;
}

- (BOOL)isObsolete
{
  return self->_version < 2;
}

- (void)removePersistedData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  metadataURL = self->_metadataURL;
  id v9 = 0;
  char v5 = [v3 removeItemAtURL:metadataURL error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = [(NSURL *)self->_metadataURL path];
      *(_DWORD *)buf = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to remove persisted memory metadata %@ %@", buf, 0x16u);
    }
  }
}

- (PLPersistedMemoryMetadata)initWithPersistedDataAtURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistedMemoryMetadata;
  id v6 = [(PLPersistedMemoryMetadata *)&v10 init];
  uint64_t v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metadataURL, a3), ![(PLPersistedMemoryMetadata *)v7 _readMetadata]))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v7;
  }

  return v8;
}

- (PLPersistedMemoryMetadata)initWithPLMemory:(id)a3 pathManager:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a3;
  BOOL v8 = [a4 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];
  id v9 = [v6 fileURLWithPath:v8 isDirectory:1];

  objc_super v10 = NSString;
  id v11 = [v7 uuid];
  __int16 v12 = [v10 stringWithFormat:@"%@.%@", v11, PLMemoryMetadataExtension];

  id v13 = [v9 URLByAppendingPathComponent:v12];
  uint64_t v14 = [(PLPersistedMemoryMetadata *)self initWithPLMemory:v7 metadataURL:v13];

  return v14;
}

- (PLPersistedMemoryMetadata)initWithPLMemory:(id)a3 metadataURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLPersistedMemoryMetadata;
  id v9 = [(PLPersistedMemoryMetadata *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_metadataURL, a4);
    v10->_version = 2;
  }

  return v10;
}

- (PLPersistedMemoryMetadata)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLPersistedMemoryMetadata.m" lineNumber:90 description:@"Can't initialize a PLPersistedMemoryMetadata object using -init."];

  return 0;
}

+ (BOOL)isValidPath:(id)a3
{
  v3 = [a3 pathExtension];
  char v4 = [v3 isEqualToString:PLMemoryMetadataExtension];

  return v4;
}

@end