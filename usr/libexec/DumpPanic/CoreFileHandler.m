@interface CoreFileHandler
+ (id)coreFileWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(id)a6;
- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5;
- (BOOL)privateKeyChecking;
- (BOOL)saveCoreDumpAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 named:(id)a5 encryptedWithPublicKey:(id)a6 toFileName:(id)a7 flags:(unsigned int)a8;
- (BOOL)saveCoreDumpWithIndex:(unint64_t)a3 named:(id)a4 toFileName:(id *)a5;
- (CoreFileHandler)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(unint64_t)a6 :(void *)a7 :(unint64_t)a8;
- (const)getCoreDumpNameWithIndex:(unint64_t)a3;
- (id)getCoreDumpContentsWithOffset:(unint64_t)a3 AndLength:(unint64_t)a4;
- (id)getCoreDumpEncryptionKey:(unint64_t)a3;
- (id)getCorefileLogEncryptionKey;
- (id)getCorefileZeroRanges;
- (id)getPanicRegion;
- (id)saveKernelCoreToDisk:(const char *)a3 :(unsigned int)a4 :(double)a5 :(BOOL)a6 :(id)a7;
- (unint64_t)getNumCoreDumps;
- (void)dealloc;
- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6;
@end

@implementation CoreFileHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corefilePath, 0);

  objc_storeStrong((id *)&self->_keystore, 0);
}

- (id)getCorefileLogEncryptionKey
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[CoreFileHandler getCorefileLogEncryptionKey]");
  id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (id)getCoreDumpEncryptionKey:(unint64_t)a3
{
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[CoreFileHandler getCoreDumpEncryptionKey:]");
  id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", a4, a5, "-[CoreFileHandler getCorefileLogInfo:::]");
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", a4, a5, a6, "-[CoreFileHandler getCoreDumpInfoWithIndex::::]");
  id v7 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[CoreFileHandler getCoreDumpNameWithIndex:]");
  id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (unint64_t)getNumCoreDumps
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[CoreFileHandler getNumCoreDumps]");
  id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (id)getCorefileZeroRanges
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[CoreFileHandler getCorefileZeroRanges]");
  id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (BOOL)privateKeyChecking
{
  if (![(CoreFileHandler *)self getNumCoreDumps]) {
    return 1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int v9 = 0;
  [(CoreFileHandler *)self getCoreDumpInfoWithIndex:0 :&v11 :&v10 :&v9];
  if ((v9 & 4) == 0)
  {
    id v3 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The kernel core is not encrypted", v8, 2u);
    }
    return 1;
  }
  if ([(ReadOnlyKeyStore *)self->_keystore unlock])
  {
    id v4 = [(CoreFileHandler *)self getCoreDumpEncryptionKey:0];
    if ([(ReadOnlyKeyStore *)self->_keystore hasMatchingPrivateKey:1 :v4])
    {

      return 1;
    }
    id v7 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Cannot find matching private encryption key for encrypted core", v8, 2u);
    }
    self->_zero_on_close = 0;

    return 0;
  }
  else
  {
    id v6 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Keystore unlock has failed", v8, 2u);
    }
    BOOL result = 0;
    self->_zero_on_close = 0;
  }
  return result;
}

