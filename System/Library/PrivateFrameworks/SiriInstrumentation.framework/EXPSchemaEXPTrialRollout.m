@interface EXPSchemaEXPTrialRollout
- (BOOL)hasDeploymentId;
- (BOOL)hasRampId;
- (BOOL)hasRolloutId;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSchemaEXPTrialRollout)initWithDictionary:(id)a3;
- (EXPSchemaEXPTrialRollout)initWithJSON:(id)a3;
- (NSArray)namespaces;
- (NSData)jsonData;
- (NSString)rampId;
- (NSString)rolloutId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)namespacesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)status;
- (unint64_t)hash;
- (unint64_t)namespacesCount;
- (unsigned)deploymentId;
- (void)addNamespaces:(id)a3;
- (void)clearNamespaces;
- (void)deleteDeploymentId;
- (void)deleteRampId;
- (void)deleteRolloutId;
- (void)deleteStatus;
- (void)setDeploymentId:(unsigned int)a3;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setHasRampId:(BOOL)a3;
- (void)setHasRolloutId:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setNamespaces:(id)a3;
- (void)setRampId:(id)a3;
- (void)setRolloutId:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSchemaEXPTrialRollout

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EXPSchemaEXPTrialRollout;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(EXPSchemaEXPTrialRollout *)self namespaces];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(EXPSchemaEXPTrialRollout *)self setNamespaces:v7];
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  [(SISensitiveConditionsSet *)v2 addCondition:2];
  [(SISensitiveConditionsSet *)v2 addCondition:4];
  [(SISensitiveConditionsSet *)v2 addCondition:5];
  [(SISensitiveConditionsSet *)v2 addCondition:6];
  [(SISensitiveConditionsSet *)v2 addCondition:7];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

- (void)setHasRampId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRolloutId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setNamespaces:(id)a3
{
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (int)status
{
  return self->_status;
}

- (unsigned)deploymentId
{
  return self->_deploymentId;
}

- (void)setRampId:(id)a3
{
}

- (NSString)rampId
{
  return self->_rampId;
}

- (void)setRolloutId:(id)a3
{
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (EXPSchemaEXPTrialRollout)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)EXPSchemaEXPTrialRollout;
  v5 = [(EXPSchemaEXPTrialRollout *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rolloutId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(EXPSchemaEXPTrialRollout *)v5 setRolloutId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"rampId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(EXPSchemaEXPTrialRollout *)v5 setRampId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"deploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSchemaEXPTrialRollout setDeploymentId:](v5, "setDeploymentId:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSchemaEXPTrialRollout setStatus:](v5, "setStatus:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"namespaces"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v11;
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[EXPSchemaEXPTrialRolloutNamespace alloc] initWithDictionary:v18];
              [(EXPSchemaEXPTrialRollout *)v5 addNamespaces:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v15);
      }

      v6 = v23;
      v11 = v22;
    }
    v20 = v5;
  }
  return v5;
}

- (EXPSchemaEXPTrialRollout)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSchemaEXPTrialRollout *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSchemaEXPTrialRollout *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[EXPSchemaEXPTrialRollout deploymentId](self, "deploymentId"));
    [v3 setObject:v4 forKeyedSubscript:@"deploymentId"];
  }
  if ([(NSArray *)self->_namespaces count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v6 = self->_namespaces;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentation];
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"namespaces"];
  }
  if (self->_rampId)
  {
    id v13 = [(EXPSchemaEXPTrialRollout *)self rampId];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"rampId"];
  }
  if (self->_rolloutId)
  {
    uint64_t v15 = [(EXPSchemaEXPTrialRollout *)self rolloutId];
    uint64_t v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"rolloutId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v17 = [(EXPSchemaEXPTrialRollout *)self status] - 1;
    if (v17 > 2) {
      uint64_t v18 = @"EXPROLLOUTALLOCATIONSTATUS_UNKNOWN";
    }
    else {
      uint64_t v18 = off_1E5EBB470[v17];
    }
    [v3 setObject:v18 forKeyedSubscript:@"status"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_rolloutId hash];
  NSUInteger v4 = [(NSString *)self->_rampId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_deploymentId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSArray *)self->_namespaces hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_status;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSArray *)self->_namespaces hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(EXPSchemaEXPTrialRollout *)self rolloutId];
  uint64_t v6 = [v4 rolloutId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(EXPSchemaEXPTrialRollout *)self rolloutId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(EXPSchemaEXPTrialRollout *)self rolloutId];
    v10 = [v4 rolloutId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t v5 = [(EXPSchemaEXPTrialRollout *)self rampId];
  uint64_t v6 = [v4 rampId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v12 = [(EXPSchemaEXPTrialRollout *)self rampId];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(EXPSchemaEXPTrialRollout *)self rampId];
    uint64_t v15 = [v4 rampId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $1FB0A35FD2A72A818B09214CCAE01574 has = self->_has;
  unsigned int v18 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int deploymentId = self->_deploymentId;
    if (deploymentId != [v4 deploymentId]) {
      goto LABEL_24;
    }
    $1FB0A35FD2A72A818B09214CCAE01574 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int status = self->_status;
    if (status != [v4 status]) {
      goto LABEL_24;
    }
  }
  uint64_t v5 = [(EXPSchemaEXPTrialRollout *)self namespaces];
  uint64_t v6 = [v4 namespaces];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v22 = [(EXPSchemaEXPTrialRollout *)self namespaces];
  if (!v22)
  {

LABEL_27:
    BOOL v27 = 1;
    goto LABEL_25;
  }
  long long v23 = (void *)v22;
  long long v24 = [(EXPSchemaEXPTrialRollout *)self namespaces];
  uint64_t v25 = [v4 namespaces];
  char v26 = [v24 isEqual:v25];

  if (v26) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v27 = 0;
LABEL_25:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EXPSchemaEXPTrialRollout *)self rolloutId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(EXPSchemaEXPTrialRollout *)self rampId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_namespaces;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSchemaEXPTrialRolloutReadFrom(self, (uint64_t)a3);
}

- (id)namespacesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_namespaces objectAtIndexedSubscript:a3];
}

- (unint64_t)namespacesCount
{
  return [(NSArray *)self->_namespaces count];
}

- (void)addNamespaces:(id)a3
{
  id v4 = a3;
  namespaces = self->_namespaces;
  id v8 = v4;
  if (!namespaces)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_namespaces;
    self->_namespaces = v6;

    id v4 = v8;
    namespaces = self->_namespaces;
  }
  [(NSArray *)namespaces addObject:v4];
}

- (void)clearNamespaces
{
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int status = a3;
}

- (void)deleteDeploymentId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeploymentId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeploymentId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int deploymentId = a3;
}

- (void)deleteRampId
{
}

- (BOOL)hasRampId
{
  return self->_rampId != 0;
}

- (void)deleteRolloutId
{
}

- (BOOL)hasRolloutId
{
  return self->_rolloutId != 0;
}

@end