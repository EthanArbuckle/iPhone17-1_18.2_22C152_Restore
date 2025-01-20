@interface APServerRetryRequester
- (APServerRequest)serverRequest;
- (Class)responseClass;
- (id)buildURLForRequestProtobuf:(id)a3;
- (id)headers;
- (id)initFromServerRequest:(id)a3;
- (id)protoBuffer;
- (int64_t)responseResult;
- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5;
- (void)setResponseResult:(int64_t)a3;
- (void)setServerRequest:(id)a3;
@end

@implementation APServerRetryRequester

- (id)initFromServerRequest:(id)a3
{
  id v5 = a3;
  v6 = sub_1000E848C((uint64_t)v5);
  v7 = sub_1000E8480((uint64_t)v5);
  v8 = +[APIDAccountProvider privateUserAccount];
  v11.receiver = self;
  v11.super_class = (Class)APServerRetryRequester;
  v9 = [(APServerRequester *)&v11 initWithBundleID:v6 requestIdentifier:v7 contextIdentifier:0 contentIdentifier:0 idAccount:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_serverRequest, a3);
  }

  return v9;
}

- (id)headers
{
  v2 = [(APServerRetryRequester *)self serverRequest];
  v3 = sub_1000E84A4((uint64_t)v2);

  return v3;
}

- (Class)responseClass
{
  v2 = [(APServerRetryRequester *)self serverRequest];
  v3 = sub_1000E84BC((uint64_t)v2);

  return (Class)v3;
}

- (id)protoBuffer
{
  v2 = [(APServerRetryRequester *)self serverRequest];
  v3 = sub_1000E84B0((uint64_t)v2);

  return v3;
}

- (id)buildURLForRequestProtobuf:(id)a3
{
  v3 = [(APServerRetryRequester *)self serverRequest];
  v4 = sub_1000E8498((uint64_t)v3);

  return v4;
}

- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5
{
  int64_t v6 = +[APLegacyMetricRetryManager resultForResponse:a3 error:a5];

  [(APServerRetryRequester *)self setResponseResult:v6];
}

- (int64_t)responseResult
{
  return self->_responseResult;
}

- (void)setResponseResult:(int64_t)a3
{
  self->_responseResult = a3;
}

- (APServerRequest)serverRequest
{
  return self->_serverRequest;
}

- (void)setServerRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end