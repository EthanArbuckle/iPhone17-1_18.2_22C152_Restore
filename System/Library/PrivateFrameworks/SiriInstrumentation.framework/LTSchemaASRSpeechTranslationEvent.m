@interface LTSchemaASRSpeechTranslationEvent
- (BOOL)hasLatencyFinalResultMs;
- (BOOL)hasNumAudioPacket;
- (BOOL)hasRequestID;
- (BOOL)hasSelectedLocale;
- (BOOL)hasTimeToFinalResultMs;
- (BOOL)hasTimeToFirstPartialMs;
- (BOOL)hasTimeToReceiveFirstAudioPacket;
- (BOOL)hasTimeToSendFinishAudio;
- (BOOL)hasTimeToSendFirstAudioPacket;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaASRSpeechTranslationEvent)initWithDictionary:(id)a3;
- (LTSchemaASRSpeechTranslationEvent)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)requestID;
- (NSString)selectedLocale;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)latencyFinalResultMs;
- (unsigned)numAudioPacket;
- (unsigned)timeToFinalResultMs;
- (unsigned)timeToFirstPartialMs;
- (unsigned)timeToReceiveFirstAudioPacket;
- (unsigned)timeToSendFinishAudio;
- (unsigned)timeToSendFirstAudioPacket;
- (void)deleteLatencyFinalResultMs;
- (void)deleteNumAudioPacket;
- (void)deleteRequestID;
- (void)deleteSelectedLocale;
- (void)deleteTimeToFinalResultMs;
- (void)deleteTimeToFirstPartialMs;
- (void)deleteTimeToReceiveFirstAudioPacket;
- (void)deleteTimeToSendFinishAudio;
- (void)deleteTimeToSendFirstAudioPacket;
- (void)setHasLatencyFinalResultMs:(BOOL)a3;
- (void)setHasNumAudioPacket:(BOOL)a3;
- (void)setHasRequestID:(BOOL)a3;
- (void)setHasSelectedLocale:(BOOL)a3;
- (void)setHasTimeToFinalResultMs:(BOOL)a3;
- (void)setHasTimeToFirstPartialMs:(BOOL)a3;
- (void)setHasTimeToReceiveFirstAudioPacket:(BOOL)a3;
- (void)setHasTimeToSendFinishAudio:(BOOL)a3;
- (void)setHasTimeToSendFirstAudioPacket:(BOOL)a3;
- (void)setLatencyFinalResultMs:(unsigned int)a3;
- (void)setNumAudioPacket:(unsigned int)a3;
- (void)setRequestID:(id)a3;
- (void)setSelectedLocale:(id)a3;
- (void)setTimeToFinalResultMs:(unsigned int)a3;
- (void)setTimeToFirstPartialMs:(unsigned int)a3;
- (void)setTimeToReceiveFirstAudioPacket:(unsigned int)a3;
- (void)setTimeToSendFinishAudio:(unsigned int)a3;
- (void)setTimeToSendFirstAudioPacket:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaASRSpeechTranslationEvent

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)setHasSelectedLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)timeToSendFinishAudio
{
  return self->_timeToSendFinishAudio;
}

- (unsigned)numAudioPacket
{
  return self->_numAudioPacket;
}

- (unsigned)timeToReceiveFirstAudioPacket
{
  return self->_timeToReceiveFirstAudioPacket;
}

- (unsigned)timeToSendFirstAudioPacket
{
  return self->_timeToSendFirstAudioPacket;
}

- (unsigned)latencyFinalResultMs
{
  return self->_latencyFinalResultMs;
}

- (unsigned)timeToFinalResultMs
{
  return self->_timeToFinalResultMs;
}

- (unsigned)timeToFirstPartialMs
{
  return self->_timeToFirstPartialMs;
}

- (void)setSelectedLocale:(id)a3
{
}

