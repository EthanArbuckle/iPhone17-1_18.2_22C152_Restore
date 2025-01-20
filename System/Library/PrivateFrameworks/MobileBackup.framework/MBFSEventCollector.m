@interface MBFSEventCollector
+ (void)markModificationsWith:(id)a3 since:(id)a4 domainManager:(id)a5 persona:(id)a6 cancellationHandler:(id)a7;
- (BOOL)_collectEventsFromPreviousState:(id)a3 persona:(id)a4 cancellationHandler:(id)a5;
- (MBDomainMarker)domainMarker;
- (MBFSEventCollector)initWithDomainMarker:(id)a3;
- (NSDictionary)readerForVolume;
- (OS_dispatch_queue)eventQueue;
- (id)_buildPathToDomainMapWithDomainManager:(id)a3;
- (id)_pathToModifiedDomainFlagsForVolume:(id)a3;
- (id)_pathToMonitorForVolume:(id)a3;
- (void)_buildEventReadersForPersona:(id)a3 domainManager:(id)a4;
- (void)setDomainMarker:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setReaderForVolume:(id)a3;
@end

@implementation MBFSEventCollector

- (MBFSEventCollector)initWithDomainMarker:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MBFSEventCollector;
  v6 = [(MBFSEventCollector *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domainMarker, a3);
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(Name, v10);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (id)_pathToMonitorForVolume:(id)a3
{
  if ([a3 isEqualToString:@"/private/var"]) {
    return @"containers";
  }
  else {
    return @"Containers";
  }
}

- (id)_pathToModifiedDomainFlagsForVolume:(id)a3
{
  if ([a3 isEqualToString:@"/private/var"]) {
    v3 = &off_10043B0F8;
  }
  else {
    v3 = &off_10043B120;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10020C884;
  v6[3] = &unk_100416928;
  id v4 = (id)objc_opt_new();
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (void)_buildEventReadersForPersona:(id)a3 domainManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22 = v6;
  v8 = [v6 volumesToBackUp];
  v21 = v7;
  v25 = [(MBFSEventCollector *)self _buildPathToDomainMapWithDomainManager:v7];
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  id v26 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v26)
  {
    id obj = v10;
    uint64_t v24 = *(void *)v28;
    do
    {
      dispatch_queue_t v11 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v11);
        objc_super v14 = [(MBFSEventCollector *)self _pathToMonitorForVolume:v12];
        v15 = [(MBFSEventCollector *)self _pathToModifiedDomainFlagsForVolume:v12];
        v16 = [v25 objectForKeyedSubscript:v12];
        v17 = [MBFSEventReader alloc];
        v18 = [(MBFSEventCollector *)self domainMarker];
        v19 = [(MBFSEventReader *)v17 initWithDomainMarker:v18 pathToMonitor:v14 pathToModifiedDomainFlags:v15 pathToDomainMapping:v16];

        [v9 setObject:v19 forKeyedSubscript:v12];
        dispatch_queue_t v11 = (char *)v11 + 1;
      }
      while (v26 != v11);
      id v10 = obj;
      id v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v26);
  }

  id v20 = [v9 count];
  if (v20 != [v10 count]) {
    __assert_rtn("-[MBFSEventCollector _buildEventReadersForPersona:domainManager:]", "MBFSEventCollector.m", 206, "readerForVolume.count == volumesToBackUp.count");
  }
  [(MBFSEventCollector *)self setReaderForVolume:v9];
}

