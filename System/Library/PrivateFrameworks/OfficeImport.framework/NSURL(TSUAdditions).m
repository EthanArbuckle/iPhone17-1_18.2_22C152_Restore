@interface NSURL(TSUAdditions)
+ (id)tsu_fileURLWithPath:()TSUAdditions;
- (BOOL)tsu_isFileSizeTooLargeForSharing;
- (BOOL)tsu_isInTrash;
- (BOOL)tsu_setNeedsDocumentIdentifierAndReturnError:()TSUAdditions;
- (id)tsu_displayName;
- (id)tsu_documentIdentifier;
- (id)tsu_fileProviderBookmarkableString;
- (id)tsu_fileSystemTypeName;
- (id)tsu_fileTypeIdentifierHandlingFileCoordinationPromises;
- (id)tsu_reachableFileURLByDeletingUnreachablePathComponents;
- (id)tsu_shareOwnerName;
- (uint64_t)_isShareRole:()TSUAdditions role:error:;
- (uint64_t)tsu_displayName:()TSUAdditions error:;
- (uint64_t)tsu_fileSize;
- (uint64_t)tsu_fileSize:()TSUAdditions error:;
- (uint64_t)tsu_isDocumentUploaded;
- (uint64_t)tsu_isDocumentUploaded:()TSUAdditions error:;
- (uint64_t)tsu_isOnAPFSVolume;
- (uint64_t)tsu_isOnForeignVolume;
- (uint64_t)tsu_isOnSameVolumeAs:()TSUAdditions;
- (uint64_t)tsu_isShareCollaborator;
- (uint64_t)tsu_isShareCollaborator:()TSUAdditions error:;
- (uint64_t)tsu_isShareOwner;
- (uint64_t)tsu_isShareOwner:()TSUAdditions error:;
- (uint64_t)tsu_isShared;
- (uint64_t)tsu_isShared:()TSUAdditions error:;
- (uint64_t)tsu_shareOwnerName:()TSUAdditions error:;
- (void)tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock:()TSUAdditions;
- (void)tsu_performSecurityScopedResourceAccessUsingBlock:()TSUAdditions;
- (void)tsu_removeCachedResourceValueForKeys:()TSUAdditions;
@end

@implementation NSURL(TSUAdditions)

- (id)tsu_documentIdentifier
{
  id v4 = 0;
  char v1 = [a1 getResourceValue:&v4 forKey:*MEMORY[0x263EFF620] error:0];
  id v2 = v4;
  if ((v1 & 1) == 0)
  {

    id v2 = 0;
  }
  return v2;
}

- (void)tsu_performSecurityScopedResourceAccessUsingBlock:()TSUAdditions
{
  id v4 = a3;
  if (v4)
  {
    v6 = v4;
    int v5 = [a1 startAccessingSecurityScopedResource];
    v6[2](v6);
    id v4 = v6;
    if (v5)
    {
      [a1 stopAccessingSecurityScopedResource];
      id v4 = v6;
    }
  }
}

- (void)tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock:()TSUAdditions
{
  if (a3)
  {
    id v4 = a3;
    char v5 = [a1 startAccessingSecurityScopedResource];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __87__NSURL_TSUAdditions__tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock___block_invoke;
    v6[3] = &unk_264D60E50;
    char v7 = v5;
    v6[4] = a1;
    v4[2](v4, v6);
  }
}

- (BOOL)tsu_isFileSizeTooLargeForSharing
{
  return (unint64_t)objc_msgSend(a1, "tsu_fileSize") > 0x40000000;
}

