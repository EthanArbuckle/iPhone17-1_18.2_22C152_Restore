@interface BRCVersion
- (BOOL)_hasLastEditorDeviceRowID;
- (BOOL)_hasLastEditorRowID;
- (BOOL)check:(id)a3 logToFile:(__sFILE *)a4;
- (BOOL)hasThumbnail;
- (BOOL)isEtagEqual:(id)a3;
- (BOOL)isPackage;
- (BOOL)isSmallAndMostRecentClientsGenerateThumbnails;
- (BRCUserRowID)lastEditorRowID;
- (BRCVersion)initWithVersion:(id)a3;
- (BRFieldCKInfo)ckInfo;
- (NSData)contentSignature;
- (NSData)quarantineInfo;
- (NSData)thumbnailSignature;
- (NSData)xattrSignature;
- (NSNumber)editedSinceShared;
- (NSNumber)lastEditorDeviceOrUserRowID;
- (NSNumber)lastEditorDeviceRowID;
- (NSSet)conflictLoserEtags;
- (NSString)lastEditorDeviceName;
- (NSString)originalPOSIXName;
- (id)additionNameForItemID:(id)a3 zoneID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithContext:(id)a3;
- (id)displayNameWithoutExtension:(BOOL)a3;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (id)lastEditorDeviceDisplayNameWithDB:(id)a3;
- (id)lastEditorDisplayNameWithDB:(id)a3;
- (id)lastEditorUserIdentityWithDB:(id)a3;
- (id)lazyXattrWithStageRegistry:(id)a3;
- (id)uti;
- (int64_t)mtime;
- (int64_t)size;
- (int64_t)thumbnailSize;
- (unint64_t)diffAgainst:(id)a3;
- (void)isPackage;
- (void)isSmallAndMostRecentClientsGenerateThumbnails;
- (void)setCkInfo:(id)a3;
- (void)setConflictLoserEtags:(id)a3;
- (void)setContentSignature:(id)a3;
- (void)setEditedSinceShared:(id)a3;
- (void)setLastEditorDeviceName:(id)a3;
- (void)setLastEditorDeviceOrUserRowID:(id)a3;
- (void)setLastEditorDeviceRowID:(id)a3;
- (void)setLastEditorRowID:(id)a3;
- (void)setMtime:(int64_t)a3;
- (void)setOriginalPOSIXName:(id)a3;
- (void)setQuarantineInfo:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setThumbnailSignature:(id)a3;
- (void)setThumbnailSize:(int64_t)a3;
- (void)setXattrSignature:(id)a3;
@end

@implementation BRCVersion

- (BOOL)_hasLastEditorDeviceRowID
{
  lastEditorDeviceOrUserRowID = self->_lastEditorDeviceOrUserRowID;
  return !lastEditorDeviceOrUserRowID || [(NSNumber *)lastEditorDeviceOrUserRowID longLongValue] >= 0;
}

- (BOOL)_hasLastEditorRowID
{
  return ![(BRCVersion *)self _hasLastEditorDeviceRowID];
}

- (void)setLastEditorDeviceRowID:(id)a3
{
  v4 = (NSNumber *)a3;
  if ([(BRCVersion *)self _hasLastEditorRowID])
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCVersion setLastEditorDeviceRowID:]();
    }

    if (v4)
    {
LABEL_3:
      if ([(NSNumber *)v4 longLongValue] > 0) {
        goto LABEL_4;
      }
    }
  }
  else if (v4)
  {
    goto LABEL_3;
  }
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[BRCVersion setLastEditorDeviceRowID:]();
  }

LABEL_4:
  lastEditorDeviceOrUserRowID = self->_lastEditorDeviceOrUserRowID;
  self->_lastEditorDeviceOrUserRowID = v4;
}

