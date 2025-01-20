@interface BRCLocalStatInfo
+ (char)modeFromImportObject:(id)a3 isPackageFault:(BOOL)a4;
+ (id)_finderTagsFromImportObject:(id)a3;
- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4;
- (BRCLocalStatInfo)initWithImportObject:(id)a3 error:(id *)a4;
- (BRCLocalStatInfo)initWithLocalStatInfo:(id)a3;
- (BRFieldStructureSignature)versionSignature;
- (NSNumber)processingStamp;
- (NSString)fpCreationItemIdentifier;
- (NSString)logicalNameWithoutLocalBounce;
- (NSString)oldVersionIdentifier;
- (NSString)rawBouncedLogicalName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithContext:(id)a3 origName:(id)a4;
- (id)initAsShareAcceptFaultWithName:(id)a3 mode:(char)a4 isDirectory:(BOOL)a5;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (id)logicalName;
- (unint64_t)diffAgainstLocalInfo:(id)a3;
- (unint64_t)localChangeCount;
- (unsigned)itemScope;
- (void)_markChildPropagationComplete;
- (void)_markDead;
- (void)_markDeadAsSharedTopLevelItemWithDocumentsItemID:(id)a3;
- (void)_markNeedsPropertiesPropagatedToChildren;
- (void)_markZombieForCrossZoneMove;
- (void)_moveItemAsideWithUUIDString;
- (void)_setCKInfo:(id)a3;
- (void)_setItemScope:(unsigned __int8)a3;
- (void)_updateStatAliasMeta:(id)a3;
- (void)_updateStatMeta:(id)a3;
- (void)_updateStatMetaFromServer:(id)a3;
- (void)bumpLocalChangeCount;
- (void)clearBouncedName;
- (void)clearCKInfo;
- (void)itemScope;
- (void)setFilename:(id)a3;
- (void)setFilename:(id)a3 forceBouncedLogicalName:(id)a4 serverName:(id)a5;
- (void)setFpCreationItemIdentifier:(id)a3;
- (void)setItemScope:(unsigned __int8)a3;
- (void)setRawBouncedLogicalName:(id)a3;
- (void)updateFromImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4;
- (void)updateWithFileSystemFlags:(unint64_t)a3 ignoreExecutable:(BOOL)a4;
@end

@implementation BRCLocalStatInfo

- (id)logicalName
{
  bouncedLogicalName = self->_bouncedLogicalName;
  if (!bouncedLogicalName) {
    bouncedLogicalName = self->super._logicalName;
  }
  return bouncedLogicalName;
}

- (NSString)logicalNameWithoutLocalBounce
{
  return self->super._logicalName;
}

- (unsigned)itemScope
{
  int itemScope = self->_itemScope;
  if (!itemScope)
  {
    if (self->super._state == 1)
    {
      LOBYTE(itemScope) = 0;
    }
    else
    {
      v4 = brc_bread_crumbs();
      v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo itemScope]();
      }

      LOBYTE(itemScope) = self->_itemScope;
    }
  }
  return itemScope;
}

- (id)descriptionWithContext:(id)a3 origName:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)BRCLocalStatInfo;
  v5 = [(BRCStatInfo *)&v15 descriptionWithContext:a3 origName:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo descriptionWithContext:origName:]();
    }
  }
  bouncedLogicalName = self->_bouncedLogicalName;
  if (bouncedLogicalName)
  {
    v7 = [(NSString *)bouncedLogicalName fp_obfuscatedFilename];
    [v5 appendFormat:@" bln:\"%@\"", v7];
  }
  int itemScope = self->_itemScope;
  v9 = @"docs";
  v10 = @"unknown";
  if (itemScope == 3) {
    v10 = @"trash";
  }
  if (itemScope != 2) {
    v9 = v10;
  }
  if (itemScope == 1) {
    v11 = @"data";
  }
  else {
    v11 = v9;
  }
  [v5 appendFormat:@" sc:%@", v11];
  if (self->_localChangeCount) {
    objc_msgSend(v5, "appendFormat:", @" lch:%llx", self->_localChangeCount);
  }
  if (self->_oldVersionIdentifier) {
    [v5 appendFormat:@" over:%@", self->_oldVersionIdentifier];
  }
  if (self->_processingStamp) {
    [v5 appendFormat:@" pstamp:%@", self->_processingStamp];
  }
  return v5;
}

- (id)description
{
  return [(BRCLocalStatInfo *)self descriptionWithContext:0 origName:0];
}

