@interface ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream
- (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream)initWithDictionary:(id)a3;
- (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream)initWithJSON:(id)a3;
- (BOOL)hasLoggableSharedUserId;
- (BOOL)hasResultCandidateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)loggableSharedUserId;
- (NSString)resultCandidateId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLoggableSharedUserId;
- (void)deleteResultCandidateId;
- (void)setHasLoggableSharedUserId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 8, v8.receiver, v8.super_class);

  if (v6) {
    [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self deleteLoggableSharedUserId];
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
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  self->_hasLoggableSharedUserId = a3;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream;
  v5 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)&v12 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"loggableSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)v5 setLoggableSharedUserId:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)v5 setResultCandidateId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self dictionaryRepresentation];
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
  if (self->_loggableSharedUserId)
  {
    id v4 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self loggableSharedUserId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"loggableSharedUserId"];
  }
  if (self->_resultCandidateId)
  {
    int v6 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self resultCandidateId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"resultCandidateId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_loggableSharedUserId hash];
  return [(NSString *)self->_resultCandidateId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self loggableSharedUserId];
  int v6 = [v4 loggableSharedUserId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self loggableSharedUserId];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self loggableSharedUserId];
    v10 = [v4 loggableSharedUserId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self resultCandidateId];
  int v6 = [v4 resultCandidateId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self resultCandidateId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self resultCandidateId];
    v15 = [v4 resultCandidateId];
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
  id v6 = a3;
  id v4 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self loggableSharedUserId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self resultCandidateId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstreamReadFrom(self, (uint64_t)a3);
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteLoggableSharedUserId
{
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

@end