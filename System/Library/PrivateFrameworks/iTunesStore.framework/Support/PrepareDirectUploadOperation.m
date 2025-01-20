@interface PrepareDirectUploadOperation
- (PrepareDirectUploadOperation)initWithRequest:(id)a3;
- (id)_newURLRequestWithURL:(id)a3;
- (id)_uploadURL;
- (id)outputBlock;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation PrepareDirectUploadOperation

- (PrepareDirectUploadOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PrepareDirectUploadOperation;
  v6 = [(PrepareDirectUploadOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)outputBlock
{
  [(PrepareDirectUploadOperation *)self lock];
  id v3 = [self->_outputBlock copy];
  [(PrepareDirectUploadOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(PrepareDirectUploadOperation *)self lock];
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(PrepareDirectUploadOperation *)self unlock];
}

- (void)run
{
  id v3 = [(DirectUploadRequest *)self->_request localAssetURL];
  id v4 = objc_alloc_init((Class)NSFileManager);
  if (!v3) {
    goto LABEL_46;
  }
  if ([v3 isFileURL])
  {
    id v5 = [v3 path];
    unsigned __int8 v6 = [v4 isReadableFileAtPath:v5];

    if ((v6 & 1) == 0)
    {
      v19 = +[SSLogConfig sharedDaemonConfig];
      if (!v19)
      {
        v19 = +[SSLogConfig sharedConfig];
      }
      unsigned int v27 = [v19 shouldLog];
      unsigned int v28 = [v19 shouldLogToDisk];
      v29 = [v19 OSLogObject];
      v30 = v29;
      if (v28) {
        v27 |= 2u;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        v27 &= 2u;
      }
      if (!v27)
      {

        goto LABEL_45;
      }
      id v31 = (id)objc_opt_class();
      int64_t v32 = [(DirectUploadRequest *)self->_request databaseIdentifier];
      int v42 = 138412802;
      id v43 = v31;
      __int16 v44 = 2048;
      int64_t v45 = v32;
      __int16 v46 = 2112;
      v47 = v3;
      LODWORD(v41) = 32;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (v26) {
        goto LABEL_33;
      }
      goto LABEL_45;
    }
  }
  v7 = [(DirectUploadRequest *)self->_request accountIdentifier];

  if (!v7)
  {
    v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    unsigned int v21 = [v19 shouldLogToDisk];
    v22 = [v19 OSLogObject];
    v23 = v22;
    if (v21) {
      v20 |= 2u;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (!v20)
    {

      goto LABEL_45;
    }
    id v24 = (id)objc_opt_class();
    int64_t v25 = [(DirectUploadRequest *)self->_request databaseIdentifier];
    int v42 = 138412546;
    id v43 = v24;
    __int16 v44 = 2048;
    int64_t v45 = v25;
    LODWORD(v41) = 22;
    v26 = (void *)_os_log_send_and_compose_impl();

    if (v26)
    {
LABEL_33:
      v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v42, v41);
      free(v26);
      SSFileLog();
    }
LABEL_45:

LABEL_46:
    v34 = SSError();
    id v35 = 0;
    v36 = 0;
    goto LABEL_47;
  }
  v8 = [(PrepareDirectUploadOperation *)self _uploadURL];
  if (v8)
  {
    id v9 = [objc_alloc((Class)NSMutableString) initWithString:@"com.apple.itunesstored"];
    v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    unsigned int v12 = [v10 shouldLogToDisk];
    v13 = [v10 OSLogObject];
    v14 = v13;
    if (v12) {
      v11 |= 2u;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      v11 &= 2u;
    }
    if (v11)
    {
      id v15 = (id)objc_opt_class();
      int64_t v16 = [(DirectUploadRequest *)self->_request databaseIdentifier];
      int v42 = 138412802;
      id v43 = v15;
      __int16 v44 = 2048;
      int64_t v45 = v16;
      __int16 v46 = 2112;
      v47 = v8;
      LODWORD(v41) = 32;
      v40 = &v42;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (v17)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v42, v41);
        v18 = (int *)objc_claimAutoreleasedReturnValue();
        free(v17);
        v40 = v18;
        SSFileLog();
      }
    }
    else
    {
    }
    id v35 = [(PrepareDirectUploadOperation *)self _newURLRequestWithURL:v8];
    v37 = [(DirectUploadRequest *)self->_request sourceApplication];
    if (v37)
    {
      [v9 appendString:@"."];
      [v9 appendString:v37];
    }
    if (objc_msgSend(v35, "allowsCellularAccess", v40)) {
      [v9 appendString:@".cell"];
    }
    v36 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v9];
    objc_msgSend(v36, "setAllowsCellularAccess:", objc_msgSend(v35, "allowsCellularAccess"));
    [v36 setHTTPCookieAcceptPolicy:1];
    [v36 setHTTPShouldSetCookies:0];
    [v36 setHTTPShouldUsePipelining:1];
    [v36 setSessionSendsLaunchEvents:1];
    objc_msgSend(v36, "set_allowsRetryForBackgroundDataTasks:", 1);
    objc_msgSend(v36, "set_sourceApplicationBundleIdentifier:", v37);

    v34 = 0;
  }
  else
  {
    v34 = SSError();
    id v35 = 0;
    v36 = 0;
  }

