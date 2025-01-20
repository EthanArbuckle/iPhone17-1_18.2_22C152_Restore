@interface TPSCallingLineIdRestrictionRequest
+ (id)unarchivedObjectClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (TPSCallingLineIdRestrictionRequest)initWithCoder:(id)a3;
- (TPSCallingLineIdRestrictionRequest)initWithSubscriptionContext:(id)a3;
@end

@implementation TPSCallingLineIdRestrictionRequest

- (TPSCallingLineIdRestrictionRequest)initWithSubscriptionContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSCallingLineIdRestrictionRequest;
  return [(TPSRequest *)&v4 initWithSubscriptionContext:a3];
}

- (TPSCallingLineIdRestrictionRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSCallingLineIdRestrictionRequest;
  return [(TPSRequest *)&v4 initWithCoder:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (TPSCallingLineIdRestrictionRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSCallingLineIdRestrictionRequest *)self isEqualToRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSCallingLineIdRestrictionRequest;
  return [(TPSRequest *)&v4 isEqualToRequest:a3];
}

+ (id)unarchivedObjectClasses
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallingLineIdRestrictionRequest;
  objc_super v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  BOOL v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  v7 = (void *)[v5 copy];
  return v7;
}

@end