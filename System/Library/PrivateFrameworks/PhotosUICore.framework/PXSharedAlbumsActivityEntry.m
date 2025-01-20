@interface PXSharedAlbumsActivityEntry
+ (id)_activitiesFromCloudFeedEntries:(id)a3 inMostRecentOrder:(BOOL)a4 photoLibrary:(id)a5 plPhotoLibrary:(id)a6;
+ (id)_assetsAddedActivitiesFromCloudFeedAssetsEntry:(id)a3 inMostRecentOrder:(BOOL)a4 inAlbum:(id)a5 photoLibrary:(id)a6;
+ (id)_assetsAddedActivityFromAssets:(id)a3 batchID:(unint64_t)a4 inAlbum:(id)a5 forEntry:(id)a6 photoLibrary:(id)a7;
+ (id)_fetchAssetsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4;
+ (id)_fetchRecentActivitiesWithOptions:(id)a3 olderThanDate:(id)a4 filter:(int64_t)a5;
+ (id)_reactionActivitiesFromCloudFeedLikeEntry:(id)a3 inAlbum:(id)a4 photoLibrary:(id)a5 plPhotoLibrary:(id)a6;
+ (id)fetchActivitiesWithOptions:(id)a3;
+ (id)fetchAssetsMockActivitiesWithOptions:(id)a3;
+ (id)fetchKeyAssetsForActivity:(id)a3;
+ (id)fetchRecentActivitiesWithOptions:(id)a3 olderThanDate:(id)a4 filter:(int64_t)a5;
+ (unint64_t)fetchCountOfRecentFeedActivitiesWithOptions:(id)a3 newerThanDate:(id)a4;
- (BOOL)cloudOwnerIsAllowlisted;
- (BOOL)isFromMe;
- (NSArray)avatarConfigurations;
- (NSArray)contributorDisplayNames;
- (NSArray)contributors;
- (NSArray)keyAssetUUIDs;
- (NSArray)relatedUUIDs;
- (NSDate)date;
- (NSManagedObjectID)objectID;
- (NSString)albumGUID;
- (NSString)albumName;
- (NSString)contributorDisplayName;
- (NSString)message;
- (NSString)relatedCommentUUID;
- (NSString)uuid;
- (PHFetchResult)keyAssets;
- (PHPhotoLibrary)photoLibrary;
- (PXSharedAlbumsActivityEntry)initWithPhotoLibrary:(id)a3 uuid:(id)a4 date:(id)a5 type:(int64_t)a6 isFromMe:(BOOL)a7 contributors:(id)a8 avatarConfigurations:(id)a9 albumGUID:(id)a10 albumName:(id)a11 cloudOwnerIsAllowlisted:(BOOL)a12 message:(id)a13 keyAssetUUIDs:(id)a14 keyAssets:(id)a15 relatedCommentUUID:(id)a16 relatedUUIDs:(id)a17 underlyingObject:(id)a18;
- (PXSharedAlbumsActivityEntryAvatarConfiguration)avatarConfiguration;
- (PXSharedAlbumsActivityEntryContributor)contributor;
- (id)debugDescription;
- (id)underlyingObject;
- (int64_t)type;
@end

@implementation PXSharedAlbumsActivityEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssets, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong(&self->_underlyingObject, 0);
  objc_storeStrong((id *)&self->_relatedUUIDs, 0);
  objc_storeStrong((id *)&self->_relatedCommentUUID, 0);
  objc_storeStrong((id *)&self->_keyAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_avatarConfigurations, 0);
  objc_storeStrong((id *)&self->_contributorDisplayNames, 0);
  objc_storeStrong((id *)&self->_contributors, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (PHFetchResult)keyAssets
{
  return self->_keyAssets;
}

- (BOOL)cloudOwnerIsAllowlisted
{
  return self->_cloudOwnerIsAllowlisted;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (id)underlyingObject
{
  return self->_underlyingObject;
}

- (NSArray)relatedUUIDs
{
  return self->_relatedUUIDs;
}

- (NSString)relatedCommentUUID
{
  return self->_relatedCommentUUID;
}

- (NSArray)keyAssetUUIDs
{
  return self->_keyAssetUUIDs;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSArray)avatarConfigurations
{
  return self->_avatarConfigurations;
}

- (NSArray)contributorDisplayNames
{
  return self->_contributorDisplayNames;
}

- (NSArray)contributors
{
  return self->_contributors;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = self->_type - 1;
  if (v6 > 6) {
    v7 = @"Assets";
  }
  else {
    v7 = *(&off_1E5DBC8D8 + v6);
  }
  date = self->_date;
  uint64_t v9 = [(NSArray *)self->_contributorDisplayNames componentsJoinedByString:@","];
  v10 = (void *)v9;
  albumName = self->_albumName;
  if (self->_message)
  {
    v12 = [NSString stringWithFormat:@" \"%@\"", self->_message];
    v13 = [v3 stringWithFormat:@"<%@: %p [(%@) %@ from %@ in %@%@]>", v5, self, date, v7, v10, albumName, v12];
  }
  else
  {
    v13 = [v3 stringWithFormat:@"<%@: %p [(%@) %@ from %@ in %@%@]>", v5, self, date, v7, v9, self->_albumName, &stru_1F00B0030];
  }

  return v13;
}

- (PXSharedAlbumsActivityEntryAvatarConfiguration)avatarConfiguration
{
  return (PXSharedAlbumsActivityEntryAvatarConfiguration *)[(NSArray *)self->_avatarConfigurations firstObject];
}

- (NSString)contributorDisplayName
{
  return (NSString *)[(NSArray *)self->_contributorDisplayNames firstObject];
}

- (PXSharedAlbumsActivityEntryContributor)contributor
{
  return (PXSharedAlbumsActivityEntryContributor *)[(NSArray *)self->_contributors firstObject];
}

- (PXSharedAlbumsActivityEntry)initWithPhotoLibrary:(id)a3 uuid:(id)a4 date:(id)a5 type:(int64_t)a6 isFromMe:(BOOL)a7 contributors:(id)a8 avatarConfigurations:(id)a9 albumGUID:(id)a10 albumName:(id)a11 cloudOwnerIsAllowlisted:(BOOL)a12 message:(id)a13 keyAssetUUIDs:(id)a14 keyAssets:(id)a15 relatedCommentUUID:(id)a16 relatedUUIDs:(id)a17 underlyingObject:(id)a18
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v55 = a4;
  id v22 = a4;
  id v56 = a5;
  id v66 = a5;
  id v23 = a8;
  id v64 = a9;
  id v65 = a10;
  id v24 = a11;
  id v59 = a13;
  id v25 = a14;
  id v58 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  v60 = v21;
  v62 = v22;
  if (!v21)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 96, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    id v22 = v62;
  }
  if (![v22 length])
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 97, @"Invalid parameter not satisfying: %@", @"uuid.length" object file lineNumber description];
  }
  v29 = v25;
  if (v66)
  {
    if (v23) {
      goto LABEL_7;
    }
LABEL_33:
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 99, @"Invalid parameter not satisfying: %@", @"contributors" object file lineNumber description];

    if (v64) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 98, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

  if (!v23) {
    goto LABEL_33;
  }
