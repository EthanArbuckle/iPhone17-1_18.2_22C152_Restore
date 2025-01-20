@interface PrepareDownloadOperation
+ (BOOL)_isDTServiceHubIssuedRequest:(id)a3;
+ (id)_mediaAssetsForDownloadIdentifier:(int64_t)a3 session:(id)a4;
+ (int64_t)_URLSessionTaskPriorityForDownload:(id)a3;
+ (int64_t)_URLSessionTaskPriorityForDownloadPriority:(int64_t)a3;
+ (void)enumerateOperationsWithDownloadQuery:(id)a3 session:(id)a4 usingBlock:(id)a5;
- (BOOL)_allowsCellularAccessForAsset:(id)a3;
- (BOOL)_assetNeedsDecryption:(id)a3;
- (BOOL)_isPodcast;
- (BOOL)_isPodcastRestore;
- (BOOL)_itemIsInMediaLibrary;
- (BOOL)_itemIsInSoftwareLibrary;
- (BOOL)_requiresPoweredPluggedIn;
- (BOOL)_sendsStoreHeadersForAsset:(id)a3;
- (BOOL)_shouldCancelAsDuplicate;
- (BOOL)_shouldCancelAutomaticDownload;
- (BOOL)_shouldFailForDiskSpaceWithAsset:(id)a3 dataConsumer:(id)a4;
- (BOOL)_shouldFailForFinishedDownload;
- (BOOL)_usesStreamingZipDataConsumerForAsset:(id)a3;
- (BOOL)ignoresDownloadHandler;
- (double)_transferProgressFractionWithAsset:(id)a3;
- (id)_bestMediaAsset;
- (id)_clientIdentifier;
- (id)_initWithDownload:(id)a3 mediaAssets:(id)a4 policy:(id)a5;
- (id)_newAVAssetDownloadSessionOptionsWithAsset:(id)a3 URLRequest:(id)a4;
- (id)_newAVContentInfoDictionary;
- (id)_newDataConsumerWithAsset:(id)a3 destinationPath:(id)a4;
- (id)_newURLRequestWithAsset:(id)a3;
- (id)outputBlock;
- (int64_t)_assetSizeFromURLResponse:(id)a3;
- (int64_t)_loadSizeForAsset:(id)a3 error:(id *)a4;
- (int64_t)_loadSizeIfNecessaryForAsset:(id)a3;
- (int64_t)downloadIdentifier;
- (int64_t)operation:(id)a3 dispositionForAuthenticationChallenge:(id)a4;
- (void)_recordCoreAnalyticsEventForClient:(id)a3 downloadKind:(id)a4 url:(id)a5;
- (void)operation:(id)a3 didReceiveResponse:(id)a4;
- (void)run;
- (void)setIgnoresDownloadHandler:(BOOL)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation PrepareDownloadOperation

- (id)_initWithDownload:(id)a3 mediaAssets:(id)a4 policy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PrepareDownloadOperation;
  v12 = [(PrepareDownloadOperation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_download, a3);
    v14 = (NSArray *)[v10 copy];
    mediaAssets = v13->_mediaAssets;
    v13->_mediaAssets = v14;

    objc_storeStrong((id *)&v13->_policy, a5);
  }

  return v13;
}

+ (void)enumerateOperationsWithDownloadQuery:(id)a3 session:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = @"airplay_content_type";
  v22[1] = @"is_automatic";
  v22[2] = @"bundle_id";
  v22[3] = @"client.audit_token_data";
  v22[4] = @"client_id";
  v22[5] = @"download_permalink";
  v22[6] = @"application_id.bundle_id";
  v22[7] = @"is_restore";
  v22[8] = @"is_shared";
  v22[9] = @"is_from_store";
  v22[10] = @"kind";
  v22[11] = @"loading_priority";
  v22[12] = @"override_audit_token_data";
  v22[13] = @"policy_id";
  v22[14] = @"priority";
  v22[15] = @"rate_limit";
  v22[16] = @"rental_id";
  v22[17] = @"resource_timeout_interval";
  v22[18] = @"IFNULL(download_state.restore_data_size, 0)";
  v22[19] = @"IFNULL(download_state.restore_state, 0)";
  v22[20] = @"cancel_if_duplicate";
  v22[21] = @"store_account_id";
  v22[22] = @"store_download_key";
  v22[23] = @"store_item_id";
  v22[24] = @"store_publication_version";
  v22[25] = @"store_redownload_parameters";
  v22[26] = @"store_saga_id";
  v22[27] = @"title";
  v22[28] = @"thumbnail_url";
  v22[29] = @"timeout_interval";
  v22[30] = @"transaction_id";
  id v11 = [objc_alloc((Class)NSArray) initWithObjects:v22 count:31];
  v12 = [v9 policyManager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10014F490;
  v17[3] = &unk_1003A7E28;
  id v21 = a1;
  id v13 = v9;
  id v18 = v13;
  id v19 = v12;
  id v14 = v10;
  id v20 = v14;
  id v15 = v12;
  [v8 enumerateMemoryEntitiesWithProperties:v11 usingBlock:v17];

  for (uint64_t i = 30; i != -1; --i)
}

- (int64_t)downloadIdentifier
{
  return (int64_t)[(SSMemoryEntity *)self->_download databaseID];
}

- (BOOL)ignoresDownloadHandler
{
  [(PrepareDownloadOperation *)self lock];
  BOOL ignoresDownloadHandler = self->_ignoresDownloadHandler;
  [(PrepareDownloadOperation *)self unlock];
  return ignoresDownloadHandler;
}

- (id)outputBlock
{
  [(PrepareDownloadOperation *)self lock];
  id v3 = [self->_outputBlock copy];
  [(PrepareDownloadOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setIgnoresDownloadHandler:(BOOL)a3
{
  [(PrepareDownloadOperation *)self lock];
  self->_BOOL ignoresDownloadHandler = a3;

  [(PrepareDownloadOperation *)self unlock];
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(PrepareDownloadOperation *)self lock];
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(PrepareDownloadOperation *)self unlock];
}

- (void)run
{
  id v3 = objc_alloc_init(PrepareDownloadResponse);
  [(PrepareDownloadResponse *)v3 setIgnoresDownloadHandler:[(PrepareDownloadOperation *)self ignoresDownloadHandler]];
  [(PrepareDownloadResponse *)v3 setResult:0];
  id v4 = -[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:");
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 copy];
    [(PrepareDownloadResponse *)v3 setKind:v6];

    if ([v5 isEqualToString:@"com.apple.MobileAsset"]) {
      [(PrepareDownloadResponse *)v3 setLegacyClient:1];
    }
  }
  v7 = -[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:");
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 copy];
    [(PrepareDownloadResponse *)v3 setBundleIdentifier:v9];
  }
  v219 = v8;
  id v10 = [(SSMemoryEntity *)self->_download databaseID];
  [(PrepareDownloadResponse *)v3 setDownloadIdentifier:v10];
  id v11 = [(SSMemoryEntity *)self->_download valueForProperty:@"transaction_id"];
  id v12 = [v11 longLongValue];

  v218 = [[DownloadHandle alloc] initWithTransactionIdentifier:v12 downloadIdentifier:v10];
  -[PrepareDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  id v13 = [(SSMemoryEntity *)self->_download valueForProperty:@"rental_id"];
  id v14 = [v13 longLongValue];

  [(PrepareDownloadResponse *)v3 setRentalIdentifier:v14];
  id v15 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_item_id"];
  id v16 = [v15 longLongValue];

  [(PrepareDownloadResponse *)v3 setStoreItemIdentifier:v16];
  v217 = [(SSMemoryEntity *)self->_download valueForProperty:@"title"];
  -[PrepareDownloadResponse setTitle:](v3, "setTitle:");
  objc_super v17 = +[SSLogConfig sharedDaemonConfig];
  if (!v17)
  {
    objc_super v17 = +[SSLogConfig sharedConfig];
  }
  unsigned int v18 = [v17 shouldLog];
  if ([v17 shouldLogToDisk]) {
    v18 |= 2u;
  }
  id v19 = [v17 OSLogObject];
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
    v18 &= 2u;
  }
  id v214 = v10;
  if (v18)
  {
    id v20 = (id)objc_opt_class();
    int v222 = 138412546;
    id v223 = v20;
    __int16 v224 = 2048;
    id v225 = v10;
    LODWORD(v200) = 22;
    v197 = &v222;
    id v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21) {
      goto LABEL_16;
    }
    id v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v222, v200);
    free(v21);
    v197 = (int *)v19;
    SSFileLog();
  }

LABEL_16:
  v22 = [(PrepareDownloadOperation *)self _bestMediaAsset];
  -[PrepareDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v22 databaseID]);
  v23 = [v22 valueForProperty:@"url_session_task_id"];
  [(PrepareDownloadResponse *)v3 setTaskIdentifier:v23];

  uint64_t v24 = [v22 valueForProperty:@"url"];
  v216 = (void *)v24;
  if (!v24)
  {
    unsigned int v29 = 0;
    id v220 = 0;
    goto LABEL_41;
  }
  v25 = [(PrepareDownloadOperation *)self _clientIdentifier];
  [(PrepareDownloadOperation *)self _recordCoreAnalyticsEventForClient:v25 downloadKind:v5 url:v24];

  id v220 = [objc_alloc((Class)NSURL) initWithString:v24];
  v26 = [v22 valueForProperty:@"is_downloaded"];
  unsigned int v27 = [v26 BOOLValue];

  if (!v27)
  {
    unsigned int v29 = 0;
    LODWORD(v24) = 0;
    goto LABEL_41;
  }
  v206 = v5;
  v28 = +[NSFileManager defaultManager];
  unsigned int v29 = [v28 fileExistsAtPath:v24];
  v211 = v22;
  if (v29)
  {
    v30 = +[SSLogConfig sharedDaemonConfig];
    if (!v30)
    {
      v30 = +[SSLogConfig sharedConfig];
    }
    unsigned int v31 = objc_msgSend(v30, "shouldLog", v197);
    if ([v30 shouldLogToDisk]) {
      v31 |= 2u;
    }
    v32 = [v30 OSLogObject];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
      v31 &= 2u;
    }
    if (!v31) {
      goto LABEL_38;
    }
  }
  else
  {
    [v22 setValue:&__kCFBooleanFalse forProperty:@"is_downloaded"];
    v30 = +[SSLogConfig sharedDaemonConfig];
    if (!v30)
    {
      v30 = +[SSLogConfig sharedConfig];
    }
    unsigned int v33 = objc_msgSend(v30, "shouldLog", v197);
    if ([v30 shouldLogToDisk]) {
      v33 |= 2u;
    }
    v32 = [v30 OSLogObject];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
      v33 &= 2u;
    }
    if (!v33) {
      goto LABEL_38;
    }
  }
  v34 = v3;
  id v35 = (id)objc_opt_class();
  id v36 = [v211 databaseID];
  int v222 = 138412802;
  id v223 = v35;
  __int16 v224 = 2048;
  id v225 = v214;
  __int16 v226 = 2048;
  id v227 = v36;
  LODWORD(v200) = 32;
  v197 = &v222;
  v37 = (void *)_os_log_send_and_compose_impl();

  if (!v37)
  {
    id v3 = v34;
    goto LABEL_40;
  }
  v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v222, v200);
  free(v37);
  v197 = (int *)v32;
  SSFileLog();
  id v3 = v34;
