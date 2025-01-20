@interface BRCPackageManifestWriter
- (BOOL)_packageItem:(id)a3 matchesMode:(unsigned __int16)a4;
- (BOOL)_stageExistingPackageItem:(id)a3 withLiveFd:(int)a4 stageFd:(int)a5 isDocumentModifiedByOtherUser:(BOOL)a6;
- (BOOL)addItem:(id)a3;
- (BOOL)addLocalItem:(id)a3;
- (BOOL)done;
- (BOOL)stagePackageWithReader:(id)a3 package:(id)a4 xattrsPackage:(id)a5 stageItemURL:(id)a6 livefd:(int)a7 recordName:(id)a8 isDocumentModifiedByOtherUser:(BOOL)a9;
- (BRCPackageManifestWriter)initWithZone:(id)a3 stageID:(id)a4 url:(id)a5;
- (NSError)error;
- (NSURL)url;
- (unsigned)_computedFileModeForPackageItem:(id)a3;
- (void)_applyDirectoryMetadataWithManifestItem:(id)a3 packageRootFD:(int)a4;
- (void)_applyFileMetadataWithManifestItem:(id)a3 isDocumentModifiedByOtherUser:(BOOL)a4 packageRootFD:(int)a5;
- (void)_applyQuarantineMetadataWithManifestItem:(id)a3 isDocumentModifiedByOtherUser:(BOOL)a4 fd:(int)a5;
- (void)_handleStreamError;
@end

@implementation BRCPackageManifestWriter

- (void)_handleStreamError
{
  stream = self->_stream;
  if (stream)
  {
    v4 = [(NSOutputStream *)stream streamError];
    error = self->_error;
    self->_error = v4;

    [(NSOutputStream *)self->_stream close];
    v6 = self->_stream;
    self->_stream = 0;

    writer = self->_writer;
    self->_writer = 0;
  }
}

- (BRCPackageManifestWriter)initWithZone:(id)a3 stageID:(id)a4 url:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BRCPackageManifestWriter;
  v12 = [(BRCPackageManifestWriter *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientZone, a3);
    objc_storeStrong((id *)&v13->_stageID, a4);
    objc_storeStrong((id *)&v13->_url, a5);
    uint64_t v14 = [MEMORY[0x263EFF9E0] outputStreamWithURL:v11 append:0];
    stream = v13->_stream;
    v13->_stream = (NSOutputStream *)v14;

    [(NSOutputStream *)v13->_stream open];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F62240]) initWithOutputStream:v13->_stream];
    writer = v13->_writer;
    v13->_writer = (PBMessageStreamWriter *)v16;

    v18 = objc_alloc_init(BRFieldPkgHeader);
    [(BRFieldPkgHeader *)v18 setVersion:1];
    if (([(PBMessageStreamWriter *)v13->_writer writeMessage:v18] & 1) == 0) {
      [(BRCPackageManifestWriter *)v13 _handleStreamError];
    }
  }
  return v13;
}

- (BOOL)addItem:(id)a3
{
  id v4 = a3;
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCPackageManifestWriter addItem:]();
  }

  char v7 = [(PBMessageStreamWriter *)self->_writer writeMessage:v4];
  if ((v7 & 1) == 0) {
    [(BRCPackageManifestWriter *)self _handleStreamError];
  }

  return v7;
}

- (BOOL)addLocalItem:(id)a3
{
  id v4 = a3;
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCPackageManifestWriter addItem:]();
  }

  char v7 = [(PBMessageStreamWriter *)self->_writer writeMessage:v4];
  if ((v7 & 1) == 0) {
    [(BRCPackageManifestWriter *)self _handleStreamError];
  }

  return v7;
}

- (BOOL)done
{
  return self->_error == 0;
}

- (void)_applyQuarantineMetadataWithManifestItem:(id)a3 isDocumentModifiedByOtherUser:(BOOL)a4 fd:(int)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [v6 path];
  v8 = [v6 quarantineInfo];

  id v12 = 0;
  LOBYTE(v6) = BRCSetFakeQuarantineInfo(a5, v8, &v12);
  id v9 = v12;

  if ((v6 & 1) == 0)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] Failed setting quarantine info for item %@: %@%@", buf, 0x20u);
    }
  }
}

