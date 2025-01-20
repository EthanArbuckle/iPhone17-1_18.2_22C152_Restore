@interface PLGenericAlbum
+ (BOOL)_validateCurrentKeyAssetIDs:(id)a3 fetchedKeyAssetIDs:(id)a4 customKeyAssetID:(id)a5 maxCount:(int64_t)a6;
+ (BOOL)is1WaySyncKind:(int)a3;
+ (BOOL)isFolder:(int)a3;
+ (BOOL)isSmartAlbumForKind:(int)a3;
+ (BOOL)isUserCreatedForKind:(int)a3;
+ (BOOL)supportsCachedKeyAssetsWithAlbumKind:(int)a3;
+ (BOOL)supportsCustomKeyAssetWithAlbumKind:(int)a3;
+ (PLGenericAlbum)albumWithCloudGUID:(id)a3 inLibrary:(id)a4;
+ (PLGenericAlbum)albumWithKind:(int)a3 inManagedObjectContext:(id)a4;
+ (PLGenericAlbum)albumWithName:(id)a3 inLibrary:(id)a4;
+ (PLGenericAlbum)albumWithObjectID:(id)a3 inLibrary:(id)a4;
+ (PLGenericAlbum)albumWithUUID:(id)a3 inLibrary:(id)a4;
+ (id)_albumsMatchingPredicate:(id)a3 expectedResultCount:(id)a4 inManagedObjectContext:(id)a5;
+ (id)_baseIndexingPredicate;
+ (id)_insertNewAlbumWithKind:(int)a3 title:(id)a4 lastInterestingDate:(id)a5 intoLibrary:(id)a6;
+ (id)_predicateForSupportedAlbumTypes;
+ (id)_singletonFetchingAlbumWithKind:(int)a3 library:(id)a4;
+ (id)_singletonManagedAlbumWithKind:(int)a3 library:(id)a4;
+ (id)_unpushedParentsOfAlbums:(id)a3;
+ (id)albumFromGroupURL:(id)a3 photoLibrary:(id)a4;
+ (id)albumsForStreamID:(id)a3 inLibrary:(id)a4;
+ (id)albumsMatchingPredicate:(id)a3 expectedResultCount:(id)a4 inLibrary:(id)a5;
+ (id)albumsToUploadInitiallyInLibrary:(id)a3 limit:(unint64_t)a4;
+ (id)albumsWithCloudGUIDs:(id)a3 inLibrary:(id)a4;
+ (id)albumsWithKind:(int)a3 inManagedObjectContext:(id)a4;
+ (id)allAlbumsInLibrary:(id)a3;
+ (id)allAlbumsInManagedObjectContext:(id)a3;
+ (id)allAlbumsRegisteredWithManagedObjectContext:(id)a3;
+ (id)allAssetsAlbumInLibrary:(id)a3;
+ (id)allFavoritesAlbumInLibrary:(id)a3;
+ (id)allHorizontalPanoramasAlbumInLibrary:(id)a3;
+ (id)allPanoramasAlbumInLibrary:(id)a3;
+ (id)allPhotoStreamAssetsAlbumInLibrary:(id)a3;
+ (id)allSyncedAlbumsInManagedObjectContext:(id)a3;
+ (id)allVerticalPanoramasAlbumInLibrary:(id)a3;
+ (id)allVideosAlbumInLibrary:(id)a3;
+ (id)childKeyForOrdering;
+ (id)defaultAlbumKindsForFetchingWithCPLEnabled:(BOOL)a3;
+ (id)entityName;
+ (id)eventsWithName:(id)a3 andImportSessionIdentifier:(id)a4 inManagedObjectContext:(id)a5;
+ (id)fetchAlbumsForAssetObjectID:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5;
+ (id)fetchAlbumsWithUUIDs:(id)a3 managedObjectContext:(id)a4;
+ (id)filesystemImportProgressAlbumInLibrary:(id)a3;
+ (id)iTunesLibraryAlbumInLibrary:(id)a3;
+ (id)includeUnpushedParentsForAlbums:(id)a3 limit:(unint64_t)a4;
+ (id)insertAlbumWithKind:(int)a3 title:(id)a4 uuid:(id)a5 inManagedObjectContext:(id)a6;
+ (id)insertNewAlbumIntoLibrary:(id)a3;
+ (id)insertNewAlbumWithKind:(int)a3 title:(id)a4 intoLibrary:(id)a5;
+ (id)insertNewAlbumWithTitle:(id)a3 intoLibrary:(id)a4;
+ (id)insertNewCloudSharedAlbumWithTitle:(id)a3 lastInterestingDate:(id)a4 intoLibrary:(id)a5;
+ (id)insertNewLegacyFaceAlbumIntoLibrary:(id)a3;
+ (id)insertNewProjectAlbumWithTitle:(id)a3 documentType:(id)a4 intoLibrary:(id)a5;
+ (id)insertNewSmartAlbumIntoLibrary:(id)a3;
+ (id)insertNewSyncedEventIntoLibrary:(id)a3;
+ (id)insertNewSyncedEventWithTitle:(id)a3 intoLibrary:(id)a4;
+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3;
+ (id)keyPathsForValuesAffectingKindValue;
+ (id)keyPathsForValuesAffectingName;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)localizedRecoveredTitle;
+ (id)localizedTitleForAlbumKind:(int)a3 cplEnabled:(BOOL)a4;
+ (id)otaRestoreProgressAlbumInLibrary:(id)a3;
+ (id)predicateForAlbumsSupportingCachedKeyAssets;
+ (id)predicateForAlbumsSupportingCustomKeyAsset;
+ (id)projectAlbumRootFolderInLibrary:(id)a3;
+ (id)propertiesToFetch;
+ (id)relationshipKeyPathsToPrefetch;
+ (id)rootFolderInLibrary:(id)a3;
+ (id)sortDescriptorsForAssetsInAlbumWithSortKey:(unsigned int)a3 ascending:(BOOL)a4;
+ (id)syncProgressAlbumInLibrary:(id)a3;
+ (id)trashBinAlbumInLibrary:(id)a3;
+ (id)unableToUploadAlbumInLibrary:(id)a3;
+ (id)userLibraryAlbumInLibrary:(id)a3;
+ (id)uuidFromGroupURL:(id)a3;
+ (void)_removeAlbumsAndFolders:(id)a3 inManagedObjectContext:(id)a4;
+ (void)addSingletonObjectsToContext:(id)a3;
+ (void)removeAllUserAlbumsAndFoldersInLibrary:(id)a3;
+ (void)removeEmptyAlbumsAndFoldersForCloudResetInManagedObjectContext:(id)a3;
+ (void)removeInvalidAlbumsAndFoldersInManagedObjectContext:(id)a3;
+ (void)removeTrashedAlbumsAndFoldersForCloudResetInManagedObjectContext:(id)a3;
+ (void)resetAlbumStateForCloudInLibrary:(id)a3;
+ (void)updateKeyAssetsInAlbums:(id)a3 photoLibrary:(id)a4;
- (BOOL)canContributeToCloudSharedAlbum;
- (BOOL)canMoveToTrash;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)canShowComments;
- (BOOL)didRegisteredWithUserInterfaceContext;
- (BOOL)hasDerivedIndexMappers;
- (BOOL)hasUnseenContentBoolValue;
- (BOOL)isCameraAlbum;
- (BOOL)isCandidateForSearchIndexing;
- (BOOL)isCloudSharedAlbum;
- (BOOL)isDuplicateAlbum;
- (BOOL)isEligibleForSearchIndexing;
- (BOOL)isEmpty;
- (BOOL)isFamilyCloudSharedAlbum;
- (BOOL)isFolder;
- (BOOL)isInTrash;
- (BOOL)isLibrary;
- (BOOL)isMultipleContributorCloudSharedAlbum;
- (BOOL)isOwnPhotoStreamAlbum;
- (BOOL)isOwnedCloudSharedAlbum;
- (BOOL)isPanoramasAlbum;
- (BOOL)isPendingPhotoStreamAlbum;
- (BOOL)isPhotoStreamAlbum;
- (BOOL)isProjectAlbum;
- (BOOL)isProjectAlbumRootFolder;
- (BOOL)isProjectAlbumSupportingCloudUpload;
- (BOOL)isRecentlyAddedAlbum;
- (BOOL)isRegisteredForChanges;
- (BOOL)isRegularRootFolder;
- (BOOL)isSmartAlbum;
- (BOOL)isStandInAlbum;
- (BOOL)isSyncableChange;
- (BOOL)isUserCreated;
- (BOOL)isUserLibraryAlbum;
- (BOOL)shouldDeleteWhenEmpty;
- (BOOL)supportsCloudUpload;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (NSArray)localizedLocationNames;
- (NSObject)posterImage;
- (NSString)description;
- (NSString)localizedTitle;
- (NSString)name;
- (NSURL)groupURL;
- (PLPhotoLibrary)photoLibrary;
- (id)_compactDebugDescription;
- (id)_kindDescription;
- (id)_prettyDescription;
- (id)assetsByObjectIDAtIndexes:(id)a3;
- (id)childKeyForOrdering;
- (id)cplAlbumChangeInPhotoLibrary:(id)a3 orderKeyManager:(id)a4;
- (id)cplFullRecord;
- (id)fetchKeyAssetCandidates:(id *)a3;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)predicateForKeyAssetsCandidates;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (id)sortDescriptorsForKeyAssetsCandidates;
- (id)sortingComparator;
- (int)kindValue;
- (int64_t)keyAssetsMaxCount;
- (unint64_t)approximateCount;
- (unint64_t)assetsCount;
- (unint64_t)countForAssetsOfKind:(signed __int16)a3;
- (unint64_t)photosCount;
- (unint64_t)videosCount;
- (void)_applyTrashedState:(signed __int16)a3 date:(BOOL)a4 :(id)a5 cascade:(BOOL)a6;
- (void)_repairTitleIfEmpty;
- (void)_validateAndUpdateKeyAssetsIfNeeded;
- (void)applyPropertiesFromAlbumChange:(id)a3;
- (void)applyTrashedState:(signed __int16)a3 cascade:(BOOL)a4;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)batchFetchAssets:(id)a3;
- (void)dealloc;
- (void)delete;
- (void)didSave;
- (void)enumerateDerivedAlbums:(id)a3;
- (void)reducePendingItemsCountBy:(unint64_t)a3;
- (void)registerDerivedAlbum:(id)a3;
- (void)registerForChanges;
- (void)repairUuidAndTitleWithRecoveryReason:(const char *)a3;
- (void)setDidRegisteredWithUserInterfaceContext:(BOOL)a3;
- (void)setIsRegisteredForChanges:(BOOL)a3;
- (void)setKindValue:(int)a3;
- (void)setUserQueryData:(id)a3;
- (void)unregisterAllDerivedAlbums;
- (void)unregisterForChanges;
- (void)updateAlbumFolderRelation:(id)a3 orderKeyManager:(id)a4 inLibrary:(id)a5;
- (void)updateKeyAssetsIfNeeded;
- (void)willSave;
- (void)willTurnIntoFault;
@end

@implementation PLGenericAlbum

+ (id)entityName
{
  return @"GenericAlbum";
}

+ (BOOL)supportsCustomKeyAssetWithAlbumKind:(int)a3
{
  return a3 == 2 || a3 == 1508;
}

+ (id)sortDescriptorsForAssetsInAlbumWithSortKey:(unsigned int)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0u:
      goto LABEL_5;
    case 1u:
      v6 = (void *)MEMORY[0x1E4F29008];
      v7 = @"dateCreated";
      goto LABEL_10;
    case 2u:
      v6 = (void *)MEMORY[0x1E4F29008];
      v7 = @"modificationDate";
      goto LABEL_10;
    case 3u:
      v6 = (void *)MEMORY[0x1E4F29008];
      v7 = @"addedDate";
      goto LABEL_10;
    case 4u:
      v6 = (void *)MEMORY[0x1E4F29008];
      v7 = @"trashedDate";
      goto LABEL_10;
    case 5u:
      goto LABEL_6;
    default:
      if (a3 == 101)
      {
LABEL_6:
        uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"additionalAttributes.title" ascending:a4 selector:sel_localizedCaseInsensitiveCompare_];
      }
      else
      {
        if (a3 != 100) {
          goto LABEL_16;
        }
LABEL_5:
        v6 = (void *)MEMORY[0x1E4F29008];
        v7 = @"albums";
LABEL_10:
        uint64_t v8 = [v6 sortDescriptorWithKey:v7 ascending:a4];
      }
      v9 = (void *)v8;
      if (v8)
      {
        v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
        if (a3 == 1
          || ([MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:v4],
              v11 = objc_claimAutoreleasedReturnValue(),
              [v10 addObject:v11],
              v11,
              a3 != 3))
        {
          v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
          [v10 addObject:v12];
        }
        v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
        [v10 addObject:v13];

        goto LABEL_19;
      }
LABEL_16:
      v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16[0] = 67109120;
        v16[1] = a3;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Unexpected album sort key value: %d", (uint8_t *)v16, 8u);
      }

      v9 = 0;
      v10 = 0;
LABEL_19:

      return v10;
  }
}

+ (id)defaultAlbumKindsForFetchingWithCPLEnabled:(BOOL)a3
{
  if (a3)
  {
    v5 = &unk_1EEBF1850;
  }
  else
  {
    v5 = objc_msgSend(&unk_1EEBF1850, "arrayByAddingObject:", &unk_1EEBEDE30, v3);
  }
  return v5;
}

