@interface MBFileEncodingTask
+ (BOOL)supportsSecureCoding;
+ (id)decodingTaskWithEncodingMethod:(char)a3;
+ (id)encodingTaskWithEncodingMethod:(char)a3;
- (BOOL)_handleCompressionOperation:(int)a3 algorithm:(int)a4 destinationSize:(unint64_t *)a5 error:(id *)a6;
- (BOOL)sourceIsLive;
- (BOOL)validate;
- (MBFileEncodingTask)initWithCoder:(id)a3;
- (MBFileEncodingTask)initWithType:(char)a3 encodingMethod:(char)a4;
- (NSData)destinationDigest;
- (NSData)sourceDigest;
- (NSError)error;
- (NSNumber)spaceSavingsThreshold;
- (NSString)destinationPath;
- (NSString)sourcePath;
- (OS_dispatch_group)group;
- (char)compressionMethod;
- (char)encodingMethod;
- (char)type;
- (id)_archive;
- (id)_compress;
- (id)_decompress;
- (id)_unarchive;
- (unint64_t)destinationSize;
- (unsigned)protectionClass;
- (void)_finishWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompressionMethod:(char)a3;
- (void)setDestinationDigest:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setDestinationSize:(unint64_t)a3;
- (void)setEncodingMethod:(char)a3;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setProtectionClass:(unsigned __int8)a3;
- (void)setSourceDigest:(id)a3;
- (void)setSourceIsLive:(BOOL)a3;
- (void)setSourcePath:(id)a3;
- (void)setSpaceSavingsThreshold:(id)a3;
- (void)setType:(char)a3;
- (void)setValidate:(BOOL)a3;
- (void)start;
@end

@implementation MBFileEncodingTask

+ (id)encodingTaskWithEncodingMethod:(char)a3
{
  v3 = [[MBFileEncodingTask alloc] initWithType:1 encodingMethod:a3];
  return v3;
}

+ (id)decodingTaskWithEncodingMethod:(char)a3
{
  v3 = [[MBFileEncodingTask alloc] initWithType:2 encodingMethod:a3];
  return v3;
}

- (MBFileEncodingTask)initWithType:(char)a3 encodingMethod:(char)a4
{
  if (!a3) {
    __assert_rtn("-[MBFileEncodingTask initWithType:encodingMethod:]", "MBFileEncodingTask.m", 54, "type != MBFileEncodingTypeUnspecified");
  }
  uint64_t v4 = a4;
  if (!a4) {
    __assert_rtn("-[MBFileEncodingTask initWithType:encodingMethod:]", "MBFileEncodingTask.m", 55, "encodingMethod != MBFileEncodingMethodUnspecified");
  }
  uint64_t v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBFileEncodingTask;
  v6 = [(MBFileEncodingTask *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(MBFileEncodingTask *)v6 setType:v5];
    [(MBFileEncodingTask *)v7 setEncodingMethod:v4];
    [(MBFileEncodingTask *)v7 setCompressionMethod:0xFFFFFFFFLL];
    [(MBFileEncodingTask *)v7 setProtectionClass:255];
    [(MBFileEncodingTask *)v7 setValidate:0];
  }
  return v7;
}

- (void)start
{
  unsigned int v3 = [(MBFileEncodingTask *)self type];
  if ((v3 - 3) <= 0xFDu) {
    __assert_rtn("-[MBFileEncodingTask start]", "MBFileEncodingTask.m", 108, "type == MBFileEncodingTypeEncode || type == MBFileEncodingTypeDecode");
  }
  unsigned int v4 = v3;
  uint64_t v5 = [(MBFileEncodingTask *)self group];
  if (!v5) {
    __assert_rtn("-[MBFileEncodingTask start]", "MBFileEncodingTask.m", 109, "self.group");
  }

  if ([(MBFileEncodingTask *)self validate] && (MBIsInternalInstall() & 1) == 0) {
    __assert_rtn("-[MBFileEncodingTask start]", "MBFileEncodingTask.m", 110, "!self.validate || MBIsInternalInstall()");
  }
  v6 = [(MBFileEncodingTask *)self group];
  dispatch_group_enter(v6);

  v7 = [(MBFileEncodingTask *)self sourcePath];
  if (v7 && [(MBFileEncodingTask *)self compressionMethod])
  {
    unsigned int v8 = [(MBFileEncodingTask *)self protectionClass];

    if (v8 != 255)
    {
      if (v4 == 1)
      {
        if (qword_1004828A8 != -1) {
          dispatch_once(&qword_1004828A8, &stru_100417EA0);
        }
        objc_super v9 = (id)qword_1004828A0;
        if (qword_1004828B8 == -1)
        {
          v10 = &qword_1004828B0;
LABEL_21:
          v11 = (id)*v10;
          dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1002A5FF4;
          block[3] = &unk_100412B28;
          char v18 = v4;
          block[4] = self;
          v17 = v9;
          v12 = v9;
          dispatch_async(v11, block);

          return;
        }
        v10 = &qword_1004828B0;
        v13 = &qword_1004828B8;
        v14 = &stru_100417EC0;
      }
      else
      {
        if (qword_1004828C8 != -1) {
          dispatch_once(&qword_1004828C8, &stru_100417EE0);
        }
        objc_super v9 = (id)qword_1004828C0;
        if (qword_1004828D8 == -1)
        {
          v10 = &qword_1004828D0;
          goto LABEL_21;
        }
        v10 = &qword_1004828D0;
        v13 = &qword_1004828D8;
        v14 = &stru_100417F00;
      }
      dispatch_once(v13, v14);
      goto LABEL_21;
    }
  }
  else
  {
  }
  id v15 = +[MBError errorWithCode:1 format:@"Invalid arguments: no source path, or unspecified compression or protection class"];
  [(MBFileEncodingTask *)self _finishWithError:v15];
}

- (void)_finishWithError:(id)a3
{
  if (a3)
  {
    -[MBFileEncodingTask setError:](self, "setError:");
    [(MBFileEncodingTask *)self setDestinationSize:0];
    [(MBFileEncodingTask *)self setCompressionMethod:0];
  }
  unsigned int v4 = [(MBFileEncodingTask *)self group];
  dispatch_group_leave(v4);

  [(MBFileEncodingTask *)self setGroup:0];
}

