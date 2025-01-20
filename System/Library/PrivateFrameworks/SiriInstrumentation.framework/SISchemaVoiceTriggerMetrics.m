@interface SISchemaVoiceTriggerMetrics
- (BOOL)hasExplicitUtterances;
- (BOOL)hasFirstPassMetadata;
- (BOOL)hasFirstPassTriggers;
- (BOOL)hasImplicitUtterances;
- (BOOL)hasIsJSEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJSEnabled;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)firstPassMetadata;
- (NSArray)firstPassStatistics;
- (NSData)jsonData;
- (SISchemaVoiceTriggerMetrics)initWithDictionary:(id)a3;
- (SISchemaVoiceTriggerMetrics)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)firstPassStatisticsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)explicitUtterances;
- (int)firstPassTriggers;
- (int)implicitUtterances;
- (unint64_t)firstPassStatisticsCount;
- (unint64_t)hash;
- (void)addFirstPassStatistics:(id)a3;
- (void)clearFirstPassStatistics;
- (void)deleteExplicitUtterances;
- (void)deleteFirstPassMetadata;
- (void)deleteFirstPassTriggers;
- (void)deleteImplicitUtterances;
- (void)deleteIsJSEnabled;
- (void)setExplicitUtterances:(int)a3;
- (void)setFirstPassMetadata:(id)a3;
- (void)setFirstPassStatistics:(id)a3;
- (void)setFirstPassTriggers:(int)a3;
- (void)setHasExplicitUtterances:(BOOL)a3;
- (void)setHasFirstPassMetadata:(BOOL)a3;
- (void)setHasFirstPassTriggers:(BOOL)a3;
- (void)setHasImplicitUtterances:(BOOL)a3;
- (void)setHasIsJSEnabled:(BOOL)a3;
- (void)setImplicitUtterances:(int)a3;
- (void)setIsJSEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaVoiceTriggerMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SISchemaVoiceTriggerMetrics;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaVoiceTriggerMetrics *)self firstPassStatistics];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(SISchemaVoiceTriggerMetrics *)self setFirstPassStatistics:v7];

  v8 = [(SISchemaVoiceTriggerMetrics *)self firstPassMetadata];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(SISchemaVoiceTriggerMetrics *)self deleteFirstPassMetadata];
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
  objc_storeStrong((id *)&self->_firstPassMetadata, 0);
  objc_storeStrong((id *)&self->_firstPassStatistics, 0);
}

- (void)setHasFirstPassMetadata:(BOOL)a3
{
  *(&self->_isJSEnabled + 2) = a3;
}

- (BOOL)isJSEnabled
{
  return self->_isJSEnabled;
}

- (void)setFirstPassMetadata:(id)a3
{
}

- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)firstPassMetadata
{
  return self->_firstPassMetadata;
}

- (void)setFirstPassStatistics:(id)a3
{
}

- (NSArray)firstPassStatistics
{
  return self->_firstPassStatistics;
}

- (int)firstPassTriggers
{
  return self->_firstPassTriggers;
}

- (int)explicitUtterances
{
  return self->_explicitUtterances;
}

- (int)implicitUtterances
{
  return self->_implicitUtterances;
}

