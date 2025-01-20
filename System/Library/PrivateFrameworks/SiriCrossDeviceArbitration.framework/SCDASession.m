@interface SCDASession
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)currentElectionAdvertisementData;
- (NSDictionary)electionAdvertisementDataByIds;
- (NSUUID)currentElectionAdvertisementId;
- (NSUUID)sessionId;
- (SCDASession)init;
- (SCDASession)initWithBuilder:(id)a3;
- (SCDASession)initWithCoder:(id)a3;
- (SCDASession)initWithGeneration:(unint64_t)a3 sessionId:(id)a4 currentElectionAdvertisementId:(id)a5 currentElectionAdvertisementData:(id)a6 electionAdvertisementDataByIds:(id)a7;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCDASession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electionAdvertisementDataByIds, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementData, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

- (NSDictionary)electionAdvertisementDataByIds
{
  return self->_electionAdvertisementDataByIds;
}

- (NSData)currentElectionAdvertisementData
{
  return self->_currentElectionAdvertisementData;
}

- (NSUUID)currentElectionAdvertisementId
{
  return self->_currentElectionAdvertisementId;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t generation = self->_generation;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedLongLong:generation];
  [v7 encodeObject:v6 forKey:@"SCDASession::generation"];

  [v7 encodeObject:self->_sessionId forKey:@"SCDASession::sessionId"];
  [v7 encodeObject:self->_currentElectionAdvertisementId forKey:@"SCDASession::currentElectionAdvertisementId"];
  [v7 encodeObject:self->_currentElectionAdvertisementData forKey:@"SCDASession::currentElectionAdvertisementData"];
  [v7 encodeObject:self->_electionAdvertisementDataByIds forKey:@"SCDASession::electionAdvertisementDataByIds"];
}

