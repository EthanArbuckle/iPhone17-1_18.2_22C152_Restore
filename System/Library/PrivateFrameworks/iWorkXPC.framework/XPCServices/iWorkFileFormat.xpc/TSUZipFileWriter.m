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
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100087364;
    v18 = &unk_1001CC670;
    objc_copyWeak(&v19, &location);
    v11 = [(TSUFileIOChannel *)v10 initForRandomWritingURL:v8 error:a5 cleanupHandler:&v15];
    writeChannel = v9->_writeChannel;
    v9->_writeChannel = v11;

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
  v38 = sub_100087818;
  v39 = sub_100087828;
  id v40 = 0;
  v34.receiver = self;
  v34.super_class = (Class)TSUZipFileWriter;
  v10 = [(TSUZipWriter *)&v34 initWithOptions:a4];
  if (!v10)
  {
    v11 = 0;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100087830;
  v32[3] = &unk_1001CC698;
  v11 = v10;
  v33 = v11;
  [v8 enumerateEntriesUsingBlock:v32];
  if ((uint64_t)[v8 endOfLastEntry] <= 0)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC6B8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100165668();
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipFileWriter initWithZipFileArchive:options:error:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:69 isFatal:0 description:"Unexpected offset"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  -[TSUZipWriter setEntryInsertionOffset:](v11, "setEntryInsertionOffset:", [v8 endOfLastEntry]);
  objc_initWeak(&location, v11);
  v14 = [TSUFileIOChannel alloc];
  v15 = v36;
  id obj = v36[5];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10008787C;
  v28[3] = &unk_1001CC670;
  objc_copyWeak(&v29, &location);
  uint64_t v16 = [(TSUFileIOChannel *)v14 initForRandomReadingWritingURL:v9 error:&obj cleanupHandler:v28];
  objc_storeStrong(v15 + 5, obj);
  writeChannel = v11->_writeChannel;
  v11->_writeChannel = v16;

  v18 = v11->_writeChannel;
  if (v18)
  {
    [(TSURandomWriteChannel *)v18 setLowWater:-1];
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v20 = v11->_writeChannel;
    id v21 = [v8 endOfLastEntry];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000878FC;
    v25[3] = &unk_1001CC6E0;
    v27 = &v35;
    v22 = v19;
    v26 = v22;
    [(TSURandomWriteChannel *)v20 truncateToLength:v21 completion:v25];
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v36[5])
  {

    v11 = 0;
  }
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  if (a5) {
LABEL_13:
  }
    *a5 = v36[5];
LABEL_14:
  v23 = v11;
  _Block_object_dispose(&v35, 8);

  return v23;
}

- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, id))a6;
  if ([v10 isClosed])
  {
    id v28 = 0;
    v13 = [[TSUZipFileArchive alloc] initWithWriter:v10 forReadingFromURL:v11 options:a5 error:&v28];
    id v14 = v28;
    v15 = v14;
    if (v13)
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100087CD0;
      v21[3] = &unk_1001CC728;
      id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[TSUZipArchive entriesCount](v13, "entriesCount"));
      id v22 = v16;
      v23 = &v24;
      [(TSUZipArchive *)v13 enumerateEntriesUsingBlock:v21];
      [v16 sortUsingComparator:&stru_1001CC768];
      v17 = +[NSProgress progressWithTotalUnitCount:v25[3]];
      [(TSUZipFileWriter *)self copyRemainingEntries:v16 fromArchive:v13 progress:v17 completionHandler:v12];

      _Block_object_dispose(&v24, 8);
    }
    else if (v12)
    {
      if (v14)
      {
        v12[2](v12, v14);
      }
      else
      {
        v20 = +[NSError tsu_fileWriteUnknownErrorWithUserInfo:0];
        v12[2](v12, v20);
      }
    }

    goto LABEL_11;
  }
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CC700);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_1001656FC();
  }
  v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipFileWriter copyEntriesFromZipFileWriter:readingFromURL:options:completionHandler:]");
  dispatch_semaphore_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
  +[TSUAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:112 isFatal:0 description:"Closed writer must be closed."];

  +[TSUAssertionHandler logBacktraceThrottled];
  if (v12)
  {
    v15 = +[NSError tsu_fileWriteUnknownErrorWithUserInfo:0];
    v12[2](v12, v15);
LABEL_11:
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
    v15 = [v11 streamReadChannelForEntry:v14];
    if (v15)
    {
      id v16 = [v14 name];
      v17 = [v14 lastModificationDate];
      id v22 = [v14 size];
      unsigned int v21 = [v14 CRC];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000880C0;
      v23[3] = &unk_1001CC7B0;
      id v29 = v13;
      id v24 = v12;
      id v25 = v14;
      uint64_t v26 = self;
      id v27 = v10;
      id v28 = v11;
      [(TSUZipWriter *)self writeEntryWithName:v16 force32BitSize:0 lastModificationDate:v17 size:v22 CRC:v21 fromReadChannel:v15 completion:v23];

      v18 = v29;
    }
    else
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CC788);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100165790();
      }
      dispatch_semaphore_t v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipFileWriter copyRemainingEntries:fromArchive:progress:completionHandler:]");
      v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 156, 0, "invalid nil value for '%{public}s'", "channel");

      +[TSUAssertionHandler logBacktraceThrottled];
      if (!v13) {
        goto LABEL_13;
      }
      v18 = +[NSError tsu_fileWriteUnknownErrorWithUserInfo:0];
      (*((void (**)(id, void *))v13 + 2))(v13, v18);
    }