- (SISchemaVoiceTriggerMetrics)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SISchemaVoiceTriggerMetrics;
  v5 = [(SISchemaVoiceTriggerMetrics *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"implicitUtterances"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVoiceTriggerMetrics setImplicitUtterances:](v5, "setImplicitUtterances:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"explicitUtterances"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVoiceTriggerMetrics setExplicitUtterances:](v5, "setExplicitUtterances:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"firstPassTriggers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVoiceTriggerMetrics setFirstPassTriggers:](v5, "setFirstPassTriggers:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"firstPassStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v8;
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[MHSchemaMHVoiceTriggerFirstPassStatistic alloc] initWithDictionary:v15];
              [(SISchemaVoiceTriggerMetrics *)v5 addFirstPassStatistics:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v12);
      }

      v6 = v23;
      v8 = v22;
    }
    v17 = [v4 objectForKeyedSubscript:@"firstPassMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[MHSchemaMHVoiceTriggerFirstPassDailyMetadata alloc] initWithDictionary:v17];
      [(SISchemaVoiceTriggerMetrics *)v5 setFirstPassMetadata:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"isJSEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVoiceTriggerMetrics setIsJSEnabled:](v5, "setIsJSEnabled:", [v19 BOOLValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (SISchemaVoiceTriggerMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaVoiceTriggerMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaVoiceTriggerMetrics *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(&self->_isJSEnabled + 1) & 2) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaVoiceTriggerMetrics explicitUtterances](self, "explicitUtterances"));
    [v3 setObject:v4 forKeyedSubscript:@"explicitUtterances"];
  }
  if (self->_firstPassMetadata)
  {
    v5 = [(SISchemaVoiceTriggerMetrics *)self firstPassMetadata];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"firstPassMetadata"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"firstPassMetadata"];
    }
  }
  if ([(NSArray *)self->_firstPassStatistics count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v9 = self->_firstPassStatistics;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"firstPassStatistics"];
  }
  char v16 = *(&self->_isJSEnabled + 1);
  if ((v16 & 4) != 0)
  {
    v19 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaVoiceTriggerMetrics firstPassTriggers](self, "firstPassTriggers"));
    [v3 setObject:v19 forKeyedSubscript:@"firstPassTriggers"];

    char v16 = *(&self->_isJSEnabled + 1);
    if ((v16 & 1) == 0)
    {
LABEL_22:
      if ((v16 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if (!*(&self->_isJSEnabled + 1))
  {
    goto LABEL_22;
  }
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaVoiceTriggerMetrics implicitUtterances](self, "implicitUtterances"));
  [v3 setObject:v20 forKeyedSubscript:@"implicitUtterances"];

  if ((*(&self->_isJSEnabled + 1) & 8) != 0)
  {
LABEL_23:
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaVoiceTriggerMetrics isJSEnabled](self, "isJSEnabled"));
    [v3 setObject:v17 forKeyedSubscript:@"isJSEnabled"];
  }
