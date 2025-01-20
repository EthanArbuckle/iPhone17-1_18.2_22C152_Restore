@interface TSUZipFileWriter
+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7;
+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6;
- (TSUZipFileWriter)initWithURL:(id)a3 error:(id *)a4;
- (TSUZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (TSUZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4;
- (TSUZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3;
- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4;
@end

@implementation TSUZipFileWriter

- (TSUZipFileWriter)initWithURL:(id)a3 error:(id *)a4
{
  return [(TSUZipFileWriter *)self initWithURL:a3 options:0 error:a4];
}

- (TSUZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TSUZipFileWriter;
  v9 = [(TSUZipWriter *)&v21 initWithOptions:a4];
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = [TSUFileIOChannel alloc];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __46__TSUZipFileWriter_initWithURL_options_error___block_invoke;
    v18 = &unk_264D619E0;
    objc_copyWeak(&v19, &location);
    uint64_t v11 = [(TSUFileIOChannel *)v10 initForRandomWritingURL:v8 error:a5 cleanupHandler:&v15];
    writeChannel = v9->_writeChannel;
    v9->_writeChannel = (TSURandomWriteChannel *)v11;

    v13 = v9->_writeChannel;
    if (v13)
    {
      -[TSURandomWriteChannel setLowWater:](v13, "setLowWater:", -1, v15, v16, v17, v18);
    }
    else
    {

      v9 = 0;
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __46__TSUZipFileWriter_initWithURL_options_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[22];
    v5 = v2;
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v2 = v5;
      v4 = (void *)v5[22];
    }
    else
    {
      v4 = 0;
    }
    v2[22] = 0;

    v2 = v5;
  }
}

- (TSUZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4
{
  return [(TSUZipFileWriter *)self initWithZipFileArchive:a3 options:0 error:a4];
}

- (TSUZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [v8 URL];
  uint64_t v35 = 0;
  v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__13;
  v39 = __Block_byref_object_dispose__13;
  id v40 = 0;
  v34.receiver = self;
  v34.super_class = (Class)TSUZipFileWriter;
  v10 = [(TSUZipWriter *)&v34 initWithOptions:a4];
  if (!v10)
  {
    uint64_t v11 = 0;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke;
  v32[3] = &unk_264D61A08;
  uint64_t v11 = v10;
  v33 = v11;
  [v8 enumerateEntriesUsingBlock:v32];
  if ([v8 endOfLastEntry] <= 0)
  {
    v12 = [NSString stringWithUTF8String:"-[TSUZipFileWriter initWithZipFileArchive:options:error:]"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:69 isFatal:0 description:"Unexpected offset"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  -[TSUZipWriter setEntryInsertionOffset:](v11, "setEntryInsertionOffset:", [v8 endOfLastEntry]);
  objc_initWeak(&location, v11);
  v14 = [TSUFileIOChannel alloc];
  uint64_t v15 = v36;
  id obj = v36[5];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_2;
  v28[3] = &unk_264D619E0;
  objc_copyWeak(&v29, &location);
  uint64_t v16 = [(TSUFileIOChannel *)v14 initForRandomReadingWritingURL:v9 error:&obj cleanupHandler:v28];
  objc_storeStrong(v15 + 5, obj);
  writeChannel = v11->_writeChannel;
  v11->_writeChannel = (TSURandomWriteChannel *)v16;

  v18 = v11->_writeChannel;
  if (v18)
  {
    [(TSURandomWriteChannel *)v18 setLowWater:-1];
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v20 = v11->_writeChannel;
    uint64_t v21 = [v8 endOfLastEntry];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_3;
    v25[3] = &unk_264D61A30;
    v27 = &v35;
    v22 = v19;
    v26 = v22;
    [(TSURandomWriteChannel *)v20 truncateToLength:v21 completion:v25];
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v36[5])
  {

    uint64_t v11 = 0;
  }
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  if (a5) {
LABEL_9:
  }
    *a5 = v36[5];
LABEL_10:
  v23 = v11;
  _Block_object_dispose(&v35, 8);

  return v23;
}

uint64_t __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addExistingEntry:");
}

void __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[22];
    v5 = v2;
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v2 = v5;
      v4 = (void *)v5[22];
    }
    else
    {
      v4 = 0;
    }
    v2[22] = 0;

    v2 = v5;
  }
}

void __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, id))a6;
  if ([v10 isClosed])
  {
    id v30 = 0;
    v13 = [[TSUZipFileArchive alloc] initWithWriter:v10 forReadingFromURL:v11 options:a5 error:&v30];
    id v14 = v30;
    uint64_t v15 = v14;
    if (v13)
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v29 = 0;
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[TSUZipArchive entriesCount](v13, "entriesCount"));
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __90__TSUZipFileWriter_copyEntriesFromZipFileWriter_readingFromURL_options_completionHandler___block_invoke;
      v23[3] = &unk_264D61A58;
      id v17 = v16;
      id v24 = v17;
      v25 = &v26;
      [(TSUZipArchive *)v13 enumerateEntriesUsingBlock:v23];
      [v17 sortUsingComparator:&__block_literal_global_28];
      v18 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:v27[3]];
      [(TSUZipFileWriter *)self copyRemainingEntries:v17 fromArchive:v13 progress:v18 completionHandler:v12];

      _Block_object_dispose(&v26, 8);
    }
    else if (v12)
    {
      if (v14)
      {
        v12[2](v12, v14);
      }
      else
      {
        v22 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
        v12[2](v12, v22);
      }
    }
  }
  else
  {
    dispatch_semaphore_t v19 = [NSString stringWithUTF8String:"-[TSUZipFileWriter copyEntriesFromZipFileWriter:readingFromURL:options:completionHandler:]"];
    v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:112 isFatal:0 description:"Closed writer must be closed."];

    +[OITSUAssertionHandler logBacktraceThrottled];
    if (v12)
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
      v12[2](v12, v21);
    }
  }
}

