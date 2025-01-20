@interface EXPSiriSchemaEXPServerCounterfactualTriggeredTier1
- (BOOL)hasCodepathId;
- (BOOL)hasCompareRankingAtK;
- (BOOL)hasCounterfactualSummary;
- (BOOL)hasDiffOutcome;
- (BOOL)hasIsCounterfactualDifferent;
- (BOOL)hasKValue;
- (BOOL)hasPegasusId;
- (BOOL)hasTreatmentSummary;
- (BOOL)isCounterfactualDifferent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)initWithDictionary:(id)a3;
- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)initWithJSON:(id)a3;
- (EXPSiriSchemaEXPSiriPegasusResponseSummary)counterfactualSummary;
- (EXPSiriSchemaEXPSiriPegasusResponseSummary)treatmentSummary;
- (NSArray)allocations;
- (NSArray)counterfactualAllocations;
- (NSData)jsonData;
- (SISchemaUUID)codepathId;
- (SISchemaUUID)pegasusId;
- (float)compareRankingAtK;
- (id)allocationAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)counterfactualAllocationAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)diffOutcome;
- (int64_t)kValue;
- (unint64_t)allocationCount;
- (unint64_t)counterfactualAllocationCount;
- (unint64_t)hash;
- (void)addAllocation:(id)a3;
- (void)addCounterfactualAllocation:(id)a3;
- (void)clearAllocation;
- (void)clearCounterfactualAllocation;
- (void)deleteCodepathId;
- (void)deleteCompareRankingAtK;
- (void)deleteCounterfactualSummary;
- (void)deleteDiffOutcome;
- (void)deleteIsCounterfactualDifferent;
- (void)deleteKValue;
- (void)deletePegasusId;
- (void)deleteTreatmentSummary;
- (void)setAllocations:(id)a3;
- (void)setCodepathId:(id)a3;
- (void)setCompareRankingAtK:(float)a3;
- (void)setCounterfactualAllocations:(id)a3;
- (void)setCounterfactualSummary:(id)a3;
- (void)setDiffOutcome:(int)a3;
- (void)setHasCodepathId:(BOOL)a3;
- (void)setHasCompareRankingAtK:(BOOL)a3;
- (void)setHasCounterfactualSummary:(BOOL)a3;
- (void)setHasDiffOutcome:(BOOL)a3;
- (void)setHasIsCounterfactualDifferent:(BOOL)a3;
- (void)setHasKValue:(BOOL)a3;
- (void)setHasPegasusId:(BOOL)a3;
- (void)setHasTreatmentSummary:(BOOL)a3;
- (void)setIsCounterfactualDifferent:(BOOL)a3;
- (void)setKValue:(int64_t)a3;
- (void)setPegasusId:(id)a3;
- (void)setTreatmentSummary:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSiriSchemaEXPServerCounterfactualTriggeredTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EXPSiriSchemaEXPServerCounterfactualTriggeredTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v23 applySensitiveConditionsPolicy:v4];
  v6 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self allocations];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self setAllocations:v7];

  v8 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self codepathId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self deleteCodepathId];
  }
  v11 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self pegasusId];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self deletePegasusId];
  }
  v14 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualAllocations];
  v15 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v14 underConditions:v4];
  [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self setCounterfactualAllocations:v15];

  v16 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self treatmentSummary];
  v17 = [v16 applySensitiveConditionsPolicy:v4];
  int v18 = [v17 suppressMessage];

  if (v18) {
    [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self deleteTreatmentSummary];
  }
  v19 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualSummary];
  v20 = [v19 applySensitiveConditionsPolicy:v4];
  int v21 = [v20 suppressMessage];

  if (v21) {
    [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self deleteCounterfactualSummary];
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
  objc_storeStrong((id *)&self->_counterfactualSummary, 0);
  objc_storeStrong((id *)&self->_treatmentSummary, 0);
  objc_storeStrong((id *)&self->_counterfactualAllocations, 0);
  objc_storeStrong((id *)&self->_pegasusId, 0);
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_allocations, 0);
}