- (void)setLastEditorRowID:(id)a3
{
  id v4 = a3;
  if (self->_lastEditorDeviceOrUserRowID && [(BRCVersion *)self _hasLastEditorDeviceRowID])
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCVersion setLastEditorRowID:]();
    }
  }
  uint64_t v5 = [v4 longLongValue];
  v6 = [NSNumber numberWithLongLong:-v5];
  lastEditorDeviceOrUserRowID = self->_lastEditorDeviceOrUserRowID;
  self->_lastEditorDeviceOrUserRowID = v6;
}

- (NSNumber)lastEditorDeviceRowID
{
  if ([(BRCVersion *)self _hasLastEditorDeviceRowID]) {
    v3 = self->_lastEditorDeviceOrUserRowID;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BRCUserRowID)lastEditorRowID
{
  if ([(BRCVersion *)self _hasLastEditorRowID])
  {
    v3 = objc_msgSend(NSNumber, "numberWithLongLong:", --[NSNumber longLongValue](self->_lastEditorDeviceOrUserRowID, "longLongValue"));
  }
  else
  {
    v3 = 0;
  }
  return (BRCUserRowID *)v3;
}

- (id)lastEditorDeviceDisplayNameWithDB:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCVersion *)self lastEditorDeviceRowID];
  v6 = v5;
  if (v5)
  {
    lastEditorDeviceName = self->_lastEditorDeviceName;
    if (lastEditorDeviceName) {
      v8 = lastEditorDeviceName;
    }
    else {
      v8 = (NSString *)objc_msgSend(v4, "stringWithSQL:", @"SELECT name FROM devices WHERE key = %lld", objc_msgSend(v5, "longLongValue"));
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)lastEditorUserIdentityWithDB:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCVersion *)self lastEditorRowID];
  if (v5)
  {
    v6 = +[BRCAccountSessionFPFS userIdentityForKey:v5 db:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)lastEditorDisplayNameWithDB:(id)a3
{
  v3 = [(BRCVersion *)self lastEditorUserIdentityWithDB:a3];
  id v4 = [v3 nameComponents];
  uint64_t v5 = objc_msgSend(v4, "br_formattedName");

  return v5;
}

- (id)displayNameWithoutExtension:(BOOL)a3
{
  return (id)[(NSString *)self->_originalPOSIXName br_displayFilenameWithExtensionHidden:a3];
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:64];
  ckInfo = self->_ckInfo;
  if (ckInfo)
  {
    v7 = [(BRFieldCKInfo *)ckInfo etag];
    [v5 appendFormat:@"etag:%@ ", v7];

    v8 = [(BRFieldCKInfo *)self->_ckInfo etagBeforeCrossZoneMove];

    if (v8)
    {
      v9 = [(BRFieldCKInfo *)self->_ckInfo etagBeforeCrossZoneMove];
      [v5 appendFormat:@"prev-etag:%@ ", v9];
    }
    if ([(BRFieldCKInfo *)self->_ckInfo hasDeletionChangeToken])
    {
      id v10 = objc_alloc(MEMORY[0x263EFD838]);
      v11 = [(BRFieldCKInfo *)self->_ckInfo deletionChangeToken];
      v12 = (void *)[v10 initWithData:v11];

      v13 = [v12 descriptionWithContext:v4];
      [v5 appendFormat:@"deletion-token:%@ ", v13];
    }
  }
  objc_msgSend(v5, "appendFormat:", @"mt:%lld ", self->_mtime);
  v14 = +[BRCDumpContext stringFromByteCount:self->_size context:v4];
  [v5 appendFormat:@"sz:%@ ", v14];

  if (self->_thumbnailSize >= 1)
  {
    v15 = +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:");
    [v5 appendFormat:@"tsz:%@ ", v15];
  }
  originalPOSIXName = self->_originalPOSIXName;
  if (originalPOSIXName)
  {
    v17 = [(NSString *)originalPOSIXName fp_obfuscatedFilename];
    [v5 appendFormat:@"n:\"%@\" ", v17];
  }
  contentSignature = self->_contentSignature;
  if (contentSignature)
  {
    if ([(NSData *)contentSignature brc_signatureIsPendingPlaceHolder])
    {
      if ([(BRCVersion *)self isPackage]) {
        v19 = @"<pkg-pending>";
      }
      else {
        v19 = @"<file-pending>";
      }
    }
    else
    {
      v19 = [(NSData *)self->_contentSignature brc_hexadecimalString];
    }
    v20 = +[BRCDumpContext highlightedString:v19 type:2 context:v4];
    [v5 appendFormat:@"sig:%@ ", v20];
  }
  thumbnailSignature = self->_thumbnailSignature;
  if (thumbnailSignature)
  {
    if ([(NSData *)thumbnailSignature brc_signatureIsPendingPlaceHolder])
    {
      v22 = @"<pending>";
    }
    else
    {
      v22 = [(NSData *)self->_thumbnailSignature brc_hexadecimalString];
    }
    v23 = +[BRCDumpContext highlightedString:v22 type:2 context:v4];
    [v5 appendFormat:@"tsig:%@ ", v23];
  }
  if ([(NSSet *)self->_conflictLoserEtags count])
  {
    v24 = [(NSSet *)self->_conflictLoserEtags allObjects];
    v25 = [v24 componentsJoinedByString:@", "];
    [v5 appendFormat:@"losers:{%@} ", v25];
  }
  editedSinceShared = self->_editedSinceShared;
  if (editedSinceShared) {
    objc_msgSend(v5, "appendFormat:", @"ess:%ld ", -[NSNumber integerValue](editedSinceShared, "integerValue"));
  }
  if ([(BRCVersion *)self _hasLastEditorDeviceRowID])
  {
    uint64_t v27 = [(BRCVersion *)self lastEditorDeviceRowID];
    v28 = (void *)v27;
    v29 = &unk_26F3DD118;
    if (v27) {
      v29 = (void *)v27;
    }
    [v5 appendFormat:@"device:%@ ", v29];
  }
  else
  {
    if (![(BRCVersion *)self _hasLastEditorRowID]) {
      goto LABEL_33;
    }
    v28 = [(BRCVersion *)self lastEditorRowID];
    [v5 appendFormat:@"last-editor:%@ ", v28];
  }

LABEL_33:
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    v31 = [(NSData *)xattrSignature brc_hexadecimalString];
    [v5 appendFormat:@"ea:%@ ", v31];
  }
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo) {
    objc_msgSend(v5, "appendFormat:", @"quarantine:%u ", -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  }
  objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);

  return v5;
}

