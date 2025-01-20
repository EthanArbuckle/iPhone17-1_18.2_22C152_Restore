@interface ISURLRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ISURLRequest)init;
- (ISURLRequest)initWithCoder:(id)a3;
- (ISURLRequest)initWithRequestProperties:(id)a3;
- (ISURLRequest)initWithURL:(id)a3;
- (ISURLRequest)initWithURLRequest:(id)a3;
- (NSArray)URLs;
- (NSData)HTTPBody;
- (NSDictionary)customHeaders;
- (NSDictionary)queryStringDictionary;
- (NSInputStream)HTTPBodyStream;
- (NSString)HTTPMethod;
- (NSString)appleClientApplication;
- (NSURL)primaryURL;
- (double)timeoutInterval;
- (id)_initCommon;
- (id)copyWithZone:(_NSZone *)a3;
- (id)requestProperties;
- (int64_t)URLBagType;
- (int64_t)allowedRetryCount;
- (int64_t)expectedContentLength;
- (unint64_t)cachePolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedRetryCount:(int64_t)a3;
- (void)setAppleClientApplication:(id)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setCustomHeaders:(id)a3;
- (void)setExpectedContentLength:(int64_t)a3;
- (void)setHTTPBody:(id)a3;
- (void)setHTTPBodyStream:(id)a3;
- (void)setHTTPMethod:(id)a3;
- (void)setQueryStringDictionary:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setURLBagType:(int64_t)a3;
- (void)setURLs:(id)a3;
- (void)setValue:(id)a3 forHeaderField:(id)a4;
- (void)setValue:(id)a3 forQueryStringParameter:(id)a4;
@end

@implementation ISURLRequest

- (id)_initCommon
{
  v8.receiver = self;
  v8.super_class = (Class)ISURLRequest;
  v2 = [(ISURLRequest *)&v8 init];
  if (v2)
  {
    v3 = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x263F7B290]);
    properties = v2->_properties;
    v2->_properties = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v5;
  }
  return v2;
}

- (ISURLRequest)init
{
  return [(ISURLRequest *)self initWithURL:0];
}

- (ISURLRequest)initWithRequestProperties:(id)a3
{
  id v4 = a3;
  v5 = [(ISURLRequest *)self _initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    properties = v5->_properties;
    v5->_properties = (SSMutableURLRequestProperties *)v6;
  }
  return v5;
}

- (ISURLRequest)initWithURLRequest:(id)a3
{
  id v4 = a3;
  v5 = [(ISURLRequest *)self _initCommon];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F7B290]) initWithURLRequest:v4];
    properties = v5->_properties;
    v5->_properties = (SSMutableURLRequestProperties *)v6;
  }
  return v5;
}

- (ISURLRequest)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(ISURLRequest *)self _initCommon];
  uint64_t v6 = (ISURLRequest *)v5;
  if (v5) {
    [v5[2] setURL:v4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  int v6 = [v5 allowsKeyedCoding];
  properties = self->_properties;
  if (v6) {
    [v5 encodeObject:properties forKey:@"properties"];
  }
  else {
    [v5 encodeObject:properties];
  }

  objc_super v8 = self->_lock;

  [(NSLock *)v8 unlock];
}

- (ISURLRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ISURLRequest *)self _initCommon];
  if (v5)
  {
    if (![v4 allowsKeyedCoding])
    {
      uint64_t v8 = [v4 decodeObject];
      properties = v5->_properties;
      v5->_properties = (SSMutableURLRequestProperties *)v8;
LABEL_9:

      goto LABEL_10;
    }
    if ([v4 containsValueForKey:@"properties"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"properties"];
      v7 = v5->_properties;
      v5->_properties = (SSMutableURLRequestProperties *)v6;
    }
    else
    {
      -[SSMutableURLRequestProperties setAllowedRetryCount:](v5->_properties, "setAllowedRetryCount:", [v4 decodeIntegerForKey:@"retryCount"]);
      -[SSMutableURLRequestProperties setCachePolicy:](v5->_properties, "setCachePolicy:", [v4 decodeIntegerForKey:@"cachePolicy"]);
      v10 = v5->_properties;
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
      [(SSMutableURLRequestProperties *)v10 setHTTPBody:v11];

      v12 = v5->_properties;
      v13 = (void *)MEMORY[0x263EFFA08];
      uint64_t v14 = objc_opt_class();
      v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      v16 = [v4 decodeObjectOfClasses:v15 forKey:@"headers"];
      [(SSMutableURLRequestProperties *)v12 setHTTPHeaders:v16];

      v17 = v5->_properties;
      v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"method"];
      [(SSMutableURLRequestProperties *)v17 setHTTPMethod:v18];

      v19 = v5->_properties;
      v20 = (void *)MEMORY[0x263EFFA08];
      uint64_t v21 = objc_opt_class();
      v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
      v23 = [v4 decodeObjectOfClasses:v22 forKey:@"query"];
      [(SSMutableURLRequestProperties *)v19 setRequestParameters:v23];

      v24 = v5->_properties;
      [v4 decodeDoubleForKey:@"timeout"];
      [(SSMutableURLRequestProperties *)v24 setTimeoutInterval:"setTimeoutInterval:"];
    }
    if ([v4 containsValueForKey:@"urls"])
    {
      -[SSMutableURLRequestProperties setExpectedContentLength:](v5->_properties, "setExpectedContentLength:", [v4 decodeInt64ForKey:@"expectedlength"]);
      -[SSMutableURLRequestProperties setURLBagType:](v5->_properties, "setURLBagType:", [v4 decodeIntegerForKey:@"bagtype"]);
      v25 = v5->_properties;
      v26 = (void *)MEMORY[0x263EFFA08];
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      properties = objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
      v29 = [v4 decodeObjectOfClasses:properties forKey:@"urls"];
      [(SSMutableURLRequestProperties *)v25 setURLs:v29];

      goto LABEL_9;
    }
  }
