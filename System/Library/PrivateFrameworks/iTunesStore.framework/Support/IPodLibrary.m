@interface IPodLibrary
+ (id)deviceIPodLibrary;
+ (void)deleteIPodPurchaseWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
- (BOOL)_addLibraryItems:(id)a3 toMusicLibrary:(id)a4 itemPids:(int64_t *)a5 error:(id *)a6;
- (BOOL)_removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4 inLibrary:(id)a5;
- (BOOL)addLibraryItems:(id)a3 error:(id *)a4;
- (IPodLibrary)init;
- (int64_t)addLibraryItem:(id)a3 error:(id *)a4;
- (void)_commitScheduledLibraryItems;
- (void)_dispatchAsync:(id)a3;
- (void)_setDownloadPropertiesForTrack:(id)a3 usingLibraryItem:(id)a4;
- (void)commitScheduledLibraryItems;
- (void)dealloc;
- (void)deleteAllOTATracks;
- (void)removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4;
- (void)removeDownloadsWithIdentifiers:(id)a3 canceled:(BOOL)a4;
- (void)scheduleLibraryItem:(id)a3;
- (void)scheduleLibraryItems:(id)a3;
- (void)setAppleIdentifier:(id)a3 forAccountIdentifier:(unint64_t)a4;
@end

@implementation IPodLibrary

- (IPodLibrary)init
{
  if (+[SSDevice deviceIsAppleTV])
  {

    return 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IPodLibrary;
    v3 = [(IPodLibrary *)&v6 init];
    if (v3)
    {
      v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.IPodLibrary", 0);
      v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
      v3->_operationQueue = v4;
      [(ISOperationQueue *)v4 setAdjustsMaxConcurrentOperationCount:0];
      [(ISOperationQueue *)v3->_operationQueue setMaxConcurrentOperationCount:3];
      objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addKeepAliveOperationQueue:", v3->_operationQueue);
    }
  }
  return v3;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  scheduledItemTimer = self->_scheduledItemTimer;
  if (scheduledItemTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledItemTimer);
    dispatch_release((dispatch_object_t)self->_scheduledItemTimer);
  }
  if (self->_operationQueue)
  {
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "removeKeepAliveOperationQueue:", self->_operationQueue);
    [(ISOperationQueue *)self->_operationQueue cancelAllOperations];
  }
  v5.receiver = self;
  v5.super_class = (Class)IPodLibrary;
  [(IPodLibrary *)&v5 dealloc];
}

+ (id)deviceIPodLibrary
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C8368;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401D90 != -1) {
    dispatch_once(&qword_100401D90, block);
  }
  return (id)qword_100401D88;
}

- (int64_t)addLibraryItem:(id)a3 error:(id *)a4
{
  int64_t v5 = 0;
  id v6 = a3;
  [(IPodLibrary *)self _addLibraryItems:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1) toMusicLibrary:+[ML3MusicLibrary sharedLibrary] itemPids:&v5 error:a4];
  return v5;
}

- (BOOL)addLibraryItems:(id)a3 error:(id *)a4
{
  id v7 = +[ML3MusicLibrary sharedLibrary];

  return [(IPodLibrary *)self _addLibraryItems:a3 toMusicLibrary:v7 itemPids:0 error:a4];
}

- (void)commitScheduledLibraryItems
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000C8500;
  v2[3] = &unk_1003A33A8;
  v2[4] = self;
  [(IPodLibrary *)self _dispatchAsync:v2];
}

- (void)deleteAllOTATracks
{
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v11 = 138412290;
    uint64_t v12 = objc_opt_class();
    LODWORD(v10) = 12;
    v9 = &v11;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      id v7 = (void *)v6;
      v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v11, v10);
      free(v7);
      v9 = (int *)v8;
      SSFileLog();
    }
  }
  -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", &stru_1003A5E98, v9);
}

- (void)removeDownloadsWithIdentifiers:(id)a3 canceled:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C87B0;
  v4[3] = &unk_1003A40F8;
  v4[4] = a3;
  v4[5] = self;
  BOOL v5 = a4;
  [(IPodLibrary *)self _dispatchAsync:v4];
}

- (void)removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C89DC;
  v4[3] = &unk_1003A5F38;
  v4[4] = self;
  v4[5] = a3;
  BOOL v5 = a4;
  [(IPodLibrary *)self _dispatchAsync:v4];
}

- (void)scheduleLibraryItem:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(IPodLibrary *)self scheduleLibraryItems:v4];
}

