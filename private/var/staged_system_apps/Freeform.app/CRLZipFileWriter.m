@interface CRLZipFileWriter
+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7;
+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6;
- (CRLZipFileWriter)initWithURL:(id)a3 error:(id *)a4;
- (CRLZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (CRLZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4;
- (CRLZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3;
- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4;
@end

@implementation CRLZipFileWriter

- (CRLZipFileWriter)initWithURL:(id)a3 error:(id *)a4
{
  return [(CRLZipFileWriter *)self initWithURL:a3 options:0 error:a4];
}

- (CRLZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLZipFileWriter;
  v9 = [(CRLZipWriter *)&v21 initWithOptions:a4];
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = [CRLFileIOChannel alloc];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100474574;
    v18 = &unk_1014FC508;
    objc_copyWeak(&v19, &location);
    v11 = [(CRLFileIOChannel *)v10 initForRandomWritingURL:v8 error:a5 cleanupHandler:&v15];
    writeChannel = v9->_writeChannel;
    v9->_writeChannel = v11;

    v13 = v9->_writeChannel;
    if (v13)
    {
      -[CRLRandomWriteChannel setLowWater:](v13, "setLowWater:", -1, v15, v16, v17, v18);
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

- (CRLZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4
{
  return [(CRLZipFileWriter *)self initWithZipFileArchive:a3 options:0 error:a4];
}

- (CRLZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [v8 URL];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100474AC0;
  v42 = sub_100474AD0;
  id v43 = 0;
  v37.receiver = self;
  v37.super_class = (Class)CRLZipFileWriter;
  v10 = [(CRLZipWriter *)&v37 initWithOptions:a4];
  if (!v10)
  {
    v11 = 0;
    if (!a5) {
      goto LABEL_20;
    }
LABEL_19:
    *a5 = (id) v39[5];
    goto LABEL_20;
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100474AD8;
  v35[3] = &unk_1014FC530;
  v11 = v10;
  v36 = v11;
  [v8 enumerateEntriesUsingBlock:v35];
  if ((uint64_t)[v8 endOfLastEntry] <= 0)
  {
    uint64_t v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC550);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6E04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC570);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      v14 = +[CRLAssertionHandler packedBacktraceString];
      sub_1010B6DA4(v14, (uint64_t)v44, v12, v13);
    }

    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter initWithZipFileArchive:options:error:]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:67 isFatal:0 description:"Unexpected offset"];
  }
  -[CRLZipWriter setEntryInsertionOffset:](v11, "setEntryInsertionOffset:", [v8 endOfLastEntry]);
  objc_initWeak(&location, v11);
  v17 = [CRLFileIOChannel alloc];
  v18 = (id *)(v39 + 5);
  id obj = (id)v39[5];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100474B68;
  v31[3] = &unk_1014FC508;
  objc_copyWeak(&v32, &location);
  id v19 = [(CRLFileIOChannel *)v17 initForRandomReadingWritingURL:v9 error:&obj cleanupHandler:v31];
  objc_storeStrong(v18, obj);
  writeChannel = v11->_writeChannel;
  v11->_writeChannel = v19;

  objc_super v21 = v11->_writeChannel;
  if (v21)
  {
    [(CRLRandomWriteChannel *)v21 setLowWater:-1];
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    v23 = v11->_writeChannel;
    id v24 = [v8 endOfLastEntry];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100474BE8;
    v28[3] = &unk_1014D5408;
    v30 = &v38;
    v25 = v22;
    v29 = v25;
    [(CRLRandomWriteChannel *)v23 truncateToLength:v24 completion:v28];
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v39[5])
  {

    v11 = 0;
  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  if (a5) {
    goto LABEL_19;
  }
LABEL_20:
  v26 = v11;
  _Block_object_dispose(&v38, 8);

  return v26;
}

- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, id))a6;
  if ([v10 isClosed])
  {
    id v29 = 0;
    v13 = [[CRLZipFileArchive alloc] initWithWriter:v10 forReadingFromURL:v11 options:a5 error:&v29];
    id v14 = v29;
    v15 = v14;
    if (v13)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      uint64_t v28 = 0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100475040;
      v22[3] = &unk_1014FC5D8;
      id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[CRLZipArchive entriesCount](v13, "entriesCount")];
      id v23 = v16;
      id v24 = &v25;
      [(CRLZipArchive *)v13 enumerateEntriesUsingBlock:v22];
      [v16 sortUsingComparator:&stru_1014FC618];
      v17 = +[NSProgress progressWithTotalUnitCount:v26[3]];
      [(CRLZipFileWriter *)self copyRemainingEntries:v16 fromArchive:v13 progress:v17 completionHandler:v12];

      _Block_object_dispose(&v25, 8);
    }
    else if (v12)
    {
      if (v14)
      {
        v12[2](v12, v14);
      }
      else
      {
        objc_super v21 = +[NSError crl_fileWriteUnknownErrorWithUserInfo:0];
        v12[2](v12, v21);
      }
    }

    goto LABEL_15;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC590);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B6F40();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC5B0);
  }
  v18 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B6E98(v18);
  }
  id v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter copyEntriesFromZipFileWriter:readingFromURL:options:completionHandler:]");
  v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
  +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:110 isFatal:0 description:"Closed writer must be closed."];

  if (v12)
  {
    v15 = +[NSError crl_fileWriteUnknownErrorWithUserInfo:0];
    v12[2](v12, v15);
LABEL_15:
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
      id v24 = [v14 size];
      unsigned int v23 = [v14 CRC];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1004754B4;
      v25[3] = &unk_1014FC680;
      id v31 = v13;
      id v26 = v12;
      id v27 = v14;
      uint64_t v28 = self;
      id v29 = v10;
      id v30 = v11;
      [(CRLZipWriter *)self writeEntryWithName:v16 force32BitSize:0 lastModificationDate:v17 size:v24 CRC:v23 fromReadChannel:v15 completion:v25];

      v18 = v31;
    }
    else
    {
      int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FC638);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B7088();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FC658);
      }
      v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B6FD4(v20, v19);
      }
      objc_super v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter copyRemainingEntries:fromArchive:progress:completionHandler:]");
      dispatch_semaphore_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 154, 0, "invalid nil value for '%{public}s'", "channel");

      v15 = 0;
      if (!v13) {
        goto LABEL_17;
      }
      v18 = +[NSError crl_fileWriteUnknownErrorWithUserInfo:0];
      (*((void (**)(id, void *))v13 + 2))(v13, v18);
    }

