@interface JRSchemaJRInferenceEnded
- (BOOL)hasModelInputShapes;
- (BOOL)hasModelOutputs;
- (BOOL)hasRiskProfile;
- (BOOL)hasTrialConfirmationRate;
- (BOOL)hasTrialDisambiguationRate;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaJRInferenceEnded)initWithDictionary:(id)a3;
- (JRSchemaJRInferenceEnded)initWithJSON:(id)a3;
- (JRSchemaJRModelInputShapes)modelInputShapes;
- (JRSchemaJRModelOutputs)modelOutputs;
- (JRSchemaRiskProfile)riskProfile;
- (NSArray)alreadyPrompteds;
- (NSArray)callerComponents;
- (NSArray)candidateHistoryCounts;
- (NSArray)parameterTypes;
- (NSArray)tupleHistoryCounts;
- (NSData)jsonData;
- (SISchemaVersion)version;
- (float)alreadyPromptedAtIndex:(unint64_t)a3;
- (float)callerComponentAtIndex:(unint64_t)a3;
- (float)parameterTypeAtIndex:(unint64_t)a3;
- (float)trialConfirmationRate;
- (float)trialDisambiguationRate;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)candidateHistoryCountAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)tupleHistoryCountAtIndex:(unint64_t)a3;
- (unint64_t)alreadyPromptedCount;
- (unint64_t)callerComponentCount;
- (unint64_t)candidateHistoryCountCount;
- (unint64_t)hash;
- (unint64_t)parameterTypeCount;
- (unint64_t)tupleHistoryCountCount;
- (void)addAlreadyPrompted:(float)a3;
- (void)addCallerComponent:(float)a3;
- (void)addCandidateHistoryCount:(id)a3;
- (void)addParameterType:(float)a3;
- (void)addTupleHistoryCount:(id)a3;
- (void)clearAlreadyPrompted;
- (void)clearCallerComponent;
- (void)clearCandidateHistoryCount;
- (void)clearParameterType;
- (void)clearTupleHistoryCount;
- (void)deleteModelInputShapes;
- (void)deleteModelOutputs;
- (void)deleteRiskProfile;
- (void)deleteTrialConfirmationRate;
- (void)deleteTrialDisambiguationRate;
- (void)deleteVersion;
- (void)setAlreadyPrompteds:(id)a3;
- (void)setCallerComponents:(id)a3;
- (void)setCandidateHistoryCounts:(id)a3;
- (void)setHasModelInputShapes:(BOOL)a3;
- (void)setHasModelOutputs:(BOOL)a3;
- (void)setHasRiskProfile:(BOOL)a3;
- (void)setHasTrialConfirmationRate:(BOOL)a3;
- (void)setHasTrialDisambiguationRate:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setModelInputShapes:(id)a3;
- (void)setModelOutputs:(id)a3;
- (void)setParameterTypes:(id)a3;
- (void)setRiskProfile:(id)a3;
- (void)setTrialConfirmationRate:(float)a3;
- (void)setTrialDisambiguationRate:(float)a3;
- (void)setTupleHistoryCounts:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaJRInferenceEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)JRSchemaJRInferenceEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v23 applySensitiveConditionsPolicy:v4];
  v6 = [(JRSchemaJRInferenceEnded *)self modelInputShapes];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(JRSchemaJRInferenceEnded *)self deleteModelInputShapes];
  }
  v9 = [(JRSchemaJRInferenceEnded *)self modelOutputs];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(JRSchemaJRInferenceEnded *)self deleteModelOutputs];
  }
  v12 = [(JRSchemaJRInferenceEnded *)self version];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(JRSchemaJRInferenceEnded *)self deleteVersion];
  }
  v15 = [(JRSchemaJRInferenceEnded *)self riskProfile];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(JRSchemaJRInferenceEnded *)self deleteRiskProfile];
  }
  v18 = [(JRSchemaJRInferenceEnded *)self candidateHistoryCounts];
  v19 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v18 underConditions:v4];
  [(JRSchemaJRInferenceEnded *)self setCandidateHistoryCounts:v19];

  v20 = [(JRSchemaJRInferenceEnded *)self tupleHistoryCounts];
  v21 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v20 underConditions:v4];
  [(JRSchemaJRInferenceEnded *)self setTupleHistoryCounts:v21];

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
  objc_storeStrong((id *)&self->_tupleHistoryCounts, 0);
  objc_storeStrong((id *)&self->_candidateHistoryCounts, 0);
  objc_storeStrong((id *)&self->_callerComponents, 0);
  objc_storeStrong((id *)&self->_alreadyPrompteds, 0);
  objc_storeStrong((id *)&self->_parameterTypes, 0);
  objc_storeStrong((id *)&self->_riskProfile, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_modelOutputs, 0);
  objc_storeStrong((id *)&self->_modelInputShapes, 0);
}

