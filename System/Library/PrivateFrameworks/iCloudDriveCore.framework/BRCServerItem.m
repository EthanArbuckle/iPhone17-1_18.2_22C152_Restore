@interface BRCServerItem
- (BOOL)aliasTargetIsShared;
- (BOOL)canPathMatchMergeWithLocalItem:(id)a3;
- (BOOL)hasShareIDAndIsOwnedByMe;
- (BOOL)isBRAlias;
- (BOOL)isChildSharedItem;
- (BOOL)isDead;
- (BOOL)isDirectory;
- (BOOL)isDirectoryFault;
- (BOOL)isDocument;
- (BOOL)isFSRoot;
- (BOOL)isFinderBookmark;
- (BOOL)isLive;
- (BOOL)isOwnedByMe;
- (BOOL)isPackage;
- (BOOL)isShared;
- (BOOL)isSharedByMe;
- (BOOL)isSharedToMe;
- (BOOL)isSharedToMeChildItem;
- (BOOL)isSharedToMeTopLevelItem;
- (BOOL)isSymLink;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isZoneRoot;
- (BOOL)shouldBeGreedyForApply;
- (BOOL)validateLoggingToFile:(__sFILE *)a3;
- (BRCAccountSessionFPFS)session;
- (BRCBasehashSaltInfo)basehashSaltInfo;
- (BRCClientZone)clientZone;
- (BRCItemGlobalID)itemGlobalID;
- (BRCItemID)itemID;
- (BRCServerItem)initWithServerItem:(id)a3;
- (BRCServerStatInfo)st;
- (BRCServerZone)serverZone;
- (BRCSharedServerItem)asSharedItem;
- (BRCUserRowID)ownerKey;
- (BRCVersion)latestVersion;
- (BRServerMetrics)serverMetrics;
- (NSString)originalName;
- (NSString)symlinkTarget;
- (id)aliasTargetAppLibrary;
- (id)aliasTargetClientZone;
- (id)aliasTargetItemID;
- (id)appLibraryForRootItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithContext:(id)a3;
- (id)initFromPQLResultSet:(id)a3 serverZone:(id)a4 error:(id *)a5;
- (id)newLocalItemWithDBRowID:(unint64_t)a3;
- (id)newLocalItemWithServerZone:(id)a3 dbRowID:(unint64_t)a4;
- (id)parentItemIDOnFS;
- (id)parentItemIDOnServer;
- (id)parentItemOnFS;
- (id)parentLocalItemOnFS;
- (id)parentZoneOnFS;
- (id)predictedAppLibrary;
- (id)sideCarInfo;
- (int64_t)directoryMtime;
- (int64_t)rank;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (unint64_t)sharingOptions;
- (unsigned)pcsChainState;
- (void)appLibraryForRootItem;
- (void)asSharedItem;
- (void)overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:(id)a3;
- (void)setSharingOptions:(unint64_t)a3;
@end

@implementation BRCServerItem

- (id)sideCarInfo
{
  v3 = objc_alloc_init(BRCSideCarInfo);
  [(BRCSideCarInfo *)v3 setFavoriteRank:[(BRCStatInfo *)self->_st favoriteRank]];
  [(BRCSideCarInfo *)v3 setLastUsedTime:[(BRCStatInfo *)self->_st lastUsedTime]];
  v4 = [(BRCStatInfo *)self->_st finderTags];
  [(BRCSideCarInfo *)v3 setFinderTags:v4];

  [(BRCSideCarInfo *)v3 setCkInfo:self->_sideCarCKInfo];
  return v3;
}

- (BOOL)isLive
{
  return [(BRCStatInfo *)self->_st state] == 0;
}

- (BOOL)isDead
{
  return [(BRCStatInfo *)self->_st state] == 1;
}

- (BOOL)isBRAlias
{
  return [(BRCStatInfo *)self->_st type] == 3;
}

