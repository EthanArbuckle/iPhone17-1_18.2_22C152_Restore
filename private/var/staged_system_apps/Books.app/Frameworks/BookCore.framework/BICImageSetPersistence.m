@interface BICImageSetPersistence
+ (id)addedEntryWithDescribedImage:(id)a3 imageEntry:(id)a4;
- (BICDescribedImageComparing)imageComparator;
- (BICImageSetPersistence)initWithPersistentStore:(id)a3 comparator:(id)a4;
- (BICImageSetPersistingDelegate)delegate;
- (BICPersistentStoring)persistentStore;
- (BOOL)_isImagePotentialPrimary:(id)a3;
- (NSString)identifier;
- (id)_imageSetForIdentifier:(id)a3;
- (id)metadataForIdentifier:(id)a3;
- (void)_addImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 toSet:(id)a5 addedEntries:(id)a6;
- (void)_clean:(id)a3;
- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5;
- (void)_markAsOldAllNonPrimaryImagesForImageSetIDs:(id)a3 completion:(id)a4;
- (void)_populateEntry:(id)a3 fromImage:(id)a4;
- (void)_removeImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 fromSet:(id)a5 removedEntries:(id)a6;
- (void)_saveIfNeeded;
- (void)_updateAspectRatioForImageSet:(id)a3 size:(CGSize)a4 force:(BOOL)a5;
- (void)_withPrimaryEntryForImageSetID:(id)a3 performBlock:(id)a4;
- (void)addImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 addedEntries:(id)a5;
- (void)deleteEntriesMarkedToBeDeleted:(id)a3 completion:(id)a4;
- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4;
- (void)gatherPrunableItemsForLevel:(signed __int16)a3 withCompletion:(id)a4;
- (void)gatherPrunableItemsWithIdentifier:(id)a3 forLevel:(signed __int16)a4 withCompletion:(id)a5;
- (void)imageColorForIdentifier:(id)a3 completion:(id)a4;
- (void)incrementVersionForIdentifier:(id)a3;
- (void)incrementVersionForIdentifiers:(id)a3;
- (void)markEntriesAsStored:(id)a3 notStored:(id)a4 completion:(id)a5;
- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 prunedEntry:(id)a5 withCompletion:(id)a6;
- (void)removeImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 removedEntries:(id)a5;
- (void)removeImageSets:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageColor:(id)a3 forIdentifier:(id)a4;
- (void)setImageComparator:(id)a3;
- (void)setPersistentStore:(id)a3;
- (void)withExistingImageEntryForDescribedImage:(id)a3 inLevelID:(signed __int16)a4 performBlock:(id)a5;
- (void)withExistingImageSetForDescribedImage:(id)a3 performBlock:(id)a4;
@end

@implementation BICImageSetPersistence

+ (id)addedEntryWithDescribedImage:(id)a3 imageEntry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BICImageSetPersistingAddedEntry alloc] initWithDescribedImage:v6 imageEntry:v5];

  return v7;
}

- (BICImageSetPersistence)initWithPersistentStore:(id)a3 comparator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BICImageSetPersistence;
  v9 = [(BICImageSetPersistence *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageComparator, a4);
    objc_storeStrong((id *)&v10->_persistentStore, a3);
  }

  return v10;
}

- (id)_imageSetForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BICImageSetPersistence *)self persistentStore];
  id v6 = [v5 imageSetForIdentifier:v4];

  return v6;
}

- (void)_withPrimaryEntryForImageSetID:(id)a3 performBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12B1B0;
  v11[3] = &unk_2C3A40;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)incrementVersionForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = BCImageCacheLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "BICImageSetPersistence: Increment version for: %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_12B350;
  v7[3] = &unk_2C40E8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(BICImageSetPersistence *)self _markAsOldAllNonPrimaryImagesForImageSetIDs:v6 completion:v7];
}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  [(BICImageSetPersistence *)self incrementVersionForIdentifiers:v4];
}

- (void)_markAsOldAllNonPrimaryImagesForImageSetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12B57C;
  v11[3] = &unk_2C3A40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)withExistingImageEntryForDescribedImage:(id)a3 inLevelID:(signed __int16)a4 performBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BICImageSetPersistence *)self persistentStore];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_12B900;
  v13[3] = &unk_2C9880;
  signed __int16 v17 = a4;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

