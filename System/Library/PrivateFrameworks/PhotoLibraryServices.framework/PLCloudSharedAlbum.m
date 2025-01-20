@interface PLCloudSharedAlbum
+ (id)allCloudSharedAlbumsInLibrary:(id)a3;
+ (id)cloudOwnerDisplayNameWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emailKey:(id)a6 includingEmail:(BOOL)a7 allowsEmail:(BOOL)a8 emailAddressManager:(id)a9;
+ (id)cloudSharedAlbumWithGUID:(id)a3 inLibrary:(id)a4;
+ (id)cloudSharedAlbumWithObjectID:(id)a3 managedObjectContext:(id)a4;
+ (id)entityName;
+ (id)lightweightReimportDirectoryNameWithGUID:(id)a3 cloudPersonID:(id)a4;
+ (id)localizedSharedByLabelWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emailKey:(id)a6 isOwned:(BOOL)a7 allowsEmail:(BOOL)a8 emailAddressManager:(id)a9;
- (BOOL)canContributeToCloudSharedAlbum;
- (BOOL)hasUnseenContentBoolValue;
- (BOOL)isFamilyCloudSharedAlbum;
- (BOOL)isMultipleContributorCloudSharedAlbum;
- (BOOL)isOwnedCloudSharedAlbum;
- (NSDate)cloudFirstRecentBatchDate;
- (NSString)cloudOwnerEmail;
- (NSString)localizedSharedWithLabel;
- (id)albumDirectoryPath;
- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4;
- (id)emailAddressManager;
- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3;
- (id)sortDescriptorsForKeyAssetsCandidates;
- (id)sortingComparator;
- (int)cloudRelationshipStateLocalValue;
- (int)cloudRelationshipStateValue;
- (unint64_t)unseenAssetsCountIntegerValue;
- (void)awakeFromInsert;
- (void)delete;
- (void)deleteFromDatabaseOnly;
- (void)getUnseenStartMarkerIndex:(unint64_t *)a3 count:(unint64_t *)a4 showsProgress:(BOOL *)a5;
- (void)persistRecoveryMetadata;
- (void)prepareForDeletion;
- (void)publishBatchOfOriginalAssetUUIDs:(id)a3 withBatchCommentText:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 andTrimmedVideoPathInfo:(id)a7 isNewAlbum:(BOOL)a8;
- (void)setCloudOwnerEmail:(id)a3;
- (void)setHasUnseenContentBoolValue:(BOOL)a3;
- (void)setUnseenAssetsCountIntegerValue:(unint64_t)a3;
- (void)updateCloudLastContributionDateWithDate:(id)a3;
- (void)updateCloudLastInterestingChangeDateWithDate:(id)a3;
- (void)userDeleteSubscriberRecord:(id)a3;
- (void)willSave;
@end

@implementation PLCloudSharedAlbum

