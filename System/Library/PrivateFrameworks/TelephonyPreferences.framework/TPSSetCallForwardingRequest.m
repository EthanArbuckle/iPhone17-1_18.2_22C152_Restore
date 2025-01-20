@interface TPSSetCallForwardingRequest
+ (id)unarchivedObjectClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (CTCallForwardingValue)value;
- (TPSSetCallForwardingRequest)initWithCoder:(id)a3;
- (TPSSetCallForwardingRequest)initWithSubscriptionContext:(id)a3;
- (TPSSetCallForwardingRequest)initWithSubscriptionContext:(id)a3 value:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSSetCallForwardingRequest

- (TPSSetCallForwardingRequest)initWithSubscriptionContext:(id)a3
{
  return 0;
}

- (TPSSetCallForwardingRequest)initWithSubscriptionContext:(id)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TPSSetCallForwardingRequest;
  v8 = [(TPSRequest *)&v11 initWithSubscriptionContext:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSSetCallForwardingRequest;
  v4 = [(TPSRequest *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_value);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSSetCallForwardingRequest;
  id v4 = a3;
  [(TPSRequest *)&v7 encodeWithCoder:v4];
  value = self->_value;
  objc_super v6 = NSStringFromSelector(sel_value);
  objc_msgSend(v4, "encodeObject:forKey:", value, v6, v7.receiver, v7.super_class);
}

- (TPSSetCallForwardingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSSetCallForwardingRequest;
  v5 = [(TPSRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = NSStringFromSelector(sel_value);
    id v7 = (id)[v4 decodeObjectForKey:v6];
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  v5 = [(TPSRequest *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  objc_super v6 = NSStringFromSelector(sel_value);
  [v3 appendFormat:@"%@=%@", v6, self->_value];

  [v3 appendFormat:@">"];
  id v7 = (void *)[v3 copy];

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TPSSetCallForwardingRequest;
  unint64_t v3 = [(TPSRequest *)&v7 hash];
  id v4 = [(TPSSetCallForwardingRequest *)self value];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSSetCallForwardingRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSSetCallForwardingRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSSetCallForwardingRequest;
  if ([(TPSRequest *)&v9 isEqualToRequest:v4])
  {
    uint64_t v5 = [(TPSSetCallForwardingRequest *)self value];
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

+ (id)unarchivedObjectClasses
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSSetCallForwardingRequest;
  id v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  uint64_t v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  char v7 = (void *)[v5 copy];
  return v7;
}

- (CTCallForwardingValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end