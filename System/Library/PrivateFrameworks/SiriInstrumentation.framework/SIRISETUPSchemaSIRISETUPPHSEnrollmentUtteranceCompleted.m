@interface SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted
- (BOOL)hasEndSampleCount;
- (BOOL)hasHasSpeechDetected;
- (BOOL)hasPageNumber;
- (BOOL)hasPhraseId;
- (BOOL)hasSpeechDetected;
- (BOOL)hasStartSampleCount;
- (BOOL)hasTopScoreForUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)phraseId;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)initWithDictionary:(id)a3;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)initWithJSON:(id)a3;
- (float)topScoreForUtterance;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)endSampleCount;
- (unsigned)pageNumber;
- (unsigned)startSampleCount;
- (void)deleteEndSampleCount;
- (void)deleteHasSpeechDetected;
- (void)deletePageNumber;
- (void)deletePhraseId;
- (void)deleteStartSampleCount;
- (void)deleteTopScoreForUtterance;
- (void)setEndSampleCount:(unsigned int)a3;
- (void)setHasEndSampleCount:(BOOL)a3;
- (void)setHasHasSpeechDetected:(BOOL)a3;
- (void)setHasPageNumber:(BOOL)a3;
- (void)setHasPhraseId:(BOOL)a3;
- (void)setHasSpeechDetected:(BOOL)a3;
- (void)setHasStartSampleCount:(BOOL)a3;
- (void)setHasTopScoreForUtterance:(BOOL)a3;
- (void)setPageNumber:(unsigned int)a3;
- (void)setPhraseId:(id)a3;
- (void)setStartSampleCount:(unsigned int)a3;
- (void)setTopScoreForUtterance:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasPhraseId:(BOOL)a3
{
  *(&self->_hasSpeechDetected + 2) = a3;
}

- (BOOL)hasSpeechDetected
{
  return self->_hasSpeechDetected;
}

- (unsigned)endSampleCount
{
  return self->_endSampleCount;
}

- (unsigned)startSampleCount
{
  return self->_startSampleCount;
}

- (float)topScoreForUtterance
{
  return self->_topScoreForUtterance;
}

- (void)setPhraseId:(id)a3
{
}

- (NSString)phraseId
{
  return self->_phraseId;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted;
  v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pageNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setPageNumber:](v5, "setPageNumber:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"phraseId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)v5 setPhraseId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"topScoreForUtterance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setTopScoreForUtterance:](v5, "setTopScoreForUtterance:");
    }
    v10 = [v4 objectForKeyedSubscript:@"startSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setStartSampleCount:](v5, "setStartSampleCount:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"endSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setEndSampleCount:](v5, "setEndSampleCount:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"hasSpeechDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setHasSpeechDetected:](v5, "setHasSpeechDetected:", [v12 BOOLValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self dictionaryRepresentation];
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
  char v4 = *(&self->_hasSpeechDetected + 1);
  if ((v4 & 8) != 0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted endSampleCount](self, "endSampleCount"));
    [v3 setObject:v13 forKeyedSubscript:@"endSampleCount"];

    char v4 = *(&self->_hasSpeechDetected + 1);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_hasSpeechDetected + 1) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted hasSpeechDetected](self, "hasSpeechDetected"));
  [v3 setObject:v14 forKeyedSubscript:@"hasSpeechDetected"];

  if (*(&self->_hasSpeechDetected + 1))
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted pageNumber](self, "pageNumber"));
    [v3 setObject:v5 forKeyedSubscript:@"pageNumber"];
  }