- (id)_buildPathToDomainMapWithDomainManager:(id)a3
{
  id v4 = a3;
  id v35 = (id)objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v32 = self;
  id v5 = [(MBFSEventCollector *)self domainMarker];
  id v6 = [v5 unmodifiedDomainNames];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v42;
    uint64_t v30 = *(void *)v42;
    id v31 = v4;
    do
    {
      id v10 = 0;
      id v33 = v8;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v10);
        if (([v4 containsDomainName:v11] & 1) == 0) {
          __assert_rtn("-[MBFSEventCollector _buildPathToDomainMapWithDomainManager:]", "MBFSEventCollector.m", 214, "[domainManager containsDomainName:domainName]");
        }
        v13 = [v4 domainForName:v11];
        if ([v13 supportsFSEventsForDetectingChanges])
        {
          v36 = v12;
          objc_super v14 = [v13 volumeMountPoint];
          v15 = [v35 objectForKeyedSubscript:v14];
          if (!v15)
          {
            v15 = objc_opt_new();
            [v35 setObject:v15 forKeyedSubscript:v14];
          }
          v16 = objc_msgSend(v13, "rootPathRelativeToVolumeMountPoint", v28, v29);
          [v15 setObject:v13 forKeyedSubscript:v16];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v17 = [v13 relativePathsToBackup];
          id v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v38;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v38 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = [v16 stringByAppendingPathComponent:*(void *)(*((void *)&v37 + 1) + 8 * i)];
                [v15 setObject:v13 forKeyedSubscript:v22];
              }
              id v19 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v19);
          }

          uint64_t v9 = v30;
          id v4 = v31;
          id v8 = v33;
          uint64_t v12 = v36;
        }
        else
        {
          v23 = MBGetDefaultLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v13 name];
            v25 = [v13 rootPath];
            *(_DWORD *)buf = 138412546;
            v47 = v24;
            __int16 v48 = 2112;
            v49 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Skipping FSEvents for: %@ path:%@", buf, 0x16u);

            id v26 = [v13 name];
            [v13 rootPath];
            v29 = long long v28 = v26;
            _MBLog();
          }
          objc_super v14 = [(MBFSEventCollector *)v32 domainMarker];
          [v14 markModifiedDomain:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v8);
  }

  return v35;
}

- (BOOL)_collectEventsFromPreviousState:(id)a3 persona:(id)a4 cancellationHandler:(id)a5
{
  id v72 = a3;
  id v7 = a4;
  id v8 = (uint64_t (**)(void))a5;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  uint64_t v113 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x2020000000;
  uint64_t v109 = 0;
  group = dispatch_group_create();
  v73 = objc_opt_new();
  [v7 volumesToBackUp];
  v74 = v8;
  v70 = v7;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v102 objects:v120 count:16];
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v83 = *(void *)v103;
  while (2)
  {
    id v81 = v9;
    for (i = 0; i != v81; i = (char *)i + 1)
    {
      if (*(void *)v103 != v83) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v102 + 1) + 8 * i);
      id v101 = 0;
      uint64_t v12 = +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:v11 error:&v101];
      id v13 = v101;
      if (!v12)
      {
        uint64_t v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v11;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to fetch volumeUUID for %{public}@", buf, 0xCu);
          id v65 = v11;
          _MBLog();
        }

        atomic_fetch_add(v111 + 3, 1uLL);
        goto LABEL_18;
      }
      objc_super v14 = [v72 eventId];
      id v15 = [v14 unsignedLongLongValue];

      v16 = [v72 eventDatabaseUUIDForVolumeUUID];
      v17 = [v12 UUIDString];
      id v18 = [v16 objectForKeyedSubscript:v17];

      if (!v18)
      {
        v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to fetch databaseUUID for volumeUUID %{public}@", buf, 0xCu);
          id v65 = v12;
          _MBLog();
        }

        atomic_fetch_add(v111 + 3, 1uLL);
