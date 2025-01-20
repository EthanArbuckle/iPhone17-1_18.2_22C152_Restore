@interface TPSSetCallWaitingRequest
+ (id)unarchivedObjectClasses;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (TPSSetCallWaitingRequest)initWithCoder:(id)a3;
- (TPSSetCallWaitingRequest)initWithSubscriptionContext:(id)a3;
- (TPSSetCallWaitingRequest)initWithSubscriptionContext:(id)a3 enabled:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSSetCallWaitingRequest

- (TPSSetCallWaitingRequest)initWithSubscriptionContext:(id)a3
{
  return 0;
}

- (TPSSetCallWaitingRequest)initWithSubscriptionContext:(id)a3 enabled:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TPSSetCallWaitingRequest;
  result = [(TPSCallWaitingRequest *)&v6 initWithSubscriptionContext:a3];
  if (result) {
    *((unsigned char *)&result->super.super._callClass + 4) = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSSetCallWaitingRequest;
  id result = [(TPSCallClassRequest *)&v5 copyWithZone:a3];
  *((unsigned char *)result + 20) = *((unsigned char *)&self->super.super._callClass + 4);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSSetCallWaitingRequest;
  id v4 = a3;
  [(TPSCallClassRequest *)&v7 encodeWithCoder:v4];
  uint64_t v5 = *((unsigned __int8 *)&self->super.super._callClass + 4);
  objc_super v6 = NSStringFromSelector(sel_enabled);
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6, v7.receiver, v7.super_class);
}

- (TPSSetCallWaitingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSSetCallWaitingRequest;
  uint64_t v5 = [(TPSCallWaitingRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = NSStringFromSelector(sel_enabled);
    [v4 decodeBoolForKey:v6];
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
  objc_super v7 = NSStringFromSelector(sel_enabled);
  objc_super v8 = objc_msgSend(NSNumber, "numberWithBool:", -[TPSSetCallWaitingRequest enabled](self, "enabled"));
  [v3 appendFormat:@"%@=%@", v7, v8];

  [v3 appendFormat:@">"];
  v9 = (void *)[v3 copy];

  return v9;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TPSSetCallWaitingRequest;
  unint64_t v3 = [(TPSCallClassRequest *)&v5 hash];
  return v3 ^ [(TPSSetCallWaitingRequest *)self enabled];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSSetCallWaitingRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSSetCallWaitingRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSSetCallWaitingRequest;
  BOOL v4 = [(TPSCallWaitingRequest *)&v6 isEqualToRequest:a3];
  if (v4) {
    LOBYTE(v4) = [(TPSSetCallWaitingRequest *)self enabled];
  }
  return v4;
}

+ (id)unarchivedObjectClasses
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSSetCallWaitingRequest;
  BOOL v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  BOOL v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  objc_super v7 = (void *)[v5 copy];
  return v7;
}

- (BOOL)enabled
{
  return *((unsigned char *)&self->super.super._callClass + 4);
}

@end