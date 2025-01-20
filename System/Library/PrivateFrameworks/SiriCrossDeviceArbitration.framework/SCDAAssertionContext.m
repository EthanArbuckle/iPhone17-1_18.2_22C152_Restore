@interface SCDAAssertionContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)effectiveDate;
- (NSDictionary)userInfo;
- (NSString)reason;
- (SCDAAssertionContext)init;
- (SCDAAssertionContext)initWithBuilder:(id)a3;
- (SCDAAssertionContext)initWithCoder:(id)a3;
- (SCDAAssertionContext)initWithTimestamp:(unint64_t)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 userInfo:(id)a7;
- (double)expirationDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCDAAssertionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t timestamp = self->_timestamp;
  id v8 = a3;
  v6 = [v4 numberWithUnsignedLongLong:timestamp];
  [v8 encodeObject:v6 forKey:@"SCDAAssertionContext::timestamp"];

  [v8 encodeObject:self->_reason forKey:@"SCDAAssertionContext::reason"];
  [v8 encodeObject:self->_effectiveDate forKey:@"SCDAAssertionContext::effectiveDate"];
  v7 = [NSNumber numberWithDouble:self->_expirationDuration];
  [v8 encodeObject:v7 forKey:@"SCDAAssertionContext::expirationDuration"];

  [v8 encodeObject:self->_userInfo forKey:@"SCDAAssertionContext::userInfo"];
}

- (SCDAAssertionContext)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAAssertionContext::timestamp"];
  uint64_t v25 = [v4 unsignedLongLongValue];

  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAAssertionContext::reason"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAAssertionContext::effectiveDate"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAAssertionContext::expirationDuration"];
  [v5 doubleValue];
  double v7 = v6;

  v22 = (void *)MEMORY[0x263EFFA08];
  uint64_t v21 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v22, "setWithObjects:", v21, v8, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
  v18 = [v3 decodeObjectOfClasses:v17 forKey:@"SCDAAssertionContext::userInfo"];

  v19 = [(SCDAAssertionContext *)self initWithTimestamp:v25 reason:v24 effectiveDate:v23 expirationDuration:v18 userInfo:v7];
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SCDAAssertionContext *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t timestamp = self->_timestamp;
      if (timestamp == [(SCDAAssertionContext *)v5 timestamp]
        && (double expirationDuration = self->_expirationDuration,
            [(SCDAAssertionContext *)v5 expirationDuration],
            expirationDuration == v8))
      {
        uint64_t v11 = [(SCDAAssertionContext *)v5 reason];
        reason = self->_reason;
        if (reason == v11 || [(NSString *)reason isEqual:v11])
        {
          uint64_t v13 = [(SCDAAssertionContext *)v5 effectiveDate];
          effectiveDate = self->_effectiveDate;
          if (effectiveDate == v13 || [(NSDate *)effectiveDate isEqual:v13])
          {
            uint64_t v15 = [(SCDAAssertionContext *)v5 userInfo];
            userInfo = self->_userInfo;
            BOOL v9 = userInfo == v15 || [(NSDictionary *)userInfo isEqual:v15];
          }
          else
          {
            BOOL v9 = 0;
          }
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_reason hash];
  uint64_t v6 = v5 ^ [(NSDate *)self->_effectiveDate hash] ^ v4;
  double v7 = [NSNumber numberWithDouble:self->_expirationDuration];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSDictionary *)self->_userInfo hash];

  return v9;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SCDAAssertionContext;
  NSUInteger v5 = [(SCDAAssertionContext *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t timestamp = %llu, reason = %@, effectiveDate = %@, expirationDuration = %f, userInfo = %@}", v5, self->_timestamp, self->_reason, self->_effectiveDate, *(void *)&self->_expirationDuration, self->_userInfo];

  return v6;
}

- (id)description
{
  return [(SCDAAssertionContext *)self _descriptionWithIndent:0];
}

- (SCDAAssertionContext)initWithTimestamp:(unint64_t)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 userInfo:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__SCDAAssertionContext_initWithTimestamp_reason_effectiveDate_expirationDuration_userInfo___block_invoke;
  v20[3] = &unk_2654B77D0;
  id v21 = v12;
  id v22 = v13;
  double v25 = a6;
  id v23 = v14;
  unint64_t v24 = a3;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  v18 = [(SCDAAssertionContext *)self initWithBuilder:v20];

  return v18;
}

void __91__SCDAAssertionContext_initWithTimestamp_reason_effectiveDate_expirationDuration_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = a2;
  [v4 setTimestamp:v3];
  [v4 setReason:*(void *)(a1 + 32)];
  [v4 setEffectiveDate:*(void *)(a1 + 40)];
  [v4 setExpirationDuration:*(double *)(a1 + 64)];
  [v4 setUserInfo:*(void *)(a1 + 48)];
}

- (SCDAAssertionContext)init
{
  return [(SCDAAssertionContext *)self initWithBuilder:0];
}

- (SCDAAssertionContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SCDAAssertionContextMutation *))a3;
  v19.receiver = self;
  v19.super_class = (Class)SCDAAssertionContext;
  NSUInteger v5 = [(SCDAAssertionContext *)&v19 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    double v7 = [[_SCDAAssertionContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SCDAAssertionContextMutation *)v7 isDirty])
    {
      v6->_unint64_t timestamp = [(_SCDAAssertionContextMutation *)v7 getTimestamp];
      objc_super v8 = [(_SCDAAssertionContextMutation *)v7 getReason];
      uint64_t v9 = [v8 copy];
      reason = v6->_reason;
      v6->_reason = (NSString *)v9;

      uint64_t v11 = [(_SCDAAssertionContextMutation *)v7 getEffectiveDate];
      uint64_t v12 = [v11 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = (NSDate *)v12;

      [(_SCDAAssertionContextMutation *)v7 getExpirationDuration];
      v6->_double expirationDuration = v14;
      id v15 = [(_SCDAAssertionContextMutation *)v7 getUserInfo];
      uint64_t v16 = [v15 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v16;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SCDAAssertionContextMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SCDAAssertionContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SCDAAssertionContextMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(SCDAAssertionContext);
      v6->_unint64_t timestamp = [(_SCDAAssertionContextMutation *)v5 getTimestamp];
      double v7 = [(_SCDAAssertionContextMutation *)v5 getReason];
      uint64_t v8 = [v7 copy];
      reason = v6->_reason;
      v6->_reason = (NSString *)v8;

      uint64_t v10 = [(_SCDAAssertionContextMutation *)v5 getEffectiveDate];
      uint64_t v11 = [v10 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = (NSDate *)v11;

      [(_SCDAAssertionContextMutation *)v5 getExpirationDuration];
      v6->_double expirationDuration = v13;
      double v14 = [(_SCDAAssertionContextMutation *)v5 getUserInfo];
      uint64_t v15 = [v14 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v15;
    }
    else
    {
      uint64_t v6 = (SCDAAssertionContext *)[(SCDAAssertionContext *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (SCDAAssertionContext *)[(SCDAAssertionContext *)self copy];
  }

  return v6;
}

@end