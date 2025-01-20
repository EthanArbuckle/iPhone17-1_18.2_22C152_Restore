@interface MapsLegacyDataMigrator
- (BOOL)_maps_isFileNotFoundError:(id)a3;
- (BOOL)_migrateDefaults;
- (BOOL)_migrateFiles;
- (BOOL)_migrateOrphanedWatchResources;
- (BOOL)_migratePathsIntoContainer;
- (BOOL)_moveItemAtPathIfExists:(id)a3 toPathCreatingIntermediateDirectories:(id)a4;
- (BOOL)_removeItemAtPathIfExists:(id)a3;
- (BOOL)_removeLegacyFiles;
- (BOOL)_removeOrphanedRAPWebBundles;
- (MapsLegacyDataMigrator)init;
- (void)_migratePreCrystalFavorites;
- (void)performMigration;
@end

@implementation MapsLegacyDataMigrator

- (void)performMigration
{
  v3 = +[NSUserDefaults __maps_groupUserDefaults];
  id v4 = [v3 integerForKey:@"LegacyDataMigratorVersionCompletionStatus"];

  if (v4 != (id)7)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    id v21 = v4;
    v5 = dispatch_group_create();
    if ((v4 & 1) == 0 && GEOConfigGetBOOL())
    {
      v6 = +[MSPMapsPaths mapsApplicationContainerPaths];
      BOOL v7 = v6 == 0;

      if (v7)
      {
        v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "There is no Maps container, so we're skipping migration for all those things that should execute inside the Maps container.", buf, 2u);
        }
      }
      else
      {
        unsigned int v8 = [(MapsLegacyDataMigrator *)self _migratePathsIntoContainer];
        v9 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v23 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Containerize: %d", buf, 8u);
        }

        unsigned int v10 = [(MapsLegacyDataMigrator *)self _migrateDefaults];
        v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Defaults: %d", buf, 8u);
        }

        unsigned int v12 = [(MapsLegacyDataMigrator *)self _migrateFiles];
        v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Files: %d", buf, 8u);
        }

        if ((v8 & v10 & v12) == 1) {
          v19[3] |= 1uLL;
        }
      }
    }
    if ((v4 & 2) == 0 && GEOConfigGetBOOL())
    {
      if (MapsFeature_IsEnabled_MyPlacesFeatures())
      {
        [(MapsLegacyDataMigrator *)self _migratePreCrystalFavorites];
        v19[3] |= 2uLL;
      }
    }
    migrationQueue = self->_migrationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B0B548;
    block[3] = &unk_1012ECD80;
    block[6] = v4;
    block[4] = self;
    block[5] = &v18;
    dispatch_group_async(v5, migrationQueue, block);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100B0B5A4;
    v16[3] = &unk_1012E9390;
    v16[4] = &v18;
    dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v16);

    _Block_object_dispose(&v18, 8);
  }
}

- (MapsLegacyDataMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsLegacyDataMigrator;
  v2 = [(MapsLegacyDataMigrator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    migrationQueue = v2->_migrationQueue;
    v2->_migrationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)_migratePathsIntoContainer
{
  BOOL v2 = 1;
  uint64_t v3 = +[MSPMapsPaths pathsAtLocation:1];
  v34 = +[MSPMapsPaths mapsApplicationContainerPaths];
  id v4 = NSCollectionLayoutEdgeSpacing_ptr;
  v5 = +[NSFileManager defaultManager];
  unsigned __int8 v40 = 0;
  objc_super v6 = [v3 mapsDirectory];
  unsigned int v7 = [v5 fileExistsAtPath:v6 isDirectory:&v40];
  int v8 = v40;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    unsigned int v10 = +[NSFileManager defaultManager];
    v11 = [v3 mapsDirectory];
    unsigned int v12 = [v10 contentsOfDirectoryAtPath:v11 error:0];

    id v13 = [v12 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v13)
    {
      id v14 = v13;
      v31 = v5;
      id obj = v12;
      uint64_t v15 = *(void *)v37;
      int v16 = 1;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          [v3 mapsDirectory];
          uint64_t v20 = v19 = v3;
          id v21 = [v20 stringByAppendingPathComponent:v18];
          v22 = [v34 mapsDirectory];
          unsigned int v23 = [v22 stringByAppendingPathComponent:v18];
          unsigned int v24 = [(MapsLegacyDataMigrator *)self _moveItemAtPathIfExists:v21 toPathCreatingIntermediateDirectories:v23];

          uint64_t v3 = v19;
          v16 &= v24;
        }
        id v14 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v14);

      v5 = v31;
      id v4 = NSCollectionLayoutEdgeSpacing_ptr;
      if (!v16)
      {
        BOOL v2 = 0;
        goto LABEL_22;
      }
    }
    else
    {
    }
    v25 = [v4[22] defaultManager];
    v26 = [v3 mapsDirectory];
    id v35 = 0;
    unsigned __int8 v27 = [v25 removeItemAtPath:v26 error:&v35];
    id v28 = v35;

    if ((v27 & 1) != 0 || [(MapsLegacyDataMigrator *)self _maps_isFileNotFoundError:v28])
    {
      BOOL v2 = 1;
    }
    else
    {
      v29 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "There was an error removing the old Maps directory: %@", buf, 0xCu);
      }

      BOOL v2 = 0;
    }
  }
