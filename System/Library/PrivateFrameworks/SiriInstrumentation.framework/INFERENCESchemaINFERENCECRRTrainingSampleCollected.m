@interface INFERENCESchemaINFERENCECRRTrainingSampleCollected
- (BOOL)hasCrrCommsAppSelectionJointId;
- (BOOL)hasForcePrompt;
- (BOOL)hasIntentTypeName;
- (BOOL)hasInteractionContext;
- (BOOL)hasInteractionDurationInSecBucket;
- (BOOL)hasIsEntityCandidateRetrievalEnabled;
- (BOOL)hasIsInteractionExecuted;
- (BOOL)hasIsInteractionSuccess;
- (BOOL)hasIsPlusContactSuggesterEnabled;
- (BOOL)hasModelVersion;
- (BOOL)hasResolutionState;
- (BOOL)hasResolutionType;
- (BOOL)hasResolverConfig;
- (BOOL)hasTrialEnrollment;
- (BOOL)isEntityCandidateRetrievalEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractionExecuted;
- (BOOL)isInteractionSuccess;
- (BOOL)isPlusContactSuggesterEnabled;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEContactResolverConfig)resolverConfig;
- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)interactionContext;
- (INFERENCESchemaINFERENCEPromptContext)forcePrompt;
- (INFERENCESchemaINFERENCETrialEnrollment)trialEnrollment;
- (NSArray)anonymizedContactIdentifiers;
- (NSArray)matches;
- (NSData)jsonData;
- (NSString)intentTypeName;
- (NSString)modelVersion;
- (SISchemaUUID)crrCommsAppSelectionJointId;
- (id)anonymizedContactIdentifiersAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)matchesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)resolutionState;
- (int)resolutionType;
- (unint64_t)anonymizedContactIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)matchesCount;
- (unsigned)interactionDurationInSecBucket;
- (void)addAnonymizedContactIdentifiers:(id)a3;
- (void)addMatches:(id)a3;
- (void)clearAnonymizedContactIdentifiers;
- (void)clearMatches;
- (void)deleteCrrCommsAppSelectionJointId;
- (void)deleteForcePrompt;
- (void)deleteIntentTypeName;
- (void)deleteInteractionContext;
- (void)deleteInteractionDurationInSecBucket;
- (void)deleteIsEntityCandidateRetrievalEnabled;
- (void)deleteIsInteractionExecuted;
- (void)deleteIsInteractionSuccess;
- (void)deleteIsPlusContactSuggesterEnabled;
- (void)deleteModelVersion;
- (void)deleteResolutionState;
- (void)deleteResolutionType;
- (void)deleteResolverConfig;
- (void)deleteTrialEnrollment;
- (void)setAnonymizedContactIdentifiers:(id)a3;
- (void)setCrrCommsAppSelectionJointId:(id)a3;
- (void)setForcePrompt:(id)a3;
- (void)setHasCrrCommsAppSelectionJointId:(BOOL)a3;
- (void)setHasForcePrompt:(BOOL)a3;
- (void)setHasIntentTypeName:(BOOL)a3;
- (void)setHasInteractionContext:(BOOL)a3;
- (void)setHasInteractionDurationInSecBucket:(BOOL)a3;
- (void)setHasIsEntityCandidateRetrievalEnabled:(BOOL)a3;
- (void)setHasIsInteractionExecuted:(BOOL)a3;
- (void)setHasIsInteractionSuccess:(BOOL)a3;
- (void)setHasIsPlusContactSuggesterEnabled:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasResolutionState:(BOOL)a3;
- (void)setHasResolutionType:(BOOL)a3;
- (void)setHasResolverConfig:(BOOL)a3;
- (void)setHasTrialEnrollment:(BOOL)a3;
- (void)setIntentTypeName:(id)a3;
- (void)setInteractionContext:(id)a3;
- (void)setInteractionDurationInSecBucket:(unsigned int)a3;
- (void)setIsEntityCandidateRetrievalEnabled:(BOOL)a3;
- (void)setIsInteractionExecuted:(BOOL)a3;
- (void)setIsInteractionSuccess:(BOOL)a3;
- (void)setIsPlusContactSuggesterEnabled:(BOOL)a3;
- (void)setMatches:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setResolutionState:(int)a3;
- (void)setResolutionType:(int)a3;
- (void)setResolverConfig:(id)a3;
- (void)setTrialEnrollment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECRRTrainingSampleCollected

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INFERENCESchemaINFERENCECRRTrainingSampleCollected;
  v5 = [(SISchemaInstrumentationMessage *)&v24 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolverConfig];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self deleteResolverConfig];
  }
  v9 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self trialEnrollment];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self deleteTrialEnrollment];
  }
  v12 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self matches];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self setMatches:v13];

  v14 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self forcePrompt];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self deleteForcePrompt];
  }
  v17 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self interactionContext];
  v18 = [v17 applySensitiveConditionsPolicy:v4];
  int v19 = [v18 suppressMessage];

  if (v19) {
    [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self deleteInteractionContext];
  }
  v20 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self crrCommsAppSelectionJointId];
  v21 = [v20 applySensitiveConditionsPolicy:v4];
  int v22 = [v21 suppressMessage];

  if (v22) {
    [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self deleteCrrCommsAppSelectionJointId];
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
  objc_storeStrong((id *)&self->_crrCommsAppSelectionJointId, 0);
  objc_storeStrong((id *)&self->_interactionContext, 0);
  objc_storeStrong((id *)&self->_anonymizedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_forcePrompt, 0);
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_trialEnrollment, 0);
  objc_storeStrong((id *)&self->_resolverConfig, 0);
  objc_storeStrong((id *)&self->_intentTypeName, 0);
}

