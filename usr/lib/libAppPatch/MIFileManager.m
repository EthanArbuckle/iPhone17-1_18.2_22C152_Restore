@interface MIFileManager
+ (id)_sanitizeFilePathForVarOrTmpSymlink:(id)a3 error:(id *)a4;
+ (id)defaultManager;
- (BOOL)_bulkSetPropertiesForPath:(const char *)a3 existingFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11;
- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 alwaysClone:(BOOL)a6 ignoreErrors:(BOOL)a7 error:(id *)a8;
- (BOOL)_itemIsType:(unsigned __int16)a3 withDescription:(id)a4 atURL:(id)a5 error:(id *)a6;
- (BOOL)_markEAFlag:(const char *)a3 forAppIdentifier:(id)a4 insecurelyCachedOnBundle:(id)a5 error:(id *)a6;
- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5;
- (BOOL)_setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7;
- (BOOL)_stageURLByCopying:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 dataProtectionClass:(int)a9 hasSymlink:(BOOL *)a10 error:(id *)a11;
- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5;
- (BOOL)bulkSetPropertiesForPath:(const char *)a3 UID:(unsigned int)a4 GID:(unsigned int)a5 mode:(unsigned __int16)a6 flags:(unsigned int)a7 dataProtectionClass:(int)a8 removeACL:(BOOL)a9 error:(id *)a10;
- (BOOL)bulkSetPropertiesForPath:(const char *)a3 withOpenFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11;
- (BOOL)bundleAtURLIsPlaceholder:(id)a3;
- (BOOL)captureStoreDataFromDirectory:(id)a3 toDirectory:(id)a4 doCopy:(BOOL)a5 failureIsFatal:(BOOL)a6 includeiTunesMetadata:(BOOL)a7 withError:(id *)a8;
- (BOOL)clearPlaceholderStatusForBundle:(id)a3 withError:(id *)a4;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 alwaysClone:(BOOL)a5 error:(id *)a6;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)copyItemIgnoringErrorsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5;
- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5;
- (BOOL)itemDoesNotExistAtURL:(id)a3;
- (BOOL)itemDoesNotExistOrIsNotDirectoryAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsFIFOAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsFileAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsSocketAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsSymlinkAtURL:(id)a3 error:(id *)a4;
- (BOOL)markBundleAsPlaceholder:(id)a3 withError:(id *)a4;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeExtendedAttributeNamed:(id)a3 fromURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5;
- (BOOL)secureRenameFromSourceURL:(id)a3 toDestinationURL:(id)a4 destinationStatus:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)setAppClipAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5;
- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onFD:(int)a5 fdLocation:(id)a6 error:(id *)a7;
- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 error:(id *)a6;
- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6;
- (BOOL)setInstallType:(id)a3 inExtendedAttributeOnBundle:(id)a4 error:(id *)a5;
- (BOOL)setModificationDateToNowForURL:(id)a3 error:(id *)a4;
- (BOOL)setOwnerOfURL:(id)a3 toUID:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6;
- (BOOL)setPermissionsForURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)setValidatedByFreeProfileAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5;
- (BOOL)stageURL:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 hasSymlink:(BOOL *)a9 error:(id *)a10;
- (BOOL)stageURLByMoving:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 settingUID:(unsigned int)a6 gid:(unsigned int)a7 dataProtectionClass:(int)a8 breakHardlinks:(BOOL)a9 hasSymlink:(BOOL *)a10 error:(id *)a11;
- (BOOL)standardizeOwnershipAtURL:(id)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5 removeACLs:(BOOL)a6 setProtectionClass:(BOOL)a7 foundSymlink:(BOOL *)a8 error:(id *)a9;
- (BOOL)validateSymlinksInURLDoNotEscapeURL:(id)a3 error:(id *)a4;
- (id)_dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7;
- (id)_insecureCachedAppIdentifierIfMarkedWithEAFlag:(const char *)a3 bundleURL:(id)a4 allowPlaceholders:(BOOL)a5 error:(id *)a6;
- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4;
- (id)_realPathWhatExistsInPath:(id)a3 isDirectory:(BOOL)a4;
- (id)aclTextFromURL:(id)a3 error:(id *)a4;
- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4;
- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromFD:(int)a5 fdLocation:(id)a6 error:(id *)a7;
- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromURL:(id)a5 error:(id *)a6;
- (id)debugDescriptionForItemAtURL:(id)a3;
- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4;
- (id)enumerateURLsForItemsInDirectoryAtURL:(id)a3 ignoreSymlinks:(BOOL)a4 withBlock:(id)a5;
- (id)extendedAttributesFromURL:(id)a3 error:(id *)a4;
- (id)insecureCachedAppIdentifierIfAppClipForBundle:(id)a3 error:(id *)a4;
- (id)insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:(id)a3 error:(id *)a4;
- (id)installTypeFromExtendedAttributeOnBundle:(id)a3 error:(id *)a4;
- (id)modificationDateForURL:(id)a3 error:(id *)a4;
- (id)realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4 isDirectory:(BOOL)a5 error:(id *)a6;
- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4;
- (id)traverseDirectoryAtURL:(id)a3 withBlock:(id)a4;
- (id)upToFirstFourBytesFromURL:(id)a3 error:(id *)a4;
- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5;
- (int)deviceForURLOrFirstAvailableParent:(id)a3 error:(id *)a4;
- (unint64_t)diskUsageForURL:(id)a3;
- (void)logAccessPermissionsForURL:(id)a3;
@end

@implementation MIFileManager

+ (id)defaultManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MIFileManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, block);
  }
  v2 = (void *)defaultManager_defaultInstance;

  return v2;
}

uint64_t __31__MIFileManager_defaultManager__block_invoke()
{
  defaultManager_defaultInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self removeItemAtURL:a3 keepParent:0 error:a4];
}

- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = removefile_state_alloc();
  v10 = v8;
  int value = 0;
  if (!v7)
  {
    v18 = (void *)*MEMORY[0x263F08438];
    v19 = @"nil url passed to -removeItemAtURL:error:";
    uint64_t v20 = 109;
    uint64_t v21 = 14;
LABEL_19:
    _CreateError((uint64_t)"-[MIFileManager removeItemAtURL:keepParent:error:]", v20, v18, v21, 0, 0, v19, v9, v28);
    goto LABEL_20;
  }
  if (removefile_state_set(v8, 3u, _removefile_error_callback) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v11 = __error();
    strerror(*v11);
    MOLogWrite();
  }
  if (removefile_state_set(v10, 4u, &value) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v12 = __error();
    strerror(*v12);
    MOLogWrite();
  }
  if (v6) {
    removefile_flags_t v13 = 3;
  }
  else {
    removefile_flags_t v13 = 1;
  }
  id v14 = v7;
  if (removefile((const char *)[v14 fileSystemRepresentation], v10, v13) && *__error() != 2)
  {
    v22 = (void *)*MEMORY[0x263F08438];
    uint64_t v23 = *__error();
    v24 = __error();
    uint64_t v28 = (uint64_t)v14;
    strerror(*v24);
    v19 = @"removefile of %@ failed: %s";
    uint64_t v20 = 130;
    v18 = v22;
    uint64_t v21 = v23;
    goto LABEL_19;
  }
  uint64_t v15 = value;
  if ((value & 0xFFFFFFFD) == 0)
  {
    removefile_state_free(v10);
    id v25 = 0;
    BOOL v26 = 1;
    goto LABEL_24;
  }
  v16 = (void *)*MEMORY[0x263F08438];
  strerror(value);
  _CreateError((uint64_t)"-[MIFileManager removeItemAtURL:keepParent:error:]", 136, v16, v15, 0, 0, @"removefile of %@ failed: %s", v17, (uint64_t)v14);
LABEL_20:
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  removefile_state_free(v10);
  if (a5)
  {
    id v25 = v25;
    BOOL v26 = 0;
    *a5 = v25;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_24:

  return v26;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v10 = a4;
  id v11 = a3;
  v12 = (const char *)[v11 fileSystemRepresentation];
  if (v10)
  {
    int v13 = mkpath_np(v12, a5);
    if (v13)
    {
      int v14 = v13;
      if (v13 != 17)
      {
        uint64_t v15 = (void *)*MEMORY[0x263F08438];
        v16 = [v11 path];
        strerror(v14);
        _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 159, v15, v14, 0, 0, @"mkpath_np of %@ failed: %s", v17, (uint64_t)v16);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
  }
  else if (mkdir(v12, a5) && *__error() != 17)
  {
    v30 = (void *)*MEMORY[0x263F08438];
    uint64_t v31 = *__error();
    v32 = [v11 path];
    v33 = __error();
    strerror(*v33);
    _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 165, v30, v31, 0, 0, @"mkdir of %@ failed: %s", v34, (uint64_t)v32);
LABEL_14:
    id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    BOOL v24 = 0;
    if (!a7) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v8 == -1)
  {
    id v18 = 0;
    BOOL v24 = 1;
    goto LABEL_21;
  }
  id v19 = v11;
  uint64_t v20 = opendir((const char *)[v19 fileSystemRepresentation]);
  if (!v20)
  {
    v35 = (void *)*MEMORY[0x263F08438];
    uint64_t v36 = *__error();
    v32 = [v19 path];
    v37 = __error();
    strerror(*v37);
    _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 175, v35, v36, 0, 0, @"opendir of %@ failed: %s", v38, (uint64_t)v32);
    goto LABEL_14;
  }
  uint64_t v21 = v20;
  int v22 = dirfd(v20);
  int v23 = fcntl(v22, 64, v8);
  BOOL v24 = v23 == 0;
  if (v23)
  {
    id v25 = (void *)*MEMORY[0x263F08438];
    uint64_t v26 = *__error();
    v27 = [v19 path];
    uint64_t v28 = __error();
    strerror(*v28);
    _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 181, v25, v26, 0, 0, @"Failed to setclass(%d) on directory %@: %s", v29, v8);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
  closedir(v21);
  if (a7)
  {
LABEL_19:
    if (!v24)
    {
      id v18 = v18;
      BOOL v24 = 0;
      *a7 = v18;
    }
  }
LABEL_21:

  return v24;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return [(MIFileManager *)self createDirectoryAtURL:a3 withIntermediateDirectories:a4 mode:a5 class:0xFFFFFFFFLL error:a6];
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 alwaysClone:(BOOL)a6 ignoreErrors:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = objc_opt_new();
  [v15 setIgnoreErrors:v9];
  [v15 setError:0];
  if (a5
    || (memset(&v42, 0, sizeof(v42)),
        id v16 = v13,
        !lstat((const char *)[v16 fileSystemRepresentation], &v42)))
  {
    memset(&v41, 0, sizeof(v41));
    id v20 = v14;
    if (lstat((const char *)[v20 fileSystemRepresentation], &v41) || (v41.st_mode & 0xF000) != 0x4000)
    {
      if (v10) {
        copyfile_flags_t v24 = 34373647;
      }
      else {
        copyfile_flags_t v24 = 17596431;
      }
      id v25 = copyfile_state_alloc();
      copyfile_state_set(v25, 6u, _CopyfileStatusCallback);
      copyfile_state_set(v25, 7u, v15);
      id v26 = v13;
      v27 = (const char *)[v26 fileSystemRepresentation];
      id v28 = v20;
      int v29 = copyfile(v27, (const char *)[v28 fileSystemRepresentation], v25, v24);
      BOOL v18 = v29 == 0;
      if (v29)
      {
        v30 = [v15 error];
        uint64_t v31 = v30;
        if (v30)
        {
          id v19 = v30;
        }
        else
        {
          int v35 = *__error();
          v40 = (void *)*MEMORY[0x263F08438];
          uint64_t v36 = [v26 path];
          v39 = [v28 path];
          strerror(v35);
          _CreateError((uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]", 334, v40, v35, 0, 0, @"copyfile of %@ to %@ failed: %s", v37, (uint64_t)v36);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!v25) {
          goto LABEL_20;
        }
      }
      else
      {
        id v19 = 0;
        if (!v25) {
          goto LABEL_20;
        }
      }
      copyfile_state_free(v25);
    }
    else
    {
      uint64_t v21 = (void *)*MEMORY[0x263F08438];
      int v22 = [v20 path];
      _CreateError((uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]", 300, v21, 17, 0, 0, @"Destination %@ exists and is a directory", v23, (uint64_t)v22);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v18 = 0;
    }
  }
  else
  {
    uint64_t v17 = *__error();
    BOOL v18 = v17 == 2;
    if (v17 == 2)
    {
      id v19 = 0;
    }
    else
    {
      v32 = (void *)*MEMORY[0x263F08438];
      v33 = [v16 path];
      strerror(v17);
      _CreateError((uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]", 289, v32, v17, 0, 0, @"stat of %@ failed: %s", v34, (uint64_t)v33);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_20:
  if (a8 && !v18) {
    *a8 = v19;
  }

  return v18;
}

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  id v13 = (const std::__fs::filesystem::path *)[v12 fileSystemRepresentation];
  id v14 = v11;
  id v16 = (const std::__fs::filesystem::path *)[v14 fileSystemRepresentation];
  if (!a5)
  {
    memset(&v38, 0, sizeof(v38));
    if (lstat((const char *)v13, &v38))
    {
      uint64_t v17 = __error();
      uint64_t v18 = *v17;
      LOBYTE(v19) = v18 == 2;
      if (v18 == 2)
      {
        id v20 = 0;
        if (!a6) {
          goto LABEL_28;
        }
LABEL_25:
        if (!v19)
        {
          id v28 = v20;
          LOBYTE(v19) = 0;
          *a6 = v28;
          goto LABEL_29;
        }
LABEL_28:
        id v28 = v20;
        goto LABEL_29;
      }
      int v29 = (void *)*MEMORY[0x263F08438];
      strerror(*v17);
      id v20 = _CreateError((uint64_t)"-[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 368, v29, v18, 0, 0, @"stat of %s failed: %s", v30, (uint64_t)v13);
      goto LABEL_24;
    }
  }
  rename(v13, v16, v15);
  if (v21)
  {
    int v22 = __error();
    uint64_t v23 = *v22;
    if (v23 != 30)
    {
      if (v23 != 18)
      {
        uint64_t v31 = (void *)*MEMORY[0x263F08438];
        strerror(*v22);
        id v20 = _CreateError((uint64_t)"-[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 388, v31, v23, 0, 0, @"rename of %s to %s failed: %s", v32, (uint64_t)v13);
        LOBYTE(v19) = 0;
        if (!a6) {
          goto LABEL_28;
        }
        goto LABEL_25;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
        -[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]((uint64_t)v13, (uint64_t)v16);
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v34 = v13;
        int v35 = v16;
        MOLogWrite();
      }
    }
    copyfile_flags_t v24 = [v12 path:v34, v35];
    char v25 = [v24 containsString:@"/System/Library/AppPlaceholders"];

    id v37 = 0;
    BOOL v19 = [(MIFileManager *)self _copyItemAtURL:v12 toURL:v14 failIfSrcMissing:1 alwaysClone:0 ignoreErrors:0 error:&v37];
    id v26 = v37;
    id v20 = v26;
    if (!v19 || v23 == 30 || (v25 & 1) != 0)
    {
LABEL_24:
      if (!a6) {
        goto LABEL_28;
      }
      goto LABEL_25;
    }
    id v36 = v26;
    BOOL v27 = [(MIFileManager *)self removeItemAtURL:v12 error:&v36];
    id v28 = v36;

    if (!v27 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
      MOLogWrite();
    }
  }
  else
  {
    id v28 = 0;
  }
  LOBYTE(v19) = 1;
LABEL_29:

  return v19;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 alwaysClone:(BOOL)a5 error:(id *)a6
{
  return [(MIFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:0 alwaysClone:a5 ignoreErrors:0 error:a6];
}

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MIFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:0 alwaysClone:0 ignoreErrors:0 error:a5];
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MIFileManager *)self _moveItemAtURL:a3 toURL:a4 failIfSrcMissing:0 error:a5];
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MIFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:1 alwaysClone:0 ignoreErrors:0 error:a5];
}

- (BOOL)copyItemIgnoringErrorsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MIFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:1 alwaysClone:0 ignoreErrors:1 error:a5];
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MIFileManager *)self _moveItemAtURL:a3 toURL:a4 failIfSrcMissing:1 error:a5];
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  id v5 = [a3 URLByAppendingPathComponent:@"temp.XXXXXX" isDirectory:1];
  BOOL v6 = strdup((const char *)[v5 fileSystemRepresentation]);
  if (mkdtemp(v6))
  {
    id v7 = [NSURL fileURLWithFileSystemRepresentation:v6 isDirectory:1 relativeToURL:0];
    free(v6);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    id v13 = @"PathArgument";
    v14[0] = v5;
    BOOL v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = _CreateAndLogError((uint64_t)"-[MIFileManager createTemporaryDirectoryInDirectoryURL:error:]", 452, @"MIInstallerErrorDomain", 4, v8, v9, @"Failed to create temp dir at path %s", v10, (uint64_t)v6);

    if (a4) {
      *a4 = v11;
    }
    free(v6);

    id v7 = 0;
  }

  return v7;
}

- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  acl_t v8 = acl_init(0);
  if (v8)
  {
    acl_t v9 = v8;
    if (v6)
    {
      uint64_t v10 = opendir(a3);
      if (v10)
      {
        id v11 = v10;
        if (dirfd(v10) < 0)
        {
          v48 = (void *)*MEMORY[0x263F08438];
          uint64_t v49 = *__error();
          v50 = __error();
          strerror(*v50);
          uint64_t v17 = _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 485, v48, v49, 0, 0, @"dirfd of %s failed: %s", v51, (uint64_t)a3);
          uint64_t v18 = 485;
        }
        else
        {
          if (!MEMORY[0x230FCA750]())
          {
            id v26 = 0;
            BOOL v27 = 1;
            goto LABEL_20;
          }
          id v12 = (void *)*MEMORY[0x263F08438];
          uint64_t v13 = *__error();
          id v14 = __error();
          strerror(*v14);
          uint64_t v17 = _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 490, v12, v13, 0, 0, @"Failed to set ACL on dir %s: %s", v15, (uint64_t)a3);
          uint64_t v18 = 490;
        }
        id v26 = _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", v18, @"MIInstallerErrorDomain", 4, v17, 0, @"Failed to remove ACL", v16, v53);

        BOOL v27 = 0;
LABEL_20:
        closedir(v11);
        goto LABEL_21;
      }
      id v37 = (void *)*MEMORY[0x263F08438];
      uint64_t v38 = *__error();
      v39 = __error();
      strerror(*v39);
      stat v42 = _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 479, v37, v38, 0, 0, @"opendir of %s failed: %s", v40, (uint64_t)a3);
      uint64_t v43 = 479;
    }
    else
    {
      int v28 = open(a3, 2097154);
      if ((v28 & 0x80000000) == 0)
      {
        int v29 = v28;
        int v30 = MEMORY[0x230FCA750]();
        BOOL v27 = v30 == 0;
        if (v30)
        {
          uint64_t v31 = (void *)*MEMORY[0x263F08438];
          uint64_t v32 = *__error();
          v33 = __error();
          strerror(*v33);
          int v35 = _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 501, v31, v32, 0, 0, @"Failed to set ACL on %s: %s", v34, (uint64_t)a3);
          id v26 = _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 501, @"MIInstallerErrorDomain", 4, v35, 0, @"Failed to remove ACL", v36, v55);
        }
        else
        {
          id v26 = 0;
        }
        close(v29);
LABEL_21:
        acl_free(v9);
        if (!a5) {
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      v44 = (void *)*MEMORY[0x263F08438];
      uint64_t v45 = *__error();
      v46 = __error();
      strerror(*v46);
      stat v42 = _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 496, v44, v45, 0, 0, @"open of %s failed: %s", v47, (uint64_t)a3);
      uint64_t v43 = 496;
    }
    id v26 = _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", v43, @"MIInstallerErrorDomain", 4, v42, 0, @"Failed to remove ACL", v41, v56);

    BOOL v27 = 0;
    goto LABEL_21;
  }
  BOOL v19 = (void *)*MEMORY[0x263F08438];
  uint64_t v20 = *__error();
  int v21 = __error();
  int v22 = strerror(*v21);
  copyfile_flags_t v24 = _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 472, v19, v20, 0, 0, @"acl_init() failed: %s", v23, (uint64_t)v22);
  id v26 = _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 472, @"MIInstallerErrorDomain", 4, v24, 0, @"Failed to remove ACL", v25, v54);

  BOOL v27 = 0;
  if (!a5) {
    goto LABEL_24;
  }
LABEL_22:
  if (!v27) {
    *a5 = v26;
  }
LABEL_24:

  return v27;
}

- (BOOL)bulkSetPropertiesForPath:(const char *)a3 withOpenFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11
{
  return -[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:](self, "_bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:", a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, a7, *(void *)&a8);
}

- (BOOL)bulkSetPropertiesForPath:(const char *)a3 UID:(unsigned int)a4 GID:(unsigned int)a5 mode:(unsigned __int16)a6 flags:(unsigned int)a7 dataProtectionClass:(int)a8 removeACL:(BOOL)a9 error:(id *)a10
{
  return -[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:](self, "_bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:", a3, 0xFFFFFFFFLL, *(void *)&a4, *(void *)&a5, a6, *(void *)&a7);
}

- (BOOL)_bulkSetPropertiesForPath:(const char *)a3 existingFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11
{
  int v33 = a4;
  uint64_t v34 = a3;
  v36[3] = *MEMORY[0x263EF8340];
  v36[0] = 5;
  v36[1] = 0;
  v36[2] = 0;
  ssize_t v15 = acl_size((acl_t)1);
  int v35 = v32;
  uint64_t v16 = v15 + 28;
  if (!a10) {
    uint64_t v16 = 28;
  }
  uint64_t v17 = (unsigned int *)&v32[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  size_t v18 = 12;
  if (a9 == -1) {
    uint64_t v19 = 8;
  }
  else {
    uint64_t v19 = 12;
  }
  if (geteuid())
  {
    int v20 = 0;
    int v21 = v17;
  }
  else
  {
    *uint64_t v17 = a5;
    int v21 = v17 + 1;
    int v20 = 0x8000;
    size_t v18 = 16;
  }
  *int v21 = a6;
  v21[1] = a7 & 0xFFF;
  v21[2] = a8;
  int v22 = (int *)(v21 + 3);
  int v23 = v20 | 0x70000;
  HIDWORD(v36[0]) = v20 | 0x70000;
  if (a10)
  {
    *(void *)(v21 + 3) = v19;
    v18 += 8;
    copyfile_flags_t v24 = v21 + 3;
    int v22 = (int *)(v21 + 5);
    int v23 = v20 | 0x470000;
    HIDWORD(v36[0]) = v20 | 0x470000;
  }
  else
  {
    copyfile_flags_t v24 = 0;
  }
  if (a9 != -1)
  {
    *v22++ = a9;
    v18 += 4;
    HIDWORD(v36[0]) = v23 | 0x40000000;
  }
  if (a10)
  {
    ssize_t v25 = acl_copy_ext_native(v22, (acl_t)1, v15);
    if (v25 > v15)
    {
      _CreateAndLogError((uint64_t)"-[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]", 632, @"MIInstallerErrorDomain", 4, 0, 0, @"acl_copy_ext_native returned size %zd which was more than we had allocated (%zd)", v26, v25);
      goto LABEL_21;
    }
    v24[1] = v25;
    v18 += v25;
  }
  if (v33 < 0)
  {
    if (setattrlist(v34, v36, v17, v18, 1u)) {
      goto LABEL_20;
    }
LABEL_24:
    id v29 = 0;
    BOOL v30 = 1;
    goto LABEL_26;
  }
  if (!fsetattrlist(v33, v36, v17, v18, 0)) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v27 = *__error();
  _CreateAndLogError((uint64_t)"-[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]", 651, (void *)*MEMORY[0x263F08438], v27, 0, 0, @"setattrlist failed for file %s", v28, (uint64_t)v34);
LABEL_21:
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (a11)
  {
    id v29 = v29;
    BOOL v30 = 0;
    *a11 = v29;
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_26:

  return v30;
}

- (BOOL)stageURLByMoving:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 settingUID:(unsigned int)a6 gid:(unsigned int)a7 dataProtectionClass:(int)a8 breakHardlinks:(BOOL)a9 hasSymlink:(BOOL *)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  uint64_t v49 = __Block_byref_object_dispose_;
  id v50 = 0;
  int v20 = [v19 URLByAppendingPathComponent:v18 isDirectory:0];
  int v21 = objc_opt_new();
  id v44 = 0;
  LOBYTE(a5) = [(MIFileManager *)self moveItemAtURL:v17 toURL:v20 error:&v44];
  uint64_t v32 = v17;
  id v22 = v44;
  if ((a5 & 1) == 0)
  {
LABEL_9:
    if (a11)
    {
      if (v22)
      {
        id v29 = v22;
        id v22 = v29;
      }
      else
      {
        id v29 = (id) v46[5];
      }
      BOOL v30 = 0;
      *a11 = v29;
    }
    else
    {
      BOOL v30 = 0;
    }
    goto LABEL_15;
  }
  uint64_t v23 = [v20 fileSystemRepresentation];
  id v43 = v22;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke;
  v34[3] = &unk_264BB3190;
  v34[4] = self;
  id v35 = v19;
  unsigned int v39 = a6;
  unsigned int v40 = a7;
  int v41 = a8;
  BOOL v42 = a9;
  id v24 = v21;
  id v36 = v24;
  id v37 = &v45;
  uint64_t v38 = &v51;
  int v25 = TraverseDirectory(v23, 0, 0x88u, &v43, v34);
  id v26 = v43;

  if (v26) {
    int v27 = 0;
  }
  else {
    int v27 = v25;
  }
  if (v27 != 1)
  {

    id v22 = v26;
    goto LABEL_9;
  }
  uint64_t v28 = v46[5];

  if (v28
    || [v24 count]
    && (v33[0] = MEMORY[0x263EF8330],
        v33[1] = 3221225472,
        v33[2] = __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke_2,
        v33[3] = &unk_264BB31B8,
        v33[4] = self,
        v33[5] = &v45,
        [v24 enumerateKeysAndObjectsUsingBlock:v33],
        v46[5]))
  {
    id v22 = 0;
    goto LABEL_9;
  }
  id v22 = 0;
  if (a10) {
    *a10 = *((unsigned char *)v52 + 24);
  }
  BOOL v30 = 1;
LABEL_15:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v30;
}

uint64_t __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  unsigned int v50 = *(_DWORD *)(a1 + 76);
  int v6 = *(_DWORD *)(a1 + 80);
  int v7 = *(unsigned __int8 *)(a1 + 84);
  acl_t v8 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  id v11 = v8;
  unsigned __int8 v56 = 0;
  int v12 = *(_DWORD *)(a2 + 56);
  uint64_t v13 = *(const char **)(a2 + 16);
  v52 = v11;
  uint64_t v53 = v10;
  if (v12 != 1)
  {
    if (v12 == 2)
    {
      int v14 = 0;
      uint64_t v17 = 0xFFFFFFFFLL;
      uint64_t v23 = 493;
    }
    else
    {
      if (v12 == 5)
      {
        int v14 = 1;
        unsigned __int8 v56 = 1;
      }
      else
      {
        int v14 = 0;
      }
      uint64_t v17 = 0xFFFFFFFFLL;
      uint64_t v23 = 420;
    }
    goto LABEL_18;
  }
  ssize_t v15 = v11;
  uint64_t v16 = open(v13, 256);
  uint64_t v17 = v16;
  if ((v16 & 0x80000000) != 0)
  {
    int v32 = *__error();
    int v33 = (void *)*MEMORY[0x263F08438];
    uint64_t v34 = v32;
    strerror(v32);
    _CreateAndLogError((uint64_t)"_StageURLByMovingProcessItem", 705, v33, v34, 0, 0, @"Failed to open %s : %s", v35, (uint64_t)v13);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = v9;
    goto LABEL_27;
  }
  int v49 = *(_DWORD *)(a2 + 76);
  LODWORD(v55) = 0;
  id v18 = (const char *)ffsctl(v16, 0xC0044115uLL, &v55, 0);
  if (v18)
  {
    id v19 = v18;
    if (*__error() != 16)
    {
      int v20 = __error();
      uint64_t v21 = *v20;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v47 = strerror(*v20);
        v48 = v13;
        id v44 = v19;
        uint64_t v46 = v21;
        MOLogWrite();
      }
    }
    uint64_t v22 = gLogHandle;
    if (v49 == 1)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        id v44 = v13;
LABEL_40:
        MOLogWrite();
        goto LABEL_41;
      }
      goto LABEL_41;
    }
  }
  else
  {
    int v14 = 0;
    uint64_t v23 = 420;
    if (!v7 || v49 == 1)
    {
LABEL_18:
      if ((*(unsigned char *)(a2 + 48) & 0x20) != 0)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          HIDWORD(v44) = HIDWORD(v13);
          MOLogWrite();
        }
        uint64_t v24 = 32;
      }
      else
      {
        uint64_t v24 = 0;
      }
      id v55 = 0;
      uint64_t v25 = 1;
      BYTE4(v44) = 1;
      LODWORD(v44) = v6;
      id v26 = v9;
      char v27 = [v9 bulkSetPropertiesForPath:v13 withOpenFD:v17 UID:v5 GID:v50 mode:v23 flags:v24 dataProtectionClass:v44 removeACL:&v55];
      id v28 = v55;
      if (v27)
      {
        id v29 = 0;
        ssize_t v15 = v52;
        goto LABEL_28;
      }
      ssize_t v15 = v52;
