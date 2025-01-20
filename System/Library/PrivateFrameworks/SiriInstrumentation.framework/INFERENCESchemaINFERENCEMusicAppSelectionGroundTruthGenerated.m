@interface INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated
- (BOOL)hasInferenceMusicTrainingIndependentSignals;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)inferenceMusicTrainingIndependentSignals;
- (NSArray)inferenceMusicTrainingDependentSignals;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)inferenceMusicTrainingDependentSignalsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)inferenceMusicTrainingDependentSignalsCount;
- (void)addInferenceMusicTrainingDependentSignals:(id)a3;
- (void)clearInferenceMusicTrainingDependentSignals;
- (void)deleteInferenceMusicTrainingIndependentSignals;
- (void)setHasInferenceMusicTrainingIndependentSignals:(BOOL)a3;
- (void)setInferenceMusicTrainingDependentSignals:(id)a3;
- (void)setInferenceMusicTrainingIndependentSignals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingIndependentSignals];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self deleteInferenceMusicTrainingIndependentSignals];
  }
  v9 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingDependentSignals];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self setInferenceMusicTrainingDependentSignals:v10];

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
  objc_storeStrong((id *)&self->_inferenceMusicTrainingDependentSignals, 0);
  objc_storeStrong((id *)&self->_inferenceMusicTrainingIndependentSignals, 0);
}

- (void)setHasInferenceMusicTrainingIndependentSignals:(BOOL)a3
{
  self->_hasInferenceMusicTrainingIndependentSignals = a3;
}

- (void)setInferenceMusicTrainingDependentSignals:(id)a3
{
}

- (NSArray)inferenceMusicTrainingDependentSignals
{
  return self->_inferenceMusicTrainingDependentSignals;
}

- (void)setInferenceMusicTrainingIndependentSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)inferenceMusicTrainingIndependentSignals
{
  return self->_inferenceMusicTrainingIndependentSignals;
}

- (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated;
  v5 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"inferenceMusicTrainingIndependentSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)v5 setInferenceMusicTrainingIndependentSignals:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"inferenceMusicTrainingDependentSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[INFERENCESchemaINFERENCEMusicTrainingDependentSignals alloc] initWithDictionary:v14];
              [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)v5 addInferenceMusicTrainingDependentSignals:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_inferenceMusicTrainingDependentSignals count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_inferenceMusicTrainingDependentSignals;
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

    [v3 setObject:v4 forKeyedSubscript:@"inferenceMusicTrainingDependentSignals"];
  }
  if (self->_inferenceMusicTrainingIndependentSignals)
  {
    uint64_t v12 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingIndependentSignals];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"inferenceMusicTrainingIndependentSignals"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"inferenceMusicTrainingIndependentSignals"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *)self->_inferenceMusicTrainingIndependentSignals hash];
  return [(NSArray *)self->_inferenceMusicTrainingDependentSignals hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingIndependentSignals];
  uint64_t v6 = [v4 inferenceMusicTrainingIndependentSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingIndependentSignals];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingIndependentSignals];
    uint64_t v10 = [v4 inferenceMusicTrainingIndependentSignals];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingDependentSignals];
  uint64_t v6 = [v4 inferenceMusicTrainingDependentSignals];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingDependentSignals];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingDependentSignals];
    v15 = [v4 inferenceMusicTrainingDependentSignals];
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
  v5 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingIndependentSignals];

  if (v5)
  {
    uint64_t v6 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self inferenceMusicTrainingIndependentSignals];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_inferenceMusicTrainingDependentSignals;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGeneratedReadFrom(self, (uint64_t)a3);
}

- (id)inferenceMusicTrainingDependentSignalsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_inferenceMusicTrainingDependentSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)inferenceMusicTrainingDependentSignalsCount
{
  return [(NSArray *)self->_inferenceMusicTrainingDependentSignals count];
}

- (void)addInferenceMusicTrainingDependentSignals:(id)a3
{
  id v4 = a3;
  inferenceMusicTrainingDependentSignals = self->_inferenceMusicTrainingDependentSignals;
  id v8 = v4;
  if (!inferenceMusicTrainingDependentSignals)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_inferenceMusicTrainingDependentSignals;
    self->_inferenceMusicTrainingDependentSignals = v6;

    id v4 = v8;
    inferenceMusicTrainingDependentSignals = self->_inferenceMusicTrainingDependentSignals;
  }
  [(NSArray *)inferenceMusicTrainingDependentSignals addObject:v4];
}

- (void)clearInferenceMusicTrainingDependentSignals
{
}

- (void)deleteInferenceMusicTrainingIndependentSignals
{
}

- (BOOL)hasInferenceMusicTrainingIndependentSignals
{
  return self->_inferenceMusicTrainingIndependentSignals != 0;
}

@end