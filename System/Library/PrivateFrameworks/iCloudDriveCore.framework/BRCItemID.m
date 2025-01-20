@interface BRCItemID
+ (BOOL)isAppLibraryRootItemIDWithSQLiteValue:(sqlite3_value *)a3;
+ (BOOL)isDocumentsItemIDWithSQLiteValue:(sqlite3_value *)a3;
+ (BOOL)isRootItemIDWithSQLiteValue:(sqlite3_value *)a3;
+ (BOOL)isSharedZoneRootItemIDWithSQLiteValue:(sqlite3_value *)a3;
+ (BOOL)migrateItemIDsToVersion11WithDB:(id)a3 serverTruth:(BOOL)a4;
+ (BOOL)migrateItemIDsToVersion5WithDB:(id)a3 serverTruth:(BOOL)a4;
+ (BOOL)migrateItemIDsToVersion8WithDB:(id)a3 serverTruth:(BOOL)a4;
+ (BOOL)supportsSecureCoding;
+ (id)appLibraryRowIDFromRootOrDocumentsSQLiteValue:(sqlite3_value *)a3;
+ (id)defaultDesktopItemID;
+ (id)defaultDocumentsItemID;
+ (id)documentsItemIDWithAppLibraryRowID:(id)a3;
+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4;
+ (id)newFromSqliteValue:(sqlite3_value *)a3;
+ (id)parseMangledItemIDString:(id)a3 mangledID:(id *)a4 etag:(id *)a5 session:(id)a6;
+ (id)shareAliasRecordIDFromTargetItemID:(id)a3 zone:(id)a4 hasDerivedShareAlias:(BOOL)a5;
+ (id)structureRecordPrefixForItemType:(char)a3 targetZoneShared:(BOOL)a4;
- (BOOL)isDocumentsFolder;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemID:(id)a3;
- (BOOL)isNonDesktopRoot;
- (BOOL)isSharedZoneRoot;
- (BRCALRowID)appLibraryRowID;
- (BRCItemID)init;
- (BRCItemID)initWithCoder:(id)a3;
- (BRCItemID)initWithItemID:(id)a3;
- (BRCItemID)initWithRootObject:(RootItemObject *)a3;
- (BRCItemID)initWithString:(id)a3 libraryRowID:(id)a4 sharedZoneRowID:(id)a5;
- (BRCItemID)initWithUUID:(const char *)a3;
- (BRCItemID)initWithUUIDString:(id)a3;
- (BRCZoneRowID)sharedZoneRowID;
- (NSString)itemIDString;
- (const)UTF8String;
- (id)_directoryRecordNameWithSession:(id)a3;
- (id)_initAsLibraryRootWithAppLibraryRowID:(id)a3;
- (id)_initAsZoneRootWithZoneRowID:(id)a3;
- (id)contentsRecordIDInZoneID:(id)a3;
- (id)debugItemIDString;
- (id)debugItemIDStringWithVerbose:(BOOL)a3;
- (id)derivedAliasItemIDWithOwnerName:(id)a3;
- (id)directoryReferenceInZone:(id)a3 action:(unint64_t)a4;
- (id)directoryStructureRecordIDInZone:(id)a3;
- (id)documentStructureRecordIDInZoneID:(id)a3;
- (id)initAsDocumentsWithAppLibraryRowID:(id)a3;
- (id)itemUUIDString;
- (id)pcsChainDocumentStructureReferenceInZoneID:(id)a3;
- (id)pcsChainParentReferenceInZone:(id)a3;
- (id)sideCarRecordIDWithZone:(id)a3;
- (id)sideCarRecordNameWithZone:(id)a3;
- (id)structureRecordIDForItemType:(char)a3 zone:(id)a4 aliasTargetZoneIsShared:(BOOL)a5;
- (id)validatingDirectoryReferenceInZone:(id)a3;
- (id)zoneUniqueItemIDStringWithSession:(id)a3;
- (unint64_t)hash;
- (void)appLibraryRowID;
- (void)encodeWithCoder:(id)a3;
- (void)sharedZoneRowID;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
@end

@implementation BRCItemID

- (id)contentsRecordIDInZoneID:(id)a3
{
  id v4 = a3;
  v5 = [(BRCItemID *)self itemIDString];
  v6 = [@"documentContent/" stringByAppendingString:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v6 zoneID:v4];
  return v7;
}

- (id)directoryStructureRecordIDInZone:(id)a3
{
  id v4 = a3;
  v5 = [v4 session];
  v6 = [(BRCItemID *)self _directoryRecordNameWithSession:v5];

  id v7 = objc_alloc(MEMORY[0x263EFD7E8]);
  v8 = [v4 zoneID];

  v9 = (void *)[v7 initWithRecordName:v6 zoneID:v8];
  return v9;
}

- (id)documentStructureRecordIDInZoneID:(id)a3
{
  id v4 = a3;
  v5 = [(BRCItemID *)self itemIDString];
  v6 = [@"documentStructure/" stringByAppendingString:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v6 zoneID:v4];
  return v7;
}

- (id)validatingDirectoryReferenceInZone:(id)a3
{
  return [(BRCItemID *)self directoryReferenceInZone:a3 action:*MEMORY[0x263EFD528]];
}

- (id)pcsChainParentReferenceInZone:(id)a3
{
  return [(BRCItemID *)self directoryReferenceInZone:a3 action:0];
}

- (id)pcsChainDocumentStructureReferenceInZoneID:(id)a3
{
  id v4 = a3;
  v5 = [(BRCItemID *)self itemIDString];
  v6 = [@"documentStructure/" stringByAppendingString:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v6 zoneID:v4];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v7 action:0];

  return v8;
}