LABEL_38:

LABEL_40:
  LODWORD(v24) = 1;
  v5 = v206;
  v22 = v211;
LABEL_41:
  v38 = +[ApplicationWorkspace defaultWorkspace];
  if (![v38 isMultiUser])
  {
LABEL_52:

    goto LABEL_53;
  }
  int IsEBookKind = SSDownloadKindIsEBookKind();

  if (IsEBookKind)
  {
    v40 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_shared"];
    unsigned int v41 = [v40 BOOLValue];

    if (v41)
    {
      v212 = v22;
      v204 = v3;
      v207 = v5;
      v38 = +[EBookManifest sharedPurchasedBookManifest];
      v42 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_publication_version"];
      v43 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_item_id"];
      v44 = [(SSMemoryEntity *)self->_download valueForProperty:@"download_permalink"];
      v45 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_from_store"];
      unsigned int v46 = [v45 BOOLValue];

      if (v46)
      {
        v47 = [v38 bookPathForAdamID:v43 withPublicationVersion:v42];
      }
      else
      {
        if (![v44 length])
        {
          v48 = 0;
          id v3 = v204;
          goto LABEL_49;
        }
        v47 = [v38 bookPathPermalink:v44];
      }
      v48 = v47;
      id v3 = v204;

LABEL_49:
      if (v48)
      {
        unsigned int v29 = 1;
        LODWORD(v24) = 1;
      }

      v5 = v207;
      v22 = v212;
      goto LABEL_52;
    }
  }
LABEL_53:
  if (!SSDownloadKindIsSoftwareKind())
  {
    if ([(PrepareDownloadOperation *)self _shouldFailForFinishedDownload])
    {
      v58 = +[SSLogConfig sharedDaemonConfig];
      if (!v58)
      {
        v58 = +[SSLogConfig sharedConfig];
      }
      unsigned int v59 = [v58 shouldLog];
      if ([v58 shouldLogToDisk]) {
        int v60 = v59 | 2;
      }
      else {
        int v60 = v59;
      }
      v61 = [v58 OSLogObject];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
        int v62 = v60;
      }
      else {
        int v62 = v60 & 2;
      }
      if (v62)
      {
LABEL_75:
        v63 = objc_opt_class();
        int v222 = 138412546;
        id v223 = v63;
        __int16 v224 = 2048;
        id v225 = v214;
        id v64 = v63;
        LODWORD(v200) = 22;
        v198 = &v222;
        v65 = (void *)_os_log_send_and_compose_impl();

        p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
        if (!v65)
        {
LABEL_214:

          v77 = v3;
          uint64_t v78 = 4;
          goto LABEL_215;
        }
        v61 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v65, 4, &v222, v200);
        free(v65);
        v198 = (int *)v61;
        SSFileLog();
LABEL_213:

        goto LABEL_214;
      }
LABEL_212:
      p_vtable = &OBJC_METACLASS___DownloadArtworkCacheOperation.vtable;
      goto LABEL_213;
    }
    if ([(PrepareDownloadOperation *)self _shouldCancelAsDuplicate])
    {
      v66 = +[SSLogConfig sharedDaemonConfig];
      if (!v66)
      {
        v66 = +[SSLogConfig sharedConfig];
      }
      unsigned int v67 = [v66 shouldLog];
      if ([v66 shouldLogToDisk]) {
        int v68 = v67 | 2;
      }
      else {
        int v68 = v67;
      }
      v69 = [v66 OSLogObject];
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
        int v70 = v68;
      }
      else {
        int v70 = v68 & 2;
      }
      if (v70)
      {
LABEL_101:
        v74 = objc_opt_class();
        int v222 = 138412546;
        id v223 = v74;
        __int16 v224 = 2048;
        id v225 = v214;
        id v75 = v74;
        LODWORD(v200) = 22;
        v198 = &v222;
        v76 = (void *)_os_log_send_and_compose_impl();

        p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
        if (!v76)
        {
LABEL_105:

          v77 = v3;
          uint64_t v78 = 1;
LABEL_215:
          -[PrepareDownloadResponse setResult:](v77, "setResult:", v78, v198);
          goto LABEL_216;
        }
        v69 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v76, 4, &v222, v200);
        free(v76);
        v198 = (int *)v69;
        SSFileLog();
LABEL_104:

        goto LABEL_105;
      }
LABEL_103:
      p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
      goto LABEL_104;
    }
    if ([(PrepareDownloadOperation *)self _shouldCancelAutomaticDownload])
    {
      v66 = +[SSLogConfig sharedDaemonConfig];
      if (!v66)
      {
        v66 = +[SSLogConfig sharedConfig];
      }
      unsigned int v71 = [v66 shouldLog];
      if ([v66 shouldLogToDisk]) {
        int v72 = v71 | 2;
      }
      else {
        int v72 = v71;
      }
      v69 = [v66 OSLogObject];
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
        int v73 = v72;
      }
      else {
        int v73 = v72 & 2;
      }
      if (v73) {
        goto LABEL_101;
      }
      goto LABEL_103;
    }
    v79 = [(SSMemoryEntity *)self->_download valueForProperty:@"IFNULL(download_state.restore_state, 0)"];
    id v80 = [v79 integerValue];

    if (v80 == (id)1)
    {
      v81 = +[SSLogConfig sharedDaemonConfig];
      if (!v81)
      {
        v81 = +[SSLogConfig sharedConfig];
      }
      unsigned int v82 = [v81 shouldLog];
      if ([v81 shouldLogToDisk]) {
        int v83 = v82 | 2;
      }
      else {
        int v83 = v82;
      }
      v84 = [v81 OSLogObject];
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
        int v85 = v83;
      }
      else {
        int v85 = v83 & 2;
      }
      if (v85)
      {
LABEL_116:
        v86 = objc_opt_class();
        int v222 = 138412546;
        id v223 = v86;
        __int16 v224 = 2048;
        id v225 = v214;
        id v87 = v86;
        LODWORD(v200) = 22;
        v198 = &v222;
LABEL_117:
        v88 = (void *)_os_log_send_and_compose_impl();

LABEL_130:
        p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
        if (!v88)
        {
LABEL_183:

          v77 = v3;
          uint64_t v78 = 3;
          goto LABEL_215;
        }
        v84 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v88, 4, &v222, v200);
        free(v88);
        v198 = (int *)v84;
        SSFileLog();
LABEL_182:

        goto LABEL_183;
      }