LABEL_47:
  [(PrepareDirectUploadOperation *)self setError:v34];
  [(PrepareDirectUploadOperation *)self setSuccess:0];
  uint64_t v38 = [(PrepareDirectUploadOperation *)self outputBlock];
  v39 = (void *)v38;
  if (v38)
  {
    (*(void (**)(uint64_t, void *, id, void *))(v38 + 16))(v38, v36, v35, v34);
    [(PrepareDirectUploadOperation *)self setOutputBlock:0];
  }
}

- (id)_newURLRequestWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v4];
  [v5 setHTTPMethod:@"POST"];
  unsigned __int8 v6 = [(DirectUploadRequest *)self->_request accountIdentifier];
  +[ISStoreURLOperation addITunesStoreHeadersToRequest:v5 withAccountIdentifier:v6];
  v7 = +[SSDevice currentDevice];
  v8 = [v7 userAgent];

  if (v8) {
    [v5 setValue:v8 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  }
  id v9 = +[SSVCookieStorage sharedStorage];
  v10 = [v9 cookieHeadersForURL:v4 userIdentifier:v6];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000AEB24;
  v24[3] = &unk_1003A3688;
  id v11 = v5;
  id v25 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v24];
  unsigned int v12 = [(DirectUploadRequest *)self->_request parentRelationshipType];
  unsigned int v13 = [v12 isEqualToString:SSVMediaSocialPostAttachmentRelationshipCoverImage];

  if (v13) {
    [v11 setValue:@"RP.AudioCoverArt" forHTTPHeaderField:@"X-Apple-Upload-Validation-RuleSets"];
  }
  v14 = [(DirectUploadRequest *)self->_request UTI];
  id v15 = v14;
  if (v14)
  {
    int64_t v16 = v14;
    if ([(__CFString *)v16 isEqualToString:@"com.apple.coreaudio-format"])
    {
      v17 = @"audio/x-caf";
    }
    else
    {
      v17 = (__CFString *)UTTypeCopyPreferredTagWithClass(v16, kUTTagClassMIMEType);
      if (!v17)
      {
LABEL_10:
        v18 = +[NSUUID UUID];
        v19 = [v18 UUIDString];

        unsigned int v20 = (__CFString *)UTTypeCopyPreferredTagWithClass(v16, kUTTagClassFilenameExtension);
        if (v20)
        {
          uint64_t v21 = [v19 stringByAppendingPathExtension:v20];

          v19 = (void *)v21;
        }
        [v11 setValue:v19 forHTTPHeaderField:@"X-Original-Filename"];
        CFRelease(v16);

        goto LABEL_13;
      }
    }
    [v11 setValue:v17 forHTTPHeaderField:@"Content-Type"];

    goto LABEL_10;
  }
LABEL_13:
  id v22 = v11;

  return v22;
}

- (id)_uploadURL
{
  id v3 = [(DirectUploadRequest *)self->_request UTI];
  uint64_t v4 = SSVMediaSocialAttachmentTypeForTypeIdentifier();

  id v5 = +[SSURLBagContext contextWithBagType:0];
  unsigned __int8 v6 = [(PrepareDirectUploadOperation *)self loadedURLBagWithContext:v5 returningError:0];

  if (v6 && (unint64_t)(v4 - 1) <= 3)
  {
    v7 = off_1003A5868[v4 - 1];
    v8 = [v6 urlForKey:v7];
    if (v8) {
      goto LABEL_30;
    }
    id v9 = [v6 valueForKey:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v9 objectForKey:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = +[NSURL URLWithString:v10];
      }
      else
      {
        v8 = 0;
      }

      if (v8) {
        goto LABEL_30;
      }
    }
    else
    {
    }
  }
  CFPropertyListRef v11 = CFPreferencesCopyAppValue(@"ISDirectUploadURL", kSSUserDefaultsIdentifier);
  if (!v11)
  {
    v8 = 0;
    goto LABEL_30;
  }
  unsigned int v12 = v11;
  CFTypeID v13 = CFGetTypeID(v11);
  if (v13 == CFStringGetTypeID())
  {
    v14 = +[NSURL URLWithString:v12];
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
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      *(_DWORD *)v23 = 138412546;
      *(void *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v14;
      id v19 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      unsigned int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_23:

        if ((unint64_t)(v4 - 1) > 3)
        {
          v8 = 0;
        }
        else
        {
          v8 = [v14 URLByAppendingPathComponent:off_1003A5888[v4 - 1]];
        }

        goto LABEL_29;
      }
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16]);
      free(v20);
      SSFileLog();
    }

    goto LABEL_23;
  }
  v8 = 0;
LABEL_29:
  CFRelease(v12);
LABEL_30:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_outputBlock, 0);
}

@end