- (void)setHasCrrCommsAppSelectionJointId:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void)setHasInteractionContext:(BOOL)a3
{
  self->_hasTrialEnrollment = a3;
}

- (void)setHasForcePrompt:(BOOL)a3
{
  self->_hasResolverConfig = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasIntentTypeName = a3;
}

- (void)setHasTrialEnrollment:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasResolverConfig:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIntentTypeName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCrrCommsAppSelectionJointId:(id)a3
{
}

- (SISchemaUUID)crrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId;
}

- (BOOL)isEntityCandidateRetrievalEnabled
{
  return self->_isEntityCandidateRetrievalEnabled;
}

- (BOOL)isPlusContactSuggesterEnabled
{
  return self->_isPlusContactSuggesterEnabled;
}

- (void)setInteractionContext:(id)a3
{
}

- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)interactionContext
{
  return self->_interactionContext;
}

- (unsigned)interactionDurationInSecBucket
{
  return self->_interactionDurationInSecBucket;
}

- (BOOL)isInteractionSuccess
{
  return self->_isInteractionSuccess;
}

- (BOOL)isInteractionExecuted
{
  return self->_isInteractionExecuted;
}

- (void)setAnonymizedContactIdentifiers:(id)a3
{
}

- (NSArray)anonymizedContactIdentifiers
{
  return self->_anonymizedContactIdentifiers;
}

- (void)setForcePrompt:(id)a3
{
}

- (INFERENCESchemaINFERENCEPromptContext)forcePrompt
{
  return self->_forcePrompt;
}

- (int)resolutionType
{
  return self->_resolutionType;
}

- (int)resolutionState
{
  return self->_resolutionState;
}

- (void)setMatches:(id)a3
{
}

