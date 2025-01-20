@interface ODDSiriSchemaODDiOSAccessibilityProperties
- (BOOL)hasIsAlwaysListenForHeySiriEnabled;
- (BOOL)hasIsAtypicalSpeechEnabled;
- (BOOL)hasIsShowAppsBehindSiriEnabled;
- (BOOL)hasIsTypeToSiriEnabled;
- (BOOL)hasIsVoiceOverEnabled;
- (BOOL)hasSiriPauseTimeState;
- (BOOL)hasSiriSpeechRate;
- (BOOL)hasVoiceFeedback;
- (BOOL)isAlwaysListenForHeySiriEnabled;
- (BOOL)isAtypicalSpeechEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShowAppsBehindSiriEnabled;
- (BOOL)isTypeToSiriEnabled;
- (BOOL)isVoiceOverEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDiOSAccessibilityProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDiOSAccessibilityProperties)initWithJSON:(id)a3;
- (double)siriSpeechRate;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)siriPauseTimeState;
- (int)voiceFeedback;
- (unint64_t)hash;
- (void)deleteIsAlwaysListenForHeySiriEnabled;
- (void)deleteIsAtypicalSpeechEnabled;
- (void)deleteIsShowAppsBehindSiriEnabled;
- (void)deleteIsTypeToSiriEnabled;
- (void)deleteIsVoiceOverEnabled;
- (void)deleteSiriPauseTimeState;
- (void)deleteSiriSpeechRate;
- (void)deleteVoiceFeedback;
- (void)setHasIsAlwaysListenForHeySiriEnabled:(BOOL)a3;
- (void)setHasIsAtypicalSpeechEnabled:(BOOL)a3;
- (void)setHasIsShowAppsBehindSiriEnabled:(BOOL)a3;
- (void)setHasIsTypeToSiriEnabled:(BOOL)a3;
- (void)setHasIsVoiceOverEnabled:(BOOL)a3;
- (void)setHasSiriPauseTimeState:(BOOL)a3;
- (void)setHasSiriSpeechRate:(BOOL)a3;
- (void)setHasVoiceFeedback:(BOOL)a3;
- (void)setIsAlwaysListenForHeySiriEnabled:(BOOL)a3;
- (void)setIsAtypicalSpeechEnabled:(BOOL)a3;
- (void)setIsShowAppsBehindSiriEnabled:(BOOL)a3;
- (void)setIsTypeToSiriEnabled:(BOOL)a3;
- (void)setIsVoiceOverEnabled:(BOOL)a3;
- (void)setSiriPauseTimeState:(int)a3;
- (void)setSiriSpeechRate:(double)a3;
- (void)setVoiceFeedback:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDiOSAccessibilityProperties

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isAtypicalSpeechEnabled
{
  return self->_isAtypicalSpeechEnabled;
}

- (int)voiceFeedback
{
  return self->_voiceFeedback;
}

- (BOOL)isTypeToSiriEnabled
{
  return self->_isTypeToSiriEnabled;
}

- (BOOL)isVoiceOverEnabled
{
  return self->_isVoiceOverEnabled;
}

- (double)siriSpeechRate
{
  return self->_siriSpeechRate;
}

- (BOOL)isShowAppsBehindSiriEnabled
{
  return self->_isShowAppsBehindSiriEnabled;
}

- (int)siriPauseTimeState
{
  return self->_siriPauseTimeState;
}

- (BOOL)isAlwaysListenForHeySiriEnabled
{
  return self->_isAlwaysListenForHeySiriEnabled;
}

- (ODDSiriSchemaODDiOSAccessibilityProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDiOSAccessibilityProperties;
  v5 = [(ODDSiriSchemaODDiOSAccessibilityProperties *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAlwaysListenForHeySiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsAlwaysListenForHeySiriEnabled:](v5, "setIsAlwaysListenForHeySiriEnabled:", [v6 BOOLValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"siriPauseTimeState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAccessibilityProperties setSiriPauseTimeState:](v5, "setSiriPauseTimeState:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isShowAppsBehindSiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsShowAppsBehindSiriEnabled:](v5, "setIsShowAppsBehindSiriEnabled:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"siriSpeechRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[ODDSiriSchemaODDiOSAccessibilityProperties setSiriSpeechRate:](v5, "setSiriSpeechRate:");
    }
    v10 = [v4 objectForKeyedSubscript:@"isVoiceOverEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsVoiceOverEnabled:](v5, "setIsVoiceOverEnabled:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isTypeToSiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsTypeToSiriEnabled:](v5, "setIsTypeToSiriEnabled:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"voiceFeedback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAccessibilityProperties setVoiceFeedback:](v5, "setVoiceFeedback:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"isAtypicalSpeechEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAccessibilityProperties setIsAtypicalSpeechEnabled:](v5, "setIsAtypicalSpeechEnabled:", [v13 BOOLValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDiOSAccessibilityProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDiOSAccessibilityProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDiOSAccessibilityProperties *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if (v4)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isAlwaysListenForHeySiriEnabled](self, "isAlwaysListenForHeySiriEnabled"));
    [v3 setObject:v5 forKeyedSubscript:@"isAlwaysListenForHeySiriEnabled"];

    char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isAtypicalSpeechEnabled + 1) & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isAtypicalSpeechEnabled](self, "isAtypicalSpeechEnabled"));
  [v3 setObject:v6 forKeyedSubscript:@"isAtypicalSpeechEnabled"];

  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isShowAppsBehindSiriEnabled](self, "isShowAppsBehindSiriEnabled"));
  [v3 setObject:v7 forKeyedSubscript:@"isShowAppsBehindSiriEnabled"];

  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isTypeToSiriEnabled](self, "isTypeToSiriEnabled"));
  [v3 setObject:v8 forKeyedSubscript:@"isTypeToSiriEnabled"];

  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDiOSAccessibilityProperties isVoiceOverEnabled](self, "isVoiceOverEnabled"));
  [v3 setObject:v9 forKeyedSubscript:@"isVoiceOverEnabled"];

  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
