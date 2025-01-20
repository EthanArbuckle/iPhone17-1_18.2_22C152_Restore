@interface TransparencyNetworkRequest
+ (BOOL)addAccountAuthentication:(id)a3 error:(id *)a4;
+ (void)addDeviceAuthentication:(id)a3 signature:(id)a4 timestamp:(id)a5 certs:(id)a6;
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
- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 additionalHeaders:(id)a6 completionHandler:(id)a7;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6;
- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 additionalHeaders:(id)a6 completionHandler:(id)a7;
- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 authentication:(id)a6 fetchAuthNow:(BOOL)a7 timeShift:(double)a8 additionalHeaders:(id)a9 completionHandler:(id)a10;
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

+ (BOOL)addAccountAuthentication:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[TransparencyAccount authToken:a4];
  if (v6)
  {
    [v5 setValue:v6 forHTTPHeaderField:@"Authorization"];
  }
  else
  {
    if (qword_10032EE08 != -1) {
      dispatch_once(&qword_10032EE08, &stru_1002C3808);
    }
    v7 = qword_10032EE10;
    if (os_log_type_enabled((os_log_t)qword_10032EE10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "account authentication failed as well", v9, 2u);
    }
  }

  return v6 != 0;
}

+ (void)addDeviceAuthentication:(id)a3 signature:(id)a4 timestamp:(id)a5 certs:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[NSMutableData data];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        CFDataRef v19 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v23 + 1) + 8 * (void)v18));
        [v13 appendData:v19];

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  v20 = [v13 base64EncodedStringWithOptions:0];
  [v9 setValue:v20 forHTTPHeaderField:@"X-Apple-Baa-Certs"];
  v21 = [v10 base64EncodedStringWithOptions:0];
  v22 = +[NSString stringWithFormat:@"%@:%@", v21, v11, (void)v23];

  [v9 setValue:v22 forHTTPHeaderField:@"X-Apple-Baa-Signature"];
}

- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 authentication:(id)a6 fetchAuthNow:(BOOL)a7 timeShift:(double)a8 additionalHeaders:(id)a9 completionHandler:(id)a10
{
  BOOL v45 = a7;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  id v21 = +[NSMutableURLRequest requestWithURL:a3];
  v22 = [(TransparencyNetworkRequest *)self uuid];
  long long v23 = [v22 UUIDString];
  [v21 setValue:v23 forHTTPHeaderField:off_1003264F0];

  long long v24 = ProtocolVersion_EnumDescriptor();
  uint64_t v25 = [v24 textFormatNameForValue:kTransparencyProtocolVersion];

  v46 = (void *)v25;
  [v21 setValue:v25 forHTTPHeaderField:off_100326500];
  long long v26 = +[TransparencySettings transparencyVersionStr];
  [v21 setValue:v26 forHTTPHeaderField:off_100326510];

  [v21 setHTTPBody:v17];
  unint64_t v27 = [(TransparencyNetworkRequest *)self httpMethod];
  if (v27 == 1)
  {
    CFStringRef v28 = @"POST";
  }
  else
  {
    if (v27 != 2) {
      goto LABEL_6;
    }
    CFStringRef v28 = @"PUSH";
  }
  [v21 setHTTPMethod:v28];
LABEL_6:
  v47 = (void (**)(void, void, void))v20;
  v29 = v18;
  id v30 = v17;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v31 = v19;
  id v32 = [v31 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v53;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v53 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        v37 = [v31 objectForKeyedSubscript:v36];
        [v21 setValue:v37 forHTTPHeaderField:v36];
      }
      id v33 = [v31 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v33);
  }

  v38 = +[TransparencySettings automatedDeviceGroup];
  if (v38) {
    [v21 setValue:v38 forHTTPHeaderField:off_100326508];
  }
  v39 = v30;
  if (a4 != 0.0) {
    [v21 setTimeoutInterval:a4];
  }
  v40 = v29;
  if ([(TransparencyNetworkRequest *)self authenticated])
  {
    unsigned int v41 = [v29 isSupported];
    v42 = v47;
    if (v41)
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10017B788;
      v49[3] = &unk_1002C3850;
      v51 = v47;
      id v21 = v21;
      id v50 = v21;
      [v40 signDataWithTimestamp:v39 fetchNow:v45 timeShift:v49 completionHandler:a8];
    }
    else
    {
      id v48 = 0;
      unsigned __int8 v43 = +[TransparencyNetworkRequest addAccountAuthentication:v21 error:&v48];
      id v44 = v48;
      if ((v43 & 1) == 0)
      {

        id v21 = 0;
      }
      ((void (**)(void, id, id))v47)[2](v47, v21, v44);
    }
  }
  else
  {
    v42 = v47;
    ((void (**)(void, id, void))v47)[2](v47, v21, 0);
  }
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

  id v17 = +[TransparencySettings automatedDeviceGroup];
  if (v17) {
    [v9 setValue:v17 forHTTPHeaderField:off_100326508];
  }
  if (a4 != 0.0) {
    [v9 setTimeoutInterval:a4];
  }

  return v9;
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 additionalHeaders:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = (void (**)(id, void *, id))a7;
  unint64_t v15 = [(TransparencyNetworkRequest *)self httpMethod];
  if (v15 - 1 < 2)
  {
    id v16 = [(TransparencyNetworkRequest *)self url];
    +[TransparencySettings defaultNetworkTimeout];
    double v18 = v17;
    long long v19 = [(TransparencyNetworkRequest *)self data];
    [(TransparencyNetworkRequest *)self createRequestForURL:v16 timeout:v19 contents:v12 authentication:v10 fetchAuthNow:v13 timeShift:v14 additionalHeaders:v18 completionHandler:a5];

LABEL_5:
    goto LABEL_6;
  }
  if (!v15)
  {
    long long v20 = [(TransparencyNetworkRequest *)self url];
    +[TransparencySettings defaultNetworkTimeout];
    id v22 = 0;
    long long v21 = -[TransparencyNetworkRequest createGETRequestForURL:timeout:additionalHeaders:error:](self, "createGETRequestForURL:timeout:additionalHeaders:error:", v20, v13, &v22);
    id v16 = v22;

    v14[2](v14, v21, v16);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6
{
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(TransparencyNetworkRequest *)self additionalHeaders];
  [(TransparencyNetworkRequest *)self createRequestForAuthentication:v11 fetchAuthNow:v7 timeShift:v12 additionalHeaders:v10 completionHandler:a5];
}

- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TransparencyNetworkRequest *)self additionalHeaders];
  [(TransparencyNetworkRequest *)self createRequestForAuthentication:v7 fetchAuthNow:0 timeShift:v8 additionalHeaders:v6 completionHandler:0.0];
}

- (id)initGETWithURL:(id)a3
{
  id v4 = a3;
  +[TransparencySettings defaultNetworkTimeout];
  id v5 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v4, 0, 0, 0);

  return v5;
}

- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[TransparencySettings defaultNetworkTimeout];
  id v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v10, v9, 1, v8);

  return v11;
}

- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[TransparencySettings defaultNetworkTimeout];
  id v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v10, v9, 2, v8);

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
    id v16 = [(TransparencyNetworkRequest *)&v19 init];
    double v17 = v16;
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
    unint64_t v15 = self;
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (TransparencyNetworkRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 URL];
  id v6 = [v4 HTTPBody];
  id v7 = [v4 HTTPMethod];
  unsigned int v8 = [v7 isEqualToString:@"GET"];

  if (v8)
  {
    self = (TransparencyNetworkRequest *)[(TransparencyNetworkRequest *)self initGETWithURL:v5];
LABEL_15:
    double v17 = [v4 allHTTPHeaderFields];
    [(TransparencyNetworkRequest *)self setAdditionalHeaders:v17];

    unint64_t v15 = self;
    goto LABEL_16;
  }
  id v9 = [v4 HTTPMethod];
  unsigned int v10 = [v9 isEqualToString:@"POST"];

  if (v10)
  {
    id v11 = [v4 valueForHTTPHeaderField:off_1003264F0];
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
    id v11 = [v4 valueForHTTPHeaderField:off_1003264F0];
    if (v11) {
      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
    }
    else {
      id v12 = 0;
    }
    id v16 = [(TransparencyNetworkRequest *)self initPUSHWithURL:v5 data:v6 uuid:v12];
    goto LABEL_14;
  }
  unint64_t v15 = 0;
LABEL_16:

  return v15;
}

- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 additionalHeaders:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = (void (**)(id, void *, void))a7;
  unint64_t v15 = +[NSMutableURLRequest requestWithURL:a3];
  id v16 = [(TransparencyNetworkRequest *)self uuid];
  double v17 = [v16 UUIDString];
  [v15 setValue:v17 forHTTPHeaderField:off_1003264F0];

  double v18 = ProtocolVersion_EnumDescriptor();
  objc_super v19 = [v18 textFormatNameForValue:kTransparencyProtocolVersion];

  [v15 setValue:v19 forHTTPHeaderField:off_100326500];
  long long v20 = +[TransparencySettings transparencyVersionStr];
  [v15 setValue:v20 forHTTPHeaderField:off_100326510];

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

  id v30 = +[TransparencySettings automatedDeviceGroup];
  if (v30) {
    [v15 setValue:v30 forHTTPHeaderField:off_100326508];
  }
  if (a4 != 0.0) {
    [v15 setTimeoutInterval:a4];
  }
  v14[2](v14, v15, 0);
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