- (id)_compress
{
  unsigned int v40 = 0;
  id v39 = 0;
  BOOL v3 = sub_1002A6788([(MBFileEncodingTask *)self compressionMethod], (int *)&v40, &v39);
  id v4 = v39;
  id v5 = v4;
  if (!v3)
  {
    unsigned int v21 = 0;
    goto LABEL_19;
  }
  id v37 = v4;
  uint64_t v38 = 0;
  unsigned int v6 = [(MBFileEncodingTask *)self _handleCompressionOperation:0 algorithm:v40 destinationSize:&v38 error:&v37];
  id v7 = v37;

  if (!v6)
  {
    unsigned int v21 = 0;
    id v5 = v7;
    goto LABEL_19;
  }
  unsigned __int8 v36 = 0;
  id v35 = v7;
  char v8 = sub_1002A6890(v40, (char *)&v36, &v35);
  id v5 = v35;

  if ((v8 & 1) == 0) {
    __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 245, "result");
  }
  if (!v36) {
    __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 246, "dstCompressionMethod != MBFileCompressionMethodUnspecified");
  }
  if (v36 == 255) {
    __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 247, "dstCompressionMethod != MBFileCompressionMethodDefault");
  }
  if (![(MBFileEncodingTask *)self encodingMethod]) {
    __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 249, "self.encodingMethod != MBFileEncodingMethodUnspecified");
  }
  if ([(MBFileEncodingTask *)self encodingMethod] == -1) {
    __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 250, "self.encodingMethod != MBFileEncodingMethodDefault");
  }
  [(MBFileEncodingTask *)self setCompressionMethod:(char)v36];
  [(MBFileEncodingTask *)self setDestinationSize:v38];
  if ([(MBFileEncodingTask *)self validate])
  {
    if (![(MBFileEncodingTask *)self sourceIsLive])
    {
      objc_super v9 = [(MBFileEncodingTask *)self sourceDigest];

      if (v9)
      {
        char v34 = 0;
        if ((sub_1002A6890(v40, &v34, 0) & 1) == 0) {
          __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 260, "result");
        }
        uint64_t v10 = [(MBFileEncodingTask *)self destinationPath];
        if (!v10) {
          __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 262, "destinationPath");
        }
        v11 = (void *)v10;
        v12 = dispatch_group_create();
        v13 = +[MBFileEncodingTask decodingTaskWithEncodingMethod:[(MBFileEncodingTask *)self encodingMethod]];
        [v13 setSourcePath:v11];
        [v13 setDestinationPath:0];
        [v13 setCompressionMethod:v34];
        objc_msgSend(v13, "setProtectionClass:", -[MBFileEncodingTask protectionClass](self, "protectionClass"));
        [v13 setValidate:1];
        [v13 setGroup:v12];
        [v13 start];
        dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        v14 = [v13 error];

        if (v14)
        {
          id v15 = MBGetDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            v16 = [(MBFileEncodingTask *)self sourcePath];
            v17 = (void *)[(MBFileEncodingTask *)self encodingMethod];
            uint64_t v18 = v34;
            v19 = [v13 error];
            *(_DWORD *)buf = 138413314;
            v42 = v11;
            __int16 v43 = 2112;
            v44 = v16;
            __int16 v45 = 2048;
            v46 = v17;
            __int16 v47 = 2048;
            uint64_t v48 = v18;
            __int16 v49 = 2112;
            v50 = v19;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to validate the compressed file at %@(%@), e:%ld/0x%lx, error:%@", buf, 0x34u);

            v20 = [(MBFileEncodingTask *)self sourcePath];
            [(MBFileEncodingTask *)self encodingMethod];
            v33 = [v13 error];
            _MBLog();
          }
          [v13 error];
          unsigned int v21 = 0;
          v22 = v5;
          id v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v26 = [v13 destinationDigest];
          if (!v26) {
            __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 280, "destinationDigest");
          }
          v22 = (void *)v26;
          v27 = [(MBFileEncodingTask *)self sourceDigest];
          unsigned int v21 = [v27 isEqualToData:v22];

          if ((v21 & 1) == 0)
          {
            v28 = MBGetDefaultLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              v29 = [(MBFileEncodingTask *)self sourceDigest];
              *(_DWORD *)buf = 138412802;
              v42 = v11;
              __int16 v43 = 2112;
              v44 = v29;
              __int16 v45 = 2112;
              v46 = v22;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Mismatched SHA256 for the file at %@, %@ != %@", buf, 0x20u);

              v32 = [(MBFileEncodingTask *)self sourceDigest];
              _MBLog();
            }
            v30 = [(MBFileEncodingTask *)self sourceDigest];
            uint64_t v31 = +[MBError errorWithCode:1, v11, @"Mismatched digests, %@ != %@", v30, v22 path format];

            id v5 = (id)v31;
          }
        }

        if (v21)
        {
LABEL_20:
          v23 = v5;
          if (!v21) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
LABEL_19:
        if (!v5) {
          __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 290, "result || localError");
        }
        goto LABEL_20;
      }
    }
  }
LABEL_21:
  v23 = 0;
LABEL_22:
  id v24 = v23;

  return v24;
}

- (id)_decompress
{
  unsigned int v17 = 0;
  id v16 = 0;
  BOOL v3 = sub_1002A6788([(MBFileEncodingTask *)self compressionMethod], (int *)&v17, &v16);
  id v4 = v16;
  id v5 = v4;
  if (v3)
  {
    id v14 = v4;
    uint64_t v15 = 0;
    unsigned int v6 = [(MBFileEncodingTask *)self _handleCompressionOperation:1 algorithm:v17 destinationSize:&v15 error:&v14];
    id v7 = v14;

    if (v6)
    {
      char v13 = 0;
      id v12 = v7;
      char v8 = sub_1002A6890(v17, &v13, &v12);
      id v5 = v12;

      if ((v8 & 1) == 0) {
        __assert_rtn("-[MBFileEncodingTask _decompress]", "MBFileEncodingTask.m", 306, "result");
      }
      [(MBFileEncodingTask *)self setCompressionMethod:v13];
      [(MBFileEncodingTask *)self setDestinationSize:v15];
      objc_super v9 = 0;
      goto LABEL_7;
    }
    id v5 = v7;
  }
  objc_super v9 = v5;
  if (!v5) {
    __assert_rtn("-[MBFileEncodingTask _decompress]", "MBFileEncodingTask.m", 313, "result || localError");
  }
LABEL_7:
  id v10 = v9;

  return v10;
}