LABEL_22:

  return v2;
}

- (BOOL)_maps_isFileNotFoundError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned __int8 v5 = [v4 isEqual:NSPOSIXErrorDomain];

  if (v5)
  {
    uint64_t v6 = 2;
LABEL_8:
    BOOL v9 = [v3 code] == (id)v6;
    goto LABEL_9;
  }
  unsigned int v7 = [v3 domain];
  unsigned int v8 = [v7 isEqual:NSCocoaErrorDomain];

  if (v8)
  {
    if ([v3 code] != (id)4)
    {
      uint64_t v6 = 260;
      goto LABEL_8;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_9:

  return v9;
}

- (BOOL)_moveItemAtPathIfExists:(id)a3 toPathCreatingIntermediateDirectories:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v5];

  if (v8)
  {
    BOOL v9 = +[NSFileManager defaultManager];
    unsigned int v10 = [v9 fileExistsAtPath:v6];

    if (v10)
    {
      v11 = GEOFindOrCreateLog();
      LOBYTE(v12) = 1;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v5;
        __int16 v26 = 2112;
        id v27 = v6;
        id v13 = "File %@ will not be moved over because the file exists already at destination path. %@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v13, buf, 0x16u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    id v14 = +[NSFileManager defaultManager];
    uint64_t v15 = [v6 stringByDeletingLastPathComponent];
    [v14 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:0];

    int v16 = +[NSFileManager defaultManager];
    id v23 = 0;
    unsigned int v12 = [v16 copyItemAtPath:v5 toPath:v6 error:&v23];
    v11 = v23;

    v17 = GEOFindOrCreateLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v5;
        __int16 v26 = 2112;
        id v27 = v6;
        v19 = "Migrated item at path %@ to path %@";
        uint64_t v20 = v17;
        uint32_t v21 = 22;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
    else if (v18)
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      v29 = v11;
      v19 = "There was an error migrating item at path %@ into path %@: %@";
      uint64_t v20 = v17;
      uint32_t v21 = 32;
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  v11 = GEOFindOrCreateLog();
  LOBYTE(v12) = 1;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v5;
    __int16 v26 = 2112;
    id v27 = v6;
    id v13 = "File %@ will not be moved over because the source file does not exist (would have been moved to %@)";
    goto LABEL_7;
  }
LABEL_15:

  return v12;
}

- (BOOL)_removeItemAtPathIfExists:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    id v12 = 0;
    unsigned __int8 v7 = [v6 removeItemAtPath:v3 error:&v12];
    unsigned __int8 v8 = v12;

    if (v7)
    {
      BOOL v9 = 1;
    }
    else
    {
      unsigned int v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove file: %@", buf, 0xCu);
      }

      BOOL v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = GEOFindOrCreateLog();
    BOOL v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "File %@ does not exist and will not be removed", buf, 0xCu);
    }
  }

  return v9;
}

