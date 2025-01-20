@interface CLPInstSchemaCLPCDMReplayTaskStarted
- (BOOL)hasPluginTaskAsset;
- (BOOL)hasReplayType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPCDMReplayTaskStarted)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPCDMReplayTaskStarted)initWithJSON:(id)a3;
- (NSArray)availableSiriAssets;
- (NSArray)habitualUsages;
- (NSData)jsonData;
- (SISchemaAsset)pluginTaskAsset;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)availableSiriAssetsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)habitualUsageAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)replayType;
- (unint64_t)availableSiriAssetsCount;
- (unint64_t)habitualUsageCount;
- (unint64_t)hash;
- (void)addAvailableSiriAssets:(id)a3;
- (void)addHabitualUsage:(id)a3;
- (void)clearAvailableSiriAssets;
- (void)clearHabitualUsage;
- (void)deletePluginTaskAsset;
- (void)deleteReplayType;
- (void)setAvailableSiriAssets:(id)a3;
- (void)setHabitualUsages:(id)a3;
- (void)setHasPluginTaskAsset:(BOOL)a3;
- (void)setHasReplayType:(BOOL)a3;
- (void)setPluginTaskAsset:(id)a3;
- (void)setReplayType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPCDMReplayTaskStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLPInstSchemaCLPCDMReplayTaskStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v14 applySensitiveConditionsPolicy:v4];
  v6 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self pluginTaskAsset];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CLPInstSchemaCLPCDMReplayTaskStarted *)self deletePluginTaskAsset];
  }
  v9 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self availableSiriAssets];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(CLPInstSchemaCLPCDMReplayTaskStarted *)self setAvailableSiriAssets:v10];

  v11 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self habitualUsages];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(CLPInstSchemaCLPCDMReplayTaskStarted *)self setHabitualUsages:v12];

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
  objc_storeStrong((id *)&self->_habitualUsages, 0);
  objc_storeStrong((id *)&self->_availableSiriAssets, 0);
  objc_storeStrong((id *)&self->_pluginTaskAsset, 0);
}

- (void)setHasPluginTaskAsset:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHabitualUsages:(id)a3
{
}

- (NSArray)habitualUsages
{
  return self->_habitualUsages;
}

- (int)replayType
{
  return self->_replayType;
}

- (void)setAvailableSiriAssets:(id)a3
{
}

- (NSArray)availableSiriAssets
{
  return self->_availableSiriAssets;
}

- (void)setPluginTaskAsset:(id)a3
{
}

- (SISchemaAsset)pluginTaskAsset
{
  return self->_pluginTaskAsset;
}

- (CLPInstSchemaCLPCDMReplayTaskStarted)initWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CLPInstSchemaCLPCDMReplayTaskStarted;
  v5 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pluginTaskAsset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaAsset alloc] initWithDictionary:v6];
      [(CLPInstSchemaCLPCDMReplayTaskStarted *)v5 setPluginTaskAsset:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"availableSiriAssets"];
    objc_opt_class();
    v28 = v8;
    v29 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[SISchemaAsset alloc] initWithDictionary:v14];
              [(CLPInstSchemaCLPCDMReplayTaskStarted *)v5 addAvailableSiriAssets:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v11);
      }

      int v8 = v28;
    }
    v16 = [v4 objectForKeyedSubscript:@"replayType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCDMReplayTaskStarted setReplayType:](v5, "setReplayType:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"habitualUsage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v4;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[CLPInstSchemaHabitualUsageByCalendarWeekInformation alloc] initWithDictionary:v23];
              [(CLPInstSchemaCLPCDMReplayTaskStarted *)v5 addHabitualUsage:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v20);
      }

      id v4 = v27;
      int v8 = v28;
      v6 = v29;
    }
    v25 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPCDMReplayTaskStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self dictionaryRepresentation];
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_availableSiriAssets count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v5 = self->_availableSiriAssets;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"availableSiriAssets"];
  }
  if ([(NSArray *)self->_habitualUsages count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v13 = self->_habitualUsages;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (void)v26);
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"habitualUsage"];
  }
  if (self->_pluginTaskAsset)
  {
    uint64_t v20 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self pluginTaskAsset];
    uint64_t v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"pluginTaskAsset"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"pluginTaskAsset"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v23 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self replayType] - 1;
    if (v23 > 2) {
      v24 = @"CLPREPLAYTYPE_UNKNOWN";
    }
    else {
      v24 = off_1E5EAD108[v23];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, @"replayType", (void)v26);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaAsset *)self->_pluginTaskAsset hash];
  uint64_t v4 = [(NSArray *)self->_availableSiriAssets hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_replayType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_habitualUsages hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self pluginTaskAsset];
  uint64_t v6 = [v4 pluginTaskAsset];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self pluginTaskAsset];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self pluginTaskAsset];
    uint64_t v10 = [v4 pluginTaskAsset];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self availableSiriAssets];
  uint64_t v6 = [v4 availableSiriAssets];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self availableSiriAssets];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self availableSiriAssets];
    uint64_t v15 = [v4 availableSiriAssets];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int replayType = self->_replayType;
    if (replayType != [v4 replayType]) {
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self habitualUsages];
  uint64_t v6 = [v4 habitualUsages];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self habitualUsages];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self habitualUsages];
    uint64_t v21 = [v4 habitualUsages];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self pluginTaskAsset];

  if (v5)
  {
    uint64_t v6 = [(CLPInstSchemaCLPCDMReplayTaskStarted *)self pluginTaskAsset];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_availableSiriAssets;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_habitualUsages;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCDMReplayTaskStartedReadFrom(self, (uint64_t)a3);
}

- (id)habitualUsageAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_habitualUsages objectAtIndexedSubscript:a3];
}

- (unint64_t)habitualUsageCount
{
  return [(NSArray *)self->_habitualUsages count];
}

- (void)addHabitualUsage:(id)a3
{
  id v4 = a3;
  habitualUsages = self->_habitualUsages;
  id v8 = v4;
  if (!habitualUsages)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_habitualUsages;
    self->_habitualUsages = v6;

    id v4 = v8;
    habitualUsages = self->_habitualUsages;
  }
  [(NSArray *)habitualUsages addObject:v4];
}

- (void)clearHabitualUsage
{
}

- (void)deleteReplayType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReplayType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReplayType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReplayType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int replayType = a3;
}

- (id)availableSiriAssetsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_availableSiriAssets objectAtIndexedSubscript:a3];
}

- (unint64_t)availableSiriAssetsCount
{
  return [(NSArray *)self->_availableSiriAssets count];
}

- (void)addAvailableSiriAssets:(id)a3
{
  id v4 = a3;
  availableSiriAssets = self->_availableSiriAssets;
  id v8 = v4;
  if (!availableSiriAssets)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_availableSiriAssets;
    self->_availableSiriAssets = v6;

    id v4 = v8;
    availableSiriAssets = self->_availableSiriAssets;
  }
  [(NSArray *)availableSiriAssets addObject:v4];
}

- (void)clearAvailableSiriAssets
{
}

- (void)deletePluginTaskAsset
{
}

- (BOOL)hasPluginTaskAsset
{
  return self->_pluginTaskAsset != 0;
}

@end