+ (id)localizedTitleForAlbumKind:(int)a3 cplEnabled:(BOOL)a4
{
  if (a3 > 1509)
  {
    uint64_t v4 = @"Action Camera";
    switch(a3)
    {
      case 1552:
      case 1600:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1607:
      case 1608:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1630:
      case 1631:
      case 1632:
      case 1634:
      case 1639:
      case 1640:
      case 1641:
        goto LABEL_12;
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1601:
      case 1629:
      case 1633:
      case 1635:
      case 1638:
        goto LABEL_19;
      case 1636:
        PLServicesSharedLibraryLocalizedFrameworkString();
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 1637:
        goto LABEL_13;
      default:
        switch(a3)
        {
          case 3998:
          case 3999:
          case 4003:
          case 4006:
            goto LABEL_12;
          case 4000:
            goto LABEL_19;
          case 4001:
          case 4002:
          case 4004:
          case 4005:
            DCIM_IS_PAD();
            goto LABEL_12;
          default:
            if (a3 != 1510) {
              goto LABEL_19;
            }
            goto LABEL_12;
        }
    }
  }
  if (a3 > 1505)
  {
    if (a3 == 1506 || a3 == 1509) {
      goto LABEL_12;
    }
  }
  else
  {
    if (a3 == 1000)
    {
      MGGetBoolAnswer();
LABEL_12:
      PLServicesLocalizedFrameworkString();
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (a3 == 1500) {
      goto LABEL_12;
    }
  }
LABEL_19:
  uint64_t v4 = 0;
LABEL_13:
  return v4;
}

- (BOOL)isCandidateForSearchIndexing
{
  uint64_t v3 = [(id)objc_opt_class() _baseIndexingPredicate];
  LOBYTE(self) = [v3 evaluateWithObject:self];

  return (char)self;
}

- (BOOL)isEligibleForSearchIndexing
{
  if ([(PLGenericAlbum *)self isDeleted]) {
    return 0;
  }
  uint64_t v4 = objc_opt_class();
  v5 = [(PLGenericAlbum *)self photoLibrary];
  v6 = objc_msgSend(v4, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", +[PLSpotlightDonationUtilities wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:](PLSpotlightDonationUtilities, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v5));
  char v7 = [v6 evaluateWithObject:self];

  return v7;
}

+ (id)fetchAlbumsForAssetObjectID:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1C0D0];
  v11 = +[PLManagedAlbum entityName];
  v12 = [v10 fetchRequestWithEntityName:v11];

  v13 = (void *)MEMORY[0x1E4F28BA0];
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K", v8, @"assets"];
  v40[0] = v14;
  v15 = [a1 isEligibleForSearchIndexingPredicateForLibraryIdentifier:a4];
  v40[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  uint64_t v17 = [v13 andPredicateWithSubpredicates:v16];
  [v12 setPredicate:v17];

  v32 = v8;
  v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K", v8, @"assets"];
  [v12 setPredicate:v18];

  v39[0] = @"uuid";
  v39[1] = @"cachedCount";
  v39[2] = @"trashedState";
  v39[3] = @"kind";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  [v12 setPropertiesToFetch:v19];

  id v37 = 0;
  v20 = [v9 executeFetchRequest:v12 error:&v37];
  id v21 = v37;
  if (v20)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v23 = v20;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v28 isEligibleForSearchIndexing]) {
            [v22 addObject:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v25);
    }

    v29 = (void *)[v22 copy];
    v30 = [MEMORY[0x1E4F8B9B8] successWithResult:v29];
  }
  else
  {
    v30 = [MEMORY[0x1E4F8B9B8] failureWithError:v21];
  }

  return v30;
}

+ (id)fetchAlbumsWithUUIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  char v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = +[PLGenericAlbum entityName];
  v10 = [v7 fetchRequestWithEntityName:v9];

  v11 = [a1 propertiesToFetch];
  [v10 setPropertiesToFetch:v11];

  [v10 setIncludesPendingChanges:0];
  if ((unint64_t)[v6 count] >= 0x65) {
    [v10 setFetchBatchSize:100];
  }
  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v6];
  [v10 setPredicate:v12];

  objc_msgSend(v10, "setFetchLimit:", objc_msgSend(v6, "count"));
  id v17 = 0;
  v13 = [v8 executeFetchRequest:v10 error:&v17];

  id v14 = v17;
  if (v13) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v13];
  }
  else {
  v15 = [MEMORY[0x1E4F8B9B8] failureWithError:v14];
  }

  return v15;
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

+ (id)propertiesToFetch
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"title";
  v4[2] = @"startDate";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  pl_dispatch_once();
  uint64_t v3 = (void *)isEligibleForSearchIndexingPredicateForLibraryIdentifier__predicate;
  return v3;
}

void __91__PLGenericAlbum_SearchIndexing__isEligibleForSearchIndexingPredicateForLibraryIdentifier___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28BA0];
  v2 = [*(id *)(a1 + 32) _baseIndexingPredicate];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"trashedState == %d", 0, v2);
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = [v1 andPredicateWithSubpredicates:v4];
  id v6 = (void *)isEligibleForSearchIndexingPredicateForLibraryIdentifier__predicate;
  isEligibleForSearchIndexingPredicateForLibraryIdentifier__predicate = v5;
}

+ (id)_baseIndexingPredicate
{
  pl_dispatch_once();
  v2 = (void *)_baseIndexingPredicate_predicate;
  return v2;
}

void __56__PLGenericAlbum_SearchIndexing___baseIndexingPredicate__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(kind == %d OR kind == %d OR kind == %d)", 2, 1550, 1505);
  v1 = (void *)_baseIndexingPredicate_predicate;
  _baseIndexingPredicate_predicate = v0;
}

+ (BOOL)is1WaySyncKind:(int)a3
{
  return (a3 - 1550) < 4;
}

+ (void)addSingletonObjectsToContext:(id)a3
{
  id v5 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    v83 = [MEMORY[0x1E4F28B00] currentHandler];
    v84 = NSStringFromSelector(a2);
    [v83 handleFailureInMethod:a2, a1, @"PLGenericAlbum.m", 2264, @"%@ can only be called from assetsd", v84 object file lineNumber description];
  }
  id v6 = +[PLGenericAlbum albumWithKind:3999 inManagedObjectContext:v5];

  if (!v6)
  {
    char v7 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v7 setKindValue:3999];
  }
  id v8 = +[PLGenericAlbum albumWithKind:3998 inManagedObjectContext:v5];

  if (!v8)
  {
    id v9 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v9 setKindValue:3998];
  }
  v10 = +[PLGenericAlbum albumWithKind:1600 inManagedObjectContext:v5];

  if (!v10)
  {
    v11 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v11 setKindValue:1600];
  }
  v12 = +[PLGenericAlbum albumWithKind:1605 inManagedObjectContext:v5];

  if (!v12)
  {
    v13 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v13 setKindValue:1605];
  }
  id v14 = +[PLGenericAlbum albumWithKind:1607 inManagedObjectContext:v5];

  if (!v14)
  {
    v15 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v15 setKindValue:1607];
  }
  v16 = +[PLGenericAlbum albumWithKind:1608 inManagedObjectContext:v5];

  if (!v16)
  {
    id v17 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v17 setKindValue:1608];
  }
  v18 = +[PLGenericAlbum albumWithKind:1606 inManagedObjectContext:v5];

  if (!v18)
  {
    v19 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v19 setKindValue:1606];
  }
  v20 = +[PLGenericAlbum albumWithKind:1609 inManagedObjectContext:v5];

  if (!v20)
  {
    id v21 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v21 setKindValue:1609];
  }
  id v22 = +[PLGenericAlbum albumWithKind:1615 inManagedObjectContext:v5];

  if (!v22)
  {
    id v23 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v23 setKindValue:1615];
  }
  uint64_t v24 = +[PLGenericAlbum albumWithKind:1610 inManagedObjectContext:v5];

  if (!v24)
  {
    uint64_t v25 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v25 setKindValue:1610];
  }
  uint64_t v26 = +[PLGenericAlbum albumWithKind:1617 inManagedObjectContext:v5];

  if (!v26)
  {
    v27 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v27 setKindValue:1617];
  }
  v28 = +[PLGenericAlbum albumWithKind:1618 inManagedObjectContext:v5];

  if (!v28)
  {
    v29 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v29 setKindValue:1618];
  }
  v30 = +[PLGenericAlbum albumWithKind:1616 inManagedObjectContext:v5];

  if (!v30)
  {
    v31 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v31 setKindValue:1616];
  }
  v32 = +[PLGenericAlbum albumWithKind:1613 inManagedObjectContext:v5];

  if (!v32)
  {
    long long v33 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v33 setKindValue:1613];
  }
  long long v34 = +[PLGenericAlbum albumWithKind:4004 inManagedObjectContext:v5];

  if (!v34)
  {
    long long v35 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v35 setKindValue:4004];
  }
  long long v36 = +[PLGenericAlbum albumWithKind:4005 inManagedObjectContext:v5];

  if (!v36)
  {
    id v37 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v37 setKindValue:4005];
  }
  v38 = +[PLGenericAlbum albumWithKind:4006 inManagedObjectContext:v5];

  if (!v38)
  {
    v39 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v39 setKindValue:4006];
  }
  v40 = +[PLGenericAlbum albumWithKind:1620 inManagedObjectContext:v5];

  if (!v40)
  {
    v41 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v41 setKindValue:1620];
  }
  v42 = +[PLGenericAlbum albumWithKind:1621 inManagedObjectContext:v5];

  if (!v42)
  {
    v43 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v43 setKindValue:1621];
  }
  v44 = +[PLGenericAlbum albumWithKind:1614 inManagedObjectContext:v5];

  if (!v44)
  {
    v45 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v45 setKindValue:1614];
  }
  v46 = +[PLGenericAlbum albumWithKind:1611 inManagedObjectContext:v5];

  if (!v46)
  {
    v47 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v47 setKindValue:1611];
  }
  v48 = +[PLGenericAlbum albumWithKind:4001 inManagedObjectContext:v5];

  if (!v48)
  {
    v49 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v49 setKindValue:4001];
  }
  v50 = +[PLGenericAlbum albumWithKind:4003 inManagedObjectContext:v5];

  if (!v50)
  {
    v51 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v51 setKindValue:4003];
  }
  v52 = +[PLGenericAlbum albumWithKind:4002 inManagedObjectContext:v5];

  if (!v52)
  {
    v53 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v53 setKindValue:4002];
  }
  v54 = +[PLGenericAlbum albumWithKind:1602 inManagedObjectContext:v5];

  if (!v54)
  {
    v55 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v55 setKindValue:1602];
  }
  v56 = +[PLGenericAlbum albumWithKind:1552 inManagedObjectContext:v5];

  if (!v56)
  {
    v57 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v57 setKindValue:1552];
  }
  v58 = +[PLGenericAlbum albumWithKind:1612 inManagedObjectContext:v5];

  if (!v58)
  {
    v59 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v59 setKindValue:1612];
  }
  v60 = +[PLGenericAlbum albumWithKind:3571 inManagedObjectContext:v5];

  if (!v60)
  {
    v61 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v61 setKindValue:3571];
    v62 = [v61 _kindDescription];
    [v61 setTitle:v62];
  }
  v63 = +[PLGenericAlbum albumWithKind:3572 inManagedObjectContext:v5];

  if (!v63)
  {
    v64 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v64 setKindValue:3572];
    v65 = [v64 _kindDescription];
    [v64 setTitle:v65];
  }
  v66 = +[PLGenericAlbum albumWithKind:3573 inManagedObjectContext:v5];

  if (!v66)
  {
    v67 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v67 setKindValue:3573];
    v68 = [v67 _kindDescription];
    [v67 setTitle:v68];
  }
  v69 = +[PLGenericAlbum albumWithKind:1619 inManagedObjectContext:v5];

  if (!v69)
  {
    v70 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v70 setKindValue:1619];
  }
  v71 = +[PLGenericAlbum albumWithKind:1622 inManagedObjectContext:v5];

  if (!v71)
  {
    v72 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v72 setKindValue:1622];
  }
  v73 = +[PLGenericAlbum albumWithKind:1623 inManagedObjectContext:v5];

  if (!v73)
  {
    v74 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v74 setKindValue:1623];
  }
  v75 = +[PLGenericAlbum albumWithKind:1634 inManagedObjectContext:v5];

  if (!v75)
  {
    v76 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v76 setKindValue:1634];
  }
  v77 = +[PLGenericAlbum albumWithKind:1624 inManagedObjectContext:v5];

  if (!v77)
  {
    v78 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v78 setKindValue:1624];
  }
  v79 = +[PLGenericAlbum albumWithKind:1636 inManagedObjectContext:v5];

  if (!v79)
  {
    v80 = +[PLManagedObject insertInManagedObjectContext:v5];
    [v80 setKindValue:1636];
  }
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __47__PLGenericAlbum_addSingletonObjectsToContext___block_invoke;
  v85[3] = &unk_1E5869078;
  id v81 = v5;
  id v86 = v81;
  v82 = (void (**)(void, void))MEMORY[0x19F38D650](v85);
  v82[2](v82, 1625);
  v82[2](v82, 1626);
  v82[2](v82, 1627);
  v82[2](v82, 1630);
  v82[2](v82, 1631);
  v82[2](v82, 1639);
  v82[2](v82, 1637);
  v82[2](v82, 1632);
  v82[2](v82, 1640);
  v82[2](v82, 1628);
  v82[2](v82, 1641);
}

void __47__PLGenericAlbum_addSingletonObjectsToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[PLGenericAlbum albumWithKind:a2 inManagedObjectContext:*(void *)(a1 + 32)];

  if (!v4)
  {
    id v5 = +[PLManagedObject insertInManagedObjectContext:*(void *)(a1 + 32)];
    [v5 setKindValue:a2];
  }
}

- (void).cxx_destruct
{
  derivedAlbums = self->_derivedAlbums;
  for (uint64_t i = 4; i != -1; --i)
    objc_destroyWeak((id *)&derivedAlbums[i]);
}

- (void)setDidRegisteredWithUserInterfaceContext:(BOOL)a3
{
  self->didRegisteredWithUserInterfaceContext = a3;
}

- (BOOL)didRegisteredWithUserInterfaceContext
{
  return self->didRegisteredWithUserInterfaceContext;
}

- (void)setIsRegisteredForChanges:(BOOL)a3
{
  self->isRegisteredForChanges = a3;
}

- (BOOL)isRegisteredForChanges
{
  return self->isRegisteredForChanges;
}

- (BOOL)hasDerivedIndexMappers
{
  id WeakRetained = objc_loadWeakRetained((id *)self->_derivedAlbums);

  if (WeakRetained) {
    return 1;
  }
  id v5 = (id *)&self->_derivedAlbums[1];
  unint64_t v6 = -1;
  while (v6 != 3)
  {
    id v7 = objc_loadWeakRetained(v5);

    ++v6;
    ++v5;
    if (v7) {
      return v6 < 4;
    }
  }
  unint64_t v6 = 4;
  return v6 < 4;
}

