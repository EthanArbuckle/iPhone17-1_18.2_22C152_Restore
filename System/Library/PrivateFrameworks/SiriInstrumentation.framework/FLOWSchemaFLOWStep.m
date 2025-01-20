@interface FLOWSchemaFLOWStep
- (BOOL)hasAppContext;
- (BOOL)hasFlowState;
- (BOOL)hasPlatformRelatedContext;
- (BOOL)hasSequenceNum;
- (BOOL)hasTimestampMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWAppContext)appContext;
- (FLOWSchemaFLOWPlatformContext)platformRelatedContext;
- (FLOWSchemaFLOWState)flowState;
- (FLOWSchemaFLOWStep)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWStep)initWithJSON:(id)a3;
- (NSArray)domainContexts;
- (NSArray)platformContexts;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)domainContextAtIndex:(unint64_t)a3;
- (id)platformContextAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int64_t)timestampMs;
- (unint64_t)domainContextCount;
- (unint64_t)hash;
- (unint64_t)platformContextCount;
- (unsigned)sequenceNum;
- (void)addDomainContext:(id)a3;
- (void)addPlatformContext:(id)a3;
- (void)clearDomainContext;
- (void)clearPlatformContext;
- (void)deleteAppContext;
- (void)deleteFlowState;
- (void)deletePlatformRelatedContext;
- (void)deleteSequenceNum;
- (void)deleteTimestampMs;
- (void)setAppContext:(id)a3;
- (void)setDomainContexts:(id)a3;
- (void)setFlowState:(id)a3;
- (void)setHasAppContext:(BOOL)a3;
- (void)setHasFlowState:(BOOL)a3;
- (void)setHasPlatformRelatedContext:(BOOL)a3;
- (void)setHasSequenceNum:(BOOL)a3;
- (void)setHasTimestampMs:(BOOL)a3;
- (void)setPlatformContexts:(id)a3;
- (void)setPlatformRelatedContext:(id)a3;
- (void)setSequenceNum:(unsigned int)a3;
- (void)setTimestampMs:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWStep

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FLOWSchemaFLOWStep;
  v5 = [(SISchemaInstrumentationMessage *)&v20 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWStep *)self flowState];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWStep *)self deleteFlowState];
  }
  v9 = [(FLOWSchemaFLOWStep *)self appContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWStep *)self deleteAppContext];
  }
  v12 = [(FLOWSchemaFLOWStep *)self domainContexts];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(FLOWSchemaFLOWStep *)self setDomainContexts:v13];

  v14 = [(FLOWSchemaFLOWStep *)self platformContexts];
  v15 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v14 underConditions:v4];
  [(FLOWSchemaFLOWStep *)self setPlatformContexts:v15];

  v16 = [(FLOWSchemaFLOWStep *)self platformRelatedContext];
  v17 = [v16 applySensitiveConditionsPolicy:v4];
  int v18 = [v17 suppressMessage];

  if (v18) {
    [(FLOWSchemaFLOWStep *)self deletePlatformRelatedContext];
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
  objc_storeStrong((id *)&self->_platformRelatedContext, 0);
  objc_storeStrong((id *)&self->_platformContexts, 0);
  objc_storeStrong((id *)&self->_domainContexts, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_flowState, 0);
}

- (void)setHasPlatformRelatedContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAppContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasFlowState:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPlatformRelatedContext:(id)a3
{
}

- (FLOWSchemaFLOWPlatformContext)platformRelatedContext
{
  return self->_platformRelatedContext;
}

- (void)setPlatformContexts:(id)a3
{
}

- (NSArray)platformContexts
{
  return self->_platformContexts;
}

- (void)setDomainContexts:(id)a3
{
}

- (NSArray)domainContexts
{
  return self->_domainContexts;
}

- (void)setAppContext:(id)a3
{
}

- (FLOWSchemaFLOWAppContext)appContext
{
  return self->_appContext;
}

- (void)setFlowState:(id)a3
{
}

- (FLOWSchemaFLOWState)flowState
{
  return self->_flowState;
}

- (int64_t)timestampMs
{
  return self->_timestampMs;
}

- (unsigned)sequenceNum
{
  return self->_sequenceNum;
}

