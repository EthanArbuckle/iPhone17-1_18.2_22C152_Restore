@interface NSURL
@end

@implementation NSURL

void __51__NSURL_UIDocumentPicker__ui_cloudDocsContainerURL__block_invoke()
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v0 = (void *)qword_1EB2602A0;
  uint64_t v20 = qword_1EB2602A0;
  if (!qword_1EB2602A0)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getBRContainerClass_block_invoke;
    v15 = &unk_1E52D9900;
    v16 = &v17;
    __getBRContainerClass_block_invoke((uint64_t)&v12);
    v0 = (void *)v18[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v17, 8);
  v2 = [v1 allContainersByContainerID];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v3 = (void *)qword_1EB2602A8;
  uint64_t v20 = qword_1EB2602A8;
  if (!qword_1EB2602A8)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getBRUbiquitousDefaultContainerIDSymbolLoc_block_invoke;
    v15 = &unk_1E52D9900;
    v16 = &v17;
    v4 = CloudDocsLibrary();
    v5 = dlsym(v4, "BRUbiquitousDefaultContainerID");
    *(void *)(v16[1] + 24) = v5;
    qword_1EB2602A8 = *(void *)(v16[1] + 24);
    v3 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v3)
  {
    v6 = [v2 objectForKey:*v3];

    v7 = [v6 documentsURL];
    uint64_t v8 = [v7 copy];
    v9 = (void *)_MergedGlobals_1017;
    _MergedGlobals_1017 = v8;
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"NSString *getBRUbiquitousDefaultContainerID(void)"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"NSURL+UIDocumentPicker.m", 33, @"%s", dlerror());

    __break(1u);
  }
}

void __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v4 = [*(id *)(a1 + 32) path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__66;
    v18 = __Block_byref_object_dispose__66;
    id v19 = 0;
    uint64_t v6 = *(void *)(a1 + 32);
    id obj = 0;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke_25;
    v10 = &unk_1E52EB2D8;
    id v11 = v3;
    uint64_t v12 = &v14;
    [v2 coordinateWritingItemAtURL:v6 options:1 error:&obj byAccessor:&v7];
    objc_storeStrong(&v19, obj);
    if (v15[5]) {
      NSLog(&cfstr_FailedToCleanU.isa, v15[5], v7, v8, v9, v10);
    }

    _Block_object_dispose(&v14, 8);
  }
}

void __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke_25(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  [v2 removeItemAtURL:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

@end