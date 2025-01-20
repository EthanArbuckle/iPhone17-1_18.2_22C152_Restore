@interface LoadExternalDownloadManifestOperation
- (BOOL)_handlePublicResponseForOperation:(id)a3 error:(id *)a4;
- (BOOL)_runForPublicFormatWithURLRequest:(id)a3 error:(id *)a4;
- (BOOL)_runForPurchaseFormatWithURLRequest:(id)a3 error:(id *)a4;
- (BOOL)_showConfirmationPromptForManifest:(id)a3 response:(id)a4;
- (BOOL)shouldHideUserPrompts;
- (ExternalDownloadManifest)manifest;
- (LoadExternalDownloadManifestOperation)initWithRequest:(id)a3;
- (NSURLRequest)URLRequest;
- (SSDownloadManifestResponse)manifestResponse;
- (int64_t)manifestFormat;
- (void)_processValidDownloads:(id)a3;
- (void)_showDialogForError:(id)a3;
- (void)run;
- (void)setManifestFormat:(int64_t)a3;
- (void)setShouldHideUserPrompts:(BOOL)a3;
- (void)setURLRequest:(id)a3;
@end

@implementation LoadExternalDownloadManifestOperation

- (LoadExternalDownloadManifestOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LoadExternalDownloadManifestOperation;
  v5 = [(LoadExternalDownloadManifestOperation *)&v10 init];
  if (v5)
  {
    v5->_manifestFormat = (int64_t)[v4 manifestFormat];
    v5->_shouldHideUserPrompts = [v4 shouldHideUserPrompts];
    v6 = [v4 URLRequest];
    v7 = (NSURLRequest *)[v6 copy];
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = v7;
  }
  return v5;
}

- (ExternalDownloadManifest)manifest
{
  [(LoadExternalDownloadManifestOperation *)self lock];
  v3 = self->_manifest;
  [(LoadExternalDownloadManifestOperation *)self unlock];

  return v3;
}

- (int64_t)manifestFormat
{
  [(LoadExternalDownloadManifestOperation *)self lock];
  int64_t manifestFormat = self->_manifestFormat;
  [(LoadExternalDownloadManifestOperation *)self unlock];
  return manifestFormat;
}

- (SSDownloadManifestResponse)manifestResponse
{
  [(LoadExternalDownloadManifestOperation *)self lock];
  id v3 = [(NSOrderedSet *)self->_downloadIDs copy];
  [(LoadExternalDownloadManifestOperation *)self unlock];
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v11 = objc_alloc((Class)SSDownload);
          id v12 = objc_msgSend(v11, "_initWithPersistentIdentifier:", objc_msgSend(v10, "longLongValue", (void)v15));
          [v4 addObject:v12];
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    id v13 = objc_alloc_init((Class)SSDownloadManifestResponse);
    [v13 setValidDownloads:v4];
  }
  else
  {
    id v13 = 0;
  }

  return (SSDownloadManifestResponse *)v13;
}

- (void)setManifestFormat:(int64_t)a3
{
  [(LoadExternalDownloadManifestOperation *)self lock];
  self->_int64_t manifestFormat = a3;

  [(LoadExternalDownloadManifestOperation *)self unlock];
}

- (void)setShouldHideUserPrompts:(BOOL)a3
{
  [(LoadExternalDownloadManifestOperation *)self lock];
  self->_shouldHideUserPrompts = a3;

  [(LoadExternalDownloadManifestOperation *)self unlock];
}

- (void)setURLRequest:(id)a3
{
  id v6 = (NSURLRequest *)a3;
  [(LoadExternalDownloadManifestOperation *)self lock];
  if (self->_urlRequest != v6)
  {
    id v4 = (NSURLRequest *)[(NSURLRequest *)v6 copy];
    urlRequest = self->_urlRequest;
    self->_urlRequest = v4;
  }
  [(LoadExternalDownloadManifestOperation *)self unlock];
}

- (BOOL)shouldHideUserPrompts
{
  [(LoadExternalDownloadManifestOperation *)self lock];
  BOOL shouldHideUserPrompts = self->_shouldHideUserPrompts;
  [(LoadExternalDownloadManifestOperation *)self unlock];
  return shouldHideUserPrompts;
}