- (id)saveKernelCoreToDisk:(const char *)a3 :(unsigned int)a4 :(double)a5 :(BOOL)a6 :(id)a7
{
  int v9 = a3;
  uint64_t v11 = +[NSMutableArray array];
  v12 = sub_10001ACD4(a5);
  v66 = 0;
  v13 = +[NSString stringWithUTF8String:v9];
  id v14 = sub_10001ADF8(v13, a4);

  v15 = +[NSString stringWithUTF8String:v9];
  id v65 = 0;
  char v16 = sub_100015090(v15, &v65, 493);
  id v17 = v65;

  if (v16)
  {
    asprintf(&v66, "%s/staged", v9);
    v56 = v9;
    if (v66)
    {
      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
      id v64 = v17;
      char v19 = sub_100015090(v18, &v64, 493);
      id v20 = v64;

      if ((v19 & 1) == 0)
      {
        v23 = (void *)qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          id v51 = v20;
          v52 = v23;
          id v53 = [v51 UTF8String];
          *(_DWORD *)buf = 136315138;
          id v68 = v53;
          _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "failed to setup corefile stage directory due to error: %s", buf, 0xCu);
        }
        free(v66);
        v66 = 0;
        int v9 = v56;
        goto LABEL_14;
      }
      id v17 = v20;
      int v9 = v56;
    }
    else
    {
      v22 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        id v20 = v17;
LABEL_14:
        v58 = +[NSString stringWithFormat:@"%s/%@.", v9, v12];
        id v17 = v20;
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to allocate staging directory string", buf, 2u);
    }
    if (v66)
    {
      v58 = +[NSString stringWithFormat:@"%s/%@.", v66, v12];
LABEL_15:
      unsigned int v54 = a4;
      id v55 = v17;
      v24 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Attempting to extract kernel core if it exists...", buf, 2u);
      }
      unint64_t v25 = [(CoreFileHandler *)self getNumCoreDumps];
      unint64_t v26 = v25;
      if (&_AnalyticsSendEventLazy && v25)
      {
        v63[1] = _NSConcreteStackBlock;
        v63[2] = 3221225472;
        v63[3] = sub_10001B8A8;
        v63[4] = &unk_100034D78;
        v63[5] = self;
        v63[6] = v25;
        AnalyticsSendEventLazy();
      }
      if ([(CoreFileHandler *)self privateKeyChecking])
      {
        v57 = v11;
        if (v26)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            v28 = [(CoreFileHandler *)self getCoreDumpNameWithIndex:i];
            unint64_t v62 = 0;
            v63[0] = 0;
            unsigned int v61 = 0;
            [(CoreFileHandler *)self getCoreDumpInfoWithIndex:i :v63 :&v62 :&v61];
            if (&_AnalyticsSendEventLazy)
            {
              v59[1] = _NSConcreteStackBlock;
              v59[2] = (id)3221225472;
              v59[3] = sub_10001BA10;
              v59[4] = &unk_100034D98;
              v59[5] = (id)v28;
              int v60 = v62 >> 20;
              AnalyticsSendEventLazy();
            }
            if (strncmp(v28, "panic_region", 0xCuLL))
            {
              v29 = +[NSString stringWithFormat:@"%@%s%s.core.gz", v58, "", v28];
              v30 = +[NSString stringWithFormat:@"corefile with name %s", v28];
              v59[0] = v29;
              unsigned int v31 = [(CoreFileHandler *)self saveCoreDumpWithIndex:i named:v30 toFileName:v59];
              id v32 = v59[0];

              if (v31)
              {
                v33 = qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v68 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "saved core file %@", buf, 0xCu);
                }
                [v57 addObject:v32];
              }
            }
          }
        }
        unint64_t v62 = 0;
        v63[0] = 0;
        unsigned int v61 = 0;
        uint64_t v11 = v57;
        if ([(CoreFileHandler *)self getCorefileLogInfo:v63 :&v62 :&v61])
        {
          if ((v61 & 4) != 0)
          {
            v34 = [(CoreFileHandler *)self getCorefileLogEncryptionKey];
          }
          else
          {
            v34 = 0;
          }
          v35 = +[NSString stringWithFormat:@"%@%skernel.core.log", v58, ""];
          if ([(CoreFileHandler *)self saveCoreDumpAtOffset:v63[0] withLength:v62 named:@"kernel core log" encryptedWithPublicKey:v34 toFileName:v35 flags:v61])
          {
            v36 = qword_10003A5A8;
            if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v68 = v35;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "saved core file %@", buf, 0xCu);
            }
            [v57 addObject:v35];
          }
        }
        if ([v57 count])
        {
          v37 = +[NSString stringWithUTF8String:v56];
          id v38 = sub_10001ADF8(v37, v54);

          if (v66)
          {
            free(v66);
            v66 = 0;
            if ([v57 count])
            {
              unint64_t v39 = 0;
              v40 = 0;
              v41 = 0;
              do
              {
                v42 = v41;
                v43 = v11;
                v44 = v40;
                v41 = [v43 objectAtIndex:v39];

                v40 = [v41 stringByReplacingOccurrencesOfString:@"/staged" withString:&stru_100035440];

                v45 = +[NSFileManager defaultManager];
                LOBYTE(v44) = [v45 fileExistsAtPath:v40];

                if (v44)
                {
                  [v43 replaceObjectAtIndex:v39 withObject:v40];
                }
                else
                {
                  v46 = qword_10003A5A8;
                  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v68 = v40;
                    _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Cannot find %@", buf, 0xCu);
                  }
                  v47 = +[NSFileManager defaultManager];
                  unsigned __int8 v48 = [v47 fileExistsAtPath:v41];

                  v43 = v57;
                  if ((v48 & 1) == 0)
                  {
                    v49 = qword_10003A5A8;
                    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v68 = v41;
                      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Neither can find %@", buf, 0xCu);
                    }
                    v43 = v57;
                    [v57 removeObjectAtIndex:v39];
                  }
                }
                ++v39;
                uint64_t v11 = v43;
              }
              while (v39 < (unint64_t)[v43 count]);
            }
          }
        }
      }

      id v17 = v55;
      goto LABEL_56;
    }
    goto LABEL_10;
  }
  v21 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v68 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to setup corefile output directory with error: %@", buf, 0xCu);
  }
LABEL_56:

  return v11;
}

