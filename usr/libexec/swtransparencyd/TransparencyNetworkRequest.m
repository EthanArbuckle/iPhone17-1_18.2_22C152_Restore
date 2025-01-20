@interface TransparencyNetworkRequest
- (BOOL)allowEmptyData;
- (BOOL)authenticated;
- (BOOL)useReversePush;
- (NSData)data;
- (NSDictionary)additionalHeaders;
- (NSURL)url;
- (NSUUID)uuid;
- (TransparencyNetworkRequest)initWithRequest:(id)a3;
- (TransparencyNetworkRequest)initWithURL:(id)a3 data:(id)a4 timeout:(double)a5 httpMethod:(unint64_t)a6 uuid:(id)a7;
- (double)timeout;
- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 additionalHeaders:(id)a5 error:(id *)a6;
- (id)initGETWithURL:(id)a3;
- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5;
- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5;
- (unint64_t)httpMethod;
- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 additionalHeaders:(id)a6 completionHandler:(id)a7;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAllowEmptyData:(BOOL)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setHttpMethod:(unint64_t)a3;
- (void)setTimeout:(double)a3;
- (void)setUrl:(id)a3;
- (void)setUseReversePush:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation TransparencyNetworkRequest

- (id)initGETWithURL:(id)a3
{
  id v4 = a3;
  +[TransparencySettings defaultNetworkTimeout];
  v5 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v4, 0, 0, 0);

  return v5;
}

- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[TransparencySettings defaultNetworkTimeout];
  v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v10, v9, 1, v8);

  return v11;
}

- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[TransparencySettings defaultNetworkTimeout];
  v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v10, v9, 2, v8);

  return v11;
}

- (TransparencyNetworkRequest)initWithURL:(id)a3 data:(id)a4 timeout:(double)a5 httpMethod:(unint64_t)a6 uuid:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12 && (v13 || !a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)TransparencyNetworkRequest;
    v16 = [(TransparencyNetworkRequest *)&v19 init];
    v17 = v16;
    if (v16)
    {
      [(TransparencyNetworkRequest *)v16 setUrl:v12];
      [(TransparencyNetworkRequest *)v17 setData:v13];
      [(TransparencyNetworkRequest *)v17 setTimeout:a5];
      [(TransparencyNetworkRequest *)v17 setAuthenticated:0];
      [(TransparencyNetworkRequest *)v17 setHttpMethod:a6];
      [(TransparencyNetworkRequest *)v17 setUuid:v14];
    }
    self = v17;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (TransparencyNetworkRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 URL];
  v6 = [v4 HTTPBody];
  v7 = [v4 HTTPMethod];
  unsigned int v8 = [v7 isEqualToString:@"GET"];

  if (v8)
  {
    self = (TransparencyNetworkRequest *)[(TransparencyNetworkRequest *)self initGETWithURL:v5];
LABEL_15:
    v17 = [v4 allHTTPHeaderFields];
    [(TransparencyNetworkRequest *)self setAdditionalHeaders:v17];

    v15 = self;
    goto LABEL_16;
  }
  id v9 = [v4 HTTPMethod];
  unsigned int v10 = [v9 isEqualToString:@"POST"];

  if (v10)
  {
    v11 = [v4 valueForHTTPHeaderField:off_100156D88];
    if (v11) {
      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
    }
    else {
      id v12 = 0;
    }
    id v16 = [(TransparencyNetworkRequest *)self initPOSTWithURL:v5 data:v6 uuid:v12];
LABEL_14:
    self = (TransparencyNetworkRequest *)v16;

    goto LABEL_15;
  }
  id v13 = [v4 HTTPMethod];
  unsigned int v14 = [v13 isEqualToString:@"PUSH"];

  if (v14)
  {
    v11 = [v4 valueForHTTPHeaderField:off_100156D88];
    if (v11) {
      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
    }
    else {
      id v12 = 0;
    }
    id v16 = [(TransparencyNetworkRequest *)self initPUSHWithURL:v5 data:v6 uuid:v12];
    goto LABEL_14;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 additionalHeaders:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = (void (**)(id, void *, void))a7;
  v15 = +[NSMutableURLRequest requestWithURL:a3];
  id v16 = [(TransparencyNetworkRequest *)self uuid];
  v17 = [v16 UUIDString];
  [v15 setValue:v17 forHTTPHeaderField:off_100156D88];

  v18 = ProtocolVersion_EnumDescriptor();
  objc_super v19 = [v18 textFormatNameForValue:kTransparencyProtocolVersion];

  [v15 setValue:v19 forHTTPHeaderField:off_100156D98];
  v20 = +[TransparencySettings transparencyVersionStr];
  [v15 setValue:v20 forHTTPHeaderField:off_100156DA8];

  [v15 setHTTPBody:v12];
  unint64_t v21 = [(TransparencyNetworkRequest *)self httpMethod];
  if (v21 == 1)
  {
    CFStringRef v22 = @"POST";
  }
  else
  {
    if (v21 != 2) {
      goto LABEL_6;
    }
    CFStringRef v22 = @"PUSH";
  }
  [v15 setHTTPMethod:v22];
LABEL_6:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v13;
  id v24 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v29 = [v23 objectForKeyedSubscript:v28];
        [v15 setValue:v29 forHTTPHeaderField:v28];
      }
      id v25 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v25);
  }

  v30 = +[TransparencySettings automatedDeviceGroup];
  if (v30) {
    [v15 setValue:v30 forHTTPHeaderField:off_100156DA0];
  }
  if (a4 != 0.0) {
    [v15 setTimeoutInterval:a4];
  }
  v14[2](v14, v15, 0);
}

- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 additionalHeaders:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = +[NSMutableURLRequest requestWithURL:a3];
  [v9 setHTTPMethod:@"GET"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v16 = [v10 objectForKeyedSubscript:v15];
        [v9 setValue:v16 forHTTPHeaderField:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  v17 = +[TransparencySettings automatedDeviceGroup];
  if (v17) {
    [v9 setValue:v17 forHTTPHeaderField:off_100156DA0];
  }
  if (a4 != 0.0) {
    [v9 setTimeoutInterval:a4];
  }

  return v9;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(unint64_t)a3
{
  self->_httpMethod = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (BOOL)allowEmptyData
{
  return self->_allowEmptyData;
}

- (void)setAllowEmptyData:(BOOL)a3
{
  self->_allowEmptyData = a3;
}

- (BOOL)useReversePush
{
  return self->_useReversePush;
}

- (void)setUseReversePush:(BOOL)a3
{
  self->_useReversePush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end