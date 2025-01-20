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
    sub_10001424C();
  }
  uint64_t v4 = a4;
  if (!a4) {
    sub_100014278();
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
    sub_1000142A4();
  }
  unsigned int v4 = v3;
  uint64_t v5 = [(MBFileEncodingTask *)self group];
  if (!v5) {
    sub_1000142D0();
  }

  if ([(MBFileEncodingTask *)self validate] && (MBIsInternalInstall() & 1) == 0) {
    sub_1000142FC();
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
        if (qword_100026378 != -1) {
          dispatch_once(&qword_100026378, &stru_100020B50);
        }
        objc_super v9 = (id)qword_100026370;
        if (qword_100026388 != -1) {
          dispatch_once(&qword_100026388, &stru_100020B70);
        }
        v10 = &qword_100026380;
      }
      else
      {
        if (qword_100026398 != -1) {
          dispatch_once(&qword_100026398, &stru_100020B90);
        }
        objc_super v9 = (id)qword_100026390;
        if (qword_1000263A8 != -1) {
          dispatch_once(&qword_1000263A8, &stru_100020BB0);
        }
        v10 = &qword_1000263A0;
      }
      v11 = (id)*v10;
      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000100D4;
      block[3] = &unk_100020B10;
      char v16 = v4;
      block[4] = self;
      v15 = v9;
      v12 = v9;
      dispatch_async(v11, block);

      return;
    }
  }
  else
  {
  }
  id v13 = +[MBError errorWithCode:1 format:@"Invalid arguments: no source path, or unspecified compression or protection class"];
  [(MBFileEncodingTask *)self _finishWithError:v13];
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
  unsigned int v52 = 0;
  id v51 = 0;
  BOOL v3 = sub_10001076C([(MBFileEncodingTask *)self compressionMethod], (int *)&v52, &v51);
  id v4 = v51;
  id v5 = v4;
  if (!v3)
  {
    unsigned int v27 = 0;
    goto LABEL_19;
  }
  id v49 = v4;
  uint64_t v50 = 0;
  unsigned int v6 = [(MBFileEncodingTask *)self _handleCompressionOperation:0 algorithm:v52 destinationSize:&v50 error:&v49];
  id v7 = v49;

  if (!v6)
  {
    unsigned int v27 = 0;
    id v5 = v7;
    goto LABEL_19;
  }
  unsigned __int8 v48 = 0;
  id v47 = v7;
  char v8 = sub_100010858(v52, (char *)&v48, &v47);
  id v5 = v47;

  if ((v8 & 1) == 0) {
    sub_100014488();
  }
  if (!v48) {
    sub_100014430();
  }
  if (v48 == 255) {
    sub_10001445C();
  }
  if (![(MBFileEncodingTask *)self encodingMethod]) {
    sub_100014328();
  }
  if ([(MBFileEncodingTask *)self encodingMethod] == -1) {
    sub_100014354();
  }
  [(MBFileEncodingTask *)self setCompressionMethod:(char)v48];
  [(MBFileEncodingTask *)self setDestinationSize:v50];
  if ([(MBFileEncodingTask *)self validate])
  {
    if (![(MBFileEncodingTask *)self sourceIsLive])
    {
      objc_super v9 = [(MBFileEncodingTask *)self sourceDigest];

      if (v9)
      {
        char v46 = 0;
        if ((sub_100010858(v52, &v46, 0) & 1) == 0) {
          sub_100014404();
        }
        uint64_t v10 = [(MBFileEncodingTask *)self destinationPath];
        if (!v10) {
          sub_100014380();
        }
        v11 = (void *)v10;
        v12 = dispatch_group_create();
        id v13 = +[MBFileEncodingTask decodingTaskWithEncodingMethod:[(MBFileEncodingTask *)self encodingMethod]];
        [v13 setSourcePath:v11];
        [v13 setDestinationPath:0];
        [v13 setCompressionMethod:v46];
        objc_msgSend(v13, "setProtectionClass:", -[MBFileEncodingTask protectionClass](self, "protectionClass"));
        [v13 setValidate:1];
        [v13 setGroup:v12];
        [v13 start];
        dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        v14 = [v13 error];

        if (v14)
        {
          v15 = MBGetDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            char v16 = [(MBFileEncodingTask *)self sourcePath];
            v17 = (void *)[(MBFileEncodingTask *)self encodingMethod];
            uint64_t v18 = v46;
            v19 = [v13 error];
            *(_DWORD *)buf = 138413314;
            v54 = v11;
            __int16 v55 = 2112;
            v56 = v16;
            __int16 v57 = 2048;
            v58 = v17;
            __int16 v59 = 2048;
            uint64_t v60 = v18;
            __int16 v61 = 2112;
            v62 = v19;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to validate the compressed file at %@(%@), e:%ld/0x%lx, error:%@", buf, 0x34u);

            v20 = [(MBFileEncodingTask *)self sourcePath];
            [(MBFileEncodingTask *)self encodingMethod];
            v45 = [v13 error];
            _MBLog(@"FAULT", (uint64_t)"Failed to validate the compressed file at %@(%@), e:%ld/0x%lx, error:%@", v21, v22, v23, v24, v25, v26, (uint64_t)v11);
          }
          [v13 error];
          unsigned int v27 = 0;
          v28 = v5;
          id v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v32 = [v13 destinationDigest];
          if (!v32) {
            sub_1000143AC();
          }
          v28 = (void *)v32;
          v33 = [(MBFileEncodingTask *)self sourceDigest];
          unsigned int v27 = [v33 isEqualToData:v28];

          if ((v27 & 1) == 0)
          {
            v34 = MBGetDefaultLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            {
              v35 = [(MBFileEncodingTask *)self sourceDigest];
              *(_DWORD *)buf = 138412802;
              v54 = v11;
              __int16 v55 = 2112;
              v56 = v35;
              __int16 v57 = 2112;
              v58 = v28;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Mismatched SHA256 for the file at %@, %@ != %@", buf, 0x20u);

              v44 = [(MBFileEncodingTask *)self sourceDigest];
              _MBLog(@"FAULT", (uint64_t)"Mismatched SHA256 for the file at %@, %@ != %@", v36, v37, v38, v39, v40, v41, (uint64_t)v11);
            }
            v42 = [(MBFileEncodingTask *)self sourceDigest];
            uint64_t v43 = +[MBError errorWithCode:1, v11, @"Mismatched digests, %@ != %@", v42, v28 path format];

            id v5 = (id)v43;
          }
        }

        if (v27)
        {
LABEL_20:
          v29 = v5;
          if (!v27) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
LABEL_19:
        if (!v5) {
          sub_1000143D8();
        }
        goto LABEL_20;
      }
    }
  }
