@interface CAARSchemaCAARTieBreaker
- (BOOL)hasIsTieBreakerSupported;
- (BOOL)hasTieBreakerName;
- (BOOL)hasWasTieBreakerForcedSkipped;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTieBreakerSupported;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasTieBreakerForcedSkipped;
- (CAARSchemaCAARTieBreaker)initWithDictionary:(id)a3;
- (CAARSchemaCAARTieBreaker)initWithJSON:(id)a3;
- (NSArray)actionCandidateBoosts;
- (NSData)jsonData;
- (NSString)tieBreakerName;
- (id)actionCandidateBoostsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)actionCandidateBoostsCount;
- (unint64_t)hash;
- (void)addActionCandidateBoosts:(id)a3;
- (void)clearActionCandidateBoosts;
- (void)deleteIsTieBreakerSupported;
- (void)deleteTieBreakerName;
- (void)deleteWasTieBreakerForcedSkipped;
- (void)setActionCandidateBoosts:(id)a3;
- (void)setHasIsTieBreakerSupported:(BOOL)a3;
- (void)setHasTieBreakerName:(BOOL)a3;
- (void)setHasWasTieBreakerForcedSkipped:(BOOL)a3;
- (void)setIsTieBreakerSupported:(BOOL)a3;
- (void)setTieBreakerName:(id)a3;
- (void)setWasTieBreakerForcedSkipped:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARTieBreaker

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAARSchemaCAARTieBreaker;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CAARSchemaCAARTieBreaker *)self actionCandidateBoosts];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(CAARSchemaCAARTieBreaker *)self setActionCandidateBoosts:v7];
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
  objc_storeStrong((id *)&self->_actionCandidateBoosts, 0);
  objc_storeStrong((id *)&self->_tieBreakerName, 0);
}

- (void)setHasTieBreakerName:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 2) = a3;
}

- (BOOL)wasTieBreakerForcedSkipped
{
  return self->_wasTieBreakerForcedSkipped;
}

- (BOOL)isTieBreakerSupported
{
  return self->_isTieBreakerSupported;
}

- (void)setActionCandidateBoosts:(id)a3
{
}

- (NSArray)actionCandidateBoosts
{
  return self->_actionCandidateBoosts;
}

- (void)setTieBreakerName:(id)a3
{
}

- (NSString)tieBreakerName
{
  return self->_tieBreakerName;
}