- (id)getPanicRegion
{
  unint64_t v3 = [(CoreFileHandler *)self getNumCoreDumps];
  if (v3)
  {
    uint64_t v4 = 0;
    while (strncmp([(CoreFileHandler *)self getCoreDumpNameWithIndex:v4], "panic_region", 0xCuLL))
    {
      if (v3 == ++v4) {
        goto LABEL_5;
      }
    }
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    int v18 = 0;
    [(CoreFileHandler *)self getCoreDumpInfoWithIndex:v4 :&v20 :&v19 :&v18];
    strcpy((char *)buf, "/private/var/tmp/panicregion.XXX");
    id v7 = +[NSString stringWithUTF8String:mktemp((char *)buf)];
    id v17 = v7;
    unsigned int v8 = [(CoreFileHandler *)self saveCoreDumpWithIndex:v4 named:@"panic region" toFileName:&v17];
    id v9 = v17;

    id v6 = 0;
    if (v8)
    {
      id v16 = 0;
      uint64_t v10 = +[NSData dataWithContentsOfFile:v9 options:0 error:&v16];
      id v11 = v16;
      if (!v10)
      {
        v12 = (void *)qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          id v14 = v12;
          v15 = [v11 localizedDescription];
          *(_DWORD *)v21 = 138412290;
          v22 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to read the file contents for panic region file. Error: %@", v21, 0xCu);
        }
      }
      unlink((const char *)[v9 UTF8String]);
      id v6 = v10;
    }
  }
  else
  {
LABEL_5:
    v5 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "failed to find panic region in corefile with %llu files", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (BOOL)saveCoreDumpWithIndex:(unint64_t)a3 named:(id)a4 toFileName:(id *)a5
{
  id v20 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  unsigned int v21 = 0;
  [(CoreFileHandler *)self getCoreDumpInfoWithIndex:a3 :&v23 :&v22 :&v21];
  uint64_t v8 = 0;
  if ((v21 & 4) != 0)
  {
    uint64_t v8 = [(CoreFileHandler *)self getCoreDumpEncryptionKey:a3];
  }
  int v18 = (void *)v8;
  uint64_t v19 = self;
  if (![*a5 hasSuffix:@".gz"]) {
    goto LABEL_11;
  }
  if ([*a5 containsString:@"cp.core.gz"])
  {
    *a5 = [*a5 stringByReplacingOccurrencesOfString:@"cp.core.gz" withString:@"coproc.core.gz"];
  }
  id v9 = +[NSFileManager defaultManager];
  unsigned int v10 = [v9 fileExistsAtPath:*a5];

  if (v10)
  {
    uint64_t v11 = 1;
    while (1)
    {
      v12 = +[NSString stringWithFormat:@"core.%llu.gz", v11];
      v13 = [*a5 rangeOfString:@"core"];
      if (v13 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (!v13) {
        goto LABEL_13;
      }
      [*a5 stringByReplacingCharactersInRange:v13 withString:v12];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      ++v11;

      id v14 = +[NSFileManager defaultManager];
      unsigned __int8 v15 = [v14 fileExistsAtPath:*a5];

      if ((v15 & 1) == 0) {
        goto LABEL_11;
      }
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_13:
    _os_assert_log();
    BOOL result = _os_crash();
    __break(1u);
  }
  else
  {
LABEL_11:
    unsigned __int8 v16 = [(CoreFileHandler *)v19 saveCoreDumpAtOffset:v23 withLength:v22 named:v20 encryptedWithPublicKey:v18 toFileName:*a5 flags:v21];

    return v16;
  }
  return result;
}

- (BOOL)saveCoreDumpAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 named:(id)a5 encryptedWithPublicKey:(id)a6 toFileName:(id)a7 flags:(unsigned int)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    unint64_t v115 = (unint64_t)v14;
    __int16 v116 = 2048;
    unint64_t v117 = a3;
    __int16 v118 = 2048;
    unint64_t v119 = a4;
    __int16 v120 = 1024;
    unsigned int v121 = a8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found %@: offset: 0x%llx, length: 0x%llx, flags: 0x%x. Writing to disk", buf, 0x26u);
  }
  char v18 = a8;
  if (a8)
  {
    v43 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v44 = "On-disk zlib-compressed cores are not supported.";
LABEL_50:
    _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_32;
  }
  v110 = 0;
  v111 = 0;
  if (!&_AACustomByteStreamOpen)
  {
    v45 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "AppleArchive is not supported.";
LABEL_23:
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    }
LABEL_31:
    v43 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v44 = "Failed to open section input stream.";
    goto LABEL_50;
  }
  id v19 = v16;
  os_log_t log = v14;
  id v20 = v15;
  int corefile_fd = self->_corefile_fd;
  scratchBuf = self->_scratchBuf;
  unint64_t scratchBufSize = self->_scratchBufSize;
  v24 = malloc_type_calloc(1uLL, 0x30uLL, 0x101004041698121uLL);
  if (!v24)
  {
    v45 = qword_10003A5A8;
    id v15 = v20;
    id v14 = log;
    id v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "Failed to allocate section input stream data.";
      goto LABEL_23;
    }
    goto LABEL_31;
  }
  unint64_t v25 = v24;
  if (lseek(corefile_fd, a3, 0) == -1)
  {
    v47 = qword_10003A5A8;
    id v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v115 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to seek to offset %lld in kernelcore.", buf, 0xCu);
    }
    free(v25);
    id v15 = v20;
    goto LABEL_30;
  }
  *(_DWORD *)unint64_t v25 = corefile_fd;
  v25[1] = a4;
  v25[2] = scratchBuf;
  v25[4] = 0;
  v25[5] = 0;
  v25[3] = scratchBufSize;
  unint64_t v26 = AACustomByteStreamOpen();
  if (!v26)
  {
    unsigned __int8 v48 = qword_10003A5A8;
    id v15 = v20;
    id v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to allocate section input stream.", buf, 2u);
    }
    free(v25);
