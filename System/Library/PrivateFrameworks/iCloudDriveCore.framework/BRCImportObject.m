@interface BRCImportObject
- (BOOL)hasFinderTags;
- (BOOL)isBRAlias;
- (BOOL)isDocument;
- (BOOL)isDocumentsFolder;
- (BOOL)isExcluded;
- (BOOL)isExecutable;
- (BOOL)isFault;
- (BOOL)isFile;
- (BOOL)isFileWithFinderInfoAliasBit;
- (BOOL)isFinderAlias;
- (BOOL)isHiddenExtension;
- (BOOL)isPackageRoot;
- (BOOL)isSymLink;
- (BOOL)isUnixDir;
- (BOOL)isUserVisible;
- (BOOL)isWritable;
- (BRCAccountSessionFPFS)session;
- (BRCAppLibrary)appLibrary;
- (BRCGenerationID)generationID;
- (BRCImportObject)initWithPackageURL:(id)a3 error:(id *)a4;
- (BRCImportObject)initWithURL:(id)a3 existingItem:(id)a4 quarantineInfo:(id)a5 error:(id *)a6;
- (BRCImportObject)initWithURL:(id)a3 logicalName:(id)a4 quarantineInfo:(id)a5 parentItem:(id)a6 error:(id *)a7;
- (BRCImportObject)initWithURL:(id)a3 packageRoot:(id)a4 error:(id *)a5;
- (BRCItemGlobalID)parentItemGlobalID;
- (NSData)quarantineInfo;
- (NSData)xattrs;
- (NSString)logicalName;
- (NSString)symlinkContent;
- (NSURL)fileURL;
- (id)initAsNewDirectoryWithLogicalName:(id)a3 parentItem:(id)a4;
- (id)initAsSymlinkWithTarget:(id)a3 parentItem:(id)a4 logicalName:(id)a5 error:(id *)a6;
- (int)_resolveAgainstFileDescriptor:(int)a3;
- (int64_t)birthTime;
- (int64_t)modificationTime;
- (int64_t)size;
- (unint64_t)fileID;
- (unint64_t)sharingOptions;
- (unsigned)fileType;
- (unsigned)itemScope;
- (void)_resolveParentBasedPropertiesWithParent:(id)a3 logicalName:(id)a4;
@end

@implementation BRCImportObject

- (BOOL)isDocument
{
  if ([(BRCImportObject *)self isFile])
  {
    if ((*((unsigned char *)self + 161) & 0x40) != 0 || [(BRCImportObject *)self isSymLink]) {
      return 0;
    }
    else {
      return ![(BRCImportObject *)self isFinderAlias];
    }
  }
  else
  {
    return [(BRCImportObject *)self isPackageRoot];
  }
}

