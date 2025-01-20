@interface NFVASResponse
+ (BOOL)validateDictionary:(id)a3;
- (BOOL)paymentSupported;
- (NFVASRequest)request;
- (NFVASResponse)initWithDictionary:(id)a3;
- (NSData)token;
- (NSData)vasData;
- (NSNumber)mobileCapabilities;
- (NSNumber)statusCode;
- (id)asDictionary;
- (id)description;
- (void)setMobileCapabilities:(id)a3;
- (void)setRequest:(id)a3;
- (void)setStatusCode:(id)a3;
- (void)setToken:(id)a3;
- (void)setVasData:(id)a3;
@end

@implementation NFVASResponse

+ (BOOL)validateDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"Token"];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
  }
  v5 = [v3 objectForKeyedSubscript:@"PassData"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
  }
  v4 = [v3 objectForKeyedSubscript:@"StatusCode"];

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
  }
  v5 = [v3 objectForKeyedSubscript:@"MobileCapabilities"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      BOOL v6 = 0;
      v4 = v5;
      goto LABEL_15;
    }
  }
  v4 = [v3 objectForKeyedSubscript:@"Request"];

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !+[NFVASRequest validateDictionary:v4])
    {
LABEL_13:
      BOOL v6 = 0;
      goto LABEL_15;
    }
  }
  BOOL v6 = 1;
LABEL_15:

  return v6;
}

- (NFVASResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NFVASResponse;
  v5 = [(NFVASResponse *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"Token"];
    token = v5->_token;
    v5->_token = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"PassData"];
    vasData = v5->_vasData;
    v5->_vasData = (NSData *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"StatusCode"];
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"MobileCapabilities"];
    mobileCapabilities = v5->_mobileCapabilities;
    v5->_mobileCapabilities = (NSNumber *)v12;

    v14 = [v4 objectForKeyedSubscript:@"Request"];
    if (v14)
    {
      v15 = [[NFVASRequest alloc] initWithDictionary:v14];
      request = v5->_request;
      v5->_request = v15;
    }
  }

  return v5;
}

- (id)asDictionary
{
  id v3 = objc_opt_new();
  id v4 = v3;
  token = self->_token;
  if (token) {
    [v3 setObject:token forKeyedSubscript:@"Token"];
  }
  vasData = self->_vasData;
  if (vasData) {
    [v4 setObject:vasData forKeyedSubscript:@"PassData"];
  }
  statusCode = self->_statusCode;
  if (statusCode) {
    [v4 setObject:statusCode forKeyedSubscript:@"StatusCode"];
  }
  mobileCapabilities = self->_mobileCapabilities;
  if (mobileCapabilities) {
    [v4 setObject:mobileCapabilities forKeyedSubscript:@"MobileCapabilities"];
  }
  request = self->_request;
  if (request)
  {
    uint64_t v10 = [(NFVASRequest *)request asDictionary];
    [v4 setObject:v10 forKeyedSubscript:@"Request"];
  }
  return v4;
}

- (BOOL)paymentSupported
{
  return ([(NSNumber *)self->_mobileCapabilities unsignedCharValue] >> 4) & 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)NFVASResponse;
  id v4 = [(NFVASResponse *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ status=0x%04x data=%@ token=%@ mobileCapabilities=%@ request=%@", v4, -[NSNumber unsignedIntValue](self->_statusCode, "unsignedIntValue"), self->_vasData, self->_token, self->_mobileCapabilities, self->_request];

  return v5;
}

- (NFVASRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSData)vasData
{
  return self->_vasData;
}

- (void)setVasData:(id)a3
{
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSNumber)mobileCapabilities
{
  return self->_mobileCapabilities;
}

- (void)setMobileCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileCapabilities, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_vasData, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end