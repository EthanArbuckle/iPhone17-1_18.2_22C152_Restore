@interface PLFetchingAlbum
+ (BOOL)contextShouldIgnoreChangesForALAssetsGroupFilterPredicate;
+ (BOOL)contextShouldIgnoreChangesForFetchRequest;
+ (BOOL)contextShouldIgnoreChangesForFetchedAssets;
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)_predicateForAssetSubtype:(signed __int16)a3;
+ (id)_predicateForVisibleAsset;
+ (id)entityName;
+ (id)predicateForAlbumKind:(int)a3;
+ (id)predicateForAlbumKind:(int)a3 includeGuest:(BOOL)a4;
+ (id)sortDescriptorsForAlbumKind:(int)a3;
+ (id)validKindsForPersistence;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
- (BOOL)canPerformDeleteOperation;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)hasAssetsCache;
- (BOOL)isEmpty;
- (BOOL)isValidForPersistence;
- (BOOL)mayHaveAssetsInCommon:(id)a3;
- (BOOL)needsPersistenceUpdate;
- (NSFetchRequest)fetchRequest;
- (NSPredicate)ALAssetsGroupFilterPredicate;
- (id)_cachedKeyAssets;
- (id)_performFetchWithRequest:(id)a3;
- (id)assets;
- (id)fastPointerAccessSetForAssets:(id)a3;
- (id)filteredIndexesForPredicate:(id)a3;
- (id)mutableAssets;
- (id)payloadForChangedKeys:(id)a3;
- (int64_t)cloudDeletionType;
- (unint64_t)_fetchedCountForAssetsOfKind:(signed __int16)a3;
- (unint64_t)approximateCount;
- (unint64_t)batchSize;
- (unint64_t)count;
- (unint64_t)countForAssetsOfKind:(signed __int16)a3;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)batchFetchAssets:(id)a3;
- (void)didSave;
- (void)didTurnIntoFault;
- (void)persistMetadataToFileSystemWithPathManager:(id)a3;
- (void)prepareForDeletion;
- (void)removePersistedFileSystemDataWithPathManager:(id)a3;
- (void)setALAssetsGroupFilterPredicate:(id)a3;
- (void)setAssets:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setFetchRequest:(id)a3;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)setupFetchRequest;
- (void)updateSnapshotAndClearCaches:(id)a3;
- (void)willSave;
@end

@implementation PLFetchingAlbum

+ (id)_predicateForAssetSubtype:(signed __int16)a3
{
  uint64_t v3 = a3;
  v14[3] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLFetchingAlbum.m", 126, @"Invalid parameter not satisfying: %@", @"subtype != PLAssetSubtypeNone" object file lineNumber description];
  }
  v5 = (void *)MEMORY[0x1E4F28BA0];
  v6 = +[PLManagedAsset predicateForAssetSubtype:v3];
  v14[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPLFetchingAlbumExclusions"), 0);
  v14[1] = v7;
  v8 = [a1 _predicateForVisibleAsset];
  v14[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  v10 = [v5 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)sortDescriptorsForAlbumKind:(int)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1605:
    case 1606:
    case 1609:
    case 1610:
    case 1611:
    case 1614:
    case 1615:
    case 1617:
    case 1618:
    case 1620:
    case 1621:
    case 1622:
    case 1623:
    case 1624:
    case 1627:
    case 1628:
    case 1630:
    case 1631:
    case 1632:
    case 1634:
    case 1636:
    case 1637:
    case 1639:
    case 1641:
      goto LABEL_2;
    case 1607:
    case 1608:
    case 1629:
    case 1633:
    case 1635:
    case 1638:
      goto LABEL_9;
    case 1612:
      uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"trashedDate" ascending:1];
      v17[0] = v3;
      v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:0];
      v17[1] = v4;
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v17;
      goto LABEL_13;
    case 1613:
    case 1616:
    case 1625:
      uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
      v18[0] = v3;
      v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
      v18[1] = v4;
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v18;
      goto LABEL_13;
    case 1619:
      uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
      v14 = v3;
      v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = &v14;
      goto LABEL_15;
    case 1626:
      uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"adjustmentTimestamp" ascending:1];
      v15[0] = v3;
      v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
      v15[1] = v4;
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v15;
LABEL_13:
      v6 = [v8 arrayWithObjects:v9 count:2];
      goto LABEL_3;
    case 1640:
      uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
      v13 = v3;
      v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = &v13;
      goto LABEL_15;
    default:
      if (a3 == 1507)
      {
LABEL_2:
        uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
        v16[0] = v3;
        v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
        v16[1] = v4;
        v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
        v16[2] = v5;
        v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];

LABEL_3:
      }
      else
      {
LABEL_9:
        uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
        v12 = v3;
        v10 = (void *)MEMORY[0x1E4F1C978];
        v11 = &v12;
LABEL_15:
        v6 = [v10 arrayWithObjects:v11 count:1];
      }

      return v6;
  }
}

+ (id)_predicateForVisibleAsset
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", @"visibilityState", 0);
}