- (BOOL)isDirectory
{
  unsigned int v2 = [(BRCStatInfo *)self->_st type];
  return (v2 < 0xB) & (0x611u >> v2);
}

- (BOOL)isDirectoryFault
{
  return [(BRCStatInfo *)self->_st type] == 9;
}

- (BOOL)isDocument
{
  int v3 = [(BRCStatInfo *)self->_st type];
  if (v3 != 1) {
    LOBYTE(v3) = [(BRCStatInfo *)self->_st type] == 6;
  }
  return v3;
}

- (BOOL)isFSRoot
{
  return [(BRCStatInfo *)self->_st type] == 4;
}

- (BOOL)isZoneRoot
{
  return 0;
}

- (BOOL)isSymLink
{
  return [(BRCStatInfo *)self->_st type] == 5;
}

- (BOOL)isFinderBookmark
{
  return [(BRCStatInfo *)self->_st type] == 6;
}

- (BOOL)isPackage
{
  return [(BRCVersion *)self->_latestVersion isPackage];
}

- (BOOL)isOwnedByMe
{
  return ![(BRCClientZone *)self->_clientZone isSharedZone];
}

- (BOOL)isShared
{
  return (self->_sharingOptions & 0x48) != 0;
}

- (BOOL)isSharedToMe
{
  return [(BRCClientZone *)self->_clientZone isSharedZone];
}

- (BOOL)isSharedByMe
{
  BOOL v3 = [(BRCServerItem *)self isShared];
  if (v3) {
    LOBYTE(v3) = ![(BRCClientZone *)self->_clientZone isSharedZone];
  }
  return v3;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  BOOL v3 = [(BRCServerItem *)self isOwnedByMe];
  if (v3) {
    return (LOBYTE(self->_sharingOptions) >> 2) & 1;
  }
  return v3;
}

- (BOOL)isSharedToMeTopLevelItem
{
  unsigned int v2 = [(BRCServerItem *)self parentItemIDOnServer];
  char v3 = [v2 isSharedZoneRoot];

  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  BOOL v3 = [(BRCServerItem *)self isSharedToMe];
  if (v3) {
    LOBYTE(v3) = ![(BRCServerItem *)self isSharedToMeTopLevelItem];
  }
  return v3;
}

- (BOOL)isTopLevelSharedItem
{
  return (self->_sharingOptions & 4) != 0 && [(BRCServerItem *)self isShared];
}

- (BOOL)isChildSharedItem
{
  return (self->_sharingOptions & 4) == 0 && [(BRCServerItem *)self isShared];
}

- (BRCItemGlobalID)itemGlobalID
{
  BOOL v3 = [BRCItemGlobalID alloc];
  v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  v5 = [(BRCItemGlobalID *)v3 initWithZoneRowID:v4 itemID:self->_itemID];

  return v5;
}

- (BRCSharedServerItem)asSharedItem
{
  unsigned int v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    [(BRCServerItem *)(uint64_t)v2 asSharedItem];
  }

  return 0;
}

- (BRCServerItem)initWithServerItem:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCServerItem;
  uint64_t v5 = [(BRCServerItem *)&v14 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_itemID, *((id *)v4 + 9));
    objc_storeStrong((id *)&v6->_ownerKey, *((id *)v4 + 8));
    objc_storeStrong((id *)&v6->_sideCarCKInfo, *((id *)v4 + 5));
    uint64_t v7 = [*((id *)v4 + 12) copy];
    st = v6->_st;
    v6->_st = (BRCServerStatInfo *)v7;

    uint64_t v9 = [*((id *)v4 + 13) copy];
    latestVersion = v6->_latestVersion;
    v6->_latestVersion = (BRCVersion *)v9;

    uint64_t v11 = [*((id *)v4 + 14) copy];
    serverMetrics = v6->_serverMetrics;
    v6->_serverMetrics = (BRServerMetrics *)v11;

    objc_storeStrong((id *)&v6->_serverZone, *((id *)v4 + 15));
    objc_storeStrong((id *)&v6->_clientZone, *((id *)v4 + 16));
    v6->_session = (BRCAccountSessionFPFS *)*((void *)v4 + 1);
    v6->_sharingOptions = *((void *)v4 + 3);
    v6->_pcsChainState = *((_DWORD *)v4 + 13);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithServerItem:self];
}

