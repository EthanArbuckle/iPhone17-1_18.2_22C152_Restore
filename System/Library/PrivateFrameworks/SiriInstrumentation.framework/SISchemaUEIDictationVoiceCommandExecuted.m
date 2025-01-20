@interface SISchemaUEIDictationVoiceCommandExecuted
- (BOOL)hasCommandExecutionEndTimeInNs;
- (BOOL)hasCommandExecutionStartTimeInNs;
- (BOOL)hasCommandPayloadCharacterCount;
- (BOOL)hasCommandPayloadWordCount;
- (BOOL)hasCommandStatus;
- (BOOL)hasCommandTargetCharacterCount;
- (BOOL)hasCommandTargetWordCount;
- (BOOL)hasCommandType;
- (BOOL)hasVoiceCommandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationVoiceCommandExecuted)initWithDictionary:(id)a3;
- (SISchemaUEIDictationVoiceCommandExecuted)initWithJSON:(id)a3;
- (SISchemaUUID)voiceCommandId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)commandStatus;
- (int)commandType;
- (unint64_t)commandExecutionEndTimeInNs;
- (unint64_t)commandExecutionStartTimeInNs;
- (unint64_t)commandPayloadCharacterCount;
- (unint64_t)commandPayloadWordCount;
- (unint64_t)commandTargetCharacterCount;
- (unint64_t)commandTargetWordCount;
- (unint64_t)hash;
- (void)deleteCommandExecutionEndTimeInNs;
- (void)deleteCommandExecutionStartTimeInNs;
- (void)deleteCommandPayloadCharacterCount;
- (void)deleteCommandPayloadWordCount;
- (void)deleteCommandStatus;
- (void)deleteCommandTargetCharacterCount;
- (void)deleteCommandTargetWordCount;
- (void)deleteCommandType;
- (void)deleteVoiceCommandId;
- (void)setCommandExecutionEndTimeInNs:(unint64_t)a3;
- (void)setCommandExecutionStartTimeInNs:(unint64_t)a3;
- (void)setCommandPayloadCharacterCount:(unint64_t)a3;
- (void)setCommandPayloadWordCount:(unint64_t)a3;
- (void)setCommandStatus:(int)a3;
- (void)setCommandTargetCharacterCount:(unint64_t)a3;
- (void)setCommandTargetWordCount:(unint64_t)a3;
- (void)setCommandType:(int)a3;
- (void)setHasCommandExecutionEndTimeInNs:(BOOL)a3;
- (void)setHasCommandExecutionStartTimeInNs:(BOOL)a3;
- (void)setHasCommandPayloadCharacterCount:(BOOL)a3;
- (void)setHasCommandPayloadWordCount:(BOOL)a3;
- (void)setHasCommandStatus:(BOOL)a3;
- (void)setHasCommandTargetCharacterCount:(BOOL)a3;
- (void)setHasCommandTargetWordCount:(BOOL)a3;
- (void)setHasCommandType:(BOOL)a3;
- (void)setHasVoiceCommandId:(BOOL)a3;
- (void)setVoiceCommandId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationVoiceCommandExecuted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIDictationVoiceCommandExecuted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUEIDictationVoiceCommandExecuted *)self voiceCommandId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaUEIDictationVoiceCommandExecuted *)self deleteVoiceCommandId];
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
}

- (void)setHasVoiceCommandId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)commandExecutionEndTimeInNs
{
  return self->_commandExecutionEndTimeInNs;
}

- (unint64_t)commandExecutionStartTimeInNs
{
  return self->_commandExecutionStartTimeInNs;
}

- (unint64_t)commandPayloadCharacterCount
{
  return self->_commandPayloadCharacterCount;
}

- (unint64_t)commandTargetCharacterCount
{
  return self->_commandTargetCharacterCount;
}

- (unint64_t)commandPayloadWordCount
{
  return self->_commandPayloadWordCount;
}

- (unint64_t)commandTargetWordCount
{
  return self->_commandTargetWordCount;
}

- (int)commandType
{
  return self->_commandType;
}

- (int)commandStatus
{
  return self->_commandStatus;
}

- (void)setVoiceCommandId:(id)a3
{
}

- (SISchemaUUID)voiceCommandId
{
  return self->_voiceCommandId;
}