LABEL_10:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(NSLock *)self->_lock lock];
  uint64_t v6 = [(SSMutableURLRequestProperties *)self->_properties mutableCopyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  [(NSLock *)self->_lock unlock];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ISURLRequest *)self requestProperties];
    uint64_t v6 = [v4 requestProperties];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)requestWithURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

- (int64_t)allowedRetryCount
{
  return [(SSMutableURLRequestProperties *)self->_properties allowedRetryCount];
}

- (NSString)appleClientApplication
{
  return (NSString *)[(SSMutableURLRequestProperties *)self->_properties clientIdentifier];
}

- (unint64_t)cachePolicy
{
  return [(SSMutableURLRequestProperties *)self->_properties cachePolicy];
}

- (NSDictionary)customHeaders
{
  return (NSDictionary *)[(SSMutableURLRequestProperties *)self->_properties HTTPHeaders];
}

- (int64_t)expectedContentLength
{
  return [(SSMutableURLRequestProperties *)self->_properties expectedContentLength];
}

- (NSData)HTTPBody
{
  return (NSData *)[(SSMutableURLRequestProperties *)self->_properties HTTPBody];
}

- (NSInputStream)HTTPBodyStream
{
  return (NSInputStream *)[(SSMutableURLRequestProperties *)self->_properties HTTPBodyStream];
}

- (NSString)HTTPMethod
{
  return (NSString *)[(SSMutableURLRequestProperties *)self->_properties HTTPMethod];
}

- (NSDictionary)queryStringDictionary
{
  return (NSDictionary *)[(SSMutableURLRequestProperties *)self->_properties requestParameters];
}

- (NSURL)primaryURL
{
  return (NSURL *)[(SSMutableURLRequestProperties *)self->_properties URL];
}

- (void)setAllowedRetryCount:(int64_t)a3
{
}

- (void)setAppleClientApplication:(id)a3
{
}

- (void)setCachePolicy:(unint64_t)a3
{
}

- (void)setCustomHeaders:(id)a3
{
}

- (void)setExpectedContentLength:(int64_t)a3
{
}

- (void)setHTTPBody:(id)a3
{
}

- (void)setHTTPBodyStream:(id)a3
{
}

- (void)setHTTPMethod:(id)a3
{
}

- (void)setQueryStringDictionary:(id)a3
{
}

- (void)setTimeoutInterval:(double)a3
{
}

- (void)setURLBagType:(int64_t)a3
{
}

- (void)setURLs:(id)a3
{
}

- (void)setValue:(id)a3 forHeaderField:(id)a4
{
}

- (void)setValue:(id)a3 forQueryStringParameter:(id)a4
{
}

- (double)timeoutInterval
{
  [(SSMutableURLRequestProperties *)self->_properties timeoutInterval];
  return result;
}

- (int64_t)URLBagType
{
  return [(SSMutableURLRequestProperties *)self->_properties URLBagType];
}

- (NSArray)URLs
{
  return (NSArray *)[(SSMutableURLRequestProperties *)self->_properties URLs];
}

- (id)requestProperties
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[(SSMutableURLRequestProperties *)self->_properties copy];
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end