- (id)initFromPQLResultSet:(id)a3 serverZone:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)BRCServerItem;
  uint64_t v9 = [(BRCServerItem *)&v41 init];
  if (v9)
  {
    v9->_session = (BRCAccountSessionFPFS *)(id)[v8 session];
    uint64_t v10 = [v7 db];
    db = v9->_db;
    v9->_db = (BRCPQLConnection *)v10;

    objc_storeStrong((id *)&v9->_serverZone, a4);
    uint64_t v12 = [(BRCServerZone *)v9->_serverZone clientZone];
    clientZone = v9->_clientZone;
    v9->_clientZone = (BRCClientZone *)v12;

    v9->_rank = [v7 longLongAtIndex:1];
    uint64_t v14 = [v7 stringAtIndex:2];
    originalName = v9->_originalName;
    v9->_originalName = (NSString *)v14;

    v9->_pcsChainState = [v7 intAtIndex:3];
    uint64_t v16 = [v7 objectOfClass:objc_opt_class() atIndex:4];
    itemID = v9->_itemID;
    v9->_itemID = (BRCItemID *)v16;

    uint64_t v18 = [v7 numberAtIndex:5];
    ownerKey = v9->_ownerKey;
    v9->_ownerKey = (BRCUserRowID *)v18;

    v9->_sharingOptions = [v7 integerAtIndex:6];
    uint64_t v20 = [v7 objectOfClass:objc_opt_class() atIndex:7];
    sideCarCKInfo = v9->_sideCarCKInfo;
    v9->_sideCarCKInfo = (BRFieldCKInfo *)v20;

    v22 = [(BRCStatInfo *)[BRCServerStatInfo alloc] initFromResultSet:v7 pos:8];
    st = v9->_st;
    v9->_st = v22;

    if ([(BRCServerZone *)v9->_serverZone isSharedZone]
      && (v9->_sharingOptions & 0x48) == 0
      && [(BRCStatInfo *)v9->_st state] != 1)
    {
      v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        -[BRCServerItem initFromPQLResultSet:serverZone:error:]((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40);
      }
    }
    if ([(BRCServerItem *)v9 isDocument])
    {
      v24 = [[BRCVersion alloc] initFromResultSet:v7 pos:24];
      latestVersion = v9->_latestVersion;
      v9->_latestVersion = v24;

      if ([(BRCStatInfo *)v9->_st isExecutable]
        && [(BRCVersion *)v9->_latestVersion isPackage])
      {
        v9->_st->super._mode &= ~2u;
      }
    }
    else if ([(BRCServerItem *)v9 isDirectory])
    {
      v9->_directoryMtime = [v7 longLongAtIndex:26];
    }
    else if ([(BRCServerItem *)v9 isSymLink])
    {
      uint64_t v26 = [v7 objectOfClass:objc_opt_class() atIndex:24];
      symlinkTarget = v9->_symlinkTarget;
      v9->_symlinkTarget = (NSString *)v26;
    }
    v28 = [[BRCBasehashSaltInfo alloc] initFromResultSet:v7 pos:36];
    basehashSaltInfo = v9->_basehashSaltInfo;
    v9->_basehashSaltInfo = v28;

    uint64_t v30 = [objc_alloc(MEMORY[0x263F32638]) initFromResultSet:v7 pos:39];
    serverMetrics = v9->_serverMetrics;
    v9->_serverMetrics = (BRServerMetrics *)v30;
  }
  return v9;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  LODWORD(v5) = [(BRCStatInfo *)self->_st check:self->_itemID logToFile:a3];
  latestVersion = self->_latestVersion;
  if (latestVersion)
  {
    if (v5) {
      LOBYTE(v5) = [(BRCVersion *)latestVersion check:self->_itemID logToFile:a3];
    }
    if ([(BRCServerItem *)self isDirectory])
    {
      uint64_t v5 = "item %s is a directory with a version\n";
LABEL_9:
      fprintf(a3, v5, [(BRCItemID *)self->_itemID UTF8String]);
      LOBYTE(v5) = 0;
    }
  }
  else if ([(BRCServerItem *)self isDocument] && ![(BRCServerItem *)self isDead])
  {
    uint64_t v5 = "item %s is a live document without a version\n";
    goto LABEL_9;
  }
  return (char)v5;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)v4[9];
  uint64_t v6 = self->_itemID;
  id v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_6;
  }
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = [(BRCItemID *)v6 isEqual:v7];

    if (!v9) {
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_9;
  }

