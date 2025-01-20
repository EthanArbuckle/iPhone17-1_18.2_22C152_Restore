@interface BRDiskCheckerValidateTreeConsistencyOperation
+ (id)_classesForZoneState;
- (BOOL)_processNextRootURL;
- (BOOL)isEnhancedDrivePrivacyEnabledForZoneRowID:(id)a3 db:(id)a4;
- (BOOL)shouldRetryForError:(id)a3;
- (BRDiskCheckerValidateTreeConsistencyOperation)initWithDatabase:(id)a3 rootURLWrappers:(id)a4 fileChecksumRatePerThousand:(unsigned int)a5 packageChecksumRatePerThousand:(unsigned int)a6 maxEventCount:(unsigned int)a7;
- (id)_directoryFileObjectIDFromURL:(id)a3;
- (id)_injectionForFileObjectID:(id)a3;
- (id)_mangledIDFromZoneRowID:(id)a3 db:(id)a4;
- (id)_metricsFromDirectoryFileObjectID:(id)a3 db:(id)a4;
- (id)checkTelemetryCompletionBlock;
- (id)keysToFetch;
- (id)telemetryEventForFileReadErrorWithDocumentFileObjectID:(id)a3 error:(id)a4 db:(id)a5;
- (id)telemetryEventFromChecksummingFile:(id)a3 db:(id)a4;
- (id)telemetryEventFromChecksummingPackage:(id)a3 db:(id)a4;
- (id)telemetryEventValidatingSignature:(id)a3 againstDocumentFileObjectID:(id)a4 db:(id)a5;
- (void)_processURLs;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)pause;
- (void)resume;
- (void)setCheckTelemetryCompletionBlock:(id)a3;
- (void)validateDirectoryTelemetry:(id)a3 directoryStack:(id)a4 db:(id)a5 telemetryErrorEvents:(id)a6 telemetryWarningEvents:(id)a7;
@end

@implementation BRDiskCheckerValidateTreeConsistencyOperation

- (BRDiskCheckerValidateTreeConsistencyOperation)initWithDatabase:(id)a3 rootURLWrappers:(id)a4 fileChecksumRatePerThousand:(unsigned int)a5 packageChecksumRatePerThousand:(unsigned int)a6 maxEventCount:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  v35.receiver = self;
  v35.super_class = (Class)BRDiskCheckerValidateTreeConsistencyOperation;
  v15 = [(BRDiskCheckerValidateTreeConsistencyOperation *)&v35 initWithName:@"check-tree-consistency"];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_db, a3);
    v17 = (NSMutableArray *)[v14 mutableCopy];
    rootURLWrappers = v16->_rootURLWrappers;
    v16->_rootURLWrappers = v17;

    currentRootURL = v16->_currentRootURL;
    v16->_currentRootURL = 0;

    v16->_fileChecksumRate = a5;
    v16->_packageChecksumRate = a6;
    v16->_maxEventCount = a7;
    v20 = [(BRCPQLConnection *)v16->_db serialQueue];
    dispatch_source_t v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v20);
    signalSource = v16->_signalSource;
    v16->_signalSource = (OS_dispatch_source *)v21;

    objc_initWeak(&location, v16);
    v23 = v16->_signalSource;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000035AC;
    v32[3] = &unk_100010420;
    objc_copyWeak(&v33, &location);
    v24 = v23;
    v25 = v32;
    v26 = v24;
    v27 = v25;
    v28 = v27;
    v29 = v27;
    if (brc_block_remember_persona)
    {
      v29 = brc_block_remember_persona(v27);
    }
    dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v29);
    dispatch_source_set_event_handler(v26, v30);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (BOOL)_processNextRootURL
{
  p_currentRootURL = &self->_currentRootURL;
  [(NSURL *)self->_currentRootURL stopAccessingSecurityScopedResource];
  id v4 = [(NSMutableArray *)self->_rootURLWrappers count];
  if (v4)
  {
    v5 = [(NSMutableArray *)self->_rootURLWrappers lastObject];
    [(NSMutableArray *)self->_rootURLWrappers removeLastObject];
    v6 = [v5 url];
    [v6 startAccessingSecurityScopedResource];
    objc_storeStrong((id *)p_currentRootURL, v6);
    v7 = [[BRDiskCheckerFilesystemDirectory alloc] initWithURL:v6 parentIsShared:0 db:self->_db];
    [(NSMutableArray *)self->_directoryStack addObject:v7];
    self->_previousURLWasPackage = 0;
    v8 = (NSMutableArray *)objc_opt_new();
    directoryStack = self->_directoryStack;
    self->_directoryStack = v8;

    v10 = +[NSFileManager defaultManager];
    v11 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self keysToFetch];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000037BC;
    v16[3] = &unk_100010448;
    id v17 = v6;
    v18 = self;
    id v12 = v6;
    id v13 = [v10 enumeratorAtURL:v12 includingPropertiesForKeys:v11 options:2147483656 errorHandler:v16];
    directoryEnumerator = self->_directoryEnumerator;
    self->_directoryEnumerator = v13;
  }
  return v4 != 0;
}