- (void)setHasCounterfactualSummary:(BOOL)a3
{
  self->_hasCodepathId = a3;
}

- (void)setHasTreatmentSummary:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPegasusId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCodepathId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCounterfactualSummary:(id)a3
{
}

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)counterfactualSummary
{
  return self->_counterfactualSummary;
}

- (void)setTreatmentSummary:(id)a3
{
}

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)treatmentSummary
{
  return self->_treatmentSummary;
}

- (int)diffOutcome
{
  return self->_diffOutcome;
}

- (int64_t)kValue
{
  return self->_kValue;
}

- (float)compareRankingAtK
{
  return self->_compareRankingAtK;
}

- (BOOL)isCounterfactualDifferent
{
  return self->_isCounterfactualDifferent;
}

- (void)setCounterfactualAllocations:(id)a3
{
}

- (NSArray)counterfactualAllocations
{
  return self->_counterfactualAllocations;
}

- (void)setPegasusId:(id)a3
{
}

- (SISchemaUUID)pegasusId
{
  return self->_pegasusId;
}

- (void)setCodepathId:(id)a3
{
}

- (SISchemaUUID)codepathId
{
  return self->_codepathId;
}

- (void)setAllocations:(id)a3
{
}

- (NSArray)allocations
{
  return self->_allocations;
}

- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)initWithDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)EXPSiriSchemaEXPServerCounterfactualTriggeredTier1;
  v5 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)&v48 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"allocation"];
    objc_opt_class();
    v39 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v45 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v13 = [[EXPSchemaEXPTrialExperiment alloc] initWithDictionary:v12];
              [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)v5 addAllocation:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v9);
      }
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"codepathId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)v5 setCodepathId:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"pegasusId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
      [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)v5 setPegasusId:v17];
    }
    v37 = (void *)v16;
    v38 = (void *)v14;
    int v18 = [v4 objectForKeyedSubscript:@"counterfactualAllocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = [[EXPSchemaEXPTrialExperiment alloc] initWithDictionary:v24];
              [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)v5 addCounterfactualAllocation:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v21);
      }
    }
    v26 = [v4 objectForKeyedSubscript:@"isCounterfactualDifferent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setIsCounterfactualDifferent:](v5, "setIsCounterfactualDifferent:", [v26 BOOLValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"compareRankingAtK"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v27 floatValue];
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCompareRankingAtK:](v5, "setCompareRankingAtK:");
    }
    v28 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kValue", v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setKValue:](v5, "setKValue:", [v28 longLongValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"diffOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setDiffOutcome:](v5, "setDiffOutcome:", [v29 intValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"treatmentSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[EXPSiriSchemaEXPSiriPegasusResponseSummary alloc] initWithDictionary:v30];
      [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)v5 setTreatmentSummary:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"counterfactualSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[EXPSiriSchemaEXPSiriPegasusResponseSummary alloc] initWithDictionary:v32];
      [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)v5 setCounterfactualSummary:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self dictionaryRepresentation];
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
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_allocations count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v5 = self->_allocations;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"allocation"];
  }
  if (self->_codepathId)
  {
    uint64_t v12 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self codepathId];
    int v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"codepathId"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"codepathId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v15 = NSNumber;
    [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self compareRankingAtK];
    uint64_t v16 = objc_msgSend(v15, "numberWithFloat:");
    [v3 setObject:v16 forKeyedSubscript:@"compareRankingAtK"];
  }
  if ([(NSArray *)self->_counterfactualAllocations count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    int v18 = self->_counterfactualAllocations;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
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
          objc_super v23 = [*(id *)(*((void *)&v40 + 1) + 8 * j) dictionaryRepresentation];
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"counterfactualAllocation"];
  }
  if (self->_counterfactualSummary)
  {
    v25 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualSummary];
    v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"counterfactualSummary"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"counterfactualSummary"];
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    unsigned int v32 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self diffOutcome] - 1;
    if (v32 > 0x13) {
      v33 = @"EXPSIRIDIFFOUTCOME_UNKNOWN";
    }
    else {
      v33 = off_1E5EAE658[v32];
    }
    [v3 setObject:v33 forKeyedSubscript:@"diffOutcome"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_39:
      if ((has & 4) == 0) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_39;
  }
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 isCounterfactualDifferent](self, "isCounterfactualDifferent"));
  [v3 setObject:v34 forKeyedSubscript:@"isCounterfactualDifferent"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_40:
    v29 = objc_msgSend(NSNumber, "numberWithLongLong:", -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 kValue](self, "kValue"));
    [v3 setObject:v29 forKeyedSubscript:@"kValue"];
  }