LABEL_21:
  v29 = 0;
LABEL_22:
  id v30 = v29;

  return v30;
}

- (id)_decompress
{
  unsigned int v17 = 0;
  id v16 = 0;
  BOOL v3 = sub_10001076C([(MBFileEncodingTask *)self compressionMethod], (int *)&v17, &v16);
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
      char v8 = sub_100010858(v17, &v13, &v12);
      id v5 = v12;

      if ((v8 & 1) == 0) {
        sub_100014538();
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
    sub_100014564();
  }
LABEL_7:
  id v10 = v9;

  return v10;
}

- (BOOL)_handleCompressionOperation:(int)a3 algorithm:(int)a4 destinationSize:(unint64_t *)a5 error:(id *)a6
{
  if (a3 >= 2) {
    sub_100014590();
  }
  if (!a5) {
    sub_1000145BC();
  }
  if (!a6) {
    sub_1000145E8();
  }
  uint64_t v11 = [(MBFileEncodingTask *)self sourcePath];
  if (!v11) {
    sub_100014614();
  }
  id v12 = (void *)v11;
  char v13 = [(MBFileEncodingTask *)self destinationPath];
  uint64_t v14 = [(MBFileEncodingTask *)self protectionClass];
  if (v14 == 255) {
    sub_100014640();
  }
  uint64_t v15 = v14;
  double v139 = 0.0;
  double v140 = 0.0;
  int v16 = open((const char *)[v12 fileSystemRepresentation], 256);
  int v17 = v16;
  if (v16 == -1)
  {
    CFStringRef v18 = @"Failed to open src file";
    goto LABEL_10;
  }
  memset(&v138, 0, sizeof(v138));
  if (fstat(v16, &v138))
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
  if (!v138.st_size)
  {
    v20 = +[MBError errorWithCode:1 format:@"Invalid file size (0)"];
    v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Invalid file size (0)", buf, 2u);
      _MBLog(@"FAULT", (uint64_t)"Invalid file size (0)", v35, v36, v37, v38, v39, v40, v103);
    }

    goto LABEL_12;
  }
  compression_algorithm algorithm = a4;
  off_t st_size = v138.st_size;
  __darwin_time_t tv_sec = v138.st_mtimespec.tv_sec;
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
    id v137 = 0;
    unsigned __int8 v26 = +[MBProtectionClassUtils setWithFD:v24 value:v15 error:&v137];
    id v131 = v137;
    if ((v26 & 1) == 0)
    {
      unsigned int v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v131;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to set protection class on the file at %@, error:%@", buf, 0x16u);
        _MBLog(@"ERROR", (uint64_t)"Failed to set protection class on the file at %@, error:%@", v28, v29, v30, v31, v32, v33, (uint64_t)v13);
      }

      id v21 = v131;
      *a6 = v21;
      goto LABEL_124;
    }
  }
  else
  {
    id v131 = 0;
    int v25 = -1;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned __int8 v42 = [(MBFileEncodingTask *)self validate];
  v117 = a5;
  if (a3)
  {
    if (v42)
    {
      uint64_t v43 = malloc_type_malloc(0x10000uLL, 0x41E28168uLL);
      v135 = +[MBDigest sha256];
      v128 = 0;
      char v126 = 1;
      char v127 = 0;
      location = 0;
      v122 = (id *)&v139;
      goto LABEL_34;
    }
  }
  else if (v42)
  {
    uint64_t v43 = malloc_type_malloc(0x10000uLL, 0x41E28168uLL);
    v128 = +[MBDigest sha256];
    v135 = 0;
    location = (id *)&v140;
    v122 = 0;
    char v126 = 0;
    char v127 = 1;
    goto LABEL_34;
  }
  uint64_t v43 = malloc_type_malloc(0x10000uLL, 0x41E28168uLL);
  v128 = 0;
  location = 0;
  v122 = 0;
  v135 = 0;
  char v126 = 1;
  char v127 = 1;
LABEL_34:
  if (!v43) {
    sub_10001466C();
  }
  *(void *)v142 = 0;
  memset(buf, 0, sizeof(buf));
  int __fd = v25;
  if (compression_stream_init((compression_stream *)buf, (compression_stream_operation)a3, algorithm))
  {
    v44 = +[MBError errorWithCode:1 format:@"compression_stream_init failed"];
    free(v43);
    double v136 = 0.0;
    id obj = 0;
    id v119 = 0;
  }
  else
  {
    off_t v45 = 0;
    double v136 = 0.0;
    uint64_t v46 = -1;
    *(void *)&buf[16] = -1;
    *(void *)&buf[24] = 0;
    *(void *)buf = v43;
    *(void *)&buf[8] = 0x10000;
    char v47 = 1;
    v133 = v13;
    uint64_t v116 = v15;
    while (2)
    {
      if (v47)
      {
        if ((unint64_t)(st_size - v45) >= 0x20000) {
          uint64_t v48 = 0x20000;
        }
        else {
          uint64_t v48 = st_size - v45;
        }
        if (st_size >= v45) {
          uint64_t v49 = v48;
        }
        else {
          uint64_t v49 = 0;
        }
        if (*(void *)&buf[16] != -1 && (unint64_t)(*(void *)&buf[16] - v46) > 0x20000) {
          sub_100014698();
        }
        if (v46 != -1) {
          munmap((void *)v46, 0x20000uLL);
        }
        if (v49)
        {
          uint64_t v50 = mmap(0, 0x20000uLL, 1, 2, v17, v45);
          if (v50 == (void *)-1)
          {
            v44 = +[MBError posixErrorWithFormat:@"Failed to mmap the src file"];
            compression_stream_destroy((compression_stream *)buf);
            free(v43);
            double v136 = 0.0;
            id obj = 0;
            id v119 = 0;
            uint64_t v15 = v116;
            goto LABEL_93;
          }
          off_t v51 = v45;
          uint64_t v52 = (uint64_t)v50;
          id v120 = (id)(v51 + 0x20000);
          [v128 updateWithBytes:v50 length:v49];
          uint64_t v53 = v52;
          int v54 = 0;
        }
        else
        {
          id v120 = (id)v45;
          uint64_t v48 = 0;
          int v54 = 1;
          uint64_t v53 = -1;
        }
        v118 = (void *)v53;
        *(void *)&buf[16] = v53;
        *(void *)&buf[24] = v48;
        BOOL v55 = v49 != 0;
      }
      else
      {
        v118 = (void *)v46;
        id v120 = (id)v45;
        BOOL v55 = 0;
        int v54 = 1;
      }
      char obja = v55;
      do
      {
        while (1)
        {
          compression_status v56 = compression_stream_process((compression_stream *)buf, v54);
          compression_status v57 = v56;
          if (v56 >= 2)
          {
            v62 = MBGetDefaultLog();
            char v13 = v133;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v159 = 134218240;
              uint64_t v160 = a3;
              __int16 v161 = 2048;
              uint64_t v162 = v57;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "compression_stream_process(%ld) failed with status:%ld", v159, 0x16u);
              _MBLog(@"DEFAULT", (uint64_t)"compression_stream_process(%ld) failed with status:%ld", v63, v64, v65, v66, v67, v68, a3);
            }

            if (a3) {
              uint64_t v69 = 11;
            }
            else {
              uint64_t v69 = 10;
            }
            v44 = +[MBError errorWithCode:v69 format:@"compression_stream_process failed"];
            double v136 = 0.0;
            id obj = 0;
            id v119 = 0;
            char v70 = 0;
            uint64_t v15 = v116;
            goto LABEL_82;
          }
          BOOL v58 = !*(void *)&buf[8] && v56 != COMPRESSION_STATUS_END;
          if (v56 == COMPRESSION_STATUS_END || !*(void *)&buf[8]) {
            break;
          }
          if (!v58) {
            goto LABEL_72;
          }
        }
        if (*(void *)buf - (void)v43 > 0x10000uLL) {
          sub_1000146C4();
        }
        if (*(void *)&buf[8] > 0x10000uLL) {
          sub_1000146F0();
        }
        if (*(void *)&buf[8] != 0x10000)
        {
          uint64_t v59 = 0x10000 - *(void *)&buf[8];
          if (v133)
          {
            ssize_t v60 = write(__fd, v43, 0x10000 - *(void *)&buf[8]);
            if (v60 == -1 || v60 != v59)
            {
              if (v60 == -1) {
                uint64_t v73 = *__error();
              }
              else {
                uint64_t v73 = 28;
              }
              char v13 = v133;
              uint64_t v15 = v116;
              v74 = "decompressed";
              if (!a3) {
                v74 = "compressed";
              }
              v44 = +[MBError errorWithErrno:v73, @"Failed to write to the %s file", v74 format];
              double v136 = 0.0;
              id obj = 0;
              id v119 = 0;
              char v70 = 0;
              goto LABEL_82;
            }
          }
          [v135 updateWithBytes:v43 length:v59];
          *(void *)&v136 += v59;
        }
        *(void *)buf = v43;
        *(void *)&buf[8] = 0x10000;
      }
      while (v58);
LABEL_72:
      BOOL v61 = v57 == COMPRESSION_STATUS_END;
      char v13 = v133;
      uint64_t v15 = v116;
      uint64_t v46 = (uint64_t)v118;
      off_t v45 = (off_t)v120;
      char v47 = obja;
      if (!v61) {
        continue;
      }
      break;
    }
    if (v126)
    {
      id obj = 0;
    }
    else
    {
      id obj = [v128 final];
    }
    if (v127)
    {
      id v119 = 0;
    }
    else
    {
      id v119 = [v135 final];
    }
    v44 = 0;
    char v70 = 1;
