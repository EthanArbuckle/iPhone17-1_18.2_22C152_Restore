@interface InstallEBookDownloadOperation
+ (id)sharedBookContainerCachesPath;
+ (id)sharedBookContainerPath;
- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 fileName:(id *)a5 drmPath:(id *)a6 error:(id *)a7;
- (id)_bookManifest;
- (id)_existingManifestEntry;
- (id)_newManifestEntry:(BOOL)a3 withFileName:(id)a4;
- (id)_newManifestEntry:(id)a3;
- (id)_storeFrontIdentifier;
- (id)_syncedBooksPath;
- (void)_addPurchaseManifestItem:(BOOL)a3;
- (void)_removeDuplicateEntry:(id)a3;
- (void)run;
@end

@implementation InstallEBookDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(FinishDownloadResponse);
  [(FinishDownloadResponse *)v3 setResult:4];
  v4 = [(FinishDownloadStepOperation *)self download];
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v144 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]([DownloadHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:", [v4 transactionID], objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  v5 = [v4 mediaAsset];
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v5 databaseID]);
  v6 = +[ApplicationWorkspace defaultWorkspace];
  unsigned int v7 = [v6 isMultiUser];
  if (v7) {
    LOBYTE(v7) = [v4 isSharedDownload];
  }
  self->_isSharedDownload = v7;

  v142 = v3;
  v8 = &syslog_ptr;
  if (!self->_isSharedDownload)
  {
    v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = [v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      v21 = objc_opt_class();
      id v22 = v21;
      int v153 = 138412546;
      v154 = v21;
      __int16 v155 = 2048;
      int64_t v156 = [(DownloadHandle *)v144 downloadID];
      LODWORD(v128) = 22;
      v127 = &v153;
      v23 = (void *)_os_log_send_and_compose_impl();

      v8 = &syslog_ptr;
      if (!v23)
      {
LABEL_18:

        v24 = 0;
        goto LABEL_64;
      }
      v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v153, v128);
      free(v23);
      v127 = (int *)v19;
      SSFileLog();
    }

    goto LABEL_18;
  }
  v9 = +[EBookManifest sharedPurchasedBookManifest];
  v137 = [v4 storeMetadata];
  uint64_t v10 = [v137 valueForMetadataKey:SSDownloadMetadataKeyPublicationVersion];
  v11 = [(FinishDownloadStepOperation *)self download];
  uint64_t v12 = [v11 storeItemIdentifier];

  v13 = [(FinishDownloadStepOperation *)self download];
  v14 = [v13 downloadPermalink];

  v135 = (void *)v10;
  v131 = v14;
  if ([v4 isStoreDownload])
  {
    uint64_t v15 = [v9 bookPathForAdamID:v12 withPublicationVersion:v10];
LABEL_21:
    v25 = *(void **)(&self->_isSharedDownload + 5);
    *(void *)(&self->_isSharedDownload + 5) = v15;

    goto LABEL_22;
  }
  if ([v14 length])
  {
    uint64_t v15 = [v9 bookPathPermalink:v14];
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v26 = *(void *)(&self->_isSharedDownload + 5);
  v139 = v9;
  v133 = (void *)v12;
  if (v26)
  {
    v27 = v5;
    v28 = [(InstallEBookDownloadOperation *)self _bookManifest];
    v29 = [v28 manifestPath];
    v30 = [v29 stringByDeletingLastPathComponent];
    v143 = [v30 stringByAppendingPathComponent:*(void *)(&self->_isSharedDownload + 5)];

    v31 = +[SSLogConfig sharedDaemonConfig];
    if (!v31)
    {
      v31 = +[SSLogConfig sharedConfig];
    }
    unsigned int v32 = [v31 shouldLog];
    if ([v31 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    v34 = [v31 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
      int v35 = v33;
    }
    else {
      int v35 = v33 & 2;
    }
    if (v35)
    {
      v36 = objc_opt_class();
      id v37 = v36;
      int v153 = 138412546;
      v154 = v36;
      __int16 v155 = 2048;
      int64_t v156 = [(DownloadHandle *)v144 downloadID];
      LODWORD(v128) = 22;
      v127 = &v153;
      v38 = (void *)_os_log_send_and_compose_impl();

      v8 = &syslog_ptr;
      if (v38)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v153, v128);
        v39 = (int *)objc_claimAutoreleasedReturnValue();
        free(v38);
        v127 = v39;
        SSFileLog();
      }
    }
    else
    {
    }
    v5 = v27;
  }
  else
  {
    v28 = +[SSLogConfig sharedDaemonConfig];
    if (!v28)
    {
      v28 = +[SSLogConfig sharedConfig];
    }
    unsigned int v40 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      int v41 = v40 | 2;
    }
    else {
      int v41 = v40;
    }
    v42 = [v28 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
      int v43 = v41;
    }
    else {
      int v43 = v41 & 2;
    }
    if (v43)
    {
      v44 = objc_opt_class();
      id v45 = v44;
      int v153 = 138412546;
      v154 = v44;
      __int16 v155 = 2048;
      int64_t v156 = [(DownloadHandle *)v144 downloadID];
      LODWORD(v128) = 22;
      v127 = &v153;
      v46 = (void *)_os_log_send_and_compose_impl();

      if (v46)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v153, v128);
        v47 = (int *)objc_claimAutoreleasedReturnValue();
        free(v46);
        v127 = v47;
        SSFileLog();
      }
      v143 = 0;
      v8 = &syslog_ptr;
    }
    else
    {

      v143 = 0;
    }
  }

  v48 = [v8[405] sharedDaemonConfig];
  if (!v48)
  {
    v48 = [v8[405] sharedConfig];
  }
  unsigned int v49 = objc_msgSend(v48, "shouldLog", v127);
  if ([v48 shouldLogToDisk]) {
    int v50 = v49 | 2;
  }
  else {
    int v50 = v49;
  }
  v51 = [v48 OSLogObject];
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO)) {
    int v52 = v50;
  }
  else {
    int v52 = v50 & 2;
  }
  if (!v52)
  {
    v58 = v135;
    v59 = v131;
    goto LABEL_60;
  }
  v53 = objc_opt_class();
  v54 = v5;
  id v55 = v53;
  v56 = +[InstallEBookDownloadOperation sharedBookContainerPath];
  int v153 = 138412546;
  v154 = v53;
  __int16 v155 = 2112;
  int64_t v156 = (int64_t)v56;
  LODWORD(v128) = 22;
  v127 = &v153;
  v57 = (void *)_os_log_send_and_compose_impl();

  v5 = v54;
  v58 = v135;
  v59 = v131;
  if (v57)
  {
    v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v57, 4, &v153, v128);
    free(v57);
    v127 = (int *)v51;
    SSFileLog();