- (BOOL)_migrateDefaults
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [&off_1013AE670 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      unsigned __int8 v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(&off_1013AE670);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v5);
        unsigned __int8 v7 = +[NSUserDefaults standardUserDefaults];
        unsigned __int8 v8 = [v7 objectForKey:v6];

        if (![v6 isEqualToString:@"DistanceUnits"]
          || ([v8 isEqualToString:@"Imperial"] & 1) != 0
          || [v8 isEqualToString:@"Metric"])
        {
          BOOL v9 = +[NSUserDefaults __maps_groupUserDefaults];
          unsigned int v10 = [v9 objectForKey:v6];

          if (!v10)
          {
            v11 = +[NSUserDefaults __maps_groupUserDefaults];
            [v11 setObject:v8 forKey:v6];
          }
        }

        unsigned __int8 v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [&off_1013AE670 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
  id v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Finished migrating shared defaults", v14, 2u);
  }

  return 1;
}

- (BOOL)_migrateFiles
{
  unsigned __int8 v3 = [(MapsLegacyDataMigrator *)self _migrateOrphanedWatchResources];
  return v3 & [(MapsLegacyDataMigrator *)self _removeLegacyFiles];
}

- (BOOL)_migrateOrphanedWatchResources
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  unsigned __int8 v3 = [v2 firstObject];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"DeviceRegistry"];

  if (v4)
  {
    unsigned __int8 v5 = +[NSFileManager defaultManager];
    id v61 = 0;
    id v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v61];
    id v7 = v61;

    if (v6)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      unsigned __int8 v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v9)
      {
        id v10 = v9;
        id v42 = v7;
        v43 = v6;
        uint64_t v11 = *(void *)v58;
        v45 = v8;
        v46 = v4;
        uint64_t v44 = *(void *)v58;
        do
        {
          uint64_t v12 = 0;
          id v47 = v10;
          do
          {
            if (*(void *)v58 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v49 = v12;
            id v13 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v57 + 1) + 8 * v12) v42, v43];
            unsigned __int8 v56 = 0;
            id v14 = +[NSFileManager defaultManager];
            unsigned int v15 = [v14 fileExistsAtPath:v13 isDirectory:&v56];
            int v16 = v56;

            if (v15) {
              BOOL v17 = v16 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (!v17)
            {
              v48 = v13;
              long long v18 = [v13 stringByAppendingPathComponent:@"GeoServices"];
              v19 = +[NSFileManager defaultManager];
              unsigned int v20 = [v19 fileExistsAtPath:v18 isDirectory:&v56];
              int v21 = v56;

              if (v20) {
                BOOL v22 = v21 == 0;
              }
              else {
                BOOL v22 = 1;
              }
              if (!v22)
              {
                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v23 = +[NSFileManager defaultManager];
                unsigned int v24 = [v23 contentsOfDirectoryAtPath:v18 error:0];

                id v25 = [v24 countByEnumeratingWithState:&v52 objects:v62 count:16];
                if (v25)
                {
                  id v26 = v25;
                  uint64_t v27 = *(void *)v53;
                  do
                  {
                    for (i = 0; i != v26; i = (char *)i + 1)
                    {
                      if (*(void *)v53 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      v29 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                      if ([v29 hasPrefix:@"hw_"])
                      {
                        v30 = [v18 stringByAppendingPathComponent:v29];
                        v31 = +[NSFileManager defaultManager];
                        id v51 = 0;
                        unsigned __int8 v32 = [v31 removeItemAtPath:v30 error:&v51];
                        id v33 = v51;

                        if ((v32 & 1) == 0)
                        {
                          v34 = GEOFindOrCreateLog();
                          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            id v65 = v33;
                            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Failed to remove orphaned Watch directory: %@", buf, 0xCu);
                          }
                        }
                      }
                    }
                    id v26 = [v24 countByEnumeratingWithState:&v52 objects:v62 count:16];
                  }
                  while (v26);
                }

                id v35 = +[NSFileManager defaultManager];
                long long v36 = [v35 contentsOfDirectoryAtPath:v18 error:0];

                uint64_t v4 = v46;
                uint64_t v11 = v44;
                if (v36 && ![v36 count])
                {
                  long long v37 = +[NSFileManager defaultManager];
                  id v50 = 0;
                  unsigned __int8 v38 = [v37 removeItemAtPath:v18 error:&v50];
                  id v39 = v50;

                  if ((v38 & 1) == 0)
                  {
                    unsigned __int8 v40 = GEOFindOrCreateLog();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v65 = v39;
                      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Failed to remove orphaned Watch directory: %@", buf, 0xCu);
                    }
                  }
                }

                unsigned __int8 v8 = v45;
              }

              id v10 = v47;
              id v13 = v48;
            }

            uint64_t v12 = v49 + 1;
          }
          while ((id)(v49 + 1) != v10);
          id v10 = [v8 countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v10);
        id v7 = v42;
        id v6 = v43;
      }
    }
    else
    {
      unsigned __int8 v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Couldn't get contents of DeviceRegistry directory: %@", buf, 0xCu);
      }
    }
  }
  return 1;
}