- (void)_applyDirectoryMetadataWithManifestItem:(id)a3 packageRootFD:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 path];
  v8 = (const char *)[v7 fileSystemRepresentation];
  uint64_t v14 = BRCOpenAt(v4, v8, 33028, v9, v10, v11, v12, v13, v19);
  if ((v14 & 0x80000000) != 0)
  {
    int v16 = *__error();
    __int16 v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      int v19 = 138412802;
      id v20 = v7;
      __int16 v21 = 1024;
      int v22 = v16;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] Failed to open pkg item at %@ %{errno}d%@", (uint8_t *)&v19, 0x1Cu);
    }

    *__error() = v16;
  }
  else
  {
    uint64_t v15 = v14;
    BRCSetMtime(v14, [v6 mtime]);
    [(BRCPackageManifestWriter *)self _applyQuarantineMetadataWithManifestItem:v6 isDocumentModifiedByOtherUser:0 fd:v15];
    close(v15);
  }
}

- (void)_applyFileMetadataWithManifestItem:(id)a3 isDocumentModifiedByOtherUser:(BOOL)a4 packageRootFD:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v29 = xmmword_23FD343F0;
  uint64_t v30 = 0;
  int v28 = 0;
  uint64_t v9 = [v8 path];
  if (v9 && ([v8 hasMtime] & 1) != 0)
  {
    id v10 = v9;
    uint64_t v11 = (const char *)[v10 fileSystemRepresentation];
    uint64_t v17 = BRCOpenAt(v5, v11, 33028, v12, v13, v14, v15, v16, v27);
    if ((v17 & 0x80000000) != 0)
    {
      int v24 = *__error();
      uint64_t v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v32 = v10;
        __int16 v33 = 1024;
        int v34 = v24;
        __int16 v35 = 2112;
        v36 = v25;
        _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] openat failed to apply metadata for manifest item %@ %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v24;
    }
    else
    {
      uint64_t v18 = v17;
      BRCSetMtime(v17, [v8 mtime]);
      int v28 = [(BRCPackageManifestWriter *)self _computedFileModeForPackageItem:v8];
      if (BRCFSetAttrList(v18, &v29, &v28, 4uLL))
      {
        int v19 = *__error();
        id v20 = brc_bread_crumbs();
        __int16 v21 = brc_default_log();
        if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          id v32 = v10;
          __int16 v33 = 1024;
          int v34 = v19;
          __int16 v35 = 2112;
          v36 = v20;
          _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] fsetattrlist failed for pkg item %@ %{errno}d%@", buf, 0x1Cu);
        }

        *__error() = v19;
      }
      [(BRCPackageManifestWriter *)self _applyQuarantineMetadataWithManifestItem:v8 isDocumentModifiedByOtherUser:v6 fd:v18];
      close(v18);
    }
  }
  else
  {
    int v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCPackageManifestWriter _applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:]();
    }
  }
}

- (BOOL)_packageItem:(id)a3 matchesMode:(unsigned __int16)a4
{
  char v4 = a4;
  id v5 = a3;
  if (((v4 & 0x80) == 0) == [v5 isWritable]) {
    LOBYTE(v6) = 0;
  }
  else {
    unsigned int v6 = ((v4 & 0x40) == 0) ^ [v5 isExecutable];
  }

  return v6;
}

- (unsigned)_computedFileModeForPackageItem:(id)a3
{
  id v3 = a3;
  if ([v3 isWritable]) {
    __int16 v4 = 434;
  }
  else {
    __int16 v4 = 288;
  }
  int v5 = [v3 isExecutable];

  if (v5) {
    v4 |= 0x49u;
  }
  unsigned int v6 = +[BRCUserDefaults defaultsForMangledID:0];
  __int16 v7 = [v6 stageInPackageFileUmask];

  return v4 & ~v7;
}