- (void)setHasRiskProfile:(BOOL)a3
{
  self->_hasModelInputShapes = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasModelOutputs:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelInputShapes:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTupleHistoryCounts:(id)a3
{
}

- (NSArray)tupleHistoryCounts
{
  return self->_tupleHistoryCounts;
}

- (void)setCandidateHistoryCounts:(id)a3
{
}

- (NSArray)candidateHistoryCounts
{
  return self->_candidateHistoryCounts;
}

- (void)setCallerComponents:(id)a3
{
}

- (NSArray)callerComponents
{
  return self->_callerComponents;
}

- (void)setAlreadyPrompteds:(id)a3
{
}

- (NSArray)alreadyPrompteds
{
  return self->_alreadyPrompteds;
}

- (void)setParameterTypes:(id)a3
{
}

- (NSArray)parameterTypes
{
  return self->_parameterTypes;
}

- (void)setRiskProfile:(id)a3
{
}

- (JRSchemaRiskProfile)riskProfile
{
  return self->_riskProfile;
}

- (float)trialConfirmationRate
{
  return self->_trialConfirmationRate;
}

- (float)trialDisambiguationRate
{
  return self->_trialDisambiguationRate;
}

- (void)setVersion:(id)a3
{
}

- (SISchemaVersion)version
{
  return self->_version;
}

- (void)setModelOutputs:(id)a3
{
}

- (JRSchemaJRModelOutputs)modelOutputs
{
  return self->_modelOutputs;
}

- (void)setModelInputShapes:(id)a3
{
}

- (JRSchemaJRModelInputShapes)modelInputShapes
{
  return self->_modelInputShapes;
}

- (JRSchemaJRInferenceEnded)initWithDictionary:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)JRSchemaJRInferenceEnded;
  v5 = [(JRSchemaJRInferenceEnded *)&v85 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"modelInputShapes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[JRSchemaJRModelInputShapes alloc] initWithDictionary:v6];
      [(JRSchemaJRInferenceEnded *)v5 setModelInputShapes:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"modelOutputs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[JRSchemaJRModelOutputs alloc] initWithDictionary:v8];
      [(JRSchemaJRInferenceEnded *)v5 setModelOutputs:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaVersion alloc] initWithDictionary:v10];
      [(JRSchemaJRInferenceEnded *)v5 setVersion:v11];
    }
    v58 = (void *)v10;
    v12 = [v4 objectForKeyedSubscript:@"trialDisambiguationRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[JRSchemaJRInferenceEnded setTrialDisambiguationRate:](v5, "setTrialDisambiguationRate:");
    }
    v13 = [v4 objectForKeyedSubscript:@"trialConfirmationRate"];
    objc_opt_class();
    v64 = v13;
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[JRSchemaJRInferenceEnded setTrialConfirmationRate:](v5, "setTrialConfirmationRate:");
    }
    v59 = (void *)v8;
    v60 = (void *)v6;
    uint64_t v14 = [v4 objectForKeyedSubscript:@"riskProfile"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[JRSchemaRiskProfile alloc] initWithDictionary:v14];
      [(JRSchemaJRInferenceEnded *)v5 setRiskProfile:v15];
    }
    v57 = (void *)v14;
    v16 = [v4 objectForKeyedSubscript:@"parameterType"];
    objc_opt_class();
    v63 = v16;
    if (objc_opt_isKindOfClass())
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v81 objects:v90 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v82;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v82 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v22 floatValue];
              -[JRSchemaJRInferenceEnded addParameterType:](v5, "addParameterType:");
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v81 objects:v90 count:16];
        }
        while (v19);
      }
    }
    objc_super v23 = [v4 objectForKeyedSubscript:@"alreadyPrompted"];
    objc_opt_class();
    v62 = v23;
    if (objc_opt_isKindOfClass())
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v78;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v78 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v77 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v29 floatValue];
              -[JRSchemaJRInferenceEnded addAlreadyPrompted:](v5, "addAlreadyPrompted:");
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }
        while (v26);
      }
    }
    v30 = [v4 objectForKeyedSubscript:@"callerComponent"];
    objc_opt_class();
    v61 = v30;
    if (objc_opt_isKindOfClass())
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v88 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v74;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v74 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v73 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v36 floatValue];
              -[JRSchemaJRInferenceEnded addCallerComponent:](v5, "addCallerComponent:");
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v73 objects:v88 count:16];
        }
        while (v33);
      }
    }
    v37 = [v4 objectForKeyedSubscript:@"candidateHistoryCount"];
    objc_opt_class();
    v56 = v37;
    if (objc_opt_isKindOfClass())
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v69 objects:v87 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v70;
        do
        {
          for (uint64_t m = 0; m != v40; ++m)
          {
            if (*(void *)v70 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v69 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v44 = [[JRSchemaSegmentedCandidateCount alloc] initWithDictionary:v43];
              [(JRSchemaJRInferenceEnded *)v5 addCandidateHistoryCount:v44];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v69 objects:v87 count:16];
        }
        while (v40);
      }

      v37 = v56;
    }
    v45 = [v4 objectForKeyedSubscript:@"tupleHistoryCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v55 = v12;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v46 = v45;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v65 objects:v86 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v66;
        do
        {
          for (uint64_t n = 0; n != v48; ++n)
          {
            if (*(void *)v66 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v65 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v52 = [[JRSchemaSegmentedTupleCount alloc] initWithDictionary:v51];
              [(JRSchemaJRInferenceEnded *)v5 addTupleHistoryCount:v52];
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v65 objects:v86 count:16];
        }
        while (v48);
      }

      v12 = v55;
      v37 = v56;
    }
    v53 = v5;
  }
  return v5;
}

- (JRSchemaJRInferenceEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(JRSchemaJRInferenceEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaJRInferenceEnded *)self dictionaryRepresentation];
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
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alreadyPrompteds count])
  {
    id v4 = [(JRSchemaJRInferenceEnded *)self alreadyPrompteds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"alreadyPrompted"];
  }
  if ([(NSArray *)self->_callerComponents count])
  {
    uint64_t v6 = [(JRSchemaJRInferenceEnded *)self callerComponents];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"callerComponent"];
  }
  if ([(NSArray *)self->_candidateHistoryCounts count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v9 = self->_candidateHistoryCounts;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v49 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v48 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"candidateHistoryCount"];
  }
  if (self->_modelInputShapes)
  {
    v16 = [(JRSchemaJRInferenceEnded *)self modelInputShapes];
    id v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"modelInputShapes"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"modelInputShapes"];
    }
  }
  if (self->_modelOutputs)
  {
    uint64_t v19 = [(JRSchemaJRInferenceEnded *)self modelOutputs];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"modelOutputs"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"modelOutputs"];
    }
  }
  if ([(NSArray *)self->_parameterTypes count])
  {
    v22 = [(JRSchemaJRInferenceEnded *)self parameterTypes];
    objc_super v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"parameterType"];
  }
  if (self->_riskProfile)
  {
    id v24 = [(JRSchemaJRInferenceEnded *)self riskProfile];
    uint64_t v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"riskProfile"];
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"riskProfile"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v28 = NSNumber;
    [(JRSchemaJRInferenceEnded *)self trialConfirmationRate];
    v29 = objc_msgSend(v28, "numberWithFloat:");
    [v3 setObject:v29 forKeyedSubscript:@"trialConfirmationRate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v30 = NSNumber;
    [(JRSchemaJRInferenceEnded *)self trialDisambiguationRate];
    id v31 = objc_msgSend(v30, "numberWithFloat:");
    [v3 setObject:v31 forKeyedSubscript:@"trialDisambiguationRate"];
  }
  if ([(NSArray *)self->_tupleHistoryCounts count])
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v33 = self->_tupleHistoryCounts;
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * j), "dictionaryRepresentation", (void)v44);
          if (v38)
          {
            [v32 addObject:v38];
          }
          else
          {
            uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
            [v32 addObject:v39];
          }
        }
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v35);
    }

    [v3 setObject:v32 forKeyedSubscript:@"tupleHistoryCount"];
  }
  if (self->_version)
  {
    uint64_t v40 = [(JRSchemaJRInferenceEnded *)self version];
    uint64_t v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"version"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"version"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v44);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(JRSchemaJRModelInputShapes *)self->_modelInputShapes hash];
  unint64_t v4 = [(JRSchemaJRModelOutputs *)self->_modelOutputs hash];
  unint64_t v5 = [(SISchemaVersion *)self->_version hash];
  char has = (char)self->_has;
  if (has)
  {
    float trialDisambiguationRate = self->_trialDisambiguationRate;
    double v9 = trialDisambiguationRate;
    if (trialDisambiguationRate < 0.0) {
      double v9 = -trialDisambiguationRate;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 2) != 0)
  {
    float trialConfirmationRate = self->_trialConfirmationRate;
    double v14 = trialConfirmationRate;
    if (trialConfirmationRate < 0.0) {
      double v14 = -trialConfirmationRate;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  unint64_t v17 = v4 ^ v3 ^ v5 ^ v7;
  unint64_t v18 = v12 ^ [(JRSchemaRiskProfile *)self->_riskProfile hash];
  uint64_t v19 = v17 ^ v18 ^ [(NSArray *)self->_parameterTypes hash];
  uint64_t v20 = [(NSArray *)self->_alreadyPrompteds hash];
  uint64_t v21 = v20 ^ [(NSArray *)self->_callerComponents hash];
  uint64_t v22 = v21 ^ [(NSArray *)self->_candidateHistoryCounts hash];
  return v19 ^ v22 ^ [(NSArray *)self->_tupleHistoryCounts hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self modelInputShapes];
  uint64_t v6 = [v4 modelInputShapes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v7 = [(JRSchemaJRInferenceEnded *)self modelInputShapes];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    double v9 = [(JRSchemaJRInferenceEnded *)self modelInputShapes];
    long double v10 = [v4 modelInputShapes];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self modelOutputs];
  uint64_t v6 = [v4 modelOutputs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v12 = [(JRSchemaJRInferenceEnded *)self modelOutputs];
  if (v12)
  {
    v13 = (void *)v12;
    double v14 = [(JRSchemaJRInferenceEnded *)self modelOutputs];
    long double v15 = [v4 modelOutputs];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self version];
  uint64_t v6 = [v4 version];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v17 = [(JRSchemaJRInferenceEnded *)self version];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    uint64_t v19 = [(JRSchemaJRInferenceEnded *)self version];
    uint64_t v20 = [v4 version];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  $8C52CD87DDAD5C1F54F4D6632678A20E has = self->_has;
  unsigned int v23 = v4[88];
  if ((*(unsigned char *)&has & 1) != (v23 & 1)) {
    goto LABEL_54;
  }
  if (*(unsigned char *)&has)
  {
    float trialDisambiguationRate = self->_trialDisambiguationRate;
    [v4 trialDisambiguationRate];
    if (trialDisambiguationRate != v25) {
      goto LABEL_54;
    }
    $8C52CD87DDAD5C1F54F4D6632678A20E has = self->_has;
    unsigned int v23 = v4[88];
  }
  int v26 = (*(unsigned int *)&has >> 1) & 1;
  if (v26 != ((v23 >> 1) & 1)) {
    goto LABEL_54;
  }
  if (v26)
  {
    float trialConfirmationRate = self->_trialConfirmationRate;
    [v4 trialConfirmationRate];
    if (trialConfirmationRate != v28) {
      goto LABEL_54;
    }
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self riskProfile];
  uint64_t v6 = [v4 riskProfile];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v29 = [(JRSchemaJRInferenceEnded *)self riskProfile];
  if (v29)
  {
    v30 = (void *)v29;
    id v31 = [(JRSchemaJRInferenceEnded *)self riskProfile];
    uint64_t v32 = [v4 riskProfile];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self parameterTypes];
  uint64_t v6 = [v4 parameterTypes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v34 = [(JRSchemaJRInferenceEnded *)self parameterTypes];
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v36 = [(JRSchemaJRInferenceEnded *)self parameterTypes];
    v37 = [v4 parameterTypes];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self alreadyPrompteds];
  uint64_t v6 = [v4 alreadyPrompteds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v39 = [(JRSchemaJRInferenceEnded *)self alreadyPrompteds];
  if (v39)
  {
    uint64_t v40 = (void *)v39;
    uint64_t v41 = [(JRSchemaJRInferenceEnded *)self alreadyPrompteds];
    v42 = [v4 alreadyPrompteds];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self callerComponents];
  uint64_t v6 = [v4 callerComponents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v44 = [(JRSchemaJRInferenceEnded *)self callerComponents];
  if (v44)
  {
    long long v45 = (void *)v44;
    long long v46 = [(JRSchemaJRInferenceEnded *)self callerComponents];
    long long v47 = [v4 callerComponents];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self candidateHistoryCounts];
  uint64_t v6 = [v4 candidateHistoryCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v49 = [(JRSchemaJRInferenceEnded *)self candidateHistoryCounts];
  if (v49)
  {
    long long v50 = (void *)v49;
    long long v51 = [(JRSchemaJRInferenceEnded *)self candidateHistoryCounts];
    v52 = [v4 candidateHistoryCounts];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self tupleHistoryCounts];
  uint64_t v6 = [v4 tupleHistoryCounts];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_53:

    goto LABEL_54;
  }
  uint64_t v54 = [(JRSchemaJRInferenceEnded *)self tupleHistoryCounts];
  if (!v54)
  {

LABEL_57:
    BOOL v59 = 1;
    goto LABEL_55;
  }
  v55 = (void *)v54;
  v56 = [(JRSchemaJRInferenceEnded *)self tupleHistoryCounts];
  v57 = [v4 tupleHistoryCounts];
  char v58 = [v56 isEqual:v57];

  if (v58) {
    goto LABEL_57;
  }
LABEL_54:
  BOOL v59 = 0;
LABEL_55:

  return v59;
}

- (void)writeTo:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(JRSchemaJRInferenceEnded *)self modelInputShapes];

  if (v5)
  {
    uint64_t v6 = [(JRSchemaJRInferenceEnded *)self modelInputShapes];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(JRSchemaJRInferenceEnded *)self modelOutputs];

  if (v7)
  {
    uint64_t v8 = [(JRSchemaJRInferenceEnded *)self modelOutputs];
    PBDataWriterWriteSubmessage();
  }
  double v9 = [(JRSchemaJRInferenceEnded *)self version];

  if (v9)
  {
    long double v10 = [(JRSchemaJRInferenceEnded *)self version];
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
  uint64_t v12 = [(JRSchemaJRInferenceEnded *)self riskProfile];

  if (v12)
  {
    v13 = [(JRSchemaJRInferenceEnded *)self riskProfile];
    PBDataWriterWriteSubmessage();
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  double v14 = self->_parameterTypes;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v56 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v55 + 1) + 8 * i) floatValue];
        PBDataWriterWriteFloatField();
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v16);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v19 = self->_alreadyPrompteds;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v51 + 1) + 8 * j) floatValue];
        PBDataWriterWriteFloatField();
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v21);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v24 = self->_callerComponents;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v47 + 1) + 8 * k) floatValue];
        PBDataWriterWriteFloatField();
      }
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v26);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v29 = self->_candidateHistoryCounts;
  uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v31);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v34 = self->_tupleHistoryCounts;
  uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v34);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v36);
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRInferenceEndedReadFrom(self, (uint64_t)a3, v3);
}

