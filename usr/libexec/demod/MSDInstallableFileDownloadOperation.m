@interface MSDInstallableFileDownloadOperation
- (BOOL)_downloadInstallableFile;
- (BOOL)_downloadInstallableFile:(id)a3 ofHash:(id)a4 toPath:(id)a5;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDInstallableFileDownloadOperation

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_downloadInstallableFile"];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)_downloadInstallableFile
{
  v3 = +[MSDContentCacheManager sharedInstance];
  v4 = [(MSDOperation *)self context];
  v5 = [v4 identifier];

  v6 = [(MSDOperation *)self context];
  v7 = [v6 fileHash];

  BOOL v8 = +[MSDOperationContext downloadOnly];
  v9 = [v3 findFileInCache:v7];

  if (v9)
  {
    v10 = sub_1000687C8();
    unint64_t v11 = [(MSDOperation *)self signpostId];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        int v28 = 138412290;
        id v29 = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, v12, "File Cache Hit", "File cache hit: %{xcode:string}@", (uint8_t *)&v28, 0xCu);
      }
    }
LABEL_16:
    BOOL v25 = 1;
    goto LABEL_17;
  }
  v13 = [v3 fileCachePathFromSourcePath:0 forBackgroundDownload:v8];
  v10 = [v13 stringByAppendingPathComponent:v7];

  v14 = sub_1000687C8();
  unint64_t v15 = [(MSDOperation *)self signpostId];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      int v28 = 138412290;
      id v29 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Download File", "File download hash: %{xcode:string}@", (uint8_t *)&v28, 0xCu);
    }
  }

  unsigned int v17 = [(MSDInstallableFileDownloadOperation *)self _downloadInstallableFile:v5 ofHash:v7 toPath:v10];
  v18 = sub_1000687C8();
  unint64_t v19 = [(MSDOperation *)self signpostId];
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v20 = v19;
    if (os_signpost_enabled(v18))
    {
      int v28 = 67109120;
      LODWORD(v29) = v17;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v20, "Download File", "File download result: %{xcode:BOOLean}d", (uint8_t *)&v28, 8u);
    }
  }

  if (v17)
  {
    id v21 = [v3 fileSizeInCache:v7];
    v22 = sub_1000687C8();
    unint64_t v23 = [(MSDOperation *)self signpostId];
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v24 = v23;
      if (os_signpost_enabled(v22))
      {
        int v28 = 134217984;
        id v29 = v21;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, v24, "File Downloaded", "File download size: %{xcode:size-in-bytes}llu", (uint8_t *)&v28, 0xCu);
      }
    }

    goto LABEL_16;
  }

  [(MSDOperation *)self setRetryable:1];
  v27 = [(MSDOperation *)self error];

  if (v27)
  {
    BOOL v25 = 0;
    goto LABEL_18;
  }
  v10 = +[NSError errorDomainMSDWithCode:3727744736 message:@"An error has occurred."];
  [(MSDOperation *)self setError:v10];
  BOOL v25 = 0;
LABEL_17:

LABEL_18:
  return v25;
}

- (BOOL)_downloadInstallableFile:(id)a3 ofHash:(id)a4 toPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(MSDOperation *)self context];
  os_signpost_id_t v12 = [v11 originServer];

  v13 = objc_alloc_init(MSDDownloadFileRequest);
  v14 = [(MSDDownloadFileRequest *)v13 fileInfo];
  [v14 setFile:v10];

  unint64_t v15 = [(MSDDownloadFileRequest *)v13 fileInfo];
  [v15 setFileHash:v9];

  [(MSDServerRequest *)v13 setSavePath:v8];
  [(MSDCDNServerRequest *)v13 setOriginServer:v12];
  os_signpost_id_t v16 = +[MSDServerRequestHandler sharedInstance];
  unsigned int v17 = [v16 handleRequestSync:v13];

  v18 = [v17 error];
  if (v18) {
    [(MSDOperation *)self setError:v18];
  }

  return v18 == 0;
}

@end