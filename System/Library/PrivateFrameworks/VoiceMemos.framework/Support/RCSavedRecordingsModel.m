@interface RCSavedRecordingsModel
+ (id)_SHA256DataForPath:(id)a3;
- (BOOL)reloadDemoContent:(id *)a3;
- (id)performOrphanRecoveryAndCleanupWithExternallyInUseComposedAVURLs:(id)a3 andFinalizingCompositions:(id)a4 restoreFileFutures:(BOOL)a5;
- (id)repairCompositionDecomposedFragmentMetadataIfNecessary:(id)a3;
- (id)updateRecordingForFinalizedCompositionAndMigrateIfNecessary:(id)a3;
- (void)_logMissingAudioFutureIfNeeded:(id)a3;
- (void)_performOrphanRecoveryAndCleanupOfBareAssetsWithInUseComposedAVURLs:(id)a3 fileManager:(id)a4 URLsInSavedRecordingsDirectory:(id)a5;
- (void)_performOrphanRecoveryAndCleanupOfCompositionsWithInUseComposedAVURLs:(id)a3 fileManager:(id)a4 URLsInSavedRecordingsDirectory:(id)a5;
@end

@implementation RCSavedRecordingsModel

- (id)performOrphanRecoveryAndCleanupWithExternallyInUseComposedAVURLs:(id)a3 andFinalizingCompositions:(id)a4 restoreFileFutures:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = OSLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing data validation", buf, 2u);
  }

  v11 = objc_opt_new();
  v12 = +[_RCURLSet setWithURLs:v8];
  v13 = +[NSFileManager defaultManager];
  v14 = +[RCSavedRecordingsModel savedRecordingsDirectory];
  uint64_t v15 = +[NSURL fileURLWithPath:v14];

  v16 = objc_opt_new();
  *(void *)buf = 0;
  v36 = buf;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100007038;
  v28[3] = &unk_1000389F8;
  v28[4] = self;
  id v17 = v11;
  id v29 = v17;
  v33 = buf;
  id v18 = v12;
  id v30 = v18;
  BOOL v34 = a5;
  id v19 = v16;
  id v31 = v19;
  id v20 = v9;
  id v32 = v20;
  [(RCSavedRecordingsModel *)self enumerateExistingRecordingsWithBlock:v28];
  if (v36[24])
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000091F4;
    v27[3] = &unk_100038A20;
    v27[4] = self;
    [v17 enumerateKeysAndObjectsUsingBlock:v27];
  }
  v21 = +[NSFileManager defaultManager];
  v22 = (void *)v15;
  v23 = [v21 contentsOfDirectoryAtURL:v15 includingPropertiesForKeys:0 options:1 error:0];

  [(RCSavedRecordingsModel *)self _performOrphanRecoveryAndCleanupOfCompositionsWithInUseComposedAVURLs:v18 fileManager:v13 URLsInSavedRecordingsDirectory:v23];
  [(RCSavedRecordingsModel *)self _performOrphanRecoveryAndCleanupOfBareAssetsWithInUseComposedAVURLs:v18 fileManager:v13 URLsInSavedRecordingsDirectory:v23];
  v24 = OSLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v39 = 136315138;
    v40 = "-[RCSavedRecordingsModel(RCSOrphanHandling) performOrphanRecoveryAndCleanupWithExternallyInUseComposedAVURLs:a"
          "ndFinalizingCompositions:restoreFileFutures:]";
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s -- performOrphanRecoveryAndCleanupWithExternallyInUseComposedAVURLs: done.", v39, 0xCu);
  }

  id v25 = v19;
  _Block_object_dispose(buf, 8);

  return v25;
}