- (BOOL)_stageExistingPackageItem:(id)a3 withLiveFd:(int)a4 stageFd:(int)a5 isDocumentModifiedByOtherUser:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = [v10 path];
  uint64_t v12 = (const char *)[v11 fileSystemRepresentation];
  if (((v7 | v8) & 0x80000000) != 0)
  {
    unsigned __int16 v27 = brc_bread_crumbs();
    int v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[BRCPackageManifestWriter _stageExistingPackageItem:withLiveFd:stageFd:isDocumentModifiedByOtherUser:]();
    }

    BOOL v29 = 0;
  }
  else
  {
    uint64_t v18 = v12;
    int v19 = BRCOpenAt(v8, v12, 33028, v13, v14, v15, v16, v17, v37);
    if (v19 < 0)
    {
      int v22 = *__error();
      __int16 v23 = brc_bread_crumbs();
      int v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v43.st_dev = 136315650;
        *(void *)&v43.st_mode = v18;
        WORD2(v43.st_ino) = 1024;
        *(_DWORD *)((char *)&v43.st_ino + 6) = v22;
        HIWORD(v43.st_uid) = 2112;
        *(void *)&v43.st_gid = v23;
        uint64_t v25 = "[ERROR] Failed to open live pkg item at %s %{errno}d%@";
        v26 = &v43;
        goto LABEL_20;
      }
LABEL_10:

      BOOL v29 = 0;
      *__error() = v22;
      goto LABEL_11;
    }
    int v20 = v19;
    memset(&v43, 0, sizeof(v43));
    int v21 = fstat(v19, &v43);
    close(v20);
    if (v21)
    {
      int v22 = *__error();
      __int16 v23 = brc_bread_crumbs();
      int v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        int v37 = 136315650;
        *(void *)v38 = v18;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = v22;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = v23;
        uint64_t v25 = "[ERROR] Failed to stat live pkg item at %s %{errno}d%@";
        v26 = (stat *)&v37;
LABEL_20:
        _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, v25, (uint8_t *)v26, 0x1Cu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    if (clonefileat(v8, v18, v7, v18, 0))
    {
      int v31 = *__error();
      id v32 = brc_bread_crumbs();
      __int16 v33 = brc_default_log();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        int v37 = 67110402;
        *(_DWORD *)v38 = v8;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v11;
        *(_WORD *)&v38[14] = 1024;
        *(_DWORD *)&v38[16] = v7;
        *(_WORD *)&v38[20] = 2112;
        *(void *)&v38[22] = v11;
        __int16 v39 = 1024;
        int v40 = v31;
        __int16 v41 = 2112;
        v42 = v32;
        _os_log_error_impl(&dword_23FA42000, v33, (os_log_type_t)0x90u, "[ERROR] clonefileat(%d, %@, %d, %@) %{errno}d%@", (uint8_t *)&v37, 0x32u);
      }

      BOOL v29 = 0;
      *__error() = v31;
    }
    else
    {
      int v34 = brc_bread_crumbs();
      __int16 v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        stageID = self->_stageID;
        int v37 = 138412802;
        *(void *)v38 = v11;
        *(_WORD *)&v38[8] = 2112;
        *(void *)&v38[10] = stageID;
        *(_WORD *)&v38[18] = 2112;
        *(void *)&v38[20] = v34;
        _os_log_debug_impl(&dword_23FA42000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] cloned at %@ for package staged in %@%@", (uint8_t *)&v37, 0x20u);
      }

      [(BRCPackageManifestWriter *)self _applyFileMetadataWithManifestItem:v10 isDocumentModifiedByOtherUser:v6 packageRootFD:v7];
      BOOL v29 = 1;
    }
  }
LABEL_11:

  return v29;
}

