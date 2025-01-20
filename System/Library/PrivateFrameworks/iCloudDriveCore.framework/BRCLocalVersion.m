@interface BRCLocalVersion
- (BOOL)isMissingUploadsWithDiffs:(unint64_t)a3;
- (BOOL)shouldRecreateUploadJobGivenDiffs:(unint64_t)a3;
- (BRCItemGlobalID)previousItemGlobalID;
- (BRCLocalVersion)initWithImportObject:(id)a3;
- (BRCLocalVersion)initWithLocalVersion:(id)a3;
- (BRCLocalVersion)initWithVersion:(id)a3;
- (BRFieldContentSignature)versionSignature;
- (CKRecord)uploadedAssets;
- (NSError)uploadError;
- (NSString)oldVersionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithContext:(id)a3;
- (id)initForPackage:(BOOL)a3;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (id)isPackageObj;
- (id)sizeObj;
- (unint64_t)diffAgainstLocalVersion:(id)a3;
- (unint64_t)localChangeCount;
- (void)_clearSignatures:(unint64_t)a3 isPackage:(BOOL)a4;
- (void)bumpLocalChangeCount;
- (void)clearCKInfo;
- (void)clearUploadedAssets;
- (void)setOldVersionIdentifier:(id)a3;
- (void)setPreviousItemGlobalID:(id)a3;
- (void)setUploadError:(id)a3;
- (void)setUploadedAssets:(id)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
- (void)updateServerFieldsFromVersion:(id)a3;
- (void)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4;
- (void)updateWithPackageSize:(unint64_t)a3;
@end

@implementation BRCLocalVersion

- (id)isPackageObj
{
  v2 = NSNumber;
  BOOL v3 = [(BRCVersion *)self isPackage];
  return (id)[v2 numberWithBool:v3];
}

- (id)sizeObj
{
  return (id)[NSNumber numberWithLongLong:self->super._size];
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCLocalVersion;
  v5 = [(BRCVersion *)&v10 descriptionWithContext:v4];
  v6 = (void *)[v5 mutableCopy];

  uploadError = self->_uploadError;
  if (uploadError)
  {
    v8 = +[BRCDumpContext stringFromError:uploadError context:v4];
    [v6 appendFormat:@" ul-error:%@", v8];
  }
  if (self->_uploadedAssets) {
    [v6 appendString:@" uploaded-assets"];
  }
  if (self->_previousItemGlobalID) {
    [v6 appendFormat:@" prev-item:%@", self->_previousItemGlobalID];
  }
  if (self->_localChangeCount) {
    objc_msgSend(v6, "appendFormat:", @" lch:%llx", self->_localChangeCount);
  }
  if (self->_oldVersionIdentifier) {
    [v6 appendFormat:@" over:%@", self->_oldVersionIdentifier];
  }

  return v6;
}

- (unint64_t)diffAgainstLocalVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BRCVersion *)self diffAgainst:v4];
  if ((v5 & 0x1000000000000) != 0) {
    goto LABEL_7;
  }
  v6 = (void *)v4[17];
  v7 = self->_uploadedAssets;
  v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {

    goto LABEL_14;
  }
  char v10 = [(CKRecord *)v7 isEqual:v8];

  if (v10)
  {
LABEL_7:
    if ((v5 & 0x2000000000000) != 0) {
      goto LABEL_18;
    }
LABEL_8:
    v11 = (void *)v4[18];
    v12 = self->_uploadError;
    v13 = v11;
    if (v12 == v13)
    {

      goto LABEL_18;
    }
    v14 = v13;
    if (v13)
    {
      char v15 = [(NSError *)v12 isEqual:v13];

      if (v15) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v5 |= 0x2000000000000uLL;
    goto LABEL_18;
  }
LABEL_14:
  v5 |= 0x1000000000000uLL;
  if ((v5 & 0x2000000000000) == 0) {
    goto LABEL_8;
  }
LABEL_18:
  if ((v5 & 0x4000000000000) == 0)
  {
    v16 = (void *)v4[19];
    v17 = self->_previousItemGlobalID;
    v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      v19 = v18;
      if (v18)
      {
        BOOL v20 = [(BRCItemGlobalID *)v17 isEqual:v18];

        if (v20) {
          goto LABEL_26;
        }
      }
      else
      {
      }
      v5 |= 0x4000000000000uLL;
    }
  }