- (id)description
{
  return [(BRCVersion *)self descriptionWithContext:0];
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [v6 stringAtIndex:v4];
  if (v7)
  {
    v28.receiver = self;
    v28.super_class = (Class)BRCVersion;
    v8 = [(BRCVersion *)&v28 init];
    if (v8)
    {
      uint64_t v9 = [v6 objectOfClass:objc_opt_class() atIndex:(v4 + 1)];
      ckInfo = v8->_ckInfo;
      v8->_ckInfo = (BRFieldCKInfo *)v9;

      v8->_mtime = [v6 longLongAtIndex:(v4 + 2)];
      objc_storeStrong((id *)&v8->_originalPOSIXName, v7);
      v8->_size = [v6 longLongAtIndex:(v4 + 3)];
      v8->_thumbnailSize = [v6 longLongAtIndex:(v4 + 4)];
      uint64_t v11 = [v6 dataAtIndex:(v4 + 5)];
      thumbnailSignature = v8->_thumbnailSignature;
      v8->_thumbnailSignature = (NSData *)v11;

      uint64_t v13 = [v6 dataAtIndex:(v4 + 6)];
      contentSignature = v8->_contentSignature;
      v8->_contentSignature = (NSData *)v13;

      uint64_t v15 = [v6 dataAtIndex:(v4 + 7)];
      xattrSignature = v8->_xattrSignature;
      v8->_xattrSignature = (NSData *)v15;

      uint64_t v17 = [v6 numberAtIndex:(v4 + 8)];
      editedSinceShared = v8->_editedSinceShared;
      v8->_editedSinceShared = (NSNumber *)v17;

      uint64_t v19 = [v6 numberAtIndex:(v4 + 9)];
      lastEditorDeviceOrUserRowID = v8->_lastEditorDeviceOrUserRowID;
      v8->_lastEditorDeviceOrUserRowID = (NSNumber *)v19;

      if (_BRCClassesConflictLoserEtags_once != -1) {
        dispatch_once(&_BRCClassesConflictLoserEtags_once, &__block_literal_global_10);
      }
      id v21 = (id)_BRCClassesConflictLoserEtags_allowedClasses;
      uint64_t v22 = [v6 unarchivedObjectOfClasses:v21 atIndex:(v4 + 10)];
      conflictLoserEtags = v8->_conflictLoserEtags;
      v8->_conflictLoserEtags = (NSSet *)v22;

      uint64_t v24 = [v6 dataAtIndex:(v4 + 11)];
      quarantineInfo = v8->_quarantineInfo;
      v8->_quarantineInfo = (NSData *)v24;
    }
    self = v8;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BRCVersion)initWithVersion:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCVersion;
  uint64_t v5 = [(BRCVersion *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 1) copy];
    ckInfo = v5->_ckInfo;
    v5->_ckInfo = (BRFieldCKInfo *)v6;

    v5->_mtime = *((void *)v4 + 2);
    uint64_t v8 = [*((id *)v4 + 3) copy];
    originalPOSIXName = v5->_originalPOSIXName;
    v5->_originalPOSIXName = (NSString *)v8;

    v5->_size = *((void *)v4 + 4);
    v5->_thumbnailSize = *((void *)v4 + 5);
    uint64_t v10 = [*((id *)v4 + 6) copy];
    thumbnailSignature = v5->_thumbnailSignature;
    v5->_thumbnailSignature = (NSData *)v10;

    uint64_t v12 = [*((id *)v4 + 7) copy];
    contentSignature = v5->_contentSignature;
    v5->_contentSignature = (NSData *)v12;

    objc_storeStrong((id *)&v5->_editedSinceShared, *((id *)v4 + 12));
    uint64_t v14 = [*((id *)v4 + 13) copy];
    lastEditorDeviceOrUserRowID = v5->_lastEditorDeviceOrUserRowID;
    v5->_lastEditorDeviceOrUserRowID = (NSNumber *)v14;

    uint64_t v16 = [*((id *)v4 + 14) copy];
    lastEditorDeviceName = v5->_lastEditorDeviceName;
    v5->_lastEditorDeviceName = (NSString *)v16;

    uint64_t v18 = [*((id *)v4 + 11) mutableCopy];
    conflictLoserEtags = v5->_conflictLoserEtags;
    v5->_conflictLoserEtags = (NSSet *)v18;

    uint64_t v20 = [*((id *)v4 + 8) copy];
    xattrSignature = v5->_xattrSignature;
    v5->_xattrSignature = (NSData *)v20;

    uint64_t v22 = [*((id *)v4 + 10) copy];
    quarantineInfo = v5->_quarantineInfo;
    v5->_quarantineInfo = (NSData *)v22;
  }
  return v5;
}

