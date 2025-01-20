@interface INFERENCESchemaINFERENCEEuclidDebugMetrics
- (BOOL)hasEuclidScoreStatistics;
- (BOOL)hasEuclidTrialParameters;
- (BOOL)hasIsLmePresent;
- (BOOL)hasNumRowsVectorDb;
- (BOOL)hasTemplateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLmePresent;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEEuclidDebugMetrics)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEEuclidDebugMetrics)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEEuclidScoreStatistics)euclidScoreStatistics;
- (INFERENCESchemaINFERENCEEuclidTrialParameters)euclidTrialParameters;
- (NSArray)euclidEntityTypeMatcheds;
- (NSArray)matchedTemplateIds;
- (NSArray)tokenWiseAsrConfidences;
- (NSData)jsonData;
- (SISchemaUUID)templateId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)matchedTemplateIdsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)euclidEntityTypeMatchedAtIndex:(unint64_t)a3;
- (int)tokenWiseAsrConfidenceAtIndex:(unint64_t)a3;
- (unint64_t)euclidEntityTypeMatchedCount;
- (unint64_t)hash;
- (unint64_t)matchedTemplateIdsCount;
- (unint64_t)tokenWiseAsrConfidenceCount;
- (unsigned)numRowsVectorDb;
- (void)addEuclidEntityTypeMatched:(int)a3;
- (void)addMatchedTemplateIds:(id)a3;
- (void)addTokenWiseAsrConfidence:(int)a3;
- (void)clearEuclidEntityTypeMatched;
- (void)clearMatchedTemplateIds;
- (void)clearTokenWiseAsrConfidence;
- (void)deleteEuclidScoreStatistics;
- (void)deleteEuclidTrialParameters;
- (void)deleteIsLmePresent;
- (void)deleteNumRowsVectorDb;
- (void)deleteTemplateId;
- (void)setEuclidEntityTypeMatcheds:(id)a3;
- (void)setEuclidScoreStatistics:(id)a3;
- (void)setEuclidTrialParameters:(id)a3;
- (void)setHasEuclidScoreStatistics:(BOOL)a3;
- (void)setHasEuclidTrialParameters:(BOOL)a3;
- (void)setHasIsLmePresent:(BOOL)a3;
- (void)setHasNumRowsVectorDb:(BOOL)a3;
- (void)setHasTemplateId:(BOOL)a3;
- (void)setIsLmePresent:(BOOL)a3;
- (void)setMatchedTemplateIds:(id)a3;
- (void)setNumRowsVectorDb:(unsigned int)a3;
- (void)setTemplateId:(id)a3;
- (void)setTokenWiseAsrConfidences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEEuclidDebugMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INFERENCESchemaINFERENCEEuclidDebugMetrics;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self templateId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self deleteTemplateId];
  }
  v9 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidScoreStatistics];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self deleteEuclidScoreStatistics];
  }
  v12 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidTrialParameters];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self deleteEuclidTrialParameters];
  }
  v15 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self matchedTemplateIds];
  v16 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v15 underConditions:v4];
  [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self setMatchedTemplateIds:v16];

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
  objc_storeStrong((id *)&self->_matchedTemplateIds, 0);
  objc_storeStrong((id *)&self->_tokenWiseAsrConfidences, 0);
  objc_storeStrong((id *)&self->_euclidEntityTypeMatcheds, 0);
  objc_storeStrong((id *)&self->_euclidTrialParameters, 0);
  objc_storeStrong((id *)&self->_euclidScoreStatistics, 0);
  objc_storeStrong((id *)&self->_templateId, 0);
}

- (void)setHasEuclidTrialParameters:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasEuclidScoreStatistics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTemplateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMatchedTemplateIds:(id)a3
{
}

- (NSArray)matchedTemplateIds
{
  return self->_matchedTemplateIds;
}

- (unsigned)numRowsVectorDb
{
  return self->_numRowsVectorDb;
}

- (void)setTokenWiseAsrConfidences:(id)a3
{
}

- (NSArray)tokenWiseAsrConfidences
{
  return self->_tokenWiseAsrConfidences;
}

- (BOOL)isLmePresent
{
  return self->_isLmePresent;
}

- (void)setEuclidEntityTypeMatcheds:(id)a3
{
}

- (NSArray)euclidEntityTypeMatcheds
{
  return self->_euclidEntityTypeMatcheds;
}

- (void)setEuclidTrialParameters:(id)a3
{
}

- (INFERENCESchemaINFERENCEEuclidTrialParameters)euclidTrialParameters
{
  return self->_euclidTrialParameters;
}

- (void)setEuclidScoreStatistics:(id)a3
{
}

- (INFERENCESchemaINFERENCEEuclidScoreStatistics)euclidScoreStatistics
{
  return self->_euclidScoreStatistics;
}

- (void)setTemplateId:(id)a3
{
}

- (SISchemaUUID)templateId
{
  return self->_templateId;
}