- (FLOWSchemaFLOWStep)initWithDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FLOWSchemaFLOWStep;
  v5 = [(FLOWSchemaFLOWStep *)&v44 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sequenceNum"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWStep setSequenceNum:](v5, "setSequenceNum:", [v6 unsignedIntValue]);
    }
    v35 = v6;
    v7 = [v4 objectForKeyedSubscript:@"timestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWStep setTimestampMs:](v5, "setTimestampMs:", [v7 longLongValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"flowState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLOWSchemaFLOWState alloc] initWithDictionary:v8];
      [(FLOWSchemaFLOWStep *)v5 setFlowState:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"appContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[FLOWSchemaFLOWAppContext alloc] initWithDictionary:v10];
      [(FLOWSchemaFLOWStep *)v5 setAppContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"domainContext"];
    objc_opt_class();
    v33 = v10;
    v34 = v8;
    v32 = v12;
    if (objc_opt_isKindOfClass())
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[FLOWSchemaFLOWDomainContext alloc] initWithDictionary:v18];
              [(FLOWSchemaFLOWStep *)v5 addDomainContext:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v15);
      }

      v10 = v33;
      v12 = v32;
    }
    objc_super v20 = [v4 objectForKeyedSubscript:@"platformContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v27 = [[FLOWSchemaFLOWPlatformContext alloc] initWithDictionary:v26];
              [(FLOWSchemaFLOWStep *)v5 addPlatformContext:v27];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v23);
      }

      v10 = v33;
      int v8 = v34;
      v12 = v32;
    }
    v28 = [v4 objectForKeyedSubscript:@"platformRelatedContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[FLOWSchemaFLOWPlatformContext alloc] initWithDictionary:v28];
      [(FLOWSchemaFLOWStep *)v5 setPlatformRelatedContext:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWStep)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWStep *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWStep *)self dictionaryRepresentation];
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
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_appContext)
  {
    id v4 = [(FLOWSchemaFLOWStep *)self appContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appContext"];
    }
  }
  if ([(NSArray *)self->_domainContexts count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    int v8 = self->_domainContexts;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"domainContext"];
  }
  if (self->_flowState)
  {
    uint64_t v15 = [(FLOWSchemaFLOWStep *)self flowState];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"flowState"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"flowState"];
    }
  }
  if ([(NSArray *)self->_platformContexts count])
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v19 = self->_platformContexts;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "dictionaryRepresentation", (void)v33);
          if (v24)
          {
            [v18 addObject:v24];
          }
          else
          {
            v25 = [MEMORY[0x1E4F1CA98] null];
            [v18 addObject:v25];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"platformContext"];
  }
  if (self->_platformRelatedContext)
  {
    uint64_t v26 = [(FLOWSchemaFLOWStep *)self platformRelatedContext];
    v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"platformRelatedContext"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"platformRelatedContext"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWStep sequenceNum](self, "sequenceNum"));
    [v3 setObject:v30 forKeyedSubscript:@"sequenceNum"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v31 = objc_msgSend(NSNumber, "numberWithLongLong:", -[FLOWSchemaFLOWStep timestampMs](self, "timestampMs"));
    [v3 setObject:v31 forKeyedSubscript:@"timestampMs"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v33);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_sequenceNum;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_timestampMs;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(FLOWSchemaFLOWState *)self->_flowState hash];
  unint64_t v6 = [(FLOWSchemaFLOWAppContext *)self->_appContext hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSArray *)self->_domainContexts hash];
  uint64_t v8 = [(NSArray *)self->_platformContexts hash];
  return v7 ^ v8 ^ [(FLOWSchemaFLOWPlatformContext *)self->_platformRelatedContext hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  $FC72F3F70C0590DEDAD7EF58DA3B6E45 has = self->_has;
  unsigned int v6 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int sequenceNum = self->_sequenceNum;
    if (sequenceNum != [v4 sequenceNum]) {
      goto LABEL_34;
    }
    $FC72F3F70C0590DEDAD7EF58DA3B6E45 has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v8)
  {
    int64_t timestampMs = self->_timestampMs;
    if (timestampMs != [v4 timestampMs]) {
      goto LABEL_34;
    }
  }
  uint64_t v10 = [(FLOWSchemaFLOWStep *)self flowState];
  uint64_t v11 = [v4 flowState];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_33;
  }
  uint64_t v12 = [(FLOWSchemaFLOWStep *)self flowState];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(FLOWSchemaFLOWStep *)self flowState];
    uint64_t v15 = [v4 flowState];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v10 = [(FLOWSchemaFLOWStep *)self appContext];
  uint64_t v11 = [v4 appContext];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_33;
  }
  uint64_t v17 = [(FLOWSchemaFLOWStep *)self appContext];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(FLOWSchemaFLOWStep *)self appContext];
    uint64_t v20 = [v4 appContext];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v10 = [(FLOWSchemaFLOWStep *)self domainContexts];
  uint64_t v11 = [v4 domainContexts];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_33;
  }
  uint64_t v22 = [(FLOWSchemaFLOWStep *)self domainContexts];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(FLOWSchemaFLOWStep *)self domainContexts];
    v25 = [v4 domainContexts];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v10 = [(FLOWSchemaFLOWStep *)self platformContexts];
  uint64_t v11 = [v4 platformContexts];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_33;
  }
  uint64_t v27 = [(FLOWSchemaFLOWStep *)self platformContexts];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(FLOWSchemaFLOWStep *)self platformContexts];
    v30 = [v4 platformContexts];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v10 = [(FLOWSchemaFLOWStep *)self platformRelatedContext];
  uint64_t v11 = [v4 platformRelatedContext];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v32 = [(FLOWSchemaFLOWStep *)self platformRelatedContext];
    if (!v32)
    {

LABEL_37:
      BOOL v37 = 1;
      goto LABEL_35;
    }
    long long v33 = (void *)v32;
    long long v34 = [(FLOWSchemaFLOWStep *)self platformRelatedContext];
    long long v35 = [v4 platformRelatedContext];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_37;
    }
  }
  else
  {
LABEL_33:
  }
