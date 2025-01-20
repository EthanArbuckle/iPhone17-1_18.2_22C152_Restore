@interface BRCSharedServerZone
- (BOOL)_propagateFolderDeletesToTheirChildren;
- (BOOL)allocateRanksWhenCaughtUp:(BOOL)a3;
- (BOOL)isPrivateZone;
- (BOOL)isSharedZone;
- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BRCSharedClientZone)clientZone;
- (BRCSharedServerZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6;
- (BRCSyncContext)transferSyncContext;
- (BRCSyncContext)transferSyncContextIfExists;
- (id)ownerName;
- (int64_t)_propagateDeleteToChildrenOfItemID:(id)a3;
- (void)_propagateFolderDeletesToTheirChildren;
- (void)addForegroundClient:(id)a3;
- (void)removeForegroundClient:(id)a3;
- (void)sideCarZoneWasReset;
@end

@implementation BRCSharedServerZone

- (BOOL)isSharedZone
{
  return 1;
}

- (BOOL)isPrivateZone
{
  return 0;
}

- (BRCSharedClientZone)clientZone
{
  return (BRCSharedClientZone *)[(BRCClientZone *)self->super._clientZone asSharedClientZone];
}

- (id)ownerName
{
  return self->_ownerName;
}

- (BRCSharedServerZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCSharedServerZone;
  v11 = [(BRCServerZone *)&v15 initWithMangledID:v10 dbRowID:a4 plist:a5 session:a6];
  if (v11)
  {
    uint64_t v12 = [v10 ownerName];
    ownerName = v11->_ownerName;
    v11->_ownerName = (NSString *)v12;
  }
  return v11;
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  return 1;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  return 1;
}

- (int64_t)_propagateDeleteToChildrenOfItemID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(BRCPQLConnection *)self->super._db execute:@"UPDATE server_items SET item_state = 1, item_rank = NULL WHERE item_parent_id = %@ AND zone_rowid = %@ AND item_state = 0", v4, self->super._dbRowID])
  {
    int64_t v5 = [(BRCPQLConnection *)self->super._db changes];
  }
  else
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      v9 = [(BRCPQLConnection *)self->super._db lastError];
      *(_DWORD *)buf = 138412802;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v9;
      __int16 v14 = 2112;
      objc_super v15 = v6;
      _os_log_error_impl(&dword_23FA42000, v7, (os_log_type_t)0x90u, "[ERROR] failed saving sharing options update %@: %@%@", buf, 0x20u);
    }
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_propagateFolderDeletesToTheirChildren
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [(BRCServerZone *)self mangledID];
  id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  unsigned int v5 = [v4 maxRelativePathDepth];

  id v6 = [[BRCItemID alloc] _initAsZoneRootWithZoneRowID:self->super._dbRowID];
  BOOL v7 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE server_items SET item_state = 1 , item_parent_id = %@ WHERE zone_rowid = %@   AND item_rank IS NULL   AND NOT EXISTS (SELECT 1 FROM server_items as pi WHERE pi.item_id = server_items.item_parent_id AND pi.zone_rowid = server_items.zone_rowid LIMIT 1)   AND item_parent_id != %@", v6, self->super._dbRowID, v6];
  if ([(BRCPQLConnection *)self->super._db changes])
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v10 = [(BRCPQLConnection *)self->super._db changes];
      *(_DWORD *)buf = 134218242;
      int64_t v29 = v10;
      __int16 v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Forced %lld orphans to be tombstones in the shared zone%@", buf, 0x16u);
    }
  }
  id v11 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT item_id   FROM server_items  WHERE zone_rowid = %@    AND item_state = 1    AND item_type = 0    AND item_rank IS NULL", self->super._dbRowID];
  if ([v11 next])
  {
    BOOL v25 = v7;
    id v26 = v6;
LABEL_7:
    context = (void *)MEMORY[0x2455D97F0]();
    __int16 v12 = [v11 objectOfClass:objc_opt_class() atIndex:0];
    v13 = objc_opt_new();
    __int16 v14 = [(BRCServerZone *)self directDirectoryChildItemIDsOfParentEnumerator:v12];
    [v13 addObject:v14];

    int64_t v15 = [(BRCSharedServerZone *)self _propagateDeleteToChildrenOfItemID:v12];
    while (1)
    {
      if (![v13 count])
      {
        if (v15)
        {
          v20 = brc_bread_crumbs();
          v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            int64_t v29 = v15;
            __int16 v30 = 2112;
            v31 = v12;
            __int16 v32 = 2112;
            v33 = v20;
            _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] propagated delete of %lld recursive children of %@%@", buf, 0x20u);
          }
        }
        if (([v11 next] & 1) == 0)
        {
          id v6 = v26;
          BOOL v7 = v25;
          break;
        }
        goto LABEL_7;
      }
      uint64_t v16 = (void *)MEMORY[0x2455D97F0]();
      v17 = [v13 lastObject];
      v18 = [v17 nextObject];
      if (v18)
      {
        v19 = [(BRCServerZone *)self directDirectoryChildItemIDsOfParentEnumerator:v18];
        [v13 addObject:v19];

        if ([v13 count] > (unint64_t)v5)
        {
          v22 = brc_bread_crumbs();
          v23 = brc_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            [(BRCSharedServerZone *)(uint64_t)v22 _propagateFolderDeletesToTheirChildren];
          }

          BOOL v7 = 0;
          id v6 = v26;
          break;
        }
        v15 += [(BRCSharedServerZone *)self _propagateDeleteToChildrenOfItemID:v18];
      }
      else
      {
        [v13 removeLastObject];
      }
    }
  }

  return v7;
}