- (id)keysToFetch
{
  v4[0] = NSURLIsPackageKey;
  v4[1] = NSURLIsRegularFileKey;
  v4[2] = NSURLIsSymbolicLinkKey;
  v4[3] = NSURLIsDirectoryKey;
  v4[4] = NSURLUbiquitousItemDownloadingStatusKey;
  v2 = +[NSArray arrayWithObjects:v4 count:5];
  return v2;
}

- (void)_processURLs
{
  uint64_t v3 = [(NSDirectoryEnumerator *)self->_directoryEnumerator nextObject];
  if (v3)
  {
    id v4 = (void *)v3;
    if (self->_previousURLWasPackage)
    {
      self->_previousURLWasPackage = 0;
      uint64_t v5 = [(NSDirectoryEnumerator *)self->_directoryEnumerator nextObject];

      id v4 = (void *)v5;
    }
    if ((unint64_t)[(NSMutableArray *)self->_telemetryErrorEvents count] >= self->_maxEventCount)
    {
      v6 = brc_bread_crumbs();
      v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] We've reached our cap of telemetry events.  Finishing early%@", buf, 0xCu);
      }

      [(BRDiskCheckerValidateTreeConsistencyOperation *)self completedWithResult:0 error:self->_processingError];
    }
    if ([(BRDiskCheckerValidateTreeConsistencyOperation *)self isCancelled])
    {
      v8 = brc_bread_crumbs();
      v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] The operation is cancelled so finishing early%@", buf, 0xCu);
      }

      v10 = +[NSError brc_errorOperationCancelled];
      [(BRDiskCheckerValidateTreeConsistencyOperation *)self completedWithResult:0 error:v10];
      goto LABEL_53;
    }
    id v12 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self keysToFetch];
    v10 = [v4 resourceValuesForKeys:v12 error:0];

    id v13 = [v10 objectForKeyedSubscript:NSURLIsDirectoryKey];
    unsigned int v14 = [v13 BOOLValue];

    if (objc_msgSend(v4, "br_wouldBeExcludedFromSync"))
    {
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100009374();
      }

      if (v14)
      {
        id v17 = brc_bread_crumbs();
        v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_1000092D8();
        }

        [(NSDirectoryEnumerator *)self->_directoryEnumerator skipDescendants];
      }
      dispatch_source_merge_data((dispatch_source_t)self->_signalSource, 1uLL);
      goto LABEL_53;
    }
    v20 = [(NSMutableArray *)self->_directoryStack lastObject];
    dispatch_source_t v21 = [v10 objectForKeyedSubscript:NSURLIsPackageKey];
    unsigned int v22 = [v21 BOOLValue];

    if (v22)
    {
      [(NSDirectoryEnumerator *)self->_directoryEnumerator skipDescendants];
      [v20 addPackage:v4];
      self->_previousURLWasPackage = 1;
      v23 = [v10 objectForKeyedSubscript:NSURLUbiquitousItemDownloadingStatusKey];
      v24 = v20;
      if ([(BRDiskCheckerFilesystemDirectory *)v23 isEqualToString:NSURLUbiquitousItemDownloadingStatusCurrent])
      {
        uint32_t v25 = arc4random() % 0x3E8;
        unsigned int packageChecksumRate = self->_packageChecksumRate;

        if (v25 < packageChecksumRate)
        {
          brc_bread_crumbs();
          v23 = (BRDiskCheckerFilesystemDirectory *)objc_claimAutoreleasedReturnValue();
          v27 = brc_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            sub_100009410();
          }

          goto LABEL_51;
        }
LABEL_52:
        dispatch_source_merge_data((dispatch_source_t)self->_signalSource, 1uLL);

LABEL_53:
        return;
      }