- (void)persistRecoveryMetadata
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:7];
  v4 = [(PLCloudSharedAlbum *)self cloudRelationshipState];

  if (v4)
  {
    v5 = [(PLCloudSharedAlbum *)self cloudRelationshipState];
    [v3 setObject:v5 forKey:@"cloudRelationshipState"];
  }
  v6 = [(PLCloudSharedAlbum *)self cloudOwnerFirstName];

  if (v6)
  {
    v7 = [(PLCloudSharedAlbum *)self cloudOwnerFirstName];
    [v3 setObject:v7 forKey:@"cloudOwnerFirstName"];
  }
  v8 = [(PLCloudSharedAlbum *)self cloudOwnerLastName];

  if (v8)
  {
    v9 = [(PLCloudSharedAlbum *)self cloudOwnerLastName];
    [v3 setObject:v9 forKey:@"cloudOwnerLastName"];
  }
  v10 = [(PLCloudSharedAlbum *)self cloudOwnerEmail];

  if (v10)
  {
    v11 = [(PLCloudSharedAlbum *)self cloudOwnerEmail];
    [v3 setObject:v11 forKey:@"cloudOwnerEmail"];
  }
  v12 = [(PLCloudSharedAlbum *)self cloudOwnerHashedPersonID];

  if (v12)
  {
    v13 = [(PLCloudSharedAlbum *)self cloudOwnerHashedPersonID];
    [v3 setObject:v13 forKey:@"cloudOwnerHashedPersonID"];
  }
  v14 = [(PLCloudSharedAlbum *)self cloudSubscriptionDate];

  if (v14)
  {
    v15 = [(PLCloudSharedAlbum *)self cloudSubscriptionDate];
    [v3 setObject:v15 forKey:@"cloudSubscriptionDate"];
  }
  v16 = [(PLCloudSharedAlbum *)self title];

  if (v16)
  {
    v17 = [(PLCloudSharedAlbum *)self title];
    [v3 setObject:v17 forKey:@"title"];
  }
  v18 = [(PLCloudSharedAlbum *)self cloudPublicURLEnabled];

  if (v18)
  {
    v19 = [(PLCloudSharedAlbum *)self cloudPublicURLEnabled];
    [v3 setObject:v19 forKey:@"cloudPublicURLEnabled"];
  }
  v20 = [(PLCloudSharedAlbum *)self publicURL];

  if (v20)
  {
    v21 = [(PLCloudSharedAlbum *)self publicURL];
    [v3 setObject:v21 forKey:@"publicURL"];
  }
  if ([v3 count])
  {
    v22 = [(PLCloudSharedAlbum *)self albumDirectoryPath];
    v23 = [v22 stringByAppendingPathComponent:@"Info.plist"];

    if (v23)
    {
      v24 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:100 options:0 error:0];
      if (([v24 writeToFile:v23 options:1073741825 error:0] & 1) == 0)
      {
        uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        v26 = [(PLCloudSharedAlbum *)self albumDirectoryPath];
        [(id)v25 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];

        id v29 = 0;
        LOBYTE(v25) = [v24 writeToFile:v23 options:1073741825 error:&v29];
        id v27 = v29;
        if ((v25 & 1) == 0)
        {
          v28 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v31 = v3;
            __int16 v32 = 2112;
            v33 = v23;
            __int16 v34 = 2112;
            id v35 = v27;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to write recovery metadata %@ to %@: %@", buf, 0x20u);
          }
        }
      }
    }
    else
    {
      v24 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v3;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Missing path to persist recovery metadata %@ for cloud shared album", buf, 0xCu);
      }
    }
  }
}

- (void)userDeleteSubscriberRecord:(id)a3
{
  v4 = (PLCloudSharedAlbum *)a3;
  if (v4)
  {
    v9 = v4;
    v5 = [(PLCloudSharedAlbum *)self isOwned];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v9];
      +[PLPhotoSharingHelper removeSubscribers:v7 fromOwnedAlbum:self];

      v8 = v9;
    }
    else
    {
      +[PLPhotoSharingHelper unsubscribeFromAlbum:self];
      v8 = self;
    }
    [(PLCloudSharedAlbum *)v8 delete];
    v4 = v9;
  }
}

- (void)setCloudOwnerEmail:(id)a3
{
  id v4 = a3;
  v5 = [(PLCloudSharedAlbum *)self emailAddressManager];
  id v6 = [v5 keyForEmailAddress:v4];

  [(PLCloudSharedAlbum *)self setCloudOwnerEmailKey:v6];
}

- (NSString)cloudOwnerEmail
{
  v3 = [(PLCloudSharedAlbum *)self emailAddressManager];
  id v4 = [(PLCloudSharedAlbum *)self cloudOwnerEmailKey];
  v5 = [v3 emailAddressForKey:v4];

  if (!v5)
  {
    id v6 = [(PLGenericAlbum *)self photoLibrary];
    v7 = [v6 personInfoManager];
    v8 = [(PLCloudSharedAlbum *)self cloudOwnerHashedPersonID];
    v5 = [v7 emailForPersonID:v8];

    if (!v5)
    {
      if ((PLIsAssetsd() & 1) == 0) {
        +[PLUserActivityDaemonJob checkedSharedAlbumServerModelRelationships];
      }
      v5 = 0;
    }
  }
  return (NSString *)v5;
}

- (void)publishBatchOfOriginalAssetUUIDs:(id)a3 withBatchCommentText:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 andTrimmedVideoPathInfo:(id)a7 isNewAlbum:(BOOL)a8
{
}

- (void)updateCloudLastContributionDateWithDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLCloudSharedAlbum *)self cloudLastContributionDate];
  id v6 = (void *)v5;
  if (v4 && (!v5 || [v4 compare:v5] == 1))
  {
    v7 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(PLGenericAlbum *)self localizedTitle];
      int v9 = 138412546;
      v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Updating album last contribution date: %@ %@", (uint8_t *)&v9, 0x16u);
    }
    [(PLCloudSharedAlbum *)self setCloudLastContributionDate:v4];
  }
}

- (void)updateCloudLastInterestingChangeDateWithDate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLCloudSharedAlbum *)self cloudLastInterestingChangeDate];
  id v6 = (void *)v5;
  if (v4 && (!v5 || [v4 compare:v5] == 1))
  {
    v7 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(PLGenericAlbum *)self localizedTitle];
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Updating album updated date: %@ %@", buf, 0x16u);
    }
    [(PLCloudSharedAlbum *)self setCloudLastInterestingChangeDate:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v9 = [(PLCloudSharedAlbum *)self albumLists];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) setNeedsReordering];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(PLCloudSharedAlbum *)self cloudOwnerFirstName];
  v8 = [(PLCloudSharedAlbum *)self cloudOwnerLastName];
  int v9 = [(PLCloudSharedAlbum *)self cloudOwnerFullName];
  uint64_t v10 = [(PLCloudSharedAlbum *)self cloudOwnerEmailKey];
  uint64_t v11 = [(PLCloudSharedAlbum *)self emailAddressManager];
  uint64_t v12 = +[PLCloudSharedAlbum cloudOwnerDisplayNameWithFirstName:v7 lastName:v8 fullName:v9 emailKey:v10 includingEmail:v5 allowsEmail:v4 emailAddressManager:v11];

  return v12;
}

- (NSDate)cloudFirstRecentBatchDate
{
  uint64_t v8 = 0;
  [(PLCloudSharedAlbum *)self getUnseenStartMarkerIndex:&v8 count:0 showsProgress:0];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || ([(PLCloudSharedAlbum *)self assets],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectAtIndex:v8],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    BOOL v5 = [(PLCloudSharedAlbum *)self assets];
    BOOL v4 = [v5 lastObject];
  }
  id v6 = [v4 cloudBatchPublishDate];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  }

  return (NSDate *)v6;
}

- (BOOL)canContributeToCloudSharedAlbum
{
  v3 = [(PLCloudSharedAlbum *)self isOwned];
  if ([v3 BOOLValue])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(PLCloudSharedAlbum *)self cloudMultipleContributorsEnabled];
    char v4 = [v5 BOOLValue];
  }
  return v4;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  v2 = [(PLCloudSharedAlbum *)self cloudMultipleContributorsEnabled];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isFamilyCloudSharedAlbum
{
  return [(PLCloudSharedAlbum *)self cloudAlbumSubtype] == 1;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  v2 = [(PLCloudSharedAlbum *)self isOwned];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)localizedSharedWithLabel
{
  char v3 = [(PLCloudSharedAlbum *)self cloudAlbumSubscriberRecords];
  uint64_t v4 = [v3 count];
  if ([(PLCloudSharedAlbum *)self isOwnedCloudSharedAlbum])
  {
    if (v4 == 1)
    {
      uint64_t v8 = PLServicesLocalizedFrameworkString();
      int v9 = [v3 firstObject];
      uint64_t v10 = [v9 inviteeDisplayNameIncludingEmail:0];

      BOOL v5 = PFStringWithValidatedFormat();
    }
    else
    {
      if (!v4)
      {
        BOOL v5 = PLServicesLocalizedFrameworkString();
        goto LABEL_9;
      }
      uint64_t v8 = PLServicesLocalizedFrameworkString();
      BOOL v5 = PFStringWithValidatedFormat();
    }
  }
  else
  {
    id v6 = PLServicesLocalizedFrameworkString();
    v7 = [(PLCloudSharedAlbum *)self cloudOwnerDisplayNameIncludingEmail:0 allowsEmail:1];
    BOOL v5 = PFStringWithValidatedFormat();
  }
LABEL_9:

  return (NSString *)v5;
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PLCloudSharedAlbum *)self isOwnedCloudSharedAlbum];
  id v6 = [(PLCloudSharedAlbum *)self cloudOwnerFirstName];
  v7 = [(PLCloudSharedAlbum *)self cloudOwnerLastName];
  uint64_t v8 = [(PLCloudSharedAlbum *)self cloudOwnerFullName];
  int v9 = [(PLCloudSharedAlbum *)self cloudOwnerEmailKey];
  uint64_t v10 = [(PLCloudSharedAlbum *)self emailAddressManager];
  uint64_t v11 = +[PLCloudSharedAlbum localizedSharedByLabelWithFirstName:v6 lastName:v7 fullName:v8 emailKey:v9 isOwned:v5 allowsEmail:v3 emailAddressManager:v10];

  return v11;
}

