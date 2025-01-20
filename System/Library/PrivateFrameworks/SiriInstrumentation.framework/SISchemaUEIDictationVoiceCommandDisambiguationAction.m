@interface SISchemaUEIDictationVoiceCommandDisambiguationAction
- (BOOL)hasDisambiguationIndex;
- (BOOL)hasDisambiguationType;
- (BOOL)hasTotalDisambiguationAlternatives;
- (BOOL)hasVoiceCommandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationVoiceCommandDisambiguationAction)initWithDictionary:(id)a3;
- (SISchemaUEIDictationVoiceCommandDisambiguationAction)initWithJSON:(id)a3;
- (SISchemaUUID)voiceCommandId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)disambiguationType;
- (unint64_t)hash;
- (unsigned)disambiguationIndex;
- (unsigned)totalDisambiguationAlternatives;
- (void)deleteDisambiguationIndex;
- (void)deleteDisambiguationType;
- (void)deleteTotalDisambiguationAlternatives;
- (void)deleteVoiceCommandId;
- (void)setDisambiguationIndex:(unsigned int)a3;
- (void)setDisambiguationType:(int)a3;
- (void)setHasDisambiguationIndex:(BOOL)a3;
- (void)setHasDisambiguationType:(BOOL)a3;
- (void)setHasTotalDisambiguationAlternatives:(BOOL)a3;
- (void)setHasVoiceCommandId:(BOOL)a3;
- (void)setTotalDisambiguationAlternatives:(unsigned int)a3;
- (void)setVoiceCommandId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationVoiceCommandDisambiguationAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIDictationVoiceCommandDisambiguationAction;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self voiceCommandId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self deleteVoiceCommandId];
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

- (unsigned)totalDisambiguationAlternatives
{
  return self->_totalDisambiguationAlternatives;
}

- (unsigned)disambiguationIndex
{
  return self->_disambiguationIndex;
}

- (int)disambiguationType
{
  return self->_disambiguationType;
}

- (void)setVoiceCommandId:(id)a3
{
}

- (SISchemaUUID)voiceCommandId
{
  return self->_voiceCommandId;
}

- (SISchemaUEIDictationVoiceCommandDisambiguationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUEIDictationVoiceCommandDisambiguationAction;
  v5 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceCommandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)v5 setVoiceCommandId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"disambiguationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandDisambiguationAction setDisambiguationType:](v5, "setDisambiguationType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"disambiguationIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandDisambiguationAction setDisambiguationIndex:](v5, "setDisambiguationIndex:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"totalDisambiguationAlternatives"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandDisambiguationAction setTotalDisambiguationAlternatives:](v5, "setTotalDisambiguationAlternatives:", [v10 unsignedIntValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationVoiceCommandDisambiguationAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandDisambiguationAction disambiguationIndex](self, "disambiguationIndex"));
    [v3 setObject:v8 forKeyedSubscript:@"disambiguationIndex"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  int v9 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self disambiguationType];
  v10 = @"UEIVOICECOMMANDDISAMBIGUATIONTYPE_UNKNOWN";
  if (v9 == 1) {
    v10 = @"UEIVOICECOMMANDDISAMBIGUATIONTYPE_TAP";
  }
  if (v9 == 2) {
    v11 = @"UEIVOICECOMMANDDISAMBIGUATIONTYPE_GAZE";
  }
  else {
    v11 = v10;
  }
  [v3 setObject:v11 forKeyedSubscript:@"disambiguationType"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandDisambiguationAction totalDisambiguationAlternatives](self, "totalDisambiguationAlternatives"));
    [v3 setObject:v5 forKeyedSubscript:@"totalDisambiguationAlternatives"];
  }
LABEL_5:
  if (self->_voiceCommandId)
  {
    v6 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self voiceCommandId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"voiceCommandId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"voiceCommandId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_voiceCommandId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_disambiguationType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_disambiguationIndex;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_totalDisambiguationAlternatives;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self voiceCommandId];
  uint64_t v6 = [v4 voiceCommandId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self voiceCommandId];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self voiceCommandId];
    v11 = [v4 voiceCommandId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $658AE71E088695757E4BB06C3E4750EA has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int disambiguationType = self->_disambiguationType;
    if (disambiguationType != [v4 disambiguationType]) {
      goto LABEL_20;
    }
    $658AE71E088695757E4BB06C3E4750EA has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    unsigned int disambiguationIndex = self->_disambiguationIndex;
    if (disambiguationIndex == [v4 disambiguationIndex])
    {
      $658AE71E088695757E4BB06C3E4750EA has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    unsigned int totalDisambiguationAlternatives = self->_totalDisambiguationAlternatives;
    if (totalDisambiguationAlternatives != [v4 totalDisambiguationAlternatives]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self voiceCommandId];

  if (v4)
  {
    uint64_t v5 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self voiceCommandId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationVoiceCommandDisambiguationActionReadFrom(self, (uint64_t)a3);
}

- (void)deleteTotalDisambiguationAlternatives
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTotalDisambiguationAlternatives:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalDisambiguationAlternatives
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalDisambiguationAlternatives:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int totalDisambiguationAlternatives = a3;
}

- (void)deleteDisambiguationIndex
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDisambiguationIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDisambiguationIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDisambiguationIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int disambiguationIndex = a3;
}

- (void)deleteDisambiguationType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDisambiguationType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisambiguationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDisambiguationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int disambiguationType = a3;
}

- (void)deleteVoiceCommandId
{
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

@end