- (id)initAsShareAcceptFaultWithName:(id)a3 mode:(char)a4 isDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCLocalStatInfo;
  v9 = [(BRCLocalStatInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->super._state = 0;
    if (v5) {
      char v11 = 10;
    }
    else {
      char v11 = 8;
    }
    v9->super._type = v11;
    v9->super._mode = a4;
    [(BRCLocalStatInfo *)v9 setFilename:v8];
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithLocalStatInfo:self];
}

- (void)setFilename:(id)a3
{
}

- (void)setFilename:(id)a3 forceBouncedLogicalName:(id)a4 serverName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((objc_msgSend(v9, "br_isSideFaultName") & 1) != 0 || objc_msgSend(v10, "br_isSideFaultName"))
  {
    v12 = brc_bread_crumbs();
    objc_super v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo setFilename:forceBouncedLogicalName:serverName:]();
    }
  }
  else
  {
    p_bouncedLogicalName = &self->_bouncedLogicalName;
    if (![(NSString *)self->_bouncedLogicalName isEqualToString:v9]
      || ([v11 isEqualToString:*p_bouncedLogicalName] & 1) != 0)
    {
      objc_storeStrong((id *)&self->_bouncedLogicalName, a4);
      objc_storeStrong((id *)&self->super._logicalName, a3);
      goto LABEL_6;
    }
    v12 = brc_bread_crumbs();
    objc_super v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalStatInfo setFilename:forceBouncedLogicalName:serverName:](p_bouncedLogicalName);
    }
  }

LABEL_6:
}

- (void)_setItemScope:(unsigned __int8)a3
{
  self->_int itemScope = a3;
}

- (void)_setCKInfo:(id)a3
{
}

- (void)_moveItemAsideWithUUIDString
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't move aside a root item!%@", v2, v3, v4, v5, v6);
}

- (unint64_t)diffAgainstLocalInfo:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = [(BRCStatInfo *)self diffAgainst:v4];
  unint64_t v6 = v5;
  if ((v5 & 0x100000000) == 0 && self->super._state != *((unsigned __int8 *)v4 + 24)) {
    unint64_t v6 = v5 | 0x100000000;
  }
  if ((v6 & 0x1000000000) != 0) {
    goto LABEL_10;
  }
  v7 = (void *)v4[19];
  id v8 = self->_bouncedLogicalName;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_10;
  }
  id v10 = v9;
  if (!v9)
  {

    goto LABEL_15;
  }
  char v11 = [(NSString *)v8 isEqual:v9];

  if (v11)
  {
LABEL_10:
    if ((v6 & 0x2000000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_15:
  v6 |= 0x1000000000uLL;
  if ((v6 & 0x2000000000) != 0) {
    goto LABEL_13;
  }
LABEL_11:
  if (self->_itemScope != *((unsigned __int8 *)v4 + 160)) {
    v6 |= 0x2000000000uLL;
  }
LABEL_13:

  return v6;
}

- (void)_markZombieForCrossZoneMove
{
  self->super._state = -3;
  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;
}

- (void)_markDead
{
  if (self->super._state != 1)
  {
    self->super._state = 1;
    processingStamp = self->_processingStamp;
    self->_processingStamp = 0;
  }
}

- (void)_markDeadAsSharedTopLevelItemWithDocumentsItemID:(id)a3
{
  uint64_t v4 = (BRCItemID *)a3;
  [(BRCLocalStatInfo *)self _markDead];
  parentID = self->super._parentID;
  self->super._parentID = v4;
}

- (void)_updateStatMeta:(id)a3
{
  id v4 = a3;
  self->super._mode = [v4 mode];
  self->super._birthtime = [v4 birthtime];
  self->super._hiddenExt = [v4 isHiddenExt];
  unint64_t v5 = [v4 xattrSignature];
  xattrSignature = self->super._xattrSignature;
  self->super._xattrSignature = v5;

  lazyXattr = self->super._lazyXattr;
  self->super._lazyXattr = 0;

  id v8 = [v4 finderTags];
  finderTags = self->super._finderTags;
  self->super._finderTags = v8;

  self->super._favoriteRank = [v4 favoriteRank];
  self->super._lastUsedTime = [v4 lastUsedTime];
  id v10 = [v4 trashPutBackPath];
  trashPutBackPath = self->super._trashPutBackPath;
  self->super._trashPutBackPath = v10;

  v12 = [v4 trashPutBackParentID];

  trashPutBackParentID = self->super._trashPutBackParentID;
  self->super._trashPutBackParentID = v12;
}

- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCLocalStatInfo;
  return [(BRCStatInfo *)&v5 checkStateWithItemID:a3 logToFile:a4];
}

- (NSNumber)processingStamp
{
  return self->_processingStamp;
}

- (void)setItemScope:(unsigned __int8)a3
{
  self->_int itemScope = a3;
}

- (NSString)rawBouncedLogicalName
{
  return self->_bouncedLogicalName;
}

- (void)setRawBouncedLogicalName:(id)a3
{
}

- (unint64_t)localChangeCount
{
  return self->_localChangeCount;
}

- (NSString)oldVersionIdentifier
{
  return self->_oldVersionIdentifier;
}

- (NSString)fpCreationItemIdentifier
{
  return self->_fpCreationItemIdentifier;
}

- (void)setFpCreationItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingStamp, 0);
  objc_storeStrong((id *)&self->_bouncedLogicalName, 0);
  objc_storeStrong((id *)&self->_fpCreationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCLocalStatInfo;
  v7 = [(BRCStatInfo *)&v17 initFromResultSet:v6 pos:v4];
  if (v7)
  {
    uint64_t v8 = [v6 numberAtIndex:(v4 + 16)];
    id v9 = (void *)v7[21];
    v7[21] = v8;

    uint64_t v10 = [v6 stringAtIndex:(v4 + 17)];
    char v11 = (void *)v7[19];
    v7[19] = v10;

    *((unsigned char *)v7 + 160) = [v6 intAtIndex:(v4 + 18)];
    v7[16] = [v6 unsignedLongLongAtIndex:(v4 + 19)];
    uint64_t v12 = [v6 stringAtIndex:(v4 + 20)];
    objc_super v13 = (void *)v7[17];
    v7[17] = v12;

    uint64_t v14 = [v6 stringAtIndex:(v4 + 21)];
    objc_super v15 = (void *)v7[18];
    v7[18] = v14;
  }
  return v7;
}