- (void)_performOrphanRecoveryAndCleanupOfBareAssetsWithInUseComposedAVURLs:(id)a3 fileManager:(id)a4 URLsInSavedRecordingsDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSMutableDictionary dictionary];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100009680;
  v77[3] = &unk_100038A70;
  v77[4] = self;
  id v12 = v9;
  id v78 = v12;
  id v13 = v8;
  id v79 = v13;
  id v60 = v11;
  id v80 = v60;
  v71 = objc_retainBlock(v77);
  v61 = v10;
  v14 = [v10 sortedArrayUsingComparator:&stru_100038AB0];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v74;
    v69 = v13;
    v63 = self;
    id v64 = v12;
    v70 = v14;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v74 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        id v20 = [v19 pathExtension];
        unsigned int v21 = +[RCCaptureFormat supportsFileExtension:v20];

        if (v21 && ([v13 containsURL:v19] & 1) == 0)
        {
          id v22 = v19;
          v23 = OSLogForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = [v22 lastPathComponent];
            *(_DWORD *)buf = 136315394;
            v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUseCompo"
                  "sedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
            __int16 v83 = 2112;
            v84 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s -- Found orphaned composed AVURL: '%@'", buf, 0x16u);
          }
          char v25 = ((uint64_t (*)(void *, id))v71[2])(v71, v22);
          v26 = OSLogForCategory();
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
          if (v25)
          {
            if (v27)
            {
              v28 = [v22 lastPathComponent];
              *(_DWORD *)buf = 136315394;
              v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUseCom"
                    "posedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
              __int16 v83 = 2112;
              v84 = v28;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s -- Orphaned composed AVURL: '%@' does not have a duplicate in the database or unsynced assets manifest.  Attempting to insert into the database...", buf, 0x16u);
            }
            id v29 = +[AVURLAsset assetWithURL:v22];
            id v30 = v29;
            if (v29)
            {
              [v29 duration];
              double Seconds = CMTimeGetSeconds(&time);
              if (Seconds > 0.0)
              {
                double v32 = Seconds;
                v33 = objc_msgSend(v30, "rc_recordingMetadata");
                uint64_t v34 = [v33 objectForKeyedSubscript:@"uniqueID"];
                v35 = [v33 objectForKeyedSubscript:@"date"];
                v36 = v35;
                if (v35)
                {
                  id v37 = v35;
                }
                else
                {
                  sub_1000095FC(v22);
                  id v37 = (id)objc_claimAutoreleasedReturnValue();
                }
                v68 = v37;

                v45 = [v33 objectForKeyedSubscript:@"title"];
                v46 = v45;
                if (v45)
                {
                  id v47 = v45;
                }
                else
                {
                  RCLocalizedRecordingDateWithOptions();
                  id v47 = (id)objc_claimAutoreleasedReturnValue();
                }
                v67 = v47;

                v48 = OSLogForCategory();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  [v22 lastPathComponent];
                  v50 = uint64_t v49 = v34;
                  *(_DWORD *)buf = 136315394;
                  v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUs"
                        "eComposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
                  __int16 v83 = 2112;
                  v84 = v50;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s -- Found orphaned AVURL (%@) without .composition, recover it by inserting it into the database.", buf, 0x16u);

                  uint64_t v34 = v49;
                }

                v51 = [v22 path];
                v65 = (void *)v34;
                v66 = [(RCSavedRecordingsModel *)self insertRecordingWithAudioFile:v51 duration:v68 date:v67 customTitleBase:v34 uniqueID:v32];

                v52 = OSLogForCategory();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  v53 = [v22 lastPathComponent];
                  v54 = [v66 title];
                  *(_DWORD *)buf = 136315650;
                  v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUs"
                        "eComposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
                  __int16 v83 = 2112;
                  v84 = v53;
                  __int16 v85 = 2112;
                  v86 = v54;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s -- Orphaned composed AVURL: inserted '%@' into the database with title '%@'", buf, 0x20u);
                }
                v55 = [v33 objectForKeyedSubscript:@"musicMemoStarRating"];
                v56 = [v33 objectForKeyedSubscript:@"musicMemoTags"];
                uint64_t v57 = [v33 objectForKeyedSubscript:@"musicMemoTextNote"];
                v58 = (void *)v57;
                if (v55 || v56 || v57)
                {
                  v59 = OSLogForCategory();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    v62 = [v22 lastPathComponent];
                    *(_DWORD *)buf = 136315394;
                    v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithIn"
                          "UseComposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
                    __int16 v83 = 2112;
                    v84 = v62;
                    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s -- orphaned AVURL (%@) was a Music Memo", buf, 0x16u);
                  }
                  [v66 setMusicMemo:1];
                  self = v63;
                  [(RCSavedRecordingsModel *)v63 saveIfNecessary];
                }
                [v69 addURL:v22];

                id v12 = v64;
                goto LABEL_43;
              }
              v39 = OSLogForCategory();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v40 = [v22 lastPathComponent];
                *(_DWORD *)buf = 136315394;
                v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUseC"
                      "omposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
                __int16 v83 = 2112;
                v84 = v40;
                v41 = v39;
                v42 = "%s -- Orphaned composed AVURL: unable to insert '%@' into the database because it's duration is 0";
LABEL_24:
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, v42, buf, 0x16u);
              }
            }
            else
            {
              v39 = OSLogForCategory();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v40 = [v22 lastPathComponent];
                *(_DWORD *)buf = 136315394;
                v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUseC"
                      "omposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
                __int16 v83 = 2112;
                v84 = v40;
                v41 = v39;
                v42 = "%s -- Orphaned composed AVURL: '%@' unable to load AVURLAsset";
                goto LABEL_24;
              }
            }

            v43 = OSLogForCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              v44 = [v22 lastPathComponent];
              *(_DWORD *)buf = 136315394;
              v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUseCom"
                    "posedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
              __int16 v83 = 2112;
              v84 = v44;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s -- Orphaned composed AVURL: '%@' unable to insert orphaned asset into database.  Deleting!", buf, 0x16u);
            }
            v33 = [v22 path];
            [v12 removeItemAtPath:v33 error:0];