LABEL_30:
    id v14 = log;
    goto LABEL_31;
  }
  v27 = v26;
  AACustomByteStreamSetData(v26, v25);
  AACustomByteStreamSetReadProc(v27, (AAByteStreamReadProc)sub_100014894);
  AACustomByteStreamSetCloseProc(v27, (AAByteStreamCloseProc)sub_100014878);
  v112 = v27;
  id v15 = v20;
  id v16 = v19;
  if ((v18 & 4) != 0)
  {
    id v51 = [(ReadOnlyKeyStore *)self->_keystore getMatchingPrivateKey:1 :v20];
    v52 = v51;
    id v14 = log;
    unsigned int v31 = &unk_10003A000;
    if (!v51)
    {
      v66 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
LABEL_127:

        AAByteStreamClose(v27);
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      v67 = "Failed to find a matching private key for the public key.";
LABEL_129:
      _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v67, buf, 2u);
      goto LABEL_127;
    }
    id v53 = v51;
    if (&_AACustomByteStreamOpen)
    {
      unsigned int v54 = (AEAContext *)malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
      if (v54)
      {
        id v55 = v54;
        AEAContext v56 = AEAContextCreateWithEncryptedStream(v27);
        *id v55 = v56;
        if (!v56)
        {
          v81 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Failed to create an AEA context.", buf, 2u);
          }
          goto LABEL_125;
        }
        v57 = v56;
        id v107 = v53;
        id v106 = v53;
        int v58 = AEAContextSetFieldBlob(v57, 0xBu, 1u, (const uint8_t *)[v106 bytes], (size_t)[v106 length]);
        if (v58 < 0)
        {
          int v82 = v58;
          v83 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v115) = v82;
            _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Failed to set the private key. Error %d", buf, 8u);
          }
          AEAContextDestroy(*v55);
          free(v55);
          id v53 = v107;
          goto LABEL_126;
        }
        AAByteStream v59 = AEADecryptionInputStreamOpen(v27, *v55, 0, 1);
        v55[1] = v59;
        if (v59)
        {
          int v60 = AACustomByteStreamOpen();
          if (v60)
          {
            v28 = v60;
            AACustomByteStreamSetData(v60, v55);
            AACustomByteStreamSetReadProc(v28, (AAByteStreamReadProc)sub_100014A50);
            AACustomByteStreamSetCloseProc(v28, (AAByteStreamCloseProc)sub_1000149B4);

            v111 = v28;
            v29 = &v111;
            v30 = v28;
            if ((v18 & 2) == 0) {
              goto LABEL_10;
            }
            goto LABEL_42;
          }
          v96 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to allocate AEA decryption stream.", buf, 2u);
          }
          if (AAByteStreamClose(v55[1]) != -1) {
            goto LABEL_124;
          }
          v86 = qword_10003A5A8;
          if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_124;
          }
          *(_WORD *)buf = 0;
          v87 = "Failed to close AEA decrypt stream source.";
        }
        else
        {
          v86 = qword_10003A5A8;
          if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
LABEL_124:
            AEAContextDestroy(*v55);
LABEL_125:
            free(v55);
            goto LABEL_126;
          }
          *(_WORD *)buf = 0;
          v87 = "Failed to open AEA decryption stream.";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, v87, buf, 2u);
        goto LABEL_124;
      }
      id v68 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v69 = "Failed to allocate AEA decryption stream data.";
        goto LABEL_72;
      }
    }
    else
    {
      id v68 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v69 = "AppleArchive is not supported.";
LABEL_72:
        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, v69, buf, 2u);
      }
    }
LABEL_126:

    v66 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_127;
    }
    *(_WORD *)buf = 0;
    v67 = "Failed to open AEA decryption stream.";
    goto LABEL_129;
  }
  v28 = 0;
  v29 = &v112;
  v30 = v27;
  id v14 = log;
  unsigned int v31 = &unk_10003A000;
  if ((v18 & 2) == 0)
  {
LABEL_10:
    id v32 = 0;
    goto LABEL_11;
  }
LABEL_42:
  if (!&_AACustomByteStreamOpen)
  {
    v75 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_WORD *)buf = 0;
    v76 = "AppleArchive is not supported.";
