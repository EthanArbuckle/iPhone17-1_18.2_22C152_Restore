@interface ASRSchemaASRDictationVoiceCommandMetricsReported
- (ASRSchemaASRDictationVoiceCommandMetricsReported)initWithDictionary:(id)a3;
- (ASRSchemaASRDictationVoiceCommandMetricsReported)initWithJSON:(id)a3;
- (BOOL)hasCommandEndTimeInNs;
- (BOOL)hasCommandParserEndTimeInNs;
- (BOOL)hasCommandParserStartTimeInNs;
- (BOOL)hasDictationVoiceCommandLinkId;
- (BOOL)hasRecognitionResultLinkId;
- (BOOL)hasUtteranceEndTimeInNs;
- (BOOL)hasUtteranceStartTimeInNs;
- (BOOL)hasVoiceCommandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)dictationVoiceCommandLinkId;
- (SISchemaUUID)recognitionResultLinkId;
- (SISchemaUUID)voiceCommandId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)commandEndTimeInNs;
- (unint64_t)commandParserEndTimeInNs;
- (unint64_t)commandParserStartTimeInNs;
- (unint64_t)hash;
- (unint64_t)utteranceEndTimeInNs;
- (unint64_t)utteranceStartTimeInNs;
- (void)deleteCommandEndTimeInNs;
- (void)deleteCommandParserEndTimeInNs;
- (void)deleteCommandParserStartTimeInNs;
- (void)deleteDictationVoiceCommandLinkId;
- (void)deleteRecognitionResultLinkId;
- (void)deleteUtteranceEndTimeInNs;
- (void)deleteUtteranceStartTimeInNs;
- (void)deleteVoiceCommandId;
- (void)setCommandEndTimeInNs:(unint64_t)a3;
- (void)setCommandParserEndTimeInNs:(unint64_t)a3;
- (void)setCommandParserStartTimeInNs:(unint64_t)a3;
- (void)setDictationVoiceCommandLinkId:(id)a3;
- (void)setHasCommandEndTimeInNs:(BOOL)a3;
- (void)setHasCommandParserEndTimeInNs:(BOOL)a3;
- (void)setHasCommandParserStartTimeInNs:(BOOL)a3;
- (void)setHasDictationVoiceCommandLinkId:(BOOL)a3;
- (void)setHasRecognitionResultLinkId:(BOOL)a3;
- (void)setHasUtteranceEndTimeInNs:(BOOL)a3;
- (void)setHasUtteranceStartTimeInNs:(BOOL)a3;
- (void)setHasVoiceCommandId:(BOOL)a3;
- (void)setRecognitionResultLinkId:(id)a3;
- (void)setUtteranceEndTimeInNs:(unint64_t)a3;
- (void)setUtteranceStartTimeInNs:(unint64_t)a3;
- (void)setVoiceCommandId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRDictationVoiceCommandMetricsReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASRSchemaASRDictationVoiceCommandMetricsReported;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self voiceCommandId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self deleteVoiceCommandId];
  }
  v9 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self recognitionResultLinkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self deleteRecognitionResultLinkId];
  }
  v12 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictationVoiceCommandLinkId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self deleteDictationVoiceCommandLinkId];
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
  objc_storeStrong((id *)&self->_dictationVoiceCommandLinkId, 0);
  objc_storeStrong((id *)&self->_recognitionResultLinkId, 0);
  objc_storeStrong((id *)&self->_voiceCommandId, 0);
}

- (void)setHasDictationVoiceCommandLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasRecognitionResultLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasVoiceCommandId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDictationVoiceCommandLinkId:(id)a3
{
}

- (SISchemaUUID)dictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId;
}

- (void)setRecognitionResultLinkId:(id)a3
{
}

- (SISchemaUUID)recognitionResultLinkId
{
  return self->_recognitionResultLinkId;
}

- (unint64_t)utteranceEndTimeInNs
{
  return self->_utteranceEndTimeInNs;
}

- (unint64_t)utteranceStartTimeInNs
{
  return self->_utteranceStartTimeInNs;
}

- (unint64_t)commandParserEndTimeInNs
{
  return self->_commandParserEndTimeInNs;
}

