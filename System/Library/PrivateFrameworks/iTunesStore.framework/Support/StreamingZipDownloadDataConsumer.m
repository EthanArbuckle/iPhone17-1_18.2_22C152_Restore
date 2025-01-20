@interface StreamingZipDownloadDataConsumer
- (BOOL)consumeData:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)hasConsumedData;
- (StreamingZipDownloadDataConsumer)initWithPath:(id)a3 options:(id)a4;
- (double)percentComplete;
- (id)_stringWithFileSystemRepresentation:(const char *)a3;
- (id)_stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4;
- (unint64_t)_diskUsageForPath:(id)a3;
- (unint64_t)diskUsage;
- (unint64_t)resumptionOffset;
- (void)_initializeExtractorWithPath:(id)a3 options:(id)a4;
- (void)reset;
- (void)setExtractionProgress:(double)a3;
- (void)suspend;
- (void)truncate;
@end

@implementation StreamingZipDownloadDataConsumer

- (StreamingZipDownloadDataConsumer)initWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)StreamingZipDownloadDataConsumer;
  v8 = [(StreamingZipDownloadDataConsumer *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(StreamingZipDownloadDataConsumer *)v8 _initializeExtractorWithPath:v6 options:v7];
    v10 = *(void **)(&v9->super._overrideProgress + 1);
    if (v10)
    {
      [v10 setExtractorDelegate:v9];
      id v11 = [v7 copy];
      v12 = *(void **)(&v9->_hasConsumedData + 1);
      *(void *)(&v9->_hasConsumedData + 1) = v11;

      v13 = (NSDictionary *)[v6 copy];
      v14 = *(StreamingZipDownloadDataConsumer **)((char *)&v9->_options + 1);
      *(NSDictionary **)((char *)&v9->_options + 1) = v13;
    }
    else
    {
      v14 = v9;
      v9 = 0;
    }
  }
  return v9;
}

