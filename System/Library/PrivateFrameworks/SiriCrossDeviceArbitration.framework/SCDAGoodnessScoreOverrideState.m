@interface SCDAGoodnessScoreOverrideState
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)reason;
- (SCDAGoodnessScoreOverrideState)init;
- (SCDAGoodnessScoreOverrideState)initWithBuilder:(id)a3;
- (SCDAGoodnessScoreOverrideState)initWithCoder:(id)a3;
- (SCDAGoodnessScoreOverrideState)initWithOverrideOption:(int64_t)a3 reason:(id)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)overrideOption;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCDAGoodnessScoreOverrideState

- (void).cxx_destruct
{
}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)overrideOption
{
  return self->_overrideOption;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t overrideOption = self->_overrideOption;
  id v7 = a3;
  v6 = [v4 numberWithInteger:overrideOption];
  [v7 encodeObject:v6 forKey:@"SCDAGoodnessScoreOverrideState::overrideOption"];

  [v7 encodeObject:self->_reason forKey:@"SCDAGoodnessScoreOverrideState::reason"];
}

- (SCDAGoodnessScoreOverrideState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAGoodnessScoreOverrideState::overrideOption"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAGoodnessScoreOverrideState::reason"];

  v8 = [(SCDAGoodnessScoreOverrideState *)self initWithOverrideOption:v6 reason:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCDAGoodnessScoreOverrideState *)a3;
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
      int64_t overrideOption = self->_overrideOption;
      if (overrideOption == [(SCDAGoodnessScoreOverrideState *)v5 overrideOption])
      {
        id v7 = [(SCDAGoodnessScoreOverrideState *)v5 reason];
        reason = self->_reason;
        BOOL v9 = reason == v7 || [(NSString *)reason isEqual:v7];
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
  v3 = [NSNumber numberWithInteger:self->_overrideOption];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_reason hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SCDAGoodnessScoreOverrideState;
  NSUInteger v5 = [(SCDAGoodnessScoreOverrideState *)&v11 description];
  unint64_t overrideOption = self->_overrideOption;
  if (overrideOption > 2) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_2654B7A28[overrideOption];
  }
  v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t overrideOption = %@, reason = %@}", v5, v8, self->_reason];

  return v9;
}

- (id)description
{
  return [(SCDAGoodnessScoreOverrideState *)self _descriptionWithIndent:0];
}

- (SCDAGoodnessScoreOverrideState)initWithOverrideOption:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__SCDAGoodnessScoreOverrideState_initWithOverrideOption_reason___block_invoke;
  v10[3] = &unk_2654B7B88;
  id v11 = v6;
  int64_t v12 = a3;
  id v7 = v6;
  v8 = [(SCDAGoodnessScoreOverrideState *)self initWithBuilder:v10];

  return v8;
}

void __64__SCDAGoodnessScoreOverrideState_initWithOverrideOption_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setOverrideOption:v3];
  [v4 setReason:*(void *)(a1 + 32)];
}

- (SCDAGoodnessScoreOverrideState)init
{
  return [(SCDAGoodnessScoreOverrideState *)self initWithBuilder:0];
}

- (SCDAGoodnessScoreOverrideState)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SCDAGoodnessScoreOverrideStateMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SCDAGoodnessScoreOverrideState;
  NSUInteger v5 = [(SCDAGoodnessScoreOverrideState *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_SCDAGoodnessScoreOverrideStateMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SCDAGoodnessScoreOverrideStateMutation *)v7 isDirty])
    {
      v6->_unint64_t overrideOption = [(_SCDAGoodnessScoreOverrideStateMutation *)v7 getOverrideOption];
      v8 = [(_SCDAGoodnessScoreOverrideStateMutation *)v7 getReason];
      uint64_t v9 = [v8 copy];
      reason = v6->_reason;
      v6->_reason = (NSString *)v9;
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
  id v4 = (void (**)(id, _SCDAGoodnessScoreOverrideStateMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SCDAGoodnessScoreOverrideStateMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SCDAGoodnessScoreOverrideStateMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(SCDAGoodnessScoreOverrideState);
      v6->_unint64_t overrideOption = [(_SCDAGoodnessScoreOverrideStateMutation *)v5 getOverrideOption];
      id v7 = [(_SCDAGoodnessScoreOverrideStateMutation *)v5 getReason];
      uint64_t v8 = [v7 copy];
      reason = v6->_reason;
      v6->_reason = (NSString *)v8;
    }
    else
    {
      id v6 = (SCDAGoodnessScoreOverrideState *)[(SCDAGoodnessScoreOverrideState *)self copy];
    }
  }
  else
  {
    id v6 = (SCDAGoodnessScoreOverrideState *)[(SCDAGoodnessScoreOverrideState *)self copy];
  }

  return v6;
}

@end