LABEL_8:
  uint64_t v10 = 0x80000000;
LABEL_9:
  uint64_t v11 = (void *)v4[8];
  uint64_t v12 = self->_ownerKey;
  v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_16;
  }
  uint64_t v14 = v13;
  if (!v13)
  {

    goto LABEL_15;
  }
  char v15 = [(BRCUserRowID *)v12 isEqual:v13];

  if ((v15 & 1) == 0) {
LABEL_15:
  }
    v10 |= 0x20000000uLL;
LABEL_16:
  if (self->_sharingOptions != v4[3]) {
    v10 |= 0x40000000uLL;
  }
  uint64_t v16 = (void *)v4[5];
  v17 = self->_sideCarCKInfo;
  uint64_t v18 = v16;
  if (v17 == v18)
  {
  }
  else
  {
    v19 = v18;
    if (v18)
    {
      BOOL v20 = [(BRFieldCKInfo *)v17 isEqual:v18];

      if (v20) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    v10 |= 0x100000000000000uLL;
  }
LABEL_25:
  unint64_t v21 = [(BRCStatInfo *)self->_st diffAgainst:v4[12]] | v10;
  if (-[BRCServerItem isDocument](self, "isDocument") && [v4 isDocument]) {
    v21 |= [(BRCVersion *)self->_latestVersion diffAgainst:v4[13]];
  }

  return v21;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:128];
  if (v4)
  {
    uint64_t v6 = +[BRCDumpContext stringFromItemID:self->_itemID context:v4];
    [v5 appendFormat:@"i:%@ ", v6];
  }
  else
  {
    uint64_t v6 = [(BRCClientZone *)self->_clientZone mangledID];
    id v7 = [(BRCItemID *)self->_itemID debugItemIDString];
    [v5 appendFormat:@"i:%@:%@ ", v6, v7];
  }
  if ([(BRCUserRowID *)self->_ownerKey BOOLValue]) {
    [v5 appendFormat:@"o:%@ ", self->_ownerKey];
  }
  objc_msgSend(v5, "appendFormat:", @"rk:%lld ", self->_rank);
  unsigned int v8 = self->_pcsChainState - 1;
  if (v8 <= 3) {
    [v5 appendString:off_265083780[v8]];
  }
  if (self->_directoryMtime) {
    objc_msgSend(v5, "appendFormat:", @"mt:%lld ", self->_directoryMtime);
  }
  sideCarCKInfo = self->_sideCarCKInfo;
  if (sideCarCKInfo)
  {
    uint64_t v10 = [(BRFieldCKInfo *)sideCarCKInfo etag];
    [v5 appendFormat:@"ppm:%@ ", v10];
  }
  uint64_t v11 = [(BRCStatInfo *)self->_st descriptionWithContext:v4 origName:self->_originalName];
  [v5 appendFormat:@"st{%@}", v11];

  if ([(BRCServerItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v12 = [(BRCServerItem *)self asSharedItem];
    v13 = [v12 aliasDerivedStructureForDescription];
    uint64_t v14 = [v13 descriptionWithContext:v4 origName:self->_originalName];
    [v5 appendFormat:@" alias-st{%@}", v14];
  }
  latestVersion = self->_latestVersion;
  if (latestVersion)
  {
    uint64_t v16 = [(BRCVersion *)latestVersion descriptionWithContext:v4];
    [v5 appendFormat:@" ct{%@}", v16];
  }
  serverMetrics = self->_serverMetrics;
  if (serverMetrics)
  {
    uint64_t v18 = [(BRServerMetrics *)serverMetrics description];
    [v5 appendFormat:@" sm{%@}", v18];
  }
  if (self->_sharingOptions)
  {
    v19 = BRCPrettyPrintBitmap();
    [v5 appendFormat:@" sharing-options:{%@}", v19];
  }
  if ([(BRCServerItem *)self isSymLink])
  {
    BOOL v20 = [(NSString *)self->_symlinkTarget fp_obfuscatedPath];
    [v5 appendFormat:@" target:%@", v20];
  }
  unint64_t v21 = +[BRCUserDefaults defaultsForMangledID:0];
  int v22 = [v21 supportsEnhancedDrivePrivacy];

  if (v22)
  {
    if ([(BRCServerItem *)self isDirectory])
    {
      unsigned int v23 = [(BRCBasehashSaltInfo *)self->_basehashSaltInfo saltingState];
      if (v23 > 3) {
        v24 = @"no server item";
      }
      else {
        v24 = off_2650837A0[v23];
      }
      [v5 appendFormat:@" salt-st{%@}", v24];
      v25 = [(BRCBasehashSaltInfo *)self->_basehashSaltInfo childBasehashSalt];
      if (v25)
      {
        uint64_t v26 = objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateBogusKey");
        char v27 = [v25 isEqualToData:v26];

        if (v27)
        {
          v28 = @"bogus-salt";
        }
        else
        {
          v29 = objc_msgSend(v25, "brc_truncatedSHA256");
          objc_msgSend(v29, "brc_hexadecimalString");
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v5 appendFormat:@" child-valid{%@}", v28];
      }
    }
    uint64_t v30 = [(BRCBasehashSaltInfo *)self->_basehashSaltInfo basehashSaltValidation];
    v31 = v30;
    if (v30)
    {
      v32 = objc_msgSend(v30, "brc_hexadecimalString");
      [v5 appendFormat:@" base-valid{%@}", v32];
    }
  }

  return v5;
}

- (id)description
{
  return [(BRCServerItem *)self descriptionWithContext:0];
}

- (id)appLibraryForRootItem
{
  if (![(BRCServerItem *)self isFSRoot])
  {
    BOOL v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      [(BRCServerItem *)(uint64_t)v9 appLibraryForRootItem];
    }
  }
  p_itemID = (uint64_t *)&self->_itemID;
  if ([(BRCItemID *)self->_itemID isNonDesktopRoot]
    || [(id)*p_itemID isDocumentsFolder])
  {
    session = self->_session;
    uint64_t v5 = [(BRCItemID *)self->_itemID appLibraryRowID];
    uint64_t v6 = [(BRCAccountSessionFPFS *)session appLibraryByRowID:v5];
  }
  else
  {
    uint64_t v5 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(BRCServerItem *)p_itemID appLibraryForRootItem];
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)newLocalItemWithDBRowID:(unint64_t)a3
{
  switch(self->_st->super._type)
  {
    case 0xFF:
    case 2:
    case 4:
    case 7:
    case 8:
    case 0xA:
      uint64_t v5 = brc_bread_crumbs();
      uint64_t v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCServerItem newLocalItemWithDBRowID:]();
      }

      goto LABEL_5;
    case 0:
    case 9:
      uint64_t v10 = BRCDirectoryItem;
      goto LABEL_13;
    case 1:
      uint64_t v10 = BRCDocumentItem;
      goto LABEL_13;
    case 3:
      uint64_t v10 = BRCAliasItem;
      goto LABEL_13;
    case 5:
      uint64_t v10 = BRCSymlinkItem;
      goto LABEL_13;
    case 6:
      uint64_t v10 = BRCFinderBookmarkItem;
