@interface FLOWSchemaFLOWHomeAutomationContext
- (BOOL)hasHomeAutomationCommand;
- (BOOL)hasHomeContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWHomeAutomationCommand)homeAutomationCommand;
- (FLOWSchemaFLOWHomeAutomationContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWHomeAutomationContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWHomeContext)homeContext;
- (NSArray)homeKitServiceResponses;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)homeKitServiceResponseAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)homeKitServiceResponseCount;
- (void)addHomeKitServiceResponse:(id)a3;
- (void)clearHomeKitServiceResponse;
- (void)deleteHomeAutomationCommand;
- (void)deleteHomeContext;
- (void)setHasHomeAutomationCommand:(BOOL)a3;
- (void)setHasHomeContext:(BOOL)a3;
- (void)setHomeAutomationCommand:(id)a3;
- (void)setHomeContext:(id)a3;
- (void)setHomeKitServiceResponses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWHomeAutomationContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLOWSchemaFLOWHomeAutomationContext;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeKitServiceResponses];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(FLOWSchemaFLOWHomeAutomationContext *)self setHomeKitServiceResponses:v7];

  v8 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeContext];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(FLOWSchemaFLOWHomeAutomationContext *)self deleteHomeContext];
  }
  v11 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeAutomationCommand];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(FLOWSchemaFLOWHomeAutomationContext *)self deleteHomeAutomationCommand];
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
  objc_storeStrong((id *)&self->_homeAutomationCommand, 0);
  objc_storeStrong((id *)&self->_homeContext, 0);
  objc_storeStrong((id *)&self->_homeKitServiceResponses, 0);
}

- (void)setHasHomeAutomationCommand:(BOOL)a3
{
  self->_hasHomeAutomationCommand = a3;
}

- (void)setHasHomeContext:(BOOL)a3
{
  self->_hasHomeContext = a3;
}

- (void)setHomeAutomationCommand:(id)a3
{
}

- (FLOWSchemaFLOWHomeAutomationCommand)homeAutomationCommand
{
  return self->_homeAutomationCommand;
}

- (void)setHomeContext:(id)a3
{
}

- (FLOWSchemaFLOWHomeContext)homeContext
{
  return self->_homeContext;
}

- (void)setHomeKitServiceResponses:(id)a3
{
}

- (NSArray)homeKitServiceResponses
{
  return self->_homeKitServiceResponses;
}

- (FLOWSchemaFLOWHomeAutomationContext)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FLOWSchemaFLOWHomeAutomationContext;
  v5 = [(FLOWSchemaFLOWHomeAutomationContext *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"homeKitServiceResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v13 = [FLOWSchemaFLOWHomeKitServiceResponse alloc];
              v14 = -[FLOWSchemaFLOWHomeKitServiceResponse initWithDictionary:](v13, "initWithDictionary:", v12, (void)v21);
              [(FLOWSchemaFLOWHomeAutomationContext *)v5 addHomeKitServiceResponse:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    objc_super v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"homeContext", (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[FLOWSchemaFLOWHomeContext alloc] initWithDictionary:v15];
      [(FLOWSchemaFLOWHomeAutomationContext *)v5 setHomeContext:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"homeAutomationCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[FLOWSchemaFLOWHomeAutomationCommand alloc] initWithDictionary:v17];
      [(FLOWSchemaFLOWHomeAutomationContext *)v5 setHomeAutomationCommand:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWHomeAutomationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWHomeAutomationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWHomeAutomationContext *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_homeAutomationCommand)
  {
    id v4 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeAutomationCommand];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"homeAutomationCommand"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"homeAutomationCommand"];
    }
  }
  if (self->_homeContext)
  {
    uint64_t v7 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"homeContext"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"homeContext"];
    }
  }
  if ([(NSArray *)self->_homeKitServiceResponses count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = self->_homeKitServiceResponses;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"homeKitServiceResponse"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_homeKitServiceResponses hash];
  unint64_t v4 = [(FLOWSchemaFLOWHomeContext *)self->_homeContext hash] ^ v3;
  return v4 ^ [(FLOWSchemaFLOWHomeAutomationCommand *)self->_homeAutomationCommand hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeKitServiceResponses];
  v6 = [v4 homeKitServiceResponses];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeKitServiceResponses];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeKitServiceResponses];
    uint64_t v10 = [v4 homeKitServiceResponses];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeContext];
  v6 = [v4 homeContext];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeContext];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeContext];
    objc_super v15 = [v4 homeContext];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeAutomationCommand];
  v6 = [v4 homeAutomationCommand];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeAutomationCommand];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeAutomationCommand];
    long long v20 = [v4 homeAutomationCommand];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_homeKitServiceResponses;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeContext];

  if (v10)
  {
    int v11 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeAutomationCommand];

  if (v12)
  {
    uint64_t v13 = [(FLOWSchemaFLOWHomeAutomationContext *)self homeAutomationCommand];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteHomeAutomationCommand
{
}

- (BOOL)hasHomeAutomationCommand
{
  return self->_homeAutomationCommand != 0;
}

- (void)deleteHomeContext
{
}

- (BOOL)hasHomeContext
{
  return self->_homeContext != 0;
}

- (id)homeKitServiceResponseAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_homeKitServiceResponses objectAtIndexedSubscript:a3];
}

- (unint64_t)homeKitServiceResponseCount
{
  return [(NSArray *)self->_homeKitServiceResponses count];
}

- (void)addHomeKitServiceResponse:(id)a3
{
  id v4 = a3;
  homeKitServiceResponses = self->_homeKitServiceResponses;
  id v8 = v4;
  if (!homeKitServiceResponses)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_homeKitServiceResponses;
    self->_homeKitServiceResponses = v6;

    id v4 = v8;
    homeKitServiceResponses = self->_homeKitServiceResponses;
  }
  [(NSArray *)homeKitServiceResponses addObject:v4];
}

- (void)clearHomeKitServiceResponse
{
}

@end