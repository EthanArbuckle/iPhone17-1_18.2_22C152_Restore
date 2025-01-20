@interface MSDApplicationFileDownloadOperation
- (BOOL)_downloadAppArchiveFile;
- (id)_downloadAppArchiveFile:(id)a3 ofHash:(id)a4 ofAppUID:(id)a5 currenntAppUID:(id)a6 toFolder:(id)a7;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDApplicationFileDownloadOperation

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_downloadAppArchiveFile"];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)_downloadAppArchiveFile
{
  v3 = +[MSDContentCacheManager sharedInstance];
  v4 = [(MSDOperation *)self context];
  v5 = [v4 identifier];

  v6 = [(MSDOperation *)self context];
  v7 = [v6 uniqueIdentifier];

  v8 = [(MSDOperation *)self context];
  v9 = [v8 currentUniqueIdentifier];

  v10 = [(MSDOperation *)self context];
  v11 = [v10 fileHash];

  BOOL v12 = +[MSDOperationContext downloadOnly];
  if (v9)
  {
    uint64_t v13 = [v3 appDiffPatchFileForSourceAppUID:v9 targetAppUID:v7];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [(MSDOperation *)self context];
      [v15 setUseDiffPatch:1];

LABEL_5:
      v16 = sub_1000687C8();
      unint64_t v17 = [(MSDOperation *)self signpostId];
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v18 = v17;
        if (os_signpost_enabled(v16))
        {
          int v35 = 138412290;
          id v36 = v14;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, v18, "File Cache Hit", "File cache hit: %{xcode:string}@", (uint8_t *)&v35, 0xCu);
        }
      }
LABEL_23:

      BOOL v32 = 1;
      goto LABEL_24;
    }
  }
  v14 = [v3 findFileInCache:v11];
  if (v14) {
    goto LABEL_5;
  }
  v14 = [v3 fileCachePathFromSourcePath:0 forBackgroundDownload:v12];
  v19 = sub_1000687C8();
  unint64_t v20 = [(MSDOperation *)self signpostId];
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = v20;
    if (os_signpost_enabled(v19))
    {
      int v35 = 138412290;
      id v36 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Download App", "App identifier: %{xcode:string}@", (uint8_t *)&v35, 0xCu);
    }
  }

  v16 = [(MSDApplicationFileDownloadOperation *)self _downloadAppArchiveFile:v5 ofHash:v11 ofAppUID:v7 currenntAppUID:v9 toFolder:v14];
  v22 = sub_1000687C8();
  unint64_t v23 = [(MSDOperation *)self signpostId];
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      int v35 = 67109120;
      LODWORD(v36) = v16 != 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v24, "Download App", "App download result: %{xcode:BOOLean}d", (uint8_t *)&v35, 8u);
    }
  }

  if (v16)
  {
    v25 = [(MSDOperation *)self context];
    unsigned int v26 = [v25 useDiffPatch];

    if (v26)
    {
      [v3 addAppDiffPatchFile:v16 sourceAppUID:v9 targetAppUID:v7];
    }
    else if (([v11 isEqualToString:v16] & 1) == 0)
    {
      v27 = [(MSDOperation *)self context];
      [v27 setFileHash:v16];
    }
    id v28 = [v3 fileSizeInCache:v16];
    v29 = sub_1000687C8();
    unint64_t v30 = [(MSDOperation *)self signpostId];
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v31 = v30;
      if (os_signpost_enabled(v29))
      {
        int v35 = 134217984;
        id v36 = v28;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, v31, "File Downloaded", "File download size: %{xcode:size-in-bytes}llu", (uint8_t *)&v35, 0xCu);
      }
    }

    goto LABEL_23;
  }

  [(MSDOperation *)self setRetryable:1];
  v34 = [(MSDOperation *)self error];

  if (v34)
  {
    BOOL v32 = 0;
    goto LABEL_25;
  }
  v14 = +[NSError errorDomainMSDWithCode:3727744736 message:@"An error has occurred."];
  [(MSDOperation *)self setError:v14];
  BOOL v32 = 0;
LABEL_24:

LABEL_25:
  return v32;
}

- (id)_downloadAppArchiveFile:(id)a3 ofHash:(id)a4 ofAppUID:(id)a5 currenntAppUID:(id)a6 toFolder:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  unint64_t v17 = objc_alloc_init(MSDDownloadIPARequest);
  [(MSDDownloadIPARequest *)v17 setAppID:v16];

  [(MSDDownloadIPARequest *)v17 setFileHash:v15];
  [(MSDDownloadIPARequest *)v17 setUid:v14];

  [(MSDDownloadIPARequest *)v17 setCurrentUID:v13];
  [(MSDServerRequest *)v17 setSavePath:v12];

  os_signpost_id_t v18 = [(MSDOperation *)self context];
  v19 = [v18 originServer];
  [(MSDDownloadIPARequest *)v17 setOriginServer:v19];

  unint64_t v20 = +[MSDServerRequestHandler sharedInstance];
  os_signpost_id_t v21 = [v20 handleRequestSync:v17];

  v22 = [v21 error];
  if (v22)
  {
    [(MSDOperation *)self setError:v22];
    v25 = 0;
  }
  else
  {
    id v23 = [v21 isDiffPatch];
    os_signpost_id_t v24 = [(MSDOperation *)self context];
    [v24 setUseDiffPatch:v23];

    v25 = [v21 fileName];
  }

  return v25;
}

@end