LABEL_7:
  if (v64) {
    goto LABEL_8;
  }
LABEL_34:
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 100, @"Invalid parameter not satisfying: %@", @"avatarConfigurations" object file lineNumber description];

LABEL_8:
  if (v65)
  {
    if (v24) {
      goto LABEL_10;
    }
  }
  else
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 101, @"Invalid parameter not satisfying: %@", @"albumGUID" object file lineNumber description];

    if (v24)
    {
LABEL_10:
      if (v25) {
        goto LABEL_11;
      }
LABEL_37:
      v47 = [MEMORY[0x1E4F28B00] currentHandler];
      [v47 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 103, @"Invalid parameter not satisfying: %@", @"keyAssetUUIDs" object file lineNumber description];

      if (v27) {
        goto LABEL_12;
      }
      goto LABEL_38;
    }
  }
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 102, @"Invalid parameter not satisfying: %@", @"albumName" object file lineNumber description];

  if (!v25) {
    goto LABEL_37;
  }
LABEL_11:
  if (v27) {
    goto LABEL_12;
  }
LABEL_38:
  v48 = [MEMORY[0x1E4F28B00] currentHandler];
  [v48 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 104, @"Invalid parameter not satisfying: %@", @"relatedUUIDs" object file lineNumber description];

LABEL_12:
  if (![v23 count])
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntry.m" lineNumber:106 description:@"Must have a contributor."];
  }
  if (![v64 count])
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntry.m" lineNumber:107 description:@"Must have an avatar configuration."];
  }
  if (a6 != 1)
  {
    if ([v23 count] != 1)
    {
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntry.m" lineNumber:109 description:@"Found multiple contributors for a non-reaction type activity entry. Only reactions can have multiple contributors."];
    }
    if ([v64 count] != 1)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntry.m" lineNumber:110 description:@"Found multiple avatar configurations for a non-reaction type activity entry. Only reactions can have multiple contributors."];
    }
  }
  v30 = [v23 firstObject];
  v31 = [v30 displayName];
  uint64_t v32 = [v31 length];

  if (!v32)
  {
    v33 = PLSharingGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v69 = v62;
      __int16 v70 = 2114;
      id v71 = v65;
      __int16 v72 = 2112;
      id v73 = v24;
      __int16 v74 = 2112;
      id v75 = v66;
      _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_ERROR, "Contributor display name is empty/blank for activity UUID: %{public}@, in albumGUID/name %{public}@/%@, date: %@", buf, 0x2Au);
    }
  }
  if (![v24 length])
  {
    v34 = PLSharingGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v69 = v62;
      __int16 v70 = 2114;
      id v71 = v65;
      __int16 v72 = 2112;
      id v73 = v66;
      _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_ERROR, "Album name is empty/blank for activity UUID: %{public}@, for albumGUID %{public}@, date: %@", buf, 0x20u);
    }
  }
  v67.receiver = self;
  v67.super_class = (Class)PXSharedAlbumsActivityEntry;
  v35 = [(PXSharedAlbumsActivityEntry *)&v67 init];
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_photoLibrary, a3);
    objc_storeStrong((id *)&v36->_uuid, v55);
    objc_storeStrong((id *)&v36->_date, v56);
    v36->_type = a6;
    v36->_isFromMe = a7;
    uint64_t v37 = [v23 copy];
    contributors = v36->_contributors;
    v36->_contributors = (NSArray *)v37;

    PXMap();
  }

  return 0;
}

uint64_t __235__PXSharedAlbumsActivityEntry_initWithPhotoLibrary_uuid_date_type_isFromMe_contributors_avatarConfigurations_albumGUID_albumName_cloudOwnerIsAllowlisted_message_keyAssetUUIDs_keyAssets_relatedCommentUUID_relatedUUIDs_underlyingObject___block_invoke_260(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __235__PXSharedAlbumsActivityEntry_initWithPhotoLibrary_uuid_date_type_isFromMe_contributors_avatarConfigurations_albumGUID_albumName_cloudOwnerIsAllowlisted_message_keyAssetUUIDs_keyAssets_relatedCommentUUID_relatedUUIDs_underlyingObject___block_invoke(uint64_t a1, void *a2)
{
  return [a2 displayName];
}

+ (id)_fetchAssetsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 librarySpecificFetchOptions];
  v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v5 options:v7];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v16 = [v15 uuid];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v27 + 1) + 8 * j), (void)v27);
        if (v23) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  id v24 = objc_alloc(MEMORY[0x1E4F39150]);
  id v25 = (void *)[v24 initWithObjects:v17 photoLibrary:v6 fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v25;
}

+ (id)fetchKeyAssetsForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 keyAssetUUIDs];
  id v6 = [v4 photoLibrary];

  v7 = [a1 _fetchAssetsWithUUIDs:v5 inPhotoLibrary:v6];

  return v7;
}

+ (id)_reactionActivitiesFromCloudFeedLikeEntry:(id)a3 inAlbum:(id)a4 photoLibrary:(id)a5 plPhotoLibrary:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v10 = [v9 entryLikeComments];
  uint64_t v11 = [v10 count];
  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11)
  {
    uint64_t v13 = [v9 URIRepresentation];
    [v13 absoluteString];
    objc_claimAutoreleasedReturnValue();

    uint64_t v14 = [v26 localizedTitle];
    v15 = (void *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = &stru_1F00B0030;
    }
    v16;

    uint64_t v17 = [v26 cloudGUID];
    id v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (__CFString *)v17;
    }
    else {
      uint64_t v19 = &stru_1F00B0030;
    }
    v19;

    [v26 cloudOwnerIsWhitelisted];
    objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v10, "count"));
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v10, "count"));
    id v22 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v10, "count"));
    [v9 entryDate];
    objc_claimAutoreleasedReturnValue();
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke;
    v27[3] = &unk_1E5DBC890;
    v27[7] = v28;
    v27[4] = v21;
    v27[5] = v22;
    v27[6] = v20;
    [v10 enumerateObjectsUsingBlock:v27];
    PXMap();
  }

  return v12;
}

void __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 isMyComment];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v6 = [PXSharedAlbumsActivityEntryContributor alloc];
    v7 = [v3 commenterDisplayName];
    v8 = [v3 commenterEmail];
    id v9 = [(PXSharedAlbumsActivityEntryContributor *)v6 initWithDisplayName:v7 email:v8];

    id v10 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
    uint64_t v11 = [v3 commenterEmail];
    uint64_t v12 = [v3 commenterFirstName];
    uint64_t v13 = [v3 commenterLastName];
    uint64_t v14 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)v10 initWithEmail:v11 phone:0 firstName:v12 lastName:v13];

    [*(id *)(a1 + 32) insertObject:v9 atIndex:0];
    [*(id *)(a1 + 40) insertObject:v14 atIndex:0];
  }
  else
  {
    v15 = [PXSharedAlbumsActivityEntryContributor alloc];
    v16 = [v3 commenterDisplayName];
    uint64_t v17 = [v3 commenterEmail];
    id v9 = [(PXSharedAlbumsActivityEntryContributor *)v15 initWithDisplayName:v16 email:v17];

    id v18 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
    uint64_t v19 = [v3 commenterEmail];
    uint64_t v20 = [v3 commenterFirstName];
    uint64_t v21 = [v3 commenterLastName];
    uint64_t v14 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)v18 initWithEmail:v19 phone:0 firstName:v20 lastName:v21];

    [*(id *)(a1 + 32) addObject:v9];
    [*(id *)(a1 + 40) addObject:v14];
  }

  id v22 = *(void **)(a1 + 48);
  id v23 = [v3 likedAsset];

  [v22 addObject:v23];
}

