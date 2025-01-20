@interface APServerRequest
+ (BOOL)supportsSecureCoding;
- (APServerRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APServerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (self)
  {
    [v8 encodeObject:self->_requestId forKey:@"ri"];
    client = self->_client;
  }
  else
  {
    [v8 encodeObject:0 forKey:@"ri"];
    client = 0;
  }
  [v8 encodeObject:client forKey:@"c"];
  if (self)
  {
    [v8 encodeObject:self->_URL forKey:@"u"];
    headers = self->_headers;
  }
  else
  {
    [v8 encodeObject:0 forKey:@"u"];
    headers = 0;
  }
  [v8 encodeObject:headers forKey:@"h"];
  if (self)
  {
    [v8 encodeObject:self->_protoBuffer forKey:@"p"];
    responseClass = self->_responseClass;
  }
  else
  {
    [v8 encodeObject:0 forKey:@"p"];
    responseClass = 0;
  }
  v7 = NSStringFromClass(responseClass);
  [v8 encodeObject:v7 forKey:@"rc"];
}

- (APServerRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APServerRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ri"];
    requestId = v5->_requestId;
    v5->_requestId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
    client = v5->_client;
    v5->_client = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"u"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v10;

    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"h"];
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    protoBuffer = v5->_protoBuffer;
    v5->_protoBuffer = (PBCodable *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rc"];
    uint64_t v19 = NSClassFromString(v18);
    Class responseClass = v5->_responseClass;
    v5->_Class responseClass = (Class)v19;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong((id *)&self->_protoBuffer, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_requestId, 0);
}

@end