- (BOOL)_handleCompressionOperation:(int)a3 algorithm:(int)a4 destinationSize:(unint64_t *)a5 error:(id *)a6
{
  if (a3 >= 2) {
    __assert_rtn("-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]", "MBFileEncodingTask.m", 318, "operation == COMPRESSION_STREAM_ENCODE || operation == COMPRESSION_STREAM_DECODE");
  }
  if (!a5) {
    __assert_rtn("-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]", "MBFileEncodingTask.m", 319, "destinationSize");
  }
  if (!a6) {
    __assert_rtn("-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]", "MBFileEncodingTask.m", 320, "error");
  }
  uint64_t v11 = [(MBFileEncodingTask *)self sourcePath];
  if (!v11) {
    __assert_rtn("-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]", "MBFileEncodingTask.m", 322, "srcPath");
  }
  id v12 = (void *)v11;
  char v13 = [(MBFileEncodingTask *)self destinationPath];
  uint64_t v14 = [(MBFileEncodingTask *)self protectionClass];
  if (v14 == 255) {
    __assert_rtn("-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]", "MBFileEncodingTask.m", 325, "pc != MBProtectionClassUnspecified");
  }
  uint64_t v15 = v14;
  double v114 = 0.0;
  double v115 = 0.0;
  int v16 = open((const char *)[v12 fileSystemRepresentation], 256);
  int v17 = v16;
  if (v16 == -1)
  {
    CFStringRef v18 = @"Failed to open src file";
    goto LABEL_10;
  }
  memset(&v113, 0, sizeof(v113));
  if (fstat(v16, &v113))
  {
    CFStringRef v18 = @"Failed to fstat src file";
LABEL_10:
    v19 = v12;
LABEL_11:
    v20 = +[MBError posixErrorWithPath:v19 format:v18];
LABEL_12:
    id v21 = v20;
    BOOL v22 = 0;
    *a6 = v21;
    goto LABEL_13;
  }
  if (!v113.st_size)
  {
    v20 = +[MBError errorWithCode:1 format:@"Invalid file size (0)"];
    v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Invalid file size (0)", buf, 2u);
      _MBLog();
    }

    goto LABEL_12;
  }
  compression_algorithm algorithm = a4;
  off_t st_size = v113.st_size;
  __darwin_time_t tv_sec = v113.st_mtimespec.tv_sec;
  if (v13)
  {
    uint64_t v24 = open((const char *)[v13 fileSystemRepresentation], 1794, 384);
    if (v24 == -1)
    {
      CFStringRef v18 = @"Failed to create dst file";
      v19 = v13;
      goto LABEL_11;
    }
    int v25 = v24;
    id v112 = 0;
    unsigned __int8 v26 = +[MBProtectionClassUtils setWithFD:v24 value:v15 error:&v112];
    id v106 = v112;
    if ((v26 & 1) == 0)
    {
      v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v106;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to set protection class on the file at %@, error:%@", buf, 0x16u);
        _MBLog();
      }

      id v21 = v106;
      *a6 = v21;
      goto LABEL_124;
    }
  }
  else
  {
    id v106 = 0;
    int v25 = -1;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned __int8 v30 = [(MBFileEncodingTask *)self validate];
  v92 = a5;
  if (a3)
  {
    if (v30)
    {
      uint64_t v31 = malloc_type_malloc(0x10000uLL, 0x41E28168uLL);
      v110 = +[MBDigest sha256];
      v103 = 0;
      char v101 = 1;
      char v102 = 0;
      location = 0;
      v97 = (id *)&v114;
      goto LABEL_34;
    }
  }
  else if (v30)
  {
    uint64_t v31 = malloc_type_malloc(0x10000uLL, 0x41E28168uLL);
    v103 = +[MBDigest sha256];
    v110 = 0;
    location = (id *)&v115;
    v97 = 0;
    char v101 = 0;
    char v102 = 1;
    goto LABEL_34;
  }
  uint64_t v31 = malloc_type_malloc(0x10000uLL, 0x41E28168uLL);
  v103 = 0;
  location = 0;
  v97 = 0;
  v110 = 0;
  char v101 = 1;
  char v102 = 1;
LABEL_34:
  if (!v31) {
    __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 436, "dstBuffer");
  }
  *(void *)v117 = 0;
  memset(buf, 0, sizeof(buf));
  int __fd = v25;
  if (compression_stream_init((compression_stream *)buf, (compression_stream_operation)a3, algorithm))
  {
    v32 = +[MBError errorWithCode:1 format:@"compression_stream_init failed"];
    free(v31);
    *(double *)&unint64_t v111 = 0.0;
    id obj = 0;
    id v94 = 0;
  }
  else
  {
    off_t v33 = 0;
    *(double *)&unint64_t v111 = 0.0;
    uint64_t v34 = -1;
    *(void *)&buf[16] = -1;
    *(void *)&buf[24] = 0;
    *(void *)buf = v31;
    *(void *)&buf[8] = 0x10000;
    char v35 = 1;
    v108 = v13;
    uint64_t v91 = v15;
    while (2)
    {
      if (v35)
      {
        if ((unint64_t)(st_size - v33) >= 0x20000) {
          uint64_t v36 = 0x20000;
        }
        else {
          uint64_t v36 = st_size - v33;
        }
        if (st_size >= v33) {
          uint64_t v37 = v36;
        }
        else {
          uint64_t v37 = 0;
        }
        if (*(void *)&buf[16] != -1 && (unint64_t)(*(void *)&buf[16] - v34) > 0x20000) {
          __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 461, "stream.src_ptr == MAP_FAILED || (stream.src_ptr - srcBuffer) <= srcBufferSize");
        }
        if (v34 != -1) {
          munmap((void *)v34, 0x20000uLL);
        }
        if (v37)
        {
          uint64_t v38 = mmap(0, 0x20000uLL, 1, 2, v17, v33);
          if (v38 == (void *)-1)
          {
            v32 = +[MBError posixErrorWithFormat:@"Failed to mmap the src file"];
            compression_stream_destroy((compression_stream *)buf);
            free(v31);
            *(double *)&unint64_t v111 = 0.0;
            id obj = 0;
            id v94 = 0;
            uint64_t v15 = v91;
            goto LABEL_93;
          }
          off_t v39 = v33;
          uint64_t v40 = (uint64_t)v38;
          id v95 = (id)(v39 + 0x20000);
          [v103 updateWithBytes:v38 length:v37];
          uint64_t v41 = v40;
          int v42 = 0;
        }
        else
        {
          id v95 = (id)v33;
          uint64_t v36 = 0;
          int v42 = 1;
          uint64_t v41 = -1;
        }
        v93 = (void *)v41;
        *(void *)&buf[16] = v41;
        *(void *)&buf[24] = v36;
        BOOL v43 = v37 != 0;
      }
      else
      {
        v93 = (void *)v34;
        id v95 = (id)v33;
        BOOL v43 = 0;
        int v42 = 1;
      }
      char obja = v43;
      do
      {
        while (1)
        {
          compression_status v44 = compression_stream_process((compression_stream *)buf, v42);
          compression_status v45 = v44;
          if (v44 >= 2)
          {
            v50 = MBGetDefaultLog();
            char v13 = v108;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v134 = 134218240;
              uint64_t v135 = a3;
              __int16 v136 = 2048;
              uint64_t v137 = v45;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "compression_stream_process(%ld) failed with status:%ld", v134, 0x16u);
              unint64_t v77 = a3;
              v79 = (void *)(int)v45;
              _MBLog();
            }

            if (a3) {
              uint64_t v51 = 11;
            }
            else {
              uint64_t v51 = 10;
            }
            v32 = +[MBError errorWithCode:v51, @"compression_stream_process failed", v77, v79 format];
            *(double *)&unint64_t v111 = 0.0;
            id obj = 0;
            id v94 = 0;
            char v52 = 0;
            uint64_t v15 = v91;
            goto LABEL_82;
          }
          BOOL v46 = !*(void *)&buf[8] && v44 != COMPRESSION_STATUS_END;
          if (v44 == COMPRESSION_STATUS_END || !*(void *)&buf[8]) {
            break;
          }
          if (!v46) {
            goto LABEL_72;
          }
        }
        if (*(void *)buf - (void)v31 > 0x10000uLL) {
          __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 505, "stream.dst_ptr - dstBuffer <= dstBufferSize");
        }
        if (*(void *)&buf[8] > 0x10000uLL) {
          __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 506, "stream.dst_size <= dstBufferSize");
        }
        if (*(void *)&buf[8] != 0x10000)
        {
          uint64_t v47 = 0x10000 - *(void *)&buf[8];
          if (v108)
          {
            ssize_t v48 = write(__fd, v31, 0x10000 - *(void *)&buf[8]);
            if (v48 == -1 || v48 != v47)
            {
              if (v48 == -1) {
                uint64_t v55 = *__error();
              }
              else {
                uint64_t v55 = 28;
              }
              char v13 = v108;
              uint64_t v15 = v91;
              v56 = "decompressed";
              if (!a3) {
                v56 = "compressed";
              }
              v32 = +[MBError errorWithErrno:v55, @"Failed to write to the %s file", v56 format];
              *(double *)&unint64_t v111 = 0.0;
              id obj = 0;
              id v94 = 0;
              char v52 = 0;
              goto LABEL_82;
            }
          }
          [v110 updateWithBytes:v31 length:v47];
          v111 += v47;
        }
        *(void *)buf = v31;
        *(void *)&buf[8] = 0x10000;
      }
      while (v46);