- (NSURLRequest)URLRequest
{
  [(LoadExternalDownloadManifestOperation *)self lock];
  id v3 = self->_urlRequest;
  [(LoadExternalDownloadManifestOperation *)self unlock];

  return v3;
}

- (void)run
{
  id v3 = [(LoadExternalDownloadManifestOperation *)self URLRequest];
  id v4 = [v3 URL];

  uint64_t v5 = +[SSLogConfig sharedDaemonConfig];
  id v6 = (void *)v5;
  if (!v4)
  {
    if (!v5)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    long long v17 = [v6 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v39 = 138412290;
      id v40 = (id)objc_opt_class();
      id v18 = v40;
      LODWORD(v34) = 12;
      v33 = &v39;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_27:

        id v14 = +[NSError errorWithDomain:ISErrorDomain code:3 userInfo:0];
        goto LABEL_44;
      }
      long long v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v39, v34);
      free(v19);
      v33 = (int *)v17;
      SSFileLog();
    }

    goto LABEL_27;
  }
  if (!v5)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_12;
  }
  objc_super v10 = objc_opt_class();
  id v11 = v10;
  int v39 = 138412546;
  id v40 = v10;
  __int16 v41 = 2048;
  int64_t v42 = [(LoadExternalDownloadManifestOperation *)self manifestFormat];
  LODWORD(v34) = 22;
  v33 = &v39;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v39, v34);
    free(v12);
    v33 = (int *)v9;
    SSFileLog();
LABEL_12:
  }
  if ((id)[(LoadExternalDownloadManifestOperation *)self manifestFormat] == (id)1)
  {
    id v38 = 0;
    unsigned __int8 v13 = [(LoadExternalDownloadManifestOperation *)self _runForPurchaseFormatWithURLRequest:v3 error:&v38];
    id v14 = v38;
    if ((v13 & 1) == 0) {
      goto LABEL_44;
    }
LABEL_29:
    v36 = [(LoadExternalDownloadManifestOperation *)self manifest];
    v21 = [v36 validDownloads];
    if ([v21 count]) {
      [(LoadExternalDownloadManifestOperation *)self _processValidDownloads:v21];
    }
    v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22)
    {
      v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    v25 = [v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      int v26 = v24;
    }
    else {
      int v26 = v24 & 2;
    }
    if (v26)
    {
      v27 = objc_opt_class();
      id v35 = v27;
      id v28 = [v21 count];
      v29 = [v36 invalidDownloads];
      id v30 = [v29 count];
      int v39 = 138412802;
      id v40 = v27;
      __int16 v41 = 2048;
      int64_t v42 = (int64_t)v28;
      __int16 v43 = 2048;
      id v44 = v30;
      LODWORD(v34) = 32;
      v33 = &v39;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_43:

        uint64_t v32 = 1;
        goto LABEL_47;
      }
      v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v39, v34);
      free(v31);
      v33 = (int *)v25;
      SSFileLog();
    }

    goto LABEL_43;
  }
  id v37 = 0;
  unsigned int v20 = [(LoadExternalDownloadManifestOperation *)self _runForPublicFormatWithURLRequest:v3 error:&v37];
  id v14 = v37;
  if (v20) {
    goto LABEL_29;
  }
LABEL_44:
  if ((ISErrorIsEqual() & 1) == 0) {
    [(LoadExternalDownloadManifestOperation *)self _showDialogForError:v14];
  }
  uint64_t v32 = 0;
LABEL_47:
  -[LoadExternalDownloadManifestOperation setSuccess:](self, "setSuccess:", v32, v33);
  [(LoadExternalDownloadManifestOperation *)self setError:v14];
}