void __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 cloudGUID];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 shortObjectIDURI];
  }
  v7 = v6;

  if ([v7 length])
  {
    v8 = [NSString stringWithFormat:@"%@_reaction_%@", *(void *)(a1 + 32), v7];
    id v9 = [v3 likedAsset];
    id v10 = [v9 uuid];

    if (v10)
    {
      v43 = v8;
      v44 = v7;
      uint64_t v11 = [v3 isMyComment];
      unsigned int v12 = [v11 BOOLValue];

      uint64_t v13 = &stru_1F00B0030;
      unsigned int v42 = v12;
      if ((v12 & 1) == 0)
      {
        uint64_t v14 = [v3 commenterDisplayName];
        v15 = (void *)v14;
        if (v14) {
          v16 = (__CFString *)v14;
        }
        else {
          v16 = &stru_1F00B0030;
        }
        uint64_t v13 = v16;
      }
      v41 = v13;
      uint64_t v17 = [PXSharedAlbumsActivityEntryContributor alloc];
      id v18 = [v3 commenterEmail];
      v40 = [(PXSharedAlbumsActivityEntryContributor *)v17 initWithDisplayName:v13 email:v18];

      uint64_t v19 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
      uint64_t v20 = [v3 commenterEmail];
      uint64_t v21 = [v3 commenterFirstName];
      id v22 = [v3 commenterLastName];
      v39 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)v19 initWithEmail:v20 phone:0 firstName:v21 lastName:v22];

      uint64_t v37 = [PXSharedAlbumsActivityEntry alloc];
      uint64_t v38 = *(void *)(a1 + 40);
      v36 = [v3 commentDate];
      v47 = v40;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      v46 = v39;
      id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      uint64_t v24 = *(void *)(a1 + 56);
      uint64_t v34 = *(void *)(a1 + 48);
      char v25 = *(unsigned char *)(a1 + 88);
      id v26 = [v3 likedAsset];
      long long v27 = [v26 uuid];
      v45 = v27;
      long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      uint64_t v29 = *(void *)(a1 + 64);
      uint64_t v30 = [v3 cloudGUID];
      LOBYTE(v33) = v25;
      v8 = v43;
      long long v31 = [(PXSharedAlbumsActivityEntry *)v37 initWithPhotoLibrary:v38 uuid:v43 date:v36 type:1 isFromMe:v42 contributors:v35 avatarConfigurations:v23 albumGUID:v34 albumName:v24 cloudOwnerIsAllowlisted:v33 message:0 keyAssetUUIDs:v28 keyAssets:v29 relatedCommentUUID:v30 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:*(void *)(a1 + 72)];

      [*(id *)(a1 + 80) addObject:v31];
      v7 = v44;
    }
    else
    {
      long long v32 = PLSharingGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v3;
        _os_log_impl(&dword_1A9AE7000, v32, OS_LOG_TYPE_ERROR, "likedAsset was missing for PLCloudSharedComment (like): %@. Skipping.", buf, 0xCu);
      }
    }
  }
  else
  {
    v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v3;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "cloudGUID and shortObjectIDURI was missing for PLCloudSharedComment (like): %@. Skipping.", buf, 0xCu);
    }
  }
}

uint64_t __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

+ (id)_assetsAddedActivitiesFromCloudFeedAssetsEntry:(id)a3 inMostRecentOrder:(BOOL)a4 inAlbum:(id)a5 photoLibrary:(id)a6
{
  BOOL v23 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  unsigned int v12 = [v9 entryAssets];
  if ([v12 count])
  {
    uint64_t v13 = +[PXSharedAlbumsSettings sharedInstance];
    uint64_t v14 = [v13 activityEntryAssetsAddedBatchingBehavior];

    if (v14)
    {
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__124834;
      v47 = __Block_byref_object_dispose__124835;
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x3032000000;
      v41[3] = __Block_byref_object_copy__124834;
      v41[4] = __Block_byref_object_dispose__124835;
      id v42 = 0;
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = __Block_byref_object_copy__124834;
      v39[4] = __Block_byref_object_dispose__124835;
      id v40 = 0;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      char v38 = 0;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke;
      v30[3] = &unk_1E5DBC840;
      v35 = v39;
      uint64_t v36 = v14;
      long long v32 = v41;
      uint64_t v33 = v37;
      uint64_t v34 = &v43;
      id v31 = v12;
      [v31 enumerateObjectsUsingBlock:v30];
      if ((unint64_t)[(id)v44[5] count] >= 2)
      {
        v15 = PLSharingGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = [(id)v44[5] count];
          uint64_t v17 = [v9 objectID];
          *(_DWORD *)buf = 134218242;
          uint64_t v51 = v16;
          __int16 v52 = 2112;
          v53 = v17;
          _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_INFO, "[ActivityEntry] Produced %lu assets activity entries from assets-added cloud entry: %@", buf, 0x16u);
        }
      }
      id v18 = (void *)[(id)v44[5] copy];

      _Block_object_dispose(v37, 8);
      _Block_object_dispose(v39, 8);

      _Block_object_dispose(v41, 8);
      _Block_object_dispose(&v43, 8);
    }
    else
    {
      id v49 = v12;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    }
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__124834;
    v47 = __Block_byref_object_dispose__124835;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke_340;
    v24[3] = &unk_1E5DBC868;
    id v29 = a1;
    id v25 = v10;
    id v26 = v9;
    id v27 = v11;
    long long v28 = &v43;
    [v18 enumerateObjectsUsingBlock:v24];
    uint64_t v20 = (void *)v44[5];
    if (v23)
    {
      uint64_t v21 = [v20 reverseObjectEnumerator];
      id v19 = [v21 allObjects];
    }
    else
    {
      id v19 = v20;
    }

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 cloudBatchID];
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v5 = v4;
  if (v4 == v3) {
    int v6 = 1;
  }
  else {
    int v6 = [v4 isEqualToString:v3];
  }

  v7 = [v15 orderedCloudComments];
  v8 = [v7 firstObject];

  id v9 = [v8 isCaption];
  char v10 = [v9 BOOLValue];

  if (*(void *)(a1 + 72) != 2)
  {
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v11 + 24))
  {
    *(unsigned char *)(v11 + 24) = v10;
    if (v10) {
      goto LABEL_12;
    }
LABEL_11:
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v6) {
    goto LABEL_11;
  }
  *(unsigned char *)(v11 + 24) = v10;
LABEL_12:
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
LABEL_13:
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v15];
}

void __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke_340(void *a1, void *a2, uint64_t a3)
{
  int v5 = (void *)a1[8];
  int v6 = [a2 array];
  id v7 = [v5 _assetsAddedActivityFromAssets:v6 batchID:a3 inAlbum:a1[4] forEntry:a1[5] photoLibrary:a1[6]];

  [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v7];
}

