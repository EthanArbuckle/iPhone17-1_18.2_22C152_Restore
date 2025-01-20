@interface SIRINLUEXTERNALSystemInformed
+ (Class)entitiesType;
- (BOOL)hasTaskId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)entities;
- (SIRINLUEXTERNALUUID)taskId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entitiesAtIndex:(unint64_t)a3;
- (unint64_t)entitiesCount;
- (unint64_t)hash;
- (void)addEntities:(id)a3;
- (void)clearEntities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntities:(id)a3;
- (void)setTaskId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSystemInformed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

- (void)setEntities:(id)a3
{
}

- (NSMutableArray)entities
{
  return self->_entities;
}

- (void)setTaskId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)taskId
{
  return self->_taskId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  taskId = self->_taskId;
  uint64_t v6 = *((void *)v4 + 2);
  if (taskId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](taskId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALSystemInformed setTaskId:](self, "setTaskId:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SIRINLUEXTERNALSystemInformed addEntities:](self, "addEntities:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_taskId hash];
  return [(NSMutableArray *)self->_entities hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((taskId = self->_taskId, !((unint64_t)taskId | v4[2]))
     || -[SIRINLUEXTERNALUUID isEqual:](taskId, "isEqual:")))
  {
    entities = self->_entities;
    if ((unint64_t)entities | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](entities, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_taskId copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_entities;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addEntities:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_taskId) {
    objc_msgSend(v8, "setTaskId:");
  }
  if ([(SIRINLUEXTERNALSystemInformed *)self entitiesCount])
  {
    [v8 clearEntities];
    unint64_t v4 = [(SIRINLUEXTERNALSystemInformed *)self entitiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(SIRINLUEXTERNALSystemInformed *)self entitiesAtIndex:i];
        [v8 addEntities:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_taskId) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemInformedReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  taskId = self->_taskId;
  if (taskId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)taskId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"task_id"];
  }
  if ([(NSMutableArray *)self->_entities count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_entities, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_entities;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"entities"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSystemInformed;
  id v4 = [(SIRINLUEXTERNALSystemInformed *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALSystemInformed *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)entitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_entities objectAtIndex:a3];
}

- (unint64_t)entitiesCount
{
  return [(NSMutableArray *)self->_entities count];
}

- (void)addEntities:(id)a3
{
  id v4 = a3;
  entities = self->_entities;
  id v8 = v4;
  if (!entities)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_entities;
    self->_entities = v6;

    id v4 = v8;
    entities = self->_entities;
  }
  [(NSMutableArray *)entities addObject:v4];
}

- (void)clearEntities
{
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

+ (Class)entitiesType
{
  return (Class)objc_opt_class();
}

@end