- (SISchemaUEIDictationVoiceCommandExecuted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaUEIDictationVoiceCommandExecuted;
  v5 = [(SISchemaUEIDictationVoiceCommandExecuted *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceCommandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaUEIDictationVoiceCommandExecuted *)v5 setVoiceCommandId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"commandStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandStatus:](v5, "setCommandStatus:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"commandType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandType:](v5, "setCommandType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"commandTargetWordCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandTargetWordCount:](v5, "setCommandTargetWordCount:", [v10 unsignedLongLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"commandPayloadWordCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandPayloadWordCount:](v5, "setCommandPayloadWordCount:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"commandTargetCharacterCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandTargetCharacterCount:](v5, "setCommandTargetCharacterCount:", [v12 unsignedLongLongValue]);
    }
    v13 = objc_msgSend(v4, "objectForKeyedSubscript:", @"commandPayloadCharacterCount", v9);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandPayloadCharacterCount:](v5, "setCommandPayloadCharacterCount:", [v13 unsignedLongLongValue]);
    }
    v14 = v8;
    v15 = [v4 objectForKeyedSubscript:@"commandExecutionStartTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandExecutionStartTimeInNs:](v5, "setCommandExecutionStartTimeInNs:", [v15 unsignedLongLongValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"commandExecutionEndTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandExecutionEndTimeInNs:](v5, "setCommandExecutionEndTimeInNs:", [v16 unsignedLongLongValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationVoiceCommandExecuted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationVoiceCommandExecuted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationVoiceCommandExecuted *)self dictionaryRepresentation];
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
  if (has < 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandExecutionEndTimeInNs](self, "commandExecutionEndTimeInNs"));
    [v3 setObject:v5 forKeyedSubscript:@"commandExecutionEndTimeInNs"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandExecutionStartTimeInNs](self, "commandExecutionStartTimeInNs"));
  [v3 setObject:v6 forKeyedSubscript:@"commandExecutionStartTimeInNs"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandPayloadCharacterCount](self, "commandPayloadCharacterCount"));
  [v3 setObject:v7 forKeyedSubscript:@"commandPayloadCharacterCount"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandPayloadWordCount](self, "commandPayloadWordCount"));
  [v3 setObject:v8 forKeyedSubscript:@"commandPayloadWordCount"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_14:
  unsigned int v9 = [(SISchemaUEIDictationVoiceCommandExecuted *)self commandStatus] - 1;
  if (v9 > 2) {
    v10 = @"UEIVOICECOMMANDEXECUTIONSTATUS_UNKNOWN";
  }
  else {
    v10 = off_1E5EB8650[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"commandStatus"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandTargetCharacterCount](self, "commandTargetCharacterCount"));
  [v3 setObject:v11 forKeyedSubscript:@"commandTargetCharacterCount"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandTargetWordCount](self, "commandTargetWordCount"));
  [v3 setObject:v12 forKeyedSubscript:@"commandTargetWordCount"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  unsigned int v13 = [(SISchemaUEIDictationVoiceCommandExecuted *)self commandType] - 1;
  if (v13 > 0x25) {
    v14 = @"UEIVOICECOMMANDTYPE_UNKNOWN";
  }
  else {
    v14 = off_1E5EB8668[v13];
  }
  [v3 setObject:v14 forKeyedSubscript:@"commandType"];
LABEL_24:
  if (self->_voiceCommandId)
  {
    v15 = [(SISchemaUEIDictationVoiceCommandExecuted *)self voiceCommandId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"voiceCommandId"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"voiceCommandId"];
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
    uint64_t v4 = 2654435761 * self->_commandStatus;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_commandType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_commandTargetWordCount;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    unint64_t v7 = 2654435761u * self->_commandPayloadWordCount;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    unint64_t v8 = 2654435761u * self->_commandTargetCharacterCount;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    unint64_t v9 = 2654435761u * self->_commandPayloadCharacterCount;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  unint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v10 = 2654435761u * self->_commandExecutionStartTimeInNs;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v11 = 2654435761u * self->_commandExecutionEndTimeInNs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  uint64_t v5 = [(SISchemaUEIDictationVoiceCommandExecuted *)self voiceCommandId];
  unint64_t v6 = [v4 voiceCommandId];
  unint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_40;
  }
  uint64_t v8 = [(SISchemaUEIDictationVoiceCommandExecuted *)self voiceCommandId];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(SISchemaUEIDictationVoiceCommandExecuted *)self voiceCommandId];
    unint64_t v11 = [v4 voiceCommandId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
  unsigned int v14 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_40:
    BOOL v29 = 0;
    goto LABEL_41;
  }
  if (*(unsigned char *)&has)
  {
    int commandStatus = self->_commandStatus;
    if (commandStatus != [v4 commandStatus]) {
      goto LABEL_40;
    }
    $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_40;
  }
  if (v16)
  {
    int commandType = self->_commandType;
    if (commandType != [v4 commandType]) {
      goto LABEL_40;
    }
    $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_40;
  }
  if (v18)
  {
    unint64_t commandTargetWordCount = self->_commandTargetWordCount;
    if (commandTargetWordCount != [v4 commandTargetWordCount]) {
      goto LABEL_40;
    }
    $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_40;
  }
  if (v20)
  {
    unint64_t commandPayloadWordCount = self->_commandPayloadWordCount;
    if (commandPayloadWordCount != [v4 commandPayloadWordCount]) {
      goto LABEL_40;
    }
    $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_40;
  }
  if (v22)
  {
    unint64_t commandTargetCharacterCount = self->_commandTargetCharacterCount;
    if (commandTargetCharacterCount != [v4 commandTargetCharacterCount]) {
      goto LABEL_40;
    }
    $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_40;
  }
  if (v24)
  {
    unint64_t commandPayloadCharacterCount = self->_commandPayloadCharacterCount;
    if (commandPayloadCharacterCount != [v4 commandPayloadCharacterCount]) {
      goto LABEL_40;
    }
    $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v26 = (*(unsigned int *)&has >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1)) {
    goto LABEL_40;
  }
  if (v26)
  {
    unint64_t commandExecutionStartTimeInNs = self->_commandExecutionStartTimeInNs;
    if (commandExecutionStartTimeInNs == [v4 commandExecutionStartTimeInNs])
    {
      $DA52C4A8304ABE849CAB3344C73C7BE3 has = self->_has;
      unsigned int v14 = v4[72];
      goto LABEL_36;
    }
    goto LABEL_40;
  }
