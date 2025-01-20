@interface InstallDocumentDownloadOperation
- (BOOL)_moveSharedAssetFromPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (id)_sharedAssetStagingPath:(id)a3;
- (id)_sharedContainerPath;
- (id)_sharedContainerPath:(id)a3;
- (void)run;
@end

@implementation InstallDocumentDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(FinishDownloadResponse);
  v4 = [(FinishDownloadStepOperation *)self download];
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v132 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]([DownloadHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:", [v4 transactionID], objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  v5 = [v4 mediaAsset];
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v5 databaseID]);
  uint64_t v6 = [v5 destinationURLString];
  v7 = [v5 destinationFileName];
  v8 = [v4 downloadKind];
  if (!v6 || SSDownloadKindIsThirdPartyKind())
  {
    v9 = [v4 title];
    if ([v9 length])
    {
      v10 = [v7 pathExtension];
      uint64_t v11 = [v9 stringByAppendingPathExtension:v10];

      v7 = (void *)v11;
    }
  }
  v12 = +[ApplicationWorkspace defaultWorkspace];
  unsigned int v13 = [v12 isMultiUser];

  if (v13)
  {
    v14 = [v4 valueForProperty:@"client_id"];
    if ([v4 isSharedDownload]
      && ([v14 isEqualToString:@"com.apple.ondemandd"] & 1) != 0)
    {
      v15 = &OBJC_IVAR___InstallDocumentDownloadOperation__isSharedODRDownload;
    }
    else
    {
      if (![v4 isSharedDownload]
        || ([v14 isEqualToString:@"mdmd"] & 1) == 0
        && ![v14 isEqualToString:@"dmd"])
      {
        goto LABEL_15;
      }
      v15 = &OBJC_IVAR___InstallDocumentDownloadOperation__isSharedMDMDownload;
    }
    self->super.ISOperation_opaque[*v15] = 1;
LABEL_15:
  }
  v135 = v8;
  unsigned int v16 = [v8 isEqualToString:SSDownloadKindOSUpdate];
  v17 = &OBJC_IVAR___PurchaseOperation__buyParameters;
  v136 = v5;
  v131 = (void *)v6;
  v134 = v7;
  if (v16)
  {
    id v18 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Updates", 0);
    uint64_t v19 = +[NSString pathWithComponents:v18];
    goto LABEL_23;
  }
  if (v6 && (SSDownloadKindIsThirdPartyKind() & 1) == 0)
  {
    id v89 = [objc_alloc((Class)NSURL) initWithString:v6];
    v90 = [v89 path];
    uint64_t v142 = [v90 stringByDeletingLastPathComponent];
    v91 = [(InstallDocumentDownloadOperation *)self _sharedContainerPath];
    v92 = v91;
    if (self->_isSharedODRDownload || self->_isSharedMDMDownload)
    {
      id v93 = [v91 length];
      id v94 = v89;
      v95 = [v89 path];
      id v96 = [v95 length];

      if (v93 >= v96)
      {
        v133 = 0;
      }
      else
      {
        v133 = objc_msgSend(v90, "substringFromIndex:", objc_msgSend(v92, "length"));
      }
      v5 = v136;
      id v89 = v94;
      v17 = &OBJC_IVAR___PurchaseOperation__buyParameters;
    }
    else
    {
      v133 = 0;
    }
    if (!self->_isSharedODRDownload && !self->_isSharedMDMDownload) {
      goto LABEL_183;
    }
    v138 = v92;
    id v140 = v89;
    v126 = v3;
    v101 = objc_msgSend(v90, "substringToIndex:", objc_msgSend(v92, "length"));
    v102 = [(InstallDocumentDownloadOperation *)self _sharedContainerPath];
    unsigned __int8 v103 = [v101 isEqualToString:v102];

    uint64_t v104 = +[SSLogConfig sharedDaemonConfig];
    v105 = (void *)v104;
    if ((v103 & 1) == 0)
    {
      if (!v104)
      {
        v105 = +[SSLogConfig sharedConfig];
      }
      unsigned int v110 = [v105 shouldLog];
      if ([v105 shouldLogToDisk]) {
        v110 |= 2u;
      }
      v111 = [v105 OSLogObject];
      if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO)) {
        int v112 = v110;
      }
      else {
        int v112 = v110 & 2;
      }
      if (v112)
      {
        id v113 = (id)objc_opt_class();
        id v114 = [(InstallDocumentDownloadOperation *)self _sharedContainerPath];
        int v154 = 138412802;
        id v155 = v113;
        __int16 v156 = 2112;
        id v157 = v101;
        __int16 v158 = 2112;
        id v159 = v114;
        LODWORD(v122) = 32;
        v118 = &v154;
        v115 = (void *)_os_log_send_and_compose_impl();

        v7 = v134;
        if (v115)
        {
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v115, 4, &v154, v122);
          v116 = (int *)objc_claimAutoreleasedReturnValue();
          free(v115);
          v118 = v116;
          SSFileLog();
        }
      }
      else
      {
      }
      self->_isSharedODRDownload = 0;
      self->_isSharedMDMDownload = 0;
      v5 = v136;
      goto LABEL_182;
    }
    if (!v104)
    {
      v105 = +[SSLogConfig sharedConfig];
    }
    unsigned int v106 = [v105 shouldLog];
    if ([v105 shouldLogToDisk]) {
      v106 |= 2u;
    }
    v107 = [v105 OSLogObject];
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_INFO)) {
      v106 &= 2u;
    }
    if (v106)
    {
      id v108 = (id)objc_opt_class();
      int v154 = 138412802;
      id v155 = v108;
      __int16 v156 = 2112;
      id v157 = v101;
      __int16 v158 = 2112;
      id v159 = v133;
      LODWORD(v122) = 32;
      v118 = &v154;
      v109 = (void *)_os_log_send_and_compose_impl();

      v7 = v134;
      if (!v109)
      {
LABEL_163:

LABEL_182:
        id v89 = v140;

        v3 = v126;
        v92 = v138;
LABEL_183:

        v20 = (void *)v142;
        goto LABEL_25;
      }
      v107 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v109, 4, &v154, v122);
      free(v109);
      v118 = (int *)v107;
      SSFileLog();
    }

    goto LABEL_163;
  }
  id v18 = [v4 documentTargetIdentifier];
  if (!v18)
  {
    id v18 = [v4 clientIdentifier];
    if (!v18)
    {
      v20 = 0;
      goto LABEL_24;
    }
  }
  uint64_t v19 = [(FinishDownloadStepOperation *)self documentsDirectoryPathWithClientIdentifier:v18 downloadKind:v135];