LABEL_60:
  }
  if (v26)
  {
    id v60 = 0;
    id v61 = 0;
    v138 = 0;
    uint64_t v62 = 1;
    v8 = &syslog_ptr;
    goto LABEL_82;
  }
  v8 = &syslog_ptr;
  v24 = v143;
LABEL_64:
  id v152 = 0;
  id v150 = v24;
  id v151 = 0;
  id v149 = 0;
  unsigned int v63 = -[InstallEBookDownloadOperation _installMediaAsset:assetInstalledPath:fileName:drmPath:error:](self, "_installMediaAsset:assetInstalledPath:fileName:drmPath:error:", v5, &v152, &v151, &v150, &v149, v127);
  id v61 = v152;
  id v60 = v151;
  id v64 = v150;

  id v65 = v149;
  v66 = v65;
  if (v63)
  {
    v138 = v65;
    id v67 = v60;
    v143 = v64;
    id v68 = objc_alloc_init((Class)NSFileManager);
    LOBYTE(v153) = 0;
    [v68 fileExistsAtPath:v61 isDirectory:&v153];
    v69 = [v4 secondaryAssetForType:SSDownloadAssetTypeArtwork];
    if (v69 && [(FinishDownloadStepOperation *)self downloadAsset:v69 error:0])
    {
      if ((_BYTE)v153)
      {
        v70 = [v61 stringByAppendingPathComponent:@"iTunesArtwork"];
      }
      else
      {
        v72 = [v69 destinationFileName];
        v73 = [v72 pathExtension];

        v74 = [v61 stringByDeletingPathExtension];
        v70 = [v74 stringByAppendingPathExtension:v73];

        v8 = &syslog_ptr;
      }
      id v148 = v70;
      [(FinishDownloadStepOperation *)self moveAsset:v69 toPath:&v148 installBehavior:0 error:0];
      id v75 = v148;
    }
    v76 = [(InstallEBookDownloadOperation *)self _bookManifest];
    v77 = +[EBookManifest purchasedBookManifest];

    if (v76 == v77)
    {
      id v78 = [v4 newITunesMetadataDictionary];
      if (v78)
      {
        if ((_BYTE)v153)
        {
          v79 = [v61 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
        }
        else
        {
          v80 = [v61 stringByDeletingPathExtension];
          v79 = [v80 stringByAppendingPathExtension:@"plist"];

          v8 = &syslog_ptr;
        }
        [(FinishDownloadStepOperation *)self writeBinaryPropertyList:v78 toPath:v79 error:0];
      }
    }

    uint64_t v62 = 0;
    id v60 = v67;
LABEL_82:
    v81 = objc_msgSend(v4, "storeMetadata", v127);
    v82 = [v81 epubRightsData];

    v136 = v61;
    id v140 = v60;
    if (![v82 length]) {
      goto LABEL_113;
    }
    unsigned int v130 = v62;
    v83 = [v143 stringByAppendingPathComponent:@"META-INF"];
    v134 = [v83 stringByAppendingPathComponent:@"sinf.xml"];
    v84 = [v8[405] sharedDaemonConfig];
    if (!v84)
    {
      v84 = [v8[405] sharedConfig];
    }
    v132 = v5;
    unsigned int v85 = [v84 shouldLog];
    if ([v84 shouldLogToDisk]) {
      int v86 = v85 | 2;
    }
    else {
      int v86 = v85;
    }
    v87 = [v84 OSLogObject];
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO)) {
      int v88 = v86;
    }
    else {
      int v88 = v86 & 2;
    }
    if (v88)
    {
      v89 = objc_opt_class();
      id v90 = v89;
      id v91 = [v4 databaseID];
      int v153 = 138412802;
      v154 = v89;
      __int16 v155 = 2048;
      int64_t v156 = (int64_t)v91;
      __int16 v157 = 2112;
      v158 = v83;
      LODWORD(v128) = 32;
      v127 = &v153;
      v92 = (void *)_os_log_send_and_compose_impl();

      if (!v92) {
        goto LABEL_95;
      }
      v87 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v92, 4, &v153, v128);
      free(v92);
      v127 = (int *)v87;
      SSFileLog();
    }

