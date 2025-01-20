@interface VMTelephonyResponse
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (NSError)error;
- (NSString)debugDescription;
- (VMTelephonyResponse)init;
- (VMTelephonyResponse)initWithCoder:(id)a3;
- (VMTelephonyResponse)initWithSubscription:(id)a3 error:(id)a4;
- (VMTelephonySubscription)subscription;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation VMTelephonyResponse

- (VMTelephonyResponse)init
{
  return 0;
}

- (VMTelephonyResponse)initWithSubscription:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VMTelephonyResponse;
  v9 = [(VMTelephonyResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_subscription, a3);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  error = self->_error;
  subscription = self->_subscription;
  return [v4 initWithSubscription:subscription error:error];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  id v5 = a3;
  v6 = NSStringFromSelector("error");
  [v5 encodeObject:error forKey:v6];

  subscription = self->_subscription;
  NSStringFromSelector("subscription");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:subscription forKey:v8];
}

- (VMTelephonyResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VMTelephonyResponse;
  id v5 = [(VMTelephonyResponse *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector("error");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector("subscription");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    subscription = v5->_subscription;
    v5->_subscription = (VMTelephonySubscription *)v12;
  }
  return v5;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector("subscription");
  id v5 = [(VMTelephonyResponse *)self subscription];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector("error");
  id v7 = [(VMTelephonyResponse *)self error];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@">"];
  id v8 = [v3 copy];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  id v3 = [(VMTelephonyResponse *)self error];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(VMTelephonyResponse *)self subscription];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VMTelephonyResponse *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(VMTelephonyResponse *)self isEqualToResponse:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VMTelephonyResponse *)self error];
  unint64_t v6 = [v4 error];
  uint64_t v7 = v5;
  unint64_t v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
LABEL_4:
    uint64_t v11 = [(VMTelephonyResponse *)self subscription];
    uint64_t v12 = [v4 subscription];
    unsigned __int8 v13 = (v11 | v12) == 0;
    if (v12) {
      unsigned __int8 v13 = [(id)v11 isEqual:v12];
    }

    goto LABEL_8;
  }
  if (v8)
  {
    unsigned int v10 = [(id)v7 isEqual:v8];

    if (!v10)
    {
      unsigned __int8 v13 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  unsigned __int8 v13 = 0;
  uint64_t v11 = v7;
LABEL_8:

LABEL_9:
  return v13;
}

- (id)archivedDataWithError:(id *)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 unarchivedObjectClasses];
  unint64_t v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v6 error:a4];

  return v8;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VMTelephonySubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end