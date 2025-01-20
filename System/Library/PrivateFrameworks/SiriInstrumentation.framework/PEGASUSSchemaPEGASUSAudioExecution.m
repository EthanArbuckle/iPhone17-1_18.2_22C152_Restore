@interface PEGASUSSchemaPEGASUSAudioExecution
- (BOOL)hasAudioPlaybackSignal;
- (BOOL)hasAudioQueueStateInfo;
- (BOOL)hasAudioUnderstanding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSAudioExecution)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSAudioExecution)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)audioPlaybackSignal;
- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)audioQueueStateInfo;
- (PEGASUSSchemaPEGASUSAudioUnderstanding)audioUnderstanding;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAudioPlaybackSignal;
- (void)deleteAudioQueueStateInfo;
- (void)deleteAudioUnderstanding;
- (void)setAudioPlaybackSignal:(id)a3;
- (void)setAudioQueueStateInfo:(id)a3;
- (void)setAudioUnderstanding:(id)a3;
- (void)setHasAudioPlaybackSignal:(BOOL)a3;
- (void)setHasAudioQueueStateInfo:(BOOL)a3;
- (void)setHasAudioUnderstanding:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSAudioExecution

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecution;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioPlaybackSignal];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSAudioExecution *)self deleteAudioPlaybackSignal];
  }
  v9 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioUnderstanding];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSAudioExecution *)self deleteAudioUnderstanding];
  }
  v12 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioQueueStateInfo];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PEGASUSSchemaPEGASUSAudioExecution *)self deleteAudioQueueStateInfo];
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
  objc_storeStrong((id *)&self->_audioQueueStateInfo, 0);
  objc_storeStrong((id *)&self->_audioUnderstanding, 0);
  objc_storeStrong((id *)&self->_audioPlaybackSignal, 0);
}

- (void)setHasAudioQueueStateInfo:(BOOL)a3
{
  self->_hasAudioQueueStateInfo = a3;
}

- (void)setHasAudioUnderstanding:(BOOL)a3
{
  self->_hasAudioUnderstanding = a3;
}

- (void)setHasAudioPlaybackSignal:(BOOL)a3
{
  self->_hasAudioPlaybackSignal = a3;
}

- (void)setAudioQueueStateInfo:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)audioQueueStateInfo
{
  return self->_audioQueueStateInfo;
}

- (void)setAudioUnderstanding:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioUnderstanding)audioUnderstanding
{
  return self->_audioUnderstanding;
}

- (void)setAudioPlaybackSignal:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)audioPlaybackSignal
{
  return self->_audioPlaybackSignal;
}

- (PEGASUSSchemaPEGASUSAudioExecution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecution;
  v5 = [(PEGASUSSchemaPEGASUSAudioExecution *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioPlaybackSignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PEGASUSSchemaPEGASUSAudioPlaybackSignal alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSAudioExecution *)v5 setAudioPlaybackSignal:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"audioUnderstanding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PEGASUSSchemaPEGASUSAudioUnderstanding alloc] initWithDictionary:v8];
      [(PEGASUSSchemaPEGASUSAudioExecution *)v5 setAudioUnderstanding:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"audioQueueStateInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PEGASUSSchemaPEGASUSAudioQueueStateInfo alloc] initWithDictionary:v10];
      [(PEGASUSSchemaPEGASUSAudioExecution *)v5 setAudioQueueStateInfo:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAudioExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSAudioExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSAudioExecution *)self dictionaryRepresentation];
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
  if (self->_audioPlaybackSignal)
  {
    id v4 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioPlaybackSignal];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioPlaybackSignal"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioPlaybackSignal"];
    }
  }
  if (self->_audioQueueStateInfo)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioQueueStateInfo];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"audioQueueStateInfo"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"audioQueueStateInfo"];
    }
  }
  if (self->_audioUnderstanding)
  {
    v10 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioUnderstanding];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"audioUnderstanding"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"audioUnderstanding"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PEGASUSSchemaPEGASUSAudioPlaybackSignal *)self->_audioPlaybackSignal hash];
  unint64_t v4 = [(PEGASUSSchemaPEGASUSAudioUnderstanding *)self->_audioUnderstanding hash] ^ v3;
  return v4 ^ [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self->_audioQueueStateInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioPlaybackSignal];
  v6 = [v4 audioPlaybackSignal];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioPlaybackSignal];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioPlaybackSignal];
    v10 = [v4 audioPlaybackSignal];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioUnderstanding];
  v6 = [v4 audioUnderstanding];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioUnderstanding];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioUnderstanding];
    v15 = [v4 audioUnderstanding];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioQueueStateInfo];
  v6 = [v4 audioQueueStateInfo];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioQueueStateInfo];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioQueueStateInfo];
    v20 = [v4 audioQueueStateInfo];
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
  id v10 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioPlaybackSignal];

  if (v4)
  {
    v5 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioPlaybackSignal];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioUnderstanding];

  if (v6)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioUnderstanding];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioQueueStateInfo];

  if (v8)
  {
    v9 = [(PEGASUSSchemaPEGASUSAudioExecution *)self audioQueueStateInfo];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioQueueStateInfo
{
}

- (BOOL)hasAudioQueueStateInfo
{
  return self->_audioQueueStateInfo != 0;
}

- (void)deleteAudioUnderstanding
{
}

- (BOOL)hasAudioUnderstanding
{
  return self->_audioUnderstanding != 0;
}

- (void)deleteAudioPlaybackSignal
{
}

- (BOOL)hasAudioPlaybackSignal
{
  return self->_audioPlaybackSignal != 0;
}

@end