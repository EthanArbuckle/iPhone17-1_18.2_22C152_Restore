@interface MHSchemaMHEndpointDelayContext
- (BOOL)hasEndpointDelayInNs;
- (BOOL)hasEndpointDelayInNsV2;
- (BOOL)hasEndpointModelDelayInNs;
- (BOOL)hasSpeakingEndInNs;
- (BOOL)hasSpeakingStartInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHEndpointDelayContext)initWithDictionary:(id)a3;
- (MHSchemaMHEndpointDelayContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)endpointDelayInNs;
- (unint64_t)endpointDelayInNsV2;
- (unint64_t)endpointModelDelayInNs;
- (unint64_t)hash;
- (unint64_t)speakingEndInNs;
- (unint64_t)speakingStartInNs;
- (void)deleteEndpointDelayInNs;
- (void)deleteEndpointDelayInNsV2;
- (void)deleteEndpointModelDelayInNs;
- (void)deleteSpeakingEndInNs;
- (void)deleteSpeakingStartInNs;
- (void)setEndpointDelayInNs:(unint64_t)a3;
- (void)setEndpointDelayInNsV2:(unint64_t)a3;
- (void)setEndpointModelDelayInNs:(unint64_t)a3;
- (void)setHasEndpointDelayInNs:(BOOL)a3;
- (void)setHasEndpointDelayInNsV2:(BOOL)a3;
- (void)setHasEndpointModelDelayInNs:(BOOL)a3;
- (void)setHasSpeakingEndInNs:(BOOL)a3;
- (void)setHasSpeakingStartInNs:(BOOL)a3;
- (void)setSpeakingEndInNs:(unint64_t)a3;
- (void)setSpeakingStartInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHEndpointDelayContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)endpointDelayInNsV2
{
  return self->_endpointDelayInNsV2;
}

- (unint64_t)endpointModelDelayInNs
{
  return self->_endpointModelDelayInNs;
}

- (unint64_t)endpointDelayInNs
{
  return self->_endpointDelayInNs;
}

- (unint64_t)speakingEndInNs
{
  return self->_speakingEndInNs;
}

- (unint64_t)speakingStartInNs
{
  return self->_speakingStartInNs;
}

- (MHSchemaMHEndpointDelayContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHEndpointDelayContext;
  v5 = [(MHSchemaMHEndpointDelayContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"speakingStartInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDelayContext setSpeakingStartInNs:](v5, "setSpeakingStartInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"speakingEndInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDelayContext setSpeakingEndInNs:](v5, "setSpeakingEndInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"endpointDelayInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDelayContext setEndpointDelayInNs:](v5, "setEndpointDelayInNs:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"endpointModelDelayInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDelayContext setEndpointModelDelayInNs:](v5, "setEndpointModelDelayInNs:", [v9 unsignedLongLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"endpointDelayInNsV2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointDelayContext setEndpointDelayInNsV2:](v5, "setEndpointDelayInNsV2:", [v10 unsignedLongLongValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHEndpointDelayContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHEndpointDelayContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHEndpointDelayContext *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext endpointDelayInNs](self, "endpointDelayInNs"));
    [v3 setObject:v7 forKeyedSubscript:@"endpointDelayInNs"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext endpointDelayInNsV2](self, "endpointDelayInNsV2"));
  [v3 setObject:v8 forKeyedSubscript:@"endpointDelayInNsV2"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext endpointModelDelayInNs](self, "endpointModelDelayInNs"));
  [v3 setObject:v9 forKeyedSubscript:@"endpointModelDelayInNs"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext speakingEndInNs](self, "speakingEndInNs"));
  [v3 setObject:v10 forKeyedSubscript:@"speakingEndInNs"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext speakingStartInNs](self, "speakingStartInNs"));
    [v3 setObject:v5 forKeyedSubscript:@"speakingStartInNs"];
  }
LABEL_7:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_speakingStartInNs;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_speakingEndInNs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_endpointDelayInNs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_endpointModelDelayInNs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_endpointDelayInNsV2;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $DD0EB3E906129A967B32EE5C102E6DFE has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t speakingStartInNs = self->_speakingStartInNs;
    if (speakingStartInNs != [v4 speakingStartInNs]) {
      goto LABEL_22;
    }
    $DD0EB3E906129A967B32EE5C102E6DFE has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    unint64_t speakingEndInNs = self->_speakingEndInNs;
    if (speakingEndInNs != [v4 speakingEndInNs]) {
      goto LABEL_22;
    }
    $DD0EB3E906129A967B32EE5C102E6DFE has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    unint64_t endpointDelayInNs = self->_endpointDelayInNs;
    if (endpointDelayInNs != [v4 endpointDelayInNs]) {
      goto LABEL_22;
    }
    $DD0EB3E906129A967B32EE5C102E6DFE has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    unint64_t endpointModelDelayInNs = self->_endpointModelDelayInNs;
    if (endpointModelDelayInNs == [v4 endpointModelDelayInNs])
    {
      $DD0EB3E906129A967B32EE5C102E6DFE has = self->_has;
      unsigned int v6 = v4[48];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    unint64_t endpointDelayInNsV2 = self->_endpointDelayInNsV2;
    if (endpointDelayInNsV2 != [v4 endpointDelayInNsV2]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint64Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHEndpointDelayContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEndpointDelayInNsV2
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasEndpointDelayInNsV2:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEndpointDelayInNsV2
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEndpointDelayInNsV2:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unint64_t endpointDelayInNsV2 = a3;
}

- (void)deleteEndpointModelDelayInNs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasEndpointModelDelayInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndpointModelDelayInNs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndpointModelDelayInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t endpointModelDelayInNs = a3;
}

- (void)deleteEndpointDelayInNs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasEndpointDelayInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndpointDelayInNs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEndpointDelayInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t endpointDelayInNs = a3;
}

- (void)deleteSpeakingEndInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSpeakingEndInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSpeakingEndInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSpeakingEndInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t speakingEndInNs = a3;
}

- (void)deleteSpeakingStartInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSpeakingStartInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSpeakingStartInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSpeakingStartInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t speakingStartInNs = a3;
}

@end