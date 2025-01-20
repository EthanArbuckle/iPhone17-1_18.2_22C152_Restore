@interface SMTTRPCandidate
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isContinuous;
- (BOOL)isEqual:(id)a3;
- (NSArray)tcuList;
- (NSString)requestId;
- (NSString)trpCandidateId;
- (NSString)userId;
- (SMTTRPCandidate)init;
- (SMTTRPCandidate)initWithBuilder:(id)a3;
- (SMTTRPCandidate)initWithCoder:(id)a3;
- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 requestId:(id)a4 tcuList:(id)a5;
- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 requestId:(id)a4 tcuList:(id)a5 userId:(id)a6;
- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 tcuList:(id)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTTRPCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_tcuList, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_trpCandidateId, 0);
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (NSString)userId
{
  return self->_userId;
}

- (NSArray)tcuList
{
  return self->_tcuList;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)trpCandidateId
{
  return self->_trpCandidateId;
}

- (void)encodeWithCoder:(id)a3
{
  trpCandidateId = self->_trpCandidateId;
  id v5 = a3;
  [v5 encodeObject:trpCandidateId forKey:@"trpCandidateId"];
  [v5 encodeObject:self->_requestId forKey:@"requestId"];
  [v5 encodeObject:self->_tcuList forKey:@"tcuList"];
  [v5 encodeObject:self->_userId forKey:@"userId"];
  id v6 = [NSNumber numberWithBool:self->_isContinuous];
  [v5 encodeObject:v6 forKey:@"isContinuous"];
}

- (SMTTRPCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trpCandidateId"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"tcuList"];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userId"];
  char v12 = [v4 decodeBoolForKey:@"isContinuous"];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __33__SMTTRPCandidate_initWithCoder___block_invoke;
  v19[3] = &unk_265503EF8;
  id v20 = v5;
  id v21 = v6;
  id v22 = v10;
  id v23 = v11;
  char v24 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v6;
  id v16 = v5;
  v17 = [(SMTTRPCandidate *)self initWithBuilder:v19];

  return v17;
}

void __33__SMTTRPCandidate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTrpCandidateId:v3];
  [v4 setRequestId:*(void *)(a1 + 40)];
  [v4 setTcuList:*(void *)(a1 + 48)];
  [v4 setUserId:*(void *)(a1 + 56)];
  [v4 setIsContinuous:*(unsigned __int8 *)(a1 + 64)];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SMTTRPCandidate *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(SMTTRPCandidate *)v5 trpCandidateId];
      trpCandidateId = self->_trpCandidateId;
      if (trpCandidateId == v6 || [(NSString *)trpCandidateId isEqual:v6])
      {
        uint64_t v8 = [(SMTTRPCandidate *)v5 requestId];
        requestId = self->_requestId;
        if (requestId == v8 || [(NSString *)requestId isEqual:v8])
        {
          v10 = [(SMTTRPCandidate *)v5 tcuList];
          tcuList = self->_tcuList;
          if (tcuList == v10 || [(NSArray *)tcuList isEqual:v10])
          {
            char v12 = [(SMTTRPCandidate *)v5 userId];
            userId = self->_userId;
            BOOL v14 = (userId == v12 || [(NSString *)userId isEqual:v12])
               && self->_isContinuous == [(SMTTRPCandidate *)v5 isContinuous];
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_trpCandidateId hash];
  uint64_t v4 = [(NSArray *)self->_tcuList hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_userId hash];
  id v6 = [NSNumber numberWithBool:self->_isContinuous];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SMTTRPCandidate;
  NSUInteger v5 = [(SMTTRPCandidate *)&v8 description];
  id v6 = (void *)[v4 initWithFormat:@"%@ {trpCandidateId = %@, requestId = %@, tcuList = %@, userId = %@, isContinuous = %u}", v5, self->_trpCandidateId, self->_requestId, self->_tcuList, self->_userId, self->_isContinuous];

  return v6;
}

- (id)description
{
  return [(SMTTRPCandidate *)self _descriptionWithIndent:0];
}

- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 requestId:(id)a4 tcuList:(id)a5 userId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __67__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList_userId___block_invoke;
  v20[3] = &unk_265503ED0;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  v18 = [(SMTTRPCandidate *)self initWithBuilder:v20];

  return v18;
}