void __90__TSUZipFileWriter_copyEntriesFromZipFileWriter_readingFromURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 addObject:v5];
  uint64_t v6 = [v5 size];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6;
}

uint64_t __90__TSUZipFileWriter_copyEntriesFromZipFileWriter_readingFromURL_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 offset];
  unint64_t v6 = [v4 offset];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 firstObject];
  if (v14)
  {
    [v10 removeObjectAtIndex:0];
    uint64_t v15 = [v11 streamReadChannelForEntry:v14];
    if (v15)
    {
      uint64_t v16 = [v14 name];
      id v17 = [v14 lastModificationDate];
      uint64_t v22 = [v14 size];
      unsigned int v21 = [v14 CRC];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __80__TSUZipFileWriter_copyRemainingEntries_fromArchive_progress_completionHandler___block_invoke;
      v23[3] = &unk_264D61AA0;
      id v29 = v13;
      id v24 = v12;
      id v25 = v14;
      uint64_t v26 = self;
      id v27 = v10;
      id v28 = v11;
      [(TSUZipWriter *)self writeEntryWithName:v16 force32BitSize:0 lastModificationDate:v17 size:v22 CRC:v21 fromReadChannel:v15 completion:v23];
    }
    else
    {
      v18 = [NSString stringWithUTF8String:"-[TSUZipFileWriter copyRemainingEntries:fromArchive:progress:completionHandler:]"];
      dispatch_semaphore_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 156, 0, "invalid nil value for '%{public}s'", "channel");

      +[OITSUAssertionHandler logBacktraceThrottled];
      if (v13)
      {
        v20 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
        (*((void (**)(id, void *))v13 + 2))(v13, v20);
      }
    }
  }
  else if (v13)
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __80__TSUZipFileWriter_copyRemainingEntries_fromArchive_progress_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + objc_msgSend(*(id *)(a1 + 40), "size"));
    uint64_t v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    [v3 copyRemainingEntries:v4 fromArchive:v6 progress:v5 completionHandler:v7];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 72);
    if (v8)
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
    }
  }
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_writeChannelCompletionHandler)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSUZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 177, 0, "expected nil value for '%{public}s'", "_writeChannelCompletionHandler");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v7 = (void *)[v4 copy];
  id writeChannelCompletionHandler = self->_writeChannelCompletionHandler;
  self->_id writeChannelCompletionHandler = v7;

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    id v10 = [NSString stringWithUTF8String:"-[TSUZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]"];
    id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 180, 0, "invalid nil value for '%{public}s'", "_writeChannel");

    +[OITSUAssertionHandler logBacktraceThrottled];
    writeChannel = self->_writeChannel;
  }
  id v12 = writeChannel;

  return v12;
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke;
  v12[3] = &unk_264D61AC8;
  id v13 = v10;
  id v11 = v10;
  [a1 zipDirectoryAtURL:a3 customDirectoryFilename:0 toURL:a4 queue:a5 progressHandler:v12];
}