LABEL_18:

        goto LABEL_19;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v118 = sub_10020DC04;
      *(void *)&long long v119 = sub_10020DC14;
      id v19 = [(MBFSEventCollector *)self readerForVolume];
      *((void *)&v119 + 1) = [v19 objectForKeyedSubscript:v11];

      if (!*(void *)(*(void *)&buf[8] + 40)) {
        __assert_rtn("-[MBFSEventCollector _collectEventsFromPreviousState:persona:cancellationHandler:]", "MBFSEventCollector.m", 264, "reader");
      }
      uint64_t v20 = [MBFSEventStream alloc];
      v21 = [(MBFSEventCollector *)self eventQueue];
      v22 = [*(id *)(*(void *)&buf[8] + 40) pathToMonitor];
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = sub_10020DC1C;
      v100[3] = &unk_100416950;
      v100[4] = &v106;
      v100[5] = buf;
      v23 = [(MBFSEventStream *)v20 initWithQueue:v21 volumeMountPoint:v11 databaseUUID:v18 eventID:v15 rootPathToMonitor:v22 eventHandler:v100];

      dispatch_group_enter(group);
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_10020DC50;
      v97[3] = &unk_100410FC8;
      v99 = &v110;
      v98 = group;
      [(MBFSEventStream *)v23 startWithCompletion:v97];
      [v73 addObject:v23];

      _Block_object_dispose(buf, 8);
    }
    id v9 = [obj countByEnumeratingWithState:&v102 objects:v120 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_19:

  unint64_t v26 = 0;
  uint64_t v27 = 0;
  do
  {
    ++v27;
    if (0xAAAAAAAAAAAAAAABLL * v27 <= 0x5555555555555555)
    {
      unint64_t v29 = atomic_load((unint64_t *)v107 + 3);
      BOOL v28 = v29 == v26;
      unint64_t v26 = v29;
    }
    else
    {
      BOOL v28 = 0;
    }
    unint64_t v30 = atomic_load((unint64_t *)v111 + 3);
    if (v74) {
      unsigned int v31 = v74[2]();
    }
    else {
      unsigned int v31 = 0;
    }
    if (((v28 | v31) & 1) != 0 || v30)
    {
      v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        BOOL v33 = v30 != 0;
        *(_DWORD *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v31;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Stopping FSEvent collection timedOut:%d cancelled:%d failed:%d", buf, 0x14u);
        unint64_t v66 = v31;
        v67 = (uint64_t (*)(uint64_t, uint64_t))v33;
        id v65 = (id)v28;
        _MBLog();
      }

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v34 = v73;
      id v35 = [v34 countByEnumeratingWithState:&v93 objects:v116 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v94;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v94 != v36) {
              objc_enumerationMutation(v34);
            }
            objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * (void)j), "cancel", v65, v66, v67);
          }
          id v35 = [v34 countByEnumeratingWithState:&v93 objects:v116 count:16];
        }
        while (v35);
      }
    }
    dispatch_time_t v38 = dispatch_time(0, 10000000000);
  }
  while (dispatch_group_wait(group, v38));
  unint64_t v39 = atomic_load((unint64_t *)v111 + 3);
  unint64_t v69 = v39;
  if (!v39)
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v77 = obj;
    id v40 = [v77 countByEnumeratingWithState:&v89 objects:v115 count:16];
    long long v41 = 0;
    if (v40)
    {
      v82 = 0;
      unint64_t v84 = 0;
      uint64_t v78 = *(void *)v90;
      do
      {
        long long v42 = 0;
        id v79 = v40;
        do
        {
          if (*(void *)v90 != v78) {
            objc_enumerationMutation(v77);
          }
          uint64_t v43 = *(void *)(*((void *)&v89 + 1) + 8 * (void)v42);
          long long v44 = [(MBFSEventCollector *)self readerForVolume];
          v45 = [v44 objectForKeyedSubscript:v43];

          id v46 = [v45 eventsCollected];
          id v47 = [v45 eventsSkipped];
          unint64_t v48 = (unint64_t)[v45 modifiedDomainsFlags];
          v49 = MBGetDefaultLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            v50 = v49;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              v76 = v41;
              id v51 = [v45 modifiedDomainsFlags];
              id v52 = [v45 eventsCollected];
              v53 = (uint64_t (*)(uint64_t, uint64_t))[v45 eventsSkipped];
              *(_DWORD *)buf = 134218754;
              *(void *)&uint8_t buf[4] = v51;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v52;
              *(_WORD *)&buf[22] = 2048;
              v118 = v53;
              LOWORD(v119) = 2114;
              *(void *)((char *)&v119 + 2) = v43;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "FSEvents Scan flags:0x%lx collected:%llu skipped:%llu for %{public}@", buf, 0x2Au);
              long long v41 = v76;
            }

            id v54 = [v45 modifiedDomainsFlags];
            id v55 = [v45 eventsCollected];
            v67 = (uint64_t (*)(uint64_t, uint64_t))[v45 eventsSkipped];
            uint64_t v68 = v43;
            id v65 = v54;
            unint64_t v66 = (unint64_t)v55;
            _MBLog();
          }

          long long v41 = &v41[(void)v46];
          v82 = (uint64_t (*)(uint64_t, uint64_t))((char *)v82 + (void)v47);
          v84 |= v48;
          long long v42 = (char *)v42 + 1;
        }
        while (v79 != v42);
        id v40 = [v77 countByEnumeratingWithState:&v89 objects:v115 count:16];
      }
      while (v40);
    }
    else
    {
      v82 = 0;
      unint64_t v84 = 0;
    }

    v56 = MBGetDefaultLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v84;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2048;
      v118 = v82;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "FSEvents Scan flags:0x%lx collected:%llu skipped:%llu", buf, 0x20u);
      unint64_t v66 = (unint64_t)v41;
      v67 = v82;
      id v65 = (id)v84;
      _MBLog();
    }

    if (v84)
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      v57 = [(MBFSEventCollector *)self domainMarker];
      v58 = [v57 unmodifiedDomainNames];

      id v59 = [v58 countByEnumeratingWithState:&v85 objects:v114 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v86;
        do
        {
          for (k = 0; k != v59; k = (char *)k + 1)
          {
            if (*(void *)v86 != v60) {
              objc_enumerationMutation(v58);
            }
            uint64_t v62 = *(void *)(*((void *)&v85 + 1) + 8 * (void)k);
            if ((v84 & 1) != 0
              && (+[MBDomain isSystemSharedContainerName:](MBDomain, "isSystemSharedContainerName:", *(void *)(*((void *)&v85 + 1) + 8 * (void)k)) & 1) != 0|| (v84 & 2) != 0&& (+[MBDomain isSystemContainerName:](MBDomain, "isSystemContainerName:", v62) & 1) != 0|| (v84 & 4) != 0&& (+[MBDomain isAppName:](MBDomain, "isAppName:", v62) & 1) != 0|| (v84 & 8) != 0&& (+[MBDomain isAppPluginName:](MBDomain, "isAppPluginName:", v62) & 1) != 0|| (v84 & 0x10) != 0&& +[MBDomain isAppGroupName:v62])
            {
              v63 = [(MBFSEventCollector *)self domainMarker];
              [v63 markModifiedDomain:v62];
            }
          }
          id v59 = [v58 countByEnumeratingWithState:&v85 objects:v114 count:16];
        }
        while (v59);
      }
    }
  }

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);

  return v69 == 0;
}