LABEL_51:

      goto LABEL_52;
    }
    v28 = v20;
    v29 = [v10 objectForKeyedSubscript:NSURLIsRegularFileKey];
    unsigned int v30 = [v29 BOOLValue];

    if (v30)
    {
      v24 = v20;
      [v20 addFlatFile:v4];
      v23 = [v10 objectForKeyedSubscript:NSURLUbiquitousItemDownloadingStatusKey];
      if (![(BRDiskCheckerFilesystemDirectory *)v23 isEqualToString:NSURLUbiquitousItemDownloadingStatusCurrent])goto LABEL_51; {
      uint32_t v31 = arc4random() % 0x3E8;
      }
      unsigned int fileChecksumRate = self->_fileChecksumRate;

      if (v31 >= fileChecksumRate) {
        goto LABEL_52;
      }
      id v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_1000094AC();
      }

      v23 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self telemetryEventFromChecksummingFile:v4 db:self->_db];
      if (!v23) {
        goto LABEL_51;
      }
      telemetryErrorEvents = self->_telemetryErrorEvents;
    }
    else
    {
      v36 = [v10 objectForKeyedSubscript:NSURLIsSymbolicLinkKey];
      unsigned int v37 = [v36 BOOLValue];

      if (v37)
      {
        v24 = v20;
        [v20 addSymlink:v4];
        goto LABEL_52;
      }
      v24 = v20;
      if (!v14) {
        goto LABEL_52;
      }
      v38 = [v20 url];
      unsigned int v39 = [v38 isEqual:v4];

      if (v39)
      {
        v40 = brc_bread_crumbs();
        v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v44 = [v4 path];
          v45 = objc_msgSend(v44, "fp_obfuscatedPath");
          unsigned int v46 = [v28 recursiveItemCount];
          unsigned int v47 = [v28 directChildCount];
          *(_DWORD *)buf = 138413058;
          v49 = v45;
          __int16 v50 = 1024;
          unsigned int v51 = v46;
          v24 = v28;
          __int16 v52 = 1024;
          unsigned int v53 = v47;
          __int16 v54 = 2112;
          v55 = v40;
          _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] Finishing processing %@ (rcc: %d, cc: %d)%@", buf, 0x22u);
        }
        [(NSMutableArray *)self->_directoryStack removeLastObject];
        [(BRDiskCheckerValidateTreeConsistencyOperation *)self validateDirectoryTelemetry:v24 directoryStack:self->_directoryStack db:self->_db telemetryErrorEvents:self->_telemetryErrorEvents telemetryWarningEvents:self->_telemetryWarningEvents];
        v23 = [(NSMutableArray *)self->_directoryStack lastObject];
        [(BRDiskCheckerFilesystemDirectory *)v23 addSubdirectory:v24];
        goto LABEL_51;
      }
      v42 = brc_bread_crumbs();
      v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_100009548();
      }

      v23 = -[BRDiskCheckerFilesystemDirectory initWithURL:parentIsShared:db:]([BRDiskCheckerFilesystemDirectory alloc], "initWithURL:parentIsShared:db:", v4, [v20 isShared], self->_db);
      telemetryErrorEvents = self->_directoryStack;
    }
    [(NSMutableArray *)telemetryErrorEvents addObject:v23];
    goto LABEL_51;
  }
  if ([(BRDiskCheckerValidateTreeConsistencyOperation *)self _processNextRootURL])
  {
    signalSource = self->_signalSource;
    dispatch_source_merge_data(signalSource, 1uLL);
  }
  else
  {
    processingError = self->_processingError;
    [(BRDiskCheckerValidateTreeConsistencyOperation *)self completedWithResult:0 error:processingError];
  }
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)main
{
  uint64_t v3 = (NSMutableArray *)objc_opt_new();
  telemetryErrorEvents = self->_telemetryErrorEvents;
  self->_telemetryErrorEvents = v3;

  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  telemetryWarningEvents = self->_telemetryWarningEvents;
  self->_telemetryWarningEvents = v5;

  dispatch_source_merge_data((dispatch_source_t)self->_signalSource, 1uLL);
  signalSource = self->_signalSource;
  dispatch_resume(signalSource);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  checkTelemetryCompletionBlock = self->_checkTelemetryCompletionBlock;
  telemetryErrorEvents = self->_telemetryErrorEvents;
  telemetryWarningEvents = self->_telemetryWarningEvents;
  v9 = (void (*)(void *, NSMutableArray *, NSMutableArray *, id))checkTelemetryCompletionBlock[2];
  id v10 = a4;
  id v11 = a3;
  v9(checkTelemetryCompletionBlock, telemetryErrorEvents, telemetryWarningEvents, v10);
  v12.receiver = self;
  v12.super_class = (Class)BRDiskCheckerValidateTreeConsistencyOperation;
  [(BRDiskCheckerValidateTreeConsistencyOperation *)&v12 finishWithResult:v11 error:v10];
}