LABEL_95:
    id v93 = objc_alloc_init((Class)NSFileManager);
    LOBYTE(v145) = 0;
    [v93 fileExistsAtPath:v83 isDirectory:&v145];
    if ((_BYTE)v145
      || (id v147 = 0,
          [v93 createDirectoryAtPath:v83 withIntermediateDirectories:1 attributes:0 error:&v147],
          (id v94 = v147) == 0))
    {
      id v146 = 0;
      objc_msgSend(v82, "writeToFile:options:error:", v134, 1, &v146, v127);
      id v94 = v146;
      if (!v94) {
        goto LABEL_112;
      }
    }
    v129 = v83;
    v95 = +[SSLogConfig sharedDaemonConfig];
    if (!v95)
    {
      v95 = +[SSLogConfig sharedConfig];
    }
    unsigned int v96 = [v95 shouldLog];
    if ([v95 shouldLogToDisk]) {
      int v97 = v96 | 2;
    }
    else {
      int v97 = v96;
    }
    v98 = [v95 OSLogObject];
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT)) {
      int v99 = v97;
    }
    else {
      int v99 = v97 & 2;
    }
    if (v99)
    {
      v100 = v82;
      v101 = objc_opt_class();
      id v102 = v101;
      id v103 = [v4 databaseID];
      int v153 = 138413058;
      v154 = v101;
      v82 = v100;
      __int16 v155 = 2048;
      int64_t v156 = (int64_t)v103;
      __int16 v157 = 2112;
      v83 = v129;
      v158 = v129;
      __int16 v159 = 2112;
      id v160 = v94;
      LODWORD(v128) = 42;
      v127 = &v153;
      v104 = (void *)_os_log_send_and_compose_impl();

      if (!v104)
      {
LABEL_111:

LABEL_112:
        v5 = v132;
        v8 = &syslog_ptr;
        id v61 = v136;
        id v60 = v140;
        uint64_t v62 = v130;
LABEL_113:
        if (self->_isSharedDownload) {
          char v105 = v62;
        }
        else {
          char v105 = 1;
        }
        if (v105)
        {
          [(InstallEBookDownloadOperation *)self _addPurchaseManifestItem:v62];
          v71 = v142;
          id v64 = v143;
          v66 = v138;
LABEL_146:

          [(FinishDownloadResponse *)v71 setMediaAssetInstallPath:v61];
          goto LABEL_147;
        }
        v141 = v82;
        uint64_t v145 = 1;
        v106 = [@"Library" stringByAppendingPathComponent:v60];
        v107 = [@"Library" stringByAppendingPathComponent:@"Caches"];
        v108 = [v107 stringByAppendingPathComponent:@"Staging"];
        v109 = [v108 stringByAppendingPathComponent:v60];

        id v110 = v109;
        [v110 UTF8String];
        id v111 = v106;
        [v111 UTF8String];
        v112 = (void *)container_stage_shared_system_content();
        uint64_t v113 = [v8[405] sharedDaemonConfig];
        v114 = (void *)v113;
        if (v112)
        {
          if (!v113)
          {
            v114 = +[SSLogConfig sharedConfig];
          }
          unsigned int v115 = objc_msgSend(v114, "shouldLog", v127);
          if ([v114 shouldLogToDisk]) {
            v115 |= 2u;
          }
          v116 = [v114 OSLogObject];
          if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO)) {
            int v117 = v115;
          }
          else {
            int v117 = v115 & 2;
          }
          if (v117)
          {
            v118 = objc_opt_class();
            int v153 = 138412546;
            v154 = v118;
            __int16 v155 = 2080;
            int64_t v156 = (int64_t)v112;
            id v119 = v118;
            LODWORD(v128) = 22;
            v127 = &v153;
            v120 = (void *)_os_log_send_and_compose_impl();

            if (!v120)
            {
LABEL_130:

              id v61 = [objc_alloc((Class)NSString) initWithCString:v112 encoding:4];
              free(v112);
              v66 = v138;
LABEL_143:
              v71 = v142;
              id v60 = v140;
              if (!v66) {
                [(InstallEBookDownloadOperation *)self _addPurchaseManifestItem:0];
              }

              id v64 = v143;
              v82 = v141;
              goto LABEL_146;
            }
            v116 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v120, 4, &v153, v128);
            free(v120);
            v127 = (int *)v116;
            SSFileLog();
          }

          goto LABEL_130;
        }
        if (!v113)
        {
          v114 = +[SSLogConfig sharedConfig];
        }
        unsigned int v121 = objc_msgSend(v114, "shouldLog", v127);
        if ([v114 shouldLogToDisk]) {
          v121 |= 2u;
        }
        v122 = [v114 OSLogObject];
        if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO)) {
          int v123 = v121;
        }
        else {
          int v123 = v121 & 2;
        }
        if (v123)
        {
          v124 = objc_opt_class();
          int v153 = 138412546;
          v154 = v124;
          __int16 v155 = 2048;
          int64_t v156 = v145;
          id v125 = v124;
          LODWORD(v128) = 22;
          v127 = &v153;
          v126 = (void *)_os_log_send_and_compose_impl();

          if (!v126)
          {
LABEL_142:

            v66 = SSError();

            goto LABEL_143;
          }
          v122 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v126, 4, &v153, v128);
          free(v126);
          v127 = (int *)v122;
          SSFileLog();
        }

        goto LABEL_142;
      }
      v98 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v104, 4, &v153, v128);
      free(v104);
      v127 = (int *)v98;
      SSFileLog();
    }

    goto LABEL_111;
  }
  v71 = v142;
  [(FinishDownloadResponse *)v142 setError:v65];
  [(FinishDownloadResponse *)v142 setResult:0];
LABEL_147:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v71, v127);
}

+ (id)sharedBookContainerCachesPath
{
  [@"systemgroup.com.apple.media.shared.books" UTF8String];
  v2 = (void *)container_system_group_path_for_identifier();
  uint64_t v3 = +[SSLogConfig sharedDaemonConfig];
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    unsigned int v7 = [v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      int v8 = v6;
    }
    else {
      int v8 = v6 & 2;
    }
    if (v8)
    {
      int v21 = 136315138;
      uint64_t v22 = (uint64_t)v2;
      LODWORD(v20) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_14:

        uint64_t v10 = +[NSString stringWithUTF8String:v2];
        v11 = [v10 stringByAppendingPathComponent:@"Library"];
        uint64_t v12 = [v11 stringByAppendingPathComponent:@"Caches"];
        v13 = [v12 stringByAppendingPathComponent:@"Staging"];

        free(v2);
        goto LABEL_28;
      }
      unsigned int v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v21, v20);
      free(v9);
      SSFileLog();
    }

    goto LABEL_14;
  }
  if (!v3)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  v16 = [v4 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    int v17 = v15;
  }
  else {
    int v17 = v15 & 2;
  }
  if (!v17) {
    goto LABEL_26;
  }
  int v21 = 134217984;
  uint64_t v22 = 1;
  LODWORD(v20) = 12;
  int v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v21, v20);
    free(v18);
    SSFileLog();