- (BOOL)isFault
{
  BOOL v3 = [(BRCImportObject *)self isDocument];
  if (v3)
  {
    v4 = [(BRCImportObject *)self logicalName];
    char v5 = objc_msgSend(v4, "br_isSideFaultName");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isUnixDir
{
  return (self->_mode & 0xF000) == 0x4000;
}

- (BOOL)isFile
{
  return (self->_mode & 0xF000) == 0x8000;
}

- (BOOL)isPackageRoot
{
  return (*((unsigned __int8 *)self + 161) >> 2) & 1;
}

- (BOOL)isExcluded
{
  return *((unsigned char *)self + 161) & 1;
}

- (BOOL)isSymLink
{
  return (self->_mode & 0xF000) == 40960;
}

- (BOOL)hasFinderTags
{
  return (*((unsigned __int8 *)self + 161) >> 4) & 1;
}

- (int64_t)birthTime
{
  return self->_birthtime.tv_sec;
}

- (int64_t)modificationTime
{
  return self->_mtime.tv_sec;
}

- (BRCGenerationID)generationID
{
  generationID = self->_generationID;
  if (!generationID)
  {
    v4 = [[BRCGenerationID alloc] initWithFSGenerationID:self->_fsGenerationID];
    char v5 = self->_generationID;
    self->_generationID = v4;

    generationID = self->_generationID;
  }
  return generationID;
}

- (BOOL)isWritable
{
  return (self->_mode >> 7) & 1;
}

- (BOOL)isExecutable
{
  return (self->_mode >> 6) & 1;
}

- (BOOL)isHiddenExtension
{
  return (self->_finderInfo[9] >> 4) & 1;
}

- (BOOL)isFileWithFinderInfoAliasBit
{
  BOOL v3 = [(BRCImportObject *)self isFile];
  if (v3) {
    return (*((unsigned __int8 *)self + 161) >> 5) & 1;
  }
  return v3;
}

- (BOOL)isFinderAlias
{
  BOOL v3 = [(BRCImportObject *)self isFileWithFinderInfoAliasBit];
  if (v3) {
    LOBYTE(v3) = (*((unsigned char *)self + 161) & 0x40) == 0;
  }
  return v3;
}

- (BOOL)isBRAlias
{
  BOOL v3 = [(BRCImportObject *)self isFileWithFinderInfoAliasBit];
  if (v3) {
    return (*((unsigned __int8 *)self + 161) >> 6) & 1;
  }
  return v3;
}

- (unsigned)fileType
{
  return bswap32(*(_DWORD *)self->_finderInfo);
}

- (id)initAsSymlinkWithTarget:(id)a3 parentItem:(id)a4 logicalName:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BRCImportObject;
  v14 = [(BRCImportObject *)&v22 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_4;
  }
  if (v11)
  {
    [(BRCImportObject *)v14 _resolveParentBasedPropertiesWithParent:v12 logicalName:v13];
    v15->_mode = -24128;
    v15->_birthtime.tv_sec = time(0);
    v15->_mtime = v15->_birthtime;
    objc_storeStrong((id *)&v15->_symlinkContent, a3);
LABEL_4:
    v16 = v15;
    goto LABEL_11;
  }
  v17 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 96);
  if (v17)
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v21 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v24 = "-[BRCImportObject initAsSymlinkWithTarget:parentItem:logicalName:error:]";
      __int16 v25 = 2080;
      if (!a6) {
        v21 = "(ignored by caller)";
      }
      v26 = v21;
      __int16 v27 = 2112;
      v28 = v17;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a6) {
    *a6 = v17;
  }

  v16 = 0;
LABEL_11:

  return v16;
}

- (BRCImportObject)initWithURL:(id)a3 existingItem:(id)a4 quarantineInfo:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v37.receiver = self;
  v37.super_class = (Class)BRCImportObject;
  id v11 = [(BRCImportObject *)&v37 init];
  if (!v11)
  {
LABEL_22:
    __int16 v25 = v11;
    goto LABEL_23;
  }
  id v12 = v9;
  id v13 = (const char *)[v12 fileSystemRepresentation];
  objc_storeStrong((id *)&v11->_fileURL, v12);
  if (v10)
  {
    v14 = [v10 st];
    uint64_t v15 = [v14 logicalName];
    p_logicalName = (id *)&v11->_logicalName;
    logicalName = v11->_logicalName;
    v11->_logicalName = (NSString *)v15;
  }
  else
  {
    uint64_t v18 = [v12 lastPathComponent];
    p_logicalName = (id *)&v11->_logicalName;
    v14 = v11->_logicalName;
    v11->_logicalName = (NSString *)v18;
  }

  uint64_t v19 = open(v13, 2129924);
  if ((v19 & 0x80000000) != 0)
  {
    uint64_t v21 = *__error();
    if (v21) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  int v20 = v19;
  uint64_t v21 = [(BRCImportObject *)v11 _resolveAgainstFileDescriptor:v19];
  close(v20);
  if (!v21)
  {
LABEL_14:
    if (objc_msgSend(*p_logicalName, "br_isExcludedWithMaximumDepth:", 1024))
    {
      brc_bread_crumbs();
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(NSURL *)v11->_fileURL path];
        *(_DWORD *)buf = 138412546;
        v39 = v28;
        __int16 v40 = 2112;
        v41 = v26;
        _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] fileURL is excluded at %@%@", buf, 0x16u);
      }
      *((unsigned char *)v11 + 161) |= 1u;
    }
    if ([v10 isDocument] && -[BRCImportObject isUnixDir](v11, "isUnixDir")) {
      *((unsigned char *)v11 + 161) |= 4u;
    }
    uint64_t v29 = [v10 session];
    session = v11->_session;
    v11->_session = (BRCAccountSessionFPFS *)v29;

    uint64_t v31 = [v10 itemParentGlobalID];
    parentItemGlobalID = v11->_parentItemGlobalID;
    v11->_parentItemGlobalID = (BRCItemGlobalID *)v31;

    uint64_t v33 = [v10 appLibrary];
    appLibrary = v11->_appLibrary;
    v11->_appLibrary = (BRCAppLibrary *)v33;

    v11->_itemScope = [v10 itemScope];
    v11->_sharingOptions = [v10 sharingOptions];
    v11->_isUserVisible = [v10 isUserVisible];
    goto LABEL_22;
  }
