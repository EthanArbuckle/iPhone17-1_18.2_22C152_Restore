@interface DODMLASRSchemaDODMLASRNgramHits
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRNgramHits)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRNgramHits)initWithJSON:(id)a3;
- (NSArray)hits;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)hitsCount;
- (unsigned)hitsAtIndex:(unint64_t)a3;
- (void)addHits:(unsigned int)a3;
- (void)clearHits;
- (void)setHits:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRNgramHits

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHits:(id)a3
{
}

- (NSArray)hits
{
  return self->_hits;
}

- (DODMLASRSchemaDODMLASRNgramHits)initWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DODMLASRSchemaDODMLASRNgramHits;
  v5 = [(DODMLASRSchemaDODMLASRNgramHits *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hits"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[DODMLASRSchemaDODMLASRNgramHits addHits:](v5, "addHits:", objc_msgSend(v12, "unsignedIntValue", (void)v15));
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v9);
      }
    }
    v13 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRNgramHits)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRNgramHits *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRNgramHits *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_hits count])
  {
    id v4 = [(DODMLASRSchemaDODMLASRNgramHits *)self hits];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"hits"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_hits hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(DODMLASRSchemaDODMLASRNgramHits *)self hits];
    v6 = [v4 hits];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(DODMLASRSchemaDODMLASRNgramHits *)self hits];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(DODMLASRSchemaDODMLASRNgramHits *)self hits];
      uint64_t v11 = [v4 hits];
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
  v5 = self->_hits;
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "unsignedIntValue", (void)v10);
        PBDataWriterWriteUint32Field();
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
  return DODMLASRSchemaDODMLASRNgramHitsReadFrom(self, (uint64_t)a3);
}

- (unsigned)hitsAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_hits objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)hitsCount
{
  return [(NSArray *)self->_hits count];
}

- (void)addHits:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  hits = self->_hits;
  if (!hits)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_hits;
    self->_hits = v6;

    hits = self->_hits;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)hits addObject:v8];
}

- (void)clearHits
{
}

@end