@interface SFX509TrustPolicy
+ (BOOL)supportsSecureCoding;
- (SFX509TrustPolicy)init;
- (SFX509TrustPolicy)initWithCoder:(id)a3;
@end

@implementation SFX509TrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFX509TrustPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)SFX509TrustPolicy;
  return [(SFX509TrustPolicy *)&v3 init];
}

- (SFX509TrustPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFX509TrustPolicy;
  return [(SFX509TrustPolicy *)&v4 init];
}

- (void).cxx_destruct
{
}

@end