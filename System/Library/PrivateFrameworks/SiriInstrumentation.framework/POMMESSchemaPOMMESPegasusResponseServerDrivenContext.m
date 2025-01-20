@interface POMMESSchemaPOMMESPegasusResponseServerDrivenContext
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)catIds;
- (NSData)jsonData;
- (POMMESSchemaPOMMESPegasusResponseServerDrivenContext)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusResponseServerDrivenContext)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)catIdAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)catIdCount;
- (unint64_t)hash;
- (void)addCatId:(id)a3;
- (void)clearCatId;
- (void)setCatIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusResponseServerDrivenContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)POMMESSchemaPOMMESPegasusResponseServerDrivenContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self deleteCatId];
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

- (void)setCatIds:(id)a3
{
}

- (NSArray)catIds
{
  return self->_catIds;
}

- (POMMESSchemaPOMMESPegasusResponseServerDrivenContext)initWithDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)POMMESSchemaPOMMESPegasusResponseServerDrivenContext;
  v5 = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)&v20 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"catId"];
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
              [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)v5 addCatId:v13];
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

- (POMMESSchemaPOMMESPegasusResponseServerDrivenContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self dictionaryRepresentation];
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
  if (self->_catIds)
  {
    id v4 = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self catIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"catId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_catIds hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self catIds];
    int v6 = [v4 catIds];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self catIds];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self catIds];
      uint64_t v11 = [v4 catIds];
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
  v5 = self->_catIds;
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
  return POMMESSchemaPOMMESPegasusResponseServerDrivenContextReadFrom(self, (uint64_t)a3);
}

- (id)catIdAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_catIds objectAtIndexedSubscript:a3];
}

- (unint64_t)catIdCount
{
  return [(NSArray *)self->_catIds count];
}

- (void)addCatId:(id)a3
{
  id v4 = a3;
  catIds = self->_catIds;
  id v8 = v4;
  if (!catIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_catIds;
    self->_catIds = v6;

    id v4 = v8;
    catIds = self->_catIds;
  }
  [(NSArray *)catIds addObject:v4];
}

- (void)clearCatId
{
}

@end