LABEL_82:
    _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, v76, buf, 2u);
    goto LABEL_91;
  }
  if (!&_compression_stream_init)
  {
    v75 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_WORD *)buf = 0;
    v76 = "LZ4 decode stream is not supported.";
    goto LABEL_82;
  }
  unsigned int v61 = malloc_type_calloc(1uLL, 0x40uLL, 0x10F0040D5368861uLL);
  if (v61)
  {
    unint64_t v62 = v61;
    *unsigned int v61 = v30;
    v63 = malloc_type_calloc(1uLL, 0x8000uLL, 0x7161CB57uLL);
    v62[7] = v63;
    if (v63)
    {
      if (compression_stream_init((compression_stream *)(v62 + 1), COMPRESSION_STREAM_DECODE, COMPRESSION_LZ4) == COMPRESSION_STATUS_OK)
      {
        v95 = AACustomByteStreamOpen();
        if (v95)
        {
          id v32 = v95;
          AACustomByteStreamSetData(v95, v62);
          AACustomByteStreamSetReadProc(v32, (AAByteStreamReadProc)sub_100014B0C);
          AACustomByteStreamSetCloseProc(v32, (AAByteStreamCloseProc)sub_100014AD0);
          v110 = v32;
          v29 = &v110;
LABEL_11:
          unsigned int v33 = [v16 hasSuffix:@".gz"];
          v34 = (const char *)[v16 UTF8String];
          v35 = v34;
          if (!v33)
          {
            AAByteStream v70 = AAFileStreamOpenWithPath(v34, 1537, 0x1B6u);
            if (v70)
            {
              v41 = v70;
              v40 = 0;
              v42 = v70;
LABEL_57:
              unint64_t v71 = AAByteStreamProcess(*v29, v42);
              unint64_t v72 = v71 >> 63;
              if ((v71 & 0x8000000000000000) != 0)
              {
                unint64_t v73 = v71;
                loga = qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  unint64_t v115 = v73;
                  _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "Failed to process the coredump through the byte streams. Error %lld", buf, 0xCu);
                }
              }
              char v74 = v72 ^ 1;
              if (v41) {
                AAByteStreamClose(v41);
              }
              unsigned int v31 = &unk_10003A000;
              if (v40) {
                AAByteStreamClose(v40);
              }
              goto LABEL_102;
            }
            v79 = qword_10003A5A8;
            if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
            {
LABEL_101:
              char v74 = 0;
LABEL_102:
              if (v32) {
                AAByteStreamClose(v32);
              }
              goto LABEL_104;
            }
            *(_WORD *)buf = 0;
            v80 = "Failed to open file output stream.";
LABEL_131:
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, v80, buf, 2u);
            goto LABEL_101;
          }
          if (&_AACustomByteStreamOpen)
          {
            v36 = (gzFile *)malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
            if (v36)
            {
              v37 = v36;
              gzFile v38 = gzopen(v35, "wb");
              gzFile *v37 = v38;
              if (v38)
              {
                unint64_t v39 = AACustomByteStreamOpen();
                if (v39)
                {
                  v40 = v39;
                  AACustomByteStreamSetData(v39, v37);
                  AACustomByteStreamSetWriteProc(v40, (AAByteStreamWriteProc)sub_100014C80);
                  AACustomByteStreamSetCloseProc(v40, (AAByteStreamCloseProc)sub_100014C4C);
                  v41 = 0;
                  v42 = v40;
                  goto LABEL_57;
                }
                v88 = qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "Failed to allocate gzip output stream.", buf, 2u);
                }
                free(v37);
                gzclose(*v37);
              }
              else
              {
                v84 = (void *)qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  v103 = v84;
                  v104 = __error();
                  v105 = strerror(*v104);
                  *(_DWORD *)buf = 136315394;
                  unint64_t v115 = (unint64_t)v35;
                  __int16 v116 = 2080;
                  unint64_t v117 = (unint64_t)v105;
                  _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "gzopen(%s, wb) error: %s", buf, 0x16u);
                }
                free(v37);
                unsigned int v31 = &unk_10003A000;
              }
              goto LABEL_100;
            }
            v77 = qword_10003A5A8;
            if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v78 = "Failed to allocate gzip output stream data.";
              goto LABEL_79;
            }
          }
          else
          {
            v77 = qword_10003A5A8;
            if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v78 = "AppleArchive is not supported.";
LABEL_79:
              _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v78, buf, 2u);
            }
          }
LABEL_100:
          v79 = *((void *)v31 + 181);
          if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            goto LABEL_101;
          }
          *(_WORD *)buf = 0;
          v80 = "Failed to open gzip output stream.";
          goto LABEL_131;
        }
        id v64 = qword_10003A5A8;
        if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_90;
        }
        *(_WORD *)buf = 0;
        id v65 = "Failed to allocate lz4 decode stream.";
        goto LABEL_135;
      }
      id v64 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v65 = "Failed to initialize lz4 decode stream data.";
LABEL_135:
        _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v65, buf, 2u);
      }
    }
    else
    {
      id v64 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v65 = "Failed to allocate lz4 decode stream data buffer.";
        goto LABEL_135;
      }
    }
LABEL_90:
    free(v62);
    goto LABEL_91;
  }
  v75 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v76 = "Failed to allocate lz4 decode stream data.";
    goto LABEL_82;
  }
LABEL_91:
  v85 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Failed to open lz4 decode stream.", buf, 2u);
  }
  char v74 = 0;
