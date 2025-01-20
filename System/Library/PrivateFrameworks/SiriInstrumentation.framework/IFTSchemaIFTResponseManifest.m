@interface IFTSchemaIFTResponseManifest
- (BOOL)hasUseTemplateAsFallback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useTemplateAsFallback;
- (IFTSchemaIFTResponseManifest)initWithDictionary:(id)a3;
- (IFTSchemaIFTResponseManifest)initWithJSON:(id)a3;
- (NSArray)parameters;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)parametersAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)addParameters:(id)a3;
- (void)clearParameters;
- (void)deleteUseTemplateAsFallback;
- (void)setHasUseTemplateAsFallback:(BOOL)a3;
- (void)setParameters:(id)a3;
- (void)setUseTemplateAsFallback:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTResponseManifest

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTResponseManifest;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTResponseManifest *)self parameters];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(IFTSchemaIFTResponseManifest *)self setParameters:v7];
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

- (BOOL)useTemplateAsFallback
{
  return self->_useTemplateAsFallback;
}

- (void)setParameters:(id)a3
{
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (IFTSchemaIFTResponseManifest)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IFTSchemaIFTResponseManifest;
  v5 = [(IFTSchemaIFTResponseManifest *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"parameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [IFTSchemaIFTResponseParameter alloc];
              v14 = -[IFTSchemaIFTResponseParameter initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(IFTSchemaIFTResponseManifest *)v5 addParameters:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"useTemplateAsFallback", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTResponseManifest setUseTemplateAsFallback:](v5, "setUseTemplateAsFallback:", [v15 BOOLValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (IFTSchemaIFTResponseManifest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTResponseManifest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTResponseManifest *)self dictionaryRepresentation];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_parameters count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_parameters;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"parameters"];
  }
  if (*(&self->_useTemplateAsFallback + 1))
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTResponseManifest useTemplateAsFallback](self, "useTemplateAsFallback"));
    [v3 setObject:v12 forKeyedSubscript:@"useTemplateAsFallback"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v14);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_parameters hash];
  if (*(&self->_useTemplateAsFallback + 1)) {
    uint64_t v4 = 2654435761 * self->_useTemplateAsFallback;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IFTSchemaIFTResponseManifest *)self parameters];
  uint64_t v6 = [v4 parameters];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(IFTSchemaIFTResponseManifest *)self parameters];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(IFTSchemaIFTResponseManifest *)self parameters];
    uint64_t v11 = [v4 parameters];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_useTemplateAsFallback + 1) != (v4[17] & 1)) {
    goto LABEL_12;
  }
  if (*(&self->_useTemplateAsFallback + 1))
  {
    int useTemplateAsFallback = self->_useTemplateAsFallback;
    if (useTemplateAsFallback != [v4 useTemplateAsFallback]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_parameters;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(&self->_useTemplateAsFallback + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTResponseManifestReadFrom(self, (uint64_t)a3);
}

- (void)deleteUseTemplateAsFallback
{
  *(&self->_useTemplateAsFallback + 1) &= ~1u;
}

- (void)setHasUseTemplateAsFallback:(BOOL)a3
{
  *(&self->_useTemplateAsFallback + 1) = *(&self->_useTemplateAsFallback + 1) & 0xFE | a3;
}

- (BOOL)hasUseTemplateAsFallback
{
  return *(&self->_useTemplateAsFallback + 1);
}

- (void)setUseTemplateAsFallback:(BOOL)a3
{
  *(&self->_useTemplateAsFallback + 1) |= 1u;
  self->_int useTemplateAsFallback = a3;
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

@end