+ (id)predicateForAlbumKind:(int)a3 includeGuest:(BOOL)a4
{
  v4 = 0;
  v83[2] = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  v7 = 0;
  switch(a3)
  {
    case 1552:
      v14 = (void *)MEMORY[0x1E4F8BA10];
      uint64_t v15 = [MEMORY[0x1E4F8BA10] maskForFinderSyncedAsset];
      goto LABEL_7;
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
    case 1603:
    case 1604:
    case 1629:
    case 1633:
    case 1635:
    case 1638:
      goto LABEL_62;
    case 1600:
      goto LABEL_53;
    case 1602:
      v14 = (void *)MEMORY[0x1E4F8BA10];
      uint64_t v15 = [MEMORY[0x1E4F8BA10] maskForPhotoStreamAsset];
LABEL_7:
      uint64_t v16 = [v14 predicateForIncludeMask:v15 useIndex:1];
      goto LABEL_42;
    case 1605:
      uint64_t v17 = 1;
      goto LABEL_41;
    case 1606:
      v18 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K == %d) AND (noindex:(%K) != %d)", a4, @"playbackStyle", 4, @"kind", 2);
      v81[0] = v19;
      v20 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForVideosAlbumExclusions"), 0);
      v81[1] = v20;
      v21 = [a1 _predicateForVisibleAsset];
      v81[2] = v21;
      v22 = (void *)MEMORY[0x1E4F1C978];
      v23 = v81;
      goto LABEL_26;
    case 1607:
      v24 = objc_msgSend(a1, "_predicateForAssetSubtype:", 1, a4);
      v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"height > width"];
      v26 = (void *)MEMORY[0x1E4F28BA0];
      v83[0] = v24;
      v83[1] = v25;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = v83;
      goto LABEL_50;
    case 1608:
      v24 = objc_msgSend(a1, "_predicateForAssetSubtype:", 1, a4);
      v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"width > height"];
      v26 = (void *)MEMORY[0x1E4F28BA0];
      v82[0] = v24;
      v82[1] = v25;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = v82;
      goto LABEL_50;
    case 1609:
      v29 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 1", a4, @"favorite");
      v80[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v80[1] = v30;
      v31 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFavoritesAlbumExclusions"), 0);
      v80[2] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v80;
      goto LABEL_44;
    case 1610:
      uint64_t v17 = 102;
      goto LABEL_41;
    case 1611:
      v18 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 1", a4, @"hidden");
      v78[0] = v19;
      v20 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPLFetchingAlbumExclusions"), 0);
      v78[1] = v20;
      v21 = [a1 _predicateForVisibleAsset];
      v78[2] = v21;
      v22 = (void *)MEMORY[0x1E4F1C978];
      v23 = v78;
      goto LABEL_26;
    case 1612:
      v18 = (void *)MEMORY[0x1E4F28BA0];
      v34 = (void *)MEMORY[0x1E4F28F60];
      v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
      v20 = [v34 predicateWithFormat:@"%K == %d AND %K > %@", @"trashedState", 1, @"trashedDate", v19];
      v77[0] = v20;
      v21 = [a1 _predicateForVisibleAsset];
      v77[1] = v21;
      v22 = (void *)MEMORY[0x1E4F1C978];
      v23 = v77;
      uint64_t v35 = 2;
      goto LABEL_27;
    case 1613:
    case 1625:
      BOOL v8 = a4;
      uint64_t v9 = [MEMORY[0x1E4F8BA10] maskForUserLibrary];
      if (v8) {
        uint64_t v9 = [MEMORY[0x1E4F8BA10] maskForGuestAsset] | v9;
      }
      v10 = (void *)MEMORY[0x1E4F28BA0];
      v11 = [a1 _predicateForVisibleAsset];
      v73[0] = v11;
      v12 = [MEMORY[0x1E4F8BA10] predicateForIncludeMask:v9 useIndex:0];
      v73[1] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
      v4 = [v10 andPredicateWithSubpredicates:v13];

      goto LABEL_34;
    case 1614:
      v29 = (void *)MEMORY[0x1E4F28BA0];
      v19 = +[PLManagedAsset predicateForBurstStackAssets];
      v72[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v72[1] = v30;
      v31 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForBurstsAlbumExclusions"), 0);
      v72[2] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v72;
      goto LABEL_44;
    case 1615:
      uint64_t v17 = 101;
      goto LABEL_41;
    case 1616:
      v36 = (void *)MEMORY[0x1E4F28BA0];
      v37 = (void *)MEMORY[0x1E4F28F60];
      v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
      v20 = [v37 predicateWithFormat:@"%K >= %@", @"addedDate", v19];
      v76[0] = v20;
      v38 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForRecentlyAddedAlbumExclusions"), 0);
      v76[1] = v38;
      v39 = [a1 _predicateForVisibleAsset];
      v76[2] = v39;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:3];
      v4 = [v36 andPredicateWithSubpredicates:v40];

      goto LABEL_30;
    case 1617:
      v18 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", a4, @"derivedCameraCaptureDevice", 1);
      v79[0] = v19;
      v20 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForSelfiesAlbumExclusions"), 0);
      v79[1] = v20;
      v21 = [a1 _predicateForVisibleAsset];
      v79[2] = v21;
      v22 = (void *)MEMORY[0x1E4F1C978];
      v23 = v79;
      goto LABEL_26;
    case 1618:
      uint64_t v17 = 10;
      goto LABEL_41;
    case 1619:
      v41 = (void *)MEMORY[0x1E4F28BA0];
      v24 = [a1 _predicateForVisibleAsset];
      v70[0] = v24;
      v25 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPlacesAlbum"), 0);
      v70[1] = v25;
      v42 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != -180 AND %K != -180", @"latitude", @"longitude");
      v70[2] = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
      v4 = [v41 andPredicateWithSubpredicates:v43];

      goto LABEL_51;
    case 1620:
      v29 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPLFetchingAlbumExclusions"), 0);
      v71[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v71[1] = v30;
      v31 = +[PLManagedAsset predicateForDepthEffectPhotos];
      v71[2] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v71;
      goto LABEL_44;
    case 1621:
      uint64_t v17 = 2;
      goto LABEL_41;
    case 1622:
      v29 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPLFetchingAlbumExclusions"), 0);
      v69[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v69[1] = v30;
      v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"playbackStyle", &unk_1EEBF1808];
      v69[2] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v69;
      goto LABEL_44;
    case 1623:
      v18 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", a4, @"playbackVariation", 3);
      v68[0] = v19;
      v20 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPLFetchingAlbumExclusions"), 0);
      v68[1] = v20;
      v21 = [a1 _predicateForVisibleAsset];
      v68[2] = v21;
      v22 = (void *)MEMORY[0x1E4F1C978];
      v23 = v68;
LABEL_26:
      uint64_t v35 = 3;
LABEL_27:
      v44 = [v22 arrayWithObjects:v23 count:v35];
      v4 = [v18 andPredicateWithSubpredicates:v44];

      goto LABEL_31;
    case 1624:
      uint64_t v16 = +[PLManagedAsset predicateForUploadableAssetsWithCloudLocalStates:](PLManagedAsset, "predicateForUploadableAssetsWithCloudLocalStates:", &unk_1EEBF1820, a4);
      goto LABEL_42;
    case 1626:
      v45 = (void *)MEMORY[0x1E4F28BA0];
      v46 = (void *)MEMORY[0x1E4F28F60];
      v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
      v20 = [v46 predicateWithFormat:@"%K >= %@", @"adjustmentTimestamp", v19];
      v66[0] = v20;
      v38 = +[PLManagedAsset predicateToExcludeCameraAutoAdjustments];
      v66[1] = v38;
      v47 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForRecentlyEditedAlbumExclusions"), 0);
      v66[2] = v47;
      v48 = [a1 _predicateForVisibleAsset];
      v66[3] = v48;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];
      v4 = [v45 andPredicateWithSubpredicates:v49];

LABEL_30:
LABEL_31:

      goto LABEL_48;
    case 1627:
      uint64_t v17 = 103;
      goto LABEL_41;
    case 1628:
      v50 = (void *)MEMORY[0x1E4F28BA0];
      v11 = [a1 _predicateForVisibleAsset];
      v74[0] = v11;
      v51 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAllPhotosAlbum"), 0);
      v74[1] = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
      v4 = [v50 andPredicateWithSubpredicates:v52];

LABEL_34:
      int v6 = 1;
      goto LABEL_53;
    case 1630:
      uint64_t v16 = +[PLManagedAsset predicateForRAWAndRPlusJAssets];
      goto LABEL_42;
    case 1631:
      v29 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPLFetchingAlbumExclusions"), 0);
      v65[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v65[1] = v30;
      v31 = +[PLManagedAsset predicateForCinematicVideos];
      v65[2] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v65;
      goto LABEL_44;
    case 1632:
      uint64_t v16 = +[PLManagedAsset predicateForProResAssets];
      goto LABEL_42;
    case 1634:
      v53 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", a4, @"duplicateAssetVisibilityState", 0);
      v67[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v67[1] = v30;
      v54 = (void *)MEMORY[0x1E4F1C978];
      v55 = v67;
      goto LABEL_46;
    case 1636:
      uint64_t v16 = +[PLManagedAsset predicateToIncludeSharedLibrarySharingSuggestionsAssets];
      goto LABEL_42;
    case 1637:
      uint64_t v17 = 104;
LABEL_41:
      uint64_t v16 = objc_msgSend(a1, "_predicateForAssetSubtype:", v17, a4);
LABEL_42:
      v4 = (void *)v16;
      goto LABEL_52;
    case 1639:
      v29 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", a4, @"spatialType", 0);
      v64[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v64[1] = v30;
      v31 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPLFetchingAlbumExclusions"), 0);
      v64[2] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v64;
LABEL_44:
      v56 = [v32 arrayWithObjects:v33 count:3];
      v4 = [v29 andPredicateWithSubpredicates:v56];

      goto LABEL_47;
    case 1640:
      v53 = (void *)MEMORY[0x1E4F28BA0];
      v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", a4, @"isRecentlySaved");
      v75[0] = v19;
      v30 = [a1 _predicateForVisibleAsset];
      v75[1] = v30;
      v54 = (void *)MEMORY[0x1E4F1C978];
      v55 = v75;
LABEL_46:
      v31 = [v54 arrayWithObjects:v55 count:2];
      v4 = [v53 andPredicateWithSubpredicates:v31];
LABEL_47:

LABEL_48:
      goto LABEL_52;
    case 1641:
      v26 = (void *)MEMORY[0x1E4F28BA0];
      v24 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", a4, @"trashedState", 0);
      v63[0] = v24;
      v25 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForRecoveredAlbum"), 1);
      v63[1] = v25;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = v63;
LABEL_50:
      v42 = [v27 arrayWithObjects:v28 count:2];
      v4 = [v26 andPredicateWithSubpredicates:v42];
LABEL_51:

LABEL_52:
      int v6 = 0;
LABEL_53:
      v57 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(complete) != 0", a4);
      v58 = v57;
      if (v4)
      {
        if (!v6)
        {
          v60 = (void *)MEMORY[0x1E4F28BA0];
          v61 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v57, 0);
          v7 = [v60 andPredicateWithSubpredicates:v61];

          goto LABEL_61;
        }
        id v59 = v4;
      }
      else if (v6)
      {
        id v59 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
      }
      else
      {
        id v59 = v57;
      }
      v7 = v59;
LABEL_61:

LABEL_62:
      return v7;
    default:
      v7 = 0;
      goto LABEL_62;
  }
}

+ (id)predicateForAlbumKind:(int)a3
{
  return (id)[a1 predicateForAlbumKind:*(void *)&a3 includeGuest:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ALAssetsGroupFilterPredicate, 0);
  objc_storeStrong((id *)&self->_cachedKeyAssets, 0);
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  self->_needsPersistenceUpdate = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return self->_needsPersistenceUpdate;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSPredicate)ALAssetsGroupFilterPredicate
{
  return self->_ALAssetsGroupFilterPredicate;
}

- (void)prepareForDeletion
{
  v9.receiver = self;
  v9.super_class = (Class)PLFetchingAlbum;
  [(PLManagedObject *)&v9 prepareForDeletion];
  uint64_t v3 = [(PLFetchingAlbum *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:self];
    if (([v3 mergingChanges] & 1) == 0)
    {
      if ([(PLGenericAlbum *)self kindValue] == 1507)
      {
        [(PLFetchingAlbum *)self setPrimitiveValue:0 forKey:@"customKeyAsset"];
        [v3 recordCloudDeletionForObject:self];
      }
      uint64_t v4 = [(PLFetchingAlbum *)self uuid];
      if (v4)
      {
        v5 = (void *)v4;
        BOOL v6 = [(PLFetchingAlbum *)self isValidForPersistence];

        if (v6)
        {
          v7 = [(PLGenericAlbum *)self photoLibrary];
          BOOL v8 = [v7 pathManager];
          [(PLFetchingAlbum *)self removePersistedFileSystemDataWithPathManager:v8];
        }
      }
    }
  }
}

- (int64_t)cloudDeletionType
{
  return 2;
}

- (BOOL)isValidForPersistence
{
  uint64_t v3 = [(id)objc_opt_class() validKindsForPersistence];
  uint64_t v4 = [(PLFetchingAlbum *)self kind];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLFetchingAlbum.m", 1001, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    BOOL v6 = [[PLPersistedAlbumMetadata alloc] initWithPLGenericAlbum:self pathManager:v8];
    [(PLPersistedAlbumMetadata *)v6 removePersistedAlbumData];
  }
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLFetchingAlbum.m", 993, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    BOOL v6 = [[PLPersistedAlbumMetadata alloc] initWithPLGenericAlbum:self pathManager:v8];
    [(PLPersistedAlbumMetadata *)v6 persistAlbumData];
  }
}