- (BOOL)consumeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100088254;
  v23 = sub_100088264;
  id v24 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = *(void **)(&self->super._overrideProgress + 1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008826C;
  v15[3] = &unk_1003A4E88;
  v17 = &v19;
  v18 = &v25;
  v9 = v7;
  objc_super v16 = v9;
  [v8 supplyBytes:v6 withCompletionBlock:v15];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = v26;
  if (BYTE1(self->_extractor)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = *((unsigned char *)v26 + 24) != 0;
  }
  BYTE1(self->_extractor) = v11;
  int v12 = *((unsigned __int8 *)v10 + 24);
  if (a4 && !*((unsigned char *)v10 + 24))
  {
    *a4 = (id) v20[5];
    int v12 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (unint64_t)diskUsage
{
  unint64_t result = [(StreamingZipDownloadDataConsumer *)self resumptionOffset];
  if (result)
  {
    uint64_t v4 = *(uint64_t *)((char *)&self->_options + 1);
    return [(StreamingZipDownloadDataConsumer *)self _diskUsageForPath:v4];
  }
  return result;
}

- (BOOL)finish:(id *)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100088254;
  uint64_t v19 = sub_100088264;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = *(void **)(&self->super._overrideProgress + 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000884CC;
  v11[3] = &unk_1003A4EB0;
  BOOL v13 = &v15;
  v14 = &v21;
  dispatch_semaphore_t v7 = v5;
  int v12 = v7;
  [v6 finishStreamWithCompletionBlock:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = *((unsigned __int8 *)v22 + 24);
  if (a3 && !*((unsigned char *)v22 + 24))
  {
    *a3 = (id) v16[5];
    int v8 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v9;
}

- (void)reset
{
  BYTE1(self->_extractor) = *(void *)((char *)&self->_percentComplete + 1) != 0;
}

- (void)suspend
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = *(void **)(&self->super._overrideProgress + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100088690;
  v6[3] = &unk_1003A4ED8;
  dispatch_semaphore_t v7 = v3;
  dispatch_semaphore_t v5 = v3;
  [v4 suspendStreamWithCompletionBlock:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)truncate
{
  [(StreamingZipDownloadDataConsumer *)self suspend];
  id v3 = objc_alloc_init((Class)NSFileManager);
  [v3 removeItemAtPath:*(NSDictionary **)((char *)&self->_options + 1) error:0];
  [(StreamingZipDownloadDataConsumer *)self _initializeExtractorWithPath:*(NSDictionary **)((char *)&self->_options + 1) options:*(void *)(&self->_hasConsumedData + 1)];
  BYTE1(self->_extractor) = *(void *)((char *)&self->_percentComplete + 1) != 0;
}

- (void)setExtractionProgress:(double)a3
{
  *(double *)((char *)&self->_path + 1) = a3;
}

- (void)_initializeExtractorWithPath:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithPath:v7 options:v6];

  BOOL v9 = *(void **)(&self->super._overrideProgress + 1);
  *(void *)(&self->super._overrideProgress + 1) = v8;

  id v10 = objc_alloc_init((Class)SSPromise);
  BOOL v11 = *(void **)(&self->super._overrideProgress + 1);
  BOOL v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_100088848;
  objc_super v16 = &unk_1003A4F00;
  uint64_t v17 = self;
  id v18 = v10;
  id v12 = v10;
  [v11 prepareForExtraction:&v13];
  objc_msgSend(v12, "waitUntilFinished", v13, v14, v15, v16, v17);
}

- (unint64_t)_diskUsageForPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableSet setWithCapacity:0];
  dispatch_semaphore_t v5 = +[NSMutableArray arrayWithCapacity:1];
  int v95 = 0;
  int v97 = 0;
  unint64_t v94 = 0xA200000900000005;
  uint64_t v96 = 0x500000002;
  id v6 = (unsigned int *)malloc_type_malloc(0x8000uLL, 0x14C8CDA7uLL);
  id v7 = &syslog_ptr;
  v86 = v3;
  if (v3)
  {
    [v5 addObject:v3];
    goto LABEL_16;
  }
  id v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    id v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  BOOL v11 = [v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    int v12 = v10;
  }
  else {
    int v12 = v10 & 2;
  }
  if (!v12) {
    goto LABEL_14;
  }
  int v98 = 138412290;
  id v99 = (id)objc_opt_class();
  id v13 = v99;
  LODWORD(v85) = 12;
  v83 = &v98;
  uint64_t v14 = (void *)_os_log_send_and_compose_impl();

  id v7 = &syslog_ptr;
  if (v14)
  {
    BOOL v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v98, v85, 0);
    free(v14);
    v83 = (int *)v11;
    SSFileLog();
LABEL_14:
  }
LABEL_16:
  if (objc_msgSend(v5, "count", v83))
  {
    unint64_t v91 = 0;
    v90 = v4;
    v89 = v5;
    v87 = v6;
    while (1)
    {
      uint64_t v15 = objc_msgSend(v5, "objectAtIndex:", 0, v84);
      [v5 removeObjectAtIndex:0];
      id v93 = v15;
      int v16 = open((const char *)[v93 fileSystemRepresentation], 1048832);
      if ((v16 & 0x80000000) == 0)
      {
        int v88 = v16;
        uint64_t v17 = 0;
LABEL_20:
        id v6 = v87;
        while (1)
        {
          int v18 = getattrlistbulk(v88, &v94, v87, 0x8000uLL, 0);
          if (v18 == -1) {
            break;
          }
          int v19 = v18;
          if (!v18) {
            goto LABEL_134;
          }
          if (v18 >= 1)
          {
            id v20 = v87;
            while (1)
            {
              uint64_t v22 = *v20;
              unsigned int v21 = v20[1];
              unsigned int v23 = v20[4];
              if ((v21 & 0x20000000) != 0)
              {
                if (v20[6])
                {
                  v31 = [v7[405] sharedDaemonConfig];
                  if (!v31)
                  {
                    v31 = [v7[405] sharedConfig];
                  }
                  unsigned int v32 = objc_msgSend(v31, "shouldLog", v84);
                  if ([v31 shouldLogToDisk]) {
                    v32 |= 2u;
                  }
                  v33 = [v31 OSLogObject];
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
                    int v34 = v32;
                  }
                  else {
                    int v34 = v32 & 2;
                  }
                  if (v34)
                  {
                    v35 = objc_opt_class();
                    id v36 = v35;
                    v37 = __error();
                    v38 = strerror(*v37);
                    int v98 = 138413058;
                    id v99 = v35;
                    __int16 v100 = 2080;
                    v101 = v38;
                    __int16 v102 = 2048;
                    v103 = v17;
                    __int16 v104 = 2112;
                    v105 = (char *)v93;
                    LODWORD(v85) = 42;
                    v84 = &v98;
                    v39 = (void *)_os_log_send_and_compose_impl();

                    id v7 = &syslog_ptr;
                    if (v39)
                    {
                      v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v98, v85);
                      free(v39);
                      v84 = (int *)v33;
                      SSFileLog();
                      goto LABEL_68;
                    }
                  }
                  else
                  {
                    id v7 = &syslog_ptr;
LABEL_68:
                  }
                  goto LABEL_105;
                }
                char v24 = (int *)(v20 + 7);
                if ((v21 & 1) == 0)
                {
LABEL_27:
                  int v25 = 0;
                  v26 = 0;
                  if ((v21 & 8) != 0) {
                    goto LABEL_28;
                  }
                  goto LABEL_43;
                }
              }
              else
              {
                char v24 = (int *)(v20 + 6);
                if ((v21 & 1) == 0) {
                  goto LABEL_27;
                }
              }
              int v25 = v24[1];
              v26 = (char *)v24 + *v24;
              v24 += 2;
              if ((v21 & 8) != 0)
              {
LABEL_28:
                int v28 = *v24++;
                int v27 = v28;
                if ((v21 & 0x2000000) != 0) {
                  goto LABEL_29;
                }
                goto LABEL_44;
              }
LABEL_43:
              int v27 = 0;
              if ((v21 & 0x2000000) != 0)
              {
LABEL_29:
                uint64_t v30 = *(void *)v24;
                v24 += 2;
                uint64_t v29 = v30;
                goto LABEL_45;
              }
LABEL_44:
              uint64_t v29 = 0;
LABEL_45:
              if (v27 == 2)
              {
                if ((v20[3] & 2) != 0 && !*v24)
                {
                  v52 = [v7[405] sharedDaemonConfig];
                  if (!v52)
                  {
                    v52 = [v7[405] sharedConfig];
                  }
                  unsigned int v60 = objc_msgSend(v52, "shouldLog", v84);
                  if ([v52 shouldLogToDisk]) {
                    v60 |= 2u;
                  }
                  v54 = [v52 OSLogObject];
                  if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                    v60 &= 2u;
                  }
                  if (v60)
                  {
                    v61 = objc_opt_class();
                    int v98 = 138412802;
                    id v99 = v61;
                    __int16 v100 = 2112;
                    v101 = (char *)v93;
                    __int16 v102 = 2080;
                    v103 = v26;
                    id v56 = v61;
                    LODWORD(v85) = 32;
                    v84 = &v98;
LABEL_101:
                    v62 = (void *)_os_log_send_and_compose_impl();

                    if (v62)
                    {
                      v54 = +[NSString stringWithCString:v62 encoding:4];
                      free(v62);
                      v84 = (int *)v54;
                      SSFileLog();
                      goto LABEL_103;
                    }
LABEL_104:

                    id v7 = &syslog_ptr;
                    goto LABEL_105;
                  }
LABEL_103:

                  goto LABEL_104;
                }
                if (!v26)
                {
                  v52 = [v7[405] sharedDaemonConfig];
                  if (!v52)
                  {
                    v52 = [v7[405] sharedConfig];
                  }
                  unsigned int v53 = objc_msgSend(v52, "shouldLog", v84);
                  if ([v52 shouldLogToDisk]) {
                    v53 |= 2u;
                  }
                  v54 = [v52 OSLogObject];
                  if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
                    v53 &= 2u;
                  }
                  if (v53)
                  {
                    v55 = objc_opt_class();
                    int v98 = 138412802;
                    id v99 = v55;
                    __int16 v100 = 2048;
                    v101 = v17;
                    __int16 v102 = 2112;
                    v103 = (char *)v93;
                    id v56 = v55;
                    LODWORD(v85) = 32;
                    v84 = &v98;
                    goto LABEL_101;
                  }
                  goto LABEL_103;
                }
                v41 = [(StreamingZipDownloadDataConsumer *)self _stringWithFileSystemRepresentation:v26 length:(v25 - 1)];
                v42 = [v93 stringByAppendingPathComponent:v41];

                if (!v42)
                {
                  v47 = [v7[405] sharedDaemonConfig];
                  if (!v47)
                  {
                    v47 = [v7[405] sharedConfig];
                  }
                  unsigned int v57 = objc_msgSend(v47, "shouldLog", v84);
                  if ([v47 shouldLogToDisk]) {
                    v57 |= 2u;
                  }
                  v49 = [v47 OSLogObject];
                  if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
                    v57 &= 2u;
                  }
                  if (!v57) {
                    goto LABEL_90;
                  }
                  v58 = objc_opt_class();
                  int v98 = 138412802;
                  id v99 = v58;
                  __int16 v100 = 2080;
                  v101 = v26;
                  __int16 v102 = 2112;
                  v103 = (char *)v93;
                  id v51 = v58;
                  LODWORD(v85) = 32;
                  v84 = &v98;
LABEL_88:
                  v59 = (void *)_os_log_send_and_compose_impl();

                  if (v59)
                  {
                    v49 = +[NSString stringWithCString:v59 encoding:4];
                    free(v59);
                    v84 = (int *)v49;
                    SSFileLog();
                    goto LABEL_90;
                  }
                  goto LABEL_91;
                }
                v43 = v89;
                goto LABEL_79;
              }
              if (v23)
              {
                int v46 = *v24++;
                int v44 = v46;
                if ((v23 & 4) == 0)
                {
LABEL_55:
                  uint64_t v45 = 0;
                  goto LABEL_56;
                }
              }
              else
              {
                int v44 = 0;
                if ((v23 & 4) == 0) {
                  goto LABEL_55;
                }
              }
              uint64_t v45 = *(void *)v24;
LABEL_56:
              if (v44 != 1)
              {
                v42 = +[NSNumber numberWithUnsignedLongLong:v29];
                if ([v90 containsObject:v42])
                {
                  v47 = [v7[405] sharedDaemonConfig];
                  if (!v47)
                  {
                    v47 = [v7[405] sharedConfig];
                  }
                  unsigned int v48 = objc_msgSend(v47, "shouldLog", v84);
                  if ([v47 shouldLogToDisk]) {
                    v48 |= 2u;
                  }
                  v49 = [v47 OSLogObject];
                  if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
                    v48 &= 2u;
                  }
                  if (v48)
                  {
                    v50 = objc_opt_class();
                    int v98 = 138412802;
                    id v99 = v50;
                    __int16 v100 = 2112;
                    v101 = (char *)v93;
                    __int16 v102 = 2080;
                    v103 = v26;
                    id v51 = v50;
                    LODWORD(v85) = 32;
                    v84 = &v98;
                    goto LABEL_88;
                  }
LABEL_90:

LABEL_91:
                  id v7 = &syslog_ptr;
LABEL_92:

                  goto LABEL_105;
                }
                v91 += v45;
                v43 = v90;
LABEL_79:
                objc_msgSend(v43, "addObject:", v42, v84);
                goto LABEL_92;
              }
              v91 += v45;
LABEL_105:
              id v20 = (unsigned int *)((char *)v20 + v22);
              ++v17;
              if (!--v19) {
                goto LABEL_20;
              }
            }
          }
        }
        v73 = [v7[405] sharedDaemonConfig];
        if (!v73)
        {
          v73 = [v7[405] sharedConfig];
        }
        unsigned int v74 = objc_msgSend(v73, "shouldLog", v84, v85);
        if ([v73 shouldLogToDisk]) {
          v74 |= 2u;
        }
        v75 = [v73 OSLogObject];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
          int v76 = v74;
        }
        else {
          int v76 = v74 & 2;
        }
        if (v76)
        {
          v77 = objc_opt_class();
          id v78 = v77;
          v79 = __error();
          v80 = strerror(*v79);
          int v98 = 138413058;
          id v99 = v77;
          __int16 v100 = 2048;
          v101 = v17;
          __int16 v102 = 2112;
          v103 = (char *)v93;
          __int16 v104 = 2080;
          v105 = v80;
          LODWORD(v85) = 42;
          v84 = &v98;
          v81 = (void *)_os_log_send_and_compose_impl();

          id v7 = &syslog_ptr;
          if (v81)
          {
            v75 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v81, 4, &v98, v85);
            free(v81);
            v84 = (int *)v75;
            SSFileLog();
            goto LABEL_132;
          }
        }
        else
        {
          id v7 = &syslog_ptr;
LABEL_132:
        }