+ (id)_assetsAddedActivityFromAssets:(id)a3 batchID:(unint64_t)a4 inAlbum:(id)a5 forEntry:(id)a6 photoLibrary:(id)a7
{
  uint64_t v11 = NSString;
  a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [v12 URIRepresentation];
  uint64_t v16 = [v15 absoluteString];
  [v11 stringWithFormat:@"%@_batch_%lu", v16, a4];
  objc_claimAutoreleasedReturnValue();

  uint64_t v17 = [v13 localizedTitle];
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (__CFString *)v17;
  }
  else {
    id v19 = &stru_1F00B0030;
  }
  v19;

  uint64_t v20 = [v13 cloudGUID];
  uint64_t v21 = (void *)v20;
  if (v20) {
    id v22 = (__CFString *)v20;
  }
  else {
    id v22 = &stru_1F00B0030;
  }
  v22;

  [v13 cloudOwnerIsWhitelisted];
  PXMap();
}

uint64_t __100__PXSharedAlbumsActivityEntry__assetsAddedActivityFromAssets_batchID_inAlbum_forEntry_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

+ (id)_activitiesFromCloudFeedEntries:(id)a3 inMostRecentOrder:(BOOL)a4 photoLibrary:(id)a5 plPhotoLibrary:(id)a6
{
  BOOL v134 = a4;
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v150 = a5;
  id v135 = a6;
  id v142 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  obuint64_t j = v8;
  uint64_t v144 = [obj countByEnumeratingWithState:&v169 objects:v190 count:16];
  if (v144)
  {
    uint64_t v143 = *(void *)v170;
LABEL_3:
    uint64_t v9 = 0;
    while (2)
    {
      if (*(void *)v170 != v143) {
        objc_enumerationMutation(obj);
      }
      char v10 = *(void **)(*((void *)&v169 + 1) + 8 * v9);
      id v11 = (id)[v10 entryDate];
      id v12 = (void *)MEMORY[0x1E4F8A720];
      id v13 = [v10 entryAlbumGUID];
      id v14 = [v10 photoLibrary];
      id v15 = [v12 cloudSharedAlbumWithGUID:v13 inLibrary:v14];

      if (!v15)
      {
        uint64_t v16 = PLSharingGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [v10 entryAlbumGUID];
          *(_DWORD *)buf = 138543362;
          uint64_t v174 = (uint64_t)v17;
          _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Album not found with guid: %{public}@. May have empty titles and be treated as allowlisted for invitations", buf, 0xCu);
        }
      }
      uint64_t v18 = [v15 localizedTitle];
      id v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = (__CFString *)v18;
      }
      else {
        uint64_t v20 = &stru_1F00B0030;
      }
      uint64_t v21 = v20;

      uint64_t v22 = [v15 cloudGUID];
      BOOL v23 = (void *)v22;
      if (v22) {
        uint64_t v24 = (__CFString *)v22;
      }
      else {
        uint64_t v24 = &stru_1F00B0030;
      }
      id v25 = v24;

      char v26 = [v15 cloudOwnerIsWhitelisted];
      if (![(__CFString *)v21 length])
      {
        id v27 = PLSharingGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          long long v28 = [v15 cloudGUID];
          *(_DWORD *)buf = 138543362;
          uint64_t v174 = (uint64_t)v28;
          _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "Album with cloud GUID: %{public}@ has an empty title", buf, 0xCu);
        }
      }
      id v29 = [v10 URIRepresentation];
      uint64_t v30 = [v29 absoluteString];

      switch([v10 entryType])
      {
        case 1:
          id v48 = v10;
          if (v48)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_29;
            }
            v113 = [MEMORY[0x1E4F28B00] currentHandler];
            v114 = [NSString stringWithUTF8String:"+[PXSharedAlbumsActivityEntry _activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]"];
            v121 = (objc_class *)objc_opt_class();
            v116 = NSStringFromClass(v121);
            objc_msgSend(v48, "px_descriptionForAssertionMessage");
            v123 = v122 = v21;
            [v113 handleFailureInFunction:v114, @"PXSharedAlbumsActivityEntry.m", 344, @"%@ should be an instance inheriting from %@, but it is %@", @"entry", v116, v123 file lineNumber description];

            uint64_t v21 = v122;
          }
          else
          {
            v113 = [MEMORY[0x1E4F28B00] currentHandler];
            v114 = [NSString stringWithUTF8String:"+[PXSharedAlbumsActivityEntry _activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]"];
            v115 = (objc_class *)objc_opt_class();
            v116 = NSStringFromClass(v115);
            [v113 handleFailureInFunction:v114, @"PXSharedAlbumsActivityEntry.m", 344, @"%@ should be an instance inheriting from %@, but it is nil", @"entry", v116 file lineNumber description];
          }

LABEL_29:
          id v49 = [a1 _assetsAddedActivitiesFromCloudFeedAssetsEntry:v48 inMostRecentOrder:v134 inAlbum:v15 photoLibrary:v150];
          if ([v49 count])
          {
            [v142 addObjectsFromArray:v49];
          }
          else
          {
            v105 = PLSharingGetLog();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v174 = (uint64_t)v48;
              _os_log_impl(&dword_1A9AE7000, v105, OS_LOG_TYPE_ERROR, "No assets for entry: %@", buf, 0xCu);
            }
          }
          goto LABEL_65;
        case 2:
          char v50 = v26;
          id v48 = v10;
          if (v48)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_33;
            }
            v117 = [MEMORY[0x1E4F28B00] currentHandler];
            v118 = [NSString stringWithUTF8String:"+[PXSharedAlbumsActivityEntry _activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]"];
            v124 = (objc_class *)objc_opt_class();
            v120 = NSStringFromClass(v124);
            objc_msgSend(v48, "px_descriptionForAssertionMessage");
            v125 = v154 = v21;
            [v117 handleFailureInFunction:v118, @"PXSharedAlbumsActivityEntry.m", 353, @"%@ should be an instance inheriting from %@, but it is %@", @"entry", v120, v125 file lineNumber description];

            uint64_t v21 = v154;
          }
          else
          {
            v117 = [MEMORY[0x1E4F28B00] currentHandler];
            v118 = [NSString stringWithUTF8String:"+[PXSharedAlbumsActivityEntry _activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]"];
            v119 = (objc_class *)objc_opt_class();
            v120 = NSStringFromClass(v119);
            [v117 handleFailureInFunction:v118, @"PXSharedAlbumsActivityEntry.m", 353, @"%@ should be an instance inheriting from %@, but it is nil", @"entry", v120 file lineNumber description];
          }

