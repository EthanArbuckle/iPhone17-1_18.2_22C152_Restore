@interface BundleValidator
- (BOOL)_extraMetaDataFromBOM:(id)a3 error:(id *)a4;
- (BOOL)_verifyBundleIdentfiier:(id)a3 bundleVersion:(id)a4 packagePath:(id)a5;
- (BOOL)validate:(id *)a3;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)sourceURL;
- (id)_createScratchDirectory;
- (id)_newBOMCopierOptions;
- (int)bundleFileType;
- (void)_removeScratchDirectory:(id)a3;
- (void)setBundleFileType:(int)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation BundleValidator

- (BOOL)validate:(id *)a3
{
  if (self->_sourceURL)
  {
    v4 = a3;
    v5 = +[NSFileManager defaultManager];
    char v104 = 0;
    unsigned int v6 = [v5 fileExistsAtPath:self->_sourceURL isDirectory:&v104];
    id v7 = +[NSURL URLWithString:self->_sourceURL];
    LOBYTE(value) = 110;
    id v8 = v7;
    ssize_t v9 = getxattr((const char *)[v8 fileSystemRepresentation], "com.apple.streamingzip.incomplete_extraction", &value, 1uLL, 0, 1);
    if (v9 == -1)
    {
      if (*__error() == 93) {
        goto LABEL_40;
      }
      if (*__error() == 34)
      {
LABEL_4:

        v10 = +[SSLogConfig sharedDaemonConfig];
        if (!v10)
        {
          v10 = +[SSLogConfig sharedConfig];
        }
        unsigned int v11 = [v10 shouldLog];
        if ([v10 shouldLogToDisk]) {
          int v12 = v11 | 2;
        }
        else {
          int v12 = v11;
        }
        v13 = [v10 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          int v14 = v12;
        }
        else {
          int v14 = v12 & 2;
        }
        if (!v14) {
          goto LABEL_114;
        }
        goto LABEL_112;
      }
    }
    else if ((v9 & 0x8000000000000000) == 0)
    {
      goto LABEL_4;
    }
    v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    v27 = [v24 OSLogObject];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      v26 &= 2u;
    }
    if (v26)
    {
      v28 = v5;
      v29 = v4;
      id v30 = [v8 fileSystemRepresentation];
      v31 = __error();
      v32 = strerror(*v31);
      int v106 = 136315650;
      *(void *)v107 = "com.apple.streamingzip.incomplete_extraction";
      *(_WORD *)&v107[8] = 2080;
      ssize_t v108 = (ssize_t)v30;
      v4 = v29;
      v5 = v28;
      *(_WORD *)v109 = 2080;
      *(void *)&v109[2] = v32;
      LODWORD(v102) = 32;
      v100 = &v106;
      v33 = (void *)_os_log_send_and_compose_impl();

      if (!v33)
      {
LABEL_39:

LABEL_40:
        if (v104) {
          unsigned int v34 = 0;
        }
        else {
          unsigned int v34 = v6;
        }
        if (v34 != 1)
        {
          if (v104)
          {
            if ([(BundleValidator *)self _verifyBundleIdentfiier:self->_bundleIdentifier bundleVersion:self->_bundleVersion packagePath:self->_sourceURL])
            {
              id v15 = 0;
              BOOL v23 = 1;
            }
            else
            {
              id v15 = +[NSError errorWithDomain:SSErrorDomain code:143 userInfo:0];
              BOOL v23 = 0;
              if (v4) {
                goto LABEL_116;
              }
            }
            goto LABEL_118;
          }
          v10 = +[SSLogConfig sharedDaemonConfig];
          if (!v10)
          {
            v10 = +[SSLogConfig sharedConfig];
          }
          unsigned int v53 = objc_msgSend(v10, "shouldLog", v100);
          if ([v10 shouldLogToDisk]) {
            int v54 = v53 | 2;
          }
          else {
            int v54 = v53;
          }
          v13 = [v10 OSLogObject];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            int v55 = v54;
          }
          else {
            int v55 = v54 & 2;
          }
          if (!v55) {
            goto LABEL_114;
          }
LABEL_112:
          v74 = objc_opt_class();
          bundleIdentifier = self->_bundleIdentifier;
          sourceURL = self->_sourceURL;
          int v106 = 138412802;
          *(void *)v107 = v74;
          *(_WORD *)&v107[8] = 2112;
          ssize_t v108 = (ssize_t)bundleIdentifier;
          *(_WORD *)v109 = 2112;
          *(void *)&v109[2] = sourceURL;
          id v77 = v74;
          LODWORD(v102) = 32;
          v78 = (void *)_os_log_send_and_compose_impl();

          if (!v78) {
            goto LABEL_115;
          }
          v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v78, 4, &v106, v102);
          free(v78);
          SSFileLog();
LABEL_114:

LABEL_115:
          BOOL v23 = 0;
          id v15 = 0;
          if (v4) {
            goto LABEL_116;
          }
          goto LABEL_118;
        }
        id v35 = +[NSURL URLWithString:self->_sourceURL];
        int value = 0;
        id v36 = v35;
        int v37 = open((const char *)[v36 fileSystemRepresentation], 256);
        if ((v37 & 0x80000000) == 0)
        {
          int v38 = v37;
          ssize_t v39 = read(v37, &value, 4uLL);
          if (v39 == 4)
          {
            if (value == 67324752)
            {
              close(v38);

              v40 = [(BundleValidator *)self _createScratchDirectory];
              if (v40)
              {
                v41 = +[NSURL URLWithString:v40];
                id v103 = 0;
                unsigned int v42 = [(BundleValidator *)self _extraMetaDataFromBOM:v41 error:&v103];
                id v15 = v103;

                if (v42)
                {
                  if ([(BundleValidator *)self _verifyBundleIdentfiier:self->_bundleIdentifier bundleVersion:self->_bundleVersion packagePath:v40])
                  {
                    char v43 = 1;
                  }
                  else
                  {
                    uint64_t v99 = +[NSError errorWithDomain:SSErrorDomain code:143 userInfo:0];

                    char v43 = 0;
                    id v15 = (id)v99;
                  }
                  goto LABEL_149;
                }
LABEL_134:
                v90 = +[SSLogConfig sharedDaemonConfig];
                if (!v90)
                {
                  v90 = +[SSLogConfig sharedConfig];
                }
                unsigned int v91 = [v90 shouldLog];
                if ([v90 shouldLogToDisk]) {
                  int v92 = v91 | 2;
                }
                else {
                  int v92 = v91;
                }
                v93 = [v90 OSLogObject];
                if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
                  int v94 = v92;
                }
                else {
                  int v94 = v92 & 2;
                }
                if (v94)
                {
                  v95 = objc_opt_class();
                  v96 = self->_bundleIdentifier;
                  int v106 = 138412546;
                  *(void *)v107 = v95;
                  *(_WORD *)&v107[8] = 2112;
                  ssize_t v108 = (ssize_t)v96;
                  id v97 = v95;
                  LODWORD(v102) = 22;
                  v100 = &v106;
                  v98 = (void *)_os_log_send_and_compose_impl();

                  if (!v98) {
                    goto LABEL_146;
                  }
                  v93 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v98, 4, &v106, v102);
                  free(v98);
                  v100 = (int *)v93;
                  SSFileLog();
                }

LABEL_146:
                char v43 = 0;
                BOOL v23 = 0;
                if (!v40)
                {
LABEL_150:

                  if (v4)
                  {
LABEL_116:
                    if (!v23)
                    {
                      id v15 = v15;
                      BOOL v23 = 0;
                      id *v4 = v15;
                    }
                  }
LABEL_118:

                  goto LABEL_119;
                }
LABEL_149:
                -[BundleValidator _removeScratchDirectory:](self, "_removeScratchDirectory:", v40, v100);
                BOOL v23 = v43;
                goto LABEL_150;
              }
              v80 = +[SSLogConfig sharedDaemonConfig];
              if (!v80)
              {
                v80 = +[SSLogConfig sharedConfig];
              }
              unsigned int v81 = objc_msgSend(v80, "shouldLog", v100);
              if ([v80 shouldLogToDisk]) {
                int v82 = v81 | 2;
              }
              else {
                int v82 = v81;
              }
              v83 = [v80 OSLogObject];
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                int v84 = v82;
              }
              else {
                int v84 = v82 & 2;
              }
              if (v84)
              {
                v85 = objc_opt_class();
                v86 = self->_bundleIdentifier;
                v87 = self->_sourceURL;
                int v106 = 138412802;
                *(void *)v107 = v85;
                *(_WORD *)&v107[8] = 2112;
                ssize_t v108 = (ssize_t)v86;
                *(_WORD *)v109 = 2112;
                *(void *)&v109[2] = v87;
                id v88 = v85;
                LODWORD(v102) = 32;
                v100 = &v106;
                v89 = (void *)_os_log_send_and_compose_impl();

                if (!v89)
                {
LABEL_133:

                  id v15 = 0;
                  goto LABEL_134;
                }
                v83 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v89, 4, &v106, v102);
                free(v89);
                v100 = (int *)v83;
                SSFileLog();
              }

              goto LABEL_133;
            }
            v57 = +[SSLogConfig sharedDaemonConfig];
            if (!v57)
            {
              v57 = +[SSLogConfig sharedConfig];
            }
            unsigned int v67 = objc_msgSend(v57, "shouldLog", v100);
            if ([v57 shouldLogToDisk]) {
              int v68 = v67 | 2;
            }
            else {
              int v68 = v67;
            }
            v60 = [v57 OSLogObject];
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
              int v69 = v68;
            }
            else {
              int v69 = v68 & 2;
            }
            if (v69)
            {
              int v106 = 67110912;
              *(_DWORD *)v107 = (char)value;
              *(_WORD *)&v107[4] = 1024;
              *(_DWORD *)&v107[6] = SBYTE1(value);
              LOWORD(v108) = 1024;
              *(_DWORD *)((char *)&v108 + 2) = SBYTE2(value);
              HIWORD(v108) = 1024;
              *(_DWORD *)v109 = SHIBYTE(value);
              *(_WORD *)&v109[4] = 1024;
              *(_DWORD *)&v109[6] = 80;
              __int16 v110 = 1024;
              *(_DWORD *)v111 = 75;
              *(_WORD *)&v111[4] = 1024;
              *(_DWORD *)&v111[6] = 3;
              __int16 v112 = 1024;
              int v113 = 4;
              LODWORD(v102) = 50;
              v101 = &v106;
              v70 = (void *)_os_log_send_and_compose_impl();

              if (!v70)
              {
LABEL_102:

                close(v38);
LABEL_103:

                v10 = +[SSLogConfig sharedDaemonConfig];
                if (!v10)
                {
                  v10 = +[SSLogConfig sharedConfig];
                }
                unsigned int v71 = objc_msgSend(v10, "shouldLog", v101);
                if ([v10 shouldLogToDisk]) {
                  int v72 = v71 | 2;
                }
                else {
                  int v72 = v71;
                }
                v13 = [v10 OSLogObject];
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                  int v73 = v72;
                }
                else {
                  int v73 = v72 & 2;
                }
                if (!v73) {
                  goto LABEL_114;
                }
                goto LABEL_112;
              }
              v60 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v70, 4, &v106, v102);
              free(v70);
              v101 = (int *)v60;
              SSFileLog();
            }
          }
          else
          {
            ssize_t v56 = v39;
            v57 = +[SSLogConfig sharedDaemonConfig];
            if (!v57)
            {
              v57 = +[SSLogConfig sharedConfig];
            }
            unsigned int v58 = objc_msgSend(v57, "shouldLog", v100);
            if ([v57 shouldLogToDisk]) {
              int v59 = v58 | 2;
            }
            else {
              int v59 = v58;
            }
            v60 = [v57 OSLogObject];
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
              int v61 = v59;
            }
            else {
              int v61 = v59 & 2;
            }
            if (v61)
            {
              v62 = v4;
              id v63 = [v36 fileSystemRepresentation];
              v64 = __error();
              v65 = strerror(*v64);
              int v106 = 134218754;
              *(void *)v107 = 4;
              *(_WORD *)&v107[8] = 2048;
              ssize_t v108 = v56;
              *(_WORD *)v109 = 2080;
              *(void *)&v109[2] = v63;
              __int16 v110 = 2080;
              *(void *)v111 = v65;
              LODWORD(v102) = 42;
              v101 = &v106;
              v66 = (void *)_os_log_send_and_compose_impl();

              if (!v66)
              {
                v4 = v62;
                goto LABEL_102;
              }
              v60 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v66, 4, &v106, v102);
              free(v66);
              v101 = (int *)v60;
              SSFileLog();
              v4 = v62;
            }
          }

          goto LABEL_102;
        }
        v44 = +[SSLogConfig sharedDaemonConfig];
        if (!v44)
        {
          v44 = +[SSLogConfig sharedConfig];
        }
        unsigned int v45 = objc_msgSend(v44, "shouldLog", v100);
        if ([v44 shouldLogToDisk]) {
          int v46 = v45 | 2;
        }
        else {
          int v46 = v45;
        }
        v47 = [v44 OSLogObject];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          int v48 = v46;
        }
        else {
          int v48 = v46 & 2;
        }
        if (v48)
        {
          id v49 = [v36 fileSystemRepresentation];
          v50 = __error();
          v51 = strerror(*v50);
          int v106 = 136315394;
          *(void *)v107 = v49;
          *(_WORD *)&v107[8] = 2080;
          ssize_t v108 = (ssize_t)v51;
          LODWORD(v102) = 22;
          v101 = &v106;
          v52 = (void *)_os_log_send_and_compose_impl();

          if (!v52)
          {
LABEL_66:

            goto LABEL_103;
          }
          v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, &v106, v102);
          free(v52);
          v101 = (int *)v47;
          SSFileLog();
        }

        goto LABEL_66;
      }
      v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v106, v102);
      free(v33);
      v100 = (int *)v27;
      SSFileLog();
    }

    goto LABEL_39;
  }
  id v15 = +[SSLogConfig sharedDaemonConfig];
  if (!v15)
  {
    id v15 = +[SSLogConfig sharedConfig];
  }
  unsigned int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_24;
  }
  v19 = objc_opt_class();
  v20 = self->_bundleIdentifier;
  int v106 = 138412546;
  *(void *)v107 = v19;
  *(_WORD *)&v107[8] = 2112;
  ssize_t v108 = (ssize_t)v20;
  id v21 = v19;
  LODWORD(v102) = 22;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v106, v102);
    free(v22);
    SSFileLog();
