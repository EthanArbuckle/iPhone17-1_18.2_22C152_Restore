@interface SVXAlarmAndTimerFiringContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)hasOtherRunningTimers;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)orderedFiringAlarms;
- (NSOrderedSet)orderedFiringTimers;
- (SVXAlarmAndTimerFiringContext)initWithCoder:(id)a3;
- (SVXAlarmAndTimerFiringContext)initWithOrderedFiringAlarms:(id)a3 orderedFiringTimers:(id)a4 hasOtherRunningTimers:(BOOL)a5;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXAlarmAndTimerFiringContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFiringTimers, 0);

  objc_storeStrong((id *)&self->_orderedFiringAlarms, 0);
}

- (BOOL)hasOtherRunningTimers
{
  return self->_hasOtherRunningTimers;
}

- (NSOrderedSet)orderedFiringTimers
{
  return self->_orderedFiringTimers;
}

- (NSOrderedSet)orderedFiringAlarms
{
  return self->_orderedFiringAlarms;
}

- (void)encodeWithCoder:(id)a3
{
  orderedFiringAlarms = self->_orderedFiringAlarms;
  id v5 = a3;
  [v5 encodeObject:orderedFiringAlarms forKey:@"SVXAlarmAndTimerFiringContext::orderedFiringAlarms"];
  [v5 encodeObject:self->_orderedFiringTimers forKey:@"SVXAlarmAndTimerFiringContext::orderedFiringTimers"];
  id v6 = [NSNumber numberWithBool:self->_hasOtherRunningTimers];
  [v5 encodeObject:v6 forKey:@"SVXAlarmAndTimerFiringContext::hasOtherRunningTimers"];
}

- (SVXAlarmAndTimerFiringContext)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"SVXAlarmAndTimerFiringContext::orderedFiringAlarms"];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"SVXAlarmAndTimerFiringContext::orderedFiringTimers"];

  v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAlarmAndTimerFiringContext::hasOtherRunningTimers"];

  uint64_t v14 = [v13 BOOLValue];
  v15 = [(SVXAlarmAndTimerFiringContext *)self initWithOrderedFiringAlarms:v8 orderedFiringTimers:v12 hasOtherRunningTimers:v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SVXAlarmAndTimerFiringContext *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL hasOtherRunningTimers = self->_hasOtherRunningTimers;
      if (hasOtherRunningTimers == [(SVXAlarmAndTimerFiringContext *)v5 hasOtherRunningTimers])
      {
        v7 = [(SVXAlarmAndTimerFiringContext *)v5 orderedFiringAlarms];
        orderedFiringAlarms = self->_orderedFiringAlarms;
        if (orderedFiringAlarms == v7 || [(NSOrderedSet *)orderedFiringAlarms isEqual:v7])
        {
          v9 = [(SVXAlarmAndTimerFiringContext *)v5 orderedFiringTimers];
          orderedFiringTimers = self->_orderedFiringTimers;
          BOOL v11 = orderedFiringTimers == v9 || [(NSOrderedSet *)orderedFiringTimers isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSOrderedSet *)self->_orderedFiringAlarms hash];
  uint64_t v4 = [(NSOrderedSet *)self->_orderedFiringTimers hash] ^ v3;
  id v5 = [NSNumber numberWithBool:self->_hasOtherRunningTimers];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)SVXAlarmAndTimerFiringContext;
  uint64_t v5 = [(SVXAlarmAndTimerFiringContext *)&v10 description];
  unint64_t v6 = (void *)v5;
  if (self->_hasOtherRunningTimers) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = (void *)[v4 initWithFormat:@"%@ {orderedFiringAlarms = %@, orderedFiringTimers = %@, BOOL hasOtherRunningTimers = %@}", v5, self->_orderedFiringAlarms, self->_orderedFiringTimers, v7];

  return v8;
}

- (id)description
{
  return [(SVXAlarmAndTimerFiringContext *)self _descriptionWithIndent:0];
}

- (SVXAlarmAndTimerFiringContext)initWithOrderedFiringAlarms:(id)a3 orderedFiringTimers:(id)a4 hasOtherRunningTimers:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXAlarmAndTimerFiringContext;
  objc_super v10 = [(SVXAlarmAndTimerFiringContext *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    orderedFiringAlarms = v10->_orderedFiringAlarms;
    v10->_orderedFiringAlarms = (NSOrderedSet *)v11;

    uint64_t v13 = [v9 copy];
    orderedFiringTimers = v10->_orderedFiringTimers;
    v10->_orderedFiringTimers = (NSOrderedSet *)v13;

    v10->_BOOL hasOtherRunningTimers = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXAlarmAndTimerFiringContextMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SVXAlarmAndTimerFiringContextMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXAlarmAndTimerFiringContextMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXAlarmAndTimerFiringContext *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  uint64_t v3 = (void (**)(id, _SVXAlarmAndTimerFiringContextMutation *))a3;
  id v4 = objc_alloc_init(_SVXAlarmAndTimerFiringContextMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SVXAlarmAndTimerFiringContextMutation *)v4 generate];

  return v5;
}

@end