LABEL_23:
  v20 = (void *)v19;

LABEL_24:
  v133 = 0;
LABEL_25:
  v141 = v20;
  v143 = objc_msgSend(v20, "stringByAppendingPathComponent:", v7, v118);
  uint64_t v21 = v17[1003];
  if (self->super.ISOperation_opaque[v21] || self->_isSharedMDMDownload)
  {
    uint64_t v22 = [(InstallDocumentDownloadOperation *)self _sharedAssetStagingPath:v7];
  }
  else
  {
    uint64_t v22 = 0;
  }
  v139 = (void *)v22;
  id v23 = objc_alloc_init((Class)NSFileManager);
  v24 = [v5 localPath];
  uint64_t v25 = [v5 sourceURLString];
  v137 = v23;
  v130 = (void *)v25;
  if (([v23 fileExistsAtPath:v24] & 1) == 0 && v25)
  {
    id v26 = [objc_alloc((Class)NSURL) initWithString:v25];
    if (![v26 isFileURL])
    {
LABEL_44:

      goto LABEL_45;
    }
    v27 = [v26 path];
    id v153 = v24;
    [(FinishDownloadStepOperation *)self moveFile:v27 toPath:&v153 installBehavior:0 error:0];
    id v128 = v153;

    v28 = +[SSLogConfig sharedDaemonConfig];
    if (!v28)
    {
      v28 = +[SSLogConfig sharedConfig];
    }
    unsigned int v29 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      int v30 = v29 | 2;
    }
    else {
      int v30 = v29;
    }
    v31 = [v28 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      int v32 = v30;
    }
    else {
      int v32 = v30 & 2;
    }
    if (v32)
    {
      v33 = v3;
      id v34 = (id)objc_opt_class();
      id v35 = [v26 path];
      int v154 = 138412802;
      id v155 = v34;
      __int16 v156 = 2112;
      id v157 = v35;
      __int16 v158 = 2112;
      id v159 = v128;
      LODWORD(v122) = 32;
      v119 = &v154;
      v36 = (void *)_os_log_send_and_compose_impl();

      v3 = v33;
      if (!v36)
      {
LABEL_43:

        v24 = v128;
        v5 = v136;
        goto LABEL_44;
      }
      v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v154, v122);
      free(v36);
      v119 = (int *)v31;
      SSFileLog();
    }

    goto LABEL_43;
  }