LABEL_13:
      id v11 = [v10 alloc];
      id result = (id)[v11 _initWithServerItem:self dbRowID:a3];
      break;
    default:
LABEL_5:
      id v7 = brc_bread_crumbs();
      unsigned int v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCServerItem newLocalItemWithDBRowID:]();
      }

      id result = 0;
      break;
  }
  return result;
}

- (id)newLocalItemWithServerZone:(id)a3 dbRowID:(unint64_t)a4
{
  return [(BRCServerItem *)self newLocalItemWithDBRowID:a4];
}

- (unsigned)pcsChainState
{
  return self->_pcsChainState;
}

- (id)parentItemOnFS
{
  serverZone = self->_serverZone;
  id v4 = [(BRCStatInfo *)self->_st parentID];
  uint64_t v5 = [(BRCServerZone *)serverZone itemByItemID:v4 db:self->_db];

  return v5;
}

- (id)parentLocalItemOnFS
{
  BOOL v3 = [(BRCServerZone *)self->_serverZone clientZone];
  id v4 = [(BRCStatInfo *)self->_st parentID];
  uint64_t v5 = [v3 itemByItemID:v4 db:self->_db];

  return v5;
}

- (id)parentZoneOnFS
{
  return self->_serverZone;
}

- (id)parentItemIDOnFS
{
  return [(BRCStatInfo *)self->_st parentID];
}

