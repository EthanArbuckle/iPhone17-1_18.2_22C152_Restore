@interface TPSResponse
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSError)error;
- (NSString)debugDescription;
- (TPSResponse)init;
- (TPSResponse)initWithCoder:(id)a3;
- (TPSResponse)initWithSubscriptionContext:(id)a3 error:(id)a4;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation TPSResponse

- (TPSResponse)init
{
  return 0;
}

- (TPSResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSResponse;
  v9 = [(TPSResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_subscriptionContext, a3);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  error = self->_error;
  subscriptionContext = self->_subscriptionContext;
  return (id)[v4 initWithSubscriptionContext:subscriptionContext error:error];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_error);
  [v5 encodeObject:error forKey:v6];

  subscriptionContext = self->_subscriptionContext;
  NSStringFromSelector(sel_subscriptionContext);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:subscriptionContext forKey:v8];
}

- (TPSResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSResponse;
  id v5 = [(TPSResponse *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_error);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_subscriptionContext);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    subscriptionContext = v5->_subscriptionContext;
    v5->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v12;
  }
  return v5;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  id v5 = [(TPSResponse *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_error);
  id v7 = [(TPSResponse *)self error];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@">"];
  uint64_t v8 = (void *)[v3 copy];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  id v3 = [(TPSResponse *)self error];
  uint64_t v4 = [v3 hash];
  id v5 = [(TPSResponse *)self subscriptionContext];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TPSResponse *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TPSResponse *)self isEqualToResponse:v4];
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TPSResponse *)self error];
  unint64_t v6 = [v4 error];
  uint64_t v7 = v5;
  unint64_t v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
LABEL_4:
    uint64_t v11 = [(TPSResponse *)self subscriptionContext];
    uint64_t v12 = [v4 subscriptionContext];
    char v13 = (v11 | v12) == 0;
    if (v12) {
      char v13 = [(id)v11 isEqual:v12];
    }

    goto LABEL_8;
  }
  if (v8)
  {
    int v10 = [(id)v7 isEqual:v8];

    if (!v10)
    {
      char v13 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  char v13 = 0;
  uint64_t v11 = v7;
LABEL_8:

LABEL_9:
  return v13;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  unint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  unint64_t v8 = [a1 unarchivedObjectClasses];
  v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end