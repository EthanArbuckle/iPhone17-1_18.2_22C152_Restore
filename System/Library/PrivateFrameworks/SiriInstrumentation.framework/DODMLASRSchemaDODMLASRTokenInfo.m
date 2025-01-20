@interface DODMLASRSchemaDODMLASRTokenInfo
- (ASRSchemaASRToken)token;
- (BOOL)hasAcousticCost;
- (BOOL)hasSilenceAcousticCost;
- (BOOL)hasToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRTokenInfo)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRTokenInfo)initWithJSON:(id)a3;
- (NSArray)languageModelCosts;
- (NSArray)numBackoffs;
- (NSData)jsonData;
- (float)acousticCost;
- (float)languageModelCostsAtIndex:(unint64_t)a3;
- (float)silenceAcousticCost;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)languageModelCostsCount;
- (unint64_t)numBackoffsCount;
- (unsigned)numBackoffsAtIndex:(unint64_t)a3;
- (void)addLanguageModelCosts:(float)a3;
- (void)addNumBackoffs:(unsigned int)a3;
- (void)clearLanguageModelCosts;
- (void)clearNumBackoffs;
- (void)deleteAcousticCost;
- (void)deleteSilenceAcousticCost;
- (void)deleteToken;
- (void)setAcousticCost:(float)a3;
- (void)setHasAcousticCost:(BOOL)a3;
- (void)setHasSilenceAcousticCost:(BOOL)a3;
- (void)setHasToken:(BOOL)a3;
- (void)setLanguageModelCosts:(id)a3;
- (void)setNumBackoffs:(id)a3;
- (void)setSilenceAcousticCost:(float)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRTokenInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRTokenInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRTokenInfo *)self token];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(DODMLASRSchemaDODMLASRTokenInfo *)self deleteToken];
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
  objc_storeStrong((id *)&self->_languageModelCosts, 0);
  objc_storeStrong((id *)&self->_numBackoffs, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (void)setHasToken:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLanguageModelCosts:(id)a3
{
}

- (NSArray)languageModelCosts
{
  return self->_languageModelCosts;
}

- (void)setNumBackoffs:(id)a3
{
}

- (NSArray)numBackoffs
{
  return self->_numBackoffs;
}

- (float)silenceAcousticCost
{
  return self->_silenceAcousticCost;
}

- (float)acousticCost
{
  return self->_acousticCost;
}

- (void)setToken:(id)a3
{
}

- (ASRSchemaASRToken)token
{
  return self->_token;
}

- (DODMLASRSchemaDODMLASRTokenInfo)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DODMLASRSchemaDODMLASRTokenInfo;
  v5 = [(DODMLASRSchemaDODMLASRTokenInfo *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"token"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ASRSchemaASRToken alloc] initWithDictionary:v6];
      [(DODMLASRSchemaDODMLASRTokenInfo *)v5 setToken:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"acousticCost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[DODMLASRSchemaDODMLASRTokenInfo setAcousticCost:](v5, "setAcousticCost:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"silenceAcousticCost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[DODMLASRSchemaDODMLASRTokenInfo setSilenceAcousticCost:](v5, "setSilenceAcousticCost:");
    }
    v27 = v9;
    v10 = [v4 objectForKeyedSubscript:@"numBackoffs"];
    objc_opt_class();
    v28 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v34;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[DODMLASRSchemaDODMLASRTokenInfo addNumBackoffs:](v5, "addNumBackoffs:", [v16 unsignedIntValue]);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v13);
      }

      v8 = v28;
    }
    v17 = [v4 objectForKeyedSubscript:@"languageModelCosts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v6;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v23 floatValue];
              -[DODMLASRSchemaDODMLASRTokenInfo addLanguageModelCosts:](v5, "addLanguageModelCosts:");
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v20);
      }

      v6 = v26;
      v8 = v28;
    }
    v24 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRTokenInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRTokenInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRTokenInfo *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = NSNumber;
    [(DODMLASRSchemaDODMLASRTokenInfo *)self acousticCost];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"acousticCost"];
  }
  if ([(NSArray *)self->_languageModelCosts count])
  {
    v6 = [(DODMLASRSchemaDODMLASRTokenInfo *)self languageModelCosts];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"languageModelCosts"];
  }
  if ([(NSArray *)self->_numBackoffs count])
  {
    v8 = [(DODMLASRSchemaDODMLASRTokenInfo *)self numBackoffs];
    objc_super v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"numBackoffs"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = NSNumber;
    [(DODMLASRSchemaDODMLASRTokenInfo *)self silenceAcousticCost];
    id v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"silenceAcousticCost"];
  }
  if (self->_token)
  {
    uint64_t v12 = [(DODMLASRSchemaDODMLASRTokenInfo *)self token];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"token"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"token"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASRSchemaASRToken *)self->_token hash];
  char has = (char)self->_has;
  if (has)
  {
    float acousticCost = self->_acousticCost;
    double v7 = acousticCost;
    if (acousticCost < 0.0) {
      double v7 = -acousticCost;
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
    float silenceAcousticCost = self->_silenceAcousticCost;
    double v12 = silenceAcousticCost;
    if (silenceAcousticCost < 0.0) {
      double v12 = -silenceAcousticCost;
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
  uint64_t v15 = v5 ^ v3 ^ v10 ^ [(NSArray *)self->_numBackoffs hash];
  return v15 ^ [(NSArray *)self->_languageModelCosts hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRTokenInfo *)self token];
  v6 = [v4 token];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRTokenInfo *)self token];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(DODMLASRSchemaDODMLASRTokenInfo *)self token];
    unint64_t v10 = [v4 token];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $61D434AF3480A26A09F428C40ED43F2C has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&has)
  {
    float acousticCost = self->_acousticCost;
    [v4 acousticCost];
    if (acousticCost != v15) {
      goto LABEL_24;
    }
    $61D434AF3480A26A09F428C40ED43F2C has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    float silenceAcousticCost = self->_silenceAcousticCost;
    [v4 silenceAcousticCost];
    if (silenceAcousticCost != v18) {
      goto LABEL_24;
    }
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRTokenInfo *)self numBackoffs];
  v6 = [v4 numBackoffs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v19 = [(DODMLASRSchemaDODMLASRTokenInfo *)self numBackoffs];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = [(DODMLASRSchemaDODMLASRTokenInfo *)self numBackoffs];
    uint64_t v22 = [v4 numBackoffs];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRTokenInfo *)self languageModelCosts];
  v6 = [v4 languageModelCosts];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v24 = [(DODMLASRSchemaDODMLASRTokenInfo *)self languageModelCosts];
  if (!v24)
  {

LABEL_27:
    BOOL v29 = 1;
    goto LABEL_25;
  }
  v25 = (void *)v24;
  v26 = [(DODMLASRSchemaDODMLASRTokenInfo *)self languageModelCosts];
  v27 = [v4 languageModelCosts];
  char v28 = [v26 isEqual:v27];

  if (v28) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v29 = 0;