LABEL_19:
    v12 = NSNumber;
    [(ODDSiriSchemaODDiOSAccessibilityProperties *)self siriSpeechRate];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:@"siriSpeechRate"];

    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 0x40) == 0) {
      goto LABEL_24;
    }
LABEL_20:
    unsigned int v14 = [(ODDSiriSchemaODDiOSAccessibilityProperties *)self voiceFeedback] - 1;
    if (v14 > 5) {
      v15 = @"VOICEFEEDBACK_UNKNOWN";
    }
    else {
      v15 = off_1E5EBDB00[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"voiceFeedback"];
    goto LABEL_24;
  }
LABEL_15:
  unsigned int v10 = [(ODDSiriSchemaODDiOSAccessibilityProperties *)self siriPauseTimeState] - 1;
  if (v10 > 2) {
    v11 = @"SIRIPAUSETIMESTATE_UNKNOWN";
  }
  else {
    v11 = off_1E5EBDAE8[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"siriPauseTimeState"];
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 8) != 0) {
    goto LABEL_19;
  }
LABEL_8:
  if ((v4 & 0x40) != 0) {
    goto LABEL_20;
  }
LABEL_24:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char v3 = *(&self->_isAtypicalSpeechEnabled + 1);
  if (v3)
  {
    uint64_t v4 = 2654435761 * self->_isAlwaysListenForHeySiriEnabled;
    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_siriPauseTimeState;
      if ((*(&self->_isAtypicalSpeechEnabled + 1) & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if ((*(&self->_isAtypicalSpeechEnabled + 1) & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(&self->_isAtypicalSpeechEnabled + 1) & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isShowAppsBehindSiriEnabled;
  if ((*(&self->_isAtypicalSpeechEnabled + 1) & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double siriSpeechRate = self->_siriSpeechRate;
  double v8 = -siriSpeechRate;
  if (siriSpeechRate >= 0.0) {
    double v8 = self->_siriSpeechRate;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((v3 & 0x10) != 0)
  {
    uint64_t v12 = 2654435761 * self->_isVoiceOverEnabled;
    if ((v3 & 0x20) != 0)
    {
LABEL_17:
      uint64_t v13 = 2654435761 * self->_isTypeToSiriEnabled;
      if ((v3 & 0x40) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v14 = 0;
      if (v3 < 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v15 = 0;
      return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((v3 & 0x20) != 0) {
      goto LABEL_17;
    }
  }
  uint64_t v13 = 0;
  if ((v3 & 0x40) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v14 = 2654435761 * self->_voiceFeedback;
  if ((v3 & 0x80) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_isAtypicalSpeechEnabled;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
  unsigned int v6 = v4[41];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (v5)
  {
    int isAlwaysListenForHeySiriEnabled = self->_isAlwaysListenForHeySiriEnabled;
    if (isAlwaysListenForHeySiriEnabled != [v4 isAlwaysListenForHeySiriEnabled]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    unsigned int v6 = v4[41];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v8)
  {
    int siriPauseTimeState = self->_siriPauseTimeState;
    if (siriPauseTimeState != [v4 siriPauseTimeState]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    unsigned int v6 = v4[41];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_34;
  }
  if (v10)
  {
    int isShowAppsBehindSiriEnabled = self->_isShowAppsBehindSiriEnabled;
    if (isShowAppsBehindSiriEnabled != [v4 isShowAppsBehindSiriEnabled]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    unsigned int v6 = v4[41];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_34;
  }
  if (v12)
  {
    double siriSpeechRate = self->_siriSpeechRate;
    [v4 siriSpeechRate];
    if (siriSpeechRate != v14) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    unsigned int v6 = v4[41];
  }
  int v15 = (v5 >> 4) & 1;
  if (v15 != ((v6 >> 4) & 1)) {
    goto LABEL_34;
  }
  if (v15)
  {
    int isVoiceOverEnabled = self->_isVoiceOverEnabled;
    if (isVoiceOverEnabled != [v4 isVoiceOverEnabled]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    unsigned int v6 = v4[41];
  }
  int v17 = (v5 >> 5) & 1;
  if (v17 != ((v6 >> 5) & 1)) {
    goto LABEL_34;
  }
  if (v17)
  {
    int isTypeToSiriEnabled = self->_isTypeToSiriEnabled;
    if (isTypeToSiriEnabled != [v4 isTypeToSiriEnabled]) {
      goto LABEL_34;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
    unsigned int v6 = v4[41];
  }
  int v19 = (v5 >> 6) & 1;
  if (v19 != ((v6 >> 6) & 1)) {
    goto LABEL_34;
  }
  if (v19)
  {
    int voiceFeedback = self->_voiceFeedback;
    if (voiceFeedback == [v4 voiceFeedback])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1);
      unsigned int v6 = v4[41];
      goto LABEL_30;
    }
LABEL_34:
    BOOL v22 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ v5) & 0x80) != 0) {
    goto LABEL_34;
  }
  if ((v5 & 0x80) != 0)
  {
    int isAtypicalSpeechEnabled = self->_isAtypicalSpeechEnabled;
    if (isAtypicalSpeechEnabled != [v4 isAtypicalSpeechEnabled]) {
      goto LABEL_34;
    }
  }
  BOOL v22 = 1;
LABEL_35:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(&self->_isAtypicalSpeechEnabled + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteInt32Field();
    if ((*(&self->_isAtypicalSpeechEnabled + 1) & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isAtypicalSpeechEnabled + 1);
  if ((v4 & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((v4 & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDiOSAccessibilityPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsAtypicalSpeechEnabled
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x80u;
}

- (void)setHasIsAtypicalSpeechEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAtypicalSpeechEnabled + 1) = v3 & 0x80 | *(&self->_isAtypicalSpeechEnabled + 1) & 0x7F;
}

- (BOOL)hasIsAtypicalSpeechEnabled
{
  return *((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 7;
}

- (void)setIsAtypicalSpeechEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x80u;
  self->_int isAtypicalSpeechEnabled = a3;
}

- (void)deleteVoiceFeedback
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x40u;
}

- (void)setHasVoiceFeedback:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xBF | v3;
}

- (BOOL)hasVoiceFeedback
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 6) & 1;
}

- (void)setVoiceFeedback:(int)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x40u;
  self->_int voiceFeedback = a3;
}

- (void)deleteIsTypeToSiriEnabled
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x20u;
}

- (void)setHasIsTypeToSiriEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xDF | v3;
}

- (BOOL)hasIsTypeToSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 5) & 1;
}

- (void)setIsTypeToSiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x20u;
  self->_int isTypeToSiriEnabled = a3;
}

- (void)deleteIsVoiceOverEnabled
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~0x10u;
}

- (void)setHasIsVoiceOverEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xEF | v3;
}

- (BOOL)hasIsVoiceOverEnabled
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 4) & 1;
}

- (void)setIsVoiceOverEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 0x10u;
  self->_int isVoiceOverEnabled = a3;
}

- (void)deleteSiriSpeechRate
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~8u;
}

- (void)setHasSiriSpeechRate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xF7 | v3;
}

- (BOOL)hasSiriSpeechRate
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 3) & 1;
}

