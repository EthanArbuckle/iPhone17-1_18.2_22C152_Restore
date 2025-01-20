@interface ODDSiriSchemaODDMultiUserState
- (BOOL)hasMultiUserSetupStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)enrolledUsers;
- (NSData)jsonData;
- (ODDSiriSchemaODDMultiUserSetupStatus)multiUserSetupStatus;
- (ODDSiriSchemaODDMultiUserState)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDMultiUserState)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)enrolledUsersAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)enrolledUsersCount;
- (unint64_t)hash;
- (void)addEnrolledUsers:(id)a3;
- (void)clearEnrolledUsers;
- (void)deleteMultiUserSetupStatus;
- (void)setEnrolledUsers:(id)a3;
- (void)setHasMultiUserSetupStatus:(BOOL)a3;
- (void)setMultiUserSetupStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDMultiUserState

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ODDSiriSchemaODDMultiUserState;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDMultiUserState *)self enrolledUsers];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(ODDSiriSchemaODDMultiUserState *)self setEnrolledUsers:v7];

  v8 = [(ODDSiriSchemaODDMultiUserState *)self multiUserSetupStatus];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDMultiUserState *)self deleteMultiUserSetupStatus];
  }
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
  objc_storeStrong((id *)&self->_multiUserSetupStatus, 0);
  objc_storeStrong((id *)&self->_enrolledUsers, 0);
}

- (void)setHasMultiUserSetupStatus:(BOOL)a3
{
  self->_hasMultiUserSetupStatus = a3;
}

- (void)setMultiUserSetupStatus:(id)a3
{
}

- (ODDSiriSchemaODDMultiUserSetupStatus)multiUserSetupStatus
{
  return self->_multiUserSetupStatus;
}

- (void)setEnrolledUsers:(id)a3
{
}

- (NSArray)enrolledUsers
{
  return self->_enrolledUsers;
}

- (ODDSiriSchemaODDMultiUserState)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ODDSiriSchemaODDMultiUserState;
  v5 = [(ODDSiriSchemaODDMultiUserState *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"enrolledUsers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [ODDSiriSchemaODDUserPersonalization alloc];
              v14 = -[ODDSiriSchemaODDUserPersonalization initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(ODDSiriSchemaODDMultiUserState *)v5 addEnrolledUsers:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"multiUserSetupStatus", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[ODDSiriSchemaODDMultiUserSetupStatus alloc] initWithDictionary:v15];
      [(ODDSiriSchemaODDMultiUserState *)v5 setMultiUserSetupStatus:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDMultiUserState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDMultiUserState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDMultiUserState *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_enrolledUsers count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_enrolledUsers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"enrolledUsers"];
  }
  if (self->_multiUserSetupStatus)
  {
    uint64_t v12 = [(ODDSiriSchemaODDMultiUserState *)self multiUserSetupStatus];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"multiUserSetupStatus"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"multiUserSetupStatus"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_enrolledUsers hash];
  return [(ODDSiriSchemaODDMultiUserSetupStatus *)self->_multiUserSetupStatus hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODDSiriSchemaODDMultiUserState *)self enrolledUsers];
  uint64_t v6 = [v4 enrolledUsers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODDSiriSchemaODDMultiUserState *)self enrolledUsers];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ODDSiriSchemaODDMultiUserState *)self enrolledUsers];
    uint64_t v10 = [v4 enrolledUsers];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDMultiUserState *)self multiUserSetupStatus];
  uint64_t v6 = [v4 multiUserSetupStatus];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ODDSiriSchemaODDMultiUserState *)self multiUserSetupStatus];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDMultiUserState *)self multiUserSetupStatus];
    v15 = [v4 multiUserSetupStatus];
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
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_enrolledUsers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(ODDSiriSchemaODDMultiUserState *)self multiUserSetupStatus];

  if (v10)
  {
    int v11 = [(ODDSiriSchemaODDMultiUserState *)self multiUserSetupStatus];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDMultiUserStateReadFrom(self, (uint64_t)a3);
}

- (void)deleteMultiUserSetupStatus
{
}

- (BOOL)hasMultiUserSetupStatus
{
  return self->_multiUserSetupStatus != 0;
}

- (id)enrolledUsersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_enrolledUsers objectAtIndexedSubscript:a3];
}

- (unint64_t)enrolledUsersCount
{
  return [(NSArray *)self->_enrolledUsers count];
}

- (void)addEnrolledUsers:(id)a3
{
  id v4 = a3;
  enrolledUsers = self->_enrolledUsers;
  id v8 = v4;
  if (!enrolledUsers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_enrolledUsers;
    self->_enrolledUsers = v6;

    id v4 = v8;
    enrolledUsers = self->_enrolledUsers;
  }
  [(NSArray *)enrolledUsers addObject:v4];
}

- (void)clearEnrolledUsers
{
}

@end