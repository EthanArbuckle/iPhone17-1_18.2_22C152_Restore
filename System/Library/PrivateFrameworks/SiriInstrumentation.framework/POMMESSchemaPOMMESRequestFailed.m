@interface POMMESSchemaPOMMESRequestFailed
- (BOOL)hasPommesSearchReason;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESRequestFailed)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESRequestFailed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (unsigned)pommesSearchReason;
- (void)deletePommesSearchReason;
- (void)deleteReason;
- (void)setHasPommesSearchReason:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setPommesSearchReason:(unsigned int)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESRequestFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)pommesSearchReason
{
  return self->_pommesSearchReason;
}

- (int)reason
{
  return self->_reason;
}

- (POMMESSchemaPOMMESRequestFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)POMMESSchemaPOMMESRequestFailed;
  v5 = [(POMMESSchemaPOMMESRequestFailed *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESRequestFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"pommesSearchReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESRequestFailed setPommesSearchReason:](v5, "setPommesSearchReason:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESRequestFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESRequestFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESRequestFailed *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESRequestFailed pommesSearchReason](self, "pommesSearchReason"));
    [v3 setObject:v5 forKeyedSubscript:@"pommesSearchReason"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(POMMESSchemaPOMMESRequestFailed *)self reason] - 1;
    if (v6 > 2) {
      uint64_t v7 = @"POMMESREQUESTFAILEDREASON_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB4350[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"reason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_reason;
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
  uint64_t v3 = 2654435761 * self->_pommesSearchReason;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $F47A5FA263E9890E506DC821CA3EC662 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $F47A5FA263E9890E506DC821CA3EC662 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int pommesSearchReason = self->_pommesSearchReason;
    if (pommesSearchReason != [v4 pommesSearchReason]) {
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
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESRequestFailedReadFrom(self, (uint64_t)a3);
}

- (void)deletePommesSearchReason
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPommesSearchReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPommesSearchReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPommesSearchReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int pommesSearchReason = a3;
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end