- (id)emailAddressManager
{
  v2 = [(PLGenericAlbum *)self photoLibrary];
  BOOL v3 = [v2 libraryBundle];
  uint64_t v4 = [v3 emailAddressManager];

  return v4;
}

- (int)cloudRelationshipStateLocalValue
{
  v2 = [(PLCloudSharedAlbum *)self cloudRelationshipState];
  int v3 = [v2 intValue];

  return v3;
}

- (int)cloudRelationshipStateValue
{
  v2 = [(PLCloudSharedAlbum *)self cloudRelationshipState];
  int v3 = [v2 intValue];

  return v3;
}

- (id)sortingComparator
{
  v2 = (void *)[&__block_literal_global_73016 copy];
  return v2;
}

uint64_t __39__PLCloudSharedAlbum_sortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 cloudBatchPublishDate];
  uint64_t v7 = [v5 cloudBatchPublishDate];
  uint64_t v8 = (void *)v7;
  if (v6 && v7)
  {
    int v9 = [v4 cloudBatchPublishDate];
    uint64_t v10 = [v5 cloudBatchPublishDate];
    uint64_t v11 = [v9 compare:v10];
  }
  else
  {
    uint64_t v11 = v7 != 0;
    if (v6)
    {
      uint64_t v11 = -1;
      goto LABEL_9;
    }
  }
  if (!v11)
  {
    uint64_t v12 = [v4 dateCreated];
    uint64_t v13 = [v5 dateCreated];
    uint64_t v11 = [v12 compare:v13];

    if (!v11)
    {
      long long v14 = [v4 cloudAssetGUID];
      long long v15 = [v5 cloudAssetGUID];
      uint64_t v11 = [v14 compare:v15];
    }
  }
LABEL_9:

  return v11;
}

- (id)sortDescriptorsForKeyAssetsCandidates
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"albums" ascending:0];
  v5[0] = v2;
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)delete
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(&self->super.super.didRegisteredWithUserInterfaceContext + 3))
  {
    int v3 = 0;
  }
  else
  {
    int v3 = [(PLCloudSharedAlbum *)self albumDirectoryPath];
    id v4 = [(PLGenericAlbum *)self photoLibrary];
    id v5 = [v4 pathManager];
    [(PLManagedAlbum *)self removePersistedFileSystemDataWithPathManager:v5];
  }
  id v6 = [(PLCloudSharedAlbum *)self assets];
  uint64_t v7 = (void *)[v6 copy];

  v24.receiver = self;
  v24.super_class = (Class)PLCloudSharedAlbum;
  [(PLGenericAlbum *)&v24 delete];
  uint64_t v8 = [NSString stringWithFormat:@"[Shared Streams]The shared album %@ was deleted, removing all of its assets.", v3];
  int v9 = +[PLAssetTransactionReason transactionReason:v8];

  uint64_t v10 = [(PLCloudSharedAlbum *)self managedObjectContext];
  uint64_t v11 = [v7 array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __28__PLCloudSharedAlbum_delete__block_invoke;
  v22[3] = &unk_1E5875CB8;
  v22[4] = self;
  id v12 = v9;
  id v23 = v12;
  uint64_t v13 = [v10 enumerateWithIncrementalSaveUsingObjects:v11 withBlock:v22];

  if (v13)
  {
    long long v14 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to save the deletion of shared album assets. Error: %@", buf, 0xCu);
    }
  }
  if (v3)
  {
    long long v15 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v3;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "deleting album directory path %@", buf, 0xCu);
    }

    long long v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    char v17 = [v16 removeItemAtPath:v3 error:&v21];
    id v18 = v21;

    if ((v17 & 1) == 0)
    {
      v19 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v18;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "error %@", buf, 0xCu);
      }
    }
  }
  if (!*(&self->super.super.didRegisteredWithUserInterfaceContext + 3))
  {
    v20 = [(PLCloudSharedAlbum *)self cloudGUID];
    +[PLPhotoSharingHelper deleteDebugBreadcrumbsForAlbumGUID:v20];
  }
}