- (BOOL)isPackage
{
  contentSignature = self->_contentSignature;
  if (!contentSignature)
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCVersion isPackage]();
    }

    contentSignature = self->_contentSignature;
  }
  return [(NSData *)contentSignature brc_signatureIsPackage];
}

- (BOOL)hasThumbnail
{
  return self->_thumbnailSignature != 0;
}

- (BOOL)check:(id)a3 logToFile:(__sFILE *)a4
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithVersion:self];
}

- (unint64_t)diffAgainst:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)*((void *)v4 + 1);
  uint64_t v6 = self->_ckInfo;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v7) {
      goto LABEL_10;
    }
    BOOL v9 = [(BRFieldCKInfo *)v6 isEqual:v7];

    if (!v9) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = (void *)*((void *)v4 + 13);
  uint64_t v6 = self->_lastEditorDeviceOrUserRowID;
  uint64_t v11 = v10;
  if (v6 != v11)
  {
    uint64_t v12 = v11;
    if (v11)
    {
      BOOL v13 = [(BRFieldCKInfo *)v6 isEqual:v11];

      if (v13) {
        goto LABEL_13;
      }
LABEL_11:
      uint64_t v14 = 0x10000;
      goto LABEL_14;
    }
LABEL_10:

    goto LABEL_11;
  }

