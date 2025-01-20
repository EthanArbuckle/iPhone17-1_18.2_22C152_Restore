@interface DODMLASRSchemaDODMLASRLanguageModelMetrics
- (BOOL)hasLinearInterpolationWeight;
- (BOOL)hasNumInvalidTokens;
- (BOOL)hasNumInvalidUtterances;
- (BOOL)hasNumOutOfVocabularyWords;
- (BOOL)hasNumUtterances;
- (BOOL)hasNumWords;
- (BOOL)hasPerplexity;
- (BOOL)hasPerplexityOne;
- (BOOL)hasTotalDurationInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRLanguageModelMetrics)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRLanguageModelMetrics)initWithJSON:(id)a3;
- (NSArray)ngramHits;
- (NSData)jsonData;
- (float)linearInterpolationWeight;
- (float)perplexity;
- (float)perplexityOne;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)ngramHitsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)ngramHitsCount;
- (unint64_t)totalDurationInMs;
- (unsigned)numInvalidTokens;
- (unsigned)numInvalidUtterances;
- (unsigned)numOutOfVocabularyWords;
- (unsigned)numUtterances;
- (unsigned)numWords;
- (void)addNgramHits:(id)a3;
- (void)clearNgramHits;
- (void)deleteLinearInterpolationWeight;
- (void)deleteNumInvalidTokens;
- (void)deleteNumInvalidUtterances;
- (void)deleteNumOutOfVocabularyWords;
- (void)deleteNumUtterances;
- (void)deleteNumWords;
- (void)deletePerplexity;
- (void)deletePerplexityOne;
- (void)deleteTotalDurationInMs;
- (void)setHasLinearInterpolationWeight:(BOOL)a3;
- (void)setHasNumInvalidTokens:(BOOL)a3;
- (void)setHasNumInvalidUtterances:(BOOL)a3;
- (void)setHasNumOutOfVocabularyWords:(BOOL)a3;
- (void)setHasNumUtterances:(BOOL)a3;
- (void)setHasNumWords:(BOOL)a3;
- (void)setHasPerplexity:(BOOL)a3;
- (void)setHasPerplexityOne:(BOOL)a3;
- (void)setHasTotalDurationInMs:(BOOL)a3;
- (void)setLinearInterpolationWeight:(float)a3;
- (void)setNgramHits:(id)a3;
- (void)setNumInvalidTokens:(unsigned int)a3;
- (void)setNumInvalidUtterances:(unsigned int)a3;
- (void)setNumOutOfVocabularyWords:(unsigned int)a3;
- (void)setNumUtterances:(unsigned int)a3;
- (void)setNumWords:(unsigned int)a3;
- (void)setPerplexity:(float)a3;
- (void)setPerplexityOne:(float)a3;
- (void)setTotalDurationInMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRLanguageModelMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRLanguageModelMetrics;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self ngramHits];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self setNgramHits:v7];
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

- (void)setNgramHits:(id)a3
{
}

- (NSArray)ngramHits
{
  return self->_ngramHits;
}

- (float)perplexityOne
{
  return self->_perplexityOne;
}

- (float)perplexity
{
  return self->_perplexity;
}

- (unsigned)numInvalidUtterances
{
  return self->_numInvalidUtterances;
}

- (unsigned)numInvalidTokens
{
  return self->_numInvalidTokens;
}

- (unsigned)numOutOfVocabularyWords
{
  return self->_numOutOfVocabularyWords;
}

- (unsigned)numWords
{
  return self->_numWords;
}

- (unsigned)numUtterances
{
  return self->_numUtterances;
}

- (unint64_t)totalDurationInMs
{
  return self->_totalDurationInMs;
}

- (float)linearInterpolationWeight
{
  return self->_linearInterpolationWeight;
}