- (id)parentItemIDOnServer
{
  BOOL v3 = [(BRCServerItem *)self itemID];
  if ([v3 isDocumentsFolder])
  {
    id v4 = [(BRCServerItem *)self clientZone];
    int v5 = [v4 isCloudDocsZone];

    if (v5)
    {
      uint64_t v6 = [(BRCServerItem *)self clientZone];
      id v7 = [v6 asPrivateClientZone];
      unsigned int v8 = [v7 rootItemID];

      goto LABEL_6;
    }
  }
  else
  {
  }
  unsigned int v8 = [(BRCStatInfo *)self->_st parentID];
LABEL_6:
  return v8;
}

- (BOOL)aliasTargetIsShared
{
  unsigned int v2 = [(BRCStatInfo *)self->_st _aliasTargetMangledID];
  char v3 = [v2 isShared];

  return v3;
}

- (id)aliasTargetClientZone
{
  session = self->_session;
  char v3 = [(BRCStatInfo *)self->_st _aliasTargetMangledID];
  id v4 = [(BRCAccountSessionFPFS *)session clientZoneByMangledID:v3];

  return v4;
}

- (id)aliasTargetAppLibrary
{
  session = self->_session;
  char v3 = [(BRCStatInfo *)self->_st _aliasTargetMangledID];
  id v4 = [(BRCAccountSessionFPFS *)session appLibraryByMangledID:v3];

  return v4;
}

- (id)aliasTargetItemID
{
  return [(BRCStatInfo *)self->_st _aliasTargetItemID];
}

- (BOOL)canPathMatchMergeWithLocalItem:(id)a3
{
  st = self->_st;
  id v4 = a3;
  int v5 = +[BRCItemID structureRecordPrefixForItemType:[(BRCStatInfo *)st type] targetZoneShared:1];
  uint64_t v6 = [v4 st];

  id v7 = +[BRCItemID structureRecordPrefixForItemType:targetZoneShared:](BRCItemID, "structureRecordPrefixForItemType:targetZoneShared:", [v6 type], 1);

  LOBYTE(v4) = [v5 isEqualToString:v7];
  return (char)v4;
}

