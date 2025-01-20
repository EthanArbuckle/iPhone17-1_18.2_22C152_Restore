@interface RRSchemaProvisionalRREntityPoolReturned
- (BOOL)hasEntityCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)candidateEntities;
- (NSData)jsonData;
- (RRSchemaProvisionalRREntityPoolReturned)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRREntityPoolReturned)initWithJSON:(id)a3;
- (id)candidateEntitiesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)candidateEntitiesCount;
- (unint64_t)hash;
- (unsigned)entityCount;
- (void)addCandidateEntities:(id)a3;
- (void)clearCandidateEntities;
- (void)setCandidateEntities:(id)a3;
- (void)setEntityCount:(unsigned int)a3;
- (void)setHasEntityCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalRREntityPoolReturned

- (void).cxx_destruct
{
}

- (unsigned)entityCount
{
  return self->_entityCount;
}

- (void)setCandidateEntities:(id)a3
{
}

- (NSArray)candidateEntities
{
  return self->_candidateEntities;
}

- (RRSchemaProvisionalRREntityPoolReturned)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RRSchemaProvisionalRREntityPoolReturned;
  v5 = [(RRSchemaProvisionalRREntityPoolReturned *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"candidateEntities"];
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
              v13 = [RRSchemaProvisionalRRAnnotatedEntity alloc];
              v14 = -[RRSchemaProvisionalRRAnnotatedEntity initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(RRSchemaProvisionalRREntityPoolReturned *)v5 addCandidateEntities:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"entityCount", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalRREntityPoolReturned setEntityCount:](v5, "setEntityCount:", [v15 unsignedIntValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRREntityPoolReturned)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRREntityPoolReturned *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRREntityPoolReturned *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSArray *)self->_candidateEntities count])
  {
    id v4 = [MEMORY[0x263EFF980] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_candidateEntities;
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
            uint64_t v11 = [MEMORY[0x263EFF9D0] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"candidateEntities"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[RRSchemaProvisionalRREntityPoolReturned entityCount](self, "entityCount"));
    [v3 setObject:v12 forKeyedSubscript:@"entityCount"];
  }
  -[RRSchemaProvisionalRREntityPoolReturned willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v14);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_candidateEntities hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_entityCount;
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
  v5 = [(RRSchemaProvisionalRREntityPoolReturned *)self candidateEntities];
  uint64_t v6 = [v4 candidateEntities];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(RRSchemaProvisionalRREntityPoolReturned *)self candidateEntities];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(RRSchemaProvisionalRREntityPoolReturned *)self candidateEntities];
    uint64_t v11 = [v4 candidateEntities];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((v4[20] & 1) != (*(unsigned char *)&self->_has & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int entityCount = self->_entityCount;
    if (entityCount != [v4 entityCount]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_candidateEntities;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRREntityPoolReturnedReadFrom(self, (uint64_t)a3);
}

- (void)setHasEntityCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEntityCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int entityCount = a3;
}

- (id)candidateEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_candidateEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)candidateEntitiesCount
{
  return [(NSArray *)self->_candidateEntities count];
}

- (void)addCandidateEntities:(id)a3
{
  id v4 = a3;
  candidateEntities = self->_candidateEntities;
  id v8 = v4;
  if (!candidateEntities)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    uint64_t v7 = self->_candidateEntities;
    self->_candidateEntities = v6;

    id v4 = v8;
    candidateEntities = self->_candidateEntities;
  }
  [(NSArray *)candidateEntities addObject:v4];
}

- (void)clearCandidateEntities
{
}

@end