LABEL_104:
  if (v28) {
    AAByteStreamClose(v28);
  }
  AAByteStreamClose(v27);
  if (v74)
  {
    v89 = (const char *)[v16 UTF8String];
    int v90 = open(v89, 0);
    if (v90 < 0)
    {
      v93 = *((void *)v31 + 181);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        v100 = v93;
        v101 = __error();
        v102 = strerror(*v101);
        *(_DWORD *)buf = 136315394;
        unint64_t v115 = (unint64_t)v89;
        __int16 v116 = 2080;
        unint64_t v117 = (unint64_t)v102;
        _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "Failed to open %s to mark as purgeable. Error: %s", buf, 0x16u);
      }
    }
    else
    {
      int v91 = v90;
      int v113 = 67589;
      if (!ffsctl(v90, 0xC0084A44uLL, &v113, 0))
      {
        close(v91);
LABEL_117:
        BOOL v49 = 1;
        goto LABEL_33;
      }
      v92 = *((void *)v31 + 181);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v97 = v92;
        v98 = __error();
        v99 = strerror(*v98);
        *(_DWORD *)buf = 136315394;
        unint64_t v115 = (unint64_t)v89;
        __int16 v116 = 2080;
        unint64_t v117 = (unint64_t)v99;
        _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "Failed to mark %s as purgeable. Error: %s", buf, 0x16u);
      }
      close(v91);
    }
    v94 = *((void *)v31 + 181);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Failed to mark the coredump output file as purgeable.", buf, 2u);
    }
    goto LABEL_117;
  }
LABEL_32:
  BOOL v49 = 0;
LABEL_33:

  return v49;
}

- (id)getCoreDumpContentsWithOffset:(unint64_t)a3 AndLength:(unint64_t)a4
{
  uint64_t v4 = qword_10003A5A8;
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "getCoreDumpContentsWithOffset called with zero length", buf, 2u);
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "copying %llu bytes", buf, 0xCu);
  }
  if (lseek(self->_corefile_fd, a3, 0) != -1)
  {
    uint64_t v8 = [objc_alloc((Class)NSMutableData) initWithLength:a4];
    id v9 = (char *)[v8 mutableBytes];
    unint64_t v10 = 0;
    while (1)
    {
      size_t v11 = self->_scratchBufSize >= ((a4 - v10 + vm_page_size - 1) & -(uint64_t)vm_page_size)
          ? (a4 - v10 + vm_page_size - 1) & -(uint64_t)vm_page_size
          : self->_scratchBufSize;
      ssize_t v12 = read(self->_corefile_fd, self->_scratchBuf, v11);
      if (v12 != v11) {
        break;
      }
      if (v11 >= a4 - v10) {
        size_t v11 = a4 - v10;
      }
      memmove(v9, self->_scratchBuf, v11);
      v10 += v11;
      v9 += v11;
      if (v10 >= a4)
      {
        v13 = qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v26 = a3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Finished extracting core file data from file offset %llu\n", buf, 0xCu);
        }
        goto LABEL_27;
      }
    }
    ssize_t v19 = v12;
    id v20 = qword_10003A5A8;
    BOOL v21 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
    if (v19 == -1)
    {
      if (v21)
      {
        uint64_t v23 = v20;
        int v24 = *__error();
        *(_DWORD *)buf = 134219008;
        unint64_t v26 = v11;
        __int16 v27 = 2048;
        unint64_t v28 = v10;
        __int16 v29 = 2048;
        unint64_t v30 = a3;
        __int16 v31 = 2048;
        unint64_t v32 = a4;
        __int16 v33 = 1024;
        LODWORD(v34) = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Read of %lu bytes from dataOffset %llu (file offset from %llu)(total length %llu) failed with error %{errno}d", buf, 0x30u);
      }
      goto LABEL_25;
    }
    if (!v21) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 134219008;
    unint64_t v26 = v11;
    __int16 v27 = 2048;
    unint64_t v28 = v10;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    __int16 v33 = 2048;
    ssize_t v34 = v19;
    id v16 = "Read of %lu bytes from dataOffset %llu (file offset from %llu)(total length %llu) only read %lu bytes";
    id v17 = v20;
    uint32_t v18 = 52;
LABEL_22:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
LABEL_25:

    goto LABEL_26;
  }
  id v14 = (void *)qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = v14;
    int v15 = *__error();
    *(_DWORD *)buf = 134218240;
    unint64_t v26 = a3;
    __int16 v27 = 1024;
    LODWORD(v28) = v15;
    id v16 = "lseek() to file offset 0x%llx returned -1 (%{errno}d)";
    id v17 = v8;
    uint32_t v18 = 18;
    goto LABEL_22;
  }
LABEL_26:
  uint64_t v8 = 0;
LABEL_27:

  return v8;
}