- (void)didSave
{
  v6.receiver = self;
  v6.super_class = (Class)PLFetchingAlbum;
  [(PLGenericAlbum *)&v6 didSave];
  if ([(PLFetchingAlbum *)self needsPersistenceUpdate])
  {
    uint64_t v3 = [(PLFetchingAlbum *)self uuid];
    if (!v3 || ([(PLFetchingAlbum *)self isDeleted] & 1) != 0) {
      goto LABEL_6;
    }
    BOOL v4 = [(PLFetchingAlbum *)self isValidForPersistence];

    if (v4)
    {
      uint64_t v3 = [(PLGenericAlbum *)self photoLibrary];
      id v5 = [v3 pathManager];
      [(PLFetchingAlbum *)self persistMetadataToFileSystemWithPathManager:v5];

LABEL_6:
    }
  }
  [(PLFetchingAlbum *)self setNeedsPersistenceUpdate:0];
}

- (void)willSave
{
  v8.receiver = self;
  v8.super_class = (Class)PLFetchingAlbum;
  [(PLGenericAlbum *)&v8 willSave];
  [(PLFetchingAlbum *)self setNeedsPersistenceUpdate:0];
  uint64_t v3 = [(PLFetchingAlbum *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  BOOL v4 = [(PLFetchingAlbum *)self changedValues];
  if (([(PLFetchingAlbum *)self isInserted] & 1) == 0)
  {
    id v5 = [v4 objectForKeyedSubscript:@"title"];
    if (v5
      || ([v4 objectForKeyedSubscript:@"trashedState"],
          (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v7 = [v4 objectForKeyedSubscript:@"userQueryData"];

      if (!v7) {
        goto LABEL_7;
      }
    }
  }
  [(PLFetchingAlbum *)self setNeedsPersistenceUpdate:1];
LABEL_7:
  if (PLPlatformSearchSupported())
  {
    objc_super v6 = [v3 delayedSaveActions];
    [v6 recordAlbumForSearchIndexUpdate:self];
  }
  if (([(PLFetchingAlbum *)self isDeleted] & 1) == 0) {
    +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:self];
  }

LABEL_12:
}

- (BOOL)mayHaveAssetsInCommon:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLFetchingAlbum *)self fetchedAssets];
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 count];
    if (v7)
    {
      uint64_t v8 = v7;
      objc_super v9 = [MEMORY[0x1E4F1CA80] setWithCapacity:v7];
      if (objc_opt_respondsToSelector())
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          v11 = [v6 managedObjectIDAtIndex:i];
          [v9 addObject:v11];
        }
      }
      else
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = v6;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = [*(id *)(*((void *)&v29 + 1) + 8 * j) objectID];
              [v9 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v15);
        }
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v19 = v4;
      uint64_t v12 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v12)
      {
        uint64_t v20 = *(void *)v26;
        while (2)
        {
          for (uint64_t k = 0; k != v12; ++k)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v19);
            }
            v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * k), "objectID", (void)v25);
            char v23 = [v9 containsObject:v22];

            if (v23)
            {
              LOBYTE(v12) = 1;
              goto LABEL_27;
            }
          }
          uint64_t v12 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_27:
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (id)fastPointerAccessSetForAssets:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(PLFetchingAlbum *)self fetchRequest];
    uint64_t v6 = [v5 fetchBatchSize];

    if (v6)
    {
      if ([v4 count] > (unint64_t)(2 * v6))
      {
        uint64_t v7 = [v4 count];
        uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
        if (v7)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            v10 = [v4 managedObjectIDAtIndex:i];
            [v8 addObject:v10];
          }
        }
        v11 = (void *)MEMORY[0x1E4F1C0D0];
        uint64_t v12 = [(PLFetchingAlbum *)self fetchRequest];
        id v13 = [v12 entityName];
        uint64_t v14 = [v11 fetchRequestWithEntityName:v13];

        uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v8];
        [v14 setPredicate:v15];

        [v14 setIncludesPropertyValues:0];
        [v14 setIncludesPendingChanges:0];
        uint64_t v16 = [(PLFetchingAlbum *)self managedObjectContext];
        uint64_t v17 = [v16 executeFetchRequest:v14 error:0];

        if ([v17 count])
        {
          v18 = [(PLFetchingAlbum *)self managedObjectContext];
          id v19 = [v18 _orderedSetWithResultsFromFetchRequest:v17];

          goto LABEL_11;
        }
      }
    }
  }
  id v19 = v4;
