@interface SPCorrectionHandler
+ (id)sharedHandler;
- (BOOL)sanityCheckFile:(__sFILE *)a3;
- (NSDictionary)lastCommittedVersions;
- (NSLock)correctionRefsLock;
- (NSURL)versionInfoLocation;
- (SPCorrectionHandler)init;
- (__CFDictionary)correctionRefs;
- (id)getCorrections:(id)a3 forLanguage:(id)a4 version:(id *)a5;
- (id)readCommittedVersions;
- (id)versionForLanguage:(id)a3;
- (int)dictDirFd;
- (void)commitDictionary:(void *)a3 language:(id)a4 version:(id)a5;
- (void)dealloc;
- (void)openCorrectionRef:(id)a3 language:(id)a4 create:(BOOL)a5;
- (void)processCorrectionsWithHandle:(id)a3;
- (void)readCommittedVersions;
- (void)revokeUnusedFiles;
- (void)setCorrectionRefs:(__CFDictionary *)a3;
- (void)setCorrectionRefsLock:(id)a3;
- (void)setDictDirFd:(int)a3;
- (void)setLastCommittedVersions:(id)a3;
- (void)setVersionInfoLocation:(id)a3;
- (void)updateWithFileHandle:(id)a3;
- (void)updateWithFilePath:(id)a3;
- (void)writeCommittedVersions:(id)a3;
@end

@implementation SPCorrectionHandler

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1) {
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedHandler_handler;
  return v2;
}

uint64_t __36__SPCorrectionHandler_sharedHandler__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedHandler_handler;
  sharedHandler_handler = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SPCorrectionHandler)init
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SPCorrectionHandler;
  v2 = [(SPCorrectionHandler *)&v15 init];
  if (v2)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v17 = 0u;
    CFURLRef v3 = CFCopyHomeDirectoryURL();
    CFStringRef v4 = CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v4);
    CFStringAppend(MutableCopy, @"/Library/Spotlight/Corrections");
    CFStringGetFileSystemRepresentation(MutableCopy, buffer, 256);
    memset(&v14, 0, sizeof(v14));
    if (stat(buffer, &v14)) {
      mkdir(buffer, 0x1FFu);
    }
    [(SPCorrectionHandler *)v2 setDictDirFd:open(buffer, 0x100000)];
    v6 = NSURL;
    v7 = [NSString stringWithCString:buffer encoding:1];
    v8 = [v7 stringByAppendingString:@"/correction_version.txt"];
    v9 = [v6 URLWithString:v8];
    [(SPCorrectionHandler *)v2 setVersionInfoLocation:v9];

    CFDictionaryValueCallBacks v13 = *(CFDictionaryValueCallBacks *)byte_26D0BCC78;
    [(SPCorrectionHandler *)v2 setCorrectionRefs:CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], &v13)];
    v10 = objc_opt_new();
    [(SPCorrectionHandler *)v2 setCorrectionRefsLock:v10];

    v11 = [(SPCorrectionHandler *)v2 readCommittedVersions];
    [(SPCorrectionHandler *)v2 setLastCommittedVersions:v11];

    CFRelease(v4);
    CFRelease(v3);
    CFRelease(MutableCopy);
  }
  return v2;
}

- (void)dealloc
{
  close([(SPCorrectionHandler *)self dictDirFd]);
  v3.receiver = self;
  v3.super_class = (Class)SPCorrectionHandler;
  [(SPCorrectionHandler *)&v3 dealloc];
}

- (id)versionForLanguage:(id)a3
{
  id v4 = a3;
  v5 = [(SPCorrectionHandler *)self lastCommittedVersions];
  v6 = [v5 valueForKey:v4];

  return v6;
}

- (id)getCorrections:(id)a3 forLanguage:(id)a4 version:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(SPCorrectionHandler *)self lastCommittedVersions];

  if (v10)
  {
    v11 = [(SPCorrectionHandler *)self lastCommittedVersions];
    v12 = [v11 valueForKey:v9];

    if (v12)
    {
      CFDictionaryValueCallBacks v13 = [(SPCorrectionHandler *)self correctionRefsLock];
      [v13 lock];

      [(SPCorrectionHandler *)self openCorrectionRef:v12 language:v9 create:0];
      stat v14 = (void *)SICopyCorrections();
      *a5 = v12;
      objc_super v15 = [(SPCorrectionHandler *)self correctionRefsLock];
      [v15 unlock];
    }
    else
    {
      stat v14 = 0;
    }
  }
  else
  {
    stat v14 = 0;
  }

  return v14;
}

