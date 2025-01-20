@interface TUIKTReportToAppleContext
+ (BOOL)supportsSecureCoding;
- (NSUUID)failingValidation;
- (TUIKTReportToAppleContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFailingValidation:(id)a3;
@end

@implementation TUIKTReportToAppleContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUIKTReportToAppleContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIKTReportToAppleContext;
  v5 = [(TUIKTReportToAppleContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_failingValidation"];
    failingValidation = v5->_failingValidation;
    v5->_failingValidation = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[TUIKTReportToAppleContext allocWithZone:a3] init];
  uint64_t v5 = [(NSUUID *)self->_failingValidation copy];
  failingValidation = v4->_failingValidation;
  v4->_failingValidation = (NSUUID *)v5;

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Notification Context with failing validation UUID: %@", self->_failingValidation];
}

- (NSUUID)failingValidation
{
  return self->_failingValidation;
}

- (void)setFailingValidation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end