- (void)dealloc
{
  v2 = self;
  close(self->_corefile_fd);
  free(v2->_scratchBuf);
  if (v2->_zero_on_close)
  {
    unint64_t v3 = [(CoreFileHandler *)v2 getCorefileZeroRanges];
    uint64_t v4 = malloc_type_calloc(1uLL, 0x100000uLL, 0x57CD57BEuLL);
    if (!v4)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    v5 = v4;
    int v6 = open_dprotected_np([(NSString *)v2->_corefilePath UTF8String], 2, 0, 0);
    if (v6 == -1)
    {
      __int16 v27 = (void *)qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        corefilePath = v2->_corefilePath;
        __int16 v31 = v27;
        int v32 = *__error();
        *(_DWORD *)buf = 138412546;
        size_t v41 = (size_t)corefilePath;
        __int16 v42 = 1024;
        LODWORD(v43) = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "open_dprotected_np(%@, O_RDWR): -1 (%{errno}d)", buf, 0x12u);
      }
      free(v5);
    }
    else
    {
      int v7 = v6;
      ssize_t v34 = v2;
      fcntl(v6, 48, 1);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      __int16 v33 = v3;
      id v8 = v3;
      id v9 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v14 = [v13 objectAtIndexedSubscript:0];
            id v15 = [v14 unsignedLongLongValue];

            id v16 = [v13 objectAtIndexedSubscript:1];
            unint64_t v17 = (unint64_t)[v16 unsignedLongLongValue];

            if (lseek(v7, (off_t)v15, 0) == -1)
            {
              unint64_t v25 = (void *)qword_10003A5A8;
              if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
              {
                unint64_t v28 = v25;
                int v29 = *__error();
                *(_DWORD *)buf = 134218240;
                size_t v41 = (size_t)v15;
                __int16 v42 = 1024;
                LODWORD(v43) = v29;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "lseek() to file offset 0x%llx returned -1 (%{errno}d)", buf, 0x12u);
              }
              goto LABEL_27;
            }
            if (v17)
            {
              while (1)
              {
                size_t v18 = v17 >= 0x100000 ? 0x100000 : v17;
                ssize_t v19 = write(v7, v5, v18);
                if (v19 != v18) {
                  break;
                }
                v17 -= v18;
                if (!v17) {
                  goto LABEL_22;
                }
              }
              ssize_t v20 = v19;
              BOOL v21 = qword_10003A5A8;
              BOOL v22 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
              if (v20 == -1)
              {
                if (v22)
                {
                  uint64_t v23 = v21;
                  int v24 = *__error();
                  *(_DWORD *)buf = 134218240;
                  size_t v41 = v18;
                  __int16 v42 = 1024;
                  LODWORD(v43) = v24;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "error zeroing corefile: write(%zu): (%{errno}d)", buf, 0x12u);
                }
              }
              else if (v22)
              {
                *(_DWORD *)buf = 134218240;
                size_t v41 = v18;
                __int16 v42 = 2048;
                ssize_t v43 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "error zeroing corefile, attempted to write %zu bytes, wrote %zu bytes", buf, 0x16u);
              }
            }
LABEL_22:
            ;
          }
          id v10 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      fsync(v7);
      close(v7);
      free(v5);
      unint64_t v26 = qword_10003A5A8;
      unint64_t v3 = v33;
      v2 = v34;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "erased corefile contents", buf, 2u);
      }
    }
  }
  v35.receiver = v2;
  v35.super_class = (Class)CoreFileHandler;
  [(CoreFileHandler *)&v35 dealloc];
}

- (CoreFileHandler)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(unint64_t)a6 :(void *)a7 :(unint64_t)a8
{
  id v14 = a5;
  v47.receiver = self;
  v47.super_class = (Class)CoreFileHandler;
  id v15 = [(CoreFileHandler *)&v47 init];
  id v16 = v15;
  if (!v15) {
    goto LABEL_29;
  }
  v15->_unint64_t scratchBufSize = 0x100000;
  unint64_t v17 = malloc_type_aligned_alloc(vm_page_size, 0x100000uLL, 0x34CE2CF8uLL);
  v16->_scratchBuf = v17;
  if (!v17)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_34:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (v14)
  {
    size_t v18 = (ReadOnlyKeyStore *)v14;
  }
  else
  {
    ssize_t v19 = [LockedReadOnlyKeyStore alloc];
    size_t v18 = [(ReadOnlyKeyStore *)v19 init:qword_10003A5A8];
  }
  keystore = v16->_keystore;
  v16->_keystore = v18;

  v16->_zero_on_close = a4;
  uint64_t v21 = +[NSString stringWithUTF8String:a3];
  corefilePath = v16->_corefilePath;
  v16->_corefilePath = (NSString *)v21;

  int v23 = open_dprotected_np([(NSString *)v16->_corefilePath UTF8String], 0, 0, 2);
  v16->_int corefile_fd = v23;
  if (v23 == -1)
  {
    __int16 v31 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      int v32 = v16->_corefilePath;
      __int16 v33 = v31;
      int v34 = *__error();
      v52.st_dev = 138412546;
      *(void *)&v52.st_mode = v32;
      WORD2(v52.st_ino) = 1024;
      *(_DWORD *)((char *)&v52.st_ino + 6) = v34;
      objc_super v35 = "open_dprotected_np(%@, O_RDONLY): -1 (%{errno}d)";
      long long v36 = (uint8_t *)&v52;
LABEL_18:
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v35, v36, 0x12u);
    }
