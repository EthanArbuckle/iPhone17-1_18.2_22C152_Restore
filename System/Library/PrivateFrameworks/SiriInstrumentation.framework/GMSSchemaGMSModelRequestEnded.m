@interface GMSSchemaGMSModelRequestEnded
- (BOOL)hasImageCount;
- (BOOL)hasImagePerSecond;
- (BOOL)hasKbPerSecond;
- (BOOL)hasResponseCharactersCount;
- (BOOL)hasResponseKbCount;
- (BOOL)hasResponseTimeInMilliseconds;
- (BOOL)hasResponseTokensCount;
- (BOOL)hasTimeToFirstTokenInSeconds;
- (BOOL)hasTimeToLastTokenInSeconds;
- (BOOL)hasTokensPerSecond;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GMSSchemaGMSModelRequestEnded)initWithDictionary:(id)a3;
- (GMSSchemaGMSModelRequestEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)kbPerSecond;
- (double)timeToFirstTokenInSeconds;
- (double)timeToLastTokenInSeconds;
- (double)tokensPerSecond;
- (float)imagePerSecond;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)imageCount;
- (unsigned)responseCharactersCount;
- (unsigned)responseKbCount;
- (unsigned)responseTimeInMilliseconds;
- (unsigned)responseTokensCount;
- (void)deleteImageCount;
- (void)deleteImagePerSecond;
- (void)deleteKbPerSecond;
- (void)deleteResponseCharactersCount;
- (void)deleteResponseKbCount;
- (void)deleteResponseTimeInMilliseconds;
- (void)deleteResponseTokensCount;
- (void)deleteTimeToFirstTokenInSeconds;
- (void)deleteTimeToLastTokenInSeconds;
- (void)deleteTokensPerSecond;
- (void)setHasImageCount:(BOOL)a3;
- (void)setHasImagePerSecond:(BOOL)a3;
- (void)setHasKbPerSecond:(BOOL)a3;
- (void)setHasResponseCharactersCount:(BOOL)a3;
- (void)setHasResponseKbCount:(BOOL)a3;
- (void)setHasResponseTimeInMilliseconds:(BOOL)a3;
- (void)setHasResponseTokensCount:(BOOL)a3;
- (void)setHasTimeToFirstTokenInSeconds:(BOOL)a3;
- (void)setHasTimeToLastTokenInSeconds:(BOOL)a3;
- (void)setHasTokensPerSecond:(BOOL)a3;
- (void)setImageCount:(unsigned int)a3;
- (void)setImagePerSecond:(float)a3;
- (void)setKbPerSecond:(double)a3;
- (void)setResponseCharactersCount:(unsigned int)a3;
- (void)setResponseKbCount:(unsigned int)a3;
- (void)setResponseTimeInMilliseconds:(unsigned int)a3;
- (void)setResponseTokensCount:(unsigned int)a3;
- (void)setTimeToFirstTokenInSeconds:(double)a3;
- (void)setTimeToLastTokenInSeconds:(double)a3;
- (void)setTokensPerSecond:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GMSSchemaGMSModelRequestEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)responseTimeInMilliseconds
{
  return self->_responseTimeInMilliseconds;
}

- (unsigned)responseCharactersCount
{
  return self->_responseCharactersCount;
}

- (double)timeToLastTokenInSeconds
{
  return self->_timeToLastTokenInSeconds;
}

- (double)timeToFirstTokenInSeconds
{
  return self->_timeToFirstTokenInSeconds;
}

- (unsigned)imageCount
{
  return self->_imageCount;
}

- (float)imagePerSecond
{
  return self->_imagePerSecond;
}

- (unsigned)responseKbCount
{
  return self->_responseKbCount;
}

- (double)kbPerSecond
{
  return self->_kbPerSecond;
}

- (unsigned)responseTokensCount
{
  return self->_responseTokensCount;
}

- (double)tokensPerSecond
{
  return self->_tokensPerSecond;
}

- (GMSSchemaGMSModelRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GMSSchemaGMSModelRequestEnded;
  v5 = [(GMSSchemaGMSModelRequestEnded *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tokensPerSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[GMSSchemaGMSModelRequestEnded setTokensPerSecond:](v5, "setTokensPerSecond:");
    }
    v7 = [v4 objectForKeyedSubscript:@"responseTokensCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestEnded setResponseTokensCount:](v5, "setResponseTokensCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"kbPerSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[GMSSchemaGMSModelRequestEnded setKbPerSecond:](v5, "setKbPerSecond:");
    }
    v9 = [v4 objectForKeyedSubscript:@"responseKbCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestEnded setResponseKbCount:](v5, "setResponseKbCount:", [v9 unsignedIntValue]);
    }
    v19 = v9;
    v10 = [v4 objectForKeyedSubscript:@"imagePerSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[GMSSchemaGMSModelRequestEnded setImagePerSecond:](v5, "setImagePerSecond:");
    }
    v11 = [v4 objectForKeyedSubscript:@"imageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestEnded setImageCount:](v5, "setImageCount:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"timeToFirstTokenInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[GMSSchemaGMSModelRequestEnded setTimeToFirstTokenInSeconds:](v5, "setTimeToFirstTokenInSeconds:");
    }
    v20 = v8;
    v21 = v6;
    v13 = [v4 objectForKeyedSubscript:@"timeToLastTokenInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      -[GMSSchemaGMSModelRequestEnded setTimeToLastTokenInSeconds:](v5, "setTimeToLastTokenInSeconds:");
    }
    v14 = v7;
    v15 = [v4 objectForKeyedSubscript:@"responseCharactersCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestEnded setResponseCharactersCount:](v5, "setResponseCharactersCount:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"responseTimeInMilliseconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestEnded setResponseTimeInMilliseconds:](v5, "setResponseTimeInMilliseconds:", [v16 unsignedIntValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (GMSSchemaGMSModelRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GMSSchemaGMSModelRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GMSSchemaGMSModelRequestEnded *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GMSSchemaGMSModelRequestEnded imageCount](self, "imageCount"));
    [v3 setObject:v8 forKeyedSubscript:@"imageCount"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v9 = NSNumber;
  [(GMSSchemaGMSModelRequestEnded *)self imagePerSecond];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v3 setObject:v10 forKeyedSubscript:@"imagePerSecond"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = NSNumber;
  [(GMSSchemaGMSModelRequestEnded *)self kbPerSecond];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  [v3 setObject:v12 forKeyedSubscript:@"kbPerSecond"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GMSSchemaGMSModelRequestEnded responseCharactersCount](self, "responseCharactersCount"));
  [v3 setObject:v13 forKeyedSubscript:@"responseCharactersCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GMSSchemaGMSModelRequestEnded responseKbCount](self, "responseKbCount"));
  [v3 setObject:v14 forKeyedSubscript:@"responseKbCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GMSSchemaGMSModelRequestEnded responseTimeInMilliseconds](self, "responseTimeInMilliseconds"));
  [v3 setObject:v15 forKeyedSubscript:@"responseTimeInMilliseconds"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GMSSchemaGMSModelRequestEnded responseTokensCount](self, "responseTokensCount"));
  [v3 setObject:v16 forKeyedSubscript:@"responseTokensCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v17 = NSNumber;
  [(GMSSchemaGMSModelRequestEnded *)self timeToFirstTokenInSeconds];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:@"timeToFirstTokenInSeconds"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  v19 = NSNumber;
  [(GMSSchemaGMSModelRequestEnded *)self timeToLastTokenInSeconds];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  [v3 setObject:v20 forKeyedSubscript:@"timeToLastTokenInSeconds"];

  if (*(_WORD *)&self->_has)
  {
LABEL_11:
    v5 = NSNumber;
    [(GMSSchemaGMSModelRequestEnded *)self tokensPerSecond];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"tokensPerSecond"];
  }
LABEL_12:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    double tokensPerSecond = self->_tokensPerSecond;
    double v6 = -tokensPerSecond;
    if (tokensPerSecond >= 0.0) {
      double v6 = self->_tokensPerSecond;
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
    uint64_t v9 = 2654435761 * self->_responseTokensCount;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  if ((has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double kbPerSecond = self->_kbPerSecond;
  double v11 = -kbPerSecond;
  if (kbPerSecond >= 0.0) {
    double v11 = self->_kbPerSecond;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 8) != 0)
  {
    uint64_t v15 = 2654435761 * self->_responseKbCount;
    if ((has & 0x10) != 0) {
      goto LABEL_21;
    }
LABEL_26:
    unint64_t v20 = 0;
    goto LABEL_29;
  }
  uint64_t v15 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_21:
  float imagePerSecond = self->_imagePerSecond;
  double v17 = imagePerSecond;
  if (imagePerSecond < 0.0) {
    double v17 = -imagePerSecond;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  unint64_t v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0) {
      v20 += (unint64_t)v19;
    }
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
LABEL_29:
  if ((has & 0x20) != 0)
  {
    uint64_t v21 = 2654435761 * self->_imageCount;
    if ((has & 0x40) != 0) {
      goto LABEL_31;
    }
LABEL_36:
    unint64_t v26 = 0;
    goto LABEL_39;
  }
  uint64_t v21 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_36;
  }
LABEL_31:
  double timeToFirstTokenInSeconds = self->_timeToFirstTokenInSeconds;
  double v23 = -timeToFirstTokenInSeconds;
  if (timeToFirstTokenInSeconds >= 0.0) {
    double v23 = self->_timeToFirstTokenInSeconds;
  }
  long double v24 = floor(v23 + 0.5);
  double v25 = (v23 - v24) * 1.84467441e19;
  unint64_t v26 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0) {
      v26 += (unint64_t)v25;
    }
  }
  else
  {
    v26 -= (unint64_t)fabs(v25);
  }
LABEL_39:
  if ((has & 0x80) != 0)
  {
    double timeToLastTokenInSeconds = self->_timeToLastTokenInSeconds;
    double v29 = -timeToLastTokenInSeconds;
    if (timeToLastTokenInSeconds >= 0.0) {
      double v29 = self->_timeToLastTokenInSeconds;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v27 += (unint64_t)v31;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  if ((has & 0x100) != 0)
  {
    uint64_t v32 = 2654435761 * self->_responseCharactersCount;
    if ((has & 0x200) != 0) {
      goto LABEL_49;
    }
LABEL_51:
    uint64_t v33 = 0;
    return v9 ^ v4 ^ v14 ^ v15 ^ v20 ^ v21 ^ v26 ^ v27 ^ v32 ^ v33;
  }
  uint64_t v32 = 0;
  if ((has & 0x200) == 0) {
    goto LABEL_51;
  }
LABEL_49:
  uint64_t v33 = 2654435761 * self->_responseTimeInMilliseconds;
  return v9 ^ v4 ^ v14 ^ v15 ^ v20 ^ v21 ^ v26 ^ v27 ^ v32 ^ v33;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  $16D713B29557FC80865B7CD8F793B078 has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    double tokensPerSecond = self->_tokensPerSecond;
    [v4 tokensPerSecond];
    if (tokensPerSecond != v8) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_42;
  }
  if (v9)
  {
    unsigned int responseTokensCount = self->_responseTokensCount;
    if (responseTokensCount != [v4 responseTokensCount]) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_42;
  }
  if (v11)
  {
    double kbPerSecond = self->_kbPerSecond;
    [v4 kbPerSecond];
    if (kbPerSecond != v13) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v14 = (*(unsigned int *)&has >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1)) {
    goto LABEL_42;
  }
  if (v14)
  {
    unsigned int responseKbCount = self->_responseKbCount;
    if (responseKbCount != [v4 responseKbCount]) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v16 = (*(unsigned int *)&has >> 4) & 1;
  if (v16 != ((v6 >> 4) & 1)) {
    goto LABEL_42;
  }
  if (v16)
  {
    float imagePerSecond = self->_imagePerSecond;
    [v4 imagePerSecond];
    if (imagePerSecond != v18) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1)) {
    goto LABEL_42;
  }
  if (v19)
  {
    unsigned int imageCount = self->_imageCount;
    if (imageCount != [v4 imageCount]) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v21 = (*(unsigned int *)&has >> 6) & 1;
  if (v21 != ((v6 >> 6) & 1)) {
    goto LABEL_42;
  }
  if (v21)
  {
    double timeToFirstTokenInSeconds = self->_timeToFirstTokenInSeconds;
    [v4 timeToFirstTokenInSeconds];
    if (timeToFirstTokenInSeconds != v23) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v24 = (*(unsigned int *)&has >> 7) & 1;
  if (v24 != ((v6 >> 7) & 1)) {
    goto LABEL_42;
  }
  if (v24)
  {
    double timeToLastTokenInSeconds = self->_timeToLastTokenInSeconds;
    [v4 timeToLastTokenInSeconds];
    if (timeToLastTokenInSeconds != v26) {
      goto LABEL_42;
    }
    $16D713B29557FC80865B7CD8F793B078 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v27 = (*(unsigned int *)&has >> 8) & 1;
  if (v27 != ((v6 >> 8) & 1)) {
    goto LABEL_42;
  }
  if (v27)
  {
    unsigned int responseCharactersCount = self->_responseCharactersCount;
    if (responseCharactersCount == [v4 responseCharactersCount])
    {
      $16D713B29557FC80865B7CD8F793B078 has = self->_has;
      unsigned int v6 = v4[36];
      goto LABEL_38;
    }
LABEL_42:
    BOOL v31 = 0;
    goto LABEL_43;
  }
LABEL_38:
  int v29 = (*(unsigned int *)&has >> 9) & 1;
  if (v29 != ((v6 >> 9) & 1)) {
    goto LABEL_42;
  }
  if (v29)
  {
    unsigned int responseTimeInMilliseconds = self->_responseTimeInMilliseconds;
    if (responseTimeInMilliseconds != [v4 responseTimeInMilliseconds]) {
      goto LABEL_42;
    }
  }
  BOOL v31 = 1;
LABEL_43:

  return v31;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return GMSSchemaGMSModelRequestEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteResponseTimeInMilliseconds
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasResponseTimeInMilliseconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasResponseTimeInMilliseconds
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setResponseTimeInMilliseconds:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int responseTimeInMilliseconds = a3;
}

- (void)deleteResponseCharactersCount
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasResponseCharactersCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResponseCharactersCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setResponseCharactersCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int responseCharactersCount = a3;
}

- (void)deleteTimeToLastTokenInSeconds
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasTimeToLastTokenInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimeToLastTokenInSeconds
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTimeToLastTokenInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_double timeToLastTokenInSeconds = a3;
}

- (void)deleteTimeToFirstTokenInSeconds
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasTimeToFirstTokenInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTimeToFirstTokenInSeconds
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTimeToFirstTokenInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_double timeToFirstTokenInSeconds = a3;
}

- (void)deleteImageCount
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasImageCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasImageCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setImageCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int imageCount = a3;
}

- (void)deleteImagePerSecond
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasImagePerSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasImagePerSecond
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setImagePerSecond:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_float imagePerSecond = a3;
}

- (void)deleteResponseKbCount
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasResponseKbCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasResponseKbCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResponseKbCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int responseKbCount = a3;
}

- (void)deleteKbPerSecond
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasKbPerSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasKbPerSecond
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setKbPerSecond:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_double kbPerSecond = a3;
}

- (void)deleteResponseTokensCount
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasResponseTokensCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasResponseTokensCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResponseTokensCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int responseTokensCount = a3;
}

- (void)deleteTokensPerSecond
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasTokensPerSecond:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTokensPerSecond
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTokensPerSecond:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_double tokensPerSecond = a3;
}

@end