LABEL_24:
  }
  BOOL v23 = 0;
LABEL_119:

  return v23;
}

- (id)_createScratchDirectory
{
  v2 = +[NSFileManager defaultManager];
  if (qword_100401EA0 != -1) {
    dispatch_once(&qword_100401EA0, &stru_1003A7268);
  }
  v3 = +[NSString stringWithString:qword_100401E98];
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];

  unsigned int v6 = [v3 stringByAppendingPathComponent:v5];
  id v19 = 0;
  unsigned int v7 = [v2 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v8 = v19;
  id v9 = 0;
  if (v7)
  {
    v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v14 = objc_opt_class();
      int v20 = 138412802;
      id v21 = v14;
      __int16 v22 = 2112;
      BOOL v23 = v6;
      __int16 v24 = 1024;
      int v25 = 1;
      id v15 = v14;
      LODWORD(v18) = 28;
      unsigned int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        id v9 = v6;
        goto LABEL_16;
      }
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v20, v18);
      free(v16);
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (BOOL)_extraMetaDataFromBOM:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!BOMCopierNew())
  {
    int v26 = 0;
    BOOL v17 = 0;
    if (!a4) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  BOMCopierSetUserData();
  BOMCopierSetCopyFileStartedHandler();
  BOMCopierSetFatalErrorHandler();
  BOMCopierSetFatalFileErrorHandler();
  BOMCopierSetFileConflictErrorHandler();
  BOMCopierSetFileErrorHandler();
  unsigned int v7 = [(NSString *)self->_sourceURL fileSystemRepresentation];
  id v8 = [v6 fileSystemRepresentation];
  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  int v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v30 = 138412802;
    id v31 = (id)objc_opt_class();
    __int16 v32 = 2080;
    v33 = v7;
    __int16 v34 = 2080;
    id v35 = v8;
    id v13 = v31;
    LODWORD(v29) = 32;
    v28 = &v30;
    int v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_13;
    }
    int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v30, v29);
    free(v14);
    v28 = (int *)v12;
    SSFileLog();
  }