- (BOOL)_handlePublicResponseForOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [ExternalDownloadManifest alloc];
  int v8 = [v6 dataProvider];
  v9 = [v8 output];
  objc_super v10 = [(ExternalDownloadManifest *)v7 initWithPropertyList:v9];

  if (!v10)
  {
    id v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18)
    {
      id v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      LODWORD(v32) = 138412290;
      *(void *)((char *)&v32 + 4) = objc_opt_class();
      id v22 = *(id *)((char *)&v32 + 4);
      LODWORD(v31) = 12;
      unsigned int v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_19:

        uint64_t v24 = +[NSError errorWithDomain:SSErrorDomain code:200 userInfo:0];
        goto LABEL_32;
      }
      v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v32, v31, v32);
      free(v23);
      SSFileLog();
    }

    goto LABEL_19;
  }
  if (![(LoadExternalDownloadManifestOperation *)self shouldHideUserPrompts])
  {
    id v11 = [(ExternalDownloadManifest *)v10 validDownloads];
    id v12 = [v11 count];

    if (v12)
    {
      unsigned __int8 v13 = [v6 response];
      unsigned __int8 v14 = [(LoadExternalDownloadManifestOperation *)self _showConfirmationPromptForManifest:v10 response:v13];

      if ((v14 & 1) == 0)
      {
        v25 = +[SSLogConfig sharedDaemonConfig];
        if (!v25)
        {
          v25 = +[SSLogConfig sharedConfig];
        }
        unsigned int v26 = [v25 shouldLog];
        if ([v25 shouldLogToDisk]) {
          int v27 = v26 | 2;
        }
        else {
          int v27 = v26;
        }
        id v28 = [v25 OSLogObject];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          v27 &= 2u;
        }
        if (v27)
        {
          LODWORD(v32) = 138412290;
          *(void *)((char *)&v32 + 4) = objc_opt_class();
          id v29 = *(id *)((char *)&v32 + 4);
          LODWORD(v31) = 12;
          id v30 = (void *)_os_log_send_and_compose_impl();

          if (!v30)
          {
LABEL_31:

            uint64_t v24 = SSError();
LABEL_32:
            unsigned int v15 = (void *)v24;
            BOOL v16 = 0;
            if (!a4) {
              goto LABEL_7;
            }
            goto LABEL_6;
          }
          id v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v32, v31, v32);
          free(v30);
          SSFileLog();
        }

        goto LABEL_31;
      }
    }
  }
  [(LoadExternalDownloadManifestOperation *)self lock];
  objc_storeStrong((id *)&self->_manifest, v10);
  [(LoadExternalDownloadManifestOperation *)self unlock];
  unsigned int v15 = 0;
  BOOL v16 = 1;
  if (a4) {
LABEL_6:
  }
    *a4 = v15;
LABEL_7:

  return v16;
}

- (void)_processValidDownloads:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    uint64_t v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    v9 = objc_opt_class();
    id v10 = v9;
    int v27 = 138412546;
    id v28 = v9;
    __int16 v29 = 2048;
    id v30 = [v4 count];
    LODWORD(v22) = 22;
    v21 = &v27;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v27, v22);
    free(v11);
    v21 = (int *)v8;
    SSFileLog();
  }

LABEL_12:
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  unsigned __int8 v14 = +[DownloadsDatabase downloadsDatabase];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000797E0;
  v23[3] = &unk_1003A4D58;
  id v15 = v4;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  id v17 = v13;
  id v26 = v17;
  id v18 = [v14 modifyUsingTransactionBlock:v23];

  if ([v16 count])
  {
    [(LoadExternalDownloadManifestOperation *)self lock];
    unsigned int v19 = (NSOrderedSet *)[v16 copy];
    downloadIDs = self->_downloadIDs;
    self->_downloadIDs = v19;

    [(LoadExternalDownloadManifestOperation *)self unlock];
  }
  if (objc_msgSend(v17, "count", v21)) {
    +[AppStoreUtility sendSoftwareDownloads:v17 withReason:@"external manifest" manifestType:1];
  }
}

- (BOOL)_runForPublicFormatWithURLRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)ISURLOperation);
  [v7 _setUsesPrivateCookieStore:0];
  int v8 = objc_alloc_init(DaemonProtocolDataProvider);
  [(DaemonProtocolDataProvider *)v8 setShouldProcessProtocol:0];
  [v7 setDataProvider:v8];
  id v9 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURLRequest:v6];
  [v9 setRequiresExtendedValidationCertificates:0];
  [v9 setRequiresHTTPS:1];
  [v9 setRequiresExternal:1];
  [v7 setRequestProperties:v9];
  id v33 = 0;
  unsigned __int8 v10 = [(LoadExternalDownloadManifestOperation *)self runSubOperation:v7 returningError:&v33];
  id v11 = v33;
  id v12 = v11;
  if (v10)
  {
    id v32 = v11;
    BOOL v13 = [(LoadExternalDownloadManifestOperation *)self _handlePublicResponseForOperation:v7 error:&v32];
    unsigned __int8 v14 = v12;
    id v12 = v32;
    goto LABEL_28;
  }
  uint64_t v31 = a4;
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
  id v18 = [v15 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    int v19 = v17;
  }
  else {
    int v19 = v17 & 2;
  }
  if (v19)
  {
    int v20 = objc_opt_class();
    int v34 = 138412546;
    id v35 = v20;
    __int16 v36 = 2112;
    id v37 = v12;
    id v21 = v20;
    LODWORD(v30) = 22;
    __int16 v29 = &v34;
    uint64_t v22 = (void *)_os_log_send_and_compose_impl();

    if (!v22) {
      goto LABEL_15;
    }
    id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v34, v30);
    free(v22);
    __int16 v29 = (int *)v18;
    SSFileLog();
  }

LABEL_15:
  if (!ISErrorIsEqual())
  {
    BOOL v13 = 0;
    a4 = v31;
    if (!v31) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  unsigned __int8 v14 = +[SSLogConfig sharedDaemonConfig];
  if (!v14)
  {
    unsigned __int8 v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v23 = objc_msgSend(v14, "shouldLog", v29);
  if ([v14 shouldLogToDisk]) {
    v23 |= 2u;
  }
  id v24 = [v14 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    int v25 = v23;
  }
  else {
    int v25 = v23 & 2;
  }
  if (!v25) {
    goto LABEL_26;
  }
  id v26 = [v6 URL];
  int v34 = 138412290;
  id v35 = v26;
  LODWORD(v30) = 12;
  int v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v34, v30);
    free(v27);
    SSFileLog();
LABEL_26:
  }
  BOOL v13 = 0;
  a4 = v31;
LABEL_28:

  if (a4) {
LABEL_29:
  }
    *a4 = v12;
LABEL_30:

  return v13;
}