- (uint64_t)tsu_fileSize
{
  uint64_t v2 = 0;
  objc_msgSend(a1, "tsu_fileSize:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_fileSize:()TSUAdditions error:
{
  v35[1] = *MEMORY[0x263EF8340];
  id v33 = 0;
  uint64_t v6 = *MEMORY[0x263EFF688];
  int v7 = [a1 getResourceValue:&v33 forKey:*MEMORY[0x263EFF688] error:0];
  id v8 = v33;
  id v9 = v8;
  uint64_t v10 = 0;
  if (v7) {
    uint64_t v10 = [v8 unsignedLongLongValue];
  }
  v11 = [MEMORY[0x263F08850] defaultManager];
  v35[0] = v6;
  char v12 = 1;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  v14 = [v11 enumeratorAtURL:a1 includingPropertiesForKeys:v13 options:0 errorHandler:0];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v26 = a4;
    uint64_t v18 = *(void *)v30;
    char v12 = 1;
    do
    {
      uint64_t v19 = 0;
      do
      {
        v20 = v9;
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
        id v27 = 0;
        id v28 = 0;
        int v22 = [v21 getResourceValue:&v28 forKey:v6 error:&v27];
        id v9 = v28;

        id v23 = v27;
        if (v22)
        {
          v10 += [v9 unsignedLongLongValue];
        }
        else
        {
          if ((v12 & 1) == 0) {
            goto LABEL_15;
          }
          if (TSUDefaultCat_init_token != -1) {
            dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_11);
          }
          if (v26)
          {
            char v12 = 0;
            void *v26 = v23;
          }
          else
          {
LABEL_15:
            char v12 = 0;
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v17);
  }

  if (a3) {
    *a3 = v10;
  }

  return v12 & 1;
}

- (uint64_t)tsu_isShared
{
  unsigned __int8 v2 = 0;
  objc_msgSend(a1, "tsu_isShared:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isShared:()TSUAdditions error:
{
  char v4 = [0 BOOLValue];
  if (a3) {
    *a3 = v4;
  }
  return 1;
}

- (uint64_t)_isShareRole:()TSUAdditions role:error:
{
  id v7 = a4;
  if (TSUDefaultCat_init_token == -1)
  {
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_6);
  if (a5) {
LABEL_3:
  }
    *a5 = 0;
LABEL_4:
  if (a3) {
    *a3 = 0;
  }

  return 0;
}

- (uint64_t)tsu_isShareCollaborator
{
  unsigned __int8 v2 = 0;
  objc_msgSend(a1, "tsu_isShareCollaborator:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isShareCollaborator:()TSUAdditions error:
{
  return 0;
}

- (uint64_t)tsu_isShareOwner
{
  unsigned __int8 v2 = 0;
  objc_msgSend(a1, "tsu_isShareOwner:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isShareOwner:()TSUAdditions error:
{
  return 0;
}

- (id)tsu_displayName
{
  id v3 = 0;
  objc_msgSend(a1, "tsu_displayName:error:", &v3, 0);
  id v1 = v3;
  return v1;
}

- (uint64_t)tsu_displayName:()TSUAdditions error:
{
  int v7 = [a1 startAccessingSecurityScopedResource];
  uint64_t v8 = *MEMORY[0x263EFF738];
  id v13 = 0;
  uint64_t v9 = [a1 getPromisedItemResourceValue:a3 forKey:v8 error:&v13];
  id v10 = v13;
  if (v9) {
    goto LABEL_7;
  }
  if (TSUDefaultCat_init_token == -1)
  {
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_8);
  if (a3)
  {
LABEL_4:
    v11 = [a1 lastPathComponent];
    *a3 = [v11 stringByDeletingPathExtension];
  }
LABEL_5:
  if (a4) {
    *a4 = v10;
  }
LABEL_7:
  if (v7) {
    [a1 stopAccessingSecurityScopedResource];
  }

  return v9;
}

- (uint64_t)tsu_isDocumentUploaded
{
  unsigned __int8 v2 = 0;
  objc_msgSend(a1, "tsu_isDocumentUploaded:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isDocumentUploaded:()TSUAdditions error:
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__NSURL_TSUAdditions__tsu_isDocumentUploaded_error___block_invoke;
  v8[3] = &unk_264D60E78;
  v8[4] = a1;
  v8[5] = &v9;
  v8[6] = &v15;
  v8[7] = &v19;
  objc_msgSend(a1, "tsu_performSecurityScopedResourceAccessUsingBlock:", v8);
  if (a4) {
    *a4 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  if (a3) {
    *a3 = *((unsigned char *)v20 + 24);
  }
  uint64_t v6 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v6;
}

- (id)tsu_shareOwnerName
{
  id v3 = 0;
  objc_msgSend(a1, "tsu_shareOwnerName:error:", &v3, 0);
  id v1 = v3;
  return v1;
}

- (uint64_t)tsu_shareOwnerName:()TSUAdditions error:
{
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_14_0);
  }
  *a3 = 0;
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

- (BOOL)tsu_setNeedsDocumentIdentifierAndReturnError:()TSUAdditions
{
  int v4 = open((const char *)[a1 fileSystemRepresentation], 0x200000);
  if (v4 < 0)
  {
    int v6 = -1;
    if (!a3) {
      return v6 == 0;
    }
    goto LABEL_9;
  }
  int v5 = v4;
  memset(&v8, 0, sizeof(v8));
  int v6 = fstat(v4, &v8);
  if (!v6)
  {
    if ((v8.st_flags & 0x40) != 0) {
      int v6 = 0;
    }
    else {
      int v6 = fchflags(v5, v8.st_flags | 0x40);
    }
  }
  close(v5);
  if (a3)
  {
LABEL_9:
    if (v6)
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 == 0;
}

- (id)tsu_fileTypeIdentifierHandlingFileCoordinationPromises
{
  id v3 = 0;
  [a1 getResourceValue:&v3 forKey:*MEMORY[0x263EFF780] error:0];
  id v1 = v3;
  return v1;
}

- (id)tsu_fileSystemTypeName
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (![a1 isFileURL])
  {
    int v4 = 0;
    goto LABEL_12;
  }
  [a1 path];
  memset(&v6, 0, 512);
  id v2 = objc_claimAutoreleasedReturnValue();
  if (!statfs((const char *)objc_msgSend(v2, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0),
          &v6)
    || ([v2 stringByDeletingLastPathComponent],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        id v2 = v3,
        LODWORD(v3) = statfs((const char *)[v2 fileSystemRepresentation], &v6),
        __error(),
        !v3))
  {
    int v4 = [NSString stringWithUTF8String:v6.f_fstypename];
    goto LABEL_11;
  }
  if (![a1 checkResourceIsReachableAndReturnError:0])
  {
LABEL_10:
    int v4 = 0;
    goto LABEL_11;
  }
  if (TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_17);
    goto LABEL_10;
  }
  int v4 = 0;
LABEL_11:

LABEL_12:
  return v4;
}

- (uint64_t)tsu_isOnForeignVolume
{
  return 0;
}

- (uint64_t)tsu_isOnAPFSVolume
{
  if (![a1 isFileURL]) {
    return 0;
  }
  id v2 = objc_msgSend(a1, "tsu_fileSystemTypeName");
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 isEqualToString:@"apfs"];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)tsu_reachableFileURLByDeletingUnreachablePathComponents
{
  if ([a1 isFileURL])
  {
    id v2 = a1;
    while (1)
    {
      id v3 = [v2 path];
      unint64_t v4 = [v3 length];

      if (v4 < 3) {
        break;
      }
      if ([v2 checkResourceIsReachableAndReturnError:0])
      {
        id v5 = v2;
        id v2 = v5;
        if (v5) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v6 = [v2 URLByDeletingLastPathComponent];

        id v2 = (id)v6;
      }
    }
    id v5 = 0;
LABEL_10:
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (uint64_t)tsu_isOnSameVolumeAs:()TSUAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "tsu_reachableFileURLByDeletingUnreachablePathComponents");
  uint64_t v6 = objc_msgSend(v4, "tsu_reachableFileURLByDeletingUnreachablePathComponents");

  if ([v5 isFileURL] && objc_msgSend(v6, "isFileURL"))
  {
    memset(&v17, 0, sizeof(v17));
    memset(&v16, 0, sizeof(v16));
    id v7 = [v5 path];
    stat v8 = (const char *)[v7 fileSystemRepresentation];

    if (v8)
    {
      int v9 = lstat(v8, &v17);
      if (v9 == -1)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_20);
        }
        int v9 = -1;
      }
    }
    else
    {
      int v9 = -2;
    }
    id v11 = [v6 path];
    char v12 = (const char *)[v11 fileSystemRepresentation];

    if (v12)
    {
      int v13 = lstat(v12, &v16);
      if (v13 == -1)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_22);
        }
        int v13 = -1;
      }
    }
    else
    {
      int v13 = -2;
    }
    if (v13 | v9) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v17.st_dev == v16.st_dev;
    }
    uint64_t v10 = v14;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)tsu_fileURLWithPath:()TSUAdditions
{
  if (a3)
  {
    id v4 = objc_msgSend(NSURL, "fileURLWithPath:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)tsu_fileProviderBookmarkableString
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__2;
  int v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke;
  v6[3] = &unk_264D60EC8;
  v6[4] = a1;
  stat v8 = &v9;
  uint64_t v3 = v2;
  id v7 = v3;
  objc_msgSend(a1, "tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)tsu_removeCachedResourceValueForKeys:()TSUAdditions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 removeCachedResourceValueForKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)tsu_isInTrash
{
  uint64_t v5 = 2;
  dispatch_semaphore_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = 0;
  LODWORD(a1) = [v2 getRelationship:&v5 ofDirectory:102 inDomain:0 toItemAtURL:a1 error:&v4];

  if (a1) {
    return v5 == 0;
  }
  if (TSUDefaultCat_init_token == -1) {
    return 0;
  }
  dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_30);
  return 0;
}

@end