- (void)withExistingImageSetForDescribedImage:(id)a3 performBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12BB6C;
  v11[3] = &unk_2C70D8;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 performBlock:v11];
}

- (void)_addImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 toSet:(id)a5 addedEntries:(id)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v71 = a6;
  v78 = v10;
  id v11 = [v10 imageEntries];
  id v67 = [v11 count];

  id v79 = [v9 mutableCopy];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v101 objects:v112 count:16];
  v70 = v12;
  unsigned int v76 = v8;
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v102;
    v66 = &v110;
    uint64_t v69 = *(void *)v102;
    do
    {
      id v16 = 0;
      id v72 = v14;
      do
      {
        if (*(void *)v102 != v15) {
          objc_enumerationMutation(v12);
        }
        signed __int16 v17 = *(void **)(*((void *)&v101 + 1) + 8 * (void)v16);
        switch(v8)
        {
          case 3:
            long long v87 = 0u;
            long long v88 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            id v18 = [v78 imageEntries];
            id v43 = [v18 countByEnumeratingWithState:&v85 objects:v106 count:16];
            if (v43)
            {
              id v44 = v43;
              uint64_t v45 = *(void *)v86;
              while (2)
              {
                for (i = 0; i != v44; i = (char *)i + 1)
                {
                  if (*(void *)v86 != v45) {
                    objc_enumerationMutation(v18);
                  }
                  if (objc_msgSend(*(id *)(*((void *)&v85 + 1) + 8 * i), "level", v66) == 3)
                  {
                    [v79 removeObjectIdenticalTo:v17];
                    goto LABEL_65;
                  }
                }
                id v44 = [v18 countByEnumeratingWithState:&v85 objects:v106 count:16];
                if (v44) {
                  continue;
                }
                break;
              }
            }
            break;
          case 2:
            v68 = v16;
            id obj = +[NSMutableArray array];
            v31 = [v17 entryLocationForLevelID:2];
            long long v93 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            v32 = [v78 imageEntries];
            id v33 = [v32 countByEnumeratingWithState:&v93 objects:v108 count:16];
            if (v33)
            {
              id v34 = v33;
              uint64_t v35 = *(void *)v94;
              while (2)
              {
                for (j = 0; j != v34; j = (char *)j + 1)
                {
                  if (*(void *)v94 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  v37 = *(void **)(*((void *)&v93 + 1) + 8 * (void)j);
                  if (objc_msgSend(v37, "state", v66) == 1)
                  {
                    v38 = [v37 entryLocation];
                    unsigned int v39 = [v31 isEqualToString:v38];

                    if (v39) {
                      [v79 removeObjectIdenticalTo:v17];
                    }
                  }
                  else if ([v37 level] == 2)
                  {
                    v40 = [v37 dataStoreInformation];
                    v41 = [v17 urlString];
                    unsigned int v42 = [v40 isEqualToString:v41];

                    if (v42)
                    {
                      if (([v37 isExpired] & 1) != 0
                        || [v37 quality] == 3)
                      {
                        [obj addObject:v37];
                      }
                      else
                      {
                        [v79 removeObjectIdenticalTo:v17];
                      }
                      goto LABEL_57;
                    }
                  }
                }
                id v34 = [v32 countByEnumeratingWithState:&v93 objects:v108 count:16];
                if (v34) {
                  continue;
                }
                break;
              }
            }
LABEL_57:

            long long v91 = 0u;
            long long v92 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            id v18 = obj;
            id v47 = [v18 countByEnumeratingWithState:&v89 objects:v107 count:16];
            uint64_t v15 = v69;
            id v12 = v70;
            if (v47)
            {
              id v48 = v47;
              uint64_t v49 = *(void *)v90;
              do
              {
                for (k = 0; k != v48; k = (char *)k + 1)
                {
                  if (*(void *)v90 != v49) {
                    objc_enumerationMutation(v18);
                  }
                  [*(id *)(*((void *)&v89 + 1) + 8 * (void)k) deleteEntry:v66];
                }
                id v48 = [v18 countByEnumeratingWithState:&v89 objects:v107 count:16];
              }
              while (v48);
            }

            uint64_t v8 = v76;
            id v14 = v72;
            id v16 = v68;
            break;
          case 1:
            id v18 = [*(id *)(*((void *)&v101 + 1) + 8 * (void)v16) entryLocationForLevelID:1];
            long long v97 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            v19 = [v78 imageEntries];
            id v20 = [v19 countByEnumeratingWithState:&v97 objects:v111 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v98;
              while (2)
              {
                for (m = 0; m != v21; m = (char *)m + 1)
                {
                  if (*(void *)v98 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v97 + 1) + 8 * (void)m);
                  v25 = [v24 entryLocation];
                  unsigned int v26 = [v25 isEqualToString:v18];

                  if (v26)
                  {
                    if ([v24 state] == 3)
                    {
                      v27 = BCImageCacheLog();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                        sub_1EE0C0(v109, v24, v66, v27);
                      }
                    }
                    v28 = [v17 image];
                    if (![v28 CGImage]
                      || (unsigned int v29 = [v17 quality],
                          v29 <= [v24 quality])
                      && [v24 quality] != 3)
                    {

LABEL_54:
                      [v79 removeObjectIdenticalTo:v17];
                      goto LABEL_55;
                    }
                    unsigned int v30 = [v24 state];

                    if (v30 != 2) {
                      goto LABEL_54;
                    }
                    [v24 deleteEntry];
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v97 objects:v111 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
LABEL_55:

            uint64_t v8 = v76;
            uint64_t v15 = v69;
            id v12 = v70;
            id v14 = v72;
            break;
          default:
            goto LABEL_66;
        }
LABEL_65:

LABEL_66:
        id v16 = (char *)v16 + 1;
      }
      while (v16 != v14);
      id v14 = [v12 countByEnumeratingWithState:&v101 objects:v112 count:16];
    }
    while (v14);
  }

  v51 = +[NSMutableSet set];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obja = v79;
  id v52 = [obja countByEnumeratingWithState:&v81 objects:v105 count:16];
  if (v52)
  {
    id v53 = v52;
    char v73 = 0;
    v80 = 0;
    uint64_t v54 = *(void *)v82;
    do
    {
      for (n = 0; n != v53; n = (char *)n + 1)
      {
        if (*(void *)v82 != v54) {
          objc_enumerationMutation(obja);
        }
        v56 = *(void **)(*((void *)&v81 + 1) + 8 * (void)n);
        v57 = [v56 entryLocationForLevelID:v8 v66];
        if (([v51 containsObject:v57] & 1) == 0)
        {
          [v51 addObject:v57];
          if ([(BICImageSetPersistence *)self _isImagePotentialPrimary:v56]) {
            BOOL v58 = v80 == 0;
          }
          else {
            BOOL v58 = 0;
          }
          if (v58)
          {
            if (v73 & 1 | (v67 == 0))
            {
              v80 = 0;
            }
            else
            {
              v80 = [v78 primaryEntry];
              char v73 = 1;
            }
          }
          v59 = [(BICImageSetPersistence *)self persistentStore];
          v60 = [v59 addNewImageEntryToSet:v78];

          [v60 setLevel:v76];
          [v60 setState:1];
          [(BICImageSetPersistence *)self _populateEntry:v60 fromImage:v56];
          uint64_t v8 = v76;
          [v78 errorCheck];
          v61 = [[BICImageSetPersistingAddedEntry alloc] initWithDescribedImage:v56 imageEntry:v60];
          [v71 addObject:v61];
        }
      }
      id v53 = [obja countByEnumeratingWithState:&v81 objects:v105 count:16];
    }
    while (v53);
  }
  else
  {
    char v73 = 0;
    v80 = 0;
  }

  v62 = [(BICImageSetPersistence *)self persistentStore];
  [v62 processPendingChanges];

  if (v73)
  {
    uint64_t v63 = [v78 primaryEntry];
    v64 = (void *)v63;
    if (v63 && (void *)v63 != v80 && (uint64_t)v67 >= 1)
    {
      v65 = [v78 identifier];
      [(BICImageSetPersistence *)self incrementVersionForIdentifier:v65];
    }
  }
}

- (void)_removeImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 fromSet:(id)a5 removedEntries:(id)a6
{
  int v8 = a4;
  id v29 = a3;
  id v33 = a6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [a5 imageEntries];
  id v10 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    int v28 = v8;
    uint64_t v27 = *(void *)v39;
    do
    {
      id v13 = 0;
      id v30 = v11;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v13);
        if (objc_msgSend(v14, "level", v27) == v8)
        {
          v32 = v13;
          uint64_t v15 = +[BICDescribedImage describedImageFromImageEntry:v14];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v16 = v29;
          id v17 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v35;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v35 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                uint64_t v22 = [(BICImageSetPersistence *)self imageComparator];
                unsigned int v23 = [v22 isMatching:v21 withCandidateImage:v15 includeQuality:1];

                if (v23)
                {
                  [v14 setState:3];
                  v24 = BCImageCacheLog();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    v25 = [v14 entryLocation];
                    *(_DWORD *)buf = 138412290;
                    id v43 = v25;
                    _os_log_impl(&def_7D91C, v24, OS_LOG_TYPE_INFO, "BICImageSetPersistence: Marking for deletion: %@", buf, 0xCu);
                  }
                  unsigned int v26 = [[BICImageSetPersistingAddedEntry alloc] initWithDescribedImage:v21 imageEntry:v14];
                  [v33 addObject:v26];
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
            }
            while (v18);
          }

          int v8 = v28;
          uint64_t v12 = v27;
          id v11 = v30;
          id v13 = v32;
        }
        id v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v11);
  }
}

