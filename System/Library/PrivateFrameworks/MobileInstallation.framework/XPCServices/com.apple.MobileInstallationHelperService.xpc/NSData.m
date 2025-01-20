@interface NSData
- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7;
- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 error:(id *)a8;
- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 withBarrier:(BOOL)a8 error:(id *)a9;
- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 error:(id *)a4;
@end

@implementation NSData

- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7
{
  return [(NSData *)self MI_writeAtomicallyToURL:a3 withMode:a4 owner:*(void *)&a5 group:*(void *)&a6 protectionClass:0xFFFFFFFFLL error:a7];
}

- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 error:(id *)a8
{
  return [(NSData *)self MI_writeAtomicallyToURL:a3 withMode:a4 owner:*(void *)&a5 group:*(void *)&a6 protectionClass:*(void *)&a7 withBarrier:0 error:a8];
}

- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 withBarrier:(BOOL)a8 error:(id *)a9
{
  BOOL v57 = a8;
  uint64_t v12 = a4;
  v14 = a9;
  id v15 = a3;
  v16 = +[NSFileManager defaultManager];
  id v60 = 0;
  v17 = [v16 URLForDirectory:99 inDomain:1 appropriateForURL:v15 create:1 error:&v60];
  id v18 = v60;

  if (!v17)
  {
    BOOL v28 = 0;
    v29 = 0;
    if (!a9) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  id v59 = v15;
  v19 = +[NSUUID UUID];
  v20 = [v19 UUIDString];
  v21 = [v17 URLByAppendingPathComponent:v20 isDirectory:0];

  id v58 = v21;
  v22 = (const char *)[v58 fileSystemRepresentation];
  v23 = (const std::__fs::filesystem::path *)v22;
  if (a7 == -1)
  {
    int v24 = open(v22, 2818, v12);
    if (v24 < 0)
    {
      int v37 = *__error();
      uint64_t v38 = v37;
      strerror(v37);
      _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 67, NSPOSIXErrorDomain, v38, 0, 0, @"open failed for %s : %s", v39, (uint64_t)v23);
      goto LABEL_14;
    }
  }
  else
  {
    int v24 = open_dprotected_np(v22, 2818, a7, 0, v12);
    if (v24 < 0)
    {
      int v25 = *__error();
      uint64_t v26 = v25;
      strerror(v25);
      _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 56, NSPOSIXErrorDomain, v26, 0, 0, @"open_dprotected_np failed for %s for class %d : %s", v27, (uint64_t)v23);
      uint64_t v36 = LABEL_14:;
      v14 = a9;
      goto LABEL_15;
    }
  }
  v14 = a9;
  if (fchmod(v24, v12))
  {
    int v30 = *__error();
    uint64_t v31 = v30;
    strerror(v30);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 75, NSPOSIXErrorDomain, v31, 0, 0, @"Failed to set mode to 0%o for %s : %s", v32, v12);
    uint64_t v36 = LABEL_12:;
LABEL_15:
    v29 = v58;
    goto LABEL_16;
  }
  if (fchown(v24, a5, a6))
  {
    int v33 = *__error();
    uint64_t v34 = v33;
    strerror(v33);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 82, NSPOSIXErrorDomain, v34, 0, 0, @"Failed to set owner for %s : %s", v35, (uint64_t)v23);
    goto LABEL_12;
  }
  v41 = self;
  id v42 = [(NSData *)v41 bytes];
  id v43 = [(NSData *)v41 length];
  ssize_t v44 = write(v24, v42, (size_t)v43);
  if (v44 < 0)
  {
    int v47 = *__error();
    uint64_t v48 = v47;
    strerror(v47);
    uint64_t v49 = v48;
    v14 = a9;
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 92, NSPOSIXErrorDomain, v49, 0, 0, @"Failed to write %lu bytes to %s : %s", v50, (uint64_t)v43);
    goto LABEL_12;
  }
  if ((id)v44 != v43)
  {
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 96, NSPOSIXErrorDomain, 5, 0, 0, @"write() returned %zd but we expected %lu when writing to %s", v45, v44);
    goto LABEL_12;
  }
  if (v57)
  {
    v29 = v58;
    if (!fcntl(v24, 85)) {
      goto LABEL_38;
    }
    v46 = __error();
    if (gLogHandle)
    {
      if (*(int *)(gLogHandle + 44) < 3) {
        goto LABEL_38;
      }
    }
  }
  else
  {
    v29 = v58;
    if (!fsync(v24)) {
      goto LABEL_38;
    }
    v46 = __error();
    if (gLogHandle)
    {
      if (*(int *)(gLogHandle + 44) < 3) {
        goto LABEL_38;
      }
    }
  }
  strerror(*v46);
  MOLogWrite();
LABEL_38:
  close(v24);
  v51 = (const std::__fs::filesystem::path *)[v59 fileSystemRepresentation];
  rename(v23, v51, v52);
  if (!v53)
  {
    BOOL v28 = 1;
    int v24 = -1;
    goto LABEL_19;
  }
  int v54 = *__error();
  uint64_t v55 = v54;
  strerror(v54);
  uint64_t v36 = _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 126, NSPOSIXErrorDomain, v55, 0, 0, @"Failed to rename %s to %s : %s", v56, (uint64_t)v23);
  int v24 = -1;
LABEL_16:

  if (v23) {
    unlink((const char *)v23);
  }
  BOOL v28 = 0;
  id v18 = (id)v36;
LABEL_19:
  unlink((const char *)[v17 fileSystemRepresentation]);
  if ((v24 & 0x80000000) == 0) {
    close(v24);
  }
  id v15 = v59;
  if (v14)
  {
LABEL_22:
    if (!v28) {
      id *v14 = v18;
    }
  }
LABEL_24:

  return v28;
}

- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (const char *)[v6 fileSystemRepresentation];
  memset(&v25, 0, sizeof(v25));
  int v8 = open(v7, 256);
  if (v8 < 0)
  {
    int v14 = *__error();
    uint64_t v15 = v14;
    strerror(v14);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 166, NSPOSIXErrorDomain, v15, 0, 0, @"open failed for %s : %s", v16, (uint64_t)v7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    BOOL v17 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  int v9 = v8;
  if (fstat(v8, &v25))
  {
    int v10 = *__error();
    uint64_t v11 = v10;
    strerror(v10);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 172, NSPOSIXErrorDomain, v11, 0, 0, @"fstat failed for %s : %s", v12, (uint64_t)v7);
LABEL_4:
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    close(v9);
    goto LABEL_6;
  }
  uint64_t v19 = fcntl(v9, 63);
  if ((v19 & 0x80000000) != 0)
  {
    int v21 = *__error();
    uint64_t v22 = *__error();
    strerror(v21);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 180, NSPOSIXErrorDomain, v22, 0, 0, @"Failed to getclass of file %s: %s", v23, (uint64_t)v7);
    goto LABEL_4;
  }
  uint64_t v20 = v19;
  close(v9);
  id v24 = 0;
  BOOL v17 = [(NSData *)self MI_writeAtomicallyToURL:v6 withMode:v25.st_mode owner:v25.st_uid group:v25.st_gid protectionClass:v20 error:&v24];
  id v13 = v24;
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  if (!v17) {
    *a4 = v13;
  }
LABEL_9:

  return v17;
}

@end