LABEL_5:
  if (self->_phraseId)
  {
    v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self phraseId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"phraseId"];
  }
  char v8 = *(&self->_hasSpeechDetected + 1);
  if ((v8 & 4) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted startSampleCount](self, "startSampleCount"));
    [v3 setObject:v9 forKeyedSubscript:@"startSampleCount"];

    char v8 = *(&self->_hasSpeechDetected + 1);
  }
  if ((v8 & 2) != 0)
  {
    v10 = NSNumber;
    [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self topScoreForUtterance];
    v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"topScoreForUtterance"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasSpeechDetected + 1)) {
    uint64_t v3 = 2654435761 * self->_pageNumber;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_phraseId hash];
  char v5 = *(&self->_hasSpeechDetected + 1);
  if ((v5 & 2) != 0)
  {
    float topScoreForUtterance = self->_topScoreForUtterance;
    double v8 = topScoreForUtterance;
    if (topScoreForUtterance < 0.0) {
      double v8 = -topScoreForUtterance;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((v5 & 4) == 0)
  {
    uint64_t v11 = 0;
    if ((v5 & 8) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v12 = 0;
    if ((v5 & 0x10) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v11 = 2654435761 * self->_startSampleCount;
  if ((v5 & 8) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v12 = 2654435761 * self->_endSampleCount;
  if ((v5 & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v13 = 2654435761 * self->_hasSpeechDetected;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if (*(&self->_hasSpeechDetected + 1) != (v4[37] & 1)) {
    goto LABEL_27;
  }
  if (*(&self->_hasSpeechDetected + 1))
  {
    unsigned int pageNumber = self->_pageNumber;
    if (pageNumber != [v4 pageNumber]) {
      goto LABEL_27;
    }
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self phraseId];
  uint64_t v7 = [v4 phraseId];
  double v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_27;
  }
  uint64_t v9 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self phraseId];
  if (v9)
  {
    double v10 = (void *)v9;
    uint64_t v11 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self phraseId];
    uint64_t v12 = [v4 phraseId];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unsigned int v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
  int v15 = (v14 >> 1) & 1;
  unsigned int v16 = v4[37];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_27:
    BOOL v25 = 0;
    goto LABEL_28;
  }
  if (v15)
  {
    float topScoreForUtterance = self->_topScoreForUtterance;
    [v4 topScoreForUtterance];
    if (topScoreForUtterance != v18) {
      goto LABEL_27;
    }
    unsigned int v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
    unsigned int v16 = v4[37];
  }
  int v19 = (v14 >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v19)
  {
    unsigned int startSampleCount = self->_startSampleCount;
    if (startSampleCount != [v4 startSampleCount]) {
      goto LABEL_27;
    }
    unsigned int v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
    unsigned int v16 = v4[37];
  }
  int v21 = (v14 >> 3) & 1;
  if (v21 != ((v16 >> 3) & 1)) {
    goto LABEL_27;
  }
  if (v21)
  {
    unsigned int endSampleCount = self->_endSampleCount;
    if (endSampleCount == [v4 endSampleCount])
    {
      unsigned int v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
      unsigned int v16 = v4[37];
      goto LABEL_23;
    }
    goto LABEL_27;
  }
LABEL_23:
  int v23 = (v14 >> 4) & 1;
  if (v23 != ((v16 >> 4) & 1)) {
    goto LABEL_27;
  }
  if (v23)
  {
    int hasSpeechDetected = self->_hasSpeechDetected;
    if (hasSpeechDetected != [v4 hasSpeechDetected]) {
      goto LABEL_27;
    }
  }
  BOOL v25 = 1;
LABEL_28:

  return v25;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(&self->_hasSpeechDetected + 1)) {
    PBDataWriterWriteUint32Field();
  }
  NSUInteger v4 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self phraseId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char v5 = *(&self->_hasSpeechDetected + 1);
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char v5 = *(&self->_hasSpeechDetected + 1);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(&self->_hasSpeechDetected + 1) & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char v5 = *(&self->_hasSpeechDetected + 1);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(&self->_hasSpeechDetected + 1) & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompletedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteHasSpeechDetected
{
  *(&self->_hasSpeechDetected + 1) &= ~0x10u;
}

- (void)setHasHasSpeechDetected:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xEF | v3;
}

- (BOOL)hasHasSpeechDetected
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 4) & 1;
}

- (void)setHasSpeechDetected:(BOOL)a3
{
  *(&self->_hasSpeechDetected + 1) |= 0x10u;
  self->_int hasSpeechDetected = a3;
}

- (void)deleteEndSampleCount
{
  *(&self->_hasSpeechDetected + 1) &= ~8u;
}

- (void)setHasEndSampleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xF7 | v3;
}

- (BOOL)hasEndSampleCount
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 3) & 1;
}

- (void)setEndSampleCount:(unsigned int)a3
{
  *(&self->_hasSpeechDetected + 1) |= 8u;
  self->_unsigned int endSampleCount = a3;
}

- (void)deleteStartSampleCount
{
  *(&self->_hasSpeechDetected + 1) &= ~4u;
}

- (void)setHasStartSampleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xFB | v3;
}

- (BOOL)hasStartSampleCount
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 2) & 1;
}

- (void)setStartSampleCount:(unsigned int)a3
{
  *(&self->_hasSpeechDetected + 1) |= 4u;
  self->_unsigned int startSampleCount = a3;
}

- (void)deleteTopScoreForUtterance
{
  *(&self->_hasSpeechDetected + 1) &= ~2u;
}

- (void)setHasTopScoreForUtterance:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xFD | v3;
}

- (BOOL)hasTopScoreForUtterance
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 1) & 1;
}

- (void)setTopScoreForUtterance:(float)a3
{
  *(&self->_hasSpeechDetected + 1) |= 2u;
  self->_float topScoreForUtterance = a3;
}

- (void)deletePhraseId
{
}

- (BOOL)hasPhraseId
{
  return self->_phraseId != 0;
}

- (void)deletePageNumber
{
  *(&self->_hasSpeechDetected + 1) &= ~1u;
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xFE | a3;
}

- (BOOL)hasPageNumber
{
  return *(&self->_hasSpeechDetected + 1);
}

- (void)setPageNumber:(unsigned int)a3
{
  *(&self->_hasSpeechDetected + 1) |= 1u;
  self->_unsigned int pageNumber = a3;
}

@end