- (id)tupleHistoryCountAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tupleHistoryCounts objectAtIndexedSubscript:a3];
}

- (unint64_t)tupleHistoryCountCount
{
  return [(NSArray *)self->_tupleHistoryCounts count];
}

- (void)addTupleHistoryCount:(id)a3
{
  id v4 = a3;
  tupleHistoryCounts = self->_tupleHistoryCounts;
  id v8 = v4;
  if (!tupleHistoryCounts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tupleHistoryCounts;
    self->_tupleHistoryCounts = v6;

    id v4 = v8;
    tupleHistoryCounts = self->_tupleHistoryCounts;
  }
  [(NSArray *)tupleHistoryCounts addObject:v4];
}

- (void)clearTupleHistoryCount
{
}

- (id)candidateHistoryCountAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_candidateHistoryCounts objectAtIndexedSubscript:a3];
}

- (unint64_t)candidateHistoryCountCount
{
  return [(NSArray *)self->_candidateHistoryCounts count];
}

- (void)addCandidateHistoryCount:(id)a3
{
  id v4 = a3;
  candidateHistoryCounts = self->_candidateHistoryCounts;
  id v8 = v4;
  if (!candidateHistoryCounts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_candidateHistoryCounts;
    self->_candidateHistoryCounts = v6;

    id v4 = v8;
    candidateHistoryCounts = self->_candidateHistoryCounts;
  }
  [(NSArray *)candidateHistoryCounts addObject:v4];
}

