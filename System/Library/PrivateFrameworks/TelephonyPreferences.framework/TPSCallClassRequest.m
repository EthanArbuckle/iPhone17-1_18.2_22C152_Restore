@interface TPSCallClassRequest
+ (id)unarchivedObjectClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (TPSCallClassRequest)initWithCoder:(id)a3;
- (TPSCallClassRequest)initWithSubscriptionContext:(id)a3;
- (TPSCallClassRequest)initWithSubscriptionContext:(id)a3 callClass:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int)callClass;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallClass:(int)a3;
@end

@implementation TPSCallClassRequest

- (TPSCallClassRequest)initWithSubscriptionContext:(id)a3
{
  return 0;
}

- (TPSCallClassRequest)initWithSubscriptionContext:(id)a3 callClass:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TPSCallClassRequest;
  result = [(TPSRequest *)&v6 initWithSubscriptionContext:a3];
  if (result) {
    result->_callClass = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallClassRequest;
  id result = [(TPSRequest *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 4) = self->_callClass;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallClassRequest;
  id v4 = a3;
  [(TPSRequest *)&v7 encodeWithCoder:v4];
  uint64_t callClass = self->_callClass;
  objc_super v6 = NSStringFromSelector(sel_callClass);
  objc_msgSend(v4, "encodeInt:forKey:", callClass, v6, v7.receiver, v7.super_class);
}

- (TPSCallClassRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallClassRequest;
  objc_super v5 = [(TPSRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = NSStringFromSelector(sel_callClass);
    v5->_uint64_t callClass = [v4 decodeIntForKey:v6];
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  objc_super v5 = [(TPSRequest *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  objc_super v6 = NSStringFromSelector(sel_callClass);
  [v3 appendFormat:@"%@=%u", v6, -[TPSCallClassRequest callClass](self, "callClass")];

  [v3 appendFormat:@">"];
  objc_super v7 = (void *)[v3 copy];

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallClassRequest;
  unint64_t v3 = [(TPSRequest *)&v5 hash];
  return v3 ^ [(TPSCallClassRequest *)self callClass];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSCallClassRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TPSCallClassRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallClassRequest;
  if ([(TPSRequest *)&v8 isEqualToRequest:v4])
  {
    int v5 = [(TPSCallClassRequest *)self callClass];
    BOOL v6 = v5 == [v4 callClass];
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallClassRequest;
  id v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  int v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  objc_super v7 = (void *)[v5 copy];
  return v7;
}

- (int)callClass
{
  return self->_callClass;
}

- (void)setCallClass:(int)a3
{
  self->_uint64_t callClass = a3;
}

@end