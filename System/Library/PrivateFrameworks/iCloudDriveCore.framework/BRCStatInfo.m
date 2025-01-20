@interface BRCStatInfo
- (BOOL)check:(id)a3 logToFile:(__sFILE *)a4;
- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4;
- (BOOL)iWorkShareable;
- (BOOL)isEtagEqual:(id)a3;
- (BOOL)isExecutable;
- (BOOL)isHiddenExt;
- (BOOL)isWritable;
- (BRCItemID)parentID;
- (BRCItemID)trashPutBackParentID;
- (BRCStatInfo)initWithStatInfo:(id)a3;
- (BRCUserRowID)creatorRowID;
- (BRFieldCKInfo)ckInfo;
- (BRMangledID)_aliasTargetMangledID;
- (NSData)finderTags;
- (NSData)xattrSignature;
- (NSString)aliasTarget;
- (NSString)logicalName;
- (NSString)representableName;
- (NSString)trashPutBackPath;
- (char)mode;
- (char)state;
- (char)type;
- (id)_aliasTargetItemID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithContext:(id)a3 origName:(id)a4;
- (id)displayName;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (id)lazyXattrWithStageRegistry:(id)a3;
- (int64_t)birthtime;
- (int64_t)favoriteRank;
- (int64_t)lastUsedTime;
- (unint64_t)diffAgainst:(id)a3;
- (void)_aliasTargetItemID;
- (void)_updateAliasTarget:(id)a3;
- (void)setBirthtime:(int64_t)a3;
- (void)setCkInfo:(id)a3;
- (void)setCreatorRowID:(id)a3;
- (void)setFavoriteRank:(int64_t)a3;
- (void)setFinderTags:(id)a3;
- (void)setHiddenExt:(BOOL)a3;
- (void)setLastUsedTime:(int64_t)a3;
- (void)setLogicalName:(id)a3;
- (void)setMode:(char)a3;
- (void)setParentID:(id)a3;
- (void)setState:(char)a3;
- (void)setTrashPutBackParentID:(id)a3;
- (void)setTrashPutBackPath:(id)a3;
- (void)setType:(char)a3;
- (void)setXattrSignature:(id)a3;
@end

@implementation BRCStatInfo

- (BRMangledID)_aliasTargetMangledID
{
  aliasTarget = self->_aliasTarget;
  if (aliasTarget)
  {
    v3 = [(NSString *)aliasTarget stringByDeletingLastPathComponent];
    v4 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAliasTargetContainerString:v3];
  }
  else
  {
    v4 = 0;
  }
  return (BRMangledID *)v4;
}

- (id)_aliasTargetItemID
{
  if (self->_type != 3)
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCStatInfo _aliasTargetItemID]();
    }
  }
  if (self->_aliasTarget)
  {
    v3 = [BRCItemID alloc];
    v4 = [(NSString *)self->_aliasTarget lastPathComponent];
    v5 = [(BRCItemID *)v3 initWithUUIDString:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_updateAliasTarget:(id)a3
{
  id v4 = a3;
  v5 = [v4 clientZone];
  v6 = [v5 mangledID];
  v7 = [v6 aliasTargetContainerString];

  if (!v7)
  {
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCStatInfo _updateAliasTarget:]();
    }
  }
  v8 = [v4 itemID];
  v9 = [v8 itemIDString];
  v10 = [v7 stringByAppendingPathComponent:v9];
  aliasTarget = self->_aliasTarget;
  self->_aliasTarget = v10;
}

- (NSString)representableName
{
  unsigned int type = self->_type;
  BOOL v4 = type > 0xA;
  int v5 = (1 << type) & 0x611;
  BOOL v6 = v4 || v5 == 0;
  if (v6
    || ([(BRCStatInfo *)self logicalName],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v7, "br_isPackageRoot"),
        v7,
        !v8))
  {
    v10 = [(BRCStatInfo *)self logicalName];
  }
  else
  {
    v9 = [(BRCStatInfo *)self logicalName];
    v10 = objc_msgSend(v9, "br_representableDirectoryName");
  }
  return (NSString *)v10;
}

