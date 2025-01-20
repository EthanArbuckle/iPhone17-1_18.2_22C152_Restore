@interface SFMessageAuthenticationCodeOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultMacOperation;
- (SFMessageAuthenticationCodeOperation)init;
- (SFMessageAuthenticationCodeOperation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5;
@end

@implementation SFMessageAuthenticationCodeOperation

+ (id)_defaultMacOperation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMessageAuthenticationCodeOperation)init
{
  return 0;
}

- (SFMessageAuthenticationCodeOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFMessageAuthenticationCodeOperation;
  return [(SFMessageAuthenticationCodeOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end