LABEL_26:

  return v5;
}

- (id)initForPackage:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCLocalVersion;
  id v4 = [(BRCLocalVersion *)&v7 init];
  unint64_t v5 = v4;
  if (v4) {
    [(BRCLocalVersion *)v4 _clearSignatures:3 isPackage:v3];
  }
  return v5;
}

- (BRCLocalVersion)initWithVersion:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRCLocalVersion;
  return [(BRCVersion *)&v4 initWithVersion:a3];
}

- (BRCLocalVersion)initWithLocalVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BRCLocalVersion *)self initWithVersion:v4];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 17) copy];
    uploadedAssets = v5->_uploadedAssets;
    v5->_uploadedAssets = (CKRecord *)v6;

    uint64_t v8 = [*((id *)v4 + 18) copy];
    uploadError = v5->_uploadError;
    v5->_uploadError = (NSError *)v8;

    uint64_t v10 = [*((id *)v4 + 19) copy];
    previousItemGlobalID = v5->_previousItemGlobalID;
    v5->_previousItemGlobalID = (BRCItemGlobalID *)v10;

    v5->_localChangeCount = *((void *)v4 + 15);
    uint64_t v12 = [*((id *)v4 + 16) copy];
    oldVersionIdentifier = v5->_oldVersionIdentifier;
    v5->_oldVersionIdentifier = (NSString *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithLocalVersion:self];
}

- (BOOL)shouldRecreateUploadJobGivenDiffs:(unint64_t)a3
{
  return (a3 & 0x4000C007A0000) != 0;
}

- (BOOL)isMissingUploadsWithDiffs:(unint64_t)a3
{
  if ([(NSData *)self->super._contentSignature brc_signatureIsPendingPlaceHolder])
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:]();
    }
  }
  else if ([(NSData *)self->super._thumbnailSignature brc_signatureIsPendingPlaceHolder])
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:]();
    }
  }
  else if ((a3 & 0x200000) != 0 && self->super._xattrSignature)
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:].cold.5();
    }
  }
  else if ((a3 & 0x1000000000000) != 0 && !self->_uploadedAssets)
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:].cold.4();
    }
  }
  else
  {
    if ((a3 & 0x2000000000000) == 0 || self->_uploadError) {
      return 0;
    }
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:]();
    }
  }

  return 1;
}

- (void)_clearSignatures:(unint64_t)a3 isPackage:(BOOL)a4
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263EFF8F8], "brc_pendingPlaceholderForPackage:", a4);
    uint64_t v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    contentSignature = self->super._contentSignature;
    self->super._contentSignature = v6;
  }
  if ((a3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x263EFF8F8], "brc_pendingPlaceholderForPackage:", 0, a4);
    uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    thumbnailSignature = self->super._thumbnailSignature;
    self->super._thumbnailSignature = v8;
  }
  else if (!a3 && !self->_uploadedAssets && !self->_uploadError)
  {
    return;
  }
  uploadedAssets = self->_uploadedAssets;
  self->_uploadedAssets = 0;

  uploadError = self->_uploadError;
  self->_uploadError = 0;
}

- (void)clearUploadedAssets
{
  uploadedAssets = self->_uploadedAssets;
  self->_uploadedAssets = 0;

  uploadError = self->_uploadError;
  self->_uploadError = 0;
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)updateServerFieldsFromVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 conflictLoserEtags];
  conflictLoserEtags = self->super._conflictLoserEtags;
  self->super._conflictLoserEtags = v5;

  objc_super v7 = [v4 lastEditorDeviceOrUserRowID];
  [(BRCVersion *)self setLastEditorDeviceOrUserRowID:v7];

  id v8 = [v4 lastEditorDeviceName];

  [(BRCVersion *)self setLastEditorDeviceName:v8];
}

- (BRFieldContentSignature)versionSignature
{
  v2 = [[BRFieldContentSignature alloc] initWithLocalVersion:self];
  return v2;
}

- (CKRecord)uploadedAssets
{
  return self->_uploadedAssets;
}

- (void)setUploadedAssets:(id)a3
{
}

- (NSError)uploadError
{
  return self->_uploadError;
}

- (void)setUploadError:(id)a3
{
}

- (BRCItemGlobalID)previousItemGlobalID
{
  return self->_previousItemGlobalID;
}

- (void)setPreviousItemGlobalID:(id)a3
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

