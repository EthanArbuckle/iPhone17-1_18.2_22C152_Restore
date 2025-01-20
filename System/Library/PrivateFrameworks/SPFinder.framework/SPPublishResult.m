@interface SPPublishResult
+ (BOOL)supportsSecureCoding;
- (NSData)aaaPubKeyHash;
- (NSUUID)requestUUID;
- (SPPublishResult)initWithCoder:(id)a3;
- (SPPublishResult)initWithRequestUUID:(id)a3 aaaPubKeyHash:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAaaPubKeyHash:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation SPPublishResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPublishResult)initWithRequestUUID:(id)a3 aaaPubKeyHash:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPPublishResult;
  v9 = [(SPPublishResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestUUID, a3);
    objc_storeStrong((id *)&v10->_aaaPubKeyHash, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  requestUUID = self->_requestUUID;
  id v5 = a3;
  [v5 encodeObject:requestUUID forKey:@"requestUUID"];
  [v5 encodeObject:self->_aaaPubKeyHash forKey:@"aaaPubKeyHash"];
}

- (SPPublishResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUUID"];
  requestUUID = self->_requestUUID;
  self->_requestUUID = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aaaPubKeyHash"];

  aaaPubKeyHash = self->_aaaPubKeyHash;
  self->_aaaPubKeyHash = v7;

  return self;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSData)aaaPubKeyHash
{
  return self->_aaaPubKeyHash;
}

- (void)setAaaPubKeyHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaaPubKeyHash, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end