LABEL_181:
      p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
      goto LABEL_182;
    }
    if (v22)
    {
      if ((v24 & v29) == 1)
      {
        v81 = +[SSLogConfig sharedDaemonConfig];
        if (!v81)
        {
          v81 = +[SSLogConfig sharedConfig];
        }
        unsigned int v89 = [v81 shouldLog];
        if ([v81 shouldLogToDisk]) {
          int v90 = v89 | 2;
        }
        else {
          int v90 = v89;
        }
        v84 = [v81 OSLogObject];
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO)) {
          int v91 = v90;
        }
        else {
          int v91 = v90 & 2;
        }
        if (v91)
        {
          v92 = objc_opt_class();
          id v93 = v92;
          id v94 = [v22 databaseID];
          int v222 = 138412802;
          id v223 = v92;
          __int16 v224 = 2048;
          id v225 = v214;
          __int16 v226 = 2048;
          id v227 = v94;
          LODWORD(v200) = 32;
          v198 = &v222;
          v88 = (void *)_os_log_send_and_compose_impl();

          goto LABEL_130;
        }
        goto LABEL_181;
      }
      if (([v220 isFileURL] & v29) == 1)
      {
        v81 = +[SSLogConfig sharedDaemonConfig];
        if (!v81)
        {
          v81 = +[SSLogConfig sharedConfig];
        }
        unsigned int v112 = [v81 shouldLog];
        if ([v81 shouldLogToDisk]) {
          int v113 = v112 | 2;
        }
        else {
          int v113 = v112;
        }
        v84 = [v81 OSLogObject];
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
          int v114 = v113;
        }
        else {
          int v114 = v113 & 2;
        }
        if (v114) {
          goto LABEL_116;
        }
        goto LABEL_181;
      }
      if (SSDownloadKindIsSoftwareKind())
      {
        if (+[ApplicationWorkspace keepSafeHarborDataForBundleID:v219])
        {
          uint64_t v115 = [(PrepareDownloadResponse *)v3 clientIdentifier];
          if (v115)
          {
            v116 = (void *)v115;
            v117 = [(PrepareDownloadResponse *)v3 clientIdentifier];
            unsigned int v118 = [v117 isEqualToString:@"atc"];

            if (v118)
            {
              v81 = +[SSLogConfig sharedDaemonConfig];
              if (!v81)
              {
                v81 = +[SSLogConfig sharedConfig];
              }
              unsigned int v119 = [v81 shouldLog];
              if ([v81 shouldLogToDisk]) {
                int v120 = v119 | 2;
              }
              else {
                int v120 = v119;
              }
              v84 = [v81 OSLogObject];
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
                int v121 = v120;
              }
              else {
                int v121 = v120 & 2;
              }
              if (!v121) {
                goto LABEL_181;
              }
LABEL_156:
              v111 = objc_opt_class();
              int v222 = 138412802;
              id v223 = v111;
              __int16 v224 = 2048;
              id v225 = v214;
              __int16 v226 = 2112;
              id v227 = v219;
              id v87 = v111;
              LODWORD(v200) = 32;
              v198 = &v222;
              goto LABEL_117;
            }
          }
        }
      }
      uint64_t v122 = [(PrepareDownloadOperation *)self _loadSizeIfNecessaryForAsset:v22];
      if (v122 >= 1) {
        [(PrepareDownloadResponse *)v3 setMediaAssetSize:v122];
      }
      uint64_t v123 = [v22 valueForProperty:@"local_path"];
      v124 = [v22 valueForProperty:@"is_hls"];
      v205 = v124;
      if (objc_opt_respondsToSelector())
      {
        unsigned int v125 = [v124 BOOLValue];
        if (!v123 && v125)
        {
          v126 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
          v127 = sub_10018A454(v126);

          v128 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v22 databaseID]);
          v129 = [v128 stringByAppendingPathExtension:SSDownloadMetadataKeyFileExtensionMoviePackage];

          uint64_t v130 = [v127 stringByAppendingPathComponent:v129];

          uint64_t v123 = v130;
          unsigned int v208 = 1;
          goto LABEL_192;
        }
        unsigned int v208 = v125;
        if (v123)
        {
LABEL_192:
          [(PrepareDownloadResponse *)v3 setDestinationPath:v123];
          v131 = [(SSMemoryEntity *)self->_download valueForProperty:@"has_hdr"];
          v202 = v131;
          if (objc_opt_respondsToSelector()) {
            id v132 = [v131 BOOLValue];
          }
          else {
            id v132 = 0;
          }
          v133 = [(SSMemoryEntity *)self->_download valueForProperty:@"has_4k"];
          v201 = v133;
          if (objc_opt_respondsToSelector()) {
            id v134 = [v133 BOOLValue];
          }
          else {
            id v134 = 0;
          }
          [(PrepareDownloadResponse *)v3 setHasHDR:v132];
          [(PrepareDownloadResponse *)v3 setHas4K:v134];
          id v135 = [(PrepareDownloadOperation *)self _newURLRequestWithAsset:v22];
          v203 = (void *)v123;
          id v210 = v135;
          if (!v135)
          {
LABEL_253:
            [(PrepareDownloadResponse *)v3 setHLS:v208];
            [(PrepareDownloadResponse *)v3 setRequiresDownloadHandler:v135 == 0];
            [(PrepareDownloadResponse *)v3 setURLRequest:v135];
            v159 = [(PrepareDownloadResponse *)v3 dataConsumer];
            unsigned int v160 = [(PrepareDownloadOperation *)self _shouldFailForDiskSpaceWithAsset:v22 dataConsumer:v159];

            if (v160)
            {
              v161 = +[SSLogConfig sharedDaemonConfig];
              if (!v161)
              {
                v161 = +[SSLogConfig sharedConfig];
              }
              unsigned int v162 = [v161 shouldLog];
              if ([v161 shouldLogToDisk]) {
                int v163 = v162 | 2;
              }
              else {
                int v163 = v162;
              }
              v164 = [v161 OSLogObject];
              if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT)) {
                int v165 = v163;
              }
              else {
                int v165 = v163 & 2;
              }
              if (v165)
              {
                id v166 = (id)objc_opt_class();
                int v222 = 138412546;
                id v223 = v166;
                __int16 v224 = 2048;
                id v225 = v214;
                LODWORD(v200) = 22;
                v198 = &v222;
                v167 = (void *)_os_log_send_and_compose_impl();

                id v135 = v210;
                p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
                if (!v167)
                {
LABEL_307:

                  v195 = SSError();
                  [(PrepareDownloadResponse *)v3 setError:v195];

                  [(PrepareDownloadResponse *)v3 setResult:2];
                  v196 = [(PrepareDownloadResponse *)v3 dataConsumer];
                  v177 = v196;
                  if (v196)
                  {
                    [v196 suspend];
                    [(PrepareDownloadResponse *)v3 setDataConsumer:0];
                  }
                  v49 = v203;
                  v188 = v205;
LABEL_310:

                  goto LABEL_90;
                }
                v164 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v167, 4, &v222, v200);
                free(v167);
                v198 = (int *)v164;
                SSFileLog();
              }
              else
              {
                p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
              }

              goto LABEL_307;
            }
            v168 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_restore"];
            unsigned int v169 = [v168 BOOLValue];

            if (v169)
            {
              [(PrepareDownloadResponse *)v3 setRestore:1];
              -[PrepareDownloadResponse setCellularAllowed:](v3, "setCellularAllowed:", [v135 allowsCellularAccess]);
              if ((SSDownloadKindIsPodcastKind() & v169) == 1)
              {
                [(PrepareDownloadResponse *)v3 setInfersDiscretionary:1];
                [(PrepareDownloadResponse *)v3 setClientIdentifier:@"com.apple.podcasts"];
                v170 = +[SSLogConfig sharedDaemonConfig];
                if (!v170)
                {
                  v170 = +[SSLogConfig sharedConfig];
                }
                unsigned int v171 = [v170 shouldLog];
                if ([v170 shouldLogToDisk]) {
                  v171 |= 2u;
                }
                v172 = [v170 OSLogObject];
                if (!os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT)) {
                  v171 &= 2u;
                }
                if (v171)
                {
                  id v173 = (id)objc_opt_class();
                  int v222 = 138412546;
                  id v223 = v173;
                  __int16 v224 = 2048;
                  id v225 = v214;
                  LODWORD(v200) = 22;
                  v198 = &v222;
                  v174 = (void *)_os_log_send_and_compose_impl();

                  if (!v174)
                  {
LABEL_279:

                    [(PrepareDownloadResponse *)v3 setRequiresPowerPluggedIn:[(PrepareDownloadOperation *)self _requiresPoweredPluggedIn]];
                    [(PrepareDownloadOperation *)self _transferProgressFractionWithAsset:v22];
                    -[PrepareDownloadResponse setTransferProgressFraction:](v3, "setTransferProgressFraction:");
                    v176 = [(SSMemoryEntity *)self->_download valueForProperty:@"rate_limit"];
                    v177 = v176;
                    if (v176) {
                      -[PrepareDownloadResponse setBytesPerSecondLimit:](v3, "setBytesPerSecondLimit:", [v176 integerValue]);
                    }
                    v213 = v22;
                    v178 = [(SSMemoryEntity *)self->_download valueForProperty:@"resource_timeout_interval", v198];
                    v179 = v178;
                    if (v178)
                    {
                      [v178 doubleValue];
                      [(PrepareDownloadResponse *)v3 setTimeoutIntervalForResource:"setTimeoutIntervalForResource:"];
                    }
                    v209 = v5;
                    v180 = [(SSMemoryEntity *)self->_download valueForProperty:@"timeout_interval"];
                    v181 = v180;
                    if (v180)
                    {
                      [v180 doubleValue];
                      [(PrepareDownloadResponse *)v3 setTimeoutIntervalForRequest:"setTimeoutIntervalForRequest:"];
                    }
                    v182 = [(SSMemoryEntity *)self->_download valueForProperty:@"loading_priority"];
                    if (v182) {
                      [(PrepareDownloadResponse *)v3 setLoadingPriority:v182];
                    }
                    v183 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_automatic"];
                    id v184 = [v183 integerValue];

                    [(PrepareDownloadResponse *)v3 setAutomaticType:v184];
                    if (v184) {
                      char v185 = v169;
                    }
                    else {
                      char v185 = 1;
                    }
                    if ((v185 & 1) == 0)
                    {
                      [(PrepareDownloadResponse *)v3 setDiscretionary:1];
                      if (v184 == (id)2)
                      {
                        v186 = [(SSMemoryEntity *)self->_download valueForProperty:@"bundle_id"];
                        if (v186) {
                          [(PrepareDownloadResponse *)v3 setClientSecondaryIdentifier:v186];
                        }
                      }
                    }
                    -[PrepareDownloadResponse setTaskPriority:](v3, "setTaskPriority:", [(id)objc_opt_class() _URLSessionTaskPriorityForDownload:self->_download]);
                    if (v184 == (id)2) {
                      char v187 = 1;
                    }
                    else {
                      char v187 = v169;
                    }
                    v188 = v205;
                    if ((v187 & 1) == 0)
                    {
                      uint64_t v189 = [(SSMemoryEntity *)self->_download valueForProperty:@"thumbnail_url"];
                      v190 = (void *)v189;
                      if (v219 && v189 && SSDownloadKindIsSoftwareKind())
                      {
                        v215 = [[ApplicationHandle alloc] initWithDownloadHandle:v218 bundleIdentifier:v219];
                        id v191 = [objc_alloc((Class)NSURL) initWithString:v190];
                        v192 = v3;
                        v193 = [[LoadSoftwareThumbnailOperation alloc] initWithApplicationHandle:v215 thumbnailURL:v191];
                        v221 = v193;
                        v194 = +[NSArray arrayWithObjects:&v221 count:1];
                        [(PrepareDownloadResponse *)v192 setBackgroundOperations:v194];

                        id v3 = v192;
                        v188 = v205;
                      }
                    }

                    v5 = v209;
                    id v135 = v210;
                    v22 = v213;
                    p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
                    v49 = v203;
                    goto LABEL_310;
                  }
                  v172 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v174, 4, &v222, v200);
                  free(v174);
                  v198 = (int *)v172;
                  SSFileLog();
                }

                goto LABEL_279;
              }
            }
            else
            {
              SSDownloadKindIsPodcastKind();
            }
            v175 = [(PrepareDownloadOperation *)self _clientIdentifier];
            [(PrepareDownloadResponse *)v3 setClientIdentifier:v175];

            v170 = [v22 valueForProperty:@"is_discretionary"];
            -[PrepareDownloadResponse setDiscretionary:](v3, "setDiscretionary:", [v170 BOOLValue]);
            goto LABEL_279;
          }
          if (SSDownloadKindIsMediaKind())
          {
            v136 = [v22 valueForProperty:@"avfoundation_blocked"];
            if ([v136 BOOLValue])
            {
            }
            else
            {
              unsigned __int8 v145 = [(PrepareDownloadOperation *)self _isPodcastRestore];

              if ((v145 & 1) == 0)
              {
                id v152 = [(PrepareDownloadOperation *)self _newAVAssetDownloadSessionOptionsWithAsset:v22 URLRequest:v135];
                [(PrepareDownloadResponse *)v3 setAVAssetDownloadSessionOptions:v152];
                goto LABEL_252;
              }
            }
          }
          if (![(PrepareDownloadOperation *)self _isPodcastRestore])
          {
LABEL_239:
            id v152 = -[PrepareDownloadOperation _newDataConsumerWithAsset:destinationPath:](self, "_newDataConsumerWithAsset:destinationPath:", v22, v123, v198);
            if (![(id)objc_opt_class() _isDTServiceHubIssuedRequest:v135])
            {
LABEL_251:
              -[PrepareDownloadResponse setDataConsumer:](v3, "setDataConsumer:", v152, v199);
LABEL_252:

              goto LABEL_253;
            }
            v153 = +[SSLogConfig sharedDaemonConfig];
            if (!v153)
            {
              v153 = +[SSLogConfig sharedConfig];
            }
            unsigned int v154 = [v153 shouldLog];
            if ([v153 shouldLogToDisk]) {
              v154 |= 2u;
            }
            v155 = [v153 OSLogObject];
            if (!os_log_type_enabled(v155, OS_LOG_TYPE_INFO)) {
              v154 &= 2u;
            }
            if (v154)
            {
              v156 = v22;
              id v157 = (id)objc_opt_class();
              int v222 = 138412290;
              id v223 = v157;
              LODWORD(v200) = 12;
              v199 = &v222;
              v158 = (void *)_os_log_send_and_compose_impl();

              v22 = v156;
              if (!v158)
              {
LABEL_250:

                [v152 setOverrideProgress:1];
                id v135 = v210;
                goto LABEL_251;
              }
              v155 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v158, 4, &v222, v200);
              free(v158);
              v199 = (int *)v155;
              SSFileLog();
            }

            goto LABEL_250;
          }
          v146 = +[SSLogConfig sharedDaemonConfig];
          if (!v146)
          {
            v146 = +[SSLogConfig sharedConfig];
          }
          unsigned int v147 = [v146 shouldLog];
          if ([v146 shouldLogToDisk]) {
            v147 |= 2u;
          }
          v148 = [v146 OSLogObject];
          if (!os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT)) {
            v147 &= 2u;
          }
          if (v147)
          {
            id v149 = (id)objc_opt_class();
            id v150 = [v22 databaseID];
            int v222 = 138543874;
            id v223 = v149;
            __int16 v224 = 2048;
            id v225 = v214;
            __int16 v226 = 2048;
            id v227 = v150;
            LODWORD(v200) = 32;
            v198 = &v222;
            v151 = (void *)_os_log_send_and_compose_impl();

            if (!v151)
            {
LABEL_238:

              id v135 = v210;
              goto LABEL_239;
            }
            v148 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v151, 4, &v222, v200);
            free(v151);
            v198 = (int *)v148;
            SSFileLog();
          }

          goto LABEL_238;
        }
      }
      else
      {
        unsigned int v208 = 0;
        if (v123) {
          goto LABEL_192;
        }
      }
      uint64_t v123 = +[ScratchManager directoryPathForDownloadID:assetID:kind:createIfNeeded:](ScratchManager, "directoryPathForDownloadID:assetID:kind:createIfNeeded:", v214, [v22 databaseID], v5, 1);
      goto LABEL_192;
    }
    if (SSDownloadKindIsSoftwareKind())
    {
      uint64_t v95 = [(PrepareDownloadResponse *)v3 clientIdentifier];
      if (v95)
      {
        v96 = (void *)v95;
        v97 = [(PrepareDownloadResponse *)v3 clientIdentifier];
        if ([v97 isEqualToString:@"atc"])
        {
          unsigned int v98 = +[ApplicationWorkspace keepSafeHarborDataForBundleID:v219];

          if (v98)
          {
            v99 = +[SSLogConfig sharedDaemonConfig];
            if (!v99)
            {
              v99 = +[SSLogConfig sharedConfig];
            }
            unsigned int v100 = [v99 shouldLog];
            if ([v99 shouldLogToDisk]) {
              v100 |= 2u;
            }
            v101 = [v99 OSLogObject];
            if (!os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG)) {
              v100 &= 2u;
            }
            if (v100)
            {
              v102 = objc_opt_class();
              int v222 = 138412802;
              id v223 = v102;
              __int16 v224 = 2048;
              id v225 = v214;
              __int16 v226 = 2112;
              id v227 = v219;
              id v103 = v102;
              LODWORD(v200) = 32;
              v198 = &v222;
              v104 = (void *)_os_log_send_and_compose_impl();

              if (!v104) {
                goto LABEL_147;
              }
              v101 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v104, 4, &v222, v200);
              free(v104);
              v198 = (int *)v101;
              SSFileLog();
            }

LABEL_147:
            [(PrepareDownloadResponse *)v3 setIsPerDeviceVPP:1];
            v105 = +[NSNumber numberWithInteger:1];
            [(PrepareDownloadResponse *)v3 setDownloadRestoreState:v105];

            download = self->_download;
            v107 = +[NSNumber numberWithInteger:1];
            [(SSMemoryEntity *)download setValue:v107 forProperty:@"download_state.restore_state"];

            v81 = +[SSLogConfig sharedDaemonConfig];
            if (!v81)
            {
              v81 = +[SSLogConfig sharedConfig];
            }
            unsigned int v108 = objc_msgSend(v81, "shouldLog", v198);
            if ([v81 shouldLogToDisk]) {
              int v109 = v108 | 2;
            }
            else {
              int v109 = v108;
            }
            v84 = [v81 OSLogObject];
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
              int v110 = v109;
            }
            else {
              int v110 = v109 & 2;
            }
            if (!v110) {
              goto LABEL_181;
            }
            goto LABEL_156;
          }
        }
        else
        {
        }
      }
    }
    v58 = +[SSLogConfig sharedDaemonConfig];
    if (!v58)
    {
      v58 = +[SSLogConfig sharedConfig];
    }
    unsigned int v137 = [v58 shouldLog];
    if ([v58 shouldLogToDisk]) {
      int v138 = v137 | 2;
    }
    else {
      int v138 = v137;
    }
    v61 = [v58 OSLogObject];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
      int v139 = v138;
    }
    else {
      int v139 = v138 & 2;
    }
    if (v139) {
      goto LABEL_75;
    }
    goto LABEL_212;
  }
  [(PrepareDownloadResponse *)v3 setResult:4];
  v49 = +[SSLogConfig sharedDaemonConfig];
  if (!v49)
  {
    v49 = +[SSLogConfig sharedConfig];
  }
  unsigned int v50 = [v49 shouldLog];
  if ([v49 shouldLogToDisk]) {
    int v51 = v50 | 2;
  }
  else {
    int v51 = v50;
  }
  v52 = [v49 OSLogObject];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO)) {
    int v53 = v51;
  }
  else {
    int v53 = v51 & 2;
  }
  if (!v53)
  {
    p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
    goto LABEL_89;
  }
  v54 = objc_opt_class();
  int v222 = 138412546;
  id v223 = v54;
  __int16 v224 = 2048;
  id v225 = v214;
  id v55 = v54;
  LODWORD(v200) = 22;
  v198 = &v222;
  v56 = (void *)_os_log_send_and_compose_impl();

  p_vtable = (void **)(&OBJC_METACLASS___DownloadArtworkCacheOperation + 24);
  if (v56)
  {
    v52 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, &v222, v200);
    free(v56);
    v198 = (int *)v52;
    SSFileLog();