LABEL_29:
    unint64_t v30 = 0;
    goto LABEL_30;
  }
  memset(&v52, 0, sizeof(v52));
  if (fstat(v23, &v52) == -1)
  {
    long long v37 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v38 = (unint64_t)v16->_corefilePath;
      __int16 v33 = v37;
      int v39 = *__error();
      *(_DWORD *)buf = 138412546;
      unint64_t v49 = v38;
      __int16 v50 = 1024;
      LODWORD(v51) = v39;
      objc_super v35 = "stat(%@): -1 (%{errno}d)";
      long long v36 = buf;
      goto LABEL_18;
    }
    goto LABEL_29;
  }
  v16->_corefileSize = v52.st_size;
  size_t v24 = (a8 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  unint64_t v25 = malloc_type_aligned_alloc(vm_page_size, v24, 0xE0E8F204uLL);
  if (!v25) {
    goto LABEL_34;
  }
  unint64_t v26 = v25;
  ssize_t v27 = read(v16->_corefile_fd, v25, v24);
  if (v27 != v24)
  {
    ssize_t v40 = v27;
    size_t v41 = qword_10003A5A8;
    BOOL v42 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
    if (v40 == -1)
    {
      if (v42)
      {
        v45 = v41;
        int v46 = *__error();
        *(_DWORD *)buf = 134218240;
        unint64_t v49 = v24;
        __int16 v50 = 1024;
        LODWORD(v51) = v46;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "failed to read header from corefile (%zd bytes) with error: %{errno}d", buf, 0x12u);
      }
    }
    else if (v42)
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v49 = v24;
      __int16 v50 = 2048;
      unint64_t v51 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Read of %lu bytes from fileoffset 0 only read %lu bytes", buf, 0x16u);
    }
    free(v26);
    goto LABEL_28;
  }
  memmove(a7, v26, a8);
  free(v26);
  unint64_t v28 = *(void *)a7;
  if (*(void *)a7 != a6)
  {
    ssize_t v43 = qword_10003A5A8;
    if (v28)
    {
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v49 = v28;
        __int16 v50 = 2048;
        unint64_t v51 = a6;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "invalid core file signature: %#llx (expected :%#llx)", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "no core file data found", buf, 2u);
    }
LABEL_28:
    close(v16->_corefile_fd);
    goto LABEL_29;
  }
  int v29 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v49 = a6;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Found corefile with signature %#llx", buf, 0xCu);
  }
  unint64_t v30 = v16;
LABEL_30:

  return v30;
}

+ (id)coreFileWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  if (!v10)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v11 = v10;
  objc_storeStrong((id *)&qword_10003A5A8, a6);
  int v12 = open_dprotected_np(a3, 0, 0, 2);
  if (v12 == -1)
  {
    ssize_t v20 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v20;
      int v22 = *__error();
      int v36 = 136315394;
      long long v37 = a3;
      __int16 v38 = 1024;
      LODWORD(v39) = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "open_dprotected_np(%s, O_RDONLY): -1 (%{errno}d)", (uint8_t *)&v36, 0x12u);
    }
    goto LABEL_19;
  }
  int v13 = v12;
  vm_size_t v14 = (vm_page_size + 7) & -(uint64_t)vm_page_size;
  id v15 = (char **)malloc_type_aligned_alloc(vm_page_size, v14, 0x359BC122uLL);
  if (!v15)
  {
LABEL_37:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  id v16 = v15;
  ssize_t v17 = read(v13, v15, v14);
  if (v17 != v14)
  {
    ssize_t v23 = v17;
    size_t v24 = qword_10003A5A8;
    BOOL v25 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
    if (v23 == -1)
    {
      if (v25)
      {
        int v34 = v24;
        int v35 = *__error();
        int v36 = 134218240;
        long long v37 = (char *)v14;
        __int16 v38 = 1024;
        LODWORD(v39) = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "failed to read header from corefile (%zd bytes) with error: %{errno}d", (uint8_t *)&v36, 0x12u);
      }
    }
    else if (v25)
    {
      int v36 = 134218240;
      long long v37 = (char *)v14;
      __int16 v38 = 2048;
      uint64_t v39 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Read of %lu bytes from fileoffset 0 only read %lu bytes", (uint8_t *)&v36, 0x16u);
    }
    close(v13);
    goto LABEL_18;
  }
  size_t v18 = *v16;
  close(v13);
  if (!v18)
  {
    unint64_t v28 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "no core file data found", (uint8_t *)&v36, 2u);
    }
    goto LABEL_18;
  }
  if (v18 == (char *)0x63614D2073736F42)
  {
    if (v16[7])
    {
      ssize_t v19 = CoreFileHandlerV2;
      goto LABEL_27;
    }
    uint64_t v33 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v36) = 0;
    unint64_t v30 = "Skip handling kernel corefile which suggests 0 files present";
    goto LABEL_34;
  }
  if (v18 != (char *)0x63614D20646152)
  {
    uint64_t v29 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      int v36 = 134218496;
      long long v37 = v18;
      __int16 v38 = 2048;
      uint64_t v39 = 0x63614D20646152;
      __int16 v40 = 2048;
      uint64_t v41 = 0x63614D2073736F42;
      unint64_t v30 = "invalid core file signature: %#llx (expected :%#llx or %#llx)";
      __int16 v31 = v29;
      uint32_t v32 = 32;
LABEL_35:
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v36, v32);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (!v16[3])
  {
    uint64_t v33 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      unint64_t v30 = "Skip handling kernel corefile which suggests 0 files present";
LABEL_34:
      __int16 v31 = v33;
      uint32_t v32 = 2;
      goto LABEL_35;
    }
LABEL_18:
    free(v16);
LABEL_19:
    id v26 = 0;
    goto LABEL_20;
  }
  ssize_t v19 = CoreFileHandlerV1;
LABEL_27:
  id v26 = [[v19 alloc] initWithCoreFilePath:a3 :v7 :v9];
LABEL_20:

  return v26;
}

@end