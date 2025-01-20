@interface NSString(BRCBookmarkAdditions)
+ (id)bookmarkDataWithDocumentID:()BRCBookmarkAdditions serverZone:;
+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZone:;
+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:saltAccountDSID:;
+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneName:ownerName:accountDSID:salted:;
+ (id)itemResolutionStringWithDocumentID:()BRCBookmarkAdditions;
+ (id)unsaltedBookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:;
- (uint64_t)parseBookmarkDataWithAccountSession:()BRCBookmarkAdditions docID:itemID:mangledID:unsaltedBookmarkData:error:;
- (uint64_t)parseUnsaltedBookmarkDataWithItemID:()BRCBookmarkAdditions mangledID:error:;
@end

@implementation NSString(BRCBookmarkAdditions)

+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:saltAccountDSID:
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 unsaltedBookmarkDataWithItemResolutionString:v8 serverZoneMangledID:a4];
  if (v9)
  {
    v11 = objc_msgSend(v8, "brc_SHA1WithSalt:", v9);
    id v12 = [v10 stringByAppendingPathComponent:v11];
  }
  else
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[NSString(BRCBookmarkAdditions) bookmarkDataWithItemResolutionString:serverZoneMangledID:saltAccountDSID:]((uint64_t)v13, v14);
    }

    id v12 = v10;
  }

  return v12;
}

+ (id)unsaltedBookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:
{
  v5 = NSString;
  id v6 = a3;
  v7 = [a4 aliasTargetContainerString];
  id v8 = [v5 stringWithFormat:@"%@/%@", v7, v6];

  return v8;
}

+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZone:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 mangledID];
  id v9 = [v6 session];

  v10 = [v9 accountDSID];
  v11 = [a1 bookmarkDataWithItemResolutionString:v7 serverZoneMangledID:v8 saltAccountDSID:v10];

  return v11;
}

+ (id)itemResolutionStringWithDocumentID:()BRCBookmarkAdditions
{
  v3 = [a3 stringValue];
  v4 = [@"docID:" stringByAppendingString:v3];

  return v4;
}

+ (id)bookmarkDataWithDocumentID:()BRCBookmarkAdditions serverZone:
{
  id v6 = a4;
  id v7 = [a1 itemResolutionStringWithDocumentID:a3];
  id v8 = [a1 bookmarkDataWithItemResolutionString:v7 serverZone:v6];

  return v8;
}

- (uint64_t)parseUnsaltedBookmarkDataWithItemID:()BRCBookmarkAdditions mangledID:error:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = [a1 componentsSeparatedByString:@"/"];
  if ([v9 count] == 2)
  {
    id v10 = objc_alloc(MEMORY[0x263F325E0]);
    v11 = [v9 objectAtIndexedSubscript:0];
    id v12 = (BRCItemID *)[v10 initWithAliasTargetContainerString:v11];

    if (v12)
    {
      v13 = [BRCItemID alloc];
      v14 = [v9 objectAtIndexedSubscript:1];
      v15 = [(BRCItemID *)v13 initWithUUIDString:v14];

      if (v15)
      {
        if (a4) {
          objc_storeStrong(a4, v12);
        }
        if (a3) {
          objc_storeStrong(a3, v15);
        }
        uint64_t v16 = 1;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"unsaltedBookmarkData", a1);
      v21 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = brc_bread_crumbs();
        v23 = brc_default_log();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        {
          v27 = "(passed to caller)";
          int v28 = 136315906;
          v29 = "-[NSString(BRCBookmarkAdditions) parseUnsaltedBookmarkDataWithItemID:mangledID:error:]";
          __int16 v30 = 2080;
          if (!a5) {
            v27 = "(ignored by caller)";
          }
          v31 = v27;
          __int16 v32 = 2112;
          v33 = v21;
          __int16 v34 = 2112;
          v35 = v22;
          _os_log_error_impl(&dword_23FA42000, v23, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v28, 0x2Au);
        }
      }
      if (a5) {
        *a5 = v21;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"unsaltedBookmarkData", a1);
      v15 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v19 = brc_bread_crumbs();
        v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v26 = "(passed to caller)";
          int v28 = 136315906;
          v29 = "-[NSString(BRCBookmarkAdditions) parseUnsaltedBookmarkDataWithItemID:mangledID:error:]";
          __int16 v30 = 2080;
          if (!a5) {
            v26 = "(ignored by caller)";
          }
          v31 = v26;
          __int16 v32 = 2112;
          v33 = v15;
          __int16 v34 = 2112;
          v35 = v19;
          _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v28, 0x2Au);
        }
      }
      if (a5)
      {
        v15 = v15;
        uint64_t v16 = 0;
        *a5 = v15;
LABEL_27:

        goto LABEL_28;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"unsaltedBookmarkData", a1);
  id v12 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      v25 = "(passed to caller)";
      int v28 = 136315906;
      v29 = "-[NSString(BRCBookmarkAdditions) parseUnsaltedBookmarkDataWithItemID:mangledID:error:]";
      __int16 v30 = 2080;
      if (!a5) {
        v25 = "(ignored by caller)";
      }
      v31 = v25;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v17;
      _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v28, 0x2Au);
    }
  }
  if (a5)
  {
    id v12 = v12;
    uint64_t v16 = 0;
    *a5 = v12;
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_28:

  return v16;
}

