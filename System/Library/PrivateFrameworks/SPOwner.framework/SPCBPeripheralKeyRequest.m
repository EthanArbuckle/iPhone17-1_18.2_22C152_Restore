@interface SPCBPeripheralKeyRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)requestParameters;
- (NSDate)date;
- (SPCBPeripheralKeyRequest)initWithCoder:(id)a3;
- (SPCBPeripheralKeyRequest)initWithDate:(id)a3 requestParameters:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setRequestParameters:(id)a3;
@end

@implementation SPCBPeripheralKeyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyRequest)initWithDate:(id)a3 requestParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralKeyRequest;
  v8 = [(SPCBPeripheralKeyRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    uint64_t v11 = [v7 copy];
    requestParameters = v8->_requestParameters;
    v8->_requestParameters = (NSArray *)v11;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPCBPeripheralKeyRequest *)self date];
  [v4 encodeObject:v5 forKey:@"date"];

  id v6 = [(SPCBPeripheralKeyRequest *)self requestParameters];
  [v4 encodeObject:v6 forKey:@"requestParameters"];
}

- (SPCBPeripheralKeyRequest)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  date = self->_date;
  self->_date = v5;

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"requestParameters"];

  requestParameters = self->_requestParameters;
  self->_requestParameters = v10;

  return self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SPCBPeripheralKeyRequest *)self date];
  id v6 = [(SPCBPeripheralKeyRequest *)self requestParameters];
  id v7 = [v3 stringWithFormat:@"[%@: date=%@, paramCount=%lu]", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSArray)requestParameters
{
  return self->_requestParameters;
}

- (void)setRequestParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end