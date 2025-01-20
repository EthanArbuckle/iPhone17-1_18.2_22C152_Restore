@interface FLOWSchemaFLOWTextMessageLength
- (BOOL)hasMessageCharLength;
- (BOOL)hasMessageWordLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWTextMessageLength)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWTextMessageLength)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)messageCharLength;
- (unsigned)messageWordLength;
- (void)deleteMessageCharLength;
- (void)deleteMessageWordLength;
- (void)setHasMessageCharLength:(BOOL)a3;
- (void)setHasMessageWordLength:(BOOL)a3;
- (void)setMessageCharLength:(unsigned int)a3;
- (void)setMessageWordLength:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWTextMessageLength

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)messageWordLength
{
  return self->_messageWordLength;
}

- (unsigned)messageCharLength
{
  return self->_messageCharLength;
}

- (FLOWSchemaFLOWTextMessageLength)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWTextMessageLength;
  v5 = [(FLOWSchemaFLOWTextMessageLength *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"messageCharLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWTextMessageLength setMessageCharLength:](v5, "setMessageCharLength:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"messageWordLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWTextMessageLength setMessageWordLength:](v5, "setMessageWordLength:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWTextMessageLength)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWTextMessageLength *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWTextMessageLength *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWTextMessageLength messageCharLength](self, "messageCharLength"));
    [v3 setObject:v5 forKeyedSubscript:@"messageCharLength"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWTextMessageLength messageWordLength](self, "messageWordLength"));
    [v3 setObject:v6 forKeyedSubscript:@"messageWordLength"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_messageCharLength;
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
  uint64_t v3 = 2654435761 * self->_messageWordLength;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $3D09FE962465E4623F1500CC933D86C6 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int messageCharLength = self->_messageCharLength;
    if (messageCharLength != [v4 messageCharLength])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $3D09FE962465E4623F1500CC933D86C6 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int messageWordLength = self->_messageWordLength;
    if (messageWordLength != [v4 messageWordLength]) {
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
  return FLOWSchemaFLOWTextMessageLengthReadFrom(self, (uint64_t)a3);
}

- (void)deleteMessageWordLength
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMessageWordLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageWordLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMessageWordLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int messageWordLength = a3;
}

- (void)deleteMessageCharLength
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMessageCharLength:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageCharLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMessageCharLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int messageCharLength = a3;
}

@end