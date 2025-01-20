@interface BRDiskCheckerFilesystemDirectory
- (BOOL)_isMissingShareAliasAtFileURL:(id)a3 isDocument:(BOOL)a4;
- (BOOL)childHasProblem;
- (BOOL)isShared;
- (BOOL)isSharedToMeTopLevelItem;
- (BOOL)shareAliasMissing;
- (BRDiskCheckerFilesystemDirectory)initWithURL:(id)a3 parentIsShared:(BOOL)a4 db:(id)a5;
- (NSArray)telemetryWarningEvents;
- (NSURL)url;
- (id)_countOfShareAliasesNotOnDisk;
- (id)_filesystemIdentifierFromURL:(id)a3 isDocument:(BOOL)a4;
- (id)_lookupInjectionFromFileURL:(id)a3 isDocument:(BOOL)a4;
- (id)generateTelemetryErrorEventsWithMetrics:(id)a3 itemID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(BOOL)a6;
- (int)directChildCount;
- (int)recursiveItemCount;
- (int)recursiveShareAliasCount;
- (int)recursiveSharedByMeCount;
- (void)_addDocument:(id)a3;
- (void)_processSharingInfoAtURL:(id)a3 isDocument:(BOOL)a4 isSharedToMeTopLevelItem:(BOOL *)a5 shareAliasIsMissing:(BOOL *)a6;
- (void)addFlatFile:(id)a3;
- (void)addPackage:(id)a3;
- (void)addSubdirectory:(id)a3;
- (void)addSymlink:(id)a3;
- (void)setChildHasProblem:(BOOL)a3;
@end

@implementation BRDiskCheckerFilesystemDirectory

- (BRDiskCheckerFilesystemDirectory)initWithURL:(id)a3 parentIsShared:(BOOL)a4 db:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BRDiskCheckerFilesystemDirectory;
  v11 = [(BRDiskCheckerFilesystemDirectory *)&v30 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    uint64_t v13 = objc_opt_new();
    telemetryWarningEvents = v12->_telemetryWarningEvents;
    v12->_telemetryWarningEvents = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_db, a5);
    if (v6)
    {
      v12->_isShared = 1;
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100008D8C((uint64_t)v15, v16);
      }
LABEL_5:

      goto LABEL_13;
    }
    p_isSharedToMeTopLevelItem = &v12->_isSharedToMeTopLevelItem;
    p_shareAliasMissing = &v12->_shareAliasMissing;
    [(BRDiskCheckerFilesystemDirectory *)v12 _processSharingInfoAtURL:v9 isDocument:0 isSharedToMeTopLevelItem:&v12->_isSharedToMeTopLevelItem shareAliasIsMissing:&v12->_shareAliasMissing];
    if (!v12->_recursiveShareAliasCount && !v12->_recursiveSharedByMeCount && !*p_isSharedToMeTopLevelItem)
    {
      v24 = [(BRDiskCheckerFilesystemDirectory *)v12 _countOfShareAliasesNotOnDisk];
      unsigned int v25 = [v24 longLongValue];

      int v26 = v12->_directChildCount + v25;
      v12->_int directChildCount = v26;
      v12->_recursiveShareAliasCount += v25;
      if (v26 < 1) {
        goto LABEL_13;
      }
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(NSURL *)v12->_url path];
        objc_msgSend(v27, "fp_obfuscatedPath");
        v28 = (char *)objc_claimAutoreleasedReturnValue();
        int directChildCount = v12->_directChildCount;
        *(_DWORD *)buf = 138412802;
        v32 = v28;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = directChildCount;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Item at url %@ has %d share aliases not on disk%@", buf, 0x1Cu);
      }
      goto LABEL_5;
    }
    v12->_isShared = 1;
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v22 = "by me";
      if (*p_isSharedToMeTopLevelItem) {
        v22 = "to me";
      }
      v23 = (const char *)&unk_10000DB9D;
      if (*p_isSharedToMeTopLevelItem && *p_shareAliasMissing) {
        v23 = " with missing share alias";
      }
      *(_DWORD *)buf = 136315650;
      v32 = v22;
      __int16 v33 = 2080;
      *(void *)v34 = v23;
      *(_WORD *)&v34[8] = 2112;
      *(void *)&v34[10] = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Directory is %s shared%s%@", buf, 0x20u);
    }

    if (*p_isSharedToMeTopLevelItem && *p_shareAliasMissing) {
      v12->_recursiveShareAliasCount = 1;
    }
  }