- (BOOL)stagePackageWithReader:(id)a3 package:(id)a4 xattrsPackage:(id)a5 stageItemURL:(id)a6 livefd:(int)a7 recordName:(id)a8 isDocumentModifiedByOtherUser:(BOOL)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v194 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  int v20 = v19;
  p_error = &self->_error;
  if (!self->_error)
  {
    id v174 = v19;
    v172 = v17;
    id v188 = 0;
    int v23 = [v16 openWithError:&v188];
    id v24 = v188;
    id v173 = v18;
    if (v23)
    {
      v171 = v15;
      uint64_t v25 = +[BRCUserDefaults defaultsForMangledID:0];
      __int16 v26 = [v25 stageInPackageDirectoryUmask];

      id v187 = v24;
      uint64_t v27 = [v16 itemCountWithError:&v187];
      id v28 = v187;

      if (!v27 && v28)
      {
        id v24 = v28;
LABEL_62:
        id v15 = v171;
        goto LABEL_63;
      }
      unint64_t v167 = v27;
      BOOL v29 = [MEMORY[0x263F08850] defaultManager];
      id v186 = v28;
      int v30 = [v29 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v186];
      id v24 = v186;

      if (!v30) {
        goto LABEL_62;
      }
      id v159 = v18;
      int v31 = (const char *)[v159 fileSystemRepresentation];
      unsigned int v37 = BRCOpenAt(0xFFFFFFFFLL, v31, 33028, v32, v33, v34, v35, v36, v149);
      id v15 = v171;
      if ((v37 & 0x80000000) == 0)
      {
        unsigned int v170 = v37;
        if (v171)
        {
          id v38 = v18;
          long long v184 = 0u;
          long long v185 = 0u;
          long long v182 = 0u;
          long long v183 = 0u;
          id v39 = v171;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v182 objects:v193 count:16];
          id obj = v39;
          if (v40)
          {
            uint64_t v41 = v40;
            unint64_t v166 = 0;
            mode_t v152 = ~v26 & 0x1FF;
            uint64_t v162 = *(void *)v183;
            id v42 = v38;
            uint64_t v43 = v170;
LABEL_12:
            uint64_t v44 = 0;
            uint64_t v158 = v41;
            while (1)
            {
              if (*(void *)v183 != v162) {
                objc_enumerationMutation(obj);
              }
              v45 = *(void **)(*((void *)&v182 + 1) + 8 * v44);
              context = (void *)MEMORY[0x2455D97F0]();
              uint64_t v181 = 512;
              long long v180 = xmmword_23FD34408;
              uint64_t v178 = 0;
              uint64_t v179 = 0;
              uint64_t v177 = 0;
              if ([v45 type] == 4)
              {
                if (v166 >= v167)
                {
                  v101 = brc_bread_crumbs();
                  v102 = brc_default_log();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 134218754;
                    unint64_t v190 = v166;
                    __int16 v191 = 2048;
                    *(void *)v192 = v167;
                    *(_WORD *)&v192[8] = 2112;
                    *(void *)&v192[10] = v16;
                    *(_WORD *)&v192[18] = 2112;
                    *(void *)&v192[20] = v101;
                    _os_log_fault_impl(&dword_23FA42000, v102, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Package has been corrupted on the serverAsking for asset index out of bounds %lu vs %lu in package: %@%@", buf, 0x2Au);
                  }

                  uint64_t v103 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Package has been corrupted on the serverAsking for asset index out of bounds %lu vs %lu in package: %@", v166, v167, v16);

                  id v15 = v171;
                  if ([(BRCClientZone *)self->_clientZone isPrivateZone])
                  {
                    v104 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
                    [v104 reportProblemWithType:9 recordName:v174];
                  }

                  BOOL v100 = 0;
                  id v24 = (id)v103;
                  int v20 = v174;
                  goto LABEL_149;
                }
                ++v166;
              }
              else
              {
                v163 = objc_alloc_init(BRFieldPkgLocalItem);
                v164 = v45;
                id v46 = [v45 path];
                v47 = (const char *)[v46 fileSystemRepresentation];
                v161 = v46;
                if (!v46)
                {
                  v105 = brc_bread_crumbs();
                  v106 = brc_default_log();
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT)) {
                    -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:]();
                  }
                  goto LABEL_118;
                }
                v165 = (char *)v47;
                if (!getattrlistat(v43, v47, &v180, &v177, 0x18uLL, 0x21uLL))
                {
                  v107 = brc_bread_crumbs();
                  v108 = brc_default_log();
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
                  {
                    stageID = self->_stageID;
                    *(_DWORD *)buf = 138412802;
                    unint64_t v190 = (unint64_t)v161;
                    __int16 v191 = 2112;
                    *(void *)v192 = stageID;
                    *(_WORD *)&v192[8] = 2112;
                    *(void *)&v192[10] = v107;
                    _os_log_debug_impl(&dword_23FA42000, v108, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ already exists in stage for package %@%@", buf, 0x20u);
                  }

                  id v15 = v171;
                  goto LABEL_78;
                }
                v48 = v164;
                int v49 = [v164 type];
                switch(v49)
                {
                  case 3:
                    [v164 symlinkContent];
                    int v50 = v43;
                    id v51 = objc_claimAutoreleasedReturnValue();
                    int v52 = symlinkat((const char *)[v51 fileSystemRepresentation], v50, v165);

                    if (v52 < 0)
                    {
                      id v42 = v173;
                      LODWORD(v43) = v170;
                      if (*__error() != 17)
                      {
                        uint64_t v137 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");

                        v138 = brc_bread_crumbs();
                        v139 = brc_default_log();
                        if (os_log_type_enabled(v139, (os_log_type_t)0x90u))
                        {
                          v147 = [v164 symlinkContent];
                          v148 = self->_stageID;
                          *(_DWORD *)buf = 138413058;
                          unint64_t v190 = (unint64_t)v161;
                          __int16 v191 = 2112;
                          *(void *)v192 = v147;
                          *(_WORD *)&v192[8] = 2112;
                          *(void *)&v192[10] = v148;
                          *(_WORD *)&v192[18] = 2112;
                          *(void *)&v192[20] = v138;
                          _os_log_error_impl(&dword_23FA42000, v139, (os_log_type_t)0x90u, "[ERROR] Failed to create symlink %@ -> %@ for package %@%@", buf, 0x2Au);
                        }
LABEL_136:

LABEL_137:
                        id v24 = (id)v137;
LABEL_138:
                        id v15 = v171;
LABEL_139:
                        int v20 = v174;
LABEL_140:
                        v116 = context;
                        v117 = v163;
                        goto LABEL_148;
                      }
                    }
                    else
                    {
                      id v42 = v173;
                      LODWORD(v43) = v170;
                    }
                    break;
                  case 2:
                    if (v166 >= v167)
                    {
                      v126 = brc_bread_crumbs();
                      v127 = brc_default_log();
                      id v15 = v171;
                      if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 134218754;
                        unint64_t v190 = v166;
                        __int16 v191 = 2048;
                        *(void *)v192 = v167;
                        *(_WORD *)&v192[8] = 2112;
                        *(void *)&v192[10] = v16;
                        *(_WORD *)&v192[18] = 2112;
                        *(void *)&v192[20] = v126;
                        _os_log_fault_impl(&dword_23FA42000, v127, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Package has been corrupted in the cloudAsking for asset index out of bounds %lu vs %lu in package: %@%@", buf, 0x2Au);
                      }

                      uint64_t v128 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Package has been corrupted in the cloudAsking for asset index out of bounds %lu vs %lu in package: %@", v166, v167, v16);

                      if (![(BRCClientZone *)self->_clientZone isPrivateZone])
                      {
                        id v24 = (id)v128;
                        goto LABEL_139;
                      }
                      v129 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
                      [v129 reportProblemWithType:9 recordName:v174];

                      id v24 = (id)v128;
                      int v20 = v174;
                      goto LABEL_105;
                    }
                    v53 = objc_msgSend(v16, "itemAtIndex:");
                    if (!v53)
                    {
                      v130 = brc_bread_crumbs();
                      v131 = brc_default_log();
                      if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT)) {
                        -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.7((uint64_t)v130, v166, v131);
                      }

                      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Can't find item at index %ld", v166, v151);
                      uint64_t v120 = LABEL_104:;

                      id v24 = (id)v120;
                      id v15 = v171;
                      int v20 = v174;
LABEL_105:
                      LODWORD(v43) = v170;
                      goto LABEL_140;
                    }
                    v155 = v53;
                    v54 = [v53 fileURL];
                    v55 = [v54 path];

                    if (v55)
                    {
                      if (BRCRenameAt(-1, v55, v170, v161, 0))
                      {
                        int v133 = *__error();
                        v134 = brc_bread_crumbs();
                        v135 = brc_default_log();
                        if (os_log_type_enabled(v135, (os_log_type_t)0x90u))
                        {
                          *(_DWORD *)buf = 138413314;
                          unint64_t v190 = (unint64_t)v55;
                          __int16 v191 = 1024;
                          *(_DWORD *)v192 = v170;
                          *(_WORD *)&v192[4] = 2112;
                          *(void *)&v192[6] = v161;
                          *(_WORD *)&v192[14] = 1024;
                          *(_DWORD *)&v192[16] = v133;
                          *(_WORD *)&v192[20] = 2112;
                          *(void *)&v192[22] = v134;
                          _os_log_error_impl(&dword_23FA42000, v135, (os_log_type_t)0x90u, "[ERROR] renameat(-1, %@, %d, %@) %{errno}d%@", buf, 0x2Cu);
                        }

                        *__error() = v133;
                        objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
                        v136 = v24;
                        id v24 = (id)objc_claimAutoreleasedReturnValue();
                        id v15 = v171;
                        LODWORD(v43) = v170;
LABEL_144:

LABEL_146:
                        v116 = context;
                        v117 = v163;

                        goto LABEL_147;
                      }
                      v56 = brc_bread_crumbs();
                      v57 = brc_default_log();
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                      {
                        v81 = self->_stageID;
                        *(_DWORD *)buf = 138413058;
                        unint64_t v190 = (unint64_t)v55;
                        __int16 v191 = 2112;
                        *(void *)v192 = v161;
                        *(_WORD *)&v192[8] = 2112;
                        *(void *)&v192[10] = v81;
                        *(_WORD *)&v192[18] = 2112;
                        *(void *)&v192[20] = v56;
                        _os_log_debug_impl(&dword_23FA42000, v57, OS_LOG_TYPE_DEBUG, "[DEBUG] staged from %@ to %@ in %@%@", buf, 0x2Au);
                      }

                      v48 = v164;
                      [(BRCPackageManifestWriter *)self _applyFileMetadataWithManifestItem:v164 isDocumentModifiedByOtherUser:a9 packageRootFD:v170];
                    }
                    else
                    {
                      LODWORD(v43) = v170;
                      if ((v10 & 0x80000000) != 0)
                      {
                        v136 = brc_bread_crumbs();
                        v141 = brc_default_log();
                        if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT)) {
                          -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.8();
                        }

                        id v15 = v171;
                        goto LABEL_144;
                      }
                      if (![(BRCPackageManifestWriter *)self _stageExistingPackageItem:v164 withLiveFd:v10 stageFd:v170 isDocumentModifiedByOtherUser:a9])
                      {
                        id v15 = v171;
                        goto LABEL_146;
                      }
                    }
                    ++v166;
                    uint64_t v43 = [v155 signature];
                    [v48 setSignature:v43];

                    LODWORD(v43) = v170;
                    break;
                  case 1:
                    if (mkdirat(v43, v165, v152) && *__error() != 17)
                    {
                      uint64_t v137 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");

                      v138 = brc_bread_crumbs();
                      v132 = brc_default_log();
                      if (os_log_type_enabled(v132, (os_log_type_t)0x90u))
                      {
                        v146 = self->_stageID;
                        *(_DWORD *)buf = 138412802;
                        unint64_t v190 = (unint64_t)v161;
                        __int16 v191 = 2112;
                        *(void *)v192 = v146;
                        *(_WORD *)&v192[8] = 2112;
                        *(void *)&v192[10] = v138;
                        _os_log_error_impl(&dword_23FA42000, v132, (os_log_type_t)0x90u, "[ERROR] Failed to mkdir %@ for package %@%@", buf, 0x20u);
                      }

                      goto LABEL_136;
                    }
                    [(BRCPackageManifestWriter *)self _applyDirectoryMetadataWithManifestItem:v164 packageRootFD:v43];
                    break;
                  default:
                    v105 = brc_bread_crumbs();
                    v106 = brc_default_log();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT)) {
                      -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:]();
                    }
