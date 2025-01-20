@interface PEGASUSSchemaPEGASUSVideoInteraction
- (BOOL)hasClientComponentName;
- (BOOL)hasClientInteractionVideoVerb;
- (BOOL)hasDialogId;
- (BOOL)hasInteractionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)clientComponentName;
- (NSString)dialogId;
- (PEGASUSSchemaPEGASUSVideoInteraction)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSVideoInteraction)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)clientInteractionVideoVerb;
- (int)interactionType;
- (unint64_t)hash;
- (void)deleteClientComponentName;
- (void)deleteClientInteractionVideoVerb;
- (void)deleteDialogId;
- (void)deleteInteractionType;
- (void)setClientComponentName:(id)a3;
- (void)setClientInteractionVideoVerb:(int)a3;
- (void)setDialogId:(id)a3;
- (void)setHasClientComponentName:(BOOL)a3;
- (void)setHasClientInteractionVideoVerb:(BOOL)a3;
- (void)setHasDialogId:(BOOL)a3;
- (void)setHasInteractionType:(BOOL)a3;
- (void)setInteractionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSVideoInteraction

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_clientComponentName, 0);
}

- (void)setHasDialogId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasClientComponentName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)clientInteractionVideoVerb
{
  return self->_clientInteractionVideoVerb;
}

- (void)setDialogId:(id)a3
{
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setClientComponentName:(id)a3
{
}

- (NSString)clientComponentName
{
  return self->_clientComponentName;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (PEGASUSSchemaPEGASUSVideoInteraction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSVideoInteraction;
  v5 = [(PEGASUSSchemaPEGASUSVideoInteraction *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"interactionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSVideoInteraction setInteractionType:](v5, "setInteractionType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"clientComponentName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(PEGASUSSchemaPEGASUSVideoInteraction *)v5 setClientComponentName:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"dialogId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(PEGASUSSchemaPEGASUSVideoInteraction *)v5 setDialogId:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"clientInteractionVideoVerb"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSVideoInteraction setClientInteractionVideoVerb:](v5, "setClientInteractionVideoVerb:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSVideoInteraction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSVideoInteraction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self dictionaryRepresentation];
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
  if (self->_clientComponentName)
  {
    id v4 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self clientComponentName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"clientComponentName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v6 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self clientInteractionVideoVerb] - 1;
    if (v6 > 8) {
      uint64_t v7 = @"PEGASUSVIDEOVERB_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBCE78[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"clientInteractionVideoVerb"];
  }
  if (self->_dialogId)
  {
    v8 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self dialogId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"dialogId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v10 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self interactionType];
    v11 = @"PEGASUSVIDEOINTERACTIONTYPE_UNKNOWN";
    if (v10 == 1) {
      v11 = @"PEGASUSVIDEOINTERACTIONTYPE_CLIENT";
    }
    if (v10 == 2) {
      v12 = @"PEGASUSVIDEOINTERACTIONTYPE_SERVER";
    }
    else {
      v12 = v11;
    }
    [v3 setObject:v12 forKeyedSubscript:@"interactionType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_interactionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_clientComponentName hash];
  NSUInteger v5 = [(NSString *)self->_dialogId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_clientInteractionVideoVerb;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[36] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int interactionType = self->_interactionType;
    if (interactionType != [v4 interactionType]) {
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self clientComponentName];
  uint64_t v7 = [v4 clientComponentName];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self clientComponentName];
  if (v8)
  {
    v9 = (void *)v8;
    int v10 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self clientComponentName];
    v11 = [v4 clientComponentName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v6 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self dialogId];
  uint64_t v7 = [v4 dialogId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self dialogId];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self dialogId];
    v16 = [v4 dialogId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v20 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20
      || (int clientInteractionVideoVerb = self->_clientInteractionVideoVerb,
          clientInteractionVideoVerb == [v4 clientInteractionVideoVerb]))
    {
      BOOL v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self clientComponentName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self dialogId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSVideoInteractionReadFrom(self, (uint64_t)a3);
}

- (void)deleteClientInteractionVideoVerb
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasClientInteractionVideoVerb:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClientInteractionVideoVerb
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setClientInteractionVideoVerb:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int clientInteractionVideoVerb = a3;
}

- (void)deleteDialogId
{
}

- (BOOL)hasDialogId
{
  return self->_dialogId != 0;
}

- (void)deleteClientComponentName
{
}

- (BOOL)hasClientComponentName
{
  return self->_clientComponentName != 0;
}

- (void)deleteInteractionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInteractionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInteractionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInteractionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int interactionType = a3;
}

@end