- (NSArray)matches
{
  return self->_matches;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setTrialEnrollment:(id)a3
{
}

- (INFERENCESchemaINFERENCETrialEnrollment)trialEnrollment
{
  return self->_trialEnrollment;
}

- (void)setResolverConfig:(id)a3
{
}

- (INFERENCESchemaINFERENCEContactResolverConfig)resolverConfig
{
  return self->_resolverConfig;
}

- (void)setIntentTypeName:(id)a3
{
}

- (NSString)intentTypeName
{
  return self->_intentTypeName;
}

- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)initWithDictionary:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)INFERENCESchemaINFERENCECRRTrainingSampleCollected;
  v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)&v64 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"intentTypeName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 setIntentTypeName:v7];
    }
    v53 = v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"resolverConfig"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[INFERENCESchemaINFERENCEContactResolverConfig alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 setResolverConfig:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"trialEnrollment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[INFERENCESchemaINFERENCETrialEnrollment alloc] initWithDictionary:v10];
      [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 setTrialEnrollment:v11];
    }
    v51 = (void *)v10;
    v52 = (void *)v8;
    v12 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 setModelVersion:v13];
    }
    v50 = v12;
    v14 = [v4 objectForKeyedSubscript:@"matches"];
    objc_opt_class();
    v55 = v14;
    if (objc_opt_isKindOfClass())
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v61 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[INFERENCESchemaINFERENCEContactMatch alloc] initWithDictionary:v20];
              [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 addMatches:v21];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v17);
      }
    }
    int v22 = [v4 objectForKeyedSubscript:@"resolutionState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolutionState:](v5, "setResolutionState:", [v22 intValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"resolutionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolutionType:](v5, "setResolutionType:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"forcePrompt"];
    objc_opt_class();
    v54 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[INFERENCESchemaINFERENCEPromptContext alloc] initWithDictionary:v24];
      [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 setForcePrompt:v25];
    }
    v48 = v23;
    v49 = v22;
    v26 = [v4 objectForKeyedSubscript:@"anonymizedContactIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v46 = v26;
      id v27 = v26;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v57 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v33 = (void *)[v32 copy];
              [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 addAnonymizedContactIdentifiers:v33];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v29);
      }

      v26 = v46;
    }
    v34 = [v4 objectForKeyedSubscript:@"isInteractionExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsInteractionExecuted:](v5, "setIsInteractionExecuted:", [v34 BOOLValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"isInteractionSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsInteractionSuccess:](v5, "setIsInteractionSuccess:", [v35 BOOLValue]);
    }
    v47 = v34;
    v36 = [v4 objectForKeyedSubscript:@"interactionDurationInSecBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setInteractionDurationInSecBucket:](v5, "setInteractionDurationInSecBucket:", [v36 unsignedIntValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"interactionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext alloc] initWithDictionary:v37];
      [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 setInteractionContext:v38];
    }
    v39 = [v4 objectForKeyedSubscript:@"isPlusContactSuggesterEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsPlusContactSuggesterEnabled:](v5, "setIsPlusContactSuggesterEnabled:", [v39 BOOLValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"isEntityCandidateRetrievalEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsEntityCandidateRetrievalEnabled:](v5, "setIsEntityCandidateRetrievalEnabled:", [v40 BOOLValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"crrCommsAppSelectionJointId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = v26;
      v43 = [[SISchemaUUID alloc] initWithDictionary:v41];
      [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)v5 setCrrCommsAppSelectionJointId:v43];

      v26 = v42;
    }
    v44 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self dictionaryRepresentation];
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
  if (self->_anonymizedContactIdentifiers)
  {
    id v4 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self anonymizedContactIdentifiers];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"anonymizedContactIdentifiers"];
  }
  if (self->_crrCommsAppSelectionJointId)
  {
    v6 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self crrCommsAppSelectionJointId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"crrCommsAppSelectionJointId"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"crrCommsAppSelectionJointId"];
    }
  }
  if (self->_forcePrompt)
  {
    v9 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self forcePrompt];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"forcePrompt"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"forcePrompt"];
    }
  }
  if (self->_intentTypeName)
  {
    v12 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self intentTypeName];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"intentTypeName"];
  }
  if (self->_interactionContext)
  {
    v14 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self interactionContext];
    id v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"interactionContext"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"interactionContext"];
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionDurationInSecBucket](self, "interactionDurationInSecBucket"));
    [v3 setObject:v32 forKeyedSubscript:@"interactionDurationInSecBucket"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_22:
      if ((has & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_45;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_22;
  }
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isEntityCandidateRetrievalEnabled](self, "isEntityCandidateRetrievalEnabled"));
  [v3 setObject:v33 forKeyedSubscript:@"isEntityCandidateRetrievalEnabled"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_23:
    if ((has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_46;
  }
LABEL_45:
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isInteractionExecuted](self, "isInteractionExecuted"));
  [v3 setObject:v34 forKeyedSubscript:@"isInteractionExecuted"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_46:
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isInteractionSuccess](self, "isInteractionSuccess"));
  [v3 setObject:v35 forKeyedSubscript:@"isInteractionSuccess"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_25:
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isPlusContactSuggesterEnabled](self, "isPlusContactSuggesterEnabled"));
    [v3 setObject:v18 forKeyedSubscript:@"isPlusContactSuggesterEnabled"];
  }
