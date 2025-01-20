@interface TPSCallForwardingResponse
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (CTCallForwardingValue)value;
- (TPSCallForwardingResponse)initWithCoder:(id)a3;
- (TPSCallForwardingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4;
- (TPSCallForwardingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4 value:(id)a5;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSCallForwardingResponse

- (TPSCallForwardingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  return 0;
}

- (TPSCallForwardingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4 value:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TPSCallForwardingResponse;
  v10 = [(TPSResponse *)&v13 initWithSubscriptionContext:a3 error:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_value, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSCallForwardingResponse;
  v4 = [(TPSResponse *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_value);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingResponse;
  id v4 = a3;
  [(TPSResponse *)&v7 encodeWithCoder:v4];
  value = self->_value;
  objc_super v6 = NSStringFromSelector(sel_value);
  objc_msgSend(v4, "encodeObject:forKey:", value, v6, v7.receiver, v7.super_class);
}

- (TPSCallForwardingResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSCallForwardingResponse;
  v5 = [(TPSResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_value);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    value = v5->_value;
    v5->_value = (CTCallForwardingValue *)v8;
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  v5 = [(TPSResponse *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_error);
  objc_super v7 = [(TPSResponse *)self error];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  uint64_t v8 = NSStringFromSelector(sel_value);
  [v3 appendFormat:@"%@=%@", v8, self->_value];

  [v3 appendFormat:@">"];
  id v9 = (void *)[v3 copy];

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingResponse;
  unint64_t v3 = [(TPSResponse *)&v7 hash];
  id v4 = [(TPSCallForwardingResponse *)self value];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSCallForwardingResponse *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSCallForwardingResponse *)self isEqualToResponse:v4];
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCallForwardingResponse;
  if ([(TPSResponse *)&v9 isEqualToResponse:v4])
  {
    uint64_t v5 = [(TPSCallForwardingResponse *)self value];
    uint64_t v6 = [v4 value];
    char v7 = (v5 | v6) == 0;
    if (v6) {
      char v7 = [(id)v5 isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallForwardingResponse;
  id v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  uint64_t v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  char v7 = (void *)[v5 copy];
  return v7;
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  objc_super v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (CTCallForwardingValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end