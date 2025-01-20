@interface TPSRequest
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSString)debugDescription;
- (TPSRequest)init;
- (TPSRequest)initWithCoder:(id)a3;
- (TPSRequest)initWithSubscriptionContext:(id)a3;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSubscriptionContext:(id)a3;
@end

@implementation TPSRequest

- (TPSRequest)init
{
  return 0;
}

- (TPSRequest)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSRequest;
  v6 = [(TPSRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  subscriptionContext = self->_subscriptionContext;
  return (id)[v4 initWithSubscriptionContext:subscriptionContext];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  subscriptionContext = self->_subscriptionContext;
  id v4 = a3;
  NSStringFromSelector(sel_subscriptionContext);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:subscriptionContext forKey:v5];
}

- (TPSRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSRequest;
  id v5 = [(TPSRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_subscriptionContext);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    subscriptionContext = v5->_subscriptionContext;
    v5->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v8;
  }
  return v5;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  id v5 = [(TPSRequest *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@">"];
  uint64_t v6 = (void *)[v3 copy];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v2 = [(TPSRequest *)self subscriptionContext];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TPSRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TPSRequest *)self subscriptionContext];
  uint64_t v6 = [v4 subscriptionContext];

  char v7 = (v5 | v6) == 0;
  if (v6) {
    char v7 = [(id)v5 isEqual:v6];
  }

  return v7;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  objc_super v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end