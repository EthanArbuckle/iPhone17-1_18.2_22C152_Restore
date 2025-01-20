@interface MSDContentFilesDownloadOperation
- (BOOL)_downloadCreationList;
- (id)methodSelectors;
- (int64_t)type;
- (void)_downloadContentFile:(id)a3 ofHash:(id)a4 toPath:(id)a5 completionHandler:(id)a6;
@end

@implementation MSDContentFilesDownloadOperation

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_downloadCreationList"];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)_downloadCreationList
{
  v52 = +[MSDContentCacheManager sharedInstance];
  id v58 = objc_alloc_init((Class)NSCondition);
  v2 = [(MSDOperation *)self context];
  v3 = [v2 creationList];
  id v4 = [v3 mutableCopy];

  id v51 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v50 = +[MSDOperationContext downloadOnly];
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  uint64_t v88 = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  char v84 = 1;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = sub_1000B8DD4;
  v79 = sub_1000B8DE4;
  id v80 = +[NSMutableDictionary dictionary];
  if (!os_variant_has_internal_content()) {
    goto LABEL_6;
  }
  v5 = +[MSDTestPreferences sharedInstance];
  id v6 = [v5 concurrentSession];

  v7 = +[MSDTestPreferences sharedInstance];
  id v8 = [v7 concurrentDownloadRequest];

  uint64_t v56 = (void)v8 * (void)v6;
  if ((uint64_t)((void)v8 * (void)v6) >= 1)
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v90 = v56;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Override default value for concurrent download request: %ld", buf, 0xCu);
    }
  }
  else
  {
LABEL_6:
    uint64_t v56 = 3;
  }
  v10 = [(MSDOperation *)self context];
  v11 = [v10 cloneFailedList];
  [v4 addObjectsFromArray:v11];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  id obj = v4;
  id v12 = [obj countByEnumeratingWithState:&v71 objects:v93 count:16];
  if (v12)
  {
    v48 = v92;
    v49 = v61;
    uint64_t v54 = *(void *)v72;
LABEL_9:
    uint64_t v13 = 0;
    id v55 = v12;
    while (1)
    {
      if (*(void *)v72 != v54) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v71 + 1) + 8 * v13);
      unsigned __int8 v16 = [(MSDOperation *)self canPassCheckpoint];
      if ((v16 & 1) == 0) {
        goto LABEL_43;
      }
      v17 = [(MSDOperation *)self context];
      v18 = [v17 masterManifest];
      v19 = [v18 metadataForFile:v14];

      if (!v19) {
        break;
      }
      v20 = [v19 getFileType];
      unsigned int v21 = [v20 isEqualToString:NSFileTypeRegular];

      if (v21 && [v19 getFileSize])
      {
        v22 = [v19 getHash];
        id v23 = [v22 hexStringRepresentation];

        v24 = [v52 findFileInCache:v23];

        if (v24)
        {
          v25 = sub_1000687C8();
          os_signpost_id_t v26 = [(MSDOperation *)self signpostId];
          if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v90 = (uint64_t)v23;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, v26, "File Cache Hit", "File cache hit: %{xcode:string}@", buf, 0xCu);
          }
        }
        else if (([v51 containsObject:v23] & 1) == 0)
        {
          [v51 addObject:v23];
          v30 = [(MSDOperation *)self context];
          v31 = [v30 contentRootPath];
          v27 = [v31 stringByAppendingPathComponent:v14];

          v32 = [v52 fileCachePathFromSourcePath:v27 forBackgroundDownload:v50];
          id v28 = [v32 stringByAppendingPathComponent:v23];

          [v58 lock];
          while (1)
          {
            uint64_t v33 = v86[3];
            if (v33 < v56) {
              break;
            }
            [v58 wait];
          }
          if (*((unsigned char *)v82 + 24))
          {
            v86[3] = v33 + 1;
            [v58 unlock];
            v34 = sub_1000687C8();
            os_signpost_id_t v35 = [(MSDOperation *)self signpostId];
            if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = (uint64_t)v23;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, v35, "Download File", "File download hash: %{xcode:string}@", buf, 0xCu);
            }

            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v61[0] = sub_1000B8DEC;
            v61[1] = &unk_1001540D0;
            v61[2] = self;
            unsigned __int8 v70 = v16;
            id v62 = v52;
            id v23 = v23;
            v67 = &v75;
            id v63 = v23;
            uint64_t v64 = v14;
            id v28 = v28;
            id v65 = v28;
            v68 = &v81;
            id v66 = v58;
            v69 = &v85;
            [(MSDContentFilesDownloadOperation *)self _downloadContentFile:v14 ofHash:v23 toPath:v28 completionHandler:v60];

            int v29 = 0;
          }
          else
          {
            v36 = sub_100068600();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Aborting file download due to previous error.", buf, 2u);
            }

            [v58 unlock];
            int v29 = 2;
          }
          goto LABEL_25;
        }
        v27 = 0;
        id v28 = 0;
      }
      else
      {
        v27 = 0;
        id v28 = 0;
        id v23 = 0;
      }
      int v29 = 3;
