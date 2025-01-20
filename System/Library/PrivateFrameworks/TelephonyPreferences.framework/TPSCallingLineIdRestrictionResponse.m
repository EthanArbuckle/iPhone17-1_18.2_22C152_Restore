@interface TPSCallingLineIdRestrictionResponse
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (TPSCallingLineIdRestrictionResponse)initWithCoder:(id)a3;
- (TPSCallingLineIdRestrictionResponse)initWithSubscriptionContext:(id)a3 error:(id)a4;
- (TPSCallingLineIdRestrictionResponse)initWithsubscriptionContext:(id)a3 editable:(BOOL)a4 state:(int64_t)a5 error:(id)a6;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSCallingLineIdRestrictionResponse

- (TPSCallingLineIdRestrictionResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  return 0;
}

- (TPSCallingLineIdRestrictionResponse)initWithsubscriptionContext:(id)a3 editable:(BOOL)a4 state:(int64_t)a5 error:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  result = [(TPSResponse *)&v9 initWithSubscriptionContext:a3 error:a6];
  if (result)
  {
    result->_editable = a4;
    result->_state = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  id result = [(TPSResponse *)&v5 copyWithZone:a3];
  *((unsigned char *)result + 24) = self->_editable;
  *((void *)result + 4) = self->_state;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  id v4 = a3;
  [(TPSResponse *)&v9 encodeWithCoder:v4];
  BOOL editable = self->_editable;
  v6 = NSStringFromSelector(sel_editable);
  objc_msgSend(v4, "encodeBool:forKey:", editable, v6, v9.receiver, v9.super_class);

  int64_t state = self->_state;
  v8 = NSStringFromSelector(sel_state);
  [v4 encodeInteger:state forKey:v8];
}

- (TPSCallingLineIdRestrictionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  objc_super v5 = [(TPSResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_editable);
    v5->_BOOL editable = [v4 decodeBoolForKey:v6];

    v7 = NSStringFromSelector(sel_state);
    v5->_int64_t state = [v4 decodeIntegerForKey:v7];
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
  v7 = [(TPSResponse *)self error];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  v8 = NSStringFromSelector(sel_editable);
  objc_super v9 = objc_msgSend(NSNumber, "numberWithBool:", -[TPSCallingLineIdRestrictionResponse isEditable](self, "isEditable"));
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@", "];
  v10 = NSStringFromSelector(sel_state);
  v11 = objc_msgSend(NSString, "tps_stringWithTPSCallingLineIdRestrictionState:", -[TPSCallingLineIdRestrictionResponse state](self, "state"));
  [v3 appendFormat:@"%@=%@", v10, v11];

  [v3 appendFormat:@">"];
  v12 = (void *)[v3 copy];

  return v12;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  unint64_t v3 = [(TPSResponse *)&v6 hash];
  uint64_t v4 = [(TPSCallingLineIdRestrictionResponse *)self isEditable];
  return v3 ^ v4 ^ [(TPSCallingLineIdRestrictionResponse *)self state];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TPSCallingLineIdRestrictionResponse *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSCallingLineIdRestrictionResponse *)self isEqualToResponse:v4];
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  if ([(TPSResponse *)&v9 isEqualToResponse:v4]
    && (int v5 = [(TPSCallingLineIdRestrictionResponse *)self isEditable],
        v5 == [v4 isEditable]))
  {
    int64_t v7 = [(TPSCallingLineIdRestrictionResponse *)self state];
    BOOL v6 = v7 == [v4 state];
  }
  else
  {
    BOOL v6 = 0;
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
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallingLineIdRestrictionResponse;
  id v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  int v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 addObjectsFromArray:v6];

  int64_t v7 = (void *)[v5 copy];
  return v7;
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  v8 = [a1 unarchivedObjectClasses];
  objc_super v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (int64_t)state
{
  return self->_state;
}

@end