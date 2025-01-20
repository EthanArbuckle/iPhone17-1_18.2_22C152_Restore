@interface ASRSchemaASRFinalAudioPacketContainingSpeechReceived
- (ASRSchemaASRFinalAudioPacketContainingSpeechReceived)initWithDictionary:(id)a3;
- (ASRSchemaASRFinalAudioPacketContainingSpeechReceived)initWithJSON:(id)a3;
- (BOOL)exists;
- (BOOL)hasExists;
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
- (void)deleteExists;
- (void)deleteLoggableSharedUserId;
- (void)deleteResultCandidateId;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasLoggableSharedUserId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRFinalAudioPacketContainingSpeechReceived

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASRSchemaASRFinalAudioPacketContainingSpeechReceived;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 8, v8.receiver, v8.super_class);

  if (v6) {
    [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self deleteLoggableSharedUserId];
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
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
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

- (BOOL)exists
{
  return self->_exists;
}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASRSchemaASRFinalAudioPacketContainingSpeechReceived;
  v5 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)&v13 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRFinalAudioPacketContainingSpeechReceived setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"loggableSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = (void *)[v7 copy];
      [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)v5 setLoggableSharedUserId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)v5 setResultCandidateId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRFinalAudioPacketContainingSpeechReceived exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_loggableSharedUserId)
  {
    v5 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self loggableSharedUserId];
    int v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"loggableSharedUserId"];
  }
  if (self->_resultCandidateId)
  {
    uint64_t v7 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self resultCandidateId];
    objc_super v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"resultCandidateId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_loggableSharedUserId hash] ^ v3;
  return v4 ^ [(NSString *)self->_resultCandidateId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_15;
    }
  }
  int v6 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self loggableSharedUserId];
  uint64_t v7 = [v4 loggableSharedUserId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self loggableSharedUserId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self loggableSharedUserId];
    v11 = [v4 loggableSharedUserId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v6 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self resultCandidateId];
  uint64_t v7 = [v4 resultCandidateId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self resultCandidateId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self resultCandidateId];
    v16 = [v4 resultCandidateId];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v4 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self loggableSharedUserId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self resultCandidateId];

  int v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRFinalAudioPacketContainingSpeechReceivedReadFrom(self, (uint64_t)a3);
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

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end