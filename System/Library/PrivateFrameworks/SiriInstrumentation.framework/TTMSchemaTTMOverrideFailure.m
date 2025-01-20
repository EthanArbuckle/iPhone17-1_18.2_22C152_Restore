@interface TTMSchemaTTMOverrideFailure
- (BOOL)hasOverrideType;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (TTMSchemaTTMOverrideFailure)initWithDictionary:(id)a3;
- (TTMSchemaTTMOverrideFailure)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)overrideType;
- (int)reason;
- (unint64_t)hash;
- (void)deleteOverrideType;
- (void)deleteReason;
- (void)setHasOverrideType:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setOverrideType:(int)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMOverrideFailure

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)reason
{
  return self->_reason;
}

- (int)overrideType
{
  return self->_overrideType;
}

- (TTMSchemaTTMOverrideFailure)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TTMSchemaTTMOverrideFailure;
  v5 = [(TTMSchemaTTMOverrideFailure *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"overrideType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMOverrideFailure setOverrideType:](v5, "setOverrideType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMOverrideFailure setReason:](v5, "setReason:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (TTMSchemaTTMOverrideFailure)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMOverrideFailure *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMOverrideFailure *)self dictionaryRepresentation];
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
    unsigned int v5 = [(TTMSchemaTTMOverrideFailure *)self overrideType] - 1;
    if (v5 > 8) {
      v6 = @"TTMOVERRIDETYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBBD30[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"overrideType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(TTMSchemaTTMOverrideFailure *)self reason] - 1;
    if (v7 > 2) {
      v8 = @"TTMOVERRIDEFAILUREREASON_UNKNOWN";
    }
    else {
      v8 = off_1E5EBBD78[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"reason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_overrideType;
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
  uint64_t v3 = 2654435761 * self->_reason;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $6B0ED023C3B775D71488F5766DE50B48 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int overrideType = self->_overrideType;
    if (overrideType != [v4 overrideType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $6B0ED023C3B775D71488F5766DE50B48 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
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
    PBDataWriterWriteInt32Field();
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
  return TTMSchemaTTMOverrideFailureReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int reason = a3;
}

- (void)deleteOverrideType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOverrideType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOverrideType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOverrideType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int overrideType = a3;
}

@end