void __28__PLCloudSharedAlbum_delete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isCloudSharedAsset])
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 117))
    {
      [v3 deleteFromDatabaseOnly];
    }
    else
    {
      id v4 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [v3 pathForOriginalFile];
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "deleting asset at path %@", (uint8_t *)&v6, 0xCu);
      }
      [v3 deleteWithReason:*(void *)(a1 + 40)];
    }
  }
}

- (void)deleteFromDatabaseOnly
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PLCloudSharedAlbum.m" lineNumber:176 description:@"deleteFromDatabaseOnly is only safe from inside of assetsd!"];
  }
  *(&self->super.super.didRegisteredWithUserInterfaceContext + 3) = 1;
  [(PLCloudSharedAlbum *)self delete];
}

- (id)albumDirectoryPath
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLCloudSharedAlbum *)self cloudGUID];
  if (([v3 hasPrefix:@"FS-"] & 1) != 0
    || (id v4 = v3, [v3 hasPrefix:@"fs-"]))
  {
    id v4 = [v3 substringFromIndex:3];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  if (v5)
  {
    int v6 = [(PLCloudSharedAlbum *)self cloudPersonID];
    uint64_t v7 = [(PLCloudSharedAlbum *)self managedObjectContext];
    uint64_t v8 = [v7 pathManager];
    int v9 = [v8 photoDirectoryWithType:22];

    if ([v6 length])
    {
      if (v6)
      {
LABEL_7:
        uint64_t v10 = [v9 stringByAppendingPathComponent:v6];
        uint64_t v11 = [v10 stringByAppendingPathComponent:v3];

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      long long v14 = [v9 stringByAppendingPathComponent:@"personID"];
      uint64_t v15 = [NSString stringWithContentsOfFile:v14 encoding:4 error:0];

      int v6 = (void *)v15;
      if (v15) {
        goto LABEL_7;
      }
    }
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  id v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = [(PLCloudSharedAlbum *)self uuid];
    int v17 = 138412546;
    id v18 = v3;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Invalid cloudGIUD (%@) for album (uuid: %@)", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v11 = 0;
LABEL_14:

  return v11;
}

- (void)prepareForDeletion
{
  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbum;
  [(PLManagedAlbum *)&v5 prepareForDeletion];
  id v3 = [(PLCloudSharedAlbum *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 mergingChanges] & 1) == 0)
  {
    id v4 = [v3 delayedSaveActions];
    [v4 recordAlbumForCloudFeedUpdate:self];
  }
}

- (void)willSave
{
  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbum;
  [(PLManagedAlbum *)&v5 willSave];
  id v3 = [(PLCloudSharedAlbum *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 delayedSaveActions];
    [v4 recordAlbumForCloudFeedUpdate:self];
  }
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedAlbum;
  [(PLGenericAlbum *)&v4 awakeFromInsert];
  [(PLGenericAlbum *)self setKindValue:1505];
  id v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLCloudSharedAlbum *)self setCloudGUID:v3];
}

- (void)getUnseenStartMarkerIndex:(unint64_t *)a3 count:(unint64_t *)a4 showsProgress:(BOOL *)a5
{
  unint64_t v9 = [(PLCloudSharedAlbum *)self unseenAssetsCountIntegerValue];
  if (v9)
  {
    uint64_t v10 = [(PLCloudSharedAlbum *)self assets];
    uint64_t v11 = [v10 count];

    int64_t v12 = v11 - v9;
    if (!a3) {
      goto LABEL_6;
    }
  }
  else
  {
    int64_t v12 = -1;
    if (!a3) {
      goto LABEL_6;
    }
  }
  if (v12 < 0) {
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *a3 = v12;
LABEL_6:
  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = 0;
  }
}

- (void)setUnseenAssetsCountIntegerValue:(unint64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(PLCloudSharedAlbum *)self setUnseenAssetsCount:v4];
}

