@interface MHSchemaMHSpeakerFalseTriggerMitigated
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)hasModelVersion;
- (BOOL)hasProcessedAudioDurationInNs;
- (BOOL)hasSpeakerMatchScore;
- (BOOL)hasThresholdScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHSpeakerFalseTriggerMitigated)initWithDictionary:(id)a3;
- (MHSchemaMHSpeakerFalseTriggerMitigated)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)errorMessage;
- (NSString)modelVersion;
- (double)processedAudioDurationInNs;
- (float)speakerMatchScore;
- (float)thresholdScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)errorCode;
- (void)deleteErrorCode;
- (void)deleteErrorMessage;
- (void)deleteModelVersion;
- (void)deleteProcessedAudioDurationInNs;
- (void)deleteSpeakerMatchScore;
- (void)deleteThresholdScore;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorMessage:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasProcessedAudioDurationInNs:(BOOL)a3;
- (void)setHasSpeakerMatchScore:(BOOL)a3;
- (void)setHasThresholdScore:(BOOL)a3;
- (void)setModelVersion:(id)a3;
- (void)setProcessedAudioDurationInNs:(double)a3;
- (void)setSpeakerMatchScore:(float)a3;
- (void)setThresholdScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHSpeakerFalseTriggerMitigated

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (double)processedAudioDurationInNs
{
  return self->_processedAudioDurationInNs;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (float)thresholdScore
{
  return self->_thresholdScore;
}

- (float)speakerMatchScore
{
  return self->_speakerMatchScore;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (MHSchemaMHSpeakerFalseTriggerMitigated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHSpeakerFalseTriggerMitigated;
  v5 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHSpeakerFalseTriggerMitigated *)v5 setModelVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"speakerMatchScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaMHSpeakerFalseTriggerMitigated setSpeakerMatchScore:](v5, "setSpeakerMatchScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"thresholdScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHSpeakerFalseTriggerMitigated setThresholdScore:](v5, "setThresholdScore:");
    }
    v10 = [v4 objectForKeyedSubscript:@"errorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(MHSchemaMHSpeakerFalseTriggerMitigated *)v5 setErrorMessage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"processedAudioDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[MHSchemaMHSpeakerFalseTriggerMitigated setProcessedAudioDurationInNs:](v5, "setProcessedAudioDurationInNs:");
    }
    v13 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHSpeakerFalseTriggerMitigated setErrorCode:](v5, "setErrorCode:", [v13 unsignedIntValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (MHSchemaMHSpeakerFalseTriggerMitigated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHSpeakerFalseTriggerMitigated errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorMessage)
  {
    v5 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self errorMessage];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorMessage"];
  }
  if (self->_modelVersion)
  {
    uint64_t v7 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self modelVersion];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v13 = NSNumber;
    [(MHSchemaMHSpeakerFalseTriggerMitigated *)self processedAudioDurationInNs];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"processedAudioDurationInNs"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v15 = NSNumber;
  [(MHSchemaMHSpeakerFalseTriggerMitigated *)self speakerMatchScore];
  objc_super v16 = objc_msgSend(v15, "numberWithFloat:");
  [v3 setObject:v16 forKeyedSubscript:@"speakerMatchScore"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    v10 = NSNumber;
    [(MHSchemaMHSpeakerFalseTriggerMitigated *)self thresholdScore];
    v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"thresholdScore"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelVersion hash];
  char has = (char)self->_has;
  if (has)
  {
    float speakerMatchScore = self->_speakerMatchScore;
    double v7 = speakerMatchScore;
    if (speakerMatchScore < 0.0) {
      double v7 = -speakerMatchScore;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    float thresholdScore = self->_thresholdScore;
    double v12 = thresholdScore;
    if (thresholdScore < 0.0) {
      double v12 = -thresholdScore;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_errorMessage hash];
  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    double processedAudioDurationInNs = self->_processedAudioDurationInNs;
    double v19 = -processedAudioDurationInNs;
    if (processedAudioDurationInNs >= 0.0) {
      double v19 = self->_processedAudioDurationInNs;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((v16 & 8) != 0) {
    uint64_t v22 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v22 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v17 ^ v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  unint64_t v5 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self modelVersion];
  v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self modelVersion];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self modelVersion];
    unint64_t v10 = [v4 modelVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $0E38E0F15C5ADC9421536E219AD28210 has = self->_has;
  unsigned int v13 = v4[44];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    float speakerMatchScore = self->_speakerMatchScore;
    [v4 speakerMatchScore];
    if (speakerMatchScore != v15) {
      goto LABEL_19;
    }
    $0E38E0F15C5ADC9421536E219AD28210 has = self->_has;
    unsigned int v13 = v4[44];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v16)
  {
    float thresholdScore = self->_thresholdScore;
    [v4 thresholdScore];
    if (thresholdScore != v18) {
      goto LABEL_19;
    }
  }
  unint64_t v5 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self errorMessage];
  v6 = [v4 errorMessage];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v19 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self errorMessage];
  if (v19)
  {
    long double v20 = (void *)v19;
    double v21 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self errorMessage];
    uint64_t v22 = [v4 errorMessage];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $0E38E0F15C5ADC9421536E219AD28210 v26 = self->_has;
  int v27 = (*(unsigned int *)&v26 >> 2) & 1;
  unsigned int v28 = v4[44];
  if (v27 == ((v28 >> 2) & 1))
  {
    if (v27)
    {
      double processedAudioDurationInNs = self->_processedAudioDurationInNs;
      [v4 processedAudioDurationInNs];
      if (processedAudioDurationInNs != v30) {
        goto LABEL_19;
      }
      $0E38E0F15C5ADC9421536E219AD28210 v26 = self->_has;
      unsigned int v28 = v4[44];
    }
    int v31 = (*(unsigned int *)&v26 >> 3) & 1;
    if (v31 == ((v28 >> 3) & 1))
    {
      if (!v31 || (unsigned int errorCode = self->_errorCode, errorCode == [v4 errorCode]))
      {
        BOOL v24 = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  BOOL v24 = 0;
LABEL_20:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self modelVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  v6 = [(MHSchemaMHSpeakerFalseTriggerMitigated *)self errorMessage];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char v7 = (char)self->_has;
  long double v8 = v9;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    long double v8 = v9;
    char v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    long double v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHSpeakerFalseTriggerMitigatedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int errorCode = a3;
}

- (void)deleteProcessedAudioDurationInNs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasProcessedAudioDurationInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProcessedAudioDurationInNs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProcessedAudioDurationInNs:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double processedAudioDurationInNs = a3;
}

- (void)deleteErrorMessage
{
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteThresholdScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasThresholdScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasThresholdScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setThresholdScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float thresholdScore = a3;
}

- (void)deleteSpeakerMatchScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSpeakerMatchScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSpeakerMatchScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSpeakerMatchScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float speakerMatchScore = a3;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

@end