LABEL_7:
  objc_super v22 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", v21);
  if (v22)
  {
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
    {
      v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v39 = "-[BRCImportObject initWithURL:existingItem:quarantineInfo:error:]";
      __int16 v40 = 2080;
      if (!a6) {
        v36 = "(ignored by caller)";
      }
      v41 = v36;
      __int16 v42 = 2112;
      v43 = v22;
      __int16 v44 = 2112;
      v45 = v23;
      _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a6) {
    *a6 = v22;
  }

  __int16 v25 = 0;
LABEL_23:

  return v25;
}

- (void)_resolveParentBasedPropertiesWithParent:(id)a3 logicalName:(id)a4
{
  id v32 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_logicalName, a4);
  v8 = [v32 session];
  session = self->_session;
  self->_session = v8;

  id v10 = [v32 itemGlobalID];
  parentItemGlobalID = self->_parentItemGlobalID;
  self->_parentItemGlobalID = v10;

  id v12 = [v32 appLibrary];
  appLibrary = self->_appLibrary;
  self->_appLibrary = v12;

  BOOL v14 = [(BRCAppLibrary *)self->_appLibrary includesDataScope];
  if ([v32 isZoneRoot])
  {
    if (v14)
    {
      BOOL v15 = [v7 isEqualToString:*MEMORY[0x263F324D0]] == 0;
      unsigned __int8 v16 = 1;
    }
    else
    {
      BOOL v15 = [v7 isEqualToString:*MEMORY[0x263F32538]] == 0;
      unsigned __int8 v16 = 2;
    }
    if (!v15) {
      ++v16;
    }
    goto LABEL_10;
  }
  v17 = [v32 itemID];
  if ([v17 isDocumentsFolder])
  {
    int v18 = [v7 isEqualToString:*MEMORY[0x263F32538]];

    if (v18)
    {
      unsigned __int8 v16 = 3;
LABEL_10:
      self->_itemScope = v16;
      goto LABEL_13;
    }
  }
  else
  {
  }
  self->_itemScope = [v32 itemScope];