- (unint64_t)unseenAssetsCountIntegerValue
{
  v2 = [(PLCloudSharedAlbum *)self unseenAssetsCount];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setHasUnseenContentBoolValue:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(PLCloudSharedAlbum *)self setHasUnseenContent:v4];
}

- (BOOL)hasUnseenContentBoolValue
{
  v2 = [(PLCloudSharedAlbum *)self hasUnseenContent];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)lightweightReimportDirectoryNameWithGUID:(id)a3 cloudPersonID:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v6 = a3;
    uint64_t v7 = [a4 stringByAppendingString:@"_"];
    id v4 = [v7 stringByAppendingString:v6];
  }
  return v4;
}

+ (id)cloudOwnerDisplayNameWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emailKey:(id)a6 includingEmail:(BOOL)a7 allowsEmail:(BOOL)a8 emailAddressManager:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  __int16 v19 = v18;
  v20 = &stru_1EEB2EB80;
  if (v9)
  {
    v20 = [v18 emailAddressForKey:v17];
  }
  if ([v16 length] && !objc_msgSend(v16, "isEqualToString:", @"(null) (null)"))
  {
    uint64_t v21 = (__CFString *)v16;
    if (!v10) {
      goto LABEL_13;
    }
LABEL_10:
    if ([(__CFString *)v20 length])
    {
      id v22 = PLServicesLocalizedFrameworkString();
      uint64_t v23 = PFStringWithValidatedFormat();

      uint64_t v21 = (__CFString *)v23;
    }
    goto LABEL_13;
  }
  if (![v14 length] && !objc_msgSend(v15, "length"))
  {
    uint64_t v21 = v20;
    goto LABEL_13;
  }
  PLLocalizedNameWithFirstAndLastName();
  uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    goto LABEL_10;
  }
LABEL_13:
  if (v21) {
    objc_super v24 = v21;
  }
  else {
    objc_super v24 = &stru_1EEB2EB80;
  }

  return v24;
}

+ (id)localizedSharedByLabelWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emailKey:(id)a6 isOwned:(BOOL)a7 allowsEmail:(BOOL)a8 emailAddressManager:(id)a9
{
  if (a7)
  {
    BOOL v9 = PLServicesLocalizedFrameworkString();
  }
  else
  {
    BOOL v10 = +[PLCloudSharedAlbum cloudOwnerDisplayNameWithFirstName:a3 lastName:a4 fullName:a5 emailKey:a6 includingEmail:a7 allowsEmail:a8 emailAddressManager:a9];
    if ([v10 length])
    {
      uint64_t v11 = PLServicesLocalizedFrameworkString();
      BOOL v9 = PFStringWithValidatedFormat();
    }
    else
    {
      BOOL v9 = PLServicesLocalizedFrameworkString();
    }
  }
  return v9;
}

+ (id)allCloudSharedAlbumsInLibrary:(id)a3
{
  char v3 = [a3 managedObjectContext];
  id v4 = +[PLGenericAlbum albumsWithKind:1505 inManagedObjectContext:v3];

  return v4;
}

+ (id)cloudSharedAlbumWithObjectID:(id)a3 managedObjectContext:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  BOOL v10 = [a1 entityInManagedObjectContext:v7];
  [v9 setEntity:v10];

  v17[0] = @"invitationRecords";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  int64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self == %@", v6];
  [v9 setPredicate:v12];

  uint64_t v16 = 0;
  uint64_t v13 = [v7 executeFetchRequest:v9 error:&v16];
  id v14 = [v13 lastObject];

  return v14;
}

+ (id)cloudSharedAlbumWithGUID:(id)a3 inLibrary:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = [v7 managedObjectContext];
  BOOL v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"kind == %d AND (uuid = %@ OR cloudGUID == %@)", 1505, v6, v6];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  int64_t v12 = [a1 entityInManagedObjectContext:v9];
  [v11 setEntity:v12];

  [v11 setPredicate:v10];
  id v18 = 0;
  uint64_t v13 = [v9 executeFetchRequest:v11 error:&v18];
  id v14 = v18;
  if ((unint64_t)[v13 count] >= 2)
  {
    id v15 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one album with cloudGUID %@, returning last one in array %@", buf, 0x16u);
    }
  }
  uint64_t v16 = [v13 lastObject];

  return v16;
}

+ (id)entityName
{
  return @"CloudSharedAlbum";
}

@end