LABEL_13:
  id v15 = [(BundleValidator *)self _newBOMCopierOptions];
  int v16 = BOMCopierCopyWithOptions();
  BOOL v17 = v16 == 0;
  if (v16)
  {
    int v18 = v16;
    id v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      id v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = objc_msgSend(v19, "shouldLog", v28);
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    __int16 v22 = [v19 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      v21 &= 2u;
    }
    if (v21)
    {
      BOOL v23 = objc_opt_class();
      int v30 = 138412546;
      id v31 = v23;
      __int16 v32 = 1024;
      LODWORD(v33) = v18;
      id v24 = v23;
      LODWORD(v29) = 18;
      int v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_25:

        int v26 = ISError();
        goto LABEL_29;
      }
      __int16 v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v30, v29);
      free(v25);
      SSFileLog();
    }

    goto LABEL_25;
  }
  int v26 = 0;
LABEL_29:
  BOMCopierFree();

  if (a4) {
LABEL_30:
  }
    *a4 = v26;
LABEL_31:

  return v17;
}

- (id)_newBOMCopierOptions
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(BundleValidator *)self bundleFileType];
  if (v4 == 1)
  {
    CFStringRef v5 = @"extractCPIO";
    goto LABEL_5;
  }
  if (!v4)
  {
    CFStringRef v5 = @"extractPKZip";
LABEL_5:
    [v3 setObject:kCFBooleanTrue forKey:v5];
  }
  return v3;
}

