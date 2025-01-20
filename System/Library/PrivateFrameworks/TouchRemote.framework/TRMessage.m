@interface TRMessage
+ (BOOL)supportsSecureCoding;
- (NSDictionary)userInfo;
- (TRMessage)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TRMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  userInfo = self->_userInfo;
  if (userInfo) {
    [a3 encodeObject:userInfo forKey:@"TRMessage_userInfo"];
  }
}

- (TRMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TRMessage *)self init];
  if (v5)
  {
    v6 = [v4 decodePropertyListForKey:@"TRMessage_userInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_userInfo, v6);
    }
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_userInfo) {
    v5 = @"present";
  }
  else {
    v5 = @"absent";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p> userInfo: [-%@-]", v4, self, v5];
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end