LABEL_134:
        close(v88);
        uint64_t v4 = v90;
        dispatch_semaphore_t v5 = v89;
        goto LABEL_135;
      }
      v63 = [v7[405] sharedDaemonConfig];
      if (!v63)
      {
        v63 = [v7[405] sharedConfig];
      }
      int v64 = [v63 shouldLog];
      int v65 = [v63 shouldLogToDisk] ? v64 | 2 : v64;
      v66 = [v63 OSLogObject];
      if (!(os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT) ? v65 : v65 & 2)) {
        break;
      }
      v68 = objc_opt_class();
      id v69 = v68;
      v70 = __error();
      v71 = strerror(*v70);
      int v98 = 138412802;
      id v99 = v68;
      __int16 v100 = 2112;
      v101 = (char *)v93;
      __int16 v102 = 2080;
      v103 = v71;
      LODWORD(v85) = 32;
      v84 = &v98;
      v72 = (void *)_os_log_send_and_compose_impl();

      id v7 = &syslog_ptr;
      if (v72)
      {
        v66 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v72, 4, &v98, v85);
        free(v72);
        v84 = (int *)v66;
        SSFileLog();
LABEL_129:
      }
LABEL_135:

      if (![v5 count]) {
        goto LABEL_138;
      }
    }
    id v7 = &syslog_ptr;
    goto LABEL_129;
  }
  unint64_t v91 = 0;
LABEL_138:
  free(v6);

  return v91;
}

- (id)_stringWithFileSystemRepresentation:(const char *)a3
{
  size_t v5 = strlen(a3);

  return [(StreamingZipDownloadDataConsumer *)self _stringWithFileSystemRepresentation:a3 length:v5];
}

- (id)_stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4
{
  id v6 = +[NSFileManager defaultManager];
  id v7 = [v6 stringWithFileSystemRepresentation:a3 length:a4];

  return v7;
}

- (BOOL)hasConsumedData
{
  return BYTE1(self->_extractor);
}

- (double)percentComplete
{
  return *(double *)((char *)&self->_path + 1);
}

- (unint64_t)resumptionOffset
{
  return *(void *)((char *)&self->_percentComplete + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_options + 1), 0);
  objc_storeStrong((id *)(&self->_hasConsumedData + 1), 0);

  objc_storeStrong((id *)(&self->super._overrideProgress + 1), 0);
}

@end