- (uint64_t)parseBookmarkDataWithAccountSession:()BRCBookmarkAdditions docID:itemID:mangledID:unsaltedBookmarkData:error:
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v13 = a3;
  v14 = [a1 componentsSeparatedByString:@"/"];
  if ([v14 count] == 3)
  {
    id v15 = [v14 objectAtIndexedSubscript:0];
    uint64_t v16 = [v14 objectAtIndexedSubscript:1];
    v17 = [v14 objectAtIndexedSubscript:2];
    id obj = (id)[objc_alloc(MEMORY[0x263F325E0]) initWithAliasTargetContainerString:v15];
    uint64_t v53 = [v13 accountDSID];
    objc_msgSend(v16, "brc_SHA1WithSalt:");
    uint64_t v52 = v55 = v17;
    if ((objc_msgSend(v17, "isEqualToString:") & 1) == 0
      && ([v17 isEqualToString:@"BRGetFileNameFromServerInfoBlob"] & 1) == 0)
    {
      v29 = v16;
      __int16 v30 = a8;
      v31 = brc_bread_crumbs();
      __int16 v32 = brc_default_log();
      v33 = (void *)v52;
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        v58 = (const char *)v17;
        __int16 v59 = 2112;
        uint64_t v60 = v52;
        __int16 v61 = 2112;
        id v62 = a1;
        __int16 v63 = 2112;
        v64 = v31;
        _os_log_error_impl(&dword_23FA42000, v32, (os_log_type_t)0x90u, "[ERROR] checksum from bookmark %@ is not equal to expected checksum %@ for %@%@", buf, 0x2Au);
      }

      v18 = obj;
      if (v30)
      {
        objc_msgSend(MEMORY[0x263F087E8], "brc_errorAccountMismatch");
        uint64_t v27 = 0;
        *__int16 v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v27 = 0;
      }
      v37 = (void *)v53;
      goto LABEL_41;
    }
    v18 = obj;
    if (!((unint64_t)a4 | (unint64_t)a5)) {
      goto LABEL_34;
    }
    v50 = [v16 componentsSeparatedByString:@":"];
    v49 = a8;
    v51 = v16;
    if ([v50 count] == 2 && objc_msgSend(v16, "hasPrefix:", @"docID:"))
    {
      if (a5)
      {
        v19 = *a5;
        *a5 = 0;
      }
      if (!a4) {
        goto LABEL_29;
      }
      v20 = NSNumber;
      v21 = [v50 objectAtIndexedSubscript:1];
      uint64_t v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
      v23 = *a4;
      *a4 = (void *)v22;
    }
    else
    {
      id v48 = v13;
      if ([obj isShared])
      {
        int v28 = [v13 sharedClientZoneByMangledID:obj];
        v23 = [v28 dbRowID];
        v21 = 0;
      }
      else
      {
        int v28 = [v13 appLibraryByMangledID:obj];
        v21 = [v28 dbRowID];
        v23 = 0;
      }

      if (a5)
      {
        __int16 v34 = [[BRCItemID alloc] initWithString:v51 libraryRowID:v21 sharedZoneRowID:v23];
        v35 = *a5;
        *a5 = v34;
      }
      id v13 = v48;
      if (a4)
      {
        uint64_t v36 = *a4;
        *a4 = 0;
      }
    }

    a8 = v49;
    uint64_t v16 = v51;
