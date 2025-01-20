@interface NPTOPhotosFaceMemoriesContentProvider
- (NPTOPhotosFaceMemoriesContentProvider)initWithDevice:(id)a3;
- (NPTOSyncContentProviderDelegate)delegate;
- (id)_assetCollections;
- (id)_defaultAssetFetchOptions;
- (id)assetCollections;
- (id)assetsForAssetCollection:(id)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (int64_t)targetForAssetCollection:(id)a3;
- (void)_invalidateContentIfNeeded;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOPhotosFaceMemoriesContentProvider

- (NPTOPhotosFaceMemoriesContentProvider)initWithDevice:(id)a3
{
  id v4 = a3;
  if (([v4 relationship] & 2) != 0)
  {
    v17 = 0;
  }
  else
  {
    v5 = +[NRPairedDeviceRegistry sharedInstance];
    v6 = [v5 deviceForIDSDevice:v4];

    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"76EFD58C-2211-40CE-A4BA-891FE464B629"];
    unsigned int v8 = [v6 supportsCapability:v7];

    if (v8)
    {
      v22.receiver = self;
      v22.super_class = (Class)NPTOPhotosFaceMemoriesContentProvider;
      id v9 = [(NPTOPhotosFaceMemoriesContentProvider *)&v22 init];
      if (v9)
      {
        dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanophotos.photosFaceMemories", 0);
        v11 = (void *)*((void *)v9 + 2);
        *((void *)v9 + 2) = v10;

        dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v9 + 2));
        v13 = (void *)*((void *)v9 + 3);
        *((void *)v9 + 3) = v12;

        objc_initWeak(&location, v9);
        v14 = *((void *)v9 + 3);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000533BC;
        v19[3] = &unk_1000931A8;
        objc_copyWeak(&v20, &location);
        dispatch_source_set_event_handler(v14, v19);
        v15 = *((void *)v9 + 3);
        dispatch_time_t v16 = dispatch_time(0, 3600000000000);
        dispatch_source_set_timer(v15, v16, 0x34630B8A000uLL, 0xDF8475800uLL);
        dispatch_resume(*((dispatch_object_t *)v9 + 3));
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
      self = (NPTOPhotosFaceMemoriesContentProvider *)v9;
      v17 = self;
    }
    else
    {
      v17 = 0;
    }
  }
  return v17;
}

- (id)assetCollections
{
  assetCollections = self->_assetCollections;
  if (!assetCollections)
  {
    id v4 = [(NPTOPhotosFaceMemoriesContentProvider *)self _assetCollections];
    v5 = self->_assetCollections;
    self->_assetCollections = v4;

    assetCollections = self->_assetCollections;
  }

  return assetCollections;
}

- (id)assetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NPTOPhotosFaceMemoriesContentProvider *)self _defaultAssetFetchOptions];
  v6 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  id v20 = v6;
  id v7 = +[NSArray arrayWithObjects:&v20 count:1];
  [v5 setSortDescriptors:v7];

  [v5 setFetchLimit:15];
  unsigned int v8 = +[PHAsset fetchReducedCuratedAssetsInMemory:v4 options:v5];
  id v9 = sub_10005CDAC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 count];
    v11 = [v4 localizedTitle];
    dispatch_source_t v12 = [v4 localIdentifier];
    int v14 = 134218498;
    id v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NPTOPhotosFaceMemory: Found %ld assets in memory %@ (%@)", (uint8_t *)&v14, 0x20u);
  }

  return v8;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NPTOPhotosFaceMemoriesContentProvider *)self _defaultAssetFetchOptions];
  v6 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  [v5 setSortDescriptors:v7];

  [v5 setFetchLimit:1];
  unsigned int v8 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:v4 referenceAsset:0 options:v5];

  return v8;
}

- (int64_t)targetForAssetCollection:(id)a3
{
  return 3;
}

- (id)_defaultAssetFetchOptions
{
  id v2 = objc_alloc_init((Class)PHFetchOptions);
  v3 = +[NSPredicate predicateWithFormat:@"(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld))", 1, 1, 3];
  [v2 setPredicate:v3];

  uint64_t v6 = PHAssetPropertySetPhotoIris;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [v2 addFetchPropertySets:v4];

  return v2;
}

- (id)_assetCollections
{
  id v2 = objc_alloc_init((Class)PHFetchOptions);
  v3 = +[NSPredicate predicateWithFormat:@"score >= %f", PHMemoryGreatScoreThreshold];
  [v2 setPredicate:v3];

  id v4 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
  v116 = v4;
  v5 = +[NSArray arrayWithObjects:&v116 count:1];
  [v2 setSortDescriptors:v5];

  id v6 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v2];
  id v7 = sub_10005CDAC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    id v125 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pickGreatMemory: %ld memories in fetch result", buf, 0xCu);
  }

  id v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v107 objects:v123 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v108;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v108 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v107 + 1) + 8 * i) localIdentifier];
        [v9 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v107 objects:v123 count:16];
    }
    while (v12);
  }

  if (![v9 count])
  {
    id v27 = 0;
    goto LABEL_97;
  }
  __int16 v16 = (void *)CFPreferencesCopyAppValue(@"PhotosFaceMemoryHistoryList", @"com.apple.nptocompaniond");
  v17 = &_sSo8NSObjectCSH10ObjectiveCMc_ptr;
  id v93 = v2;
  id v94 = v10;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v18 = sub_10005CDAC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v125 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "readHistoryList: bad preference value: %@", buf, 0xCu);
      }
      v26 = 0;
