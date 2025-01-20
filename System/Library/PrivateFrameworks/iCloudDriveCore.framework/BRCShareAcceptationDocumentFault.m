@interface BRCShareAcceptationDocumentFault
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)isShareAcceptationFault;
- (BRCShareAcceptationDocumentFault)initWithFilename:(id)a3 itemID:(id)a4 parentIDWhenSubitem:(id)a5 appLibrary:(id)a6 clientZone:(id)a7 sharingOptions:(unint64_t)a8;
- (void)deleteShareAcceptationFault;
- (void)markNeedsTransformIntoNormalFault;
@end

@implementation BRCShareAcceptationDocumentFault

- (BRCShareAcceptationDocumentFault)initWithFilename:(id)a3 itemID:(id)a4 parentIDWhenSubitem:(id)a5 appLibrary:(id)a6 clientZone:(id)a7 sharingOptions:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v40.receiver = self;
  v40.super_class = (Class)BRCShareAcceptationDocumentFault;
  v19 = [(BRCShareAcceptationDocumentFault *)&v40 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->super.super._itemID, a4);
    unint64_t v39 = a8;
    v21 = [[BRCLocalStatInfo alloc] initAsShareAcceptFaultWithName:v14 mode:(a8 & 0x20) == 0 isDirectory:0];
    st = v20->super.super._st;
    v20->super.super._st = v21;

    if (v16)
    {
      id v38 = v16;
      -[BRCStatInfo setParentID:](v20->super.super._st, "setParentID:");
      v23 = [v18 dbRowID];
      v24 = v23;
    }
    else
    {
      id v38 = [v17 documentsFolderItemID];
      -[BRCStatInfo setParentID:](v20->super.super._st, "setParentID:");
      v24 = [v17 defaultClientZone];
      v23 = [v24 dbRowID];
    }
    objc_storeStrong((id *)&v20->super.super._parentZoneRowID, v23);
    if (v16)
    {
      uint64_t v37 = 0;
    }
    else
    {

      uint64_t v37 = 4;
    }

    v25 = [[BRCLocalVersion alloc] initForPackage:0];
    currentVersion = v20->super._currentVersion;
    v20->super._currentVersion = v25;

    [(BRCVersion *)v20->super._currentVersion setOriginalPOSIXName:v14];
    [(BRCVersion *)v20->super._currentVersion setMtime:time(0)];
    [(BRCVersion *)v20->super._currentVersion setSize:20480];
    [(BRCLocalItem *)v20 setAppLibrary:v17];
    objc_storeStrong((id *)&v20->super.super._clientZone, a7);
    v20->super.super._serverZone = (BRCServerZone *)[(BRCClientZone *)v20->super.super._clientZone serverZone];
    uint64_t v27 = [(BRCClientZone *)v20->super.super._clientZone db];
    db = v20->super.super._db;
    v20->super.super._db = (BRCPQLConnection *)v27;

    v29 = (BRCAccountSessionFPFS *)(id)[v17 session];
    v20->super.super._session = v29;
    v30 = [v18 ownerName];
    v31 = [(BRCAccountSessionFPFS *)v20->super.super._session clientDB];
    uint64_t v32 = [(BRCAccountSessionFPFS *)v29 userKeyForOwnerName:v30 db:v31];
    ownerKey = v20->super.super._ownerKey;
    v20->super.super._ownerKey = (BRCUserRowID *)v32;

    [(BRCStatInfo *)v20->super.super._st setBirthtime:[(BRCVersion *)v20->super._currentVersion mtime]];
    [(BRCLocalStatInfo *)v20->super.super._st setItemScope:2];
    [(BRCStatInfo *)v20->super.super._st setState:0];
    [(BRCStatInfo *)v20->super.super._st setHiddenExt:1];
    v34 = [MEMORY[0x263EFF910] date];
    [v34 timeIntervalSince1970];
    [(BRCStatInfo *)v20->super.super._st setLastUsedTime:(uint64_t)v35];

    v20->super.super._sharingOptions = v37 | v39;
    v20->super.super._isUserVisible = 1;
  }
  return v20;
}

- (BOOL)isShareAcceptationFault
{
  return 1;
}

- (void)deleteShareAcceptationFault
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: only share acceptation fault can be deleted; %@%@");
}

- (void)markNeedsTransformIntoNormalFault
{
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCShareAcceptationDocumentFault;
  unsigned int v7 = [(BRCDocumentItem *)&v14 _updateInDB:v6 diffs:a4];
  int v8 = [(BRCStatInfo *)self->super.super._st type];
  if (v8 == 2) {
    char v9 = 0;
  }
  else {
    char v9 = v7;
  }
  if (v8 == 2 && v7 != 0)
  {
    itemID = self->super.super._itemID;
    v12 = [(BRCClientZone *)self->super.super._clientZone dbRowID];
    char v9 = [v6 execute:@"UPDATE client_items SET item_type = 2 WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 8", itemID, v12];
  }
  return v9;
}

@end