- (BOOL)iWorkShareable
{
  v3 = +[BRCUserDefaults defaultsForMangledID:0];
  BOOL v4 = [v3 iworkShareableExtensions];

  int v5 = [(BRCStatInfo *)self logicalName];
  BOOL v6 = objc_msgSend(v5, "br_pathExtension");
  uint64_t v7 = [v6 lowercaseString];
  int v8 = (void *)v7;
  v9 = &stru_26F3822F0;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = v9;

  int v11 = [v4 containsObject:v10];
  if (v11)
  {
    int v12 = [(BRCStatInfo *)self type];
    BOOL v14 = v12 == 8 || (v12 - 1) < 2;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)descriptionWithContext:(id)a3 origName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:64];
  parentID = self->_parentID;
  if (parentID)
  {
    v10 = +[BRCDumpContext stringFromItemID:parentID context:v6];
    [v8 appendFormat:@"p:%@ ", v10];
  }
  logicalName = self->_logicalName;
  if (logicalName)
  {
    int v12 = [(NSString *)logicalName fp_obfuscatedFilename];
    if (v6)
    {
      uint64_t v13 = [v6 highlightedString:v12 type:1];

      int v12 = (void *)v13;
    }
    [v8 appendFormat:@"n:\"%@\" ", v12];
    if (v7)
    {
      BOOL v14 = objc_msgSend(v7, "fp_obfuscatedFilename");
      [v8 appendFormat:@"(o:\"%@\"", v14];
    }
  }
  aliasTarget = self->_aliasTarget;
  if (aliasTarget)
  {
    v16 = aliasTarget;
    if (v6)
    {
      uint64_t v17 = [v6 highlightedString:v16 type:1];

      v16 = (NSString *)v17;
    }
    [v8 appendFormat:@"target:\"%@\" ", v16];
  }
  v18 = BRCPrettyPrintEnumWithContext(self->_type, (uint64_t)&brc_item_type_pretty_entries, v6);
  [v8 appendFormat:@"%@ ", v18];

  if (self->_state)
  {
    v19 = BRCPrettyPrintEnumWithContext(self->_state, (uint64_t)&brc_item_state_pretty_entries, v6);
    [v8 appendFormat:@"%@ ", v19];
  }
  ckInfo = self->_ckInfo;
  if (ckInfo)
  {
    v21 = [(BRFieldCKInfo *)ckInfo etag];
    [v8 appendFormat:@"etag:%@ ", v21];

    v22 = [(BRFieldCKInfo *)self->_ckInfo etagBeforeCrossZoneMove];

    if (v22)
    {
      v23 = [(BRFieldCKInfo *)self->_ckInfo etagBeforeCrossZoneMove];
      [v8 appendFormat:@"prev-etag:%@ ", v23];
    }
    if ([(BRFieldCKInfo *)self->_ckInfo hasDeletionChangeToken])
    {
      id v24 = objc_alloc(MEMORY[0x263EFD838]);
      v25 = [(BRFieldCKInfo *)self->_ckInfo deletionChangeToken];
      v26 = (void *)[v24 initWithData:v25];

      v27 = [v26 descriptionWithContext:v6];
      [v8 appendFormat:@"deletion-token:%@ ", v27];
    }
  }
  if (self->_birthtime) {
    objc_msgSend(v8, "appendFormat:", @"bt:%lld ", self->_birthtime);
  }
  if (self->_lastUsedTime) {
    objc_msgSend(v8, "appendFormat:", @"lu:%lld ", self->_lastUsedTime);
  }
  if (self->_favoriteRank) {
    objc_msgSend(v8, "appendFormat:", @"fa:%lld ", self->_favoriteRank);
  }
  v36[0] = 114;
  int mode = self->_mode;
  if (mode) {
    char v29 = 119;
  }
  else {
    char v29 = 45;
  }
  v36[1] = v29;
  if ((mode & 2) != 0) {
    char v30 = 120;
  }
  else {
    char v30 = 45;
  }
  v36[2] = v30;
  v36[3] = (mode << 29 >> 31) & 0x4C;
  v36[4] = 0;
  objc_msgSend(v8, "appendFormat:", @"m:%s ", v36);
  if (self->_hiddenExt) {
    [v8 appendString:@"hidden-ext "];
  }
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    v32 = [(NSData *)xattrSignature brc_hexadecimalString];
    [v8 appendFormat:@"ea:%@ ", v32];
  }
  if (self->_finderTags) {
    [v8 appendString:@"has-finder-tags "];
  }
  trashPutBackPath = self->_trashPutBackPath;
  if (trashPutBackPath || self->_trashPutBackParentID)
  {
    v34 = [(NSString *)trashPutBackPath fp_obfuscatedPath];
    [v8 appendFormat:@"trash-put-back{%@, %@} ", v34, self->_trashPutBackParentID];
  }
  if (self->_creatorRowID) {
    [v8 appendFormat:@"creator:%@ ", self->_creatorRowID];
  }
  objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);

  return v8;
}

