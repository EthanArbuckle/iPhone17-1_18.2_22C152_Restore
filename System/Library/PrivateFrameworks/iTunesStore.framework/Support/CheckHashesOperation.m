@interface CheckHashesOperation
- (CheckHashesOperation)initWithFilePath:(id)a3 hashes:(id)a4 bytesToHash:(int64_t)a5;
- (NSArray)hashes;
- (NSString)filePath;
- (int64_t)numberOfBytesToHash;
- (void)dealloc;
- (void)run;
@end

@implementation CheckHashesOperation

- (CheckHashesOperation)initWithFilePath:(id)a3 hashes:(id)a4 bytesToHash:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CheckHashesOperation;
  v8 = [(CheckHashesOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_bytesToHash = a5;
    v8->_filePath = (NSString *)[a3 copy];
    v9->_hashes = (NSArray *)[a4 copy];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CheckHashesOperation;
  [(CheckHashesOperation *)&v3 dealloc];
}

- (NSString)filePath
{
  v2 = self->_filePath;

  return v2;
}

- (NSArray)hashes
{
  v2 = self->_hashes;

  return v2;
}

- (int64_t)numberOfBytesToHash
{
  return self->_bytesToHash;
}

- (void)run
{
  id v2 = +[SSLogConfig sharedDaemonConfig];
  if (!v2) {
    id v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    v3 |= 2u;
  }
  if (os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_INFO)) {
    int v4 = v3;
  }
  else {
    int v4 = v3 & 2;
  }
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    __darwin_ino64_t v6 = [(NSArray *)self->_hashes count];
    int64_t bytesToHash = self->_bytesToHash;
    filePath = self->_filePath;
    v79.st_dev = 138413058;
    *(void *)&v79.st_mode = v5;
    WORD2(v79.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v79.st_ino + 6) = v6;
    HIWORD(v79.st_gid) = 2048;
    *(void *)&v79.st_rdev = bytesToHash;
    LOWORD(v79.st_atimespec.tv_sec) = 2112;
    *(__darwin_time_t *)((char *)&v79.st_atimespec.tv_sec + 2) = (__darwin_time_t)filePath;
    LODWORD(v56) = 42;
    v54 = &v79;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      objc_super v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v79, v56);
      free(v10);
      v54 = (stat *)v11;
      SSFileLog();
    }
  }
  v12 = self;
  int v13 = open([(NSString *)self->_filePath fileSystemRepresentation], 0);
  if (v13 == -1)
  {
    __error();
    id v21 = (id)SSError();
    id v40 = +[SSLogConfig sharedDaemonConfig];
    if (!v40) {
      id v40 = +[SSLogConfig sharedConfig];
    }
    unsigned int v41 = [v40 shouldLog];
    if ([v40 shouldLogToDisk]) {
      v41 |= 2u;
    }
    if (os_log_type_enabled((os_log_t)[v40 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v42 = v41;
    }
    else {
      int v42 = v41 & 2;
    }
    if (v42)
    {
      uint64_t v43 = objc_opt_class();
      v79.st_dev = 138412546;
      *(void *)&v79.st_mode = v43;
      WORD2(v79.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v79.st_ino + 6) = (__darwin_ino64_t)v21;
      LODWORD(v56) = 22;
      p_CC_MD5_CTX c = (int *)&v79;
      uint64_t v44 = _os_log_send_and_compose_impl();
      if (v44)
      {
        v45 = (void *)v44;
        v46 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v79, v56);
        free(v45);
        p_CC_MD5_CTX c = (int *)v46;
        SSFileLog();
      }
    }
    uint64_t v47 = 0;
  }
  else
  {
    int64_t st_size = self->_bytesToHash;
    memset(&v79, 0, sizeof(v79));
    int v65 = v13;
    if (!fstat(v13, &v79)) {
      int64_t st_size = v79.st_size;
    }
    int64_t v15 = self->_bytesToHash;
    if ((id)[(NSArray *)self->_hashes count] == (id)1) {
      int64_t v16 = st_size;
    }
    else {
      int64_t v16 = v15;
    }
    uint64_t v17 = OBJC_IVAR___ISOperation__progress;
    [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setMaxValue:st_size];
    uint64_t v57 = v17;
    [*(id *)&self->ISOperation_opaque[v17] setUnits:1];
    v18 = malloc_type_malloc(0x20000uLL, 0x54475515uLL);
    if (v18)
    {
      v19 = v18;
      memset(&c, 0, sizeof(c));
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      obj = self->_hashes;
      id v60 = [(NSArray *)obj countByEnumeratingWithState:&v66 objects:v77 count:16];
      if (v60)
      {
        uint64_t v20 = 0;
        id v21 = 0;
        uint64_t v59 = *(void *)v67;
        LOBYTE(v22) = 1;
        int v23 = v65;
LABEL_20:
        id v24 = 0;
        while (1)
        {
          if (*(void *)v67 != v59) {
            objc_enumerationMutation(obj);
          }
          v63 = (char *)v24;
          uint64_t v61 = *(void *)(*((void *)&v66 + 1) + 8 * (void)v24);
          id v62 = objc_alloc_init((Class)NSAutoreleasePool);
          CC_MD5_Init(&c);
          int64_t v25 = 0;
          do
          {
            if (v16 <= v25) {
              break;
            }
            int64_t v26 = (unint64_t)(v16 - v25) >= 0x20000 ? 0x20000 : v16 - v25;
            ssize_t v27 = read(v23, v19, v26);
            if (v27 < 0)
            {

              __error();
              id v21 = (id)SSError();
              id v28 = +[SSLogConfig sharedDaemonConfig];
              if (!v28) {
                id v28 = +[SSLogConfig sharedConfig];
              }
              LODWORD(v22) = objc_msgSend(v28, "shouldLog", p_c, v56);
              if ([v28 shouldLogToDisk]) {
                LODWORD(v22) = v22 | 2;
              }
              if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                LODWORD(v22) = v22 & 2;
              }
              if (v22)
              {
                uint64_t v29 = objc_opt_class();
                int v70 = 138412546;
                uint64_t v71 = v29;
                __int16 v72 = 2112;
                id v73 = v21;
                LODWORD(v56) = 22;
                p_CC_MD5_CTX c = &v70;
                uint64_t v22 = _os_log_send_and_compose_impl();
                if (v22)
                {
                  v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v70, v56);
                  free((void *)v22);
                  p_CC_MD5_CTX c = (int *)v30;
                  SSFileLog();
                  LOBYTE(v22) = 0;
                }
              }
              int v23 = v65;
            }
            else
            {
              CC_MD5_Update(&c, v19, v27);
              v25 += v27;
              v20 += v27;
            }
          }
          while (v27 >= v26);
          if (v22)
          {
            CC_MD5_Final(md, &c);
            v32 = (void *)ISStringFromDigest();
            if ([v32 isEqualToString:v61])
            {
              [*(id *)&self->ISOperation_opaque[v57] setCurrentValue:v20];
              [*(id *)&self->ISOperation_opaque[v57] snapshot];
              [(CheckHashesOperation *)self sendProgressToDelegate];
              v31 = v63;
            }
            else
            {
              id v33 = +[SSLogConfig sharedDaemonConfig];
              if (!v33) {
                id v33 = +[SSLogConfig sharedConfig];
              }
              int v34 = objc_msgSend(v33, "shouldLog", p_c);
              if ([v33 shouldLogToDisk]) {
                v34 |= 2u;
              }
              int v35 = os_log_type_enabled((os_log_t)[v33 OSLogObject], OS_LOG_TYPE_DEFAULT) ? v34 : v34 & 2;
              v31 = v63;
              if (v35)
              {
                uint64_t v36 = objc_opt_class();
                int v70 = 138412802;
                uint64_t v71 = v36;
                __int16 v72 = 2112;
                id v73 = v32;
                __int16 v74 = 2112;
                uint64_t v75 = v61;
                LODWORD(v56) = 32;
                p_CC_MD5_CTX c = &v70;
                uint64_t v37 = _os_log_send_and_compose_impl();
                if (v37)
                {
                  v38 = (void *)v37;
                  v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v70, v56);
                  free(v38);
                  p_CC_MD5_CTX c = (int *)v39;
                  SSFileLog();
                }
              }

              id v21 = (id)SSError();
              LOBYTE(v22) = 0;
              int v23 = v65;
            }
          }
          else
          {
            v31 = v63;
          }
          objc_msgSend(v62, "drain", p_c);
          if ((v22 & 1) == 0) {
            break;
          }
          id v24 = v31 + 1;
          if (v24 == v60)
          {
            id v60 = [(NSArray *)obj countByEnumeratingWithState:&v66 objects:v77 count:16];
            if (v60) {
              goto LABEL_20;
            }
            break;
          }
        }
      }
      else
      {
        id v21 = 0;
        LOBYTE(v22) = 1;
        int v23 = v65;
      }
      free(v19);
      uint64_t v47 = v22 & 1;
      v12 = self;
    }
    else
    {
      id v48 = +[SSLogConfig sharedDaemonConfig];
      if (!v48) {
        id v48 = +[SSLogConfig sharedConfig];
      }
      unsigned int v49 = [v48 shouldLog];
      if ([v48 shouldLogToDisk]) {
        v49 |= 2u;
      }
      if (os_log_type_enabled((os_log_t)[v48 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        int v50 = v49;
      }
      else {
        int v50 = v49 & 2;
      }
      v12 = self;
      if (v50)
      {
        c.A = 138412290;
        *(void *)&c.B = objc_opt_class();
        LODWORD(v56) = 12;
        p_CC_MD5_CTX c = (int *)&c;
        uint64_t v51 = _os_log_send_and_compose_impl();
        if (v51)
        {
          v52 = (void *)v51;
          v53 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, &c, v56);
          free(v52);
          p_CC_MD5_CTX c = (int *)v53;
          SSFileLog();
        }
      }
      uint64_t v47 = 0;
      id v21 = 0;
      int v23 = v65;
    }
    close(v23);
  }
  -[CheckHashesOperation setError:](v12, "setError:", v21, p_c);
  [(CheckHashesOperation *)v12 setSuccess:v47];
}

@end