- (BRCLocalStatInfo)initWithLocalStatInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCLocalStatInfo;
  objc_super v5 = [(BRCStatInfo *)&v8 initWithStatInfo:v4];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_processingStamp, *((id *)v4 + 21));
    objc_storeStrong((id *)&v6->_bouncedLogicalName, *((id *)v4 + 19));
    v6->_localChangeCount = *((void *)v4 + 16);
    objc_storeStrong((id *)&v6->_oldVersionIdentifier, *((id *)v4 + 17));
    v6->_int itemScope = *((unsigned char *)v4 + 160);
    objc_storeStrong((id *)&v6->_fpCreationItemIdentifier, *((id *)v4 + 18));
  }

  return v6;
}

- (BRFieldStructureSignature)versionSignature
{
  uint64_t v2 = [[BRFieldStructureSignature alloc] initWithLocalStatInfo:self];
  return v2;
}

- (void)_updateStatAliasMeta:(id)a3
{
  id v4 = a3;
  if (([v4 isBRAlias] & 1) == 0)
  {
    objc_super v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(FPFSAdditions) _updateStatAliasMeta:]();
    }
  }
  objc_super v5 = [v4 st];
  id v6 = [v5 logicalName];
  logicalName = v6;
  if (!v6) {
    logicalName = self->super._logicalName;
  }
  objc_storeStrong((id *)&self->super._logicalName, logicalName);

  objc_super v8 = [v4 parentItemIDOnFS];
  parentID = v8;
  if (!v8) {
    parentID = self->super._parentID;
  }
  objc_storeStrong((id *)&self->super._parentID, parentID);

  uint64_t v10 = [v4 st];
  char v11 = [v10 finderTags];
  finderTags = self->super._finderTags;
  self->super._finderTags = v11;

  objc_super v13 = [v4 st];
  self->super._favoriteRank = [v13 favoriteRank];

  uint64_t v14 = [v4 st];
  self->super._lastUsedTime = [v14 lastUsedTime];
}

- (void)updateWithFileSystemFlags:(unint64_t)a3 ignoreExecutable:(BOOL)a4
{
  self->super._hiddenExt = (a3 & 0x10) != 0;
  unsigned int v4 = (a3 >> 2) & 1;
  if ((a3 & 1) != 0 && !a4) {
    LOBYTE(v4) = ((a3 & 4) != 0) | 2;
  }
  self->super._mode = v4;
}