- (void)clearCandidateHistoryCount
{
}

- (float)callerComponentAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_callerComponents objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)callerComponentCount
{
  return [(NSArray *)self->_callerComponents count];
}

- (void)addCallerComponent:(float)a3
{
  callerComponents = self->_callerComponents;
  if (!callerComponents)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_callerComponents;
    self->_callerComponents = v6;

    callerComponents = self->_callerComponents;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)callerComponents addObject:v9];
}

- (void)clearCallerComponent
{
}

- (float)alreadyPromptedAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_alreadyPrompteds objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)alreadyPromptedCount
{
  return [(NSArray *)self->_alreadyPrompteds count];
}

- (void)addAlreadyPrompted:(float)a3
{
  alreadyPrompteds = self->_alreadyPrompteds;
  if (!alreadyPrompteds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alreadyPrompteds;
    self->_alreadyPrompteds = v6;

    alreadyPrompteds = self->_alreadyPrompteds;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)alreadyPrompteds addObject:v9];
}

- (void)clearAlreadyPrompted
{
}

- (float)parameterTypeAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_parameterTypes objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)parameterTypeCount
{
  return [(NSArray *)self->_parameterTypes count];
}

- (void)addParameterType:(float)a3
{
  parameterTypes = self->_parameterTypes;
  if (!parameterTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_parameterTypes;
    self->_parameterTypes = v6;

    parameterTypes = self->_parameterTypes;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)parameterTypes addObject:v9];
}

- (void)clearParameterType
{
}

- (void)deleteRiskProfile
{
}

- (BOOL)hasRiskProfile
{
  return self->_riskProfile != 0;
}

- (void)deleteTrialConfirmationRate
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTrialConfirmationRate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTrialConfirmationRate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTrialConfirmationRate:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float trialConfirmationRate = a3;
}

- (void)deleteTrialDisambiguationRate
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTrialDisambiguationRate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTrialDisambiguationRate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTrialDisambiguationRate:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float trialDisambiguationRate = a3;
}

- (void)deleteVersion
{
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)deleteModelOutputs
{
}

- (BOOL)hasModelOutputs
{
  return self->_modelOutputs != 0;
}

- (void)deleteModelInputShapes
{
}

- (BOOL)hasModelInputShapes
{
  return self->_modelInputShapes != 0;
}

@end