LABEL_26:
  }
  v13 = 0;
LABEL_28:

  return v13;
}

+ (id)sharedBookContainerPath
{
  [@"systemgroup.com.apple.media.shared.books" UTF8String];
  v2 = (void *)container_system_group_path_for_identifier();
  uint64_t v3 = +[SSLogConfig sharedDaemonConfig];
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    unsigned int v7 = [v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      int v8 = v6;
    }
    else {
      int v8 = v6 & 2;
    }
    if (v8)
    {
      int v19 = 136315138;
      uint64_t v20 = (uint64_t)v2;
      LODWORD(v18) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_14:

        uint64_t v10 = +[NSString stringWithUTF8String:v2];
        v11 = [v10 stringByAppendingPathComponent:@"Library"];

        free(v2);
        goto LABEL_28;
      }
      unsigned int v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v19, v18);
      free(v9);
      SSFileLog();
    }

    goto LABEL_14;
  }
  if (!v3)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  unsigned int v14 = [v4 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    int v15 = v13;
  }
  else {
    int v15 = v13 & 2;
  }
  if (!v15) {
    goto LABEL_26;
  }
  int v19 = 134217984;
  uint64_t v20 = 1;
  LODWORD(v18) = 12;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    unsigned int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v19, v18);
    free(v16);
    SSFileLog();
LABEL_26:
  }
  v11 = 0;
LABEL_28:

  return v11;
}

- (void)_addPurchaseManifestItem:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(InstallEBookDownloadOperation *)self _bookManifest];
  int v6 = [(FinishDownloadStepOperation *)self download];
  BOOL isSharedDownload = self->_isSharedDownload;
  uint64_t v8 = +[SSLogConfig sharedDaemonConfig];
  v9 = (void *)v8;
  if (!isSharedDownload)
  {
    if (!v8)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      v18 |= 2u;
    }
    int v19 = [v9 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      int v21 = objc_opt_class();
      id v22 = v21;
      v23 = [v5 manifestPath];
      int v45 = 138412546;
      v46 = v21;
      __int16 v47 = 2112;
      v48 = v23;
      LODWORD(v43) = 22;
      v42 = &v45;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (v24)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v45, v43);
        v25 = (int *)objc_claimAutoreleasedReturnValue();
        free(v24);
        v42 = v25;
        SSFileLog();
      }
    }
    else
    {
    }
    v39 = [v6 mediaAsset];
    id v26 = [v39 destinationFileName];

    v38 = [v5 manifestEntriesWithProperty:@"Path" equalToValue:v26 limitCount:1];
    if ([v38 count]) {
      goto LABEL_47;
    }
    unsigned int v40 = [(InstallEBookDownloadOperation *)self _existingManifestEntry];
    id v37 = v40;
    if (v40)
    {
      [v40 setObject:v26 forKey:@"Path"];
    }
    else
    {
      id v41 = [(InstallEBookDownloadOperation *)self _newManifestEntry:0];
      [v5 addManifestEntry:v41];
    }
    v27 = v5;
LABEL_46:
    objc_msgSend(v27, "synchronizeData", v42);

LABEL_47:
    goto LABEL_48;
  }
  if (!v8)
  {
    v9 = +[SSLogConfig sharedConfig];
  }
  v44 = v6;
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  unsigned int v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v13 = objc_opt_class();
    id v14 = v13;
    int v15 = [v5 manifestPath];
    int v45 = 138412546;
    v46 = v13;
    __int16 v47 = 2112;
    v48 = v15;
    LODWORD(v43) = 22;
    v42 = &v45;
    v16 = (void *)_os_log_send_and_compose_impl();

    if (!v16) {
      goto LABEL_13;
    }
    unsigned int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v45, v43);
    free(v16);
    v42 = (int *)v12;
    SSFileLog();
  }

LABEL_13:
  [(InstallEBookDownloadOperation *)self _removeDuplicateEntry:v5];
  if (v3) {
    uint64_t v17 = *(void *)(&self->_isSharedDownload + 5);
  }
  else {
    uint64_t v17 = 0;
  }
  int v6 = v44;
  id v26 = -[InstallEBookDownloadOperation _newManifestEntry:](self, "_newManifestEntry:", v17, v42);
  [v5 addManifestEntry:v26];
  [v5 synchronizeData];
  if (!v3)
  {
    v27 = +[EBookManifest sharedPurchasedBookManifest];
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
      int v33 = objc_opt_class();
      id v34 = v33;
      int v35 = [v27 manifestPath];
      int v45 = 138412546;
      v46 = v33;
      int v6 = v44;
      __int16 v47 = 2112;
      v48 = v35;
      LODWORD(v43) = 22;
      v42 = &v45;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_39:

        [(InstallEBookDownloadOperation *)self _removeDuplicateEntry:v27];
        id v37 = [(InstallEBookDownloadOperation *)self _newManifestEntry:1 withFileName:0];
        [v27 addManifestEntry:v37];
        v38 = v27;
        goto LABEL_46;
      }
      v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v45, v43);
      free(v36);
      v42 = (int *)v31;
      SSFileLog();
    }

    goto LABEL_39;
  }
LABEL_48:
}