- (void)enumerateDerivedAlbums:(id)a3
{
  uint64_t v3 = 0;
  derivedAlbums = self->_derivedAlbums;
  unint64_t v6 = (void (**)(id, id))a3;
  do
  {
    id WeakRetained = objc_loadWeakRetained((id *)&derivedAlbums[v3]);
    if (WeakRetained) {
      v6[2](v6, WeakRetained);
    }

    ++v3;
  }
  while (v3 != 5);
}

- (void)unregisterAllDerivedAlbums
{
  uint64_t v2 = 0;
  derivedAlbums = self->_derivedAlbums;
  do
    objc_storeWeak((id *)&derivedAlbums[v2++], 0);
  while (v2 != 5);
}

- (void)registerDerivedAlbum:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v6 = 0;
  derivedAlbums = self->_derivedAlbums;
  do
  {
    id WeakRetained = objc_loadWeakRetained((id *)&derivedAlbums[v6]);

    if (!WeakRetained)
    {
      objc_storeWeak((id *)&derivedAlbums[v6], v4);
      goto LABEL_8;
    }
    ++v6;
  }
  while (v6 != 5);
  id v9 = PLBackendGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134217984;
    uint64_t v11 = 5;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "More than maximum %ld filtered albums trying to register. This will fail.", (uint8_t *)&v10, 0xCu);
  }

LABEL_8:
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLGenericAlbum;
  uint64_t v3 = [(PLGenericAlbum *)&v8 description];
  id v4 = [(PLGenericAlbum *)self kind];
  id v5 = [(PLGenericAlbum *)self title];
  uint64_t v6 = [v3 stringByAppendingFormat:@" kind = %@; title = \"%@\"", v4, v5];;

  return (NSString *)v6;
}

- (id)_prettyDescription
{
  uint64_t v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  id v4 = [(PLGenericAlbum *)self objectID];
  id v5 = [v4 URIRepresentation];
  uint64_t v6 = [v5 path];
  id v7 = [v6 pathComponents];

  if ((unint64_t)[v7 count] >= 2)
  {
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v7, "count") - 2, 2);

    id v7 = (void *)v8;
  }
  id v9 = [NSString pathWithComponents:v7];
  if ([(PLGenericAlbum *)self isFault])
  {
    id v10 = v9;
  }
  else
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [(PLGenericAlbum *)self _kindDescription];
    id v10 = [v11 stringWithFormat:@"%@ (%@)", v9, v12];
  }
  return v10;
}

- (id)_compactDebugDescription
{
  uint64_t v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  id v4 = [(PLGenericAlbum *)self objectID];
  id v5 = [v4 URIRepresentation];
  uint64_t v6 = [v5 path];
  id v7 = [v6 pathComponents];

  if ((unint64_t)[v7 count] >= 2)
  {
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v7, "count") - 2, 2);

    id v7 = (void *)v8;
  }
  id v9 = [NSString pathWithComponents:v7];
  id v10 = NSString;
  uint64_t v11 = [(PLGenericAlbum *)self uuid];
  uint64_t v12 = [(PLGenericAlbum *)self _kindDescription];
  v13 = [(PLGenericAlbum *)self title];
  id v14 = [v10 stringWithFormat:@"%@ [%@] (%@ %@)", v11, v9, v12, v13];

  return v14;
}

- (id)_kindDescription
{
  int v3 = [(PLGenericAlbum *)self kindValue];
  if (v3 > 1549)
  {
    if (v3 <= 1601)
    {
      if (v3 <= 1551)
      {
        if (v3 == 1550) {
          id v4 = @"1WaySyncAlbum";
        }
        else {
          id v4 = @"1WaySyncEvent";
        }
        goto LABEL_40;
      }
      if (v3 == 1552)
      {
        id v4 = @"1WaySyncLibraryAlbum";
        goto LABEL_40;
      }
      if (v3 == 1600)
      {
        id v4 = @"AllAssetsAlbum";
        goto LABEL_40;
      }
    }
    else if (v3 <= 3570)
    {
      if (v3 == 1602)
      {
        id v4 = @"AllPhotoStream";
        goto LABEL_40;
      }
      if (v3 == 1612)
      {
        id v4 = @"Trash Bin";
        goto LABEL_40;
      }
    }
    else
    {
      switch(v3)
      {
        case 3571:
          id v4 = @"progress-sync";
          goto LABEL_40;
        case 3572:
          id v4 = @"progress-ota-restore";
          goto LABEL_40;
        case 3573:
          id v4 = @"progress-fs-import";
          goto LABEL_40;
      }
    }
LABEL_29:
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown %d>", -[PLGenericAlbum kindValue](self, "kindValue"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (v3 <= 15)
  {
    switch(v3)
    {
      case 2:
        id v4 = @"Regular";
        goto LABEL_40;
      case 12:
        id v4 = @"Event";
        goto LABEL_40;
      case 15:
        id v4 = @"Faces";
        goto LABEL_40;
    }
    goto LABEL_29;
  }
  switch(v3)
  {
    case 1500:
      id v4 = @"PhotoStream";
      break;
    case 1501:
    case 1503:
    case 1504:
    case 1506:
      goto LABEL_29;
    case 1502:
      id v4 = @"PictureFrame";
      break;
    case 1505:
      id v4 = @"Cloud Shared Album";
      break;
    case 1507:
      id v4 = @"UserSmartAlbum";
      break;
    case 1508:
      id v4 = @"Project";
      break;
    default:
      if (v3 == 16)
      {
        id v4 = @"Places";
      }
      else
      {
        if (v3 != 1000) {
          goto LABEL_29;
        }
        id v4 = @"Saved";
      }
      break;
  }
LABEL_40:
  return v4;
}

- (void)updateAlbumFolderRelation:(id)a3 orderKeyManager:(id)a4 inLibrary:(id)a5
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    v95 = [MEMORY[0x1E4F28B00] currentHandler];
    [v95 handleFailureInMethod:a2 object:self file:@"PLGenericAlbum.m" lineNumber:2026 description:@"Only called from assetsd / unit test"];
  }
  uint64_t v12 = [v9 parentIdentifier];
  BOOL v13 = [(PLGenericAlbum *)self isProjectAlbum];
  if (v12)
  {
    id v14 = +[PLGenericAlbum albumWithCloudGUID:v12 inLibrary:v11];
  }
  else
  {
    if (v13) {
      +[PLGenericAlbum projectAlbumRootFolderInLibrary:v11];
    }
    else {
    id v14 = +[PLGenericAlbum rootFolderInLibrary:v11];
    }
  }
  v15 = v14;
  if (v14 && ([v14 isDeleted] & 1) == 0)
  {
    v108 = v10;
    v16 = [v15 entity];
    id v17 = (void *)MEMORY[0x1E4F1C0A8];
    v18 = +[PLManagedFolder entityName];
    v19 = [v11 managedObjectContext];
    v20 = [v17 entityForName:v18 inManagedObjectContext:v19];
    char v21 = [v16 isKindOfEntity:v20];

    if ((v21 & 1) == 0)
    {
      int v56 = MEMORY[0x19F38BDA0]();
      v57 = PLBackendGetLog();
      v40 = v57;
      if (v56)
      {
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        {
          v58 = [(PLGenericAlbum *)self _compactDebugDescription];
          v59 = [(PLGenericAlbum *)self cloudGUID];
          v60 = [v9 description];
          *(_DWORD *)buf = 138544130;
          uint64_t v113 = (uint64_t)v12;
          __int16 v114 = 2112;
          uint64_t v115 = (uint64_t)v58;
          __int16 v116 = 2114;
          uint64_t v117 = (uint64_t)v59;
          __int16 v118 = 2112;
          unint64_t v119 = (unint64_t)v60;
          _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_FAULT, "<rdar://problem/28377493> Unexpected non-folder parentIdentifier %{public}@ found in album %@ [%{public}@] change %@", buf, 0x2Au);
        }
        id v10 = v108;
        if (objc_opt_respondsToSelector()) {
          [v15 _compactDebugDescription];
        }
        else {
        v40 = [v15 description];
        }
        v70 = NSString;
        v71 = [(PLGenericAlbum *)self _compactDebugDescription];
        v72 = [v9 description];
        v73 = [v70 stringWithFormat:@"Unexpected non-folder parent %@ referenced for album %@ with change record %@. See rdar://28377493.", v40, v71, v72];

        +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Photos Data Syncing Issue Detected!" message:@"Please file a Radar for non-folder parent album." radarTitle:@"TTR Photos Framework: non-folder parent album" radarDescription:v73];
      }
      else
      {
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v61 = [(PLGenericAlbum *)self cloudGUID];
          v62 = [(PLGenericAlbum *)self _compactDebugDescription];
          v63 = [v9 description];
          *(_DWORD *)buf = 138544130;
          uint64_t v113 = (uint64_t)v12;
          __int16 v114 = 2112;
          uint64_t v115 = (uint64_t)v61;
          __int16 v116 = 2114;
          uint64_t v117 = (uint64_t)v62;
          __int16 v118 = 2112;
          unint64_t v119 = (unint64_t)v63;
          _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Unexpected non-folder parentIdentifier %{public}@ found in album %@ [%{public}@] change %@", buf, 0x2Au);
        }
        id v10 = v108;
      }
      goto LABEL_77;
    }
    id v22 = [(PLGenericAlbum *)self parentFolder];
    int v106 = [v22 isEqual:v15];

    [(PLGenericAlbum *)self objectID];
    v24 = id v23 = v9;
    uint64_t v25 = [v15 objectID];
    uint64_t v26 = [v15 childCollections];
    uint64_t v27 = [v26 indexOfObject:self];
    v105 = v23;
    uint64_t v28 = [v23 position];
    if (!v28)
    {
      v101 = v24;
      v64 = (void *)v25;
      id v10 = v108;
      if (!*MEMORY[0x1E4F59AC0])
      {
        v65 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          [(PLGenericAlbum *)self uuid];
          v66 = uint64_t v99 = v27;
          v67 = [v15 uuid];
          *(_DWORD *)buf = 138412546;
          uint64_t v113 = (uint64_t)v66;
          __int16 v114 = 2112;
          uint64_t v115 = (uint64_t)v67;
          _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_ERROR, "Ignoring unsupported order value (0), appending %@ to the end of %@", buf, 0x16u);

          id v10 = v108;
          uint64_t v27 = v99;
        }
      }
      uint64_t v68 = [v26 count];
      if (v106)
      {
        v107 = (void *)v25;
        v69 = 0;
        v40 = v101;
LABEL_72:
        v85 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v27];
        [v15 moveChildCollectionsAtIndexes:v85 toIndex:v68];

LABEL_75:
        v64 = v107;
        goto LABEL_76;
      }
      [v15 insertObject:self inChildCollectionsAtIndex:v68];
      v69 = 0;
      v40 = v101;
LABEL_76:

      id v9 = v105;
