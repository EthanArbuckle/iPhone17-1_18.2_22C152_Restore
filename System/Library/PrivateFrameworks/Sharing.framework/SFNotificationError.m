@interface SFNotificationError
+ (BOOL)supportsSecureCoding;
- (NSString)errorDescription;
- (SFNotificationError)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDescription:(id)a3;
@end

@implementation SFNotificationError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = [(SFNotificationError *)self errorDescription];
    v6 = (void *)[v5 copy];
    [v4 setErrorDescription:v6];
  }
  return v4;
}

- (SFNotificationError)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFNotificationError;
  v5 = [(SFNotificationError *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [a3 encodeObject:errorDescription forKey:@"ed"];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"SFNotificationError <D=\"%@\">", self->_errorDescription];
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end