+ (id)structureRecordPrefixForItemType:(char)a3 targetZoneShared:(BOOL)a4
{
  id result = 0;
  switch(a3)
  {
    case -1:
      return result;
    case 0:
    case 4:
    case 9:
    case 10:
      id result = @"directory/";
      break;
    case 1:
    case 2:
    case 8:
      id result = @"documentStructure/";
      break;
    case 3:
      if (a4) {
        id result = @"shareAlias/";
      }
      else {
        id result = @"alias/";
      }
      break;
    case 5:
      id result = @"symlink/";
      break;
    case 6:
    case 7:
      id result = @"finderBookmark/";
      break;
    default:
      int v5 = a3;
      v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        +[BRCItemID(CKConversions) structureRecordPrefixForItemType:targetZoneShared:]((uint64_t)v6, v5, v7);
      }

      id result = 0;
      break;
  }
  return result;
}

+ (id)shareAliasRecordIDFromTargetItemID:(id)a3 zone:(id)a4 hasDerivedShareAlias:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 itemID];
  v10 = [v8 session];
  v11 = [v7 zoneRowID];
  v12 = [v10 serverZoneByRowID:v11];

  if (!a5)
  {
    v13 = [v7 itemID];
    v14 = [v12 ownerName];
    uint64_t v15 = [v13 derivedAliasItemIDWithOwnerName:v14];

    v9 = (void *)v15;
  }
  v16 = objc_msgSend(v9, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 3, v8, objc_msgSend(v12, "isSharedZone"));

  return v16;
}

- (id)structureRecordIDForItemType:(char)a3 zone:(id)a4 aliasTargetZoneIsShared:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a3;
  id v8 = a4;
  if (![(BRCItemID *)self isDocumentsFolder]
    && ![(BRCItemID *)self isNonDesktopRoot]
    || ![v8 isPrivateZone])
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v9 = [v8 session];
  v10 = [(BRCItemID *)self appLibraryRowID];
  v11 = [v9 appLibraryByRowID:v10];

  if (!v11)
  {
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:]();
    }

    goto LABEL_8;
  }
LABEL_9:
  if ([v11 wasMovedToCloudDocs]
    && [v8 isPrivateZone]
    && ([v11 isCloudDocsAppLibrary] & 1) == 0)
  {
    if ([(BRCItemID *)self isNonDesktopRoot])
    {
      v14 = [v11 appLibraryID];
      uint64_t v15 = @"directory/appData_";
LABEL_16:
      v16 = [(__CFString *)v15 stringByAppendingString:v14];
      goto LABEL_22;
    }
    if ([(BRCItemID *)self isDocumentsFolder])
    {
      v14 = [v11 appLibraryID];
      uint64_t v15 = @"directory/appDocuments_";
      goto LABEL_16;
    }
  }
  v14 = +[BRCItemID structureRecordPrefixForItemType:v6 targetZoneShared:v5];
  if (!v14)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:]();
    }
  }
  v19 = [(BRCItemID *)self itemIDString];
  v16 = [v14 stringByAppendingString:v19];

LABEL_22:
  id v20 = objc_alloc(MEMORY[0x263EFD7E8]);
  v21 = [v8 zoneID];
  v22 = (void *)[v20 initWithRecordName:v16 zoneID:v21];

  return v22;
}

- (id)sideCarRecordNameWithZone:(id)a3
{
  id v4 = [a3 ownerName];
  BOOL v5 = [v4 substringFromIndex:1];
  uint64_t v6 = [v5 substringToIndex:8];

  id v7 = [(BRCItemID *)self itemIDString];
  id v8 = [@"ppm_" stringByAppendingFormat:@"%@/%@", v6, v7];

  return v8;
}

- (id)sideCarRecordIDWithZone:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFD808];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "brc_sideCarZoneID");
  id v7 = [(BRCItemID *)self sideCarRecordNameWithZone:v5];

  id v8 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v7 zoneID:v6];
  return v8;
}

- (id)_directoryRecordNameWithSession:(id)a3
{
  id v4 = a3;
  if (![(BRCItemID *)self isDocumentsFolder]
    && (![(BRCItemID *)self isNonDesktopRoot]
     || [(BRCItemID *)self isSharedZoneRoot]))
  {
    goto LABEL_13;
  }
  id v5 = [(BRCItemID *)self appLibraryRowID];
  uint64_t v6 = [v4 appLibraryByRowID:v5];

  if ([v6 wasMovedToCloudDocs] && (objc_msgSend(v6, "isCloudDocsAppLibrary") & 1) == 0)
  {
    if ([(BRCItemID *)self isDocumentsFolder])
    {
      id v7 = [v6 appLibraryID];
      id v8 = @"directory/appDocuments_";
LABEL_11:
      v9 = [(__CFString *)v8 stringByAppendingString:v7];

      goto LABEL_14;
    }
    if ([(BRCItemID *)self isNonDesktopRoot])
    {
      id v7 = [v6 appLibraryID];
      id v8 = @"directory/appData_";
      goto LABEL_11;
    }
  }

LABEL_13:
  uint64_t v6 = [(BRCItemID *)self itemIDString];
  v9 = [@"directory/" stringByAppendingString:v6];
LABEL_14:

  return v9;
}

- (id)directoryReferenceInZone:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 session];
  id v8 = [(BRCItemID *)self _directoryRecordNameWithSession:v7];

  id v9 = objc_alloc(MEMORY[0x263EFD7E8]);
  v10 = [v6 zoneID];

  v11 = (void *)[v9 initWithRecordName:v8 zoneID:v10];
  v12 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v11 action:a4];

  return v12;
}

- (BOOL)isNonDesktopRoot
{
  return (self->_kind & 0xFB) == 1;
}

- (BOOL)isDocumentsFolder
{
  return self->_kind == 2;
}

- (BOOL)isSharedZoneRoot
{
  return self->_kind == 5;
}

- (BRCALRowID)appLibraryRowID
{
  if (![(BRCItemID *)self isNonDesktopRoot]
    && ![(BRCItemID *)self isDocumentsFolder])
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID appLibraryRowID]();
    }
  }
  appLibraryRowID = self->_appLibraryRowID;
  return appLibraryRowID;
}