LABEL_27:
      id v28 = v28;
      uint64_t v25 = 0;
      int v14 = v56;
      id v29 = v28;
LABEL_28:
      if ((v17 & 0x80000000) != 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    uint64_t v22 = gLogHandle;
    id v10 = v53;
  }
  if (!v22 || *(int *)(v22 + 44) >= 5)
  {
    id v44 = v13;
    goto LABEL_40;
  }
LABEL_41:
  id v36 = [NSURL fileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:v44 v46 v47 v48];
  id v55 = 0;
  id v37 = [v9 createTemporaryDirectoryInDirectoryURL:v10 error:&v55];
  id v38 = v55;
  unsigned int v39 = v38;
  if (!v37)
  {
    int v41 = v36;
    id v28 = v38;
    id v26 = v9;
    goto LABEL_45;
  }
  unsigned int v40 = [v36 lastPathComponent];
  id v54 = v39;
  LODWORD(v45) = v6;
  char v51 = [v9 _stageURLByCopying:v36 toItemName:v40 inStagingDir:v37 stagingMode:2 settingUID:v5 gid:v50 dataProtectionClass:v45 hasSymlink:&v56 error:&v54];
  int v41 = v36;
  id v28 = v54;

  id v26 = v9;
  if ((v51 & 1) == 0)
  {
LABEL_45:
    ssize_t v15 = v52;

    goto LABEL_27;
  }
  BOOL v42 = [v41 lastPathComponent];
  id v43 = [v37 URLByAppendingPathComponent:v42 isDirectory:0];

  ssize_t v15 = v52;
  [v52 setObject:v41 forKeyedSubscript:v43];

  id v29 = 0;
  int v14 = v56;
  uint64_t v25 = 1;
LABEL_29:
  close(v17);
LABEL_30:

  id v30 = v29;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v29);
  if (v14) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }

  return v25;
}

void __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  acl_t v8 = *(void **)(a1 + 32);
  id v21 = 0;
  id v9 = a2;
  LOBYTE(v8) = [v8 moveItemAtURL:v9 toURL:v7 error:&v21];
  id v10 = v21;
  if (v8)
  {
    id v11 = [v9 URLByDeletingLastPathComponent];

    id v12 = v11;
    uint64_t v13 = (const char *)[v12 fileSystemRepresentation];

    if (rmdir(v13))
    {
      int v14 = *__error();
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        strerror(v14);
        MOLogWrite();
      }
    }
  }
  else
  {
    ssize_t v15 = [v9 path];

    int v20 = [v7 path];
    uint64_t v17 = _CreateAndLogError((uint64_t)"-[MIFileManager stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlinks:hasSymlink:error:]_block_invoke_2", 810, @"MIInstallerErrorDomain", 4, v10, 0, @"Failed to move clone replaced file from %@ to %@", v16, (uint64_t)v15);
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *a4 = 1;
  }
}

- (BOOL)_stageURLByCopying:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 dataProtectionClass:(int)a9 hasSymlink:(BOOL *)a10 error:(id *)a11
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  uint64_t v49 = 0;
  unsigned int v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy_;
  uint64_t v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  id v20 = [v19 URLByAppendingPathComponent:v18 isDirectory:0];
  [v20 fileSystemRepresentation];
  unint64_t v21 = __strlcpy_chk();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = v21;
  if (v21 < 0x400)
  {
    uint64_t v25 = [v17 fileSystemRepresentation];
    id v37 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke;
    v32[3] = &unk_264BB31E0;
    v32[6] = v38;
    v32[7] = &v43;
    v32[8] = v39;
    v32[9] = &v49;
    v32[10] = v53;
    v32[4] = self;
    v32[5] = v41;
    int v33 = a6;
    unsigned int v34 = a7;
    unsigned int v35 = a8;
    int v36 = a9;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_2;
    v31[3] = &unk_264BB3208;
    v31[4] = v38;
    v31[5] = v53;
    int v26 = TraverseDirectoryWithPostTraversal(v25, 0, 8u, &v37, v32, v31);
    unint64_t v27 = (unint64_t)v37;
    uint64_t v24 = (void *)v27;
    if (v26 && !(v44[5] | v27))
    {
      uint64_t v24 = 0;
      *a10 = *((unsigned char *)v50 + 24);
      BOOL v29 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v22 = [v20 fileSystemRepresentation];
    uint64_t v24 = _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]", 912, @"MIInstallerErrorDomain", 4, 0, 0, @"Staging destination path was too long: %s (%zu)", v23, v22);
  }
  if (a11)
  {
    if (v24)
    {
      id v28 = v24;
      uint64_t v24 = v28;
    }
    else
    {
      id v28 = (id) v44[5];
      uint64_t v24 = 0;
    }
    BOOL v29 = 0;
    *a11 = v28;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_11:
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v29;
}

uint64_t __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v10 = *(const char **)(a2 + 32);
  if ((*(unsigned char *)(a2 + 48) & 0x20) != 0 && *(_DWORD *)(a2 + 56) == 1 && (*(_DWORD *)(a1 + 88) & 0xFFFFFFFE) == 2)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v91 = *(void *)(a2 + 16);
      MOLogWrite();
    }
    uint64_t v11 = 32;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v12 + 24))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    size_t v14 = strlen(v10);
    uint64_t v15 = *(void *)(v13 + 24);
    unint64_t v16 = v15 + 1 + v14;
    if (v16 <= 0x3FF)
    {
      uint64_t v17 = *(void *)(a1 + 80);
      *(unsigned char *)(v17 + v15) = 47;
      memcpy((void *)(v17 + v15 + 1), v10, v14);
      *(unsigned char *)(v17 + v16) = 0;
      *(void *)(v13 + 24) = v16;
    }
  }
  else
  {
    *(unsigned char *)(v12 + 24) = 1;
  }
  int v18 = *(_DWORD *)(a2 + 56);
  if (v18 == 1)
  {
    int v27 = *(_DWORD *)(a1 + 88);
    switch(v27)
    {
      case 1:
        if (copyfile(*(const char **)(a2 + 16), *(const char **)(a1 + 80), 0, 0xC0008u))
        {
          int v57 = *__error();
          v58 = (void *)*MEMORY[0x263F08438];
          uint64_t v59 = v57;
          uint64_t v60 = *(void *)(a2 + 16);
          strerror(v57);
          id v55 = _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 992, v58, v59, 0, 0, @"copyfile failed for %s to %s: %s", v61, v60);
          _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 992, @"MIInstallerErrorDomain", 4, v55, &unk_26E5A32F0, @"Failed to copyfile %s to %s", v62, *(void *)(a2 + 16));
          goto LABEL_43;
        }
        break;
      case 3:
        if (link(*(const char **)(a2 + 16), *(const char **)(a1 + 80)))
        {
          int v63 = *__error();
          v64 = (void *)*MEMORY[0x263F08438];
          uint64_t v65 = v63;
          uint64_t v66 = *(void *)(a2 + 16);
          strerror(v63);
          id v55 = _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1002, v64, v65, 0, 0, @"link failed for %s to %s: %s", v67, v66);
          _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1002, @"MIInstallerErrorDomain", 4, v55, &unk_26E5A3318, @"Failed to link %s to %s", v68, *(void *)(a2 + 16));
          goto LABEL_43;
        }
        break;
      case 2:
        id v28 = (uint64_t *)(a2 + 16);
        if (clonefile(*(const char **)(a2 + 16), *(const char **)(a1 + 80), 3u))
        {
          BOOL v29 = __error();
          uint64_t v30 = *v29;
          if (v30 != 18)
          {
            v87 = (void *)*MEMORY[0x263F08438];
            uint64_t v88 = *v28;
            strerror(*v29);
            uint64_t v25 = _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 981, v87, v30, 0, 0, @"clonefile failed for %s to %s: %s", v89, v88);
            _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 981, @"MIInstallerErrorDomain", 4, v25, &unk_26E5A32C8, @"Failed to clonefile %s to %s", v90, *v28);
            goto LABEL_35;
          }
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
              __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_cold_1((uint64_t *)(a2 + 16), (uint64_t *)(a1 + 80));
            }
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              uint64_t v91 = *v28;
              MOLogWrite();
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          }
          if (copyfile((const char *)*v28, *(const char **)(a1 + 80), 0, 0xC0008u))
          {
            int v31 = *__error();
            int v32 = (void *)*MEMORY[0x263F08438];
            uint64_t v33 = v31;
            uint64_t v34 = *v28;
            strerror(v31);
            uint64_t v25 = _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 977, v32, v33, 0, 0, @"copyfile after clonefile failed for %s to %s: %s", v35, v34);
            _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 977, @"MIInstallerErrorDomain", 4, v25, &unk_26E5A32A0, @"Failed to copyfile %s to %s", v36, *v28);
            goto LABEL_35;
          }
        }
        break;
      default:
        _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1009, @"MIInstallerErrorDomain", 4, 0, 0, @"Unexpected staging mode: %d", a8, *(unsigned int *)(a1 + 88));
        goto LABEL_37;
    }
LABEL_47:
    uint64_t v19 = 420;
    goto LABEL_48;
  }
  if (v18 == 5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    ssize_t v37 = readlink(*(const char **)(a2 + 16), v93, 0x400uLL);
    if (v37 != -1)
    {
      v93[v37] = 0;
      if (symlink(v93, *(const char **)(a1 + 80)))
      {
        int v38 = *__error();
        unsigned int v39 = (void *)*MEMORY[0x263F08438];
        uint64_t v40 = v38;
        uint64_t v41 = *(void *)(a1 + 80);
        strerror(v38);
        uint64_t v25 = _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1032, v39, v40, 0, 0, @"symlink failed for %s -> %s: %s", v42, v41);
        _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1032, @"MIInstallerErrorDomain", 4, v25, &unk_26E5A3368, @"Failed to symlink %s -> %s", v43, *(void *)(a1 + 80));
        goto LABEL_35;
      }
      goto LABEL_47;
    }
    int v50 = *__error();
    uint64_t v51 = (void *)*MEMORY[0x263F08438];
    uint64_t v52 = v50;
    uint64_t v53 = *(void *)(a2 + 16);
    strerror(v50);
    id v55 = _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1022, v51, v52, 0, 0, @"readlink failed for %s: %s", v54, v53);
    _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1022, @"MIInstallerErrorDomain", 4, v55, &unk_26E5A3340, @"Failed to readlink %s", v56, *(void *)(a2 + 16));
    uint64_t v69 = LABEL_43:;
    uint64_t v70 = *(void *)(*(void *)(a1 + 56) + 8);
    v71 = *(void **)(v70 + 40);
    *(void *)(v70 + 40) = v69;

    goto LABEL_44;
  }
  if (v18 != 2)
  {
    _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1038, @"MIInstallerErrorDomain", 3, 0, &unk_26E5A3390, @"Unknown filesystem object type %u encountered at %s", a8, *(unsigned int *)(a2 + 56));
    uint64_t v47 = LABEL_37:;
    uint64_t v48 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v49 = *(void **)(v48 + 40);
    *(void *)(v48 + 40) = v47;

    goto LABEL_44;
  }
  uint64_t v19 = 493;
  if (mkdir(*(const char **)(a1 + 80), 0x1EDu))
  {
    int v20 = *__error();
    unint64_t v21 = (void *)*MEMORY[0x263F08438];
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)(a1 + 80);
    strerror(v20);
    uint64_t v25 = _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 951, v21, v22, 0, 0, @"mkdir failed for %s: %s", v24, v23);
    _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 951, @"MIInstallerErrorDomain", 4, v25, &unk_26E5A3278, @"Failed to mkdir %s", v26, *(void *)(a1 + 80));
    uint64_t v44 = LABEL_35:;
    uint64_t v45 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;

LABEL_44:
    id v72 = 0;
LABEL_45:
    uint64_t v73 = 0;
    goto LABEL_46;
  }
LABEL_48:
  v75 = *(void **)(a1 + 32);
  uint64_t v76 = *(void *)(a1 + 80);
  uint64_t v77 = *(unsigned int *)(a1 + 92);
  uint64_t v78 = *(unsigned int *)(a1 + 96);
  uint64_t v79 = *(unsigned int *)(a1 + 100);
  id v92 = 0;
  LOBYTE(v91) = 1;
  char v80 = [v75 bulkSetPropertiesForPath:v76 UID:v77 GID:v78 mode:v19 flags:v11 dataProtectionClass:v79 removeACL:v91 error:&v92];
  id v81 = v92;
  id v72 = v92;
  if ((v80 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v81);
    goto LABEL_45;
  }
  if (*(_DWORD *)(a2 + 56) != 2)
  {
    uint64_t v82 = *(void *)(a1 + 80);
    uint64_t v83 = *(void *)(*(void *)(a1 + 48) + 8);
    unsigned __int16 v84 = *(_WORD *)(v83 + 24);
    if (v84)
    {
      do
        uint64_t v85 = --v84;
      while (*(unsigned char *)(v82 + v84) != 47 && v84 != 0);
    }
    else
    {
      uint64_t v85 = 0;
    }
    *(unsigned char *)(v82 + v85) = 0;
    *(void *)(v83 + 24) = v85;
  }
  uint64_t v73 = 1;
LABEL_46:

  return v73;
}

uint64_t __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned __int16 v3 = *(_WORD *)(v2 + 24);
  if (v3)
  {
    do
      uint64_t v4 = --v3;
    while (*(unsigned char *)(v1 + v3) != 47 && v3 != 0);
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(unsigned char *)(v1 + v4) = 0;
  *(void *)(v2 + 24) = v4;
  return 1;
}

- (BOOL)stageURL:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 hasSymlink:(BOOL *)a9 error:(id *)a10
{
  if (a6)
  {
    LODWORD(v11) = 4;
    return [(MIFileManager *)self _stageURLByCopying:a3 toItemName:a4 inStagingDir:a5 stagingMode:*(void *)&a6 settingUID:*(void *)&a7 gid:*(void *)&a8 dataProtectionClass:v11 hasSymlink:a9 error:a10];
  }
  else
  {
    LOBYTE(v11) = 1;
    return [(MIFileManager *)self stageURLByMoving:a3 toItemName:a4 inStagingDir:a5 settingUID:*(void *)&a7 gid:*(void *)&a8 dataProtectionClass:4 breakHardlinks:v11 hasSymlink:a9 error:a10];
  }
}