LABEL_11:

  return v19;
}

- (BOOL)hasAssetsCache
{
  uint64_t v3 = [(PLFetchingAlbum *)self fetchedAssets];
  BOOL v4 = v3 || self->_countForDisplay != 0x7FFFFFFFFFFFFFFFLL || self->_emptyState || self->_cachedKeyAssets != 0;

  return v4;
}

- (void)updateSnapshotAndClearCaches:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFetchingAlbum *)self fetchedAssets];
  [v4 setAssetsSnapshot:v5];

  [(PLFetchingAlbum *)self setFetchedAssets:0];
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_emptyState = 0;
  cachedKeyAssets = self->_cachedKeyAssets;
  self->_cachedKeyAssets = 0;
}

- (id)_cachedKeyAssets
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  cachedKeyAssets = self->_cachedKeyAssets;
  if (!cachedKeyAssets)
  {
    id v4 = [(PLFetchingAlbum *)self fetchRequest];
    id v5 = [v4 sortDescriptors];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v7 = [v4 entityName];
    uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

    objc_super v9 = [v4 predicate];
    [v8 setPredicate:v9];

    [v8 setFetchLimit:3];
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = [*(id *)(*((void *)&v24 + 1) + 8 * v14) reversedSortDescriptor];
          [v10 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    [v8 setSortDescriptors:v10];
    uint64_t v16 = [(PLFetchingAlbum *)self managedObjectContext];
    id v23 = 0;
    uint64_t v17 = [v16 executeFetchRequest:v8 error:&v23];
    id v18 = v23;
    id v19 = v18;
    if (v17)
    {
      uint64_t v20 = self->_cachedKeyAssets;
      self->_cachedKeyAssets = v17;
      v21 = v17;
    }
    else
    {
      NSLog(&cfstr_ErrorFetching_0.isa, v18);
    }

    cachedKeyAssets = self->_cachedKeyAssets;
  }
  return cachedKeyAssets;
}