+ (id)_classesForZoneState
{
  if (qword_100015948 != -1) {
    dispatch_once(&qword_100015948, &stru_100010488);
  }
  v2 = (void *)qword_100015950;
  return v2;
}

- (void)validateDirectoryTelemetry:(id)a3 directoryStack:(id)a4 db:(id)a5 telemetryErrorEvents:(id)a6 telemetryWarningEvents:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v44 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [v12 url];
  id v17 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _directoryFileObjectIDFromURL:v16];

  if (v17)
  {
    uint64_t v18 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _metricsFromDirectoryFileObjectID:v17 db:v44];
    v41 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _injectionForFileObjectID:v17];
    id v19 = [v44 fetch:@"SELECT item_id, zone_rowid FROM client_items WHERE %@ AND item_state IN (0)", v41];
    v43 = v15;
    v40 = v19;
    if ([v19 next])
    {
      uint64_t v20 = [v19 objectOfClass:objc_opt_class() atIndex:0];
      dispatch_source_t v21 = [v19 numberAtIndex:1];
      [(BRDiskCheckerValidateTreeConsistencyOperation *)self isEnhancedDrivePrivacyEnabledForZoneRowID:v21 db:v44];
      [(BRDiskCheckerValidateTreeConsistencyOperation *)self _mangledIDFromZoneRowID:v21 db:v44];
      id v22 = v14;
      id v23 = v12;
      uint64_t v25 = v24 = v13;

      v26 = (void *)v25;
      id v13 = v24;
      id v12 = v23;
      id v14 = v22;
    }
    else
    {
      v26 = 0;
      uint64_t v20 = 0;
    }
    v42 = (void *)v18;
    v38 = v26;
    unsigned int v39 = (void *)v20;
    v27 = objc_msgSend(v12, "generateTelemetryErrorEventsWithMetrics:itemID:zoneMangledID:enhancedDrivePrivacyEnabled:", v18, v20);
    v28 = [v12 telemetryWarningEvents];
    if ([v27 count])
    {
      v36 = v14;
      id v37 = v13;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v29 = v13;
      id v30 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v46;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v46 != v32) {
              objc_enumerationMutation(v29);
            }
            [*(id *)(*((void *)&v45 + 1) + 8 * i) setChildHasProblem:1];
          }
          id v31 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v31);
      }

      id v14 = v36;
      [v36 addObjectsFromArray:v27];
      id v13 = v37;
    }
    if ([v28 count])
    {
      [v43 addObjectsFromArray:v28];
      id v34 = [v43 count];
      unint64_t maxEventCount = self->_maxEventCount;
      if ((unint64_t)v34 > maxEventCount) {
        objc_msgSend(v43, "removeObjectsInRange:", maxEventCount, (char *)objc_msgSend(v43, "count") - self->_maxEventCount);
      }
    }

    id v15 = v43;
  }
}