LABEL_13:
  if ([v7 isEqualToString:*MEMORY[0x263F32510]])
  {
    uint64_t v19 = [v32 fileObjectID];
    if ([v19 isAppLibraryRoot] && (objc_msgSend(v19, "isCloudDocsRoot") & 1) == 0)
    {
      int v20 = [v32 appLibrary];
      uint64_t v21 = self->_appLibrary;
      self->_appLibrary = v20;
      objc_super v22 = v20;

      *((unsigned char *)self + 162) |= 2u;
      v23 = [(BRCAppLibrary *)v22 rootItemGlobalID];
      v24 = self->_parentItemGlobalID;
      self->_parentItemGlobalID = v23;
    }
  }
  self->_sharingOptions = [v32 sharingOptions] & 0x78;
  uint64_t v25 = [v32 isUserVisible];
  v26 = [v32 itemID];
  uint64_t v27 = [v26 isNonDesktopRoot];
  uint64_t v28 = [v32 itemScope];
  char v29 = [v32 isZoneRoot];
  if (v29)
  {
    v30 = 0;
  }
  else
  {
    v4 = [v32 st];
    v30 = [v4 logicalName];
  }
  uint64_t v31 = [v32 appLibrary];
  self->_isUserVisible = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:v25 parentIsNonDesktopRoot:v27 parentScope:v28 itemFilename:v7 parentFilename:v30 appLibrary:v31];

  if ((v29 & 1) == 0)
  {
  }
  if ([(NSString *)self->_logicalName br_isExcludedWithMaximumDepth:1])*((unsigned char *)self + 161) |= 1u; {
}
  }

- (id)initAsNewDirectoryWithLogicalName:(id)a3 parentItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BRCImportObject;
  v8 = [(BRCImportObject *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(BRCImportObject *)v8 _resolveParentBasedPropertiesWithParent:v7 logicalName:v6];
    v9->_mode = 16832;
    v9->_birthtime.tv_sec = time(0);
    v9->_mtime = v9->_birthtime;
  }

  return v9;
}

