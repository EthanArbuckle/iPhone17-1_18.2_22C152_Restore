@interface POMMESSchemaPOMMESPegasusKitNetworkTimingData
- (BOOL)hasRequestEndOffsetInMS;
- (BOOL)hasRequestStartOffsetInMS;
- (BOOL)hasResponseEndOffsetInMS;
- (BOOL)hasResponseStartOffsetInMS;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)requestEndOffsetInMS;
- (unsigned)requestStartOffsetInMS;
- (unsigned)responseEndOffsetInMS;
- (unsigned)responseStartOffsetInMS;
- (void)deleteRequestEndOffsetInMS;
- (void)deleteRequestStartOffsetInMS;
- (void)deleteResponseEndOffsetInMS;
- (void)deleteResponseStartOffsetInMS;
- (void)setHasRequestEndOffsetInMS:(BOOL)a3;
- (void)setHasRequestStartOffsetInMS:(BOOL)a3;
- (void)setHasResponseEndOffsetInMS:(BOOL)a3;
- (void)setHasResponseStartOffsetInMS:(BOOL)a3;
- (void)setRequestEndOffsetInMS:(unsigned int)a3;
- (void)setRequestStartOffsetInMS:(unsigned int)a3;
- (void)setResponseEndOffsetInMS:(unsigned int)a3;
- (void)setResponseStartOffsetInMS:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusKitNetworkTimingData

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)responseEndOffsetInMS
{
  return self->_responseEndOffsetInMS;
}

- (unsigned)responseStartOffsetInMS
{
  return self->_responseStartOffsetInMS;
}

- (unsigned)requestEndOffsetInMS
{
  return self->_requestEndOffsetInMS;
}

- (unsigned)requestStartOffsetInMS
{
  return self->_requestStartOffsetInMS;
}

- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusKitNetworkTimingData;
  v5 = [(POMMESSchemaPOMMESPegasusKitNetworkTimingData *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestStartOffsetInMS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setRequestStartOffsetInMS:](v5, "setRequestStartOffsetInMS:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"requestEndOffsetInMS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setRequestEndOffsetInMS:](v5, "setRequestEndOffsetInMS:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"responseStartOffsetInMS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setResponseStartOffsetInMS:](v5, "setResponseStartOffsetInMS:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"responseEndOffsetInMS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setResponseEndOffsetInMS:](v5, "setResponseEndOffsetInMS:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusKitNetworkTimingData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusKitNetworkTimingData *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData requestEndOffsetInMS](self, "requestEndOffsetInMS"));
    [v3 setObject:v7 forKeyedSubscript:@"requestEndOffsetInMS"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData requestStartOffsetInMS](self, "requestStartOffsetInMS"));
  [v3 setObject:v8 forKeyedSubscript:@"requestStartOffsetInMS"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData responseEndOffsetInMS](self, "responseEndOffsetInMS"));
  [v3 setObject:v9 forKeyedSubscript:@"responseEndOffsetInMS"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData responseStartOffsetInMS](self, "responseStartOffsetInMS"));
    [v3 setObject:v5 forKeyedSubscript:@"responseStartOffsetInMS"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_requestStartOffsetInMS;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_requestEndOffsetInMS;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_responseStartOffsetInMS;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_responseEndOffsetInMS;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $9ED1BCA1EB36767268E4C472EAAF6F41 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int requestStartOffsetInMS = self->_requestStartOffsetInMS;
    if (requestStartOffsetInMS != [v4 requestStartOffsetInMS]) {
      goto LABEL_18;
    }
    $9ED1BCA1EB36767268E4C472EAAF6F41 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int requestEndOffsetInMS = self->_requestEndOffsetInMS;
    if (requestEndOffsetInMS != [v4 requestEndOffsetInMS]) {
      goto LABEL_18;
    }
    $9ED1BCA1EB36767268E4C472EAAF6F41 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int responseStartOffsetInMS = self->_responseStartOffsetInMS;
    if (responseStartOffsetInMS == [v4 responseStartOffsetInMS])
    {
      $9ED1BCA1EB36767268E4C472EAAF6F41 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    unsigned int responseEndOffsetInMS = self->_responseEndOffsetInMS;
    if (responseEndOffsetInMS != [v4 responseEndOffsetInMS]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusKitNetworkTimingDataReadFrom(self, (uint64_t)a3);
}

- (void)deleteResponseEndOffsetInMS
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasResponseEndOffsetInMS:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResponseEndOffsetInMS
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setResponseEndOffsetInMS:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int responseEndOffsetInMS = a3;
}

- (void)deleteResponseStartOffsetInMS
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasResponseStartOffsetInMS:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseStartOffsetInMS
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setResponseStartOffsetInMS:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int responseStartOffsetInMS = a3;
}

- (void)deleteRequestEndOffsetInMS
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRequestEndOffsetInMS:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestEndOffsetInMS
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestEndOffsetInMS:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int requestEndOffsetInMS = a3;
}

- (void)deleteRequestStartOffsetInMS
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRequestStartOffsetInMS:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestStartOffsetInMS
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestStartOffsetInMS:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int requestStartOffsetInMS = a3;
}

@end