LABEL_72:
      BOOL v49 = v45 == COMPRESSION_STATUS_END;
      char v13 = v108;
      uint64_t v15 = v91;
      uint64_t v34 = (uint64_t)v93;
      off_t v33 = (off_t)v95;
      char v35 = obja;
      if (!v49) {
        continue;
      }
      break;
    }
    if (v101)
    {
      id obj = 0;
    }
    else
    {
      id obj = [v103 final];
    }
    if (v102)
    {
      id v94 = 0;
    }
    else
    {
      id v94 = [v110 final];
    }
    v32 = 0;
    char v52 = 1;
LABEL_82:
    compression_stream_destroy((compression_stream *)buf);
    if (v93 != (void *)-1) {
      munmap(v93, 0x20000uLL);
    }
    free(v31);
    if (v52)
    {
      int v53 = 1;
      id v54 = v106;
      goto LABEL_94;
    }
  }
LABEL_93:
  id v54 = v32;
  int v53 = 0;
  v32 = v54;
LABEL_94:

  if ((v101 & 1) == 0) {
    objc_storeStrong(location, obj);
  }
  int v25 = __fd;
  if ((v102 & 1) == 0) {
    objc_storeStrong(v97, v94);
  }
  id v21 = v54;

  if (!v53) {
    goto LABEL_123;
  }
  double v57 = CFAbsoluteTimeGetCurrent();
  if (!v13) {
    goto LABEL_103;
  }
  if (!fstat(__fd, &v113))
  {
    if (v113.st_size != v111)
    {
      +[MBError errorWithCode:1, v13, @"Mismatched size (%llu != %llu)", v113.st_size, v111, v81, v82, v83, v84, v85, *(void *)&v86, *(void *)&v87, *(void *)&v88, *(void *)&v89, *(void *)&v90 path format];
      goto LABEL_121;
    }
LABEL_103:
    if (a3)
    {
      v59 = MBGetDefaultLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        signed int v60 = [(MBFileEncodingTask *)self encodingMethod];
        double v61 = v57 - Current;
        uint64_t v62 = v15;
        double v64 = v114;
        double v63 = v115;
        *(_DWORD *)buf = 138414594;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v60;
        *(_WORD *)v117 = 2048;
        *(void *)&v117[2] = algorithm;
        __int16 v118 = 1024;
        int v119 = v62;
        __int16 v120 = 2048;
        off_t v121 = st_size;
        __int16 v122 = 2048;
        unint64_t v123 = v111;
        __int16 v124 = 2048;
        double v125 = v61;
        __int16 v126 = 2112;
        double v127 = v115;
        __int16 v128 = 2112;
        double v129 = v114;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Finished decompressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs, srcDigest:%@, dstDigest:%@", buf, 0x62u);
        double v87 = v63;
        double v88 = v64;
        double v86 = v61;
        off_t v84 = st_size;
        unint64_t v85 = v111;
        uint64_t v83 = v62;
        uint64_t v81 = [(MBFileEncodingTask *)self encodingMethod];
        uint64_t v82 = algorithm;
        int v25 = __fd;
        unint64_t v77 = (unint64_t)v12;
        v79 = v13;
        _MBLog();
      }

      goto LABEL_112;
    }
    uint64_t v65 = v15;
    double v66 = -1.0;
    if (v111 < st_size) {
      double v66 = 1.0 - (double)v111 / (double)st_size;
    }
    v67 = MBGetDefaultLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      signed int v68 = [(MBFileEncodingTask *)self encodingMethod];
      v109 = v13;
      double v70 = v114;
      double v69 = v115;
      double v71 = v57 - Current;
      *(_DWORD *)buf = 138415106;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v109;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v68;
      *(_WORD *)v117 = 2048;
      *(void *)&v117[2] = algorithm;
      __int16 v118 = 1024;
      int v119 = v65;
      __int16 v120 = 2048;
      off_t v121 = tv_sec;
      __int16 v122 = 2048;
      unint64_t v123 = st_size;
      __int16 v124 = 2048;
      double v125 = *(double *)&v111;
      __int16 v126 = 2048;
      double v127 = v66;
      __int16 v128 = 2048;
      double v129 = v71;
      __int16 v130 = 2112;
      double v131 = v115;
      __int16 v132 = 2112;
      double v133 = v114;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Finished compressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, savings:%.3f, time:%.3fs, srcDigest:%@, dstDigest:%@", buf, 0x76u);
      double v89 = v69;
      double v90 = v70;
      int v25 = __fd;
      double v87 = v66;
      double v88 = v71;
      unint64_t v85 = st_size;
      double v86 = *(double *)&v111;
      uint64_t v83 = v65;
      off_t v84 = tv_sec;
      char v13 = v109;
      uint64_t v81 = [(MBFileEncodingTask *)self encodingMethod];
      uint64_t v82 = algorithm;
      unint64_t v77 = (unint64_t)v12;
      v79 = v109;
      _MBLog();
    }

    v72 = [(MBFileEncodingTask *)self spaceSavingsThreshold];
    [v72 doubleValue];
    double v74 = v73;

    if (v74 == 0.0)
    {
LABEL_112:
      -[MBFileEncodingTask setSourceDigest:](self, "setSourceDigest:", *(void *)&v115, v77, v79, v81, v82, v83, v84, v85, *(void *)&v86, *(void *)&v87, *(void *)&v88, *(void *)&v89, *(void *)&v90);
      [(MBFileEncodingTask *)self setDestinationDigest:*(void *)&v114];
      unint64_t *v92 = v111;
      BOOL v22 = 1;
      if (v25 != -1)
      {
LABEL_125:
        close(v25);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (v66 <= 0.0)
    {
      double v78 = *(double *)&st_size;
      double v80 = *(double *)&v111;
      CFStringRef v75 = @"Insufficient space savings, srcSize:%llu, dstSize:%llu";
    }
    else
    {
      if (v74 <= 0.0 || v66 >= v74) {
        goto LABEL_112;
      }
      double v78 = v66;
      double v80 = v74;
      CFStringRef v75 = @"Insufficient space savings: %.3f < %.3f";
    }
    +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, v12, v75, *(void *)&v78, *(void *)&v80, v81, v82, v83, v84, v85, *(void *)&v86, *(void *)&v87, *(void *)&v88, *(void *)&v89, *(void *)&v90);
    uint64_t v58 = LABEL_121:;
    goto LABEL_122;
  }
  uint64_t v58 = +[MBError posixErrorWithPath:v13 format:@"Failed to fstat dst file"];
