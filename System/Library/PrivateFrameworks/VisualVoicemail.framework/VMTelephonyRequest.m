@interface VMTelephonyRequest
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (NSString)debugDescription;
- (VMTelephonyRequest)init;
- (VMTelephonyRequest)initWithCoder:(id)a3;
- (VMTelephonyRequest)initWithSubscription:(id)a3;
- (VMTelephonySubscription)subscription;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSubscription:(id)a3;
@end

@implementation VMTelephonyRequest

- (VMTelephonyRequest)init
{
  return 0;
}

- (VMTelephonyRequest)initWithSubscription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMTelephonyRequest;
  v6 = [(VMTelephonyRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscription, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  subscription = self->_subscription;
  return [v4 initWithSubscription:subscription];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  subscription = self->_subscription;
  id v4 = a3;
  NSStringFromSelector("subscription");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:subscription forKey:v5];
}

- (VMTelephonyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMTelephonyRequest;
  id v5 = [(VMTelephonyRequest *)&v11 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() unarchivedObjectClasses];
    v7 = NSStringFromSelector("subscription");
    uint64_t v8 = [v4 decodeObjectOfClasses:v6 forKey:v7];
    subscription = v5->_subscription;
    v5->_subscription = (VMTelephonySubscription *)v8;
  }
  return v5;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector("subscription");
  id v5 = [(VMTelephonyRequest *)self subscription];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@">"];
  id v6 = [v3 copy];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v2 = [(VMTelephonyRequest *)self subscription];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VMTelephonyRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(VMTelephonyRequest *)self isEqualToRequest:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMTelephonyRequest *)self subscription];
  uint64_t v6 = [v4 subscription];

  unsigned __int8 v7 = (v5 | v6) == 0;
  if (v6) {
    unsigned __int8 v7 = [(id)v5 isEqual:v6];
  }

  return v7;
}

- (id)archivedDataWithError:(id *)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  uint64_t v2 = objc_opt_class();
  id v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, objc_opt_class(), 0);
  Class v4 = NSClassFromString(@"VMMockTelephonySubscription");
  if (v4)
  {
    uint64_t v5 = [v3 setByAddingObject:v4];

    id v3 = (void *)v5;
  }
  return v3;
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [a1 unarchivedObjectClasses];
  uint64_t v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v6 error:a4];

  return v8;
}

- (VMTelephonySubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end