LABEL_45:
  if ((objc_msgSend(v5, "processingTypes", v119) & 1) == 0)
  {
    if (self->super.ISOperation_opaque[v21])
    {
      id v37 = 0;
LABEL_48:
      id v38 = v24;
LABEL_73:
      v50 = v37;
      id v149 = v37;
      id v150 = v139;
      unsigned __int8 v51 = -[FinishDownloadStepOperation moveFile:toPath:installBehavior:error:](self, "moveFile:toPath:installBehavior:error:", v38, &v150, 1, &v149, v120);
      id v52 = v150;

      id v37 = v149;
      if (v51)
      {
        v139 = v52;
        goto LABEL_75;
      }
      uint64_t v65 = 0;
      v24 = v38;
      v49 = v52;
LABEL_178:
      -[FinishDownloadResponse setError:](v3, "setError:", v37, v120);
      [(FinishDownloadResponse *)v3 setResult:v65];
      v88 = v136;
      [(FinishDownloadStepOperation *)self rollbackAsset:v136 error:0];
      v80 = v131;
      goto LABEL_179;
    }
    id v37 = 0;
    id v38 = v24;
    if (self->_isSharedMDMDownload) {
      goto LABEL_73;
    }
    goto LABEL_144;
  }
  v39 = +[SSLogConfig sharedDaemonConfig];
  if (!v39)
  {
    v39 = +[SSLogConfig sharedConfig];
  }
  unsigned int v40 = [v39 shouldLog];
  if ([v39 shouldLogToDisk]) {
    v40 |= 2u;
  }
  v41 = [v39 OSLogObject];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
    int v42 = v40;
  }
  else {
    int v42 = v40 & 2;
  }
  if (!v42) {
    goto LABEL_59;
  }
  id v43 = (id)objc_opt_class();
  id v44 = [v4 databaseID];
  int v154 = 138412802;
  id v155 = v43;
  __int16 v156 = 2048;
  id v157 = v44;
  __int16 v158 = 2112;
  id v159 = v24;
  LODWORD(v122) = 32;
  v120 = &v154;
  v45 = (void *)_os_log_send_and_compose_impl();

  if (v45)
  {
    v41 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v154, v122);
    free(v45);
    v120 = (int *)v41;
    SSFileLog();
LABEL_59:
  }
  id v151 = 0;
  id v152 = 0;
  unsigned int v46 = [(FinishDownloadStepOperation *)self unzipAsset:v5 unzippedPath:&v152 error:&v151];
  id v47 = v152;
  id v37 = v151;
  if ((v46 & 1) == 0)
  {
    if (v47) {
      [v137 removeItemAtPath:v47 error:0];
    }

    v49 = v139;
    if (self->super.ISOperation_opaque[v21])
    {
      if (v46) {
        goto LABEL_48;
      }
    }
    else
    {
      if (self->_isSharedMDMDownload) {
        char v97 = v46;
      }
      else {
        char v97 = 0;
      }
      if (v97) {
        goto LABEL_48;
      }
      if (v46)
      {
        id v38 = v24;
        goto LABEL_144;
      }
    }
    uint64_t v65 = 0;
    goto LABEL_178;
  }
  id v38 = v47;

  if (self->super.ISOperation_opaque[v21]) {
    goto LABEL_73;
  }
  char v48 = self->_isSharedMDMDownload ? v46 : 0;
  if (v48) {
    goto LABEL_73;
  }
