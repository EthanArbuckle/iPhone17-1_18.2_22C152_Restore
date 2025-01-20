@interface POMMESSchemaPOMMESSearchRequestClassifierExecuted
- (BOOL)hasIsPegasusSearchPerformed;
- (BOOL)hasMitigationResponseDecision;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPegasusSearchPerformed;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESSearchRequestClassifierExecuted)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESSearchRequestClassifierExecuted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mitigationResponseDecision;
- (unint64_t)hash;
- (void)deleteIsPegasusSearchPerformed;
- (void)deleteMitigationResponseDecision;
- (void)setHasIsPegasusSearchPerformed:(BOOL)a3;
- (void)setHasMitigationResponseDecision:(BOOL)a3;
- (void)setIsPegasusSearchPerformed:(BOOL)a3;
- (void)setMitigationResponseDecision:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESSearchRequestClassifierExecuted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)mitigationResponseDecision
{
  return self->_mitigationResponseDecision;
}

- (BOOL)isPegasusSearchPerformed
{
  return self->_isPegasusSearchPerformed;
}

- (POMMESSchemaPOMMESSearchRequestClassifierExecuted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)POMMESSchemaPOMMESSearchRequestClassifierExecuted;
  v5 = [(POMMESSchemaPOMMESSearchRequestClassifierExecuted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isPegasusSearchPerformed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSearchRequestClassifierExecuted setIsPegasusSearchPerformed:](v5, "setIsPegasusSearchPerformed:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"mitigationResponseDecision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSearchRequestClassifierExecuted setMitigationResponseDecision:](v5, "setMitigationResponseDecision:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESSearchRequestClassifierExecuted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESSearchRequestClassifierExecuted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESSearchRequestClassifierExecuted *)self dictionaryRepresentation];
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
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESSearchRequestClassifierExecuted isPegasusSearchPerformed](self, "isPegasusSearchPerformed"));
    [v3 setObject:v5 forKeyedSubscript:@"isPegasusSearchPerformed"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v6 = [(POMMESSchemaPOMMESSearchRequestClassifierExecuted *)self mitigationResponseDecision]- 1;
    if (v6 > 5) {
      uint64_t v7 = @"POMMESSELFREFLECTIONAGENTDECISION_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EC1730[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"mitigationResponseDecision"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isPegasusSearchPerformed;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_mitigationResponseDecision;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $2C131719B38908BEA1C282DBA5D73131 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int isPegasusSearchPerformed = self->_isPegasusSearchPerformed;
    if (isPegasusSearchPerformed != [v4 isPegasusSearchPerformed])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $2C131719B38908BEA1C282DBA5D73131 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int mitigationResponseDecision = self->_mitigationResponseDecision;
    if (mitigationResponseDecision != [v4 mitigationResponseDecision]) {
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
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESSearchRequestClassifierExecutedReadFrom(self, (uint64_t)a3);
}

- (void)deleteMitigationResponseDecision
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMitigationResponseDecision:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMitigationResponseDecision
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMitigationResponseDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int mitigationResponseDecision = a3;
}

- (void)deleteIsPegasusSearchPerformed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsPegasusSearchPerformed:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPegasusSearchPerformed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsPegasusSearchPerformed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isPegasusSearchPerformed = a3;
}

@end