LABEL_33:
          id v49 = [v48 entryComments];
          v160[0] = MEMORY[0x1E4F143A8];
          v160[1] = 3221225472;
          v160[2] = __109__PXSharedAlbumsActivityEntry__activitiesFromCloudFeedEntries_inMostRecentOrder_photoLibrary_plPhotoLibrary___block_invoke;
          v160[3] = &unk_1E5DBC7D8;
          id v167 = a1;
          id v51 = v150;
          id v161 = v51;
          id v162 = v30;
          id v163 = v48;
          v164 = v25;
          v165 = v21;
          char v168 = v50;
          id v52 = v142;
          id v166 = v52;
          [v49 enumerateObjectsUsingBlock:v160];
          v53 = [a1 _reactionActivitiesFromCloudFeedLikeEntry:v48 inAlbum:v15 photoLibrary:v51 plPhotoLibrary:v135];
          [v52 addObjectsFromArray:v53];
          if (![v49 count] && !objc_msgSend(v53, "count"))
          {
            uint64_t v54 = PLSharingGetLog();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v174 = (uint64_t)v48;
              _os_log_impl(&dword_1A9AE7000, v54, OS_LOG_TYPE_ERROR, "No comments or likes for entry: %@", buf, 0xCu);
            }
          }
LABEL_65:

LABEL_66:
          if (v144 != ++v9) {
            continue;
          }
          uint64_t v126 = [obj countByEnumeratingWithState:&v169 objects:v190 count:16];
          uint64_t v144 = v126;
          if (!v126) {
            goto LABEL_83;
          }
          goto LABEL_3;
        case 3:
          char v147 = v26;
          v153 = v21;
          id v55 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
          id v56 = [v15 cloudOwnerEmail];
          v57 = [v15 cloudOwnerFirstName];
          id v58 = [v15 cloudOwnerLastName];
          uint64_t v155 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)v55 initWithEmail:v56 phone:0 firstName:v57 lastName:v58];

          uint64_t v59 = [v15 cloudOwnerFullName];
          v60 = (void *)v59;
          if (v59) {
            v61 = (__CFString *)v59;
          }
          else {
            v61 = &stru_1F00B0030;
          }
          v62 = v61;

          v63 = [PXSharedAlbumsActivityEntryContributor alloc];
          id v64 = [v15 cloudOwnerEmail];
          uint64_t v148 = (uint64_t)v62;
          v140 = [(PXSharedAlbumsActivityEntryContributor *)v63 initWithDisplayName:v62 email:v64];

          id v65 = [v15 keyAssets];
          id v66 = [v65 firstObject];
          objc_super v67 = [v66 uuid];

          v156 = v30;
          v157 = v25;
          v68 = v15;
          if (v67)
          {
            v185 = v67;
            v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1];
            __int16 v70 = [a1 _fetchAssetsWithUUIDs:v69 inPhotoLibrary:v150];
          }
          else
          {
            __int16 v70 = 0;
          }
          v106 = [PXSharedAlbumsActivityEntry alloc];
          v107 = [v10 entryDate];
          v184 = v140;
          v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v184 count:1];
          uint64_t v183 = v155;
          uint64_t v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v183 count:1];
          v110 = (void *)v109;
          if (v67)
          {
            v182 = v67;
            v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v182 count:1];
            LOBYTE(v133) = v147;
            v112 = [(PXSharedAlbumsActivityEntry *)v106 initWithPhotoLibrary:v150 uuid:v156 date:v107 type:5 isFromMe:0 contributors:v108 avatarConfigurations:v110 albumGUID:v157 albumName:v153 cloudOwnerIsAllowlisted:v133 message:0 keyAssetUUIDs:v111 keyAssets:v70 relatedCommentUUID:0 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:v10];
          }
          else
          {
            LOBYTE(v133) = v147;
            v112 = [(PXSharedAlbumsActivityEntry *)v106 initWithPhotoLibrary:v150 uuid:v156 date:v107 type:5 isFromMe:0 contributors:v108 avatarConfigurations:v109 albumGUID:v157 albumName:v153 cloudOwnerIsAllowlisted:v133 message:0 keyAssetUUIDs:MEMORY[0x1E4F1CBF0] keyAssets:v70 relatedCommentUUID:0 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:v10];
          }

          [v142 addObject:v112];
          id v15 = v68;
          uint64_t v21 = v153;
          goto LABEL_64;
        case 4:
        case 7:
          char v145 = v26;
          v151 = v21;
          id v31 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
          long long v32 = [MEMORY[0x1E4F8AAB0] sharingUsername];
          uint64_t v33 = [MEMORY[0x1E4F8AAB0] sharingFirstName];
          uint64_t v34 = [MEMORY[0x1E4F8AAB0] sharingLastName];
          uint64_t v155 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)v31 initWithEmail:v32 phone:0 firstName:v33 lastName:v34];

          uint64_t v35 = [v10 entryType];
          uint64_t v36 = 3;
          if (v35 != 4) {
            uint64_t v36 = 4;
          }
          uint64_t v136 = v36;
          uint64_t v148 = [MEMORY[0x1E4F8AAB0] sharingDisplayNameIncludingEmail:0 allowsEmail:1];
          uint64_t v37 = [[PXSharedAlbumsActivityEntryContributor alloc] initWithDisplayName:v148 email:0];
          char v38 = [v15 keyAssets];
          v39 = [v38 firstObject];
          id v40 = [v39 uuid];

          v149 = v15;
          v156 = v30;
          v157 = v25;
          if (v40)
          {
            v189 = v40;
            v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
            id v42 = [a1 _fetchAssetsWithUUIDs:v41 inPhotoLibrary:v150];
          }
          else
          {
            id v42 = 0;
          }
          id v71 = [PXSharedAlbumsActivityEntry alloc];
          __int16 v72 = [v10 entryDate];
          v141 = (PXSharedAlbumsActivityEntryAvatarConfiguration *)v37;
          v188 = v37;
          id v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v188 count:1];
          uint64_t v187 = v155;
          uint64_t v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v187 count:1];
          id v75 = (void *)v74;
          if (v40)
          {
            v186 = v40;
            uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v186 count:1];
            LOBYTE(v133) = v145;
            uint64_t v21 = v151;
            v77 = [(PXSharedAlbumsActivityEntry *)v71 initWithPhotoLibrary:v150 uuid:v156 date:v72 type:v136 isFromMe:1 contributors:v73 avatarConfigurations:v75 albumGUID:v157 albumName:v151 cloudOwnerIsAllowlisted:v133 message:0 keyAssetUUIDs:v76 keyAssets:v42 relatedCommentUUID:0 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:v10];
          }
          else
          {
            LOBYTE(v133) = v145;
            uint64_t v21 = v151;
            v77 = [(PXSharedAlbumsActivityEntry *)v71 initWithPhotoLibrary:v150 uuid:v156 date:v72 type:v136 isFromMe:1 contributors:v73 avatarConfigurations:v74 albumGUID:v157 albumName:v151 cloudOwnerIsAllowlisted:v133 message:0 keyAssetUUIDs:MEMORY[0x1E4F1CBF0] keyAssets:v42 relatedCommentUUID:0 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:v10];
          }

          [v142 addObject:v77];
          goto LABEL_63;
        case 5:
        case 6:
          v152 = v21;
          uint64_t v43 = [v10 entryInvitationRecordGUID];
          v149 = v15;
          v156 = v30;
          v157 = v25;
          uint64_t v155 = v43;
          char v146 = v26;
          if (v43)
          {
            v44 = (void *)MEMORY[0x1E4F8A728];
            uint64_t v181 = v43;
            uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v181 count:1];
            v46 = [v44 cloudSharedAlbumInvitationRecordsWithGUIDs:v45 inLibrary:v135];
            v47 = [v46 firstObject];
          }
          else
          {
            v47 = 0;
          }
          v78 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
          v79 = [v47 inviteeEmails];
          v80 = [v79 firstObject];
          v81 = [v47 inviteePhones];
          v82 = [v81 firstObject];
          v83 = [v47 inviteeFirstName];
          v84 = [v47 inviteeLastName];
          v141 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)v78 initWithEmail:v80 phone:v82 firstName:v83 lastName:v84];

          v85 = [PXSharedAlbumsActivityEntryContributor alloc];
          uint64_t v86 = [v47 inviteeFullName];
          v87 = (void *)v86;
          if (v86) {
            v88 = (__CFString *)v86;
          }
          else {
            v88 = &stru_1F00B0030;
          }
          uint64_t v148 = (uint64_t)v47;
          v89 = [v47 inviteeEmails];
          v90 = [v89 firstObject];
          uint64_t v91 = [(PXSharedAlbumsActivityEntryContributor *)v85 initWithDisplayName:v88 email:v90];

          v92 = [v149 keyAssets];
          v93 = [v92 firstObject];
          v94 = [v93 uuid];

          if (v94)
          {
            v180 = v94;
            v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v180 count:1];
            v96 = [a1 _fetchAssetsWithUUIDs:v95 inPhotoLibrary:v150];
          }
          else
          {
            v96 = 0;
          }
          if ([v10 entryType] == 5) {
            uint64_t v97 = 6;
          }
          else {
            uint64_t v97 = 7;
          }
          v98 = [PXSharedAlbumsActivityEntry alloc];
          v99 = [v10 entryDate];
          v137 = (void *)v91;
          uint64_t v179 = v91;
          v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v179 count:1];
          v178 = v141;
          uint64_t v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v178 count:1];
          v102 = (void *)v101;
          if (v94)
          {
            v177 = v94;
            v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v177 count:1];
            LOBYTE(v133) = v146;
            v104 = [(PXSharedAlbumsActivityEntry *)v98 initWithPhotoLibrary:v150 uuid:v156 date:v99 type:v97 isFromMe:0 contributors:v100 avatarConfigurations:v102 albumGUID:v157 albumName:v152 cloudOwnerIsAllowlisted:v133 message:0 keyAssetUUIDs:v103 keyAssets:v96 relatedCommentUUID:0 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:v10];

            uint64_t v21 = v152;
          }
          else
          {
            LOBYTE(v133) = v146;
            uint64_t v21 = v152;
            v104 = [(PXSharedAlbumsActivityEntry *)v98 initWithPhotoLibrary:v150 uuid:v156 date:v99 type:v97 isFromMe:0 contributors:v100 avatarConfigurations:v101 albumGUID:v157 albumName:v152 cloudOwnerIsAllowlisted:v133 message:0 keyAssetUUIDs:MEMORY[0x1E4F1CBF0] keyAssets:v96 relatedCommentUUID:0 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:v10];
          }

          [v142 addObject:v104];