- (void)setOldVersionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousItemGlobalID, 0);
  objc_storeStrong((id *)&self->_uploadError, 0);
  objc_storeStrong((id *)&self->_uploadedAssets, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCLocalVersion;
  objc_super v7 = [(BRCVersion *)&v24 initFromResultSet:v6 pos:v4];
  if (v7)
  {
    uint64_t v8 = (v4 + 12);
    uint64_t v9 = (v4 + 13);
    uint64_t v10 = [v6 unarchivedObjectOfClass:objc_opt_class() atIndex:v8];
    v11 = (void *)v7[17];
    v7[17] = v10;

    if (_allowedClassesForErrors_once != -1) {
      dispatch_once(&_allowedClassesForErrors_once, &__block_literal_global_64);
    }
    id v12 = (id)_allowedClassesForErrors_allowedClasses;
    uint64_t v13 = [v6 unarchivedObjectOfClasses:v12 atIndex:v9];
    v14 = (void *)v7[18];
    v7[18] = v13;

    uint64_t v15 = [v6 objectOfClass:objc_opt_class() atIndex:(v9 + 1)];
    uint64_t v16 = [v6 numberAtIndex:(v9 + 2)];
    v17 = (void *)v16;
    if (v15 && v16)
    {
      v18 = [[BRCItemGlobalID alloc] initWithZoneRowID:v16 itemID:v15];
      v19 = (void *)v7[19];
      v7[19] = v18;
    }
    else
    {
      if (!(v15 | v16))
      {
LABEL_12:
        v7[15] = [v6 unsignedLongLongAtIndex:(v9 + 3)];
        uint64_t v21 = [v6 unarchivedObjectOfClass:objc_opt_class() atIndex:(v9 + 4)];
        v22 = (void *)v7[16];
        v7[16] = v21;

        goto LABEL_13;
      }
      v19 = brc_bread_crumbs();
      BOOL v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        v28 = v17;
        __int16 v29 = 2112;
        v30 = v19;
        _os_log_fault_impl(&dword_23FA42000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item has only one of the itemID %@ and zoneRowID %@ fields%@", buf, 0x20u);
      }
    }
    goto LABEL_12;
  }
LABEL_13:

  return v7;
}

- (BRCLocalVersion)initWithImportObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCLocalVersion;
  unint64_t v5 = [(BRCLocalVersion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 quarantineInfo];
    quarantineInfo = v5->super._quarantineInfo;
    v5->super._quarantineInfo = (NSData *)v6;

    [(BRCLocalVersion *)v5 updateWithImportObject:v4 onlyContentDependentProperties:0];
  }

  return v5;
}

- (void)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4
{
  id v6 = a3;
  id v10 = v6;
  if (a4)
  {
    p_originalPOSIXName = &self->super._originalPOSIXName;
    if (self->super._originalPOSIXName) {
      goto LABEL_6;
    }
  }
  else
  {
    self->super._mtime = [v6 modificationTime];
    p_originalPOSIXName = &self->super._originalPOSIXName;
  }
  uint64_t v8 = [v10 logicalName];
  objc_super v9 = *p_originalPOSIXName;
  *p_originalPOSIXName = (NSString *)v8;

  id v6 = v10;
LABEL_6:
  if (([v6 isPackageRoot] & 1) == 0) {
    self->super._size = [v10 size];
  }
  -[BRCLocalVersion _clearSignatures:isPackage:](self, "_clearSignatures:isPackage:", 3, [v10 isPackageRoot]);
}

- (void)updateWithPackageSize:(unint64_t)a3
{
  self->super._size = a3;
}

- (void)bumpLocalChangeCount
{
  oldVersionIdentifier = self->_oldVersionIdentifier;
  self->_oldVersionIdentifier = 0;

  ++self->_localChangeCount;
}

- (void)clearCKInfo
{
  ckInfo = self->super._ckInfo;
  self->super._ckInfo = 0;

  oldVersionIdentifier = self->_oldVersionIdentifier;
  self->_oldVersionIdentifier = 0;
}

- (void)isMissingUploadsWithDiffs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] we're a document missing a content signature%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] we're a document missing a thumbnail signature%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] we're a document with an upload error change%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] we're a document with an uploaded asset change%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] we're a document with an xattr change%@", v2, v3, v4, v5, v6);
}

@end