@interface PBResponseMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isAuthorizationAdmonished;
- (PBResponseMetadata)initWithAuthorizationStartTime:(unint64_t)a3 authorizationEndTime:(unint64_t)a4 authorizationAdmonished:(BOOL)a5;
- (PBResponseMetadata)initWithCoder:(id)a3;
- (unint64_t)authorizationMachAbsoluteEndTime;
- (unint64_t)authorizationMachAbsoluteStartTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBResponseMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBResponseMetadata)initWithAuthorizationStartTime:(unint64_t)a3 authorizationEndTime:(unint64_t)a4 authorizationAdmonished:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PBResponseMetadata;
  result = [(PBResponseMetadata *)&v9 init];
  if (result)
  {
    result->_authorizationMachAbsoluteStartTime = a3;
    result->_authorizationMachAbsoluteEndTime = a4;
    result->_authorizationAdmonished = a5;
  }
  return result;
}

- (PBResponseMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"authorizationStartTime"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"authorizationEndTime"];
  uint64_t v7 = [v4 decodeBoolForKey:@"authorizationAdmonished"];

  return [(PBResponseMetadata *)self initWithAuthorizationStartTime:v5 authorizationEndTime:v6 authorizationAdmonished:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[PBResponseMetadata authorizationMachAbsoluteStartTime](self, "authorizationMachAbsoluteStartTime"), @"authorizationStartTime");
  objc_msgSend(v4, "encodeInt64:forKey:", -[PBResponseMetadata authorizationMachAbsoluteEndTime](self, "authorizationMachAbsoluteEndTime"), @"authorizationEndTime");
  objc_msgSend(v4, "encodeBool:forKey:", -[PBResponseMetadata isAuthorizationAdmonished](self, "isAuthorizationAdmonished"), @"authorizationAdmonished");
}

- (unint64_t)authorizationMachAbsoluteStartTime
{
  return self->_authorizationMachAbsoluteStartTime;
}

- (unint64_t)authorizationMachAbsoluteEndTime
{
  return self->_authorizationMachAbsoluteEndTime;
}

- (BOOL)isAuthorizationAdmonished
{
  return self->_authorizationAdmonished;
}

@end