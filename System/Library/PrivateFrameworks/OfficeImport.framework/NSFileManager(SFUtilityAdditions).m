@interface NSFileManager(SFUtilityAdditions)
- (uint64_t)sfu_directoryUsage:()SFUtilityAdditions;
- (uint64_t)sfu_pathUsage:()SFUtilityAdditions;
- (uint64_t)sfu_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:;
- (uint64_t)sfup_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:;
@end

@implementation NSFileManager(SFUtilityAdditions)

- (uint64_t)sfu_directoryUsage:()SFUtilityAdditions
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

- (uint64_t)sfu_pathUsage:()SFUtilityAdditions
{
  char v12 = 0;
  if (![a1 fileExistsAtPath:a3 isDirectory:&v12]) {
    return 0;
  }
  if (v12) {
    return objc_msgSend(a1, "sfu_directoryUsage:", a3);
  }
  id v11 = 0;
  uint64_t v6 = (void *)[a1 attributesOfItemAtPath:a3 error:&v11];
  if (!v6)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) sfu_pathUsage:]"];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/NSFileManager_SFUAdditions.m"];
    uint64_t v9 = [v11 code];
    uint64_t v10 = [v11 domain];
    +[OITSUAssertionHandler handleFailureInFunction:v7, v8, 56, 0, "Failed to get size of file at path: %@ error: %zd %{public}@ %@", a3, v9, v10, v11 file lineNumber isFatal description];
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return [v6 fileSize];
}

- (uint64_t)sfup_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v40 = 0;
  v13 = (void *)MEMORY[0x23EC9A170]();
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
    uint64_t v29 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) sfup_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/NSFileManager_SFUAdditions.m"], 76, 0, "Unhandled type: %@", v16);
    +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_28:
    uint64_t v20 = 0;
    goto LABEL_29;
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
  if (!v22) {
    goto LABEL_28;
  }
  v23 = v22;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v24)
  {
    return 1;
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
      uint64_t v28 = objc_msgSend(a1, "sfup_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:", a3, *(void *)(*((void *)&v36 + 1) + 8 * i), 1, &v40, a7);
    }
    uint64_t v20 = v28;
    uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v25);
LABEL_29:
  if ((v20 & 1) == 0 && v40) {
    id v30 = v40;
  }
  if (v40) {
    char v31 = v20;
  }
  else {
    char v31 = 1;
  }
  if ((v31 & 1) == 0) {
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
      id v34 = (id)objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
    }
    uint64_t v20 = 0;
    *a6 = v34;
  }
  return v20;
}

- (uint64_t)sfu_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:
{
  int v7 = a5;
  uint64_t v9 = objc_msgSend(a1, "sfup_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:", a3, a4, a5, a6, 0);
  uint64_t v10 = v9;
  if (a6 && (v9 & 1) == 0 && (objc_msgSend(*a6, "tsu_isNoSuchFileError") & 1) == 0)
  {
    uint64_t v11 = [NSString stringWithUTF8String:"-[NSFileManager(SFUtilityAdditions) sfu_setAttributes:ofItemAtURL:recursively:error:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/NSFileManager_SFUAdditions.m"];
    if (v7) {
      v13 = @" recursively";
    }
    else {
      v13 = &stru_26EBF24D8;
    }
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 131, 0, "Failed to%{public}@ change file attributes at %@: %zd %{public}@ %@", v13, a4, [*a6 code], objc_msgSend(*a6, "domain"), *a6);
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return v10;
}

@end