- (INFERENCESchemaINFERENCEEuclidDebugMetrics)initWithDictionary:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)INFERENCESchemaINFERENCEEuclidDebugMetrics;
  v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)&v57 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"templateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)v5 setTemplateId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"euclidScoreStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[INFERENCESchemaINFERENCEEuclidScoreStatistics alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)v5 setEuclidScoreStatistics:v9];
    }
    v42 = (void *)v8;
    uint64_t v10 = [v4 objectForKeyedSubscript:@"euclidTrialParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[INFERENCESchemaINFERENCEEuclidTrialParameters alloc] initWithDictionary:v10];
      [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)v5 setEuclidTrialParameters:v11];
    }
    v41 = (void *)v10;
    v12 = [v4 objectForKeyedSubscript:@"euclidEntityTypeMatched"];
    objc_opt_class();
    v44 = v12;
    if (objc_opt_isKindOfClass())
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v54 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_super v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[INFERENCESchemaINFERENCEEuclidDebugMetrics addEuclidEntityTypeMatched:](v5, "addEuclidEntityTypeMatched:", [v18 intValue]);
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v60 count:16];
        }
        while (v15);
      }
    }
    v19 = [v4 objectForKeyedSubscript:@"isLmePresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEEuclidDebugMetrics setIsLmePresent:](v5, "setIsLmePresent:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"tokenWiseAsrConfidence"];
    objc_opt_class();
    v43 = (void *)v6;
    v40 = v19;
    if (objc_opt_isKindOfClass())
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v21 = v20;
      id v22 = v20;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v50 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[INFERENCESchemaINFERENCEEuclidDebugMetrics addTokenWiseAsrConfidence:](v5, "addTokenWiseAsrConfidence:", [v27 intValue]);
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v24);
      }

      v19 = v40;
      v20 = v21;
    }
    v28 = [v4 objectForKeyedSubscript:@"numRowsVectorDb"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEEuclidDebugMetrics setNumRowsVectorDb:](v5, "setNumRowsVectorDb:", [v28 unsignedIntValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"matchedTemplateIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = v20;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v58 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v46 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v45 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v36 = [[SISchemaUUID alloc] initWithDictionary:v35];
              [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)v5 addMatchedTemplateIds:v36];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v58 count:16];
        }
        while (v32);
      }

      v19 = v40;
      v20 = v39;
    }
    v37 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEEuclidDebugMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self dictionaryRepresentation];
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
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_euclidEntityTypeMatcheds count])
  {
    id v4 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidEntityTypeMatcheds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"euclidEntityTypeMatched"];
  }
  if (self->_euclidScoreStatistics)
  {
    uint64_t v6 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidScoreStatistics];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"euclidScoreStatistics"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"euclidScoreStatistics"];
    }
  }
  if (self->_euclidTrialParameters)
  {
    v9 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidTrialParameters];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"euclidTrialParameters"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"euclidTrialParameters"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEEuclidDebugMetrics isLmePresent](self, "isLmePresent"));
    [v3 setObject:v12 forKeyedSubscript:@"isLmePresent"];
  }
  if ([(NSArray *)self->_matchedTemplateIds count])
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v14 = self->_matchedTemplateIds;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [MEMORY[0x1E4F1CA98] null];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"matchedTemplateIds"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEEuclidDebugMetrics numRowsVectorDb](self, "numRowsVectorDb"));
    [v3 setObject:v21 forKeyedSubscript:@"numRowsVectorDb"];
  }
  if (self->_templateId)
  {
    id v22 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self templateId];
    uint64_t v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"templateId"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"templateId"];
    }
  }
  if ([(NSArray *)self->_tokenWiseAsrConfidences count])
  {
    uint64_t v25 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self tokenWiseAsrConfidences];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"tokenWiseAsrConfidence"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_templateId hash];
  unint64_t v4 = [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)self->_euclidScoreStatistics hash];
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self->_euclidTrialParameters hash];
  uint64_t v6 = [(NSArray *)self->_euclidEntityTypeMatcheds hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_isLmePresent;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSArray *)self->_tokenWiseAsrConfidences hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_numRowsVectorDb;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSArray *)self->_matchedTemplateIds hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self templateId];
  uint64_t v6 = [v4 templateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self templateId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self templateId];
    uint64_t v10 = [v4 templateId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidScoreStatistics];
  uint64_t v6 = [v4 euclidScoreStatistics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidScoreStatistics];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidScoreStatistics];
    uint64_t v15 = [v4 euclidScoreStatistics];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidTrialParameters];
  uint64_t v6 = [v4 euclidTrialParameters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v17 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidTrialParameters];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidTrialParameters];
    v20 = [v4 euclidTrialParameters];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidEntityTypeMatcheds];
  uint64_t v6 = [v4 euclidEntityTypeMatcheds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v22 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidEntityTypeMatcheds];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidEntityTypeMatcheds];
    uint64_t v25 = [v4 euclidEntityTypeMatcheds];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[72] & 1)) {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isLmePresent = self->_isLmePresent;
    if (isLmePresent != [v4 isLmePresent]) {
      goto LABEL_38;
    }
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self tokenWiseAsrConfidences];
  uint64_t v6 = [v4 tokenWiseAsrConfidences];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self tokenWiseAsrConfidences];
  if (v28)
  {
    long long v29 = (void *)v28;
    long long v30 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self tokenWiseAsrConfidences];
    long long v31 = [v4 tokenWiseAsrConfidences];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  int v33 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v33 != ((v4[72] >> 1) & 1)) {
    goto LABEL_38;
  }
  if (v33)
  {
    unsigned int numRowsVectorDb = self->_numRowsVectorDb;
    if (numRowsVectorDb != [v4 numRowsVectorDb]) {
      goto LABEL_38;
    }
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self matchedTemplateIds];
  uint64_t v6 = [v4 matchedTemplateIds];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v35 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self matchedTemplateIds];
    if (!v35)
    {

LABEL_41:
      BOOL v40 = 1;
      goto LABEL_39;
    }
    v36 = (void *)v35;
    v37 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self matchedTemplateIds];
    v38 = [v4 matchedTemplateIds];
    char v39 = [v37 isEqual:v38];

    if (v39) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v40 = 0;