LABEL_122:
  v76 = (void *)v58;

  id v21 = v76;
LABEL_123:
  id v21 = v21;
  *a6 = v21;
  if (v25 != -1)
  {
LABEL_124:
    ftruncate(v25, 0);
    BOOL v22 = 0;
    goto LABEL_125;
  }
  BOOL v22 = 0;
LABEL_13:
  if (v17 != -1) {
    close(v17);
  }

  return v22;
}

- (id)_archive
{
  unsigned int v105 = 0;
  BOOL v3 = [(MBFileEncodingTask *)self destinationPath];

  if (!v3)
  {
    id v5 = +[MBError errorWithCode:1 format:@"Invalid argument: no destination path"];
    goto LABEL_7;
  }
  id v104 = 0;
  BOOL v4 = sub_1002A6788([(MBFileEncodingTask *)self compressionMethod], (int *)&v105, &v104);
  id v5 = v104;
  if (!v4)
  {
LABEL_7:
    LODWORD(v11) = 0;
    goto LABEL_15;
  }
  id v6 = [(MBFileEncodingTask *)self sourcePath];
  id v7 = (const char *)[v6 fileSystemRepresentation];

  memset(&v103, 0, sizeof(v103));
  if (stat(v7, &v103))
  {
    char v8 = [(MBFileEncodingTask *)self sourcePath];
    CFStringRef v9 = @"Failed to stat src file";
LABEL_5:
    id v10 = +[MBError posixErrorWithPath:v8 format:v9];

    LODWORD(v11) = 0;
    goto LABEL_14;
  }
  off_t st_size = v103.st_size;
  __darwin_time_t tv_sec = v103.st_mtimespec.tv_sec;
  id v14 = [(MBFileEncodingTask *)self destinationPath];
  uint64_t v15 = (const char *)[v14 fileSystemRepresentation];

  +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:[(MBFileEncodingTask *)self protectionClass]];
  unsigned int v16 = [(MBFileEncodingTask *)self encodingMethod];
  if (v16 != 3 && v16 != 2) {
    __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 580, "0");
  }
  char v101 = 0;
  char v102 = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  [(MBFileEncodingTask *)self sourceIsLive];
  uint64_t v18 = _sqlite3_apple_archive();
  double v19 = CFAbsoluteTimeGetCurrent();
  if (v18)
  {
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = [(MBFileEncodingTask *)self encodingMethod];
      uint64_t v21 = [(MBFileEncodingTask *)self compressionMethod];
      BOOL v22 = [(MBFileEncodingTask *)self sourcePath];
      v23 = [(MBFileEncodingTask *)self destinationPath];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v110 = v18;
      *(_WORD *)&v110[4] = 2080;
      *(void *)&v110[6] = v102;
      *(_WORD *)&v110[14] = 2048;
      *(void *)&v110[16] = v20;
      *(_WORD *)&v110[24] = 2048;
      *(void *)&v110[26] = v21;
      *(_WORD *)&v110[34] = 2112;
      *(void *)&v110[36] = v22;
      *(_WORD *)&v110[44] = 2112;
      *(void *)&v110[46] = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_FAULT, "_sqlite3_apple_archive failed, rc:%d, msg:\"%s\", e:%ld/%ld, srcPath:%@, dstPath:%@", buf, 0x3Au);

      [(MBFileEncodingTask *)self encodingMethod];
      [(MBFileEncodingTask *)self compressionMethod];
      uint64_t v24 = [(MBFileEncodingTask *)self sourcePath];
      uint64_t v83 = [(MBFileEncodingTask *)self destinationPath];
      _MBLog();
    }
    int v25 = [(MBFileEncodingTask *)self sourcePath];
    id v10 = +[MBError errorWithCode:10, v25, @"_sqlite3_apple_archive failed, rc:%d, \"%s\"", v18, v102 path format];

    sqlite3_free(v102);
    LODWORD(v11) = 0;
    char v102 = 0;
    goto LABEL_14;
  }
  double v29 = v19;
  sqlite3_free(v101);
  if (stat(v15, &v103))
  {
    char v8 = [(MBFileEncodingTask *)self destinationPath];
    CFStringRef v9 = @"Failed to stat dst file";
    goto LABEL_5;
  }
  uint64_t v11 = v103.st_size;
  if (!v103.st_size)
  {
    uint64_t v53 = +[MBError errorWithCode:1 format:@"Invalid size(0) for SQLite archive"];

    id v5 = (id)v53;
LABEL_15:
    if (!v5) {
      __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 706, "result || localError");
    }