- (void)_removeScratchDirectory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  [v4 removeItemAtPath:v3 error:0];
}

- (BOOL)_verifyBundleIdentfiier:(id)a3 bundleVersion:(id)a4 packagePath:(id)a5
{
  unsigned int v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSFileManager);
  int v82 = v9;
  int v11 = [v9 stringByAppendingPathComponent:@"Payload"];
  id v89 = 0;
  unsigned int v81 = v10;
  int v12 = [v10 contentsOfDirectoryAtPath:v11 error:&v89];
  id v79 = v89;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v86;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v86 != v16) {
        objc_enumerationMutation(v13);
      }
      int v18 = *(void **)(*((void *)&v85 + 1) + 8 * v17);
      if ([v18 hasSuffix:@".app"]) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [v13 countByEnumeratingWithState:&v85 objects:v96 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v19 = [v18 copy];
    unsigned int v20 = +[SSLogConfig sharedDaemonConfig];
    if (!v20)
    {
      unsigned int v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    BOOL v23 = [v20 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      v22 &= 2u;
    }
    if (v22)
    {
      id v24 = objc_opt_class();
      int v90 = 138412546;
      unsigned int v91 = v24;
      __int16 v92 = 2112;
      v93 = v19;
      id v25 = v24;
      LODWORD(v74) = 22;
      unsigned int v71 = &v90;
      int v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_21:

        goto LABEL_22;
      }
      BOOL v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v90, v74);
      free(v26);
      unsigned int v71 = (int *)v23;
      SSFileLog();
    }

    goto LABEL_21;
  }