LABEL_144:
  if (!v143)
  {
    uint64_t v117 = SSError();

    v143 = 0;
    uint64_t v65 = 3;
    id v37 = (id)v117;
    v24 = v38;
LABEL_177:
    v49 = v139;
    goto LABEL_178;
  }
  id v147 = v37;
  id v148 = v143;
  unsigned int v98 = [(FinishDownloadStepOperation *)self moveFile:v38 toPath:&v148 installBehavior:1 error:&v147];
  id v99 = v148;

  id v100 = v147;
  if (!v98)
  {
    uint64_t v65 = 0;
    id v37 = v100;
    v24 = v38;
    v143 = v99;
    goto LABEL_177;
  }
  id v37 = v100;
  v143 = v99;
LABEL_75:
  v24 = v38;
  v53 = objc_msgSend(v136, "fileAttributes", v120);
  if ([v53 count]) {
    [v137 setAttributes:v53 ofItemAtPath:v143 error:0];
  }

  if (self->super.ISOperation_opaque[v21] || self->_isSharedMDMDownload)
  {
    uint64_t v54 = [v133 pathComponents];
    v164[0] = @"Library";
    v164[1] = @"Caches";
    v164[2] = @"Staging";
    v164[3] = v134;
    uint64_t v55 = +[NSArray arrayWithObjects:v164 count:4];
    v129 = +[NSString pathWithComponents:v55];
    uint64_t v56 = [&off_1003C9F98 arrayByAddingObjectsFromArray:v54];
    v127 = +[NSString pathWithComponents:v56];
    char v146 = 0;
    unsigned int v57 = [v137 fileExistsAtPath:v141 isDirectory:&v146];
    v124 = (void *)v55;
    v125 = v3;
    v123 = (void *)v56;
    if (!v57 || v146)
    {
      v58 = (void *)v54;
      if (v57) {
        goto LABEL_107;
      }
      id v145 = v37;
      [v137 createDirectoryAtPath:v141 withIntermediateDirectories:1 attributes:0 error:&v145];
      id v66 = v145;

      v59 = +[SSLogConfig sharedDaemonConfig];
      if (!v59)
      {
        v59 = +[SSLogConfig sharedConfig];
      }
      unsigned int v67 = [v59 shouldLog];
      if ([v59 shouldLogToDisk]) {
        v67 |= 2u;
      }
      v61 = [v59 OSLogObject];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO)) {
        int v68 = v67;
      }
      else {
        int v68 = v67 & 2;
      }
      if (v68)
      {
        id v69 = (id)objc_opt_class();
        int v154 = 138412802;
        id v155 = v69;
        __int16 v156 = 2112;
        id v157 = v141;
        __int16 v158 = 2112;
        id v159 = v66;
        LODWORD(v122) = 32;
        v120 = &v154;
        v70 = (void *)_os_log_send_and_compose_impl();

        if (!v70)
        {
LABEL_106:

          id v37 = v66;
LABEL_107:
          v71 = v37;
          id v144 = v37;
          unsigned int v72 = -[InstallDocumentDownloadOperation _moveSharedAssetFromPath:toPath:error:](self, "_moveSharedAssetFromPath:toPath:error:", v129, v127, &v144, v120);
          id v37 = v144;

          v73 = +[SSLogConfig sharedDaemonConfig];
          if (!v73)
          {
            v73 = +[SSLogConfig sharedConfig];
          }
          unsigned int v74 = [v73 shouldLog];
          if ([v73 shouldLogToDisk]) {
            v74 |= 2u;
          }
          v75 = [v73 OSLogObject];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO)) {
            int v76 = v74;
          }
          else {
            int v76 = v74 & 2;
          }
          if (v76)
          {
            id v77 = (id)objc_opt_class();
            id v78 = [v4 databaseID];
            int v154 = 138413314;
            id v155 = v77;
            __int16 v156 = 2048;
            id v157 = v78;
            __int16 v158 = 2112;
            id v159 = v129;
            __int16 v160 = 2112;
            v161 = v127;
            __int16 v162 = 1024;
            unsigned int v163 = v72;
            LODWORD(v122) = 48;
            v120 = &v154;
            v79 = (void *)_os_log_send_and_compose_impl();

            if (!v79)
            {
LABEL_118:

              if (v72)
              {
                v3 = v125;
                goto LABEL_120;
              }
              uint64_t v65 = 0;
              v3 = v125;
              goto LABEL_177;
            }
            v75 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v79, 4, &v154, v122);
            free(v79);
            v120 = (int *)v75;
            SSFileLog();
          }

          goto LABEL_118;
        }
        v61 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v70, 4, &v154, v122);
        free(v70);
        v120 = (int *)v61;
        SSFileLog();
      }
      id v37 = v66;
    }
    else
    {
      v58 = (void *)v54;
      v59 = +[SSLogConfig sharedDaemonConfig];
      if (!v59)
      {
        v59 = +[SSLogConfig sharedConfig];
      }
      unsigned int v60 = [v59 shouldLog];
      if ([v59 shouldLogToDisk]) {
        v60 |= 2u;
      }
      v61 = [v59 OSLogObject];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO)) {
        int v62 = v60;
      }
      else {
        int v62 = v60 & 2;
      }
      if (v62)
      {
        id v63 = (id)objc_opt_class();
        int v154 = 138412546;
        id v155 = v63;
        __int16 v156 = 2112;
        id v157 = v141;
        LODWORD(v122) = 22;
        v120 = &v154;
        v64 = (void *)_os_log_send_and_compose_impl();

        if (!v64)
        {
LABEL_105:
          id v66 = v37;
          goto LABEL_106;
        }
        v61 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v64, 4, &v154, v122);
        free(v64);
        v120 = (int *)v61;
        SSFileLog();
      }
    }

    goto LABEL_105;
  }
