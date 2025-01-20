@interface SCLInterruptEventBehavior
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SCLInterruptEvent)event;
- (SCLInterruptEventBehavior)initWithCoder:(id)a3;
- (SCLInterruptEventBehavior)initWithEvent:(id)a3 interruptEligibility:(unint64_t)a4;
- (id)description;
- (unint64_t)eligibility;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLInterruptEventBehavior

- (SCLInterruptEventBehavior)initWithEvent:(id)a3 interruptEligibility:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLInterruptEventBehavior;
  v7 = [(SCLInterruptEventBehavior *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    event = v7->_event;
    v7->_event = (SCLInterruptEvent *)v8;

    v7->_eligibility = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(SCLInterruptEventBehavior *)self event];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SCLInterruptEventBehavior *)self eligibility] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SCLInterruptEventBehavior *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = [(SCLInterruptEventBehavior *)self event];
      v7 = [(SCLInterruptEventBehavior *)v5 event];
      if ([v6 isEqual:v7])
      {
        unint64_t v8 = [(SCLInterruptEventBehavior *)self eligibility];
        BOOL v9 = v8 == [(SCLInterruptEventBehavior *)v5 eligibility];
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

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(SCLInterruptEventBehavior *)self event];
  id v5 = (id)[v3 appendObject:v4 withName:@"event" skipIfNil:1];

  unint64_t v6 = [(SCLInterruptEventBehavior *)self eligibility];
  v7 = @"<unknown>";
  if (v6 == 1) {
    v7 = @"eligible";
  }
  if (v6) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = @"none";
  }
  [v3 appendString:v8 withName:@"eligibleToInterrupt"];
  BOOL v9 = [v3 build];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLInterruptEventBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"interruptEligible"];

  v7 = [(SCLInterruptEventBehavior *)self initWithEvent:v5 interruptEligibility:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(SCLInterruptEventBehavior *)self event];
  [v5 encodeObject:v4 forKey:@"event"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[SCLInterruptEventBehavior eligibility](self, "eligibility"), @"interruptEligible");
}

- (SCLInterruptEvent)event
{
  return self->_event;
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void).cxx_destruct
{
}

@end