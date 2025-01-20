@interface SEEndPointCreateAuthorizationIDResponse
+ (BOOL)supportsSecureCoding;
+ (id)withAuthorizationID:(id)a3 authorizationInterval:(double)a4 authorizationCount:(unint64_t)a5;
- (NSData)authorizationID;
- (NSNumber)authorizationCount;
- (NSNumber)authorizationInterval;
- (SEEndPointCreateAuthorizationIDResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationCount:(id)a3;
- (void)setAuthorizationID:(id)a3;
- (void)setAuthorizationInterval:(id)a3;
@end

@implementation SEEndPointCreateAuthorizationIDResponse

+ (id)withAuthorizationID:(id)a3 authorizationInterval:(double)a4 authorizationCount:(unint64_t)a5
{
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setAuthorizationID:v7];

  v9 = [NSNumber numberWithDouble:a4];
  [v8 setAuthorizationInterval:v9];

  v10 = [NSNumber numberWithUnsignedInteger:a5];
  [v8 setAuthorizationCount:v10];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SEEndPointCreateAuthorizationIDResponse *)self authorizationID];
  v5 = [v4 asHexString];
  v6 = [(SEEndPointCreateAuthorizationIDResponse *)self authorizationInterval];
  id v7 = [(SEEndPointCreateAuthorizationIDResponse *)self authorizationCount];
  v8 = [v3 stringWithFormat:@"{\n\tauthorizationID : %@,\n\tauthorizationInterval : %@\n\tauthorizationCount : %@\n}", v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SEEndPointCreateAuthorizationIDResponse *)self authorizationID];
  [v4 encodeObject:v5 forKey:@"authorizationID"];

  v6 = [(SEEndPointCreateAuthorizationIDResponse *)self authorizationInterval];
  [v4 encodeObject:v6 forKey:@"authorizationInterval"];

  id v7 = [(SEEndPointCreateAuthorizationIDResponse *)self authorizationCount];
  [v4 encodeObject:v7 forKey:@"authorizationCount"];
}

- (SEEndPointCreateAuthorizationIDResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SEEndPointCreateAuthorizationIDResponse;
  v5 = [(SEEndPointCreateAuthorizationIDResponse *)&v17 init];
  v6 = v5;
  if (v5)
  {
    id v7 = [(SEEndPointCreateAuthorizationIDResponse *)v5 authorizationID];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationID"];
    authorizationID = v6->_authorizationID;
    v6->_authorizationID = (NSData *)v8;

    v10 = [(SEEndPointCreateAuthorizationIDResponse *)v6 authorizationInterval];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationInterval"];
    authorizationInterval = v6->_authorizationInterval;
    v6->_authorizationInterval = (NSNumber *)v11;

    v13 = [(SEEndPointCreateAuthorizationIDResponse *)v6 authorizationCount];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationCount"];
    authorizationCount = v6->_authorizationCount;
    v6->_authorizationCount = (NSNumber *)v14;
  }
  return v6;
}

- (NSData)authorizationID
{
  return self->_authorizationID;
}

- (void)setAuthorizationID:(id)a3
{
}

- (NSNumber)authorizationInterval
{
  return self->_authorizationInterval;
}

- (void)setAuthorizationInterval:(id)a3
{
}

- (NSNumber)authorizationCount
{
  return self->_authorizationCount;
}

- (void)setAuthorizationCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationCount, 0);
  objc_storeStrong((id *)&self->_authorizationInterval, 0);
  objc_storeStrong((id *)&self->_authorizationID, 0);
}

@end