- (BOOL)_isImagePotentialPrimary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 adamID];
  BOOL v8 = v4
    && (([v3 imageSize], v6 == CGSizeZero.width) ? (BOOL v7 = v5 == CGSizeZero.height) : (BOOL v7 = 0), v7)
    && [v3 quality] == 203;

  id v9 = [v3 filePath];
  if (v9)
  {
    BOOL v10 = [v3 quality] > 0xC9;
  }
  else
  {
    id v11 = [v3 urlString];
    if (v11) {
      BOOL v10 = [v3 quality] > 0xC9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  return v8 || v10;
}

- (void)_updateAspectRatioForImageSet:(id)a3 size:(CGSize)a4 force:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  if (a5
    || ([v13 widthForAspectRatio],
        float v10 = v9,
        [v13 heightForAspectRatio],
        double v8 = (float)(v10 * v11),
        width * height > v8))
  {
    *(float *)&double v8 = width;
    [v13 setWidthForAspectRatio:v8];
    *(float *)&double v12 = height;
    [v13 setHeightForAspectRatio:v12];
  }
}

- (void)_populateEntry:(id)a3 fromImage:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  [v6 nonShadowArea];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v28 setProcessingOptions:[v6 processingOptions]];
  [v6 imageSize];
  [v28 setImageSize:];
  [v28 setQuality:[v6 quality]];
  uint64_t v15 = [v28 entryLocationFromParameters];
  [v28 setEntryLocation:v15];

  id v16 = [v6 expiry];
  [v28 setExpiry:v16];

  [v28 setShadowLeft:(int)v8];
  [v28 setShadowTop:(int)v10];
  [v28 setShadowWidth:(int)v12];
  [v28 setShadowHeight:(int)v14];
  id v17 = +[NSDate date];
  [v28 setLastUsed:v17];

  [v6 imageSize];
  double v19 = v18;
  double Height = v20;
  uint64_t v22 = [v28 imageSet];
  unsigned int v23 = [v6 image];
  v24 = (CGImage *)[v23 CGImage];

  if (v24 && ![v6 processingOptions])
  {
    double Width = (double)CGImageGetWidth(v24);
    -[BICImageSetPersistence _updateAspectRatioForImageSet:size:force:](self, "_updateAspectRatioForImageSet:size:force:", v22, [v22 actualAspectRatio] ^ 1, Width, (double)CGImageGetHeight(v24));
    [v22 setActualAspectRatio:1];
  }
  else if (([v22 actualAspectRatio] & 1) == 0)
  {
    double v25 = CGSizeZero.width;
    if (CGSizeZero.width != v19 || (double v25 = CGSizeZero.height, v25 != Height))
    {
      unsigned int v26 = [v6 unknownAspectRatio:v25];
      if (v24 && v26)
      {
        double v19 = (double)CGImageGetWidth(v24);
        double Height = (double)CGImageGetHeight(v24);
      }
      -[BICImageSetPersistence _updateAspectRatioForImageSet:size:force:](self, "_updateAspectRatioForImageSet:size:force:", v22, 0, v19, Height);
    }
  }
  [v28 setPotentialPrimary:[self _isImagePotentialPrimary:v6]];
}