- (unint64_t)commandParserStartTimeInNs
{
  return self->_commandParserStartTimeInNs;
}

- (unint64_t)commandEndTimeInNs
{
  return self->_commandEndTimeInNs;
}

- (void)setVoiceCommandId:(id)a3
{
}

- (SISchemaUUID)voiceCommandId
{
  return self->_voiceCommandId;
}

- (ASRSchemaASRDictationVoiceCommandMetricsReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASRSchemaASRDictationVoiceCommandMetricsReported;
  v5 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"voiceCommandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRDictationVoiceCommandMetricsReported *)v5 setVoiceCommandId:v7];
    }
    v19 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"commandEndTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandEndTimeInNs:](v5, "setCommandEndTimeInNs:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"commandParserStartTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandParserStartTimeInNs:](v5, "setCommandParserStartTimeInNs:", [v9 unsignedLongLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"commandParserEndTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandParserEndTimeInNs:](v5, "setCommandParserEndTimeInNs:", [v10 unsignedLongLongValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"utteranceStartTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setUtteranceStartTimeInNs:](v5, "setUtteranceStartTimeInNs:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"utteranceEndTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setUtteranceEndTimeInNs:](v5, "setUtteranceEndTimeInNs:", [v12 unsignedLongLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"recognitionResultLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[SISchemaUUID alloc] initWithDictionary:v13];
      [(ASRSchemaASRDictationVoiceCommandMetricsReported *)v5 setRecognitionResultLinkId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"dictationVoiceCommandLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(ASRSchemaASRDictationVoiceCommandMetricsReported *)v5 setDictationVoiceCommandLinkId:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (ASRSchemaASRDictationVoiceCommandMetricsReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported commandEndTimeInNs](self, "commandEndTimeInNs"));
    [v3 setObject:v8 forKeyedSubscript:@"commandEndTimeInNs"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported commandParserEndTimeInNs](self, "commandParserEndTimeInNs"));
  [v3 setObject:v9 forKeyedSubscript:@"commandParserEndTimeInNs"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported commandParserStartTimeInNs](self, "commandParserStartTimeInNs"));
    [v3 setObject:v5 forKeyedSubscript:@"commandParserStartTimeInNs"];
  }
LABEL_5:
  if (self->_dictationVoiceCommandLinkId)
  {
    uint64_t v6 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictationVoiceCommandLinkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"dictationVoiceCommandLinkId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"dictationVoiceCommandLinkId"];
    }
  }
  if (self->_recognitionResultLinkId)
  {
    int v11 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self recognitionResultLinkId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"recognitionResultLinkId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"recognitionResultLinkId"];
    }
  }
  char v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported utteranceEndTimeInNs](self, "utteranceEndTimeInNs"));
    [v3 setObject:v15 forKeyedSubscript:@"utteranceEndTimeInNs"];

    char v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    objc_super v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported utteranceStartTimeInNs](self, "utteranceStartTimeInNs"));
    [v3 setObject:v16 forKeyedSubscript:@"utteranceStartTimeInNs"];
  }
  if (self->_voiceCommandId)
  {
    v17 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self voiceCommandId];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"voiceCommandId"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"voiceCommandId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_voiceCommandId hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_commandEndTimeInNs;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_commandParserStartTimeInNs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_commandParserEndTimeInNs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v8 = 0;
    goto LABEL_12;
  }