void __67__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList_userId___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTrpCandidateId:v3];
  [v4 setRequestId:a1[5]];
  [v4 setTcuList:a1[6]];
  [v4 setUserId:a1[7]];
}

- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 tcuList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__SMTTRPCandidate_initWithTrpCandidateId_tcuList___block_invoke;
  v12[3] = &unk_265503EA8;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(SMTTRPCandidate *)self initWithBuilder:v12];

  return v10;
}

void __50__SMTTRPCandidate_initWithTrpCandidateId_tcuList___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTrpCandidateId:v3];
  [v4 setRequestId:0];
  [v4 setTcuList:*(void *)(a1 + 40)];
}

- (SMTTRPCandidate)initWithTrpCandidateId:(id)a3 requestId:(id)a4 tcuList:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList___block_invoke;
  v16[3] = &unk_265503E80;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = [(SMTTRPCandidate *)self initWithBuilder:v16];

  return v14;
}

void __60__SMTTRPCandidate_initWithTrpCandidateId_requestId_tcuList___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTrpCandidateId:v3];
  [v4 setRequestId:a1[5]];
  [v4 setTcuList:a1[6]];
}

- (SMTTRPCandidate)init
{
  return [(SMTTRPCandidate *)self initWithBuilder:0];
}

- (SMTTRPCandidate)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SMTTRPCandidateMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)SMTTRPCandidate;
  NSUInteger v5 = [(SMTTRPCandidate *)&v21 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_SMTTRPCandidateMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SMTTRPCandidateMutation *)v7 isDirty])
    {
      id v8 = [(_SMTTRPCandidateMutation *)v7 getTrpCandidateId];
      uint64_t v9 = [v8 copy];
      trpCandidateId = v6->_trpCandidateId;
      v6->_trpCandidateId = (NSString *)v9;

      id v11 = [(_SMTTRPCandidateMutation *)v7 getRequestId];
      uint64_t v12 = [v11 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;

      id v14 = [(_SMTTRPCandidateMutation *)v7 getTcuList];
      uint64_t v15 = [v14 copy];
      tcuList = v6->_tcuList;
      v6->_tcuList = (NSArray *)v15;

      id v17 = [(_SMTTRPCandidateMutation *)v7 getUserId];
      uint64_t v18 = [v17 copy];
      userId = v6->_userId;
      v6->_userId = (NSString *)v18;

      v6->_isContinuous = [(_SMTTRPCandidateMutation *)v7 getIsContinuous];
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
  id v4 = (void (**)(id, _SMTTRPCandidateMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SMTTRPCandidateMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SMTTRPCandidateMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(SMTTRPCandidate);
      id v7 = [(_SMTTRPCandidateMutation *)v5 getTrpCandidateId];
      uint64_t v8 = [v7 copy];
      trpCandidateId = v6->_trpCandidateId;
      v6->_trpCandidateId = (NSString *)v8;

      id v10 = [(_SMTTRPCandidateMutation *)v5 getRequestId];
      uint64_t v11 = [v10 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;

      id v13 = [(_SMTTRPCandidateMutation *)v5 getTcuList];
      uint64_t v14 = [v13 copy];
      tcuList = v6->_tcuList;
      v6->_tcuList = (NSArray *)v14;

      id v16 = [(_SMTTRPCandidateMutation *)v5 getRequestId];
      uint64_t v17 = [v16 copy];
      uint64_t v18 = v6->_requestId;
      v6->_requestId = (NSString *)v17;

      id v19 = [(_SMTTRPCandidateMutation *)v5 getUserId];
      uint64_t v20 = [v19 copy];
      userId = v6->_userId;
      v6->_userId = (NSString *)v20;

      v6->_isContinuous = [(_SMTTRPCandidateMutation *)v5 getIsContinuous];
    }
    else
    {
      id v6 = (SMTTRPCandidate *)[(SMTTRPCandidate *)self copy];
    }
  }
  else
  {
    id v6 = (SMTTRPCandidate *)[(SMTTRPCandidate *)self copy];
  }

  return v6;
}

@end