LABEL_26:
  if ([(NSArray *)self->_matches count])
  {
    int v19 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v20 = self->_matches;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation];
          if (v25)
          {
            [v19 addObject:v25];
          }
          else
          {
            v26 = [MEMORY[0x1E4F1CA98] null];
            [v19 addObject:v26];
          }
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"matches"];
  }
  if (self->_modelVersion)
  {
    id v27 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self modelVersion];
    uint64_t v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"modelVersion"];
  }
  char v29 = (char)self->_has;
  if (v29)
  {
    unsigned int v30 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolutionState] - 1;
    if (v30 > 3) {
      v31 = @"INFERENCERESOLUTIONSTATE_UNKNOWN";
    }
    else {
      v31 = off_1E5EB0C28[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"resolutionState"];
    char v29 = (char)self->_has;
  }
  if ((v29 & 2) != 0)
  {
    unsigned int v36 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolutionType] - 1;
    if (v36 > 4) {
      v37 = @"INFERENCECONTACTRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      v37 = off_1E5EB0C48[v36];
    }
    [v3 setObject:v37 forKeyedSubscript:@"resolutionType"];
  }
  if (self->_resolverConfig)
  {
    v38 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolverConfig];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"resolverConfig"];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v40 forKeyedSubscript:@"resolverConfig"];
    }
  }
  if (self->_trialEnrollment)
  {
    v41 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self trialEnrollment];
    v42 = [v41 dictionaryRepresentation];
    if (v42)
    {
      [v3 setObject:v42 forKeyedSubscript:@"trialEnrollment"];
    }
    else
    {
      v43 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v43 forKeyedSubscript:@"trialEnrollment"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v18 = [(NSString *)self->_intentTypeName hash];
  unint64_t v17 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self->_resolverConfig hash];
  unint64_t v16 = [(INFERENCESchemaINFERENCETrialEnrollment *)self->_trialEnrollment hash];
  NSUInteger v15 = [(NSString *)self->_modelVersion hash];
  uint64_t v14 = [(NSArray *)self->_matches hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_resolutionState;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_resolutionType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(INFERENCESchemaINFERENCEPromptContext *)self->_forcePrompt hash];
  uint64_t v6 = [(NSArray *)self->_anonymizedContactIdentifiers hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v7 = 2654435761 * self->_isInteractionExecuted;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_isInteractionSuccess;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761 * self->_interactionDurationInSecBucket;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v9 = 0;
LABEL_13:
  unint64_t v10 = [(INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *)self->_interactionContext hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isPlusContactSuggesterEnabled;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_15;
    }
LABEL_17:
    uint64_t v12 = 0;
    return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(SISchemaUUID *)self->_crrCommsAppSelectionJointId hash];
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v12 = 2654435761 * self->_isEntityCandidateRetrievalEnabled;
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(SISchemaUUID *)self->_crrCommsAppSelectionJointId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_72;
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self intentTypeName];
  uint64_t v6 = [v4 intentTypeName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self intentTypeName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self intentTypeName];
    unint64_t v10 = [v4 intentTypeName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolverConfig];
  uint64_t v6 = [v4 resolverConfig];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolverConfig];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolverConfig];
    NSUInteger v15 = [v4 resolverConfig];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self trialEnrollment];
  uint64_t v6 = [v4 trialEnrollment];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v17 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self trialEnrollment];
  if (v17)
  {
    NSUInteger v18 = (void *)v17;
    int v19 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self trialEnrollment];
    uint64_t v20 = [v4 trialEnrollment];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self modelVersion];
  uint64_t v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v22 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self modelVersion];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self modelVersion];
    v25 = [v4 modelVersion];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self matches];
  uint64_t v6 = [v4 matches];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v27 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self matches];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    char v29 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self matches];
    unsigned int v30 = [v4 matches];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  $576FFE49FB491774B160AD4B4B208A6A has = self->_has;
  unsigned int v33 = v4[104];
  if ((*(unsigned char *)&has & 1) != (v33 & 1)) {
    goto LABEL_72;
  }
  if (*(unsigned char *)&has)
  {
    int resolutionState = self->_resolutionState;
    if (resolutionState != [v4 resolutionState]) {
      goto LABEL_72;
    }
    $576FFE49FB491774B160AD4B4B208A6A has = self->_has;
    unsigned int v33 = v4[104];
  }
  int v35 = (*(unsigned int *)&has >> 1) & 1;
  if (v35 != ((v33 >> 1) & 1)) {
    goto LABEL_72;
  }
  if (v35)
  {
    int resolutionType = self->_resolutionType;
    if (resolutionType != [v4 resolutionType]) {
      goto LABEL_72;
    }
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self forcePrompt];
  uint64_t v6 = [v4 forcePrompt];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v37 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self forcePrompt];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self forcePrompt];
    v40 = [v4 forcePrompt];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self anonymizedContactIdentifiers];
  uint64_t v6 = [v4 anonymizedContactIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v42 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self anonymizedContactIdentifiers];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self anonymizedContactIdentifiers];
    long long v45 = [v4 anonymizedContactIdentifiers];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  $576FFE49FB491774B160AD4B4B208A6A v47 = self->_has;
  int v48 = (*(unsigned int *)&v47 >> 2) & 1;
  unsigned int v49 = v4[104];
  if (v48 != ((v49 >> 2) & 1)) {
    goto LABEL_72;
  }
  if (v48)
  {
    int isInteractionExecuted = self->_isInteractionExecuted;
    if (isInteractionExecuted != [v4 isInteractionExecuted]) {
      goto LABEL_72;
    }
    $576FFE49FB491774B160AD4B4B208A6A v47 = self->_has;
    unsigned int v49 = v4[104];
  }
  int v51 = (*(unsigned int *)&v47 >> 3) & 1;
  if (v51 != ((v49 >> 3) & 1)) {
    goto LABEL_72;
  }
  if (v51)
  {
    int isInteractionSuccess = self->_isInteractionSuccess;
    if (isInteractionSuccess != [v4 isInteractionSuccess]) {
      goto LABEL_72;
    }
    $576FFE49FB491774B160AD4B4B208A6A v47 = self->_has;
    unsigned int v49 = v4[104];
  }
  int v53 = (*(unsigned int *)&v47 >> 4) & 1;
  if (v53 != ((v49 >> 4) & 1)) {
    goto LABEL_72;
  }
  if (v53)
  {
    unsigned int interactionDurationInSecBucket = self->_interactionDurationInSecBucket;
    if (interactionDurationInSecBucket != [v4 interactionDurationInSecBucket]) {
      goto LABEL_72;
    }
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self interactionContext];
  uint64_t v6 = [v4 interactionContext];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_71;
  }
  uint64_t v55 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self interactionContext];
  if (v55)
  {
    long long v56 = (void *)v55;
    long long v57 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self interactionContext];
    long long v58 = [v4 interactionContext];
    int v59 = [v57 isEqual:v58];

    if (!v59) {
      goto LABEL_72;
    }
  }
  else
  {
  }
  $576FFE49FB491774B160AD4B4B208A6A v60 = self->_has;
  int v61 = (*(unsigned int *)&v60 >> 5) & 1;
  unsigned int v62 = v4[104];
  if (v61 != ((v62 >> 5) & 1)) {
    goto LABEL_72;
  }
  if (v61)
  {
    int isPlusContactSuggesterEnabled = self->_isPlusContactSuggesterEnabled;
    if (isPlusContactSuggesterEnabled != [v4 isPlusContactSuggesterEnabled]) {
      goto LABEL_72;
    }
    $576FFE49FB491774B160AD4B4B208A6A v60 = self->_has;
    unsigned int v62 = v4[104];
  }
  int v64 = (*(unsigned int *)&v60 >> 6) & 1;
  if (v64 != ((v62 >> 6) & 1)) {
    goto LABEL_72;
  }
  if (v64)
  {
    int isEntityCandidateRetrievalEnabled = self->_isEntityCandidateRetrievalEnabled;
    if (isEntityCandidateRetrievalEnabled != [v4 isEntityCandidateRetrievalEnabled]) {
      goto LABEL_72;
    }
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self crrCommsAppSelectionJointId];
  uint64_t v6 = [v4 crrCommsAppSelectionJointId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_71:

    goto LABEL_72;
  }
  uint64_t v66 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self crrCommsAppSelectionJointId];
  if (!v66)
  {

LABEL_75:
    BOOL v71 = 1;
    goto LABEL_73;
  }
  uint64_t v67 = (void *)v66;
  v68 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self crrCommsAppSelectionJointId];
  v69 = [v4 crrCommsAppSelectionJointId];
  char v70 = [v68 isEqual:v69];

  if (v70) {
    goto LABEL_75;
  }
