@interface _SMTContinuityEndMutation
- (BOOL)isDirty;
- (_SMTContinuityEndMutation)initWithBase:(id)a3;
- (id)getLastTRPCandidateId;
- (id)getRequestId;
- (unint64_t)getGeneratedHostTime;
- (void)setGeneratedHostTime:(unint64_t)a3;
- (void)setLastTRPCandidateId:(id)a3;
- (void)setRequestId:(id)a3;
@end

@implementation _SMTContinuityEndMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setRequestId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getRequestId
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_requestId;
  }
  else
  {
    v2 = [(SMTContinuityEnd *)self->_base requestId];
  }
  return v2;
}

- (void)setLastTRPCandidateId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getLastTRPCandidateId
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_lastTRPCandidateId;
  }
  else
  {
    v2 = [(SMTContinuityEnd *)self->_base lastTRPCandidateId];
  }
  return v2;
}

- (void)setGeneratedHostTime:(unint64_t)a3
{
  self->_generatedHostTime = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getGeneratedHostTime
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_generatedHostTime;
  }
  else {
    return [(SMTContinuityEnd *)self->_base generatedHostTime];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_SMTContinuityEndMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTContinuityEndMutation;
  v6 = [(_SMTContinuityEndMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end