@interface NSFileManager(SFUtilityAdditions)
- (uint64_t)_changeFileProtectionAtURL:()SFUtilityAdditions fromProtection:toProtection:recursively:error:;
- (uint64_t)_fileProtection:()SFUtilityAdditions isGreaterThan:;
- (uint64_t)_fileProtectionAtURL:()SFUtilityAdditions recursively:passesTest:;
- (uint64_t)_logFileProtectionAtURL:()SFUtilityAdditions recursively:indent:;
- (uint64_t)_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:;
- (uint64_t)applyFileAttributesFromDocumentAtURL:()SFUtilityAdditions toDocumentAtURL:error:;
- (uint64_t)changeFileProtectionAtURL:()SFUtilityAdditions fromProtection:toProtection:recursively:error:;
- (uint64_t)changeFileProtectionAtURL:()SFUtilityAdditions toProtection:recursively:error:;
- (uint64_t)directoryUsage:()SFUtilityAdditions;
- (uint64_t)hasAtLeastFileProtection:()SFUtilityAdditions atURL:recursively:;
- (uint64_t)hasAtMostFileProtection:()SFUtilityAdditions atURL:recursively:;
- (uint64_t)logFileProtectionAtURL:()SFUtilityAdditions recursively:;
- (uint64_t)pathUsage:()SFUtilityAdditions;
- (uint64_t)setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:;
@end

@implementation NSFileManager(SFUtilityAdditions)

- (uint64_t)directoryUsage:()SFUtilityAdditions
{
  v4 = objc_msgSend(a1, "subpathsAtPath:");
  uint64_t v5 = [v4 count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = *MEMORY[0x263F080B8];
  do
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", objc_msgSend(v4, "objectAtIndex:", v8)), "stringByResolvingSymlinksInPath");
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", v10, 0);
    if (v11)
    {
      v12 = (void *)[v11 objectForKey:v9];
      if (v12) {
        v7 += [v12 unsignedLongLongValue];
      }
    }
    ++v8;
  }
  while (v6 != v8);
  return v7;
}

- (uint64_t)pathUsage:()SFUtilityAdditions
{
  char v11 = 0;
  if (![a1 fileExistsAtPath:a3 isDirectory:&v11]) {
    return 0;
  }
  if (v11) {
    return [a1 directoryUsage:a3];
  }
  uint64_t v10 = 0;
  uint64_t v6 = (void *)[a1 attributesOfItemAtPath:a3 error:&v10];
  if (!v6)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) pathUsage:]"];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"];
    [v7 handleFailureInFunction:v8, v9, 58, @"Failed to get size of file at path: %@ error: %@", a3, v10 file lineNumber description];
  }
  return [v6 fileSize];
}

- (uint64_t)_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v40 = 0;
  v13 = objc_opt_new();
  v14 = objc_msgSend(a1, "attributesOfItemAtPath:error:", objc_msgSend(a4, "path"), &v40);
  v15 = (void *)[v14 fileType];
  if (!v15) {
    goto LABEL_28;
  }
  v16 = v15;
  char v17 = [v15 isEqualToString:*MEMORY[0x263F080F0]];
  uint64_t v18 = *MEMORY[0x263F080E8];
  if ((v17 & 1) == 0
    && ([v16 isEqualToString:*MEMORY[0x263F080E8]] & 1) == 0
    && ([v16 isEqualToString:*MEMORY[0x263F080E0]] & 1) == 0)
  {
    id v29 = +[TSUAssertionHandler currentHandler];
    uint64_t v30 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) _setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:]"];
    [v29 handleFailureInFunction:v30, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 79, @"Unhandled type: %@", v16 file lineNumber description];
    goto LABEL_28;
  }
  if (([v16 isEqualToString:v18] & 1) != 0
    || [v16 isEqualToString:*MEMORY[0x263F080E0]])
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 0, 0), "URLByAppendingPathComponent:isDirectory:", @"Inbox", 1), "path"), "tsu_stringWithRealpath");
    if (v19
      && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "path"), "tsu_stringWithRealpath"), "tsu_isDescendantOfPath:", v19) & 1) != 0|| a7 && !(*(unsigned int (**)(uint64_t, void *))(a7 + 16))(a7, v14))
    {
      uint64_t v20 = 1;
    }
    else
    {
      uint64_t v20 = objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", a3, objc_msgSend(a4, "path"), &v40);
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  if ([v16 isEqualToString:*MEMORY[0x263F080E0]]) {
    BOOL v21 = a5 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21) {
    goto LABEL_29;
  }
  v22 = (void *)[a1 contentsOfDirectoryAtURL:a4 includingPropertiesForKeys:0 options:0 error:&v40];
  if (!v22)
  {
LABEL_28:
    uint64_t v20 = 0;
    goto LABEL_29;
  }
  v23 = v22;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v24)
  {
    uint64_t v20 = 1;
    goto LABEL_32;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v37 != v26) {
        objc_enumerationMutation(v23);
      }
      uint64_t v28 = [a1 _setAttributes:a3 ofItemAtURL:*(void *)(*((void *)&v36 + 1) + 8 * i) recursively:1 error:&v40 shouldUpdateAttributesHandler:a7];
    }
    uint64_t v20 = v28;
    uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v25);
