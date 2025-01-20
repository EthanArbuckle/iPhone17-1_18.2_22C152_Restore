@interface DODMLASRSchemaDODMLASRDecodingMetrics
- (BOOL)hasAverageActiveTokensPerFrame;
- (BOOL)hasJitLanguageModelEnrollmentDurationInMs;
- (BOOL)hasJitQueryDurationInMs;
- (BOOL)hasWallRealTimeFactor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRDecodingMetrics)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRDecodingMetrics)initWithJSON:(id)a3;
- (NSArray)languageModelInterpolationWeights;
- (NSArray)postprocessingEntityCategoryCounts;
- (NSArray)preprocessingEntityCategoryCounts;
- (NSData)jsonData;
- (float)averageActiveTokensPerFrame;
- (float)wallRealTimeFactor;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)languageModelInterpolationWeightsAtIndex:(unint64_t)a3;
- (id)postprocessingEntityCategoryCountsAtIndex:(unint64_t)a3;
- (id)preprocessingEntityCategoryCountsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)jitLanguageModelEnrollmentDurationInMs;
- (unint64_t)jitQueryDurationInMs;
- (unint64_t)languageModelInterpolationWeightsCount;
- (unint64_t)postprocessingEntityCategoryCountsCount;
- (unint64_t)preprocessingEntityCategoryCountsCount;
- (void)addLanguageModelInterpolationWeights:(id)a3;
- (void)addPostprocessingEntityCategoryCounts:(id)a3;
- (void)addPreprocessingEntityCategoryCounts:(id)a3;
- (void)clearLanguageModelInterpolationWeights;
- (void)clearPostprocessingEntityCategoryCounts;
- (void)clearPreprocessingEntityCategoryCounts;
- (void)deleteAverageActiveTokensPerFrame;
- (void)deleteJitLanguageModelEnrollmentDurationInMs;
- (void)deleteJitQueryDurationInMs;
- (void)deleteWallRealTimeFactor;
- (void)setAverageActiveTokensPerFrame:(float)a3;
- (void)setHasAverageActiveTokensPerFrame:(BOOL)a3;
- (void)setHasJitLanguageModelEnrollmentDurationInMs:(BOOL)a3;
- (void)setHasJitQueryDurationInMs:(BOOL)a3;
- (void)setHasWallRealTimeFactor:(BOOL)a3;
- (void)setJitLanguageModelEnrollmentDurationInMs:(unint64_t)a3;
- (void)setJitQueryDurationInMs:(unint64_t)a3;
- (void)setLanguageModelInterpolationWeights:(id)a3;
- (void)setPostprocessingEntityCategoryCounts:(id)a3;
- (void)setPreprocessingEntityCategoryCounts:(id)a3;
- (void)setWallRealTimeFactor:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRDecodingMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DODMLASRSchemaDODMLASRDecodingMetrics;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self languageModelInterpolationWeights];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(DODMLASRSchemaDODMLASRDecodingMetrics *)self setLanguageModelInterpolationWeights:v7];

  v8 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self preprocessingEntityCategoryCounts];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(DODMLASRSchemaDODMLASRDecodingMetrics *)self setPreprocessingEntityCategoryCounts:v9];

  v10 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self postprocessingEntityCategoryCounts];
  v11 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v10 underConditions:v4];

  [(DODMLASRSchemaDODMLASRDecodingMetrics *)self setPostprocessingEntityCategoryCounts:v11];
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
  objc_storeStrong((id *)&self->_postprocessingEntityCategoryCounts, 0);
  objc_storeStrong((id *)&self->_preprocessingEntityCategoryCounts, 0);
  objc_storeStrong((id *)&self->_languageModelInterpolationWeights, 0);
}

- (void)setPostprocessingEntityCategoryCounts:(id)a3
{
}

- (NSArray)postprocessingEntityCategoryCounts
{
  return self->_postprocessingEntityCategoryCounts;
}

- (void)setPreprocessingEntityCategoryCounts:(id)a3
{
}

- (NSArray)preprocessingEntityCategoryCounts
{
  return self->_preprocessingEntityCategoryCounts;
}

- (unint64_t)jitLanguageModelEnrollmentDurationInMs
{
  return self->_jitLanguageModelEnrollmentDurationInMs;
}