- (BRCZoneRowID)sharedZoneRowID
{
  if (![(BRCItemID *)self isSharedZoneRoot])
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID sharedZoneRowID]();
    }
  }
  zoneRowID = self->_zoneRowID;
  return zoneRowID;
}

- (id)itemUUIDString
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (self->_kind)
  {
    v2 = 0;
  }
  else
  {
    memset(v4, 0, sizeof(v4));
    uuid_unparse_upper(self->_uuid, v4);
    v2 = (void *)[[NSString alloc] initWithBytes:v4 length:36 encoding:1];
  }
  return v2;
}

- (id)zoneUniqueItemIDStringWithSession:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_appLibraryRowID)
  {
    id v6 = objc_msgSend(v4, "appLibraryByRowID:");
  }
  else
  {
    id v6 = 0;
  }
  if (self->_zoneRowID)
  {
    id v7 = objc_msgSend(v5, "serverZoneByRowID:");
    id v8 = [v7 clientZone];
  }
  else
  {
    id v8 = 0;
  }
  memset(v22, 0, 37);
  switch(self->_kind)
  {
    case 0u:
      uuid_unparse_upper(self->_uuid, v22);
      id v9 = (void *)[[NSString alloc] initWithBytes:v22 length:36 encoding:4];
      break;
    case 1u:
      if (!v6)
      {
        v18 = brc_bread_crumbs();
        v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:]();
        }
      }
      v10 = objc_msgSend(v6, "appLibraryID", *(_OWORD *)v22, *(void *)&v22[16], *(_OWORD *)&v22[24], v23);
      v11 = v10;
      v12 = BRCItemIDZoneRoot;
      goto LABEL_12;
    case 2u:
      v10 = objc_msgSend(v6, "appLibraryID", *(_OWORD *)v22, *(void *)&v22[16], *(_OWORD *)&v22[24], v23);
      v11 = v10;
      v12 = BRCItemIDDocuments;
LABEL_12:
      id v9 = [v10 stringByAppendingPathComponent:v12];
      goto LABEL_22;
    case 3u:
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID_v9 itemIDString]();
      }

      goto LABEL_19;
    case 5u:
      if (!v8)
      {
        id v20 = brc_bread_crumbs();
        v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          -[BRCItemID zoneUniqueItemIDStringWithSession:]();
        }
      }
      v11 = objc_msgSend(v8, "mangledID", *(_OWORD *)v22, *(void *)&v22[16], *(_OWORD *)&v22[24], v23);
      v16 = [v11 mangledIDString];
      id v9 = [v16 stringByAppendingPathComponent:BRCItemIDZoneRoot];

LABEL_22:
      break;
    default:
      v13 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID zoneUniqueItemIDStringWithSession:]();
      }

LABEL_19:
      id v9 = 0;
      break;
  }

  return v9;
}

- (NSString)itemIDString
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, sizeof(v9));
  switch(self->_kind)
  {
    case 0u:
      uuid_unparse_upper(self->_uuid, v9);
      v3 = (__CFString *)[[NSString alloc] initWithBytes:v9 length:36 encoding:4];
      goto LABEL_13;
    case 1u:
    case 5u:
      v2 = BRCItemIDZoneRoot;
      goto LABEL_5;
    case 2u:
      v2 = BRCItemIDDocuments;
LABEL_5:
      v3 = v2;
      goto LABEL_13;
    case 3u:
      id v4 = brc_bread_crumbs();
      uint64_t v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID_v9 itemIDString]();
      }

      goto LABEL_12;
    default:
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID zoneUniqueItemIDStringWithSession:]();
      }

LABEL_12:
      v3 = 0;
LABEL_13:
      return (NSString *)v3;
  }
}

- (id)debugItemIDString
{
  return [(BRCItemID *)self debugItemIDStringWithVerbose:0];
}

- (id)debugItemIDStringWithVerbose:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  memset(out, 0, 37);
  switch(self->_kind)
  {
    case 0u:
      uuid = self->_uuid;
      uint64_t v10 = out;
      uuid_unparse_upper(self->_uuid, out);
      if (a3)
      {
        uint64_t v11 = 36;
      }
      else
      {
        if (*(void *)uuid == 0x30000000000000) {
          uint64_t v11 = 17;
        }
        else {
          uint64_t v11 = 8;
        }
        uint64_t v13 = 19;
        if (*(void *)uuid != 0x30000000000000) {
          uint64_t v13 = 0;
        }
        uint64_t v10 = &out[v13];
      }
      id v7 = (void *)[[NSString alloc] initWithBytes:v10 length:v11 encoding:4];
      break;
    case 1u:
      v12 = BRCItemIDZoneRoot;
      goto LABEL_13;
    case 2u:
      v12 = BRCItemIDDocuments;
LABEL_13:
      [(__CFString *)v12 stringByAppendingFormat:@"[%llu]", [(BRCALRowID *)self->_appLibraryRowID unsignedLongLongValue]];
      goto LABEL_15;
    case 3u:
    case 4u:
      v3 = brc_bread_crumbs();
      id v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID debugItemIDStringWithVerbose:]();
      }

      goto LABEL_8;
    case 5u:
      objc_msgSend(BRCItemIDZoneRoot, "stringByAppendingFormat:", @"{%llu}", -[BRCZoneRowID unsignedLongLongValue](self->_zoneRowID, "unsignedLongLongValue", a3));
      id v7 = LABEL_15:;
      break;
    default:
      uint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID zoneUniqueItemIDStringWithSession:]();
      }

LABEL_8:
      id v7 = 0;
      break;
  }
  return v7;
}

- (const)UTF8String
{
  id v2 = [(BRCItemID *)self itemIDString];
  v3 = (const char *)[v2 UTF8String];

  return v3;
}