LABEL_25:

  return v29;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(DODMLASRSchemaDODMLASRTokenInfo *)self token];

  if (v5)
  {
    v6 = [(DODMLASRSchemaDODMLASRTokenInfo *)self token];
    PBDataWriterWriteSubmessage();
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
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long double v8 = self->_numBackoffs;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) unsignedIntValue];
        PBDataWriterWriteUint32Field();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v13 = self->_languageModelCosts;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "floatValue", (void)v18);
        PBDataWriterWriteFloatField();
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRTokenInfoReadFrom(self, (uint64_t)a3, v3);
}

- (float)languageModelCostsAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_languageModelCosts objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)languageModelCostsCount
{
  return [(NSArray *)self->_languageModelCosts count];
}

- (void)addLanguageModelCosts:(float)a3
{
  languageModelCosts = self->_languageModelCosts;
  if (!languageModelCosts)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_languageModelCosts;
    self->_languageModelCosts = v6;

    languageModelCosts = self->_languageModelCosts;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)languageModelCosts addObject:v9];
}

- (void)clearLanguageModelCosts
{
}

- (unsigned)numBackoffsAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_numBackoffs objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)numBackoffsCount
{
  return [(NSArray *)self->_numBackoffs count];
}

- (void)addNumBackoffs:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  numBackoffs = self->_numBackoffs;
  if (!numBackoffs)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_numBackoffs;
    self->_numBackoffs = v6;

    numBackoffs = self->_numBackoffs;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)numBackoffs addObject:v8];
}

- (void)clearNumBackoffs
{
}

- (void)deleteSilenceAcousticCost
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSilenceAcousticCost:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSilenceAcousticCost
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSilenceAcousticCost:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float silenceAcousticCost = a3;
}

- (void)deleteAcousticCost
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAcousticCost:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAcousticCost
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAcousticCost:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float acousticCost = a3;
}

- (void)deleteToken
{
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

@end