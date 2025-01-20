@interface CLHUploadRequest
- (CLHEndpointSelector)endpointSelector;
- (CLHRequestArchive)requestArchive;
- (CLHUploadRequest)initWithArchive:(id)a3;
- (CLHUploadRequest)initWithPayload:(id)a3;
- (CLHUploadRequest)initWithPayload:(id)a3 requestTypeCode:(unsigned int)a4 endpoint:(id)a5 headers:(id)a6;
- (CLHUploadRequest)initWithRequest:(id)a3 endpoint:(id)a4 headers:(id)a5;
- (NSDictionary)headers;
- (NSURL)endpoint;
- (NSURLRequest)URLRequest;
- (id)description;
- (id)jsonObject;
- (unsigned)requestTypeCode;
- (void)dealloc;
- (void)setEndpoint:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setRequestTypeCode:(unsigned int)a3;
@end

@implementation CLHUploadRequest

- (CLHUploadRequest)initWithPayload:(id)a3 requestTypeCode:(unsigned int)a4 endpoint:(id)a5 headers:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CLHUploadRequest;
  v10 = [(CLHUploadRequest *)&v12 init];
  if (v10)
  {
    v10->_payload = (NSData *)a3;
    v10->_requestTypeCode = a4;
    v10->_endpoint = (NSURL *)a5;
    v10->_headers = (NSDictionary *)a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHUploadRequest;
  [(CLHUploadRequest *)&v3 dealloc];
}

- (CLHUploadRequest)initWithRequest:(id)a3 endpoint:(id)a4 headers:(id)a5
{
  id v9 = objc_alloc_init((Class)PBDataWriter);
  [a3 writeTo:v9];
  v10 = -[CLHUploadRequest initWithPayload:requestTypeCode:endpoint:headers:](self, "initWithPayload:requestTypeCode:endpoint:headers:", [v9 immutableData], objc_msgSend(a3, "requestTypeCode"), a4, a5);

  return v10;
}

- (CLHUploadRequest)initWithArchive:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLHUploadRequest;
  v4 = [(CLHUploadRequest *)&v6 init];
  if (v4) {
    v4->_requestArchive = (CLHRequestArchive *)a3;
  }
  return v4;
}

- (CLHUploadRequest)initWithPayload:(id)a3
{
  return [(CLHUploadRequest *)self initWithPayload:a3 requestTypeCode:0 endpoint:0 headers:0];
}

- (NSURLRequest)URLRequest
{
  id v3 = objc_alloc_init((Class)NSMutableURLRequest);
  [v3 setURL:self->_endpoint];
  [v3 setHTTPMethod:@"POST"];
  [v3 setTimeoutInterval:60.0];
  headers = self->_headers;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10134C154;
  v10[3] = &unk_1023217A0;
  v10[4] = v3;
  [(NSDictionary *)headers enumerateKeysAndObjectsUsingBlock:v10];
  requestArchive = self->_requestArchive;
  if (requestArchive)
  {
    payload = [(CLHRequestArchive *)requestArchive mappedDataByDestructivelyCombiningPrimaryAndSecondaryData];
  }
  else
  {
    payload = self->_payload;
    if (!payload)
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023217C0);
      }
      v7 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Request archive and Payload both were nil for upload request", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1023217C0);
        }
        id v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHUploadRequest URLRequest]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      payload = 0;
    }
  }
  [v3 setHTTPBody:payload];
  return (NSURLRequest *)v3;
}

- (id)jsonObject
{
  requestArchive = self->_requestArchive;
  CFStringRef v4 = @"archive";
  v5 = requestArchive;
  return +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
}

- (id)description
{
  return +[NSString stringWithFormat:@"requestCode: %d, itemCount: %lu", [(CLHRequestArchive *)self->_requestArchive requestCode], [(CLHRequestArchive *)self->_requestArchive count]];
}

- (unsigned)requestTypeCode
{
  return self->_requestTypeCode;
}

- (void)setRequestTypeCode:(unsigned int)a3
{
  self->_requestTypeCode = a3;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (CLHEndpointSelector)endpointSelector
{
  return self->_endpointSelector;
}

- (CLHRequestArchive)requestArchive
{
  return self->_requestArchive;
}

@end