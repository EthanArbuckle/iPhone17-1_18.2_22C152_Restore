@interface KTClientRequest
- (KTClientRequest)initWithType:(unint64_t)a3 application:(id)a4 uri:(id)a5 accountKey:(id)a6 serverLoggableDatas:(id)a7;
- (NSArray)clientLoggableDatas;
- (NSArray)serverLoggableDatas;
- (NSData)accountKey;
- (NSData)queryRequest;
- (NSData)queryResponse;
- (NSString)application;
- (NSString)uri;
- (id)addValidateRequest:(id)a3 dataStore:(id)a4 error:(id *)a5;
- (unint64_t)type;
- (void)setAccountKey:(id)a3;
- (void)setApplication:(id)a3;
- (void)setClientLoggableDatas:(id)a3;
- (void)setQueryRequest:(id)a3;
- (void)setQueryResponse:(id)a3;
- (void)setServerLoggableDatas:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUri:(id)a3;
@end

@implementation KTClientRequest

- (KTClientRequest)initWithType:(unint64_t)a3 application:(id)a4 uri:(id)a5 accountKey:(id)a6 serverLoggableDatas:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)KTClientRequest;
  v16 = [(KTClientRequest *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(KTClientRequest *)v16 setType:a3];
    [(KTClientRequest *)v17 setApplication:v12];
    [(KTClientRequest *)v17 setUri:v13];
    [(KTClientRequest *)v17 setAccountKey:v14];
    [(KTClientRequest *)v17 setServerLoggableDatas:v15];
  }

  return v17;
}

- (id)addValidateRequest:(id)a3 dataStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1001E0368;
  v29 = sub_1001E0378;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1001E0368;
  v23 = sub_1001E0378;
  id v24 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E0380;
  v14[3] = &unk_1002C7E50;
  v14[4] = self;
  v17 = &v25;
  id v9 = a4;
  id v15 = v9;
  v18 = &v19;
  id v10 = v8;
  id v16 = v10;
  [v9 performBlockAndWait:v14];
  if (a5)
  {
    v11 = (void *)v20[5];
    if (v11) {
      *a5 = v11;
    }
  }
  id v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUri:(id)a3
{
}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccountKey:(id)a3
{
}

- (NSArray)serverLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerLoggableDatas:(id)a3
{
}

- (NSArray)clientLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientLoggableDatas:(id)a3
{
}

- (NSData)queryRequest
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueryRequest:(id)a3
{
}

- (NSData)queryResponse
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueryResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResponse, 0);
  objc_storeStrong((id *)&self->_queryRequest, 0);
  objc_storeStrong((id *)&self->_clientLoggableDatas, 0);
  objc_storeStrong((id *)&self->_serverLoggableDatas, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
  objc_storeStrong((id *)&self->_uri, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end