- (BOOL)_runForPurchaseFormatWithURLRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURLRequest:v6];
  int v8 = [[LoadDownloadQueueOperation alloc] initWithRequestProperties:v7];
  [(LoadDownloadQueueOperation *)v8 setNeedsAuthentication:0];
  [(LoadDownloadQueueOperation *)v8 setReason:1];
  [(LoadDownloadQueueOperation *)v8 setRequestIdentifier:@"external"];
  id v62 = 0;
  unsigned __int8 v9 = [(LoadExternalDownloadManifestOperation *)self runSubOperation:v8 returningError:&v62];
  id v10 = v62;
  id v11 = v10;
  if (v9)
  {
    id v42 = v10;
    unsigned __int8 v43 = v9;
    id v45 = v7;
    v46 = a4;
    id v47 = v6;
    id v12 = objc_alloc_init((Class)NSMutableArray);
    id v44 = v8;
    BOOL v13 = [(LoadDownloadQueueOperation *)v8 downloads];
    id v14 = objc_alloc_init((Class)NSMutableArray);
    id v15 = objc_alloc_init((Class)NSMutableOrderedSet);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    unsigned int v16 = v13;
    v51 = v16;
    id v53 = [v16 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v53)
    {
      uint64_t v52 = *(void *)v59;
      id v49 = v14;
      v50 = v12;
      id v48 = v15;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(void *)v59 != v52) {
            objc_enumerationMutation(v16);
          }
          id v18 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          int v19 = [v18 kind];
          int IsBookToShimKind = SSDownloadKindIsBookToShimKind();

          if (IsBookToShimKind)
          {
            [v14 addObject:v18];
            [v15 addObject:&off_1003C9120];
          }
          else
          {
            id v21 = [[Download alloc] initWithStoreDownload:v18];
            uint64_t v22 = v21;
            if (v21)
            {
              unsigned int v23 = [(Download *)v21 assets];
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              id v24 = [v23 countByEnumeratingWithState:&v54 objects:v63 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v55;
                do
                {
                  for (j = 0; j != v25; j = (char *)j + 1)
                  {
                    if (*(void *)v55 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    id v28 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
                    __int16 v29 = +[NSNumber numberWithBool:1];
                    [v28 setValue:v29 forProperty:@"is_external"];
                  }
                  id v25 = [v23 countByEnumeratingWithState:&v54 objects:v63 count:16];
                }
                while (v25);
              }
              id v12 = v50;
              [v50 addObject:v22];

              unsigned int v16 = v51;
              id v15 = v48;
              id v14 = v49;
            }
          }
        }
        id v53 = [v16 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v53);
    }

    if ([v15 count])
    {
      [(LoadExternalDownloadManifestOperation *)self lock];
      uint64_t v30 = (NSOrderedSet *)[v15 copy];
      downloadIDs = self->_downloadIDs;
      self->_downloadIDs = v30;

      [(LoadExternalDownloadManifestOperation *)self unlock];
    }
    if ([v14 count]) {
      +[BookAssetDaemonUtility sendBookStoreDownloads:v14 withReason:@"external manifest"];
    }
    id v32 = [[ExternalDownloadManifest alloc] initWithValidDownloads:v12 invalidDownloads:0];
    [(LoadExternalDownloadManifestOperation *)self lock];
    manifest = self->_manifest;
    self->_manifest = v32;

    [(LoadExternalDownloadManifestOperation *)self unlock];
    a4 = v46;
    id v6 = v47;
    int v8 = v44;
    id v7 = v45;
    unsigned __int8 v9 = v43;
    id v11 = v42;
    goto LABEL_36;
  }
  id v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12)
  {
    id v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v34 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    v34 |= 2u;
  }
  id v35 = [v12 OSLogObject];
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    v34 &= 2u;
  }
  if (!v34)
  {
    v51 = v35;
LABEL_36:

    goto LABEL_37;
  }
  __int16 v36 = objc_opt_class();
  int v65 = 138412546;
  v66 = v36;
  __int16 v67 = 2112;
  v68 = v11;
  id v37 = v36;
  LODWORD(v41) = 22;
  id v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    int v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v65, v41);
    free(v38);
    SSFileLog();
  }
LABEL_37:

  if (a4) {
    *a4 = v11;
  }

  return v9;
}