LABEL_82:
    compression_stream_destroy((compression_stream *)buf);
    if (v118 != (void *)-1) {
      munmap(v118, 0x20000uLL);
    }
    free(v43);
    if (v70)
    {
      int v71 = 1;
      id v72 = v131;
      goto LABEL_94;
    }
  }
LABEL_93:
  id v72 = v44;
  int v71 = 0;
  v44 = v72;
LABEL_94:

  if ((v126 & 1) == 0) {
    objc_storeStrong(location, obj);
  }
  int v25 = __fd;
  if ((v127 & 1) == 0) {
    objc_storeStrong(v122, v119);
  }
  id v21 = v72;

  if (!v71) {
    goto LABEL_123;
  }
  double v75 = CFAbsoluteTimeGetCurrent();
  if (!v13) {
    goto LABEL_103;
  }
  if (!fstat(__fd, &v138))
  {
    if (v138.st_size != *(void *)&v136)
    {
      +[MBError errorWithCode:1, v13, @"Mismatched size (%llu != %llu)", v138.st_size, *(void *)&v136, v106, v107, v108, v109, v110, *(void *)&v111, *(void *)&v112, *(void *)&v113, *(void *)&v114, *(void *)&v115 path format];
      goto LABEL_121;
    }
LABEL_103:
    if (a3)
    {
      v77 = MBGetDefaultLog();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        signed int v78 = [(MBFileEncodingTask *)self encodingMethod];
        *(_DWORD *)buf = 138414594;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v78;
        *(_WORD *)v142 = 2048;
        *(void *)&v142[2] = algorithm;
        __int16 v143 = 1024;
        int v144 = v15;
        __int16 v145 = 2048;
        off_t v146 = st_size;
        __int16 v147 = 2048;
        double v148 = v136;
        __int16 v149 = 2048;
        double v150 = v75 - Current;
        __int16 v151 = 2112;
        double v152 = v140;
        __int16 v153 = 2112;
        double v154 = v139;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Finished decompressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs, srcDigest:%@, dstDigest:%@", buf, 0x62u);
        [(MBFileEncodingTask *)self encodingMethod];
        int v25 = __fd;
        _MBLog(@"INFO", (uint64_t)"Finished decompressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs, srcDigest:%@, dstDigest:%@", v79, v80, v81, v82, v83, v84, (uint64_t)v12);
      }

      goto LABEL_112;
    }
    uint64_t v85 = v15;
    double v86 = -1.0;
    if (*(void *)&v136 < (unint64_t)st_size) {
      double v86 = 1.0 - (double)*(unint64_t *)&v136 / (double)st_size;
    }
    v87 = MBGetDefaultLog();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      signed int v88 = [(MBFileEncodingTask *)self encodingMethod];
      v134 = v13;
      double v90 = v139;
      double v89 = v140;
      double v91 = v75 - Current;
      *(_DWORD *)buf = 138415106;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v134;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v88;
      *(_WORD *)v142 = 2048;
      *(void *)&v142[2] = algorithm;
      __int16 v143 = 1024;
      int v144 = v85;
      __int16 v145 = 2048;
      off_t v146 = tv_sec;
      __int16 v147 = 2048;
      double v148 = *(double *)&st_size;
      __int16 v149 = 2048;
      double v150 = v136;
      __int16 v151 = 2048;
      double v152 = v86;
      __int16 v153 = 2048;
      double v154 = v91;
      __int16 v155 = 2112;
      double v156 = v140;
      __int16 v157 = 2112;
      double v158 = v139;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "Finished compressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, savings:%.3f, time:%.3fs, srcDigest:%@, dstDigest:%@", buf, 0x76u);
      double v114 = v89;
      double v115 = v90;
      int v25 = __fd;
      double v112 = v86;
      double v113 = v91;
      off_t v110 = st_size;
      double v111 = v136;
      uint64_t v108 = v85;
      __darwin_time_t v109 = tv_sec;
      char v13 = v134;
      uint64_t v106 = [(MBFileEncodingTask *)self encodingMethod];
      uint64_t v107 = algorithm;
      _MBLog(@"INFO", (uint64_t)"Finished compressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, savings:%.3f, time:%.3fs, srcDigest:%@, dstDigest:%@", v92, v93, v94, v95, v96, v97, (uint64_t)v12);
    }

    v98 = [(MBFileEncodingTask *)self spaceSavingsThreshold];
    [v98 doubleValue];
    double v100 = v99;

    if (v100 == 0.0)
    {
LABEL_112:
      [(MBFileEncodingTask *)self setSourceDigest:*(void *)&v140];
      [(MBFileEncodingTask *)self setDestinationDigest:*(void *)&v139];
      *(double *)v117 = v136;
      BOOL v22 = 1;
      if (v25 != -1)
      {
LABEL_125:
        close(v25);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (v86 <= 0.0)
    {
      double v104 = *(double *)&st_size;
      double v105 = v136;
      CFStringRef v101 = @"Insufficient space savings, srcSize:%llu, dstSize:%llu";
    }
    else
    {
      if (v100 <= 0.0 || v86 >= v100) {
        goto LABEL_112;
      }
      double v104 = v86;
      double v105 = v100;
      CFStringRef v101 = @"Insufficient space savings: %.3f < %.3f";
    }
    +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, v12, v101, *(void *)&v104, *(void *)&v105, v106, v107, v108, v109, v110, *(void *)&v111, *(void *)&v112, *(void *)&v113, *(void *)&v114, *(void *)&v115);
    uint64_t v76 = LABEL_121:;
    goto LABEL_122;
  }
  uint64_t v76 = +[MBError posixErrorWithPath:v13 format:@"Failed to fstat dst file"];
