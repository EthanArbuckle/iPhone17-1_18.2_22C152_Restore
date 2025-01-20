@interface CRLZipFileArchive
+ (BOOL)isZipArchiveAtFD:(int)a3;
+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4;
+ (BOOL)isZipSignatureAllZerosAtURL:(id)a3;
+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4;
- (BOOL)isValid;
- (BOOL)openWithURL:(id)a3 error:(id *)a4;
- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4;
- (CRLZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)URL;
- (id)debugDescription;
- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newArchiveReadChannel;
- (unint64_t)archiveLength;
- (void)createTemporaryDirectoryRelativeToURL:(id)a3;
- (void)dealloc;
- (void)removeTemporaryDirectory;
@end

@implementation CRLZipFileArchive

+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 path];
  if ([v7 length])
  {
    id v8 = [v6 path];
    uint64_t v9 = open((const char *)[v8 fileSystemRepresentation], 0, 0);

    if ((v9 & 0x80000000) != 0)
    {
      v11 = +[NSError crl_fileReadPOSIXErrorWithNumber:*__error() userInfo:0];
      unsigned __int8 v10 = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    unsigned __int8 v10 = [a1 isZipArchiveAtFD:v9];
    close(v9);
  }
  else
  {
    unsigned __int8 v10 = 0;
  }
  v11 = 0;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_8:
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      *a4 = v11;
    }
    else
    {
      id v12 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
      *a4 = v12;
    }
  }
LABEL_12:

  return v10;
}

+ (BOOL)isZipSignatureAllZerosAtURL:(id)a3
{
  id v3 = [a3 path];
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0, 0);

  if (v4 < 0) {
    return 0;
  }
  ssize_t v5 = read(v4, &v10, 4uLL);
  v6.i32[0] = v10;
  if (vmovn_s16((int16x8_t)vmovl_u8(v6)).u32[0]) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5 == 4;
  }
  BOOL v8 = v7;
  close(v4);
  return v8;
}

+ (BOOL)isZipArchiveAtFD:(int)a3
{
  off_t v4 = lseek(a3, 0, 1);
  off_t v5 = v4;
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v4 == -1) {
      return 0;
    }
  }
  else if (lseek(a3, 0, 0) == -1)
  {
    goto LABEL_12;
  }
  if (read(a3, &v9, 4uLL) == 4)
  {
    BOOL v7 = v9 == 67324752 || v9 == 101010256;
    return lseek(a3, v5, 0) != -1 && v7;
  }
LABEL_12:
  BOOL v7 = 0;
  return lseek(a3, v5, 0) != -1 && v7;
}

- (id)URL
{
  return self->_URL;
}

+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = a5;
  id v12 = a3;
  id v18 = 0;
  id v13 = [objc_alloc((Class)a1) initForReadingFromURL:v12 options:a4 error:&v18];

  id v14 = v18;
  if (v13)
  {
    [v13 readArchiveWithQueue:v11 completion:v10];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009458;
    block[3] = &unk_1014CAE00;
    v17 = v10;
    id v16 = v14;
    dispatch_async(v11, block);

    v11 = v17;
  }
}

+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100009748;
  v32 = sub_100009758;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100009748;
  v26 = sub_100009758;
  id v27 = 0;
  id obj = 0;
  unsigned int v9 = [a1 isZipArchiveAtURL:v8 error:&obj];
  objc_storeStrong(&v27, obj);
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v11 = dispatch_get_global_queue(0, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009760;
    v17[3] = &unk_1014CAE28;
    v19 = &v28;
    v20 = &v22;
    id v12 = v10;
    id v18 = v12;
    [a1 readArchiveFromURL:v8 options:a4 queue:v11 completion:v17];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a5 && !v29[5])
  {
    id v13 = (void *)v23[5];
    if (v13)
    {
      *a5 = v13;
    }
    else
    {
      id v14 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
      *a5 = v14;
    }
  }
  id v15 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);

  return v15;
}

- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (([v8 isFileURL] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CAE48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101065D1C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CAE68);
    }
    unsigned int v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    dispatch_semaphore_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileArchive initForReadingFromURL:options:error:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:170 isFatal:0 description:"Need a file URL"];
  }
  v17.receiver = self;
  v17.super_class = (Class)CRLZipFileArchive;
  id v12 = [(CRLZipArchive *)&v17 initWithOptions:a4];
  if (v12)
  {
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("CRLZipFileArchive.Access", v13);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v14;

    if (![(CRLZipFileArchive *)v12 openWithURL:v8 error:a5])
    {

      id v12 = 0;
    }
  }

  return v12;
}

- (BOOL)openWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_fdWrapper)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CAE88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101065F1C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CAEA8);
    }
    BOOL v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileArchive openWithURL:error:]");
    unsigned int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:188 isFatal:0 description:"Shouldn't open the archive if it's already open."];
  }
  dispatch_semaphore_t v10 = (NSURL *)[v6 copy];
  URL = self->_URL;
  self->_URL = v10;

  [v6 removeCachedResourceValueForKey:NSURLFileSizeKey];
  id v26 = 0;
  id v27 = 0;
  unsigned int v12 = [v6 getResourceValue:&v27 forKey:NSURLFileSizeKey error:&v26];
  id v13 = v27;
  id v14 = v26;
  if (v12)
  {
    self->_archiveLength = (unint64_t)[v13 unsignedLongLongValue];
    id v15 = [v6 path];
    uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 0, 0);

    if ((v16 & 0x80000000) != 0)
    {
      uint64_t v22 = +[NSError crl_fileReadPOSIXErrorWithNumber:*__error() userInfo:0];
    }
    else
    {
      if (([(CRLZipArchive *)self options] & 0x10) != 0 && fcntl(v16, 48, 1) == -1)
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014CAEC8);
        }
        objc_super v17 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
          sub_101065DA4(v17);
        }
      }
      id v18 = [[CRLZipFileDescriptorWrapper alloc] initWithFileDescriptor:v16];
      fdWrapper = self->_fdWrapper;
      self->_fdWrapper = v18;

      if (self->_fdWrapper)
      {
        if ([(id)objc_opt_class() isZipArchiveAtFD:v16])
        {
          BOOL v20 = 1;
          if (!a4) {
            goto LABEL_35;
          }
          goto LABEL_33;
        }
        v23 = self->_fdWrapper;
        self->_fdWrapper = 0;

        uint64_t v22 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:0];
      }
      else
      {
        uint64_t v22 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
      }
    }
    uint64_t v24 = (void *)v22;

    BOOL v20 = 0;
    id v14 = v24;
    if (!a4) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014CAEE8);
  }
  v21 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
    sub_101065E2C((uint64_t)v6, v21, v14);
  }
  BOOL v20 = 0;
  if (a4)
  {
LABEL_33:
    if (v14) {
      *a4 = v14;
    }
  }
LABEL_35:

  return v20;
}

- (CRLZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = [(CRLZipFileArchive *)self initForReadingFromURL:v11 options:a5 error:a6];
  if (v12)
  {
    id v13 = v12;
    id archiveLength = (id)v12->_archiveLength;
    if (archiveLength == [v10 archiveLength])
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000A298;
      v26[3] = &unk_1014CAF10;
      id v15 = v13;
      id v27 = v15;
      [v10 enumerateEntriesUsingBlock:v26];
      id v13 = v27;
    }
    else
    {
      unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CAF30);
      }
      objc_super v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        log = v17;
        v23 = [v11 path];
        unint64_t v24 = v13->_archiveLength;
        *(_DWORD *)buf = 67110658;
        unsigned int v29 = v16;
        __int16 v30 = 2082;
        v31 = "-[CRLZipFileArchive initWithWriter:forReadingFromURL:options:error:]";
        __int16 v32 = 2082;
        id v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m";
        __int16 v34 = 1024;
        int v35 = 250;
        __int16 v36 = 2112;
        v37 = v23;
        __int16 v38 = 2048;
        unint64_t v39 = v24;
        __int16 v40 = 2048;
        id v41 = [v10 archiveLength];
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Length of archive at %@ doesn't match archive length of writer. %llu != %llu", buf, 0x40u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CAF50);
      }
      id v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v18);
      }
      v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileArchive initWithWriter:forReadingFromURL:options:error:]");
      BOOL v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"];
      v21 = [v11 path];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 250, 0, "Length of archive at %@ doesn't match archive length of writer. %llu != %llu", v21, v13->_archiveLength, [v10 archiveLength]);

      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  self->_id archiveLength = 0;
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = 0;

  [(CRLZipFileArchive *)self removeTemporaryDirectory];
  v4.receiver = self;
  v4.super_class = (Class)CRLZipFileArchive;
  [(CRLZipFileArchive *)&v4 dealloc];
}

