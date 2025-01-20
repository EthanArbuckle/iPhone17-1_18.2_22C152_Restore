@interface IFTSchemaIFTResolveToolExpression
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTResolveToolExpression)initWithDictionary:(id)a3;
- (IFTSchemaIFTResolveToolExpression)initWithJSON:(id)a3;
- (NSArray)toolIds;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)toolIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)toolIdsCount;
- (void)addToolIds:(id)a3;
- (void)clearToolIds;
- (void)setToolIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTResolveToolExpression

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IFTSchemaIFTResolveToolExpression;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(IFTSchemaIFTResolveToolExpression *)self deleteToolIds];
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

- (void)setToolIds:(id)a3
{
}

- (NSArray)toolIds
{
  return self->_toolIds;
}

- (IFTSchemaIFTResolveToolExpression)initWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IFTSchemaIFTResolveToolExpression;
  v5 = [(IFTSchemaIFTResolveToolExpression *)&v20 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"toolIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v16);
              [(IFTSchemaIFTResolveToolExpression *)v5 addToolIds:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v9);
      }
    }
    v14 = v5;
  }
  return v5;
}

- (IFTSchemaIFTResolveToolExpression)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTResolveToolExpression *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTResolveToolExpression *)self dictionaryRepresentation];
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
  if (self->_toolIds)
  {
    id v4 = [(IFTSchemaIFTResolveToolExpression *)self toolIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"toolIds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_toolIds hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(IFTSchemaIFTResolveToolExpression *)self toolIds];
    int v6 = [v4 toolIds];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(IFTSchemaIFTResolveToolExpression *)self toolIds];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(IFTSchemaIFTResolveToolExpression *)self toolIds];
      uint64_t v11 = [v4 toolIds];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_toolIds;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTResolveToolExpressionReadFrom(self, (uint64_t)a3);
}

- (id)toolIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_toolIds objectAtIndexedSubscript:a3];
}

- (unint64_t)toolIdsCount
{
  return [(NSArray *)self->_toolIds count];
}

- (void)addToolIds:(id)a3
{
  id v4 = a3;
  toolIds = self->_toolIds;
  id v8 = v4;
  if (!toolIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_toolIds;
    self->_toolIds = v6;

    id v4 = v8;
    toolIds = self->_toolIds;
  }
  [(NSArray *)toolIds addObject:v4];
}

- (void)clearToolIds
{
}

@end