LABEL_25:

      if (v29 != 3 && v29)
      {

        if (v29 == 6) {
          goto LABEL_58;
        }
        goto LABEL_47;
      }
      if ((id)++v13 == v55)
      {
        id v12 = [obj countByEnumeratingWithState:&v71 objects:v93 count:16];
        if (v12) {
          goto LABEL_9;
        }
        goto LABEL_45;
      }
    }
    v37 = sub_100068600();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1000DD3A0(v91, v92, v37);
    }

LABEL_43:
    v19 = 0;
    v27 = 0;
    id v28 = 0;
    id v23 = 0;
    int v29 = 6;
    goto LABEL_25;
  }
LABEL_45:

LABEL_47:
  [v58 lock:v48, v49];
  while (v86[3] >= 1)
    [v58 wait];
  [v58 unlock];
  if (*((unsigned char *)v82 + 24))
  {
    if (os_variant_has_internal_content())
    {
      if (+[NSPropertyListSerialization propertyList:v76[5] isValidForFormat:100])
      {
        v38 = (void *)v76[5];
        v39 = +[NSURL fileURLWithPath:@"/tmp/DownloadedFileList.plist"];
        id v59 = 0;
        unsigned __int8 v40 = [v38 writeToURL:v39 error:&v59];
        v41 = v59;

        if ((v40 & 1) == 0)
        {
          v42 = sub_100068600();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = [v41 localizedDescription];
            sub_1000DD2F0(v43, buf, v42);
          }
        }
      }
      else
      {
        v41 = sub_100068600();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          sub_1000DD35C(v41);
        }
      }
      char v44 = 1;
      goto LABEL_63;
    }
    char v44 = 1;
  }
  else
  {
LABEL_58:
    -[MSDOperation setRetryable:](self, "setRetryable:", 1, v48);
    v45 = [(MSDOperation *)self error];
    BOOL v46 = v45 == 0;

    if (v46)
    {
      v41 = +[NSError errorDomainMSDWithCode:3727744736 message:@"An error has occurred."];
      [(MSDOperation *)self setError:v41];
      char v44 = 0;
LABEL_63:

      goto LABEL_64;
    }
    char v44 = 0;
  }
LABEL_64:
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);

  return v44 & 1;
}

- (void)_downloadContentFile:(id)a3 ofHash:(id)a4 toPath:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  uint64_t v14 = objc_alloc_init(MSDDownloadFileRequest);
  v15 = [(MSDDownloadFileRequest *)v14 fileInfo];
  [v15 setFile:v10];

  unsigned __int8 v16 = [(MSDDownloadFileRequest *)v14 fileInfo];
  [v16 setFileHash:v11];

  [(MSDServerRequest *)v14 setSavePath:v12];
  v17 = [(MSDOperation *)self context];
  v18 = [v17 originServer];
  [(MSDCDNServerRequest *)v14 setOriginServer:v18];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B91E4;
  v21[3] = &unk_1001540F8;
  id v19 = v13;
  id v22 = v19;
  objc_copyWeak(&v23, &location);
  [(MSDServerRequest *)v14 setCompletion:v21];
  v20 = +[MSDServerRequestHandler sharedInstance];
  [v20 handleRequestAsync:v14];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

@end