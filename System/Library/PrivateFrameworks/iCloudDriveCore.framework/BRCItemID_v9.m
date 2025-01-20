@interface BRCItemID_v9
+ (id)newFromSqliteValue:(sqlite3_value *)a3;
- (BRCItemID_v9)initWithRootObject:(RootItemObject *)a3;
- (BRCItemID_v9)initWithUUID:(const char *)a3;
- (BRCItemID_v9)initWithUUIDObject:(_UUIDItemObject_OLD *)a3;
- (id)_initAsLibraryRootWithAppLibraryRowID:(id)a3 enclosureUUID:(id)a4;
- (id)itemIDString;
- (void)itemIDString;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
@end

@implementation BRCItemID_v9

- (id)itemIDString
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v11, 0, sizeof(v11));
  p_int kind = &self->_kind;
  int kind = self->_kind;
  v5 = @"root";
  switch(kind)
  {
    case 0:
    case 4:
      uuid_unparse_upper(self->_uuid, v11);
      v5 = (__CFString *)[[NSString alloc] initWithBytes:v11 length:36 encoding:4];
      break;
    case 1:
    case 5:
      break;
    case 2:
      v5 = @"documents";
      break;
    case 3:
      v8 = brc_bread_crumbs();
      v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID_v9 itemIDString]();
      }

      goto LABEL_10;
    default:
      v6 = brc_bread_crumbs();
      v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        [(BRCItemID_v9 *)p_kind itemIDString];
      }

LABEL_10:
      v5 = 0;
      break;
  }
  return v5;
}

- (BRCItemID_v9)initWithUUID:(const char *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCItemID_v9;
  result = [(BRCItemID_v9 *)&v5 init];
  if (result)
  {
    result->_int kind = 0;
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
  }
  return result;
}

- (BRCItemID_v9)initWithRootObject:(RootItemObject *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BRCItemID_v9;
  v4 = [(BRCItemID_v9 *)&v11 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_int kind = a3->var0;
    uint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(&a3->var0 + 1)];
    appLibraryRowID = v5->_appLibraryRowID;
    v5->_appLibraryRowID = (BRCALRowID *)v6;

    if (a3->var0 - 3 <= 0xFFFFFFFD)
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID_v9 initWithRootObject:]();
      }
    }
  }
  return v5;
}

- (BRCItemID_v9)initWithUUIDObject:(_UUIDItemObject_OLD *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BRCItemID_v9;
  v4 = [(BRCItemID_v9 *)&v11 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_int kind = a3->var0;
    uint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(&a3->var0 + 1)];
    appLibraryRowID = v5->_appLibraryRowID;
    v5->_appLibraryRowID = (BRCALRowID *)v6;

    *(_OWORD *)v5->_uuid = *(_OWORD *)((char *)&a3->var1 + 1);
    if (a3->var0 - 6 <= 0xFFFFFFFD)
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID_v9 initWithUUIDObject:]();
      }
    }
  }
  return v5;
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  *(void *)&v24[13] = *MEMORY[0x263EF8340];
  int v4 = sqlite3_value_type(a3);
  if (v4 == 5) {
    return 0;
  }
  int v5 = v4;
  if (v4 != 4)
  {
    v10 = sqlite3_value_text(a3);
    int v11 = sqlite3_value_bytes(a3);
    uint64_t v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:v11];
      int v21 = 138412802;
      v22 = v19;
      __int16 v23 = 1024;
      *(_DWORD *)v24 = v5;
      v24[2] = 2112;
      *(void *)&v24[3] = v12;
      _os_log_fault_impl(&dword_23FA42000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unmigrated? invalid BRCItemID (%@) - %d%@", (uint8_t *)&v21, 0x1Cu);
    }
    return 0;
  }
  uint64_t v6 = sqlite3_value_blob(a3);
  int v7 = sqlite3_value_bytes(a3);
  if (v7 == 16)
  {
    v8 = [BRCItemID_v9 alloc];
    return [(BRCItemID_v9 *)v8 initWithUUID:v6];
  }
  int v14 = v7;
  if (v7 != 21)
  {
    if (v7 == 5)
    {
      v15 = [BRCItemID_v9 alloc];
      return [(BRCItemID_v9 *)v15 initWithRootObject:v6];
    }
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v20 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 length:v14];
      int v21 = 138412546;
      v22 = v20;
      __int16 v23 = 2112;
      *(void *)v24 = v17;
      _os_log_fault_impl(&dword_23FA42000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid BRCItemID (%@)%@", (uint8_t *)&v21, 0x16u);
    }
    return 0;
  }
  v16 = [BRCItemID_v9 alloc];
  return [(BRCItemID_v9 *)v16 initWithUUIDObject:v6];
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(v17, 0, 5);
  memset(v18, 0, 21);
  switch(self->_kind)
  {
    case 0u:
      sqlite3_bind_blob(a3, a4, self->_uuid, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      return;
    case 1u:
      LOBYTE(v17[0]) = 1;
      *(_DWORD *)((char *)v17 + 1) = [(BRCALRowID *)self->_appLibraryRowID intValue];
      if (*(_DWORD *)((char *)v17 + 1)) {
        goto LABEL_11;
      }
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      goto LABEL_22;
    case 2u:
      LOBYTE(v17[0]) = 2;
      *(_DWORD *)((char *)v17 + 1) = [(BRCALRowID *)self->_appLibraryRowID intValue];
      if (!*(_DWORD *)((char *)v17 + 1))
      {
        v9 = brc_bread_crumbs();
        v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
LABEL_22:
        }
          -[BRCItemID_v9 sqliteBind:index:]();
LABEL_23:
      }
LABEL_11:
      int v11 = v17;
      uint64_t v12 = a3;
      int v13 = a4;
      int v14 = 5;
      goto LABEL_20;
    case 3u:
      int v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID_v9 itemIDString]();
      }
      goto LABEL_14;
    case 4u:
      v18[0] = 4;
      *(_DWORD *)&v18[1] = [(BRCALRowID *)self->_appLibraryRowID intValue];
      if (*(_DWORD *)&v18[1]) {
        goto LABEL_19;
      }
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_25;
      }
      goto LABEL_26;
    case 5u:
      v18[0] = 5;
      *(_DWORD *)&v18[1] = [(BRCALRowID *)self->_appLibraryRowID intValue];
      if (*(_DWORD *)&v18[1]) {
        goto LABEL_19;
      }
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
LABEL_25:
      }
        -[BRCItemID_v9 sqliteBind:index:].cold.4();