LABEL_13:

  return v12;
}

- (id)_countOfShareAliasesNotOnDisk
{
  v2 = self;
  v3 = [(BRDiskCheckerFilesystemDirectory *)self _filesystemIdentifierFromURL:self->_url isDocument:0];
  if (v3)
  {
    id v4 = [(BRCPQLConnection *)v2->_db fetch:@"SELECT item_id, zone_rowid FROM client_items WHERE item_file_id = %@ AND item_state IN (0)", v3];
    if ([v4 next])
    {
      v28 = v3;
      uint64_t v5 = [v4 objectOfClass:objc_opt_class() atIndex:0];
      int v26 = [v4 numberAtIndex:1];
      v27 = (void *)v5;
      id v6 = [(BRCPQLConnection *)v2->_db fetch:@"SELECT item_alias_target FROM server_items WHERE item_parent_id = %@ AND zone_rowid = %@ AND item_type = 3", v5, v26];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v25 = v6;
      id obj = [v6 enumerateObjectsOfClass:objc_opt_class()];
      id v30 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      uint64_t v7 = 0;
      if (v30)
      {
        uint64_t v8 = *(void *)v35;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v35 != v8) {
              objc_enumerationMutation(obj);
            }
            id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v32 = 0;
            id v33 = 0;
            id v31 = 0;
            unsigned __int8 v12 = [v10 parseUnsaltedBookmarkDataWithItemID:&v33 mangledID:&v32 error:&v31];
            id v13 = v31;
            if (v12)
            {
              db = v2->_db;
              int v15 = v7;
              v16 = v2;
              id v17 = v33;
              v18 = [v32 ownerName];
              v19 = [v32 appLibraryOrZoneName];
              id v24 = v17;
              v2 = v16;
              id v20 = [(BRCPQLConnection *)db numberWithSQL:@"SELECT 1 FROM server_items WHERE item_id = %@ AND item_id_is_root(item_parent_id) AND zone_rowid = (SELECT sz.rowid FROM server_zones AS sz WHERE sz.zone_owner = %@ AND sz.zone_name = %@)", v24, v18, v19];

              uint64_t v7 = v15 + ([v20 BOOLValue] ^ 1);
            }
            else
            {
              brc_bread_crumbs();
              id v20 = (id)objc_claimAutoreleasedReturnValue();
              v21 = brc_default_log();
              if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412802;
                v39 = v10;
                __int16 v40 = 2112;
                id v41 = v13;
                __int16 v42 = 2112;
                id v43 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v21, (os_log_type_t)0x90u, "[ERROR] Can't parse alias target string %@ - %@%@", buf, 0x20u);
              }
            }
          }
          id v30 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v30);
      }

      v22 = +[NSNumber numberWithInt:v7];

      id v4 = v25;
      v3 = v28;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_filesystemIdentifierFromURL:(id)a3 isDocument:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 0);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    if (v4)
    {
      uint64_t DocID = BRCGetOrAllocateDocID();
      if (DocID)
      {
        uint64_t v9 = +[NSNumber numberWithUnsignedInt:DocID];
LABEL_10:
        unsigned __int8 v12 = (void *)v9;
LABEL_16:
        close(v7);
        goto LABEL_17;
      }
      id v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
        sub_100008EA0();
      }
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
      if ((fstat(v6, &v16) & 0x80000000) == 0)
      {
        uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:v16.st_ino];
        goto LABEL_10;
      }
      id v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
        sub_100008F3C();
      }
    }

    unsigned __int8 v12 = 0;
    goto LABEL_16;
  }
  id v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
    sub_100008E04();
  }

  unsigned __int8 v12 = 0;
LABEL_17:

  return v12;
}

