@interface INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated
- (BOOL)hasCrrCommsAppSelectionJointId;
- (BOOL)hasInferenceCommsAppSelectionTrainingAppIndependentSignals;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals)inferenceCommsAppSelectionTrainingAppIndependentSignals;
- (NSArray)inferenceCommsAppSelectionTrainingAppDependentSignals;
- (NSData)jsonData;
- (SISchemaUUID)crrCommsAppSelectionJointId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)inferenceCommsAppSelectionTrainingAppDependentSignalsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)inferenceCommsAppSelectionTrainingAppDependentSignalsCount;
- (void)addInferenceCommsAppSelectionTrainingAppDependentSignals:(id)a3;
- (void)clearInferenceCommsAppSelectionTrainingAppDependentSignals;
- (void)deleteCrrCommsAppSelectionJointId;
- (void)deleteInferenceCommsAppSelectionTrainingAppIndependentSignals;
- (void)setCrrCommsAppSelectionJointId:(id)a3;
- (void)setHasCrrCommsAppSelectionJointId:(BOOL)a3;
- (void)setHasInferenceCommsAppSelectionTrainingAppIndependentSignals:(BOOL)a3;
- (void)setInferenceCommsAppSelectionTrainingAppDependentSignals:(id)a3;
- (void)setInferenceCommsAppSelectionTrainingAppIndependentSignals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppIndependentSignals];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self deleteInferenceCommsAppSelectionTrainingAppIndependentSignals];
  }
  v9 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppDependentSignals];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self setInferenceCommsAppSelectionTrainingAppDependentSignals:v10];

  v11 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self crrCommsAppSelectionJointId];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self deleteCrrCommsAppSelectionJointId];
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
  objc_storeStrong((id *)&self->_crrCommsAppSelectionJointId, 0);
  objc_storeStrong((id *)&self->_inferenceCommsAppSelectionTrainingAppDependentSignals, 0);
  objc_storeStrong((id *)&self->_inferenceCommsAppSelectionTrainingAppIndependentSignals, 0);
}

- (void)setHasCrrCommsAppSelectionJointId:(BOOL)a3
{
  self->_hasCrrCommsAppSelectionJointId = a3;
}

- (void)setHasInferenceCommsAppSelectionTrainingAppIndependentSignals:(BOOL)a3
{
  self->_hasInferenceCommsAppSelectionTrainingAppIndependentSignals = a3;
}

- (void)setCrrCommsAppSelectionJointId:(id)a3
{
}

- (SISchemaUUID)crrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId;
}

- (void)setInferenceCommsAppSelectionTrainingAppDependentSignals:(id)a3
{
}

- (NSArray)inferenceCommsAppSelectionTrainingAppDependentSignals
{
  return self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
}

- (void)setInferenceCommsAppSelectionTrainingAppIndependentSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals)inferenceCommsAppSelectionTrainingAppIndependentSignals
{
  return self->_inferenceCommsAppSelectionTrainingAppIndependentSignals;
}

- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"inferenceCommsAppSelectionTrainingAppIndependentSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)v5 setInferenceCommsAppSelectionTrainingAppIndependentSignals:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"inferenceCommsAppSelectionTrainingAppDependentSignals"];
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
              objc_super v15 = [[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals alloc] initWithDictionary:v14];
              [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)v5 addInferenceCommsAppSelectionTrainingAppDependentSignals:v15];
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
    v16 = [v4 objectForKeyedSubscript:@"crrCommsAppSelectionJointId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
      [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)v5 setCrrCommsAppSelectionJointId:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self dictionaryRepresentation];
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
  if (self->_crrCommsAppSelectionJointId)
  {
    id v4 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self crrCommsAppSelectionJointId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"crrCommsAppSelectionJointId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"crrCommsAppSelectionJointId"];
    }
  }
  if ([(NSArray *)self->_inferenceCommsAppSelectionTrainingAppDependentSignals count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v8 = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
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
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"inferenceCommsAppSelectionTrainingAppDependentSignals"];
  }
  if (self->_inferenceCommsAppSelectionTrainingAppIndependentSignals)
  {
    objc_super v15 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppIndependentSignals];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"inferenceCommsAppSelectionTrainingAppIndependentSignals"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"inferenceCommsAppSelectionTrainingAppIndependentSignals"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals *)self->_inferenceCommsAppSelectionTrainingAppIndependentSignals hash];
  uint64_t v4 = [(NSArray *)self->_inferenceCommsAppSelectionTrainingAppDependentSignals hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_crrCommsAppSelectionJointId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppIndependentSignals];
  v6 = [v4 inferenceCommsAppSelectionTrainingAppIndependentSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppIndependentSignals];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppIndependentSignals];
    uint64_t v10 = [v4 inferenceCommsAppSelectionTrainingAppIndependentSignals];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppDependentSignals];
  v6 = [v4 inferenceCommsAppSelectionTrainingAppDependentSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppDependentSignals];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppDependentSignals];
    objc_super v15 = [v4 inferenceCommsAppSelectionTrainingAppDependentSignals];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self crrCommsAppSelectionJointId];
  v6 = [v4 crrCommsAppSelectionJointId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self crrCommsAppSelectionJointId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self crrCommsAppSelectionJointId];
    long long v20 = [v4 crrCommsAppSelectionJointId];
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
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppIndependentSignals];

  if (v5)
  {
    v6 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self inferenceCommsAppSelectionTrainingAppIndependentSignals];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
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

  uint64_t v12 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self crrCommsAppSelectionJointId];

  if (v12)
  {
    uint64_t v13 = [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self crrCommsAppSelectionJointId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCrrCommsAppSelectionJointId
{
}

- (BOOL)hasCrrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId != 0;
}

- (id)inferenceCommsAppSelectionTrainingAppDependentSignalsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_inferenceCommsAppSelectionTrainingAppDependentSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)inferenceCommsAppSelectionTrainingAppDependentSignalsCount
{
  return [(NSArray *)self->_inferenceCommsAppSelectionTrainingAppDependentSignals count];
}

- (void)addInferenceCommsAppSelectionTrainingAppDependentSignals:(id)a3
{
  id v4 = a3;
  inferenceCommsAppSelectionTrainingAppDependentSignals = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
  id v8 = v4;
  if (!inferenceCommsAppSelectionTrainingAppDependentSignals)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
    self->_inferenceCommsAppSelectionTrainingAppDependentSignals = v6;

    id v4 = v8;
    inferenceCommsAppSelectionTrainingAppDependentSignals = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
  }
  [(NSArray *)inferenceCommsAppSelectionTrainingAppDependentSignals addObject:v4];
}

- (void)clearInferenceCommsAppSelectionTrainingAppDependentSignals
{
}

- (void)deleteInferenceCommsAppSelectionTrainingAppIndependentSignals
{
}

- (BOOL)hasInferenceCommsAppSelectionTrainingAppIndependentSignals
{
  return self->_inferenceCommsAppSelectionTrainingAppIndependentSignals != 0;
}

@end