- (BRCImportObject)initWithURL:(id)a3 logicalName:(id)a4 quarantineInfo:(id)a5 parentItem:(id)a6 error:(id *)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v34.receiver = self;
  v34.super_class = (Class)BRCImportObject;
  unsigned __int8 v16 = [(BRCImportObject *)&v34 init];
  if (!v16)
  {
LABEL_15:
    v30 = v16;
    goto LABEL_16;
  }
  id v17 = v12;
  int v18 = (const char *)[v17 fileSystemRepresentation];
  objc_storeStrong((id *)&v16->_fileURL, v17);
  objc_storeStrong((id *)&v16->_logicalName, a4);
  objc_storeStrong((id *)&v16->_quarantineInfo, a5);
  uint64_t v24 = BRCOpenAt(0xFFFFFFFFLL, v18, 32772, v19, v20, v21, v22, v23, (unsigned __int16)v34.receiver);
  if ((v24 & 0x80000000) != 0)
  {
    uint64_t v26 = *__error();
    if (v26) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  int v25 = v24;
  uint64_t v26 = [(BRCImportObject *)v16 _resolveAgainstFileDescriptor:v24];
  close(v25);
  if (!v26)
  {
LABEL_11:
    if ([(BRCImportObject *)v16 isUnixDir]) {
      char v31 = 4;
    }
    else {
      char v31 = 0;
    }
    *((unsigned char *)v16 + 161) = *((unsigned char *)v16 + 161) & 0xFB | v31;
    [(BRCImportObject *)v16 _resolveParentBasedPropertiesWithParent:v15 logicalName:v13];
    goto LABEL_15;
  }
LABEL_4:
  uint64_t v27 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", v26);
  if (v27)
  {
    uint64_t v28 = brc_bread_crumbs();
    char v29 = brc_default_log();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      uint64_t v33 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v36 = "-[BRCImportObject initWithURL:logicalName:quarantineInfo:parentItem:error:]";
      __int16 v37 = 2080;
      if (!a7) {
        uint64_t v33 = "(ignored by caller)";
      }
      v38 = v33;
      __int16 v39 = 2112;
      __int16 v40 = v27;
      __int16 v41 = 2112;
      __int16 v42 = v28;
      _os_log_error_impl(&dword_23FA42000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a7) {
    *a7 = v27;
  }

  v30 = 0;
LABEL_16:

  return v30;
}

- (int)_resolveAgainstFileDescriptor:(int)a3
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  if (a3 < 0) {
    return *__error();
  }
  uint64_t v3 = *(void *)&a3;
  long long v76 = xmmword_23FD342A8;
  uint64_t v77 = 513;
  int64_t v97 = 0;
  memset(v96, 0, sizeof(v96));
  if (fgetattrlist(a3, &v76, v96, 0x68uLL, 0x20u) < 0)
  {
    int v17 = *__error();
    int v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v38 = [(NSURL *)self->_fileURL path];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v83 = v3;
      *(_WORD *)&v83[4] = 2112;
      *(void *)&v83[6] = v38;
      *(_WORD *)&v83[14] = 1024;
      *(_DWORD *)&v83[16] = v17;
      *(_WORD *)&v83[20] = 2112;
      *(void *)&v83[22] = v18;
      _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] fgetattrlist(%d) at '%@' failed %{errno}d%@", buf, 0x22u);
    }
    *__error() = v17;
    return *__error();
  }
  __int16 v5 = v96[9];
  int v6 = v96[9] & 0xF000;
  if (v6 != 0x4000 && v6 != 0x8000 && v6 != 40960)
  {
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v61 = aPcDBLSW[LOWORD(v96[9]) >> 12];
      *(_DWORD *)buf = 67111938;
      if ((v96[9] & 0x100) != 0) {
        int v62 = 114;
      }
      else {
        int v62 = 45;
      }
      *(_DWORD *)v83 = v61;
      *(_WORD *)&v83[4] = 1024;
      if ((v96[9] & 0x80) != 0) {
        int v63 = 119;
      }
      else {
        int v63 = 45;
      }
      *(_DWORD *)&v83[6] = v62;
      *(_WORD *)&v83[10] = 1024;
      if ((v96[9] & 0x40) != 0) {
        int v64 = 120;
      }
      else {
        int v64 = 45;
      }
      *(_DWORD *)&v83[12] = v63;
      if ((v96[9] & 0x20) != 0) {
        int v65 = 114;
      }
      else {
        int v65 = 45;
      }
      *(_WORD *)&v83[16] = 1024;
      if ((v96[9] & 0x10) != 0) {
        int v66 = 119;
      }
      else {
        int v66 = 45;
      }
      *(_DWORD *)&v83[18] = v64;
      if ((v96[9] & 8) != 0) {
        int v67 = 120;
      }
      else {
        int v67 = 45;
      }
      *(_WORD *)&v83[22] = 1024;
      if ((v96[9] & 4) != 0) {
        int v68 = 114;
      }
      else {
        int v68 = 45;
      }
      *(_DWORD *)&v83[24] = v65;
      if ((v96[9] & 2) != 0) {
        int v69 = 119;
      }
      else {
        int v69 = 45;
      }
      *(_WORD *)&v83[28] = 1024;
      if (v96[9]) {
        int v70 = 120;
      }
      else {
        int v70 = 45;
      }
      *(_DWORD *)&v83[30] = v66;
      __int16 v84 = 1024;
      int v85 = v67;
      __int16 v86 = 1024;
      int v87 = v68;
      __int16 v88 = 1024;
      int v89 = v69;
      __int16 v90 = 1024;
      int v91 = v70;
      __int16 v92 = 2112;
      v93 = self;
      __int16 v94 = 2112;
      v95 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Inappropriate file type %c%c%c%c%c%c%c%c%c%c for %@%@", buf, 0x52u);
    }

    *((unsigned char *)self + 161) |= 1u;
    __int16 v5 = v96[9];
  }
  int v9 = BRCIsLegacyUbiquityFault(v3, SBYTE4(v96[9]), v5, &v96[5]);
  if (v9)
  {
    int v10 = v9;
    objc_super v11 = [(NSURL *)self->_fileURL path];
    int v12 = BRCUnlinkAt(-1, v11, ((v96[9] & 0xF000) == 0x4000) << 7);

    if (v12 < 0)
    {
      int v28 = *__error();
      char v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        if (v10 == 2) {
          v71 = "brok";
        }
        else {
          v71 = "UF_COMPRESSED";
        }
        v72 = [(NSURL *)self->_fileURL path];
        *(_DWORD *)buf = 136315906;
        *(void *)v83 = v71;
        *(_WORD *)&v83[8] = 2112;
        *(void *)&v83[10] = v72;
        *(_WORD *)&v83[18] = 1024;
        *(_DWORD *)&v83[20] = v28;
        *(_WORD *)&v83[24] = 2112;
        *(void *)&v83[26] = v29;
        _os_log_error_impl(&dword_23FA42000, v30, (os_log_type_t)0x90u, "[ERROR] failed to unlink legacy ubiquity %s fault at '%@' %{errno}d%@", buf, 0x26u);
      }
      *__error() = v28;
    }
    else
    {
      id v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v10 == 2) {
          id v15 = "brok";
        }
        else {
          id v15 = "UF_COMPRESSED";
        }
        unsigned __int8 v16 = [(NSURL *)self->_fileURL path];
        *(_DWORD *)buf = 136315650;
        *(void *)v83 = v15;
        *(_WORD *)&v83[8] = 2112;
        *(void *)&v83[10] = v16;
        *(_WORD *)&v83[18] = 2112;
        *(void *)&v83[20] = v13;
        _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] cleaned up legacy ubiquity %s fault at '%@'%@", buf, 0x20u);
      }
    }
    return 14;
  }
  self->_fileID = *(void *)((char *)&v96[10] + 4);
  *(int32x2_t *)&self->_fsGenerationID = vrev64_s32(*(int32x2_t *)((char *)&v96[9] + 4));
  self->_mode = v96[9];
  if (BRCIsBusyDate(v96[1]))
  {
    time_t v21 = time(0);
    time_t v22 = v96[3];
    if (v21 < v96[3]) {
      time_t v22 = v21;
    }
    v96[1] = v22;
  }
  timespec v23 = *(timespec *)&v96[3];
  self->_birthtime = *(timespec *)&v96[1];
  self->_mtime = v23;
  if ((v96[9] & 0xF000) == 0x8000) {
    int64_t v24 = v97;
  }
  else {
    int64_t v24 = 0;
  }
  self->_size = v24;
  long long v25 = *(_OWORD *)&v96[7];
  *(_OWORD *)self->_finderInfo = *(_OWORD *)&v96[5];
  *(_OWORD *)&self->_finderInfo[16] = v25;
  int v26 = *((unsigned char *)self + 161) & 0xDF | (32 * ((LOBYTE(v96[6]) >> 7) & 1));
  *((unsigned char *)self + 161) = *((unsigned char *)self + 161) & 0xDF | (32 * (LOBYTE(v96[6]) >> 7));
  if ((v96[6] & 0xE00) != 0) {
    char v27 = v26 | 0x10;
  }
  else {
    char v27 = *((unsigned char *)self + 161) & 0xEF | (16
  }
                                         * (fgetxattr(v3, "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 0) > 0));
  *((unsigned char *)self + 161) = v27;
  if ((v27 & 0x20) != 0)
  {
    if ((v27 & 2) != 0)
    {
      char v31 = brc_bread_crumbs();
      id v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[BRCImportObject _resolveAgainstFileDescriptor:].cold.5();
      }

      *((unsigned char *)self + 161) |= 1u;
    }
    if ((v96[9] & 0xF000) == 0x4000)
    {
      uint64_t v33 = brc_bread_crumbs();
      objc_super v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[BRCImportObject _resolveAgainstFileDescriptor:].cold.4();
      }

      *((unsigned char *)self + 161) |= 1u;
    }
    if (fgetxattr(v3, "com.apple.clouddocs.security", 0, 0, 0, 0) != -1)
    {
      *((unsigned char *)self + 161) |= 0x40u;
      v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        [(BRCImportObject *)(uint64_t)self _resolveAgainstFileDescriptor:v36];
      }

      return 45;
    }
    if (*__error() == 93)
    {
      char v37 = *((unsigned char *)self + 161);
    }
    else
    {
      __int16 v39 = brc_bread_crumbs();
      __int16 v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = *__error();
        *(_DWORD *)buf = 138412802;
        *(void *)v83 = self;
        *(_WORD *)&v83[8] = 1024;
        *(_DWORD *)&v83[10] = v41;
        *(_WORD *)&v83[14] = 2112;
        *(void *)&v83[16] = v39;
        _os_log_impl(&dword_23FA42000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read xattr for '%@' %{errno}d%@", buf, 0x1Cu);
      }

      char v37 = *((unsigned char *)self + 161) | 1;
    }
    *((unsigned char *)self + 161) = v37 & 0xBF;
  }
  if (_CFURLIsPromiseName() && ((self->_mode & 0xF000) != 0x8000 || (*((unsigned char *)self + 161) & 0x40) != 0))
  {
    __int16 v42 = brc_bread_crumbs();
    uint64_t v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      logicalName = self->_logicalName;
      *(_DWORD *)buf = 138412546;
      *(void *)v83 = logicalName;
      *(_WORD *)&v83[8] = 2112;
      *(void *)&v83[10] = v42;
      _os_log_impl(&dword_23FA42000, v43, OS_LOG_TYPE_DEFAULT, "[WARNING] Excluding item with promise name that isn't a promise '%@'%@", buf, 0x16u);
    }

    *((unsigned char *)self + 161) |= 1u;
  }
  if (![(BRCImportObject *)self isSymLink]) {
    goto LABEL_61;
  }
  if ((BRCReadlinkAt(-1, [(NSURL *)self->_fileURL fileSystemRepresentation], (char *)buf, 1025) & 0x80000000) == 0)
  {
    objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", buf);
    v45 = (NSString *)objc_claimAutoreleasedReturnValue();
    symlinkContent = self->_symlinkContent;
    self->_symlinkContent = v45;

    if (![(NSString *)self->_symlinkContent fileSystemRepresentation])
    {
      v73 = brc_bread_crumbs();
      v74 = brc_default_log();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT)) {
        -[BRCImportObject _resolveAgainstFileDescriptor:]((uint64_t)v73, v74);
      }
    }