- (void)updateWithFilePath:(id)a3
{
  id v4 = [MEMORY[0x263F08840] fileHandleForReadingAtPath:a3];
  [(SPCorrectionHandler *)self updateWithFileHandle:v4];
}

- (void)updateWithFileHandle:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_INFO, "Processing corrections begin", buf, 2u);
  }

  [(SPCorrectionHandler *)v5 processCorrectionsWithHandle:v4];
  v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "Processing corrections complete", v8, 2u);
  }

  objc_sync_exit(v5);
}

- (BOOL)sanityCheckFile:(__sFILE *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3)
  {
    bzero(__ptr, 0x400uLL);
    if (fread(__ptr, 1uLL, 0x400uLL, a3))
    {
      id v4 = [NSString stringWithCString:__ptr encoding:1];
      rewind(a3);
      char v5 = [v4 containsString:@"\n"];
    }
    else
    {
      id v4 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[SPCorrectionHandler sanityCheckFile:](v4);
      }
      char v5 = 0;
    }
  }
  else
  {
    v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SPCorrectionHandler sanityCheckFile:](v6);
    }

    return 0;
  }
  return v5;
}

- (void)processCorrectionsWithHandle:(id)a3
{
  id v4 = a3;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__1;
  long long v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  char v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [v5 languageCode];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke;
  long long v17 = &unk_264509A10;
  long long v20 = &v30;
  long long v18 = self;
  long long v21 = &v36;
  long long v22 = &v24;
  id v7 = v6;
  id v19 = v7;
  long long v23 = v40;
  id v8 = &v14;
  int v9 = objc_msgSend(v4, "fileDescriptor", v14, v15);
  int v10 = v9;
  if (v9 != -1)
  {
    memset(&v42, 0, sizeof(v42));
    fstat(v9, &v42);
    off_t st_size = v42.st_size;
    v12 = mmap(0, v42.st_size, 1, 1, v10, 0);
    CFDictionaryValueCallBacks v13 = v12;
    if (v12 != (void *)-1)
    {
      madvise(v12, st_size, 2);
      ((void (*)(uint64_t *, void *, off_t))v16)(v8, v13, st_size);
      munmap(v13, st_size);
    }
  }

  if (v37[3])
  {
    if (v25[5] && v31[5]) {
      -[SPCorrectionHandler commitDictionary:language:version:](self, "commitDictionary:language:version:");
    }
    SICorrectionDestory();
  }
  [(SPCorrectionHandler *)self revokeUnusedFiles];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);
}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v5 = v0;
  v48[3] = *MEMORY[0x263EF8340];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_2;
  v26[3] = &unk_264509998;
  v26[4] = *(void *)(v0 + 48);
  v6 = (void *)MEMORY[0x223C48320](v26);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  long long v7 = *(_OWORD *)(v5 + 56);
  v23[2] = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_3;
  v23[3] = &unk_2645099C0;
  v23[4] = *(void *)(v5 + 32);
  long long v25 = v7;
  long long v21 = *(_OWORD *)(v5 + 40);
  id v8 = (id)v21;
  long long v24 = v21;
  int v9 = (void *)MEMORY[0x223C48320](v23);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_4;
  v22[3] = &unk_2645099E8;
  v22[4] = *(void *)(v5 + 56);
  int v10 = (void *)MEMORY[0x223C48320](v22);
  id v11 = v6;
  id v12 = v9;
  id v13 = v10;
  memset(v48, 0, 24);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  int v46 = -1;
  bzero(v47, 0x6000uLL);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = v47;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3810000000;
  v42[3] = &unk_21F280F91;
  v42[5] = 0;
  v42[6] = 0;
  v42[4] = 1;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __si_process_corrections_block_invoke;
  v28[3] = &unk_264509A38;
  uint64_t v32 = v45;
  v33 = v43;
  id v14 = v13;
  id v29 = v14;
  v34 = v42;
  id v35 = v44;
  uint64_t v36 = v48;
  v37 = "";
  uint64_t v38 = "q";
  uint64_t v39 = "c";
  v40 = "version";
  char v41 = "language";
  id v15 = v12;
  id v30 = v15;
  id v16 = v11;
  id v31 = v16;
  long long v17 = (void *)MEMORY[0x223C48320](v28);
  unint64_t v18 = v4 + v2;
  do
  {
    unint64_t v19 = v4;
    if (v4 >= v18) {
      break;
    }
    uint64_t v27 = 0;
    char v20 = json_parse();
    v4 += v27;
  }
  while ((v20 & 1) != 0);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v45, 8);

  *(unsigned char *)(*(void *)(*(void *)(v5 + 72) + 8) + 24) = v19 >= v18;
}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  json_utf8_string(a2, v8, 0x100uLL);
  uint64_t v5 = [NSString stringWithUTF8String:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a3 = 1;
  }
}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    memset(v12, 0, sizeof(v12));
    json_utf8_string(a2, v12, 0x100uLL);
    uint64_t v5 = [NSString stringWithUTF8String:v12];
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v7 = [*(id *)(a1 + 32) lastCommittedVersions];
    id v8 = [v7 valueForKey:v5];
    char v9 = [v6 isEqualToString:v8];

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if ((v9 & 1) == 0 && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        objc_msgSend(*(id *)(a1 + 32), "commitDictionary:language:version:");
      }
      SICorrectionDestory();
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
      if ([*(id *)(a1 + 40) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])
      {
        int v10 = [*(id *)(a1 + 32) correctionRefsLock];
        [v10 lock];

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) openCorrectionRef:*(void *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 40) language:*(void *)(*(void *)(*(void *)(a1 + 64)+ 8)+ 40) create:1];
        id v11 = [*(id *)(a1 + 32) correctionRefsLock];
        [v11 unlock];

        if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          if ([*(id *)(a1 + 40) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])*a3 = 1; {
        }
          }
      }
    }
  }
  else
  {
    *a3 = 1;
  }
}