uint64_t __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = a5;
  uint64_t v8 = v7;
  if (a2)
  {
    uint64_t v7 = *(uint64_t (***)(id, BOOL))(a1 + 32);
    if (v7) {
      uint64_t v7 = (uint64_t (**)(id, BOOL))v7[2](v7, v8 == 0);
    }
  }
  return MEMORY[0x270F9A790](v7);
}

+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7
{
  v115[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v72 = a4;
  id v12 = a5;
  queue = a6;
  id v74 = a7;
  v66 = v11;
  v67 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    id v13 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"];
    id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 199, 0, "invalid nil value for '%{public}s'", "directoryURL");

    +[OITSUAssertionHandler logBacktraceThrottled];
    if (v67) {
      goto LABEL_6;
    }
  }
  uint64_t v15 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"];
  uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 200, 0, "invalid nil value for '%{public}s'", "URL");

  +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_6:
  if (!queue)
  {
    id v17 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"];
    v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 201, 0, "invalid nil value for '%{public}s'", "queue");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (!v74)
  {
    dispatch_semaphore_t v19 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"];
    v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 202, 0, "invalid nil value for '%{public}s'", "progressHandler");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  id v112 = 0;
  v73 = [[TSUZipFileWriter alloc] initWithURL:v67 error:&v112];
  id v21 = v112;
  v65 = v21;
  if (v73)
  {
    uint64_t v22 = [v11 path];
    v23 = v22;
    if (!v72)
    {
      uint64_t v24 = [v22 stringByDeletingLastPathComponent];

      v23 = (void *)v24;
    }
    id v25 = [v23 stringByStandardizingPath];
    v64 = [v25 precomposedStringWithCanonicalMapping];

    uint64_t v70 = [v64 length];
    uint64_t v26 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v27 = *MEMORY[0x263EFF6A8];
    uint64_t v28 = *MEMORY[0x263EFF688];
    v115[0] = *MEMORY[0x263EFF6A8];
    v115[1] = v28;
    uint64_t v77 = v28;
    id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:2];
    id v30 = [v26 enumeratorAtURL:v11 includingPropertiesForKeys:v29 options:0 errorHandler:0];

    v108[0] = 0;
    v108[1] = v108;
    v108[2] = 0x2020000000;
    v108[3] = 0;
    id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id obj = v30;
    uint64_t v31 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
    if (v31)
    {
      uint64_t v78 = 0;
      uint64_t v32 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v105 != v32) {
            objc_enumerationMutation(obj);
          }
          objc_super v34 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          id v103 = 0;
          int v35 = [v34 getResourceValue:&v103 forKey:v27 error:0];
          id v36 = v103;
          uint64_t v37 = v36;
          if (v35)
          {
            if (([v36 BOOLValue] & 1) == 0)
            {
              id v102 = 0;
              int v38 = [v34 getResourceValue:&v102 forKey:v77 error:0];
              id v39 = v102;
              id v40 = v39;
              if (v38) {
                v78 += [v39 unsignedLongLongValue];
              }
              [v75 addObject:v34];
            }
          }
          else
          {
            v41 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]"];
            v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m"];
            +[OITSUAssertionHandler handleFailureInFunction:v41, v42, 239, 0, "Failed to obtain resource value for %@", v34 file lineNumber isFatal description];

            +[OITSUAssertionHandler logBacktraceThrottled];
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
      }
      while (v31);
    }
    else
    {
      uint64_t v78 = 0;
    }

    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__13;
    v100 = __Block_byref_object_dispose__13;
    id v101 = 0;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v69 = v75;
    uint64_t v45 = [v69 countByEnumeratingWithState:&v92 objects:v113 count:16];
    if (v45)
    {
      uint64_t v46 = v70 + 1;
      uint64_t v76 = *(void *)v93;
      uint64_t v71 = *MEMORY[0x263EFF5F8];
      while (2)
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v93 != v76) {
            objc_enumerationMutation(v69);
          }
          v48 = *(void **)(*((void *)&v92 + 1) + 8 * j);
          v49 = [v48 path];
          v50 = [v49 stringByStandardizingPath];
          v51 = [v50 precomposedStringWithCanonicalMapping];

          v52 = [v51 substringFromIndex:v46];
          if (v72)
          {
            uint64_t v53 = [v72 stringByAppendingPathComponent:v52];

            v52 = (void *)v53;
          }
          v54 = [TSUFileIOChannel alloc];
          v55 = (id *)(v97 + 5);
          id v91 = (id)v97[5];
          id v56 = [(TSUFileIOChannel *)v54 initForReadingURL:v48 error:&v91];
          objc_storeStrong(v55, v91);
          if (!v56)
          {

            goto LABEL_45;
          }
          id v90 = 0;
          char v57 = [v48 getResourceValue:&v90 forKey:v77 error:0];
          id v58 = v90;
          v59 = v58;
          if ((v57 & 1) == 0)
          {

            v59 = 0;
          }
          id v89 = 0;
          char v60 = [v48 getResourceValue:&v89 forKey:v71 error:0];
          id v61 = v89;
          v62 = v61;
          if ((v60 & 1) == 0)
          {

            v62 = 0;
          }
          uint64_t v63 = [v59 unsignedLongLongValue];
          v84[0] = MEMORY[0x263EF8330];
          v84[1] = 3221225472;
          v84[2] = __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_2;
          v84[3] = &unk_264D61AF0;
          v86 = v108;
          id v85 = v74;
          v87 = &v96;
          uint64_t v88 = v78;
          [(TSUZipWriter *)v73 writeEntryWithName:v52 force32BitSize:0 lastModificationDate:v62 size:v63 CRC:0 fromReadChannel:v56 writeHandler:v84];
        }
        uint64_t v45 = [v69 countByEnumeratingWithState:&v92 objects:v113 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }
LABEL_45:

    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_3;
    v80[3] = &unk_264D61B18;
    id v81 = v74;
    v82 = &v96;
    uint64_t v83 = v78;
    [(TSUZipWriter *)v73 closeWithQueue:queue completion:v80];

    _Block_object_dispose(&v96, 8);
    _Block_object_dispose(v108, 8);

    v44 = v64;
  }
  else
  {
    v43 = v21;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke;
    block[3] = &unk_264D616F8;
    id v111 = v74;
    id v110 = v43;
    dispatch_async(queue, block);

    v44 = v111;
  }
}

uint64_t __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke(uint64_t a1)
{
  char v2 = 0;
  return (*(uint64_t (**)(void, uint64_t, void, void, void, char *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, 0, *(void *)(a1 + 32), &v2);
}

void __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_2(void *a1, uint64_t a2, NSObject *a3, void *a4, unsigned char *a5)
{
  id v12 = a4;
  if (a3) {
    *(void *)(*(void *)(a1[5] + 8) + 24) += dispatch_data_get_size(a3);
  }
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v8 = v12;
  if (!v12 && *a5)
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void *)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    if (!v11)
    {
      id v13 = v8;
      objc_storeStrong(v10, v8);
      uint64_t v8 = v13;
    }
  }
}

void __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  char v7 = 0;
  uint64_t v4 = a1[4];
  if (!a2) {
    uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
  }
  (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, char *))(v4 + 16))(v4, 1, a1[6], a1[6], v2, &v7);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeChannelCompletionHandler, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end