- (BOOL)_showConfirmationPromptForManifest:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = [a4 URL];
  if (v7
    || ([(LoadExternalDownloadManifestOperation *)self URLRequest],
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 URL],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7))
  {
    unsigned __int8 v9 = [v7 host];
    if ((unint64_t)[v9 length] >= 0x1F5)
    {
      uint64_t v10 = [v9 substringToIndex:500];

      unsigned __int8 v9 = (void *)v10;
    }
    id v11 = [v6 validDownloads];
    uint64_t v12 = (uint64_t)[v11 count];
    uint64_t v13 = v12;
    if (v12 < 2)
    {
      if (v12 != 1) {
        goto LABEL_19;
      }
      id v15 = [v11 objectAtIndex:0];
      unsigned int v16 = [v15 valueForProperty:@"title"];
      if ([v16 length])
      {
        if ((unint64_t)[v16 length] >= 0x1F5)
        {
          uint64_t v18 = [v16 substringToIndex:500];

          unsigned int v16 = (void *)v18;
        }
        id v19 = objc_alloc((Class)NSString);
        int v20 = +[NSBundle bundleForClass:objc_opt_class()];
        id v21 = [v20 localizedStringForKey:@"CONFIRM_MANIFEST_DOWNLOAD_SPECIFIC_%@_%@" value:&stru_1003B9B00 table:0];
        id v22 = objc_msgSend(v19, "initWithFormat:", v21, v9, v16);
      }
      else
      {
        id v24 = objc_alloc((Class)NSString);
        int v20 = +[NSBundle bundleForClass:objc_opt_class()];
        id v21 = [v20 localizedStringForKey:@"CONFIRM_MANIFEST_DOWNLOAD_GENERIC_%@" value:&stru_1003B9B00 table:0];
        id v22 = objc_msgSend(v24, "initWithFormat:", v21, v9, v37);
      }
      id v17 = v22;
    }
    else
    {
      id v14 = objc_alloc((Class)NSString);
      id v15 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v16 = [v15 localizedStringForKey:@"CONFIRM_MANIFEST_DOWNLOADS_%@_%ld" value:&stru_1003B9B00 table:0];
      id v17 = objc_msgSend(v14, "initWithFormat:", v16, v9, v13);
    }

    if (v17)
    {
      int v39 = v11;
      id v40 = v6;
      id v38 = v17;
      id v25 = [objc_alloc((Class)ISDialog) initWithTitle:v17 message:0];
      uint64_t v26 = +[NSBundle bundleForClass:objc_opt_class()];
      [v26 localizedStringForKey:@"CONFIRM_MANIFEST_CANCEL" value:&stru_1003B9B00 table:0];
      v27 = uint64_t v41 = self;
      id v28 = +[ISDialogButton buttonWithTitle:v27];
      __int16 v29 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v30 = [v29 localizedStringForKey:@"CONFIRM_MANIFEST_INSTALL" value:&stru_1003B9B00 table:0];
      uint64_t v31 = +[ISDialogButton buttonWithTitle:v30];
      id v32 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v31, 0);

      [v25 setButtons:v32];
      id v33 = objc_alloc_init((Class)ISDialogOperation);
      [v33 setDialog:v25];
      if ([(LoadExternalDownloadManifestOperation *)v41 runSubOperation:v33 returningError:0])
      {
        unsigned int v34 = [v33 selectedButton];
        if (v34) {
          BOOL v23 = [v32 indexOfObjectIdenticalTo:v34] == (id)1;
        }
        else {
          BOOL v23 = 0;
        }
        id v11 = v39;
        id v6 = v40;
        id v35 = v38;
      }
      else
      {
        BOOL v23 = 0;
        id v11 = v39;
        id v6 = v40;
        id v35 = v38;
      }

      goto LABEL_24;
    }
LABEL_19:
    BOOL v23 = 0;
LABEL_24:

    goto LABEL_25;
  }
  BOOL v23 = 0;
LABEL_25:

  return v23;
}

- (void)_showDialogForError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    uint64_t v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (v9)
  {
    int v26 = 138412290;
    id v27 = v4;
    LODWORD(v25) = 12;
    id v24 = &v26;
    uint64_t v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_13;
    }
    int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v26, v25);
    free(v10);
    id v24 = (int *)v8;
    SSFileLog();
  }

LABEL_13:
  id v11 = [(LoadExternalDownloadManifestOperation *)self URLRequest];
  uint64_t v12 = [v11 URL];

  if (v12)
  {
    uint64_t v13 = [v12 host];
    if ((unint64_t)[v13 length] >= 0x1F5)
    {
      uint64_t v14 = [v13 substringToIndex:500];

      uint64_t v13 = (void *)v14;
    }
    int IsEqual = ISErrorIsEqual();
    unsigned int v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = v16;
    if (IsEqual) {
      CFStringRef v18 = @"DOWNLOAD_MANIFEST_SSL_ERROR_%@";
    }
    else {
      CFStringRef v18 = @"DOWNLOAD_MANIFEST_ERROR_FORMAT_%@";
    }
    id v19 = objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1003B9B00, 0, v24);
    int v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v13);

    id v21 = [objc_alloc((Class)ISDialog) initWithTitle:v20 message:0];
    id v22 = +[ISOperationQueue mainQueue];
    BOOL v23 = +[ISDialogOperation operationWithDialog:v21];
    [v22 addOperation:v23];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_manifest, 0);

  objc_storeStrong((id *)&self->_downloadIDs, 0);
}

@end