- (BRCLocalStatInfo)initWithImportObject:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCLocalStatInfo;
  v7 = [(BRCLocalStatInfo *)&v22 init];
  objc_super v8 = v7;
  if (!v7) {
    goto LABEL_13;
  }
  v7->super._state = 0;
  if (![v6 isFault])
  {
    if ([v6 isSymLink])
    {
      char v15 = 5;
    }
    else
    {
      if ([v6 isBRAlias])
      {
        objc_super v17 = brc_bread_crumbs();
        v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]();
        }

        char v11 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: nobody should import an item from a BR Alias");
        if (!v11) {
          goto LABEL_20;
        }
        uint64_t v12 = brc_bread_crumbs();
        objc_super v13 = brc_default_log();
        if (!os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
          goto LABEL_19;
        }
        uint64_t v14 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v24 = "-[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]";
        __int16 v25 = 2080;
        if (!a4) {
          uint64_t v14 = "(ignored by caller)";
        }
        goto LABEL_9;
      }
      if ([v6 isFinderAlias])
      {
        char v15 = 6;
      }
      else if ([v6 isDocument])
      {
        char v15 = 1;
      }
      else
      {
        if (([v6 isUnixDir] & 1) == 0)
        {
          v20 = brc_bread_crumbs();
          v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            -[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]();
          }

          char v11 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Unexpected import object %@", v6);
          if (!v11) {
            goto LABEL_20;
          }
          uint64_t v12 = brc_bread_crumbs();
          objc_super v13 = brc_default_log();
          if (!os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
            goto LABEL_19;
          }
          uint64_t v14 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v24 = "-[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]";
          __int16 v25 = 2080;
          if (!a4) {
            uint64_t v14 = "(ignored by caller)";
          }
          goto LABEL_9;
        }
        char v15 = 0;
      }
    }
    v8->super._type = v15;
    [(BRCLocalStatInfo *)v8 updateFromImportObject:v6 onlyContentDependentProperties:0];
LABEL_13:
    v16 = v8;
    goto LABEL_23;
  }
  id v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]();
  }

  char v11 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: nobody should import an item from a fault");
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v12 = brc_bread_crumbs();
  objc_super v13 = brc_default_log();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
  {
    uint64_t v14 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v24 = "-[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]";
    __int16 v25 = 2080;
    if (!a4) {
      uint64_t v14 = "(ignored by caller)";
    }
LABEL_9:
    v26 = v14;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2112;
    v30 = v12;
    _os_log_error_impl(&dword_23FA42000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }
LABEL_19:

LABEL_20:
  if (a4) {
    *a4 = v11;
  }

  v16 = 0;
LABEL_23:

  return v16;
}

+ (char)modeFromImportObject:(id)a3 isPackageFault:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  char v6 = [v5 isWritable];
  if ([v5 isExecutable]
    && [v5 isFile]
    && ([v5 isFault] & v4) == 0)
  {
    v6 |= 2u;
  }

  return v6;
}

+ (id)_finderTagsFromImportObject:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 hasFinderTags])
  {
    id v7 = 0;
    id v6 = 0;
    goto LABEL_15;
  }
  BOOL v4 = [v3 fileURL];
  id v23 = 0;
  id v24 = 0;
  char v5 = objc_msgSend(v4, "br_getTagNames:error:", &v24, &v23);
  id v6 = v24;
  id v7 = v23;

  if ((v5 & 1) == 0)
  {
    brc_bread_crumbs();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      +[BRCLocalStatInfo(FPFSAdditions) _finderTagsFromImportObject:]();
    }

    uint64_t v10 = 0;
    goto LABEL_19;
  }
  if (![v6 count])
  {
LABEL_15:
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  objc_super v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[BRCLocalStatInfo(FPFSAdditions) _finderTagsFromImportObject:v9];
  }

  uint64_t v10 = objc_alloc_init(BRFieldFinderTags);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        -[BRFieldFinderTags addTags:](v10, "addTags:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v13);
  }
LABEL_19:

LABEL_20:
  objc_super v17 = [(BRFieldFinderTags *)v10 data];

  return v17;
}