- (void)createTemporaryDirectoryRelativeToURL:(id)a3
{
  id v4 = a3;
  if (!self->_temporaryDirectoryURL)
  {
    id v11 = v4;
    if (!v4) {
      goto LABEL_4;
    }
    off_t v5 = +[NSFileManager defaultManager];
    id v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:v11 create:1 error:0];
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = v6;

    id v4 = v11;
    if (!self->_temporaryDirectoryURL)
    {
LABEL_4:
      id v8 = [[CRLTemporaryDirectory alloc] initWithSignature:@"ZipFile" error:0];
      [(CRLTemporaryDirectory *)v8 leakTemporaryDirectory];
      unsigned int v9 = [(CRLTemporaryDirectory *)v8 URL];
      id v10 = self->_temporaryDirectoryURL;
      self->_temporaryDirectoryURL = v9;

      id v4 = v11;
    }
  }
}

- (void)removeTemporaryDirectory
{
  if (self->_temporaryDirectoryURL)
  {
    id v3 = +[NSFileManager defaultManager];
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    id v9 = 0;
    unsigned __int8 v5 = [v3 removeItemAtURL:temporaryDirectoryURL error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014CAF70);
      }
      BOOL v7 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
        sub_101065FA4(v7, v6);
      }
    }
    id v8 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;
  }
}

- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4
{
  unint64_t archiveLength = self->_archiveLength;
  p_fdWrapper = (id *)&self->_fdWrapper;
  fdWrapper = self->_fdWrapper;
  id v10 = fdWrapper;
  self->_unint64_t archiveLength = 0;
  id v11 = *p_fdWrapper;
  id *p_fdWrapper = 0;
  id v12 = a3;

  BOOL v13 = [(CRLZipFileArchive *)self openWithURL:v12 error:a4];
  if (!v13)
  {
    self->_unint64_t archiveLength = archiveLength;
    objc_storeStrong(p_fdWrapper, fdWrapper);
  }

  return v13;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unint64_t v24 = sub_100009748;
  v25 = sub_100009758;
  id v26 = 0;
  accessQueue = self->_accessQueue;
  BOOL v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10000A814;
  unsigned int v16 = &unk_1014CB068;
  objc_super v17 = self;
  id v8 = v6;
  id v18 = v8;
  v19 = &v21;
  BOOL v20 = &v27;
  dispatch_sync(accessQueue, &v13);
  if (a4 && !*((unsigned char *)v28 + 24))
  {
    id v9 = (void *)v22[5];
    if (v9)
    {
      *a4 = v9;
    }
    else
    {
      +[NSError crl_fileReadUnknownErrorWithUserInfo:](NSError, "crl_fileReadUnknownErrorWithUserInfo:", 0, v13, v14, v15, v16, v17);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a4 = v10;
    }
  }
  char v11 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

- (unint64_t)archiveLength
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B150;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)newArchiveReadChannel
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100009748;
  id v10 = sub_100009758;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B254;
  v5[3] = &unk_1014CB140;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isValid
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B630;
  v5[3] = &unk_1014CB140;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)debugDescription
{
  char v3 = +[CRLDescription descriptionWithObject:self class:objc_opt_class()];
  id v4 = +[NSString stringWithFormat:@"%qu", self->_archiveLength];
  [v3 addField:@"archiveLength" value:v4];

  v8.receiver = self;
  v8.super_class = (Class)CRLZipFileArchive;
  unsigned __int8 v5 = [(CRLZipArchive *)&v8 debugDescription];
  [v3 addFieldValue:v5];

  uint64_t v6 = [v3 descriptionString];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_fdWrapper, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end