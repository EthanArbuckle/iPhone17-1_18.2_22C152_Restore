@interface PLATFORMProvisionalConnectedComponents
- (BOOL)hasRepresentativeId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)componentIds;
- (NSData)jsonData;
- (PLATFORMProvisionalConnectecedComponentIdentifier)representativeId;
- (PLATFORMProvisionalConnectedComponents)initWithDictionary:(id)a3;
- (PLATFORMProvisionalConnectedComponents)initWithJSON:(id)a3;
- (id)componentIdsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)componentIdsCount;
- (unint64_t)hash;
- (void)addComponentIds:(id)a3;
- (void)clearComponentIds;
- (void)deleteRepresentativeId;
- (void)setComponentIds:(id)a3;
- (void)setHasRepresentativeId:(BOOL)a3;
- (void)setRepresentativeId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLATFORMProvisionalConnectedComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeId, 0);
  objc_storeStrong((id *)&self->_componentIds, 0);
}

- (void)setHasRepresentativeId:(BOOL)a3
{
  self->_hasRepresentativeId = a3;
}

- (void)setRepresentativeId:(id)a3
{
}

- (PLATFORMProvisionalConnectecedComponentIdentifier)representativeId
{
  return self->_representativeId;
}

- (void)setComponentIds:(id)a3
{
}

- (NSArray)componentIds
{
  return self->_componentIds;
}

- (PLATFORMProvisionalConnectedComponents)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PLATFORMProvisionalConnectedComponents;
  v5 = [(PLATFORMProvisionalConnectedComponents *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"componentIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [PLATFORMProvisionalConnectecedComponentIdentifier alloc];
              v14 = -[PLATFORMProvisionalConnectecedComponentIdentifier initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(PLATFORMProvisionalConnectedComponents *)v5 addComponentIds:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"representativeId", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[PLATFORMProvisionalConnectecedComponentIdentifier alloc] initWithDictionary:v15];
      [(PLATFORMProvisionalConnectedComponents *)v5 setRepresentativeId:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (PLATFORMProvisionalConnectedComponents)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLATFORMProvisionalConnectedComponents *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLATFORMProvisionalConnectedComponents *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_componentIds count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_componentIds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"componentIds"];
  }
  if (self->_representativeId)
  {
    uint64_t v12 = [(PLATFORMProvisionalConnectedComponents *)self representativeId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"representativeId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"representativeId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_componentIds hash];
  return [(PLATFORMProvisionalConnectecedComponentIdentifier *)self->_representativeId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLATFORMProvisionalConnectedComponents *)self componentIds];
  uint64_t v6 = [v4 componentIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PLATFORMProvisionalConnectedComponents *)self componentIds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PLATFORMProvisionalConnectedComponents *)self componentIds];
    uint64_t v10 = [v4 componentIds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PLATFORMProvisionalConnectedComponents *)self representativeId];
  uint64_t v6 = [v4 representativeId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PLATFORMProvisionalConnectedComponents *)self representativeId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(PLATFORMProvisionalConnectedComponents *)self representativeId];
    v15 = [v4 representativeId];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_componentIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(PLATFORMProvisionalConnectedComponents *)self representativeId];

  if (v10)
  {
    int v11 = [(PLATFORMProvisionalConnectedComponents *)self representativeId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLATFORMProvisionalConnectedComponentsReadFrom(self, (uint64_t)a3);
}

- (void)deleteRepresentativeId
{
}

- (BOOL)hasRepresentativeId
{
  return self->_representativeId != 0;
}

- (id)componentIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_componentIds objectAtIndexedSubscript:a3];
}

- (unint64_t)componentIdsCount
{
  return [(NSArray *)self->_componentIds count];
}

- (void)addComponentIds:(id)a3
{
  id v4 = a3;
  componentIds = self->_componentIds;
  id v8 = v4;
  if (!componentIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_componentIds;
    self->_componentIds = v6;

    id v4 = v8;
    componentIds = self->_componentIds;
  }
  [(NSArray *)componentIds addObject:v4];
}

- (void)clearComponentIds
{
}

@end