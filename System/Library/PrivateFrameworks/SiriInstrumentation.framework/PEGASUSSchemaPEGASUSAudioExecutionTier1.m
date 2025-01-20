@interface PEGASUSSchemaPEGASUSAudioExecutionTier1
- (BOOL)hasAudioLaunchId;
- (BOOL)hasAudioQueueStateInfoTier1;
- (BOOL)hasAudioType;
- (BOOL)hasAudioUnderstandingTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)audioInternalSignals;
- (NSData)jsonData;
- (NSString)audioLaunchId;
- (NSString)audioType;
- (PEGASUSSchemaPEGASUSAudioExecutionTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSAudioExecutionTier1)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1)audioQueueStateInfoTier1;
- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)audioUnderstandingTier1;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)audioInternalSignalsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)audioInternalSignalsCount;
- (unint64_t)hash;
- (void)addAudioInternalSignals:(id)a3;
- (void)clearAudioInternalSignals;
- (void)deleteAudioLaunchId;
- (void)deleteAudioQueueStateInfoTier1;
- (void)deleteAudioType;
- (void)deleteAudioUnderstandingTier1;
- (void)setAudioInternalSignals:(id)a3;
- (void)setAudioLaunchId:(id)a3;
- (void)setAudioQueueStateInfoTier1:(id)a3;
- (void)setAudioType:(id)a3;
- (void)setAudioUnderstandingTier1:(id)a3;
- (void)setHasAudioLaunchId:(BOOL)a3;
- (void)setHasAudioQueueStateInfoTier1:(BOOL)a3;
- (void)setHasAudioType:(BOOL)a3;
- (void)setHasAudioUnderstandingTier1:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSAudioExecutionTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecutionTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioLaunchId];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioType];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioInternalSignals];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioLaunchId];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioType];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioInternalSignals];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioLaunchId];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioType];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioInternalSignals];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioLaunchId];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioType];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioInternalSignals];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioLaunchId];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioType];
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioInternalSignals];
  }
  v6 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioUnderstandingTier1];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioUnderstandingTier1];
  }
  v9 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioQueueStateInfoTier1];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self deleteAudioQueueStateInfoTier1];
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
  objc_storeStrong((id *)&self->_audioQueueStateInfoTier1, 0);
  objc_storeStrong((id *)&self->_audioUnderstandingTier1, 0);
  objc_storeStrong((id *)&self->_audioInternalSignals, 0);
  objc_storeStrong((id *)&self->_audioType, 0);
  objc_storeStrong((id *)&self->_audioLaunchId, 0);
}

- (void)setHasAudioQueueStateInfoTier1:(BOOL)a3
{
  self->_hasAudioQueueStateInfoTier1 = a3;
}

- (void)setHasAudioUnderstandingTier1:(BOOL)a3
{
  self->_hasAudioUnderstandingTier1 = a3;
}

- (void)setHasAudioType:(BOOL)a3
{
  self->_hasAudioType = a3;
}

- (void)setHasAudioLaunchId:(BOOL)a3
{
  self->_hasAudioLaunchId = a3;
}

- (void)setAudioQueueStateInfoTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1)audioQueueStateInfoTier1
{
  return self->_audioQueueStateInfoTier1;
}

- (void)setAudioUnderstandingTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)audioUnderstandingTier1
{
  return self->_audioUnderstandingTier1;
}

- (void)setAudioInternalSignals:(id)a3
{
}

- (NSArray)audioInternalSignals
{
  return self->_audioInternalSignals;
}

- (void)setAudioType:(id)a3
{
}

- (NSString)audioType
{
  return self->_audioType;
}

- (void)setAudioLaunchId:(id)a3
{
}

- (NSString)audioLaunchId
{
  return self->_audioLaunchId;
}

