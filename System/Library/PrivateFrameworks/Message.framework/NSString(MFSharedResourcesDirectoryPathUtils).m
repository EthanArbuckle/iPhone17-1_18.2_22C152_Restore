@interface NSString(MFSharedResourcesDirectoryPathUtils)
- (id)mf_betterStringByResolvingSymlinksInPath;
- (id)mf_canonicalizedAbsolutePath;
- (id)mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath;
- (id)mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath;
- (id)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath;
@end

@implementation NSString(MFSharedResourcesDirectoryPathUtils)

- (id)mf_betterStringByResolvingSymlinksInPath
{
  _MFLockGlobalLock();
  v2 = (void *)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
  if (!mf_betterStringByResolvingSymlinksInPath_resolvedPaths)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
    mf_betterStringByResolvingSymlinksInPath_resolvedPaths = (uint64_t)v3;

    v2 = (void *)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
  }
  v5 = [v2 objectForKey:a1];
  _MFUnlockGlobalLock();
  if (!v5)
  {
    v5 = [a1 stringByResolvingSymlinksInPath];
    if (v5)
    {
      _MFLockGlobalLock();
      [(id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths setObject:v5 forKey:a1];
      [(id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths setObject:v5 forKey:v5];
      _MFUnlockGlobalLock();
    }
  }
  return v5;
}

- (id)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  v1 = objc_msgSend(a1, "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath");
  if (([v1 hasPrefix:@"~"] & 1) == 0)
  {
    if (mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir)
    {
      v2 = 0;
    }
    else
    {
      id v3 = objc_msgSend(@"~", "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath");
      v2 = objc_msgSend(v3, "mf_betterStringByResolvingSymlinksInPath");

      _MFLockGlobalLock();
      if (!mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir) {
        objc_storeStrong((id *)&mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir, v2);
      }
      _MFUnlockGlobalLock();
    }
    if (objc_msgSend(v1, "hasPrefix:"))
    {
      v4 = objc_msgSend(v1, "substringFromIndex:", objc_msgSend((id)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir, "length"));
      uint64_t v5 = [@"~" stringByAppendingString:v4];

      v1 = (void *)v5;
    }
  }
  return v1;
}

- (id)mf_canonicalizedAbsolutePath
{
  v1 = (const char *)[a1 fileSystemRepresentation];
  v2 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  realpath_DARWIN_EXTSN(v1, v2);
  if (*v2)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [v3 stringWithFileSystemRepresentation:v2 length:strlen(v2)];
  }
  else
  {
    v4 = 0;
  }
  free(v2);
  return v4;
}

- (id)mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath
{
  unint64_t v2 = [a1 length];
  if (v2 >= 0x400) {
    unint64_t v3 = 1024;
  }
  else {
    unint64_t v3 = v2;
  }
  v4 = malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
  objc_msgSend(a1, "getCharacters:range:", v4, 0, v3);
  if (v3 >= 2)
  {
    while (v4[v3 - 1] == 47)
    {
      if (v3-- <= 2)
      {
        unint64_t v3 = 1;
        if (*v4 == 126) {
          goto LABEL_14;
        }
        goto LABEL_17;
      }
    }
  }
  if ((uint64_t)v3 >= 1 && *v4 == 126)
  {
    if (v3 >= 2)
    {
      if (v4[1] != 47) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v3 = 1;
    }
LABEL_14:
    uint64_t v5 = CPSharedResourcesDirectory();
    uint64_t v6 = [v5 length];
    uint64_t v7 = v6;
    uint64_t v8 = v6 + v3 - 1;
    if (v8 <= 1024)
    {
      memmove(&v4[v6], v4 + 1, 2 * (v3 - 1));
      objc_msgSend(v5, "getCharacters:range:", v4, 0, v7);
      unint64_t v3 = v8;
    }
  }
LABEL_17:
  v9 = [NSString stringWithCharacters:v4 length:v3];
  free(v4);
  return v9;
}

- (id)mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 length];
  unint64_t v3 = v2;
  if (v2 < 1) {
    goto LABEL_34;
  }
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (_WORD *)((char *)&v20 - v4);
  memset((char *)&v20 - v4, 170, v6);
  if (v3 >= 0x101) {
    uint64_t v5 = malloc_type_malloc(2 * v3, 0x1000040BDFB0063uLL);
  }
  else {
    bzero(v5, 2 * v3);
  }
  objc_msgSend(v1, "getCharacters:range:", v5, 0, v3);
  if (v3 >= 2)
  {
    unint64_t v7 = v3;
    while (v5[v7 - 1] == 47)
    {
      if (v7-- <= 2) {
        goto LABEL_9;
      }
    }
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v7 = 1;
  if (*v5 != 47)
  {
LABEL_10:
    uint64_t v8 = CPSharedResourcesDirectory();
    uint64_t v9 = [v8 length];
    uint64_t v10 = v9;
    unint64_t v11 = v7 - v9;
    if ((uint64_t)v7 >= v9)
    {
      uint64_t v20 = (uint64_t)&v20;
      if ((unint64_t)v9 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v9;
      }
      MEMORY[0x1F4188790](v9);
      v14 = (char *)&v20 - v13;
      memset((char *)&v20 - v13, 170, v15);
      if ((unint64_t)v10 >= 0x101) {
        v14 = (char *)malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
      }
      else {
        bzero(v14, 2 * v12);
      }
      objc_msgSend(v8, "getCharacters:range:", v14, 0, v10, v20, v21);
      if (v10 < 1)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = 0;
        while (v5[v16] == *(_WORD *)&v14[2 * v16])
        {
          if (v10 == ++v16)
          {
            uint64_t v16 = v10;
            break;
          }
        }
      }
      if ((unint64_t)v10 >= 0x101) {
        free(v14);
      }
      if (v16 == v7)
      {
        _WORD *v5 = 126;
        unint64_t v7 = 1;
      }
      else if (v16 == v10)
      {
        v17 = &v5[v10];
        if (*v17 == 47)
        {
          memmove(v5 + 1, v17, 2 * v11);
          _WORD *v5 = 126;
          unint64_t v7 = v11 + 1;
        }
      }
    }
  }
  uint64_t v18 = [NSString stringWithCharacters:v5 length:v7];

  if (v3 >= 0x101) {
    free(v5);
  }
  id v1 = (id)v18;
LABEL_34:
  return v1;
}

@end