LABEL_41:
  if (self->_pegasusId)
  {
    v30 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self pegasusId];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"pegasusId"];
    }
    else
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"pegasusId"];
    }
  }
  if (self->_treatmentSummary)
  {
    v36 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self treatmentSummary];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"treatmentSummary"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"treatmentSummary"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_allocations hash];
  unint64_t v4 = [(SISchemaUUID *)self->_codepathId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_pegasusId hash];
  uint64_t v6 = [(NSArray *)self->_counterfactualAllocations hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = 2654435761 * self->_isCounterfactualDifferent;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v13 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float compareRankingAtK = self->_compareRankingAtK;
  double v10 = compareRankingAtK;
  if (compareRankingAtK < 0.0) {
    double v10 = -compareRankingAtK;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    uint64_t v14 = 2654435761 * self->_kValue;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  uint64_t v14 = 0;
  if ((has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v15 = 2654435761 * self->_diffOutcome;
LABEL_16:
  unint64_t v16 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v17 = v8 ^ v13 ^ v14 ^ v15 ^ [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self->_treatmentSummary hash];
  return v16 ^ v17 ^ [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self->_counterfactualSummary hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  unint64_t v5 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self allocations];
  uint64_t v6 = [v4 allocations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self allocations];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self allocations];
    double v10 = [v4 allocations];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self codepathId];
  uint64_t v6 = [v4 codepathId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self codepathId];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    uint64_t v14 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self codepathId];
    uint64_t v15 = [v4 codepathId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self pegasusId];
  uint64_t v6 = [v4 pegasusId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self pegasusId];
  if (v17)
  {
    int v18 = (void *)v17;
    uint64_t v19 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self pegasusId];
    uint64_t v20 = [v4 pegasusId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualAllocations];
  uint64_t v6 = [v4 counterfactualAllocations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualAllocations];
  if (v22)
  {
    objc_super v23 = (void *)v22;
    uint64_t v24 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualAllocations];
    v25 = [v4 counterfactualAllocations];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  $CC07B3F0AB7B5DADFB069DF7BB7D08AC has = self->_has;
  unsigned int v28 = v4[80];
  if ((*(unsigned char *)&has & 1) != (v28 & 1)) {
    goto LABEL_47;
  }
  if (*(unsigned char *)&has)
  {
    int isCounterfactualDifferent = self->_isCounterfactualDifferent;
    if (isCounterfactualDifferent != [v4 isCounterfactualDifferent]) {
      goto LABEL_47;
    }
    $CC07B3F0AB7B5DADFB069DF7BB7D08AC has = self->_has;
    unsigned int v28 = v4[80];
  }
  int v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1)) {
    goto LABEL_47;
  }
  if (v30)
  {
    float compareRankingAtK = self->_compareRankingAtK;
    [v4 compareRankingAtK];
    if (compareRankingAtK != v32) {
      goto LABEL_47;
    }
    $CC07B3F0AB7B5DADFB069DF7BB7D08AC has = self->_has;
    unsigned int v28 = v4[80];
  }
  int v33 = (*(unsigned int *)&has >> 2) & 1;
  if (v33 != ((v28 >> 2) & 1)) {
    goto LABEL_47;
  }
  if (v33)
  {
    int64_t kValue = self->_kValue;
    if (kValue != [v4 kValue]) {
      goto LABEL_47;
    }
    $CC07B3F0AB7B5DADFB069DF7BB7D08AC has = self->_has;
    unsigned int v28 = v4[80];
  }
  int v35 = (*(unsigned int *)&has >> 3) & 1;
  if (v35 != ((v28 >> 3) & 1)) {
    goto LABEL_47;
  }
  if (v35)
  {
    int diffOutcome = self->_diffOutcome;
    if (diffOutcome != [v4 diffOutcome]) {
      goto LABEL_47;
    }
  }
  unint64_t v5 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self treatmentSummary];
  uint64_t v6 = [v4 treatmentSummary];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self treatmentSummary];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self treatmentSummary];
    long long v40 = [v4 treatmentSummary];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualSummary];
  uint64_t v6 = [v4 counterfactualSummary];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_46:

    goto LABEL_47;
  }
  uint64_t v42 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualSummary];
  if (!v42)
  {

LABEL_50:
    BOOL v47 = 1;
    goto LABEL_48;
  }
  long long v43 = (void *)v42;
  long long v44 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualSummary];
  long long v45 = [v4 counterfactualSummary];
  char v46 = [v44 isEqual:v45];

  if (v46) {
    goto LABEL_50;
  }