LABEL_63:

          id v15 = v149;
LABEL_64:
          uint64_t v30 = v156;
          id v25 = v157;
          id v48 = (id)v155;
          id v49 = (void *)v148;
          goto LABEL_65;
        default:
          goto LABEL_66;
      }
    }
  }
LABEL_83:

  uint64_t v127 = [v142 count];
  if (v127 != [obj count])
  {
    v128 = PLSharingGetLog();
    if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
    {
      uint64_t v129 = [v142 count];
      uint64_t v130 = [obj count];
      *(_DWORD *)buf = 134218240;
      uint64_t v174 = v129;
      __int16 v175 = 2048;
      uint64_t v176 = v130;
      _os_log_impl(&dword_1A9AE7000, v128, OS_LOG_TYPE_INFO, "[ActivityEntry] Produced %lu activity entries from %lu cloud feed entries", buf, 0x16u);
    }
  }
  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = __109__PXSharedAlbumsActivityEntry__activitiesFromCloudFeedEntries_inMostRecentOrder_photoLibrary_plPhotoLibrary___block_invoke_330;
  v158[3] = &__block_descriptor_33_e69_q24__0__PXSharedAlbumsActivityEntry_8__PXSharedAlbumsActivityEntry_16l;
  BOOL v159 = v134;
  [v142 sortUsingComparator:v158];
  v131 = (void *)[v142 copy];

  return v131;
}

void __109__PXSharedAlbumsActivityEntry__activitiesFromCloudFeedEntries_inMostRecentOrder_photoLibrary_plPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 isMyComment];
  unsigned int v5 = [v4 BOOLValue];

  uint64_t v6 = [v3 commenterDisplayName];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_1F00B0030;
  }
  uint64_t v9 = v8;

  char v10 = [PXSharedAlbumsActivityEntryContributor alloc];
  id v11 = [v3 commenterEmail];
  uint64_t v54 = [(PXSharedAlbumsActivityEntryContributor *)v10 initWithDisplayName:v9 email:v11];

  uint64_t v12 = [v3 commentText];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = &stru_1F00B0030;
  }
  id v15 = v14;

  uint64_t v16 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
  uint64_t v17 = [v3 commenterEmail];
  uint64_t v18 = [v3 commenterFirstName];
  id v19 = [v3 commenterLastName];
  uint64_t v55 = [(PXSharedAlbumsActivityEntryAvatarConfiguration *)v16 initWithEmail:v17 phone:0 firstName:v18 lastName:v19];

  uint64_t v20 = [v3 cloudGUID];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [v3 shortObjectIDURI];
  }
  BOOL v23 = v22;

  if ([v23 length])
  {
    uint64_t v24 = [v3 commentedAsset];
    if (v24)
    {
      [v3 commentedAsset];
      unsigned int v25 = v5;
      v27 = char v26 = v23;
      long long v28 = [v27 uuid];
      id v58 = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];

      BOOL v23 = v26;
      unsigned int v5 = v25;
    }
    else
    {
      uint64_t v29 = MEMORY[0x1E4F1CBF0];
    }

    id v49 = [*(id *)(a1 + 80) _fetchAssetsWithUUIDs:v29 inPhotoLibrary:*(void *)(a1 + 32)];
    id v51 = v23;
    id v48 = [NSString stringWithFormat:@"%@_comment_%@", *(void *)(a1 + 40), v23];
    long long v32 = [v3 commentDate];
    uint64_t v33 = v32;
    v53 = v15;
    unsigned int v52 = v5;
    char v50 = v29;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      id v34 = [*(id *)(a1 + 48) entryDate];
    }
    v47 = v34;

    uint64_t v35 = [PXSharedAlbumsActivityEntry alloc];
    uint64_t v45 = *(void *)(a1 + 32);
    v46 = v35;
    v57 = v54;
    uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    uint64_t v56 = v55;
    uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    uint64_t v39 = *(void *)(a1 + 56);
    uint64_t v38 = *(void *)(a1 + 64);
    char v40 = *(unsigned char *)(a1 + 88);
    v41 = [v3 cloudGUID];
    LOBYTE(v44) = v40;
    uint64_t v43 = v39;
    uint64_t v30 = v50;
    id v42 = [(PXSharedAlbumsActivityEntry *)v46 initWithPhotoLibrary:v45 uuid:v48 date:v47 type:2 isFromMe:v52 contributors:v36 avatarConfigurations:v37 albumGUID:v43 albumName:v38 cloudOwnerIsAllowlisted:v44 message:v15 keyAssetUUIDs:v50 keyAssets:v49 relatedCommentUUID:v41 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:*(void *)(a1 + 48)];

    [*(id *)(a1 + 72) addObject:v42];
    id v15 = v53;

    id v31 = (void *)v55;
    BOOL v23 = v51;
  }
  else
  {
    uint64_t v30 = PLSharingGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v60 = v3;
      _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_ERROR, "cloudGUID and shortObjectIDURI was missing for PLCloudSharedComment (comment): %@. Skipping.", buf, 0xCu);
    }
    id v31 = (void *)v55;
  }
}