LABEL_89:
  }
LABEL_90:

LABEL_216:
  v140 = objc_msgSend(p_vtable + 182, "defaultWorkspace", v198);
  if ([v140 isMultiUser] && !-[PrepareDownloadResponse result](v3, "result"))
  {
    v141 = [p_vtable + 182 defaultWorkspace];
    unsigned int v142 = [v141 shouldModifyQuota:v5];

    if (!v142) {
      goto LABEL_221;
    }
    v140 = [p_vtable + 182 defaultWorkspace];
    [v140 suspendQuotas];
  }

LABEL_221:
  uint64_t v143 = [(PrepareDownloadOperation *)self outputBlock];
  v144 = (void *)v143;
  if (v143)
  {
    (*(void (**)(uint64_t, PrepareDownloadOperation *, PrepareDownloadResponse *))(v143 + 16))(v143, self, v3);
    [(PrepareDownloadOperation *)self setOutputBlock:0];
  }
}

- (int64_t)operation:(id)a3 dispositionForAuthenticationChallenge:(id)a4
{
  return 1;
}

- (void)operation:(id)a3 didReceiveResponse:(id)a4
{
}

+ (BOOL)_isDTServiceHubIssuedRequest:(id)a3
{
  id v3 = [a3 URL];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 host];
    unsigned __int8 v5 = [v4 isEqualToString:@"localhost"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (id)_mediaAssetsForDownloadIdentifier:(int64_t)a3 session:(id)a4
{
  id v5 = a4;
  id v21 = +[NSMutableArray array];
  id v6 = +[NSMutableArray array];
  v28[0] = @"avfoundation_blocked";
  v28[1] = @"bytes_total";
  v28[2] = @"download_token";
  v28[3] = @"dpinfo_data";
  v28[4] = @"uncompressed_size";
  v28[5] = @"hash_array";
  v28[6] = @"hash_type";
  v28[7] = @"body_data";
  v28[8] = @"http_headers";
  v28[9] = @"http_method";
  v28[10] = @"initial_odr_size";
  v28[11] = @"is_discretionary";
  v28[12] = @"is_downloaded";
  v28[13] = @"is_drm_free";
  v28[14] = @"is_external";
  v28[15] = @"is_hls";
  v28[16] = @"is_local_cache_server";
  v28[17] = @"is_zip_streamable";
  v28[18] = @"local_path";
  v28[19] = @"bytes_to_hash";
  v28[20] = @"sinfs_data";
  v28[21] = @"store_download_key";
  v28[22] = @"timeout_interval";
  v28[23] = @"asset_type";
  v28[24] = @"url";
  v28[25] = @"url_session_task_id";
  id v7 = [objc_alloc((Class)NSArray) initWithObjects:v28 count:26];
  id v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"download_id" equalToLongLong:a3];
  id v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(asset.blocked_reason, 0)" equalToLongLong:0];
  v27[0] = v8;
  v27[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v27 count:2];
  id v11 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  v22 = v5;
  id v12 = [v5 database];
  CFStringRef v26 = @"asset_order";
  id v13 = +[NSArray arrayWithObjects:&v26 count:1];
  id v14 = +[DownloadAssetEntity queryWithDatabase:v12 predicate:v11 orderingProperties:v13];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100151E88;
  v23[3] = &unk_1003A7E50;
  id v15 = v6;
  id v24 = v15;
  id v16 = v21;
  id v25 = v16;
  [v14 enumerateMemoryEntitiesWithProperties:v7 usingBlock:v23];
  if ([v16 count]) {
    objc_super v17 = v16;
  }
  else {
    objc_super v17 = v15;
  }
  id v18 = v17;

  for (uint64_t i = 25; i != -1; --i)

  return v18;
}

