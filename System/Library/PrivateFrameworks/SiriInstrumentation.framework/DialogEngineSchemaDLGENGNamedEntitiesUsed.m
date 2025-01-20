@interface DialogEngineSchemaDLGENGNamedEntitiesUsed
- (BOOL)hasCatId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DialogEngineSchemaDLGENGNamedEntitiesUsed)initWithDictionary:(id)a3;
- (DialogEngineSchemaDLGENGNamedEntitiesUsed)initWithJSON:(id)a3;
- (NSArray)namedEntities;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)namedEntitiesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)catId;
- (unint64_t)hash;
- (unint64_t)namedEntitiesCount;
- (void)addNamedEntities:(id)a3;
- (void)clearNamedEntities;
- (void)deleteCatId;
- (void)setCatId:(int)a3;
- (void)setHasCatId:(BOOL)a3;
- (void)setNamedEntities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DialogEngineSchemaDLGENGNamedEntitiesUsed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DialogEngineSchemaDLGENGNamedEntitiesUsed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self namedEntities];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self setNamedEntities:v7];
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

- (void)setNamedEntities:(id)a3
{
}

- (NSArray)namedEntities
{
  return self->_namedEntities;
}

- (int)catId
{
  return self->_catId;
}

- (DialogEngineSchemaDLGENGNamedEntitiesUsed)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DialogEngineSchemaDLGENGNamedEntitiesUsed;
  v5 = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"catId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DialogEngineSchemaDLGENGNamedEntitiesUsed setCatId:](v5, "setCatId:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"namedEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v6;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[DialogEngineSchemaDialogEngineNamedEntity alloc] initWithDictionary:v13];
              [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)v5 addNamedEntities:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v10);
      }

      v6 = v17;
    }
    v15 = v5;
  }
  return v5;
}

- (DialogEngineSchemaDLGENGNamedEntitiesUsed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self catId] - 1;
    if (v4 > 0x25) {
      v5 = @"DIALOGENGINENAMEDENTITYCATID__UNKNOWN";
    }
    else {
      v5 = off_1E5EBF928[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"catId"];
  }
  if ([(NSArray *)self->_namedEntities count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_namedEntities;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"namedEntities"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_catId;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSArray *)self->_namedEntities hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0 || (int catId = self->_catId, catId == [v4 catId]))
      {
        v6 = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self namedEntities];
        uint64_t v7 = [v4 namedEntities];
        uint64_t v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self namedEntities];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self namedEntities];
          uint64_t v12 = [v4 namedEntities];
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
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_namedEntities;
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
}

- (BOOL)readFrom:(id)a3
{
  return DialogEngineSchemaDLGENGNamedEntitiesUsedReadFrom(self, (uint64_t)a3);
}

- (id)namedEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_namedEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)namedEntitiesCount
{
  return [(NSArray *)self->_namedEntities count];
}

- (void)addNamedEntities:(id)a3
{
  id v4 = a3;
  namedEntities = self->_namedEntities;
  id v8 = v4;
  if (!namedEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_namedEntities;
    self->_namedEntities = v6;

    id v4 = v8;
    namedEntities = self->_namedEntities;
  }
  [(NSArray *)namedEntities addObject:v4];
}

- (void)clearNamedEntities
{
}

- (void)deleteCatId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCatId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCatId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCatId:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int catId = a3;
}

@end