LABEL_61:
    v47 = [(BRCImportObject *)self appLibrary];
    v48 = [v47 mangledID];
    v49 = +[BRCUserDefaults defaultsForMangledID:v48];
    uint64_t v50 = [v49 maxXattrBlobSize];

    id v75 = 0;
    v51 = +[BRFieldXattrBlob loadXattrsFromFD:v3 withMaximumSize:v50 error:&v75];
    id v52 = v75;
    xattrs = self->_xattrs;
    self->_xattrs = v51;

    if (v52)
    {
      v54 = brc_bread_crumbs();
      v55 = brc_default_log();
      if (os_log_type_enabled(v55, (os_log_type_t)0x90u)) {
        [(BRCImportObject *)(uint64_t)self _resolveAgainstFileDescriptor:v55];
      }
    }
    return 0;
  }
  int v57 = *__error();
  if (v57) {
    int v20 = v57;
  }
  else {
    int v20 = 22;
  }
  v58 = brc_bread_crumbs();
  v59 = brc_default_log();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = [(NSURL *)self->_fileURL fileSystemRepresentation];
    *(_DWORD *)v78 = 136315394;
    v79 = v60;
    __int16 v80 = 2112;
    v81 = v58;
    _os_log_impl(&dword_23FA42000, v59, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read symlink at '%s'%@", v78, 0x16u);
  }

  return v20;
}