- (unint64_t)jitQueryDurationInMs
{
  return self->_jitQueryDurationInMs;
}

- (float)averageActiveTokensPerFrame
{
  return self->_averageActiveTokensPerFrame;
}

- (void)setLanguageModelInterpolationWeights:(id)a3
{
}

- (NSArray)languageModelInterpolationWeights
{
  return self->_languageModelInterpolationWeights;
}

- (float)wallRealTimeFactor
{
  return self->_wallRealTimeFactor;
}

- (DODMLASRSchemaDODMLASRDecodingMetrics)initWithDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)DODMLASRSchemaDODMLASRDecodingMetrics;
  v5 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)&v53 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"wallRealTimeFactor"];
    objc_opt_class();
    v40 = v6;
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[DODMLASRSchemaDODMLASRDecodingMetrics setWallRealTimeFactor:](v5, "setWallRealTimeFactor:");
    }
    v7 = [v4 objectForKeyedSubscript:@"languageModelInterpolationWeights"];
    objc_opt_class();
    v39 = v7;
    if (objc_opt_isKindOfClass())
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v50 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[ASRSchemaASRInterpolationWeightBundle alloc] initWithDictionary:v13];
              [(DODMLASRSchemaDODMLASRDecodingMetrics *)v5 addLanguageModelInterpolationWeights:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v56 count:16];
        }
        while (v10);
      }
    }
    v15 = [v4 objectForKeyedSubscript:@"averageActiveTokensPerFrame"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[DODMLASRSchemaDODMLASRDecodingMetrics setAverageActiveTokensPerFrame:](v5, "setAverageActiveTokensPerFrame:");
    }
    v16 = [v4 objectForKeyedSubscript:@"jitQueryDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRDecodingMetrics setJitQueryDurationInMs:](v5, "setJitQueryDurationInMs:", [v16 unsignedLongLongValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"jitLanguageModelEnrollmentDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRDecodingMetrics setJitLanguageModelEnrollmentDurationInMs:](v5, "setJitLanguageModelEnrollmentDurationInMs:", [v17 unsignedLongLongValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"preprocessingEntityCategoryCounts"];
    objc_opt_class();
    v37 = v16;
    v38 = v15;
    if (objc_opt_isKindOfClass())
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v19 = v18;
      id v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v46 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v26 = [[DODMLASRSchemaDODMLASREntityCategoryCount alloc] initWithDictionary:v25];
              [(DODMLASRSchemaDODMLASRDecodingMetrics *)v5 addPreprocessingEntityCategoryCounts:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v22);
      }

      v15 = v38;
      v18 = v19;
    }
    v27 = [v4 objectForKeyedSubscript:@"postprocessingEntityCategoryCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v42;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v42 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v41 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [[DODMLASRSchemaDODMLASREntityCategoryCount alloc] initWithDictionary:v33];
              [(DODMLASRSchemaDODMLASRDecodingMetrics *)v5 addPostprocessingEntityCategoryCounts:v34];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
        }
        while (v30);
      }

      v16 = v37;
      v15 = v38;
    }
    v35 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRDecodingMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self dictionaryRepresentation];
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
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = NSNumber;
    [(DODMLASRSchemaDODMLASRDecodingMetrics *)self averageActiveTokensPerFrame];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"averageActiveTokensPerFrame"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRDecodingMetrics jitLanguageModelEnrollmentDurationInMs](self, "jitLanguageModelEnrollmentDurationInMs"));
    [v3 setObject:v7 forKeyedSubscript:@"jitLanguageModelEnrollmentDurationInMs"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRDecodingMetrics jitQueryDurationInMs](self, "jitQueryDurationInMs"));
    [v3 setObject:v8 forKeyedSubscript:@"jitQueryDurationInMs"];
  }
  if ([(NSArray *)self->_languageModelInterpolationWeights count])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v10 = self->_languageModelInterpolationWeights;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dictionaryRepresentation];
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"languageModelInterpolationWeights"];
  }
  if ([(NSArray *)self->_postprocessingEntityCategoryCounts count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v18 = self->_postprocessingEntityCategoryCounts;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v40 + 1) + 8 * j) dictionaryRepresentation];
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"postprocessingEntityCategoryCounts"];
  }
  if ([(NSArray *)self->_preprocessingEntityCategoryCounts count])
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v26 = self->_preprocessingEntityCategoryCounts;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = [*(id *)(*((void *)&v36 + 1) + 8 * k) dictionaryRepresentation];
          if (v31)
          {
            [v25 addObject:v31];
          }
          else
          {
            v32 = [MEMORY[0x1E4F1CA98] null];
            [v25 addObject:v32];
          }
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKeyedSubscript:@"preprocessingEntityCategoryCounts"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v33 = NSNumber;
    [(DODMLASRSchemaDODMLASRDecodingMetrics *)self wallRealTimeFactor];
    v34 = objc_msgSend(v33, "numberWithFloat:");
    [v3 setObject:v34 forKeyedSubscript:@"wallRealTimeFactor"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    float wallRealTimeFactor = self->_wallRealTimeFactor;
    double v5 = wallRealTimeFactor;
    if (wallRealTimeFactor < 0.0) {
      double v5 = -wallRealTimeFactor;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = [(NSArray *)self->_languageModelInterpolationWeights hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    double v12 = averageActiveTokensPerFrame;
    if (averageActiveTokensPerFrame < 0.0) {
      double v12 = -averageActiveTokensPerFrame;
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
  if ((has & 4) != 0)
  {
    unint64_t v15 = 2654435761u * self->_jitQueryDurationInMs;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    unint64_t v16 = 0;
    goto LABEL_22;
  }
  unint64_t v15 = 0;
  if ((has & 8) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  unint64_t v16 = 2654435761u * self->_jitLanguageModelEnrollmentDurationInMs;
LABEL_22:
  uint64_t v17 = v8 ^ v3 ^ v10 ^ v15 ^ v16 ^ [(NSArray *)self->_preprocessingEntityCategoryCounts hash];
  return v17 ^ [(NSArray *)self->_postprocessingEntityCategoryCounts hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[64] & 1)) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    float wallRealTimeFactor = self->_wallRealTimeFactor;
    [v4 wallRealTimeFactor];
    if (wallRealTimeFactor != v6) {
      goto LABEL_31;
    }
  }
  double v7 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self languageModelInterpolationWeights];
  uint64_t v8 = [v4 languageModelInterpolationWeights];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_30;
  }
  uint64_t v9 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self languageModelInterpolationWeights];
  if (v9)
  {
    unint64_t v10 = (void *)v9;
    uint64_t v11 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self languageModelInterpolationWeights];
    double v12 = [v4 languageModelInterpolationWeights];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  $1F7AC36998D52673157267D164F427FB has = self->_has;
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v16 = v4[64];
  if (v15 != ((v16 >> 1) & 1)) {
    goto LABEL_31;
  }
  if (v15)
  {
    float averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    [v4 averageActiveTokensPerFrame];
    if (averageActiveTokensPerFrame != v18) {
      goto LABEL_31;
    }
    $1F7AC36998D52673157267D164F427FB has = self->_has;
    unsigned int v16 = v4[64];
  }
  int v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1)) {
    goto LABEL_31;
  }
  if (v19)
  {
    unint64_t jitQueryDurationInMs = self->_jitQueryDurationInMs;
    if (jitQueryDurationInMs != [v4 jitQueryDurationInMs]) {
      goto LABEL_31;
    }
    $1F7AC36998D52673157267D164F427FB has = self->_has;
    unsigned int v16 = v4[64];
  }
  int v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v16 >> 3) & 1)) {
    goto LABEL_31;
  }
  if (v21)
  {
    unint64_t jitLanguageModelEnrollmentDurationInMs = self->_jitLanguageModelEnrollmentDurationInMs;
    if (jitLanguageModelEnrollmentDurationInMs != [v4 jitLanguageModelEnrollmentDurationInMs]) {
      goto LABEL_31;
    }
  }
  double v7 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self preprocessingEntityCategoryCounts];
  uint64_t v8 = [v4 preprocessingEntityCategoryCounts];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_30;
  }
  uint64_t v23 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self preprocessingEntityCategoryCounts];
  if (v23)
  {
    v24 = (void *)v23;
    uint64_t v25 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self preprocessingEntityCategoryCounts];
    v26 = [v4 preprocessingEntityCategoryCounts];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  double v7 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self postprocessingEntityCategoryCounts];
  uint64_t v8 = [v4 postprocessingEntityCategoryCounts];
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v28 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self postprocessingEntityCategoryCounts];
  if (!v28)
  {

LABEL_34:
    BOOL v33 = 1;
    goto LABEL_32;
  }
  uint64_t v29 = (void *)v28;
  uint64_t v30 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self postprocessingEntityCategoryCounts];
  uint64_t v31 = [v4 postprocessingEntityCategoryCounts];
  char v32 = [v30 isEqual:v31];

  if (v32) {
    goto LABEL_34;
  }