LABEL_122:
  v102 = (void *)v76;

  id v21 = v102;
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
  unsigned int v110 = 0;
  BOOL v3 = [(MBFileEncodingTask *)self destinationPath];

  if (!v3)
  {
    id v5 = +[MBError errorWithCode:1 format:@"Invalid argument: no destination path"];
    goto LABEL_7;
  }
  id v109 = 0;
  BOOL v4 = sub_10001076C([(MBFileEncodingTask *)self compressionMethod], (int *)&v110, &v109);
  id v5 = v109;
  if (!v4)
  {
LABEL_7:
    LODWORD(v11) = 0;
    goto LABEL_15;
  }
  id v6 = [(MBFileEncodingTask *)self sourcePath];
  id v7 = (const char *)[v6 fileSystemRepresentation];

  memset(&v108, 0, sizeof(v108));
  if (stat(v7, &v108))
  {
    char v8 = [(MBFileEncodingTask *)self sourcePath];
    CFStringRef v9 = @"Failed to stat src file";
LABEL_5:
    id v10 = +[MBError posixErrorWithPath:v8 format:v9];

    LODWORD(v11) = 0;
    goto LABEL_14;
  }
  off_t st_size = v108.st_size;
  __darwin_time_t tv_sec = v108.st_mtimespec.tv_sec;
  id v14 = [(MBFileEncodingTask *)self destinationPath];
  uint64_t v15 = (const char *)[v14 fileSystemRepresentation];

  +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:[(MBFileEncodingTask *)self protectionClass]];
  unsigned int v16 = [(MBFileEncodingTask *)self encodingMethod];
  if (v16 != 3 && v16 != 2) {
    sub_100014748();
  }
  uint64_t v106 = 0;
  uint64_t v107 = 0;
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
      uint64_t v23 = [(MBFileEncodingTask *)self destinationPath];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)double v115 = v18;
      *(_WORD *)&v115[4] = 2080;
      *(void *)&v115[6] = v107;
      *(_WORD *)&v115[14] = 2048;
      *(void *)&v115[16] = v20;
      *(_WORD *)&v115[24] = 2048;
      *(void *)&v115[26] = v21;
      *(_WORD *)&v115[34] = 2112;
      *(void *)&v115[36] = v22;
      *(_WORD *)&v115[44] = 2112;
      *(void *)&v115[46] = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_FAULT, "_sqlite3_apple_archive failed, rc:%d, msg:\"%s\", e:%ld/%ld, srcPath:%@, dstPath:%@", buf, 0x3Au);

      [(MBFileEncodingTask *)self encodingMethod];
      [(MBFileEncodingTask *)self compressionMethod];
      uint64_t v24 = [(MBFileEncodingTask *)self sourcePath];
      uint64_t v93 = [(MBFileEncodingTask *)self destinationPath];
      _MBLog(@"FAULT", (uint64_t)"_sqlite3_apple_archive failed, rc:%d, msg:\"%s\", e:%ld/%ld, srcPath:%@, dstPath:%@", v25, v26, v27, v28, v29, v30, v18);
    }
    uint64_t v31 = [(MBFileEncodingTask *)self sourcePath];
    id v10 = +[MBError errorWithCode:10, v31, @"_sqlite3_apple_archive failed, rc:%d, \"%s\"", v18, v107 path format];

    sqlite3_free(v107);
    LODWORD(v11) = 0;
    uint64_t v107 = 0;
    goto LABEL_14;
  }
  double v35 = v19;
  sqlite3_free(v106);
  if (stat(v15, &v108))
  {
    char v8 = [(MBFileEncodingTask *)self destinationPath];
    CFStringRef v9 = @"Failed to stat dst file";
    goto LABEL_5;
  }
  uint64_t v11 = v108.st_size;
  if (!v108.st_size)
  {
    uint64_t v56 = +[MBError errorWithCode:1 format:@"Invalid size(0) for SQLite archive"];

    id v5 = (id)v56;
LABEL_15:
    if (!v5) {
      sub_10001471C();
    }
LABEL_16:
    uint64_t v32 = v5;
    if (!v11) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  unsigned __int8 v105 = 0;
  id v104 = v5;
  char v36 = sub_100010858(v110, (char *)&v105, &v104);
  id v10 = v104;

  if ((v36 & 1) == 0) {
    sub_100014850();
  }
  if (!v105) {
    sub_1000147F8();
  }
  if (v105 == 255) {
    sub_100014824();
  }
  if ([(MBFileEncodingTask *)self encodingMethod] != 2
    && [(MBFileEncodingTask *)self encodingMethod] != 3)
  {
    sub_1000147CC();
  }
  uint64_t v37 = MBGetDefaultLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    id v96 = v10;
    uint64_t v38 = [(MBFileEncodingTask *)self sourcePath];
    uint64_t v39 = [(MBFileEncodingTask *)self destinationPath];
    uint64_t v40 = [(MBFileEncodingTask *)self encodingMethod];
    uint64_t v41 = v110;
    unsigned int v42 = [(MBFileEncodingTask *)self protectionClass];
    *(_DWORD *)buf = 138414594;
    *(void *)double v115 = v38;
    *(_WORD *)&v115[8] = 2112;
    *(void *)&v115[10] = v39;
    *(_WORD *)&v115[18] = 2048;
    *(void *)&v115[20] = v40;
    *(_WORD *)&v115[28] = 2048;
    *(void *)&v115[30] = v41;
    double v43 = 1.0 - (double)v11 / (double)st_size;
    if (v11 > st_size) {
      double v43 = 0.0;
    }
    if (!st_size) {
      double v43 = 0.0;
    }
    *(_WORD *)&v115[38] = 1024;
    *(_DWORD *)&v115[40] = v42;
    *(_WORD *)&v115[44] = 2048;
    *(void *)&v115[46] = tv_sec;
    __int16 v116 = 2048;
    off_t v117 = st_size;
    __int16 v118 = 2048;
    uint64_t v119 = v11;
    __int16 v120 = 2048;
    double v121 = v43;
    __int16 v122 = 2048;
    double v123 = v35 - Current;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Finished archiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, savings:%.3f, time:%.3fs", buf, 0x62u);

    v44 = [(MBFileEncodingTask *)self sourcePath];
    off_t v45 = [(MBFileEncodingTask *)self destinationPath];
    [(MBFileEncodingTask *)self encodingMethod];
    [(MBFileEncodingTask *)self protectionClass];
    _MBLog(@"INFO", (uint64_t)"Finished archiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, savings:%.3f, time:%.3fs", v46, v47, v48, v49, v50, v51, (uint64_t)v44);

    id v10 = v96;
  }

  [(MBFileEncodingTask *)self setCompressionMethod:(char)v105];
  [(MBFileEncodingTask *)self setDestinationSize:v11];
  if ([(MBFileEncodingTask *)self validate])
  {
    if ((MBIsInternalInstall() & 1) == 0) {
      sub_1000147A0();
    }
    char v103 = 0;
    if ((sub_100010858(v110, &v103, 0) & 1) == 0) {
      sub_100014774();
    }
    if (!getuid())
    {
      int v53 = -1;
      BOOL v55 = MBTemporaryPath();
LABEL_55:
      if (v55)
      {
        uint64_t v65 = dispatch_group_create();
        uint64_t v66 = +[MBFileEncodingTask decodingTaskWithEncodingMethod:[(MBFileEncodingTask *)self encodingMethod]];
        uint64_t v67 = [(MBFileEncodingTask *)self destinationPath];
        [v66 setSourcePath:v67];

        [v66 setDestinationPath:v55];
        [v66 setCompressionMethod:v103];
        objc_msgSend(v66, "setProtectionClass:", -[MBFileEncodingTask protectionClass](self, "protectionClass"));
        [v66 setGroup:v65];
        [v66 start];
        dispatch_group_wait(v65, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v68 = [v66 error];

        int v95 = v53;
        uint64_t v94 = v65;
        if (v68)
        {
          uint64_t v69 = MBGetDefaultLog();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          {
            char v70 = [(MBFileEncodingTask *)self destinationPath];
            int v71 = [(MBFileEncodingTask *)self sourcePath];
            id v97 = v10;
            uint64_t v72 = [(MBFileEncodingTask *)self encodingMethod];
            uint64_t v73 = v103;
            v74 = [v66 error];
            *(_DWORD *)buf = 138413314;
            *(void *)double v115 = v70;
            *(_WORD *)&v115[8] = 2112;
            *(void *)&v115[10] = v71;
            *(_WORD *)&v115[18] = 2048;
            *(void *)&v115[20] = v72;
            *(_WORD *)&v115[28] = 2048;
            *(void *)&v115[30] = v73;
            *(_WORD *)&v115[38] = 2112;
            *(void *)&v115[40] = v74;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, "Failed to validate the archived SQLite file at %@(%@), e:%ld/0x%lx: %@", buf, 0x34u);

            double v75 = [(MBFileEncodingTask *)self destinationPath];
            uint64_t v76 = [(MBFileEncodingTask *)self sourcePath];
            [(MBFileEncodingTask *)self encodingMethod];
            uint64_t v92 = [v66 error];
            id v10 = v97;
            _MBLog(@"FAULT", (uint64_t)"Failed to validate the archived SQLite file at %@(%@), e:%ld/0x%lx: %@", v77, v78, v79, v80, v81, v82, (uint64_t)v75);
          }
          uint64_t v83 = [v66 error];

          LODWORD(v11) = 0;
          id v98 = (id)v83;
        }
        else
        {
          id v98 = v10;
          LODWORD(v11) = 1;
        }
        uint64_t v84 = +[NSFileManager defaultManager];
        [v84 removeItemAtPath:v55 error:0];

        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v85 = [&off_100022158 countByEnumeratingWithState:&v99 objects:v111 count:16];
        if (v85)
        {
          id v86 = v85;
          uint64_t v87 = *(void *)v100;
          do
          {
            for (i = 0; i != v86; i = (char *)i + 1)
            {
              if (*(void *)v100 != v87) {
                objc_enumerationMutation(&off_100022158);
              }
              double v89 = [v55 stringByAppendingString:*(void *)(*((void *)&v99 + 1) + 8 * i)];
              double v90 = +[NSFileManager defaultManager];
              [v90 removeItemAtPath:v89 error:0];
            }
            id v86 = [&off_100022158 countByEnumeratingWithState:&v99 objects:v111 count:16];
          }
          while (v86);
        }
        if (v95 != -1) {
          close(v95);
        }

        id v10 = v98;
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
    if (qword_100026368 != -1) {
      dispatch_once(&qword_100026368, &stru_100020B30);
    }
    if ([(id)qword_100026360 getFileSystemRepresentation:buf maxLength:1025])
    {
      int v52 = mkstemp((char *)buf);
      if (v52 != -1)
      {
        int v53 = v52;
        int v54 = +[NSFileManager defaultManager];
        BOOL v55 = [v54 stringWithFileSystemRepresentation:buf length:strlen((const char *)buf)];
LABEL_54:

        goto LABEL_55;
      }
      int v54 = MBGetDefaultLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        int v64 = *__error();
        *(_DWORD *)double v112 = 67109120;
        int v113 = v64;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "mkstemp failed: %{errno}d", v112, 8u);
        uint64_t v91 = *__error();
        uint64_t v63 = "mkstemp failed: %{errno}d";
        goto LABEL_52;
      }
    }
    else
    {
      int v54 = MBGetDefaultLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v112 = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "getFileSystemRepresentation failed", v112, 2u);
        uint64_t v63 = "getFileSystemRepresentation failed";
LABEL_52:
        _MBLog(@"ERROR", (uint64_t)v63, v57, v58, v59, v60, v61, v62, v91);
      }
    }
    BOOL v55 = 0;
    int v53 = -1;
    goto LABEL_54;
  }
  id v5 = v10;