- (DODMLASRSchemaDODMLASRLanguageModelMetrics)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DODMLASRSchemaDODMLASRLanguageModelMetrics;
  v5 = [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linearInterpolationWeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setLinearInterpolationWeight:](v5, "setLinearInterpolationWeight:");
    }
    v7 = [v4 objectForKeyedSubscript:@"totalDurationInMs"];
    objc_opt_class();
    v33 = v7;
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setTotalDurationInMs:](v5, "setTotalDurationInMs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numUtterances"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumUtterances:](v5, "setNumUtterances:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"numWords"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumWords:](v5, "setNumWords:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numOutOfVocabularyWords"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumOutOfVocabularyWords:](v5, "setNumOutOfVocabularyWords:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"numInvalidTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumInvalidTokens:](v5, "setNumInvalidTokens:", [v11 unsignedIntValue]);
    }
    v12 = v6;
    v13 = [v4 objectForKeyedSubscript:@"numInvalidUtterances"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumInvalidUtterances:](v5, "setNumInvalidUtterances:", [v13 unsignedIntValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"perplexity"];
    objc_opt_class();
    v32 = v14;
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setPerplexity:](v5, "setPerplexity:");
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"perplexityOne"];
    objc_opt_class();
    v31 = (void *)v15;
    v16 = v33;
    if (objc_opt_isKindOfClass())
    {
      [v31 floatValue];
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setPerplexityOne:](v5, "setPerplexityOne:");
    }
    v17 = [v4 objectForKeyedSubscript:@"ngramHits"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v10;
      v28 = v9;
      v29 = v8;
      v30 = v12;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[DODMLASRSchemaDODMLASRNgramHits alloc] initWithDictionary:v23];
              [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)v5 addNgramHits:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v20);
      }

      v8 = v29;
      v12 = v30;
      v16 = v33;
      v10 = v27;
      objc_super v9 = v28;
    }
    v25 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRLanguageModelMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(_WORD *)&self->_has)
  {
    id v4 = NSNumber;
    [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self linearInterpolationWeight];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"linearInterpolationWeight"];
  }
  if ([(NSArray *)self->_ngramHits count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v7 = self->_ngramHits;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"ngramHits"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numInvalidTokens](self, "numInvalidTokens"));
    [v3 setObject:v17 forKeyedSubscript:@"numInvalidTokens"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_17;
  }
  id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numInvalidUtterances](self, "numInvalidUtterances"));
  [v3 setObject:v18 forKeyedSubscript:@"numInvalidUtterances"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numOutOfVocabularyWords](self, "numOutOfVocabularyWords"));
  [v3 setObject:v19 forKeyedSubscript:@"numOutOfVocabularyWords"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_19:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numUtterances](self, "numUtterances"));
  [v3 setObject:v20 forKeyedSubscript:@"numUtterances"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numWords](self, "numWords"));
  [v3 setObject:v21 forKeyedSubscript:@"numWords"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_33;
  }
