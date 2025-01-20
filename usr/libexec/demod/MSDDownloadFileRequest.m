@interface MSDDownloadFileRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (MSDDownloadFileRequest)init;
- (MSDFileDownloadInfo)fileInfo;
- (double)dispatchTime;
- (id)description;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (int64_t)retryCount;
- (void)setDispatchTime:(double)a3;
- (void)setFileInfo:(id)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation MSDDownloadFileRequest

- (MSDDownloadFileRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDDownloadFileRequest;
  v2 = [(MSDDownloadFileRequest *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MSDFileDownloadInfo);
    [(MSDDownloadFileRequest *)v2 setFileInfo:v3];

    [(MSDDownloadFileRequest *)v2 setRetryCount:2];
    [(MSDDownloadFileRequest *)v2 setDispatchTime:0.0];
    v4 = v2;
  }

  return v2;
}

- (BOOL)isValid
{
  v9.receiver = self;
  v9.super_class = (Class)MSDDownloadFileRequest;
  if (![(MSDCDNServerRequest *)&v9 isValid]) {
    return 0;
  }
  v3 = [(MSDDownloadFileRequest *)self fileInfo];
  v4 = [v3 fileHash];
  if (v4)
  {
    v5 = [(MSDServerRequest *)self savePath];
    if (v5)
    {
      objc_super v6 = [(MSDServerRequest *)self completion];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = [(MSDServerRequest *)self getName];
  v4 = [(MSDDownloadFileRequest *)self fileInfo];
  v5 = [v4 fileHash];
  objc_super v6 = [(MSDServerRequest *)self savePath];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: hash=%@; toPath=%@",
    v3,
    v5,
  BOOL v7 = v6);

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSFileManager defaultManager];
  v39.receiver = self;
  v39.super_class = (Class)MSDDownloadFileRequest;
  objc_super v9 = [(MSDServerRequest *)&v39 parseResponseForError:v7 andPayload:v6];

  v10 = [v9 error];

  if (v10)
  {
    id v20 = 0;
    v12 = 0;
  }
  else
  {
    v11 = [v6 objectForKey:@"fileSize"];
    v12 = v11;
    if (v11) {
      id v13 = [v11 integerValue];
    }
    else {
      id v13 = 0;
    }
    [v9 setDownloadedSize:v13];
    v14 = [(MSDDownloadFileRequest *)self fileInfo];
    v15 = [(MSDServerRequest *)self savePath];
    unsigned __int8 v16 = [v14 hashCheckForFile:v15];

    if (v16)
    {
      v17 = [(MSDDownloadFileRequest *)self fileInfo];
      v18 = [(MSDServerRequest *)self savePath];
      unsigned __int8 v19 = [v17 entitlementCheckForFile:v18];

      if (v19)
      {
        id v20 = 0;
        goto LABEL_8;
      }
      uint64_t v37 = 0;
      CFStringRef v33 = @"Some file(s) are not allowed to install.";
      v34 = (id *)&v37;
      v35 = &v37;
      uint64_t v32 = 3727740932;
    }
    else
    {
      uint64_t v38 = 0;
      uint64_t v32 = 3727740946;
      CFStringRef v33 = @"Some file(s) are corrupted.";
      v34 = (id *)&v38;
      v35 = &v38;
    }
    sub_1000C3140(v35, v32, (uint64_t)v33);
    id v20 = *v34;
  }
LABEL_8:
  v21 = [v9 error];

  if (!v21) {
    [v9 setError:v20];
  }
  if (v20)
  {
    v22 = [(MSDServerRequest *)self savePath];
    unsigned int v23 = [v8 fileExistsAtPath:v22];

    if (v23)
    {
      v24 = sub_100068600();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [(MSDServerRequest *)self savePath];
        *(_DWORD *)buf = 138543362;
        v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Hash check or entitlement check for %{public}@ failed, deleting file", buf, 0xCu);
      }
      v26 = +[NSFileManager defaultManager];
      v27 = [(MSDServerRequest *)self savePath];
      id v36 = 0;
      unsigned __int8 v28 = [v26 removeItemAtPath:v27 error:&v36];
      id v29 = v36;

      if ((v28 & 1) == 0)
      {
        v30 = sub_100068600();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1000CFF14(self, v30);
        }
      }
    }
  }

  return v9;
}

- (MSDFileDownloadInfo)fileInfo
{
  return (MSDFileDownloadInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileInfo:(id)a3
{
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (double)dispatchTime
{
  return self->_dispatchTime;
}

- (void)setDispatchTime:(double)a3
{
  self->_dispatchTime = a3;
}

- (void).cxx_destruct
{
}

@end