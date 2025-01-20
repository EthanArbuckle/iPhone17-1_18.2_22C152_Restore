@interface NFRemoteAdminStateRetryInterval
+ (BOOL)supportsSecureCoding;
- (NFRemoteAdminStateRetryInterval)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFRemoteAdminStateRetryInterval

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminStateRetryInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFRemoteAdminStateRetryInterval;
  v5 = [(NFRemoteAdminStateRetryInterval *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delayValueIndex"];
    v5->_delayValueIndex = (unint64_t)[v6 unsignedIntegerValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    time = v5->_time;
    v5->_time = (NSDate *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t delayValueIndex = self->_delayValueIndex;
  id v6 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:delayValueIndex];
  [v6 encodeObject:v5 forKey:@"delayValueIndex"];

  [v6 encodeObject:self->_time forKey:@"time"];
}

- (void).cxx_destruct
{
}

@end