LABEL_16:
    unsigned __int8 v26 = v5;
    if (!v11) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  unsigned __int8 v100 = 0;
  id v99 = v5;
  char v30 = sub_1002A6890(v105, (char *)&v100, &v99);
  id v10 = v99;

  if ((v30 & 1) == 0) {
    __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 617, "result");
  }
  if (!v100) {
    __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 618, "dstCompressionMethod != MBFileCompressionMethodUnspecified");
  }
  if (v100 == 255) {
    __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 619, "dstCompressionMethod != MBFileCompressionMethodDefault");
  }
  if ([(MBFileEncodingTask *)self encodingMethod] != 2
    && [(MBFileEncodingTask *)self encodingMethod] != 3)
  {
    __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 620, "self.encodingMethod == MBFileEncodingMethodCompressedSQLiteText || self.encodingMethod == MBFileEncodingMethodCompressedSQLiteBinary");
  }
  uint64_t v31 = MBGetDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v91 = v10;
    v32 = [(MBFileEncodingTask *)self sourcePath];
    off_t v33 = [(MBFileEncodingTask *)self destinationPath];
    uint64_t v34 = [(MBFileEncodingTask *)self encodingMethod];
    uint64_t v35 = v105;
    unsigned int v36 = [(MBFileEncodingTask *)self protectionClass];
    if (st_size) {
      BOOL v37 = v11 <= st_size;
    }
    else {
      BOOL v37 = 0;
    }
    char v38 = !v37;
    char v89 = v38;
    double v39 = (double)v11 / (double)st_size;
    double v40 = 0.0;
    *(_DWORD *)buf = 138414594;
    *(void *)v110 = v32;
    *(_WORD *)&v110[8] = 2112;
    *(void *)&v110[10] = v33;
    *(_WORD *)&v110[18] = 2048;
    *(void *)&v110[20] = v34;
    *(_WORD *)&v110[28] = 2048;
    *(void *)&v110[30] = v35;
    double v41 = 1.0 - v39;
    if (v38) {
      double v42 = 0.0;
    }
    else {
      double v42 = 1.0 - v39;
    }
    *(_WORD *)&v110[38] = 1024;
    *(_DWORD *)&v110[40] = v36;
    *(_WORD *)&v110[44] = 2048;
    *(void *)&v110[46] = tv_sec;
    __int16 v111 = 2048;
    off_t v112 = st_size;
    double v43 = v29 - Current;
    __int16 v113 = 2048;
    uint64_t v114 = v11;
    __int16 v115 = 2048;
    double v116 = v42;
    __int16 v117 = 2048;
    double v118 = v43;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Finished archiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, savings:%.3f, time:%.3fs", buf, 0x62u);

    compression_status v44 = [(MBFileEncodingTask *)self sourcePath];
    compression_status v45 = [(MBFileEncodingTask *)self destinationPath];
    uint64_t v46 = [(MBFileEncodingTask *)self encodingMethod];
    uint64_t v47 = v105;
    ssize_t v48 = (void *)[(MBFileEncodingTask *)self protectionClass];
    if ((v89 & 1) == 0) {
      double v40 = v41;
    }
    double v86 = v40;
    double v87 = v43;
    off_t v84 = st_size;
    uint64_t v85 = v11;
    uint64_t v81 = v48;
    __darwin_time_t v82 = tv_sec;
    uint64_t v79 = v46;
    uint64_t v80 = v47;
    unint64_t v77 = (unint64_t)v44;
    double v78 = v45;
    _MBLog();

    id v10 = v91;
  }

  [(MBFileEncodingTask *)self setCompressionMethod:(char)v100];
  [(MBFileEncodingTask *)self setDestinationSize:v11];
  if ([(MBFileEncodingTask *)self validate])
  {
    if ((MBIsInternalInstall() & 1) == 0) {
      __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 632, "MBIsInternalInstall()");
    }
    char v98 = 0;
    if ((sub_1002A6890(v105, &v98, 0) & 1) == 0) {
      __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 636, "result");
    }
    if (!getuid())
    {
      int v50 = -1;
      char v52 = MBTemporaryPath();
LABEL_62:
      if (v52)
      {
        uint64_t v55 = dispatch_group_create();
        v56 = +[MBFileEncodingTask decodingTaskWithEncodingMethod:[(MBFileEncodingTask *)self encodingMethod]];
        double v57 = [(MBFileEncodingTask *)self destinationPath];
        [v56 setSourcePath:v57];

        [v56 setDestinationPath:v52];
        [v56 setCompressionMethod:v98];
        objc_msgSend(v56, "setProtectionClass:", -[MBFileEncodingTask protectionClass](self, "protectionClass"));
        [v56 setGroup:v55];
        [v56 start];
        dispatch_group_wait(v55, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v58 = [v56 error];

        int v90 = v50;
        double v88 = v55;
        if (v58)
        {
          v59 = MBGetDefaultLog();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
          {
            signed int v60 = [(MBFileEncodingTask *)self destinationPath];
            double v61 = [(MBFileEncodingTask *)self sourcePath];
            id v92 = v10;
            uint64_t v62 = [(MBFileEncodingTask *)self encodingMethod];
            uint64_t v63 = v98;
            double v64 = [v56 error];
            *(_DWORD *)buf = 138413314;
            *(void *)v110 = v60;
            *(_WORD *)&v110[8] = 2112;
            *(void *)&v110[10] = v61;
            *(_WORD *)&v110[18] = 2048;
            *(void *)&v110[20] = v62;
            *(_WORD *)&v110[28] = 2048;
            *(void *)&v110[30] = v63;
            *(_WORD *)&v110[38] = 2112;
            *(void *)&v110[40] = v64;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "Failed to validate the archived SQLite file at %@(%@), e:%ld/0x%lx: %@", buf, 0x34u);

            uint64_t v65 = [(MBFileEncodingTask *)self destinationPath];
            double v66 = [(MBFileEncodingTask *)self sourcePath];
            uint64_t v67 = [(MBFileEncodingTask *)self encodingMethod];
            uint64_t v68 = v98;
            [v56 error];
            v81 = uint64_t v80 = v68;
            double v78 = v66;
            uint64_t v79 = v67;
            id v10 = v92;
            unint64_t v77 = (unint64_t)v65;
            _MBLog();
          }
          uint64_t v69 = [v56 error];

          LODWORD(v11) = 0;
          id v93 = (id)v69;
        }
        else
        {
          id v93 = v10;
          LODWORD(v11) = 1;
        }
        double v70 = +[NSFileManager defaultManager];
        [v70 removeItemAtPath:v52 error:0];

        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v71 = [&off_10043B610 countByEnumeratingWithState:&v94 objects:v106 count:16];
        if (v71)
        {
          id v72 = v71;
          uint64_t v73 = *(void *)v95;
          do
          {
            for (i = 0; i != v72; i = (char *)i + 1)
            {
              if (*(void *)v95 != v73) {
                objc_enumerationMutation(&off_10043B610);
              }
              CFStringRef v75 = [v52 stringByAppendingString:*(void *)(*((void *)&v94 + 1) + 8 * i)];
              v76 = +[NSFileManager defaultManager];
              [v76 removeItemAtPath:v75 error:0];
            }
            id v72 = [&off_10043B610 countByEnumeratingWithState:&v94 objects:v106 count:16];
          }
          while (v72);
        }
        if (v90 != -1) {
          close(v90);
        }

        id v10 = v93;
      }
      else
      {
        LODWORD(v11) = 1;
      }

LABEL_14:
      id v5 = v10;
      if (v11) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (qword_100482898 != -1) {
      dispatch_once(&qword_100482898, &stru_100417E80);
    }
    if (objc_msgSend((id)qword_100482890, "getFileSystemRepresentation:maxLength:", buf, 1025, v77, v78, v79, v80, v81, v82, v84, v85, *(void *)&v86, *(void *)&v87))
    {
      int v49 = mkstemp((char *)buf);
      if (v49 != -1)
      {
        int v50 = v49;
        uint64_t v51 = +[NSFileManager defaultManager];
        char v52 = [v51 stringWithFileSystemRepresentation:buf length:strlen((const char *)buf)];
LABEL_61:

        goto LABEL_62;
      }
      uint64_t v51 = MBGetDefaultLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        int v54 = *__error();
        *(_DWORD *)v107 = 67109120;
        int v108 = v54;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "mkstemp failed: %{errno}d", v107, 8u);
        unint64_t v77 = *__error();
        goto LABEL_59;
      }
    }
    else
    {
      uint64_t v51 = MBGetDefaultLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v107 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "getFileSystemRepresentation failed", v107, 2u);