+ (id)documentsItemIDWithAppLibraryRowID:(id)a3
{
  id v3 = a3;
  if (!v3 || (id v4 = v3, ![v3 unsignedLongLongValue]))
  {
    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"invalid library rowid"];
    objc_claimAutoreleasedReturnValue();
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2();
    }

    brc_append_system_info_to_message();
    id v9 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("+[BRCItemID documentsItemIDWithAppLibraryRowID:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/items/BRCItemID.m", 232, v9);
  }
  int v11 = [v4 intValue];
  char v10 = 2;
  uint64_t v5 = [[BRCItemID alloc] initWithRootObject:&v10];

  return v5;
}

+ (id)defaultDesktopItemID
{
  id v2 = [BRCItemID alloc];
  id v3 = [(BRCItemID *)v2 initWithUUIDString:*MEMORY[0x263F324F8]];
  return v3;
}

+ (id)defaultDocumentsItemID
{
  id v2 = [BRCItemID alloc];
  id v3 = [(BRCItemID *)v2 initWithUUIDString:*MEMORY[0x263F32508]];
  return v3;
}

- (BOOL)isEqualToItemID:(id)a3
{
  id v4 = (BRCItemID *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && self->_kind == v4->_kind)
  {
    switch(self->_kind)
    {
      case 0u:
        LOBYTE(self) = *(void *)self->_uuid == *(void *)v4->_uuid
                    && *(void *)&self->_uuid[8] == *(void *)&v4->_uuid[8];
        break;
      case 1u:
      case 2u:
        appLibraryRowID = self->_appLibraryRowID;
        zoneRowID = v5->_appLibraryRowID;
        goto LABEL_19;
      case 3u:
      case 4u:
        id v8 = brc_bread_crumbs();
        id v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[BRCItemID isEqualToItemID:]();
        }

        goto LABEL_10;
      case 5u:
        appLibraryRowID = self->_zoneRowID;
        zoneRowID = v5->_zoneRowID;
LABEL_19:
        LOBYTE(self) = objc_msgSend(appLibraryRowID, "br_isEqualToNumber:", zoneRowID);
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_10:
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRCItemID *)self isEqualToItemID:v4];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_kind ^ 0x6C885475B6449F5DLL;
  switch(self->_kind)
  {
    case 0u:
      uint64_t v6 = 0;
      unint64_t v7 = 0xC53A6F2A5ADB4AA5;
      do
        unint64_t v7 = (33 * v7 + (v7 >> 59)) ^ self->_uuid[v6++];
      while (v6 != 16);
      unint64_t v2 = v7 ^ (33 * v2 + 13);
      break;
    case 1u:
    case 2u:
      appLibraryRowID = self->_appLibraryRowID;
      goto LABEL_10;
    case 3u:
    case 4u:
      id v4 = brc_bread_crumbs();
      BOOL v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID isEqualToItemID:]();
      }

      unint64_t v2 = 0;
      break;
    case 5u:
      appLibraryRowID = self->_zoneRowID;
LABEL_10:
      unint64_t v2 = [appLibraryRowID hash] ^ (33 * v2 + 13);
      break;
    default:
      return v2;
  }
  return v2;
}

- (BRCItemID)init
{
  v5.receiver = self;
  v5.super_class = (Class)BRCItemID;
  unint64_t v2 = [(BRCItemID *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    v2->_kind = 0;
    uuid_generate_random(v2->_uuid);
  }
  return v3;
}

- (BRCItemID)initWithString:(id)a3 libraryRowID:(id)a4 sharedZoneRowID:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  if ([v8 isEqualToString:BRCItemIDZoneRoot])
  {
    if (v9 | v10)
    {
      if (v9)
      {
        int v11 = [(BRCItemID *)self _initAsLibraryRootWithAppLibraryRowID:v9];
        goto LABEL_13;
      }
    }
    else
    {
      v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID initWithString:libraryRowID:sharedZoneRowID:]();
      }
    }
    int v11 = [(BRCItemID *)self _initAsZoneRootWithZoneRowID:v10];
    goto LABEL_13;
  }
  if ([v8 isEqualToString:BRCItemIDDocuments])
  {
    if (!v9)
    {
      uint64_t v16 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:]();
      }
    }
    int v11 = [(BRCItemID *)self initAsDocumentsWithAppLibraryRowID:v9];
  }
  else
  {
    int v11 = [(BRCItemID *)self initWithUUIDString:v8];
  }
LABEL_13:
  v14 = v11;

  return v14;
}

- (BRCItemID)initWithUUIDString:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = 0;
  v9[1] = 0;
  if (_br_parseUUIDString())
  {
    self = [(BRCItemID *)self initWithUUID:v9];
    objc_super v5 = self;
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    unint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID initWithUUIDString:](v4);
    }

    objc_super v5 = 0;
  }

  return v5;
}