- (id)telemetryEventValidatingSignature:(id)a3 againstDocumentFileObjectID:(id)a4 db:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _injectionForFileObjectID:v9];
  id v12 = [v10 fetch:@"SELECT version_content_signature, item_id, zone_rowid FROM client_items WHERE %@", v11];
  if (![v12 next])
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      sub_1000095E4((uint64_t)v9, (uint64_t)v14, v15);
    }

    goto LABEL_7;
  }
  id v13 = [v12 objectOfClass:objc_opt_class() atIndex:0];
  if ([v8 isEqualToData:v13])
  {

LABEL_7:
    v16 = 0;
    id v17 = 0;
LABEL_8:
    uint64_t v18 = 0;
    goto LABEL_9;
  }
  id v17 = [v12 objectOfClass:objc_opt_class() atIndex:1];
  dispatch_source_t v21 = [v12 numberAtIndex:2];
  v16 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _mangledIDFromZoneRowID:v21 db:v10];
  unsigned int v26 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self isEnhancedDrivePrivacyEnabledForZoneRowID:v21 db:v10];
  v27 = brc_bread_crumbs();
  id v22 = brc_default_log();
  if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138413314;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    objc_super v35 = v13;
    __int16 v36 = 2112;
    id v37 = v27;
    _os_log_error_impl((void *)&_mh_execute_header, v22, (os_log_type_t)0x90u, "[ERROR] File checksum at %@ for %@ doesn't match %@ vs %@%@", buf, 0x34u);
  }

  if (!v17) {
    goto LABEL_8;
  }
  unsigned int v23 = objc_msgSend(v8, "brc_signatureIsPackage");
  id v24 = [v17 itemIDString];
  if (v23) {
    id v25 = +[AppTelemetryTimeSeriesEvent newPackageChecksumMismatchEventWithZoneMangledID:v16 enhancedDrivePrivacyEnabled:v26 itemIDString:v24];
  }
  else {
    id v25 = +[AppTelemetryTimeSeriesEvent newFileChecksumMismatchEventWithZoneMangledID:v16 enhancedDrivePrivacyEnabled:v26 itemIDString:v24];
  }
  uint64_t v18 = v25;

LABEL_9:
  id v19 = v18;

  return v19;
}