uint64_t __109__PXSharedAlbumsActivityEntry__activitiesFromCloudFeedEntries_inMostRecentOrder_photoLibrary_plPhotoLibrary___block_invoke_330(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = v6;
  if (v4)
  {
    id v8 = [v5 date];

    uint64_t v9 = [v7 date];
  }
  else
  {
    id v8 = [v6 date];

    uint64_t v9 = [v5 date];
  }
  uint64_t v10 = [v8 compare:v9];

  return v10;
}

+ (id)_fetchRecentActivitiesWithOptions:(id)a3 olderThanDate:(id)a4 filter:(int64_t)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = PLSharedAlbumsGetLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    uint64_t v14 = [v8 fetchLimit];
    id v15 = NSStringFromPLCloudFeedEntryFilter();
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v42) = v9 != 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SharedAlbumsRecentActivityFetchDuration", "FetchLimit=%lu,Filter=%@,FetchingMore=%d", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v42 = __Block_byref_object_copy__124834;
  uint64_t v43 = __Block_byref_object_dispose__124835;
  id v44 = 0;
  uint64_t v16 = [v8 photoLibrary];
  uint64_t v17 = [v16 photoLibraryForCurrentQueueQoS];
  uint64_t v18 = [v8 fetchLimit];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __86__PXSharedAlbumsActivityEntry__fetchRecentActivitiesWithOptions_olderThanDate_filter___block_invoke;
  v31[3] = &unk_1E5DBC7B0;
  id v19 = v17;
  id v32 = v19;
  id v20 = v9;
  uint64_t v36 = v18;
  int64_t v37 = a5;
  id v33 = v20;
  uint64_t v35 = buf;
  id v38 = a1;
  id v21 = v16;
  id v34 = v21;
  [v19 performBlockAndWait:v31];
  id v22 = +[PXSharedAlbumsSettings sharedInstance];
  LODWORD(v16) = [v22 simulateEmptyActivityEntries];

  if (v16)
  {
    BOOL v23 = PLSharingGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [*(id *)(*(void *)&buf[8] + 40) count];
      *(_DWORD *)uint64_t v39 = 134217984;
      uint64_t v40 = v24;
      _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEFAULT, "Received %lu activities, but simulating empty activities, so setting to 0 activities", v39, 0xCu);
    }

    unsigned int v25 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = MEMORY[0x1E4F1CBF0];
  }
  id v26 = objc_alloc(MEMORY[0x1E4F39150]);
  id v27 = (void *)[v26 initWithObjects:*(void *)(*(void *)&buf[8] + 40) photoLibrary:v21 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  long long v28 = v13;
  uint64_t v29 = v28;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)uint64_t v39 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v29, OS_SIGNPOST_INTERVAL_END, v11, "SharedAlbumsRecentActivityFetchDuration", "", v39, 2u);
  }

  _Block_object_dispose(buf, 8);
  return v27;
}

void __86__PXSharedAlbumsActivityEntry__fetchRecentActivitiesWithOptions_olderThanDate_filter___block_invoke(void *a1)
{
  id v5 = [MEMORY[0x1E4F8A710] recentEntriesInLibrary:a1[4] earliestDate:0 latestDate:a1[5] limit:a1[8] filter:a1[9] sortDescriptors:0];
  uint64_t v2 = [(id)objc_opt_class() _activitiesFromCloudFeedEntries:v5 inMostRecentOrder:1 photoLibrary:a1[6] plPhotoLibrary:a1[4]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (unint64_t)fetchCountOfRecentFeedActivitiesWithOptions:(id)a3 newerThanDate:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v7 = PLSharedAlbumsGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v11 = [v5 fetchLimit];
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = v11;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SharedAlbumsCountOfRecentFeedActivitiesDuration", "FetchLimit=%lu,earliestDate=%@", buf, 0x16u);
  }

  uint64_t v12 = [v5 photoLibrary];
  id v13 = [v12 photoLibraryForCurrentQueueQoS];
  uint64_t v14 = [v5 fetchLimit];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__PXSharedAlbumsActivityEntry_fetchCountOfRecentFeedActivitiesWithOptions_newerThanDate___block_invoke;
  v21[3] = &unk_1E5DCC9F8;
  id v15 = v13;
  id v22 = v15;
  id v16 = v6;
  uint64_t v25 = v14;
  uint64_t v26 = 2;
  id v23 = v16;
  uint64_t v24 = &v27;
  [v15 performBlockAndWait:v21];
  uint64_t v17 = v10;
  uint64_t v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "SharedAlbumsCountOfRecentFeedActivitiesDuration", "", buf, 2u);
  }

  unint64_t v19 = v28[3];
  _Block_object_dispose(&v27, 8);

  return v19;
}

void __89__PXSharedAlbumsActivityEntry_fetchCountOfRecentFeedActivitiesWithOptions_newerThanDate___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [MEMORY[0x1E4F8A710] recentEntriesInLibrary:a1[4] earliestDate:a1[5] latestDate:0 limit:a1[7] filter:a1[8] sortDescriptors:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        os_signpost_id_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 entryAlbumGUID];
        uint64_t v10 = [v2 objectForKeyedSubscript:v9];
        if (!v10)
        {
          uint64_t v11 = (void *)MEMORY[0x1E4F8A720];
          uint64_t v12 = [v8 photoLibrary];
          uint64_t v10 = [v11 cloudSharedAlbumWithGUID:v9 inLibrary:v12];

          [v2 setObject:v10 forKeyedSubscript:v9];
        }
        if ([v10 cloudNotificationsEnabled]) {
          ++*(void *)(*(void *)(a1[6] + 8) + 24);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

+ (id)fetchRecentActivitiesWithOptions:(id)a3 olderThanDate:(id)a4 filter:(int64_t)a5
{
  if (a5 == 2) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = a5 == 1;
  }
  return (id)[a1 _fetchRecentActivitiesWithOptions:a3 olderThanDate:a4 filter:v5];
}

