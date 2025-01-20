@interface NSString(MFSharedResourcesDirectoryPathUtils)
- (uint64_t)mf_betterStringByResolvingSymlinksInPath;
- (uint64_t)mf_canonicalizedAbsolutePath;
- (uint64_t)mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath;
- (uint64_t)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath;
- (void)mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath;
@end

@implementation NSString(MFSharedResourcesDirectoryPathUtils)

- (uint64_t)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  v1 = objc_msgSend(a1, "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath");
  if ([v1 hasPrefix:@"~"]) {
    return (uint64_t)v1;
  }
  if (!mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir)
  {
    v2 = objc_msgSend((id)objc_msgSend(@"~", "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath"), "mf_betterStringByResolvingSymlinksInPath");
    _MFLockGlobalLock();
    if (!mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir) {
      mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir = v2;
    }
    _MFUnlockGlobalLock();
  }
  if (!objc_msgSend(v1, "hasPrefix:")) {
    return (uint64_t)v1;
  }
  uint64_t v3 = objc_msgSend(v1, "substringFromIndex:", objc_msgSend((id)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir, "length"));
  return [@"~" stringByAppendingString:v3];
}

- (uint64_t)mf_betterStringByResolvingSymlinksInPath
{
  _MFLockGlobalLock();
  id v2 = (id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
  if (!mf_betterStringByResolvingSymlinksInPath_resolvedPaths)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mf_betterStringByResolvingSymlinksInPath_resolvedPaths = (uint64_t)v2;
  }
  uint64_t v3 = [v2 objectForKey:a1];
  _MFUnlockGlobalLock();
  if (!v3)
  {
    uint64_t v3 = [a1 stringByResolvingSymlinksInPath];
    if (v3)
    {
      _MFLockGlobalLock();
      [(id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths setObject:v3 forKey:a1];
      [(id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths setObject:v3 forKey:v3];
      _MFUnlockGlobalLock();
    }
  }
  return v3;
}

- (uint64_t)mf_canonicalizedAbsolutePath
{
  v1 = (const char *)[a1 fileSystemRepresentation];
  id v2 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  realpath_DARWIN_EXTSN(v1, v2);
  if (*v2) {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "stringWithFileSystemRepresentation:length:", v2, strlen(v2));
  }
  else {
    uint64_t v3 = 0;
  }
  free(v2);
  return v3;
}

- (uint64_t)mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath
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
        goto LABEL_16;
      }
    }
  }
  if ((uint64_t)v3 >= 1 && *v4 == 126)
  {
    if (v3 >= 2)
    {
      if (v4[1] != 47) {
        goto LABEL_16;
      }
    }
    else
    {
      unint64_t v3 = 1;
    }
LABEL_14:
    v5 = (void *)CPSharedResourcesDirectory();
    uint64_t v6 = [v5 length];
    uint64_t v7 = v6 + v3 - 1;
    if (v7 <= 1024)
    {
      uint64_t v8 = v6;
      memmove(&v4[v6], v4 + 1, 2 * (v3 - 1));
      objc_msgSend(v5, "getCharacters:range:", v4, 0, v8);
      unint64_t v3 = v7;
    }
  }
LABEL_16:
  uint64_t v9 = [NSString stringWithCharacters:v4 length:v3];
  free(v4);
  return v9;
}

- (void)mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  v1 = a1;
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  if (v2 < 1) {
    return v1;
  }
  unint64_t v3 = v2;
  unint64_t v4 = MEMORY[0x1F4188790]();
  uint64_t v6 = (_WORD *)((char *)v19 - v5);
  if (v4 >= 0x101)
  {
    uint64_t v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    objc_msgSend(v1, "getCharacters:range:", v6, 0, v3);
LABEL_6:
    unint64_t v7 = v3;
    while (v6[v7 - 1] == 47)
    {
      if (v7-- <= 2) {
        goto LABEL_9;
      }
    }
    goto LABEL_10;
  }
  bzero((char *)v19 - v5, 2 * v4);
  objc_msgSend(v1, "getCharacters:range:", v6, 0, v3);
  if (v3 >= 2) {
    goto LABEL_6;
  }
LABEL_9:
  unint64_t v7 = 1;
  if (*v6 != 47)
  {
LABEL_10:
    uint64_t v8 = (void *)CPSharedResourcesDirectory();
    uint64_t v9 = [v8 length];
    unint64_t v10 = v7 - v9;
    if ((uint64_t)v7 >= v9)
    {
      uint64_t v11 = v9;
      unint64_t v12 = MEMORY[0x1F4188790]();
      v15 = (char *)v19 - v14;
      if (v12 > 0x100) {
        v15 = (char *)malloc_type_malloc(2 * v13, 0x1000040BDFB0063uLL);
      }
      else {
        bzero((char *)v19 - v14, 2 * v13);
      }
      objc_msgSend(v8, "getCharacters:range:", v15, 0, v11);
      if (v11 < 1)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = 0;
        while (v6[v16] == *(_WORD *)&v15[2 * v16])
        {
          if (v11 == ++v16)
          {
            uint64_t v16 = v11;
            break;
          }
        }
      }
      if ((unint64_t)v11 >= 0x101) {
        free(v15);
      }
      if (v16 == v7)
      {
        *uint64_t v6 = 126;
        unint64_t v7 = 1;
      }
      else if (v16 == v11)
      {
        v17 = &v6[v11];
        if (*v17 == 47)
        {
          memmove(v6 + 1, v17, 2 * v10);
          *uint64_t v6 = 126;
          unint64_t v7 = v10 + 1;
        }
      }
    }
  }
  v1 = (void *)[NSString stringWithCharacters:v6 length:v7];
  if (v3 >= 0x101) {
    free(v6);
  }
  return v1;
}

@end