LABEL_29:
  if ((v20 & 1) == 0 && v40)
  {
    id v31 = v40;
    uint64_t v20 = 0;
  }
LABEL_32:
  [v13 drain];
  if ((v20 & 1) == 0 && v40) {
    id v32 = v40;
  }
  if (a6) {
    char v33 = v20;
  }
  else {
    char v33 = 1;
  }
  if ((v33 & 1) == 0)
  {
    id v34 = v40;
    if (!v40) {
      id v34 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
    }
    *a6 = v34;
  }
  return v20;
}

- (uint64_t)applyFileAttributesFromDocumentAtURL:()SFUtilityAdditions toDocumentAtURL:error:
{
  id v39 = 0;
  if (a5) {
    *a5 = 0;
  }
  uint64_t v8 = (void *)[MEMORY[0x263F08850] defaultManager];
  char v38 = 0;
  if (!a3
    || !a4
    || ((uint64_t v9 = v8, objc_msgSend(v8, "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v38))
      ? (BOOL v10 = v38 == 0)
      : (BOOL v10 = 1),
        v10 || !objc_msgSend(v9, "fileExistsAtPath:isDirectory:", objc_msgSend(a4, "path"), &v38) || !v38))
  {
    id v26 = +[TSUAssertionHandler currentHandler];
    uint64_t v27 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 165, @"Must provide non-nil source and destination document package URLs.");
    if (a5)
    {
      uint64_t v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F07F70];
      uint64_t v30 = 4;
      goto LABEL_33;
    }
    return 0;
  }
  char v11 = objc_msgSend(v9, "enumeratorAtPath:", objc_msgSend(a3, "path"));
  if (!v11
    || (v12 = v11,
        !objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", objc_msgSend(v11, "directoryAttributes"), objc_msgSend(a4, "path"), &v39)))
  {
    id v32 = +[TSUAssertionHandler currentHandler];
    uint64_t v33 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]"];
    uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"];
    [v32 handleFailureInFunction:v33, v34, 178, @"Could not copy top level attributes. %@", v39 file lineNumber description];
    if (a5)
    {
      if (v39)
      {
        id v31 = v39;
        goto LABEL_34;
      }
      uint64_t v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F07F70];
      uint64_t v30 = 512;
LABEL_33:
      id v31 = (id)[v28 errorWithDomain:v29 code:v30 userInfo:0];
LABEL_34:
      uint64_t v15 = 0;
      *a5 = v31;
      return v15;
    }
    return 0;
  }
  uint64_t v13 = [v12 nextObject];
  if (!v13) {
    return 1;
  }
  uint64_t v14 = v13;
  LODWORD(v15) = 1;
  uint64_t v36 = *MEMORY[0x263F07F70];
  long long v37 = v12;
  do
  {
    uint64_t v16 = objc_msgSend((id)objc_msgSend(a4, "path"), "stringByAppendingPathComponent:", v14);
    uint64_t v17 = [v12 fileAttributes];
    if (v17)
    {
      int v18 = [v9 setAttributes:v17 ofItemAtPath:v16 error:&v39];
      int v19 = v18;
      if (a5 && (v18 & 1) == 0 && !*a5)
      {
        if (v39) {
          id v20 = v39;
        }
        else {
          id v20 = (id)[MEMORY[0x263F087E8] errorWithDomain:v36 code:512 userInfo:0];
        }
        *a5 = v20;
      }
      if ((v19 & 1) == 0)
      {
        id v23 = +[TSUAssertionHandler currentHandler];
        uint64_t v24 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]"];
        v12 = v37;
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"];
        [v23 handleFailureInFunction:v24, v25, 202, @"Could not set attributes on item at path: %@ error: %@", v16, v39 file lineNumber description];
      }
      uint64_t v15 = v15 & v19;
    }
    else
    {
      if (a5) {
        *a5 = [MEMORY[0x263F087E8] errorWithDomain:v36 code:256 userInfo:0];
      }
      id v21 = +[TSUAssertionHandler currentHandler];
      uint64_t v22 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]"];
      [v21 handleFailureInFunction:v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 212, @"Could not get file attributes for: %@", objc_msgSend((id)objc_msgSend(a3, "path"), "stringByAppendingPathComponent:", v14) file lineNumber description];
      uint64_t v15 = 0;
      v12 = v37;
    }
    uint64_t v14 = [v12 nextObject];
  }
  while (v14);
  return v15;
}

