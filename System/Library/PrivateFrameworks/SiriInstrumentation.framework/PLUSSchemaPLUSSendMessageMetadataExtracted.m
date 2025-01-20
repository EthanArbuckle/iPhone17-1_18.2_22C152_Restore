@interface PLUSSchemaPLUSSendMessageMetadataExtracted
- (BOOL)hasInitialSendMessageRequestHasPayload;
- (BOOL)hasInitialSendMessageRequestNumberOfContacts;
- (BOOL)hasNumberOfTimesMessageContactChanged;
- (BOOL)hasNumberOfTimesMessagePayloadChanged;
- (BOOL)hasOriginalPlusId;
- (BOOL)initialSendMessageRequestHasPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSendMessageMetadataExtracted)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSendMessageMetadataExtracted)initWithJSON:(id)a3;
- (SISchemaUUID)originalPlusId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)initialSendMessageRequestNumberOfContacts;
- (unsigned)numberOfTimesMessageContactChanged;
- (unsigned)numberOfTimesMessagePayloadChanged;
- (void)deleteInitialSendMessageRequestHasPayload;
- (void)deleteInitialSendMessageRequestNumberOfContacts;
- (void)deleteNumberOfTimesMessageContactChanged;
- (void)deleteNumberOfTimesMessagePayloadChanged;
- (void)deleteOriginalPlusId;
- (void)setHasInitialSendMessageRequestHasPayload:(BOOL)a3;
- (void)setHasInitialSendMessageRequestNumberOfContacts:(BOOL)a3;
- (void)setHasNumberOfTimesMessageContactChanged:(BOOL)a3;
- (void)setHasNumberOfTimesMessagePayloadChanged:(BOOL)a3;
- (void)setHasOriginalPlusId:(BOOL)a3;
- (void)setInitialSendMessageRequestHasPayload:(BOOL)a3;
- (void)setInitialSendMessageRequestNumberOfContacts:(unsigned int)a3;
- (void)setNumberOfTimesMessageContactChanged:(unsigned int)a3;
- (void)setNumberOfTimesMessagePayloadChanged:(unsigned int)a3;
- (void)setOriginalPlusId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSendMessageMetadataExtracted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSSendMessageMetadataExtracted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self originalPlusId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self deleteOriginalPlusId];
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

- (void)setHasOriginalPlusId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)numberOfTimesMessagePayloadChanged
{
  return self->_numberOfTimesMessagePayloadChanged;
}

- (unsigned)numberOfTimesMessageContactChanged
{
  return self->_numberOfTimesMessageContactChanged;
}

- (BOOL)initialSendMessageRequestHasPayload
{
  return self->_initialSendMessageRequestHasPayload;
}

- (unsigned)initialSendMessageRequestNumberOfContacts
{
  return self->_initialSendMessageRequestNumberOfContacts;
}

- (void)setOriginalPlusId:(id)a3
{
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (PLUSSchemaPLUSSendMessageMetadataExtracted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSSendMessageMetadataExtracted;
  v5 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalPlusId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSendMessageMetadataExtracted *)v5 setOriginalPlusId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"initialSendMessageRequestNumberOfContacts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setInitialSendMessageRequestNumberOfContacts:](v5, "setInitialSendMessageRequestNumberOfContacts:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"initialSendMessageRequestHasPayload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setInitialSendMessageRequestHasPayload:](v5, "setInitialSendMessageRequestHasPayload:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numberOfTimesMessageContactChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setNumberOfTimesMessageContactChanged:](v5, "setNumberOfTimesMessageContactChanged:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"numberOfTimesMessagePayloadChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setNumberOfTimesMessagePayloadChanged:](v5, "setNumberOfTimesMessagePayloadChanged:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSendMessageMetadataExtracted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self dictionaryRepresentation];
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
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSSendMessageMetadataExtracted initialSendMessageRequestHasPayload](self, "initialSendMessageRequestHasPayload"));
    [v3 setObject:v8 forKeyedSubscript:@"initialSendMessageRequestHasPayload"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSSendMessageMetadataExtracted initialSendMessageRequestNumberOfContacts](self, "initialSendMessageRequestNumberOfContacts"));
  [v3 setObject:v9 forKeyedSubscript:@"initialSendMessageRequestNumberOfContacts"];

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
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSSendMessageMetadataExtracted numberOfTimesMessageContactChanged](self, "numberOfTimesMessageContactChanged"));
  [v3 setObject:v10 forKeyedSubscript:@"numberOfTimesMessageContactChanged"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSSendMessageMetadataExtracted numberOfTimesMessagePayloadChanged](self, "numberOfTimesMessagePayloadChanged"));
    [v3 setObject:v5 forKeyedSubscript:@"numberOfTimesMessagePayloadChanged"];
  }
