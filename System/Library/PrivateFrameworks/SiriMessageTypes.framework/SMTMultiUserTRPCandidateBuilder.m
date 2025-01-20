@interface SMTMultiUserTRPCandidateBuilder
- (NSArray)trpCandidateList;
- (NSString)multiUserTrpCandidateId;
- (NSString)requestId;
- (SMTMultiUserTRPCandidateBuilder)init;
- (id)initBuilderWithTrpCandidateId:(id)a3 requestId:(id)a4 trpCandidateList:(id)a5;
- (id)initBuilderWithTrpCandidateId:(id)a3 trpCandidateList:(id)a4;
- (void)setMultiUserTrpCandidateId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTrpCandidateList:(id)a3;
@end

@implementation SMTMultiUserTRPCandidateBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpCandidateList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_multiUserTrpCandidateId, 0);
}

- (void)setTrpCandidateList:(id)a3
{
}

- (NSArray)trpCandidateList
{
  return self->_trpCandidateList;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setMultiUserTrpCandidateId:(id)a3
{
}

- (NSString)multiUserTrpCandidateId
{
  return self->_multiUserTrpCandidateId;
}

- (id)initBuilderWithTrpCandidateId:(id)a3 trpCandidateList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SMTMultiUserTRPCandidateBuilder;
  v9 = [(SMTMultiUserTRPCandidateBuilder *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_multiUserTrpCandidateId, a3);
    uint64_t v11 = [v8 copy];
    trpCandidateList = v10->_trpCandidateList;
    v10->_trpCandidateList = (NSArray *)v11;
  }
  return v10;
}

- (id)initBuilderWithTrpCandidateId:(id)a3 requestId:(id)a4 trpCandidateList:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SMTMultiUserTRPCandidateBuilder;
  v12 = [(SMTMultiUserTRPCandidateBuilder *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_multiUserTrpCandidateId, a3);
    objc_storeStrong((id *)&v13->_requestId, a4);
    uint64_t v14 = [v11 copy];
    trpCandidateList = v13->_trpCandidateList;
    v13->_trpCandidateList = (NSArray *)v14;
  }
  return v13;
}

- (SMTMultiUserTRPCandidateBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)SMTMultiUserTRPCandidateBuilder;
  return [(SMTMultiUserTRPCandidateBuilder *)&v3 init];
}

@end