LABEL_32:
  v22 = NSNumber;
  [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self perplexity];
  uint64_t v23 = objc_msgSend(v22, "numberWithFloat:");
  [v3 setObject:v23 forKeyedSubscript:@"perplexity"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_22:
    if ((has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_33:
  v24 = NSNumber;
  [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self perplexityOne];
  v25 = objc_msgSend(v24, "numberWithFloat:");
  [v3 setObject:v25 forKeyedSubscript:@"perplexityOne"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_23:
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics totalDurationInMs](self, "totalDurationInMs"));
    [v3 setObject:v15 forKeyedSubscript:@"totalDurationInMs"];
  }
LABEL_24:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    float linearInterpolationWeight = self->_linearInterpolationWeight;
    double v6 = linearInterpolationWeight;
    if (linearInterpolationWeight < 0.0) {
      double v6 = -linearInterpolationWeight;
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
    unint64_t v25 = 2654435761u * self->_totalDurationInMs;
    if ((has & 4) != 0)
    {
LABEL_11:
      uint64_t v9 = 2654435761 * self->_numUtterances;
      if ((has & 8) != 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v25 = 0;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_12:
    uint64_t v10 = 2654435761 * self->_numWords;
    if ((has & 0x10) != 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v11 = 2654435761 * self->_numOutOfVocabularyWords;
    if ((has & 0x20) != 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_14:
    uint64_t v12 = 2654435761 * self->_numInvalidTokens;
    if ((has & 0x40) != 0) {
      goto LABEL_15;
    }
LABEL_25:
    uint64_t v13 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_16;
    }
LABEL_26:
    unint64_t v18 = 0;
    goto LABEL_29;
  }
LABEL_24:
  uint64_t v12 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_25;
  }
LABEL_15:
  uint64_t v13 = 2654435761 * self->_numInvalidUtterances;
  if ((has & 0x80) == 0) {
    goto LABEL_26;
  }
LABEL_16:
  float perplexity = self->_perplexity;
  double v15 = perplexity;
  if (perplexity < 0.0) {
    double v15 = -perplexity;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_29:
  if ((has & 0x100) != 0)
  {
    float perplexityOne = self->_perplexityOne;
    double v21 = perplexityOne;
    if (perplexityOne < 0.0) {
      double v21 = -perplexityOne;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  return v25 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18 ^ v19 ^ [(NSArray *)self->_ngramHits hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    float linearInterpolationWeight = self->_linearInterpolationWeight;
    [v4 linearInterpolationWeight];
    if (linearInterpolationWeight != v8) {
      goto LABEL_42;
    }
    $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      unint64_t totalDurationInMs = self->_totalDurationInMs;
      if (totalDurationInMs != [v4 totalDurationInMs]) {
        goto LABEL_42;
      }
      $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        unsigned int numUtterances = self->_numUtterances;
        if (numUtterances != [v4 numUtterances]) {
          goto LABEL_42;
        }
        $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
        unsigned int v6 = v4[32];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          unsigned int numWords = self->_numWords;
          if (numWords != [v4 numWords]) {
            goto LABEL_42;
          }
          $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
          unsigned int v6 = v4[32];
        }
        int v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            unsigned int numOutOfVocabularyWords = self->_numOutOfVocabularyWords;
            if (numOutOfVocabularyWords != [v4 numOutOfVocabularyWords]) {
              goto LABEL_42;
            }
            $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
            unsigned int v6 = v4[32];
          }
          int v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (v17)
            {
              unsigned int numInvalidTokens = self->_numInvalidTokens;
              if (numInvalidTokens != [v4 numInvalidTokens]) {
                goto LABEL_42;
              }
              $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
              unsigned int v6 = v4[32];
            }
            int v19 = (*(unsigned int *)&has >> 6) & 1;
            if (v19 == ((v6 >> 6) & 1))
            {
              if (v19)
              {
                unsigned int numInvalidUtterances = self->_numInvalidUtterances;
                if (numInvalidUtterances != [v4 numInvalidUtterances]) {
                  goto LABEL_42;
                }
                $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
                unsigned int v6 = v4[32];
              }
              int v21 = (*(unsigned int *)&has >> 7) & 1;
              if (v21 == ((v6 >> 7) & 1))
              {
                if (v21)
                {
                  float perplexity = self->_perplexity;
                  [v4 perplexity];
                  if (perplexity != v23) {
                    goto LABEL_42;
                  }
                  $40946F3F69C1BC26F201F0B1FD8D4C8B has = self->_has;
                  unsigned int v6 = v4[32];
                }
                int v24 = (*(unsigned int *)&has >> 8) & 1;
                if (v24 == ((v6 >> 8) & 1))
                {
                  if (!v24
                    || (float perplexityOne = self->_perplexityOne, [v4 perplexityOne], perplexityOne == v26))
                  {
                    long long v27 = [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self ngramHits];
                    long long v28 = [v4 ngramHits];
                    long long v29 = v28;
                    if ((v27 == 0) != (v28 != 0))
                    {
                      uint64_t v30 = [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self ngramHits];
                      if (!v30)
                      {

LABEL_45:
                        BOOL v35 = 1;
                        goto LABEL_43;
                      }
                      uint64_t v31 = (void *)v30;
                      v32 = [(DODMLASRSchemaDODMLASRLanguageModelMetrics *)self ngramHits];
                      v33 = [v4 ngramHits];
                      char v34 = [v32 isEqual:v33];

                      if (v34) {
                        goto LABEL_45;
                      }
                    }
                    else
                    {
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_42:
  BOOL v35 = 0;
LABEL_43:

  return v35;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteFloatField();
LABEL_11:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_ngramHits;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRLanguageModelMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (id)ngramHitsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_ngramHits objectAtIndexedSubscript:a3];
}

- (unint64_t)ngramHitsCount
{
  return [(NSArray *)self->_ngramHits count];
}

- (void)addNgramHits:(id)a3
{
  id v4 = a3;
  ngramHits = self->_ngramHits;
  id v8 = v4;
  if (!ngramHits)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_ngramHits;
    self->_ngramHits = v6;

    id v4 = v8;
    ngramHits = self->_ngramHits;
  }
  [(NSArray *)ngramHits addObject:v4];
}

- (void)clearNgramHits
{
}

- (void)deletePerplexityOne
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasPerplexityOne:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPerplexityOne
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPerplexityOne:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_float perplexityOne = a3;
}

- (void)deletePerplexity
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasPerplexity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPerplexity
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPerplexity:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_float perplexity = a3;
}

- (void)deleteNumInvalidUtterances
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasNumInvalidUtterances:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumInvalidUtterances
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumInvalidUtterances:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numInvalidUtterances = a3;
}

- (void)deleteNumInvalidTokens
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasNumInvalidTokens:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumInvalidTokens
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumInvalidTokens:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int numInvalidTokens = a3;
}

- (void)deleteNumOutOfVocabularyWords
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasNumOutOfVocabularyWords:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumOutOfVocabularyWords
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumOutOfVocabularyWords:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numOutOfVocabularyWords = a3;
}

- (void)deleteNumWords
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasNumWords:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumWords
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumWords:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int numWords = a3;
}

- (void)deleteNumUtterances
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasNumUtterances:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumUtterances
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumUtterances:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numUtterances = a3;
}

- (void)deleteTotalDurationInMs
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasTotalDurationInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTotalDurationInMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTotalDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t totalDurationInMs = a3;
}

- (void)deleteLinearInterpolationWeight
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasLinearInterpolationWeight:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLinearInterpolationWeight
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLinearInterpolationWeight:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_float linearInterpolationWeight = a3;
}

@end