- (SCDASession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDASession::generation"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDASession::sessionId"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDASession::currentElectionAdvertisementId"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDASession::currentElectionAdvertisementData"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SCDASession::electionAdvertisementDataByIds"];

  v15 = [(SCDASession *)self initWithGeneration:v6 sessionId:v7 currentElectionAdvertisementId:v8 currentElectionAdvertisementData:v9 electionAdvertisementDataByIds:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCDASession *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t generation = self->_generation;
      if (generation == [(SCDASession *)v5 generation])
      {
        id v7 = [(SCDASession *)v5 sessionId];
        sessionId = self->_sessionId;
        if (sessionId == v7 || [(NSUUID *)sessionId isEqual:v7])
        {
          v9 = [(SCDASession *)v5 currentElectionAdvertisementId];
          currentElectionAdvertisementId = self->_currentElectionAdvertisementId;
          if (currentElectionAdvertisementId == v9
            || [(NSUUID *)currentElectionAdvertisementId isEqual:v9])
          {
            uint64_t v11 = [(SCDASession *)v5 currentElectionAdvertisementData];
            currentElectionAdvertisementData = self->_currentElectionAdvertisementData;
            if (currentElectionAdvertisementData == v11
              || [(NSData *)currentElectionAdvertisementData isEqual:v11])
            {
              v13 = [(SCDASession *)v5 electionAdvertisementDataByIds];
              electionAdvertisementDataByIds = self->_electionAdvertisementDataByIds;
              BOOL v15 = electionAdvertisementDataByIds == v13
                 || [(NSDictionary *)electionAdvertisementDataByIds isEqual:v13];
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedLongLong:self->_generation];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSUUID *)self->_sessionId hash];
  uint64_t v6 = v5 ^ [(NSUUID *)self->_currentElectionAdvertisementId hash];
  uint64_t v7 = v6 ^ [(NSData *)self->_currentElectionAdvertisementData hash] ^ v4;
  unint64_t v8 = v7 ^ [(NSDictionary *)self->_electionAdvertisementDataByIds hash];

  return v8;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SCDASession;
  uint64_t v5 = [(SCDASession *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t generation = %llu, sessionId = %@, currentElectionAdvertisementId = %@, currentElectionAdvertisementData = (%llu bytes), electionAdvertisementDataByIds = %@}", v5, self->_generation, self->_sessionId, self->_currentElectionAdvertisementId, -[NSData length](self->_currentElectionAdvertisementData, "length"), self->_electionAdvertisementDataByIds];

  return v6;
}

- (id)description
{
  return [(SCDASession *)self _descriptionWithIndent:0];
}

- (SCDASession)initWithGeneration:(unint64_t)a3 sessionId:(id)a4 currentElectionAdvertisementId:(id)a5 currentElectionAdvertisementData:(id)a6 electionAdvertisementDataByIds:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __139__SCDASession_initWithGeneration_sessionId_currentElectionAdvertisementId_currentElectionAdvertisementData_electionAdvertisementDataByIds___block_invoke;
  v22[3] = &unk_2654B75A0;
  id v26 = v15;
  unint64_t v27 = a3;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  v20 = [(SCDASession *)self initWithBuilder:v22];

  return v20;
}

void __139__SCDASession_initWithGeneration_sessionId_currentElectionAdvertisementId_currentElectionAdvertisementData_electionAdvertisementDataByIds___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[8];
  id v4 = a2;
  [v4 setGeneration:v3];
  [v4 setSessionId:a1[4]];
  [v4 setCurrentElectionAdvertisementId:a1[5]];
  [v4 setCurrentElectionAdvertisementData:a1[6]];
  [v4 setElectionAdvertisementDataByIds:a1[7]];
}

- (SCDASession)init
{
  return [(SCDASession *)self initWithBuilder:0];
}

- (SCDASession)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SCDASessionMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)SCDASession;
  uint64_t v5 = [(SCDASession *)&v21 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_SCDASessionMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SCDASessionMutation *)v7 isDirty])
    {
      v6->_unint64_t generation = [(_SCDASessionMutation *)v7 getGeneration];
      objc_super v8 = [(_SCDASessionMutation *)v7 getSessionId];
      uint64_t v9 = [v8 copy];
      sessionId = v6->_sessionId;
      v6->_sessionId = (NSUUID *)v9;

      uint64_t v11 = [(_SCDASessionMutation *)v7 getCurrentElectionAdvertisementId];
      uint64_t v12 = [v11 copy];
      currentElectionAdvertisementId = v6->_currentElectionAdvertisementId;
      v6->_currentElectionAdvertisementId = (NSUUID *)v12;

      id v14 = [(_SCDASessionMutation *)v7 getCurrentElectionAdvertisementData];
      uint64_t v15 = [v14 copy];
      currentElectionAdvertisementData = v6->_currentElectionAdvertisementData;
      v6->_currentElectionAdvertisementData = (NSData *)v15;

      id v17 = [(_SCDASessionMutation *)v7 getElectionAdvertisementDataByIds];
      uint64_t v18 = [v17 copy];
      electionAdvertisementDataByIds = v6->_electionAdvertisementDataByIds;
      v6->_electionAdvertisementDataByIds = (NSDictionary *)v18;
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
  id v4 = (void (**)(id, _SCDASessionMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SCDASessionMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SCDASessionMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(SCDASession);
      v6->_unint64_t generation = [(_SCDASessionMutation *)v5 getGeneration];
      uint64_t v7 = [(_SCDASessionMutation *)v5 getSessionId];
      uint64_t v8 = [v7 copy];
      sessionId = v6->_sessionId;
      v6->_sessionId = (NSUUID *)v8;

      v10 = [(_SCDASessionMutation *)v5 getCurrentElectionAdvertisementId];
      uint64_t v11 = [v10 copy];
      currentElectionAdvertisementId = v6->_currentElectionAdvertisementId;
      v6->_currentElectionAdvertisementId = (NSUUID *)v11;

      id v13 = [(_SCDASessionMutation *)v5 getCurrentElectionAdvertisementData];
      uint64_t v14 = [v13 copy];
      currentElectionAdvertisementData = v6->_currentElectionAdvertisementData;
      v6->_currentElectionAdvertisementData = (NSData *)v14;

      id v16 = [(_SCDASessionMutation *)v5 getElectionAdvertisementDataByIds];
      uint64_t v17 = [v16 copy];
      electionAdvertisementDataByIds = v6->_electionAdvertisementDataByIds;
      v6->_electionAdvertisementDataByIds = (NSDictionary *)v17;
    }
    else
    {
      uint64_t v6 = (SCDASession *)[(SCDASession *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (SCDASession *)[(SCDASession *)self copy];
  }

  return v6;
}

@end