- (id)_bookManifest
{
  BOOL v3 = +[EBookManifest purchasedBookManifest];
  v4 = +[EBookManifest syncedBookManifest];
  unsigned int v5 = [(FinishDownloadStepOperation *)self download];
  int v6 = [v5 libraryItemIdentifier];
  if (v6)
  {
    unsigned int v7 = [v4 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v6 limitCount:1];
    if ([v7 count] == (id)1)
    {
      uint64_t v8 = v4;
      goto LABEL_6;
    }
    v9 = [v3 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v6 limitCount:1];

    if ([v9 count] == (id)1)
    {
      uint64_t v8 = v3;
      unsigned int v7 = v9;
LABEL_6:
      id v10 = v8;

      if (v10) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  int v11 = [v5 mediaAsset];
  unsigned int v12 = [v11 localPath];

  int v13 = [(InstallEBookDownloadOperation *)self _syncedBooksPath];
  LODWORD(v11) = [v12 hasPrefix:v13];

  if (v11) {
    id v14 = v4;
  }
  else {
    id v14 = v3;
  }
  id v10 = v14;

LABEL_13:
  id v15 = v10;

  return v15;
}

- (id)_existingManifestEntry
{
  v2 = [(FinishDownloadStepOperation *)self download];
  BOOL v3 = [v2 libraryItemIdentifier];

  if (!v3)
  {
    unsigned int v7 = 0;
    goto LABEL_10;
  }
  v4 = +[EBookManifest syncedBookManifest];
  unsigned int v5 = [v4 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v3 limitCount:1];

  if ([v5 count] == (id)1)
  {
    int v6 = v5;
  }
  else
  {
    uint64_t v8 = +[EBookManifest purchasedBookManifest];
    int v6 = [v8 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v3 limitCount:1];

    if ([v6 count] != (id)1)
    {
      unsigned int v7 = 0;
      goto LABEL_9;
    }
    unsigned int v5 = v6;
  }
  unsigned int v7 = [v5 objectAtIndex:0];
LABEL_9:

LABEL_10:

  return v7;
}

- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 fileName:(id *)a5 drmPath:(id *)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSFileManager);
  unsigned int v12 = [v10 localPath];
  int v13 = [v10 sourceURLString];
  char v142 = 0;
  if (([v11 fileExistsAtPath:v12] & 1) == 0 && v13)
  {
    id v14 = [objc_alloc((Class)NSURL) initWithString:v13];
    if (![v14 isFileURL])
    {
LABEL_17:

      goto LABEL_18;
    }
    v124 = a4;
    v126 = a5;
    id v128 = v10;
    id v131 = v11;
    id v15 = [v14 path];
    id v141 = v12;
    [(FinishDownloadStepOperation *)self moveFile:v15 toPath:&v141 installBehavior:0 error:0];
    id v16 = v141;

    uint64_t v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      uint64_t v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    int v20 = [v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      int v21 = v19;
    }
    else {
      int v21 = v19 & 2;
    }
    if (v21)
    {
      id v22 = objc_opt_class();
      v23 = v13;
      id v24 = v22;
      v25 = [v14 path];
      int v143 = 138412802;
      v144 = v22;
      __int16 v145 = 2112;
      id v146 = v25;
      __int16 v147 = 2112;
      id v148 = v16;
      LODWORD(v114) = 32;
      v112 = &v143;
      id v26 = (void *)_os_log_send_and_compose_impl();

      int v13 = v23;
      id v11 = v131;
      id v10 = v128;
      if (!v26)
      {
LABEL_16:

        unsigned int v12 = v16;
        a4 = v124;
        a5 = v126;
        goto LABEL_17;
      }
      int v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v143, v114);
      free(v26);
      v112 = (int *)v20;
      SSFileLog();
    }

    goto LABEL_16;
  }
LABEL_18:
  if ((objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, &v142, v112) & 1) == 0)
  {
    id v41 = +[SSLogConfig sharedDaemonConfig];
    if (!v41)
    {
      id v41 = +[SSLogConfig sharedConfig];
    }
    unsigned int v42 = [v41 shouldLog];
    if ([v41 shouldLogToDisk]) {
      v42 |= 2u;
    }
    uint64_t v43 = [v41 OSLogObject];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      int v44 = v42;
    }
    else {
      int v44 = v42 & 2;
    }
    if (v44)
    {
      int v45 = objc_opt_class();
      int v143 = 138412546;
      v144 = v45;
      __int16 v145 = 2112;
      id v146 = v12;
      id v46 = v45;
      LODWORD(v114) = 22;
      __int16 v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47)
      {
LABEL_38:

        SSError();
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        id v30 = 0;
        unsigned int v49 = 0;
        unsigned int v40 = 0;
        BOOL v50 = 0;
        goto LABEL_149;
      }
      uint64_t v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v143, v114);
      free(v47);
      SSFileLog();
    }

    goto LABEL_38;
  }
  id v125 = a4;
  v127 = a5;
  v27 = [(InstallEBookDownloadOperation *)self _bookManifest];
  v28 = [v27 manifestPath];
  unsigned int v29 = [v28 stringByDeletingLastPathComponent];

  id v30 = [v10 destinationFileName];
  v31 = +[EBookManifest syncedBookManifest];

  v122 = v27;
  if (v27 == v31)
  {
    int v32 = [v30 pathExtension];
    int v33 = [v12 lastPathComponent];

    if ([v32 length])
    {
      id v34 = v13;
      int v35 = [v33 pathExtension];
      id v36 = [v35 length];

      if (!v36)
      {
        uint64_t v37 = [v33 stringByAppendingPathExtension:v32];

        int v33 = (void *)v37;
      }
      int v13 = v34;
    }

    id v30 = v33;
  }
  uint64_t v38 = [v29 stringByAppendingPathComponent:v30];
  int v123 = v13;
  if (self->_isSharedDownload)
  {
    v39 = +[InstallEBookDownloadOperation sharedBookContainerCachesPath];
    unsigned int v40 = [v39 stringByAppendingPathComponent:v30];

    unsigned int v29 = v39;
  }
  else
  {
    unsigned int v40 = [v29 stringByAppendingPathComponent:v30];
  }
  id v129 = (id)v38;
  v132 = v11;

  v51 = +[SSLogConfig sharedDaemonConfig];
  if (!v51)
  {
    v51 = +[SSLogConfig sharedConfig];
  }
  unsigned int v52 = [v51 shouldLog];
  if ([v51 shouldLogToDisk]) {
    v52 |= 2u;
  }
  v53 = [v51 OSLogObject];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO)) {
    int v54 = v52;
  }
  else {
    int v54 = v52 & 2;
  }
  if (v54)
  {
    id v55 = objc_opt_class();
    int v143 = 138412546;
    v144 = v55;
    __int16 v145 = 2112;
    id v146 = v40;
    id v56 = v55;
    LODWORD(v114) = 22;
    uint64_t v113 = &v143;
    v57 = (void *)_os_log_send_and_compose_impl();

    if (!v57) {
      goto LABEL_51;
    }
    v53 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v57, 4, &v143, v114);
    free(v57);
    uint64_t v113 = (int *)v53;
    SSFileLog();
  }