LABEL_77:

      goto LABEL_78;
    }
    uint64_t v29 = v28;
    uint64_t v98 = v27;
    id v111 = 0;
    v30 = [v11 managedObjectContext];
    id v10 = v108;
    uint64_t v102 = v29;
    v107 = (void *)v25;
    unint64_t v31 = [v108 findIndexForAlbumWithID:v24 newOrderValue:v29 inFolderWithID:v25 hasOrderValueConflictWithAlbumID:&v111 inContext:v30];
    id v104 = v111;

    unint64_t v32 = [v26 count];
    uint64_t v33 = v31;
    unint64_t v103 = v31;
    if (v31 > v32)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        long long v34 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          long long v35 = [NSNumber numberWithLongLong:v102];
          uint64_t v36 = [v26 count];
          *(_DWORD *)buf = 138413314;
          uint64_t v113 = (uint64_t)v35;
          __int16 v114 = 2112;
          uint64_t v115 = v24;
          __int16 v116 = 2112;
          uint64_t v117 = v25;
          __int16 v118 = 2048;
          unint64_t v119 = v103;
          __int16 v120 = 2048;
          uint64_t v121 = v36;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Child collection index based on order value is too large for childCollections: order value %@ for %@ on %@ target index = %ld, count = %ld", buf, 0x34u);
        }
      }
      uint64_t v33 = [v26 count];
    }
    id v37 = v26;
    if (v104)
    {
      unint64_t v97 = v33;
      v38 = [(PLGenericAlbum *)self managedObjectContext];
      uint64_t v39 = [v38 existingObjectWithID:v104 error:0];

      v100 = (void *)v39;
      if (v39)
      {
        uint64_t v26 = v37;
        v40 = v24;
        if (!*MEMORY[0x1E4F59AC0])
        {
          v41 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = [NSNumber numberWithLongLong:v102];
            *(_DWORD *)buf = 138413058;
            uint64_t v113 = (uint64_t)v42;
            __int16 v114 = 2112;
            uint64_t v115 = v24;
            __int16 v116 = 2112;
            uint64_t v117 = (uint64_t)v107;
            __int16 v118 = 2112;
            unint64_t v119 = (unint64_t)v104;
            _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "Folder album order value %@ for %@ on %@ conflicts with %@, adjusting", buf, 0x2Au);
          }
        }
        v43 = [v100 title];
        v44 = [(PLGenericAlbum *)self title];
        uint64_t v45 = [v43 compare:v44];

        if (!v45)
        {
          v46 = [v100 cloudGUID];
          v47 = [(PLGenericAlbum *)self cloudGUID];
          uint64_t v45 = [v46 compare:v47];
        }
        uint64_t v109 = 0;
        uint64_t v110 = 0;
        v48 = +[PLManagedFolder childKeyForOrdering];
        v49 = [v11 managedObjectContext];
        [v108 getConflictResolutionOrderValuesForRelationship:v48 onObjectWithID:v107 atIndex:v103 intoLower:&v110 higher:&v109 inContext:v49];

        if (v45 == -1)
        {
          uint64_t v74 = v110;
          if (v110)
          {
            v75 = [v100 objectID];
            v76 = [v11 managedObjectContext];
            [v108 stashFolderAlbumsLocationValue:v74 forAlbumWithID:v75 inFolderWithID:v107 atIndex:v103 usingContext:v76];

            uint64_t v50 = v102;
            if (!*MEMORY[0x1E4F59AC0])
            {
              v77 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
              {
                [NSNumber numberWithLongLong:v102];
                v78 = log = v77;
                v79 = [NSNumber numberWithLongLong:v110];
                v80 = [v100 objectID];
                *(_DWORD *)buf = 138412802;
                uint64_t v113 = (uint64_t)v78;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v79;
                __int16 v116 = 2112;
                uint64_t v117 = (uint64_t)v80;
                id v81 = "Conflicting existing album folder order value (ascending) updated from %@ to %@ for %@";
LABEL_64:
                _os_log_impl(&dword_19B3C7000, log, OS_LOG_TYPE_DEFAULT, v81, buf, 0x20u);

                uint64_t v50 = v102;
                v77 = log;
              }
LABEL_65:
            }
LABEL_66:
            ++v103;
            int v55 = 1;
LABEL_67:
            id v10 = v108;
            goto LABEL_68;
          }
          uint64_t v50 = v109;
          if (v109)
          {
            if (*MEMORY[0x1E4F59AC0]) {
              goto LABEL_35;
            }
            v51 = __CPLAssetsdOSLogDomain();
            if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_34;
            }
            v52 = [NSNumber numberWithLongLong:v102];
            v53 = [NSNumber numberWithLongLong:v109];
            *(_DWORD *)buf = 138412802;
            uint64_t v113 = (uint64_t)v52;
            __int16 v114 = 2112;
            uint64_t v115 = (uint64_t)v53;
            __int16 v116 = 2112;
            uint64_t v117 = v24;
            v54 = "Conflicting incoming album folder order value (ascending) updated from %@ to %@ for %@";
            goto LABEL_33;
          }
          uint64_t v50 = v102;
          if (v106)
          {
            id v10 = v108;
            uint64_t v91 = v98;
            if (!*MEMORY[0x1E4F59AC0])
            {
              v92 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
              {
                v93 = [NSNumber numberWithUnsignedInteger:v103];
                *(_DWORD *)buf = 138412802;
                uint64_t v113 = v24;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v93;
                __int16 v116 = 2112;
                uint64_t v117 = (uint64_t)v107;
                _os_log_impl(&dword_19B3C7000, v92, OS_LOG_TYPE_DEFAULT, "Conflicting album folder order value (ascending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);

                uint64_t v91 = v98;
              }
            }
            v94 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v91];
            [v15 moveChildCollectionsAtIndexes:v94 toIndex:v97];

            goto LABEL_98;
          }
        }
        else
        {
          uint64_t v50 = v109;
          if (v109)
          {
            if (*MEMORY[0x1E4F59AC0])
            {
LABEL_35:
              id v10 = v108;
              ++v103;
              int v55 = 1;
LABEL_68:

              uint64_t v33 = v97;
              goto LABEL_69;
            }
            v51 = __CPLAssetsdOSLogDomain();
            if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
LABEL_34:

              uint64_t v50 = v109;
              goto LABEL_35;
            }
            v52 = [NSNumber numberWithLongLong:v102];
            v53 = [NSNumber numberWithLongLong:v109];
            *(_DWORD *)buf = 138412802;
            uint64_t v113 = (uint64_t)v52;
            __int16 v114 = 2112;
            uint64_t v115 = (uint64_t)v53;
            __int16 v116 = 2112;
            uint64_t v117 = v24;
            v54 = "Conflicting incoming album folder order value (descending) updated from %@ to %@ for %@";
LABEL_33:
            _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, v54, buf, 0x20u);

            goto LABEL_34;
          }
          uint64_t v82 = v110;
          if (v110)
          {
            v83 = [v100 objectID];
            v84 = [v11 managedObjectContext];
            [v108 stashFolderAlbumsLocationValue:v82 forAlbumWithID:v83 inFolderWithID:v107 atIndex:v103 usingContext:v84];

            uint64_t v50 = v102;
            if (!*MEMORY[0x1E4F59AC0])
            {
              v77 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
              {
                [NSNumber numberWithLongLong:v102];
                v78 = log = v77;
                v79 = [NSNumber numberWithLongLong:v110];
                v80 = [v100 objectID];
                *(_DWORD *)buf = 138412802;
                uint64_t v113 = (uint64_t)v78;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v79;
                __int16 v116 = 2112;
                uint64_t v117 = (uint64_t)v80;
                id v81 = "Conflicting existing album folder order value (descending) updated from %@ to %@ for %@";
                goto LABEL_64;
              }
              goto LABEL_65;
            }
            goto LABEL_66;
          }
          uint64_t v50 = v102;
          if (v106)
          {
            id v10 = v108;
            if (!*MEMORY[0x1E4F59AC0])
            {
              v87 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                v88 = [NSNumber numberWithUnsignedInteger:v103 + 1];
                *(_DWORD *)buf = 138412802;
                uint64_t v113 = v24;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v88;
                __int16 v116 = 2112;
                uint64_t v117 = (uint64_t)v107;
                _os_log_impl(&dword_19B3C7000, v87, OS_LOG_TYPE_DEFAULT, "Conflicting album folder order value (descending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);
              }
            }
            if (v97 >= [v26 count]) {
              unint64_t v89 = v97;
            }
            else {
              unint64_t v89 = v97 + 1;
            }
            v90 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v98];
            [v15 moveChildCollectionsAtIndexes:v90 toIndex:v89];

LABEL_98:
            int v55 = 0;
            uint64_t v50 = v102;
            goto LABEL_68;
          }
        }
        int v55 = 0;
        goto LABEL_67;
      }
      int v55 = 1;
      uint64_t v26 = v37;
      v40 = v24;
      uint64_t v33 = v97;
    }
    else
    {
      int v55 = 1;
      v40 = v24;
    }
    uint64_t v50 = v102;
LABEL_69:
    if (v106)
    {
      v69 = v104;
      if ((v55 & 1) == 0)
      {
        uint64_t v68 = v33;
        uint64_t v27 = v98;
        goto LABEL_72;
      }
    }
    else
    {
      [v15 insertObject:self inChildCollectionsAtIndex:v33];
      v69 = v104;
      if (!v55) {
        goto LABEL_75;
      }
    }
    id v86 = [v11 managedObjectContext];
    v64 = v107;
    [v10 stashFolderAlbumsLocationValue:v50 forAlbumWithID:v40 inFolderWithID:v107 atIndex:v103 usingContext:v86];

    goto LABEL_76;
  }
LABEL_78:
}

- (unint64_t)countForAssetsOfKind:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLGenericAlbum *)self managedObjectContext];
  uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = +[PLManagedAsset entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [(PLGenericAlbum *)self objectID];
  id v11 = [v9 predicateWithFormat:@"kind = %d AND albums CONTAINS %@", v3, v10];
  [v8 setPredicate:v11];

  id v16 = 0;
  unint64_t v12 = [v5 countForFetchRequest:v8 error:&v16];
  id v13 = v16;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v18 = v3;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "_countForAssetsOfKind:%d fetch request failed: %@", buf, 0x12u);
    }

    unint64_t v12 = 0;
  }

  return v12;
}

- (void)unregisterForChanges
{
  if ([(PLGenericAlbum *)self isRegisteredForChanges])
  {
    [(PLGenericAlbum *)self setIsRegisteredForChanges:0];
  }
}

- (void)registerForChanges
{
}

- (void)reducePendingItemsCountBy:(unint64_t)a3
{
  unint64_t v5 = (int)[(PLGenericAlbum *)self pendingItemsCount];
  if (v5 <= a3) {
    [(PLGenericAlbum *)self setPendingItemsType:1];
  }
  if (v5 >= a3) {
    unint64_t v6 = v5 - a3;
  }
  else {
    unint64_t v6 = 0;
  }
  [(PLGenericAlbum *)self setPendingItemsCount:v6];
}

- (void)batchFetchAssets:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = [(PLGenericAlbum *)self managedObjectContext];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v12 isFault])
        {
          id v13 = [v12 objectID];
          if (v13) {
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    id v14 = (void *)MEMORY[0x1E4F1C0D0];
    v15 = +[PLManagedAsset entityName];
    id v16 = [v14 fetchRequestWithEntityName:v15];

    id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v5];
    [v16 setPredicate:v17];

    [v16 setReturnsObjectsAsFaults:0];
    id v21 = 0;
    int v18 = [v6 executeFetchRequest:v16 error:&v21];
    id v19 = v21;
    id v20 = v19;
    if (!v18) {
      NSLog(&cfstr_FailedToPrefet_0.isa, v19);
    }
  }
}

- (id)assetsByObjectIDAtIndexes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PLGenericAlbum *)self assets];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v7 = [(PLGenericAlbum *)self managedObjectContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__PLGenericAlbum_assetsByObjectIDAtIndexes___block_invoke;
    v13[3] = &unk_1E5866068;
    id v14 = v5;
    id v15 = v7;
    id v8 = v6;
    id v16 = v8;
    id v9 = v7;
    [v4 enumerateIndexesUsingBlock:v13];
    uint64_t v10 = v16;
    id v11 = v8;
  }
  else
  {
    id v11 = [v5 objectsAtIndexes:v4];
  }

  return v11;
}

void __44__PLGenericAlbum_assetsByObjectIDAtIndexes___block_invoke(id *a1, uint64_t a2)
{
  int v3 = [a1[4] managedObjectIDAtIndex:a2];
  if (v3)
  {
    unint64_t v5 = v3;
    id v4 = [a1[5] objectWithID:v3];
    [a1[6] addObject:v4];

    int v3 = v5;
  }
}

- (id)sortingComparator
{
  return 0;
}

- (NSURL)groupURL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = NSString;
  id v4 = [(PLGenericAlbum *)self uuid];
  unint64_t v5 = [v3 stringWithFormat:@"%@://%@/?%@=%@", @"assets-library", @"group", @"id", v4];
  unint64_t v6 = [v2 URLWithString:v5];

  return (NSURL *)v6;
}

- (BOOL)shouldDeleteWhenEmpty
{
  int v2 = [(PLGenericAlbum *)self kindValue];
  return (v2 - 1603) < 2 || v2 == 12;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (BOOL)canShowComments
{
  return [(PLGenericAlbum *)self kindValue] == 1505;
}

- (BOOL)canContributeToCloudSharedAlbum
{
  return 0;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  return 0;
}

- (BOOL)isFamilyCloudSharedAlbum
{
  return 0;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  return 0;
}

- (BOOL)isRegularRootFolder
{
  return [(PLGenericAlbum *)self kindValue] == 3999;
}

- (BOOL)isProjectAlbumRootFolder
{
  return [(PLGenericAlbum *)self kindValue] == 3998;
}

- (BOOL)isFolder
{
  uint64_t v2 = [(PLGenericAlbum *)self kindValue];
  return +[PLGenericAlbum isFolder:v2];
}

- (BOOL)isStandInAlbum
{
  int v2 = [(PLGenericAlbum *)self kindValue];
  return v2 == 4001 || (v2 & 0xFFFFFFFE) == 4002;
}

- (BOOL)isPendingPhotoStreamAlbum
{
  if ([(PLGenericAlbum *)self kindValue] != 1505) {
    return 0;
  }
  int v3 = [(PLGenericAlbum *)self cloudRelationshipState];
  uint64_t v4 = [v3 integerValue];

  return v4 == 1;
}

- (BOOL)isDuplicateAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1510;
}

- (BOOL)isProjectAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1508;
}

- (BOOL)isUserLibraryAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1613;
}

- (BOOL)isRecentlyAddedAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1616;
}

- (BOOL)isCloudSharedAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1505;
}

- (BOOL)isPhotoStreamAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1602
      || [(PLGenericAlbum *)self kindValue] == 1500;
}

- (BOOL)isOwnPhotoStreamAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1500;
}

- (BOOL)isUserCreated
{
  uint64_t v2 = [(PLGenericAlbum *)self kindValue];
  int v3 = objc_opt_class();
  return [v3 isUserCreatedForKind:v2];
}

- (BOOL)isSmartAlbum
{
  uint64_t v2 = [(PLGenericAlbum *)self kindValue];
  int v3 = objc_opt_class();
  return [v3 isSmartAlbumForKind:v2];
}

- (BOOL)isPanoramasAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1605;
}

- (BOOL)isCameraAlbum
{
  return [(PLGenericAlbum *)self kindValue] == 1000;
}

- (BOOL)isLibrary
{
  return [(PLGenericAlbum *)self kindValue] == 1552;
}

- (void)setUserQueryData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PLGenericAlbum_setUserQueryData___block_invoke;
  v6[3] = &unk_1E5866040;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(PLManagedObject *)self pl_safeSetValue:v5 forKey:@"userQueryData" valueDidChangeHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __35__PLGenericAlbum_setUserQueryData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = +[PLQueryHandler constructQueryFromData:*(void *)(a1 + 32)];
    objc_msgSend(WeakRetained, "setPrivacyState:", +[PLQueryHandler includesHiddenAssetsInQuery:](PLQueryHandler, "includesHiddenAssetsInQuery:", v2));
  }
}

- (void)setKindValue:(int)a3
{
  id v4 = [NSNumber numberWithShort:(__int16)a3];
  [(PLGenericAlbum *)self setKind:v4];
}

- (int)kindValue
{
  uint64_t v2 = [(PLGenericAlbum *)self kind];
  int v3 = [v2 shortValue];

  return v3;
}

- (void)_validateAndUpdateKeyAssetsIfNeeded
{
  v65[2] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  id v4 = [(PLGenericAlbum *)self objectIDsForRelationshipNamed:@"customKeyAsset"];
  id v5 = [v4 firstObject];
  unint64_t v6 = [(PLGenericAlbum *)self objectIDsForRelationshipNamed:@"keyAssets"];
  id v57 = 0;
  id v7 = [(PLGenericAlbum *)self fetchKeyAssetCandidates:&v57];
  id v8 = v57;
  id v9 = v8;
  if (!v7)
  {
    unint64_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v9;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "failed to perform key assets fetch: %@", buf, 0xCu);
    }