- (BOOL)standardizeOwnershipAtURL:(id)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5 removeACLs:(BOOL)a6 setProtectionClass:(BOOL)a7 foundSymlink:(BOOL *)a8 error:(id *)a9
{
  uint64_t v33 = 0;
  uint64_t v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  ssize_t v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  id v15 = a3;
  uint64_t v16 = [v15 fileSystemRepresentation];
  id v28 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __102__MIFileManager_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error___block_invoke;
  v23[3] = &unk_264BB3230;
  BOOL v26 = a7;
  v23[4] = self;
  v23[5] = &v29;
  unsigned int v24 = a4;
  unsigned int v25 = a5;
  BOOL v27 = a6;
  v23[6] = &v33;
  char v17 = TraverseDirectory(v16, 0, 8u, &v28, v23);
  id v18 = v28;
  id v19 = v28;
  int v20 = v34;
  if ((v17 & 1) == 0 && !v34[5])
  {
    objc_storeStrong(v34 + 5, v18);
    int v20 = v34;
  }
  id v21 = v20[5];
  if (v21) {
    char v17 = 0;
  }
  if (a9 && (v17 & 1) == 0) {
    *a9 = v21;
  }
  if (a8) {
    *a8 = *((unsigned char *)v30 + 24);
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

uint64_t __102__MIFileManager_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 56);
  if (v4 == 2) {
    uint64_t v5 = 493;
  }
  else {
    uint64_t v5 = 420;
  }
  if (v4 == 5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  if ((*(unsigned char *)(a2 + 48) & 0x20) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v17 = *(void *)(a2 + 16);
      MOLogWrite();
    }
    uint64_t v7 = 32;
  }
  else
  {
    uint64_t v7 = 0;
  }
  acl_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(unsigned int *)(a1 + 56);
  uint64_t v11 = *(unsigned int *)(a1 + 60);
  char v12 = *(unsigned char *)(a1 + 65);
  id v18 = 0;
  LOBYTE(v17) = v12;
  uint64_t v13 = [v8 bulkSetPropertiesForPath:v9 UID:v10 GID:v11 mode:v5 flags:v7 dataProtectionClass:v6 removeACL:v17 error:&v18];
  id v14 = v18;
  id v15 = v18;
  if ((v13 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v14);
  }

  return v13;
}

- (BOOL)validateSymlinksInURLDoNotEscapeURL:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  int v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  id v6 = a3;
  uint64_t v7 = [v6 fileSystemRepresentation];
  id v18 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__MIFileManager_validateSymlinksInURLDoNotEscapeURL_error___block_invoke;
  v15[3] = &unk_264BB3258;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  uint64_t v17 = &v19;
  char v9 = TraverseDirectory(v7, 0, 0, &v18, v15);
  id v10 = v18;
  id v11 = v18;
  char v12 = v20;
  if ((v9 & 1) == 0 && !v20[5])
  {
    objc_storeStrong(v20 + 5, v10);
    char v12 = v20;
  }
  id v13 = v12[5];
  if (v13) {
    char v9 = 0;
  }
  if (a4 && (v9 & 1) == 0) {
    *a4 = v13;
  }

  _Block_object_dispose(&v19, 8);
  return v9;
}

uint64_t __59__MIFileManager_validateSymlinksInURLDoNotEscapeURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 56) != 5) {
    return 1;
  }
  int v4 = [NSURL fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:0 relativeToURL:0];
  uint64_t v5 = [*(id *)(a1 + 32) realPathForURL:v4 ifChildOfURL:*(void *)(a1 + 40)];
  BOOL v6 = v5 != 0;

  if (!v5)
  {
    uint64_t v8 = _CreateAndLogError((uint64_t)"-[MIFileManager validateSymlinksInURLDoNotEscapeURL:error:]_block_invoke", 1161, @"MIInstallerErrorDomain", 70, 0, &unk_26E5A33B8, @"invalid symlink at %s", v7, *(void *)(a2 + 16));
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return v6;
}

- (id)enumerateURLsForItemsInDirectoryAtURL:(id)a3 ignoreSymlinks:(BOOL)a4 withBlock:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [a3 fileSystemRepresentation];
  id v18 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__MIFileManager_enumerateURLsForItemsInDirectoryAtURL_ignoreSymlinks_withBlock___block_invoke;
  v15[3] = &unk_264BB3280;
  BOOL v17 = a4;
  id v9 = v7;
  id v16 = v9;
  char v10 = TraverseDirectory(v8, 1, 0, &v18, v15);
  id v11 = v18;
  char v12 = v11;
  id v13 = 0;
  if ((v10 & 1) == 0) {
    id v13 = v11;
  }

  return v13;
}

uint64_t __80__MIFileManager_enumerateURLsForItemsInDirectoryAtURL_ignoreSymlinks_withBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v4 = *(_DWORD *)(a2 + 56);
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v5 = v4 == 5;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
      MOLogWrite();
    }
    return 1;
  }
  else
  {
    uint64_t v8 = [NSURL fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:v4 == 2 relativeToURL:0];
    *a3 = 0;
    unint64_t v9 = *(unsigned int *)(a2 + 56);
    if (v9 >= 8) {
      char v10 = 0;
    }
    else {
      char v10 = 0x10C0A0206040800uLL >> (8 * v9);
    }
    uint64_t v11 = (*(uint64_t (**)(void, void *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v8, v10 & 0xF);

    return v11;
  }
}

- (id)traverseDirectoryAtURL:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 fileSystemRepresentation];
  id v15 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__MIFileManager_traverseDirectoryAtURL_withBlock___block_invoke;
  v13[3] = &unk_264BB32A8;
  id v7 = v5;
  id v14 = v7;
  char v8 = TraverseDirectory(v6, 1, 0, &v15, v13);
  id v9 = v15;
  char v10 = v9;
  id v11 = 0;
  if ((v8 & 1) == 0) {
    id v11 = v9;
  }

  return v11;
}

uint64_t __50__MIFileManager_traverseDirectoryAtURL_withBlock___block_invoke(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = [NSURL fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:*(_DWORD *)(a2 + 56) == 2 relativeToURL:0];
  char v11 = 1;
  unint64_t v7 = *(unsigned int *)(a2 + 56);
  if (v7 >= 8) {
    char v8 = 0;
  }
  else {
    char v8 = 0x10C0A0206040800uLL >> (8 * v7);
  }
  uint64_t v9 = (*(uint64_t (**)(void, void *, void, char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6, v8 & 0xF, &v11);
  *a3 = v11;

  return v9;
}

- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  char v8 = objc_opt_new();
  uint64_t v25 = 0;
  BOOL v26 = (id *)&v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  id v9 = v7;
  uint64_t v10 = [v9 fileSystemRepresentation];
  id v24 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __69__MIFileManager_urlsForItemsInDirectoryAtURL_ignoringSymlinks_error___block_invoke;
  int v20 = &unk_264BB32D0;
  BOOL v23 = a4;
  uint64_t v22 = &v25;
  id v11 = v8;
  id v21 = v11;
  char v12 = TraverseDirectory(v10, 1, 0, &v24, &v17);
  id v13 = v24;
  id v14 = v24;
  if (!v26[5])
  {
    if (v12)
    {
      id v15 = [v11 copy:v17, v18, v19, v20];
      if (!a5) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
    objc_storeStrong(v26 + 5, v13);
  }
  id v15 = 0;
  if (!a5) {
    goto LABEL_9;
  }
LABEL_7:
  if (!v15) {
    *a5 = v26[5];
  }
LABEL_9:

  _Block_object_dispose(&v25, 8);

  return v15;
}

uint64_t __69__MIFileManager_urlsForItemsInDirectoryAtURL_ignoringSymlinks_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v4 = *(_DWORD *)(a2 + 56);
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v5 = v4 == 5;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
      MOLogWrite();
    }
    return 1;
  }
  else
  {
    id v9 = [NSURL fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:v4 == 2 relativeToURL:0];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      *a3 = 0;
      [*(id *)(a1 + 32) addObject:v9];
    }
    else
    {
      uint64_t v11 = _CreateAndLogError((uint64_t)"-[MIFileManager urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:]_block_invoke", 1265, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to create URL for %s", v8, *(void *)(a2 + 16));
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
  return v10;
}

- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (const char *)[v8 fileSystemRepresentation];
  id v10 = v7;
  int v11 = symlink(v9, (const char *)[v10 fileSystemRepresentation]);
  if (v11)
  {
    uint64_t v12 = (void *)*MEMORY[0x263F08438];
    uint64_t v13 = *__error();
    uint64_t v14 = [v8 fileSystemRepresentation];
    [v10 fileSystemRepresentation];
    id v15 = __error();
    strerror(*v15);
    _CreateError((uint64_t)"-[MIFileManager createSymbolicLinkAtURL:withDestinationURL:error:]", 1298, v12, v13, 0, 0, @"Could not create symlink containing %s at %s: %s", v16, v14);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v17 = v17;
      *a5 = v17;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v11 == 0;
}

- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ssize_t v6 = readlink((const char *)[v5 fileSystemRepresentation], v17, 0x400uLL);
  if (v6 < 0)
  {
    int v11 = (void *)*MEMORY[0x263F08438];
    uint64_t v12 = *__error();
    uint64_t v13 = [v5 fileSystemRepresentation];
    uint64_t v14 = __error();
    strerror(*v14);
    id v10 = _CreateError((uint64_t)"-[MIFileManager destinationOfSymbolicLinkAtURL:error:]", 1318, v11, v12, 0, 0, @"Could not readlink %s : %s", v15, v13);
    id v9 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v17[v6] = 0;
    id v7 = NSURL;
    id v8 = [NSString stringWithFileSystemRepresentation:v17 length:v6];
    id v9 = [v7 fileURLWithPath:v8];

    id v10 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v9) {
    *a4 = v10;
  }
LABEL_7:

  return v9;
}

- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4
{
  memset(&v13, 0, sizeof(v13));
  id v5 = a3;
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v13);
  if (v6)
  {
    id v7 = __error();
    uint64_t v8 = *v7;
    if (v8 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      strerror(*v7);
      MOLogWrite();
    }
    if (a4)
    {
      id v9 = (void *)*MEMORY[0x263F08438];
      uint64_t v10 = [v5 fileSystemRepresentation];
      strerror(v8);
      _CreateError((uint64_t)"-[MIFileManager itemExistsAtURL:error:]", 1345, v9, v8, 0, 0, @"lstat of %s failed: %s", v11, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6 == 0;
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return [(MIFileManager *)self itemExistsAtURL:a3 error:0];
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  memset(&v7, 0, sizeof(v7));
  id v3 = a3;
  if (!lstat((const char *)[v3 fileSystemRepresentation], &v7))
  {
LABEL_7:
    BOOL v4 = 0;
    goto LABEL_8;
  }
  if (*__error() != 2)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v5 = __error();
      strerror(*v5);
      MOLogWrite();
    }
    goto LABEL_7;
  }
  BOOL v4 = 1;
LABEL_8:

  return v4;
}

- (BOOL)itemDoesNotExistOrIsNotDirectoryAtURL:(id)a3
{
  id v13 = 0;
  BOOL v3 = [(MIFileManager *)self itemIsDirectoryAtURL:a3 error:&v13];
  id v4 = v13;
  id v5 = v4;
  if (v3)
  {
    BOOL v6 = 0;
  }
  else
  {
    stat v7 = [v4 domain];
    uint64_t v8 = *MEMORY[0x263F08438];
    if ([v7 isEqualToString:*MEMORY[0x263F08438]]) {
      BOOL v9 = [v5 code] == 2;
    }
    else {
      BOOL v9 = 0;
    }

    uint64_t v10 = [v5 domain];
    if ([v10 isEqualToString:v8]) {
      BOOL v11 = [v5 code] == 22;
    }
    else {
      BOOL v11 = 0;
    }

    BOOL v6 = v9 || v11;
  }

  return v6;
}

- (BOOL)_itemIsType:(unsigned __int16)a3 withDescription:(id)a4 atURL:(id)a5 error:(id *)a6
{
  int v8 = a3;
  id v9 = a4;
  memset(&v18, 0, sizeof(v18));
  uint64_t v10 = (const char *)[a5 fileSystemRepresentation];
  if (lstat(v10, &v18))
  {
    uint64_t v12 = __error();
    uint64_t v13 = *v12;
    if (v13 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      strerror(*v12);
      MOLogWrite();
    }
    if (a6)
    {
      uint64_t v14 = (void *)*MEMORY[0x263F08438];
      strerror(v13);
      _CreateError((uint64_t)"-[MIFileManager _itemIsType:withDescription:atURL:error:]", 1403, v14, v13, 0, 0, @"lstat of %s failed: %s", v15, (uint64_t)v10);
LABEL_12:
      BOOL v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ((v18.st_mode & 0xF000) != v8)
  {
    if (a6)
    {
      _CreateError((uint64_t)"-[MIFileManager _itemIsType:withDescription:atURL:error:]", 1393, (void *)*MEMORY[0x263F08438], 22, 0, 0, @"%s is not a %@ (mode 0%ho)", v11, (uint64_t)v10);
      goto LABEL_12;
    }
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (BOOL)itemIsFileAtURL:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self _itemIsType:0x8000 withDescription:@"regular file" atURL:a3 error:a4];
}

- (BOOL)itemIsSymlinkAtURL:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self _itemIsType:40960 withDescription:@"symlink" atURL:a3 error:a4];
}

- (BOOL)itemIsDirectoryAtURL:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self _itemIsType:0x4000 withDescription:@"directory" atURL:a3 error:a4];
}

- (BOOL)itemIsFIFOAtURL:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self _itemIsType:4096 withDescription:@"FIFO" atURL:a3 error:a4];
}

- (BOOL)itemIsSocketAtURL:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self _itemIsType:49152 withDescription:@"socket" atURL:a3 error:a4];
}