- (BOOL)isEnhancedDrivePrivacyEnabledForZoneRowID:(id)a3 db:(id)a4
{
  id v4 = [a4 fetch:@"SELECT zone_plist FROM client_zones WHERE rowid = %@", a3];
  if ([v4 next])
  {
    uint64_t v5 = _BRCClassesForContainerState();
    v6 = [v4 unarchivedObjectOfClasses:v5 atIndex:0];

    if (v6)
    {
      v7 = [v6 objectForKeyedSubscript:@"state"];

      if (v7)
      {
        id v8 = [v6 objectForKeyedSubscript:@"state"];
        unint64_t v9 = (unint64_t)[v8 unsignedLongLongValue];

        v7 = (void *)((v9 >> 22) & 1);
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (id)telemetryEventForFileReadErrorWithDocumentFileObjectID:(id)a3 error:(id)a4 db:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _injectionForFileObjectID:a3];
  id v11 = [v8 fetch:@"SELECT item_id, zone_rowid FROM client_items WHERE %@", v10];
  if ([v11 next])
  {
    id v12 = [v11 objectOfClass:objc_opt_class() atIndex:0];
    id v13 = [v11 numberAtIndex:1];
    id v14 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _mangledIDFromZoneRowID:v13 db:v8];
    BOOL v15 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self isEnhancedDrivePrivacyEnabledForZoneRowID:v13 db:v8];
  }
  else
  {
    id v12 = 0;
    BOOL v15 = 0;
    id v14 = 0;
  }
  v16 = [v12 itemIDString];
  id v17 = +[AppTelemetryTimeSeriesEvent newFileReadErrorWithError:v9 zoneMangledID:v14 enhancedDrivePrivacyEnabled:v15 itemIDString:v16];

  return v17;
}

- (id)telemetryEventFromChecksummingPackage:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v48 = objc_alloc_init((Class)BRCPackageChecksummer);
  id v8 = v6;
  int v46 = open((const char *)[v8 fileSystemRepresentation], 0x8000);
  if (v46 < 0)
  {
    int v26 = *__error();
    v27 = brc_bread_crumbs();
    v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      v38 = [v8 path];
      unsigned int v39 = objc_msgSend(v38, "fp_obfuscatedPath");
      *(_DWORD *)buf = 138412802;
      v57 = v39;
      __int16 v58 = 1024;
      int v59 = v26;
      __int16 v60 = 2112;
      v61 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v28, (os_log_type_t)0x90u, "[ERROR] Can't open file at url to lookup doc id %@ %{errno}d%@", buf, 0x1Cu);
    }
    id v29 = 0;
    *__error() = v26;
    goto LABEL_37;
  }
  id v9 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _directoryFileObjectIDFromURL:v8];
  if (!v9)
  {
    id v29 = 0;
    goto LABEL_36;
  }
  id v44 = self;
  id v45 = v7;
  id v10 = +[BRCPackageItem packageItemsForFileObjectID:v9 order:2 db:v7];
  id v11 = objc_alloc_init((Class)BRFieldPkgItem);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v12 = v10;
  id v47 = [v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
  id v13 = 0;
  if (!v47) {
    goto LABEL_34;
  }
  uint64_t v14 = *(void *)v52;
  v42 = v9;
  id v43 = v8;
LABEL_5:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v52 != v14) {
      objc_enumerationMutation(v12);
    }
    v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
    [v11 updateWithPkgItem:v16];
    if ([v11 type] == 2) {
      break;
    }
    id v22 = v13;