LABEL_17:
  uint64_t v32 = 0;
LABEL_18:
  id v33 = v32;

  return v33;
}

- (id)_unarchive
{
  BOOL v3 = [(MBFileEncodingTask *)self destinationPath];

  if (!v3)
  {
    id v5 = +[MBError errorWithCode:1 format:@"Invalid argument: no destination path"];
    goto LABEL_12;
  }
  unsigned int v56 = 0;
  id v55 = 0;
  BOOL v4 = sub_10001076C([(MBFileEncodingTask *)self compressionMethod], (int *)&v56, &v55);
  id v5 = v55;
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = [(MBFileEncodingTask *)self sourcePath];
  id v7 = (const char *)[v6 fileSystemRepresentation];

  memset(&v54, 0, sizeof(v54));
  if (stat(v7, &v54))
  {
    char v8 = [(MBFileEncodingTask *)self sourcePath];
    CFStringRef v9 = @"Failed to stat src file";
LABEL_5:
    uint64_t v10 = +[MBError posixErrorWithPath:v8 format:v9];

LABEL_11:
    id v5 = (id)v10;
LABEL_12:
    uint64_t v28 = v5;
    if (!v5) {
      sub_1000148A8();
    }
    goto LABEL_13;
  }
  off_t st_size = v54.st_size;
  id v12 = [(MBFileEncodingTask *)self destinationPath];
  char v13 = (const char *)[v12 fileSystemRepresentation];

  +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:[(MBFileEncodingTask *)self protectionClass]];
  int v52 = 0;
  int v53 = 0;
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
      *(_DWORD *)uint64_t v58 = v15;
      *(_WORD *)&v58[4] = 2080;
      *(void *)&v58[6] = v53;
      *(_WORD *)&v58[14] = 2112;
      *(void *)&v58[16] = v18;
      *(_WORD *)&v58[24] = 2112;
      *(void *)&v58[26] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "_sqlite3_apple_unarchive failed, rc:%d, msg:\"%s\", srcPath:%@, dstPath:%@", buf, 0x26u);

      uint64_t v20 = [(MBFileEncodingTask *)self sourcePath];
      uint64_t v49 = [(MBFileEncodingTask *)self destinationPath];
      _MBLog(@"FAULT", (uint64_t)"_sqlite3_apple_unarchive failed, rc:%d, msg:\"%s\", srcPath:%@, dstPath:%@", v21, v22, v23, v24, v25, v26, v15);
    }
    uint64_t v27 = [(MBFileEncodingTask *)self sourcePath];
    uint64_t v10 = +[MBError errorWithCode:11, v27, @"_sqlite3_apple_unarchive failed, rc:%d, \"%s\"", v15, v53 path format];

    sqlite3_free(v53);
    int v53 = 0;
    goto LABEL_11;
  }
  double v31 = v16;
  sqlite3_free(v52);
  if (stat(v13, &v54))
  {
    char v8 = [(MBFileEncodingTask *)self destinationPath];
    CFStringRef v9 = @"Failed to stat dst file";
    goto LABEL_5;
  }
  off_t v32 = v54.st_size;
  char v51 = 0;
  id v50 = v5;
  char v33 = sub_100010858(v56, &v51, &v50);
  id v34 = v50;

  if ((v33 & 1) == 0) {
    sub_1000148D4();
  }
  double v35 = MBGetDefaultLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    char v36 = [(MBFileEncodingTask *)self sourcePath];
    uint64_t v37 = [(MBFileEncodingTask *)self destinationPath];
    uint64_t v38 = [(MBFileEncodingTask *)self encodingMethod];
    uint64_t v39 = v56;
    unsigned int v40 = [(MBFileEncodingTask *)self protectionClass];
    *(_DWORD *)buf = 138414082;
    *(void *)uint64_t v58 = v36;
    *(_WORD *)&v58[8] = 2112;
    *(void *)&v58[10] = v37;
    *(_WORD *)&v58[18] = 2048;
    *(void *)&v58[20] = v38;
    *(_WORD *)&v58[28] = 2048;
    *(void *)&v58[30] = v39;
    __int16 v59 = 1024;
    unsigned int v60 = v40;
    __int16 v61 = 2048;
    off_t v62 = st_size;
    __int16 v63 = 2048;
    off_t v64 = v32;
    __int16 v65 = 2048;
    double v66 = v31 - Current;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Finished unarchiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs", buf, 0x4Eu);

    uint64_t v41 = [(MBFileEncodingTask *)self sourcePath];
    unsigned int v42 = [(MBFileEncodingTask *)self destinationPath];
    [(MBFileEncodingTask *)self encodingMethod];
    [(MBFileEncodingTask *)self protectionClass];
    _MBLog(@"INFO", (uint64_t)"Finished unarchiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs", v43, v44, v45, v46, v47, v48, (uint64_t)v41);
  }
  [(MBFileEncodingTask *)self setCompressionMethod:v51];
  [(MBFileEncodingTask *)self setDestinationSize:v32];
  uint64_t v28 = 0;
  id v5 = v34;
LABEL_13:
  id v29 = v28;

  return v29;
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