LABEL_51:
  if (v142)
  {
    unsigned int v58 = [v12 isEqualToString:v40];
    uint64_t v59 = +[SSLogConfig sharedDaemonConfig];
    id v60 = (void *)v59;
    if (v58)
    {
      if (!v59)
      {
        id v60 = +[SSLogConfig sharedConfig];
      }
      unsigned int v61 = objc_msgSend(v60, "shouldLog", v113);
      if ([v60 shouldLogToDisk]) {
        v61 |= 2u;
      }
      uint64_t v62 = [v60 OSLogObject];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO)) {
        int v63 = v61;
      }
      else {
        int v63 = v61 & 2;
      }
      if (v63)
      {
        id v64 = objc_opt_class();
        int v143 = 138412546;
        v144 = v64;
        __int16 v145 = 2112;
        id v146 = v40;
        id v65 = v64;
        LODWORD(v114) = 22;
        v66 = (void *)_os_log_send_and_compose_impl();

        id v67 = a6;
        id v11 = v132;
        if (!v66)
        {
LABEL_98:

          char v90 = 0;
          id v48 = 0;
          unsigned int v76 = 1;
          goto LABEL_137;
        }
        uint64_t v62 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v66, 4, &v143, v114);
        free(v66);
        SSFileLog();
      }
      else
      {
        id v67 = a6;
        id v11 = v132;
      }

      goto LABEL_98;
    }
    if (!v59)
    {
      id v60 = +[SSLogConfig sharedConfig];
    }
    unsigned int v77 = objc_msgSend(v60, "shouldLog", v113);
    if ([v60 shouldLogToDisk]) {
      v77 |= 2u;
    }
    id v78 = [v60 OSLogObject];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO)) {
      int v79 = v77;
    }
    else {
      int v79 = v77 & 2;
    }
    if (v79)
    {
      v80 = objc_opt_class();
      int v143 = 138412802;
      v144 = v80;
      __int16 v145 = 2112;
      id v146 = v12;
      __int16 v147 = 2112;
      id v148 = v40;
      id v81 = v80;
      LODWORD(v114) = 32;
      v82 = (void *)_os_log_send_and_compose_impl();

      if (!v82)
      {
LABEL_100:

        id v140 = v40;
        id v139 = 0;
        unsigned int v76 = [(FinishDownloadStepOperation *)self moveFile:v12 toPath:&v140 installBehavior:0 error:&v139];
        id v91 = v140;

        id v48 = v139;
        char v90 = 0;
        unsigned int v40 = v91;
        id v67 = a6;
        id v11 = v132;
        goto LABEL_137;
      }
      id v78 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v82, 4, &v143, v114);
      free(v82);
      SSFileLog();
    }

    goto LABEL_100;
  }
  id v137 = 0;
  id v138 = 0;
  unsigned int v68 = [(FinishDownloadStepOperation *)self unzipAsset:v10 unzippedPath:&v138 error:&v137];
  id v69 = v138;
  id v11 = v132;
  char v119 = v68;
  v118 = v69;
  id v120 = v137;
  if (v68)
  {
    id v136 = v40;
    [(FinishDownloadStepOperation *)self moveFile:v69 toPath:&v136 installBehavior:0 error:0];
    id v115 = v136;

    v70 = +[SSLogConfig sharedDaemonConfig];
    if (!v70)
    {
      v70 = +[SSLogConfig sharedConfig];
    }
    unsigned int v71 = objc_msgSend(v70, "shouldLog", v113);
    if ([v70 shouldLogToDisk]) {
      v71 |= 2u;
    }
    v72 = [v70 OSLogObject];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO)) {
      int v73 = v71;
    }
    else {
      int v73 = v71 & 2;
    }
    unsigned int v121 = v70;
    if (v73)
    {
      v74 = objc_opt_class();
      int v143 = 138412546;
      v144 = v74;
      __int16 v145 = 2112;
      id v146 = v115;
      id v75 = v74;
      LODWORD(v114) = 22;
      unsigned int v76 = 1;
      id v48 = (id)_os_log_send_and_compose_impl();

      if (!v48)
      {
        id v67 = a6;
        id v11 = v132;
        goto LABEL_118;
      }
      v72 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v48, 4, &v143, v114);
      free(v48);
      SSFileLog();
      id v11 = v132;
    }
    else
    {
      id v11 = v132;
    }
    id v67 = a6;

    id v48 = 0;
    unsigned int v76 = 1;
