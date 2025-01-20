@interface MSDDownloadManifestRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)manifestInfo;
- (NSString)originServer;
- (id)getQueryItems;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setManifestInfo:(id)a3;
- (void)setOriginServer:(id)a3;
@end

@implementation MSDDownloadManifestRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDDownloadManifestRequest;
  if (![(MSDCommandServerRequest *)&v6 isValid]) {
    return 0;
  }
  v3 = [(MSDDownloadManifestRequest *)self manifestInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getQueryItems
{
  if ([(MSDDownloadManifestRequest *)self isValid])
  {
    v3 = +[NSMutableArray arrayWithCapacity:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [(MSDDownloadManifestRequest *)self manifestInfo];
    id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v9 = [(MSDDownloadManifestRequest *)self manifestInfo];
          v10 = [v9 objectForKey:v8];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [v10 stringValue];

            v10 = (void *)v11;
          }
          v12 = +[NSURLQueryItem queryItemWithName:v8 value:v10];
          [v3 addObject:v12];
        }
        id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MSDDownloadManifestRequest;
  uint64_t v8 = [(MSDServerRequest *)&v21 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    id v20 = v6;
    v10 = [(MSDCommandServerRequest *)self getDataDictFromPayload:v7 error:&v20];
    id v11 = v20;

    if (v10)
    {
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(MSDServerRequest *)self getName];
        *(_DWORD *)buf = 138543618;
        v23 = v13;
        __int16 v24 = 2114;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Details to download files are: %{public}@", buf, 0x16u);
      }
      uint64_t v14 = [v10 objectForKey:@"FileName"];
      if (v14)
      {
        long long v15 = (void *)v14;
        [v8 setFileName:v14];
        long long v16 = [v10 objectForKey:@"OriginServer"];
        [v8 setOriginServer:v16];
      }
      else
      {
        id v19 = v11;
        sub_1000C3140(&v19, 3727744512, @"Unexpected server response.");
        long long v15 = v11;
        id v11 = v19;
      }
    }
    id v6 = v11;
  }
  long long v17 = [v8 error];

  if (!v17) {
    [v8 setError:v6];
  }

  return v8;
}

- (NSDictionary)manifestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setManifestInfo:(id)a3
{
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOriginServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originServer, 0);

  objc_storeStrong((id *)&self->_manifestInfo, 0);
}

@end