- (void)_saveIfNeeded
{
  id v2 = [(BICImageSetPersistence *)self persistentStore];
  [v2 saveIfNeeded];
}

- (void)addImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 addedEntries:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    double v10 = +[NSMutableArray array];
    double v11 = +[BICDescribedImage describedImagesToDictionaryOfSets:v8];
    double v12 = [v11 allKeys];
    double v13 = [(BICImageSetPersistence *)self persistentStore];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_12CCC8;
    v17[3] = &unk_2C98A8;
    id v18 = v8;
    double v19 = self;
    id v20 = v12;
    id v21 = v11;
    signed __int16 v24 = a4;
    id v22 = v10;
    id v23 = v9;
    id v14 = v10;
    id v15 = v11;
    id v16 = v12;
    [v13 performBlock:v17];
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (void)removeImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 removedEntries:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(BICImageSetPersistence *)self persistentStore];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_12D168;
  v13[3] = &unk_2C9880;
  id v14 = v8;
  id v15 = self;
  signed __int16 v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

- (void)removeImageSets:(id)a3
{
  id v4 = a3;
  id v5 = [(BICImageSetPersistence *)self persistentStore];
  [v5 removeImageSets:v4];
}

- (void)markEntriesAsStored:(id)a3 notStored:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    id v11 = [(BICImageSetPersistence *)self persistentStore];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_12D4B8;
    v14[3] = &unk_2C4480;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    [v11 performBlock:v14];
  }
  else
  {
    id v12 = objc_retainBlock(v10);
    double v13 = v12;
    if (v12) {
      (*((void (**)(id))v12 + 2))(v12);
    }
  }
}