LABEL_9:
  id v19 = 0;
LABEL_22:

  v27 = +[SSLogConfig sharedDaemonConfig];
  if (!v27)
  {
    v27 = +[SSLogConfig sharedConfig];
  }
  unsigned int v28 = objc_msgSend(v27, "shouldLog", v71);
  if ([v27 shouldLogToDisk]) {
    int v29 = v28 | 2;
  }
  else {
    int v29 = v28;
  }
  int v30 = [v27 OSLogObject];
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
    v29 &= 2u;
  }
  if (v29)
  {
    id v31 = objc_opt_class();
    int v90 = 138412546;
    unsigned int v91 = v31;
    __int16 v92 = 2112;
    v93 = v11;
    id v32 = v31;
    LODWORD(v74) = 22;
    int v72 = &v90;
    v33 = (void *)_os_log_send_and_compose_impl();

    if (!v33) {
      goto LABEL_33;
    }
    int v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v90, v74);
    free(v33);
    int v72 = (int *)v30;
    SSFileLog();
  }

LABEL_33:
  v80 = v11;
  v78 = v19;
  if (v19)
  {
    __int16 v34 = [v11 stringByAppendingPathComponent:v19];
    id v35 = [v34 stringByAppendingPathComponent:@"Info.plist"];
    id v36 = +[SSLogConfig sharedDaemonConfig];
    if (!v36)
    {
      id v36 = +[SSLogConfig sharedConfig];
    }
    unsigned int v37 = objc_msgSend(v36, "shouldLog", v72);
    if ([v36 shouldLogToDisk]) {
      int v38 = v37 | 2;
    }
    else {
      int v38 = v37;
    }
    ssize_t v39 = [v36 OSLogObject];
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
      v38 &= 2u;
    }
    if (v38)
    {
      v40 = objc_opt_class();
      int v90 = 138412546;
      unsigned int v91 = v40;
      __int16 v92 = 2112;
      v93 = v35;
      id v41 = v40;
      LODWORD(v74) = 22;
      int v73 = &v90;
      unsigned int v42 = (void *)_os_log_send_and_compose_impl();

      if (!v42) {
        goto LABEL_45;
      }
      ssize_t v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v90, v74);
      free(v42);
      int v73 = (int *)v39;
      SSFileLog();
    }

