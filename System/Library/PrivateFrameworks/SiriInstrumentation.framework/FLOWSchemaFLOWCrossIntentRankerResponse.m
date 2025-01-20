@interface FLOWSchemaFLOWCrossIntentRankerResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWCrossIntentRankerResponse)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWCrossIntentRankerResponse)initWithJSON:(id)a3;
- (NSArray)crossDomainRankerScoreKeepers;
- (NSArray)crossIntentRankerScoreKeepers;
- (NSData)jsonData;
- (id)crossDomainRankerScoreKeeperAtIndex:(unint64_t)a3;
- (id)crossIntentRankerScoreKeeperAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)crossDomainRankerScoreKeeperCount;
- (unint64_t)crossIntentRankerScoreKeeperCount;
- (unint64_t)hash;
- (void)addCrossDomainRankerScoreKeeper:(id)a3;
- (void)addCrossIntentRankerScoreKeeper:(id)a3;
- (void)clearCrossDomainRankerScoreKeeper;
- (void)clearCrossIntentRankerScoreKeeper;
- (void)setCrossDomainRankerScoreKeepers:(id)a3;
- (void)setCrossIntentRankerScoreKeepers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWCrossIntentRankerResponse

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossIntentRankerScoreKeepers, 0);
  objc_storeStrong((id *)&self->_crossDomainRankerScoreKeepers, 0);
}

- (void)setCrossIntentRankerScoreKeepers:(id)a3
{
}

- (NSArray)crossIntentRankerScoreKeepers
{
  return self->_crossIntentRankerScoreKeepers;
}

- (void)setCrossDomainRankerScoreKeepers:(id)a3
{
}

- (NSArray)crossDomainRankerScoreKeepers
{
  return self->_crossDomainRankerScoreKeepers;
}

- (FLOWSchemaFLOWCrossIntentRankerResponse)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FLOWSchemaFLOWCrossIntentRankerResponse;
  v5 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)&v32 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"crossDomainRankerScoreKeeper"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = (void *)[v12 copy];
              [(FLOWSchemaFLOWCrossIntentRankerResponse *)v5 addCrossDomainRankerScoreKeeper:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"crossIntentRankerScoreKeeper"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = objc_msgSend(v20, "copy", (void)v24);
              [(FLOWSchemaFLOWCrossIntentRankerResponse *)v5 addCrossIntentRankerScoreKeeper:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v17);
      }
    }
    v22 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWCrossIntentRankerResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self dictionaryRepresentation];
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
  if (self->_crossDomainRankerScoreKeepers)
  {
    id v4 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"crossDomainRankerScoreKeeper"];
  }
  if (self->_crossIntentRankerScoreKeepers)
  {
    v6 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"crossIntentRankerScoreKeeper"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_crossDomainRankerScoreKeepers hash];
  return [(NSArray *)self->_crossIntentRankerScoreKeepers hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
  v6 = [v4 crossDomainRankerScoreKeepers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
    uint64_t v10 = [v4 crossDomainRankerScoreKeepers];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
  v6 = [v4 crossIntentRankerScoreKeepers];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(FLOWSchemaFLOWCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
    id v15 = [v4 crossIntentRankerScoreKeepers];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_crossDomainRankerScoreKeepers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_crossIntentRankerScoreKeepers;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWCrossIntentRankerResponseReadFrom(self, (uint64_t)a3);
}

- (id)crossIntentRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_crossIntentRankerScoreKeepers objectAtIndexedSubscript:a3];
}

- (unint64_t)crossIntentRankerScoreKeeperCount
{
  return [(NSArray *)self->_crossIntentRankerScoreKeepers count];
}

- (void)addCrossIntentRankerScoreKeeper:(id)a3
{
  id v4 = a3;
  crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  id v8 = v4;
  if (!crossIntentRankerScoreKeepers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_crossIntentRankerScoreKeepers;
    self->_crossIntentRankerScoreKeepers = v6;

    id v4 = v8;
    crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  }
  [(NSArray *)crossIntentRankerScoreKeepers addObject:v4];
}

- (void)clearCrossIntentRankerScoreKeeper
{
}

- (id)crossDomainRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_crossDomainRankerScoreKeepers objectAtIndexedSubscript:a3];
}

- (unint64_t)crossDomainRankerScoreKeeperCount
{
  return [(NSArray *)self->_crossDomainRankerScoreKeepers count];
}

- (void)addCrossDomainRankerScoreKeeper:(id)a3
{
  id v4 = a3;
  crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  id v8 = v4;
  if (!crossDomainRankerScoreKeepers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_crossDomainRankerScoreKeepers;
    self->_crossDomainRankerScoreKeepers = v6;

    id v4 = v8;
    crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  }
  [(NSArray *)crossDomainRankerScoreKeepers addObject:v4];
}

- (void)clearCrossDomainRankerScoreKeeper
{
}

@end