LABEL_118:
    v92 = v120;
    unsigned int v40 = v115;
    goto LABEL_136;
  }
  [v132 removeItemAtPath:v69 error:0];
  unsigned int v121 = [v40 pathExtension];
  if (([v121 isEqualToString:@"epub"] & 1) == 0
    && ![v121 isEqualToString:@"ibooks"])
  {
    unsigned int v93 = [v12 isEqualToString:v40];
    id v94 = +[SSLogConfig sharedDaemonConfig];
    if (v93)
    {
      if (!v94)
      {
        id v94 = +[SSLogConfig sharedConfig];
      }
      v95 = v94;
      unsigned int v96 = objc_msgSend(v94, "shouldLog", v113);
      if ([v95 shouldLogToDisk]) {
        v96 |= 2u;
      }
      v116 = v95;
      int v97 = [v95 OSLogObject];
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO)) {
        int v98 = v96;
      }
      else {
        int v98 = v96 & 2;
      }
      if (v98)
      {
        int v99 = objc_opt_class();
        int v143 = 138412546;
        v144 = v99;
        __int16 v145 = 2112;
        id v146 = v40;
        id v100 = v99;
        LODWORD(v114) = 22;
        v101 = (void *)_os_log_send_and_compose_impl();

        int v13 = v123;
        id v67 = a6;
        if (!v101)
        {
LABEL_131:

          id v48 = 0;
          unsigned int v76 = 1;
LABEL_135:
          v92 = v120;
          goto LABEL_136;
        }
        int v97 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v101, 4, &v143, v114);
        free(v101);
        SSFileLog();
      }
      else
      {
        int v13 = v123;
        id v67 = a6;
      }

      goto LABEL_131;
    }
    if (!v94)
    {
      id v94 = +[SSLogConfig sharedConfig];
    }
    id v102 = v94;
    unsigned int v103 = objc_msgSend(v94, "shouldLog", v113);
    if ([v102 shouldLogToDisk]) {
      v103 |= 2u;
    }
    int v117 = v102;
    v104 = [v102 OSLogObject];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO)) {
      int v105 = v103;
    }
    else {
      int v105 = v103 & 2;
    }
    if (v105)
    {
      v106 = objc_opt_class();
      int v143 = 138412802;
      v144 = v106;
      __int16 v145 = 2112;
      id v146 = v12;
      __int16 v147 = 2112;
      id v148 = v40;
      id v107 = v106;
      LODWORD(v114) = 32;
      v108 = (void *)_os_log_send_and_compose_impl();

      int v13 = v123;
      id v67 = a6;
      if (!v108)
      {
LABEL_134:

        id v134 = 0;
        id v135 = v40;
        unsigned int v76 = [(FinishDownloadStepOperation *)self moveFile:v12 toPath:&v135 installBehavior:0 error:&v134];
        id v109 = v135;

        unsigned int v40 = v109;
        id v48 = v134;
        goto LABEL_135;
      }
      v104 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v108, 4, &v143, v114);
      free(v108);
      SSFileLog();
    }
    else
    {
      int v13 = v123;
      id v67 = a6;
    }

    goto LABEL_134;
  }
  v83 = +[SSLogConfig sharedDaemonConfig];
  if (!v83)
  {
    v83 = +[SSLogConfig sharedConfig];
  }
  unsigned int v84 = [v83 shouldLog];
  if ([v83 shouldLogToDisk]) {
    v84 |= 2u;
  }
  unsigned int v85 = [v83 OSLogObject];
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT)) {
    int v86 = v84;
  }
  else {
    int v86 = v84 & 2;
  }
  if (!v86)
  {
    id v67 = a6;
    id v11 = v132;
    goto LABEL_104;
  }
  v87 = objc_opt_class();
  int v143 = 138412802;
  v144 = v87;
  __int16 v145 = 2112;
  id v146 = v12;
  __int16 v147 = 2112;
  id v148 = v120;
  id v88 = v87;
  LODWORD(v114) = 32;
  v89 = (void *)_os_log_send_and_compose_impl();

  id v67 = a6;
  id v11 = v132;
  if (v89)
  {
    unsigned int v85 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v89, 4, &v143, v114);
    free(v89);
    SSFileLog();
LABEL_104:
  }
  v92 = v120;
  id v48 = v120;
  unsigned int v76 = 0;
LABEL_136:

  char v90 = v119;
LABEL_137:
  if (v76 && (v90 & 1) == 0)
  {
    id v110 = [v10 fileAttributes];
    if ([v110 count]) {
      [v11 setAttributes:v110 ofItemAtPath:v40 error:0];
    }
  }
  BOOL v50 = v76 != 0;
  if (v67 && v76)
  {
    *id v125 = v40;
    *id v67 = v129;
  }
  if (v30 && v76)
  {
    id v30 = v30;
    unsigned int v49 = v129;
    id *v127 = v30;
    BOOL v50 = 1;
    goto LABEL_152;
  }
  unsigned int v49 = v129;
LABEL_149:
  if (a7 && !v50)
  {
    id v48 = v48;
    *a7 = v48;
  }
LABEL_152:

  return v50;
}

- (id)_newManifestEntry:(id)a3
{
  return [(InstallEBookDownloadOperation *)self _newManifestEntry:0 withFileName:a3];
}