LABEL_43:

            id v13 = v69;
          }
          else
          {
            if (v27)
            {
              char v38 = [v22 lastPathComponent];
              *(_DWORD *)buf = 136315394;
              v82 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithInUseCom"
                    "posedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
              __int16 v83 = 2112;
              v84 = v38;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s -- Orphaned composed AVURL: '%@' already has a duplicate in database or unsynced assets manifest.  Deleting!", buf, 0x16u);
            }
            id v30 = [v22 path];
            [v12 removeItemAtPath:v30 error:0];
          }

          v14 = v70;
          continue;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v16);
  }
}

- (void)_logMissingAudioFutureIfNeeded:(id)a3
{
  id v3 = a3;
  v4 = [v3 syncedAudioFuture];

  if (!v4)
  {
    v5 = [v3 url];
    id v6 = [v5 checkResourceIsReachableAndReturnError:0];

    v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSNumber numberWithBool:v6];
      id v9 = [v3 uuid];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recording audio file exists = %@, uuid = %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_performOrphanRecoveryAndCleanupOfCompositionsWithInUseComposedAVURLs:(id)a3 fileManager:(id)a4 URLsInSavedRecordingsDirectory:(id)a5
{
  id v8 = a3;
  id v24 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = a5;
  id v9 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v13 = [v12 pathExtension];
        unsigned int v14 = [v13 isEqualToString:@"composition"];

        if (v14)
        {
          id v15 = v12;
          uint64_t v30 = 0;
          id v31 = &v30;
          uint64_t v32 = 0x3032000000;
          v33 = sub_100007E08;
          uint64_t v34 = sub_10000928C;
          id v35 = +[RCComposition compositionLoadedFromCompositionBundleURL:v15];
          id v16 = [(id)v31[5] composedAVURL];
          if (([v8 containsURL:v16] & 1) == 0)
          {
            if ([(id)v31[5] fileSizeOfAssets])
            {
              uint64_t v17 = OSLogForCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                id v18 = [v15 lastPathComponent];
                *(_DWORD *)buf = 136315394;
                v41 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfCompositionsWithInUs"
                      "eComposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
                __int16 v42 = 2112;
                v43 = v18;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s -- Found orphaned composition (%@) with assets, recover it by inserting it into the database.", buf, 0x16u);
              }
              uint64_t v19 = [(RCSavedRecordingsModel *)self repairCompositionDecomposedFragmentMetadataIfNecessary:v31[5]];
              id v20 = (void *)v31[5];
              v31[5] = v19;

              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472;
              v26[2] = sub_100009294;
              v26[3] = &unk_100038A48;
              id v21 = v16;
              v28 = self;
              id v29 = &v30;
              id v27 = v21;
              [(RCSavedRecordingsModel *)self performWithSavingDisabled:v26];
              [(id)v31[5] saveMetadataToDefaultLocation];
              [(RCSavedRecordingsModel *)self saveIfNecessary];
              [v8 addURL:v21];
            }
            else
            {
              id v22 = OSLogForCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                v23 = [v15 lastPathComponent];
                *(_DWORD *)buf = 136315394;
                v41 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfCompositionsWithInUs"
                      "eComposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]";
                __int16 v42 = 2112;
                v43 = v23;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s -- Found orphaned composition (%@) with no assets, deleting it.", buf, 0x16u);
              }
              [v24 removeItemAtURL:v15 error:0];
            }
          }

          _Block_object_dispose(&v30, 8);
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v9);
  }
}

- (id)updateRecordingForFinalizedCompositionAndMigrateIfNecessary:(id)a3
{
  id v4 = a3;
  v5 = [v4 savedRecordingUUID];
  if (v5)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = sub_100007E08;
    id v18 = sub_10000928C;
    id v19 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009B8C;
    v9[3] = &unk_100038AD8;
    id v10 = v4;
    v11 = self;
    id v12 = v5;
    id v13 = &v14;
    [(RCSavedRecordingsModel *)self performBlockAndWait:v9];
    id v6 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100022A58(v7);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)repairCompositionDecomposedFragmentMetadataIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_100007E08;
  id v12 = sub_10000928C;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A0A4;
  v7[3] = &unk_100038B00;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "rcs_repairDecomposedFragmentMetadataIfNecessary:", v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)_SHA256DataForPath:(id)a3
{
  id v3 = a3;
  id v5 = +[NSURL fileURLWithPath:v3];
  id v8 = 0;
  id v6 = 0;
  if ([v5 getResourceValue:&v8 forKey:NSURLFileSizeKey error:0])
  {
    if ((uint64_t)[v8 longLongValue] < 1)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = RCComputeFileDigest();
    }
  }

  return v6;
}

- (BOOL)reloadDemoContent:(id *)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100007E68;
  uint64_t v10 = sub_10001F4EC;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F4F4;
  v5[3] = &unk_1000390C8;
  v5[4] = self;
  v5[5] = &v6;
  [(RCSavedRecordingsModel *)self performBlockAndWait:v5];
  if (a3) {
    *a3 = (id) v7[5];
  }
  _Block_object_dispose(&v6, 8);

  return 1;
}

@end