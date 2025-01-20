@interface BRCPrivateServerZone
- (BOOL)isPrivateZone;
- (BOOL)isSharedZone;
- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BRCPrivateClientZone)clientZone;
- (BRCZonePurgeOperation)deleteAllContentsOperation;
- (NSError)deleteAllContentsOperationLastError;
- (id)itemByParentID:(id)a3 andName:(id)a4;
- (void)_checkResultSetIsEmpty:(id)a3 logToFile:(__sFILE *)a4 reason:(id)a5 result:(BOOL *)a6;
- (void)activateWithClientZone:(id)a3 offline:(BOOL)a4;
- (void)deleteAllContentsOnServerWithCompletionBlock:(id)a3;
@end

@implementation BRCPrivateServerZone

- (BOOL)isPrivateZone
{
  return 1;
}

- (BOOL)isSharedZone
{
  return 0;
}

- (BRCPrivateClientZone)clientZone
{
  return (BRCPrivateClientZone *)[(BRCClientZone *)self->super._clientZone asPrivateClientZone];
}

- (void)activateWithClientZone:(id)a3 offline:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCPrivateServerZone;
  [(BRCServerZone *)&v10 activateWithClientZone:v6 offline:v4];
  if ([(BRCServerZone *)self hasFetchedRecentsAndFavorites]
    && ([(BRCServerZone *)self state] & 4) == 0
    && ![(BRCClientZone *)self->super._clientZone isSyncBlocked]
    && !v4)
  {
    v7 = [(BRCAccountSessionFPFS *)self->super._session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__BRCPrivateServerZone_activateWithClientZone_offline___block_invoke;
    block[3] = &unk_26507ED70;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

void __55__BRCPrivateServerZone_activateWithClientZone_offline___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone", 0);
  v2 = [v1 appLibraries];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 fetchPristineness];
        [v7 scheduleFullLibraryContentsFetch];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BRCZonePurgeOperation)deleteAllContentsOperation
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_deleteAllContentsOperation;
  objc_sync_exit(v2);

  return v3;
}

- (NSError)deleteAllContentsOperationLastError
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_deleteAllContentsOperationLastError;
  objc_sync_exit(v2);

  return v3;
}

- (void)deleteAllContentsOnServerWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[BRCZonePurgeOperation alloc] initWithServerZone:self sessionContext:self->super._session];
  id v6 = objc_msgSend(MEMORY[0x263EFD780], "br_purge");
  [(_BRCOperation *)v5 setGroup:v6];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __69__BRCPrivateServerZone_deleteAllContentsOnServerWithCompletionBlock___block_invoke;
  v14 = &unk_265081958;
  v15 = self;
  id v16 = v4;
  id v7 = v4;
  [(_BRCOperation *)v5 setFinishBlock:&v11];
  long long v8 = self;
  objc_sync_enter(v8);
  deleteAllContentsOperation = v8->_deleteAllContentsOperation;
  v8->_deleteAllContentsOperation = v5;
  long long v10 = v5;

  objc_sync_exit(v8);
  [(_BRCOperation *)v10 schedule];
}

