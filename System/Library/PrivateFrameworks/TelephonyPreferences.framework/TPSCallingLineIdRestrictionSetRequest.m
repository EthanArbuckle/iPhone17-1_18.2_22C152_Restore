@interface TPSCallingLineIdRestrictionSetRequest
+ (id)unarchivedObjectClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (TPSCallingLineIdRestrictionSetRequest)initWithCoder:(id)a3;
- (TPSCallingLineIdRestrictionSetRequest)initWithSubscriptionContext:(id)a3;
- (TPSCallingLineIdRestrictionSetRequest)initWithSubscriptionContext:(id)a3 state:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSCallingLineIdRestrictionSetRequest

- (TPSCallingLineIdRestrictionSetRequest)initWithSubscriptionContext:(id)a3
{
  return 0;
}

- (TPSCallingLineIdRestrictionSetRequest)initWithSubscriptionContext:(id)a3 state:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  result = [(TPSCallingLineIdRestrictionRequest *)&v6 initWithSubscriptionContext:a3];
  if (result) {
    result->_state = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  id result = [(TPSRequest *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_state;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  id v4 = a3;
  [(TPSRequest *)&v7 encodeWithCoder:v4];
  BOOL v5 = self->_state != 0;
  objc_super v6 = NSStringFromSelector(sel_state);
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6, v7.receiver, v7.super_class);
}

- (TPSCallingLineIdRestrictionSetRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  BOOL v5 = [(TPSCallingLineIdRestrictionRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = NSStringFromSelector(sel_state);
    [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  BOOL v5 = [(TPSRequest *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  objc_super v6 = NSStringFromSelector(sel_state);
  objc_super v7 = objc_msgSend(NSString, "tps_stringWithTPSCallingLineIdRestrictionState:", -[TPSCallingLineIdRestrictionSetRequest state](self, "state"));
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@">"];
  objc_super v8 = (void *)[v3 copy];

  return v8;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  unint64_t v3 = [(TPSRequest *)&v5 hash];
  return [(TPSCallingLineIdRestrictionSetRequest *)self state] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSCallingLineIdRestrictionSetRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSCallingLineIdRestrictionSetRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSCallingLineIdRestrictionSetRequest;
  BOOL v4 = [(TPSCallingLineIdRestrictionRequest *)&v6 isEqualToRequest:a3];
  if (v4) {
    LOBYTE(v4) = [(TPSCallingLineIdRestrictionSetRequest *)self state] != 0;
  }
  return v4;
}

+ (id)unarchivedObjectClasses
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallingLineIdRestrictionSetRequest;
  BOOL v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  BOOL v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  objc_super v7 = (void *)[v5 copy];
  return v7;
}

- (int64_t)state
{
  return self->_state;
}

@end