LABEL_120:
  v80 = v131;
  v81 = +[SSLogConfig sharedDaemonConfig];
  if (!v81)
  {
    v81 = +[SSLogConfig sharedConfig];
  }
  unsigned int v82 = [v81 shouldLog];
  if ([v81 shouldLogToDisk]) {
    v82 |= 2u;
  }
  v83 = [v81 OSLogObject];
  if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
    int v84 = v82;
  }
  else {
    int v84 = v82 & 2;
  }
  if (!v84) {
    goto LABEL_130;
  }
  id v85 = (id)objc_opt_class();
  id v86 = [v4 databaseID];
  int v154 = 138412802;
  id v155 = v85;
  __int16 v156 = 2048;
  id v157 = v86;
  __int16 v158 = 2112;
  id v159 = v143;
  LODWORD(v122) = 32;
  v121 = &v154;
  v87 = (void *)_os_log_send_and_compose_impl();

  if (v87)
  {
    v83 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v87, 4, &v154, v122);
    free(v87);
    v121 = (int *)v83;
    SSFileLog();
LABEL_130:
  }
  [(FinishDownloadResponse *)v3 setResult:4];
  [(FinishDownloadResponse *)v3 setMediaAssetInstallPath:v143];
  v88 = v136;
  v49 = v139;
LABEL_179:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v3, v121);
}

- (BOOL)_moveSharedAssetFromPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_isSharedMDMDownload)
  {
    v10 = @"systemgroup.com.apple.media.books.managed";
    CFStringRef v11 = @"mdmd";
    goto LABEL_17;
  }
  if (self->_isSharedODRDownload)
  {
    v10 = @"systemgroup.com.apple.ondemandresources";
    CFStringRef v11 = @"com.apple.ondemandd";
    goto LABEL_17;
  }
  v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12)
  {
    v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_15;
  }
  int v39 = 138412290;
  id v40 = (id)objc_opt_class();
  id v16 = v40;
  LODWORD(v38) = 12;
  id v37 = &v39;
  v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v39, v38);
    free(v17);
    id v37 = (int *)v15;
    SSFileLog();
LABEL_15:
  }
  CFStringRef v11 = 0;
  v10 = 0;
LABEL_17:
  [(__CFString *)v10 UTF8String];
  id v18 = v8;
  [v18 UTF8String];
  id v19 = v9;
  [v19 UTF8String];
  v20 = (__CFString *)container_stage_shared_system_content();
  uint64_t v21 = +[SSLogConfig sharedDaemonConfig];
  uint64_t v22 = (void *)v21;
  if (!v20)
  {
    if (!v21)
    {
      uint64_t v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v31 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v32 = v31 | 2;
    }
    else {
      int v32 = v31;
    }
    v33 = [v22 OSLogObject];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
      v32 &= 2u;
    }
    if (v32)
    {
      id v34 = objc_opt_class();
      int v39 = 138412802;
      id v40 = v34;
      __int16 v41 = 2112;
      CFStringRef v42 = v11;
      __int16 v43 = 2048;
      uint64_t v44 = 1;
      id v35 = v34;
      LODWORD(v38) = 32;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36) {
        goto LABEL_43;
      }
      v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v39, v38);
      free(v36);
      SSFileLog();
    }

