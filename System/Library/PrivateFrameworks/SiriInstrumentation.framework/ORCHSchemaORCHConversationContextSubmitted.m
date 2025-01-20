@interface ORCHSchemaORCHConversationContextSubmitted
- (BOOL)contextUpdateError;
- (BOOL)contextUpdateReceived;
- (BOOL)hasContextUpdateError;
- (BOOL)hasContextUpdateReceived;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHConversationContextSubmitted)initWithDictionary:(id)a3;
- (ORCHSchemaORCHConversationContextSubmitted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteContextUpdateError;
- (void)deleteContextUpdateReceived;
- (void)setContextUpdateError:(BOOL)a3;
- (void)setContextUpdateReceived:(BOOL)a3;
- (void)setHasContextUpdateError:(BOOL)a3;
- (void)setHasContextUpdateReceived:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHConversationContextSubmitted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)contextUpdateError
{
  return self->_contextUpdateError;
}

- (BOOL)contextUpdateReceived
{
  return self->_contextUpdateReceived;
}

- (ORCHSchemaORCHConversationContextSubmitted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaORCHConversationContextSubmitted;
  v5 = [(ORCHSchemaORCHConversationContextSubmitted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextUpdateReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHConversationContextSubmitted setContextUpdateReceived:](v5, "setContextUpdateReceived:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"contextUpdateError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHConversationContextSubmitted setContextUpdateError:](v5, "setContextUpdateError:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHConversationContextSubmitted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHConversationContextSubmitted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHConversationContextSubmitted *)self dictionaryRepresentation];
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
  char v4 = *(&self->_contextUpdateError + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHConversationContextSubmitted contextUpdateError](self, "contextUpdateError"));
    [v3 setObject:v5 forKeyedSubscript:@"contextUpdateError"];

    char v4 = *(&self->_contextUpdateError + 1);
  }
  if (v4)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHConversationContextSubmitted contextUpdateReceived](self, "contextUpdateReceived"));
    [v3 setObject:v6 forKeyedSubscript:@"contextUpdateReceived"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_contextUpdateError + 1))
  {
    uint64_t v2 = 2654435761 * self->_contextUpdateReceived;
    if ((*(&self->_contextUpdateError + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_contextUpdateError + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_contextUpdateError;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_contextUpdateError + 1);
  unsigned int v6 = v4[10];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int contextUpdateReceived = self->_contextUpdateReceived;
    if (contextUpdateReceived != [v4 contextUpdateReceived])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_contextUpdateError + 1);
    unsigned int v6 = v4[10];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int contextUpdateError = self->_contextUpdateError;
    if (contextUpdateError != [v4 contextUpdateError]) {
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
  char v5 = *(&self->_contextUpdateError + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_contextUpdateError + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHConversationContextSubmittedReadFrom(self, (uint64_t)a3);
}

- (void)deleteContextUpdateError
{
  *(&self->_contextUpdateError + 1) &= ~2u;
}

- (void)setHasContextUpdateError:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_contextUpdateError + 1) = *(&self->_contextUpdateError + 1) & 0xFD | v3;
}

- (BOOL)hasContextUpdateError
{
  return (*((unsigned __int8 *)&self->_contextUpdateError + 1) >> 1) & 1;
}

- (void)setContextUpdateError:(BOOL)a3
{
  *(&self->_contextUpdateError + 1) |= 2u;
  self->_int contextUpdateError = a3;
}

- (void)deleteContextUpdateReceived
{
  *(&self->_contextUpdateError + 1) &= ~1u;
}

- (void)setHasContextUpdateReceived:(BOOL)a3
{
  *(&self->_contextUpdateError + 1) = *(&self->_contextUpdateError + 1) & 0xFE | a3;
}

- (BOOL)hasContextUpdateReceived
{
  return *(&self->_contextUpdateError + 1);
}

- (void)setContextUpdateReceived:(BOOL)a3
{
  *(&self->_contextUpdateError + 1) |= 1u;
  self->_int contextUpdateReceived = a3;
}

@end