LABEL_14:
    id v49 = v22;
    unsigned __int8 v25 = [v48 addItem:v11 error:&v49];
    id v13 = v49;

    if ((v25 & 1) == 0)
    {
      dispatch_source_t v21 = brc_bread_crumbs();
      __int16 v30 = brc_default_log();
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u)) {
        sub_10000966C();
      }
      id v22 = v13;
      id v9 = v42;
      goto LABEL_33;
    }
    [v11 clear];
    if (v47 == (id)++v15)
    {
      id v9 = v42;
      id v8 = v43;
      id v47 = [v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v47) {
        goto LABEL_5;
      }
      goto LABEL_34;
    }
  }
  id v18 = v12;
  id v19 = [v16 pathInPackage];
  uint64_t v20 = openat(v46, (const char *)[v19 fileSystemRepresentation], 0x8000);

  if ((v20 & 0x80000000) != 0)
  {
    id v22 = +[NSError br_errorFromErrno];

    int v31 = *__error();
    __int16 v32 = brc_bread_crumbs();
    id v33 = brc_default_log();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
    {
      v40 = [v16 pathInPackage];
      v41 = objc_msgSend(v40, "fp_obfuscatedPath");
      *(_DWORD *)buf = 138412802;
      v57 = v41;
      __int16 v58 = 1024;
      int v59 = v31;
      __int16 v60 = 2112;
      v61 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v33, (os_log_type_t)0x90u, "[ERROR] Couldn't open file for checksumming at %@ %{errno}d%@", buf, 0x1Cu);
    }
    *__error() = v31;
    goto LABEL_29;
  }
  id v50 = v13;
  dispatch_source_t v21 = +[CKSignatureGenerator signatureWithFileDescriptor:v20 error:&v50];
  id v22 = v50;

  close(v20);
  if (!v21)
  {
    [v48 done];
LABEL_29:
    close(v46);
    id v7 = v45;
    id v9 = v42;
    id v29 = [(BRDiskCheckerValidateTreeConsistencyOperation *)v44 telemetryEventForFileReadErrorWithDocumentFileObjectID:v42 error:v22 db:v45];
    __int16 v34 = v18;
    objc_super v35 = v18;
    id v8 = v43;
    goto LABEL_35;
  }
  unsigned int v23 = [v11 signature];
  unsigned __int8 v24 = [v21 isEqualToData:v23];

  if (v24)
  {

    id v12 = v18;
    goto LABEL_14;
  }
  __int16 v30 = brc_bread_crumbs();
  __int16 v36 = brc_default_log();
  if (os_log_type_enabled(v36, (os_log_type_t)0x90u)) {
    sub_100009708();
  }

  id v9 = v42;
  id v12 = v18;
LABEL_33:

  id v13 = v22;
  id v8 = v43;
LABEL_34:

  [v48 done];
  close(v46);
  objc_super v35 = [v48 signature];
  __int16 v34 = v12;
  id v7 = v45;
  id v29 = [(BRDiskCheckerValidateTreeConsistencyOperation *)v44 telemetryEventValidatingSignature:v35 againstDocumentFileObjectID:v9 db:v45];
  id v22 = v13;
LABEL_35:

LABEL_36:
LABEL_37:

  return v29;
}

- (id)telemetryEventFromChecksummingFile:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = open((const char *)[v8 fileSystemRepresentation], 0x8000);
  if ((v9 & 0x80000000) != 0)
  {
    id v13 = +[NSError br_errorFromErrno];
    uint64_t v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      sub_1000097A4();
    }

    id v17 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self telemetryEventForFileReadErrorWithDocumentFileObjectID:0 error:v13 db:v7];
  }
  else
  {
    uint64_t v10 = v9;
    id v11 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _directoryFileObjectIDFromURL:v8];
    id v23 = 0;
    id v12 = +[CKSignatureGenerator signatureWithFileDescriptor:v10 error:&v23];
    id v13 = v23;
    close(v10);
    if (v12)
    {
      uint64_t v14 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self telemetryEventValidatingSignature:v12 againstDocumentFileObjectID:v11 db:v7];
    }
    else
    {
      id v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        dispatch_source_t v21 = [v8 path];
        id v22 = objc_msgSend(v21, "fp_obfuscatedPath");
        *(_DWORD *)buf = 138412802;
        unsigned __int8 v25 = v22;
        __int16 v26 = 2112;
        id v27 = v13;
        __int16 v28 = 2112;
        id v29 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Failed to generate a signature for file at %@ - %@%@", buf, 0x20u);
      }
      uint64_t v14 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self telemetryEventForFileReadErrorWithDocumentFileObjectID:v11 error:v13 db:v7];
    }
    id v17 = (void *)v14;
  }
  return v17;
}

- (void)pause
{
}

- (void)resume
{
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)BRDiskCheckerValidateTreeConsistencyOperation;
  [(BRDiskCheckerValidateTreeConsistencyOperation *)&v4 cancel];
  dispatch_source_cancel((dispatch_source_t)self->_signalSource);
  uint64_t v3 = +[NSError brc_errorOperationCancelled];
  [(BRDiskCheckerValidateTreeConsistencyOperation *)self completedWithResult:0 error:v3];
}