LABEL_118:

                    goto LABEL_138;
                }
                if ([v48 hasXattrIndex])
                {
                  if ([v48 xattrIndex] < 0
                    || (uint64_t v58 = [v48 xattrIndex], v58 >= objc_msgSend(v172, "itemCount")))
                  {
                    v109 = brc_bread_crumbs();
                    v110 = brc_default_log();
                    if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
                    {
                      uint64_t v143 = [v164 xattrIndex];
                      uint64_t v144 = [v172 itemCount];
                      *(_DWORD *)buf = 134218498;
                      unint64_t v190 = v143;
                      __int16 v191 = 2048;
                      *(void *)v192 = v144;
                      *(_WORD *)&v192[8] = 2112;
                      *(void *)&v192[10] = v109;
                      _os_log_fault_impl(&dword_23FA42000, v110, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: xattr index is out of bounds %ld of total %ld%@", buf, 0x20u);
                    }

                    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: xattr index is out of bounds %ld of total %ld", objc_msgSend(v164, "xattrIndex"), objc_msgSend(v172, "itemCount"));
                    goto LABEL_104;
                  }
                  v59 = objc_msgSend(v172, "itemAtIndex:", objc_msgSend(v48, "xattrIndex"));
                  if (!v59)
                  {
                    v118 = brc_bread_crumbs();
                    v119 = brc_default_log();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT)) {
                      -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.4();
                    }

                    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Can't find xattr at index %ld", objc_msgSend(v164, "xattrIndex"), v151);
                    goto LABEL_104;
                  }
                  v60 = v59;
                  v61 = (void *)MEMORY[0x263EFF8F8];
                  v62 = [v59 fileURL];
                  id v176 = v24;
                  v157 = [v61 dataWithContentsOfURL:v62 options:0 error:&v176];
                  id v63 = v176;

                  v64 = [v60 fileURL];

                  if (v64)
                  {
                    v70 = [MEMORY[0x263F08850] defaultManager];
                    v71 = [v60 fileURL];
                    [v70 removeItemAtURL:v71 error:0];
                  }
                  if (!v157 || v63)
                  {
                    LODWORD(v43) = v170;
                    if (!v63)
                    {
                      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 15, @"Can't load xattr");
                      id v63 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    id v168 = v63;
                    v121 = brc_bread_crumbs();
                    v122 = brc_default_log();
                    id v15 = v171;
                    v116 = context;
                    v117 = v163;
                    if (os_log_type_enabled(v122, (os_log_type_t)0x90u)) {
                      -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.5();
                    }

                    id v24 = v168;
LABEL_112:

LABEL_147:
                    int v20 = v174;
LABEL_148:

                    BOOL v100 = 0;
                    goto LABEL_149;
                  }
                  LODWORD(v43) = v170;
                  uint64_t v72 = BRCOpenAt(v170, v165, 33028, v65, v66, v67, v68, v69, v150);
                  if ((v72 & 0x80000000) != 0)
                  {
                    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
                    id v24 = (id)objc_claimAutoreleasedReturnValue();
                    id v15 = v171;
                    v116 = context;
                    v117 = v163;
                    goto LABEL_112;
                  }
                  uint64_t v73 = v72;
                  v74 = [[BRFieldXattrBlob alloc] initWithData:v157];
                  id v175 = 0;
                  v156 = v74;
                  BOOL v75 = [(BRFieldXattrBlob *)v74 applyToFileDescriptor:v73 error:&v175];
                  id v24 = v175;
                  if (!v75)
                  {
                    v123 = brc_bread_crumbs();
                    v124 = brc_default_log();
                    if (os_log_type_enabled(v124, (os_log_type_t)0x90u))
                    {
                      *(_DWORD *)buf = 138412546;
                      unint64_t v190 = (unint64_t)v24;
                      __int16 v191 = 2112;
                      *(void *)v192 = v123;
                      _os_log_error_impl(&dword_23FA42000, v124, (os_log_type_t)0x90u, "[ERROR] Failed to apply xattrs to file descriptor: %@%@", buf, 0x16u);
                    }

                    close(v73);

                    BOOL v100 = 0;
                    id v15 = v171;
LABEL_81:
                    int v20 = v174;
                    LODWORD(v43) = v170;
LABEL_149:
                    [v16 close];
                    close(v43);
                    if (v100)
                    {
LABEL_71:
                      BOOL v22 = [(BRCPackageManifestWriter *)self done];

                      id v17 = v172;
                      id v18 = v173;
                      goto LABEL_72;
                    }
LABEL_65:
                    if (!*p_error)
                    {
                      if (v24)
                      {
                        v82 = (NSError *)v24;
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 22, @"unknown error");
                        v82 = (NSError *)objc_claimAutoreleasedReturnValue();
                      }
                      v83 = *p_error;
                      *p_error = v82;
                    }
                    v84 = [v20 substringFromIndex:objc_msgSend(@"documentContent/", "length")];
                    v85 = [(BRCClientZone *)self->_clientZone mangledID];
                    id v86 = +[AppTelemetryTimeSeriesEvent newCorruptPackageDownloadEventWithZoneMangledID:v85 enhancedDrivePrivacyEnabled:[(BRCClientZone *)self->_clientZone enhancedDrivePrivacyEnabled] error:v24 itemIDString:v84];

                    v87 = [(BRCClientZone *)self->_clientZone session];
                    v88 = [v87 analyticsReporter];
                    [v88 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v86];

                    int v20 = v174;
                    goto LABEL_71;
                  }
                  v153 = v60;
                  close(v73);
                  [(BRFieldPkgLocalItem *)v163 setXattrs:v157];
                  v154 = brc_bread_crumbs();
                  v76 = brc_default_log();
                  id v77 = v173;
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                  {
                    v79 = [(BRFieldXattrBlob *)v156 shortDescription];
                    v80 = [v164 path];
                    *(_DWORD *)buf = 138412802;
                    unint64_t v190 = (unint64_t)v79;
                    __int16 v191 = 2112;
                    *(void *)v192 = v80;
                    *(_WORD *)&v192[8] = 2112;
                    *(void *)&v192[10] = v154;
                    _os_log_debug_impl(&dword_23FA42000, v76, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully applied xattrs %@ to package item %@%@", buf, 0x20u);

                    id v77 = v173;
                  }
                  id v78 = v77;

                  LODWORD(v43) = v170;
                  v48 = v164;
                }
                else
                {
                  id v78 = v42;
                }
                if (getattrlistat(v43, v165, &v180, &v177, 0x18uLL, 0x21uLL))
                {
                  uint64_t v137 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");

                  int v111 = *__error();
                  v112 = brc_bread_crumbs();
                  v113 = brc_default_log();
                  if (os_log_type_enabled(v113, (os_log_type_t)0x90u))
                  {
                    v145 = self->_stageID;
                    *(_DWORD *)buf = 138413058;
                    unint64_t v190 = (unint64_t)v161;
                    __int16 v191 = 2112;
                    *(void *)v192 = v145;
                    *(_WORD *)&v192[8] = 1024;
                    *(_DWORD *)&v192[10] = v111;
                    *(_WORD *)&v192[14] = 2112;
                    *(void *)&v192[16] = v112;
                    _os_log_error_impl(&dword_23FA42000, v113, (os_log_type_t)0x90u, "[ERROR] unable to stat %@ for package %@ %{errno}d%@", buf, 0x26u);
                  }

                  *__error() = v111;
                  goto LABEL_137;
                }
                [(BRFieldPkgLocalItem *)v163 setItem:v48];
                [(BRFieldPkgLocalItem *)v163 setFileID:v178];
                if ([v48 type] == 2)
                {
                  [(BRFieldPkgLocalItem *)v163 setGenerationID:HIDWORD(v177)];
                  [(BRFieldPkgLocalItem *)v163 setSize:v179];
                }
                if (![(BRCPackageManifestWriter *)self addLocalItem:v163])
                {
                  v114 = brc_bread_crumbs();
                  v115 = brc_default_log();
                  if (os_log_type_enabled(v115, (os_log_type_t)0x90u)) {
                    -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.6();
                  }

                  id v15 = v171;
                  int v20 = v174;
                  v116 = context;
                  v117 = v163;
                  LODWORD(v43) = v170;
                  goto LABEL_148;
                }
                id v42 = v78;

                uint64_t v43 = v170;
                uint64_t v41 = v158;
              }
              if (v41 == ++v44)
              {
                uint64_t v41 = [obj countByEnumeratingWithState:&v182 objects:v193 count:16];
                id v15 = v171;
                if (v41) {
                  goto LABEL_12;
                }
                goto LABEL_78;
              }
            }
          }
          unint64_t v166 = 0;