- (id)filteredIndexesForPredicate:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLFetchingAlbum *)self fetchRequest];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 predicate];
  id v8 = (id)v7;
  if (v4)
  {
    if (v7)
    {
      objc_super v9 = (void *)MEMORY[0x1E4F28BA0];
      v16[0] = v7;
      v16[1] = v4;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      uint64_t v11 = [v9 andPredicateWithSubpredicates:v10];

      id v8 = (id)v11;
    }
    else
    {
      id v8 = v4;
    }
  }
  [v6 setPredicate:v8];
  [v6 setResultType:1];
  [v6 setIncludesPropertyValues:0];
  uint64_t v12 = [(PLFetchingAlbum *)self _performFetchWithRequest:v6];
  uint64_t v13 = [(PLFetchingAlbum *)self assets];
  uint64_t v14 = indexSetForManagedObjectsMatchingIDs();

  return v14;
}

- (void)batchFetchAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFetchingAlbum *)self fetchRequest];
  if (![v5 fetchBatchSize])
  {
    v6.receiver = self;
    v6.super_class = (Class)PLFetchingAlbum;
    [(PLGenericAlbum *)&v6 batchFetchAssets:v4];
  }
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  int v4 = [(PLGenericAlbum *)self kindValue];
  if ((v4 - 1600) <= 0x29 && ((1 << (v4 - 64)) & 0x3B5DFFFEFE1) != 0) {
    return a3 < 2;
  }
  BOOL v6 = (a3 & 0xFFFFFFFFFFFFFFBFLL) == 0;
  if ((a3 & 0xFFFFFFFFFFFFFFDFLL) == 0) {
    BOOL v6 = 1;
  }
  return v4 == 1507 && v6;
}