+ (id)fetchActivitiesWithOptions:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__124834;
  long long v28 = __Block_byref_object_dispose__124835;
  id v29 = 0;
  uint64_t v5 = [v4 photoLibrary];
  uint64_t v6 = [v4 photoLibrary];
  id v7 = [v6 photoLibraryForCurrentQueueQoS];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__PXSharedAlbumsActivityEntry_fetchActivitiesWithOptions___block_invoke;
  v18[3] = &unk_1E5DC6B80;
  id v8 = v4;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v22 = &v24;
  id v23 = a1;
  id v10 = v5;
  id v21 = v10;
  [v9 performBlockAndWait:v18];
  uint64_t v11 = +[PXSharedAlbumsSettings sharedInstance];
  LODWORD(v6) = [v11 simulateEmptyActivityEntries];

  if (v6)
  {
    uint64_t v12 = PLSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(id)v25[5] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Received %lu activities, but simulating empty activities, so setting to 0 activities", buf, 0xCu);
    }

    long long v14 = (void *)v25[5];
    v25[5] = MEMORY[0x1E4F1CBF0];
  }
  id v15 = objc_alloc(MEMORY[0x1E4F39150]);
  long long v16 = (void *)[v15 initWithObjects:v25[5] photoLibrary:v10 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  _Block_object_dispose(&v24, 8);
  return v16;
}

void __58__PXSharedAlbumsActivityEntry_fetchActivitiesWithOptions___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reverseSortOrder]) {
    objc_msgSend(MEMORY[0x1E4F8A710], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", *(void *)(a1 + 40), 0, 0, objc_msgSend(*(id *)(a1 + 32), "fetchLimit"), 0, 0);
  }
  else {
  id v5 = [MEMORY[0x1E4F8A710] allEntriesInLibrary:*(void *)(a1 + 40)];
  }
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "_activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:", v5, objc_msgSend(*(id *)(a1 + 32), "reverseSortOrder"), *(void *)(a1 + 48), *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)fetchAssetsMockActivitiesWithOptions:(id)a3
{
  v92[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];
  [v4 setIncludeAllPhotosSmartAlbum:1];
  id v48 = v4;
  id v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000205 options:v4];
  uint64_t v6 = [v5 firstObject];

  __int16 v72 = v3;
  id v7 = [v3 librarySpecificFetchOptions];
  [v7 setFetchLimit:10];
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v92[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:1];
  [v7 setSortDescriptors:v9];

  v46 = v7;
  v47 = (void *)v6;
  id v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v7];
  id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = v10;
  uint64_t v51 = [obj countByEnumeratingWithState:&v74 objects:v91 count:16];
  if (v51)
  {
    uint64_t v50 = *(void *)v75;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v75 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v74 + 1) + 8 * v11);
        uint64_t v70 = v11;
        id v64 = [[PXSharedAlbumsActivityEntryContributor alloc] initWithDisplayName:@"Jane" email:0];
        v68 = [[PXSharedAlbumsActivityEntryAvatarConfiguration alloc] initWithEmail:0 phone:0 firstName:@"Jane" lastName:0];
        uint64_t v13 = [PXSharedAlbumsActivityEntry alloc];
        long long v14 = [MEMORY[0x1E4F29128] UUID];
        id v15 = [v14 UUIDString];
        long long v16 = [v12 creationDate];
        v90 = v64;
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
        v89 = v68;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
        id v19 = [v12 uuid];
        v88 = v19;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
        LOBYTE(v43) = 1;
        id v21 = [(PXSharedAlbumsActivityEntry *)v13 initWithPhotoLibrary:v72 uuid:v15 date:v16 type:0 isFromMe:0 contributors:v17 avatarConfigurations:v18 albumGUID:&stru_1F00B0030 albumName:@"Faves" cloudOwnerIsAllowlisted:v43 message:@"Look what we did!" keyAssetUUIDs:v20 keyAssets:0 relatedCommentUUID:0 relatedUUIDs:MEMORY[0x1E4F1CBF0] underlyingObject:0];

        id v71 = v21;
        [v73 addObject:v21];
        id v60 = [[PXSharedAlbumsActivityEntryContributor alloc] initWithDisplayName:@"Mel" email:0];

        id v65 = [[PXSharedAlbumsActivityEntryAvatarConfiguration alloc] initWithEmail:0 phone:0 firstName:@"Mel" lastName:0];
        id v22 = [PXSharedAlbumsActivityEntry alloc];
        v62 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v56 = [v62 UUIDString];
        objc_super v67 = v12;
        uint64_t v54 = [v12 creationDate];
        v87 = v60;
        unsigned int v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
        uint64_t v86 = v65;
        id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
        id v58 = [v12 uuid];
        v85 = v58;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
        uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v26 = [v25 UUIDString];
        uint64_t v27 = [(PXSharedAlbumsActivityEntry *)v21 uuid];
        v84 = v27;
        long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
        LOBYTE(v44) = 1;
        v69 = [(PXSharedAlbumsActivityEntry *)v22 initWithPhotoLibrary:v72 uuid:v56 date:v54 type:1 isFromMe:0 contributors:v52 avatarConfigurations:v23 albumGUID:&stru_1F00B0030 albumName:@"Faves" cloudOwnerIsAllowlisted:v44 message:@"❤️" keyAssetUUIDs:v24 keyAssets:0 relatedCommentUUID:v26 relatedUUIDs:v28 underlyingObject:0];

        [v73 addObject:v69];
        v63 = [[PXSharedAlbumsActivityEntryContributor alloc] initWithDisplayName:@"Chris" email:0];

        uint64_t v61 = [[PXSharedAlbumsActivityEntryAvatarConfiguration alloc] initWithEmail:0 phone:0 firstName:@"Chris" lastName:0];
        uint64_t v59 = [PXSharedAlbumsActivityEntry alloc];
        id v66 = [MEMORY[0x1E4F29128] UUID];
        v53 = [v66 UUIDString];
        v57 = [v67 creationDate];
        v83 = v63;
        uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
        v82 = v61;
        id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
        uint64_t v30 = [v67 uuid];
        v81 = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
        uint64_t v32 = [MEMORY[0x1E4F29128] UUID];
        __int16 v33 = [v32 UUIDString];
        id v34 = [(PXSharedAlbumsActivityEntry *)v71 uuid];
        v80 = v34;
        uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
        LOBYTE(v45) = 1;
        uint64_t v36 = [(PXSharedAlbumsActivityEntry *)v59 initWithPhotoLibrary:v72 uuid:v53 date:v57 type:2 isFromMe:0 contributors:v55 avatarConfigurations:v29 albumGUID:&stru_1F00B0030 albumName:@"Faves" cloudOwnerIsAllowlisted:v45 message:@"Neat!" keyAssetUUIDs:v31 keyAssets:0 relatedCommentUUID:v33 relatedUUIDs:v35 underlyingObject:0];

        [v73 addObject:v36];
        uint64_t v11 = v70 + 1;
      }
      while (v51 != v70 + 1);
      uint64_t v51 = [obj countByEnumeratingWithState:&v74 objects:v91 count:16];
    }
    while (v51);
  }

  int64_t v37 = +[PXSharedAlbumsSettings sharedInstance];
  int v38 = [v37 simulateEmptyActivityEntries];

  if (v38)
  {
    uint64_t v39 = PLSharingGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v73 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v79 = v40;
      _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_DEFAULT, "Received %lu activities, but simulating empty activities, so setting to 0 activities", buf, 0xCu);
    }

    [v73 removeAllObjects];
  }
  v41 = (void *)[objc_alloc(MEMORY[0x1E4F39150]) initWithObjects:v73 photoLibrary:v72 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v41;
}

@end