LABEL_33:

    goto LABEL_34;
  }
  v49 = v8;
  int v10 = objc_msgSend((id)objc_opt_class(), "_validateCurrentKeyAssetIDs:fetchedKeyAssetIDs:customKeyAssetID:maxCount:", v6, v7, v5, -[PLGenericAlbum keyAssetsMaxCount](self, "keyAssetsMaxCount"));
  if (v5 && ([v7 containsObject:v5] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F1C0D0];
    +[PLManagedAsset entityName];
    id v14 = v44 = v7;
    [v13 fetchRequestWithEntityName:v14];
    id v15 = v46 = v6;

    [v15 setIncludesPendingChanges:0];
    id v16 = (void *)MEMORY[0x1E4F28BA0];
    id v17 = [(PLGenericAlbum *)self predicateForKeyAssetsCandidates];
    v65[0] = v17;
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF = %@", v5];
    v18 = uint64_t v50 = v5;
    v65[1] = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
    id v20 = [v16 andPredicateWithSubpredicates:v19];

    [v15 setPredicate:v20];
    [v15 setResultType:1];
    id v21 = [(PLGenericAlbum *)self managedObjectContext];
    id v56 = v49;
    long long v22 = [v21 executeFetchRequest:v15 error:&v56];
    id v23 = v56;

    BOOL v11 = [v22 count] != 1;
    id v7 = v44;

    unint64_t v6 = v46;
    v49 = v23;
    id v5 = v50;
    if (!v10) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v11 = 0;
    if (!v10)
    {
LABEL_11:
      v48 = [MEMORY[0x1E4F1CA48] array];
      if ((v10 & 1) == 0) {
        [v48 addObject:@"needs update"];
      }
      if (v11) {
        [v48 addObject:@"reset custom key"];
      }
      long long v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        long long v25 = [(PLGenericAlbum *)self uuid];
        [(PLGenericAlbum *)self objectID];
        v27 = uint64_t v26 = v7;
        *(_DWORD *)buf = 138543874;
        v60 = v25;
        __int16 v61 = 2114;
        v62 = v27;
        __int16 v63 = 2114;
        v64 = v48;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_INFO, "Updating key assets for album %{public}@ %{public}@ with reason %{public}@", buf, 0x20u);

        id v7 = v26;
      }

      v42 = v4;
      v43 = v3;
      v47 = v6;
      if (v11)
      {
        [(PLGenericAlbum *)self setCustomKeyAsset:0];

        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      }
      else
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
        if (v5)
        {
          uint64_t v29 = [(PLGenericAlbum *)self managedObjectContext];
          v51 = v5;
          v30 = [v29 objectWithID:v5];

          [v28 addObject:v30];
          char v31 = 0;
LABEL_22:
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v45 = v7;
          id v32 = v7;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v58 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v53;
LABEL_24:
            uint64_t v36 = 0;
            while (1)
            {
              if (*(void *)v53 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v52 + 1) + 8 * v36);
              if ((v31 & 1) != 0 || ([*(id *)(*((void *)&v52 + 1) + 8 * v36) isEqual:v51] & 1) == 0)
              {
                v38 = [(PLGenericAlbum *)self managedObjectContext];
                uint64_t v39 = [v38 objectWithID:v37];

                [v28 addObject:v39];
                unint64_t v40 = [v28 count];
                unint64_t v41 = [(PLGenericAlbum *)self keyAssetsMaxCount];

                if (v40 >= v41) {
                  break;
                }
              }
              if (v34 == ++v36)
              {
                uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v58 count:16];
                if (v34) {
                  goto LABEL_24;
                }
                break;
              }
            }
          }

          [(PLGenericAlbum *)self setKeyAssets:v28];
          id v4 = v42;
          int v3 = v43;
          id v9 = v49;
          id v5 = v51;
          id v7 = v45;
          unint64_t v6 = v47;
          unint64_t v12 = v48;
          goto LABEL_33;
        }
      }
      v51 = 0;
      char v31 = 1;
      goto LABEL_22;
    }
  }
  if (v11) {
    goto LABEL_11;
  }
  id v9 = v49;
LABEL_34:
}

- (id)fetchKeyAssetCandidates:(id *)a3
{
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  unint64_t v6 = +[PLManagedAsset entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  [v7 setIncludesPendingChanges:0];
  objc_msgSend(v7, "setFetchLimit:", -[PLGenericAlbum keyAssetsMaxCount](self, "keyAssetsMaxCount"));
  id v8 = [(PLGenericAlbum *)self predicateForKeyAssetsCandidates];
  [v7 setPredicate:v8];

  id v9 = [(PLGenericAlbum *)self sortDescriptorsForKeyAssetsCandidates];
  [v7 setSortDescriptors:v9];

  [v7 setResultType:1];
  int v10 = [(PLGenericAlbum *)self managedObjectContext];
  BOOL v11 = [v10 executeFetchRequest:v7 error:a3];

  return v11;
}

- (id)sortDescriptorsForKeyAssetsCandidates
{
  int v3 = objc_opt_class();
  uint64_t v4 = [(PLGenericAlbum *)self customSortKey];
  uint64_t v5 = [(PLGenericAlbum *)self customSortAscending];
  return (id)[v3 sortDescriptorsForAssetsInAlbumWithSortKey:v4 ascending:v5];
}

- (int64_t)keyAssetsMaxCount
{
  return 5;
}

- (id)predicateForKeyAssetsCandidates
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  int v3 = [(PLGenericAlbum *)self objectID];
  uint64_t v4 = [v2 predicateWithFormat:@"%K CONTAINS %@", @"albums", v3];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"trashedState", 0);
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"hidden", 0);
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  id v9 = [v7 andPredicateWithSubpredicates:v8];

  return v9;
}

- (void)updateKeyAssetsIfNeeded
{
  int v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  if (objc_msgSend((id)objc_opt_class(), "supportsCachedKeyAssetsWithAlbumKind:", -[PLGenericAlbum kindValue](self, "kindValue")))-[PLGenericAlbum _validateAndUpdateKeyAssetsIfNeeded](self, "_validateAndUpdateKeyAssetsIfNeeded"); {
}
  }

- (NSObject)posterImage
{
  return 0;
}

- (NSString)name
{
  NSLog(&cfstr_WarningTheName.isa, a2, self);
  PLPrintSymbolicStackTrace();
  return [(PLGenericAlbum *)self localizedTitle];
}

- (NSString)localizedTitle
{
  uint64_t v3 = [(PLGenericAlbum *)self kindValue];
  uint64_t v4 = [(PLGenericAlbum *)self photoLibrary];
  uint64_t v5 = +[PLGenericAlbum localizedTitleForAlbumKind:cplEnabled:](PLGenericAlbum, "localizedTitleForAlbumKind:cplEnabled:", v3, [v4 isCloudPhotoLibraryEnabled]);

  if (!v5)
  {
    uint64_t v5 = [(PLGenericAlbum *)self title];
  }
  return (NSString *)v5;
}

- (BOOL)hasUnseenContentBoolValue
{
  return 0;
}

- (unint64_t)videosCount
{
  return [(PLGenericAlbum *)self countForAssetsOfKind:1];
}

- (unint64_t)photosCount
{
  return [(PLGenericAlbum *)self countForAssetsOfKind:0];
}

- (BOOL)isEmpty
{
  return [(PLGenericAlbum *)self assetsCount] == 0;
}

- (unint64_t)assetsCount
{
  uint64_t v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  uint64_t v4 = [(PLGenericAlbum *)self assets];
  unint64_t v5 = [v4 count];

  return v5;
}

- (unint64_t)approximateCount
{
  uint64_t v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  uint64_t v4 = [(PLGenericAlbum *)self assets];
  unint64_t v5 = [v4 count];

  return v5;
}

- (void)_repairTitleIfEmpty
{
  uint64_t v3 = [(PLGenericAlbum *)self localizedTitle];
  id v7 = v3;
  if (!v3 || (uint64_t v4 = [v3 length], v5 = v7, !v4))
  {
    unint64_t v6 = [(id)objc_opt_class() localizedRecoveredTitle];
    [(PLGenericAlbum *)self setTitle:v6];

    unint64_t v5 = v7;
  }
}

- (void)repairUuidAndTitleWithRecoveryReason:(const char *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLGenericAlbum *)self setUuid:v5];
  if (!*MEMORY[0x1E4F59AC0])
  {
    unint64_t v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(PLGenericAlbum *)self objectID];
      int v8 = 136315650;
      id v9 = a3;
      __int16 v10 = 2112;
      BOOL v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Repaired an album without a UUID in %s: %@ %@", (uint8_t *)&v8, 0x20u);
    }
  }
  [(PLGenericAlbum *)self _repairTitleIfEmpty];
}

- (void)didSave
{
  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  [(PLManagedObject *)&v3 didSave];
  self->_didAutomaticallyAssignParentFolder = 0;
}

- (void)willSave
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PLGenericAlbum;
  [(PLManagedObject *)&v18 willSave];
  if (([(PLGenericAlbum *)self isDeleted] & 1) == 0)
  {
    objc_super v3 = [(PLGenericAlbum *)self uuid];

    if (!v3)
    {
      -[PLGenericAlbum repairUuidAndTitleWithRecoveryReason:](self, "repairUuidAndTitleWithRecoveryReason:", "-[PLGenericAlbum willSave]");
      PLSimulateCrash();
    }
  }
  uint64_t v4 = [(PLGenericAlbum *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 isInitializingSingletons] & 1) == 0
    && ([(PLGenericAlbum *)self isDeleted] & 1) == 0)
  {
    if ([(PLGenericAlbum *)self isUserCreated])
    {
      unint64_t v5 = [(PLGenericAlbum *)self parentFolder];

      if (!v5)
      {
        if (self->_didAutomaticallyAssignParentFolder)
        {
          unint64_t v6 = PLBackendGetLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            id v7 = [(PLGenericAlbum *)self uuid];
            int v8 = [(PLGenericAlbum *)self objectID];
            *(_DWORD *)buf = 138543618;
            id v20 = v7;
            __int16 v21 = 2114;
            long long v22 = v8;
            _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Skipping automatic assignment of nil parent folder to avoid willSave looping for album: %{public}@ %{public}@", buf, 0x16u);
          }
          goto LABEL_24;
        }
        if ([(PLGenericAlbum *)self isProjectAlbum])
        {
          id v9 = PLBackendGetLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v10 = [(PLGenericAlbum *)self uuid];
            BOOL v11 = [(PLGenericAlbum *)self objectID];
            *(_DWORD *)buf = 138543618;
            id v20 = v10;
            __int16 v21 = 2114;
            long long v22 = v11;
            _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Setting default (rootProjectFolder) for nil parent folder: %{public}@ %{public}@", buf, 0x16u);
          }
          __int16 v12 = [v4 photoLibrary];
          uint64_t v13 = +[PLGenericAlbum projectAlbumRootFolderInLibrary:v12];
        }
        else
        {
          if ([(PLGenericAlbum *)self isInserted]
            && [(PLGenericAlbum *)self kindValue] != 1507)
          {
            goto LABEL_23;
          }
          uint64_t v14 = PLBackendGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [(PLGenericAlbum *)self uuid];
            id v16 = [(PLGenericAlbum *)self objectID];
            *(_DWORD *)buf = 138543618;
            id v20 = v15;
            __int16 v21 = 2114;
            long long v22 = v16;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Setting default (rootFolder) for nil parent folder: %{public}@ %{public}@", buf, 0x16u);
          }
          __int16 v12 = [v4 photoLibrary];
          uint64_t v13 = +[PLGenericAlbum rootFolderInLibrary:v12];
        }
        id v17 = (void *)v13;

        [v17 addChildCollectionsObject:self];
LABEL_23:
        self->_didAutomaticallyAssignParentFolder = 1;
      }
    }
  }
LABEL_24:
}

- (void)willTurnIntoFault
{
  [(PLGenericAlbum *)self unregisterForChanges];
  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  [(PLGenericAlbum *)&v3 willTurnIntoFault];
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  [(PLGenericAlbum *)&v3 awakeFromFetch];
  [(PLGenericAlbum *)self registerForChanges];
}

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)PLGenericAlbum;
  [(PLGenericAlbum *)&v5 awakeFromInsert];
  objc_super v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLGenericAlbum *)self setUuid:v3];

  [(PLGenericAlbum *)self setKindValue:2];
  [(PLGenericAlbum *)self setPendingItemsCount:0];
  [(PLGenericAlbum *)self setPendingItemsType:1];
  [(PLGenericAlbum *)self registerForChanges];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [(PLGenericAlbum *)self setCreationDate:v4];
}

- (PLPhotoLibrary)photoLibrary
{
  uint64_t v2 = [(PLGenericAlbum *)self managedObjectContext];
  objc_super v3 = [v2 photoLibrary];

  return (PLPhotoLibrary *)v3;
}

- (BOOL)isSyncableChange
{
  return 1;
}

- (BOOL)supportsCloudUpload
{
  if ([(PLGenericAlbum *)self isPrototype]) {
    return 0;
  }
  if ([(PLGenericAlbum *)self kindValue] == 4000
    || [(PLGenericAlbum *)self kindValue] == 2
    || [(PLGenericAlbum *)self kindValue] == 3999
    || [(PLGenericAlbum *)self isProjectAlbumSupportingCloudUpload])
  {
    return 1;
  }
  return [(PLGenericAlbum *)self kindValue] == 3998;
}

- (void)applyTrashedState:(signed __int16)a3 cascade:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  if (a3 == 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [(PLGenericAlbum *)self _applyTrashedState:v5 date:v5 < 2 :v7 cascade:v4];
}

- (void)_applyTrashedState:(signed __int16)a3 date:(BOOL)a4 :(id)a5 cascade:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v8 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if (![(PLGenericAlbum *)self canMoveToTrash])
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PLGenericAlbum.m" lineNumber:206 description:@"expect trashable album"];
  }
  if (((v8 & 0xFFFFFFFD) == 0) == [(PLGenericAlbum *)self trashedState])
  {
    [(PLGenericAlbum *)self setTrashedState:v8];
    if (v7) {
      [(PLGenericAlbum *)self setTrashedDate:v11];
    }
    if (v8 == 2) {
      [(PLGenericAlbum *)self delete];
    }
  }
  if ([(PLGenericAlbum *)self isFolder] && v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    __int16 v12 = [(PLGenericAlbum *)self childCollections];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v16++) _applyTrashedState:v8 date:v7 :v11 cascade:1];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (BOOL)isInTrash
{
  return [(PLGenericAlbum *)self trashedState] != 0;
}

- (BOOL)canMoveToTrash
{
  int v3 = [(PLGenericAlbum *)self kindValue];
  if ((v3 - 1507) >= 2 && v3 != 4000 && v3 != 2) {
    return 0;
  }
  return [(PLGenericAlbum *)self canPerformEditOperation:32];
}