LABEL_13:
  uint64_t v14 = 0;
LABEL_14:
  uint64_t v15 = (void *)*((void *)v4 + 12);
  uint64_t v16 = self->_editedSinceShared;
  uint64_t v17 = v15;
  if (v16 == v17)
  {

    goto LABEL_21;
  }
  uint64_t v18 = v17;
  if (!v17)
  {

    goto LABEL_20;
  }
  char v19 = [(NSNumber *)v16 isEqual:v17];

  if ((v19 & 1) == 0) {
LABEL_20:
  }
    v14 |= 0x2000000uLL;
LABEL_21:
  if (self->_mtime == *((void *)v4 + 2)) {
    unint64_t v20 = v14;
  }
  else {
    unint64_t v20 = v14 | 0x20000;
  }
  if ((v20 & 0x40000) == 0)
  {
    id v21 = (void *)*((void *)v4 + 3);
    uint64_t v22 = self->_originalPOSIXName;
    v23 = v21;
    if (v22 == v23)
    {
    }
    else
    {
      uint64_t v24 = v23;
      if (!v23)
      {

        goto LABEL_46;
      }
      char v25 = [(NSString *)v22 isEqual:v23];

      if ((v25 & 1) == 0)
      {
LABEL_46:
        v20 |= 0x40000uLL;
        if ((v20 & 0x80000) != 0) {
          goto LABEL_33;
        }
        goto LABEL_31;
      }
    }
  }
  if ((v20 & 0x80000) != 0) {
    goto LABEL_33;
  }
LABEL_31:
  if (self->_size != *((void *)v4 + 4)) {
    v20 |= 0x80000uLL;
  }
LABEL_33:
  if ((v20 & 0x100000) != 0) {
    goto LABEL_39;
  }
  v26 = (void *)*((void *)v4 + 7);
  uint64_t v27 = self->_contentSignature;
  objc_super v28 = v26;
  if (v27 == v28)
  {

    goto LABEL_39;
  }
  v29 = v28;
  if (!v28)
  {

    goto LABEL_49;
  }
  char v30 = [(NSData *)v27 isEqual:v28];

  if (v30)
  {
LABEL_39:
    if ((v20 & 0x400000) != 0) {
      goto LABEL_53;
    }
LABEL_40:
    v31 = (void *)*((void *)v4 + 6);
    v32 = self->_thumbnailSignature;
    v33 = v31;
    if (v32 == v33)
    {

      goto LABEL_53;
    }
    v34 = v33;
    if (v33)
    {
      char v35 = [(NSData *)v32 isEqual:v33];

      if (v35) {
        goto LABEL_53;
      }
    }
    else
    {
    }
    v20 |= 0x400000uLL;
    goto LABEL_53;
  }
LABEL_49:
  v20 |= 0x100000uLL;
  if ((v20 & 0x400000) == 0) {
    goto LABEL_40;
  }
LABEL_53:
  if ((v20 & 0x800000) != 0) {
    goto LABEL_59;
  }
  v36 = (void *)*((void *)v4 + 11);
  v37 = self->_conflictLoserEtags;
  v38 = v36;
  if (v37 == v38)
  {

    goto LABEL_59;
  }
  v39 = v38;
  if (!v38)
  {

    goto LABEL_66;
  }
  char v40 = [(NSSet *)v37 isEqual:v38];

  if (v40)
  {
LABEL_59:
    if ((v20 & 0x200000) != 0) {
      goto LABEL_70;
    }
    goto LABEL_60;
  }