LABEL_39:

  return v40;
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self templateId];

  if (v5)
  {
    uint64_t v6 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self templateId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidScoreStatistics];

  if (v7)
  {
    uint64_t v8 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidScoreStatistics];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v9 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidTrialParameters];

  if (v9)
  {
    uint64_t v10 = [(INFERENCESchemaINFERENCEEuclidDebugMetrics *)self euclidTrialParameters];
    PBDataWriterWriteSubmessage();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v11 = self->_euclidEntityTypeMatcheds;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v15) intValue];
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v13);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v16 = self->_tokenWiseAsrConfidences;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * v20) intValue];
        PBDataWriterWriteInt32Field();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v18);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v21 = self->_matchedTemplateIds;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v23);
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEEuclidDebugMetricsReadFrom(self, (uint64_t)a3);
}

- (id)matchedTemplateIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matchedTemplateIds objectAtIndexedSubscript:a3];
}

- (unint64_t)matchedTemplateIdsCount
{
  return [(NSArray *)self->_matchedTemplateIds count];
}

- (void)addMatchedTemplateIds:(id)a3
{
  id v4 = a3;
  matchedTemplateIds = self->_matchedTemplateIds;
  id v8 = v4;
  if (!matchedTemplateIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchedTemplateIds;
    self->_matchedTemplateIds = v6;

    id v4 = v8;
    matchedTemplateIds = self->_matchedTemplateIds;
  }
  [(NSArray *)matchedTemplateIds addObject:v4];
}

- (void)clearMatchedTemplateIds
{
}

- (void)deleteNumRowsVectorDb
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumRowsVectorDb:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumRowsVectorDb
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumRowsVectorDb:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numRowsVectorDb = a3;
}

- (int)tokenWiseAsrConfidenceAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_tokenWiseAsrConfidences objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)tokenWiseAsrConfidenceCount
{
  return [(NSArray *)self->_tokenWiseAsrConfidences count];
}

- (void)addTokenWiseAsrConfidence:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  tokenWiseAsrConfidences = self->_tokenWiseAsrConfidences;
  if (!tokenWiseAsrConfidences)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tokenWiseAsrConfidences;
    self->_tokenWiseAsrConfidences = v6;

    tokenWiseAsrConfidences = self->_tokenWiseAsrConfidences;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)tokenWiseAsrConfidences addObject:v8];
}

- (void)clearTokenWiseAsrConfidence
{
}

- (void)deleteIsLmePresent
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsLmePresent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsLmePresent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsLmePresent:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isLmePresent = a3;
}

- (int)euclidEntityTypeMatchedAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_euclidEntityTypeMatcheds objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)euclidEntityTypeMatchedCount
{
  return [(NSArray *)self->_euclidEntityTypeMatcheds count];
}

- (void)addEuclidEntityTypeMatched:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  euclidEntityTypeMatcheds = self->_euclidEntityTypeMatcheds;
  if (!euclidEntityTypeMatcheds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_euclidEntityTypeMatcheds;
    self->_euclidEntityTypeMatcheds = v6;

    euclidEntityTypeMatcheds = self->_euclidEntityTypeMatcheds;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)euclidEntityTypeMatcheds addObject:v8];
}

- (void)clearEuclidEntityTypeMatched
{
}

- (void)deleteEuclidTrialParameters
{
}

- (BOOL)hasEuclidTrialParameters
{
  return self->_euclidTrialParameters != 0;
}

- (void)deleteEuclidScoreStatistics
{
}

- (BOOL)hasEuclidScoreStatistics
{
  return self->_euclidScoreStatistics != 0;
}

- (void)deleteTemplateId
{
}

- (BOOL)hasTemplateId
{
  return self->_templateId != 0;
}

@end