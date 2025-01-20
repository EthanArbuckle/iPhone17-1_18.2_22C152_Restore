@interface KTLogNetworkRequest
- (NSString)application;
- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 error:(id *)a5;
- (id)initGETWithURL:(id)a3 application:(id)a4;
- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6;
- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6;
- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 completionHandler:(id)a5;
- (void)setApplication:(id)a3;
@end

@implementation KTLogNetworkRequest

- (id)initGETWithURL:(id)a3 application:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)KTLogNetworkRequest;
  id v7 = [(TransparencyNetworkRequest *)&v10 initGETWithURL:a3];
  v8 = v7;
  if (v7) {
    [v7 setApplication:v6];
  }

  return v8;
}

- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)KTLogNetworkRequest;
  id v11 = [(TransparencyNetworkRequest *)&v14 initPOSTWithURL:a3 data:a4 uuid:a5];
  v12 = v11;
  if (v11)
  {
    [v11 setApplication:v10];
    [v12 setAuthenticated:1];
  }

  return v12;
}

- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)KTLogNetworkRequest;
  id v11 = [(TransparencyNetworkRequest *)&v14 initPUSHWithURL:a3 data:a4 uuid:a5];
  v12 = v11;
  if (v11)
  {
    [v11 setApplication:v10];
    [v12 setAuthenticated:1];
  }

  return v12;
}

- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 error:(id *)a5
{
  id v7 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", a3, a5);
  v8 = ProtocolVersion_EnumDescriptor();
  v9 = [v8 textFormatNameForValue:kTransparencyProtocolVersion];

  id v10 = [(KTLogNetworkRequest *)self application];
  id v11 = +[TransparencyApplication applicationValueForIdentifier:v10];
  v12 = [v11 stringValue];

  v30[0] = @"Accept";
  v30[1] = off_1003264F8;
  v31[0] = @"application/protobuf";
  v31[1] = v12;
  v30[2] = off_100326500;
  v31[2] = v9;
  v13 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  id v14 = [v13 mutableCopy];

  v15 = +[TransparencySettings automatedDeviceGroup];
  [v14 setObject:v15 forKeyedSubscript:off_100326508];

  v16 = +[TransparencySettings transparencyVersionStr];
  [v14 setObject:v16 forKeyedSubscript:off_100326510];

  [(TransparencyNetworkRequest *)self setAdditionalHeaders:v14];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v17 = [(TransparencyNetworkRequest *)self additionalHeaders];
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v23 = [v14 objectForKeyedSubscript:v22];
        [v7 setValue:v23 forHTTPHeaderField:v22];
      }
      id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }

  [v7 setHTTPMethod:@"GET"];
  if (a4 != 0.0) {
    [v7 setTimeoutInterval:a4];
  }

  return v7;
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  id v10 = +[NSMutableDictionary dictionary];
  id v11 = [(TransparencyNetworkRequest *)self additionalHeaders];

  if (v11)
  {
    v12 = [(TransparencyNetworkRequest *)self additionalHeaders];
    uint64_t v13 = +[NSMutableDictionary dictionaryWithDictionary:v12];

    id v10 = (void *)v13;
  }
  id v14 = [(KTLogNetworkRequest *)self application];
  v15 = +[TransparencyApplication applicationValueForIdentifier:v14];
  v16 = [v15 stringValue];

  [v10 setObject:v16 forKeyedSubscript:off_1003264F8];
  v17 = +[TransparencySettings automatedDeviceGroup];
  [v10 setObject:v17 forKeyedSubscript:off_100326508];

  id v18 = +[TransparencySettings transparencyVersionStr];
  [v10 setObject:v18 forKeyedSubscript:off_100326510];

  unint64_t v19 = [(TransparencyNetworkRequest *)self httpMethod];
  if (v19 - 1 >= 2)
  {
    if (!v19)
    {
      uint64_t v20 = [(TransparencyNetworkRequest *)self url];
      +[TransparencySettings defaultNetworkTimeout];
      id v24 = 0;
      v21 = -[KTLogNetworkRequest createGETRequestForURL:timeout:error:](self, "createGETRequestForURL:timeout:error:", v20, &v24);
      id v22 = v24;

      v9[2](v9, v21, v22);
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)KTLogNetworkRequest;
    [(TransparencyNetworkRequest *)&v23 createRequestForAuthentication:v8 fetchAuthNow:v6 additionalHeaders:v10 completionHandler:v9];
  }
}

- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end