void __52__SPCorrectionHandler_processCorrectionsWithHandle___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  bzero(v12, 0x400uLL);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v8 = (void *)MEMORY[0x223C480D0]();
    json_utf8_string(a2, v12, 0x400uLL);
    char v9 = [NSString stringWithUTF8String:v12];
    if ([v9 length])
    {
      for (i = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
      {
        json_utf8_string(a3, v12, 0x400uLL);
        id v11 = [NSString stringWithUTF8String:v12];
        if ([v11 length]) {
          [i addObject:v11];
        }

        a3 += 24;
      }
      if ([i count]) {
        SIAddCorrection();
      }
    }
  }
}

- (void)openCorrectionRef:(id)a3 language:(id)a4 create:(BOOL)a5
{
  id v8 = a3;
  char v9 = [NSString stringWithFormat:@"%@:%@:", v8, a4];
  Value = CFDictionaryGetValue([(SPCorrectionHandler *)self correctionRefs], v9);
  if (Value
    || ([(SPCorrectionHandler *)self dictDirFd], (Value = (const void *)SICorrectionCreate()) != 0))
  {
    if (!a5) {
LABEL_4:
    }
      CFDictionaryAddValue([(SPCorrectionHandler *)self correctionRefs], v9, Value);
  }
  else
  {
    id v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SPCorrectionHandler openCorrectionRef:language:create:]((uint64_t)v8, v12);
    }

    Value = 0;
    if (!a5) {
      goto LABEL_4;
    }
  }

  return (void *)Value;
}

- (id)readCommittedVersions
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v3 = objc_opt_new();
  unint64_t v4 = NSString;
  uint64_t v5 = [(SPCorrectionHandler *)self versionInfoLocation];
  uint64_t v6 = [v5 path];
  id v25 = 0;
  long long v7 = [v4 stringWithContentsOfFile:v6 encoding:1 error:&v25];
  id v8 = v25;

  if (v8)
  {
    char v9 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(SPCorrectionHandler *)self readCommittedVersions];
    }
    id v10 = 0;
  }
  else
  {
    char v20 = v7;
    char v9 = [v7 componentsSeparatedByString:@"\n"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v15 length])
          {
            id v16 = [v15 componentsSeparatedByString:@":"];
            long long v17 = [v16 lastObject];
            unint64_t v18 = [v16 firstObject];
            [v3 setValue:v17 forKey:v18];
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }
    id v10 = v3;
    long long v7 = v20;
  }

  return v10;
}

- (void)writeCommittedVersions:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x263F089D8];
  id v5 = a3;
  uint64_t v6 = [v4 string];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__SPCorrectionHandler_writeCommittedVersions___block_invoke;
  v13[3] = &unk_264508D58;
  id v7 = v6;
  id v14 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];

  id v8 = [(SPCorrectionHandler *)self versionInfoLocation];
  char v9 = [v8 path];
  id v12 = 0;
  [v7 writeToFile:v9 atomically:1 encoding:1 error:&v12];
  id v10 = v12;

  if (v10)
  {
    uint64_t v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SPCorrectionHandler writeCommittedVersions:]((uint64_t)v10, v11);
    }
  }
}

uint64_t __46__SPCorrectionHandler_writeCommittedVersions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@:%@\n", a2, a3];
}