- (int)deviceForURLOrFirstAvailableParent:(id)a3 error:(id *)a4
{
  [a3 path];
  memset(&v17, 0, sizeof(v17));
  id v5 = objc_claimAutoreleasedReturnValue();
  BOOL v6 = (const char *)[v5 fileSystemRepresentation];
  if (lstat(v6, &v17))
  {
    int v9 = *__error();
    if (v9 == 2)
    {
      while (![v5 isEqualToString:@"/"])
      {
        uint64_t v11 = [v5 stringByDeletingLastPathComponent];

        memset(&v17, 0, sizeof(v17));
        id v5 = v11;
        BOOL v6 = (const char *)[v5 fileSystemRepresentation];
        if (!lstat(v6, &v17)) {
          goto LABEL_7;
        }
        int v9 = *__error();
        if (v9 != 2) {
          goto LABEL_6;
        }
      }
      _CreateError((uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]", 1460, (void *)*MEMORY[0x263F08438], 2, 0, 0, @"lstat for path \"/\" failed, which should never happen!", v10, v16);
    }
    else
    {
LABEL_6:
      _CreateError((uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]", 1467, (void *)*MEMORY[0x263F08438], v9, 0, 0, @"lstat failed for %s", v8, (uint64_t)v6);
    }
  }
  else
  {
LABEL_7:
    dev_t st_dev = v17.st_dev;
    if (v17.st_dev != -1)
    {
      id v13 = 0;
      goto LABEL_14;
    }
    _CreateError((uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]", 1452, (void *)*MEMORY[0x263F08438], 22, 0, 0, @"lstat succeeded but st_dev was -1 for %s", v7, (uint64_t)v6);
  uint64_t v14 = };
  id v13 = v14;
  if (a4)
  {
    id v13 = v14;
    *a4 = v13;
  }
  dev_t st_dev = -1;
LABEL_14:

  return st_dev;
}

- (id)upToFirstFourBytesFromURL:(id)a3 error:(id *)a4
{
  id v11 = 0;
  id v5 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v11];
  id v6 = v11;
  if (v5)
  {
    id v10 = 0;
    uint64_t v7 = [v5 readDataUpToLength:4 error:&v10];
    id v8 = v10;

    id v6 = v8;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v7) {
    *a4 = v6;
  }
LABEL_7:

  return v7;
}

- (id)aclTextFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  file = acl_get_file((const char *)[v5 fileSystemRepresentation], ACL_TYPE_EXTENDED);
  if (file)
  {
    uint64_t v7 = file;
    id v8 = acl_to_text(file, 0);
    if (v8)
    {
      int v9 = v8;
      id v10 = [NSString stringWithUTF8String:v8];
      acl_free(v7);
      acl_free(v9);
      id v11 = 0;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    int v16 = *__error();
    stat v17 = (void *)*MEMORY[0x263F08438];
    stat v18 = [v5 path];
    strerror(v16);
    id v11 = _CreateError((uint64_t)"-[MIFileManager aclTextFromURL:error:]", 1524, v17, v16, 0, 0, @"Could not read ACL text for file %@: %s", v19, (uint64_t)v18);

    acl_free(v7);
  }
  else
  {
    int v12 = *__error();
    id v13 = (void *)*MEMORY[0x263F08438];
    uint64_t v14 = [v5 path];
    strerror(v12);
    id v11 = _CreateError((uint64_t)"-[MIFileManager aclTextFromURL:error:]", 1518, v13, v12, 0, 0, @"Could not get ACL for file %@: %s", v15, (uint64_t)v14);
  }
  id v10 = 0;
  if (!a4) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v10) {
    *a4 = v11;
  }
LABEL_10:

  return v10;
}

- (id)extendedAttributesFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 256);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    ssize_t v8 = flistxattr(v6, 0, 0, 32);
    if (v8 < 0)
    {
      int v26 = *__error();
      uint64_t v27 = (void *)*MEMORY[0x263F08438];
      id v28 = [v5 path];
      strerror(v26);
      _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1598, v27, v26, 0, 0, @"Could not get the length for extended attribute list for %@: %s", v29, (uint64_t)v28);
    }
    else
    {
      size_t v9 = v8;
      if (v8)
      {
        id v10 = (char *)malloc_type_malloc(v8, 0x73E5BF5BuLL);
        if (v10)
        {
          id v11 = v10;
          ssize_t v12 = flistxattr(v7, v10, v9, 32);
          if (v12 < 0)
          {
            int v35 = *__error();
            uint64_t v36 = (void *)*MEMORY[0x263F08438];
            id v28 = [v5 path];
            strerror(v35);
            _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1615, v36, v35, 0, 0, @"Could not get extended attribute list for %@: %s", v37, (uint64_t)v28);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v13 = v12;
            if (v12)
            {
              id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              id v15 = 0;
              int v16 = v11;
              do
              {
                stat v17 = v15;
                id v38 = v15;
                stat v18 = _dataForEAKey(v16, v7, &v38);
                id v15 = v38;

                uint64_t v19 = [NSString stringWithUTF8String:v16];
                if (v18)
                {
                  [v14 setObject:v18 forKeyedSubscript:v19];
                }
                else
                {
                  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
                    MOLogWrite();
                  }

                  int v20 = [MEMORY[0x263EFF9D0] null];
                  [v14 setObject:v20 forKeyedSubscript:v19];

                  id v15 = 0;
                }
                size_t v21 = strlen(v16);
                v13 -= v21 + 1;
                v16 += v21 + 1;
              }
              while (v13 > 0);
              goto LABEL_22;
            }
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              id v14 = 0;
              id v15 = 0;
              goto LABEL_22;
            }
            id v28 = [v5 path];
            MOLogWrite();
            id v15 = 0;
          }
LABEL_21:

          id v14 = 0;
LABEL_22:
          close(v7);
          goto LABEL_23;
        }
        int v31 = *__error();
        char v32 = (void *)*MEMORY[0x263F08438];
        id v28 = [v5 path];
        strerror(v31);
        _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1608, v32, v31, 0, 0, @"Failed to malloc %zd bytes for extended attribute list for %@: %s", v33, v9);
      }
      else
      {
        id v28 = [v5 path];
        _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1601, @"MIInstallerErrorDomain", 140, 0, 0, @"No extended attributes found on %@", v30, (uint64_t)v28);
      }
    }
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    goto LABEL_21;
  }
  int v22 = *__error();
  BOOL v23 = (void *)*MEMORY[0x263F08438];
  id v24 = [v5 path];
  strerror(v22);
  _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1592, v23, v22, 0, 0, @"Failed to open %@: %s", v25, (uint64_t)v24);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v14 = 0;
  id v11 = 0;
LABEL_23:
  free(v11);
  if (a4 && !v14) {
    *a4 = v15;
  }

  return v14;
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 256);
  int v9 = v8;
  if (v8 < 0)
  {
    uint64_t v13 = (void *)*MEMORY[0x263F08438];
    uint64_t v14 = *__error();
    uint64_t v15 = [v7 fileSystemRepresentation];
    int v16 = __error();
    strerror(*v16);
    _CreateError((uint64_t)"-[MIFileManager dataProtectionClassOfItemAtURL:class:error:]", 1655, v13, v14, 0, 0, @"Failed to open %s : %s", v17, v15);
  }
  else
  {
    int v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0)
    {
      id v11 = 0;
      *a4 = v10;
      char v12 = 1;
LABEL_9:
      close(v9);
      BOOL v24 = v12;
      goto LABEL_10;
    }
    stat v18 = (void *)*MEMORY[0x263F08438];
    uint64_t v19 = *__error();
    uint64_t v20 = [v7 fileSystemRepresentation];
    size_t v21 = __error();
    strerror(*v21);
    _CreateError((uint64_t)"-[MIFileManager dataProtectionClassOfItemAtURL:class:error:]", 1661, v18, v19, 0, 0, @"Failed to getclass of file %s: %s", v22, v20);
  BOOL v23 = };
  id v11 = v23;
  if (a5) {
    *a5 = v23;
  }
  char v12 = 0;
  BOOL v24 = 0;
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_9;
  }
LABEL_10:

  return v24;
}

- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  int v10 = (unsigned int (**)(id, void))a5;
  id v11 = v9;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 256);
  int v13 = v12;
  if (v12 < 0)
  {
    uint64_t v19 = (void *)*MEMORY[0x263F08438];
    uint64_t v20 = *__error();
    uint64_t v21 = [v11 fileSystemRepresentation];
    uint64_t v22 = __error();
    uint64_t v33 = v21;
    strerror(*v22);
    BOOL v24 = @"Failed to open %s : %s";
    uint64_t v25 = 1686;
  }
  else
  {
    if (!v10)
    {
LABEL_5:
      if (fcntl(v13, 64, v8))
      {
        uint64_t v15 = (void *)*MEMORY[0x263F08438];
        uint64_t v16 = *__error();
        [v11 fileSystemRepresentation];
        uint64_t v17 = __error();
        strerror(*v17);
        _CreateError((uint64_t)"-[MIFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", 1703, v15, v16, 0, 0, @"Failed to setclass(%d) on file %s: %s", v18, v8);
        goto LABEL_11;
      }
LABEL_8:
      int v26 = 0;
      char v27 = 1;
LABEL_14:
      close(v13);
      BOOL v31 = v27;
      goto LABEL_15;
    }
    uint64_t v14 = fcntl(v12, 63);
    if ((v14 & 0x80000000) == 0)
    {
      if (!v10[2](v10, v14)) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }
    uint64_t v19 = (void *)*MEMORY[0x263F08438];
    uint64_t v20 = *__error();
    uint64_t v28 = [v11 fileSystemRepresentation];
    uint64_t v29 = __error();
    uint64_t v33 = v28;
    strerror(*v29);
    BOOL v24 = @"Failed to getclass of file %s: %s";
    uint64_t v25 = 1694;
  }
  _CreateError((uint64_t)"-[MIFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", v25, v19, v20, 0, 0, v24, v23, v33);
  uint64_t v30 = LABEL_11:;
  int v26 = v30;
  if (a6) {
    *a6 = v30;
  }
  char v27 = 0;
  BOOL v31 = 0;
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_14;
  }
LABEL_15:

  return v31;
}

- (BOOL)setOwnerOfURL:(id)a3 toUID:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  int v10 = lchown((const char *)[v9 fileSystemRepresentation], a4, a5);
  if (v10)
  {
    int v11 = *__error();
    int v12 = (void *)*MEMORY[0x263F08438];
    uint64_t v13 = [v9 fileSystemRepresentation];
    strerror(v11);
    _CreateError((uint64_t)"-[MIFileManager setOwnerOfURL:toUID:gid:error:]", 1726, v12, v11, 0, 0, @"Failed to lchown %s : %s", v14, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      id v15 = v15;
      *a6 = v15;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v10 == 0;
}

- (BOOL)setPermissionsForURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = lchmod((const char *)[v7 fileSystemRepresentation], a4);
  if (v8)
  {
    int v9 = *__error();
    int v10 = (void *)*MEMORY[0x263F08438];
    uint64_t v11 = [v7 fileSystemRepresentation];
    strerror(v9);
    _CreateError((uint64_t)"-[MIFileManager setPermissionsForURL:toMode:error:]", 1745, v10, v9, 0, 0, @"Failed to lchmod %s : %s", v12, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v13 = v13;
      *a5 = v13;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v8 == 0;
}

- (BOOL)captureStoreDataFromDirectory:(id)a3 toDirectory:(id)a4 doCopy:(BOOL)a5 failureIsFatal:(BOOL)a6 includeiTunesMetadata:(BOOL)a7 withError:(id *)a8
{
  BOOL v35 = a5;
  v49[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v36 = a4;
  v49[0] = @"Manifest.plist";
  v49[1] = @"iTunesArtwork";
  v49[2] = @"iTunesMetadata.plist";
  v49[3] = @"GeoJSON";
  v49[4] = @"com.apple.mobileinstallation.companion_placeholder";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:5];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v30 = a8;
    uint64_t v14 = 0;
    id v15 = 0;
    uint64_t v16 = *(void *)v41;
    id v31 = v10;
    id obj = v11;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v41 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * v17);
      if (!a7
        && ([*(id *)(*((void *)&v40 + 1) + 8 * v17) isEqualToString:@"iTunesMetadata.plist"] & 1) != 0)
      {
        goto LABEL_15;
      }
      uint64_t v19 = [v36 URLByAppendingPathComponent:v18 isDirectory:0];
      uint64_t v20 = [v10 URLByAppendingPathComponent:v18 isDirectory:0];
      if (v35)
      {
        id v39 = v15;
        BOOL v21 = [(MIFileManager *)self copyItemIfExistsAtURL:v20 toURL:v19 error:&v39];
        id v22 = v39;

        if (!v21)
        {
          uint64_t v46 = @"LegacyErrorString";
          uint64_t v23 = [&unk_26E5A3408 objectAtIndexedSubscript:v14];
          uint64_t v47 = v23;
          BOOL v24 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          _CreateAndLogError((uint64_t)"-[MIFileManager captureStoreDataFromDirectory:toDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 1778, @"MIInstallerErrorDomain", 24, v22, v24, @"Failed to copy %@ to %@", v25, (uint64_t)v20);
          goto LABEL_13;
        }
      }
      else
      {
        id v38 = v15;
        BOOL v26 = [(MIFileManager *)self moveItemIfExistsAtURL:v20 toURL:v19 error:&v38];
        id v22 = v38;

        if (!v26)
        {
          uint64_t v44 = @"LegacyErrorString";
          uint64_t v23 = [&unk_26E5A3408 objectAtIndexedSubscript:v14];
          uint64_t v45 = v23;
          BOOL v24 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          _CreateAndLogError((uint64_t)"-[MIFileManager captureStoreDataFromDirectory:toDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 1786, @"MIInstallerErrorDomain", 24, v22, v24, @"Failed to move %@ to %@", v27, (uint64_t)v20);
LABEL_13:
          id v15 = (id)objc_claimAutoreleasedReturnValue();

          id v10 = v31;
          id v22 = v15;
          if (a6)
          {

            id v11 = obj;
            if (v30)
            {
              id v15 = v15;
              BOOL v28 = 0;
              id *v30 = v15;
            }
            else
            {
              BOOL v28 = 0;
            }
            goto LABEL_23;
          }
        }
      }
      ++v14;

      id v15 = v22;
LABEL_15:
      if (v13 == ++v17)
      {
        id v11 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_21;
      }
    }
  }
  id v15 = 0;
LABEL_21:

  BOOL v28 = 1;
LABEL_23:

  return v28;
}

- (id)_realPathWhatExistsInPath:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v17 = a4;
  id v5 = [a3 pathComponents];
  uint64_t v6 = [v5 count];
  uint64_t v7 = v6 - 1;
  if (v6 == 1)
  {
    id v10 = 0;
  }
  else
  {
    do
    {
      int v8 = [v5 subarrayWithRange:0, v7 + 1];
      int v9 = [NSURL fileURLWithPathComponents:v8];
      id v10 = 0;
      if ([(MIFileManager *)self itemExistsAtURL:v9])
      {
        id v11 = [(MIFileManager *)self realPathForURL:v9 allowNonExistentPathComponents:0 isDirectory:v17 error:0];
        if (v11)
        {
          uint64_t v12 = [v5 subarrayWithRange:v7 + 1, [v5 count] - (v7 + 1)];
          uint64_t v13 = [NSString pathWithComponents:v12];
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            [v11 path];
            id v15 = v16 = v13;
            MOLogWrite();
          }
          id v10 = [v11 URLByAppendingPathComponent:v13 isDirectory:v17];
        }
        else
        {
          id v10 = 0;
        }
      }
      if (v10) {
        break;
      }
      --v7;
    }
    while (v7);
  }

  return v10;
}

