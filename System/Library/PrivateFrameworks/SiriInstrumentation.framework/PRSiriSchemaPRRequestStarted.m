@interface PRSiriSchemaPRRequestStarted
- (BOOL)hasActionStatementId;
- (BOOL)hasOriginTaskStatementId;
- (BOOL)hasPlanCycleId;
- (BOOL)hasStatementId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PRSiriSchemaPRRequestStarted)initWithDictionary:(id)a3;
- (PRSiriSchemaPRRequestStarted)initWithJSON:(id)a3;
- (SISchemaUUID)planCycleId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)actionStatementId;
- (unsigned)originTaskStatementId;
- (unsigned)statementId;
- (void)deleteActionStatementId;
- (void)deleteOriginTaskStatementId;
- (void)deletePlanCycleId;
- (void)deleteStatementId;
- (void)setActionStatementId:(unsigned int)a3;
- (void)setHasActionStatementId:(BOOL)a3;
- (void)setHasOriginTaskStatementId:(BOOL)a3;
- (void)setHasPlanCycleId:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setOriginTaskStatementId:(unsigned int)a3;
- (void)setPlanCycleId:(id)a3;
- (void)setStatementId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PRSiriSchemaPRRequestStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PRSiriSchemaPRRequestStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PRSiriSchemaPRRequestStarted *)self planCycleId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PRSiriSchemaPRRequestStarted *)self deletePlanCycleId];
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
}

- (void)setHasPlanCycleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPlanCycleId:(id)a3
{
}

- (SISchemaUUID)planCycleId
{
  return self->_planCycleId;
}

- (unsigned)statementId
{
  return self->_statementId;
}

- (unsigned)actionStatementId
{
  return self->_actionStatementId;
}

- (unsigned)originTaskStatementId
{
  return self->_originTaskStatementId;
}

- (PRSiriSchemaPRRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSiriSchemaPRRequestStarted;
  v5 = [(PRSiriSchemaPRRequestStarted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originTaskStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSiriSchemaPRRequestStarted setOriginTaskStatementId:](v5, "setOriginTaskStatementId:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"actionStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSiriSchemaPRRequestStarted setActionStatementId:](v5, "setActionStatementId:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSiriSchemaPRRequestStarted setStatementId:](v5, "setStatementId:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"planCycleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(PRSiriSchemaPRRequestStarted *)v5 setPlanCycleId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (PRSiriSchemaPRRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PRSiriSchemaPRRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PRSiriSchemaPRRequestStarted *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PRSiriSchemaPRRequestStarted actionStatementId](self, "actionStatementId"));
    [v3 setObject:v5 forKeyedSubscript:@"actionStatementId"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PRSiriSchemaPRRequestStarted originTaskStatementId](self, "originTaskStatementId"));
    [v3 setObject:v6 forKeyedSubscript:@"originTaskStatementId"];
  }
  if (self->_planCycleId)
  {
    uint64_t v7 = [(PRSiriSchemaPRRequestStarted *)self planCycleId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"planCycleId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"planCycleId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PRSiriSchemaPRRequestStarted statementId](self, "statementId"));
    [v3 setObject:v10 forKeyedSubscript:@"statementId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(SISchemaUUID *)self->_planCycleId hash];
  }
  uint64_t v2 = 2654435761 * self->_originTaskStatementId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_actionStatementId;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_statementId;
  return v3 ^ v2 ^ v4 ^ [(SISchemaUUID *)self->_planCycleId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $2D1F0596720505FD65E247AE6E5E455A has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int originTaskStatementId = self->_originTaskStatementId;
    if (originTaskStatementId != [v4 originTaskStatementId]) {
      goto LABEL_18;
    }
    $2D1F0596720505FD65E247AE6E5E455A has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int actionStatementId = self->_actionStatementId;
      if (actionStatementId != [v4 actionStatementId]) {
        goto LABEL_18;
      }
      $2D1F0596720505FD65E247AE6E5E455A has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10 || (unsigned int statementId = self->_statementId, statementId == [v4 statementId]))
      {
        v12 = [(PRSiriSchemaPRRequestStarted *)self planCycleId];
        objc_super v13 = [v4 planCycleId];
        v14 = v13;
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v15 = [(PRSiriSchemaPRRequestStarted *)self planCycleId];
          if (!v15)
          {

LABEL_21:
            BOOL v20 = 1;
            goto LABEL_19;
          }
          v16 = (void *)v15;
          v17 = [(PRSiriSchemaPRRequestStarted *)self planCycleId];
          v18 = [v4 planCycleId];
          char v19 = [v17 isEqual:v18];

          if (v19) {
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
    }
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  v5 = [(PRSiriSchemaPRRequestStarted *)self planCycleId];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(PRSiriSchemaPRRequestStarted *)self planCycleId];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deletePlanCycleId
{
}

- (BOOL)hasPlanCycleId
{
  return self->_planCycleId != 0;
}

- (void)deleteStatementId
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasStatementId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatementId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStatementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int statementId = a3;
}

- (void)deleteActionStatementId
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasActionStatementId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActionStatementId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setActionStatementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int actionStatementId = a3;
}

- (void)deleteOriginTaskStatementId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOriginTaskStatementId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginTaskStatementId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOriginTaskStatementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int originTaskStatementId = a3;
}

@end