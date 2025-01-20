@interface FLOWLINKSchemaFLOWLINKAction
- (BOOL)hasActionIdentifierName;
- (BOOL)hasLinkId;
- (BOOL)hasPresentationStyle;
- (BOOL)hasSystemProtocol;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWLINKSchemaFLOWLINKAction)initWithDictionary:(id)a3;
- (FLOWLINKSchemaFLOWLINKAction)initWithJSON:(id)a3;
- (NSArray)parameters;
- (NSData)jsonData;
- (NSString)actionIdentifierName;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)parametersAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)presentationStyle;
- (int)systemProtocol;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)addParameters:(id)a3;
- (void)clearParameters;
- (void)deleteActionIdentifierName;
- (void)deleteLinkId;
- (void)deletePresentationStyle;
- (void)deleteSystemProtocol;
- (void)setActionIdentifierName:(id)a3;
- (void)setHasActionIdentifierName:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasPresentationStyle:(BOOL)a3;
- (void)setHasSystemProtocol:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPresentationStyle:(int)a3;
- (void)setSystemProtocol:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWLINKSchemaFLOWLINKAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWLINKSchemaFLOWLINKAction;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWLINKSchemaFLOWLINKAction *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWLINKSchemaFLOWLINKAction *)self deleteLinkId];
  }
  v9 = [(FLOWLINKSchemaFLOWLINKAction *)self parameters];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(FLOWLINKSchemaFLOWLINKAction *)self setParameters:v10];

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
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifierName, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasActionIdentifierName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setParameters:(id)a3
{
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (int)systemProtocol
{
  return self->_systemProtocol;
}

- (void)setActionIdentifierName:(id)a3
{
}

- (NSString)actionIdentifierName
{
  return self->_actionIdentifierName;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (FLOWLINKSchemaFLOWLINKAction)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FLOWLINKSchemaFLOWLINKAction;
  v5 = [(FLOWLINKSchemaFLOWLINKAction *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWLINKSchemaFLOWLINKAction *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"actionIdentifierName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(FLOWLINKSchemaFLOWLINKAction *)v5 setActionIdentifierName:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"systemProtocol"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWLINKSchemaFLOWLINKAction setSystemProtocol:](v5, "setSystemProtocol:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"presentationStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWLINKSchemaFLOWLINKAction setPresentationStyle:](v5, "setPresentationStyle:", [v11 intValue]);
    }
    objc_super v12 = [v4 objectForKeyedSubscript:@"parameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v11;
      v23 = v8;
      v24 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[FLOWLINKSchemaFLOWLINKActionParameter alloc] initWithDictionary:v18];
              [(FLOWLINKSchemaFLOWLINKAction *)v5 addParameters:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v15);
      }

      int v8 = v23;
      v6 = v24;
      v11 = v22;
    }
    v20 = v5;
  }
  return v5;
}

- (FLOWLINKSchemaFLOWLINKAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWLINKSchemaFLOWLINKAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWLINKSchemaFLOWLINKAction *)self dictionaryRepresentation];
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_actionIdentifierName)
  {
    id v4 = [(FLOWLINKSchemaFLOWLINKAction *)self actionIdentifierName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"actionIdentifierName"];
  }
  if (self->_linkId)
  {
    v6 = [(FLOWLINKSchemaFLOWLINKAction *)self linkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_parameters count])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v10 = self->_parameters;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"parameters"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v18 = [(FLOWLINKSchemaFLOWLINKAction *)self presentationStyle] - 1;
    if (v18 > 2) {
      v19 = @"FLOWLINKACTIONPRESENTATIONSTYLE_UNKNOWN";
    }
    else {
      v19 = off_1E5EAE768[v18];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, @"presentationStyle", (void)v23);
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v20 = [(FLOWLINKSchemaFLOWLINKAction *)self systemProtocol] - 1;
    if (v20 > 0x19) {
      v21 = @"LINKSYSTEMACTIONPROTOCOL_UNKNOWN";
    }
    else {
      v21 = off_1E5EAE780[v20];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, @"systemProtocol", (void)v23);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v23);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v4 = [(NSString *)self->_actionIdentifierName hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_systemProtocol;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSArray *)self->_parameters hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_presentationStyle;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSArray *)self->_parameters hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(FLOWLINKSchemaFLOWLINKAction *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(FLOWLINKSchemaFLOWLINKAction *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(FLOWLINKSchemaFLOWLINKAction *)self linkId];
    v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWLINKSchemaFLOWLINKAction *)self actionIdentifierName];
  uint64_t v6 = [v4 actionIdentifierName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v12 = [(FLOWLINKSchemaFLOWLINKAction *)self actionIdentifierName];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(FLOWLINKSchemaFLOWLINKAction *)self actionIdentifierName];
    uint64_t v15 = [v4 actionIdentifierName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $1946B6BD4AE34C1C3EF29A46664DCAD9 has = self->_has;
  unsigned int v18 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&has)
  {
    int systemProtocol = self->_systemProtocol;
    if (systemProtocol != [v4 systemProtocol]) {
      goto LABEL_24;
    }
    $1946B6BD4AE34C1C3EF29A46664DCAD9 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int presentationStyle = self->_presentationStyle;
    if (presentationStyle != [v4 presentationStyle]) {
      goto LABEL_24;
    }
  }
  uint64_t v5 = [(FLOWLINKSchemaFLOWLINKAction *)self parameters];
  uint64_t v6 = [v4 parameters];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v22 = [(FLOWLINKSchemaFLOWLINKAction *)self parameters];
  if (!v22)
  {

LABEL_27:
    BOOL v27 = 1;
    goto LABEL_25;
  }
  long long v23 = (void *)v22;
  long long v24 = [(FLOWLINKSchemaFLOWLINKAction *)self parameters];
  long long v25 = [v4 parameters];
  char v26 = [v24 isEqual:v25];

  if (v26) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v27 = 0;
LABEL_25:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FLOWLINKSchemaFLOWLINKAction *)self linkId];

  if (v5)
  {
    uint64_t v6 = [(FLOWLINKSchemaFLOWLINKAction *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(FLOWLINKSchemaFLOWLINKAction *)self actionIdentifierName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_parameters;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKActionReadFrom(self, (uint64_t)a3);
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_parameters objectAtIndexedSubscript:a3];
}

- (unint64_t)parametersCount
{
  return [(NSArray *)self->_parameters count];
}

- (void)addParameters:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  [(NSArray *)parameters addObject:v4];
}

- (void)clearParameters
{
}

- (void)deletePresentationStyle
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPresentationStyle:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPresentationStyle
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPresentationStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int presentationStyle = a3;
}

- (void)deleteSystemProtocol
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSystemProtocol:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSystemProtocol
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSystemProtocol:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int systemProtocol = a3;
}

- (void)deleteActionIdentifierName
{
}

- (BOOL)hasActionIdentifierName
{
  return self->_actionIdentifierName != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end