- (BOOL)_allowsCellularAccessForAsset:(id)a3
{
  id v4 = a3;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", kSSUserDefaultsIdentifier, 0);
  v74 = self;
  id v6 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_automatic"];
  id v7 = [v6 integerValue];

  if (v7) {
    BOOL v8 = AppBooleanValue == 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = &syslog_ptr;
  unsigned int v71 = v4;
  if (v8)
  {
    LOBYTE(v13) = 0;
    goto LABEL_82;
  }
  id v10 = [v4 valueForProperty:@"bytes_total"];
  id v75 = (char *)[v10 longLongValue];

  id v11 = [v4 valueForProperty:@"initial_odr_size"];
  if (objc_opt_respondsToSelector()) {
    id v75 = &v75[(void)[v11 unsignedLongLongValue]];
  }
  int v70 = v11;
  id v12 = [(SSDownloadPolicy *)v74->_policy policyRules];
  long long v82 = 0u;
  long long v83 = 0u;
  unsigned int v13 = [v12 count] == 0;
  long long v84 = 0u;
  long long v85 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v83;
    int v73 = (char *)SSDownloadSizeLimitDisabled;
    int v72 = (char *)SSDownloadSizeLimitNoLimit;
    int v76 = AppBooleanValue;
    while (2)
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v83 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        if ([v19 cellularDataStates] == (id)2)
        {
          if (!AppBooleanValue) {
            goto LABEL_41;
          }
          v13 |= AppBooleanValue != 0;
        }
        else if ([v19 isCellularAllowed])
        {
          id v20 = v14;
          id v21 = [v19 userDefaultStates];
          id v77 = [v21 count];
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v22 = v21;
          id v23 = [v22 countByEnumeratingWithState:&v78 objects:v93 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v79;
            while (2)
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v79 != v25) {
                  objc_enumerationMutation(v22);
                }
                if ([*(id *)(*((void *)&v78 + 1) + 8 * (void)j) currentBoolValue])
                {

                  goto LABEL_27;
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v78 objects:v93 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

          if (v77)
          {
            id v14 = v20;
          }
          else
          {
LABEL_27:
            unsigned int v27 = (char *)[v19 downloadSizeLimit];
            id v14 = v20;
            if (v27 == v73)
            {

LABEL_41:
              LOBYTE(v13) = 0;
              goto LABEL_42;
            }
            BOOL v29 = v27 == v72 || (uint64_t)v75 <= (uint64_t)v27;
            v13 |= v29;
          }

          int AppBooleanValue = v76;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v82 objects:v94 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_42:

  v30 = [v71 valueForProperty:@"is_hls"];
  id v9 = &syslog_ptr;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v30 BOOLValue])
  {
    unsigned int v31 = [(SSMemoryEntity *)v74->_download valueForProperty:@"kind"];
    if (!SSDownloadKindIsVideosAppKind())
    {
LABEL_62:
      LOBYTE(v13) = 0;
      goto LABEL_63;
    }
    if ([v14 count])
    {
LABEL_63:

      int v40 = 0;
      goto LABEL_64;
    }
    v32 = +[SSLogConfig sharedDaemonConfig];
    if (!v32)
    {
      v32 = +[SSLogConfig sharedConfig];
    }
    unsigned int v33 = [v32 shouldLog];
    if ([v32 shouldLogToDisk]) {
      int v34 = v33 | 2;
    }
    else {
      int v34 = v33;
    }
    id v35 = [v32 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      int v36 = v34;
    }
    else {
      int v36 = v34 & 2;
    }
    if (v36)
    {
      LOWORD(v86[0]) = 0;
      LODWORD(v69) = 2;
      int v68 = v86;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37) {
        goto LABEL_58;
      }
      id v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, v86, v69);
      free(v37);
      int v68 = v35;
      SSFileLog();
    }

LABEL_58:
    if (CFPreferencesGetAppBooleanValue(@"CellularDataModeDownload", @"com.apple.videos-preferences", 0))
    {
      v38 = +[ISNetworkObserver sharedInstance];
      [v38 networkType];
      char IsCellularType = SSNetworkTypeIsCellularType();

      if (IsCellularType)
      {
        LOBYTE(v13) = 1;
      }
      else
      {
        v65 = (void *)CFPreferencesCopyAppValue(@"DownloadQualityWifi", @"com.apple.videos-preferences");
        unsigned int v66 = [v65 isEqualToString:@"BestQualityDownload"];
        unsigned int v67 = (void *)CFPreferencesCopyAppValue(@"DownloadQualityCellular", @"com.apple.videos-preferences");
        unsigned int v13 = [v67 isEqualToString:@"BestQualityDownload"] | v66 ^ 1;
      }
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  int v40 = 1;
LABEL_64:
  unsigned int v41 = [(SSMemoryEntity *)v74->_download valueForProperty:@"is_restore", v68];
  unsigned int v42 = [v41 BOOLValue];

  if (v42)
  {
    v43 = +[RestoreManager sharedInstance];
    unsigned int v44 = [v43 isCellularAllowed];
    v40 &= v44 ^ 1;
    LOBYTE(v13) = v44 | v13;
  }
  uint64_t v45 = [(SSDownloadPolicy *)v74->_policy downloadKind];
  unsigned int v46 = (void *)v45;
  if ((v13 & 1) != 0 && v40)
  {
    v47 = v70;
    if (v45)
    {
      v48 = +[SSURLBagContext contextWithBagType:[(SSDownloadPolicy *)v74->_policy URLBagType]];
      v49 = [(PrepareDownloadOperation *)v74 loadedURLBagWithContext:v48 returningError:0];
      unsigned int v50 = [v49 networkConstraintsForDownloadKind:v46];
      int v51 = v50;
      if (v50)
      {
        v52 = (char *)[v50 sizeLimitForNetworkType:1];
        LOBYTE(v13) = v52 != (char *)SSDownloadSizeLimitDisabled
                   && (v52 == (char *)SSDownloadSizeLimitNoLimit || (uint64_t)v75 <= (uint64_t)v52);
      }
      else
      {
        LOBYTE(v13) = 1;
      }
    }
  }
  else
  {
    v47 = v70;
  }

  id v4 = v71;
LABEL_82:
  v54 = [v9[405] sharedDaemonConfig];
  if (!v54)
  {
    v54 = [v9[405] sharedConfig];
  }
  unsigned int v55 = [v54 shouldLog];
  if ([v54 shouldLogToDisk]) {
    int v56 = v55 | 2;
  }
  else {
    int v56 = v55;
  }
  v57 = [v54 OSLogObject];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
    int v58 = v56;
  }
  else {
    int v58 = v56 & 2;
  }
  if (!v58) {
    goto LABEL_93;
  }
  id v59 = [v4 databaseID];
  int v60 = [v4 valueForProperty:@"bytes_total"];
  id v61 = [v60 longLongValue];
  id v62 = [(SSMemoryEntity *)v74->_download databaseID];
  v86[0] = 67109888;
  v86[1] = v13 & 1;
  __int16 v87 = 2048;
  id v88 = v59;
  __int16 v89 = 2048;
  id v90 = v61;
  __int16 v91 = 2048;
  id v92 = v62;
  LODWORD(v69) = 38;
  v63 = (void *)_os_log_send_and_compose_impl();

  id v4 = v71;
  if (v63)
  {
    v57 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v63, 4, v86, v69);
    free(v63);
    SSFileLog();
LABEL_93:
  }
  return v13 & 1;
}

- (BOOL)_isPodcastRestore
{
  id v3 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_restore"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return [(PrepareDownloadOperation *)self _isPodcast] & v4;
}

- (BOOL)_isPodcast
{
  v2 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
  char IsPodcastKind = SSDownloadKindIsPodcastKind();

  return IsPodcastKind;
}

- (BOOL)_assetNeedsDecryption:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 valueForProperty:@"is_drm_free"];
  if ([v4 BOOLValue])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 valueForProperty:@"dpinfo_data"];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (int64_t)_assetSizeFromURLResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = (char *)[v4 statusCode];
    if (v5 == (char *)206)
    {
      id v6 = [v4 allHeaderFields];
      id v7 = [v6 objectForKey:@"Content-Range"];

      if (!v7
        || (+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"/"), v8 = objc_claimAutoreleasedReturnValue(), id v9 = [v7 rangeOfCharacterFromSet:v8], v8, v9 == (id)0x7FFFFFFFFFFFFFFFLL)|| (v10 = (unint64_t)v9 + 1, v10 >= (unint64_t)objc_msgSend(v7, "length")))
      {
        int64_t v12 = -1;
      }
      else
      {
        id v11 = [v7 substringFromIndex:v10];
        int64_t v12 = (int64_t)[v11 longLongValue];
      }
    }
    else if ((unint64_t)(v5 - 200) > 0x63)
    {
      int64_t v12 = -1;
    }
    else
    {
      int64_t v12 = (int64_t)[v4 expectedContentLength];
    }
  }
  else
  {
    int64_t v12 = -1;
  }

  return v12;
}

- (id)_bestMediaAsset
{
  id v3 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_from_store"];
  unsigned int v4 = [v3 BOOLValue];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  BOOL v5 = self->_mediaAssets;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v6)
  {
    id v7 = v6;
    unsigned int v31 = v4;
    uint64_t v8 = *(void *)v34;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(v5);
      }
      unint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
      id v11 = [v10 valueForProperty:@"url"];
      if (v11)
      {
        id v12 = [objc_alloc((Class)NSURL) initWithString:v11];
        if (v12) {
          break;
        }
      }

      if (v7 == (id)++v9)
      {
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v47 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v14 = v12;
    id v15 = [v10 valueForProperty:@"is_local_cache_server"];
    unsigned int v16 = [v15 BOOLValue];

    uint64_t v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      uint64_t v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      v18 |= 2u;
    }
    id v19 = [v17 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      unsigned int v30 = v16;
      id v21 = objc_opt_class();
      id v29 = v21;
      id v22 = [v10 databaseID];
      id v23 = [(SSMemoryEntity *)self->_download databaseID];
      int v37 = 138413314;
      v38 = v21;
      unsigned int v16 = v30;
      __int16 v39 = 2048;
      id v40 = v22;
      __int16 v41 = 2048;
      id v42 = v23;
      __int16 v43 = 1024;
      unsigned int v44 = v30;
      __int16 v45 = 2112;
      unsigned int v46 = v14;
      LODWORD(v28) = 48;
      id v24 = (void *)_os_log_send_and_compose_impl();

      unsigned int v25 = v31;
      if (!v24)
      {
LABEL_23:

        if ((v25 & v16) == 1)
        {
          dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
          CFStringRef v26 = v32;
          ACSLocateCachingServer();
          dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
        }
        id v13 = v10;

        goto LABEL_26;
      }
      id v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v37, v28);
      free(v24);
      SSFileLog();
    }
    else
    {
      unsigned int v25 = v31;
    }

    goto LABEL_23;
  }
LABEL_10:
  id v13 = 0;
LABEL_26:

  return v13;
}

- (id)_clientIdentifier
{
  id v3 = [(SSMemoryEntity *)self->_download valueForProperty:@"application_id.bundle_id"];
  if (!v3)
  {
    unsigned int v4 = [(SSMemoryEntity *)self->_download valueForProperty:@"override_audit_token_data"];
    if ([v4 length] != (id)32)
    {
      uint64_t v5 = [(SSMemoryEntity *)self->_download valueForProperty:@"client.audit_token_data"];

      unsigned int v4 = (void *)v5;
    }
    if ([v4 length] == (id)32)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      [v4 getBytes:&v12 length:32];
      long long v10 = v12;
      long long v11 = v13;
      CPCopyBundleIdentifierAndTeamFromAuditToken();
    }
    id v3 = [(SSMemoryEntity *)self->_download valueForProperty:@"client_id", v10, v11];
    if (!v3)
    {
      id v6 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_automatic"];
      id v7 = [v6 integerValue];

      if (v7)
      {
        uint64_t v8 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
        if (SSDownloadKindIsSoftwareKind())
        {
          id v3 = @"com.apple.AppStore";
        }
        else if (SSDownloadKindIsMediaKind())
        {
          id v3 = @"com.apple.MobileStore";
        }
        else if (SSDownloadKindIsEBookKind())
        {
          id v3 = @"com.apple.iBooks";
        }
        else
        {
          id v3 = 0;
        }
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return v3;
}

- (BOOL)_itemIsInMediaLibrary
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v2 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_item_id"];
  if (v2)
  {
    id v3 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreItemID equalToValue:v2];
    unsigned int v4 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreFamilyAccountID equalToInt64:0];
    v17[0] = v3;
    v17[1] = v4;
    uint64_t v5 = +[NSArray arrayWithObjects:v17 count:2];
    id v6 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v5];

    id v7 = +[ML3MusicLibrary sharedLibrary];
    uint64_t v8 = +[ML3Track queryWithLibrary:v7 predicate:v6];

    uint64_t v9 = +[NSArray arrayWithObject:ML3TrackPropertyLocationFileName];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100153568;
    v12[3] = &unk_1003A3358;
    v12[4] = &v13;
    [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];
  }
  BOOL v10 = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (BOOL)_itemIsInSoftwareLibrary
{
  id v3 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_item_id"];
  unsigned int v4 = [(SSMemoryEntity *)self->_download valueForProperty:@"bundle_id"];
  if (v3)
  {
    id v6 = +[LSApplicationProxy applicationProxyForItemID:v3];
  }
  else
  {
    if (!v4)
    {
      LOBYTE(v8) = 0;
      goto LABEL_9;
    }
    id v6 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
  }
  id v7 = v6;
  if (v6) {
    unsigned int v8 = [v6 isPlaceholder] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

LABEL_9:

  return v8;
}

- (int64_t)_loadSizeIfNecessaryForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForProperty:@"bytes_total"];
  id v6 = [v5 longLongValue];

  if ((uint64_t)v6 > 0 || [(PrepareDownloadOperation *)self _isPodcast]) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = [(PrepareDownloadOperation *)self _loadSizeForAsset:v4 error:0];
  }

  return v7;
}

