@interface SMTMultiUserTRPCandidate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)trpCandidateList;
- (NSString)multiUserTrpCandidateId;
- (NSString)requestId;
- (SMTMultiUserTRPCandidate)initWithBuilder:(id)a3;
- (SMTMultiUserTRPCandidate)initWithCoder:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTMultiUserTRPCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpCandidateList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_multiUserTrpCandidateId, 0);
}

- (NSArray)trpCandidateList
{
  return self->_trpCandidateList;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)multiUserTrpCandidateId
{
  return self->_multiUserTrpCandidateId;
}

- (void)encodeWithCoder:(id)a3
{
  multiUserTrpCandidateId = self->_multiUserTrpCandidateId;
  id v5 = a3;
  [v5 encodeObject:multiUserTrpCandidateId forKey:@"multiUserTrpCandidateId"];
  [v5 encodeObject:self->_requestId forKey:@"requestId"];
  [v5 encodeObject:self->_trpCandidateList forKey:@"trpCandidateList"];
}

- (SMTMultiUserTRPCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multiUserTrpCandidateId"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"trpCandidateList"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__SMTMultiUserTRPCandidate_initWithCoder___block_invoke;
  v16[3] = &unk_265503C08;
  id v17 = v5;
  id v18 = v10;
  id v19 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v5;
  v14 = [(SMTMultiUserTRPCandidate *)self initWithBuilder:v16];

  return v14;
}

void __42__SMTMultiUserTRPCandidate_initWithCoder___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setMultiUserTrpCandidateId:v3];
  [v4 setRequestId:a1[5]];
  [v4 setTrpCandidateList:a1[6]];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SMTMultiUserTRPCandidate *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(SMTMultiUserTRPCandidate *)v5 multiUserTrpCandidateId];
      multiUserTrpCandidateId = self->_multiUserTrpCandidateId;
      if (multiUserTrpCandidateId == v6 || [(NSString *)multiUserTrpCandidateId isEqual:v6])
      {
        v8 = [(SMTMultiUserTRPCandidate *)v5 requestId];
        requestId = self->_requestId;
        if (requestId == v8 || [(NSString *)requestId isEqual:v8])
        {
          v10 = [(SMTMultiUserTRPCandidate *)v5 trpCandidateList];
          trpCandidateList = self->_trpCandidateList;
          BOOL v12 = trpCandidateList == v10 || [(NSArray *)trpCandidateList isEqual:v10];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_multiUserTrpCandidateId hash];
  uint64_t v4 = [(NSArray *)self->_trpCandidateList hash] ^ v3;
  return v4 ^ [(NSString *)self->_requestId hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SMTMultiUserTRPCandidate;
  id v5 = [(SMTMultiUserTRPCandidate *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {multiUserTrpCandidateId = %@, requestId = %@, trpCandidateList = %@}", v5, self->_multiUserTrpCandidateId, self->_requestId, self->_trpCandidateList];

  return v6;
}

- (id)description
{
  return [(SMTMultiUserTRPCandidate *)self _descriptionWithIndent:0];
}

- (SMTMultiUserTRPCandidate)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, SMTMultiUserTRPCandidateBuilder *))a3;
  v16.receiver = self;
  v16.super_class = (Class)SMTMultiUserTRPCandidate;
  id v5 = [(SMTMultiUserTRPCandidate *)&v16 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = objc_alloc_init(SMTMultiUserTRPCandidateBuilder);
    v4[2](v4, v7);
    uint64_t v8 = [(SMTMultiUserTRPCandidateBuilder *)v7 multiUserTrpCandidateId];
    multiUserTrpCandidateId = v6->_multiUserTrpCandidateId;
    v6->_multiUserTrpCandidateId = (NSString *)v8;

    uint64_t v10 = [(SMTMultiUserTRPCandidateBuilder *)v7 requestId];
    requestId = v6->_requestId;
    v6->_requestId = (NSString *)v10;

    BOOL v12 = [(SMTMultiUserTRPCandidateBuilder *)v7 trpCandidateList];
    uint64_t v13 = [v12 copy];
    trpCandidateList = v6->_trpCandidateList;
    v6->_trpCandidateList = (NSArray *)v13;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end