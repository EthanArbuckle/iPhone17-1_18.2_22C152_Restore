@interface SMTTRPDetected
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)lastTRPCandidateId;
- (NSString)requestId;
- (SMTTRPDetected)init;
- (SMTTRPDetected)initWithBuilder:(id)a3;
- (SMTTRPDetected)initWithCoder:(id)a3;
- (SMTTRPDetected)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 trpDetectedAudioTimeStamp:(double)a5;
- (SMTTRPDetected)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 trpDetectedAudioTimeStamp:(double)a5 requestId:(id)a6;
- (double)trpDetectedAudioTimeStamp;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generatedHostTime;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTTRPDetected

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
}

- (double)trpDetectedAudioTimeStamp
{
  return self->_trpDetectedAudioTimeStamp;
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
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:generatedHostTime];
  [v6 encodeObject:v7 forKey:@"SMTTRPDetected::generatedHostTime"];

  [v6 encodeObject:self->_lastTRPCandidateId forKey:@"SMTTRPDetected::lastTRPCandidateId"];
  [v6 encodeObject:self->_requestId forKey:@"SMTTRPDetected::requestId"];
  id v8 = [NSNumber numberWithDouble:self->_trpDetectedAudioTimeStamp];
  [v6 encodeObject:v8 forKey:@"SMTTRPDetected::trpDetectedAudioTimeStamp"];
}

- (SMTTRPDetected)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTRPDetected::generatedHostTime"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTRPDetected::lastTRPCandidateId"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTRPDetected::requestId"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTRPDetected::trpDetectedAudioTimeStamp"];

  [v9 doubleValue];
  double v11 = v10;

  v12 = [(SMTTRPDetected *)self initWithGeneratedHostTime:v6 lastTRPCandidateId:v7 trpDetectedAudioTimeStamp:v8 requestId:v11];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SMTTRPDetected *)a3;
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
      unint64_t generatedHostTime = self->_generatedHostTime;
      if (generatedHostTime == [(SMTTRPDetected *)v5 generatedHostTime]
        && (double trpDetectedAudioTimeStamp = self->_trpDetectedAudioTimeStamp,
            [(SMTTRPDetected *)v5 trpDetectedAudioTimeStamp],
            trpDetectedAudioTimeStamp == v8))
      {
        double v11 = [(SMTTRPDetected *)v5 lastTRPCandidateId];
        lastTRPCandidateId = self->_lastTRPCandidateId;
        if (lastTRPCandidateId == v11 || [(NSString *)lastTRPCandidateId isEqual:v11])
        {
          v13 = [(SMTTRPDetected *)v5 requestId];
          requestId = self->_requestId;
          BOOL v9 = requestId == v13 || [(NSString *)requestId isEqual:v13];
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
  v3 = [NSNumber numberWithUnsignedLongLong:self->_generatedHostTime];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_lastTRPCandidateId hash] ^ v4;
  uint64_t v6 = [NSNumber numberWithDouble:self->_trpDetectedAudioTimeStamp];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SMTTRPDetected;
  NSUInteger v5 = [(SMTTRPDetected *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t generatedHostTime = %llu, lastTRPCandidateId = %@, requestId = %@trpDetectedAudioTimeStamp = %f}", v5, self->_generatedHostTime, self->_lastTRPCandidateId, self->_requestId, *(void *)&self->_trpDetectedAudioTimeStamp];

  return v6;
}

- (id)description
{
  return [(SMTTRPDetected *)self _descriptionWithIndent:0];
}

- (SMTTRPDetected)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 trpDetectedAudioTimeStamp:(double)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp___block_invoke;
  v12[3] = &unk_265503F68;
  id v13 = v8;
  unint64_t v14 = a3;
  double v15 = a5;
  id v9 = v8;
  double v10 = [(SMTTRPDetected *)self initWithBuilder:v12];

  return v10;
}

void __89__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setGeneratedHostTime:v3];
  [v4 setLastTRPCandidateId:*(void *)(a1 + 32)];
  [v4 setRequestId:0];
  [v4 setTrpDetectedAudioTimeStamp:*(double *)(a1 + 48)];
}

- (SMTTRPDetected)initWithGeneratedHostTime:(unint64_t)a3 lastTRPCandidateId:(id)a4 trpDetectedAudioTimeStamp:(double)a5 requestId:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __99__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp_requestId___block_invoke;
  v16[3] = &unk_265503F40;
  id v18 = v11;
  unint64_t v19 = a3;
  id v17 = v10;
  double v20 = a5;
  id v12 = v11;
  id v13 = v10;
  unint64_t v14 = [(SMTTRPDetected *)self initWithBuilder:v16];

  return v14;
}

void __99__SMTTRPDetected_initWithGeneratedHostTime_lastTRPCandidateId_trpDetectedAudioTimeStamp_requestId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  [v4 setGeneratedHostTime:v3];
  [v4 setLastTRPCandidateId:*(void *)(a1 + 32)];
  [v4 setRequestId:*(void *)(a1 + 40)];
  [v4 setTrpDetectedAudioTimeStamp:*(double *)(a1 + 56)];
}

- (SMTTRPDetected)init
{
  return [(SMTTRPDetected *)self initWithBuilder:0];
}

- (SMTTRPDetected)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SMTTRPDetectedMutation *))a3;
  v16.receiver = self;
  v16.super_class = (Class)SMTTRPDetected;
  NSUInteger v5 = [(SMTTRPDetected *)&v16 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_SMTTRPDetectedMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SMTTRPDetectedMutation *)v7 isDirty])
    {
      v6->_unint64_t generatedHostTime = [(_SMTTRPDetectedMutation *)v7 getGeneratedHostTime];
      id v8 = [(_SMTTRPDetectedMutation *)v7 getLastTRPCandidateId];
      uint64_t v9 = [v8 copy];
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v9;

      id v11 = [(_SMTTRPDetectedMutation *)v7 getRequestId];
      uint64_t v12 = [v11 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;

      [(_SMTTRPDetectedMutation *)v7 getTrpDetectedAudioTimeStamp];
      v6->_double trpDetectedAudioTimeStamp = v14;
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
  id v4 = (void (**)(id, _SMTTRPDetectedMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SMTTRPDetectedMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SMTTRPDetectedMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(SMTTRPDetected);
      v6->_unint64_t generatedHostTime = [(_SMTTRPDetectedMutation *)v5 getGeneratedHostTime];
      unint64_t v7 = [(_SMTTRPDetectedMutation *)v5 getLastTRPCandidateId];
      uint64_t v8 = [v7 copy];
      lastTRPCandidateId = v6->_lastTRPCandidateId;
      v6->_lastTRPCandidateId = (NSString *)v8;

      id v10 = [(_SMTTRPDetectedMutation *)v5 getRequestId];
      uint64_t v11 = [v10 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;

      [(_SMTTRPDetectedMutation *)v5 getTrpDetectedAudioTimeStamp];
      v6->_double trpDetectedAudioTimeStamp = v13;
    }
    else
    {
      uint64_t v6 = (SMTTRPDetected *)[(SMTTRPDetected *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (SMTTRPDetected *)[(SMTTRPDetected *)self copy];
  }

  return v6;
}

@end