void __69__BRCPrivateServerZone_deleteAllContentsOnServerWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = v4;
  id v10 = v4;

  objc_sync_exit(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)itemByParentID:(id)a3 andName:(id)a4
{
  db = self->super._db;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__BRCPrivateServerZone_itemByParentID_andName___block_invoke;
  v7[3] = &unk_26507F1E8;
  v7[4] = self;
  id v5 = [(BRCPQLConnection *)db fetchObject:v7, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@", a3, a4, self->super._dbRowID sql];
  return v5;
}

id __47__BRCPrivateServerZone_itemByParentID_andName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 session];
  id v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (void)_checkResultSetIsEmpty:(id)a3 logToFile:(__sFILE *)a4 reason:(id)a5 result:(BOOL *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v9 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        *a6 = 0;
        fprintf(a4, "itemID %s %s\n", (const char *)[v16 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  v17 = [v9 error];

  if (v17)
  {
    *a6 = 0;
    v18 = [v9 error];
    id v19 = [v18 description];
    fprintf(a4, "SQL error: %s\n", (const char *)[v19 UTF8String]);
  }
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v6 = a4;
  char v20 = 1;
  id v7 = [(BRCPrivateServerZone *)self clientZone];
  uint64_t v8 = [v7 defaultAppLibrary];
  id v9 = [v8 rootItemID];

  if (([v6 execute:@"DROP TABLE IF EXISTS items_checks"] & 1) != 0
    && ([v6 execute:@"CREATE TABLE items_checks (item_id blob PRIMARY KEY, depth integer not null)"] & 1) != 0&& (objc_msgSend(v6, "execute:", @"CREATE INDEX items_checks__depth__idx ON items_checks (depth)") & 1) != 0&& (fprintf(a3, "server truth structure validation (%s)\n=================================\n", -[NSString UTF8String](self->super._zoneName, "UTF8String")), objc_msgSend(v6, "execute:", @"INSERT INTO items_checks (item_id, depth) VALUES (%@, 0)", v9)))
  {
    uint64_t v10 = 0;
    while ([v6 changes])
    {
      char v11 = [v6 execute:@"INSERT INTO items_checks    SELECT c.item_id, %lld      FROM items_checks AS p INNER JOIN server_items AS c ON (p.item_id = c.item_parent_id)     WHERE zone_rowid = %@ AND p.depth = %lld", v10 + 1, self->super._dbRowID, v10];
      ++v10;
      if ((v11 & 1) == 0) {
        goto LABEL_8;
      }
    }
    id v16 = (void *)[v6 fetch:@"SELECT item_id FROM server_items WHERE zone_rowid = %@ AND item_id NOT IN(SELECT item_id FROM items_checks)", self->super._dbRowID];
    [(BRCPrivateServerZone *)self _checkResultSetIsEmpty:v16 logToFile:a3 reason:@"is an orphan or part of a cycle" result:&v20];
    v17 = (void *)[v6 fetch:@"SELECT c.item_id      FROM server_items AS c INNER JOIN server_items AS p ON (c.zone_rowid = p.zone_rowid AND c.item_parent_id = p.item_id)     WHERE c.zone_rowid = %@ AND c.item_state = 0       AND p.item_state = 1", self->super._dbRowID];

    [(BRCPrivateServerZone *)self _checkResultSetIsEmpty:v17 logToFile:a3 reason:@"is a live item parented to a tombstone" result:&v20];
    v18 = (void *)[v6 fetch:@"SELECT c.item_id      FROM server_items AS c INNER JOIN server_items AS p ON (c.zone_rowid = p.zone_rowid AND c.item_parent_id = p.item_id)     WHERE c.zone_rowid = %@       AND p.item_type NOT IN (1, 2, 8, 5, 6, 7, 3)", self->super._dbRowID];

    [(BRCPrivateServerZone *)self _checkResultSetIsEmpty:v18 logToFile:a3 reason:@"is parented to a document" result:&v20];
    id v19 = (void *)[v6 fetch:@"SELECT c.item_id      FROM server_items AS c INNER JOIN server_items AS p ON (c.zone_rowid = p.zone_rowid AND c.item_parent_id = p.item_id)     WHERE c.zone_rowid = %@ AND c.item_rank >= p.item_rank       AND p.item_state = 1", self->super._dbRowID];

    [(BRCPrivateServerZone *)self _checkResultSetIsEmpty:v19 logToFile:a3 reason:@"is an item with a greater rank than a dead parent" result:&v20];
    if (v20) {
      fputs("OK\n", a3);
    }
    fputc(10, a3);
    BOOL v14 = v20 != 0;
  }
  else
  {
LABEL_8:
    uint64_t v12 = [v6 lastError];
    id v13 = [v12 description];
    fprintf(a3, "SQL error: %s\n", (const char *)[v13 UTF8String]);

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  fprintf(a3, "server items checks (%s)\n===================\n", [(NSString *)self->super._zoneName UTF8String]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(BRCServerZone *)self itemsEnumeratorWithDB:v6];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8)
  {

LABEL_11:
    fputs("OK\n", a3);
    BOOL v13 = 1;
    goto LABEL_12;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v16;
  int v11 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      v11 &= [*(id *)(*((void *)&v15 + 1) + 8 * i) validateLoggingToFile:a3];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v9);

  if (v11) {
    goto LABEL_11;
  }
  BOOL v13 = 0;
LABEL_12:
  fputc(10, a3);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteAllContentsOperationLastError, 0);
  objc_storeStrong((id *)&self->_deleteAllContentsOperation, 0);
}

@end