- (void)deleteEntriesMarkedToBeDeleted:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12D850;
  v11[3] = &unk_2C3A40;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)gatherPrunableItemsForLevel:(signed __int16)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(BICImageSetPersistence *)self persistentStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_12DB38;
  v9[3] = &unk_2C98D0;
  signed __int16 v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9];
}

- (void)gatherPrunableItemsWithIdentifier:(id)a3 forLevel:(signed __int16)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BICImageSetPersistence *)self persistentStore];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_12E020;
  v13[3] = &unk_2C9880;
  void v13[4] = self;
  id v14 = v8;
  signed __int16 v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 prunedEntry:(id)a5 withCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(BICImageSetPersistence *)self persistentStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_12E49C;
  v16[3] = &unk_2C98F8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [v12 performBlock:v16];
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12E814;
  v11[3] = &unk_2C9920;
  signed __int16 v13 = a3;
  BOOL v14 = a4;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 performBlock:v11];
}

- (void)_clean:(id)a3
{
  id v4 = a3;
  id v5 = [(BICImageSetPersistence *)self persistentStore];
  [v5 clean:v4];
}

- (id)metadataForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  signed __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_12ED30;
  signed __int16 v16 = sub_12ED40;
  id v17 = 0;
  id v5 = [(BICImageSetPersistence *)self persistentStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_12ED48;
  v9[3] = &unk_2C4720;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12EF40;
  v11[3] = &unk_2C3A40;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

- (void)imageColorForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12F17C;
  v11[3] = &unk_2C3A40;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)setImageColor:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BICImageSetPersistence *)self persistentStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12F2F0;
  v11[3] = &unk_2C48E0;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performBlock:v11];
}

- (BICImageSetPersistingDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BICDescribedImageComparing)imageComparator
{
  return self->_imageComparator;
}

- (void)setImageComparator:(id)a3
{
}

- (BICPersistentStoring)persistentStore
{
  return self->_persistentStore;
}

- (void)setPersistentStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_imageComparator, 0);
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong((id *)&self->delegate, 0);
}

@end