- (id)realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4 isDirectory:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  bzero(v22, 0x400uLL);
  id v11 = [a3 path];
  if (realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], v22))
  {
    uint64_t v12 = [NSURL fileURLWithFileSystemRepresentation:v22 isDirectory:v7 relativeToURL:0];
LABEL_11:
    uint64_t v20 = (void *)v12;
    goto LABEL_12;
  }
  uint64_t v13 = *__error();
  if (v13 == 2 && v8)
  {
    uint64_t v12 = [(MIFileManager *)self _realPathWhatExistsInPath:v11 isDirectory:v7];
    goto LABEL_11;
  }
  id v15 = (void *)*MEMORY[0x263F08438];
  uint64_t v16 = [v11 fileSystemRepresentation];
  strerror(v13);
  uint64_t v18 = _CreateAndLogError((uint64_t)"-[MIFileManager realPathForURL:allowNonExistentPathComponents:isDirectory:error:]", 1845, v15, v13, 0, 0, @"Failed to realpath %s : %s at %s", v17, v16);
  uint64_t v19 = v18;
  if (a6) {
    *a6 = v18;
  }

  uint64_t v20 = 0;
LABEL_12:

  return v20;
}

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  return [(MIFileManager *)self realPathForURL:a3 allowNonExistentPathComponents:a4 isDirectory:0 error:0];
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v18 = a5;
    [v7 pathComponents];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      signed int v13 = a4;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v15 isEqualToString:@".."])
          {
            --v13;
          }
          else if (([v15 isEqualToString:&stru_26E5A2168] & 1) == 0 {
                 && ([v15 isEqualToString:@"."] & 1) == 0)
          }
          {
            v13 += [v15 isEqualToString:@"/"] ^ 1;
          }
          if (v13 < (int)a4)
          {

            goto LABEL_18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      signed int v13 = a4;
    }

    if (v18) {
      unsigned int *v18 = v13;
    }
    BOOL v16 = 1;
  }
  else
  {
    id v9 = 0;
LABEL_18:
    BOOL v16 = 0;
  }

  return v16;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  bzero(v75, 0x400uLL);
  if (!v6 || !v7)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_38;
    }
    goto LABEL_14;
  }
  BOOL v8 = [v7 path];
  int v9 = [v8 hasPrefix:@"/private/"];

  if (v9)
  {
    uint64_t v10 = NSURL;
    uint64_t v11 = [v7 path];
    uint64_t v12 = [v11 substringFromIndex:objc_msgSend(@"/private", "length")];
    uint64_t v13 = [v10 fileURLWithPath:v12];

    id v7 = (id)v13;
  }
  uint64_t v14 = [v6 path];
  int v15 = [v14 hasPrefix:@"/private/"];

  if (v15)
  {
    BOOL v16 = NSURL;
    uint64_t v17 = [v6 path];
    uint64_t v18 = [v17 substringFromIndex:[@"/private" length]];
    uint64_t v19 = [v16 fileURLWithPath:v18];

    id v6 = (id)v19;
  }
  long long v20 = [v6 path];
  long long v21 = [v7 path];
  char v22 = [v20 hasPrefix:v21];

  if ((v22 & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_38;
    }
    uint64_t v25 = [v6 path];
    uint64_t v62 = [v7 path];
    MOLogWrite();

    goto LABEL_37;
  }
  uint64_t v23 = [v6 pathComponents];
  int v24 = [v23 containsObject:@".."];

  if (v24)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_38;
    }
    goto LABEL_11;
  }
  id v6 = v6;
  ssize_t v26 = readlink((const char *)[v6 fileSystemRepresentation], v75, 0x400uLL);
  if (v26 == -1)
  {
    if (*__error() == 22 || *__error() == 2)
    {
      uint64_t v27 = [v6 path];
      BOOL v28 = 0;
      goto LABEL_28;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_38;
    }
    long long v43 = __error();
    strerror(*v43);
LABEL_14:
    MOLogWrite();
LABEL_38:
    id v39 = 0;
    id v38 = 0;
    id v36 = 0;
    uint64_t v27 = 0;
    BOOL v28 = 0;
    goto LABEL_39;
  }
  if (v75[0] == 47)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_38;
    }
LABEL_11:
    uint64_t v25 = [v6 path];
LABEL_36:
    MOLogWrite();
LABEL_37:

    goto LABEL_38;
  }
  unsigned int v74 = 0;
  uint64_t v29 = [v7 path];
  BOOL v30 = [(MIFileManager *)self _validateSymlink:v29 withStartingDepth:0 andEndingDepth:&v74];

  if (!v30)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_38;
    }
    uint64_t v25 = [v7 path];
    goto LABEL_36;
  }
  id v31 = [v6 path];
  char v32 = [v7 path];
  uint64_t v33 = [v31 substringFromIndex:[v32 length]];

  BOOL v28 = [v33 stringByDeletingLastPathComponent];

  uint64_t v34 = [NSString stringWithFileSystemRepresentation:v75 length:v26];
  uint64_t v27 = [v28 stringByAppendingPathComponent:v34];

  if (![(MIFileManager *)self _validateSymlink:v27 withStartingDepth:v74 andEndingDepth:0])
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_56;
    }
    long long v42 = [v6 path];
    int v63 = [v7 path];
    MOLogWrite();

    goto LABEL_55;
  }
LABEL_28:
  uint64_t v35 = [(MIFileManager *)self _realPathForURL:v7 allowNonExistentPathComponents:0];
  if (!v35)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_56;
    }
    long long v42 = [v7 path];
    MOLogWrite();
LABEL_55:

LABEL_56:
    id v39 = 0;
    id v38 = 0;
    id v36 = 0;
    goto LABEL_39;
  }
  id v36 = (void *)v35;
  uint64_t v37 = [(MIFileManager *)self _realPathForURL:v6 allowNonExistentPathComponents:1];
  if (v37)
  {
    id v38 = v37;
    if (!_CheckRealpathHasBasePrefix(v37, v36))
    {
LABEL_73:
      id v39 = 0;
      goto LABEL_39;
    }
    if (v26 != -1)
    {
LABEL_32:
      id v39 = v38;
      id v38 = v39;
      goto LABEL_39;
    }
    uint64_t v44 = [v38 pathComponents];
    id v72 = [v36 pathComponents];
    unint64_t v45 = [v72 count];
    uint64_t v73 = v44;
    unint64_t v46 = [v44 count];
    if (v46 < 2 || v45 <= 1)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_72;
      }
    }
    else
    {
      unint64_t v47 = v46;
      unint64_t v48 = 1;
      uint64_t v49 = [v72 objectAtIndexedSubscript:1];
      if ([v49 isEqualToString:@"private"]) {
        unint64_t v48 = 2;
      }

      [v73 objectAtIndexedSubscript:1];
      int v50 = v67 = v45;
      if ([v50 isEqualToString:@"private"]) {
        uint64_t v51 = 2;
      }
      else {
        uint64_t v51 = 1;
      }

      if (v67 - v48 <= v47 - v51)
      {
        if (v67 <= v48)
        {
LABEL_77:

          goto LABEL_32;
        }
        while (1)
        {
          int v57 = [v72 objectAtIndexedSubscript:v48];
          v58 = [v73 objectAtIndexedSubscript:v51];
          char v71 = [v57 isEqualToString:v58];

          if ((v71 & 1) == 0) {
            break;
          }
          ++v48;
          ++v51;
          if (v67 == v48) {
            goto LABEL_77;
          }
        }
        uint64_t v69 = v51;
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
          goto LABEL_72;
        }
        uint64_t v59 = [v6 path];
        uint64_t v66 = [v7 path];
        uint64_t v70 = [v38 path];
        uint64_t v60 = [v36 path];
        uint64_t v65 = [v72 objectAtIndexedSubscript:v48];
        v64 = [v73 objectAtIndexedSubscript:v69];
        uint64_t v68 = (void *)v60;
        uint64_t v56 = (void *)v59;
        MOLogWrite();

        id v55 = (void *)v66;
        goto LABEL_71;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_72;
      }
    }
    uint64_t v52 = [v6 path];
    uint64_t v53 = [v7 path];
    uint64_t v54 = [v38 path];
    uint64_t v68 = [v36 path];
    uint64_t v70 = (void *)v54;
    id v55 = (void *)v53;
    uint64_t v56 = (void *)v52;
    MOLogWrite();
LABEL_71:

LABEL_72:
    goto LABEL_73;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    uint64_t v61 = [v6 path];
    MOLogWrite();
  }
  id v39 = 0;
  id v38 = 0;
LABEL_39:
  id v40 = v39;

  return v40;
}

- (BOOL)markBundleAsPlaceholder:(id)a3 withError:(id *)a4
{
  int value = 1;
  id v5 = (const char *)[a3 fileSystemRepresentation];
  int v6 = setxattr(v5, "com.apple.installd.placeholder", &value, 4uLL, 0, 1);
  if (v6)
  {
    id v7 = __error();
    int v8 = *v7;
    uint64_t v10 = _CreateError((uint64_t)"-[MIFileManager markBundleAsPlaceholder:withError:]", 2101, (void *)*MEMORY[0x263F08438], *v7, 0, 0, @"setxattr for %s on %s failed", v9, (uint64_t)"com.apple.installd.placeholder");
    strerror(v8);
    _CreateAndLogError((uint64_t)"-[MIFileManager markBundleAsPlaceholder:withError:]", 2101, @"MIInstallerErrorDomain", 4, v10, 0, @"Could't set placeholder EA on \"%s\": %s", v11, (uint64_t)v5);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v12 = v12;
      *a4 = v12;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v6 == 0;
}

- (BOOL)bundleAtURLIsPlaceholder:(id)a3
{
  int value = 0;
  return getxattr((const char *)[a3 fileSystemRepresentation], "com.apple.installd.placeholder", &value, 4uLL, 0, 1) == 4;
}

- (BOOL)clearPlaceholderStatusForBundle:(id)a3 withError:(id *)a4
{
  id v5 = (const char *)[a3 fileSystemRepresentation];
  int v6 = removexattr(v5, "com.apple.installd.placeholder", 1);
  if (v6)
  {
    id v7 = __error();
    uint64_t v9 = _CreateError((uint64_t)"-[MIFileManager clearPlaceholderStatusForBundle:withError:]", 2125, (void *)*MEMORY[0x263F08438], *v7, 0, 0, @"removexattr on %s for %s failed", v8, (uint64_t)v5);
    uint64_t v11 = _CreateAndLogError((uint64_t)"-[MIFileManager clearPlaceholderStatusForBundle:withError:]", 2125, @"MIInstallerErrorDomain", 4, v9, 0, @"Could't remove placeholder EA on \"%s\"", v10, (uint64_t)v5);

    if (a4) {
      *a4 = v11;
    }
  }
  return v6 == 0;
}

- (BOOL)_markEAFlag:(const char *)a3 forAppIdentifier:(id)a4 insecurelyCachedOnBundle:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  int value = 1;
  if (!v9 || ![v9 length])
  {
    uint64_t v20 = [v10 fileSystemRepresentation];
    uint64_t v18 = _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2141, @"MIInstallerErrorDomain", 4, 0, 0, @"Attempted to set a zero-length or nil app identifier on \"%s\"", v21, v20);
    goto LABEL_10;
  }
  id v11 = v10;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 256);
  if (v12 < 0)
  {
    uint64_t v23 = __error();
    int v24 = *v23;
    uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v23 userInfo:0];
    uint64_t v26 = [v11 fileSystemRepresentation];
    strerror(v24);
    uint64_t v18 = _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2148, @"MIInstallerErrorDomain", 4, v25, 0, @"Couldn't open bundle \"%s\" for setting extended attributes: %s", v27, v26);

LABEL_10:
    BOOL v19 = 0;
    if (!a6) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  int v13 = v12;
  if (fsetxattr(v12, a3, &value, 4uLL, 0, 0))
  {
    uint64_t v14 = __error();
    int v15 = *v14;
    BOOL v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v14 userInfo:0];
    [v11 fileSystemRepresentation];
    strerror(v15);
    uint64_t v18 = _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2154, @"MIInstallerErrorDomain", 4, v16, 0, @"Couldn't set %s EA on \"%s\": %s", v17, (uint64_t)a3);

LABEL_6:
    BOOL v19 = 0;
    goto LABEL_7;
  }
  BOOL v28 = (const char *)[v9 UTF8String];
  size_t v29 = strlen(v28);
  if (fsetxattr(v13, "com.apple.installd.appIdentifier", v28, v29, 0, 0))
  {
    BOOL v30 = __error();
    int v31 = *v30;
    char v32 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v30 userInfo:0];
    id v33 = v11;
    uint64_t v34 = [v33 fileSystemRepresentation];
    strerror(v31);
    uint64_t v18 = _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2163, @"MIInstallerErrorDomain", 4, v32, 0, @"Couldn't set app identifier EA on \"%s\": %s", v35, v34);

    if (fremovexattr(v13, a3, 1) < 0)
    {
      int v36 = *__error();
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        [v33 fileSystemRepresentation];
        strerror(v36);
        MOLogWrite();
      }
    }
    goto LABEL_6;
  }
  uint64_t v18 = 0;
  BOOL v19 = 1;
LABEL_7:
  close(v13);
  if (!a6) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v19) {
    *a6 = v18;
  }
LABEL_13:

  return v19;
}

