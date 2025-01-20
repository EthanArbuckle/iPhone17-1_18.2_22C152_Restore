@interface _SMTTRPCandidateMutation
- (BOOL)getIsContinuous;
- (BOOL)isDirty;
- (_SMTTRPCandidateMutation)initWithBase:(id)a3;
- (id)getRequestId;
- (id)getTcuList;
- (id)getTrpCandidateId;
- (id)getUserId;
- (void)setIsContinuous:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)setTcuList:(id)a3;
- (void)setTrpCandidateId:(id)a3;
- (void)setUserId:(id)a3;
@end

@implementation _SMTTRPCandidateMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_tcuList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_trpCandidateId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setIsContinuous:(BOOL)a3
{
  self->_isContinuous = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getIsContinuous
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_isContinuous;
  }
  else {
    return [(SMTTRPCandidate *)self->_base isContinuous];
  }
}

- (void)setUserId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getUserId
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_userId;
  }
  else
  {
    v2 = [(SMTTRPCandidate *)self->_base userId];
  }
  return v2;
}

- (void)setTcuList:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getTcuList
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_tcuList;
  }
  else
  {
    v2 = [(SMTTRPCandidate *)self->_base tcuList];
  }
  return v2;
}

- (void)setRequestId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getRequestId
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_requestId;
  }
  else
  {
    v2 = [(SMTTRPCandidate *)self->_base requestId];
  }
  return v2;
}

- (void)setTrpCandidateId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getTrpCandidateId
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_trpCandidateId;
  }
  else
  {
    v2 = [(SMTTRPCandidate *)self->_base trpCandidateId];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_SMTTRPCandidateMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTTRPCandidateMutation;
  v6 = [(_SMTTRPCandidateMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end