@interface INFERENCESchemaINFERENCEDisambiguationPromptContext
- (BOOL)hasAnonymizedEntitySelected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEDisambiguationPromptContext)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEDisambiguationPromptContext)initWithJSON:(id)a3;
- (NSArray)anonymizedEntitiesPresenteds;
- (NSData)jsonData;
- (NSString)anonymizedEntitySelected;
- (id)anonymizedEntitiesPresentedAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)anonymizedEntitiesPresentedCount;
- (unint64_t)hash;
- (void)addAnonymizedEntitiesPresented:(id)a3;
- (void)clearAnonymizedEntitiesPresented;
- (void)deleteAnonymizedEntitySelected;
- (void)setAnonymizedEntitiesPresenteds:(id)a3;
- (void)setAnonymizedEntitySelected:(id)a3;
- (void)setHasAnonymizedEntitySelected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEDisambiguationPromptContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedEntitySelected, 0);
  objc_storeStrong((id *)&self->_anonymizedEntitiesPresenteds, 0);
}

- (void)setHasAnonymizedEntitySelected:(BOOL)a3
{
  self->_hasAnonymizedEntitySelected = a3;
}

- (void)setAnonymizedEntitySelected:(id)a3
{
}

- (NSString)anonymizedEntitySelected
{
  return self->_anonymizedEntitySelected;
}

- (void)setAnonymizedEntitiesPresenteds:(id)a3
{
}

- (NSArray)anonymizedEntitiesPresenteds
{
  return self->_anonymizedEntitiesPresenteds;
}

- (INFERENCESchemaINFERENCEDisambiguationPromptContext)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INFERENCESchemaINFERENCEDisambiguationPromptContext;
  v5 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"anonymizedEntitiesPresented"];
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
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v18);
              [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)v5 addAnonymizedEntitiesPresented:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"anonymizedEntitySelected", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)v5 setAnonymizedEntitySelected:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEDisambiguationPromptContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self dictionaryRepresentation];
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
  if (self->_anonymizedEntitiesPresenteds)
  {
    id v4 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitiesPresenteds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"anonymizedEntitiesPresented"];
  }
  if (self->_anonymizedEntitySelected)
  {
    v6 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitySelected];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"anonymizedEntitySelected"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_anonymizedEntitiesPresenteds hash];
  return [(NSString *)self->_anonymizedEntitySelected hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitiesPresenteds];
  v6 = [v4 anonymizedEntitiesPresenteds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitiesPresenteds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitiesPresenteds];
    uint64_t v10 = [v4 anonymizedEntitiesPresenteds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitySelected];
  v6 = [v4 anonymizedEntitySelected];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitySelected];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitySelected];
    v15 = [v4 anonymizedEntitySelected];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_anonymizedEntitiesPresenteds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self anonymizedEntitySelected];

  if (v10) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEDisambiguationPromptContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnonymizedEntitySelected
{
}

- (BOOL)hasAnonymizedEntitySelected
{
  return self->_anonymizedEntitySelected != 0;
}

- (id)anonymizedEntitiesPresentedAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_anonymizedEntitiesPresenteds objectAtIndexedSubscript:a3];
}

- (unint64_t)anonymizedEntitiesPresentedCount
{
  return [(NSArray *)self->_anonymizedEntitiesPresenteds count];
}

- (void)addAnonymizedEntitiesPresented:(id)a3
{
  id v4 = a3;
  anonymizedEntitiesPresenteds = self->_anonymizedEntitiesPresenteds;
  id v8 = v4;
  if (!anonymizedEntitiesPresenteds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_anonymizedEntitiesPresenteds;
    self->_anonymizedEntitiesPresenteds = v6;

    id v4 = v8;
    anonymizedEntitiesPresenteds = self->_anonymizedEntitiesPresenteds;
  }
  [(NSArray *)anonymizedEntitiesPresenteds addObject:v4];
}

- (void)clearAnonymizedEntitiesPresented
{
}

@end