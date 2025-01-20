@interface CAARSchemaCAARProactiveFeatures
- (BOOL)hasAppRelevanceScore;
- (BOOL)hasIntentRelevanceScore;
- (BOOL)hasIsAppInTopFiveRelevance;
- (BOOL)hasIsAppInTopOneRelevance;
- (BOOL)hasIsAppInTopTenRelevance;
- (BOOL)hasIsIntentInTopFiveRelevance;
- (BOOL)hasIsIntentInTopOneRelevance;
- (BOOL)hasIsIntentInTopTenRelevance;
- (BOOL)isAppInTopFiveRelevance;
- (BOOL)isAppInTopOneRelevance;
- (BOOL)isAppInTopTenRelevance;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIntentInTopFiveRelevance;
- (BOOL)isIntentInTopOneRelevance;
- (BOOL)isIntentInTopTenRelevance;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARProactiveFeatures)initWithDictionary:(id)a3;
- (CAARSchemaCAARProactiveFeatures)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)appRelevanceScore;
- (double)intentRelevanceScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAppRelevanceScore;
- (void)deleteIntentRelevanceScore;
- (void)deleteIsAppInTopFiveRelevance;
- (void)deleteIsAppInTopOneRelevance;
- (void)deleteIsAppInTopTenRelevance;
- (void)deleteIsIntentInTopFiveRelevance;
- (void)deleteIsIntentInTopOneRelevance;
- (void)deleteIsIntentInTopTenRelevance;
- (void)setAppRelevanceScore:(double)a3;
- (void)setHasAppRelevanceScore:(BOOL)a3;
- (void)setHasIntentRelevanceScore:(BOOL)a3;
- (void)setHasIsAppInTopFiveRelevance:(BOOL)a3;
- (void)setHasIsAppInTopOneRelevance:(BOOL)a3;
- (void)setHasIsAppInTopTenRelevance:(BOOL)a3;
- (void)setHasIsIntentInTopFiveRelevance:(BOOL)a3;
- (void)setHasIsIntentInTopOneRelevance:(BOOL)a3;
- (void)setHasIsIntentInTopTenRelevance:(BOOL)a3;
- (void)setIntentRelevanceScore:(double)a3;
- (void)setIsAppInTopFiveRelevance:(BOOL)a3;
- (void)setIsAppInTopOneRelevance:(BOOL)a3;
- (void)setIsAppInTopTenRelevance:(BOOL)a3;
- (void)setIsIntentInTopFiveRelevance:(BOOL)a3;
- (void)setIsIntentInTopOneRelevance:(BOOL)a3;
- (void)setIsIntentInTopTenRelevance:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARProactiveFeatures

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)intentRelevanceScore
{
  return self->_intentRelevanceScore;
}

- (double)appRelevanceScore
{
  return self->_appRelevanceScore;
}

- (BOOL)isIntentInTopTenRelevance
{
  return self->_isIntentInTopTenRelevance;
}

- (BOOL)isIntentInTopFiveRelevance
{
  return self->_isIntentInTopFiveRelevance;
}

- (BOOL)isIntentInTopOneRelevance
{
  return self->_isIntentInTopOneRelevance;
}

- (BOOL)isAppInTopTenRelevance
{
  return self->_isAppInTopTenRelevance;
}

- (BOOL)isAppInTopFiveRelevance
{
  return self->_isAppInTopFiveRelevance;
}

- (BOOL)isAppInTopOneRelevance
{
  return self->_isAppInTopOneRelevance;
}

- (CAARSchemaCAARProactiveFeatures)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAARSchemaCAARProactiveFeatures;
  v5 = [(CAARSchemaCAARProactiveFeatures *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAppInTopOneRelevance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARProactiveFeatures setIsAppInTopOneRelevance:](v5, "setIsAppInTopOneRelevance:", [v6 BOOLValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"isAppInTopFiveRelevance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARProactiveFeatures setIsAppInTopFiveRelevance:](v5, "setIsAppInTopFiveRelevance:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isAppInTopTenRelevance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARProactiveFeatures setIsAppInTopTenRelevance:](v5, "setIsAppInTopTenRelevance:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isIntentInTopOneRelevance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARProactiveFeatures setIsIntentInTopOneRelevance:](v5, "setIsIntentInTopOneRelevance:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isIntentInTopFiveRelevance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARProactiveFeatures setIsIntentInTopFiveRelevance:](v5, "setIsIntentInTopFiveRelevance:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isIntentInTopTenRelevance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARProactiveFeatures setIsIntentInTopTenRelevance:](v5, "setIsIntentInTopTenRelevance:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"appRelevanceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[CAARSchemaCAARProactiveFeatures setAppRelevanceScore:](v5, "setAppRelevanceScore:");
    }
    v13 = [v4 objectForKeyedSubscript:@"intentRelevanceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      -[CAARSchemaCAARProactiveFeatures setIntentRelevanceScore:](v5, "setIntentRelevanceScore:");
    }
    v14 = v5;
  }
  return v5;
}