LABEL_31:
  BOOL v33 = 0;
LABEL_32:

  return v33;
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v5 = self->_languageModelInterpolationWeights;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint64Field();
LABEL_14:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = self->_preprocessingEntityCategoryCounts;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unsigned int v16 = self->_postprocessingEntityCategoryCounts;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRDecodingMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (id)postprocessingEntityCategoryCountsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_postprocessingEntityCategoryCounts objectAtIndexedSubscript:a3];
}

- (unint64_t)postprocessingEntityCategoryCountsCount
{
  return [(NSArray *)self->_postprocessingEntityCategoryCounts count];
}

- (void)addPostprocessingEntityCategoryCounts:(id)a3
{
  id v4 = a3;
  postprocessingEntityCategoryCounts = self->_postprocessingEntityCategoryCounts;
  id v8 = v4;
  if (!postprocessingEntityCategoryCounts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_postprocessingEntityCategoryCounts;
    self->_postprocessingEntityCategoryCounts = v6;

    id v4 = v8;
    postprocessingEntityCategoryCounts = self->_postprocessingEntityCategoryCounts;
  }
  [(NSArray *)postprocessingEntityCategoryCounts addObject:v4];
}

- (void)clearPostprocessingEntityCategoryCounts
{
}

- (id)preprocessingEntityCategoryCountsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_preprocessingEntityCategoryCounts objectAtIndexedSubscript:a3];
}