- (BOOL)allocateRanksWhenCaughtUp:(BOOL)a3
{
  BOOL v3 = a3;
  [(BRCSharedServerZone *)self _propagateFolderDeletesToTheirChildren];
  v6.receiver = self;
  v6.super_class = (Class)BRCSharedServerZone;
  return [(BRCServerZone *)&v6 allocateRanksWhenCaughtUp:v3];
}

- (void)sideCarZoneWasReset
{
  [(BRCPQLConnection *)self->super._db execute:@"UPDATE server_items SET item_favoriterank = NULL, item_lastusedtime = NULL, item_side_car_ckinfo = NULL, item_rank = NULL WHERE zone_rowid = %@ AND (item_sharing_options & 4) == 0", self->super._dbRowID];
  BOOL v3 = [(BRCAccountSessionFPFS *)self->super._session clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__BRCSharedServerZone_sideCarZoneWasReset__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __42__BRCSharedServerZone_sideCarZoneWasReset__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) scheduleSyncDown];
}

- (void)addForegroundClient:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BRCSharedServerZone *)self transferSyncContext];
  [v5 addForegroundClient:v4];

  v6.receiver = self;
  v6.super_class = (Class)BRCSharedServerZone;
  [(BRCServerZone *)&v6 addForegroundClient:v4];
}

- (void)removeForegroundClient:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BRCSharedServerZone *)self transferSyncContext];
  [v5 removeForegroundClient:v4];

  v6.receiver = self;
  v6.super_class = (Class)BRCSharedServerZone;
  [(BRCServerZone *)&v6 removeForegroundClient:v4];
}

- (BRCSyncContext)transferSyncContext
{
  BOOL v3 = [(BRCAccountSessionFPFS *)self->super._session syncContextProvider];
  id v4 = [(BRCServerZone *)self mangledID];
  unsigned int v5 = [v3 transferSyncContextForMangledID:v4];

  return (BRCSyncContext *)v5;
}

- (BRCSyncContext)transferSyncContextIfExists
{
  BOOL v3 = [(BRCAccountSessionFPFS *)self->super._session syncContextProvider];
  id v4 = [(BRCServerZone *)self mangledID];
  unsigned int v5 = [v3 transferSyncContextForMangledID:v4 createIfNeeded:0];

  return (BRCSyncContext *)v5;
}

- (void).cxx_destruct
{
}

- (void)_propagateFolderDeletesToTheirChildren
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Path depth overflow%@", (uint8_t *)&v2, 0xCu);
}

@end