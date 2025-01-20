@interface MCResourceStatus
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (MCResourceStatus)init;
- (MCResourceStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MCResourceStatus

+ (BOOL)supportsSecureCoding
{
  return static StatusResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_256A91D94(v4);
}

- (MCResourceStatus)initWithCoder:(id)a3
{
  StatusResponse.init(coder:)(a3);
  return result;
}

- (MCResourceStatus)init
{
}

@end