+ (void)markModificationsWith:(id)a3 since:(id)a4 domainManager:(id)a5 persona:(id)a6 cancellationHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (uint64_t (**)(void))a7;
  v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Marking modifications using FSEvents", buf, 2u);
    _MBLog();
  }

  id v18 = [[MBFSEventCollector alloc] initWithDomainMarker:v11];
  [(MBFSEventCollector *)v18 _buildEventReadersForPersona:v14 domainManager:v13];
  if (![(MBFSEventCollector *)v18 _collectEventsFromPreviousState:v12 persona:v14 cancellationHandler:v15]&& (v15[2](v15) & 1) == 0)
  {
    v25 = v16;
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to collect FSEvents, marking all domains as modified", buf, 2u);
      _MBLog();
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v20 = [v11 unmodifiedDomainNames];
    id v21 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [v11 markModifiedDomain:*(void *)(*((void *)&v26 + 1) + 8 * (void)v24)];
          uint64_t v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        id v22 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v22);
    }

    v16 = v25;
  }
}

- (NSDictionary)readerForVolume
{
  return self->_readerForVolume;
}

- (void)setReaderForVolume:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (MBDomainMarker)domainMarker
{
  return self->_domainMarker;
}

- (void)setDomainMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainMarker, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_readerForVolume, 0);
}

@end