- (id)description
{
  return [(BRCStatInfo *)self descriptionWithContext:0 origName:0];
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BRCStatInfo;
  id v7 = [(BRCStatInfo *)&v33 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectOfClass:objc_opt_class() atIndex:v4];
    ckInfo = v7->_ckInfo;
    v7->_ckInfo = (BRFieldCKInfo *)v8;

    v7->_state = [v6 intAtIndex:(v4 + 1)];
    v7->_unsigned int type = [v6 intAtIndex:(v4 + 2)];
    char v10 = [v6 intAtIndex:(v4 + 3)];
    v7->_int mode = v10;
    unsigned int type = v7->_type;
    BOOL v12 = type > 0xA;
    int v13 = (1 << type) & 0x611;
    if (!v12 && v13 != 0) {
      v7->_int mode = v10 & 0xFD;
    }
    v7->_birthtime = [v6 longLongAtIndex:(v4 + 4)];
    v7->_lastUsedTime = [v6 longLongAtIndex:(v4 + 5)];
    v7->_favoriteRank = [v6 longLongAtIndex:(v4 + 6)];
    uint64_t v15 = [v6 objectOfClass:objc_opt_class() atIndex:(v4 + 7)];
    parentID = v7->_parentID;
    v7->_parentID = (BRCItemID *)v15;

    uint64_t v17 = [v6 stringAtIndex:(v4 + 8)];
    logicalName = v7->_logicalName;
    v7->_logicalName = (NSString *)v17;

    if (![(NSString *)v7->_logicalName length])
    {
      v19 = v7->_logicalName;
      v7->_logicalName = 0;
    }
    v7->_hiddenExt = [v6 BOOLAtIndex:(v4 + 9)];
    uint64_t v20 = [v6 dataAtIndex:(v4 + 10)];
    finderTags = v7->_finderTags;
    v7->_finderTags = (NSData *)v20;

    uint64_t v22 = [v6 dataAtIndex:(v4 + 11)];
    xattrSignature = v7->_xattrSignature;
    v7->_xattrSignature = (NSData *)v22;

    uint64_t v24 = [v6 stringAtIndex:(v4 + 12)];
    trashPutBackPath = v7->_trashPutBackPath;
    v7->_trashPutBackPath = (NSString *)v24;

    uint64_t v26 = [v6 objectOfClass:objc_opt_class() atIndex:(v4 + 13)];
    trashPutBackParentID = v7->_trashPutBackParentID;
    v7->_trashPutBackParentID = (BRCItemID *)v26;

    uint64_t v28 = [v6 stringAtIndex:(v4 + 14)];
    aliasTarget = v7->_aliasTarget;
    v7->_aliasTarget = (NSString *)v28;

    uint64_t v30 = [v6 numberAtIndex:(v4 + 15)];
    creatorRowID = v7->_creatorRowID;
    v7->_creatorRowID = (BRCUserRowID *)v30;
  }
  return v7;
}