- (BOOL)shouldBeGreedyForApply
{
  return 1;
}

- (void)overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 localDiffs] & 0x1000000000000000) != 0)
  {
    int v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(BRCItemID *)self->_itemID debugItemIDString];
      uint64_t v13 = [v4 st];
      uint64_t v14 = [v13 ckInfo];
      uint64_t v15 = [(BRCStatInfo *)self->_st ckInfo];
      int v16 = 138413058;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v14;
      __int16 v20 = 2112;
      unint64_t v21 = v15;
      __int16 v22 = 2112;
      unsigned int v23 = v5;
      _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ has an out of band sync ack -- using client truth ckinfo %@ rather than server info %@%@", (uint8_t *)&v16, 0x2Au);
    }
    id v7 = [v4 st];
    unsigned int v8 = [v7 ckInfo];
    [(BRCStatInfo *)self->_st setCkInfo:v8];

    if ([v4 isDocument])
    {
      BOOL v9 = [v4 asDocument];
      uint64_t v10 = [v9 currentVersion];
      id v11 = [v10 ckInfo];
      [(BRCVersion *)self->_latestVersion setCkInfo:v11];
    }
  }
}

- (BRCUserRowID)ownerKey
{
  return self->_ownerKey;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (int64_t)rank
{
  return self->_rank;
}

- (BRCServerStatInfo)st
{
  return self->_st;
}

- (BRCVersion)latestVersion
{
  return self->_latestVersion;
}

- (BRServerMetrics)serverMetrics
{
  return self->_serverMetrics;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (void)setSharingOptions:(unint64_t)a3
{
  self->_sharingOptions = a3;
}

- (NSString)symlinkTarget
{
  return self->_symlinkTarget;
}

- (int64_t)directoryMtime
{
  return self->_directoryMtime;
}

- (BRCBasehashSaltInfo)basehashSaltInfo
{
  return self->_basehashSaltInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basehashSaltInfo, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_serverMetrics, 0);
  objc_storeStrong((id *)&self->_latestVersion, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_ownerKey, 0);
  objc_storeStrong((id *)&self->_symlinkTarget, 0);
  objc_storeStrong((id *)&self->_sideCarCKInfo, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (id)predictedAppLibrary
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v3 = [(BRCServerItem *)self clientZone];
  id v4 = [v3 db];
  [v4 assertOnQueue];

  int v5 = [(BRCServerItem *)self parentLocalItemOnFS];
  uint64_t v6 = [v5 appLibrary];
  id v7 = [v6 dbRowID];

  if (!v7)
  {
    unsigned int v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't figure out the expected app library; falling back to clouddocs%@",
        (uint8_t *)&v14,
        0xCu);
    }

    uint64_t v10 = [(BRCAccountSessionFPFS *)self->_session cloudDocsClientZone];
    id v11 = [v10 defaultAppLibrary];
    id v7 = [v11 dbRowID];
  }
  uint64_t v12 = [(BRCAccountSessionFPFS *)self->_session appLibraryByRowID:v7];

  return v12;
}

- (void)asSharedItem
{
}

- (void)initFromPQLResultSet:(uint64_t)a3 serverZone:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_23FA42000, a2, a3, "[CRIT] Assertion failed: !_serverZone.isSharedZone || (_sharingOptions & BRCSharingItemHasCKShareMask) != 0 || _st.state == BRC_ITEM_STATE_TOMBSTONE%@", a5, a6, a7, a8, 2u);
}

- (void)appLibraryForRootItem
{
}

- (void)newLocalItemWithDBRowID:.cold.1()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_11_1(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unknown item type: %d%@");
}

- (void)newLocalItemWithDBRowID:.cold.2()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_11_1(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unsupporter server item type: %d%@");
}

@end