LABEL_43:
    unsigned int v29 = SSError();
    if (!a5) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (!v21)
  {
    uint64_t v22 = +[SSLogConfig sharedConfig];
  }
  unsigned int v23 = [v22 shouldLog];
  if ([v22 shouldLogToDisk]) {
    int v24 = v23 | 2;
  }
  else {
    int v24 = v23;
  }
  uint64_t v25 = [v22 OSLogObject];
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
    v24 &= 2u;
  }
  if (v24)
  {
    id v26 = objc_opt_class();
    int v39 = 138412802;
    id v40 = v26;
    __int16 v41 = 2080;
    CFStringRef v42 = v20;
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v11;
    id v27 = v26;
    LODWORD(v38) = 32;
    v28 = (void *)_os_log_send_and_compose_impl();

    if (!v28) {
      goto LABEL_29;
    }
    uint64_t v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v39, v38);
    free(v28);
    SSFileLog();
  }

LABEL_29:
  free(v20);
  unsigned int v29 = 0;
  if (a5) {
LABEL_30:
  }
    *a5 = v29;
LABEL_31:

  return v20 != 0;
}

- (id)_sharedAssetStagingPath:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(InstallDocumentDownloadOperation *)self _sharedContainerPath];
    uint64_t v6 = [v5 pathComponents];

    v24[0] = @"Caches";
    v24[1] = @"Staging";
    v24[2] = v4;
    v7 = +[NSArray arrayWithObjects:v24 count:3];
    id v8 = [v6 arrayByAddingObjectsFromArray:v7];
    id v9 = +[NSString pathWithComponents:v8];
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
    unsigned int v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      *(_DWORD *)unsigned int v23 = 138412546;
      *(void *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v9;
      id v14 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        goto LABEL_26;
      }
      unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16]);
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
  uint64_t v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    uint64_t v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v16 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  id v18 = [v6 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_24;
  }
  *(_DWORD *)unsigned int v23 = 138412546;
  *(void *)&v23[4] = objc_opt_class();
  *(_WORD *)&v23[12] = 2112;
  *(void *)&v23[14] = v4;
  id v19 = *(id *)&v23[4];
  LODWORD(v22) = 22;
  v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, v23, v22, *(void *)v23, *(_OWORD *)&v23[8]);
    free(v20);
    SSFileLog();
LABEL_24:
  }
  id v9 = 0;
LABEL_26:

  return v9;
}

- (id)_sharedContainerPath
{
  if (self->_isSharedMDMDownload)
  {
    CFStringRef v2 = @"systemgroup.com.apple.media.books.managed";
LABEL_5:
    v3 = [(InstallDocumentDownloadOperation *)self _sharedContainerPath:v2];
    goto LABEL_6;
  }
  if (self->_isSharedODRDownload)
  {
    CFStringRef v2 = @"systemgroup.com.apple.ondemandresources";
    goto LABEL_5;
  }
  v3 = 0;
LABEL_6:

  return v3;
}

- (id)_sharedContainerPath:(id)a3
{
  [a3 UTF8String];
  v3 = (void *)container_system_group_path_for_identifier();
  uint64_t v4 = +[SSLogConfig sharedDaemonConfig];
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v20 = 136315138;
      uint64_t v21 = (uint64_t)v3;
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_14:

        unsigned int v11 = +[NSString stringWithUTF8String:v3];
        int v12 = [v11 stringByAppendingPathComponent:@"Library"];

        free(v3);
        goto LABEL_28;
      }
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v20, v19);
      free(v10);
      SSFileLog();
    }

    goto LABEL_14;
  }
  if (!v4)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  v15 = [v5 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    int v16 = v14;
  }
  else {
    int v16 = v14 & 2;
  }
  if (!v16) {
    goto LABEL_26;
  }
  int v20 = 134217984;
  uint64_t v21 = 1;
  LODWORD(v19) = 12;
  int v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v20, v19);
    free(v17);
    SSFileLog();
LABEL_26:
  }
  int v12 = 0;
LABEL_28:

  return v12;
}

@end