LABEL_17:
    goto LABEL_18;
  }
  if (v13) {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
LABEL_18:
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_writeChannelCompletionHandler)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC6A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B71B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC6C0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6FD4(v6, v5);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 175, 0, "expected nil value for '%{public}s'", "_writeChannelCompletionHandler");
  }
  id v9 = [v4 copy];
  id writeChannelCompletionHandler = self->_writeChannelCompletionHandler;
  self->_id writeChannelCompletionHandler = v9;

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC6E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B711C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC700);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6FD4(v13, v12);
    }
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 178, 0, "invalid nil value for '%{public}s'", "_writeChannel");

    writeChannel = self->_writeChannel;
  }
  id v16 = writeChannel;

  return v16;
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100475A2C;
  v11[3] = &unk_1014FC728;
  id v12 = a6;
  id v10 = v12;
  [a1 zipDirectoryAtURL:a3 customDirectoryFilename:0 toURL:a4 queue:a5 progressHandler:v11];
}

+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7
{
  id v11 = a3;
  id v76 = a4;
  id v12 = a5;
  queue = a6;
  id v78 = a7;
  v73 = v11;
  if (!v11)
  {
    id v13 = v12;
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC748);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B76A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC768);
    }
    id v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B75F8(v14);
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 197, 0, "invalid nil value for '%{public}s'", "directoryURL");

    id v12 = v13;
  }
  v72 = v12;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC788);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B7564();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC7A8);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B74BC(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    int v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 198, 0, "invalid nil value for '%{public}s'", "URL");
  }
  if (!queue)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC7C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B7428();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC7E8);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B7380(v20);
    }
    objc_super v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    dispatch_semaphore_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 199, 0, "invalid nil value for '%{public}s'", "queue");
  }
  if (!v78)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC808);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B72EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC828);
    }
    unsigned int v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B7244(v23);
    }
    id v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    uint64_t v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 200, 0, "invalid nil value for '%{public}s'", "progressHandler");
  }
  id v109 = 0;
  v77 = [[CRLZipFileWriter alloc] initWithURL:v72 error:&v109];
  id v26 = v109;
  v71 = v26;
  if (!v77)
  {
    v49 = v26;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100476AC0;
    block[3] = &unk_1014CAE00;
    id v108 = v78;
    id v107 = v49;
    dispatch_async(queue, block);

    v50 = v108;
    goto LABEL_86;
  }
  id v27 = [v11 path];
  uint64_t v28 = v27;
  if (!v76)
  {
    uint64_t v29 = [v27 stringByDeletingLastPathComponent];

    uint64_t v28 = (void *)v29;
  }
  id v30 = [v28 stringByStandardizingPath];
  v70 = [v30 precomposedStringWithCanonicalMapping];

  v69 = (char *)[v70 length];
  id v31 = +[NSFileManager defaultManager];
  v114[0] = NSURLIsDirectoryKey;
  v114[1] = NSURLFileSizeKey;
  id v32 = +[NSArray arrayWithObjects:v114 count:2];
  v33 = [v31 enumeratorAtURL:v11 includingPropertiesForKeys:v32 options:0 errorHandler:0];

  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  v105[3] = 0;
  id v79 = objc_alloc_init((Class)NSMutableArray);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v33;
  id v34 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
  if (!v34)
  {
    uint64_t v81 = 0;
    goto LABEL_69;
  }
  uint64_t v81 = 0;
  uint64_t v35 = *(void *)v102;
  do
  {
    v36 = 0;
    do
    {
      if (*(void *)v102 != v35) {
        objc_enumerationMutation(obj);
      }
      objc_super v37 = *(void **)(*((void *)&v101 + 1) + 8 * (void)v36);
      id v100 = 0;
      unsigned int v38 = [v37 getResourceValue:&v100 forKey:NSURLIsDirectoryKey error:0];
      id v39 = v100;
      uint64_t v40 = v39;
      if (v38)
      {
        if ([v39 BOOLValue]) {
          goto LABEL_64;
        }
        id v99 = 0;
        unsigned int v41 = [v37 getResourceValue:&v99 forKey:NSURLFileSizeKey error:0];
        id v42 = v99;
        id v43 = v42;
        if (v41) {
          v81 += (uint64_t)[v42 unsignedLongLongValue];
        }
        [v79 addObject:v37];
      }
      else
      {
        unsigned int v44 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FC848);
        }
        v45 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v44;
          *(_WORD *)v112 = 2082;
          *(void *)&v112[2] = "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]";
          *(_WORD *)&v112[10] = 2082;
          *(void *)&v112[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m";
          *(_WORD *)&v112[20] = 1024;
          *(_DWORD *)&v112[22] = 237;
          *(_WORD *)&v112[26] = 2112;
          *(void *)&v112[28] = v37;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to obtain resource value for %@", buf, 0x2Cu);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FC868);
        }
        v46 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
        {
          v48 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v44;
          *(_WORD *)v112 = 2114;
          *(void *)&v112[2] = v48;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        id v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
        v47 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriter.m"];
        +[CRLAssertionHandler handleFailureInFunction:v43, v47, 237, 0, "Failed to obtain resource value for %@", v37 file lineNumber isFatal description];
      }
LABEL_64:

      v36 = (char *)v36 + 1;
    }
    while (v34 != v36);
    id v34 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
  }
  while (v34);