- (BOOL)canPerformDeleteOperation
{
  return [(PLFetchingAlbum *)self canPerformEditOperation:32];
}

- (unint64_t)countForAssetsOfKind:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ([(PLFetchingAlbum *)self isFault]) {
    id v5 = [(PLFetchingAlbum *)self fetchRequest];
  }
  if (v3 == 1)
  {
    uint64_t v6 = 136;
    unint64_t result = self->_videosCount;
    if (result != 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    id v8 = self;
    uint64_t v9 = 1;
    goto LABEL_9;
  }
  if (!v3)
  {
    uint64_t v6 = 128;
    unint64_t result = self->_photosCount;
    if (result != 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    id v8 = self;
    uint64_t v9 = 0;
LABEL_9:
    unint64_t result = [(PLFetchingAlbum *)v8 _fetchedCountForAssetsOfKind:v9];
    *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)result;
    return result;
  }
  return [(PLFetchingAlbum *)self _fetchedCountForAssetsOfKind:v3];
}

- (unint64_t)_fetchedCountForAssetsOfKind:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x19F38D3B0](self, a2);
  uint64_t v6 = [(PLFetchingAlbum *)self managedObjectContext];
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = [(PLFetchingAlbum *)self fetchRequest];
  uint64_t v9 = [v8 entityName];
  v10 = [v7 fetchRequestWithEntityName:v9];

  uint64_t v11 = [(PLFetchingAlbum *)self fetchRequest];
  uint64_t v12 = [v11 predicate];

  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", v3);
  uint64_t v16 = objc_msgSend(v14, "arrayWithObjects:", v12, v15, 0);
  uint64_t v17 = [v13 andPredicateWithSubpredicates:v16];

  [v10 setPredicate:v17];
  id v22 = 0;
  unint64_t v18 = [v6 countForFetchRequest:v10 error:&v22];
  id v19 = v22;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v24 = v3;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "countForAssetsOfKind:%d fetch request failed: %@", buf, 0x12u);
    }

    unint64_t v18 = 0;
  }

  return v18;
}