- (void)delete
{
  id v3 = [(PLGenericAlbum *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (id)childKeyForOrdering
{
  return 0;
}

- (void)dealloc
{
  [(PLGenericAlbum *)self unregisterForChanges];
  [(PLGenericAlbum *)self unregisterAllDerivedAlbums];
  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  [(PLGenericAlbum *)&v3 dealloc];
}

+ (id)_albumsMatchingPredicate:(id)a3 expectedResultCount:(id)a4 inManagedObjectContext:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && ![v9 integerValue])
  {
    long long v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F38D3B0]();
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    uint64_t v13 = [a1 entityInManagedObjectContext:v10];
    [v12 setEntity:v13];

    [v12 setPredicate:v8];
    if (!v9 || (unint64_t)[v9 integerValue] >= 0x65) {
      [v12 setFetchBatchSize:100];
    }
    id v21 = 0;
    uint64_t v14 = [v10 executeFetchRequest:v12 error:&v21];
    id v15 = v21;
    uint64_t v16 = v15;
    if (v14)
    {

      id v17 = v14;
    }
    else
    {
      long long v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v12;
        __int16 v24 = 2112;
        long long v25 = v16;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch %@: %@", buf, 0x16u);
      }

      id v17 = [MEMORY[0x1E4F1C978] array];
    }
    long long v19 = v17;
  }
  return v19;
}

+ (PLGenericAlbum)albumWithKind:(int)a3 inManagedObjectContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x19F38D3B0]();
  id v8 = [a1 albumsWithKind:v4 inManagedObjectContext:v6];
  id v9 = [v8 lastObject];

  return (PLGenericAlbum *)v9;
}

+ (id)insertAlbumWithKind:(int)a3 title:(id)a4 uuid:(id)a5 inManagedObjectContext:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x19F38D3B0]();
  if (v8 == 1505)
  {
    if ((id)objc_opt_class() == a1) {
      goto LABEL_6;
    }
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = v15;
    id v17 = @"kPhotoLibraryAlbumKind_CloudSharedAlbum can only be PLCloudSharedAlbum.";
    SEL v18 = a2;
    id v19 = a1;
    uint64_t v20 = 1950;
    goto LABEL_12;
  }
  if (v8 == 1500 && (id)objc_opt_class() != a1)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = v15;
    id v17 = @"kPhotoLibraryAlbumKind_PhotoStream can only be PLPhotoStreamAlbum.";
    SEL v18 = a2;
    id v19 = a1;
    uint64_t v20 = 1947;
LABEL_12:
    [v15 handleFailureInMethod:v18 object:v19 file:@"PLGenericAlbum.m" lineNumber:v20 description:v17];
  }
LABEL_6:
  id v21 = [a1 insertInManagedObjectContext:v13];
  [v21 setKindValue:v8];
  [v21 setTitle:v11];
  if (v12) {
    [v21 setUuid:v12];
  }

  return v21;
}

+ (id)eventsWithName:(id)a3 andImportSessionIdentifier:(id)a4 inManagedObjectContext:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = NSNumber;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 numberWithInt:12];
  uint64_t v14 = [v8 predicateWithFormat:@"kind == %@ AND title == %@ AND importSessionID == %@", v13, v12, v11];

  id v15 = [a1 _albumsMatchingPredicate:v14 expectedResultCount:0 inManagedObjectContext:v10];

  return v15;
}

+ (id)albumsWithKind:(int)a3 inManagedObjectContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  BOOL v7 = NSNumber;
  id v8 = a4;
  id v9 = [v7 numberWithInt:v4];
  id v10 = [v6 predicateWithFormat:@"kind == %@", v9];

  id v11 = [a1 _albumsMatchingPredicate:v10 expectedResultCount:0 inManagedObjectContext:v8];

  return v11;
}

+ (id)allAlbumsRegisteredWithManagedObjectContext:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = [MEMORY[0x1E4F1CA48] array];
  BOOL v7 = [a1 entityInManagedObjectContext:v4];
  id v8 = [v7 subentities];
  uint64_t v9 = [v8 count];

  id v32 = v7;
  if (v9)
  {
    char v31 = v5;
    id v10 = [v7 subentities];
    id v11 = [v10 arrayByAddingObject:v7];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v12 = [v4 registeredObjects];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          SEL v18 = [v17 entity];
          uint64_t v19 = [v11 indexOfObjectIdenticalTo:v18];

          if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
            [v6 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v14);
    }

    uint64_t v5 = v31;
    BOOL v7 = v32;
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = [v4 registeredObjects];
    uint64_t v20 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      long long v22 = v5;
      id v23 = v4;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v11);
          }
          uint64_t v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          uint64_t v27 = [v26 entity];

          BOOL v28 = v27 == v32;
          BOOL v7 = v32;
          if (v28) {
            [v6 addObject:v26];
          }
        }
        uint64_t v21 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);
      id v4 = v23;
      uint64_t v5 = v22;
    }
  }

  uint64_t v29 = (void *)[v6 copy];

  return v29;
}

+ (id)allSyncedAlbumsInManagedObjectContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  id v6 = [v4 predicateWithFormat:@"kind in {%d, %d, %d, %d}", 15, 1550, 1551, 1552];
  BOOL v7 = [a1 _albumsMatchingPredicate:v6 expectedResultCount:0 inManagedObjectContext:v5];

  return v7;
}

+ (id)allAlbumsInManagedObjectContext:(id)a3
{
  return (id)[a1 _albumsMatchingPredicate:0 expectedResultCount:0 inManagedObjectContext:a3];
}

+ (id)albumFromGroupURL:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v9 = [a1 uuidFromGroupURL:v6];
  if (![v9 length]
    || ([a1 albumWithUUID:v9 inLibrary:v7], (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSLog(&cfstr_CouldNotFindGr.isa, v9);
    id v10 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v10 isInTrash])
  {

    id v10 = 0;
  }

  return v10;
}

+ (id)insertNewLegacyFaceAlbumIntoLibrary:(id)a3
{
  return (id)[a1 _insertNewAlbumWithKind:15 title:0 lastInterestingDate:0 intoLibrary:a3];
}

+ (id)insertNewCloudSharedAlbumWithTitle:(id)a3 lastInterestingDate:(id)a4 intoLibrary:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x1E4F8B980];
  uint64_t v13 = [v11 pathManager];
  uint64_t v14 = [v13 libraryURL];
  if ([v12 isSystemPhotoLibraryURL:v14])
  {

    goto LABEL_4;
  }
  char v15 = [v11 isUnitTesting];

  if (v15)
  {
LABEL_4:
    uint64_t v16 = [a1 _insertNewAlbumWithKind:1505 title:v9 lastInterestingDate:v10 intoLibrary:v11];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
    {
      long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, a1, @"PLGenericAlbum.m", 1819, @"Cloud shared album is of unexpected class: %@", v16 object file lineNumber description];
    }
    id v17 = +[PLPhotoSharingHelper sharingPersonID];
    if ([v17 length])
    {
      SEL v18 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v17;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "setting cloudPersonID of newly created album to %@", buf, 0xCu);
      }

      [v16 setCloudPersonID:v17];
    }
    goto LABEL_14;
  }
  id v17 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    uint64_t v19 = [v11 pathManager];
    uint64_t v20 = [v19 libraryURL];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v20;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_FAULT, "Unable to insert new cloud shared album because library is not the SPL: %@", buf, 0xCu);
  }
  uint64_t v16 = 0;
LABEL_14:

  return v16;
}

+ (id)insertNewSyncedEventIntoLibrary:(id)a3
{
  return (id)[a1 insertNewSyncedEventWithTitle:0 intoLibrary:a3];
}

+ (id)insertNewSyncedEventWithTitle:(id)a3 intoLibrary:(id)a4
{
  return (id)[a1 _insertNewAlbumWithKind:1551 title:a3 lastInterestingDate:0 intoLibrary:a4];
}

+ (id)insertNewAlbumIntoLibrary:(id)a3
{
  return (id)[a1 _insertNewAlbumWithKind:2 title:0 lastInterestingDate:0 intoLibrary:a3];
}

+ (id)insertNewProjectAlbumWithTitle:(id)a3 documentType:(id)a4 intoLibrary:(id)a5
{
  id v8 = a4;
  id v9 = [a1 _insertNewAlbumWithKind:1508 title:a3 lastInterestingDate:0 intoLibrary:a5];
  id v10 = v9;
  if (v9) {
    [v9 setProjectDocumentType:v8];
  }

  return v10;
}

+ (id)insertNewSmartAlbumIntoLibrary:(id)a3
{
  objc_super v3 = [a3 managedObjectContext];
  id v4 = +[PLManagedObject insertInManagedObjectContext:v3];

  [v4 setKindValue:1507];
  return v4;
}

+ (id)insertNewAlbumWithTitle:(id)a3 intoLibrary:(id)a4
{
  return (id)[a1 _insertNewAlbumWithKind:2 title:a3 lastInterestingDate:0 intoLibrary:a4];
}

+ (id)insertNewAlbumWithKind:(int)a3 title:(id)a4 intoLibrary:(id)a5
{
  return (id)[a1 _insertNewAlbumWithKind:*(void *)&a3 title:a4 lastInterestingDate:0 intoLibrary:a5];
}

+ (id)_insertNewAlbumWithKind:(int)a3 title:(id)a4 lastInterestingDate:(id)a5 intoLibrary:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if ((int)v8 > 1504)
  {
    if (v8 == 1505)
    {
      uint64_t v14 = [v11 managedObjectContext];
      char v15 = +[PLManagedObject insertInManagedObjectContext:v14];

      [v15 updateCloudLastInterestingChangeDateWithDate:v10];
      if (v15) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
    if (v8 == 1508)
    {
      uint64_t v13 = PLProjectAlbum;
      goto LABEL_13;
    }
  }
  else
  {
    if (v8 == 15)
    {
      uint64_t v13 = PLManagedLegacyFaceAlbum;
      goto LABEL_13;
    }
    if (v8 == 1500)
    {
      uint64_t v13 = PLPhotoStreamAlbum;
      goto LABEL_13;
    }
  }
  uint64_t v13 = PLManagedAlbum;
LABEL_13:
  SEL v18 = [v11 managedObjectContext];
  char v15 = [(__objc2_class *)v13 insertInManagedObjectContext:v18];

  if (v15)
  {
LABEL_14:
    [v15 setKindValue:v8];
    [v15 setTitle:v9];
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    if ((int)v8 > 1506)
    {
      if ((int)v8 > 1550)
      {
        if (v8 != 1551)
        {
          if (v8 != 1603 && v8 != 1604) {
            goto LABEL_36;
          }
          goto LABEL_24;
        }
        uint64_t v24 = +[PLManagedAlbumList eventListInPhotoLibrary:v12];
LABEL_34:
        long long v22 = (void *)v24;
        id v23 = v19;
        goto LABEL_35;
      }
      if (v8 != 1507 && v8 != 1550) {
        goto LABEL_36;
      }
    }
    else
    {
      if ((int)v8 > 14)
      {
        if (v8 != 15)
        {
          if (v8 != 1500)
          {
            if (v8 == 1505)
            {
              uint64_t v21 = +[PLManagedAlbumList allStreamedAlbumsListInPhotoLibrary:v12];
LABEL_25:
              long long v22 = (void *)v21;
              id v23 = v20;
LABEL_35:
              [v23 addObject:v22];
            }
LABEL_36:
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            uint64_t v16 = v19;
            uint64_t v25 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v41;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v41 != v27) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v29 = [*(id *)(*((void *)&v40 + 1) + 8 * i) albums];
                  [v29 addObject:v15];
                }
                uint64_t v26 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
              }
              while (v26);
            }

            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v17 = v20;
            uint64_t v30 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v37;
              do
              {
                for (uint64_t j = 0; j != v31; ++j)
                {
                  if (*(void *)v37 != v32) {
                    objc_enumerationMutation(v17);
                  }
                  objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v15, (void)v36);
                }
                uint64_t v31 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v31);
            }

            id v34 = v15;
            goto LABEL_51;
          }
LABEL_24:
          uint64_t v21 = +[PLManagedAlbumList albumListInPhotoLibrary:v12];
          goto LABEL_25;
        }
        uint64_t v24 = +[PLManagedAlbumList facesAlbumListInPhotoLibrary:v12];
        goto LABEL_34;
      }
      if (v8 != 2)
      {
        if (v8 != 12) {
          goto LABEL_36;
        }
        uint64_t v24 = +[PLManagedAlbumList importListInPhotoLibrary:v12];
        goto LABEL_34;
      }
    }
    uint64_t v24 = +[PLManagedAlbumList albumListInPhotoLibrary:v12];
    goto LABEL_34;
  }
LABEL_10:
  uint64_t v16 = PLBackendGetLog();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    goto LABEL_52;
  }
  id v17 = [v12 managedObjectContext];
  *(_DWORD *)buf = 67109634;
  int v47 = v8;
  __int16 v48 = 2112;
  v49 = v12;
  __int16 v50 = 2112;
  id v51 = v17;
  _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Unable to insert new album with kind %d. Library shutting down? library %@ moc %@", buf, 0x1Cu);
LABEL_51:

LABEL_52:
  return v15;
}

+ (id)albumsMatchingPredicate:(id)a3 expectedResultCount:(id)a4 inLibrary:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [a5 managedObjectContext];
  id v10 = +[PLGenericAlbum _albumsMatchingPredicate:v8 expectedResultCount:v7 inManagedObjectContext:v9];

  return v10;
}

+ (void)removeInvalidAlbumsAndFoldersInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Removing invalid albums and folders with nil UUID", buf, 2u);
    }
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(kind == %d OR kind == %d OR kind == %d OR kind == %d) AND uuid = nil", 2, 4000, 1507, 1508);
  id v8 = [a1 _albumsMatchingPredicate:v7 expectedResultCount:0 inManagedObjectContext:v4];
  [a1 _removeAlbumsAndFolders:v8 inManagedObjectContext:v4];
}

+ (void)removeTrashedAlbumsAndFoldersForCloudResetInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Removing trashed/expunged albums and folders for cloud reset", buf, 2u);
    }
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(kind == %d OR kind == %d OR kind == %d OR kind == %d) AND trashedState != %d", 2, 4000, 1507, 1508, 0);
  id v8 = [a1 _albumsMatchingPredicate:v7 expectedResultCount:0 inManagedObjectContext:v4];
  [a1 _removeAlbumsAndFolders:v8 inManagedObjectContext:v4];
}

