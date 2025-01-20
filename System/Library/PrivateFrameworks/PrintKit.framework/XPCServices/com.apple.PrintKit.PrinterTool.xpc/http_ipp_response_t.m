@interface http_ipp_response_t
- (http_ipp_response_t)initWithResponse:(id)a3 transportStatus:(int)a4;
- (http_ipp_response_t)initWithTransportStatus:(int)a3;
- (id)description;
- (int)transportStatus;
- (ipp_response_t)ippResponse;
- (ipp_status_t)ippStatus;
@end

@implementation http_ipp_response_t

- (http_ipp_response_t)initWithResponse:(id)a3 transportStatus:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)http_ipp_response_t;
  v8 = [(http_ipp_response_t *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ippResponse, a3);
    v9->ivar_transportStatus = a4;
  }

  return v9;
}

- (http_ipp_response_t)initWithTransportStatus:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)http_ipp_response_t;
  result = [(http_ipp_response_t *)&v5 init];
  if (result) {
    result->ivar_transportStatus = a3;
  }
  return result;
}

- (ipp_status_t)ippStatus
{
  ippResponse = self->_ippResponse;
  if (ippResponse) {
    return [(ipp_response_t *)ippResponse status];
  }
  uint64_t ivar_transportStatus = self->ivar_transportStatus;
  if (ivar_transportStatus > 6) {
    return 1280;
  }
  else {
    return dword_10006EDB4[ivar_transportStatus];
  }
}

- (id)description
{
  v3 = toString(self->ivar_transportStatus);
  ippResponse = self->_ippResponse;
  uint64_t v5 = [(http_ipp_response_t *)self ippStatus];
  v6 = "";
  if (!ippResponse) {
    v6 = "(nil) ";
  }
  id v7 = +[NSString stringWithFormat:@"<http %@, ipp status %s%x>", v3, v6, v5];

  return v7;
}

- (int)transportStatus
{
  return self->ivar_transportStatus;
}

- (ipp_response_t)ippResponse
{
  return (ipp_response_t *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end