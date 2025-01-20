@interface BSUIAsset
+ (id)propertiesNeededFromBKLibraryAsset;
- (BSUIAsset)initWithLibraryAsset:(id)a3;
@end

@implementation BSUIAsset

+ (id)propertiesNeededFromBKLibraryAsset
{
  v4[0] = @"sortAuthor";
  v4[1] = @"title";
  v4[2] = @"sortTitle";
  v4[3] = @"assetID";
  v4[4] = @"isExplicit";
  v4[5] = @"storeID";
  v4[6] = @"bookHighWaterMarkProgress";
  v4[7] = @"contentType";
  v4[8] = @"isFinished";
  v4[9] = @"isNew";
  v4[10] = @"isSample";
  v4[11] = @"isSupplementalContent";
  v4[12] = @"state";
  v4[13] = @"seriesID";
  v4[14] = @"lastEngagedDate";
  v4[15] = @"lastOpenDate";
  v4[16] = @"fileSize";
  v4[17] = @"path";
  v4[18] = @"pageProgressionDirection";
  v2 = +[NSArray arrayWithObjects:v4 count:19];

  return v2;
}

- (BSUIAsset)initWithLibraryAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v4 displayAuthor];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[NSNull null];
  }
  v9 = v8;

  [v5 setObject:v9 forKey:BSUIAssetKeyAuthor];
  id v10 = [v4 title];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  v13 = v12;

  [v5 setObject:v13 forKey:BSUIAssetKeyTitle];
  id v14 = [v4 sortTitle];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  v17 = v16;

  [v5 setObject:v17 forKey:BSUIAssetKeySortTitle];
  id v18 = [v4 isExplicit];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  v21 = v20;

  [v5 setObject:v21 forKey:BSUIAssetKeyIsExplicit];
  id v22 = [v4 storeID];
  v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = +[NSNull null];
  }
  v25 = v24;

  [v5 setObject:v25 forKey:BSUIAssetKeyStoreID];
  id v26 = [v4 readingProgress];
  v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    id v28 = +[NSNull null];
  }
  v29 = v28;

  [v5 setObject:v29 forKey:BSUIAssetKeyReadingProgress];
  +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v4 contentType]);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    id v32 = v30;
  }
  else
  {
    id v32 = +[NSNull null];
  }
  v33 = v32;

  [v5 setObject:v33 forKey:BSUIAssetKeyContentType];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isFinished]);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    id v36 = +[NSNull null];
  }
  v37 = v36;

  [v5 setObject:v37 forKey:BSUIAssetKeyIsFinished];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isNew]);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    id v40 = v38;
  }
  else
  {
    id v40 = +[NSNull null];
  }
  v41 = v40;

  [v5 setObject:v41 forKey:BSUIAssetKeyIsNew];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isSample]);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    id v44 = v42;
  }
  else
  {
    id v44 = +[NSNull null];
  }
  v45 = v44;

  [v5 setObject:v45 forKey:BSUIAssetKeyIsSample];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isNonLocalSample]);
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    id v48 = v46;
  }
  else
  {
    id v48 = +[NSNull null];
  }
  v49 = v48;

  [v5 setObject:v49 forKey:BSUIAssetKeyIsNonLocalSample];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isInSamples]);
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    id v52 = v50;
  }
  else
  {
    id v52 = +[NSNull null];
  }
  v53 = v52;

  [v5 setObject:v53 forKey:BSUIAssetKeyIsInSamples];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isInSamples]);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    id v56 = v54;
  }
  else
  {
    id v56 = +[NSNull null];
  }
  v57 = v56;

  [v5 setObject:v57 forKey:BSUIAssetKeyIsMemberOfSamplesCollection];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isLocal]);
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    id v60 = v58;
  }
  else
  {
    id v60 = +[NSNull null];
  }
  v61 = v60;

  [v5 setObject:v61 forKey:BSUIAssetKeyIsLocal];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isSupplementalContent]);
  id v62 = (id)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v62)
  {
    id v64 = v62;
  }
  else
  {
    id v64 = +[NSNull null];
  }
  v65 = v64;

  [v5 setObject:v65 forKey:BSUIAssetKeyIsSupplementalContent];
  id v66 = [v4 seriesID];
  v67 = v66;
  if (v66)
  {
    id v68 = v66;
  }
  else
  {
    id v68 = +[NSNull null];
  }
  v69 = v68;

  [v5 setObject:v69 forKey:BSUIAssetKeySeriesID];
  id v70 = [v4 lastEngagedDate];
  v71 = v70;
  if (v70)
  {
    id v72 = v70;
  }
  else
  {
    id v72 = +[NSNull null];
  }
  v73 = v72;

  [v5 setObject:v73 forKey:BSUIAssetKeyLastEngagedDate];
  id v74 = [v4 lastOpenDate];
  v75 = v74;
  if (v74)
  {
    id v76 = v74;
  }
  else
  {
    id v76 = +[NSNull null];
  }
  v77 = v76;

  [v5 setObject:v77 forKey:BSUIAssetKeyLastOpenDate];
  id v78 = [v4 pageProgressionDirection];
  v79 = v78;
  if (v78)
  {
    id v80 = v78;
  }
  else
  {
    id v80 = +[NSNull null];
  }
  v81 = v80;

  [v5 setObject:v81 forKey:BSUIAssetKeyPageProgressionDirection];
  id v82 = [v4 dateFinished];
  v83 = v82;
  if (v82)
  {
    id v84 = v82;
  }
  else
  {
    id v84 = +[NSNull null];
  }
  v85 = v84;

  [v5 setObject:v85 forKey:BSUIAssetKeyDateFinished];
  v86 = [v4 hasRACSupport];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v86 BOOLValue]);
  id v87 = (id)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    id v89 = v87;
  }
  else
  {
    id v89 = +[NSNull null];
  }
  v90 = v89;

  [v5 setObject:v90 forKey:BSUIAssetKeyHasRACSupport];
  id v91 = [v4 cloudAssetType];
  v92 = v91;
  if (v91)
  {
    id v93 = v91;
  }
  else
  {
    id v93 = +[NSNull null];
  }
  v94 = v93;

  [v5 setObject:v94 forKey:BSUIAssetKeyCloudAssetType];
  id v95 = [v4 purchaseDate];
  v96 = v95;
  if (v95)
  {
    id v97 = v95;
  }
  else
  {
    id v97 = +[NSNull null];
  }
  v98 = v97;

  [v5 setObject:v98 forKey:BSUIAssetKeyPurchasedDate];
  if ([v4 contentType] == 5)
  {
    v99 = [v4 seriesBooks];
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v99 count]);
    id v100 = (id)objc_claimAutoreleasedReturnValue();
    v101 = v100;
    if (v100)
    {
      id v102 = v100;
    }
    else
    {
      id v102 = +[NSNull null];
    }
    v103 = v102;

    [v5 setObject:v103 forKey:BSUIAssetKeySeriesItemCount];
    v104 = [v4 seriesBooks];
    id v105 = [v104 count];

    if (v105)
    {
      objc_opt_class();
      v106 = [v4 seriesBooks];
      v107 = [v106 allObjects];
      v108 = [v107 objectAtIndexedSubscript:0];
      v109 = BUDynamicCast();

      if ([v109 isAudiobook]) {
        uint64_t v110 = 2;
      }
      else {
        uint64_t v110 = 1;
      }
      id v111 = +[NSNumber numberWithShort:v110];
      v112 = v111;
      if (v111)
      {
        id v113 = v111;
      }
      else
      {
        id v113 = +[NSNull null];
      }
      v114 = v113;

      [v5 setObject:v114 forKey:BSUIAssetKeySeriesContentType];
    }
  }
  v115 = BKLibraryAssetIdentifierFromAsset();
  id v116 = [v115 permanentOrTemporaryAssetID];
  v117 = v116;
  if (v116)
  {
    id v118 = v116;
  }
  else
  {
    id v118 = +[NSNull null];
  }
  v119 = v118;

  [v5 setObject:v119 forKey:BSUIAssetKeyAssetID];
  if (([v4 isStore] & 1) == 0
    && ([v4 isManagedBook] & 1) == 0)
  {
    v120 = [v4 path];
    if ([v120 length])
    {
      v121 = +[NSURL fileURLWithPath:v120];
      v122 = [v121 standardizedURL];

      id v123 = [v122 absoluteString];
      v124 = v123;
      if (v123)
      {
        id v125 = v123;
      }
      else
      {
        id v125 = +[NSNull null];
      }
      v126 = v125;

      [v5 setObject:v126 forKey:BSUIAssetKeyFileURL];
    }
    +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 fileSize]);
    id v127 = (id)objc_claimAutoreleasedReturnValue();
    v128 = v127;
    if (v127)
    {
      id v129 = v127;
    }
    else
    {
      id v129 = +[NSNull null];
    }
    v130 = v129;

    [v5 setObject:v130 forKey:BSUIAssetKeyFileSize];
  }
  id v131 = [v4 coverURL];
  v132 = v131;
  if (v131)
  {
    id v133 = v131;
  }
  else
  {
    id v133 = +[NSNull null];
  }
  v134 = v133;

  [v5 setObject:v134 forKey:BSUIAssetKeyCoverURL];
  v135 = [(BSUIAsset *)self initWithDictionary:v5];

  return v135;
}

@end