- (id)_initAsLibraryRootWithAppLibraryRowID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemID;
  uint64_t v6 = [(BRCItemID *)&v12 init];
  unint64_t v7 = v6;
  if (!v6
    || (v6->_kind = 1, objc_storeStrong((id *)&v6->_appLibraryRowID, a3), v5)
    && [v5 unsignedLongLongValue])
  {
    id v8 = v7;
  }
  else
  {
    unint64_t v9 = brc_bread_crumbs();
    unint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (id)_initAsZoneRootWithZoneRowID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemID;
  uint64_t v6 = [(BRCItemID *)&v12 init];
  unint64_t v7 = v6;
  if (!v6
    || (v6->_kind = 5, objc_storeStrong((id *)&v6->_zoneRowID, a3), v5) && [v5 unsignedLongLongValue])
  {
    id v8 = v7;
  }
  else
  {
    unint64_t v9 = brc_bread_crumbs();
    unint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID _initAsZoneRootWithZoneRowID:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (id)initAsDocumentsWithAppLibraryRowID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemID;
  uint64_t v6 = [(BRCItemID *)&v12 init];
  unint64_t v7 = v6;
  if (!v6
    || (v6->_kind = 2, objc_storeStrong((id *)&v6->_appLibraryRowID, a3), v5)
    && [v5 unsignedLongLongValue])
  {
    id v8 = v7;
  }
  else
  {
    unint64_t v9 = brc_bread_crumbs();
    unint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID initAsDocumentsWithAppLibraryRowID:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (BRCItemID)initWithUUID:(const char *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCItemID;
  id result = [(BRCItemID *)&v5 init];
  if (result)
  {
    result->_kind = 0;
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
  }
  return result;
}

- (BRCItemID)initWithRootObject:(RootItemObject *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BRCItemID;
  id v4 = [(BRCItemID *)&v14 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_kind = a3->var0;
    int var0 = a3->var0;
    uint64_t v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(&a3->var0 + 1)];
    uint64_t v8 = 8;
    if (var0 == 5) {
      uint64_t v8 = 16;
    }
    unint64_t v9 = *(Class *)((char *)&v5->super.isa + v8);
    *(Class *)((char *)&v5->super.isa + v8) = (Class)v7;

    unsigned int v10 = a3->var0;
    if (v10 > 5 || ((1 << v10) & 0x26) == 0)
    {
      int v11 = brc_bread_crumbs();
      objc_super v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID initWithRootObject:]();
      }
    }
  }
  return v5;
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  *(void *)&v23[13] = *MEMORY[0x263EF8340];
  int v4 = sqlite3_value_type(a3);
  if (v4 == 5) {
    return 0;
  }
  int v5 = v4;
  if (v4 != 4)
  {
    unsigned int v10 = sqlite3_value_text(a3);
    int v11 = sqlite3_value_bytes(a3);
    objc_super v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v18 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:v11];
      int v20 = 138412802;
      v21 = v18;
      __int16 v22 = 1024;
      *(_DWORD *)uint64_t v23 = v5;
      v23[2] = 2112;
      *(void *)&v23[3] = v12;
      _os_log_fault_impl(&dword_23FA42000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unmigrated? invalid BRCItemID (%@) - %d%@", (uint8_t *)&v20, 0x1Cu);
    }
    return 0;
  }
  uint64_t v6 = sqlite3_value_blob(a3);
  int v7 = sqlite3_value_bytes(a3);
  if (v7 == 16)
  {
    uint64_t v8 = [BRCItemID alloc];
    return [(BRCItemID *)v8 initWithUUID:v6];
  }
  int v14 = v7;
  if (v7 != 5)
  {
    uint64_t v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 length:v14];
      int v20 = 138412546;
      v21 = v19;
      __int16 v22 = 2112;
      *(void *)uint64_t v23 = v16;
      _os_log_fault_impl(&dword_23FA42000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid BRCItemID (%@)%@", (uint8_t *)&v20, 0x16u);
    }
    return 0;
  }
  uint64_t v15 = [BRCItemID alloc];
  return [(BRCItemID *)v15 initWithRootObject:v6];
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  *(void *)&v23[13] = *MEMORY[0x263EF8340];
  int v6 = sqlite3_column_type(a3, a4);
  if (v6 == 5) {
    return 0;
  }
  int v7 = v6;
  if (v6 != 4)
  {
    objc_super v12 = sqlite3_column_text(a3, a4);
    int v13 = sqlite3_column_bytes(a3, a4);
    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v12 length:v13];
      int v20 = 138412802;
      v21 = v19;
      __int16 v22 = 1024;
      *(_DWORD *)uint64_t v23 = v7;
      v23[2] = 2112;
      *(void *)&v23[3] = v14;
      _os_log_fault_impl(&dword_23FA42000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unmigrated? invalid BRCItemID (%@) - %d%@", (uint8_t *)&v20, 0x1Cu);
    }
    goto LABEL_9;
  }
  uint64_t v8 = sqlite3_column_blob(a3, a4);
  int v9 = sqlite3_column_bytes(a3, a4);
  if (v9 == 16)
  {
    unsigned int v10 = [BRCItemID alloc];
    return [(BRCItemID *)v10 initWithUUID:v8];
  }
  int v16 = v9;
  if (v9 != 5)
  {
    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v18 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v16];
      int v20 = 138412546;
      v21 = v18;
      __int16 v22 = 2112;
      *(void *)uint64_t v23 = v14;
      _os_log_fault_impl(&dword_23FA42000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid BRCItemID (%@)%@", (uint8_t *)&v20, 0x16u);
    }
LABEL_9:

    return 0;
  }
  v17 = [BRCItemID alloc];
  return [(BRCItemID *)v17 initWithRootObject:v8];
}

+ (BOOL)isRootItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && (*(unsigned char *)sqlite3_value_blob(a3) & 0xFB) == 1;
}

+ (BOOL)isAppLibraryRootItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && *(unsigned char *)sqlite3_value_blob(a3) == 1;
}

+ (BOOL)isDocumentsItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && *(unsigned char *)sqlite3_value_blob(a3) == 2;
}

+ (BOOL)isSharedZoneRootItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && *(unsigned char *)sqlite3_value_blob(a3) == 5;
}

