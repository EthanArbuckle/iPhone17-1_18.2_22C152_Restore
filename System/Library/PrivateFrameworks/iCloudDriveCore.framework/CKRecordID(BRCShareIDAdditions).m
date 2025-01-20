@interface CKRecordID(BRCShareIDAdditions)
+ (id)brc_fetchShareIDWithSharedItem:()BRCShareIDAdditions;
- (BRCItemID)brc_shareItemID;
- (id)brc_collaborationIdentifierWithCachedCurrentUserRecordName:()BRCShareIDAdditions;
- (id)brc_shareZoneName;
- (id)initShareIDWithItemID:()BRCShareIDAdditions zoneID:;
- (uint64_t)initShareIDWithRecordID:()BRCShareIDAdditions serverZone:;
- (uint64_t)initShareIDWithRecordID:()BRCShareIDAdditions zoneID:session:;
- (uint64_t)initShareIDWithShareableItem:()BRCShareIDAdditions;
@end

@implementation CKRecordID(BRCShareIDAdditions)

- (id)initShareIDWithItemID:()BRCShareIDAdditions zoneID:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 itemIDString];
  if (v8)
  {
    a1 = (id)[a1 initWithRecordName:v8 zoneID:v7];
    id v9 = a1;
  }
  else
  {
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[CKRecordID(BRCShareIDAdditions) initShareIDWithItemID:zoneID:]();
    }

    id v9 = 0;
  }

  return v9;
}

- (uint64_t)initShareIDWithShareableItem:()BRCShareIDAdditions
{
  id v4 = a3;
  v5 = [v4 itemID];
  id v6 = [v4 serverZone];

  id v7 = [v6 zoneID];
  uint64_t v8 = [a1 initShareIDWithItemID:v5 zoneID:v7];

  return v8;
}

- (uint64_t)initShareIDWithRecordID:()BRCShareIDAdditions serverZone:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 zoneID];
  id v9 = [v6 session];

  uint64_t v10 = [a1 initShareIDWithRecordID:v7 zoneID:v8 session:v9];
  return v10;
}

- (uint64_t)initShareIDWithRecordID:()BRCShareIDAdditions zoneID:session:
{
  id v8 = a4;
  id v9 = objc_msgSend(a3, "brc_itemIDWithSession:", a5);
  uint64_t v10 = [a1 initShareIDWithItemID:v9 zoneID:v8];

  return v10;
}

- (id)brc_shareZoneName
{
  v1 = [a1 zoneID];
  v2 = [v1 zoneName];

  return v2;
}

- (BRCItemID)brc_shareItemID
{
  v1 = [a1 recordName];
  v2 = [[BRCItemID alloc] initWithUUIDString:v1];

  return v2;
}

+ (id)brc_fetchShareIDWithSharedItem:()BRCShareIDAdditions
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 db];
  [v4 assertOnQueue];

  if (([v3 sharingOptions] & 4) != 0)
  {
    id v25 = objc_alloc(MEMORY[0x263EFD7E8]);
    v26 = [v3 asShareableItem];
    v24 = (void *)[v25 initShareIDWithShareableItem:v26];

    goto LABEL_14;
  }
  if (([v3 sharingOptions] & 0x48) == 0)
  {
    v5 = [v3 clientZone];
    int v6 = [v5 isSharedZone];

    if (!v6)
    {
      v24 = 0;
      goto LABEL_14;
    }
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] No share options set on an item which is clearly shared%@", buf, 0xCu);
    }
  }
  id v9 = [v3 appLibrary];
  uint64_t v10 = [v9 mangledID];
  v11 = +[BRCUserDefaults defaultsForMangledID:v10];
  uint64_t v12 = [v11 maxSyncPathDepth];

  v13 = [v3 db];
  v14 = [v3 st];
  v15 = [v14 parentID];
  v16 = [v3 clientZone];
  v17 = [v16 dbRowID];
  v18 = [v3 clientZone];
  v19 = [v18 dbRowID];
  v20 = (void *)[v13 itemIDWithSQL:@" WITH RECURSIVE item_parents (item_id, item_sharing_options, item_parent_id) AS(         SELECT item_id, item_sharing_options, item_parent_id FROM client_items           WHERE item_id = %@ AND zone_rowid = %@       UNION ALL          SELECT li.item_id, li.item_sharing_options, li.item_parent_id FROM client_items AS li     INNER JOIN item_parents AS p WHERE li.zone_rowid = %@ AND p.item_parent_id = li.item_id          LIMIT %u)        SELECT item_id FROM item_parents WHERE (item_sharing_options & 4) != 0", v15, v17, v19, v12];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x263EFD7E8]);
    v22 = [v3 serverZone];
    v23 = [v22 zoneID];
    v24 = (void *)[v21 initShareIDWithItemID:v20 zoneID:v23];
  }
  else
  {
    v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
      +[CKRecordID(BRCShareIDAdditions) brc_fetchShareIDWithSharedItem:]();
    }
    v24 = 0;
  }

LABEL_14:
  return v24;
}

- (id)brc_collaborationIdentifierWithCachedCurrentUserRecordName:()BRCShareIDAdditions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 zoneID];
  int v6 = [v5 zoneName];

  id v7 = [a1 recordName];
  id v8 = [a1 zoneID];
  id v9 = [v8 ownerName];
  char v10 = [v9 isEqualToString:*MEMORY[0x263EFD488]];

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = [a1 zoneID];
    id v11 = [v12 ownerName];

    goto LABEL_5;
  }
  if (v4)
  {
    id v11 = v4;
LABEL_5:
    v13 = [NSString stringWithFormat:@"%@_%@_%@", v6, v7, v11];
    goto LABEL_6;
  }
  brc_bread_crumbs();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = a1;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] No collaboration identifier can be computed yet for %@%@", buf, 0x16u);
  }

  v13 = 0;
LABEL_6:

  return v13;
}

- (void)initShareIDWithItemID:()BRCShareIDAdditions zoneID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: itemID %@ has no share name%@", v1, 0x16u);
}

+ (void)brc_fetchShareIDWithSharedItem:()BRCShareIDAdditions .cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Couldn't find root share for %@%@", v1, 0x16u);
}

@end