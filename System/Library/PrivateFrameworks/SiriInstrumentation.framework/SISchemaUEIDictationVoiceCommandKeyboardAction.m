@interface SISchemaUEIDictationVoiceCommandKeyboardAction
- (BOOL)hasAlgorithmStatus;
- (BOOL)hasDeleted;
- (BOOL)hasInsertions;
- (BOOL)hasSubstituted;
- (BOOL)hasVoiceCommandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationVoiceCommandKeyboardAction)initWithDictionary:(id)a3;
- (SISchemaUEIDictationVoiceCommandKeyboardAction)initWithJSON:(id)a3;
- (SISchemaUUID)voiceCommandId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)algorithmStatus;
- (unsigned)deleted;
- (unsigned)insertions;
- (unsigned)substituted;
- (void)deleteAlgorithmStatus;
- (void)deleteDeleted;
- (void)deleteInsertions;
- (void)deleteSubstituted;
- (void)deleteVoiceCommandId;
- (void)setAlgorithmStatus:(unsigned int)a3;
- (void)setDeleted:(unsigned int)a3;
- (void)setHasAlgorithmStatus:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasInsertions:(BOOL)a3;
- (void)setHasSubstituted:(BOOL)a3;
- (void)setHasVoiceCommandId:(BOOL)a3;
- (void)setInsertions:(unsigned int)a3;
- (void)setSubstituted:(unsigned int)a3;
- (void)setVoiceCommandId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationVoiceCommandKeyboardAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIDictationVoiceCommandKeyboardAction;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self voiceCommandId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self deleteVoiceCommandId];
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

- (unsigned)algorithmStatus
{
  return self->_algorithmStatus;
}

- (unsigned)deleted
{
  return self->_deleted;
}

- (unsigned)substituted
{
  return self->_substituted;
}

- (unsigned)insertions
{
  return self->_insertions;
}

- (void)setVoiceCommandId:(id)a3
{
}

- (SISchemaUUID)voiceCommandId
{
  return self->_voiceCommandId;
}

- (SISchemaUEIDictationVoiceCommandKeyboardAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaUEIDictationVoiceCommandKeyboardAction;
  v5 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceCommandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaUEIDictationVoiceCommandKeyboardAction *)v5 setVoiceCommandId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"insertions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setInsertions:](v5, "setInsertions:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"substituted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setSubstituted:](v5, "setSubstituted:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"deleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setDeleted:](v5, "setDeleted:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"algorithmStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setAlgorithmStatus:](v5, "setAlgorithmStatus:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationVoiceCommandKeyboardAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction algorithmStatus](self, "algorithmStatus"));
    [v3 setObject:v8 forKeyedSubscript:@"algorithmStatus"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction deleted](self, "deleted"));
  [v3 setObject:v9 forKeyedSubscript:@"deleted"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction insertions](self, "insertions"));
  [v3 setObject:v10 forKeyedSubscript:@"insertions"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction substituted](self, "substituted"));
    [v3 setObject:v5 forKeyedSubscript:@"substituted"];
  }
LABEL_6:
  if (self->_voiceCommandId)
  {
    v6 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self voiceCommandId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"voiceCommandId"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"voiceCommandId"];
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
    uint64_t v4 = 2654435761 * self->_insertions;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_substituted;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_deleted;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_algorithmStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self voiceCommandId];
  uint64_t v6 = [v4 voiceCommandId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self voiceCommandId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self voiceCommandId];
    v11 = [v4 voiceCommandId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $CACD090B11F4A6915D1DDDEA2D7195C4 has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int insertions = self->_insertions;
    if (insertions != [v4 insertions]) {
      goto LABEL_24;
    }
    $CACD090B11F4A6915D1DDDEA2D7195C4 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    unsigned int substituted = self->_substituted;
    if (substituted != [v4 substituted]) {
      goto LABEL_24;
    }
    $CACD090B11F4A6915D1DDDEA2D7195C4 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    unsigned int deleted = self->_deleted;
    if (deleted == [v4 deleted])
    {
      $CACD090B11F4A6915D1DDDEA2D7195C4 has = self->_has;
      unsigned int v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    unsigned int algorithmStatus = self->_algorithmStatus;
    if (algorithmStatus != [v4 algorithmStatus]) {
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self voiceCommandId];

  if (v4)
  {
    uint64_t v5 = [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self voiceCommandId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationVoiceCommandKeyboardActionReadFrom(self, (uint64_t)a3);
}

- (void)deleteAlgorithmStatus
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAlgorithmStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAlgorithmStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAlgorithmStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int algorithmStatus = a3;
}

- (void)deleteDeleted
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDeleted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int deleted = a3;
}

- (void)deleteSubstituted
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSubstituted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubstituted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSubstituted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int substituted = a3;
}

- (void)deleteInsertions
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInsertions:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInsertions
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInsertions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int insertions = a3;
}

- (void)deleteVoiceCommandId
{
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

@end