LABEL_66:
  v20 |= 0x800000uLL;
  if ((v20 & 0x200000) != 0) {
    goto LABEL_70;
  }
LABEL_60:
  v41 = (void *)*((void *)v4 + 8);
  v42 = self->_xattrSignature;
  v43 = v41;
  if (v42 == v43)
  {
  }
  else
  {
    v44 = v43;
    if (v43)
    {
      char v45 = [(NSData *)v42 isEqual:v43];

      if (v45) {
        goto LABEL_70;
      }
    }
    else
    {
    }
    v20 |= 0x200000uLL;
  }
LABEL_70:
  if ((v20 & 0x1000000) == 0 && !BRCQuarantineInfoIsEqual(self->_quarantineInfo, *((void **)v4 + 10))) {
    v20 |= 0x1000000uLL;
  }

  return v20;
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
    v7 = [v4 etag];
    uint64_t v8 = [(BRFieldCKInfo *)self->_ckInfo etag];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)additionNameForItemID:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSString *)self->_originalPOSIXName br_pathExtension];
  id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v10 = [v7 zoneName];
  [v9 appendString:v10];

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @".", @"~", 0, 0, objc_msgSend(v9, "length"));
  uint64_t v11 = [v7 ownerName];
  char v12 = [v11 isEqualToString:*MEMORY[0x263EFD488]];

  if ((v12 & 1) == 0)
  {
    BOOL v13 = [v7 ownerName];
    [v9 appendFormat:@":%@", v13];
  }
  uint64_t v14 = [v8 length];
  uint64_t v15 = [v6 itemIDString];
  uint64_t v16 = [(BRFieldCKInfo *)self->_ckInfo etag];
  uint64_t v17 = (void *)v16;
  if (v14) {
    [v9 appendFormat:@"_%@_%@.%@", v15, v16, v8];
  }
  else {
    [v9 appendFormat:@"_%@_%@", v15, v16, v19];
  }

  return v9;
}

- (id)uti
{
  v2 = [(BRCVersion *)self originalPOSIXName];
  v3 = objc_msgSend(v2, "br_pathExtension");

  id v4 = (id)*MEMORY[0x263F01A08];
  if ([v3 length])
  {
    int v5 = +[BRCUTITypeCache defaultCache];
    uint64_t v6 = [v5 UTIForExtension:v3];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v4;
    }
    id v9 = v8;

    id v4 = v9;
  }

  return v4;
}

- (BOOL)isSmallAndMostRecentClientsGenerateThumbnails
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (![(BRCVersion *)self size])
  {
    int v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCVersion isSmallAndMostRecentClientsGenerateThumbnails]();
    }
    goto LABEL_7;
  }
  v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 minFileSizeForThumbnailTransfer];

  if ([(BRCVersion *)self size] <= v4)
  {
    int v5 = [(BRCVersion *)self uti];
    int v9 = [MEMORY[0x263F160E0] canMostRecentClientsGenerateThumbnailsForUTI:v5];
    if (v9)
    {
      uint64_t v6 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = +[BRCDumpContext stringFromByteCount:[(BRCVersion *)self size] context:0];
        int v14 = 138412802;
        uint64_t v15 = v11;
        __int16 v16 = 2112;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        char v12 = "[DEBUG] Being greedy because the document is small %@ and QL can generate a thumbnail for %@%@";
LABEL_15:
        _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v14, 0x20u);
      }
    }
    else
    {
      uint64_t v6 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = +[BRCDumpContext stringFromByteCount:[(BRCVersion *)self size] context:0];
        int v14 = 138412802;
        uint64_t v15 = v11;
        __int16 v16 = 2112;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        char v12 = "[DEBUG] Not being greedy even though the document is small %@: QL can’t generate a thumbnail for %@%@";
        goto LABEL_15;
      }
    }

    goto LABEL_13;
  }
  int v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = +[BRCDumpContext stringFromByteCount:[(BRCVersion *)self size] context:0];
    uint64_t v8 = +[BRCDumpContext stringFromByteCount:v4 context:0];
    int v14 = 138412802;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Not being greedy because document is bigger %@ than minimum size (%@) to generate a thumbnail%@", (uint8_t *)&v14, 0x20u);
  }