- (void)commitDictionary:(void *)a3 language:(id)a4 version:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SPCorrectionHandler *)self readCommittedVersions];
  if (!v8) {
    id v8 = objc_opt_new();
  }
  [v8 setValue:v7 forKey:v9];
  SICorrectionCommit();
  [(SPCorrectionHandler *)self writeCommittedVersions:v8];
}

- (void)revokeUnusedFiles
{
  uint64_t v2 = self;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v29 = [(SPCorrectionHandler *)self readCommittedVersions];
  unint64_t v3 = [(SPCorrectionHandler *)v2 correctionRefsLock];
  [v3 lock];

  memset(buffer, 0, sizeof(buffer));
  fcntl([(SPCorrectionHandler *)v2 dictDirFd], 50, buffer);
  CFStringRef v4 = CFStringCreateWithFileSystemRepresentation(0, (const char *)buffer);
  id v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [NSURL URLWithString:v4];
  uint64_t v7 = *MEMORY[0x263EFF750];
  uint64_t v39 = *MEMORY[0x263EFF750];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
  id v30 = v5;
  id v9 = [v5 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v8 options:0 error:0];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v9;
  uint64_t v32 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v32)
  {
    CFStringRef v27 = v4;
    uint64_t v28 = v7;
    id v11 = 0;
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v11;
      do
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        id v33 = 0;
        [v14 getResourceValue:&v33 forKey:v7 error:0];
        id v11 = v33;

        id v15 = [(SPCorrectionHandler *)v2 versionInfoLocation];
        id v16 = [v15 path];
        long long v17 = [v16 lastPathComponent];
        char v18 = [v11 isEqualToString:v17];

        if ((v18 & 1) == 0)
        {
          unint64_t v19 = [v11 componentsSeparatedByString:@":"];
          if ((unint64_t)[v19 count] > 2)
          {
            id v20 = v10;
            long long v21 = v2;
            long long v22 = [v19 firstObject];
            long long v23 = [v19 objectAtIndex:1];
            long long v24 = [v29 valueForKey:v23];
            char v25 = [v22 isEqualToString:v24];

            if ((v25 & 1) == 0) {
              [v30 removeItemAtURL:v14 error:0];
            }

            uint64_t v2 = v21;
            id v10 = v20;
            uint64_t v7 = v28;
          }
          else
          {
            [v30 removeItemAtURL:v14 error:0];
          }
        }
        ++v12;
        uint64_t v13 = v11;
      }
      while (v32 != v12);
      uint64_t v32 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v32);

    CFStringRef v4 = v27;
  }

  CFRelease(v4);
  CFDictionaryRemoveAllValues([(SPCorrectionHandler *)v2 correctionRefs]);
  [(SPCorrectionHandler *)v2 setLastCommittedVersions:v29];
  uint64_t v26 = [(SPCorrectionHandler *)v2 correctionRefsLock];
  [v26 unlock];
}

- (NSDictionary)lastCommittedVersions
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastCommittedVersions:(id)a3
{
}

- (int)dictDirFd
{
  return self->_dictDirFd;
}

- (void)setDictDirFd:(int)a3
{
  self->_dictDirFd = a3;
}

- (NSURL)versionInfoLocation
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVersionInfoLocation:(id)a3
{
}

- (NSLock)correctionRefsLock
{
  return (NSLock *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCorrectionRefsLock:(id)a3
{
}

- (__CFDictionary)correctionRefs
{
  return self->_correctionRefs;
}

- (void)setCorrectionRefs:(__CFDictionary *)a3
{
  self->_correctionRefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionRefsLock, 0);
  objc_storeStrong((id *)&self->_versionInfoLocation, 0);
  objc_storeStrong((id *)&self->_lastCommittedVersions, 0);
}

- (void)sanityCheckFile:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21F1CE000, log, OS_LOG_TYPE_ERROR, "error downloading corrections file", v1, 2u);
}

- (void)sanityCheckFile:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21F1CE000, log, OS_LOG_TYPE_ERROR, "error corrections could not fread", v1, 2u);
}

- (void)openCorrectionRef:(uint64_t)a1 language:(NSObject *)a2 create:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "err creating dict version: %@", (uint8_t *)&v2, 0xCu);
}

- (void)readCommittedVersions
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 versionInfoLocation];
  uint64_t v4 = [v3 path];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "could not read version info %@", (uint8_t *)&v5, 0xCu);
}

- (void)writeCommittedVersions:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "err write version info %@", (uint8_t *)&v2, 0xCu);
}

@end