- (void)setSiriSpeechRate:(double)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 8u;
  self->_double siriSpeechRate = a3;
}

- (void)deleteIsShowAppsBehindSiriEnabled
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~4u;
}

- (void)setHasIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xFB | v3;
}

- (BOOL)hasIsShowAppsBehindSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 2) & 1;
}

- (void)setIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 4u;
  self->_int isShowAppsBehindSiriEnabled = a3;
}

- (void)deleteSiriPauseTimeState
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~2u;
}

- (void)setHasSiriPauseTimeState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasSiriPauseTimeState
{
  return (*((unsigned __int8 *)&self->_isAtypicalSpeechEnabled + 1) >> 1) & 1;
}

- (void)setSiriPauseTimeState:(int)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 2u;
  self->_int siriPauseTimeState = a3;
}

- (void)deleteIsAlwaysListenForHeySiriEnabled
{
  *(&self->_isAtypicalSpeechEnabled + 1) &= ~1u;
}

- (void)setHasIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) = *(&self->_isAtypicalSpeechEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsAlwaysListenForHeySiriEnabled
{
  return *(&self->_isAtypicalSpeechEnabled + 1);
}

- (void)setIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  *(&self->_isAtypicalSpeechEnabled + 1) |= 1u;
  self->_int isAlwaysListenForHeySiriEnabled = a3;
}

@end