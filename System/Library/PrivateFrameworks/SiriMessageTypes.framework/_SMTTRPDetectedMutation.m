@interface _SMTTRPDetectedMutation
- (BOOL)isDirty;
- (_SMTTRPDetectedMutation)initWithBase:(id)a3;
- (double)getTrpDetectedAudioTimeStamp;
- (id)getLastTRPCandidateId;
- (id)getRequestId;
- (unint64_t)getGeneratedHostTime;
- (void)setGeneratedHostTime:(unint64_t)a3;
- (void)setLastTRPCandidateId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTrpDetectedAudioTimeStamp:(double)a3;
@end

@implementation _SMTTRPDetectedMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPCandidateId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setTrpDetectedAudioTimeStamp:(double)a3
{
  self->_trpDetectedAudioTimeStamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (double)getTrpDetectedAudioTimeStamp
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_trpDetectedAudioTimeStamp;
  }
  [(SMTTRPDetected *)self->_base trpDetectedAudioTimeStamp];
  return result;
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
    v2 = [(SMTTRPDetected *)self->_base requestId];
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
    v2 = [(SMTTRPDetected *)self->_base lastTRPCandidateId];
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
    return [(SMTTRPDetected *)self->_base generatedHostTime];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_SMTTRPDetectedMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTTRPDetectedMutation;
  v6 = [(_SMTTRPDetectedMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end