- (int64_t)_loadSizeForAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [v6 valueForProperty:@"url"];
  if (v7)
  {
    int v51 = a4;
    id v8 = objc_alloc((Class)SSMutableURLRequestProperties);
    uint64_t v9 = +[NSURL URLWithString:v7];
    id v10 = [v8 initWithURL:v9];

    [v10 setAllowedRetryCount:0];
    [v10 setCachePolicy:1];
    [v10 setTimeoutInterval:30.0];
    [v10 setHTTPMethod:@"HEAD"];
    uint64_t v11 = [v6 valueForProperty:@"http_headers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100153DDC;
        v53[3] = &unk_1003A3688;
        id v54 = v10;
        [v12 enumerateKeysAndObjectsUsingBlock:v53];
      }
    }
    v49 = (void *)v11;
    unsigned int v50 = v7;
    id v13 = objc_alloc_init((Class)ISURLOperation);
    [v13 setRequestProperties:v10];
    [v13 setDelegate:self];
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    uint64_t v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      v16 &= 2u;
    }
    if (v16)
    {
      unsigned int v18 = objc_opt_class();
      id v19 = v18;
      id v20 = [v6 databaseID];
      int v55 = 138412546;
      int v56 = v18;
      __int16 v57 = 2048;
      int64_t v58 = (int64_t)v20;
      LODWORD(v47) = 22;
      unsigned int v46 = &v55;
      id v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21) {
        goto LABEL_17;
      }
      uint64_t v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v55, v47);
      free(v21);
      unsigned int v46 = (int *)v17;
      SSFileLog();
    }

LABEL_17:
    id v52 = 0;
    unsigned int v22 = [(PrepareDownloadOperation *)self runSubOperation:v13 returningError:&v52];
    id v23 = v52;
    unsigned int v48 = v22;
    if (v22)
    {
      id v24 = [v13 response];
      int64_t v25 = (int64_t)[v24 expectedContentLength];

      if (v25 >= 1)
      {
        CFStringRef v26 = +[SSLogConfig sharedDaemonConfig];
        if (!v26)
        {
          CFStringRef v26 = +[SSLogConfig sharedConfig];
        }
        unsigned int v27 = objc_msgSend(v26, "shouldLog", v46);
        if ([v26 shouldLogToDisk]) {
          int v28 = v27 | 2;
        }
        else {
          int v28 = v27;
        }
        id v29 = [v26 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
          int v30 = v28;
        }
        else {
          int v30 = v28 & 2;
        }
        if (v30)
        {
          unsigned int v31 = objc_opt_class();
          id v32 = v31;
          id v33 = [v6 databaseID];
          int v55 = 138412802;
          int v56 = v31;
          __int16 v57 = 2048;
          int64_t v58 = v25;
          __int16 v59 = 2048;
          id v60 = v33;
          LODWORD(v47) = 32;
          long long v34 = (void *)_os_log_send_and_compose_impl();

          int64_t v7 = v50;
          if (!v34)
          {
LABEL_48:

            long long v36 = +[NSNumber numberWithLongLong:v25];
            [v6 setValue:v36 forProperty:@"bytes_total"];
LABEL_49:

            [v13 setDelegate:0];
            int v35 = v48 ^ 1;
            a4 = v51;
            if (!v51) {
              goto LABEL_52;
            }
            goto LABEL_50;
          }
          id v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v55, v47);
          free(v34);
          SSFileLog();
        }
        else
        {
          int64_t v7 = v50;
        }

        goto LABEL_48;
      }
    }
    else
    {
      int64_t v25 = -1;
    }
    long long v36 = +[SSLogConfig sharedDaemonConfig];
    if (!v36)
    {
      long long v36 = +[SSLogConfig sharedConfig];
    }
    unsigned int v37 = [v36 shouldLog];
    if ([v36 shouldLogToDisk]) {
      int v38 = v37 | 2;
    }
    else {
      int v38 = v37;
    }
    __int16 v39 = [v36 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
      int v40 = v38;
    }
    else {
      int v40 = v38 & 2;
    }
    if (v40)
    {
      __int16 v41 = objc_opt_class();
      id v42 = v41;
      id v43 = [v6 databaseID];
      int v55 = 138412802;
      int v56 = v41;
      __int16 v57 = 2048;
      int64_t v58 = (int64_t)v43;
      __int16 v59 = 2112;
      id v60 = v23;
      LODWORD(v47) = 32;
      unsigned int v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
        int64_t v7 = v50;
        goto LABEL_49;
      }
      __int16 v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v55, v47);
      free(v44);
      SSFileLog();
    }
    int64_t v7 = v50;

    goto LABEL_49;
  }
  id v23 = 0;
  int v35 = 1;
  int64_t v25 = -1;
  if (!a4) {
    goto LABEL_52;
  }
LABEL_50:
  if (v35) {
    *a4 = v23;
  }
LABEL_52:

  return v25;
}

- (id)_newAVAssetDownloadSessionOptionsWithAsset:(id)a3 URLRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:&off_1003C93A8 forKey:AVAssetDownloadSessionPriorityKey];
  uint64_t v9 = [(SSMemoryEntity *)self->_download valueForProperty:@"client_id"];
  if (v9) {
    [v8 setObject:v9 forKey:AVAssetDownloadSessionClientBundleIdentifierKey];
  }
  if ([(PrepareDownloadOperation *)self _sendsStoreHeadersForAsset:v6])
  {
    id v10 = [(PrepareDownloadOperation *)self _newAVContentInfoDictionary];
    [v8 setObject:v10 forKey:AVAssetDownloadSessioniTunesStoreContentInfoKey];
  }
  v65 = (void *)v9;
  if (([v7 allowsCellularAccess] & 1) == 0)
  {
    [v8 setObject:&off_1003C93C0 forKey:AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey];
    goto LABEL_37;
  }
  if (![(PrepareDownloadOperation *)self _isPodcast]) {
    goto LABEL_37;
  }
  id v63 = v7;
  uint64_t v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    uint64_t v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  id v14 = [v11 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    int v15 = v13;
  }
  else {
    int v15 = v13 & 2;
  }
  if (!v15) {
    goto LABEL_18;
  }
  id v16 = [(SSMemoryEntity *)self->_download databaseID];
  int v71 = 134217984;
  id v72 = v16;
  LODWORD(v58) = 12;
  __int16 v57 = &v71;
  uint64_t v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v71, v58);
    free(v17);
    __int16 v57 = (int *)v14;
    SSFileLog();
LABEL_18:
  }
  unsigned int v18 = +[SSURLBagContext contextWithBagType:[(SSDownloadPolicy *)self->_policy URLBagType]];
  id v19 = [(PrepareDownloadOperation *)self loadedURLBagWithContext:v18 returningError:0];
  id v20 = [(SSDownloadPolicy *)self->_policy downloadKind];
  id v21 = [v19 networkConstraintsForDownloadKind:v20];

  if (!v21) {
    goto LABEL_36;
  }
  id v22 = [v21 sizeLimitForNetworkType:1];
  if (v22 == (id)SSDownloadSizeLimitDisabled) {
    goto LABEL_36;
  }
  id v59 = v22;
  id v61 = v6;
  id v23 = +[SSLogConfig sharedDaemonConfig];
  if (!v23)
  {
    id v23 = +[SSLogConfig sharedConfig];
  }
  unsigned int v24 = objc_msgSend(v23, "shouldLog", v57);
  if ([v23 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  CFStringRef v26 = [v23 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    int v27 = v25;
  }
  else {
    int v27 = v25 & 2;
  }
  if (!v27)
  {
    id v29 = v59;
    goto LABEL_34;
  }
  id v28 = [(SSMemoryEntity *)self->_download databaseID];
  int v71 = 134218240;
  id v29 = v59;
  id v72 = v59;
  __int16 v73 = 2048;
  id v74 = v28;
  LODWORD(v58) = 22;
  __int16 v57 = &v71;
  int v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    CFStringRef v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v71, v58);
    free(v30);
    __int16 v57 = (int *)v26;
    SSFileLog();
LABEL_34:
  }
  unsigned int v31 = +[NSNumber numberWithLongLong:v29];
  [v8 setObject:v31 forKey:AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey];

  id v6 = v61;
LABEL_36:

  id v7 = v63;
LABEL_37:
  id v32 = objc_alloc_init((Class)NSMutableDictionary);
  id v33 = [v6 valueForProperty:@"hash_array"];
  long long v34 = [v6 valueForProperty:@"bytes_to_hash"];
  uint64_t v35 = (uint64_t)[v34 integerValue];

  if (v35 >= 1 && v33 != 0)
  {
    unsigned int v37 = +[NSPropertyListSerialization propertyListWithData:v33 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_55:

      goto LABEL_56;
    }
    id v62 = v6;
    id v64 = v7;
    id v60 = v8;
    id v38 = objc_alloc_init((Class)NSMutableArray);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v39 = v37;
    int v40 = (char *)[v39 countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v40)
    {
      __int16 v41 = v40;
      uint64_t v42 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v67 != v42) {
            objc_enumerationMutation(v39);
          }
          unsigned int v44 = (void *)ISCopyDigestFromString();
          [v38 addObject:v44];
        }
        __int16 v41 = (char *)[v39 countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v41);
    }

    if ([v38 count] == (id)1)
    {
      __int16 v45 = [v38 firstObject];
      unsigned int v46 = sub_10002A580();
      [v32 setObject:v45 forKey:v46];

      id v8 = v60;
      id v6 = v62;
      id v7 = v64;
    }
    else
    {
      id v8 = v60;
      id v6 = v62;
      id v7 = v64;
      if ((unint64_t)[v38 count] < 2)
      {
LABEL_54:

        goto LABEL_55;
      }
      uint64_t v47 = +[NSNumber numberWithInteger:v35];
      unsigned int v48 = sub_10002A590();
      [v32 setObject:v47 forKey:v48];

      __int16 v45 = sub_10002A570();
      [v32 setObject:v38 forKey:v45];
    }

    goto LABEL_54;
  }