- (BOOL)isEmpty
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int emptyState = self->_emptyState;
  if (!emptyState)
  {
    if ([(PLFetchingAlbum *)self isFault]) {
      id v4 = [(PLFetchingAlbum *)self fetchRequest];
    }
    id v5 = [(PLFetchingAlbum *)self fetchedAssets];

    if (!v5)
    {
      uint64_t v6 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
      id v8 = [(PLFetchingAlbum *)self fetchRequest];
      uint64_t v9 = [v8 entityName];
      v10 = [v7 fetchRequestWithEntityName:v9];

      uint64_t v11 = [(PLFetchingAlbum *)self fetchRequest];
      uint64_t v12 = [v11 predicate];
      [v10 setPredicate:v12];

      [v10 setFetchLimit:1];
      uint64_t v13 = [(PLFetchingAlbum *)self managedObjectContext];
      id v21 = 0;
      uint64_t v14 = [v13 countForFetchRequest:v10 error:&v21];
      id v15 = v21;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = PLBackendGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [(NSManagedObject *)self pl_shortDescription];
          *(_DWORD *)buf = 138412546;
          id v23 = v17;
          __int16 v24 = 2112;
          id v25 = v15;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to get count for %@: %@", buf, 0x16u);
        }
      }
      else
      {
        if (v14) {
          int v18 = 2;
        }
        else {
          int v18 = 1;
        }
        self->_int emptyState = v18;
      }
    }
    int emptyState = self->_emptyState;
    if (!emptyState)
    {
      v20.receiver = self;
      v20.super_class = (Class)PLFetchingAlbum;
      if ([(PLGenericAlbum *)&v20 isEmpty]) {
        int emptyState = 1;
      }
      else {
        int emptyState = 2;
      }
      self->_int emptyState = emptyState;
    }
  }
  return emptyState == 1;
}

- (unint64_t)approximateCount
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_countForDisplay;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = (void *)MEMORY[0x19F38D3B0](0x7FFFFFFFFFFFFFFFLL, a2);
    id v5 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v6 = [(PLFetchingAlbum *)self fetchRequest];
    uint64_t v7 = [v6 entityName];
    id v8 = [v5 fetchRequestWithEntityName:v7];

    uint64_t v9 = [(PLFetchingAlbum *)self fetchRequest];
    v10 = [v9 predicate];
    [v8 setPredicate:v10];

    uint64_t v11 = [(PLFetchingAlbum *)self managedObjectContext];
    id v16 = 0;
    unint64_t v12 = [v11 countForFetchRequest:v8 error:&v16];
    id v13 = v16;
    self->_countForDisplay = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = [(NSManagedObject *)self pl_shortDescription];
        *(_DWORD *)buf = 138412546;
        int v18 = v15;
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to get count for %@: %@", buf, 0x16u);
      }
      self->_countForDisplay = [(PLFetchingAlbum *)self count];
    }

    return self->_countForDisplay;
  }
  return result;
}

- (unint64_t)count
{
  v2 = [(PLFetchingAlbum *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)mutableAssets
{
  return 0;
}

- (void)setAssets:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (id)assets
{
  id v3 = [(PLFetchingAlbum *)self fetchedAssets];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x19F38D3B0]();
    id v5 = [(PLFetchingAlbum *)self fetchRequest];
    uint64_t v6 = [(PLFetchingAlbum *)self _performFetchWithRequest:v5];
    if (v6)
    {
      uint64_t v7 = [(PLFetchingAlbum *)self managedObjectContext];
      id v8 = [v7 _orderedSetWithResultsFromFetchRequest:v6];

      if (v8) {
        [(PLFetchingAlbum *)self setFetchedAssets:v8];
      }
    }
  }
  return (id)[(PLFetchingAlbum *)self fetchedAssets];
}

- (id)_performFetchWithRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PLFetchingAlbum *)self managedObjectContext];
    if ([v5 hasChanges]) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = [(PLFetchingAlbum *)self batchSize];
    }
    [v4 setFetchBatchSize:v6];
    id v11 = 0;
    uint64_t v7 = [v5 executeFetchRequest:v4 error:&v11];

    id v8 = v11;
    if (!v7)
    {
      uint64_t v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)setALAssetsGroupFilterPredicate:(id)a3
{
  id v5 = (NSPredicate *)a3;
  if (self->_ALAssetsGroupFilterPredicate != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_ALAssetsGroupFilterPredicate, a3);
    [(PLFetchingAlbum *)self setFetchRequest:0];
    id v5 = v6;
  }
}

- (void)setFetchRequest:(id)a3
{
  id v4 = a3;
  [(PLFetchingAlbum *)self willChangeValueForKey:@"fetchRequest"];
  [(PLFetchingAlbum *)self willChangeValueForKey:@"assets"];
  [(PLFetchingAlbum *)self setPrimitiveFetchRequest:v4];

  [(PLFetchingAlbum *)self setFetchedAssets:0];
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_int emptyState = 0;
  cachedKeyAssets = self->_cachedKeyAssets;
  self->_cachedKeyAssets = 0;

  [(PLFetchingAlbum *)self didChangeValueForKey:@"assets"];
  [(PLFetchingAlbum *)self didChangeValueForKey:@"fetchRequest"];
}

- (NSFetchRequest)fetchRequest
{
  [(PLFetchingAlbum *)self willAccessValueForKey:@"fetchRequest"];
  id v3 = [(PLFetchingAlbum *)self primitiveFetchRequest];
  if (!v3)
  {
    [(PLFetchingAlbum *)self setupFetchRequest];
    id v3 = [(PLFetchingAlbum *)self primitiveFetchRequest];
  }
  [(PLFetchingAlbum *)self didAccessValueForKey:@"fetchRequest"];
  return (NSFetchRequest *)v3;
}

