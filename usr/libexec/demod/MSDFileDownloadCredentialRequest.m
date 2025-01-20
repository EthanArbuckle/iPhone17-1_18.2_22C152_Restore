@interface MSDFileDownloadCredentialRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)manifestInfo;
- (id)getQueryItems;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setManifestInfo:(id)a3;
@end

@implementation MSDFileDownloadCredentialRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDFileDownloadCredentialRequest;
  if (![(MSDCommandServerRequest *)&v6 isValid]) {
    return 0;
  }
  v3 = [(MSDFileDownloadCredentialRequest *)self manifestInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getQueryItems
{
  if ([(MSDFileDownloadCredentialRequest *)self isValid])
  {
    v3 = +[NSMutableArray arrayWithCapacity:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [(MSDFileDownloadCredentialRequest *)self manifestInfo];
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
          v9 = [(MSDFileDownloadCredentialRequest *)self manifestInfo];
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
  v15.receiver = self;
  v15.super_class = (Class)MSDFileDownloadCredentialRequest;
  uint64_t v8 = [(MSDServerRequest *)&v15 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (v9)
  {
    id v11 = v6;
  }
  else
  {
    id v14 = v6;
    v10 = [(MSDCommandServerRequest *)self getDataDictFromPayload:v7 error:&v14];
    id v11 = v14;

    if (v10)
    {
      [v8 setCredential:v10];
    }
  }
  v12 = [v8 error];

  if (!v12) {
    [v8 setError:v11];
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

- (void).cxx_destruct
{
}

@end