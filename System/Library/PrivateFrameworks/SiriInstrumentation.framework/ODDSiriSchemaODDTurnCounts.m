@interface ODDSiriSchemaODDTurnCounts
- (BOOL)hasTotalTurnCount;
- (BOOL)hasValidTurnCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDTurnCounts)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDTurnCounts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)totalTurnCount;
- (unsigned)validTurnCount;
- (void)deleteTotalTurnCount;
- (void)deleteValidTurnCount;
- (void)setHasTotalTurnCount:(BOOL)a3;
- (void)setHasValidTurnCount:(BOOL)a3;
- (void)setTotalTurnCount:(unsigned int)a3;
- (void)setValidTurnCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDTurnCounts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)validTurnCount
{
  return self->_validTurnCount;
}

- (unsigned)totalTurnCount
{
  return self->_totalTurnCount;
}

- (ODDSiriSchemaODDTurnCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ODDSiriSchemaODDTurnCounts;
  v5 = [(ODDSiriSchemaODDTurnCounts *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"totalTurnCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTurnCounts setTotalTurnCount:](v5, "setTotalTurnCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"validTurnCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTurnCounts setValidTurnCount:](v5, "setValidTurnCount:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDTurnCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDTurnCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDTurnCounts *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDTurnCounts totalTurnCount](self, "totalTurnCount"));
    [v3 setObject:v5 forKeyedSubscript:@"totalTurnCount"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDTurnCounts validTurnCount](self, "validTurnCount"));
    [v3 setObject:v6 forKeyedSubscript:@"validTurnCount"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_totalTurnCount;
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
  uint64_t v3 = 2654435761 * self->_validTurnCount;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $11CDE260FF0085EB416121EADD7100ED has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int totalTurnCount = self->_totalTurnCount;
    if (totalTurnCount != [v4 totalTurnCount])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $11CDE260FF0085EB416121EADD7100ED has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int validTurnCount = self->_validTurnCount;
    if (validTurnCount != [v4 validTurnCount]) {
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
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDTurnCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteValidTurnCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasValidTurnCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValidTurnCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setValidTurnCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int validTurnCount = a3;
}

- (void)deleteTotalTurnCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTotalTurnCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotalTurnCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalTurnCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int totalTurnCount = a3;
}

@end