- (CAARSchemaCAARTieBreaker)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CAARSchemaCAARTieBreaker;
  v5 = [(CAARSchemaCAARTieBreaker *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tieBreakerName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(CAARSchemaCAARTieBreaker *)v5 setTieBreakerName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"actionCandidateBoosts"];
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
              v15 = [[CAARSchemaCAARScoreBoost alloc] initWithDictionary:v14];
              [(CAARSchemaCAARTieBreaker *)v5 addActionCandidateBoosts:v15];
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
    v16 = [v4 objectForKeyedSubscript:@"isTieBreakerSupported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARTieBreaker setIsTieBreakerSupported:](v5, "setIsTieBreakerSupported:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"wasTieBreakerForcedSkipped"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARTieBreaker setWasTieBreakerForcedSkipped:](v5, "setWasTieBreakerForcedSkipped:", [v17 BOOLValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (CAARSchemaCAARTieBreaker)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARTieBreaker *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARTieBreaker *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_actionCandidateBoosts count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_actionCandidateBoosts;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"actionCandidateBoosts"];
  }
  if (*(&self->_wasTieBreakerForcedSkipped + 1))
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARTieBreaker isTieBreakerSupported](self, "isTieBreakerSupported"));
    [v3 setObject:v12 forKeyedSubscript:@"isTieBreakerSupported"];
  }
  if (self->_tieBreakerName)
  {
    uint64_t v13 = [(CAARSchemaCAARTieBreaker *)self tieBreakerName];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"tieBreakerName"];
  }
  if ((*(&self->_wasTieBreakerForcedSkipped + 1) & 2) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARTieBreaker wasTieBreakerForcedSkipped](self, "wasTieBreakerForcedSkipped"));
    [v3 setObject:v15 forKeyedSubscript:@"wasTieBreakerForcedSkipped"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v17);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tieBreakerName hash];
  uint64_t v4 = [(NSArray *)self->_actionCandidateBoosts hash];
  if (*(&self->_wasTieBreakerForcedSkipped + 1))
  {
    uint64_t v5 = 2654435761 * self->_isTieBreakerSupported;
    if ((*(&self->_wasTieBreakerForcedSkipped + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(&self->_wasTieBreakerForcedSkipped + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_wasTieBreakerForcedSkipped;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(CAARSchemaCAARTieBreaker *)self tieBreakerName];
  uint64_t v6 = [v4 tieBreakerName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(CAARSchemaCAARTieBreaker *)self tieBreakerName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(CAARSchemaCAARTieBreaker *)self tieBreakerName];
    uint64_t v10 = [v4 tieBreakerName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CAARSchemaCAARTieBreaker *)self actionCandidateBoosts];
  uint64_t v6 = [v4 actionCandidateBoosts];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(CAARSchemaCAARTieBreaker *)self actionCandidateBoosts];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(CAARSchemaCAARTieBreaker *)self actionCandidateBoosts];
    v15 = [v4 actionCandidateBoosts];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unsigned int v19 = *((unsigned __int8 *)&self->_wasTieBreakerForcedSkipped + 1);
  unsigned int v20 = v4[26];
  if ((v19 & 1) == (v20 & 1))
  {
    if (v19)
    {
      int isTieBreakerSupported = self->_isTieBreakerSupported;
      if (isTieBreakerSupported != [v4 isTieBreakerSupported]) {
        goto LABEL_12;
      }
      unsigned int v19 = *((unsigned __int8 *)&self->_wasTieBreakerForcedSkipped + 1);
      unsigned int v20 = v4[26];
    }
    int v22 = (v19 >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (int wasTieBreakerForcedSkipped = self->_wasTieBreakerForcedSkipped,
            wasTieBreakerForcedSkipped == [v4 wasTieBreakerForcedSkipped]))
      {
        BOOL v17 = 1;
        goto LABEL_13;
      }
    }
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
  uint64_t v5 = [(CAARSchemaCAARTieBreaker *)self tieBreakerName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_actionCandidateBoosts;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *(&self->_wasTieBreakerForcedSkipped + 1);
  if (v11)
  {
    PBDataWriterWriteBOOLField();
    char v11 = *(&self->_wasTieBreakerForcedSkipped + 1);
  }
  if ((v11 & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARTieBreakerReadFrom(self, (uint64_t)a3);
}

- (void)deleteWasTieBreakerForcedSkipped
{
  *(&self->_wasTieBreakerForcedSkipped + 1) &= ~2u;
}

- (void)setHasWasTieBreakerForcedSkipped:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasTieBreakerForcedSkipped + 1) = *(&self->_wasTieBreakerForcedSkipped + 1) & 0xFD | v3;
}

- (BOOL)hasWasTieBreakerForcedSkipped
{
  return (*((unsigned __int8 *)&self->_wasTieBreakerForcedSkipped + 1) >> 1) & 1;
}

- (void)setWasTieBreakerForcedSkipped:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 1) |= 2u;
  self->_int wasTieBreakerForcedSkipped = a3;
}

- (void)deleteIsTieBreakerSupported
{
  *(&self->_wasTieBreakerForcedSkipped + 1) &= ~1u;
}

- (void)setHasIsTieBreakerSupported:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 1) = *(&self->_wasTieBreakerForcedSkipped + 1) & 0xFE | a3;
}

- (BOOL)hasIsTieBreakerSupported
{
  return *(&self->_wasTieBreakerForcedSkipped + 1);
}

- (void)setIsTieBreakerSupported:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 1) |= 1u;
  self->_int isTieBreakerSupported = a3;
}

- (id)actionCandidateBoostsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_actionCandidateBoosts objectAtIndexedSubscript:a3];
}

- (unint64_t)actionCandidateBoostsCount
{
  return [(NSArray *)self->_actionCandidateBoosts count];
}

- (void)addActionCandidateBoosts:(id)a3
{
  id v4 = a3;
  actionCandidateBoosts = self->_actionCandidateBoosts;
  id v8 = v4;
  if (!actionCandidateBoosts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_actionCandidateBoosts;
    self->_actionCandidateBoosts = v6;

    id v4 = v8;
    actionCandidateBoosts = self->_actionCandidateBoosts;
  }
  [(NSArray *)actionCandidateBoosts addObject:v4];
}

- (void)clearActionCandidateBoosts
{
}

- (void)deleteTieBreakerName
{
}

- (BOOL)hasTieBreakerName
{
  return self->_tieBreakerName != 0;
}

@end