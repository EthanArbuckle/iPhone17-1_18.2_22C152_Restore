@interface TPSCallForwardingRequest
+ (id)unarchivedObjectClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (TPSCallForwardingRequest)initWithCoder:(id)a3;
- (TPSCallForwardingRequest)initWithSubscriptionContext:(id)a3 callClass:(int)a4;
- (TPSCallForwardingRequest)initWithSubscriptionContext:(id)a3 reason:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int)reason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSCallForwardingRequest

- (TPSCallForwardingRequest)initWithSubscriptionContext:(id)a3 reason:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TPSCallForwardingRequest;
  result = [(TPSCallClassRequest *)&v6 initWithSubscriptionContext:a3 callClass:1];
  if (result) {
    *(&result->super._callClass + 1) = a4;
  }
  return result;
}

- (TPSCallForwardingRequest)initWithSubscriptionContext:(id)a3 callClass:(int)a4
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallForwardingRequest;
  id result = [(TPSCallClassRequest *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 5) = *(&self->super._callClass + 1);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingRequest;
  id v4 = a3;
  [(TPSCallClassRequest *)&v7 encodeWithCoder:v4];
  uint64_t v5 = *((unsigned int *)&self->super._callClass + 1);
  objc_super v6 = NSStringFromSelector(sel_reason);
  objc_msgSend(v4, "encodeInt:forKey:", v5, v6, v7.receiver, v7.super_class);
}

- (TPSCallForwardingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallForwardingRequest;
  uint64_t v5 = [(TPSCallClassRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = NSStringFromSelector(sel_reason);
    *(&v5->super._callClass + 1) = [v4 decodeIntForKey:v6];
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  uint64_t v5 = [(TPSRequest *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  objc_super v6 = NSStringFromSelector(sel_callClass);
  [v3 appendFormat:@"%@=%u", v6, -[TPSCallClassRequest callClass](self, "callClass")];

  [v3 appendFormat:@", "];
  objc_super v7 = NSStringFromSelector(sel_reason);
  [v3 appendFormat:@"%@=%u", v7, -[TPSCallForwardingRequest reason](self, "reason")];

  [v3 appendFormat:@">"];
  objc_super v8 = (void *)[v3 copy];

  return v8;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallForwardingRequest;
  unint64_t v3 = [(TPSCallClassRequest *)&v5 hash];
  return v3 ^ [(TPSCallForwardingRequest *)self reason];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSCallForwardingRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSCallForwardingRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallForwardingRequest;
  if ([(TPSCallClassRequest *)&v8 isEqualToRequest:v4])
  {
    int v5 = [(TPSCallForwardingRequest *)self reason];
    BOOL v6 = v5 == [v4 reason];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)unarchivedObjectClasses
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallForwardingRequest;
  id v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  int v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  objc_super v7 = (void *)[v5 copy];
  return v7;
}

- (int)reason
{
  return *(&self->super._callClass + 1);
}

@end