- (uint64_t)setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:
{
  int v7 = a5;
  uint64_t v9 = [a1 _setAttributes:a3 ofItemAtURL:a4 recursively:a5 error:a6 shouldUpdateAttributesHandler:0];
  uint64_t v10 = v9;
  if (a6 && (v9 & 1) == 0)
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) setAttributes:ofItemAtURL:recursively:error:]"];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"];
    uint64_t v14 = &stru_26D4F03D0;
    if (v7) {
      uint64_t v14 = @" recursively";
    }
    [v11 handleFailureInFunction:v12, v13, 223, @"Failed to%@ change file attributes at %@: %@", v14, a4, *a6 file lineNumber description];
  }
  return v10;
}

- (uint64_t)_changeFileProtectionAtURL:()SFUtilityAdditions fromProtection:toProtection:recursively:error:
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v16 = *MEMORY[0x263F080A8];
  v17[0] = a5;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __110__NSFileManager_SFUtilityAdditions___changeFileProtectionAtURL_fromProtection_toProtection_recursively_error___block_invoke;
  v15[3] = &unk_26462A618;
  v15[4] = a5;
  v15[5] = a4;
  return [a1 _setAttributes:v13 ofItemAtURL:a3 recursively:a6 error:a7 shouldUpdateAttributesHandler:v15];
}

- (uint64_t)changeFileProtectionAtURL:()SFUtilityAdditions fromProtection:toProtection:recursively:error:
{
  if (!a5)
  {
    id v15 = +[TSUAssertionHandler currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 240, @"No file protection specified.");
    if (a3) {
      return 0;
    }
LABEL_9:
    id v17 = +[TSUAssertionHandler currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 241, @"No URL specified.", v19, v20, v21);
    return 0;
  }
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t result = objc_msgSend(a1, "_changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:", a3);
  if (a7 && (result & 1) == 0)
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:]"];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"];
    uint64_t v14 = &stru_26D4F03D0;
    if (a6) {
      uint64_t v14 = @" recursively";
    }
    [v11 handleFailureInFunction:v12, v13, 250, @"Failed to %@ change file protection at %@: %@", v14, a3, *a7 file lineNumber description];
    return 0;
  }
  return result;
}

- (uint64_t)changeFileProtectionAtURL:()SFUtilityAdditions toProtection:recursively:error:
{
  return [a1 changeFileProtectionAtURL:a3 fromProtection:0 toProtection:a4 recursively:a5 error:a6];
}