LABEL_69:

  *(void *)buf = 0;
  *(void *)v112 = buf;
  *(void *)&v112[8] = 0x3032000000;
  *(void *)&v112[16] = sub_100474AC0;
  *(void *)&v112[24] = sub_100474AD0;
  *(void *)&v112[32] = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v75 = v79;
  id v51 = [v75 countByEnumeratingWithState:&v95 objects:v110 count:16];
  if (v51)
  {
    uint64_t v80 = *(void *)v96;
    while (2)
    {
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v96 != v80) {
          objc_enumerationMutation(v75);
        }
        v53 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        v54 = [v53 path];
        v55 = [v54 stringByStandardizingPath];
        v56 = [v55 precomposedStringWithCanonicalMapping];

        v57 = [v56 substringFromIndex:v69 + 1];
        if (v76)
        {
          uint64_t v58 = [v76 stringByAppendingPathComponent:v57];

          v57 = (void *)v58;
        }
        v59 = [CRLFileIOChannel alloc];
        v60 = (id *)(*(void *)v112 + 40);
        id v94 = *(id *)(*(void *)v112 + 40);
        id v61 = [(CRLFileIOChannel *)v59 initForReadingURL:v53 error:&v94];
        objc_storeStrong(v60, v94);
        if (!v61)
        {

          goto LABEL_85;
        }
        id v93 = 0;
        unsigned __int8 v62 = [v53 getResourceValue:&v93 forKey:NSURLFileSizeKey error:0];
        id v63 = v93;
        v64 = v63;
        if ((v62 & 1) == 0)
        {

          v64 = 0;
        }
        id v92 = 0;
        unsigned __int8 v65 = [v53 getResourceValue:&v92 forKey:NSURLContentModificationDateKey error:0];
        id v66 = v92;
        v67 = v66;
        if ((v65 & 1) == 0)
        {

          v67 = 0;
        }
        id v68 = [v64 unsignedLongLongValue];
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_100476B8C;
        v87[3] = &unk_1014FC890;
        v89 = v105;
        id v88 = v78;
        v90 = buf;
        uint64_t v91 = v81;
        [(CRLZipWriter *)v77 writeEntryWithName:v57 force32BitSize:0 lastModificationDate:v67 size:v68 CRC:0 fromReadChannel:v61 writeHandler:v87];
      }
      id v51 = [v75 countByEnumeratingWithState:&v95 objects:v110 count:16];
      if (v51) {
        continue;
      }
      break;
    }
  }
LABEL_85:

  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100476C7C;
  v83[3] = &unk_1014FC8B8;
  id v84 = v78;
  v85 = buf;
  uint64_t v86 = v81;
  [(CRLZipWriter *)v77 closeWithQueue:queue completion:v83];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v105, 8);

  v50 = v70;
LABEL_86:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeChannelCompletionHandler, 0);

  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end