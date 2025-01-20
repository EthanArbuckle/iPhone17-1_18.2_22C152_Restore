@interface POMMESSchemaPOMMESClientConversationMetadata
- (BOOL)hasDisplayHints;
- (BOOL)hasHasDisplayHints;
- (BOOL)hasHasPromptContext;
- (BOOL)hasOnDeviceMetadata;
- (BOOL)hasPromptContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESClientConversationMetadata)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESClientConversationMetadata)initWithJSON:(id)a3;
- (POMMESSchemaPOMMESOnDeviceMetadata)onDeviceMetadata;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHasDisplayHints;
- (void)deleteHasPromptContext;
- (void)deleteOnDeviceMetadata;
- (void)setHasDisplayHints:(BOOL)a3;
- (void)setHasHasDisplayHints:(BOOL)a3;
- (void)setHasHasPromptContext:(BOOL)a3;
- (void)setHasOnDeviceMetadata:(BOOL)a3;
- (void)setHasPromptContext:(BOOL)a3;
- (void)setOnDeviceMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESClientConversationMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESClientConversationMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESClientConversationMetadata *)self onDeviceMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESClientConversationMetadata *)self deleteOnDeviceMetadata];
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

- (void)setHasOnDeviceMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setOnDeviceMetadata:(id)a3
{
}

- (POMMESSchemaPOMMESOnDeviceMetadata)onDeviceMetadata
{
  return self->_onDeviceMetadata;
}

- (BOOL)hasDisplayHints
{
  return self->_hasDisplayHints;
}

- (BOOL)hasPromptContext
{
  return self->_hasPromptContext;
}

- (POMMESSchemaPOMMESClientConversationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESClientConversationMetadata;
  v5 = [(POMMESSchemaPOMMESClientConversationMetadata *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasPromptContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESClientConversationMetadata setHasPromptContext:](v5, "setHasPromptContext:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasDisplayHints"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESClientConversationMetadata setHasDisplayHints:](v5, "setHasDisplayHints:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"onDeviceMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[POMMESSchemaPOMMESOnDeviceMetadata alloc] initWithDictionary:v8];
      [(POMMESSchemaPOMMESClientConversationMetadata *)v5 setOnDeviceMetadata:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESClientConversationMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESClientConversationMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESClientConversationMetadata *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESClientConversationMetadata hasDisplayHints](self, "hasDisplayHints"));
    [v3 setObject:v5 forKeyedSubscript:@"hasDisplayHints"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESClientConversationMetadata hasPromptContext](self, "hasPromptContext"));
    [v3 setObject:v6 forKeyedSubscript:@"hasPromptContext"];
  }
  if (self->_onDeviceMetadata)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESClientConversationMetadata *)self onDeviceMetadata];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"onDeviceMetadata"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"onDeviceMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_hasPromptContext;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(POMMESSchemaPOMMESOnDeviceMetadata *)self->_onDeviceMetadata hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_hasDisplayHints;
  return v3 ^ v2 ^ [(POMMESSchemaPOMMESOnDeviceMetadata *)self->_onDeviceMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $1E5C00EB363F734EBCFAFC79E7E92861 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int hasPromptContext = self->_hasPromptContext;
    if (hasPromptContext != [v4 hasPromptContext]) {
      goto LABEL_14;
    }
    $1E5C00EB363F734EBCFAFC79E7E92861 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (int hasDisplayHints = self->_hasDisplayHints, hasDisplayHints == [v4 hasDisplayHints]))
    {
      v10 = [(POMMESSchemaPOMMESClientConversationMetadata *)self onDeviceMetadata];
      v11 = [v4 onDeviceMetadata];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(POMMESSchemaPOMMESClientConversationMetadata *)self onDeviceMetadata];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(POMMESSchemaPOMMESClientConversationMetadata *)self onDeviceMetadata];
        v16 = [v4 onDeviceMetadata];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(POMMESSchemaPOMMESClientConversationMetadata *)self onDeviceMetadata];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESClientConversationMetadata *)self onDeviceMetadata];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESClientConversationMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteOnDeviceMetadata
{
}

- (BOOL)hasOnDeviceMetadata
{
  return self->_onDeviceMetadata != 0;
}

- (void)deleteHasDisplayHints
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasDisplayHints:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasDisplayHints
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDisplayHints:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int hasDisplayHints = a3;
}

- (void)deleteHasPromptContext
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHasPromptContext:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasPromptContext
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPromptContext:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hasPromptContext = a3;
}

@end