+ (id)appLibraryRowIDFromRootOrDocumentsSQLiteValue:(sqlite3_value *)a3
{
  if (sqlite3_value_type(a3) != 4
    || sqlite3_value_bytes(a3) != 5
    || !*(_DWORD *)((char *)sqlite3_value_blob(a3) + 1)
    || (objc_msgSend(NSNumber, "numberWithUnsignedInt:"),
        (int v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[BRCItemID appLibraryRowIDFromRootOrDocumentsSQLiteValue:]();
    }

    int v4 = 0;
  }
  return v4;
}

- (BRCItemID)initWithItemID:(id)a3
{
  int v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCItemID;
  int v5 = [(BRCItemID *)&v8 init];
  int v6 = v5;
  if (v5)
  {
    v5->_kind = v4[24];
    objc_storeStrong((id *)&v5->_appLibraryRowID, *((id *)v4 + 1));
    *(_OWORD *)v6->_uuid = *(_OWORD *)(v4 + 25);
  }

  return v6;
}

- (BRCItemID)initWithCoder:(id)a3
{
  uint64_t v12 = 0;
  id v4 = a3;
  uint64_t v5 = [v4 decodeBytesForKey:@"bytes" returnedLength:&v12];
  if (v12 == 16)
  {
    int v6 = [(BRCItemID *)self initWithUUID:v5];
LABEL_5:
    self = v6;
    objc_super v8 = self;
    goto LABEL_9;
  }
  uint64_t v7 = [v4 decodeBytesForKey:@"root_object" returnedLength:&v12];
  if (v12 == 5)
  {
    int v6 = [(BRCItemID *)self initWithRootObject:v7];
    goto LABEL_5;
  }
  int v9 = brc_bread_crumbs();
  unsigned int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[BRCItemID initWithCoder:]();
  }

  objc_super v8 = 0;
LABEL_9:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  memset(v12, 0, 5);
  switch(self->_kind)
  {
    case 0u:
      uuid = self->_uuid;
      unsigned int v10 = @"bytes";
      uint64_t v11 = 16;
      goto LABEL_11;
    case 1u:
    case 2u:
      LOBYTE(v12[0]) = self->_kind;
      appLibraryRowID = self->_appLibraryRowID;
      goto LABEL_10;
    case 3u:
    case 4u:
      uint64_t v7 = brc_bread_crumbs();
      objc_super v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID isEqualToItemID:]();
      }
      goto LABEL_7;
    case 5u:
      LOBYTE(v12[0]) = 5;
      appLibraryRowID = self->_zoneRowID;
LABEL_10:
      *(_DWORD *)((char *)v12 + 1) = [appLibraryRowID intValue];
      unsigned int v10 = @"root_object";
      uuid = (unsigned __int8 *)v12;
      id v4 = v5;
      uint64_t v11 = 5;
LABEL_11:
      [v4 encodeBytes:uuid length:v11 forKey:v10];
      break;
    default:
      uint64_t v7 = brc_bread_crumbs();
      objc_super v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID encodeWithCoder:]();
      }
LABEL_7:

      break;
  }
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  memset(v10, 0, 5);
  switch(self->_kind)
  {
    case 0u:
      sqlite3_bind_blob(a3, a4, self->_uuid, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      return;
    case 1u:
      LOBYTE(v10[0]) = 1;
      *(_DWORD *)((char *)v10 + 1) = [(BRCALRowID *)self->_appLibraryRowID intValue];
      if (*(_DWORD *)((char *)v10 + 1)) {
        goto LABEL_17;
      }
      objc_super v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        goto LABEL_20;
      }
      goto LABEL_12;
    case 2u:
      LOBYTE(v10[0]) = 2;
      *(_DWORD *)((char *)v10 + 1) = [(BRCALRowID *)self->_appLibraryRowID intValue];
      if (*(_DWORD *)((char *)v10 + 1)) {
        goto LABEL_17;
      }
      objc_super v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
LABEL_12:
      }
        -[BRCItemID_v9 sqliteBind:index:]();
      goto LABEL_20;
    case 3u:
    case 4u:
      int v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID isEqualToItemID:]();
      }
      goto LABEL_6;
    case 5u:
      LOBYTE(v10[0]) = 5;
      *(_DWORD *)((char *)v10 + 1) = [(BRCZoneRowID *)self->_zoneRowID intValue];
      if (*(_DWORD *)((char *)v10 + 1)) {
        goto LABEL_17;
      }
      objc_super v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID sqliteBind:index:].cold.4();
      }
LABEL_20:

LABEL_17:
      sqlite3_bind_blob(a3, a4, v10, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      break;
    default:
      int v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID sqliteBind:index:]();
      }
LABEL_6:

      sqlite3_bind_null(a3, a4);
      break;
  }
}

- (id)derivedAliasItemIDWithOwnerName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_OWORD *)int v14 = 0u;
  id v4 = self;
  id v5 = a3;
  int v6 = [(BRCItemID *)v4 UTF8String];
  id v7 = v5;
  objc_super v8 = (const char *)[v7 UTF8String];

  CC_MD5_Init((CC_MD5_CTX *)&v13);
  CC_LONG v9 = strlen(v8);
  CC_MD5_Update((CC_MD5_CTX *)&v13, v8, v9);
  CC_LONG v10 = strlen(v6);
  CC_MD5_Update((CC_MD5_CTX *)&v13, v6, v10);
  CC_MD5_Final(md, (CC_MD5_CTX *)&v13);
  md[6] = md[6] & 0xF | 0x30;
  md[8] = md[8] & 0x3F | 0x80;
  uint64_t v11 = objc_alloc_init(BRCItemID);
  if (v11)
  {
    v11->_kind = 0;
    *(_OWORD *)v11->_uuid = *(_OWORD *)md;
  }
  return v11;
}

+ (id)parseMangledItemIDString:(id)a3 mangledID:(id *)a4 etag:(id *)a5 session:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [v9 componentsSeparatedByString:@"_"];
  uint64_t v12 = [v10 serverDB];

  long long v13 = [v12 serialQueue];
  dispatch_assert_queue_not_V2(v13);

  if ([v11 count] == 3)
  {
    int v14 = [v11 objectAtIndexedSubscript:0];
    uint64_t v15 = [v11 objectAtIndexedSubscript:1];
    uint64_t v16 = [v11 objectAtIndexedSubscript:2];
    v17 = [[BRCItemID alloc] initWithUUIDString:v15];
    v18 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithMangledString:v14];
    if (a4) {
      objc_storeStrong(a4, v18);
    }
    if (a5) {
      objc_storeStrong(a5, v16);
    }
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  if ([v11 count] == 4)
  {
    int v14 = [v11 objectAtIndexedSubscript:0];
    v19 = [v11 objectAtIndexedSubscript:1];
    v18 = [@"_" stringByAppendingString:v19];

    uint64_t v15 = [v11 objectAtIndexedSubscript:2];
    uint64_t v16 = [v11 objectAtIndexedSubscript:3];
    id v24 = v9;
    if ([v14 hasSuffix:@":"])
    {
      uint64_t v20 = [v14 substringToIndex:[v14 length] - 1];

      int v14 = v20;
    }
    v21 = [v14 stringByReplacingOccurrencesOfString:@"~" withString:@"."];
    __int16 v22 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithZoneName:v21 ownerName:v18];
    v17 = [[BRCItemID alloc] initWithUUIDString:v15];
    if (a4) {
      objc_storeStrong(a4, v22);
    }
    if (a5) {
      objc_storeStrong(a5, v16);
    }

    id v9 = v24;
    goto LABEL_14;
  }
  if ([v11 count] != 1)
  {
    uint64_t v15 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[BRCItemID parseMangledItemIDString:mangledID:etag:session:](v9);
    }
    v17 = 0;
    goto LABEL_15;
  }
  v17 = 0;