LABEL_34:
  BOOL v37 = 0;
LABEL_35:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  unsigned int v6 = [(FLOWSchemaFLOWStep *)self flowState];

  if (v6)
  {
    uint64_t v7 = [(FLOWSchemaFLOWStep *)self flowState];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(FLOWSchemaFLOWStep *)self appContext];

  if (v8)
  {
    uint64_t v9 = [(FLOWSchemaFLOWStep *)self appContext];
    PBDataWriterWriteSubmessage();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = self->_domainContexts;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = self->_platformContexts;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  uint64_t v20 = [(FLOWSchemaFLOWStep *)self platformRelatedContext];

  if (v20)
  {
    int v21 = [(FLOWSchemaFLOWStep *)self platformRelatedContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWStepReadFrom(self, (uint64_t)a3);
}

- (void)deletePlatformRelatedContext
{
}

- (BOOL)hasPlatformRelatedContext
{
  return self->_platformRelatedContext != 0;
}

- (id)platformContextAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_platformContexts objectAtIndexedSubscript:a3];
}

- (unint64_t)platformContextCount
{
  return [(NSArray *)self->_platformContexts count];
}

- (void)addPlatformContext:(id)a3
{
  id v4 = a3;
  platformContexts = self->_platformContexts;
  id v8 = v4;
  if (!platformContexts)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_platformContexts;
    self->_platformContexts = v6;

    id v4 = v8;
    platformContexts = self->_platformContexts;
  }
  [(NSArray *)platformContexts addObject:v4];
}

- (void)clearPlatformContext
{
}

- (id)domainContextAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_domainContexts objectAtIndexedSubscript:a3];
}

- (unint64_t)domainContextCount
{
  return [(NSArray *)self->_domainContexts count];
}

- (void)addDomainContext:(id)a3
{
  id v4 = a3;
  domainContexts = self->_domainContexts;
  id v8 = v4;
  if (!domainContexts)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_domainContexts;
    self->_domainContexts = v6;

    id v4 = v8;
    domainContexts = self->_domainContexts;
  }
  [(NSArray *)domainContexts addObject:v4];
}

- (void)clearDomainContext
{
}

- (void)deleteAppContext
{
}

- (BOOL)hasAppContext
{
  return self->_appContext != 0;
}

- (void)deleteFlowState
{
}

- (BOOL)hasFlowState
{
  return self->_flowState != 0;
}

- (void)deleteTimestampMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestampMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimestampMs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t timestampMs = a3;
}

- (void)deleteSequenceNum
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSequenceNum:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNum
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSequenceNum:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int sequenceNum = a3;
}

@end