LABEL_72:
  BOOL v71 = 0;
LABEL_73:

  return v71;
}

- (void)writeTo:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self intentTypeName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolverConfig];

  if (v6)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self resolverConfig];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self trialEnrollment];

  if (v8)
  {
    uint64_t v9 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self trialEnrollment];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self modelVersion];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v11 = self->_matches;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v13);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v17 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self forcePrompt];

  if (v17)
  {
    NSUInteger v18 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self forcePrompt];
    PBDataWriterWriteSubmessage();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v19 = self->_anonymizedContactIdentifiers;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

  char v24 = (char)self->_has;
  if ((v24 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v24 = (char)self->_has;
    if ((v24 & 8) == 0)
    {
LABEL_31:
      if ((v24 & 0x10) == 0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_32:
  }
    PBDataWriterWriteUint32Field();
LABEL_33:
  v25 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self interactionContext];

  if (v25)
  {
    int v26 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self interactionContext];
    PBDataWriterWriteSubmessage();
  }
  char v27 = (char)self->_has;
  if ((v27 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v27 = (char)self->_has;
  }
  if ((v27 & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v28 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self crrCommsAppSelectionJointId];

  if (v28)
  {
    char v29 = [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self crrCommsAppSelectionJointId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECRRTrainingSampleCollectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCrrCommsAppSelectionJointId
{
}

- (BOOL)hasCrrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId != 0;
}

- (void)deleteIsEntityCandidateRetrievalEnabled
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsEntityCandidateRetrievalEnabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int isEntityCandidateRetrievalEnabled = a3;
}

- (void)deleteIsPlusContactSuggesterEnabled
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsPlusContactSuggesterEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPlusContactSuggesterEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsPlusContactSuggesterEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isPlusContactSuggesterEnabled = a3;
}

- (void)deleteInteractionContext
{
}

- (BOOL)hasInteractionContext
{
  return self->_interactionContext != 0;
}

- (void)deleteInteractionDurationInSecBucket
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasInteractionDurationInSecBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasInteractionDurationInSecBucket
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setInteractionDurationInSecBucket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int interactionDurationInSecBucket = a3;
}

- (void)deleteIsInteractionSuccess
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsInteractionSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsInteractionSuccess
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsInteractionSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isInteractionSuccess = a3;
}