LABEL_59:
        _MBLog();
      }
    }
    char v52 = 0;
    int v50 = -1;
    goto LABEL_61;
  }
  id v5 = v10;
LABEL_17:
  unsigned __int8 v26 = 0;
LABEL_18:
  id v27 = v26;

  return v27;
}

- (id)_unarchive
{
  BOOL v3 = [(MBFileEncodingTask *)self destinationPath];

  if (!v3)
  {
    id v5 = +[MBError errorWithCode:1 format:@"Invalid argument: no destination path"];
    goto LABEL_12;
  }
  unsigned int v44 = 0;
  id v43 = 0;
  BOOL v4 = sub_1002A6788([(MBFileEncodingTask *)self compressionMethod], (int *)&v44, &v43);
  id v5 = v43;
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = [(MBFileEncodingTask *)self sourcePath];
  id v7 = (const char *)[v6 fileSystemRepresentation];

  memset(&v42, 0, sizeof(v42));
  if (stat(v7, &v42))
  {
    char v8 = [(MBFileEncodingTask *)self sourcePath];
    CFStringRef v9 = @"Failed to stat src file";
LABEL_5:
    uint64_t v10 = +[MBError posixErrorWithPath:v8 format:v9];

LABEL_11:
    id v5 = (id)v10;
LABEL_12:
    BOOL v22 = v5;
    if (!v5) {
      __assert_rtn("-[MBFileEncodingTask _unarchive]", "MBFileEncodingTask.m", 775, "result || localError");
    }
    goto LABEL_13;
  }
  off_t st_size = v42.st_size;
  id v12 = [(MBFileEncodingTask *)self destinationPath];
  char v13 = (const char *)[v12 fileSystemRepresentation];

  +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:[(MBFileEncodingTask *)self protectionClass]];
  double v40 = 0;
  double v41 = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v15 = _sqlite3_apple_unarchive();
  double v16 = CFAbsoluteTimeGetCurrent();
  if (v15)
  {
    int v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = [(MBFileEncodingTask *)self sourcePath];
      double v19 = [(MBFileEncodingTask *)self destinationPath];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)uint64_t v46 = v15;
      *(_WORD *)&v46[4] = 2080;
      *(void *)&v46[6] = v41;
      *(_WORD *)&v46[14] = 2112;
      *(void *)&v46[16] = v18;
      *(_WORD *)&v46[24] = 2112;
      *(void *)&v46[26] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "_sqlite3_apple_unarchive failed, rc:%d, msg:\"%s\", srcPath:%@, dstPath:%@", buf, 0x26u);

      uint64_t v20 = [(MBFileEncodingTask *)self sourcePath];
      BOOL v37 = [(MBFileEncodingTask *)self destinationPath];
      _MBLog();
    }
    uint64_t v21 = [(MBFileEncodingTask *)self sourcePath];
    uint64_t v10 = +[MBError errorWithCode:11, v21, @"_sqlite3_apple_unarchive failed, rc:%d, \"%s\"", v15, v41 path format];

    sqlite3_free(v41);
    double v41 = 0;
    goto LABEL_11;
  }
  double v25 = v16;
  sqlite3_free(v40);
  if (stat(v13, &v42))
  {
    char v8 = [(MBFileEncodingTask *)self destinationPath];
    CFStringRef v9 = @"Failed to stat dst file";
    goto LABEL_5;
  }
  off_t v26 = v42.st_size;
  char v39 = 0;
  id v38 = v5;
  char v27 = sub_1002A6890(v44, &v39, &v38);
  id v28 = v38;

  if ((v27 & 1) == 0) {
    __assert_rtn("-[MBFileEncodingTask _unarchive]", "MBFileEncodingTask.m", 765, "result");
  }
  double v29 = MBGetDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    char v30 = [(MBFileEncodingTask *)self sourcePath];
    uint64_t v31 = [(MBFileEncodingTask *)self destinationPath];
    uint64_t v32 = [(MBFileEncodingTask *)self encodingMethod];
    uint64_t v33 = v44;
    unsigned int v34 = [(MBFileEncodingTask *)self protectionClass];
    *(_DWORD *)buf = 138414082;
    *(void *)uint64_t v46 = v30;
    *(_WORD *)&v46[8] = 2112;
    *(void *)&v46[10] = v31;
    *(_WORD *)&v46[18] = 2048;
    *(void *)&v46[20] = v32;
    *(_WORD *)&v46[28] = 2048;
    *(void *)&v46[30] = v33;
    __int16 v47 = 1024;
    unsigned int v48 = v34;
    __int16 v49 = 2048;
    off_t v50 = st_size;
    __int16 v51 = 2048;
    off_t v52 = v26;
    __int16 v53 = 2048;
    double v54 = v25 - Current;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Finished unarchiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs", buf, 0x4Eu);

    uint64_t v35 = [(MBFileEncodingTask *)self sourcePath];
    unsigned int v36 = [(MBFileEncodingTask *)self destinationPath];
    [(MBFileEncodingTask *)self encodingMethod];
    [(MBFileEncodingTask *)self protectionClass];
    _MBLog();
  }
  [(MBFileEncodingTask *)self setCompressionMethod:v39];
  [(MBFileEncodingTask *)self setDestinationSize:v26];
  BOOL v22 = 0;
  id v5 = v28;