LABEL_47:
  BOOL v47 = 0;
LABEL_48:

  return v47;
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v5 = self->_allocations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  double v10 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self codepathId];

  if (v10)
  {
    int v11 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self codepathId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self pegasusId];

  if (v12)
  {
    unint64_t v13 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self pegasusId];
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = self->_counterfactualAllocations;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_21:
      if ((has & 4) == 0) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_22:
    if ((has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_23:
  }
    PBDataWriterWriteInt32Field();
LABEL_24:
  uint64_t v20 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self treatmentSummary];

  if (v20)
  {
    int v21 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self treatmentSummary];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v22 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualSummary];

  if (v22)
  {
    objc_super v23 = [(EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *)self counterfactualSummary];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPServerCounterfactualTriggeredTier1ReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteCounterfactualSummary
{
}

- (BOOL)hasCounterfactualSummary
{
  return self->_counterfactualSummary != 0;
}

- (void)deleteTreatmentSummary
{
}

- (BOOL)hasTreatmentSummary
{
  return self->_treatmentSummary != 0;
}

- (void)deleteDiffOutcome
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasDiffOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDiffOutcome
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDiffOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int diffOutcome = a3;
}

- (void)deleteKValue
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasKValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setKValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t kValue = a3;
}

- (void)deleteCompareRankingAtK
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCompareRankingAtK:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompareRankingAtK
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCompareRankingAtK:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float compareRankingAtK = a3;
}

- (void)deleteIsCounterfactualDifferent
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsCounterfactualDifferent:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsCounterfactualDifferent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsCounterfactualDifferent:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isCounterfactualDifferent = a3;
}

- (id)counterfactualAllocationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_counterfactualAllocations objectAtIndexedSubscript:a3];
}

- (unint64_t)counterfactualAllocationCount
{
  return [(NSArray *)self->_counterfactualAllocations count];
}

- (void)addCounterfactualAllocation:(id)a3
{
  id v4 = a3;
  counterfactualAllocations = self->_counterfactualAllocations;
  id v8 = v4;
  if (!counterfactualAllocations)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_counterfactualAllocations;
    self->_counterfactualAllocations = v6;

    id v4 = v8;
    counterfactualAllocations = self->_counterfactualAllocations;
  }
  [(NSArray *)counterfactualAllocations addObject:v4];
}

- (void)clearCounterfactualAllocation
{
}

- (void)deletePegasusId
{
}

- (BOOL)hasPegasusId
{
  return self->_pegasusId != 0;
}

- (void)deleteCodepathId
{
}

- (BOOL)hasCodepathId
{
  return self->_codepathId != 0;
}

- (id)allocationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_allocations objectAtIndexedSubscript:a3];
}

- (unint64_t)allocationCount
{
  return [(NSArray *)self->_allocations count];
}

- (void)addAllocation:(id)a3
{
  id v4 = a3;
  allocations = self->_allocations;
  id v8 = v4;
  if (!allocations)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_allocations;
    self->_allocations = v6;

    id v4 = v8;
    allocations = self->_allocations;
  }
  [(NSArray *)allocations addObject:v4];
}

- (void)clearAllocation
{
}

@end