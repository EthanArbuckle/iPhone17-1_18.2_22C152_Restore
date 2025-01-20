@interface NSData(MobileInstallationAdditions)
- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:error:;
- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:protectionClass:error:;
- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:protectionClass:withBarrier:error:;
- (uint64_t)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:()MobileInstallationAdditions error:;
@end

@implementation NSData(MobileInstallationAdditions)

- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:error:
{
  return objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:", a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
}

- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:protectionClass:error:
{
  return objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:", a3, a4, a5, a6, a7, 0, a8);
}

- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:protectionClass:withBarrier:error:
{
  v14 = a9;
  id v15 = a3;
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v66 = 0;
  v17 = [v16 URLForDirectory:99 inDomain:1 appropriateForURL:v15 create:1 error:&v66];
  id v18 = v66;

  if (!v17)
  {
    uint64_t v29 = 0;
    v30 = 0;
    if (!a9) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  id v65 = v15;
  v19 = [MEMORY[0x1E4F29128] UUID];
  v20 = [v19 UUIDString];
  v21 = [v17 URLByAppendingPathComponent:v20 isDirectory:0];

  id v64 = v21;
  v22 = (const char *)[v64 fileSystemRepresentation];
  v23 = (const std::__fs::filesystem::path *)v22;
  if (a7 == -1)
  {
    int v24 = open(v22, 2818, a4);
    if (v24 < 0)
    {
      int v40 = *__error();
      v41 = (void *)*MEMORY[0x1E4F28798];
      uint64_t v42 = v40;
      strerror(v40);
      _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 67, v41, v42, 0, 0, @"open failed for %s : %s", v43, (uint64_t)v23);
      goto LABEL_14;
    }
  }
  else
  {
    int v24 = open_dprotected_np(v22, 2818, a7, 0, a4);
    if (v24 < 0)
    {
      int v25 = *__error();
      v26 = (void *)*MEMORY[0x1E4F28798];
      uint64_t v27 = v25;
      strerror(v25);
      _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 56, v26, v27, 0, 0, @"open_dprotected_np failed for %s for class %d : %s", v28, (uint64_t)v23);
      uint64_t v39 = LABEL_14:;
      v14 = a9;
      goto LABEL_15;
    }
  }
  v14 = a9;
  if (fchmod(v24, a4))
  {
    int v31 = *__error();
    v32 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v33 = v31;
    strerror(v31);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 75, v32, v33, 0, 0, @"Failed to set mode to 0%o for %s : %s", v34, a4);
    uint64_t v39 = LABEL_12:;
LABEL_15:
    v30 = v64;
    goto LABEL_16;
  }
  if (fchown(v24, a5, a6))
  {
    int v35 = *__error();
    v36 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v37 = v35;
    strerror(v35);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 82, v36, v37, 0, 0, @"Failed to set owner for %s : %s", v38, (uint64_t)v23);
    goto LABEL_12;
  }
  id v45 = a1;
  v46 = (const void *)[v45 bytes];
  uint64_t v47 = [v45 length];
  ssize_t v48 = write(v24, v46, v47);
  if (v48 < 0)
  {
    int v51 = *__error();
    v52 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v53 = v51;
    strerror(v51);
    uint64_t v54 = v53;
    v14 = a9;
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 92, v52, v54, 0, 0, @"Failed to write %lu bytes to %s : %s", v55, v47);
    goto LABEL_12;
  }
  if (v48 != v47)
  {
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 96, (void *)*MEMORY[0x1E4F28798], 5, 0, 0, @"write() returned %zd but we expected %lu when writing to %s", v49, v48);
    goto LABEL_12;
  }
  if (a8)
  {
    v30 = v64;
    if (!fcntl(v24, 85)) {
      goto LABEL_38;
    }
    v50 = __error();
    if (gLogHandle)
    {
      if (*(int *)(gLogHandle + 44) < 3) {
        goto LABEL_38;
      }
    }
  }
  else
  {
    v30 = v64;
    if (!fsync(v24)) {
      goto LABEL_38;
    }
    v50 = __error();
    if (gLogHandle)
    {
      if (*(int *)(gLogHandle + 44) < 3) {
        goto LABEL_38;
      }
    }
  }
  strerror(*v50);
  MOLogWrite();
LABEL_38:
  close(v24);
  v56 = (const std::__fs::filesystem::path *)[v65 fileSystemRepresentation];
  rename(v23, v56, v57);
  if (!v58)
  {
    uint64_t v29 = 1;
    int v24 = -1;
    goto LABEL_19;
  }
  int v59 = *__error();
  v60 = (void *)*MEMORY[0x1E4F28798];
  uint64_t v61 = v59;
  strerror(v59);
  uint64_t v39 = _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 126, v60, v61, 0, 0, @"Failed to rename %s to %s : %s", v62, (uint64_t)v23);
  int v24 = -1;
LABEL_16:

  if (v23) {
    unlink((const char *)v23);
  }
  uint64_t v29 = 0;
  id v18 = (id)v39;
LABEL_19:
  unlink((const char *)[v17 fileSystemRepresentation]);
  if ((v24 & 0x80000000) == 0) {
    close(v24);
  }
  id v15 = v65;
  if (v14)
  {
LABEL_22:
    if ((v29 & 1) == 0) {
      void *v14 = v18;
    }
  }
LABEL_24:

  return v29;
}

- (uint64_t)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:()MobileInstallationAdditions error:
{
  id v6 = a3;
  v7 = (const char *)[v6 fileSystemRepresentation];
  memset(&v28, 0, sizeof(v28));
  int v8 = open(v7, 256);
  if (v8 < 0)
  {
    int v15 = *__error();
    v16 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v17 = v15;
    strerror(v15);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 166, v16, v17, 0, 0, @"open failed for %s : %s", v18, (uint64_t)v7);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    uint64_t v19 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  int v9 = v8;
  if (fstat(v8, &v28))
  {
    int v10 = *__error();
    v11 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v12 = v10;
    strerror(v10);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 172, v11, v12, 0, 0, @"fstat failed for %s : %s", v13, (uint64_t)v7);
LABEL_4:
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    close(v9);
    goto LABEL_6;
  }
  uint64_t v21 = fcntl(v9, 63);
  if ((v21 & 0x80000000) != 0)
  {
    int v23 = *__error();
    int v24 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v25 = *__error();
    strerror(v23);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 180, v24, v25, 0, 0, @"Failed to getclass of file %s: %s", v26, (uint64_t)v7);
    goto LABEL_4;
  }
  uint64_t v22 = v21;
  close(v9);
  id v27 = 0;
  uint64_t v19 = objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:", v6, v28.st_mode, v28.st_uid, v28.st_gid, v22, &v27);
  id v14 = v27;
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  if ((v19 & 1) == 0) {
    *a4 = v14;
  }
LABEL_9:

  return v19;
}

@end