- (NSString)selectedLocale
{
  return self->_selectedLocale;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (LTSchemaASRSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LTSchemaASRSpeechTranslationEvent;
  v5 = [(LTSchemaASRSpeechTranslationEvent *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaASRSpeechTranslationEvent *)v5 setRequestID:v7];
    }
    v20 = v6;
    v8 = [v4 objectForKeyedSubscript:@"selectedLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(LTSchemaASRSpeechTranslationEvent *)v5 setSelectedLocale:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"timeToFirstPartialMs", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaASRSpeechTranslationEvent setTimeToFirstPartialMs:](v5, "setTimeToFirstPartialMs:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"timeToFinalResultMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaASRSpeechTranslationEvent setTimeToFinalResultMs:](v5, "setTimeToFinalResultMs:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"latencyFinalResultMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaASRSpeechTranslationEvent setLatencyFinalResultMs:](v5, "setLatencyFinalResultMs:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"timeToSendFirstAudioPacket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaASRSpeechTranslationEvent setTimeToSendFirstAudioPacket:](v5, "setTimeToSendFirstAudioPacket:", [v13 unsignedIntValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"timeToReceiveFirstAudioPacket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaASRSpeechTranslationEvent setTimeToReceiveFirstAudioPacket:](v5, "setTimeToReceiveFirstAudioPacket:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"numAudioPacket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaASRSpeechTranslationEvent setNumAudioPacket:](v5, "setNumAudioPacket:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"timeToSendFinishAudio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaASRSpeechTranslationEvent setTimeToSendFinishAudio:](v5, "setTimeToSendFinishAudio:", [v16 unsignedIntValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (LTSchemaASRSpeechTranslationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaASRSpeechTranslationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaASRSpeechTranslationEvent *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent latencyFinalResultMs](self, "latencyFinalResultMs"));
    [v3 setObject:v5 forKeyedSubscript:@"latencyFinalResultMs"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent numAudioPacket](self, "numAudioPacket"));
    [v3 setObject:v6 forKeyedSubscript:@"numAudioPacket"];
  }
  if (self->_requestID)
  {
    uint64_t v7 = [(LTSchemaASRSpeechTranslationEvent *)self requestID];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"requestID"];
  }
  if (self->_selectedLocale)
  {
    v9 = [(LTSchemaASRSpeechTranslationEvent *)self selectedLocale];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"selectedLocale"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToFinalResultMs](self, "timeToFinalResultMs"));
    [v3 setObject:v14 forKeyedSubscript:@"timeToFinalResultMs"];

    char v11 = (char)self->_has;
    if ((v11 & 1) == 0)
    {
LABEL_11:
      if ((v11 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToFirstPartialMs](self, "timeToFirstPartialMs"));
  [v3 setObject:v15 forKeyedSubscript:@"timeToFirstPartialMs"];

  char v11 = (char)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_12:
    if ((v11 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToReceiveFirstAudioPacket](self, "timeToReceiveFirstAudioPacket"));
  [v3 setObject:v16 forKeyedSubscript:@"timeToReceiveFirstAudioPacket"];

  char v11 = (char)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_13:
    if ((v11 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_21:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToSendFinishAudio](self, "timeToSendFinishAudio"));
  [v3 setObject:v17 forKeyedSubscript:@"timeToSendFinishAudio"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_14:
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaASRSpeechTranslationEvent timeToSendFirstAudioPacket](self, "timeToSendFirstAudioPacket"));
    [v3 setObject:v12 forKeyedSubscript:@"timeToSendFirstAudioPacket"];
  }