- (id)_insecureCachedAppIdentifierIfMarkedWithEAFlag:(const char *)a3 bundleURL:(id)a4 allowPlaceholders:(BOOL)a5 error:(id *)a6
{
  int value = 0;
  id v9 = a4;
  int v10 = open((const char *)[v9 fileSystemRepresentation], 256);
  if (v10 < 0)
  {
    BOOL v16 = __error();
    int v17 = *v16;
    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v16 userInfo:0];
    uint64_t v19 = [v9 fileSystemRepresentation];
    strerror(v17);
    _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2194, @"MIInstallerErrorDomain", 4, v18, 0, @"Couldn't open bundle \"%s\" for setting extended attributes: %s", v20, v19);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v21 = 0;
    char v22 = 0;
    if (!a6) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  int v11 = v10;
  if (fgetxattr(v10, a3, &value, 4uLL, 0, 0) != 4)
  {
    uint64_t v23 = *__error();
    if (v23 == 93)
    {
      int v24 = (void *)*MEMORY[0x263F08438];
      uint64_t v35 = [v9 path];
      _CreateError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2202, v24, 93, 0, 0, @"Attr named %s not present on %@", v25, (uint64_t)a3);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v23 userInfo:0];
      [v9 fileSystemRepresentation];
      strerror(v23);
      _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2204, @"MIInstallerErrorDomain", 4, v27, 0, @"Couldn't get %s EA from \"%s\": %s", v28, (uint64_t)a3);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  if (value != 1)
  {
    [v9 fileSystemRepresentation];
    _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2208, @"MIInstallerErrorDomain", 141, 0, 0, @"%s EA was not set to expected value from \"%s\"", v26, (uint64_t)a3);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!a5)
  {
    int v37 = 0;
    if (fgetxattr(v11, "com.apple.installd.placeholder", &v37, 4uLL, 0, 0) == 4)
    {
      int v12 = (void *)*MEMORY[0x263F08438];
      int v13 = [v9 path];
      _CreateError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2217, v12, 93, 0, 0, @"Not allowed to mark placeholder as validatedByFreeProfile for %@", v14, (uint64_t)v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
      char v22 = 0;
      uint64_t v21 = 0;
      goto LABEL_14;
    }
  }
  id v36 = 0;
  uint64_t v21 = _dataForEAKey("com.apple.installd.appIdentifier", v11, &v36);
  id v15 = v36;
  if (v21)
  {
    uint64_t v30 = [[NSString alloc] initWithData:v21 encoding:4];
    if (v30)
    {
      char v22 = (void *)v30;
      goto LABEL_14;
    }
    [v9 fileSystemRepresentation];
    uint64_t v33 = _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2230, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to convert app identifier EA data (%@) to string from \"%s\"", v34, (uint64_t)v21);

    char v22 = 0;
  }
  else
  {
    uint64_t v31 = [v9 fileSystemRepresentation];
    uint64_t v33 = _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2224, @"MIInstallerErrorDomain", 4, v15, 0, @"Couldn't get appIdentifier EA from \"%s\"", v32, v31);

    char v22 = 0;
    uint64_t v21 = 0;
  }
  id v15 = (id)v33;
LABEL_14:
  close(v11);
  if (!a6) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v22) {
    *a6 = v15;
  }
LABEL_17:

  return v22;
}

- (BOOL)setAppClipAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5
{
  return [(MIFileManager *)self _markEAFlag:"com.apple.installd.appclip" forAppIdentifier:a3 insecurelyCachedOnBundle:a4 error:a5];
}

- (id)insecureCachedAppIdentifierIfAppClipForBundle:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self _insecureCachedAppIdentifierIfMarkedWithEAFlag:"com.apple.installd.appclip" bundleURL:a3 allowPlaceholders:1 error:a4];
}

- (BOOL)setValidatedByFreeProfileAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5
{
  return [(MIFileManager *)self _markEAFlag:"com.apple.installd.validatedByFreeProfile" forAppIdentifier:a3 insecurelyCachedOnBundle:a4 error:a5];
}

- (id)insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:(id)a3 error:(id *)a4
{
  return [(MIFileManager *)self _insecureCachedAppIdentifierIfMarkedWithEAFlag:"com.apple.installd.validatedByFreeProfile" bundleURL:a3 allowPlaceholders:0 error:a4];
}

- (BOOL)setInstallType:(id)a3 inExtendedAttributeOnBundle:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t value = [a3 unsignedLongLongValue];
  id v8 = v7;
  int v9 = setxattr((const char *)[v8 fileSystemRepresentation], "com.apple.installd.installType", &value, 8uLL, 0, 1);
  if (v9)
  {
    int v10 = __error();
    int v11 = *v10;
    int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v10 userInfo:0];
    uint64_t v13 = [v8 fileSystemRepresentation];
    strerror(v11);
    _CreateAndLogError((uint64_t)"-[MIFileManager setInstallType:inExtendedAttributeOnBundle:error:]", 2277, @"MIInstallerErrorDomain", 4, v12, 0, @"Couldn't set installType EA on \"%s\": %s", v14, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v15 = v15;
      *a5 = v15;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v9 == 0;
}

- (id)installTypeFromExtendedAttributeOnBundle:(id)a3 error:(id *)a4
{
  uint64_t value = 0;
  id v5 = a3;
  ssize_t v6 = getxattr((const char *)[v5 fileSystemRepresentation], "com.apple.installd.installType", &value, 8uLL, 0, 1);
  if (v6 < 0)
  {
    uint64_t v9 = *__error();
    if (v9 == 93)
    {
      int v10 = [v5 path];
      id v8 = _CreateAndLogError((uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]", 2294, @"MIInstallerErrorDomain", 158, 0, 0, @"Install type extended attribute not found on %@", v11, (uint64_t)v10);
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v9 userInfo:0];
      uint64_t v15 = [v5 fileSystemRepresentation];
      strerror(v9);
      id v8 = _CreateAndLogError((uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]", 2296, @"MIInstallerErrorDomain", 4, v14, 0, @"Couldn't get installType EA from \"%s\": %s", v16, v15);
    }
  }
  else
  {
    if (v6 == 8)
    {
      id v7 = [NSNumber numberWithUnsignedLongLong:value];
      id v8 = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    uint64_t v12 = [v5 fileSystemRepresentation];
    id v8 = _CreateAndLogError((uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]", 2302, @"MIInstallerErrorDomain", 4, 0, 0, @"getxattr for installType EA on %s returned %zd (expected %zu)", v13, v12);
  }
  id v7 = 0;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v7) {
    *a4 = v8;
  }
LABEL_12:

  return v7;
}

- (BOOL)_setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (const char *)[v11 fileSystemRepresentation];
  id v15 = v12;
  uint64_t v16 = (const char *)[v15 UTF8String];

  id v17 = v13;
  uint64_t v18 = (const void *)[v17 bytes];
  size_t v19 = [v17 length];

  if (!v17)
  {
    _CreateAndLogError((uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]", 2324, @"MIInstallerErrorDomain", 4, 0, 0, @"Attempted to set nil data on \"%s\" for EA named %s", v20, (uint64_t)v14);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if (a7) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v27 = 0;
    goto LABEL_10;
  }
  if ((a6 & 0x80000000) == 0)
  {
    if (fsetxattr(a6, v16, v18, v19, 0, 0)) {
      goto LABEL_4;
    }
LABEL_9:
    id v26 = 0;
    BOOL v27 = 1;
    goto LABEL_10;
  }
  if (!setxattr(v14, v16, v18, v19, 0, 1)) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v21 = __error();
  int v22 = *v21;
  int v24 = _CreateError((uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]", 2337, (void *)*MEMORY[0x263F08438], *v21, 0, 0, @"[f]setxattr failed for path %s fd %d", v23, (uint64_t)v14);
  strerror(v22);
  _CreateAndLogError((uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]", 2337, @"MIInstallerErrorDomain", 4, v24, 0, @"Failed to set EA named %s on \"%s\": %s", v25, (uint64_t)v16);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  if (!a7) {
    goto LABEL_7;
  }
LABEL_5:
  id v26 = v26;
  BOOL v27 = 0;
  *a7 = v26;
LABEL_10:

  return v27;
}

- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 error:(id *)a6
{
  return [(MIFileManager *)self _setData:a3 forExtendedAttributeNamed:a4 onURL:a5 orFD:0xFFFFFFFFLL error:a6];
}

- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onFD:(int)a5 fdLocation:(id)a6 error:(id *)a7
{
  return [(MIFileManager *)self _setData:a3 forExtendedAttributeNamed:a4 onURL:a6 orFD:*(void *)&a5 error:a7];
}

- (id)_dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7
{
  id v11 = (void *)MEMORY[0x263EFF990];
  id v12 = a5;
  id v13 = a3;
  id v14 = [v11 dataWithLength:a4];
  id v15 = (void *)[v14 mutableBytes];
  id v16 = v13;
  id v17 = (const char *)[v16 UTF8String];

  id v18 = v12;
  size_t v19 = (const char *)[v18 fileSystemRepresentation];

  if (a6 < 0)
  {
    ssize_t v20 = getxattr(v19, v17, v15, a4, 0, 1);
    if ((v20 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    ssize_t v20 = fgetxattr(a6, v17, v15, a4, 0, 0);
    if ((v20 & 0x8000000000000000) == 0)
    {
LABEL_3:
      if (v20 == a4)
      {
        int v22 = (void *)[v14 copy];
        uint64_t v23 = 0;
        if (!a7) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }
      uint64_t v26 = _CreateAndLogError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2389, @"MIInstallerErrorDomain", 4, 0, 0, @"getxattr for EA named %s on \"%s\" returned %zd (expected %zu)", v21, (uint64_t)v17);
      goto LABEL_10;
    }
  }
  uint64_t v25 = *__error();
  if (v25 == 93)
  {
    uint64_t v26 = _CreateError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2382, (void *)*MEMORY[0x263F08438], 93, 0, 0, @"Attr named %s not present on \"%s\"", v24, (uint64_t)v17);
LABEL_10:
    uint64_t v23 = (void *)v26;
    goto LABEL_12;
  }
  BOOL v27 = _CreateError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2385, (void *)*MEMORY[0x263F08438], v25, 0, 0, @"[f]getxattr failed for path %s fd %d", v24, (uint64_t)v19);
  strerror(v25);
  uint64_t v23 = _CreateAndLogError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2385, @"MIInstallerErrorDomain", 4, v27, 0, @"Couldn't get data from EA named %s on \"%s\": %s", v28, (uint64_t)v17);

LABEL_12:
  int v22 = 0;
  if (!a7) {
    goto LABEL_15;
  }
LABEL_13:
  if (!v22) {
    *a7 = v23;
  }
LABEL_15:

  return v22;
}

- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromURL:(id)a5 error:(id *)a6
{
  return [(MIFileManager *)self _dataForExtendedAttributeNamed:a3 length:a4 onURL:a5 orFD:0xFFFFFFFFLL error:a6];
}

- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromFD:(int)a5 fdLocation:(id)a6 error:(id *)a7
{
  return [(MIFileManager *)self _dataForExtendedAttributeNamed:a3 length:a4 onURL:a6 orFD:*(void *)&a5 error:a7];
}

- (BOOL)removeExtendedAttributeNamed:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (const char *)[a4 fileSystemRepresentation];
  id v9 = v7;
  BOOL v10 = 1;
  if (removexattr(v8, (const char *)[v9 fileSystemRepresentation], 1))
  {
    id v11 = __error();
    uint64_t v12 = *v11;
    if (v12 == 93)
    {
      id v13 = 0;
      BOOL v10 = 1;
    }
    else
    {
      id v14 = (void *)*MEMORY[0x263F08438];
      strerror(*v11);
      _CreateError((uint64_t)"-[MIFileManager removeExtendedAttributeNamed:fromURL:error:]", 2420, v14, v12, 0, 0, @"Failed to remove extended attribute named %@ from %s: %s", v15, (uint64_t)v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        id v13 = v13;
        BOOL v10 = 0;
        *a5 = v13;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v10;
}

- (unint64_t)diskUsageForURL:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v4 = [MEMORY[0x263F088B0] hashTableWithOptions:256];
  id v5 = v3;
  uint64_t v6 = [v5 fileSystemRepresentation];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __33__MIFileManager_diskUsageForURL___block_invoke;
  v13[3] = &unk_264BB32F8;
  uint64_t v15 = &v17;
  id v16 = 0;
  id v7 = v4;
  id v14 = v7;
  char v8 = TraverseDirectory(v6, 2, 0x1C0u, &v16, v13);
  id v9 = v16;
  if ((v8 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v12 = [v5 path];
    MOLogWrite();
  }
  unint64_t v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __33__MIFileManager_diskUsageForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 56) != 2)
  {
    if (*(_DWORD *)(a2 + 76) == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += *(void *)(a2 + 8);
    }
    else
    {
      id v4 = *(const void **)a2;
      if (NSHashGet(*(NSHashTable **)(a1 + 32), *(const void **)a2))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
          MOLogWrite();
        }
      }
      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += *(void *)(a2 + 8);
        NSHashInsertKnownAbsent(*(NSHashTable **)(a1 + 32), v4);
      }
    }
  }
  return 1;
}

- (BOOL)setModificationDateToNowForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 256);
  if (v6 < 0)
  {
    int v15 = *__error();
    id v16 = (void *)*MEMORY[0x263F08438];
    uint64_t v17 = [v5 path];
    strerror(v15);
    id v14 = _CreateError((uint64_t)"-[MIFileManager setModificationDateToNowForURL:error:]", 2679, v16, v15, 0, 0, @"open() failed for %@: %s", v18, (uint64_t)v17);

    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  int v7 = v6;
  int v8 = futimes(v6, 0);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    int v10 = *__error();
    id v11 = (void *)*MEMORY[0x263F08438];
    uint64_t v12 = [v5 path];
    strerror(v10);
    id v14 = _CreateError((uint64_t)"-[MIFileManager setModificationDateToNowForURL:error:]", 2685, v11, v10, 0, 0, @"futimes() failed for %@: %s", v13, (uint64_t)v12);
  }
  else
  {
    id v14 = 0;
  }
  close(v7);
  if (a4)
  {
LABEL_8:
    if (!v9) {
      *a4 = v14;
    }
  }
LABEL_10:

  return v9;
}

