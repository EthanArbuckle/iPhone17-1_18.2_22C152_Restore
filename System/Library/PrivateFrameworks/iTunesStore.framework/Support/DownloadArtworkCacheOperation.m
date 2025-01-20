@interface DownloadArtworkCacheOperation
- (DownloadArtworkCacheOperation)initWithDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4;
- (DownloadArtworkCacheOperation)initWithStoreDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4;
- (NSData)artworkData;
- (void)_setArtworkData:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation DownloadArtworkCacheOperation

- (DownloadArtworkCacheOperation)initWithDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DownloadArtworkCacheOperation;
  v6 = [(DownloadArtworkCacheOperation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_downloadID = a3;
    v6->_thumbnailURL = (NSURL *)[a4 copy];
  }
  return v7;
}

- (DownloadArtworkCacheOperation)initWithStoreDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DownloadArtworkCacheOperation;
  v6 = [(DownloadArtworkCacheOperation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_downloadID = a3;
    v6->_isStoreDownload = 1;
    v6->_thumbnailURL = (NSURL *)[a4 copy];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadArtworkCacheOperation;
  [(DownloadArtworkCacheOperation *)&v3 dealloc];
}

- (NSData)artworkData
{
  [(DownloadArtworkCacheOperation *)self lock];
  objc_super v3 = self->_artworkData;
  [(DownloadArtworkCacheOperation *)self unlock];
  return v3;
}

- (void)run
{
  uint64_t v33 = 0;
  id v3 = objc_msgSend(+[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:](ScratchManager, "directoryPathForDownloadID:kind:createIfNeeded:", self->_downloadID, 0, 1), "stringByAppendingPathComponent:", @"thumbnail");
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3];
  if (!v4)
  {
    if (self->_thumbnailURL)
    {
      id v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14) {
        id v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_INFO)) {
        v16 &= 2u;
      }
      if (v16)
      {
        uint64_t v17 = objc_opt_class();
        thumbnailURL = self->_thumbnailURL;
        int v34 = 138412546;
        uint64_t v35 = v17;
        __int16 v36 = 2112;
        int64_t v37 = (int64_t)thumbnailURL;
        LODWORD(v32) = 22;
        v31 = &v34;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          v20 = (void *)v19;
          v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v34, v32);
          free(v20);
          v31 = (int *)v21;
          SSFileLog();
        }
      }
      if ([(NSString *)[(NSURL *)self->_thumbnailURL scheme] caseInsensitiveCompare:@"file"])
      {
        id v22 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:self->_thumbnailURL];
        BOOL isStoreDownload = self->_isStoreDownload;
        if (self->_isStoreDownload)
        {
          id v24 = objc_alloc_init((Class)ISStoreURLOperation);
          [v24 setUrlKnownToBeTrusted:1];
        }
        else
        {
          id v24 = objc_alloc_init((Class)ISURLOperation);
          [v24 _setUsesPrivateCookieStore:0];
        }
        [v22 setITunesStoreRequest:isStoreDownload];
        objc_msgSend(v24, "setDataProvider:", +[ISDataProvider provider](ISDataProvider, "provider"));
        [v24 setRequestProperties:v22];
        if ([(DownloadArtworkCacheOperation *)self runSubOperation:v24 returningError:&v33])
        {
          id v5 = objc_msgSend(objc_msgSend(v24, "dataProvider"), "output");
          [v5 writeToFile:v3 options:1 error:0];
        }
        else
        {
          id v5 = 0;
        }

        goto LABEL_43;
      }
      id v5 = [objc_alloc((Class)NSData) initWithContentsOfURL:self->_thumbnailURL options:0 error:&v33];
      if (v5) {
        goto LABEL_43;
      }
      id v25 = +[SSLogConfig sharedDaemonConfig];
      if (!v25) {
        id v25 = +[SSLogConfig sharedConfig];
      }
      unsigned int v26 = [v25 shouldLog];
      if ([v25 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      if (!os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v27 &= 2u;
      }
      if (v27)
      {
        uint64_t v28 = objc_opt_class();
        v29 = self->_thumbnailURL;
        int v34 = 138412802;
        uint64_t v35 = v28;
        __int16 v36 = 2112;
        int64_t v37 = (int64_t)v29;
        __int16 v38 = 2112;
        uint64_t v39 = v33;
        LODWORD(v32) = 32;
        v31 = &v34;
        id v5 = (id)_os_log_send_and_compose_impl();
        if (!v5) {
          goto LABEL_43;
        }
        v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v5, 4, &v34, v32);
        free(v5);
        v31 = (int *)v30;
        SSFileLog();
      }
    }
    id v5 = 0;
    goto LABEL_43;
  }
  id v5 = v4;
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    int64_t downloadID = self->_downloadID;
    int v34 = 138412546;
    uint64_t v35 = v9;
    __int16 v36 = 2048;
    int64_t v37 = downloadID;
    LODWORD(v32) = 22;
    v31 = &v34;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v34, v32);
      free(v12);
      v31 = (int *)v13;
      SSFileLog();
    }
  }
LABEL_43:
  -[DownloadArtworkCacheOperation _setArtworkData:](self, "_setArtworkData:", v5, v31);

  [(DownloadArtworkCacheOperation *)self setError:v33];
  [(DownloadArtworkCacheOperation *)self setSuccess:v5 != 0];
}

- (void)_setArtworkData:(id)a3
{
  [(DownloadArtworkCacheOperation *)self lock];
  artworkData = self->_artworkData;
  if (artworkData != a3)
  {

    self->_artworkData = (NSData *)a3;
  }

  [(DownloadArtworkCacheOperation *)self unlock];
}

@end