LABEL_16:

  return v17;
}

+ (BOOL)migrateItemIDsToVersion5WithDB:(id)a3 serverTruth:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v4) {
    int v6 = @"server_items";
  }
  else {
    int v6 = @"client_items";
  }
  if (v4) {
    id v7 = @"server_zones";
  }
  else {
    id v7 = @"client_zones";
  }
  objc_super v8 = [MEMORY[0x263F8C718] nameWithString:v6];
  id v9 = [MEMORY[0x263F8C718] nameWithString:v7];
  id v10 = (void *)[v5 fetch:@"SELECT rowid FROM %@ WHERE zone_owner != %@", v9, *MEMORY[0x263EFD488]];
  if ([v10 next])
  {
    BOOL v21 = v4;
    char v11 = 1;
    do
    {
      uint64_t v12 = [v10 numberAtIndex:0];
      int v25 = 0;
      char v24 = 1;
      int v25 = [v12 intValue];
      if (!v25)
      {
        uint64_t v16 = brc_bread_crumbs();
        v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v16;
          _os_log_fault_impl(&dword_23FA42000, v17, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rio.app_lib_rowid%@", buf, 0xCu);
        }
      }
      long long v13 = [[BRCItemID alloc] initWithRootObject:&v24];
      if (v11)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke;
        v22[3] = &unk_26507F148;
        id v14 = v12;
        id v23 = v14;
        uint64_t v15 = (void *)MEMORY[0x2455D9A50](v22);
        char v11 = [v5 execute:@"UPDATE %@ SET item_id = call_block(%@, item_id), item_parent_id = %@ WHERE zone_rowid = %@", v8, v15, v13, v14];
      }
      else
      {
        char v11 = 0;
      }
    }
    while (([v10 next] & 1) != 0);
    [v10 close];
    LOBYTE(v4) = v21;
    if ((v11 & 1) == 0) {
      goto LABEL_26;
    }
  }
  else
  {
    [v10 close];
  }
  if (![v5 execute:@"UPDATE %@ SET item_id = call_block(%@, item_id, zone_rowid) WHERE item_type = 3", v8, &__block_literal_global_34]|| !objc_msgSend(v5, "execute:", @"UPDATE %@ SET item_parent_id = call_block(%@, zone_rowid) WHERE item_parent_id = \"root\", v8, &__block_literal_global_65)|| !objc_msgSend(v5, "execute:", @"UPDATE %@ SET item_parent_id = call_block(%@, zone_rowid) WHERE item_parent_id = \"documents\", v8, &__block_literal_global_68))
  {
LABEL_26:
    char v19 = 0;
    goto LABEL_27;
  }
  int v18 = [v5 execute:@"UPDATE %@ SET item_id = call_block(%@, zone_rowid) WHERE item_id = \"documents\"", v8, &__block_literal_global_68];
  char v19 = v4 & v18;
  if (!v4 && v18) {
    char v19 = [v5 execute:@"UPDATE client_unapplied_table SET item_id = call_block(%@, zone_rowid) WHERE item_id = \"documents\"", &__block_literal_global_68];
  }
LABEL_27:

  return v19;
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 != 1)
  {
    objc_super v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  id v7 = (long long *)sqlite3_value_blob(*a4);
  if (sqlite3_value_bytes(*a4) == 16)
  {
    char v14 = 4;
    int v15 = [*(id *)(a1 + 32) intValue];
    long long v16 = *v7;
    sqlite3_result_blob(a2, &v14, 21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    id v10 = brc_bread_crumbs();
    char v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_2();
    }

    uint64_t v12 = brc_bread_crumbs();
    long long v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1();
    }

    sqlite3_result_null(a2);
  }
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_59(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 != 2)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __br_update_tables_30_000_block_invoke_2_cold_2();
    }
  }
  int v6 = (long long *)sqlite3_value_blob(*a4);
  int v7 = sqlite3_value_bytes(*a4);
  int v8 = sqlite3_value_int(a4[1]);
  if (v7 == 16)
  {
    char v15 = 3;
    int v16 = v8;
    long long v17 = *v6;
    sqlite3_result_blob(a2, &v15, 21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    char v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_2();
    }

    long long v13 = brc_bread_crumbs();
    char v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1();
    }

    sqlite3_result_null(a2);
  }
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_63(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    int v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  int v6 = sqlite3_value_int(*a4);
  char v9 = 1;
  int v10 = v6;
  sqlite3_result_blob(a2, &v9, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_66(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    int v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  int v6 = sqlite3_value_int(*a4);
  char v9 = 2;
  int v10 = v6;
  sqlite3_result_blob(a2, &v9, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (BOOL)migrateItemIDsToVersion8WithDB:(id)a3 serverTruth:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x263F8C718];
  id v6 = a3;
  if (v4) {
    int v7 = @"server_items";
  }
  else {
    int v7 = @"client_items";
  }
  int v8 = [v5 nameWithString:v7];
  char v9 = [v6 execute:@"UPDATE %@ SET item_id = call_block(%@, item_id) WHERE item_type = 3", v8, &__block_literal_global_82_0];

  return v9;
}

void __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    int v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  id v6 = (char *)sqlite3_value_blob(*a4);
  if (sqlite3_value_bytes(*a4) == 21)
  {
    sqlite3_result_blob(a2, v6 + 5, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    char v9 = brc_bread_crumbs();
    int v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_2();
    }

    char v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_1();
    }

    sqlite3_result_null(a2);
  }
}