LABEL_36:
  if (((v14 ^ *(_DWORD *)&has) & 0x80) != 0) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    unint64_t commandExecutionEndTimeInNs = self->_commandExecutionEndTimeInNs;
    if (commandExecutionEndTimeInNs != [v4 commandExecutionEndTimeInNs]) {
      goto LABEL_40;
    }
  }
  BOOL v29 = 1;
LABEL_41:

  return v29;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SISchemaUEIDictationVoiceCommandExecuted *)self voiceCommandId];

  if (v4)
  {
    uint64_t v5 = [(SISchemaUEIDictationVoiceCommandExecuted *)self voiceCommandId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  unint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    unint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  unint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  unint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  unint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
LABEL_20:
    PBDataWriterWriteUint64Field();
    unint64_t v7 = v8;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  unint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_20;
  }
LABEL_11:
  if ((has & 0x80) == 0) {
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  unint64_t v7 = v8;
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationVoiceCommandExecutedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCommandExecutionEndTimeInNs
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasCommandExecutionEndTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasCommandExecutionEndTimeInNs
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCommandExecutionEndTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_unint64_t commandExecutionEndTimeInNs = a3;
}

- (void)deleteCommandExecutionStartTimeInNs
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasCommandExecutionStartTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasCommandExecutionStartTimeInNs
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCommandExecutionStartTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unint64_t commandExecutionStartTimeInNs = a3;
}

- (void)deleteCommandPayloadCharacterCount
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasCommandPayloadCharacterCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCommandPayloadCharacterCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCommandPayloadCharacterCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unint64_t commandPayloadCharacterCount = a3;
}

- (void)deleteCommandTargetCharacterCount
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasCommandTargetCharacterCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCommandTargetCharacterCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCommandTargetCharacterCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unint64_t commandTargetCharacterCount = a3;
}

- (void)deleteCommandPayloadWordCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCommandPayloadWordCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCommandPayloadWordCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCommandPayloadWordCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t commandPayloadWordCount = a3;
}

- (void)deleteCommandTargetWordCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCommandTargetWordCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommandTargetWordCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCommandTargetWordCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t commandTargetWordCount = a3;
}

- (void)deleteCommandType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCommandType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommandType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCommandType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int commandType = a3;
}

- (void)deleteCommandStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCommandStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommandStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCommandStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int commandStatus = a3;
}

- (void)deleteVoiceCommandId
{
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

@end