- (void)deleteIsInteractionExecuted
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsInteractionExecuted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsInteractionExecuted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsInteractionExecuted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isInteractionExecuted = a3;
}

- (id)anonymizedContactIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_anonymizedContactIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)anonymizedContactIdentifiersCount
{
  return [(NSArray *)self->_anonymizedContactIdentifiers count];
}

- (void)addAnonymizedContactIdentifiers:(id)a3
{
  id v4 = a3;
  anonymizedContactIdentifiers = self->_anonymizedContactIdentifiers;
  id v8 = v4;
  if (!anonymizedContactIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_anonymizedContactIdentifiers;
    self->_anonymizedContactIdentifiers = v6;

    id v4 = v8;
    anonymizedContactIdentifiers = self->_anonymizedContactIdentifiers;
  }
  [(NSArray *)anonymizedContactIdentifiers addObject:v4];
}

- (void)clearAnonymizedContactIdentifiers
{
}

- (void)deleteForcePrompt
{
}

- (BOOL)hasForcePrompt
{
  return self->_forcePrompt != 0;
}

- (void)deleteResolutionType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResolutionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResolutionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResolutionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int resolutionType = a3;
}

- (void)deleteResolutionState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResolutionState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResolutionState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResolutionState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int resolutionState = a3;
}

- (id)matchesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matches objectAtIndexedSubscript:a3];
}

- (unint64_t)matchesCount
{
  return [(NSArray *)self->_matches count];
}

- (void)addMatches:(id)a3
{
  id v4 = a3;
  matches = self->_matches;
  id v8 = v4;
  if (!matches)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matches;
    self->_matches = v6;

    id v4 = v8;
    matches = self->_matches;
  }
  [(NSArray *)matches addObject:v4];
}

- (void)clearMatches
{
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteTrialEnrollment
{
}

- (BOOL)hasTrialEnrollment
{
  return self->_trialEnrollment != 0;
}

- (void)deleteResolverConfig
{
}

- (BOOL)hasResolverConfig
{
  return self->_resolverConfig != 0;
}

- (void)deleteIntentTypeName
{
}

- (BOOL)hasIntentTypeName
{
  return self->_intentTypeName != 0;
}

@end