- (PEGASUSSchemaPEGASUSAudioExecutionTier1)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecutionTier1;
  v5 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioLaunchId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)v5 setAudioLaunchId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"audioType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)v5 setAudioType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"audioInternalSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = (void *)[v16 copy];
              [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)v5 addAudioInternalSignals:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v13);
      }

      v6 = v24;
    }
    v18 = [v4 objectForKeyedSubscript:@"audioUnderstandingTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 alloc] initWithDictionary:v18];
      [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)v5 setAudioUnderstandingTier1:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"audioQueueStateInfoTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1 alloc] initWithDictionary:v20];
      [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)v5 setAudioQueueStateInfoTier1:v21];
    }
    v22 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAudioExecutionTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self dictionaryRepresentation];
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
  if (self->_audioInternalSignals)
  {
    id v4 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioInternalSignals];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"audioInternalSignals"];
  }
  if (self->_audioLaunchId)
  {
    v6 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioLaunchId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"audioLaunchId"];
  }
  if (self->_audioQueueStateInfoTier1)
  {
    int v8 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioQueueStateInfoTier1];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"audioQueueStateInfoTier1"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"audioQueueStateInfoTier1"];
    }
  }
  if (self->_audioType)
  {
    id v11 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioType];
    uint64_t v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"audioType"];
  }
  if (self->_audioUnderstandingTier1)
  {
    uint64_t v13 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioUnderstandingTier1];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"audioUnderstandingTier1"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"audioUnderstandingTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_audioLaunchId hash];
  NSUInteger v4 = [(NSString *)self->_audioType hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_audioInternalSignals hash];
  unint64_t v6 = v4 ^ v5 ^ [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self->_audioUnderstandingTier1 hash];
  return v6 ^ [(PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1 *)self->_audioQueueStateInfoTier1 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioLaunchId];
  unint64_t v6 = [v4 audioLaunchId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioLaunchId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioLaunchId];
    v10 = [v4 audioLaunchId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioType];
  unint64_t v6 = [v4 audioType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioType];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioType];
    uint64_t v15 = [v4 audioType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioInternalSignals];
  unint64_t v6 = [v4 audioInternalSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioInternalSignals];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioInternalSignals];
    v20 = [v4 audioInternalSignals];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioUnderstandingTier1];
  unint64_t v6 = [v4 audioUnderstandingTier1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioUnderstandingTier1];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioUnderstandingTier1];
    long long v25 = [v4 audioUnderstandingTier1];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioQueueStateInfoTier1];
  unint64_t v6 = [v4 audioQueueStateInfoTier1];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioQueueStateInfoTier1];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    long long v28 = (void *)v27;
    objc_super v29 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioQueueStateInfoTier1];
    v30 = [v4 audioQueueStateInfoTier1];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioLaunchId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioType];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_audioInternalSignals;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioUnderstandingTier1];

  if (v12)
  {
    uint64_t v13 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioUnderstandingTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioQueueStateInfoTier1];

  if (v14)
  {
    uint64_t v15 = [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self audioQueueStateInfoTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioQueueStateInfoTier1
{
}

- (BOOL)hasAudioQueueStateInfoTier1
{
  return self->_audioQueueStateInfoTier1 != 0;
}

- (void)deleteAudioUnderstandingTier1
{
}

- (BOOL)hasAudioUnderstandingTier1
{
  return self->_audioUnderstandingTier1 != 0;
}

- (id)audioInternalSignalsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_audioInternalSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)audioInternalSignalsCount
{
  return [(NSArray *)self->_audioInternalSignals count];
}

- (void)addAudioInternalSignals:(id)a3
{
  id v4 = a3;
  audioInternalSignals = self->_audioInternalSignals;
  id v8 = v4;
  if (!audioInternalSignals)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_audioInternalSignals;
    self->_audioInternalSignals = v6;

    id v4 = v8;
    audioInternalSignals = self->_audioInternalSignals;
  }
  [(NSArray *)audioInternalSignals addObject:v4];
}

- (void)clearAudioInternalSignals
{
}

- (void)deleteAudioType
{
}

- (BOOL)hasAudioType
{
  return self->_audioType != 0;
}

- (void)deleteAudioLaunchId
{
}

- (BOOL)hasAudioLaunchId
{
  return self->_audioLaunchId != 0;
}

@end