LABEL_15:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  NSUInteger v4 = [(NSString *)self->_selectedLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_timeToFirstPartialMs;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_timeToFinalResultMs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_latencyFinalResultMs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_timeToSendFirstAudioPacket;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_timeToReceiveFirstAudioPacket;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_13:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_numAudioPacket;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v11 = 2654435761 * self->_timeToSendFinishAudio;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(LTSchemaASRSpeechTranslationEvent *)self requestID];
  uint64_t v6 = [v4 requestID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(LTSchemaASRSpeechTranslationEvent *)self requestID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(LTSchemaASRSpeechTranslationEvent *)self requestID];
    uint64_t v10 = [v4 requestID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(LTSchemaASRSpeechTranslationEvent *)self selectedLocale];
  uint64_t v6 = [v4 selectedLocale];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(LTSchemaASRSpeechTranslationEvent *)self selectedLocale];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(LTSchemaASRSpeechTranslationEvent *)self selectedLocale];
    v15 = [v4 selectedLocale];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $87568BC8588BA6DDEF3071E9761E3E30 has = self->_has;
  unsigned int v20 = v4[52];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unsigned int timeToFirstPartialMs = self->_timeToFirstPartialMs;
      if (timeToFirstPartialMs != [v4 timeToFirstPartialMs]) {
        goto LABEL_12;
      }
      $87568BC8588BA6DDEF3071E9761E3E30 has = self->_has;
      unsigned int v20 = v4[52];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        unsigned int timeToFinalResultMs = self->_timeToFinalResultMs;
        if (timeToFinalResultMs != [v4 timeToFinalResultMs]) {
          goto LABEL_12;
        }
        $87568BC8588BA6DDEF3071E9761E3E30 has = self->_has;
        unsigned int v20 = v4[52];
      }
      int v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (v24)
        {
          unsigned int latencyFinalResultMs = self->_latencyFinalResultMs;
          if (latencyFinalResultMs != [v4 latencyFinalResultMs]) {
            goto LABEL_12;
          }
          $87568BC8588BA6DDEF3071E9761E3E30 has = self->_has;
          unsigned int v20 = v4[52];
        }
        int v26 = (*(unsigned int *)&has >> 3) & 1;
        if (v26 == ((v20 >> 3) & 1))
        {
          if (v26)
          {
            unsigned int timeToSendFirstAudioPacket = self->_timeToSendFirstAudioPacket;
            if (timeToSendFirstAudioPacket != [v4 timeToSendFirstAudioPacket]) {
              goto LABEL_12;
            }
            $87568BC8588BA6DDEF3071E9761E3E30 has = self->_has;
            unsigned int v20 = v4[52];
          }
          int v28 = (*(unsigned int *)&has >> 4) & 1;
          if (v28 == ((v20 >> 4) & 1))
          {
            if (v28)
            {
              unsigned int timeToReceiveFirstAudioPacket = self->_timeToReceiveFirstAudioPacket;
              if (timeToReceiveFirstAudioPacket != [v4 timeToReceiveFirstAudioPacket]) {
                goto LABEL_12;
              }
              $87568BC8588BA6DDEF3071E9761E3E30 has = self->_has;
              unsigned int v20 = v4[52];
            }
            int v30 = (*(unsigned int *)&has >> 5) & 1;
            if (v30 == ((v20 >> 5) & 1))
            {
              if (v30)
              {
                unsigned int numAudioPacket = self->_numAudioPacket;
                if (numAudioPacket != [v4 numAudioPacket]) {
                  goto LABEL_12;
                }
                $87568BC8588BA6DDEF3071E9761E3E30 has = self->_has;
                unsigned int v20 = v4[52];
              }
              int v32 = (*(unsigned int *)&has >> 6) & 1;
              if (v32 == ((v20 >> 6) & 1))
              {
                if (!v32
                  || (unsigned int timeToSendFinishAudio = self->_timeToSendFinishAudio,
                      timeToSendFinishAudio == [v4 timeToSendFinishAudio]))
                {
                  BOOL v17 = 1;
                  goto LABEL_13;
                }
              }
            }
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
  NSUInteger v4 = [(LTSchemaASRSpeechTranslationEvent *)self requestID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(LTSchemaASRSpeechTranslationEvent *)self selectedLocale];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  uint64_t v7 = v8;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaASRSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeToSendFinishAudio
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasTimeToSendFinishAudio:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimeToSendFinishAudio
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTimeToSendFinishAudio:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unsigned int timeToSendFinishAudio = a3;
}

- (void)deleteNumAudioPacket
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasNumAudioPacket:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumAudioPacket
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNumAudioPacket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int numAudioPacket = a3;
}

- (void)deleteTimeToReceiveFirstAudioPacket
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasTimeToReceiveFirstAudioPacket:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimeToReceiveFirstAudioPacket
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimeToReceiveFirstAudioPacket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int timeToReceiveFirstAudioPacket = a3;
}

- (void)deleteTimeToSendFirstAudioPacket
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTimeToSendFirstAudioPacket:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimeToSendFirstAudioPacket
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTimeToSendFirstAudioPacket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int timeToSendFirstAudioPacket = a3;
}

- (void)deleteLatencyFinalResultMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLatencyFinalResultMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatencyFinalResultMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLatencyFinalResultMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int latencyFinalResultMs = a3;
}

- (void)deleteTimeToFinalResultMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTimeToFinalResultMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeToFinalResultMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeToFinalResultMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int timeToFinalResultMs = a3;
}

- (void)deleteTimeToFirstPartialMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimeToFirstPartialMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeToFirstPartialMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeToFirstPartialMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int timeToFirstPartialMs = a3;
}

- (void)deleteSelectedLocale
{
}

- (BOOL)hasSelectedLocale
{
  return self->_selectedLocale != 0;
}

- (void)deleteRequestID
{
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

@end