- (id)_lookupInjectionFromFileURL:(id)a3 isDocument:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = -[BRDiskCheckerFilesystemDirectory _filesystemIdentifierFromURL:isDocument:](self, "_filesystemIdentifierFromURL:isDocument:", a3);
  if (v5)
  {
    if (v4) {
      CFStringRef v6 = @"ci.item_doc_id = %@";
    }
    else {
      CFStringRef v6 = @"ci.item_file_id = %@";
    }
    int v7 = +[PQLFormatInjection formatInjection:](PQLFormatInjection, "formatInjection:", v6, v5);
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (BOOL)_isMissingShareAliasAtFileURL:(id)a3 isDocument:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(BRDiskCheckerFilesystemDirectory *)self _lookupInjectionFromFileURL:v6 isDocument:v4];
  if (v7)
  {
    id v8 = [(BRCPQLConnection *)self->_db fetch:@"SELECT ci.item_id, cz.zone_owner, cz.zone_name FROM client_items AS ci INNER JOIN client_zones AS cz ON ci.zone_rowid = cz.rowid WHERE %@", v7];
    if ([v8 next])
    {
      uint64_t v9 = [v8 objectOfClass:objc_opt_class() atIndex:0];
      id v10 = [v8 stringAtIndex:1];
      v22 = [v8 stringAtIndex:2];
      id v11 = [objc_alloc((Class)BRMangledID) initWithZoneName:v22 ownerName:v10];
      [v8 close];
      unsigned __int8 v12 = [v9 itemIDString];
      id v13 = +[NSString unsaltedBookmarkDataWithItemResolutionString:v12 serverZoneMangledID:v11];

      id v14 = [(BRCPQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM server_items WHERE item_alias_target = %@ AND item_type = 3", v13];
      unsigned __int8 v15 = [v14 BOOLValue];
      if ((v15 & 1) == 0)
      {
        v21 = brc_bread_crumbs();
        stat v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v6 path];
          v19 = objc_msgSend(v20, "fp_obfuscatedPath");
          *(_DWORD *)buf = 138412546;
          id v24 = v19;
          __int16 v25 = 2112;
          int v26 = v21;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Share alias is missing for %@%@", buf, 0x16u);
        }
      }
      char v17 = v15 ^ 1;
    }
    else
    {
      uint64_t v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
        sub_100008FD8();
      }
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)_processSharingInfoAtURL:(id)a3 isDocument:(BOOL)a4 isSharedToMeTopLevelItem:(BOOL *)a5 shareAliasIsMissing:(BOOL *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  if (!self->_isShared)
  {
    id v11 = [(BRDiskCheckerFilesystemDirectory *)self _lookupInjectionFromFileURL:v10 isDocument:v8];
    id v12 = [(BRCPQLConnection *)self->_db fetch:@"SELECT ci.item_sharing_options, cz.zone_owner FROM client_items AS ci INNER JOIN client_zones AS cz ON ci.zone_rowid = cz.rowid WHERE %@", v11];
    if ([v12 next])
    {
      unsigned __int8 v13 = [v12 intAtIndex:0];
      id v14 = [v12 stringAtIndex:1];
      unsigned __int8 v15 = v14;
      if ((v13 & 4) != 0)
      {
        if ([v14 isEqualToString:CKCurrentUserDefaultName])
        {
          ++self->_recursiveSharedByMeCount;
        }
        else
        {
          if (a5) {
            *a5 = 1;
          }
          if ([(BRDiskCheckerFilesystemDirectory *)self _isMissingShareAliasAtFileURL:v10 isDocument:v8])
          {
            if (a6) {
              *a6 = 1;
            }
          }
          else
          {
            ++self->_recursiveShareAliasCount;
          }
        }
      }
    }
    else
    {
      stat v16 = brc_bread_crumbs();
      char v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v10 path];
        v19 = objc_msgSend(v18, "fp_obfuscatedPath");
        id v20 = [(BRCPQLConnection *)self->_db lastError];
        *(_DWORD *)buf = 138412802;
        v22 = v19;
        __int16 v23 = 2112;
        id v24 = v20;
        __int16 v25 = 2112;
        int v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to get sharing options for %@ - %@%@", buf, 0x20u);
      }
    }
  }
}

- (void)_addDocument:(id)a3
{
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000090EC();
  }

  __int16 v11 = 0;
  [(BRDiskCheckerFilesystemDirectory *)self _processSharingInfoAtURL:v4 isDocument:1 isSharedToMeTopLevelItem:(char *)&v11 + 1 shareAliasIsMissing:&v11];
  if (self->_isShared || !(_BYTE)v11)
  {
    ++self->_directChildCount;
  }
  else
  {
    int v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Not counting item missing a share alias%@", buf, 0xCu);
    }
  }
  if (HIBYTE(v11))
  {
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100009074((uint64_t)v9, v10);
    }
  }
  else
  {
    ++self->_recursiveItemCount;
  }
}

- (void)addFlatFile:(id)a3
{
}

- (void)addPackage:(id)a3
{
}