- (void)scheduleLibraryItems:(id)a3
{
  if ([a3 count])
  {
    id v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v14 = 138412546;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2048;
      id v17 = [a3 count];
      LODWORD(v12) = 22;
      int v11 = &v14;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v14, v12);
        free(v9);
        int v11 = (int *)v10;
        SSFileLog();
      }
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000C8CC0;
    v13[3] = &unk_1003A3380;
    v13[4] = self;
    v13[5] = a3;
    -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", v13, v11);
  }
}

- (void)setAppleIdentifier:(id)a3 forAccountIdentifier:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C8E70;
  v4[3] = &unk_1003A3838;
  v4[4] = a3;
  v4[5] = a4;
  [(IPodLibrary *)self _dispatchAsync:v4];
}

+ (void)deleteIPodPurchaseWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    id v4 = +[IPodLibrary deviceIPodLibrary];
    [v4 deleteAllOTATracks];
  }
}

+ (void)observeXPCServer:(id)a3
{
}

- (BOOL)_addLibraryItems:(id)a3 toMusicLibrary:(id)a4 itemPids:(int64_t *)a5 error:(id *)a6
{
  id v6 = a3;
  v130 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v135 objects:v143 count:16];
  id obj = v6;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v136;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v136 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        unsigned int v12 = +[IPodLibraryItem mediaTypeForStoreDownload:](IPodLibraryItem, "mediaTypeForStoreDownload:", objc_msgSend(v11, "itemMetadata", v112));
        id v13 = [v11 libraryPersistentIdentifier];
        id v14 = +[SSLogConfig sharedDaemonConfig];
        if (!v14) {
          id v14 = +[SSLogConfig sharedConfig];
        }
        unsigned int v15 = [v14 shouldLog];
        if ([v14 shouldLogToDisk]) {
          v15 |= 2u;
        }
        if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_INFO)) {
          v15 &= 2u;
        }
        if (v15)
        {
          uint64_t v16 = objc_opt_class();
          int v139 = 138412546;
          uint64_t v140 = v16;
          __int16 v141 = 2048;
          *(void *)v142 = v13;
          LODWORD(v120) = 22;
          v112 = &v139;
          uint64_t v17 = _os_log_send_and_compose_impl();
          if (v17)
          {
            v18 = (void *)v17;
            v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v139, v120);
            free(v18);
            v112 = (int *)v19;
            SSFileLog();
          }
        }
        if (v13) {
          BOOL v20 = v12 == 8;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20)
        {
          id v21 = +[SSLogConfig sharedDaemonConfig];
          if (!v21) {
            id v21 = +[SSLogConfig sharedConfig];
          }
          unsigned int v22 = objc_msgSend(v21, "shouldLog", v112);
          if ([v21 shouldLogToDisk]) {
            v22 |= 2u;
          }
          if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_INFO)) {
            v22 &= 2u;
          }
          if (v22)
          {
            uint64_t v23 = objc_opt_class();
            int v139 = 138412546;
            uint64_t v140 = v23;
            __int16 v141 = 2048;
            *(void *)v142 = v13;
            LODWORD(v120) = 22;
            v112 = &v139;
            uint64_t v24 = _os_log_send_and_compose_impl();
            if (v24)
            {
              v25 = (void *)v24;
              v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v139, v120);
              free(v25);
              v112 = (int *)v26;
              SSFileLog();
            }
          }
        }
        else
        {
          [(NSMutableArray *)v130 addObject:v11];
        }
      }
      id v6 = obj;
      id v8 = [obj countByEnumeratingWithState:&v135 objects:v143 count:16];
    }
    while (v8);
  }
  if ([(NSMutableArray *)v130 count])
  {
    v27 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    v128 = objc_alloc_init(IPodLibraryML3TrackImporter);
    unsigned int v28 = [(IPodLibraryML3TrackImporter *)v128 importLibraryItems:v130 toMusicLibrary:a4 importedItemPids:v27];
    id v29 = +[SSLogConfig sharedDaemonConfig];
    if (!v29) {
      id v29 = +[SSLogConfig sharedConfig];
    }
    unsigned int v30 = [v29 shouldLog];
    if ([v29 shouldLogToDisk]) {
      v30 |= 2u;
    }
    if (os_log_type_enabled((os_log_t)[v29 OSLogObject], OS_LOG_TYPE_INFO)) {
      int v31 = v30;
    }
    else {
      int v31 = v30 & 2;
    }
    if (v31)
    {
      uint64_t v32 = objc_opt_class();
      v33 = "failed";
      if (v28) {
        v33 = "succeeded";
      }
      int v139 = 138412546;
      uint64_t v140 = v32;
      __int16 v141 = 2080;
      *(void *)v142 = v33;
      LODWORD(v120) = 22;
      v113 = &v139;
      uint64_t v34 = _os_log_send_and_compose_impl();
      if (v34)
      {
        v35 = (void *)v34;
        v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v139, v120);
        free(v35);
        v113 = (int *)v36;
        SSFileLog();
      }
    }
    if (!v28)
    {
      BOOL v110 = 0;
      goto LABEL_151;
    }
    if ([(NSMutableArray *)v130 count])
    {
      unint64_t v37 = 0;
      do
      {
        objc_msgSend(-[NSMutableArray objectAtIndex:](v130, "objectAtIndex:", v37, v113), "setLibraryPersistentIdentifier:", objc_msgSend(-[NSMutableArray objectAtIndex:](v27, "objectAtIndex:", v37), "longLongValue"));
        ++v37;
      }
      while ((unint64_t)[(NSMutableArray *)v130 count] > v37);
    }

    id v6 = obj;
  }
  v127 = objc_opt_new();
  v128 = (IPodLibraryML3TrackImporter *)objc_opt_new();
  if ([v6 count])
  {
    unint64_t v38 = 0;
    uint64_t v123 = ML3TrackPropertyBaseLocationID;
    uint64_t v124 = ML3TrackPropertyLocationFileName;
    uint64_t v122 = ML3TrackPropertyStoreFamilyAccountID;
    do
    {
      id v39 = objc_msgSend(v6, "objectAtIndex:", v38, v113);
      id v40 = [v39 itemMediaPath];
      v131 = v39;
      id v41 = [v39 libraryPersistentIdentifier];
      id v42 = v41;
      if (a5) {
        a5[v38] = (int64_t)v41;
      }
      id v43 = +[SSLogConfig sharedDaemonConfig];
      if (!v43) {
        id v43 = +[SSLogConfig sharedConfig];
      }
      unsigned int v44 = [v43 shouldLog];
      if ([v43 shouldLogToDisk]) {
        v44 |= 2u;
      }
      if (!os_log_type_enabled((os_log_t)[v43 OSLogObject], OS_LOG_TYPE_INFO)) {
        v44 &= 2u;
      }
      if (v44)
      {
        uint64_t v45 = objc_opt_class();
        int v139 = 138412802;
        uint64_t v140 = v45;
        __int16 v141 = 1024;
        *(_DWORD *)v142 = v38;
        *(_WORD *)&v142[4] = 2048;
        *(void *)&v142[6] = v42;
        LODWORD(v120) = 28;
        v114 = &v139;
        uint64_t v46 = _os_log_send_and_compose_impl();
        if (v46)
        {
          v47 = (void *)v46;
          v48 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v139, v120);
          free(v47);
          v114 = (int *)v48;
          SSFileLog();
        }
      }
      uint64_t v49 = (uint64_t)v42;
      id v50 = [objc_alloc((Class)ML3Track) initWithPersistentID:v42 inLibrary:a4];
      id v129 = [v50 valueForProperty:v124];
      id v51 = objc_msgSend(objc_msgSend(v50, "valueForProperty:", v123), "longLongValue");
      id v133 = v40;
      objc_msgSend(objc_msgSend(v40, "stringByDeletingLastPathComponent"), "lastPathComponent");
      uint64_t v52 = ML3BaseLocationIDFromMediaRelativePathInLibrary();
      id v53 = [v50 valueForProperty:v122];
      id v54 = [v53 longLongValue];
      id v55 = +[SSLogConfig sharedDaemonConfig];
      if (!v55) {
        id v55 = +[SSLogConfig sharedConfig];
      }
      unsigned int v56 = objc_msgSend(v55, "shouldLog", v114);
      if ([v55 shouldLogToDisk]) {
        v56 |= 2u;
      }
      if (!os_log_type_enabled((os_log_t)[v55 OSLogObject], OS_LOG_TYPE_INFO)) {
        v56 &= 2u;
      }
      if (v56)
      {
        uint64_t v57 = objc_opt_class();
        int v139 = 138412802;
        uint64_t v140 = v57;
        __int16 v141 = 2112;
        *(void *)v142 = v129;
        *(_WORD *)&v142[8] = 2112;
        *(void *)&v142[10] = v53;
        LODWORD(v120) = 32;
        v115 = &v139;
        uint64_t v58 = _os_log_send_and_compose_impl();
        if (v58)
        {
          v59 = (void *)v58;
          v60 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v58, 4, &v139, v120);
          free(v59);
          v115 = (int *)v60;
          SSFileLog();
        }
      }
      if (v133)
      {
        id v61 = +[SSLogConfig sharedDaemonConfig];
        id v62 = v61;
        if ((uint64_t)v51 <= v52 || v54)
        {
          if (!v61) {
            id v62 = +[SSLogConfig sharedConfig];
          }
          unsigned int v76 = objc_msgSend(v62, "shouldLog", v115);
          if ([v62 shouldLogToDisk]) {
            int v77 = v76 | 2;
          }
          else {
            int v77 = v76;
          }
          if (!os_log_type_enabled((os_log_t)[v62 OSLogObject], OS_LOG_TYPE_INFO)) {
            v77 &= 2u;
          }
          id v6 = obj;
          if (v77)
          {
            uint64_t v78 = objc_opt_class();
            id v79 = [v50 persistentID];
            int v139 = 138412546;
            uint64_t v140 = v78;
            __int16 v141 = 2048;
            *(void *)v142 = v79;
            LODWORD(v120) = 22;
            v118 = &v139;
            uint64_t v80 = _os_log_send_and_compose_impl();
            if (v80)
            {
              v81 = (void *)v80;
              v82 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v80, 4, &v139, v120);
              free(v81);
              v118 = (int *)v82;
              SSFileLog();
            }
          }
          objc_msgSend(v127, "addObject:", v131, v118);
          [(IPodLibraryML3TrackImporter *)v128 addObject:v50];
        }
        else
        {
          if (!v61) {
            id v62 = +[SSLogConfig sharedConfig];
          }
          unsigned int v63 = objc_msgSend(v62, "shouldLog", v115);
          if ([v62 shouldLogToDisk]) {
            int v64 = v63 | 2;
          }
          else {
            int v64 = v63;
          }
          if (!os_log_type_enabled((os_log_t)[v62 OSLogObject], OS_LOG_TYPE_INFO)) {
            v64 &= 2u;
          }
          if (v64)
          {
            uint64_t v65 = objc_opt_class();
            int v139 = 138412802;
            uint64_t v140 = v65;
            __int16 v141 = 2048;
            *(void *)v142 = v49;
            *(_WORD *)&v142[8] = 2112;
            *(void *)&v142[10] = v129;
            LODWORD(v120) = 32;
            v116 = &v139;
            uint64_t v66 = _os_log_send_and_compose_impl();
            if (v66)
            {
              v67 = (void *)v66;
              v68 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v66, 4, &v139, v120);
              free(v67);
              v116 = (int *)v68;
              SSFileLog();
            }
          }
          if (objc_msgSend(v131, "isDownloading", v116)) {
            [(IPodLibrary *)self _setDownloadPropertiesForTrack:v50 usingLibraryItem:v131];
          }
          +[NSSet setWithObject:v133];
          ML3DeleteAssetsAtPaths();
          id v6 = obj;
        }
      }
      else
      {
        id v69 = +[SSLogConfig sharedDaemonConfig];
        id v6 = obj;
        if (!v69) {
          id v69 = +[SSLogConfig sharedConfig];
        }
        unsigned int v70 = objc_msgSend(v69, "shouldLog", v115);
        if ([v69 shouldLogToDisk]) {
          int v71 = v70 | 2;
        }
        else {
          int v71 = v70;
        }
        if (!os_log_type_enabled((os_log_t)[v69 OSLogObject], OS_LOG_TYPE_INFO)) {
          v71 &= 2u;
        }
        if (v71)
        {
          uint64_t v72 = objc_opt_class();
          int v139 = 138412546;
          uint64_t v140 = v72;
          __int16 v141 = 2048;
          *(void *)v142 = v49;
          LODWORD(v120) = 22;
          v117 = &v139;
          uint64_t v73 = _os_log_send_and_compose_impl();
          if (v73)
          {
            v74 = (void *)v73;
            v75 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v73, 4, &v139, v120);
            free(v74);
            v117 = (int *)v75;
            SSFileLog();
          }
        }
        if (objc_msgSend(v131, "isDownloading", v117))
        {
          [(IPodLibrary *)self _setDownloadPropertiesForTrack:v50 usingLibraryItem:v131];
        }
        else if ([v131 updateType] == (id)2)
        {
          id v83 = [v131 itemArtworkData];
          if ([v83 length]) {
            [v50 populateArtworkCacheWithArtworkData:v83];
          }
        }
      }
      id v84 = +[SSLogConfig sharedDaemonConfig];
      if (!v84) {
        id v84 = +[SSLogConfig sharedConfig];
      }
      unsigned int v85 = [v84 shouldLog];
      if ([v84 shouldLogToDisk]) {
        int v86 = v85 | 2;
      }
      else {
        int v86 = v85;
      }
      if (os_log_type_enabled((os_log_t)[v84 OSLogObject], OS_LOG_TYPE_INFO)) {
        int v87 = v86;
      }
      else {
        int v87 = v86 & 2;
      }
      if (v87)
      {
        int v139 = 134217984;
        uint64_t v140 = v49;
        LODWORD(v120) = 12;
        v113 = &v139;
        uint64_t v88 = _os_log_send_and_compose_impl();
        if (v88)
        {
          v89 = (void *)v88;
          v90 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v88, 4, &v139, v120);
          free(v89);
          v113 = (int *)v90;
          SSFileLog();
        }
      }

      ++v38;
    }
    while ((unint64_t)[v6 count] > v38);
  }
  v91 = v127;
  if (objc_msgSend(v127, "count", v113))
  {
    unint64_t v92 = 0;
    uint64_t v93 = ML3TrackPropertyStoreFamilyAccountID;
    do
    {
      id v94 = [v91 objectAtIndex:v92];
      id v95 = [(IPodLibraryML3TrackImporter *)v128 objectAtIndex:v92];
      id v96 = +[SSLogConfig sharedDaemonConfig];
      if (!v96) {
        id v96 = +[SSLogConfig sharedConfig];
      }
      unsigned int v97 = [v96 shouldLog];
      if ([v96 shouldLogToDisk]) {
        v97 |= 2u;
      }
      if (!os_log_type_enabled((os_log_t)[v96 OSLogObject], OS_LOG_TYPE_INFO)) {
        v97 &= 2u;
      }
      if (v97)
      {
        uint64_t v98 = objc_opt_class();
        id v99 = [v95 persistentID];
        int v139 = 138412546;
        uint64_t v140 = v98;
        __int16 v141 = 2048;
        *(void *)v142 = v99;
        LODWORD(v120) = 22;
        v119 = &v139;
        uint64_t v100 = _os_log_send_and_compose_impl();
        if (v100)
        {
          v101 = (void *)v100;
          v102 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v100, 4, &v139, v120);
          free(v101);
          v119 = (int *)v102;
          SSFileLog();
        }
      }
      id v103 = objc_msgSend(v94, "itemArtworkData", v119);
      if ([v103 length]) {
        [v95 populateArtworkCacheWithArtworkData:v103];
      }
      id v104 = [v94 protectionType];
      id v105 = v104;
      if (v104 != (id)2 && v104 != (id)1)
      {
        if (!v104
          && (id v106 = objc_msgSend(objc_msgSend(v94, "itemMetadata"), "sinfs"),
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) != 0)
          && [v106 count])
        {
          v107 = [[DownloadDRM alloc] initWithSinfArray:v106];
          id v105 = (id)([(DownloadDRM *)v107 isDRMFree] ^ 1);
        }
        else
        {
          id v105 = 0;
        }
      }
      objc_msgSend(v95, "populateLocationPropertiesWithPath:protectionType:", objc_msgSend(v94, "itemMediaPath"), v105);
      v108 = (_UNKNOWN **)objc_msgSend(objc_msgSend(v94, "itemMetadata"), "familyAccountIdentifier");
      if (v108) {
        v109 = v108;
      }
      else {
        v109 = &off_1003C9150;
      }
      [v95 setValue:v109 forProperty:v93];
      [(IPodLibrary *)self _setDownloadPropertiesForTrack:v95 usingLibraryItem:0];
      ++v92;
      v91 = v127;
    }
    while (v92 < (unint64_t)[v127 count]);
  }

  BOOL v110 = 1;