LABEL_78:

          v97 = brc_bread_crumbs();
          v98 = brc_default_log();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            v125 = [v159 path];
            *(_DWORD *)buf = 138413058;
            unint64_t v190 = (unint64_t)v125;
            __int16 v191 = 2048;
            *(void *)v192 = v167;
            *(_WORD *)&v192[8] = 2048;
            *(void *)&v192[10] = v166;
            *(_WORD *)&v192[18] = 2112;
            *(void *)&v192[20] = v97;
            _os_log_debug_impl(&dword_23FA42000, v98, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished staging package for %@. Item count:%lu.  Asset index:%lu%@", buf, 0x2Au);
          }
          uint64_t v99 = [obj error];

          BOOL v100 = v99 == 0;
          id v24 = (id)v99;
          goto LABEL_81;
        }
        v91 = brc_bread_crumbs();
        v92 = brc_default_log();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT)) {
          -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:]();
        }

        v93 = (void *)MEMORY[0x263F087E8];
        uint64_t v94 = *MEMORY[0x263F32430];
        id v95 = [v159 path];
        uint64_t v96 = objc_msgSend(v93, "br_errorWithDomain:code:description:", v94, 15, @"unreachable: No reader to stage package at %s", objc_msgSend(v95, "UTF8String"));

        [v16 close];
        close(v170);
        id v24 = (id)v96;
