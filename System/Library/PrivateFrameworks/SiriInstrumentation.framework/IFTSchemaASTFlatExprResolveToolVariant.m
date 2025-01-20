@interface IFTSchemaASTFlatExprResolveToolVariant
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaASTFlatExprResolveToolVariant)initWithDictionary:(id)a3;
- (IFTSchemaASTFlatExprResolveToolVariant)initWithJSON:(id)a3;
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
- (void)deleteExists;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setToolIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaASTFlatExprResolveToolVariant

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IFTSchemaASTFlatExprResolveToolVariant;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(IFTSchemaASTFlatExprResolveToolVariant *)self deleteToolIds];
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

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaASTFlatExprResolveToolVariant)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IFTSchemaASTFlatExprResolveToolVariant;
  v5 = [(IFTSchemaASTFlatExprResolveToolVariant *)&v21 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTFlatExprResolveToolVariant setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"toolIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = objc_msgSend(v13, "copy", (void)v17);
              [(IFTSchemaASTFlatExprResolveToolVariant *)v5 addToolIds:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v10);
      }
    }
    v15 = v5;
  }
  return v5;
}

- (IFTSchemaASTFlatExprResolveToolVariant)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaASTFlatExprResolveToolVariant *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaASTFlatExprResolveToolVariant *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaASTFlatExprResolveToolVariant exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_toolIds)
  {
    v5 = [(IFTSchemaASTFlatExprResolveToolVariant *)self toolIds];
    int v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"toolIds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSArray *)self->_toolIds hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int exists = self->_exists, exists == [v4 exists]))
      {
        int v6 = [(IFTSchemaASTFlatExprResolveToolVariant *)self toolIds];
        uint64_t v7 = [v4 toolIds];
        id v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(IFTSchemaASTFlatExprResolveToolVariant *)self toolIds];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(IFTSchemaASTFlatExprResolveToolVariant *)self toolIds];
          uint64_t v12 = [v4 toolIds];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
  return IFTSchemaASTFlatExprResolveToolVariantReadFrom(self, (uint64_t)a3);
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