- (BRCStatInfo)initWithStatInfo:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCStatInfo;
  int v5 = [(BRCStatInfo *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 1) copy];
    ckInfo = v5->_ckInfo;
    v5->_ckInfo = (BRFieldCKInfo *)v6;

    v5->_state = *((unsigned char *)v4 + 24);
    v5->_unsigned int type = *((unsigned char *)v4 + 25);
    v5->_int mode = *((unsigned char *)v4 + 26);
    v5->_birthtime = *((void *)v4 + 4);
    v5->_lastUsedTime = *((void *)v4 + 5);
    v5->_favoriteRank = *((void *)v4 + 6);
    uint64_t v8 = [*((id *)v4 + 2) copy];
    parentID = v5->_parentID;
    v5->_parentID = (BRCItemID *)v8;

    uint64_t v10 = [*((id *)v4 + 7) copy];
    logicalName = v5->_logicalName;
    v5->_logicalName = (NSString *)v10;

    uint64_t v12 = [*((id *)v4 + 8) copy];
    aliasTarget = v5->_aliasTarget;
    v5->_aliasTarget = (NSString *)v12;

    uint64_t v14 = [*((id *)v4 + 12) copy];
    finderTags = v5->_finderTags;
    v5->_finderTags = (NSData *)v14;

    v5->_hiddenExt = *((unsigned char *)v4 + 72);
    uint64_t v16 = [*((id *)v4 + 10) copy];
    xattrSignature = v5->_xattrSignature;
    v5->_xattrSignature = (NSData *)v16;

    uint64_t v18 = [*((id *)v4 + 13) copy];
    trashPutBackPath = v5->_trashPutBackPath;
    v5->_trashPutBackPath = (NSString *)v18;

    uint64_t v20 = [*((id *)v4 + 14) copy];
    trashPutBackParentID = v5->_trashPutBackParentID;
    v5->_trashPutBackParentID = (BRCItemID *)v20;

    uint64_t v22 = [*((id *)v4 + 15) copy];
    creatorRowID = v5->_creatorRowID;
    v5->_creatorRowID = (BRCUserRowID *)v22;
  }
  return v5;
}

- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4
{
  unsigned int state = self->_state;
  if (state >= 2) {
    fprintf(a4, "item %s has invalid state: %d\n", (const char *)[a3 UTF8String], self->_state);
  }
  return state < 2;
}

- (BOOL)check:(id)a3 logToFile:(__sFILE *)a4
{
  id v6 = a3;
  BOOL v7 = [(BRCStatInfo *)self checkStateWithItemID:v6 logToFile:a4];
  if (self->_type >= 0xBu)
  {
    fprintf(a4, "item %s has invalid type: %d\n", (const char *)[v6 UTF8String], self->_type);
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v7;
  }
  if (self->_mode >= 4u)
  {
    fprintf(a4, "item %s has invalid mode: 0%0x\n", (const char *)[v6 UTF8String], self->_mode);
    BOOL v8 = 0;
  }
  if (!self->_parentID)
  {
    fprintf(a4, "item %s has an invalid parent id\n", (const char *)[v6 UTF8String]);
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithStatInfo:self];
}