LABEL_151:

  if (a6) {
    *a6 = 0;
  }
  return v110;
}

- (void)_commitScheduledLibraryItems
{
  if ([(NSMutableArray *)self->_scheduledItems count])
  {
    id v3 = +[SSLogConfig sharedDaemonConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    unsigned int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      id v7 = [(NSMutableArray *)self->_scheduledItems count];
      int v14 = 138412546;
      uint64_t v15 = v6;
      __int16 v16 = 2048;
      id v17 = v7;
      LODWORD(v13) = 22;
      unsigned int v12 = &v14;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v14, v13);
        free(v9);
        unsigned int v12 = (int *)v10;
        SSFileLog();
      }
    }
    -[IPodLibrary addLibraryItems:error:](self, "addLibraryItems:error:", self->_scheduledItems, 0, v12);
    [(NSMutableArray *)self->_scheduledItems removeAllObjects];
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "releaseKeepAliveAssertion:", @"com.apple.itunesstored.IPodLibrary");
  }
  scheduledItemTimer = self->_scheduledItemTimer;
  if (scheduledItemTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledItemTimer);
    dispatch_release((dispatch_object_t)self->_scheduledItemTimer);
    self->_scheduledItemTimer = 0;
  }
}

- (void)_dispatchAsync:(id)a3
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.IPodLibrary");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CA1B4;
  block[3] = &unk_1003A40D0;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4 inLibrary:(id)a5
{
  BOOL v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lld", a3);
  uint64_t v8 = ML3TrackPropertyDownloadIdentifier;
  id v9 = +[ML3Track anyInLibrary:predicate:](ML3Track, "anyInLibrary:predicate:", a5, +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyDownloadIdentifier equalToValue:v7]);
  if (!v9)
  {
LABEL_25:
    unsigned __int8 v18 = 1;
    goto LABEL_26;
  }
  uint64_t v10 = v9;
  v35[0] = ML3TrackPropertyLocationFileName;
  v35[1] = ML3TrackPropertyStoreSagaID;
  v35[2] = ML3TrackPropertyPurchaseHistoryID;
  v35[3] = ML3TrackPropertyStoreIsSubscription;
  v35[4] = ML3TrackPropertyIsRental;
  [v9 getValues:&v30 forProperties:v35 count:5];
  int v11 = v34;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 BOOLValue]) {
    [v10 setValue:&__kCFBooleanFalse forProperty:ML3TrackPropertyIsOTAPurchased];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v30 length]
    || v31 && [v31 longLongValue]
    || v32 && [v32 longLongValue]
    || v33 && ([v33 BOOLValue] & 1) != 0)
  {
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
      v14 &= 2u;
    }
    if (v14)
    {
      *(_DWORD *)id v29 = 138412546;
      *(void *)&v29[4] = objc_opt_class();
      *(_WORD *)&v29[12] = 2048;
      *(void *)&v29[14] = [v10 persistentID];
      LODWORD(v27) = 22;
      v26 = (NSString *)v29;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        __int16 v16 = (void *)v15;
        id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v29, v27);
        free(v16);
        v26 = v17;
        SSFileLog();
      }
    }
    *(void *)id v29 = v8;
    *(void *)&v29[8] = ML3TrackPropertyNeedsRestore;
    long long v28 = unk_1003A5F58;
    objc_msgSend(v10, "setValues:forProperties:count:", &v28, v29, 2, v26);
    if (v6) {
      [v10 setValue:&off_1003C9168 forProperty:ML3EntityPropertyKeepLocal];
    }
    goto LABEL_25;
  }
  id v20 = +[SSLogConfig sharedDaemonConfig];
  if (!v20) {
    id v20 = +[SSLogConfig sharedConfig];
  }
  unsigned int v21 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_INFO)) {
    v22 &= 2u;
  }
  if (v22)
  {
    *(_DWORD *)id v29 = 138412546;
    *(void *)&v29[4] = objc_opt_class();
    *(_WORD *)&v29[12] = 2048;
    *(void *)&v29[14] = [v10 persistentID];
    LODWORD(v27) = 22;
    v26 = (NSString *)v29;
    uint64_t v23 = _os_log_send_and_compose_impl();
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, v29, v27);
      free(v24);
      v26 = v25;
      SSFileLog();
    }
  }
  unsigned __int8 v18 = objc_msgSend(v10, "deleteFromLibrary", v26);
LABEL_26:

  return v18;
}

- (void)_setDownloadPropertiesForTrack:(id)a3 usingLibraryItem:(id)a4
{
  v7[0] = [a4 itemDownloadIdentifier];
  v7[1] = &__kCFBooleanFalse;
  v6[0] = ML3TrackPropertyDownloadIdentifier;
  v6[1] = ML3TrackPropertyNeedsRestore;
  if (v7[0]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [a3 setValues:v7 forProperties:v6 count:v5];
}

@end