LABEL_13:
  id v23 = v22;

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBFileEncodingTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBFileEncodingTask;
  id v5 = [(MBFileEncodingTask *)&v11 init];
  if (v5)
  {
    -[MBFileEncodingTask setType:](v5, "setType:", (char)[v4 decodeIntegerForKey:@"type"]);
    -[MBFileEncodingTask setEncodingMethod:](v5, "setEncodingMethod:", (char)[v4 decodeIntegerForKey:@"encodingMethod"]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourcePath"];
    [(MBFileEncodingTask *)v5 setSourcePath:v7];

    -[MBFileEncodingTask setSourceIsLive:](v5, "setSourceIsLive:", [v4 decodeBoolForKey:@"sourceIsLive"]);
    -[MBFileEncodingTask setCompressionMethod:](v5, "setCompressionMethod:", (char)[v4 decodeIntegerForKey:@"compressionMethod"]);
    -[MBFileEncodingTask setProtectionClass:](v5, "setProtectionClass:", [v4 decodeIntForKey:@"protectionClass"]);
    char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spaceSavingsThreshold"];
    [(MBFileEncodingTask *)v5 setSpaceSavingsThreshold:v8];

    CFStringRef v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationPath"];
    [(MBFileEncodingTask *)v5 setDestinationPath:v9];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[MBFileEncodingTask type](self, "type"), @"type");
  objc_msgSend(v8, "encodeInteger:forKey:", -[MBFileEncodingTask encodingMethod](self, "encodingMethod"), @"encodingMethod");
  id v5 = [(MBFileEncodingTask *)self sourcePath];
  [v8 encodeObject:v5 forKey:@"sourcePath"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MBFileEncodingTask sourceIsLive](self, "sourceIsLive"), @"sourceIsLive");
  objc_msgSend(v8, "encodeInteger:forKey:", -[MBFileEncodingTask compressionMethod](self, "compressionMethod"), @"compressionMethod");
  objc_msgSend(v8, "encodeInt:forKey:", -[MBFileEncodingTask protectionClass](self, "protectionClass"), @"protectionClass");
  id v6 = [(MBFileEncodingTask *)self spaceSavingsThreshold];
  [v8 encodeObject:v6 forKey:@"spaceSavingsThreshold"];

  id v7 = [(MBFileEncodingTask *)self destinationPath];
  [v8 encodeObject:v7 forKey:@"destinationPath"];
}

- (char)type
{
  return self->_type;
}

- (void)setType:(char)a3
{
  self->_type = a3;
}

- (char)encodingMethod
{
  return self->_encodingMethod;
}

- (void)setEncodingMethod:(char)a3
{
  self->_encodingMethod = a3;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
}

- (BOOL)sourceIsLive
{
  return self->_sourceIsLive;
}

- (void)setSourceIsLive:(BOOL)a3
{
  self->_sourceIsLive = a3;
}

- (unsigned)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(unsigned __int8)a3
{
  self->_protectionClass = a3;
}

- (char)compressionMethod
{
  return self->_compressionMethod;
}

- (void)setCompressionMethod:(char)a3
{
  self->_compressionMethod = a3;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (unint64_t)destinationSize
{
  return self->_destinationSize;
}

- (void)setDestinationSize:(unint64_t)a3
{
  self->_destinationSize = a3;
}

- (NSNumber)spaceSavingsThreshold
{
  return self->_spaceSavingsThreshold;
}

- (void)setSpaceSavingsThreshold:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)validate
{
  return self->_validate;
}

- (void)setValidate:(BOOL)a3
{
  self->_validate = a3;
}

- (NSData)sourceDigest
{
  return self->_sourceDigest;
}

- (void)setSourceDigest:(id)a3
{
}

- (NSData)destinationDigest
{
  return self->_destinationDigest;
}

- (void)setDestinationDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDigest, 0);
  objc_storeStrong((id *)&self->_sourceDigest, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_spaceSavingsThreshold, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end