@interface SMTContinuityEnd
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)lastTRPCandidateId;
- (NSString)requestId;
- (SMTContinuityEnd)init;
- (SMTContinuityEnd)initWithBuilder:(id)a3;
- (SMTContinuityEnd)initWithCoder:(id)a3;
- (SMTContinuityEnd)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4;
- (SMTContinuityEnd)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 requestId:(id)a5;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generatedHostTime;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTContinuityEnd

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)lastTRPCandidateId
{
  return self->_lastTRPCandidateId;
}

- (unint64_t)generatedHostTime
{
  return self->_generatedHostTime;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t generatedHostTime = self->_generatedHostTime;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedLongLong:generatedHostTime];
  [v7 encodeObject:v6 forKey:@"SMTContinuityEnd::generatedHostTime"];

  [v7 encodeObject:self->_lastTRPCandidateId forKey:@"SMTContinuityEnd::lastTRPCandidateId"];
  [v7 encodeObject:self->_requestId forKey:@"SMTContinuityEnd::requestId"];
}

- (SMTContinuityEnd)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTContinuityEnd::generatedHostTime"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTContinuityEnd::lastTRPCandidateId"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTContinuityEnd::requestId"];

  v9 = [(SMTContinuityEnd *)self initWithGeneratedHostTime:v6 lastTRPCandidateId:v7 requestId:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SMTContinuityEnd *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t generatedHostTime = self->_generatedHostTime;
      if (generatedHostTime == [(SMTContinuityEnd *)v5 generatedHostTime])
      {
        id v7 = [(SMTContinuityEnd *)v5 lastTRPCandidateId];
        lastTRPCandidateId = self->_lastTRPCandidateId;
        if (lastTRPCandidateId == v7 || [(NSString *)lastTRPCandidateId isEqual:v7])
        {
          v9 = [(SMTContinuityEnd *)v5 requestId];
          requestId = self->_requestId;
          BOOL v11 = requestId == v9 || [(NSString *)requestId isEqual:v9];
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
  v3 = [NSNumber numberWithUnsignedLongLong:self->_generatedHostTime];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_lastTRPCandidateId hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_requestId hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SMTContinuityEnd;
  NSUInteger v5 = [(SMTContinuityEnd *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t generatedHostTime = %llu, lastTRPCandidateId = %@, requestId = %@}", v5, self->_generatedHostTime, self->_lastTRPCandidateId, self->_requestId];

  return v6;
}

- (id)description
{
  return [(SMTContinuityEnd *)self _descriptionWithIndent:0];
}

- (SMTContinuityEnd)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId___block_invoke;
  v10[3] = &unk_265503BC8;
  id v11 = v6;
  unint64_t v12 = a3;
  id v7 = v6;
  objc_super v8 = [(SMTContinuityEnd *)self initWithBuilder:v10];

  return v8;
}

void __65__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setGeneratedHostTime:v3];
  [v4 setLastTRPCandidateId:*(void *)(a1 + 32)];
  [v4 setRequestId:0];
}

- (SMTContinuityEnd)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 requestId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId_requestId___block_invoke;
  v14[3] = &unk_265503BA0;
  id v16 = v9;
  unint64_t v17 = a3;
  id v15 = v8;
  id v10 = v9;
  id v11 = v8;
  unint64_t v12 = [(SMTContinuityEnd *)self initWithBuilder:v14];

  return v12;
}

void __75__SMTContinuityEnd_initWithGeneratedHostTime_lastTRPCandidateId_requestId___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  [v4 setGeneratedHostTime:v3];
  [v4 setLastTRPCandidateId:a1[4]];
  [v4 setRequestId:a1[5]];
}

- (SMTContinuityEnd)init
{
  return [(SMTContinuityEnd *)self initWithBuilder:0];
}

- (SMTContinuityEnd)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SMTContinuityEndMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SMTContinuityEnd;
  NSUInteger v5 = [(SMTContinuityEnd *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_SMTContinuityEndMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SMTContinuityEndMutation *)v7 isDirty])
    {
      v6->_unint64_t generatedHostTime = [(_SMTContinuityEndMutation *)v7 getGeneratedHostTime];
      id v8 = [(_SMTContinuityEndMutation *)v7 getLastTRPCandidateId];
      uint64_t v9 = [v8 copy];
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v9;

      id v11 = [(_SMTContinuityEndMutation *)v7 getRequestId];
      uint64_t v12 = [v11 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;
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
  id v4 = (void (**)(id, _SMTContinuityEndMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SMTContinuityEndMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SMTContinuityEndMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(SMTContinuityEnd);
      v6->_unint64_t generatedHostTime = [(_SMTContinuityEndMutation *)v5 getGeneratedHostTime];
      id v7 = [(_SMTContinuityEndMutation *)v5 getLastTRPCandidateId];
      uint64_t v8 = [v7 copy];
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v8;

      id v10 = [(_SMTContinuityEndMutation *)v5 getRequestId];
      uint64_t v11 = [v10 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;
    }
    else
    {
      id v6 = (SMTContinuityEnd *)[(SMTContinuityEnd *)self copy];
    }
  }
  else
  {
    id v6 = (SMTContinuityEnd *)[(SMTContinuityEnd *)self copy];
  }

  return v6;
}

@end