- (void)_updateStatMetaFromServer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 st];
  self->super._mode = [v5 mode];
  self->super._birthtime = [v5 birthtime];
  self->super._hiddenExt = [v5 isHiddenExt];
  id v6 = [v5 xattrSignature];
  xattrSignature = self->super._xattrSignature;
  self->super._xattrSignature = v6;

  lazyXattr = self->super._lazyXattr;
  self->super._lazyXattr = 0;

  id v9 = [v5 finderTags];
  finderTags = self->super._finderTags;
  self->super._finderTags = v9;

  self->super._favoriteRank = [v5 favoriteRank];
  self->super._lastUsedTime = [v5 lastUsedTime];
  id v11 = [v5 trashPutBackPath];
  trashPutBackPath = self->super._trashPutBackPath;
  self->super._trashPutBackPath = v11;

  uint64_t v13 = [v5 trashPutBackParentID];
  trashPutBackParentID = self->super._trashPutBackParentID;
  self->super._trashPutBackParentID = v13;

  char v15 = [v5 ckInfo];
  ckInfo = self->super._ckInfo;
  self->super._ckInfo = v15;

  if (self->super._state == 1 && ![v5 state])
  {
    bouncedLogicalName = self->_bouncedLogicalName;
    self->_bouncedLogicalName = 0;
  }
  self->super._state = [v5 state];
  v18 = [v5 logicalName];
  logicalName = self->super._logicalName;
  self->super._logicalName = v18;

  long long v20 = [v4 parentItemIDOnFS];

  parentID = self->super._parentID;
  self->super._parentID = v20;

  aliasTarget = self->super._aliasTarget;
  if (aliasTarget)
  {
    id v23 = [v5 aliasTarget];
    BOOL v24 = [(NSString *)aliasTarget isEqualToString:v23];

    if (!v24)
    {
      __int16 v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(FPFSAdditions) _updateStatMetaFromServer:]();
      }
    }
  }
}

- (void)updateFromImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 isUnixDir] && (objc_msgSend(v6, "isExecutable") & 1) == 0)
  {
    id v7 = brc_bread_crumbs();
    objc_super v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      BOOL v24 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Inaccessible folder %@%@", (uint8_t *)&v21, 0x16u);
    }
  }
  self->super._state = 0;
  id v9 = [v6 parentItemGlobalID];

  if (v9)
  {
    uint64_t v10 = [v6 parentItemGlobalID];
    id v11 = [v10 itemID];
    parentID = self->super._parentID;
    self->super._parentID = v11;
  }
  if (!a4)
  {
    self->super._birthtime = [v6 birthTime];
    uint64_t v13 = [v6 logicalName];
    [(BRCLocalStatInfo *)self setFilename:v13];

    uint64_t v14 = +[BRCLocalStatInfo _finderTagsFromImportObject:v6];
    char v15 = (void *)v14;
    if (self->super._finderTags) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      objc_super v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalStatInfo(FPFSAdditions) updateFromImportObject:onlyContentDependentProperties:]();
      }
    }
    objc_storeStrong((id *)&self->super._finderTags, v15);
    self->super._hiddenExt = [v6 isHiddenExtension];
    if ([v6 isFault]) {
      uint64_t v19 = [v6 isPackageRoot];
    }
    else {
      uint64_t v19 = 0;
    }
    self->super._mode = +[BRCLocalStatInfo modeFromImportObject:v6 isPackageFault:v19];
  }
  long long v20 = [(BRFieldCKInfo *)self->super._ckInfo etag];

  if (!v20) {
    [(BRCStatInfo *)self setCreatorRowID:&unk_26F3DD280];
  }
}

- (void)clearCKInfo
{
  ckInfo = self->super._ckInfo;
  self->super._ckInfo = 0;

  oldVersionIdentifier = self->_oldVersionIdentifier;
  self->_oldVersionIdentifier = 0;
}

- (void)bumpLocalChangeCount
{
  oldVersionIdentifier = self->_oldVersionIdentifier;
  self->_oldVersionIdentifier = 0;

  ++self->_localChangeCount;
}

- (void)clearBouncedName
{
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalStatInfo(FPFSAdditions) clearBouncedName]();
  }

  bouncedLogicalName = self->_bouncedLogicalName;
  self->_bouncedLogicalName = 0;
}

- (void)_markNeedsPropertiesPropagatedToChildren
{
  if (!self->_processingStamp)
  {
    id v3 = [NSNumber numberWithLongLong:brc_current_date_nsec()];
    processingStamp = self->_processingStamp;
    self->_processingStamp = v3;
  }
}

- (void)_markChildPropagationComplete
{
  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;
}

- (void)itemScope
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _itemScope != BRC_ITEM_SCOPE_UNKNOWN || _state == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
}

- (void)descriptionWithContext:origName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [s isKindOfClass:[NSMutableString class]]%@", v2, v3, v4, v5, v6);
}

- (void)setFilename:forceBouncedLogicalName:serverName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: got a fault name%@", v2, v3, v4, v5, v6);
}

- (void)setFilename:(void *)a1 forceBouncedLogicalName:serverName:.cold.2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Not overriding name equal to bounced name %@%@", (void)v3, DWORD2(v3));
}

@end