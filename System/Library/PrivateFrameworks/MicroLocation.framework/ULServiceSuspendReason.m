@interface ULServiceSuspendReason
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (ULServiceSuspendReason)init;
- (ULServiceSuspendReason)initWithCoder:(id)a3;
- (ULServiceSuspendReason)initWithSuspendReasonEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)suspendReasonEnum;
- (void)encodeWithCoder:(id)a3;
- (void)setSuspendReasonEnum:(unint64_t)a3;
@end

@implementation ULServiceSuspendReason

- (ULServiceSuspendReason)initWithSuspendReasonEnum:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ULServiceSuspendReason;
  v4 = [(ULServiceSuspendReason *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(ULServiceSuspendReason *)v4 setSuspendReasonEnum:a3];
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(ULServiceSuspendReason *)self suspendReasonEnum];

  return (id)[v4 initWithSuspendReasonEnum:v5];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t suspendReasonEnum = self->_suspendReasonEnum;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:suspendReasonEnum];
  [v5 encodeObject:v6 forKey:@"suspendReasonEnum"];
}

- (ULServiceSuspendReason)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULServiceSuspendReason;
  id v5 = [(ULServiceSuspendReason *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suspendReasonEnum"];
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(ULServiceSuspendReason *)v6 unsignedIntegerValue];

      v5->_unint64_t suspendReasonEnum = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  unint64_t suspendReasonEnum = self->_suspendReasonEnum;
  if (suspendReasonEnum > 7) {
    uint64_t v8 = @"Unknown";
  }
  else {
    uint64_t v8 = off_2653F8098[suspendReasonEnum];
  }
  [v6 appendFormat:@", suspendReasonEnum: %@", v8];
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(ULServiceSuspendReason *)self suspendReasonEnum];
    uint64_t v7 = [v5 suspendReasonEnum];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_suspendReasonEnum;
}

- (ULServiceSuspendReason)init
{
}

+ (id)new
{
}

- (unint64_t)suspendReasonEnum
{
  return self->_suspendReasonEnum;
}

- (void)setSuspendReasonEnum:(unint64_t)a3
{
  self->_unint64_t suspendReasonEnum = a3;
}

@end