- (id)modificationDateForURL:(id)a3 error:(id *)a4
{
  memset(&v11, 0, sizeof(v11));
  id v5 = a3;
  if (lstat((const char *)[v5 fileSystemRepresentation], &v11))
  {
    if (a4)
    {
      int v6 = *__error();
      int v7 = (void *)*MEMORY[0x263F08438];
      int v8 = [v5 path];
      strerror(v6);
      _CreateError((uint64_t)"-[MIFileManager modificationDateForURL:error:]", 2710, v7, v6, 0, 0, @"lstat() failed for %@: %s", v9, (uint64_t)v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v11.st_mtimespec.tv_nsec / 1000000000.0 + (double)v11.st_mtimespec.tv_sec];
  }

  return a4;
}

- (id)debugDescriptionForItemAtURL:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  int v6 = [v4 path];
  int v7 = (void *)[v5 initWithFormat:@"Extra info about \"%@\": ", v6];

  memset(&v49, 0, sizeof(v49));
  id v8 = v4;
  if (lstat((const char *)[v8 fileSystemRepresentation], &v49))
  {
    int v9 = *__error();
    int v10 = [v8 path];
    [v7 appendFormat:@"Couldn't stat %@: %s", v10, strerror(v9)];

    stat v11 = (void *)[v7 copy];
    goto LABEL_50;
  }
  [v7 appendFormat:@"dev=%d ino=%llu mode=0%ho nlink=%hu uid=%u gid=%u rdev=%d size=%lld atime=%lf mtime=%lf ctime=%lf birthtime=%lf blksize=%d blocks=%lld flags=0x%x ", v49.st_dev, v49.st_ino, v49.st_mode, v49.st_nlink, v49.st_uid, v49.st_gid, v49.st_rdev, v49.st_size, (double)v49.st_atimespec.tv_nsec / 1000000000.0 + (double)v49.st_atimespec.tv_sec, (double)v49.st_mtimespec.tv_nsec / 1000000000.0 + (double)v49.st_mtimespec.tv_sec, (double)v49.st_ctimespec.tv_nsec / 1000000000.0 + (double)v49.st_ctimespec.tv_sec, (double)v49.st_birthtimespec.tv_nsec / 1000000000.0 + (double)v49.st_birthtimespec.tv_sec, v49.st_blksize, v49.st_blocks, v49.st_flags];
  if ((v49.st_mode & 0xF000) == 0x8000)
  {
    id v48 = 0;
    uint64_t v12 = [(MIFileManager *)self upToFirstFourBytesFromURL:v8 error:&v48];
    id v13 = v48;
    if (v12)
    {
      [v7 appendFormat:@"firstBytes=%@ ", v12];
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v33 = [v8 path];
        id v37 = v13;
        MOLogWrite();
      }
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  id v47 = v13;
  id v14 = -[MIFileManager aclTextFromURL:error:](self, "aclTextFromURL:error:", v8, &v47, v33, v37);
  id v15 = v47;

  if (v14)
  {
    [v7 appendFormat:@"ACL={ %@ } ", v14];
    goto LABEL_22;
  }
  id v16 = [v15 domain];
  if (![v16 isEqualToString:*MEMORY[0x263F08438]])
  {

    goto LABEL_18;
  }
  uint64_t v17 = [v15 code];

  if (v17 != 2)
  {
LABEL_18:
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v34 = v15;
      MOLogWrite();
    }
    goto LABEL_21;
  }
  [v7 appendString:@"ACL=<not found> "];
LABEL_21:

  id v15 = 0;
LABEL_22:
  id v46 = v15;
  uint64_t v18 = -[MIFileManager extendedAttributesFromURL:error:](self, "extendedAttributesFromURL:error:", v8, &v46, v34);
  id v19 = v46;

  if (!v18)
  {
    uint64_t v20 = [v19 domain];
    if ([v20 isEqualToString:@"MIInstallerErrorDomain"])
    {
      uint64_t v21 = [v19 code];

      if (v21 == 140)
      {
        [v7 appendString:@"extendedAttributes=<not found> "];
LABEL_31:

        id v19 = 0;
        goto LABEL_32;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v35 = v19;
      MOLogWrite();
    }
    goto LABEL_31;
  }
  [v7 appendFormat:@"extendedAttributes=%@ ", v18];
LABEL_32:
  int v22 = [v8 pathExtension:v35];
  int v23 = [v22 isEqualToString:@"plist"];

  if (v23)
  {
    id v45 = v19;
    uint64_t v24 = [NSDictionary MI_dictionaryWithContentsOfURL:v8 options:0 error:&v45];
    id v25 = v45;

    if (v24)
    {
      [v7 appendFormat:@"keyCount=%lu ", [v24 count]];
      if ([v24 count])
      {
        id v39 = v25;
        id v40 = v14;
        [v7 appendString:@"keySample={ "];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v26 = v24;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = 0;
          uint64_t v30 = *(void *)v42;
LABEL_37:
          uint64_t v31 = 0;
          while (1)
          {
            if (*(void *)v42 != v30) {
              objc_enumerationMutation(v26);
            }
            [v7 appendFormat:@"%@ ", *(void *)(*((void *)&v41 + 1) + 8 * v31)];
            if (v29 + v31 == 4) {
              break;
            }
            if (v28 == ++v31)
            {
              uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
              v29 += v31;
              if (v28) {
                goto LABEL_37;
              }
              break;
            }
          }
        }

        [v7 appendString:@"} "];
        id v25 = v39;
        id v14 = v40;
      }
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        id v36 = [v8 path];
        id v38 = v25;
        MOLogWrite();
      }
      id v25 = 0;
    }

    id v19 = v25;
  }
  stat v11 = [v7 copy:v36, v38];

LABEL_50:

  return v11;
}

- (void)logAccessPermissionsForURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [a3 MI_allAccessURLs];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    uint64_t v29 = *MEMORY[0x263F08438];
    uint64_t v30 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        memset(&v33, 0, sizeof(v33));
        id v9 = v8;
        if (!lstat((const char *)[v9 fileSystemRepresentation], &v33))
        {
          id v32 = 0;
          uint64_t v12 = [(MIFileManager *)self aclTextFromURL:v9 error:&v32];
          id v13 = v32;
          stat v11 = v13;
          if (v12)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              uint64_t st_mode = v33.st_mode;
              st_uid = (void *)v33.st_uid;
              st_gid = (char *)v33.st_gid;
              uint64_t v17 = [v9 path:v24, v25];
              uint64_t v27 = v17;
              uint64_t v28 = v12;
              id v25 = st_gid;
              uint64_t v26 = st_mode;
              uint64_t v24 = st_uid;
              MOLogWrite();
              goto LABEL_24;
            }
            goto LABEL_25;
          }
          uint64_t v18 = [v13 domain];
          if ([v18 isEqualToString:v29])
          {
            uint64_t v19 = [v11 code];

            if (v19 == 2) {
              goto LABEL_21;
            }
          }
          else
          {
          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            uint64_t v24 = [v9 path:v24, v25, v26, v27, v28];
            id v25 = (char *)v11;
            MOLogWrite();
          }
LABEL_21:

          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          {
            stat v11 = 0;
          }
          else
          {
            uint64_t v20 = v33.st_mode;
            uint64_t v21 = (void *)v33.st_uid;
            int v22 = (char *)v33.st_gid;
            uint64_t v17 = [v9 path:v24, v25];
            uint64_t v26 = v20;
            uint64_t v27 = v17;
            uint64_t v24 = v21;
            id v25 = v22;
            MOLogWrite();
            stat v11 = 0;
LABEL_24:

            id v3 = v30;
          }
LABEL_25:

          goto LABEL_26;
        }
        int v10 = *__error();
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          stat v11 = [v9 path:v24, v25];
          uint64_t v24 = v11;
          id v25 = strerror(v10);
          MOLogWrite();
LABEL_26:
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v23 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v5 = v23;
    }
    while (v23);
  }
}

+ (id)_sanitizeFilePathForVarOrTmpSymlink:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasPrefix:@"/var"])
  {
    uint64_t v6 = [NSURL fileURLWithPath:@"/var/" isDirectory:1];
    uint64_t v7 = [(id)objc_opt_class() defaultManager];
    id v21 = 0;
    id v8 = [v7 realPathForURL:v6 allowNonExistentPathComponents:0 isDirectory:1 error:&v21];
    id v9 = v21;

    if (v8)
    {
      stat v11 = [v8 path];
      uint64_t v12 = @"/var";
LABEL_7:
      id v14 = [v5 substringFromIndex:-[__CFString length](v12, "length")];
      id v15 = [v11 stringByAppendingString:v14];

      id v16 = 0;
      goto LABEL_13;
    }
    uint64_t v17 = @"Failed to get the real path of /var";
    uint64_t v18 = 2846;
  }
  else
  {
    if (![v5 hasPrefix:@"/tmp"])
    {
      id v15 = v5;
      id v16 = 0;
      if (!a4) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    uint64_t v6 = [NSURL fileURLWithPath:@"/tmp/" isDirectory:1];
    id v13 = [(id)objc_opt_class() defaultManager];
    id v20 = 0;
    id v8 = [v13 realPathForURL:v6 allowNonExistentPathComponents:0 isDirectory:1 error:&v20];
    id v9 = v20;

    if (v8)
    {
      stat v11 = [v8 path];
      uint64_t v12 = @"/tmp";
      goto LABEL_7;
    }
    uint64_t v17 = @"Failed to get the real path of /tmp";
    uint64_t v18 = 2856;
  }
  id v16 = _CreateAndLogError((uint64_t)"+[MIFileManager _sanitizeFilePathForVarOrTmpSymlink:error:]", v18, @"MIInstallerErrorDomain", 4, v9, 0, v17, v10, (uint64_t)v20);
  id v15 = 0;
LABEL_13:

  if (!a4) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v15) {
    *a4 = v16;
  }
LABEL_16:

  return v15;
}

- (BOOL)secureRenameFromSourceURL:(id)a3 toDestinationURL:(id)a4 destinationStatus:(unsigned __int8)a5 error:(id *)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v62 = v10;
  uint64_t v12 = [v10 URLByDeletingLastPathComponent];
  uint64_t v61 = v11;
  id v13 = [v11 URLByDeletingLastPathComponent];
  id v14 = objc_opt_class();
  id v15 = [v12 path];
  id v65 = 0;
  id v16 = [v14 _sanitizeFilePathForVarOrTmpSymlink:v15 error:&v65];
  id v17 = v65;

  if (!v16)
  {
    id v23 = [v12 path];
    _CreateAndLogError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2888, @"MIInstallerErrorDomain", 4, v17, 0, @"Failed to sanitize source file path %@", v29, (uint64_t)v23);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v31 = 0;
    id v22 = v17;
LABEL_10:
    stat v33 = v62;
    goto LABEL_30;
  }
  uint64_t v60 = a6;
  uint64_t v18 = (const char *)[v16 fileSystemRepresentation];
  uint64_t v19 = objc_opt_class();
  id v20 = [v13 path];
  id v64 = v17;
  id v21 = [v19 _sanitizeFilePathForVarOrTmpSymlink:v20 error:&v64];
  id v22 = v64;

  if (!v21)
  {
    id v23 = [v13 path];
    _CreateAndLogError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2895, @"MIInstallerErrorDomain", 4, v22, 0, @"Failed to sanitize destination file path %@", v32, (uint64_t)v23);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v31 = 0;
    a6 = v60;
    goto LABEL_10;
  }
  id v58 = v22;
  uint64_t v59 = v13;
  id v23 = v21;
  uint64_t v24 = (const char *)[v23 fileSystemRepresentation];
  uint64_t v25 = open(v18, 537919488);
  if ((v25 & 0x80000000) != 0)
  {
    int v34 = *__error();
    long long v35 = (void *)*MEMORY[0x263F08438];
    uint64_t v36 = v34;
    strerror(v34);
    _CreateError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2903, v35, v36, 0, 0, @"Failed to open file %s : %s", v37, (uint64_t)v18);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v26 = v25;
    int v27 = open(v24, 537919488);
    if ((v27 & 0x80000000) == 0)
    {
      int v28 = v27;
      if (v7 == 2)
      {
        BOOL v53 = 0;
        unsigned int v57 = 4;
      }
      else
      {
        if (v7 != 1)
        {
          long long v42 = v61;
          BOOL v53 = [(MIFileManager *)self itemExistsAtURL:v61];
          if (v53) {
            int v43 = 2;
          }
          else {
            int v43 = 4;
          }
          unsigned int v57 = v43;
LABEL_20:
          id v44 = [v62 lastPathComponent];
          id v45 = (const char *)[v44 fileSystemRepresentation];
          id v46 = [v42 lastPathComponent];
          LODWORD(v45) = renameatx_np(v26, v45, v28, (const char *)[v46 fileSystemRepresentation], v57);
          BOOL v31 = v45 == 0;

          int v55 = v28;
          int v56 = v26;
          if (v45)
          {
            int v47 = *__error();
            uint64_t v54 = (void *)*MEMORY[0x263F08438];
            id v30 = [v62 path];
            id v48 = [v61 path];
            strerror(v47);
            uint64_t v50 = _CreateError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2929, v54, v47, 0, 0, @"Failed to renameatx_np() for source fd %d path \"%@\" to destination fd %d path \"%@\" with flags 0x%x, Error: %s", v49, v26);
            a6 = v60;
          }
          else
          {
            if (!v53)
            {
              id v30 = 0;
              a6 = v60;
              goto LABEL_28;
            }
            id v63 = 0;
            stat v33 = v62;
            BOOL v51 = [(MIFileManager *)self removeItemAtURL:v62 error:&v63];
            id v30 = v63;
            a6 = v60;
            if (v51)
            {
              id v13 = v59;
LABEL_29:
              id v22 = v58;
              close(v56);
              close(v55);
              goto LABEL_30;
            }
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              uint64_t v50 = 0;
              goto LABEL_23;
            }
            id v48 = [v62 path];
            MOLogWrite();
            uint64_t v50 = 0;
          }

LABEL_23:
          id v30 = (id)v50;
LABEL_28:
          id v13 = v59;
          stat v33 = v62;
          goto LABEL_29;
        }
        unsigned int v57 = 2;
        BOOL v53 = 1;
      }
      long long v42 = v61;
      goto LABEL_20;
    }
    int v38 = *__error();
    uint64_t v39 = (void *)*MEMORY[0x263F08438];
    uint64_t v40 = v38;
    strerror(v38);
    _CreateError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2910, v39, v40, 0, 0, @"Failed to open file %s : %s", v41, (uint64_t)v24);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    close(v26);
  }
  BOOL v31 = 0;
  id v13 = v59;
  a6 = v60;
  stat v33 = v62;
LABEL_30:

  if (a6 && !v31) {
    *a6 = v30;
  }

  return v31;
}

- (void)_moveItemAtURL:(uint64_t)a1 toURL:(uint64_t)a2 failIfSrcMissing:error:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  id v3 = "-[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_230C95000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "%s: Expected to move %s to %s but got EXDEV; falling back to copyfile",
    (uint8_t *)&v2,
    0x20u);
}

void __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSyml"
       "ink:error:]_block_invoke";
  __int16 v6 = 2080;
  uint64_t v7 = v2;
  __int16 v8 = 2080;
  uint64_t v9 = v3;
  _os_log_fault_impl(&dword_230C95000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "%s: Attempt to clone %s to %s failed with EXDEV; falling back to copyfile",
    (uint8_t *)&v4,
    0x20u);
}

@end