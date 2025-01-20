@interface SCDAContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SCDAContext)init;
- (SCDAContext)initWithBuilder:(id)a3;
- (SCDAContext)initWithCoder:(id)a3;
- (SCDAContext)initWithTimestamp:(unint64_t)a3 perceptualAudioHash:(id)a4 overrideState:(id)a5 activationSource:(int64_t)a6 activationExpirationTime:(unint64_t)a7;
- (SCDAGoodnessScoreOverrideState)overrideState;
- (SCDAPerceptualAudioHash)perceptualAudioHash;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)activationSource;
- (unint64_t)activationExpirationTime;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCDAContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_perceptualAudioHash, 0);
}

- (unint64_t)activationExpirationTime
{
  return self->_activationExpirationTime;
}

- (int64_t)activationSource
{
  return self->_activationSource;
}

- (SCDAGoodnessScoreOverrideState)overrideState
{
  return self->_overrideState;
}

- (SCDAPerceptualAudioHash)perceptualAudioHash
{
  return self->_perceptualAudioHash;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t timestamp = self->_timestamp;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:timestamp];
  [v6 encodeObject:v7 forKey:@"SCDAContext::timestamp"];

  [v6 encodeObject:self->_perceptualAudioHash forKey:@"SCDAContext::perceptualAudioHash"];
  [v6 encodeObject:self->_overrideState forKey:@"SCDAContext::overrideState"];
  v8 = [NSNumber numberWithInteger:self->_activationSource];
  [v6 encodeObject:v8 forKey:@"SCDAContext::activationSource"];

  id v9 = [NSNumber numberWithUnsignedLongLong:self->_activationExpirationTime];
  [v6 encodeObject:v9 forKey:@"SCDAContext::activationExpirationTime"];
}

- (SCDAContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAContext::timestamp"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAContext::perceptualAudioHash"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAContext::overrideState"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAContext::activationSource"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAContext::activationExpirationTime"];

  uint64_t v12 = [v11 unsignedLongLongValue];
  v13 = [(SCDAContext *)self initWithTimestamp:v6 perceptualAudioHash:v7 overrideState:v8 activationSource:v10 activationExpirationTime:v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCDAContext *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t timestamp = self->_timestamp;
      if (timestamp == [(SCDAContext *)v5 timestamp]
        && (int64_t activationSource = self->_activationSource,
            activationSource == [(SCDAContext *)v5 activationSource])
        && (unint64_t activationExpirationTime = self->_activationExpirationTime,
            activationExpirationTime == [(SCDAContext *)v5 activationExpirationTime]))
      {
        id v9 = [(SCDAContext *)v5 perceptualAudioHash];
        perceptualAudioHash = self->_perceptualAudioHash;
        if (perceptualAudioHash == v9 || [(SCDAPerceptualAudioHash *)perceptualAudioHash isEqual:v9])
        {
          v11 = [(SCDAContext *)v5 overrideState];
          overrideState = self->_overrideState;
          BOOL v13 = overrideState == v11 || [(SCDAGoodnessScoreOverrideState *)overrideState isEqual:v11];
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SCDAPerceptualAudioHash *)self->_perceptualAudioHash hash];
  unint64_t v6 = v5 ^ [(SCDAGoodnessScoreOverrideState *)self->_overrideState hash] ^ v4;
  v7 = [NSNumber numberWithInteger:self->_activationSource];
  uint64_t v8 = [v7 hash];
  id v9 = [NSNumber numberWithUnsignedLongLong:self->_activationExpirationTime];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SCDAContext;
  unint64_t v5 = [(SCDAContext *)&v11 description];
  long long v10 = *(_OWORD *)&self->_timestamp;
  overrideState = self->_overrideState;
  v7 = AFSiriActivationSourceGetName();
  v8 = (void *)[v4 initWithFormat:@"%@ {unint64_t timestamp = %llu, perceptualAudioHash = %@, overrideState = %@, activationSource = %@, activationExpirationTime = %llu}", v5, v10, overrideState, v7, self->_activationExpirationTime];

  return v8;
}

- (id)description
{
  return [(SCDAContext *)self _descriptionWithIndent:0];
}

- (SCDAContext)initWithTimestamp:(unint64_t)a3 perceptualAudioHash:(id)a4 overrideState:(id)a5 activationSource:(int64_t)a6 activationExpirationTime:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __109__SCDAContext_initWithTimestamp_perceptualAudioHash_overrideState_activationSource_activationExpirationTime___block_invoke;
  v18[3] = &unk_2654B7550;
  id v19 = v12;
  id v20 = v13;
  unint64_t v21 = a3;
  int64_t v22 = a6;
  unint64_t v23 = a7;
  id v14 = v13;
  id v15 = v12;
  v16 = [(SCDAContext *)self initWithBuilder:v18];

  return v16;
}

void __109__SCDAContext_initWithTimestamp_perceptualAudioHash_overrideState_activationSource_activationExpirationTime___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  [v4 setTimestamp:v3];
  [v4 setPerceptualAudioHash:a1[4]];
  [v4 setOverrideState:a1[5]];
  [v4 setActivationSource:a1[7]];
  [v4 setActivationExpirationTime:a1[8]];
}

- (SCDAContext)init
{
  return [(SCDAContext *)self initWithBuilder:0];
}

- (SCDAContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SCDAContextMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SCDAContext;
  unint64_t v5 = [(SCDAContext *)&v15 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_SCDAContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SCDAContextMutation *)v7 isDirty])
    {
      v6->_unint64_t timestamp = [(_SCDAContextMutation *)v7 getTimestamp];
      uint64_t v8 = [(_SCDAContextMutation *)v7 getPerceptualAudioHash];
      uint64_t v9 = [v8 copy];
      perceptualAudioHash = v6->_perceptualAudioHash;
      v6->_perceptualAudioHash = (SCDAPerceptualAudioHash *)v9;

      objc_super v11 = [(_SCDAContextMutation *)v7 getOverrideState];
      uint64_t v12 = [v11 copy];
      overrideState = v6->_overrideState;
      v6->_overrideState = (SCDAGoodnessScoreOverrideState *)v12;

      v6->_int64_t activationSource = [(_SCDAContextMutation *)v7 getActivationSource];
      v6->_unint64_t activationExpirationTime = [(_SCDAContextMutation *)v7 getActivationExpirationTime];
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
  id v4 = (void (**)(id, _SCDAContextMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_SCDAContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SCDAContextMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(SCDAContext);
      v6->_unint64_t timestamp = [(_SCDAContextMutation *)v5 getTimestamp];
      v7 = [(_SCDAContextMutation *)v5 getPerceptualAudioHash];
      uint64_t v8 = [v7 copy];
      perceptualAudioHash = v6->_perceptualAudioHash;
      v6->_perceptualAudioHash = (SCDAPerceptualAudioHash *)v8;

      long long v10 = [(_SCDAContextMutation *)v5 getOverrideState];
      uint64_t v11 = [v10 copy];
      overrideState = v6->_overrideState;
      v6->_overrideState = (SCDAGoodnessScoreOverrideState *)v11;

      v6->_int64_t activationSource = [(_SCDAContextMutation *)v5 getActivationSource];
      v6->_unint64_t activationExpirationTime = [(_SCDAContextMutation *)v5 getActivationExpirationTime];
    }
    else
    {
      unint64_t v6 = (SCDAContext *)[(SCDAContext *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (SCDAContext *)[(SCDAContext *)self copy];
  }

  return v6;
}

@end