LABEL_29:
    if (a5 && a4 && !*a5 && !*a4)
    {
      v41 = v16;
      v42 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"bookmarkData", a1);
      if (v42)
      {
        v43 = a8;
        v44 = brc_bread_crumbs();
        v45 = brc_default_log();
        if (os_log_type_enabled(v45, (os_log_type_t)0x90u))
        {
          v47 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v58 = "-[NSString(BRCBookmarkAdditions) parseBookmarkDataWithAccountSession:docID:itemID:mangledID:unsaltedBook"
                "markData:error:]";
          __int16 v59 = 2080;
          if (!v43) {
            v47 = "(ignored by caller)";
          }
          uint64_t v60 = (uint64_t)v47;
          __int16 v61 = 2112;
          id v62 = v42;
          __int16 v63 = 2112;
          v64 = v44;
          _os_log_error_impl(&dword_23FA42000, v45, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        a8 = v43;
        v18 = obj;
      }
      if (a8) {
        *a8 = v42;
      }

      uint64_t v27 = 0;
      v29 = v41;
      v33 = (void *)v52;
      v37 = (void *)v53;
      goto LABEL_41;
    }

LABEL_34:
    if (a6) {
      objc_storeStrong(a6, obj);
    }
    v33 = (void *)v52;
    v37 = (void *)v53;
    if (a7)
    {
      uint64_t v38 = [v15 stringByAppendingPathComponent:v16];
      v39 = *a7;
      *a7 = (void *)v38;
    }
    v29 = v16;
    uint64_t v27 = 1;
LABEL_41:

    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"bookmarkData", a1);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v24 = a8;
    v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      v46 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v58 = "-[NSString(BRCBookmarkAdditions) parseBookmarkDataWithAccountSession:docID:itemID:mangledID:unsaltedBookmarkData:error:]";
      __int16 v59 = 2080;
      if (!v24) {
        v46 = "(ignored by caller)";
      }
      uint64_t v60 = (uint64_t)v46;
      __int16 v61 = 2112;
      id v62 = v15;
      __int16 v63 = 2112;
      v64 = v25;
      _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    a8 = v24;
  }
  if (a8)
  {
    id v15 = v15;
    uint64_t v27 = 0;
    *a8 = v15;
  }
  else
  {
    uint64_t v27 = 0;
  }
LABEL_42:

  return v27;
}

+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneName:ownerName:accountDSID:salted:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13) {
    [NSString stringWithFormat:@"%@:%@/%@", v12, v13, v11];
  }
  else {
  id v15 = [NSString stringWithFormat:@"%@/%@", v12, v11, v20];
  }
  uint64_t v16 = v15;
  if (a7)
  {
    v17 = objc_msgSend(v11, "brc_SHA1WithSalt:", v14);
    id v18 = [v16 stringByAppendingPathComponent:v17];
  }
  else
  {
    id v18 = v15;
  }

  return v18;
}

+ (void)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:saltAccountDSID:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: should have an accountID to salt with%@", (uint8_t *)&v2, 0xCu);
}

@end