- (id)_newManifestEntry:(BOOL)a3 withFileName:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v8 = [(FinishDownloadStepOperation *)self download];
  if ([v6 length])
  {
    [v7 setObject:v6 forKey:@"Path"];
  }
  else
  {
    v9 = [v8 mediaAsset];
    id v10 = [v9 destinationFileName];
    [v7 setObject:v10 forKey:@"Path"];
  }
  id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isSampleDownload]);
  [v7 setObject:v11 forKey:@"isSample"];

  unsigned int v12 = [v8 collectionName];
  if (v12) {
    [v7 setObject:v12 forKey:@"Album"];
  }
  int v13 = [v8 artistName];

  if (v13) {
    [v7 setObject:v13 forKey:@"Artist"];
  }
  id v14 = [v8 artworkTemplateName];

  if (v14) {
    [v7 setObject:v14 forKey:@"artwork-template-name"];
  }
  id v15 = [v8 genreName];

  if (v15) {
    [v7 setObject:v15 forKey:@"Genre"];
  }
  id v16 = [v8 libraryItemIdentifier];

  if (v16) {
    [v7 setObject:v16 forKey:@"Persistent ID"];
  }
  if (!a3)
  {
    uint64_t v17 = [v8 storeAccountIdentifier];
    if (v17) {
      [v7 setObject:v17 forKey:@"DSID"];
    }
    unsigned int v18 = [v8 storeAccountName];
    id v19 = [v18 length];
    if (v17 && !v19)
    {
      int v20 = +[SSAccountStore defaultStore];
      int v21 = [v20 accountWithUniqueIdentifier:v16];
      if (!v21)
      {
        int v21 = [v20 activeAccount];
      }
      uint64_t v22 = [v21 accountName];

      unsigned int v18 = (void *)v22;
    }
    if (v18) {
      [v7 setObject:v18 forKey:@"AppleID"];
    }
    if (self->_isSharedDownload)
    {
      v23 = +[ApplicationWorkspace defaultWorkspace];
      unsigned int v24 = [v23 isMultiUser];

      if (v24) {
        [v7 setObject:&__kCFBooleanTrue forKey:@"usesSharedAsset"];
      }
    }
  }
  v25 = [v8 downloadPermalink];

  if (v25) {
    [v7 setObject:v25 forKey:@"iTunesU Permlink"];
  }
  id v26 = [(InstallEBookDownloadOperation *)self _storeFrontIdentifier];

  if (v26) {
    [v7 setObject:v26 forKey:@"Storefront ID"];
  }
  v27 = [v8 storeXID];

  if (v27) {
    [v7 setObject:v27 forKey:@"XID"];
  }
  v28 = [v8 title];

  if (v28) {
    [v7 setObject:v28 forKey:@"Name"];
  }
  unsigned int v29 = [v8 storeItemIdentifier];
  uint64_t v30 = SSGetItemIdentifierFromValue();

  if (v30)
  {
    v31 = +[NSNumber numberWithUnsignedLongLong:v30];
    [v7 setObject:v31 forKey:@"s"];
  }
  int v32 = [v8 storeCollectionIdentifier];
  uint64_t v33 = SSGetItemIdentifierFromValue();

  if (v28)
  {
    id v34 = +[NSNumber numberWithUnsignedLongLong:v33];
    [v7 setObject:v34 forKey:@"PlaylistID"];
  }
  int v35 = [v8 storeMetadata];
  id v36 = [v35 copyright];

  if (v36) {
    [v7 setObject:v36 forKey:@"Copyright"];
  }
  if ([v35 isExplicitContent])
  {
    uint64_t v37 = +[NSNumber numberWithBool:1];
    [v7 setObject:v37 forKey:@"isExplicit"];
  }
  uint64_t v38 = [v35 valueForMetadataKey:SSDownloadMetadataKeyHumanReadablePublicationVersion];

  if (v38) {
    [v7 setObject:v38 forKey:@"Human Readable Publication Version"];
  }
  v39 = [v35 valueForMetadataKey:SSDownloadMetadataKeyLanguages];

  if (v39) {
    [v7 setObject:v39 forKey:@"Languages"];
  }
  unsigned int v40 = [v35 valueForMetadataKey:SSDownloadMetadataKeyPageProgression];

  if (v40) {
    [v7 setObject:v40 forKey:@"PageProgression"];
  }
  id v41 = [v35 pageProgressionDirection];

  if (v41) {
    [v7 setObject:v41 forKey:@"Page Progression Direction"];
  }
  unsigned int v42 = [v35 valueForMetadataKey:SSDownloadMetadataKeyPublicationVersion];

  if (v42) {
    [v7 setObject:v42 forKey:@"Publication Version"];
  }
  uint64_t v43 = [v35 releaseDateString];

  if (v43) {
    [v7 setObject:v43 forKey:@"Release Date"];
  }
  int v44 = [v35 sortArtistName];

  if (v44) {
    [v7 setObject:v44 forKey:@"Sort Artist"];
  }
  int v45 = [v35 sortCollectionName];

  if (v45) {
    [v7 setObject:v45 forKey:@"Sort Album"];
  }
  id v46 = [v35 sortTitle];

  if (v46) {
    [v7 setObject:v46 forKey:@"Sort Name"];
  }
  __int16 v47 = [v35 primaryAssetDictionary];

  if (v47
    || ([v35 valueForMetadataKey:SSDownloadMetadataKeyAssetInfo],
        (__int16 v47 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v48 = [v47 objectForKey:SSDownloadMetadataKeyAssetFlavor];
    if (v48) {
      [v7 setObject:v48 forKey:@"Flavor"];
    }
  }
  return v7;
}

- (void)_removeDuplicateEntry:(id)a3
{
  id v14 = a3;
  v4 = [(FinishDownloadStepOperation *)self download];
  unsigned int v5 = [v4 storeItemIdentifier];

  if (v5)
  {
    id v6 = [v14 manifestEntriesWithProperty:@"s" equalToValue:v5 limitCount:1];
    if ([v6 count] == (id)1) {
      [v14 removeManifestEntryWithStoreItemID:v5];
    }
  }
  else
  {
    id v7 = [(FinishDownloadStepOperation *)self download];
    uint64_t v8 = [v7 downloadPermalink];
    id v9 = [v8 length];

    if (!v9) {
      goto LABEL_8;
    }
    id v10 = [(FinishDownloadStepOperation *)self download];
    id v11 = [v10 downloadPermalink];
    id v6 = [v14 manifestEntriesWithProperty:@"iTunesU Permlink" equalToValue:v11 limitCount:1];

    if ([v6 count] == (id)1)
    {
      unsigned int v12 = [(FinishDownloadStepOperation *)self download];
      int v13 = [v12 downloadPermalink];
      [v14 removeManifestEntryWithDownloadPermalink:v13];
    }
  }

LABEL_8:
}

- (id)_storeFrontIdentifier
{
  v2 = [(FinishDownloadStepOperation *)self download];
  BOOL v3 = [v2 storeFrontIdentifier];
  if (!v3)
  {
    v4 = [v2 storeAccountIdentifier];
    if (v4)
    {
      unsigned int v5 = +[SSAccountStore defaultStore];
      id v6 = [v5 accountWithUniqueIdentifier:v4];

      if (v6)
      {
        BOOL v3 = [v6 storeFrontIdentifier];
        if (v3) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = +[SSDevice currentDevice];
    BOOL v3 = [v7 storeFrontIdentifier];

LABEL_8:
  }

  return v3;
}

- (id)_syncedBooksPath
{
  id v2 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CPSharedResourcesDirectory(), @"Media", @"Books", 0);
  BOOL v3 = +[NSString pathWithComponents:v2];

  return v3;
}

- (void).cxx_destruct
{
}

@end