- (uint64_t)_fileProtection:()SFUtilityAdditions isGreaterThan:
{
  uint64_t v4 = *MEMORY[0x263F080B0];
  if (a3) {
    uint64_t v5 = a3;
  }
  else {
    uint64_t v5 = (void *)*MEMORY[0x263F080B0];
  }
  if (a4) {
    uint64_t v6 = a4;
  }
  else {
    uint64_t v6 = (void *)*MEMORY[0x263F080B0];
  }
  uint64_t v7 = *MEMORY[0x263F08080];
  if ([v5 isEqualToString:*MEMORY[0x263F08080]]
    && ![v6 isEqualToString:v7])
  {
    return 1;
  }
  if ([v5 isEqualToString:v4] & 1) == 0 && (objc_msgSend(v6, "isEqualToString:", v4)) {
    return 1;
  }
  uint64_t result = [v5 isEqualToString:*MEMORY[0x263F08088]];
  if (result)
  {
    uint64_t result = [v6 isEqualToString:*MEMORY[0x263F08098]];
    if (result) {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_fileProtectionAtURL:()SFUtilityAdditions recursively:passesTest:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v24 = 0;
  uint64_t v9 = objc_msgSend(a1, "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v24);
  if ([v24 code] == 260) {
    return 1;
  }
  uint64_t v10 = (void *)[v9 fileType];
  if (!v10) {
    return 1;
  }
  id v11 = v10;
  if ([v10 isEqualToString:*MEMORY[0x263F080E8]]) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(a5, [v9 objectForKey:*MEMORY[0x263F080A8]]);
  }
  if (![v11 isEqualToString:*MEMORY[0x263F080E0]] || a4 == 0) {
    return 1;
  }
  uint64_t v14 = (void *)[a1 contentsOfDirectoryAtURL:a3 includingPropertiesForKeys:0 options:0 error:0];
  if (!v14) {
    return 1;
  }
  id v15 = v14;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (!v16) {
    return 1;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v21;
LABEL_12:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v21 != v18) {
      objc_enumerationMutation(v15);
    }
    uint64_t result = [a1 _fileProtectionAtURL:*(void *)(*((void *)&v20 + 1) + 8 * v19) recursively:1 passesTest:a5];
    if (!result) {
      return result;
    }
    if (v17 == ++v19)
    {
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
      uint64_t result = 1;
      if (v17) {
        goto LABEL_12;
      }
      return result;
    }
  }
}

- (uint64_t)hasAtLeastFileProtection:()SFUtilityAdditions atURL:recursively:
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__NSFileManager_SFUtilityAdditions__hasAtLeastFileProtection_atURL_recursively___block_invoke;
  v6[3] = &unk_26462A640;
  v6[4] = a1;
  v6[5] = a3;
  return [a1 _fileProtectionAtURL:a4 recursively:a5 passesTest:v6];
}

- (uint64_t)hasAtMostFileProtection:()SFUtilityAdditions atURL:recursively:
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__NSFileManager_SFUtilityAdditions__hasAtMostFileProtection_atURL_recursively___block_invoke;
  v6[3] = &unk_26462A640;
  v6[4] = a1;
  v6[5] = a3;
  return [a1 _fileProtectionAtURL:a4 recursively:a5 passesTest:v6];
}

- (uint64_t)_logFileProtectionAtURL:()SFUtilityAdditions recursively:indent:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t result = objc_msgSend((id)objc_msgSend(a1, "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), 0), "fileType");
  if (result)
  {
    uint64_t v10 = (void *)result;
    uint64_t result = [(id)result isEqualToString:*MEMORY[0x263F080E8]];
    if ((result & 1) == 0)
    {
      uint64_t result = [v10 isEqualToString:*MEMORY[0x263F080E0]];
      if (result && a4 != 0)
      {
        uint64_t result = [a1 contentsOfDirectoryAtURL:a3 includingPropertiesForKeys:0 options:0 error:0];
        if (result)
        {
          uint64_t v12 = (void *)result;
          uint64_t v13 = [NSString stringWithFormat:@"%@%@/", a5, objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent")];
          if ([v12 count] != 1) {
            uint64_t v13 = [a5 stringByAppendingString:@"\t"];
          }
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t result = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (result)
          {
            uint64_t v14 = result;
            uint64_t v15 = *(void *)v18;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v18 != v15) {
                  objc_enumerationMutation(v12);
                }
                [a1 _logFileProtectionAtURL:*(void *)(*((void *)&v17 + 1) + 8 * v16++) recursively:1 indent:v13];
              }
              while (v14 != v16);
              uint64_t result = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
              uint64_t v14 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)logFileProtectionAtURL:()SFUtilityAdditions recursively:
{
  return [a1 _logFileProtectionAtURL:a3 recursively:a4 indent:&stru_26D4F03D0];
}

@end