+ (void)removeEmptyAlbumsAndFoldersForCloudResetInManagedObjectContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v7 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Removing empty albums for cloud reset", buf, 2u);
    }
  }
  id v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Album"];
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d AND cloudLocalState == %d AND assets.@count == 0", 2, 1);
  [v8 setPredicate:v9];
  [v8 setFetchBatchSize:100];
  id v22 = 0;
  id v10 = [v4 executeFetchRequest:v8 error:&v22];
  id v11 = v22;
  if (v10)
  {
    [a1 _removeAlbumsAndFolders:v10 inManagedObjectContext:v4];
  }
  else
  {
    id v12 = a1;
    uint64_t v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch empty albums %@: %@", buf, 0x16u);
    }

    a1 = v12;
    id v6 = (unsigned char *)MEMORY[0x1E4F59AC0];
  }

  uint64_t v14 = (void *)MEMORY[0x19F38D3B0]();
  if (!*v6)
  {
    char v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Removing empty folders for cloud reset", buf, 2u);
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Folder"];
  id v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d AND cloudLocalState == %d AND childCollections.@count == 0", 4000, 1);
  [v16 setPredicate:v17];
  [v16 setFetchBatchSize:100];
  id v21 = 0;
  SEL v18 = [v4 executeFetchRequest:v16 error:&v21];
  id v19 = v21;
  if (v18)
  {
    [a1 _removeAlbumsAndFolders:v18 inManagedObjectContext:v4];
  }
  else
  {
    uint64_t v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch empty folders %@: %@", buf, 0x16u);
    }
  }
}

+ (void)removeAllUserAlbumsAndFoldersInLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Removing all user albums and folders for cloud reset", buf, 2u);
    }
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(kind == %d OR kind == %d OR kind == %d OR kind == %d)", 2, 4000, 1507, 1508);
  id v8 = [v4 managedObjectContext];
  id v9 = [a1 _albumsMatchingPredicate:v7 expectedResultCount:0 inManagedObjectContext:v8];

  id v10 = [v4 managedObjectContext];
  [a1 _removeAlbumsAndFolders:v9 inManagedObjectContext:v10];
}

+ (void)_removeAlbumsAndFolders:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  SEL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _DWORD v16[2] = __65__PLGenericAlbum__removeAlbumsAndFolders_inManagedObjectContext___block_invoke;
  v16[3] = &unk_1E5866090;
  v16[4] = &v21;
  v16[5] = &v17;
  id v8 = [v6 enumerateWithIncrementalSaveUsingObjects:v5 withBlock:v16];
  if (v8)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v9 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v5 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v26 = v10;
        __int16 v27 = 2112;
        BOOL v28 = v8;
        id v11 = "Failed to remove %ld albums and folder: %@";
        id v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_19B3C7000, v12, v13, v11, buf, 0x16u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v22[3];
      char v15 = (void *)v18[3];
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = v14;
      __int16 v27 = 2048;
      BOOL v28 = v15;
      id v11 = "Deleted %lu folders, %lu albums.";
      id v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_9:
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

void __65__PLGenericAlbum__removeAlbumsAndFolders_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"album";
      if (isKindOfClass) {
        id v6 = @"folder";
      }
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Deleting %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  [v3 delete];
  uint64_t v7 = 40;
  if (isKindOfClass) {
    uint64_t v7 = 32;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + v7) + 8) + 24);
}

+ (void)resetAlbumStateForCloudInLibrary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x19F38D3B0]();
  id v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Resetting cloudLocalState of albums", buf, 2u);
    }
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1C038]);
  int v8 = +[PLGenericAlbum entityName];
  id v9 = (void *)[v7 initWithEntityName:v8];

  __int16 v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(kind == %d OR kind == %d OR kind == %d OR kind == %d OR kind == %d OR kind == %d) AND cloudLocalState != %d", 2, 4000, 1507, 3999, 1508, 3998, 0);
  [v9 setPredicate:v10];
  [v9 setResultType:2];
  [v9 setPropertiesToUpdate:&unk_1EEBF2838];
  id v11 = [v3 managedObjectContext];
  id v16 = 0;
  uint64_t v12 = [v11 executeRequest:v9 error:&v16];
  id v13 = v16;

  if (v13)
  {
    if (!*v5)
    {
      uint64_t v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to batch update album state: %@", buf, 0xCu);
      }
LABEL_12:
    }
  }
  else if (!*v5)
  {
    uint64_t v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      char v15 = [v12 result];
      *(_DWORD *)buf = 138412290;
      id v18 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Batch updated cloudLocalState for %@ albums", buf, 0xCu);
    }
    goto LABEL_12;
  }
}

+ (id)albumsToUploadInitiallyInLibrary:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F38D3B0]();
  int v8 = [v6 managedObjectContext];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v9 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1898];
  __int16 v10 = [a1 entityInManagedObjectContext:v8];
  [v9 setEntity:v10];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(kind == %d OR kind == %d OR kind == %d OR kind == %d OR kind == %d OR (kind == %d AND projectDocumentType != %@ AND projectDocumentType != %@)) AND cloudLocalState == %d", 2, 4000, 1507, 3999, 3998, 1508, @"com.apple.photos.projects.legacy", @"com.apple.photos.projects.slideshow", 0];
  [v9 setPredicate:v11];
  [v9 setFetchLimit:a4];
  uint64_t v15 = 0;
  uint64_t v12 = [v8 executeFetchRequest:v9 error:&v15];
  id v13 = [a1 includeUnpushedParentsForAlbums:v12 limit:a4];

  return v13;
}

+ (id)includeUnpushedParentsForAlbums:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
  int v8 = [a1 _unpushedParentsOfAlbums:v6];
  if ([v8 count])
  {
    do
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
      [v7 insertObjects:v8 atIndexes:v9];

      __int16 v10 = [a1 _unpushedParentsOfAlbums:v8];

      int v8 = v10;
    }
    while ([v10 count]);
  }
  else
  {
    __int16 v10 = v8;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  [v11 addObjectsFromArray:v7];
  uint64_t v12 = [v11 array];
  id v13 = (void *)MEMORY[0x1E4F28D60];
  unint64_t v14 = [v12 count];
  if (v14 >= a4) {
    unint64_t v15 = a4;
  }
  else {
    unint64_t v15 = v14;
  }
  id v16 = objc_msgSend(v13, "indexSetWithIndexesInRange:", 0, v15);
  uint64_t v17 = [v12 objectsAtIndexes:v16];

  return v17;
}

+ (id)_unpushedParentsOfAlbums:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "parentFolder", (void)v15);
        uint64_t v12 = v11;
        if (v11
          && [v11 cloudLocalState] != 1
          && ([v12 isRegularRootFolder] & 1) == 0
          && ([v12 isProjectAlbumRootFolder] & 1) == 0)
        {
          id v13 = [v10 parentFolder];
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)albumsForStreamID:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [NSNumber numberWithInt:1500];
  __int16 v10 = [v8 predicateWithFormat:@"kind == %@ AND title == %@", v9, v5];

  id v11 = [v6 managedObjectContext];
  uint64_t v12 = +[PLGenericAlbum _albumsMatchingPredicate:v10 expectedResultCount:0 inManagedObjectContext:v11];

  return v12;
}

+ (PLGenericAlbum)albumWithName:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"title = %@", v5];
    id v9 = [v6 managedObjectContext];
    __int16 v10 = +[PLGenericAlbum _albumsMatchingPredicate:v8 expectedResultCount:&unk_1EEBEDE48 inManagedObjectContext:v9];

    if ([v10 count])
    {
      id v11 = [v10 objectAtIndex:0];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return (PLGenericAlbum *)v11;
}

+ (PLGenericAlbum)albumWithObjectID:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v8 = [v6 managedObjectContext];
    id v14 = 0;
    id v9 = [v8 existingObjectWithID:v5 error:&v14];
    id v10 = v14;
    if (v10)
    {
      id v11 = v10;
      NSLog(&cfstr_FailedToFetchA_21.isa, v10);

      id v12 = 0;
    }
    else
    {

      id v12 = v9;
    }
  }
  else
  {
    id v12 = 0;
  }

  return (PLGenericAlbum *)v12;
}

+ (PLGenericAlbum)albumWithUUID:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v6];
  id v10 = [v7 managedObjectContext];
  id v11 = [a1 _albumsMatchingPredicate:v9 expectedResultCount:&unk_1EEBEDE48 inManagedObjectContext:v10];

  id v12 = [v11 lastObject];

  return (PLGenericAlbum *)v12;
}

+ (id)allAlbumsInLibrary:(id)a3
{
  id v4 = [a3 managedObjectContext];
  id v5 = [a1 allAlbumsInManagedObjectContext:v4];

  return v5;
}

+ (id)filesystemImportProgressAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonManagedAlbumWithKind:3573 library:a3];
}

+ (id)otaRestoreProgressAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonManagedAlbumWithKind:3572 library:a3];
}

+ (id)syncProgressAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonManagedAlbumWithKind:3571 library:a3];
}

+ (id)unableToUploadAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1624 library:a3];
}

+ (id)trashBinAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1612 library:a3];
}

+ (id)iTunesLibraryAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1552 library:a3];
}

+ (id)allPhotoStreamAssetsAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1602 library:a3];
}

+ (id)allFavoritesAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1609 library:a3];
}

+ (id)allVideosAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1606 library:a3];
}

+ (id)allHorizontalPanoramasAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1608 library:a3];
}

+ (id)allVerticalPanoramasAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1607 library:a3];
}

+ (id)allPanoramasAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1605 library:a3];
}

+ (id)allAssetsAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1600 library:a3];
}

+ (id)userLibraryAlbumInLibrary:(id)a3
{
  return (id)[a1 _singletonFetchingAlbumWithKind:1613 library:a3];
}

+ (id)projectAlbumRootFolderInLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PLGenericAlbum.m", 1324, @"Invalid parameter not satisfying: %@", @"aLibrary" object file lineNumber description];
  }
  id v6 = [v5 managedObjectContext];
  id v7 = +[PLGenericAlbum albumWithKind:3998 inManagedObjectContext:v6];
  if (!v7)
  {
    [v5 repairSingletonObjects];
    id v7 = +[PLGenericAlbum albumWithKind:3998 inManagedObjectContext:v6];
  }

  return v7;
}

+ (id)rootFolderInLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PLGenericAlbum.m", 1312, @"Invalid parameter not satisfying: %@", @"aLibrary" object file lineNumber description];
  }
  id v6 = [v5 managedObjectContext];
  id v7 = +[PLGenericAlbum albumWithKind:3999 inManagedObjectContext:v6];
  if (!v7)
  {
    [v5 repairSingletonObjects];
    id v7 = +[PLGenericAlbum albumWithKind:3999 inManagedObjectContext:v6];
  }

  return v7;
}

+ (id)_singletonManagedAlbumWithKind:(int)a3 library:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PLGenericAlbum.m", 1300, @"Invalid parameter not satisfying: %@", @"aLibrary" object file lineNumber description];
  }
  uint64_t v8 = [v7 managedObjectContext];
  id v9 = +[PLGenericAlbum albumWithKind:v4 inManagedObjectContext:v8];
  if (!v9)
  {
    [v7 repairSingletonObjects];
    id v9 = +[PLGenericAlbum albumWithKind:v4 inManagedObjectContext:v8];
  }

  return v9;
}

+ (id)_singletonFetchingAlbumWithKind:(int)a3 library:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PLGenericAlbum.m", 1288, @"Invalid parameter not satisfying: %@", @"aLibrary" object file lineNumber description];
  }
  uint64_t v8 = [v7 managedObjectContext];
  id v9 = +[PLGenericAlbum albumWithKind:v4 inManagedObjectContext:v8];
  if (!v9)
  {
    [v7 repairSingletonObjects];
    id v9 = +[PLGenericAlbum albumWithKind:v4 inManagedObjectContext:v8];
  }

  return v9;
}

+ (id)uuidFromGroupURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x19F38D3B0]();
  id v5 = [v3 scheme];
  if (([v5 isEqualToString:@"assets-library"] & 1) == 0)
  {

    goto LABEL_19;
  }
  id v6 = [v3 host];
  int v7 = [v6 isEqualToString:@"group"];

  if (!v7)
  {
LABEL_19:
    uint64_t v20 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = [v3 query];
  if ((unint64_t)[v8 length] >= 0x65)
  {
LABEL_18:

    goto LABEL_19;
  }
  id v9 = [v8 componentsSeparatedByString:@"&"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v10)
  {

    goto LABEL_18;
  }
  uint64_t v11 = v10;
  id v22 = v8;
  id v23 = v3;
  uint64_t v24 = 0;
  uint64_t v12 = *(void *)v26;
  id v13 = @"id";
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "componentsSeparatedByString:", @"=", v22);
      if ((unint64_t)[v15 count] >= 2)
      {
        long long v16 = [v15 objectAtIndex:0];
        long long v17 = [v15 objectAtIndex:1];
        if ([v16 isEqualToString:v13])
        {
          long long v18 = v13;
          id v19 = v17;

          uint64_t v24 = v19;
          id v13 = v18;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v11);

  id v3 = v23;
  uint64_t v20 = v24;
LABEL_20:

  return v20;
}

+ (BOOL)isFolder:(int)a3
{
  return (a3 - 3998) < 3 || a3 == 1553;
}

+ (BOOL)isUserCreatedForKind:(int)a3
{
  return (a3 - 1507) < 2 || a3 == 2 || a3 == 4000;
}

+ (BOOL)isSmartAlbumForKind:(int)a3
{
  return (a3 - 1605) < 0x1C
      || (a3 - 1600) <= 0x29 && ((1 << (a3 - 64)) & 0x3BC00000005) != 0
      || a3 == 1552
      || a3 == 1507;
}

+ (id)keyPathsForValuesAffectingKindValue
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"kind"];
}