LABEL_9:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v7 = 2654435761u * self->_utteranceStartTimeInNs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v8 = 2654435761u * self->_utteranceEndTimeInNs;
LABEL_12:
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(SISchemaUUID *)self->_recognitionResultLinkId hash];
  return v9 ^ [(SISchemaUUID *)self->_dictationVoiceCommandLinkId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  unint64_t v5 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self voiceCommandId];
  unint64_t v6 = [v4 voiceCommandId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v7 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self voiceCommandId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self voiceCommandId];
    v10 = [v4 voiceCommandId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  $624CFD93D76B45E4603A0DD6940BEB43 has = self->_has;
  unsigned int v13 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t commandEndTimeInNs = self->_commandEndTimeInNs;
    if (commandEndTimeInNs != [v4 commandEndTimeInNs]) {
      goto LABEL_36;
    }
    $624CFD93D76B45E4603A0DD6940BEB43 has = self->_has;
    unsigned int v13 = v4[72];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_36;
  }
  if (v15)
  {
    unint64_t commandParserStartTimeInNs = self->_commandParserStartTimeInNs;
    if (commandParserStartTimeInNs != [v4 commandParserStartTimeInNs]) {
      goto LABEL_36;
    }
    $624CFD93D76B45E4603A0DD6940BEB43 has = self->_has;
    unsigned int v13 = v4[72];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_36;
  }
  if (v17)
  {
    unint64_t commandParserEndTimeInNs = self->_commandParserEndTimeInNs;
    if (commandParserEndTimeInNs != [v4 commandParserEndTimeInNs]) {
      goto LABEL_36;
    }
    $624CFD93D76B45E4603A0DD6940BEB43 has = self->_has;
    unsigned int v13 = v4[72];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_36;
  }
  if (v19)
  {
    unint64_t utteranceStartTimeInNs = self->_utteranceStartTimeInNs;
    if (utteranceStartTimeInNs != [v4 utteranceStartTimeInNs]) {
      goto LABEL_36;
    }
    $624CFD93D76B45E4603A0DD6940BEB43 has = self->_has;
    unsigned int v13 = v4[72];
  }
  int v21 = (*(unsigned int *)&has >> 4) & 1;
  if (v21 != ((v13 >> 4) & 1)) {
    goto LABEL_36;
  }
  if (v21)
  {
    unint64_t utteranceEndTimeInNs = self->_utteranceEndTimeInNs;
    if (utteranceEndTimeInNs != [v4 utteranceEndTimeInNs]) {
      goto LABEL_36;
    }
  }
  unint64_t v5 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self recognitionResultLinkId];
  unint64_t v6 = [v4 recognitionResultLinkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v23 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self recognitionResultLinkId];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self recognitionResultLinkId];
    v26 = [v4 recognitionResultLinkId];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictationVoiceCommandLinkId];
  unint64_t v6 = [v4 dictationVoiceCommandLinkId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v28 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictationVoiceCommandLinkId];
  if (!v28)
  {

LABEL_39:
    BOOL v33 = 1;
    goto LABEL_37;
  }
  v29 = (void *)v28;
  v30 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictationVoiceCommandLinkId];
  v31 = [v4 dictationVoiceCommandLinkId];
  char v32 = [v30 isEqual:v31];

  if (v32) {
    goto LABEL_39;
  }
LABEL_36:
  BOOL v33 = 0;
LABEL_37:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self voiceCommandId];

  if (v4)
  {
    unint64_t v5 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self voiceCommandId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint64Field();
LABEL_9:
  uint64_t v7 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self recognitionResultLinkId];

  if (v7)
  {
    unint64_t v8 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self recognitionResultLinkId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v9 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictationVoiceCommandLinkId];

  v10 = v12;
  if (v9)
  {
    int v11 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self dictationVoiceCommandLinkId];
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRDictationVoiceCommandMetricsReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDictationVoiceCommandLinkId
{
}

- (BOOL)hasDictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId != 0;
}

- (void)deleteRecognitionResultLinkId
{
}

- (BOOL)hasRecognitionResultLinkId
{
  return self->_recognitionResultLinkId != 0;
}

- (void)deleteUtteranceEndTimeInNs
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasUtteranceEndTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUtteranceEndTimeInNs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUtteranceEndTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unint64_t utteranceEndTimeInNs = a3;
}

- (void)deleteUtteranceStartTimeInNs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasUtteranceStartTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUtteranceStartTimeInNs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUtteranceStartTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t utteranceStartTimeInNs = a3;
}

- (void)deleteCommandParserEndTimeInNs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCommandParserEndTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommandParserEndTimeInNs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCommandParserEndTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t commandParserEndTimeInNs = a3;
}

- (void)deleteCommandParserStartTimeInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCommandParserStartTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommandParserStartTimeInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCommandParserStartTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t commandParserStartTimeInNs = a3;
}

- (void)deleteCommandEndTimeInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCommandEndTimeInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommandEndTimeInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCommandEndTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t commandEndTimeInNs = a3;
}

- (void)deleteVoiceCommandId
{
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

@end