- (unint64_t)preprocessingEntityCategoryCountsCount
{
  return [(NSArray *)self->_preprocessingEntityCategoryCounts count];
}

- (void)addPreprocessingEntityCategoryCounts:(id)a3
{
  id v4 = a3;
  preprocessingEntityCategoryCounts = self->_preprocessingEntityCategoryCounts;
  id v8 = v4;
  if (!preprocessingEntityCategoryCounts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_preprocessingEntityCategoryCounts;
    self->_preprocessingEntityCategoryCounts = v6;

    id v4 = v8;
    preprocessingEntityCategoryCounts = self->_preprocessingEntityCategoryCounts;
  }
  [(NSArray *)preprocessingEntityCategoryCounts addObject:v4];
}

- (void)clearPreprocessingEntityCategoryCounts
{
}

- (void)deleteJitLanguageModelEnrollmentDurationInMs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasJitLanguageModelEnrollmentDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasJitLanguageModelEnrollmentDurationInMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setJitLanguageModelEnrollmentDurationInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t jitLanguageModelEnrollmentDurationInMs = a3;
}

- (void)deleteJitQueryDurationInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasJitQueryDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasJitQueryDurationInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setJitQueryDurationInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t jitQueryDurationInMs = a3;
}

- (void)deleteAverageActiveTokensPerFrame
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAverageActiveTokensPerFrame:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAverageActiveTokensPerFrame
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAverageActiveTokensPerFrame:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float averageActiveTokensPerFrame = a3;
}

- (id)languageModelInterpolationWeightsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_languageModelInterpolationWeights objectAtIndexedSubscript:a3];
}

- (unint64_t)languageModelInterpolationWeightsCount
{
  return [(NSArray *)self->_languageModelInterpolationWeights count];
}

- (void)addLanguageModelInterpolationWeights:(id)a3
{
  id v4 = a3;
  languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  id v8 = v4;
  if (!languageModelInterpolationWeights)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_languageModelInterpolationWeights;
    self->_languageModelInterpolationWeights = v6;

    id v4 = v8;
    languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  }
  [(NSArray *)languageModelInterpolationWeights addObject:v4];
}

- (void)clearLanguageModelInterpolationWeights
{
}

- (void)deleteWallRealTimeFactor
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasWallRealTimeFactor:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWallRealTimeFactor
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWallRealTimeFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float wallRealTimeFactor = a3;
}

@end