- (id)_mangledIDFromZoneRowID:(id)a3 db:(id)a4
{
  id v4 = [a4 fetch:@"SELECT zone_name, zone_owner FROM client_zones WHERE rowid = %@", a3];
  if ([v4 next])
  {
    id v5 = objc_alloc((Class)BRMangledID);
    id v6 = [v4 stringAtIndex:0];
    id v7 = [v4 stringAtIndex:1];
    id v8 = [v5 initWithZoneName:v6 ownerName:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_metricsFromDirectoryFileObjectID:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = [(BRDiskCheckerValidateTreeConsistencyOperation *)self _injectionForFileObjectID:a3];
  id v8 = [v6 fetchObject:&stru_1000104C8, @"SELECT si.item_id IS NULL, (SELECT sz.zone_owner = %@ FROM server_zones AS sz WHERE sz.rowid = si.zone_rowid), si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count FROM client_items AS ci LEFT JOIN server_items AS si ON (si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid) WHERE ci.%@ AND ci.item_state IN (0)", CKCurrentUserDefaultName, v7 sql];

  return v8;
}

- (id)_directoryFileObjectIDFromURL:(id)a3
{
  id v3 = a3;
  id v4 = +[FPItemManager defaultManager];
  id v18 = 0;
  id v5 = [v4 itemForURL:v3 error:&v18];
  id v6 = v18;

  id v7 = [v5 providerItemIdentifier];

  if (v7)
  {
    id v8 = [v5 providerItemIdentifier];
    uint64_t v9 = +[BRFileObjectID fileObjectIDWithString:v8];

    if ([v9 isAppLibraryRoot]) {
      id v10 = 0;
    }
    else {
      id v10 = v9;
    }
  }
  else
  {
    int v11 = *__error();
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      uint64_t v15 = [v3 path];
      v16 = objc_msgSend(v15, "fp_obfuscatedPath");
      id v17 = objc_msgSend(v6, "fp_prettyDescription");
      *(_DWORD *)buf = 138413058;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v17;
      __int16 v23 = 1024;
      int v24 = v11;
      __int16 v25 = 2112;
      __int16 v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, (os_log_type_t)0x90u, "[ERROR] failed to fetch item identifier for %@: %@ %{errno}d%@", buf, 0x26u);
    }
    id v10 = 0;
    *__error() = v11;
  }

  return v10;
}

- (id)_injectionForFileObjectID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 type] == 4)
    {
      id v5 = objc_alloc((Class)BRCItemID);
      id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 rawID]);
      id v7 = [v5 initAsDocumentsWithAppLibraryRowID:v6];

      id v8 = +[PQLFormatInjection formatInjection:@"item_id = %@", v7];

      goto LABEL_9;
    }
    if ([v4 type] != 2 && objc_msgSend(v4, "type") != 3)
    {
      int v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_100009840((uint64_t)v11, v12);
      }
    }
    uint64_t v9 = +[PQLFormatInjection formatInjection:](PQLFormatInjection, "formatInjection:", @"rowid = %llu", [v4 rawID]);
  }
  else
  {
    uint64_t v9 = +[PQLRawInjection rawInjection:"0" length:1];
  }
  id v8 = (void *)v9;
LABEL_9:

  return v8;
}

- (id)checkTelemetryCompletionBlock
{
  return self->_checkTelemetryCompletionBlock;
}

- (void)setCheckTelemetryCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_checkTelemetryCompletionBlock, 0);
  objc_storeStrong((id *)&self->_processingError, 0);
  objc_storeStrong((id *)&self->_telemetryWarningEvents, 0);
  objc_storeStrong((id *)&self->_telemetryErrorEvents, 0);
  objc_storeStrong((id *)&self->_directoryEnumerator, 0);
  objc_storeStrong((id *)&self->_directoryStack, 0);
  objc_storeStrong((id *)&self->_currentRootURL, 0);
  objc_storeStrong((id *)&self->_rootURLWrappers, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_signalSource, 0);
}

@end