LABEL_56:
  v49 = objc_msgSend(v6, "valueForProperty:", @"sinfs_data", v57);
  if (v49)
  {
    unsigned int v50 = +[NSPropertyListSerialization propertyListWithData:v49 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v51 = sub_10002A5E0();
      [v32 setObject:v50 forKey:v51];
    }
  }

  if ([v32 count]) {
    [v8 setObject:v32 forKey:AVAssetDownloadSessionPurchaseBundleKey];
  }
  id v52 = [v7 allHTTPHeaderFields];
  id v53 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v54 = kISCookieHeader;
  int v55 = [v52 objectForKey:kISCookieHeader];
  if (v55) {
    [v53 setObject:v55 forKey:v54];
  }

  if ([v53 count]) {
    [v8 setObject:v53 forKey:AVAssetDownloadSessionHTTPHeaderFieldsKey];
  }

  return v8;
}

- (id)_newAVContentInfoDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_saga_id"];
  if ([v4 longLongValue])
  {
    uint64_t v5 = AVAssetDownloadSessioniTunesStoreContentTypeKey;
    [v3 setObject:@"match" forKey:AVAssetDownloadSessioniTunesStoreContentTypeKey];
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v16 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_item_id"];

  uint64_t v5 = AVAssetDownloadSessioniTunesStoreContentTypeKey;
  [v3 setObject:@"purchaseHistory" forKey:AVAssetDownloadSessioniTunesStoreContentTypeKey];
  id v4 = (void *)v16;
  if (v16) {
LABEL_3:
  }
    [v3 setObject:v4 forKey:AVAssetDownloadSessioniTunesStoreContentIDKey];
LABEL_4:
  id v6 = [(SSMemoryEntity *)self->_download valueForProperty:@"airplay_content_type"];
  if (v6) {
    [v3 setObject:v6 forKey:v5];
  }
  id v7 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_account_id"];

  if (v7) {
    [v3 setObject:v7 forKey:AVAssetDownloadSessioniTunesStoreContentDSIDKey];
  }
  id v8 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_redownload_parameters"];

  if (v8) {
    [v3 setObject:v8 forKey:AVAssetDownloadSessioniTunesStoreContentDownloadParametersKey];
  }
  uint64_t v9 = [(SSMemoryEntity *)self->_download valueForProperty:@"client_id"];
  if (v9)
  {
    id v10 = +[SSDevice currentDevice];
    uint64_t v11 = [v10 userAgentWithBundleIdentifier:v9 version:@"1.0"];

    if (v11) {
      [v3 setObject:v11 forKey:AVAssetDownloadSessioniTunesStoreContentUserAgentKey];
    }
  }
  unsigned int v12 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
  int v13 = v12;
  if (v12)
  {
    id v14 = v12;
    if ([(__CFString *)v14 isEqualToString:SSDownloadKindMovie])
    {
      CFStringRef v15 = @"movie";
    }
    else if ([(__CFString *)v14 isEqualToString:SSDownloadKindMusic])
    {
      CFStringRef v15 = @"music";
    }
    else if ([(__CFString *)v14 isEqualToString:SSDownloadKindMusicVideo])
    {
      CFStringRef v15 = @"musicvideo";
    }
    else
    {
      if (![(__CFString *)v14 isEqualToString:SSDownloadKindTelevisionEpisode])
      {
LABEL_26:
        [v3 setObject:v14 forKey:AVAssetDownloadSessioniTunesStoreContentPurchasedMediaKindKey];

        goto LABEL_27;
      }
      CFStringRef v15 = @"tvshow";
    }

    id v14 = (__CFString *)v15;
    goto LABEL_26;
  }
LABEL_27:

  return v3;
}

- (id)_newDataConsumerWithAsset:(id)a3 destinationPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 valueForProperty:@"bytes_to_hash"];
  uint64_t v9 = (uint64_t)[v8 integerValue];

  if (v9 < 1)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v10 = [v6 valueForProperty:@"hash_array"];
    if (v10)
    {
      uint64_t v11 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:0];
    }
    else
    {
      uint64_t v11 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v11 count])
    {

      uint64_t v9 = 0;
      uint64_t v11 = 0;
    }
  }
  if ([(PrepareDownloadOperation *)self _usesStreamingZipDataConsumerForAsset:v6])
  {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    if (v11)
    {
      int v13 = ISWeakLinkedStringConstantForString();
      id v14 = [v6 valueForProperty:@"hash_type"];
      id v15 = [v14 integerValue];

      if ((unint64_t)v15 <= 1)
      {
        uint64_t v17 = ISWeakLinkedStringConstantForString();
        [v12 setObject:v17 forKey:v13];
      }
      unsigned int v18 = ISWeakLinkedStringConstantForString();

      [v12 setObject:v11 forKey:v18];
      id v19 = ISWeakLinkedStringConstantForString();

      id v20 = +[NSNumber numberWithInteger:v9];
      [v12 setObject:v20 forKey:v19];

      id v21 = ISWeakLinkedStringConstantForString();

      [v12 setObject:&__kCFBooleanTrue forKey:v21];
    }
    uint64_t v16 = [[StreamingZipDownloadDataConsumer alloc] initWithPath:v7 options:v12];
  }
  else
  {
    uint64_t v16 = [[FilesystemDownloadDataConsumer alloc] initWithPath:v7 MD5Hashes:v11 numberOfBytesToHash:v9];
  }

  return v16;
}

- (id)_newURLRequestWithAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForProperty:@"url"];
  if (!v5)
  {
    id v7 = 0;
    goto LABEL_36;
  }
  id v6 = [objc_alloc((Class)NSURL) initWithString:v5];
  id v7 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v6];
  [v7 setCachePolicy:1];
  BOOL v8 = [(PrepareDownloadOperation *)self _allowsCellularAccessForAsset:v4];
  [v7 setAllowsCellularAccess:v8];
  uint64_t v9 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_restore"];
  unsigned int v10 = [v9 BOOLValue];

  if (v8 && v10) {
    [v7 setAllowsExpensiveNetworkAccess:0];
  }
  uint64_t v11 = [v4 valueForProperty:@"timeout_interval"];
  id v12 = v11;
  if (v11)
  {
    [v11 doubleValue];
    objc_msgSend(v7, "setTimeoutInterval:");
  }
  if ([(PrepareDownloadOperation *)self _isPodcastRestore])
  {
    int v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13)
    {
      int v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    uint64_t v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v17;
      int v35 = 138412802;
      long long v36 = v17;
      __int16 v37 = 1024;
      int v38 = 172800;
      __int16 v39 = 2048;
      id v40 = [v4 databaseID];
      LODWORD(v32) = 28;
      unsigned int v31 = &v35;
      id v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_19:

        [v7 setTimeoutInterval:172800.0];
        goto LABEL_20;
      }
      uint64_t v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v35, v32);
      free(v19);
      unsigned int v31 = (int *)v16;
      SSFileLog();
    }

    goto LABEL_19;
  }
LABEL_20:
  id v20 = objc_msgSend(v4, "valueForProperty:", @"body_data", v31);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setHTTPBody:v20];
  }
  id v21 = [v4 valueForProperty:@"http_headers"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = +[NSPropertyListSerialization propertyListWithData:v21 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100155068;
      v33[3] = &unk_1003A3688;
      id v34 = v7;
      [v22 enumerateKeysAndObjectsUsingBlock:v33];
    }
  }
  id v23 = [v4 valueForProperty:@"http_method"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setHTTPMethod:v23];
  }
  uint64_t v24 = SSHTTPHeaderUserAgent;
  int v25 = [v7 valueForHTTPHeaderField:SSHTTPHeaderUserAgent];

  if (!v25)
  {
    CFStringRef v26 = +[SSDevice currentDevice];
    int v27 = [v26 userAgent];

    if (v27) {
      [v7 setValue:v27 forHTTPHeaderField:v24];
    }
  }
  id v28 = [v4 valueForProperty:@"is_local_cache_server"];
  unsigned int v29 = [v28 BOOLValue];

  if (v29) {
    [v7 _setRequiresShortConnectionTimeout:1];
  }

LABEL_36:
  return v7;
}

- (void)_recordCoreAnalyticsEventForClient:(id)a3 downloadKind:(id)a4 url:(id)a5
{
  BOOL v8 = (__CFString *)a3;
  uint64_t v9 = (__CFString *)a4;
  unsigned int v10 = (__CFString *)a5;
  if (+[SSDevice deviceIsInternalBuild])
  {
    uint64_t v11 = @"No Client";
    if (v8) {
      uint64_t v11 = v8;
    }
    id v12 = v11;
    int v13 = @"No Download Kind";
    if (v9) {
      int v13 = v9;
    }
    unsigned int v14 = v13;
    int v15 = @"No Download URL";
    if (v10) {
      int v15 = v10;
    }
    uint64_t v16 = v15;
    uint64_t v17 = [(SSMemoryEntity *)self->_download valueForProperty:SSDownloadPropertyIsInStoreQueue];
    [v17 BOOLValue];

    id v21 = v12;
    id v22 = v14;
    id v18 = v16;
    id v19 = v14;
    id v20 = v12;
    AnalyticsSendEventLazy();
  }
}

- (BOOL)_requiresPoweredPluggedIn
{
  v2 = [(SSDownloadPolicy *)self->_policy policyRules];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) powerStates] == (id)2) {
          ++v4;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
    LOBYTE(v3) = v4 >= 1 && v4 == (void)[v2 count];
  }

  return (char)v3;
}