LABEL_45:
    id v43 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v35];
    v44 = v43;
    if (!v43)
    {
      unsigned int v45 = +[SSLogConfig sharedDaemonConfig];
      if (!v45)
      {
        unsigned int v45 = +[SSLogConfig sharedConfig];
      }
      unsigned int v66 = [v45 shouldLog];
      if ([v45 shouldLogToDisk]) {
        LODWORD(v54) = v66 | 2;
      }
      else {
        LODWORD(v54) = v66;
      }
      int v46 = [v45 OSLogObject];
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        LODWORD(v54) = v54 & 2;
      }
      if (v54)
      {
        unsigned int v67 = objc_opt_class();
        bundleIdentifier = self->_bundleIdentifier;
        int v90 = 138412546;
        unsigned int v91 = v67;
        __int16 v92 = 2112;
        v93 = bundleIdentifier;
        id v69 = v67;
        LODWORD(v74) = 22;
        uint64_t v54 = _os_log_send_and_compose_impl();

        if (!v54)
        {
LABEL_93:

          goto LABEL_94;
        }
        int v46 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v54, 4, &v90, v74);
        free((void *)v54);
        SSFileLog();
        LOBYTE(v54) = 0;
      }
      goto LABEL_92;
    }
    unsigned int v45 = [v43 objectForKey:kCFBundleVersionKey];
    int v46 = [v44 objectForKey:kCFBundleIdentifierKey];
    id v77 = v8;
    if ([v8 isEqualToString:v45])
    {
LABEL_59:
      LOBYTE(v54) = -[NSObject isEqualToString:](v7, "isEqualToString:", v46, v73);
      if ((v54 & 1) == 0)
      {
        v76 = v7;
        int v55 = +[SSLogConfig sharedDaemonConfig];
        if (!v55)
        {
          int v55 = +[SSLogConfig sharedConfig];
        }
        unsigned int v56 = [v55 shouldLog];
        if ([v55 shouldLogToDisk]) {
          int v57 = v56 | 2;
        }
        else {
          int v57 = v56;
        }
        unsigned int v58 = [v55 OSLogObject];
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          v57 &= 2u;
        }
        if (v57)
        {
          int v59 = objc_opt_class();
          int v90 = 138412802;
          unsigned int v91 = v59;
          __int16 v92 = 2112;
          v93 = v76;
          __int16 v94 = 2112;
          v95 = v46;
          id v84 = v59;
          LODWORD(v74) = 32;
          v60 = (void *)_os_log_send_and_compose_impl();

          if (!v60)
          {
LABEL_71:

            unsigned int v7 = v76;
            id v8 = v77;
            goto LABEL_92;
          }
          unsigned int v58 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, &v90, v74);
          free(v60);
          SSFileLog();
        }

        goto LABEL_71;
      }