LABEL_26:

LABEL_19:
      *(_OWORD *)&v18[5] = *(_OWORD *)self->_uuid;
      int v11 = v18;
      uint64_t v12 = a3;
      int v13 = a4;
      int v14 = 21;
LABEL_20:
      sqlite3_bind_blob(v12, v13, v11, v14, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      break;
    default:
      int v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID_v9 sqliteBind:index:]();
      }
LABEL_14:

      sqlite3_bind_null(a3, a4);
      break;
  }
}

- (id)_initAsLibraryRootWithAppLibraryRowID:(id)a3 enclosureUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BRCItemID_v9;
  v9 = [(BRCItemID_v9 *)&v18 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9)
  {
LABEL_10:
    int v13 = p_isa;
    goto LABEL_11;
  }
  if (!v8)
  {
    v9->_int kind = 1;
    goto LABEL_8;
  }
  v9->_int kind = 4;
  if (_br_parseUUIDString())
  {
LABEL_8:
    objc_storeStrong(p_isa + 1, a3);
    if (!v7 || ![v7 unsignedLongLongValue])
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"can't initialize library root with invalid library rowid %@", v7];
      objc_claimAutoreleasedReturnValue();
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      v17 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCItemID_v9 _initAsLibraryRootWithAppLibraryRowID:enclosureUUID:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseSchema.m", 340, v17);
    }
    goto LABEL_10;
  }
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[BRCItemID_v9 _initAsLibraryRootWithAppLibraryRowID:enclosureUUID:]();
  }

  int v13 = 0;
LABEL_11:

  return v13;
}

- (void).cxx_destruct
{
}

- (void)itemIDString
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: we should not have alias uuid types anymores%@", v2, v3, v4, v5, v6);
}

- (void)initWithRootObject:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: object->item_code == 1 || object->item_code == 2%@", v2, v3, v4, v5, v6);
}

- (void)initWithUUIDObject:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: object->item_code == 4 || object->item_code == 5%@", v2, v3, v4, v5, v6);
}

- (void)sqliteBind:index:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unknown itemID kind%@", v2, v3, v4, v5, v6);
}

- (void)sqliteBind:index:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: rio.app_lib_rowid%@", v2, v3, v4, v5, v6);
}

- (void)sqliteBind:index:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: uio.app_lib_rowid%@", v2, v3, v4, v5, v6);
}

- (void)_initAsLibraryRootWithAppLibraryRowID:enclosureUUID:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: invalid enclosure uuid - %@%@", v1);
}

@end