+ (BOOL)_validateCurrentKeyAssetIDs:(id)a3 fetchedKeyAssetIDs:(id)a4 customKeyAssetID:(id)a5 maxCount:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    if (![v9 count] && !objc_msgSend(v10, "count"))
    {
      char v12 = 1;
      goto LABEL_14;
    }
    id v13 = v10;
    id v14 = v9;
    goto LABEL_13;
  }
  if (![v9 indexOfObject:v11])
  {
    uint64_t v15 = [v10 indexOfObject:v11];
    id v16 = v10;
    id v13 = v16;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v16 count] != a6)
      {
LABEL_12:
        id v18 = v9;
        objc_msgSend(v18, "subarrayWithRange:", 1, objc_msgSend(v18, "count") - 1);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        char v12 = [v14 isEqualToArray:v13];

        goto LABEL_14;
      }
      long long v17 = objc_msgSend(v13, "subarrayWithRange:", 0, objc_msgSend(v13, "count") - 1);
    }
    else
    {
      long long v17 = [MEMORY[0x1E4F1CA48] arrayWithArray:v16];
      [v17 removeObjectAtIndex:v15];
    }

    id v13 = v17;
    goto LABEL_12;
  }
  char v12 = 0;
LABEL_14:

  return v12;
}

+ (void)updateKeyAssetsInAlbums:(id)a3 photoLibrary:(id)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = +[PLManagedAlbum entityName];
  id v10 = [v8 fetchRequestWithEntityName:v9];

  id v11 = +[PLGenericAlbum predicateForAlbumsSupportingCachedKeyAssets];
  if (v6)
  {
    char v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF in %@", v6];
    id v13 = (void *)MEMORY[0x1E4F28BA0];
    v39[0] = v12;
    v39[1] = v11;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

    id v11 = (void *)v15;
  }
  [v10 setPredicate:v11];
  v38[0] = @"keyAssets";
  v38[1] = @"customKeyAsset";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v10 setRelationshipKeyPathsForPrefetching:v16];

  long long v17 = [v7 managedObjectContext];
  id v30 = 0;
  id v18 = [v17 executeFetchRequest:v10 error:&v30];
  id v19 = v30;

  if (v18)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) updateKeyAssetsIfNeeded];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v22);
    }
  }
  else
  {
    uint64_t v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v25 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v25;
      __int16 v33 = 2114;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v19;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch albums with %{public}@: %@", buf, 0x20u);
    }
  }
}

+ (BOOL)supportsCachedKeyAssetsWithAlbumKind:(int)a3
{
  BOOL v3 = a3 == 1508;
  if (a3 == 1505) {
    BOOL v3 = 1;
  }
  return a3 == 2 || v3;
}

+ (id)predicateForAlbumsSupportingCachedKeyAssets
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"kind", &unk_1EEBF1880];
}

+ (id)predicateForAlbumsSupportingCustomKeyAsset
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"kind", &unk_1EEBF1868];
}

+ (id)keyPathsForValuesAffectingName
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"kind", @"title", 0);
}

+ (id)localizedRecoveredTitle
{
  return (id)PLServicesLocalizedFrameworkStringForAssetsd();
}

+ (id)childKeyForOrdering
{
  return 0;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLGenericAlbum;
  id v3 = a3;
  uint64_t v4 = objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v3);
  int v5 = objc_msgSend(v3, "isEqualToString:", @"kindValue", v9.receiver, v9.super_class);

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"kind"];
    uint64_t v7 = [v4 setByAddingObjectsFromSet:v6];

    uint64_t v4 = (void *)v7;
  }
  return v4;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return [a3 containsObject:@"kind"];
}

- (id)payloadIDForTombstone:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"uuid"];
  uint64_t v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"PLGenericAlbum subclasses must implement payloadForChangedKeys" userInfo:0];
  objc_exception_throw(v4);
}

- (id)payloadID
{
  uint64_t v2 = [(PLGenericAlbum *)self uuid];
  id v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  return v3;
}

- (id)cplFullRecord
{
  id v3 = [(PLGenericAlbum *)self photoLibrary];
  id v4 = [(PLGenericAlbum *)self cplAlbumChangeInPhotoLibrary:v3 orderKeyManager:0];

  return v4;
}

- (BOOL)isProjectAlbumSupportingCloudUpload
{
  if ([(PLGenericAlbum *)self kindValue] == 1508)
  {
    id v3 = [(PLGenericAlbum *)self projectDocumentType];
    id v4 = v3;
    if (v3 && ([v3 containsString:@"com.apple.photos.projects.legacy"] & 1) == 0) {
      int v5 = [v4 containsString:@"com.apple.photos.projects.slideshow"] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)applyPropertiesFromAlbumChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 name];
  id v6 = [v4 scopedIdentifier];
  uint64_t v7 = [v6 identifier];

  if (v5)
  {
    uint64_t v8 = [(PLGenericAlbum *)self title];
    char v9 = [v8 isEqualToString:v5];

    if ((v9 & 1) == 0) {
      [(PLGenericAlbum *)self setTitle:v5];
    }
  }
  if (v7)
  {
    id v10 = [(PLGenericAlbum *)self cloudGUID];

    if (v10 != v7) {
      [(PLGenericAlbum *)self setCloudGUID:v7];
    }
  }
  if ([v4 inExpunged]) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = [v4 inTrash];
  }
  if ([(PLGenericAlbum *)self trashedState] != v11) {
    [(PLGenericAlbum *)self applyTrashedState:v11 cascade:0];
  }
  char v12 = [(PLGenericAlbum *)self trashedDate];
  id v13 = [v4 dateDeleted];
  char v14 = [v12 isEqualToDate:v13];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [v4 dateDeleted];
    [(PLGenericAlbum *)self setTrashedDate:v15];
  }
  int v16 = [(PLGenericAlbum *)self customSortAscending];
  if (v16 != [v4 albumSortAscending]) {
    -[PLGenericAlbum setCustomSortAscending:](self, "setCustomSortAscending:", [v4 albumSortAscending]);
  }
  int v17 = [(PLGenericAlbum *)self customSortKey];
  if (v17 != [v4 albumSortType]) {
    -[PLGenericAlbum setCustomSortKey:](self, "setCustomSortKey:", [v4 albumSortType]);
  }
  if ([v4 albumType] == 7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [v4 projectData];
      [(PLGenericAlbum *)self setProjectData:v18];

      id v19 = [v4 projectPreviewImageData];
      id v27 = 0;
      char v20 = [(PLGenericAlbum *)self setProjectPreviewImageData:v19 error:&v27];
      id v21 = v27;

      if ((v20 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
      {
        uint64_t v22 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v21;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Cannot creating projectPreviewImage resource, Error: %@", buf, 0xCu);
        }
      }
    }
  }
  if ([(PLGenericAlbum *)self cloudLocalState] != 1) {
    [(PLGenericAlbum *)self setCloudLocalState:1];
  }
  uint64_t v23 = [(PLGenericAlbum *)self importedByBundleIdentifier];
  uint64_t v24 = [v4 importedByBundleIdentifier];
  char IsEqual = PLObjectIsEqual();

  if ((IsEqual & 1) == 0)
  {
    long long v26 = [v4 importedByBundleIdentifier];
    [(PLGenericAlbum *)self setImportedByBundleIdentifier:v26];
  }
}

- (id)cplAlbumChangeInPhotoLibrary:(id)a3 orderKeyManager:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (PLRelationshipOrderKeyManager *)a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F59838]);
  if (![(PLGenericAlbum *)self isProjectAlbumRootFolder]
    && ![(PLGenericAlbum *)self isRegularRootFolder])
  {
    id v13 = [(PLGenericAlbum *)self scopedIdentifier];
    [v8 setScopedIdentifier:v13];

    char v14 = [(PLGenericAlbum *)self title];
    [v8 setName:v14];

    uint64_t v15 = [(PLGenericAlbum *)self importedByBundleIdentifier];
    [v8 setImportedByBundleIdentifier:v15];

    int v16 = [(PLGenericAlbum *)self parentFolder];
    if ([v16 isRegularRootFolder])
    {
      int v17 = 0;
    }
    else
    {
      id v18 = [(PLGenericAlbum *)self parentFolder];
      char v19 = [v18 isProjectAlbumRootFolder];

      if (v19)
      {
        int v17 = 0;
        goto LABEL_19;
      }
      char v20 = [(PLGenericAlbum *)self parentFolder];
      int v17 = [v20 cloudGUID];

      if (v17) {
        goto LABEL_19;
      }
      int v16 = [(PLGenericAlbum *)self parentFolder];
      int v17 = [v16 uuid];
    }

LABEL_19:
    [v8 setParentIdentifier:v17];
    id v21 = [v6 managedObjectContext];
    uint64_t v22 = [v6 libraryServicesManager];
    if (!v7)
    {
      uint64_t v23 = [PLRelationshipOrderKeyManager alloc];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __68__PLGenericAlbum_CPL__cplAlbumChangeInPhotoLibrary_orderKeyManager___block_invoke;
      v35[3] = &unk_1E5872390;
      id v36 = v22;
      uint64_t v7 = [(PLRelationshipOrderKeyManager *)v23 initWithGenerateContextBlock:v35];
    }
    uint64_t v24 = [(PLRelationshipOrderKeyManager *)v7 parentFolderOrderValueForAlbum:self inManagedObjectContext:v21];
    objc_msgSend(v8, "setPosition:", objc_msgSend(v24, "integerValue"));

    goto LABEL_22;
  }
  if (![(PLGenericAlbum *)self isProjectAlbumRootFolder])
  {
    if ([(PLGenericAlbum *)self isRegularRootFolder])
    {
      char v9 = @"----Root-Folder----";
      goto LABEL_7;
    }
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_23;
    }
    int v17 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v38 = [(PLGenericAlbum *)self kindValue];
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Cannot create CPLAlbumChange for unexpected root type: %u", buf, 8u);
    }
LABEL_22:

    goto LABEL_23;
  }
  char v9 = @"----Project-Root-Folder----";
LABEL_7:
  id v10 = [(PLGenericAlbum *)self scopeIdentifier];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v10 identifier:v9];
  [v8 setScopedIdentifier:v11];
  char v12 = [(PLGenericAlbum *)self cloudGUID];

  if (!v12) {
    [(PLGenericAlbum *)self setCloudGUID:v9];
  }

LABEL_23:
  if ([(PLGenericAlbum *)self isFolder])
  {
    long long v25 = v8;
    uint64_t v26 = 3;
  }
  else
  {
    if ([(PLGenericAlbum *)self isProjectAlbum])
    {
      [v8 setAlbumType:7];
      id v27 = self;
      long long v28 = [(PLGenericAlbum *)v27 projectDocumentType];
      [v8 setProjectDocumentType:v28];

      id v29 = [(PLGenericAlbum *)v27 projectData];
      [v8 setProjectData:v29];

      uint64_t v30 = [(PLGenericAlbum *)v27 projectPreviewImageData];

      [v8 setProjectPreviewImageData:v30];
      goto LABEL_29;
    }
    long long v25 = v8;
    uint64_t v26 = 0;
  }
  [v25 setAlbumType:v26];
LABEL_29:
  [v8 setChangeType:0];
  objc_msgSend(v8, "setAlbumSortType:", -[PLGenericAlbum customSortKey](self, "customSortKey"));
  objc_msgSend(v8, "setAlbumSortAscending:", -[PLGenericAlbum customSortAscending](self, "customSortAscending"));
  int v31 = [(PLGenericAlbum *)self trashedState];
  BOOL v32 = v31 == 2 || [(PLGenericAlbum *)self trashedState] == 1;
  [v8 setInTrash:v32];
  [v8 setInExpunged:v31 == 2];
  __int16 v33 = [(PLGenericAlbum *)self trashedDate];
  [v8 setDateDeleted:v33];

  return v8;
}

id __68__PLGenericAlbum_CPL__cplAlbumChangeInPhotoLibrary_orderKeyManager___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[PLGenericAlbum(CPL) cplAlbumChangeInPhotoLibrary:orderKeyManager:]_block_invoke";
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "Generating PLRelationshipOrderKeyManager context on-demand for: %s...", (uint8_t *)&v9, 0xCu);
  }

  int v5 = [*(id *)(a1 + 32) databaseContext];
  id v6 = (id)[v5 newShortLivedLibraryForOrderKeyManagerWithName:a2];

  uint64_t v7 = [v6 managedObjectContext];
  return v7;
}

- (id)scopedIdentifier
{
  id v3 = [(PLGenericAlbum *)self cloudGUID];
  if (!v3)
  {
    id v3 = [(PLGenericAlbum *)self uuid];
    if (!v3)
    {
      -[PLGenericAlbum repairUuidAndTitleWithRecoveryReason:](self, "repairUuidAndTitleWithRecoveryReason:", "-[PLGenericAlbum(CPL) scopedIdentifier]");
      id v3 = [(PLGenericAlbum *)self uuid];
    }
    [(PLGenericAlbum *)self setCloudGUID:v3];
  }
  id v4 = objc_alloc(MEMORY[0x1E4F59968]);
  int v5 = [(PLGenericAlbum *)self scopeIdentifier];
  id v6 = (void *)[v4 initWithScopeIdentifier:v5 identifier:v3];

  return v6;
}

- (id)scopeIdentifier
{
  uint64_t v2 = [(PLGenericAlbum *)self photoLibrary];
  id v3 = [v2 mainScopeIdentifier];

  return v3;
}

+ (id)albumsWithCloudGUIDs:(id)a3 inLibrary:(id)a4
{
  _DWORD v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 count])
  {
    char v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"cloudGUID IN %@", v6];
    int v9 = [a1 _predicateForSupportedAlbumTypes];
    id v10 = (void *)MEMORY[0x1E4F28BA0];
    v16[0] = v8;
    v16[1] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    char v12 = [v10 andPredicateWithSubpredicates:v11];

    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    char v14 = [a1 albumsMatchingPredicate:v12 expectedResultCount:v13 inLibrary:v7];
  }
  return v14;
}

+ (PLGenericAlbum)albumWithCloudGUID:(id)a3 inLibrary:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = 0;
  if ([v6 length] && v6)
  {
    v12[0] = v6;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v10 = [a1 albumsWithCloudGUIDs:v9 inLibrary:v7];
    id v8 = [v10 firstObject];
  }
  return (PLGenericAlbum *)v8;
}

+ (id)_predicateForSupportedAlbumTypes
{
  pl_dispatch_once();
  uint64_t v2 = (void *)_predicateForSupportedAlbumTypes_predicate;
  return v2;
}

void __55__PLGenericAlbum_CPL___predicateForSupportedAlbumTypes__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d", 2, 4000, 1507, 3999, 1508, 3998);
  v1 = (void *)_predicateForSupportedAlbumTypes_predicate;
  _predicateForSupportedAlbumTypes_predicate = v0;
}

@end