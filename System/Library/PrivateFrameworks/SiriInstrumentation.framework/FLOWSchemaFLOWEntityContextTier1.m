@interface FLOWSchemaFLOWEntityContextTier1
- (BOOL)hasEntitySelected;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWEntityContextTier1)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWEntityContextTier1)initWithJSON:(id)a3;
- (FLOWSchemaFLOWEntityTier1)entitySelected;
- (NSArray)entitiesPresenteds;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)entitiesPresentedAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)entitiesPresentedCount;
- (unint64_t)hash;
- (void)addEntitiesPresented:(id)a3;
- (void)clearEntitiesPresented;
- (void)deleteEntitySelected;
- (void)deleteLinkId;
- (void)setEntitiesPresenteds:(id)a3;
- (void)setEntitySelected:(id)a3;
- (void)setHasEntitySelected:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWEntityContextTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLOWSchemaFLOWEntityContextTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWEntityContextTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWEntityContextTier1 *)self deleteLinkId];
  }
  v9 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitiesPresenteds];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(FLOWSchemaFLOWEntityContextTier1 *)self setEntitiesPresenteds:v10];

  v11 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitySelected];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(FLOWSchemaFLOWEntityContextTier1 *)self deleteEntitySelected];
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
  objc_storeStrong((id *)&self->_entitySelected, 0);
  objc_storeStrong((id *)&self->_entitiesPresenteds, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasEntitySelected:(BOOL)a3
{
  self->_hasEntitySelected = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setEntitySelected:(id)a3
{
}

- (FLOWSchemaFLOWEntityTier1)entitySelected
{
  return self->_entitySelected;
}

- (void)setEntitiesPresenteds:(id)a3
{
}

- (NSArray)entitiesPresenteds
{
  return self->_entitiesPresenteds;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (FLOWSchemaFLOWEntityContextTier1)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FLOWSchemaFLOWEntityContextTier1;
  v5 = [(FLOWSchemaFLOWEntityContextTier1 *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWEntityContextTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"entitiesPresented"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_super v15 = [[FLOWSchemaFLOWEntityTier1 alloc] initWithDictionary:v14];
              [(FLOWSchemaFLOWEntityContextTier1 *)v5 addEntitiesPresented:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v11);
      }

      v6 = v20;
    }
    v16 = [v4 objectForKeyedSubscript:@"entitySelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[FLOWSchemaFLOWEntityTier1 alloc] initWithDictionary:v16];
      [(FLOWSchemaFLOWEntityContextTier1 *)v5 setEntitySelected:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWEntityContextTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWEntityContextTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWEntityContextTier1 *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_entitiesPresenteds count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = self->_entitiesPresenteds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"entitiesPresented"];
  }
  if (self->_entitySelected)
  {
    uint64_t v12 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitySelected];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"entitySelected"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"entitySelected"];
    }
  }
  if (self->_linkId)
  {
    objc_super v15 = [(FLOWSchemaFLOWEntityContextTier1 *)self linkId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"linkId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  uint64_t v4 = [(NSArray *)self->_entitiesPresenteds hash] ^ v3;
  return v4 ^ [(FLOWSchemaFLOWEntityTier1 *)self->_entitySelected hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(FLOWSchemaFLOWEntityContextTier1 *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(FLOWSchemaFLOWEntityContextTier1 *)self linkId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(FLOWSchemaFLOWEntityContextTier1 *)self linkId];
    uint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitiesPresenteds];
  uint64_t v6 = [v4 entitiesPresenteds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitiesPresenteds];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitiesPresenteds];
    objc_super v15 = [v4 entitiesPresenteds];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitySelected];
  uint64_t v6 = [v4 entitySelected];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitySelected];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitySelected];
    long long v20 = [v4 entitySelected];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(FLOWSchemaFLOWEntityContextTier1 *)self linkId];

  if (v5)
  {
    uint64_t v6 = [(FLOWSchemaFLOWEntityContextTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_entitiesPresenteds;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitySelected];

  if (v12)
  {
    uint64_t v13 = [(FLOWSchemaFLOWEntityContextTier1 *)self entitySelected];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWEntityContextTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteEntitySelected
{
}

- (BOOL)hasEntitySelected
{
  return self->_entitySelected != 0;
}

- (id)entitiesPresentedAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entitiesPresenteds objectAtIndexedSubscript:a3];
}

- (unint64_t)entitiesPresentedCount
{
  return [(NSArray *)self->_entitiesPresenteds count];
}

- (void)addEntitiesPresented:(id)a3
{
  id v4 = a3;
  entitiesPresenteds = self->_entitiesPresenteds;
  id v8 = v4;
  if (!entitiesPresenteds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entitiesPresenteds;
    self->_entitiesPresenteds = v6;

    id v4 = v8;
    entitiesPresenteds = self->_entitiesPresenteds;
  }
  [(NSArray *)entitiesPresenteds addObject:v4];
}

- (void)clearEntitiesPresented
{
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end