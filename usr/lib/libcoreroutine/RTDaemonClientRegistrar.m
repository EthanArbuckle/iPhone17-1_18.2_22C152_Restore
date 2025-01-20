@interface RTDaemonClientRegistrar
+ (BOOL)supportsSecureCoding;
- (BOOL)invocationsPending;
- (BOOL)registered;
- (RTDaemonClientRegistrar)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)countOfPendingInvocations;
@end

@implementation RTDaemonClientRegistrar

- (RTDaemonClientRegistrar)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RTDaemonClientRegistrar;
  return [(RTDaemonClientRegistrar *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (int64_t)countOfPendingInvocations
{
  return 0;
}

- (BOOL)invocationsPending
{
  return 0;
}

- (BOOL)registered
{
  return 0;
}

@end