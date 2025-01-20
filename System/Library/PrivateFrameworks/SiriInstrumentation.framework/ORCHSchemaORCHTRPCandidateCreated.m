@interface ORCHSchemaORCHTRPCandidateCreated
- (BOOL)hasRootTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)userTrpIds;
- (NSData)jsonData;
- (ORCHSchemaORCHTRPCandidateCreated)initWithDictionary:(id)a3;
- (ORCHSchemaORCHTRPCandidateCreated)initWithJSON:(id)a3;
- (SISchemaUUID)rootTrpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)userTrpIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userTrpIdsCount;
- (void)addUserTrpIds:(id)a3;
- (void)clearUserTrpIds;
- (void)deleteRootTrpId;
- (void)setHasRootTrpId:(BOOL)a3;
- (void)setRootTrpId:(id)a3;
- (void)setUserTrpIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHTRPCandidateCreated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHTRPCandidateCreated;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHTRPCandidateCreated *)self rootTrpId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHTRPCandidateCreated *)self deleteRootTrpId];
  }
  v9 = [(ORCHSchemaORCHTRPCandidateCreated *)self userTrpIds];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ORCHSchemaORCHTRPCandidateCreated *)self setUserTrpIds:v10];

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTrpIds, 0);
  objc_storeStrong((id *)&self->_rootTrpId, 0);
}

- (void)setHasRootTrpId:(BOOL)a3
{
  self->_hasRootTrpId = a3;
}

- (void)setUserTrpIds:(id)a3
{
}

- (NSArray)userTrpIds
{
  return self->_userTrpIds;
}

- (void)setRootTrpId:(id)a3
{
}

- (SISchemaUUID)rootTrpId
{
  return self->_rootTrpId;
}

- (ORCHSchemaORCHTRPCandidateCreated)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ORCHSchemaORCHTRPCandidateCreated;
  v5 = [(ORCHSchemaORCHTRPCandidateCreated *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rootTrpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHTRPCandidateCreated *)v5 setRootTrpId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"userTrpIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
              [(ORCHSchemaORCHTRPCandidateCreated *)v5 addUserTrpIds:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHTRPCandidateCreated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHTRPCandidateCreated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHTRPCandidateCreated *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_rootTrpId)
  {
    id v4 = [(ORCHSchemaORCHTRPCandidateCreated *)self rootTrpId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"rootTrpId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"rootTrpId"];
    }
  }
  if ([(NSArray *)self->_userTrpIds count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v8 = self->_userTrpIds;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"userTrpIds"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_rootTrpId hash];
  return [(NSArray *)self->_userTrpIds hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ORCHSchemaORCHTRPCandidateCreated *)self rootTrpId];
  v6 = [v4 rootTrpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ORCHSchemaORCHTRPCandidateCreated *)self rootTrpId];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(ORCHSchemaORCHTRPCandidateCreated *)self rootTrpId];
    uint64_t v10 = [v4 rootTrpId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ORCHSchemaORCHTRPCandidateCreated *)self userTrpIds];
  v6 = [v4 userTrpIds];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ORCHSchemaORCHTRPCandidateCreated *)self userTrpIds];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ORCHSchemaORCHTRPCandidateCreated *)self userTrpIds];
    v15 = [v4 userTrpIds];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ORCHSchemaORCHTRPCandidateCreated *)self rootTrpId];

  if (v5)
  {
    v6 = [(ORCHSchemaORCHTRPCandidateCreated *)self rootTrpId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_userTrpIds;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHTRPCandidateCreatedReadFrom(self, (uint64_t)a3);
}

- (id)userTrpIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_userTrpIds objectAtIndexedSubscript:a3];
}

- (unint64_t)userTrpIdsCount
{
  return [(NSArray *)self->_userTrpIds count];
}

- (void)addUserTrpIds:(id)a3
{
  id v4 = a3;
  userTrpIds = self->_userTrpIds;
  id v8 = v4;
  if (!userTrpIds)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_userTrpIds;
    self->_userTrpIds = v6;

    id v4 = v8;
    userTrpIds = self->_userTrpIds;
  }
  [(NSArray *)userTrpIds addObject:v4];
}

- (void)clearUserTrpIds
{
}

- (void)deleteRootTrpId
{
}

- (BOOL)hasRootTrpId
{
  return self->_rootTrpId != 0;
}

@end