LABEL_92:

      goto LABEL_93;
    }
    v47 = +[SSLogConfig sharedDaemonConfig];
    if (!v47)
    {
      v47 = +[SSLogConfig sharedConfig];
    }
    unsigned int v48 = objc_msgSend(v47, "shouldLog", v73);
    if ([v47 shouldLogToDisk]) {
      int v49 = v48 | 2;
    }
    else {
      int v49 = v48;
    }
    v50 = [v47 OSLogObject];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      v49 &= 2u;
    }
    if (v49)
    {
      v51 = objc_opt_class();
      int v90 = 138412802;
      unsigned int v91 = v51;
      __int16 v92 = 2112;
      v93 = v77;
      __int16 v94 = 2112;
      v95 = v45;
      v75 = v7;
      id v52 = v51;
      LODWORD(v74) = 32;
      int v73 = &v90;
      unsigned int v53 = (void *)_os_log_send_and_compose_impl();

      unsigned int v7 = v75;
      if (!v53)
      {
LABEL_58:

        id v8 = v77;
        goto LABEL_59;
      }
      v50 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v90, v74);
      free(v53);
      int v73 = (int *)v50;
      SSFileLog();
    }

    goto LABEL_58;
  }
  __int16 v34 = +[SSLogConfig sharedDaemonConfig];
  if (!v34)
  {
    __int16 v34 = +[SSLogConfig sharedConfig];
  }
  unsigned int v61 = objc_msgSend(v34, "shouldLog", v72);
  if ([v34 shouldLogToDisk]) {
    v61 |= 2u;
  }
  id v35 = [v34 OSLogObject];
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    v61 &= 2u;
  }
  if (v61)
  {
    v62 = objc_opt_class();
    id v63 = self->_bundleIdentifier;
    int v90 = 138412546;
    unsigned int v91 = v62;
    __int16 v92 = 2112;
    v93 = v63;
    id v64 = v62;
    LODWORD(v74) = 22;
    v65 = (void *)_os_log_send_and_compose_impl();

    if (!v65)
    {
      LOBYTE(v54) = 0;
      goto LABEL_95;
    }
    id v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v65, 4, &v90, v74);
    free(v65);
    SSFileLog();
  }
  LOBYTE(v54) = 0;
LABEL_94:

LABEL_95:
  return v54;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (int)bundleFileType
{
  return self->_bundleFileType;
}

- (void)setBundleFileType:(int)a3
{
  self->_bundleFileType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end