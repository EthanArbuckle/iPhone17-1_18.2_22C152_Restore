@interface TTSSchemaTTSSynthesisEnded
- (BOOL)hasPromptCount;
- (BOOL)hasSynthesisLatencyInSecond;
- (BOOL)hasSynthesisRealTimeFactor;
- (BOOL)hasSynthesizedAudioDurationInSecond;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)errorCodes;
- (NSData)jsonData;
- (TTSSchemaTTSSynthesisEnded)initWithDictionary:(id)a3;
- (TTSSchemaTTSSynthesisEnded)initWithJSON:(id)a3;
- (float)synthesisLatencyInSecond;
- (float)synthesisRealTimeFactor;
- (float)synthesizedAudioDurationInSecond;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCodesAtIndex:(unint64_t)a3;
- (unint64_t)errorCodesCount;
- (unint64_t)hash;
- (unsigned)promptCount;
- (void)addErrorCodes:(int)a3;
- (void)clearErrorCodes;
- (void)deletePromptCount;
- (void)deleteSynthesisLatencyInSecond;
- (void)deleteSynthesisRealTimeFactor;
- (void)deleteSynthesizedAudioDurationInSecond;
- (void)setErrorCodes:(id)a3;
- (void)setHasPromptCount:(BOOL)a3;
- (void)setHasSynthesisLatencyInSecond:(BOOL)a3;
- (void)setHasSynthesisRealTimeFactor:(BOOL)a3;
- (void)setHasSynthesizedAudioDurationInSecond:(BOOL)a3;
- (void)setPromptCount:(unsigned int)a3;
- (void)setSynthesisLatencyInSecond:(float)a3;
- (void)setSynthesisRealTimeFactor:(float)a3;
- (void)setSynthesizedAudioDurationInSecond:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSSynthesisEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setErrorCodes:(id)a3
{
}

- (NSArray)errorCodes
{
  return self->_errorCodes;
}

- (unsigned)promptCount
{
  return self->_promptCount;
}

- (float)synthesisRealTimeFactor
{
  return self->_synthesisRealTimeFactor;
}

- (float)synthesisLatencyInSecond
{
  return self->_synthesisLatencyInSecond;
}

- (float)synthesizedAudioDurationInSecond
{
  return self->_synthesizedAudioDurationInSecond;
}

- (TTSSchemaTTSSynthesisEnded)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TTSSchemaTTSSynthesisEnded;
  v5 = [(TTSSchemaTTSSynthesisEnded *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"synthesizedAudioDurationInSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[TTSSchemaTTSSynthesisEnded setSynthesizedAudioDurationInSecond:](v5, "setSynthesizedAudioDurationInSecond:");
    }
    v7 = [v4 objectForKeyedSubscript:@"synthesisLatencyInSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[TTSSchemaTTSSynthesisEnded setSynthesisLatencyInSecond:](v5, "setSynthesisLatencyInSecond:");
    }
    v8 = [v4 objectForKeyedSubscript:@"synthesisRealTimeFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[TTSSchemaTTSSynthesisEnded setSynthesisRealTimeFactor:](v5, "setSynthesisRealTimeFactor:");
    }
    v9 = [v4 objectForKeyedSubscript:@"promptCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSynthesisEnded setPromptCount:](v5, "setPromptCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"errorCodes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v8;
      v20 = v7;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[TTSSchemaTTSSynthesisEnded addErrorCodes:](v5, "addErrorCodes:", [v16 intValue]);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v7 = v20;
      v6 = v21;
      v8 = v19;
    }
    v17 = v5;
  }
  return v5;
}

- (TTSSchemaTTSSynthesisEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSSynthesisEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSSynthesisEnded *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_errorCodes count])
  {
    id v4 = [(TTSSchemaTTSSynthesisEnded *)self errorCodes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorCodes"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TTSSchemaTTSSynthesisEnded promptCount](self, "promptCount"));
    [v3 setObject:v10 forKeyedSubscript:@"promptCount"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  id v11 = NSNumber;
  [(TTSSchemaTTSSynthesisEnded *)self synthesisLatencyInSecond];
  uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"synthesisLatencyInSecond"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  uint64_t v13 = NSNumber;
  [(TTSSchemaTTSSynthesisEnded *)self synthesisRealTimeFactor];
  uint64_t v14 = objc_msgSend(v13, "numberWithFloat:");
  [v3 setObject:v14 forKeyedSubscript:@"synthesisRealTimeFactor"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    uint64_t v7 = NSNumber;
    [(TTSSchemaTTSSynthesisEnded *)self synthesizedAudioDurationInSecond];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"synthesizedAudioDurationInSecond"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float synthesizedAudioDurationInSecond = self->_synthesizedAudioDurationInSecond;
    double v6 = synthesizedAudioDurationInSecond;
    if (synthesizedAudioDurationInSecond < 0.0) {
      double v6 = -synthesizedAudioDurationInSecond;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    float synthesisLatencyInSecond = self->_synthesisLatencyInSecond;
    double v11 = synthesisLatencyInSecond;
    if (synthesisLatencyInSecond < 0.0) {
      double v11 = -synthesisLatencyInSecond;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0)
  {
    float synthesisRealTimeFactor = self->_synthesisRealTimeFactor;
    double v16 = synthesisRealTimeFactor;
    if (synthesisRealTimeFactor < 0.0) {
      double v16 = -synthesisRealTimeFactor;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 8) != 0) {
    uint64_t v19 = 2654435761 * self->_promptCount;
  }
  else {
    uint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ [(NSArray *)self->_errorCodes hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $58A08CFA63DED5337BD285FEFC45991A has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    float synthesizedAudioDurationInSecond = self->_synthesizedAudioDurationInSecond;
    [v4 synthesizedAudioDurationInSecond];
    if (synthesizedAudioDurationInSecond != v8) {
      goto LABEL_22;
    }
    $58A08CFA63DED5337BD285FEFC45991A has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      float synthesisLatencyInSecond = self->_synthesisLatencyInSecond;
      [v4 synthesisLatencyInSecond];
      if (synthesisLatencyInSecond != v11) {
        goto LABEL_22;
      }
      $58A08CFA63DED5337BD285FEFC45991A has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        float synthesisRealTimeFactor = self->_synthesisRealTimeFactor;
        [v4 synthesisRealTimeFactor];
        if (synthesisRealTimeFactor != v14) {
          goto LABEL_22;
        }
        $58A08CFA63DED5337BD285FEFC45991A has = self->_has;
        unsigned int v6 = v4[32];
      }
      int v15 = (*(unsigned int *)&has >> 3) & 1;
      if (v15 == ((v6 >> 3) & 1))
      {
        if (!v15 || (unsigned int promptCount = self->_promptCount, promptCount == [v4 promptCount]))
        {
          long double v17 = [(TTSSchemaTTSSynthesisEnded *)self errorCodes];
          double v18 = [v4 errorCodes];
          uint64_t v19 = v18;
          if ((v17 == 0) != (v18 != 0))
          {
            uint64_t v20 = [(TTSSchemaTTSSynthesisEnded *)self errorCodes];
            if (!v20)
            {

LABEL_25:
              BOOL v25 = 1;
              goto LABEL_23;
            }
            v21 = (void *)v20;
            long long v22 = [(TTSSchemaTTSSynthesisEnded *)self errorCodes];
            long long v23 = [v4 errorCodes];
            char v24 = [v22 isEqual:v23];

            if (v24) {
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
      }
    }
  }
LABEL_22:
  BOOL v25 = 0;
LABEL_23:

  return v25;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_errorCodes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "intValue", (void)v11);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSSynthesisEndedReadFrom(self, (uint64_t)a3, v3);
}

- (int)errorCodesAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_errorCodes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)errorCodesCount
{
  return [(NSArray *)self->_errorCodes count];
}

- (void)addErrorCodes:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  errorCodes = self->_errorCodes;
  if (!errorCodes)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_errorCodes;
    self->_errorCodes = v6;

    errorCodes = self->_errorCodes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)errorCodes addObject:v8];
}

- (void)clearErrorCodes
{
}

- (void)deletePromptCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasPromptCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPromptCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPromptCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int promptCount = a3;
}

- (void)deleteSynthesisRealTimeFactor
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSynthesisRealTimeFactor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSynthesisRealTimeFactor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSynthesisRealTimeFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float synthesisRealTimeFactor = a3;
}

- (void)deleteSynthesisLatencyInSecond
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSynthesisLatencyInSecond:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSynthesisLatencyInSecond
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSynthesisLatencyInSecond:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float synthesisLatencyInSecond = a3;
}

- (void)deleteSynthesizedAudioDurationInSecond
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSynthesizedAudioDurationInSecond:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSynthesizedAudioDurationInSecond
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSynthesizedAudioDurationInSecond:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float synthesizedAudioDurationInSecond = a3;
}

@end