- (unint64_t)diffAgainst:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4)
  {
    v53 = brc_bread_crumbs();
    v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
      -[BRCStatInfo diffAgainst:]();
    }

    unint64_t v16 = 0x7FFFLL;
    goto LABEL_89;
  }
  id v6 = (void *)v4[1];
  BOOL v7 = self->_ckInfo;
  BOOL v8 = v6;
  if (v7 == v8)
  {

    uint64_t v10 = 0;
  }
  else
  {
    v9 = v8;
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v10 = [(BRFieldCKInfo *)v7 isEqual:v8] ^ 1;

    if (v10) {
      goto LABEL_14;
    }
  }
  int v11 = (void *)v5[15];
  BOOL v7 = self->_creatorRowID;
  uint64_t v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_14;
  }
  int v13 = v12;
  if (v12)
  {
    BOOL v14 = [(BRFieldCKInfo *)v7 isEqual:v12];

    if (v14) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_11:

LABEL_12:
  uint64_t v10 = 1;
LABEL_14:
  if ((self->_state != 1) != (*((unsigned char *)v5 + 24) == 1)) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v10 | 0xA;
  }
  if (self->_mode != *((unsigned __int8 *)v5 + 26)) {
    v15 |= 4uLL;
  }
  if (self->_birthtime != v5[4]) {
    v15 |= 0x10uLL;
  }
  if (self->_lastUsedTime != v5[5]) {
    v15 |= 0x800uLL;
  }
  if (self->_favoriteRank == v5[6]) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = v15 | 0x1000;
  }
  if ((v16 & 0x20) != 0) {
    goto LABEL_32;
  }
  uint64_t v17 = (void *)v5[2];
  uint64_t v18 = self->_parentID;
  v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_32;
  }
  uint64_t v20 = v19;
  if (!v19)
  {

    goto LABEL_39;
  }
  BOOL v21 = [(BRCItemID *)v18 isEqual:v19];

  if (v21)
  {
LABEL_32:
    if ((v16 & 0x40) != 0) {
      goto LABEL_43;
    }
LABEL_33:
    uint64_t v22 = (void *)v5[7];
    v23 = self->_logicalName;
    uint64_t v24 = v22;
    if (v23 == v24)
    {

      goto LABEL_43;
    }
    objc_super v25 = v24;
    if (v24)
    {
      char v26 = [(NSString *)v23 isEqual:v24];

      if (v26) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    v16 |= 0x40uLL;
    goto LABEL_43;
  }
LABEL_39:
  v16 |= 0x20uLL;
  if ((v16 & 0x40) == 0) {
    goto LABEL_33;
  }
LABEL_43:
  if ((v16 & 0x40) == 0)
  {
    v27 = (void *)v5[8];
    uint64_t v28 = self->_aliasTarget;
    char v29 = v27;
    if (v28 == v29)
    {
    }
    else
    {
      uint64_t v30 = v29;
      if (!v29)
      {

        goto LABEL_65;
      }
      char v31 = [(NSString *)v28 isEqual:v29];

      if ((v31 & 1) == 0)
      {
LABEL_65:
        v16 |= 0x40uLL;
        if ((v16 & 0x80) != 0) {
          goto LABEL_52;
        }
        goto LABEL_50;
      }
    }
  }
  if ((v16 & 0x80) != 0) {
    goto LABEL_52;
  }
LABEL_50:
  if (self->_hiddenExt != *((unsigned __int8 *)v5 + 72)) {
    v16 |= 0x80uLL;
  }
LABEL_52:
  if ((v16 & 0x100) != 0) {
    goto LABEL_58;
  }
  v32 = (void *)v5[10];
  objc_super v33 = self->_xattrSignature;
  v34 = v32;
  if (v33 == v34)
  {

    goto LABEL_58;
  }
  v35 = v34;
  if (!v34)
  {

    goto LABEL_68;
  }
  char v36 = [(NSData *)v33 isEqual:v34];

  if (v36)
  {
LABEL_58:
    if ((v16 & 0x400) != 0) {
      goto LABEL_72;
    }
LABEL_59:
    v37 = (void *)v5[14];
    v38 = self->_trashPutBackParentID;
    v39 = v37;
    if (v38 == v39)
    {

      goto LABEL_72;
    }
    v40 = v39;
    if (v39)
    {
      BOOL v41 = [(BRCItemID *)v38 isEqual:v39];

      if (v41) {
        goto LABEL_72;
      }
    }
    else
    {
    }
    v16 |= 0x400uLL;
    goto LABEL_72;
  }
LABEL_68:
  v16 |= 0x100uLL;
  if ((v16 & 0x400) == 0) {
    goto LABEL_59;
  }
LABEL_72:
  if ((v16 & 0x400) != 0) {
    goto LABEL_78;
  }
  v42 = (void *)v5[13];
  v43 = self->_trashPutBackPath;
  v44 = v42;
  if (v43 == v44)
  {

    goto LABEL_78;
  }
  v45 = v44;
  if (!v44)
  {

    goto LABEL_85;
  }
  char v46 = [(NSString *)v43 isEqual:v44];

  if (v46)
  {
LABEL_78:
    if ((v16 & 0x200) != 0) {
      goto LABEL_89;
    }
    goto LABEL_79;
  }
LABEL_85:
  v16 |= 0x400uLL;
  if ((v16 & 0x200) != 0) {
    goto LABEL_89;
  }
LABEL_79:
  v47 = (void *)v5[12];
  v48 = self->_finderTags;
  v49 = v47;
  if (v48 == v49)
  {
  }
  else
  {
    v50 = v49;
    if (v49)
    {
      char v51 = [(NSData *)v48 isEqual:v49];

      if (v51) {
        goto LABEL_89;
      }
    }
    else
    {
    }
    v16 |= 0x200uLL;
  }
LABEL_89:

  return v16;
}

- (BOOL)isExecutable
{
  return (self->_mode >> 1) & 1;
}

- (BOOL)isWritable
{
  return self->_mode & 1;
}

- (id)displayName
{
  v3 = [(BRCStatInfo *)self logicalName];
  id v4 = objc_msgSend(v3, "br_displayFilenameWithExtensionHidden:", -[BRCStatInfo isHiddenExt](self, "isHiddenExt"));

  return v4;
}