+ (BOOL)migrateItemIDsToVersion11WithDB:(id)a3 serverTruth:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    id v6 = @"server_items";
  }
  else {
    id v6 = @"client_items";
  }
  if (v4) {
    int v7 = @"server_zones";
  }
  else {
    int v7 = @"client_zones";
  }
  int v8 = [MEMORY[0x263F8C718] nameWithString:v6];
  long long v17 = [MEMORY[0x263F8C718] nameWithString:v7];
  char v9 = (void *)[v5 fetch:@"SELECT rowid FROM %@ WHERE zone_owner != %@", v17, *MEMORY[0x263EFD488]];
  if ([v9 next])
  {
    char v10 = 1;
    do
    {
      char v11 = [v9 numberAtIndex:0];
      uint64_t v12 = v11;
      char v13 = 0;
      if (v10)
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_88;
        v18[3] = &unk_2650827B0;
        BOOL v20 = v4;
        id v14 = v11;
        id v19 = v14;
        char v15 = (void *)MEMORY[0x2455D9A50](v18);
        char v13 = [v5 execute:@"UPDATE %@ SET item_id = call_block(%@, item_id), item_parent_id = call_block(%@, item_parent_id) WHERE zone_rowid = %@", v8, &__block_literal_global_87, v15, v14];
      }
      char v10 = v13;
    }
    while (([v9 next] & 1) != 0);
  }
  else
  {
    char v13 = 1;
  }
  [v9 close];

  return v13;
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 != 1)
  {
    int v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  id v6 = (char *)sqlite3_value_blob(*a4);
  if (sqlite3_value_bytes(*a4) == 21)
  {
    if (*v6 != 4)
    {
      char v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_cold_1();
      }
    }
    long long v15 = *(_OWORD *)(v6 + 5);
    sqlite3_result_blob(a2, &v15, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    char v9 = brc_bread_crumbs();
    char v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_2();
    }

    char v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1();
    }

    sqlite3_result_null(a2);
  }
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_88(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    id v14 = brc_bread_crumbs();
    long long v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  int v7 = sqlite3_value_bytes(*a4);
  int v8 = (char *)sqlite3_value_blob(*a4);
  char v9 = v8;
  if (*(unsigned char *)(a1 + 40))
  {
    if (v7 != 21 || *v8 != 5)
    {
      uint64_t v12 = brc_bread_crumbs();
      char v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_88_cold_1();
      }
    }
    char v16 = 5;
    int v17 = [*(id *)(a1 + 32) intValue];
    char v9 = &v16;
    char v10 = a2;
    int v11 = 5;
  }
  else
  {
    char v10 = a2;
    int v11 = v7;
  }
  sqlite3_result_blob(v10, v9, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_appLibraryRowID, 0);
}

- (void)appLibraryRowID
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isNonDesktopRoot || self.isDocumentsFolder%@", v2, v3, v4, v5, v6);
}

- (void)sharedZoneRowID
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isSharedZoneRoot%@", v2, v3, v4, v5, v6);
}

- (void)zoneUniqueItemIDStringWithSession:.cold.1()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_11_1(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unknown itemID type %d%@");
}

- (void)zoneUniqueItemIDStringWithSession:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sharedZone%@", v2, v3, v4, v5, v6);
}

- (void)debugItemIDStringWithVerbose:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: we should not have alias or share uuid types anymores%@", v2, v3, v4, v5, v6);
}

- (void)isEqualToItemID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: we should not have alias or shared uuid types anymores%@", v2, v3, v4, v5, v6);
}

- (void)initWithString:libraryRowID:sharedZoneRowID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: libraryRowID || sharedZoneRowID%@", v2, v3, v4, v5, v6);
}

- (void)initWithUUIDString:(void *)a1 .cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: invalid UUID: %s%@", v3, v4, v5, v6, v7);
}

- (void)_initAsLibraryRootWithAppLibraryRowID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't initialize library root with invalid library rowid %@%@");
}

- (void)_initAsZoneRootWithZoneRowID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't initialize shared zone root with invalid zone rowid %@%@");
}

- (void)initAsDocumentsWithAppLibraryRowID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't initialize document with invalid library rowid %@%@");
}

- (void)initWithRootObject:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: object->item_code == BRCItemIDCodeDocuments || object->item_code == BRCItemIDCodeZoneRoot || object->item_code == BRCItemIDCodeSharedZoneRoot%@", v2, v3, v4, v5, v6);
}

+ (void)appLibraryRowIDFromRootOrDocumentsSQLiteValue:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: appLibraryRowID%@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: decoding an unknown kind of itemid%@", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: encoding an item id with an unknown kind%@", v2, v3, v4, v5, v6);
}

- (void)sqliteBind:index:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unknown itemID kind%@", v2, v3, v4, v5, v6);
}

- (void)sqliteBind:index:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: rio.zone_rowid%@", v2, v3, v4, v5, v6);
}

+ (void)parseMangledItemIDString:(void *)a1 mangledID:etag:session:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: unparsable mangled itemID: %s%@", v3, v4, v5, v6, v7);
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Invalid Shared ItemID%@", v2, v3, v4, v5, v6);
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: len == sizeof(uuid_t)%@", v2, v3, v4, v5, v6);
}

void __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Invalid Alias ItemID%@", v2, v3, v4, v5, v6);
}

void __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: len == sizeof(_UUIDItemObject_OLD)%@", v2, v3, v4, v5, v6);
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: p->item_code == _UNUSED_BRCItemIDCodeSharedUUID%@", v2, v3, v4, v5, v6);
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_88_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: len == sizeof(_UUIDItemObject_OLD) && ((_UUIDItemObject_OLD*)blob)->item_code == BRCItemIDCodeSharedZoneRoot%@", v2, v3, v4, v5, v6);
}

@end