LABEL_6:
  if (self->_originalPlusId)
  {
    v6 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self originalPlusId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"originalPlusId"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"originalPlusId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalPlusId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_initialSendMessageRequestNumberOfContacts;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_initialSendMessageRequestHasPayload;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_numberOfTimesMessageContactChanged;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_numberOfTimesMessagePayloadChanged;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self originalPlusId];
  uint64_t v6 = [v4 originalPlusId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self originalPlusId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self originalPlusId];
    v11 = [v4 originalPlusId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $2879DAAD60EADEFE0B2670B963E1FA38 has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int initialSendMessageRequestNumberOfContacts = self->_initialSendMessageRequestNumberOfContacts;
    if (initialSendMessageRequestNumberOfContacts != [v4 initialSendMessageRequestNumberOfContacts])goto LABEL_24; {
    $2879DAAD60EADEFE0B2670B963E1FA38 has = self->_has;
    }
    unsigned int v14 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    int initialSendMessageRequestHasPayload = self->_initialSendMessageRequestHasPayload;
    if (initialSendMessageRequestHasPayload != [v4 initialSendMessageRequestHasPayload]) {
      goto LABEL_24;
    }
    $2879DAAD60EADEFE0B2670B963E1FA38 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    unsigned int numberOfTimesMessageContactChanged = self->_numberOfTimesMessageContactChanged;
    if (numberOfTimesMessageContactChanged == [v4 numberOfTimesMessageContactChanged])
    {
      $2879DAAD60EADEFE0B2670B963E1FA38 has = self->_has;
      unsigned int v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    unsigned int numberOfTimesMessagePayloadChanged = self->_numberOfTimesMessagePayloadChanged;
    if (numberOfTimesMessagePayloadChanged != [v4 numberOfTimesMessagePayloadChanged]) {
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self originalPlusId];

  if (v4)
  {
    uint64_t v5 = [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self originalPlusId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSendMessageMetadataExtractedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumberOfTimesMessagePayloadChanged
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNumberOfTimesMessagePayloadChanged:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfTimesMessagePayloadChanged
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumberOfTimesMessagePayloadChanged:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int numberOfTimesMessagePayloadChanged = a3;
}

- (void)deleteNumberOfTimesMessageContactChanged
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumberOfTimesMessageContactChanged:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfTimesMessageContactChanged
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumberOfTimesMessageContactChanged:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int numberOfTimesMessageContactChanged = a3;
}

- (void)deleteInitialSendMessageRequestHasPayload
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasInitialSendMessageRequestHasPayload:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInitialSendMessageRequestHasPayload
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInitialSendMessageRequestHasPayload:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int initialSendMessageRequestHasPayload = a3;
}

- (void)deleteInitialSendMessageRequestNumberOfContacts
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInitialSendMessageRequestNumberOfContacts:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInitialSendMessageRequestNumberOfContacts
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInitialSendMessageRequestNumberOfContacts:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int initialSendMessageRequestNumberOfContacts = a3;
}

- (void)deleteOriginalPlusId
{
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

@end