- (BOOL)isEtagEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = [a3 ckInfo];
  int v5 = [v4 hasEtag];
  if (v5 == [(BRFieldCKInfo *)self->_ckInfo hasEtag])
  {
    BOOL v7 = [v4 etag];
    BOOL v8 = [(BRFieldCKInfo *)self->_ckInfo etag];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setCreatorRowID:(id)a3
{
  id v4 = a3;
  if ([v4 longLongValue] < 0)
  {
    char v6 = brc_bread_crumbs();
    BOOL v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCStatInfo setCreatorRowID:]();
    }
  }
  creatorRowID = self->_creatorRowID;
  self->_creatorRowID = (BRCUserRowID *)v4;
}

- (id)lazyXattrWithStageRegistry:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (self->_xattrSignature)
  {
    lazyXattr = self->_lazyXattr;
    if (lazyXattr)
    {
      BOOL v7 = lazyXattr;
    }
    else
    {
      objc_msgSend(v4, "loadXattrBlobForSignature:error:");
      BOOL v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      v9 = self->_lazyXattr;
      self->_lazyXattr = v8;

      uint64_t v10 = self->_lazyXattr;
      if (!v10)
      {
        int v11 = brc_bread_crumbs();
        uint64_t v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          xattrSignature = self->_xattrSignature;
          *(_DWORD *)buf = 138412802;
          unint64_t v16 = xattrSignature;
          __int16 v17 = 2112;
          uint64_t v18 = 0;
          __int16 v19 = 2112;
          uint64_t v20 = v11;
          _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to load xattr with signature %@ - %@%@", buf, 0x20u);
        }

        uint64_t v10 = self->_lazyXattr;
      }
      BOOL v7 = v10;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (void)setCkInfo:(id)a3
{
}

- (char)state
{
  return self->_state;
}

- (void)setState:(char)a3
{
  self->_unsigned int state = a3;
}

- (char)type
{
  return self->_type;
}

- (void)setType:(char)a3
{
  self->_unsigned int type = a3;
}

- (char)mode
{
  return self->_mode;
}

- (void)setMode:(char)a3
{
  self->_int mode = a3;
}

- (int64_t)birthtime
{
  return self->_birthtime;
}

- (void)setBirthtime:(int64_t)a3
{
  self->_birthtime = a3;
}

- (int64_t)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(int64_t)a3
{
  self->_lastUsedTime = a3;
}

- (int64_t)favoriteRank
{
  return self->_favoriteRank;
}

- (void)setFavoriteRank:(int64_t)a3
{
  self->_favoriteRank = a3;
}

- (BRCItemID)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
}

- (BOOL)isHiddenExt
{
  return self->_hiddenExt;
}

- (void)setHiddenExt:(BOOL)a3
{
  self->_hiddenExt = a3;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void)setXattrSignature:(id)a3
{
}

- (NSData)finderTags
{
  return self->_finderTags;
}

- (void)setFinderTags:(id)a3
{
}

- (NSString)logicalName
{
  return self->_logicalName;
}

- (void)setLogicalName:(id)a3
{
}

- (NSString)aliasTarget
{
  return self->_aliasTarget;
}

- (NSString)trashPutBackPath
{
  return self->_trashPutBackPath;
}

- (void)setTrashPutBackPath:(id)a3
{
}

- (BRCItemID)trashPutBackParentID
{
  return self->_trashPutBackParentID;
}

- (void)setTrashPutBackParentID:(id)a3
{
}

- (BRCUserRowID)creatorRowID
{
  return self->_creatorRowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creatorRowID, 0);
  objc_storeStrong((id *)&self->_trashPutBackParentID, 0);
  objc_storeStrong((id *)&self->_trashPutBackPath, 0);
  objc_storeStrong((id *)&self->_finderTags, 0);
  objc_storeStrong((id *)&self->_lazyXattr, 0);
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_aliasTarget, 0);
  objc_storeStrong((id *)&self->_logicalName, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_ckInfo, 0);
}

- (void)_aliasTargetItemID
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _type == BRC_ITEM_TYPE_ALIAS%@", v2, v3, v4, v5, v6);
}

- (void)_updateAliasTarget:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: containerID%@", v2, v3, v4, v5, v6);
}

- (void)diffAgainst:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Stat shouldn't be nil%@", v2, v3, v4, v5, v6);
}

- (void)setCreatorRowID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: creatorRowIDLongLongValue >= 0%@", v2, v3, v4, v5, v6);
}

@end