LABEL_13:
    goto LABEL_14;
  }
  if (v13) {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
LABEL_14:
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_writeChannelCompletionHandler)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC7D0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001658B8();
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 177, 0, "expected nil value for '%{public}s'", "_writeChannelCompletionHandler");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v7 = [v4 copy];
  id writeChannelCompletionHandler = self->_writeChannelCompletionHandler;
  self->_id writeChannelCompletionHandler = v7;

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC7F0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100165824();
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 180, 0, "invalid nil value for '%{public}s'", "_writeChannel");

    +[TSUAssertionHandler logBacktraceThrottled];
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
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100088530;
  v11[3] = &unk_1001CC818;
  id v12 = a6;
  id v10 = v12;
  [a1 zipDirectoryAtURL:a3 customDirectoryFilename:0 toURL:a4 queue:a5 progressHandler:v11];
}

+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7
{
  id v11 = a3;
  id v71 = a4;
  id v12 = a5;
  queue = a6;
  id v73 = a7;
  v67 = v11;
  if (!v11)
  {
    id v13 = v12;
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC838);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100165B08();
    }
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 199, 0, "invalid nil value for '%{public}s'", "directoryURL");

    +[TSUAssertionHandler logBacktraceThrottled];
    id v12 = v13;
  }
  v66 = v12;
  if (!v12)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC858);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100165A74();
    }
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 200, 0, "invalid nil value for '%{public}s'", "URL");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (!queue)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC878);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001659E0();
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    dispatch_semaphore_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 201, 0, "invalid nil value for '%{public}s'", "queue");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (!v73)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC898);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016594C();
    }
    v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    unsigned int v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 202, 0, "invalid nil value for '%{public}s'", "progressHandler");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v104 = 0;
  v72 = [[TSUZipFileWriter alloc] initWithURL:v66 error:&v104];
  id v22 = v104;
  v65 = v22;
  if (v72)
  {
    v23 = [v67 path];
    id v24 = v23;
    if (!v71)
    {
      uint64_t v25 = [v23 stringByDeletingLastPathComponent];

      id v24 = (void *)v25;
    }
    uint64_t v26 = [v24 stringByStandardizingPath];
    v64 = [v26 precomposedStringWithCanonicalMapping];

    v70 = (char *)[v64 length];
    id v27 = +[NSFileManager defaultManager];
    v109[0] = NSURLIsDirectoryKey;
    v109[1] = NSURLFileSizeKey;
    id v28 = +[NSArray arrayWithObjects:v109 count:2];
    id v29 = [v27 enumeratorAtURL:v67 includingPropertiesForKeys:v28 options:0 errorHandler:0];

    v100[0] = 0;
    v100[1] = v100;
    v100[2] = 0x2020000000;
    v100[3] = 0;
    id v74 = objc_alloc_init((Class)NSMutableArray);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obj = v29;
    id v30 = [obj countByEnumeratingWithState:&v96 objects:v108 count:16];
    if (v30)
    {
      uint64_t v76 = 0;
      uint64_t v31 = *(void *)v97;
      do
      {
        v32 = 0;
        do
        {
          if (*(void *)v97 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v96 + 1) + 8 * (void)v32);
          id v95 = 0;
          unsigned int v34 = [v33 getResourceValue:&v95 forKey:NSURLIsDirectoryKey error:0];
          id v35 = v95;
          v36 = v35;
          if (v34)
          {
            if (([v35 BOOLValue] & 1) == 0)
            {
              id v94 = 0;
              unsigned int v37 = [v33 getResourceValue:&v94 forKey:NSURLFileSizeKey error:0];
              id v38 = v94;
              v39 = v38;
              if (v37) {
                v76 += (uint64_t)[v38 unsignedLongLongValue];
              }
              [v74 addObject:v33];
            }
          }
          else
          {
            unsigned int v40 = +[TSUAssertionHandler _atomicIncrementAssertCount];
            if (TSUAssertCat_init_token != -1) {
              dispatch_once(&TSUAssertCat_init_token, &stru_1001CC8B8);
            }
            v41 = TSUAssertCat_log_t;
            if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&buf[4] = v40;
              *(_WORD *)v107 = 2082;
              *(void *)&v107[2] = "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]";
              *(_WORD *)&v107[10] = 2082;
              *(void *)&v107[12] = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m";
              *(_WORD *)&v107[20] = 1024;
              *(_DWORD *)&v107[22] = 239;
              *(_WORD *)&v107[26] = 2112;
              *(void *)&v107[28] = v33;
              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to obtain resource value for %@", buf, 0x2Cu);
            }
            v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
            v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileWriter.m"];
            +[TSUAssertionHandler handleFailureInFunction:v42, v43, 239, 0, "Failed to obtain resource value for %@", v33 file lineNumber isFatal description];

            +[TSUAssertionHandler logBacktraceThrottled];
          }

          v32 = (char *)v32 + 1;
        }
        while (v30 != v32);
        id v30 = [obj countByEnumeratingWithState:&v96 objects:v108 count:16];
      }
      while (v30);
    }
    else
    {
      uint64_t v76 = 0;
    }

    *(void *)buf = 0;
    *(void *)v107 = buf;
    *(void *)&v107[8] = 0x3032000000;
    *(void *)&v107[16] = sub_100087818;
    *(void *)&v107[24] = sub_100087828;
    *(void *)&v107[32] = 0;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v69 = v74;
    id v46 = [v69 countByEnumeratingWithState:&v90 objects:v105 count:16];
    if (v46)
    {
      uint64_t v75 = *(void *)v91;
      while (2)
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v91 != v75) {
            objc_enumerationMutation(v69);
          }
          v48 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          v49 = [v48 path];
          v50 = [v49 stringByStandardizingPath];
          v51 = [v50 precomposedStringWithCanonicalMapping];

          v52 = [v51 substringFromIndex:v70 + 1];
          if (v71)
          {
            uint64_t v53 = [v71 stringByAppendingPathComponent:v52];

            v52 = (void *)v53;
          }
          v54 = [TSUFileIOChannel alloc];
          v55 = (id *)(*(void *)v107 + 40);
          id v89 = *(id *)(*(void *)v107 + 40);
          id v56 = [(TSUFileIOChannel *)v54 initForReadingURL:v48 error:&v89];
          objc_storeStrong(v55, v89);
          if (!v56)
          {

            goto LABEL_64;
          }
          id v88 = 0;
          unsigned __int8 v57 = [v48 getResourceValue:&v88 forKey:NSURLFileSizeKey error:0];
          id v58 = v88;
          v59 = v58;
          if ((v57 & 1) == 0)
          {

            v59 = 0;
          }
          id v87 = 0;
          unsigned __int8 v60 = [v48 getResourceValue:&v87 forKey:NSURLContentModificationDateKey error:0];
          id v61 = v87;
          v62 = v61;
          if ((v60 & 1) == 0)
          {

            v62 = 0;
          }
          id v63 = [v59 unsignedLongLongValue];
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_100089398;
          v82[3] = &unk_1001CC8E0;
          v84 = v100;
          id v83 = v73;
          v85 = buf;
          uint64_t v86 = v76;
          [(TSUZipWriter *)v72 writeEntryWithName:v52 force32BitSize:0 lastModificationDate:v62 size:v63 CRC:0 fromReadChannel:v56 writeHandler:v82];
        }
        id v46 = [v69 countByEnumeratingWithState:&v90 objects:v105 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }
LABEL_64:

    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100089488;
    v78[3] = &unk_1001CC908;
    id v79 = v73;
    v80 = buf;
    uint64_t v81 = v76;
    [(TSUZipWriter *)v72 closeWithQueue:queue completion:v78];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v100, 8);

    v45 = v64;
  }
  else
  {
    v44 = v22;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100089310;
    block[3] = &unk_1001CC350;
    id v103 = v73;
    id v102 = v44;
    dispatch_async(queue, block);

    v45 = v103;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeChannelCompletionHandler, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end