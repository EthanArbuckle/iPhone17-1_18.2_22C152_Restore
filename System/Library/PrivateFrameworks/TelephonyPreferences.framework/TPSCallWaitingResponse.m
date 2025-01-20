@interface TPSCallWaitingResponse
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (TPSCallWaitingResponse)initWithCoder:(id)a3;
- (TPSCallWaitingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4;
- (TPSCallWaitingResponse)initWithsubscriptionContext:(id)a3 error:(id)a4 enabled:(BOOL)a5;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSCallWaitingResponse

- (TPSCallWaitingResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  return 0;
}

- (TPSCallWaitingResponse)initWithsubscriptionContext:(id)a3 error:(id)a4 enabled:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallWaitingResponse;
  result = [(TPSResponse *)&v7 initWithSubscriptionContext:a3 error:a4];
  if (result) {
    result->_enabled = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallWaitingResponse;
  id result = [(TPSResponse *)&v5 copyWithZone:a3];
  *((unsigned char *)result + 24) = self->_enabled;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallWaitingResponse;
  id v4 = a3;
  [(TPSResponse *)&v7 encodeWithCoder:v4];
  BOOL enabled = self->_enabled;
  v6 = NSStringFromSelector(sel_enabled);
  objc_msgSend(v4, "encodeBool:forKey:", enabled, v6, v7.receiver, v7.super_class);
}

- (TPSCallWaitingResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallWaitingResponse;
  objc_super v5 = [(TPSResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_enabled);
    v5->_BOOL enabled = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  objc_super v5 = [(TPSResponse *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  v6 = NSStringFromSelector(sel_error);
  objc_super v7 = [(TPSResponse *)self error];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  objc_super v8 = NSStringFromSelector(sel_enabled);
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[TPSCallWaitingResponse enabled](self, "enabled"));
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@">"];
  v10 = (void *)[v3 copy];

  return v10;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallWaitingResponse;
  unint64_t v3 = [(TPSResponse *)&v5 hash];
  return v3 ^ [(TPSCallWaitingResponse *)self enabled];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSCallWaitingResponse *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSCallWaitingResponse *)self isEqualToResponse:v4];
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSCallWaitingResponse;
  if ([(TPSResponse *)&v8 isEqualToResponse:v4])
  {
    BOOL v5 = [(TPSCallWaitingResponse *)self enabled];
    int v6 = v5 ^ [v4 enabled] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallWaitingResponse;
  id v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  BOOL v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  objc_super v7 = (void *)[v5 copy];
  return v7;
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  int v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  objc_super v8 = [a1 unarchivedObjectClasses];
  objc_super v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (BOOL)enabled
{
  return self->_enabled;
}

@end