- (NSString)logicalName
{
  return self->_logicalName;
}

- (NSString)symlinkContent
{
  return self->_symlinkContent;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrs
{
  return self->_xattrs;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (BRCItemGlobalID)parentItemGlobalID
{
  return self->_parentItemGlobalID;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (unsigned)itemScope
{
  return self->_itemScope;
}

- (BRCAppLibrary)appLibrary
{
  return self->_appLibrary;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (BOOL)isDocumentsFolder
{
  return (*((unsigned __int8 *)self + 162) >> 1) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_parentItemGlobalID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_logicalName, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (BRCImportObject)initWithPackageURL:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCImportObject;
  v8 = [(BRCImportObject *)&v24 init];
  int v9 = v8;
  if (!v8) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v8->_fileURL, a3);
  uint64_t v10 = [(NSURL *)v9->_fileURL lastPathComponent];
  logicalName = v9->_logicalName;
  v9->_logicalName = (NSString *)v10;

  *((unsigned char *)v9 + 161) |= 2u;
  uint64_t v12 = open([(NSURL *)v9->_fileURL fileSystemRepresentation], 2129924);
  if ((v12 & 0x80000000) == 0)
  {
    int v13 = v12;
    uint64_t v14 = [(BRCImportObject *)v9 _resolveAgainstFileDescriptor:v12];
    close(v13);
    if (!v14) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  uint64_t v14 = *__error();
  int v15 = *__error();
  unsigned __int8 v16 = brc_bread_crumbs();
  int v17 = brc_default_log();
  if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
  {
    timespec v23 = [(NSURL *)v9->_fileURL path];
    *(_DWORD *)buf = 138412802;
    int v26 = v23;
    __int16 v27 = 1024;
    *(_DWORD *)int v28 = v15;
    *(_WORD *)&v28[4] = 2112;
    *(void *)&v28[6] = v16;
    _os_log_error_impl(&dword_23FA42000, v17, (os_log_type_t)0x90u, "[ERROR] Failed opening %@ %{errno}d%@", buf, 0x1Cu);
  }
  *__error() = v15;
  if (v14)
  {
LABEL_8:
    int v18 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", v14);
    if (v18)
    {
      uint64_t v19 = brc_bread_crumbs();
      int v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        time_t v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v26 = "-[BRCImportObject(BRCPackageAdditions) initWithPackageURL:error:]";
        __int16 v27 = 2080;
        if (!a4) {
          time_t v22 = "(ignored by caller)";
        }
        *(void *)int v28 = v22;
        *(_WORD *)&v28[8] = 2112;
        *(void *)&v28[10] = v18;
        __int16 v29 = 2112;
        v30 = v19;
        _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v18;
    }

    int v9 = 0;
  }
LABEL_14:

  return v9;
}

- (BRCImportObject)initWithURL:(id)a3 packageRoot:(id)a4 error:(id *)a5
{
  id v8 = a4;
  int v9 = [(BRCImportObject *)self initWithPackageURL:a3 error:a5];
  if (v9)
  {
    uint64_t v10 = [v8 session];
    session = v9->_session;
    v9->_session = (BRCAccountSessionFPFS *)v10;

    uint64_t v12 = [v8 appLibrary];
    appLibrary = v9->_appLibrary;
    v9->_appLibrary = (BRCAppLibrary *)v12;
  }
  return v9;
}

- (void)_resolveAgainstFileDescriptor:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 8) fileSystemRepresentation];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_23FA42000, a3, (os_log_type_t)0x90u, "[ERROR] Recieved an error while reading xattrs at '%s'%@", v4, 0x16u);
}

- (void)_resolveAgainstFileDescriptor:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _symlinkContent.fileSystemRepresentation != nil%@", (uint8_t *)&v2, 0xCu);
}

- (void)_resolveAgainstFileDescriptor:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 8) path];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] BR alias is ignored at '%@'%@", v5, 0x16u);
}

- (void)_resolveAgainstFileDescriptor:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Directory is marked as alias, ignoring '%@'%@");
}

- (void)_resolveAgainstFileDescriptor:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Inappropriate location or an alias for '%@'%@");
}

@end