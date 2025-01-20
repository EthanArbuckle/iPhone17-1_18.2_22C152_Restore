@interface ORCHSchemaORCHCDMRequestEnded
- (BOOL)delegatedUserDialogAct;
- (BOOL)hasDelegatedUserDialogAct;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHCDMRequestEnded)initWithDictionary:(id)a3;
- (ORCHSchemaORCHCDMRequestEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)status;
- (unint64_t)hash;
- (void)deleteDelegatedUserDialogAct;
- (void)deleteStatus;
- (void)setDelegatedUserDialogAct:(BOOL)a3;
- (void)setHasDelegatedUserDialogAct:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHCDMRequestEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)delegatedUserDialogAct
{
  return self->_delegatedUserDialogAct;
}

- (int)status
{
  return self->_status;
}

- (ORCHSchemaORCHCDMRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaORCHCDMRequestEnded;
  v5 = [(ORCHSchemaORCHCDMRequestEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHCDMRequestEnded setStatus:](v5, "setStatus:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"delegatedUserDialogAct"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHCDMRequestEnded setDelegatedUserDialogAct:](v5, "setDelegatedUserDialogAct:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHCDMRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHCDMRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHCDMRequestEnded *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char v4 = *(&self->_delegatedUserDialogAct + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHCDMRequestEnded delegatedUserDialogAct](self, "delegatedUserDialogAct"));
    [v3 setObject:v5 forKeyedSubscript:@"delegatedUserDialogAct"];

    char v4 = *(&self->_delegatedUserDialogAct + 1);
  }
  if (v4)
  {
    int v6 = [(ORCHSchemaORCHCDMRequestEnded *)self status];
    uint64_t v7 = @"ORCHCDMRESPONSESTATUS_UNKNOWN";
    if (v6 == 1) {
      uint64_t v7 = @"ORCHCDMRESPONSESTATUS_SUCCESS";
    }
    if (v6 == 2) {
      v8 = @"ORCHCDMRESPONSESTATUS_EMPTY_NLU_REQUEST";
    }
    else {
      v8 = v7;
    }
    [v3 setObject:v8 forKeyedSubscript:@"status"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_delegatedUserDialogAct + 1))
  {
    uint64_t v2 = 2654435761 * self->_status;
    if ((*(&self->_delegatedUserDialogAct + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_delegatedUserDialogAct + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_delegatedUserDialogAct;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_delegatedUserDialogAct + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int status = self->_status;
    if (status != [v4 status])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_delegatedUserDialogAct + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int delegatedUserDialogAct = self->_delegatedUserDialogAct;
    if (delegatedUserDialogAct != [v4 delegatedUserDialogAct]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_delegatedUserDialogAct + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_delegatedUserDialogAct + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHCDMRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDelegatedUserDialogAct
{
  *(&self->_delegatedUserDialogAct + 1) &= ~2u;
}

- (void)setHasDelegatedUserDialogAct:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_delegatedUserDialogAct + 1) = *(&self->_delegatedUserDialogAct + 1) & 0xFD | v3;
}

- (BOOL)hasDelegatedUserDialogAct
{
  return (*((unsigned __int8 *)&self->_delegatedUserDialogAct + 1) >> 1) & 1;
}

- (void)setDelegatedUserDialogAct:(BOOL)a3
{
  *(&self->_delegatedUserDialogAct + 1) |= 2u;
  self->_int delegatedUserDialogAct = a3;
}

- (void)deleteStatus
{
  *(&self->_delegatedUserDialogAct + 1) &= ~1u;
}

- (void)setHasStatus:(BOOL)a3
{
  *(&self->_delegatedUserDialogAct + 1) = *(&self->_delegatedUserDialogAct + 1) & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(&self->_delegatedUserDialogAct + 1);
}

- (void)setStatus:(int)a3
{
  *(&self->_delegatedUserDialogAct + 1) |= 1u;
  self->_int status = a3;
}

@end