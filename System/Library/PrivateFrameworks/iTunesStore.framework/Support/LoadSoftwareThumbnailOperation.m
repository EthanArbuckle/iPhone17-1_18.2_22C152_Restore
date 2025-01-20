@interface LoadSoftwareThumbnailOperation
- (ApplicationHandle)applicationHandle;
- (BOOL)isStoreDownload;
- (LoadSoftwareThumbnailOperation)initWithApplicationHandle:(id)a3 thumbnailURL:(id)a4;
- (id)_artworkDataWithError:(id *)a3;
- (void)run;
- (void)setApplicationHandle:(id)a3;
- (void)setStoreDownload:(BOOL)a3;
@end

@implementation LoadSoftwareThumbnailOperation

- (LoadSoftwareThumbnailOperation)initWithApplicationHandle:(id)a3 thumbnailURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LoadSoftwareThumbnailOperation;
  v8 = [(LoadSoftwareThumbnailOperation *)&v14 init];
  if (v8)
  {
    v9 = (ApplicationHandle *)[v6 copy];
    applicationHandle = v8->_applicationHandle;
    v8->_applicationHandle = v9;

    v11 = (NSURL *)[v7 copy];
    thumbnailURL = v8->_thumbnailURL;
    v8->_thumbnailURL = v11;
  }
  return v8;
}

- (BOOL)isStoreDownload
{
  [(LoadSoftwareThumbnailOperation *)self lock];
  BOOL storeDownload = self->_storeDownload;
  [(LoadSoftwareThumbnailOperation *)self unlock];
  return storeDownload;
}

- (void)setStoreDownload:(BOOL)a3
{
  [(LoadSoftwareThumbnailOperation *)self lock];
  self->_BOOL storeDownload = a3;

  [(LoadSoftwareThumbnailOperation *)self unlock];
}

- (void)run
{
  v3 = [(ApplicationHandle *)self->_applicationHandle bundleID];

  if (v3)
  {
    v4 = [(ApplicationHandle *)self->_applicationHandle bundleID];
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4 placeholder:1];

    if ([v5 foundBackingBundle])
    {
      id v6 = [v5 iconsDictionary];
      id v7 = [v6 count];

      if (v7)
      {
        v8 = +[SSLogConfig sharedDaemonConfig];
        if (!v8)
        {
          v8 = +[SSLogConfig sharedConfig];
        }
        unsigned int v9 = [v8 shouldLog];
        if ([v8 shouldLogToDisk]) {
          int v10 = v9 | 2;
        }
        else {
          int v10 = v9;
        }
        v11 = [v8 OSLogObject];
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          v10 &= 2u;
        }
        if (v10)
        {
          v12 = objc_opt_class();
          applicationHandle = self->_applicationHandle;
          int v39 = 138412546;
          v40 = v12;
          __int16 v41 = 2112;
          v42 = applicationHandle;
          id v14 = v12;
          LODWORD(v35) = 22;
          v15 = (void *)_os_log_send_and_compose_impl();

          if (!v15)
          {
LABEL_43:

            goto LABEL_44;
          }
          v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v39, v35);
          free(v15);
          SSFileLog();
        }
LABEL_32:

        goto LABEL_43;
      }
    }
  }
  if (self->_thumbnailURL)
  {
    id v38 = 0;
    v8 = [(LoadSoftwareThumbnailOperation *)self _artworkDataWithError:&v38];
    id v5 = v38;
    [(LoadSoftwareThumbnailOperation *)self setError:v5];
    if (![v8 length] || v5) {
      goto LABEL_43;
    }
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
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v18 &= 2u;
    }
    if (v18)
    {
      v20 = objc_opt_class();
      v21 = self->_applicationHandle;
      int v39 = 138412546;
      v40 = v20;
      __int16 v41 = 2112;
      v42 = v21;
      id v22 = v20;
      LODWORD(v35) = 22;
      v34 = &v39;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_29:

        v11 = +[ApplicationWorkspace defaultWorkspace];
        dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
        int64_t v25 = [(DownloadHandle *)self->_applicationHandle downloadID];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10017DE18;
        v36[3] = &unk_1003A3140;
        v26 = v24;
        v37 = v26;
        [v11 waitForInstallOfDownloadIdentifier:v25 completionBlock:v36];
        dispatch_time_t v27 = dispatch_time(0, 60000000000);
        dispatch_semaphore_wait(v26, v27);
        if (([(LoadSoftwareThumbnailOperation *)self isCancelled] & 1) == 0) {
          [v11 setIconData:v8 forApplicationHandle:self->_applicationHandle];
        }
        -[LoadSoftwareThumbnailOperation setSuccess:](self, "setSuccess:", 1, v34);

        goto LABEL_32;
      }
      v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v39, v35);
      free(v23);
      v34 = (int *)v19;
      SSFileLog();
    }

    goto LABEL_29;
  }
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v28 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v29 = v28 | 2;
  }
  else {
    int v29 = v28;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v29 &= 2u;
  }
  if (!v29) {
    goto LABEL_43;
  }
  v30 = objc_opt_class();
  v31 = self->_applicationHandle;
  int v39 = 138412546;
  v40 = v30;
  __int16 v41 = 2112;
  v42 = v31;
  id v32 = v30;
  LODWORD(v35) = 22;
  v33 = (void *)_os_log_send_and_compose_impl();

  if (v33)
  {
    v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v39, v35);
    free(v33);
    SSFileLog();
    goto LABEL_43;
  }
LABEL_44:
}

- (id)_artworkDataWithError:(id *)a3
{
  unsigned int v5 = [(LoadSoftwareThumbnailOperation *)self isStoreDownload];
  id v6 = [DownloadArtworkCacheOperation alloc];
  int64_t v7 = [(DownloadHandle *)self->_applicationHandle downloadID];
  thumbnailURL = self->_thumbnailURL;
  if (v5) {
    unsigned int v9 = [(DownloadArtworkCacheOperation *)v6 initWithStoreDownloadIdentifier:v7 thumbnailURL:thumbnailURL];
  }
  else {
    unsigned int v9 = [(DownloadArtworkCacheOperation *)v6 initWithDownloadIdentifier:v7 thumbnailURL:thumbnailURL];
  }
  int v10 = v9;
  id v15 = 0;
  unsigned __int8 v11 = [(LoadSoftwareThumbnailOperation *)self runSubOperation:v9 returningError:&v15];
  id v12 = v15;
  v13 = [(DownloadArtworkCacheOperation *)v10 artworkData];
  if (a3 && (v11 & 1) == 0) {
    *a3 = v12;
  }

  return v13;
}

- (ApplicationHandle)applicationHandle
{
  return self->_applicationHandle;
}

- (void)setApplicationHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationHandle, 0);

  objc_storeStrong((id *)&self->_thumbnailURL, 0);
}

@end