- (BOOL)_removeLegacyFiles
{
  unsigned __int8 v3 = +[MSPMapsPaths mapsApplicationContainerPaths];
  v40[0] = @"/var/mobile/Library/Preferences/com.apple.GMM.plist";
  v40[1] = @"/var/mobile/Library/Caches/gmmd";
  v34 = [v3 cacheDirectory];
  id v33 = [v34 stringByAppendingPathComponent:@"Maps/SuspendLocation.plist"];
  v40[2] = v33;
  unsigned __int8 v32 = [v3 mapsDirectory];
  v31 = [v32 stringByAppendingPathComponent:@"Route.plist"];
  v40[3] = v31;
  v30 = [v3 mapsDirectory];
  v29 = [v30 stringByAppendingPathComponent:@"Directions.plist"];
  v40[4] = v29;
  __int16 v28 = [v3 mapsDirectory];
  uint64_t v27 = [v28 stringByAppendingPathComponent:@"Directions.mapsdata"];
  v40[5] = v27;
  id v26 = [v3 mapsDirectory];
  id v25 = [v26 stringByAppendingPathComponent:@"History.plist"];
  v40[6] = v25;
  unsigned int v24 = [v3 mapsDirectory];
  id v23 = [v24 stringByAppendingPathComponent:@"History.mapsdata"];
  v40[7] = v23;
  BOOL v22 = [v3 mapsDirectory];
  int v21 = [v22 stringByAppendingPathComponent:@"History.synced"];
  v40[8] = v21;
  v19 = [v3 mapsDirectory];
  uint64_t v4 = [v19 stringByAppendingPathComponent:@"FailedSearches.mapsdata"];
  v40[9] = v4;
  unsigned __int8 v5 = [v3 bookmarksSettingsPath];
  v40[10] = v5;
  id v6 = [v3 mapsDirectory];
  id v7 = [v6 stringByAppendingPathComponent:@"navd.cache"];
  v40[11] = v7;
  unsigned __int8 v8 = [v3 mapsDirectory];
  id v9 = [v8 stringByAppendingPathComponent:@"navd.cache-wal"];
  v40[12] = v9;
  id v10 = [v3 mapsDirectory];
  uint64_t v11 = [v10 stringByAppendingPathComponent:@"navd.cache-shm"];
  v40[13] = v11;
  unsigned int v20 = +[NSArray arrayWithObjects:v40 count:14];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v20;
  id v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    int v16 = 1;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        v16 &= [(MapsLegacyDataMigrator *)self _removeItemAtPathIfExists:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v14);
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void)_migratePreCrystalFavorites
{
  id v2 = GEOFindOrCreateLog();
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  os_signpost_id_t v18 = 0;
  os_signpost_id_t v18 = os_signpost_id_generate(v2);
  unsigned __int8 v3 = v2;
  uint64_t v4 = v3;
  os_signpost_id_t v5 = v16[3];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, v5, "MigratePreCrystalFavorites", "", buf, 2u);
  }

  id v6 = v4;
  id v7 = v6;
  os_signpost_id_t v8 = v16[3];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MigratePreCrystalFavoritesDuration", "", buf, 2u);
  }

  id v9 = +[MapsFavoritesManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B0CB80;
  v11[3] = &unk_101317FD0;
  id v10 = v7;
  id v12 = v10;
  id v13 = &v15;
  [v9 migrateFavoritesIfNeededWithCompletionHandler:v11];

  _Block_object_dispose(&v15, 8);
}

- (BOOL)_removeOrphanedRAPWebBundles
{
  v15[0] = @"/private/var/mobile/Library/Caches/com.apple.maps/RAPWebBundle";
  v15[1] = @"/private/var/mobile/Library/Caches/com.apple.Maps/RAPWebBundle";
  +[NSArray arrayWithObjects:v15 count:2];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    int v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 &= -[MapsLegacyDataMigrator _removeItemAtPathIfExists:](self, "_removeItemAtPathIfExists:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end