- (void)setupFetchRequest
{
  v26[2] = *MEMORY[0x1E4F143B8];
  int v3 = [(PLGenericAlbum *)self kindValue];
  switch(v3)
  {
    case 1552:
    case 1600:
    case 1602:
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
    case 1636:
    case 1637:
    case 1639:
    case 1640:
    case 1641:
      goto LABEL_2;
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
    case 1603:
    case 1604:
    case 1629:
    case 1633:
    case 1635:
    case 1638:
      return;
    default:
      if (v3 != 1507) {
        return;
      }
LABEL_2:
      id v4 = (void *)MEMORY[0x1E4F1C0D0];
      id v5 = +[PLManagedAsset entityName];
      unint64_t v6 = [v4 fetchRequestWithEntityName:v5];

      if (!v6) {
        return;
      }
      uint64_t v7 = objc_alloc_init(PLQueryChangeDetectionCriteria);
      id v8 = [(PLFetchingAlbum *)self userQueryData];
      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F8B9A0]);
        v10 = [(PLFetchingAlbum *)self userQueryData];
        id v11 = (void *)[v9 initWithData:v10];
        unint64_t v12 = [(PLGenericAlbum *)self photoLibrary];
        id v13 = +[PLQueryHandler predicateForQuery:v11 inLibrary:v12 changeDetectionCriteria:v7];
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "predicateForAlbumKind:", -[PLGenericAlbum kindValue](self, "kindValue"));
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v14 = [(PLFetchingAlbum *)self extraFilterPredicate];
      id v15 = v14;
      if (v14)
      {
        if (v13)
        {
          id v16 = (void *)MEMORY[0x1E4F28BA0];
          v26[0] = v13;
          v26[1] = v14;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
          uint64_t v18 = [v16 andPredicateWithSubpredicates:v17];

          id v13 = (id)v18;
        }
        else
        {
          id v13 = v14;
        }
      }
      [v6 setPredicate:v13];
      __int16 v19 = objc_msgSend((id)objc_opt_class(), "sortDescriptorsForAlbumKind:", -[PLGenericAlbum kindValue](self, "kindValue"));
      id v20 = (void *)[v19 mutableCopy];

      if ([(PLGenericAlbum *)self kindValue] != 1507) {
        goto LABEL_15;
      }
      if ([(PLFetchingAlbum *)self customSortKey] == 5
        || [(PLFetchingAlbum *)self customSortKey] == 101)
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F29008];
        id v22 = @"additionalAttributes.title";
        uint64_t v23 = 1;
LABEL_14:
        __int16 v24 = [v21 sortDescriptorWithKey:v22 ascending:v23];
        [v20 insertObject:v24 atIndex:0];

        goto LABEL_15;
      }
      if ([(PLFetchingAlbum *)self customSortKey] == 1)
      {
        id v25 = (void *)MEMORY[0x1E4F29008];
        uint64_t v23 = [(PLFetchingAlbum *)self customSortAscending];
        id v22 = @"dateCreated";
        uint64_t v21 = v25;
        goto LABEL_14;
      }
LABEL_15:
      [v6 setSortDescriptors:v20];
      objc_msgSend(v6, "setFetchBatchSize:", -[PLFetchingAlbum batchSize](self, "batchSize"));
      [(PLFetchingAlbum *)self setPrimitiveFetchRequest:v6];

      return;
  }
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)didTurnIntoFault
{
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_int emptyState = 0;
  v2.receiver = self;
  v2.super_class = (Class)PLFetchingAlbum;
  [(PLFetchingAlbum *)&v2 didTurnIntoFault];
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)PLFetchingAlbum;
  [(PLGenericAlbum *)&v3 awakeFromInsert];
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_int emptyState = 0;
  self->_batchSize = 7;
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)PLFetchingAlbum;
  [(PLGenericAlbum *)&v3 awakeFromFetch];
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_int emptyState = 0;
  self->_batchSize = 7;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 2;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"cloudGUID";
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  objc_super v2 = (void *)validKindsForPersistence_pl_once_object_20;
  return v2;
}

void __43__PLFetchingAlbum_validKindsForPersistence__block_invoke()
{
  uint64_t v0 = [&unk_1EEBF1838 copy];
  v1 = (void *)validKindsForPersistence_pl_once_object_20;
  validKindsForPersistence_pl_once_object_20 = v0;
}

+ (BOOL)contextShouldIgnoreChangesForALAssetsGroupFilterPredicate
{
  return 1;
}

+ (BOOL)contextShouldIgnoreChangesForFetchRequest
{
  return 1;
}

+ (BOOL)contextShouldIgnoreChangesForFetchedAssets
{
  return 1;
}

+ (id)entityName
{
  return @"FetchingAlbum";
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLFetchingAlbum *)self isValidForPersistence]) {
    id v5 = [(PLManagedObjectJournalEntryPayload *)[PLFetchingAlbumJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end