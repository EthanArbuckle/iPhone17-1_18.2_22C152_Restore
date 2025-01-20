@interface ICSuzeLeaseResponse
- (ICSuzeLeaseResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4;
- (NSData)clientData;
- (NSDate)leaseExpirationDate;
- (NSDictionary)responseDictionary;
@end

@implementation ICSuzeLeaseResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);

  objc_storeStrong((id *)&self->_requestDate, 0);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSDate)leaseExpirationDate
{
  v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"lease-duration"];
  char v4 = objc_opt_respondsToSelector();
  double v5 = 0.0;
  if (v4) {
    objc_msgSend(v3, "doubleValue", 0.0);
  }
  if (v5 < 30.0) {
    double v5 = 30.0;
  }
  v6 = [(NSDate *)self->_requestDate dateByAddingTimeInterval:v5];

  return (NSDate *)v6;
}

- (NSData)clientData
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"client-data"];
  if (_NSIsNSData())
  {
    id v3 = v2;
LABEL_5:
    char v4 = v3;
    goto LABEL_7;
  }
  if (_NSIsNSString())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
    goto LABEL_5;
  }
  char v4 = 0;
LABEL_7:

  return (NSData *)v4;
}

- (ICSuzeLeaseResponse)initWithResponseDictionary:(id)a3 requestDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICSuzeLeaseResponse;
  v8 = [(ICSuzeLeaseResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    requestDate = v8->_requestDate;
    v8->_requestDate = (NSDate *)v9;

    uint64_t v11 = [v6 copy];
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v11;
  }
  return v8;
}

@end