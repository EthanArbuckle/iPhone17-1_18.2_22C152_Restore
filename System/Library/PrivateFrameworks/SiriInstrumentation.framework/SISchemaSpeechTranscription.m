@interface SISchemaSpeechTranscription
- (BOOL)hasAceID;
- (BOOL)hasSpeechTranscriptionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)aceID;
- (SISchemaSpeechTranscription)initWithDictionary:(id)a3;
- (SISchemaSpeechTranscription)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)speechTranscriptionType;
- (unint64_t)hash;
- (void)deleteAceID;
- (void)deleteSpeechTranscriptionType;
- (void)setAceID:(id)a3;
- (void)setHasAceID:(BOOL)a3;
- (void)setHasSpeechTranscriptionType:(BOOL)a3;
- (void)setSpeechTranscriptionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaSpeechTranscription

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAceID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)speechTranscriptionType
{
  return self->_speechTranscriptionType;
}

- (void)setAceID:(id)a3
{
}

- (NSString)aceID
{
  return self->_aceID;
}

- (SISchemaSpeechTranscription)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaSpeechTranscription;
  v5 = [(SISchemaSpeechTranscription *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"aceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaSpeechTranscription *)v5 setAceID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"speechTranscriptionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSpeechTranscription setSpeechTranscriptionType:](v5, "setSpeechTranscriptionType:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaSpeechTranscription)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaSpeechTranscription *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaSpeechTranscription *)self dictionaryRepresentation];
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
  if (self->_aceID)
  {
    id v4 = [(SISchemaSpeechTranscription *)self aceID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"aceID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(SISchemaSpeechTranscription *)self speechTranscriptionType] - 1;
    if (v6 > 2) {
      uint64_t v7 = @"SPEECHTRANSCRIPTIONTYPE_UNKNOWN_SPEECH_TRANSCRIPTION_TYPE";
    }
    else {
      uint64_t v7 = off_1E5EB8588[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"speechTranscriptionType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_aceID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_speechTranscriptionType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaSpeechTranscription *)self aceID];
  unsigned int v6 = [v4 aceID];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(SISchemaSpeechTranscription *)self aceID];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SISchemaSpeechTranscription *)self aceID];
    objc_super v11 = [v4 aceID];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int speechTranscriptionType = self->_speechTranscriptionType;
    if (speechTranscriptionType != [v4 speechTranscriptionType]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(SISchemaSpeechTranscription *)self aceID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSpeechTranscriptionReadFrom(self, (uint64_t)a3);
}

- (void)deleteSpeechTranscriptionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSpeechTranscriptionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSpeechTranscriptionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSpeechTranscriptionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int speechTranscriptionType = a3;
}

- (void)deleteAceID
{
}

- (BOOL)hasAceID
{
  return self->_aceID != 0;
}

@end