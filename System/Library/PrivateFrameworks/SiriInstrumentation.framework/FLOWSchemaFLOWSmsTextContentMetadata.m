@interface FLOWSchemaFLOWSmsTextContentMetadata
- (BOOL)hasFlowKeyboardUsageMetadata;
- (BOOL)hasIsPayloadMultilingual;
- (BOOL)hasIsPunctuationUsed;
- (BOOL)hasMessageCharLength;
- (BOOL)hasMessageWordLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPayloadMultilingual;
- (BOOL)isPunctuationUsed;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWKeyboardUsageMetadata)flowKeyboardUsageMetadata;
- (FLOWSchemaFLOWSmsTextContentMetadata)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWSmsTextContentMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)messageCharLength;
- (unsigned)messageWordLength;
- (void)deleteFlowKeyboardUsageMetadata;
- (void)deleteIsPayloadMultilingual;
- (void)deleteIsPunctuationUsed;
- (void)deleteMessageCharLength;
- (void)deleteMessageWordLength;
- (void)setFlowKeyboardUsageMetadata:(id)a3;
- (void)setHasFlowKeyboardUsageMetadata:(BOOL)a3;
- (void)setHasIsPayloadMultilingual:(BOOL)a3;
- (void)setHasIsPunctuationUsed:(BOOL)a3;
- (void)setHasMessageCharLength:(BOOL)a3;
- (void)setHasMessageWordLength:(BOOL)a3;
- (void)setIsPayloadMultilingual:(BOOL)a3;
- (void)setIsPunctuationUsed:(BOOL)a3;
- (void)setMessageCharLength:(unsigned int)a3;
- (void)setMessageWordLength:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWSmsTextContentMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWSmsTextContentMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self flowKeyboardUsageMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(FLOWSchemaFLOWSmsTextContentMetadata *)self deleteFlowKeyboardUsageMetadata];
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

- (void)setHasFlowKeyboardUsageMetadata:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 2) = a3;
}

- (BOOL)isPayloadMultilingual
{
  return self->_isPayloadMultilingual;
}

- (BOOL)isPunctuationUsed
{
  return self->_isPunctuationUsed;
}

- (void)setFlowKeyboardUsageMetadata:(id)a3
{
}

- (FLOWSchemaFLOWKeyboardUsageMetadata)flowKeyboardUsageMetadata
{
  return self->_flowKeyboardUsageMetadata;
}

- (unsigned)messageWordLength
{
  return self->_messageWordLength;
}

- (unsigned)messageCharLength
{
  return self->_messageCharLength;
}

- (FLOWSchemaFLOWSmsTextContentMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLOWSchemaFLOWSmsTextContentMetadata;
  v5 = [(FLOWSchemaFLOWSmsTextContentMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"messageCharLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsTextContentMetadata setMessageCharLength:](v5, "setMessageCharLength:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"messageWordLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsTextContentMetadata setMessageWordLength:](v5, "setMessageWordLength:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"flowKeyboardUsageMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[FLOWSchemaFLOWKeyboardUsageMetadata alloc] initWithDictionary:v8];
      [(FLOWSchemaFLOWSmsTextContentMetadata *)v5 setFlowKeyboardUsageMetadata:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isPunctuationUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsTextContentMetadata setIsPunctuationUsed:](v5, "setIsPunctuationUsed:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isPayloadMultilingual"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsTextContentMetadata setIsPayloadMultilingual:](v5, "setIsPayloadMultilingual:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWSmsTextContentMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWSmsTextContentMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self dictionaryRepresentation];
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
  if (self->_flowKeyboardUsageMetadata)
  {
    id v4 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self flowKeyboardUsageMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"flowKeyboardUsageMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"flowKeyboardUsageMetadata"];
    }
  }
  char v7 = *(&self->_isPayloadMultilingual + 1);
  if ((v7 & 8) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsTextContentMetadata isPayloadMultilingual](self, "isPayloadMultilingual"));
    [v3 setObject:v10 forKeyedSubscript:@"isPayloadMultilingual"];

    char v7 = *(&self->_isPayloadMultilingual + 1);
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
  }
  else if ((*(&self->_isPayloadMultilingual + 1) & 4) == 0)
  {
    goto LABEL_8;
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsTextContentMetadata isPunctuationUsed](self, "isPunctuationUsed"));
  [v3 setObject:v11 forKeyedSubscript:@"isPunctuationUsed"];

  char v7 = *(&self->_isPayloadMultilingual + 1);
  if ((v7 & 1) == 0)
  {
LABEL_9:
    if ((v7 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_16:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWSmsTextContentMetadata messageCharLength](self, "messageCharLength"));
  [v3 setObject:v12 forKeyedSubscript:@"messageCharLength"];

  if ((*(&self->_isPayloadMultilingual + 1) & 2) != 0)
  {
LABEL_10:
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWSmsTextContentMetadata messageWordLength](self, "messageWordLength"));
    [v3 setObject:v8 forKeyedSubscript:@"messageWordLength"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isPayloadMultilingual + 1))
  {
    uint64_t v3 = 2654435761 * self->_messageCharLength;
    if ((*(&self->_isPayloadMultilingual + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(&self->_isPayloadMultilingual + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_messageWordLength;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(FLOWSchemaFLOWKeyboardUsageMetadata *)self->_flowKeyboardUsageMetadata hash];
  if ((*(&self->_isPayloadMultilingual + 1) & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isPunctuationUsed;
    if ((*(&self->_isPayloadMultilingual + 1) & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(&self->_isPayloadMultilingual + 1) & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_isPayloadMultilingual;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
  unsigned int v6 = v4[26];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_23;
  }
  if (v5)
  {
    unsigned int messageCharLength = self->_messageCharLength;
    if (messageCharLength != [v4 messageCharLength]) {
      goto LABEL_23;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
    unsigned int v6 = v4[26];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_23;
  }
  if (v8)
  {
    unsigned int messageWordLength = self->_messageWordLength;
    if (messageWordLength != [v4 messageWordLength]) {
      goto LABEL_23;
    }
  }
  v10 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self flowKeyboardUsageMetadata];
  v11 = [v4 flowKeyboardUsageMetadata];
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_23;
  }
  uint64_t v13 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self flowKeyboardUsageMetadata];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self flowKeyboardUsageMetadata];
    v16 = [v4 flowKeyboardUsageMetadata];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  unsigned int v18 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
  int v19 = (v18 >> 2) & 1;
  unsigned int v20 = v4[26];
  if (v19 != ((v20 >> 2) & 1))
  {
LABEL_23:
    BOOL v24 = 0;
    goto LABEL_24;
  }
  if (v19)
  {
    int isPunctuationUsed = self->_isPunctuationUsed;
    if (isPunctuationUsed == [v4 isPunctuationUsed])
    {
      unsigned int v18 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
      unsigned int v20 = v4[26];
      goto LABEL_19;
    }
    goto LABEL_23;
  }
LABEL_19:
  int v22 = (v18 >> 3) & 1;
  if (v22 != ((v20 >> 3) & 1)) {
    goto LABEL_23;
  }
  if (v22)
  {
    int isPayloadMultilingual = self->_isPayloadMultilingual;
    if (isPayloadMultilingual != [v4 isPayloadMultilingual]) {
      goto LABEL_23;
    }
  }
  BOOL v24 = 1;
LABEL_24:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char v4 = *(&self->_isPayloadMultilingual + 1);
  if (v4)
  {
    PBDataWriterWriteUint32Field();
    char v4 = *(&self->_isPayloadMultilingual + 1);
  }
  if ((v4 & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  unsigned int v5 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self flowKeyboardUsageMetadata];

  if (v5)
  {
    unsigned int v6 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self flowKeyboardUsageMetadata];
    PBDataWriterWriteSubmessage();
  }
  char v7 = *(&self->_isPayloadMultilingual + 1);
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = *(&self->_isPayloadMultilingual + 1);
  }
  if ((v7 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSmsTextContentMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsPayloadMultilingual
{
  *(&self->_isPayloadMultilingual + 1) &= ~8u;
}

- (void)setHasIsPayloadMultilingual:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xF7 | v3;
}

- (BOOL)hasIsPayloadMultilingual
{
  return (*((unsigned __int8 *)&self->_isPayloadMultilingual + 1) >> 3) & 1;
}

- (void)setIsPayloadMultilingual:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 8u;
  self->_int isPayloadMultilingual = a3;
}

- (void)deleteIsPunctuationUsed
{
  *(&self->_isPayloadMultilingual + 1) &= ~4u;
}

- (void)setHasIsPunctuationUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xFB | v3;
}

- (BOOL)hasIsPunctuationUsed
{
  return (*((unsigned __int8 *)&self->_isPayloadMultilingual + 1) >> 2) & 1;
}

- (void)setIsPunctuationUsed:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 4u;
  self->_int isPunctuationUsed = a3;
}

- (void)deleteFlowKeyboardUsageMetadata
{
}

- (BOOL)hasFlowKeyboardUsageMetadata
{
  return self->_flowKeyboardUsageMetadata != 0;
}

- (void)deleteMessageWordLength
{
  *(&self->_isPayloadMultilingual + 1) &= ~2u;
}

- (void)setHasMessageWordLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xFD | v3;
}

- (BOOL)hasMessageWordLength
{
  return (*((unsigned __int8 *)&self->_isPayloadMultilingual + 1) >> 1) & 1;
}

- (void)setMessageWordLength:(unsigned int)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 2u;
  self->_unsigned int messageWordLength = a3;
}

- (void)deleteMessageCharLength
{
  *(&self->_isPayloadMultilingual + 1) &= ~1u;
}

- (void)setHasMessageCharLength:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xFE | a3;
}

- (BOOL)hasMessageCharLength
{
  return *(&self->_isPayloadMultilingual + 1);
}

- (void)setMessageCharLength:(unsigned int)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 1u;
  self->_unsigned int messageCharLength = a3;
}

@end