LABEL_24:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_isJSEnabled + 1))
  {
    uint64_t v3 = 0;
    if ((*(&self->_isJSEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(&self->_isJSEnabled + 1) & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_implicitUtterances;
  if ((*(&self->_isJSEnabled + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_explicitUtterances;
  if ((*(&self->_isJSEnabled + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_firstPassTriggers;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  uint64_t v6 = [(NSArray *)self->_firstPassStatistics hash];
  unint64_t v7 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self->_firstPassMetadata hash];
  if ((*(&self->_isJSEnabled + 1) & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_isJSEnabled;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isJSEnabled + 1);
  unsigned int v6 = v4[41];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_23;
  }
  if (v5)
  {
    int implicitUtterances = self->_implicitUtterances;
    if (implicitUtterances != [v4 implicitUtterances]) {
      goto LABEL_23;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isJSEnabled + 1);
    unsigned int v6 = v4[41];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int explicitUtterances = self->_explicitUtterances;
      if (explicitUtterances != [v4 explicitUtterances]) {
        goto LABEL_23;
      }
      unsigned int v5 = *((unsigned __int8 *)&self->_isJSEnabled + 1);
      unsigned int v6 = v4[41];
    }
    int v10 = (v5 >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_23;
    }
    if (v10)
    {
      int firstPassTriggers = self->_firstPassTriggers;
      if (firstPassTriggers != [v4 firstPassTriggers]) {
        goto LABEL_23;
      }
    }
    uint64_t v12 = [(SISchemaVoiceTriggerMetrics *)self firstPassStatistics];
    uint64_t v13 = [v4 firstPassStatistics];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_22;
    }
    uint64_t v14 = [(SISchemaVoiceTriggerMetrics *)self firstPassStatistics];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      char v16 = [(SISchemaVoiceTriggerMetrics *)self firstPassStatistics];
      v17 = [v4 firstPassStatistics];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v12 = [(SISchemaVoiceTriggerMetrics *)self firstPassMetadata];
    uint64_t v13 = [v4 firstPassMetadata];
    if ((v12 == 0) == (v13 != 0))
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v19 = [(SISchemaVoiceTriggerMetrics *)self firstPassMetadata];
    if (v19)
    {
      v20 = (void *)v19;
      long long v21 = [(SISchemaVoiceTriggerMetrics *)self firstPassMetadata];
      long long v22 = [v4 firstPassMetadata];
      int v23 = [v21 isEqual:v22];

      if (!v23) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    int v26 = (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 3) & 1;
    if (v26 == ((v4[41] >> 3) & 1))
    {
      if (!v26 || (int isJSEnabled = self->_isJSEnabled, isJSEnabled == [v4 isJSEnabled]))
      {
        BOOL v24 = 1;
        goto LABEL_24;
      }
    }
  }
LABEL_23:
  BOOL v24 = 0;
LABEL_24:

  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = *(&self->_isJSEnabled + 1);
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    char v5 = *(&self->_isJSEnabled + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isJSEnabled + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(&self->_isJSEnabled + 1) & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v6 = self->_firstPassStatistics;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(SISchemaVoiceTriggerMetrics *)self firstPassMetadata];

  if (v11)
  {
    uint64_t v12 = [(SISchemaVoiceTriggerMetrics *)self firstPassMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ((*(&self->_isJSEnabled + 1) & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaVoiceTriggerMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsJSEnabled
{
  *(&self->_isJSEnabled + 1) &= ~8u;
}

- (void)setHasIsJSEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xF7 | v3;
}

- (BOOL)hasIsJSEnabled
{
  return (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 3) & 1;
}

- (void)setIsJSEnabled:(BOOL)a3
{
  *(&self->_isJSEnabled + 1) |= 8u;
  self->_int isJSEnabled = a3;
}

- (void)deleteFirstPassMetadata
{
}

- (BOOL)hasFirstPassMetadata
{
  return self->_firstPassMetadata != 0;
}

- (id)firstPassStatisticsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_firstPassStatistics objectAtIndexedSubscript:a3];
}

- (unint64_t)firstPassStatisticsCount
{
  return [(NSArray *)self->_firstPassStatistics count];
}

- (void)addFirstPassStatistics:(id)a3
{
  id v4 = a3;
  firstPassStatistics = self->_firstPassStatistics;
  id v8 = v4;
  if (!firstPassStatistics)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_firstPassStatistics;
    self->_firstPassStatistics = v6;

    id v4 = v8;
    firstPassStatistics = self->_firstPassStatistics;
  }
  [(NSArray *)firstPassStatistics addObject:v4];
}

- (void)clearFirstPassStatistics
{
}

- (void)deleteFirstPassTriggers
{
  *(&self->_isJSEnabled + 1) &= ~4u;
}

- (void)setHasFirstPassTriggers:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xFB | v3;
}

- (BOOL)hasFirstPassTriggers
{
  return (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 2) & 1;
}

- (void)setFirstPassTriggers:(int)a3
{
  *(&self->_isJSEnabled + 1) |= 4u;
  self->_int firstPassTriggers = a3;
}

- (void)deleteExplicitUtterances
{
  *(&self->_isJSEnabled + 1) &= ~2u;
}

- (void)setHasExplicitUtterances:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasExplicitUtterances
{
  return (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 1) & 1;
}

- (void)setExplicitUtterances:(int)a3
{
  *(&self->_isJSEnabled + 1) |= 2u;
  self->_int explicitUtterances = a3;
}

- (void)deleteImplicitUtterances
{
  *(&self->_isJSEnabled + 1) &= ~1u;
}

- (void)setHasImplicitUtterances:(BOOL)a3
{
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasImplicitUtterances
{
  return *(&self->_isJSEnabled + 1);
}

- (void)setImplicitUtterances:(int)a3
{
  *(&self->_isJSEnabled + 1) |= 1u;
  self->_int implicitUtterances = a3;
}

@end