LABEL_7:
  LOBYTE(v9) = 0;
LABEL_13:

  return v9;
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
      id v7 = lazyXattr;
    }
    else
    {
      objc_msgSend(v4, "loadXattrBlobForSignature:error:");
      uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      int v9 = self->_lazyXattr;
      self->_lazyXattr = v8;

      uint64_t v10 = self->_lazyXattr;
      if (!v10)
      {
        uint64_t v11 = brc_bread_crumbs();
        char v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          xattrSignature = self->_xattrSignature;
          *(_DWORD *)buf = 138412802;
          __int16 v16 = xattrSignature;
          __int16 v17 = 2112;
          uint64_t v18 = 0;
          __int16 v19 = 2112;
          uint64_t v20 = v11;
          _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to load xattr with signature %@ - %@%@", buf, 0x20u);
        }

        uint64_t v10 = self->_lazyXattr;
      }
      id v7 = v10;
    }
  }
  else
  {
    id v7 = 0;
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

- (int64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(int64_t)a3
{
  self->_mtime = a3;
}

- (NSString)originalPOSIXName
{
  return self->_originalPOSIXName;
}

- (void)setOriginalPOSIXName:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int64_t)thumbnailSize
{
  return self->_thumbnailSize;
}

- (void)setThumbnailSize:(int64_t)a3
{
  self->_thumbnailSize = a3;
}

- (NSData)thumbnailSignature
{
  return self->_thumbnailSignature;
}

- (void)setThumbnailSignature:(id)a3
{
}

- (NSData)contentSignature
{
  return self->_contentSignature;
}

- (void)setContentSignature:(id)a3
{
}

- (NSSet)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void)setConflictLoserEtags:(id)a3
{
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void)setXattrSignature:(id)a3
{
}

- (NSNumber)editedSinceShared
{
  return self->_editedSinceShared;
}

- (void)setEditedSinceShared:(id)a3
{
}

- (NSNumber)lastEditorDeviceOrUserRowID
{
  return self->_lastEditorDeviceOrUserRowID;
}

- (void)setLastEditorDeviceOrUserRowID:(id)a3
{
}

- (NSString)lastEditorDeviceName
{
  return self->_lastEditorDeviceName;
}

- (void)setLastEditorDeviceName:(id)a3
{
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (void)setQuarantineInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_lastEditorDeviceOrUserRowID, 0);
  objc_storeStrong((id *)&self->_editedSinceShared, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_lazyXattr, 0);
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
  objc_storeStrong((id *)&self->_thumbnailSignature, 0);
  objc_storeStrong((id *)&self->_originalPOSIXName, 0);
  objc_storeStrong((id *)&self->_ckInfo, 0);
}

- (void)setLastEditorDeviceRowID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: lastEditorDeviceRowID && lastEditorDeviceRowID.longLongValue > 0%@", v2, v3, v4, v5, v6);
}

- (void)setLastEditorDeviceRowID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![self _hasLastEditorRowID]%@", v2, v3, v4, v5, v6);
}

- (void)setLastEditorRowID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_lastEditorDeviceOrUserRowID || ![self _hasLastEditorDeviceRowID]%@", v2, v3, v4, v5, v6);
}

- (void)isPackage
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _contentSignature%@", v2, v3, v4, v5, v6);
}

- (void)isSmallAndMostRecentClientsGenerateThumbnails
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Not being greedy because current version size is 0%@", v1, 0xCu);
}

@end