- (void)addSymlink:(id)a3
{
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100009188();
  }

  *(int32x2_t *)&self->_int directChildCount = vadd_s32(*(int32x2_t *)&self->_directChildCount, (int32x2_t)0x100000001);
}

- (void)addSubdirectory:(id)a3
{
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100009224();
  }

  if (![v4 isSharedToMeTopLevelItem]
    || ([v4 shareAliasMissing] & 1) == 0)
  {
    ++self->_directChildCount;
    self->_recursiveShareAliasCount += [v4 recursiveShareAliasCount];
    self->_recursiveSharedByMeCount += [v4 recursiveSharedByMeCount];
    if (([v4 isSharedToMeTopLevelItem] & 1) == 0) {
      self->_recursiveItemCount += [v4 recursiveItemCount];
    }
  }
}

- (id)generateTelemetryErrorEventsWithMetrics:(id)a3 itemID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (self->_childHasProblem)
  {
    unsigned __int8 v13 = 0;
    goto LABEL_24;
  }
  unsigned __int8 v13 = objc_opt_new();
  uint64_t v14 = [v10 childCount];
  if (v14)
  {
    unsigned __int8 v15 = (void *)v14;
    id directChildCount = self->_directChildCount;
    char v17 = [v10 childCount];
    id v18 = [v17 longLongValue];

    if (v18 != directChildCount)
    {
      int v41 = self->_directChildCount;
      __int16 v42 = [v10 childCount];
      uint64_t v43 = v41 - [v42 intValue];

      v44 = brc_bread_crumbs();
      v45 = brc_default_log();
      if (os_log_type_enabled(v45, (os_log_type_t)0x90u))
      {
        v74 = [v11 debugItemIDString];
        v70 = [(NSURL *)self->_url path];
        v58 = objc_msgSend(v70, "fp_obfuscatedPath");
        int v66 = self->_directChildCount;
        v59 = [v10 childCount];
        *(_DWORD *)buf = 138413314;
        v79 = v74;
        __int16 v80 = 2112;
        v81 = v58;
        __int16 v82 = 1024;
        int v83 = v66;
        __int16 v84 = 2112;
        v85 = v59;
        __int16 v86 = 2112;
        v87 = v44;
        _os_log_error_impl((void *)&_mh_execute_header, v45, (os_log_type_t)0x90u, "[ERROR] Direct child count mismatch for %@ at %@ (%d vs %@)%@", buf, 0x30u);
      }
      v39 = [v11 itemIDString];
      id v40 = +[AppTelemetryTimeSeriesEvent newChildCountMismatchEventWithZoneMangledID:v12 enhancedDrivePrivacyEnabled:v6 itemIDString:v39 magnitude:v43];
      goto LABEL_23;
    }
  }
  uint64_t v19 = [v10 recursiveChildCount];
  if (v19)
  {
    id v20 = (void *)v19;
    id recursiveItemCount = self->_recursiveItemCount;
    v22 = [v10 recursiveChildCount];
    id v23 = [v22 longLongValue];

    if (v23 != recursiveItemCount)
    {
      int v46 = self->_recursiveItemCount;
      v47 = [v10 recursiveChildCount];
      uint64_t v48 = v46 - [v47 intValue];

      v49 = brc_bread_crumbs();
      v50 = brc_default_log();
      if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
      {
        v75 = [v11 debugItemIDString];
        v71 = [(NSURL *)self->_url path];
        v60 = objc_msgSend(v71, "fp_obfuscatedPath");
        int v67 = self->_recursiveItemCount;
        v61 = [v10 recursiveChildCount];
        *(_DWORD *)buf = 138413314;
        v79 = v75;
        __int16 v80 = 2112;
        v81 = v60;
        __int16 v82 = 1024;
        int v83 = v67;
        __int16 v84 = 2112;
        v85 = v61;
        __int16 v86 = 2112;
        v87 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, v50, (os_log_type_t)0x90u, "[ERROR] Recursive child count mismatch for %@ at %@ (%d vs %@)%@", buf, 0x30u);
      }
      v39 = [v11 itemIDString];
      id v40 = +[AppTelemetryTimeSeriesEvent newRecursiveItemCountMismatchEventWithZoneMangledID:v12 enhancedDrivePrivacyEnabled:v6 itemIDString:v39 magnitude:v48];
      goto LABEL_23;
    }
  }
  uint64_t v24 = [v10 sharedByMeRecursiveCount];
  if (v24)
  {
    __int16 v25 = (void *)v24;
    id recursiveSharedByMeCount = self->_recursiveSharedByMeCount;
    v27 = [v10 sharedByMeRecursiveCount];
    id v28 = [v27 longLongValue];

    if (v28 != recursiveSharedByMeCount)
    {
      int v51 = self->_recursiveSharedByMeCount;
      v52 = [v10 sharedByMeRecursiveCount];
      uint64_t v53 = v51 - [v52 intValue];

      v54 = brc_bread_crumbs();
      v55 = brc_default_log();
      if (os_log_type_enabled(v55, (os_log_type_t)0x90u))
      {
        v76 = [v11 debugItemIDString];
        v72 = [(NSURL *)self->_url path];
        v62 = objc_msgSend(v72, "fp_obfuscatedPath");
        int v68 = self->_recursiveSharedByMeCount;
        v63 = [v10 sharedByMeRecursiveCount];
        *(_DWORD *)buf = 138413314;
        v79 = v76;
        __int16 v80 = 2112;
        v81 = v62;
        __int16 v82 = 1024;
        int v83 = v68;
        __int16 v84 = 2112;
        v85 = v63;
        __int16 v86 = 2112;
        v87 = v54;
        _os_log_error_impl((void *)&_mh_execute_header, v55, (os_log_type_t)0x90u, "[ERROR] Shared-by-me count mismatch for %@ at %@ (%d vs %@)%@", buf, 0x30u);
      }
      v39 = [v11 itemIDString];
      id v40 = +[AppTelemetryTimeSeriesEvent newShareCountMismatchEventWithZoneMangledID:v12 enhancedDrivePrivacyEnabled:v6 itemIDString:v39 magnitude:v53];
      goto LABEL_23;
    }
  }
  uint64_t v29 = [v10 sharedAliasRecursiveCount];
  if (v29)
  {
    id v30 = (void *)v29;
    id recursiveShareAliasCount = self->_recursiveShareAliasCount;
    id v32 = [v10 sharedAliasRecursiveCount];
    id v33 = [v32 longLongValue];

    if (v33 != recursiveShareAliasCount)
    {
      int v34 = self->_recursiveSharedByMeCount;
      long long v35 = [v10 sharedByMeRecursiveCount];
      uint64_t v36 = v34 - [v35 intValue];

      long long v37 = brc_bread_crumbs();
      v38 = brc_default_log();
      if (os_log_type_enabled(v38, (os_log_type_t)0x90u))
      {
        v77 = [v11 debugItemIDString];
        v73 = [(NSURL *)self->_url path];
        v64 = objc_msgSend(v73, "fp_obfuscatedPath");
        int v69 = self->_recursiveShareAliasCount;
        v65 = [v10 sharedAliasRecursiveCount];
        *(_DWORD *)buf = 138413314;
        v79 = v77;
        __int16 v80 = 2112;
        v81 = v64;
        __int16 v82 = 1024;
        int v83 = v69;
        __int16 v84 = 2112;
        v85 = v65;
        __int16 v86 = 2112;
        v87 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v38, (os_log_type_t)0x90u, "[ERROR] Share alias count mismatch for %@ at %@ (%d vs %@)%@", buf, 0x30u);
      }
      v39 = [v11 itemIDString];
      id v40 = +[AppTelemetryTimeSeriesEvent newShareAliasCountMismatchEventWithZoneMangledID:v12 enhancedDrivePrivacyEnabled:v6 itemIDString:v39 magnitude:v36];
LABEL_23:
      v56 = v40;

      [v13 addObject:v56];
    }
  }
LABEL_24:

  return v13;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (BOOL)isSharedToMeTopLevelItem
{
  return self->_isSharedToMeTopLevelItem;
}

- (BOOL)shareAliasMissing
{
  return self->_shareAliasMissing;
}

- (int)directChildCount
{
  return self->_directChildCount;
}

- (int)recursiveItemCount
{
  return self->_recursiveItemCount;
}

- (int)recursiveSharedByMeCount
{
  return self->_recursiveSharedByMeCount;
}

- (int)recursiveShareAliasCount
{
  return self->_recursiveShareAliasCount;
}

- (BOOL)childHasProblem
{
  return self->_childHasProblem;
}

- (void)setChildHasProblem:(BOOL)a3
{
  self->_childHasProblem = a3;
}

- (NSArray)telemetryWarningEvents
{
  return &self->_telemetryWarningEvents->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_telemetryWarningEvents, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end