LABEL_32:

      goto LABEL_33;
    }
    if ([v16 count])
    {
      __int16 v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v16 count]);
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v19 = v16;
      id v20 = [v19 countByEnumeratingWithState:&v119 objects:buf count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v120;
        while (2)
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v120 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v119 + 1) + 8 * (void)j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v28 = sub_10005CDAC();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v117 = 138412290;
                uint64_t v118 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "readHistoryList: bad dictionary value in preference: %@", v117, 0xCu);
              }

              v26 = 0;
              id v10 = v94;
              goto LABEL_31;
            }
            v25 = [[_HistoryItem alloc] initWithDictionary:v24];
            [v18 addObject:v25];
          }
          id v21 = [v19 countByEnumeratingWithState:&v119 objects:buf count:16];
          id v10 = v94;
          if (v21) {
            continue;
          }
          break;
        }
      }

      __int16 v18 = v18;
      v26 = v18;
LABEL_31:
      v17 = &_sSo8NSObjectCSH10ObjectiveCMc_ptr;
      goto LABEL_32;
    }
  }
  v26 = 0;
LABEL_33:

  v29 = +[NSMutableArray arrayWithCapacity:[v26 count]];
  v30 = [v10 firstObject];
  v96 = [v30 localIdentifier];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v31 = v26;
  id v32 = [v31 countByEnumeratingWithState:&v103 objects:&v119 count:16];
  v97 = v29;
  v98 = v31;
  if (!v32)
  {

LABEL_67:
    v62 = sub_10005CDAC();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v125 = v96;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "pickGreatMemory: there's a new great memory: %@", buf, 0xCu);
    }

    v57 = objc_opt_new();
    [v57 setLocalIdentifier:v96];
    v63 = +[NSDate date];
    [v57 setTimestamp:v63];

    [v29 insertObject:v57 atIndex:0];
LABEL_70:

LABEL_71:
    id v64 = v29;
    if ([v64 count])
    {
      v65 = [v17[75] arrayWithCapacity:[v64 count]];
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v66 = v64;
      id v67 = [v66 countByEnumeratingWithState:&v111 objects:buf count:16];
      if (v67)
      {
        id v68 = v67;
        uint64_t v69 = *(void *)v112;
        do
        {
          for (k = 0; k != v68; k = (char *)k + 1)
          {
            if (*(void *)v112 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = [*(id *)(*((void *)&v111 + 1) + 8 * (void)k) asDictionary];
            [v65 addObject:v71];
          }
          id v68 = [v66 countByEnumeratingWithState:&v111 objects:buf count:16];
        }
        while (v68);
      }

      CFPreferencesSetAppValue(@"PhotosFaceMemoryHistoryList", v65, @"com.apple.nptocompaniond");
      v31 = v98;
    }
    else
    {
      CFPreferencesSetAppValue(@"PhotosFaceMemoryHistoryList", 0, @"com.apple.nptocompaniond");
    }
    CFPreferencesAppSynchronize(@"com.apple.nptocompaniond");

    goto LABEL_82;
  }
  id v33 = v32;
  char v34 = 0;
  uint64_t v35 = *(void *)v104;
  char v95 = 1;
  do
  {
    v36 = 0;
    do
    {
      if (*(void *)v104 != v35) {
        objc_enumerationMutation(v31);
      }
      v37 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v36);
      v38 = [v37 localIdentifier];
      if ([v9 containsObject:v38])
      {
        v39 = [v37 timestamp];
        [v39 timeIntervalSinceNow];
        double v41 = v40;

        v31 = v98;
        if (v41 > -2592000.0)
        {
          [v29 addObject:v37];
          v42 = [v37 localIdentifier];
          v43 = v96;
          v44 = v43;
          if (v42 == v43 || v42 && ([v43 isEqualToString:v42] & 1) != 0)
          {

            char v95 = 0;
          }
          else
          {
          }
          goto LABEL_48;
        }
      }
      else
      {
      }
      v42 = sub_10005CDAC();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v45 = [v37 localIdentifier];
        *(_DWORD *)buf = 138412290;
        id v125 = v45;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "pickGreatMemory: removing memory %@ from the history list", buf, 0xCu);
      }
      char v34 = 1;