LABEL_64:
        int v20 = v174;
        goto LABEL_65;
      }
      uint64_t v90 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", *__error());

      id v24 = (id)v90;
    }
LABEL_63:
    [v16 close];
    goto LABEL_64;
  }
  BOOL v22 = 0;
LABEL_72:

  return v22;
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)addItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Adding %@ to the manifest%@");
}

- (void)_applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Invalid args in %@%@");
}

- (void)_stageExistingPackageItem:withLiveFd:stageFd:isDocumentModifiedByOtherUser:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: we should have downloaded this file if there is nothing live%@", v2, v3, v4, v5, v6);
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 path];
  [v1 UTF8String];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v2, v3, "[CRIT] UNREACHABLE: No reader to stage package at %s%@", v4, v5, v6, v7, v8);
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: relpath should always exist%@", v2, v3, v4, v5, v6);
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = [v2 type];
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid item type: %d%@", (uint8_t *)v3, 0x12u);
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.4()
{
  OUTLINED_FUNCTION_12();
  [v0 xattrIndex];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: Can't find xattr at index %ld%@", v3, v4, v5, v6, v7);
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed to read xattrs blob: %@%@");
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Unable to add item to manifest: %@%@");
}

- (void)stagePackageWithReader:(NSObject *)a3 package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.7(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, a2, a3, "[CRIT] UNREACHABLE: Can't find item at index %ld%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.8()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 path];
  [v1 UTF8String];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v2, v3, "[CRIT] UNREACHABLE: We didn't fetch the corresponding pkg item from the server, but we were also not given a path to hardlink it from! (item: %s)%@", v4, v5, v6, v7, v8);
}

@end