- (CAARSchemaCAARProactiveFeatures)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARProactiveFeatures *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARProactiveFeatures *)self dictionaryRepresentation];
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
  if ((has & 0x40) != 0)
  {
    uint64_t v7 = NSNumber;
    [(CAARSchemaCAARProactiveFeatures *)self appRelevanceScore];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"appRelevanceScore"];

    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v9 = NSNumber;
  [(CAARSchemaCAARProactiveFeatures *)self intentRelevanceScore];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"intentRelevanceScore"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isAppInTopFiveRelevance](self, "isAppInTopFiveRelevance"));
  [v3 setObject:v11 forKeyedSubscript:@"isAppInTopFiveRelevance"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isAppInTopOneRelevance](self, "isAppInTopOneRelevance"));
  [v3 setObject:v12 forKeyedSubscript:@"isAppInTopOneRelevance"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isAppInTopTenRelevance](self, "isAppInTopTenRelevance"));
  [v3 setObject:v13 forKeyedSubscript:@"isAppInTopTenRelevance"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isIntentInTopFiveRelevance](self, "isIntentInTopFiveRelevance"));
  [v3 setObject:v14 forKeyedSubscript:@"isIntentInTopFiveRelevance"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isIntentInTopOneRelevance](self, "isIntentInTopOneRelevance"));
  [v3 setObject:v15 forKeyedSubscript:@"isIntentInTopOneRelevance"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isIntentInTopTenRelevance](self, "isIntentInTopTenRelevance"));
    [v3 setObject:v5 forKeyedSubscript:@"isIntentInTopTenRelevance"];
  }
LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_isAppInTopOneRelevance;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isAppInTopFiveRelevance;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
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
    uint64_t v6 = 2654435761 * self->_isAppInTopTenRelevance;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_isIntentInTopOneRelevance;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_isIntentInTopFiveRelevance;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_17:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_18:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_isIntentInTopTenRelevance;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_8:
  double appRelevanceScore = self->_appRelevanceScore;
  double v11 = -appRelevanceScore;
  if (appRelevanceScore >= 0.0) {
    double v11 = self->_appRelevanceScore;
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
  if (has < 0)
  {
    double intentRelevanceScore = self->_intentRelevanceScore;
    double v17 = -intentRelevanceScore;
    if (intentRelevanceScore >= 0.0) {
      double v17 = self->_intentRelevanceScore;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_33;
  }
  if (*(unsigned char *)&has)
  {
    int isAppInTopOneRelevance = self->_isAppInTopOneRelevance;
    if (isAppInTopOneRelevance != [v4 isAppInTopOneRelevance]) {
      goto LABEL_33;
    }
    $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int isAppInTopFiveRelevance = self->_isAppInTopFiveRelevance;
      if (isAppInTopFiveRelevance != [v4 isAppInTopFiveRelevance]) {
        goto LABEL_33;
      }
      $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int isAppInTopTenRelevance = self->_isAppInTopTenRelevance;
        if (isAppInTopTenRelevance != [v4 isAppInTopTenRelevance]) {
          goto LABEL_33;
        }
        $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
        unsigned int v6 = v4[32];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          int isIntentInTopOneRelevance = self->_isIntentInTopOneRelevance;
          if (isIntentInTopOneRelevance != [v4 isIntentInTopOneRelevance]) {
            goto LABEL_33;
          }
          $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
          unsigned int v6 = v4[32];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            int isIntentInTopFiveRelevance = self->_isIntentInTopFiveRelevance;
            if (isIntentInTopFiveRelevance != [v4 isIntentInTopFiveRelevance]) {
              goto LABEL_33;
            }
            $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
            unsigned int v6 = v4[32];
          }
          int v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              int isIntentInTopTenRelevance = self->_isIntentInTopTenRelevance;
              if (isIntentInTopTenRelevance != [v4 isIntentInTopTenRelevance]) {
                goto LABEL_33;
              }
              $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
              unsigned int v6 = v4[32];
            }
            int v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 == ((v6 >> 6) & 1))
            {
              if (v18)
              {
                double appRelevanceScore = self->_appRelevanceScore;
                [v4 appRelevanceScore];
                if (appRelevanceScore != v20) {
                  goto LABEL_33;
                }
                $2D00DB0B5873D8628076908720BCA6B5 has = self->_has;
                unsigned int v6 = v4[32];
              }
              if (((v6 ^ *(_DWORD *)&has) & 0x80) == 0)
              {
                if ((*(unsigned char *)&has & 0x80) == 0
                  || (double intentRelevanceScore = self->_intentRelevanceScore,
                      [v4 intentRelevanceScore],
                      intentRelevanceScore == v22))
                {
                  BOOL v23 = 1;
                  goto LABEL_34;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_33:
  BOOL v23 = 0;
LABEL_34:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARProactiveFeaturesReadFrom(self, (uint64_t)a3);
}

- (void)deleteIntentRelevanceScore
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasIntentRelevanceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIntentRelevanceScore
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setIntentRelevanceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_double intentRelevanceScore = a3;
}

- (void)deleteAppRelevanceScore
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasAppRelevanceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasAppRelevanceScore
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAppRelevanceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_double appRelevanceScore = a3;
}

- (void)deleteIsIntentInTopTenRelevance
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsIntentInTopTenRelevance:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsIntentInTopTenRelevance
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsIntentInTopTenRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isIntentInTopTenRelevance = a3;
}

- (void)deleteIsIntentInTopFiveRelevance
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsIntentInTopFiveRelevance:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsIntentInTopFiveRelevance
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsIntentInTopFiveRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isIntentInTopFiveRelevance = a3;
}

- (void)deleteIsIntentInTopOneRelevance
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsIntentInTopOneRelevance:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsIntentInTopOneRelevance
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsIntentInTopOneRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isIntentInTopOneRelevance = a3;
}

- (void)deleteIsAppInTopTenRelevance
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsAppInTopTenRelevance:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAppInTopTenRelevance
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsAppInTopTenRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isAppInTopTenRelevance = a3;
}

- (void)deleteIsAppInTopFiveRelevance
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsAppInTopFiveRelevance:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAppInTopFiveRelevance
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAppInTopFiveRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isAppInTopFiveRelevance = a3;
}

- (void)deleteIsAppInTopOneRelevance
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAppInTopOneRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAppInTopOneRelevance
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAppInTopOneRelevance:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAppInTopOneRelevance = a3;
}

@end