LABEL_48:

      v36 = (char *)v36 + 1;
    }
    while (v33 != v36);
    id v46 = [v31 countByEnumeratingWithState:&v103 objects:&v119 count:16];
    id v33 = v46;
  }
  while (v46);

  id v10 = v94;
  v17 = &_sSo8NSObjectCSH10ObjectiveCMc_ptr;
  if (v95) {
    goto LABEL_67;
  }
  v47 = [v29 firstObject];
  v48 = [v47 timestamp];
  [v48 timeIntervalSinceNow];
  double v50 = v49;

  if (v50 < -604800.0)
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v51 = v29;
    id v52 = [v51 countByEnumeratingWithState:&v99 objects:v117 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v100;
      do
      {
        for (m = 0; m != v53; m = (char *)m + 1)
        {
          if (*(void *)v100 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v99 + 1) + 8 * (void)m) localIdentifier];
          [v9 removeObject:v56];
        }
        id v53 = [v51 countByEnumeratingWithState:&v99 objects:v117 count:16];
      }
      while (v53);
    }

    v57 = [v9 anyObject];
    if (!v57)
    {
      v58 = [v51 lastObject];
      v57 = [v58 localIdentifier];

      [v51 removeLastObject];
    }
    v59 = sub_10005CDAC();
    v17 = &_sSo8NSObjectCSH10ObjectiveCMc_ptr;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v125 = v57;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "pickGreatMemory: newest great memory has been shown for more than 7 days; changing to %@",
        buf,
        0xCu);
    }

    v60 = objc_opt_new();
    [v60 setLocalIdentifier:v57];
    v61 = +[NSDate date];
    [v60 setTimestamp:v61];

    [v51 insertObject:v60 atIndex:0];
    v31 = v98;
    goto LABEL_70;
  }
  v92 = sub_10005CDAC();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "pickGreatMemory: newest great memory didn't change", buf, 2u);
  }

  v31 = v98;
  if (v34) {
    goto LABEL_71;
  }
LABEL_82:
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v72 = v10;
  id v73 = [v72 countByEnumeratingWithState:&v111 objects:buf count:16];
  if (v73)
  {
    id v74 = v73;
    uint64_t v75 = *(void *)v112;
    while (2)
    {
      for (n = 0; n != v74; n = (char *)n + 1)
      {
        if (*(void *)v112 != v75) {
          objc_enumerationMutation(v72);
        }
        v77 = *(void **)(*((void *)&v111 + 1) + 8 * (void)n);
        v78 = [v77 localIdentifier];
        v79 = [v97 firstObject];
        v80 = [v79 localIdentifier];
        id v81 = v78;
        id v82 = v80;
        if (v81 == v82)
        {
          v83 = v81;
          v31 = v98;
LABEL_94:

          id v27 = v77;
          id v10 = v94;
          goto LABEL_96;
        }
        v83 = v82;
        v31 = v98;
        if (v81 && ([v82 isEqualToString:v81] & 1) != 0) {
          goto LABEL_94;
        }
      }
      id v74 = [v72 countByEnumeratingWithState:&v111 objects:buf count:16];
      id v27 = 0;
      id v10 = v94;
      if (v74) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v27 = 0;
  }
LABEL_96:

  id v2 = v93;
LABEL_97:

  v84 = sub_10005CDAC();
  BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
  if (v27)
  {
    if (v85)
    {
      v86 = [v27 localizedTitle];
      v87 = [v27 localizedSubtitle];
      v88 = [v27 localIdentifier];
      *(_DWORD *)buf = 138412802;
      id v125 = v86;
      __int16 v126 = 2112;
      v127 = v87;
      __int16 v128 = 2112;
      v129 = v88;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "NPTOPhotosFaceMemory: great memory: title: %@, subtitle: %@, local id: %@", buf, 0x20u);
    }
    v84 = [v27 localIdentifier];
    v115 = v84;
    v89 = +[NSArray arrayWithObjects:&v115 count:1];
    v90 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v89 options:0];
  }
  else
  {
    if (v85)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "NPTOPhotosFaceMemory: there were no great memories", buf, 2u);
    }
    v90 = 0;
  }

  return v90;
}

- (void)_invalidateContentIfNeeded
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[NPTOPhotosFaceMemoriesContentProvider _invalidateContentIfNeeded]";
    __int16 v14 = 2080;
    id v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/nptocompaniond/NPTOPhotosFaceMemoriesContentProvider.m";
    __int16 v16 = 1024;
    int v17 = 302;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v12, 0x1Cu);
  }

  id v4 = [(NPTOPhotosFaceMemoriesContentProvider *)self _assetCollections];
  v5 = v4;
  if (self->_assetCollections)
  {
    id v6 = [v4 firstObject];
    id v7 = [v6 localIdentifier];
    id v8 = [(PHFetchResult *)self->_assetCollections firstObject];
    id v9 = [v8 localIdentifier];
    unsigned __int8 v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetCollections, v5);
      id v11 = [(NPTOPhotosFaceMemoriesContentProvider *)self delegate];
      [v11 contentProviderDidInvalidateContent:self];
    }
  }
}

- (NPTOSyncContentProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPTOSyncContentProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateMemoryTimer, 0);
  objc_storeStrong((id *)&self->_workQ, 0);

  objc_storeStrong((id *)&self->_assetCollections, 0);
}

@end