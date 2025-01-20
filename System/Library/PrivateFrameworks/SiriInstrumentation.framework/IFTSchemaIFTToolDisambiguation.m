@interface IFTSchemaIFTToolDisambiguation
- (BOOL)exists;
- (BOOL)hasAssistantSchemaKind;
- (BOOL)hasExists;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTToolDisambiguation)initWithDictionary:(id)a3;
- (IFTSchemaIFTToolDisambiguation)initWithJSON:(id)a3;
- (NSArray)tools;
- (NSData)jsonData;
- (NSString)assistantSchemaKind;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)toolsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)toolsCount;
- (void)addTools:(id)a3;
- (void)clearTools;
- (void)deleteAssistantSchemaKind;
- (void)deleteExists;
- (void)setAssistantSchemaKind:(id)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasAssistantSchemaKind:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setTools:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTToolDisambiguation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTToolDisambiguation;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(IFTSchemaIFTToolDisambiguation *)self deleteAssistantSchemaKind];
  }
  v6 = [(IFTSchemaIFTToolDisambiguation *)self tools];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(IFTSchemaIFTToolDisambiguation *)self setTools:v7];

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
  objc_storeStrong((id *)&self->_tools, 0);
  objc_storeStrong((id *)&self->_assistantSchemaKind, 0);
}

- (void)setHasAssistantSchemaKind:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTools:(id)a3
{
}

- (NSArray)tools
{
  return self->_tools;
}

- (void)setAssistantSchemaKind:(id)a3
{
}

- (NSString)assistantSchemaKind
{
  return self->_assistantSchemaKind;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTToolDisambiguation)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IFTSchemaIFTToolDisambiguation;
  v5 = [(IFTSchemaIFTToolDisambiguation *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTToolDisambiguation setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"assistantSchemaKind"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(IFTSchemaIFTToolDisambiguation *)v5 setAssistantSchemaKind:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"tools"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v7;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[IFTSchemaIFTToolDefinition alloc] initWithDictionary:v15];
              [(IFTSchemaIFTToolDisambiguation *)v5 addTools:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      v7 = v19;
    }
    v17 = v5;
  }
  return v5;
}

- (IFTSchemaIFTToolDisambiguation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTToolDisambiguation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTToolDisambiguation *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_assistantSchemaKind)
  {
    id v4 = [(IFTSchemaIFTToolDisambiguation *)self assistantSchemaKind];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assistantSchemaKind"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTToolDisambiguation exists](self, "exists"));
    [v3 setObject:v6 forKeyedSubscript:@"exists"];
  }
  if ([(NSArray *)self->_tools count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = self->_tools;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"tools"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_assistantSchemaKind hash] ^ v3;
  return v4 ^ [(NSArray *)self->_tools hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_15;
    }
  }
  v6 = [(IFTSchemaIFTToolDisambiguation *)self assistantSchemaKind];
  uint64_t v7 = [v4 assistantSchemaKind];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(IFTSchemaIFTToolDisambiguation *)self assistantSchemaKind];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(IFTSchemaIFTToolDisambiguation *)self assistantSchemaKind];
    uint64_t v11 = [v4 assistantSchemaKind];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTToolDisambiguation *)self tools];
  uint64_t v7 = [v4 tools];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(IFTSchemaIFTToolDisambiguation *)self tools];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    uint64_t v15 = [(IFTSchemaIFTToolDisambiguation *)self tools];
    long long v16 = [v4 tools];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(IFTSchemaIFTToolDisambiguation *)self assistantSchemaKind];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_tools;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTToolDisambiguationReadFrom(self, (uint64_t)a3);
}

- (id)toolsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tools objectAtIndexedSubscript:a3];
}

- (unint64_t)toolsCount
{
  return [(NSArray *)self->_tools count];
}

- (void)addTools:(id)a3
{
  id v4 = a3;
  tools = self->_tools;
  id v8 = v4;
  if (!tools)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tools;
    self->_tools = v6;

    id v4 = v8;
    tools = self->_tools;
  }
  [(NSArray *)tools addObject:v4];
}

- (void)clearTools
{
}

- (void)deleteAssistantSchemaKind
{
}

- (BOOL)hasAssistantSchemaKind
{
  return self->_assistantSchemaKind != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end