- (BOOL)_sendsStoreHeadersForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_from_store"];
  if ([v5 BOOLValue])
  {
    id v6 = [v4 valueForProperty:@"is_external"];
    unsigned int v7 = [v6 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_shouldCancelAsDuplicate
{
  id v3 = [(SSMemoryEntity *)self->_download valueForProperty:@"cancel_if_duplicate"];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
    if (SSDownloadKindIsMediaKind())
    {
      unsigned __int8 v6 = [(PrepareDownloadOperation *)self _itemIsInMediaLibrary];
    }
    else
    {
      if (!SSDownloadKindIsSoftwareKind())
      {
        BOOL v7 = 0;
        goto LABEL_9;
      }
      unsigned __int8 v6 = [(PrepareDownloadOperation *)self _itemIsInSoftwareLibrary];
    }
    BOOL v7 = v6;
LABEL_9:

    return v7;
  }
  return 0;
}

- (BOOL)_shouldCancelAutomaticDownload
{
  if (SSDeviceSupportsDownload())
  {
    id v3 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
    if (!SSDownloadKindIsSoftwareKind()
      || ([(SSMemoryEntity *)self->_download valueForProperty:@"is_restore"],
          unsigned int v4 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v5 = [v4 BOOLValue],
          v4,
          (v5 & 1) == 0))
    {
      unsigned __int8 v6 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_automatic"];
      id v7 = [v6 integerValue];

      if (v7 == (id)1)
      {
        long long v8 = +[StoreDownloadQueue sharedDownloadQueue];
        long long v9 = [v8 automaticDownloadKinds];
        unsigned int v10 = [v9 containsObject:v3];

        if (!v10)
        {
          LOBYTE(v12) = 1;
LABEL_18:

          return (char)v12;
        }
        if (SSDownloadKindIsSoftwareKind())
        {
          long long v11 = [(id)ISWeakLinkedClassForString() sharedConnection];
          if ([v11 isAppInstallationAllowed]) {
            LODWORD(v12) = [v11 isAutomaticAppDownloadsAllowed] ^ 1;
          }
          else {
            LOBYTE(v12) = 1;
          }
          goto LABEL_16;
        }
        if (SSDownloadKindIsMediaKind() || SSDownloadKindIsEBookKind())
        {
          id v12 = (void *)ISWeakLinkedClassForString();
          long long v11 = ISWeakLinkedStringConstantForString();
          int v13 = [v12 sharedConnection];
          LOBYTE(v12) = [v13 effectiveBoolValueForSetting:v11] == 2;

LABEL_16:
          goto LABEL_18;
        }
      }
    }
    LOBYTE(v12) = 0;
    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
  return (char)v12;
}

- (BOOL)_shouldFailForFinishedDownload
{
  v2 = [(SSMemoryEntity *)self->_download valueForProperty:@"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")"];
  char IsFinishedPhase = SSDownloadPhaseIsFinishedPhase();

  return IsFinishedPhase;
}

- (BOOL)_shouldFailForDiskSpaceWithAsset:(id)a3 dataConsumer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v69 = 0;
  int v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  id v7 = [v5 valueForProperty:@"uncompressed_size"];
  if (objc_opt_respondsToSelector()) {
    long long v8 = (char *)[v7 unsignedLongLongValue];
  }
  else {
    long long v8 = 0;
  }
  id v63 = [v5 valueForProperty:@"bytes_total"];
  id v62 = v6;

  if (objc_opt_respondsToSelector())
  {
    long long v9 = (char *)[v63 unsignedLongLongValue];
    if (v9 > v8) {
      long long v8 = v9;
    }
  }
  unsigned int v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10)
  {
    unsigned int v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  unsigned int v12 = [v10 shouldLogToDisk];
  int v13 = [v10 OSLogObject];
  unsigned int v14 = v13;
  if (v12) {
    v11 |= 2u;
  }
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v15 = objc_opt_class();
    int v73 = 138412546;
    id v74 = v15;
    __int16 v75 = 2048;
    int v76 = v8;
    id v16 = v15;
    LODWORD(v61) = 22;
    id v59 = &v73;
    uint64_t v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_17;
    }
    unsigned int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v73, v61);
    free(v17);
    id v59 = (int *)v14;
    SSFileLog();
  }

LABEL_17:
  if (!v62) {
    goto LABEL_32;
  }
  id v18 = (char *)[v62 diskUsage];
  id v19 = v18;
  if (v18 <= v8) {
    unint64_t v20 = (unint64_t)v18;
  }
  else {
    unint64_t v20 = 0;
  }
  id v21 = +[SSLogConfig sharedDaemonConfig];
  if (!v21)
  {
    id v21 = +[SSLogConfig sharedConfig];
  }
  unsigned int v22 = [v21 shouldLog];
  unsigned int v23 = [v21 shouldLogToDisk];
  uint64_t v24 = [v21 OSLogObject];
  int v25 = v24;
  if (v23) {
    v22 |= 2u;
  }
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    v22 &= 2u;
  }
  if (!v22) {
    goto LABEL_30;
  }
  CFStringRef v26 = objc_opt_class();
  int v73 = 138412546;
  id v74 = v26;
  __int16 v75 = 2048;
  int v76 = v19;
  id v27 = v26;
  LODWORD(v61) = 22;
  id v59 = &v73;
  id v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v73, v61);
    free(v28);
    id v59 = (int *)v25;
    SSFileLog();
LABEL_30:
  }
  v8 -= v20;
LABEL_32:
  unsigned int v29 = objc_msgSend(v5, "valueForProperty:", @"initial_odr_size", v59);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_44;
  }
  id v30 = [v29 unsignedLongLongValue];
  unsigned int v31 = +[SSLogConfig sharedDaemonConfig];
  if (!v31)
  {
    unsigned int v31 = +[SSLogConfig sharedConfig];
  }
  unsigned int v32 = [v31 shouldLog];
  unsigned int v33 = [v31 shouldLogToDisk];
  id v34 = [v31 OSLogObject];
  int v35 = v34;
  if (v33) {
    v32 |= 2u;
  }
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    v32 &= 2u;
  }
  if (!v32) {
    goto LABEL_42;
  }
  long long v36 = objc_opt_class();
  int v73 = 138412546;
  id v74 = v36;
  __int16 v75 = 2048;
  int v76 = (char *)v30;
  id v37 = v36;
  LODWORD(v61) = 22;
  id v60 = &v73;
  int v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    int v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v73, v61);
    free(v38);
    id v60 = (int *)v35;
    SSFileLog();
LABEL_42:
  }
  long long v8 = &v8[(void)v30];
LABEL_44:
  __int16 v39 = objc_msgSend(v5, "valueForProperty:", @"local_path", v60);
  if (!v39)
  {
    id v40 = [v5 valueForProperty:@"is_hls"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v40 BOOLValue])
    {
      __int16 v41 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
      uint64_t v42 = sub_10018A454(v41);

      id v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v5 databaseID]);
      unsigned int v44 = [v43 stringByAppendingPathExtension:SSDownloadMetadataKeyFileExtensionMoviePackage];

      __int16 v39 = [v42 stringByAppendingPathComponent:v44];
    }
    else
    {
      id v45 = [(SSMemoryEntity *)self->_download databaseID];
      id v46 = [v5 databaseID];
      uint64_t v42 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
      __int16 v39 = +[ScratchManager directoryPathForDownloadID:v45 assetID:v46 kind:v42 createIfNeeded:1];
    }
  }
  if (v8 && v39)
  {
    uint64_t v47 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
    if (((SSDownloadKindIsSoftwareKind() & 1) != 0 || SSDownloadKindIsVideosAppKind())
      && ([(SSMemoryEntity *)self->_download valueForProperty:@"is_restore"],
          unsigned int v48 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v49 = [v48 BOOLValue],
          v48,
          (v49 & 1) == 0))
    {
      id v51 = objc_alloc((Class)NSDictionary);
      id v52 = +[NSNumber numberWithInteger:1];
      id v50 = objc_msgSend(v51, "initWithObjectsAndKeys:", v52, kCPFreeSpaceEffortLevelKey, 0);
    }
    else
    {
      id v50 = 0;
    }
    id v53 = +[NSURL fileURLWithPath:v39];
    dispatch_semaphore_t v54 = dispatch_semaphore_create(0);
    int v55 = +[ISDevice sharedInstance];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100156088;
    v65[3] = &unk_1003A7EC8;
    long long v68 = &v69;
    v65[4] = self;
    id v66 = v5;
    int v56 = v54;
    long long v67 = v56;
    [v55 requestFreeSpace:v8 atPath:v53 withOptions:v50 completionBlock:v65];

    dispatch_semaphore_wait(v56, 0xFFFFFFFFFFFFFFFFLL);
  }
  BOOL v57 = *((unsigned char *)v70 + 24) != 0;

  _Block_object_dispose(&v69, 8);
  return v57;
}

- (double)_transferProgressFractionWithAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
  if (SSDownloadKindIsMediaKind())
  {
    BOOL v6 = ![(PrepareDownloadOperation *)self _assetNeedsDecryption:v4];
    double v7 = 0.8;
    goto LABEL_7;
  }
  if (!SSDownloadKindIsEBookKind())
  {
    BOOL v6 = [v5 isEqualToString:SSDownloadKindInAppContent] == 0;
    double v7 = 0.6;
LABEL_7:
    if (v6) {
      double v8 = 1.0;
    }
    else {
      double v8 = v7;
    }
    goto LABEL_10;
  }
  if ([(PrepareDownloadOperation *)self _assetNeedsDecryption:v4])
  {
    double v8 = 0.6;
  }
  else
  {
    id v19 = [v4 valueForProperty:@"is_zip_streamable"];
    unsigned int v20 = [v19 BOOLValue];

    if (v20) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.8;
    }
  }
LABEL_10:
  long long v9 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_restore"];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    unsigned int v11 = [v4 valueForProperty:@"bytes_total"];
    [v11 doubleValue];
    double v13 = v12;

    unsigned int v14 = [(SSMemoryEntity *)self->_download valueForProperty:@"IFNULL(download_state.restore_data_size, 0)"];
    [v14 doubleValue];
    double v16 = v15;

    if (v16 > 2.22044605e-16 && v13 > 2.22044605e-16) {
      double v8 = v8 * (v13 / v16);
    }
  }

  return v8;
}

+ (int64_t)_URLSessionTaskPriorityForDownload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForProperty:@"is_restore"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = -2;
  }
  else
  {
    double v8 = [v4 valueForProperty:@"is_automatic"];
    id v9 = [v8 integerValue];

    if (v9)
    {
      uint64_t v7 = -1;
    }
    else
    {
      uint64_t v10 = [v4 valueForProperty:@"priority"];
      unsigned int v11 = (void *)v10;
      double v12 = &off_1003C93D8;
      if (v10) {
        double v12 = (_UNKNOWN **)v10;
      }
      double v13 = v12;

      uint64_t v7 = (uint64_t)[v13 integerValue];
    }
  }
  id v14 = [a1 _URLSessionTaskPriorityForDownloadPriority:v7];

  return (int64_t)v14;
}

+ (int64_t)_URLSessionTaskPriorityForDownloadPriority:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) >= 4) {
    return 400;
  }
  else {
    return -100 * (a3 + 2) + 500;
  }
}

- (BOOL)_usesStreamingZipDataConsumerForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForProperty:@"is_zip_streamable"];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else
  {
    double v8 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_from_store"];
    unsigned int v7 = [v8 BOOLValue];

    if (v7)
    {
      id v9 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
      LOBYTE(v7) = (SSDownloadKindIsSoftwareKind() & 1) != 0 || SSDownloadKindIsEBookKind();
    }
  }
  char v10 = v7 & ~[(PrepareDownloadOperation *)self _assetNeedsDecryption:v4];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_mediaAssets, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

@end