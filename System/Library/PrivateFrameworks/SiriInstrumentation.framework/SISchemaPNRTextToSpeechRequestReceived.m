@interface SISchemaPNRTextToSpeechRequestReceived
- (BOOL)hasIsSynthesisCached;
- (BOOL)hasIsWarmStart;
- (BOOL)hasSourceOfTTS;
- (BOOL)hasSpeechError;
- (BOOL)hasVoiceAssetKey;
- (BOOL)hasVoiceResourceAssetKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSynthesisCached;
- (BOOL)isWarmStart;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)voiceAssetKey;
- (NSString)voiceResourceAssetKey;
- (SISchemaPNRTextToSpeechRequestReceived)initWithDictionary:(id)a3;
- (SISchemaPNRTextToSpeechRequestReceived)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)sourceOfTTS;
- (int)speechError;
- (unint64_t)hash;
- (void)deleteIsSynthesisCached;
- (void)deleteIsWarmStart;
- (void)deleteSourceOfTTS;
- (void)deleteSpeechError;
- (void)deleteVoiceAssetKey;
- (void)deleteVoiceResourceAssetKey;
- (void)setHasIsSynthesisCached:(BOOL)a3;
- (void)setHasIsWarmStart:(BOOL)a3;
- (void)setHasSourceOfTTS:(BOOL)a3;
- (void)setHasSpeechError:(BOOL)a3;
- (void)setHasVoiceAssetKey:(BOOL)a3;
- (void)setHasVoiceResourceAssetKey:(BOOL)a3;
- (void)setIsSynthesisCached:(BOOL)a3;
- (void)setIsWarmStart:(BOOL)a3;
- (void)setSourceOfTTS:(int)a3;
- (void)setSpeechError:(int)a3;
- (void)setVoiceAssetKey:(id)a3;
- (void)setVoiceResourceAssetKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaPNRTextToSpeechRequestReceived

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceResourceAssetKey, 0);
  objc_storeStrong((id *)&self->_voiceAssetKey, 0);
}

- (void)setHasVoiceResourceAssetKey:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasVoiceAssetKey:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)speechError
{
  return self->_speechError;
}

- (int)sourceOfTTS
{
  return self->_sourceOfTTS;
}

- (BOOL)isSynthesisCached
{
  return self->_isSynthesisCached;
}

- (BOOL)isWarmStart
{
  return self->_isWarmStart;
}

- (void)setVoiceResourceAssetKey:(id)a3
{
}

- (NSString)voiceResourceAssetKey
{
  return self->_voiceResourceAssetKey;
}

- (void)setVoiceAssetKey:(id)a3
{
}

- (NSString)voiceAssetKey
{
  return self->_voiceAssetKey;
}

- (SISchemaPNRTextToSpeechRequestReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaPNRTextToSpeechRequestReceived;
  v5 = [(SISchemaPNRTextToSpeechRequestReceived *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceAssetKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaPNRTextToSpeechRequestReceived *)v5 setVoiceAssetKey:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"voiceResourceAssetKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaPNRTextToSpeechRequestReceived *)v5 setVoiceResourceAssetKey:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isWarmStart"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPNRTextToSpeechRequestReceived setIsWarmStart:](v5, "setIsWarmStart:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isSynthesisCached"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPNRTextToSpeechRequestReceived setIsSynthesisCached:](v5, "setIsSynthesisCached:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"sourceOfTTS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPNRTextToSpeechRequestReceived setSourceOfTTS:](v5, "setSourceOfTTS:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"speechError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPNRTextToSpeechRequestReceived setSpeechError:](v5, "setSpeechError:", [v13 intValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (SISchemaPNRTextToSpeechRequestReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaPNRTextToSpeechRequestReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaPNRTextToSpeechRequestReceived *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaPNRTextToSpeechRequestReceived isSynthesisCached](self, "isSynthesisCached"));
    [v3 setObject:v5 forKeyedSubscript:@"isSynthesisCached"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaPNRTextToSpeechRequestReceived isWarmStart](self, "isWarmStart"));
  [v3 setObject:v6 forKeyedSubscript:@"isWarmStart"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_8:
  unsigned int v7 = [(SISchemaPNRTextToSpeechRequestReceived *)self sourceOfTTS] - 1;
  if (v7 > 4) {
    v8 = @"PNRSOURCEOFTTS_UNKNOWN_SOURCE_OF_TTS";
  }
  else {
    v8 = off_1E5EB8188[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"sourceOfTTS"];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    unsigned int v9 = [(SISchemaPNRTextToSpeechRequestReceived *)self speechError] - 1;
    if (v9 > 0xF) {
      v10 = @"PNRSPEECHERROR_UNKNOWN_SPEECH_ERROR";
    }
    else {
      v10 = off_1E5EB81B0[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"speechError"];
  }
LABEL_16:
  if (self->_voiceAssetKey)
  {
    v11 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceAssetKey];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"voiceAssetKey"];
  }
  if (self->_voiceResourceAssetKey)
  {
    v13 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceResourceAssetKey];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"voiceResourceAssetKey"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_voiceAssetKey hash];
  NSUInteger v4 = [(NSString *)self->_voiceResourceAssetKey hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_isWarmStart;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_isSynthesisCached;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_sourceOfTTS;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v8 = 2654435761 * self->_speechError;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceAssetKey];
  uint64_t v6 = [v4 voiceAssetKey];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceAssetKey];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unsigned int v9 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceAssetKey];
    v10 = [v4 voiceAssetKey];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceResourceAssetKey];
  uint64_t v6 = [v4 voiceResourceAssetKey];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceResourceAssetKey];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceResourceAssetKey];
    v15 = [v4 voiceResourceAssetKey];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $43E87A8505A4D46BEA580963216D60C1 has = self->_has;
  unsigned int v20 = v4[36];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int isWarmStart = self->_isWarmStart;
      if (isWarmStart != [v4 isWarmStart]) {
        goto LABEL_12;
      }
      $43E87A8505A4D46BEA580963216D60C1 has = self->_has;
      unsigned int v20 = v4[36];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        int isSynthesisCached = self->_isSynthesisCached;
        if (isSynthesisCached != [v4 isSynthesisCached]) {
          goto LABEL_12;
        }
        $43E87A8505A4D46BEA580963216D60C1 has = self->_has;
        unsigned int v20 = v4[36];
      }
      int v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (v24)
        {
          int sourceOfTTS = self->_sourceOfTTS;
          if (sourceOfTTS != [v4 sourceOfTTS]) {
            goto LABEL_12;
          }
          $43E87A8505A4D46BEA580963216D60C1 has = self->_has;
          unsigned int v20 = v4[36];
        }
        int v26 = (*(unsigned int *)&has >> 3) & 1;
        if (v26 == ((v20 >> 3) & 1))
        {
          if (!v26 || (int speechError = self->_speechError, speechError == [v4 speechError]))
          {
            BOOL v17 = 1;
            goto LABEL_13;
          }
        }
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceAssetKey];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(SISchemaPNRTextToSpeechRequestReceived *)self voiceResourceAssetKey];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  uint64_t v7 = v8;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_10:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPNRTextToSpeechRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSpeechError
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSpeechError:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSpeechError
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSpeechError:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int speechError = a3;
}

- (void)deleteSourceOfTTS
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSourceOfTTS:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSourceOfTTS
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSourceOfTTS:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int sourceOfTTS = a3;
}

- (void)deleteIsSynthesisCached
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsSynthesisCached:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsSynthesisCached
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsSynthesisCached:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isSynthesisCached = a3;
}

- (void)deleteIsWarmStart
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsWarmStart:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsWarmStart
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsWarmStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isWarmStart = a3;
}

- (void)deleteVoiceResourceAssetKey
{
}

- (BOOL)hasVoiceResourceAssetKey
{
  return self->_voiceResourceAssetKey != 0;
}

- (void)deleteVoiceAssetKey
{
}

- (BOOL)hasVoiceAssetKey
{
  return self->_voiceAssetKey != 0;
}

@end