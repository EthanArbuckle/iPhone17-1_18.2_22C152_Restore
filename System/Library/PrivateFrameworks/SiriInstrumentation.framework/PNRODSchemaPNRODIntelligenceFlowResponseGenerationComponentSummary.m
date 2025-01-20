@interface PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary
- (BOOL)hasClientRequestId;
- (BOOL)hasFailureInfo;
- (BOOL)hasPlanId;
- (BOOL)hasRawQueryEventId;
- (BOOL)hasResponseCATHydrationTime;
- (BOOL)hasResponseCatalogueRetrievalTime;
- (BOOL)hasResponseGenerationTime;
- (BOOL)hasResponseHallucinationInferenceTime;
- (BOOL)hasResponseInferenceLocation;
- (BOOL)hasResponseInputValidationTime;
- (BOOL)hasResponseIsFallback;
- (BOOL)hasResponseIsStaticDialogueProvided;
- (BOOL)hasResponseIsValidInput;
- (BOOL)hasResponseMobileAssetVersion;
- (BOOL)hasResponseModelInferenceTime;
- (BOOL)hasResponseOverridesTime;
- (BOOL)hasResponsePreparationTime;
- (BOOL)hasResponseSafetyInferenceTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)responseIsFallback;
- (BOOL)responseIsStaticDialogueProvided;
- (BOOL)responseIsValidInput;
- (NSData)jsonData;
- (NSString)responseMobileAssetVersion;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)initWithJSON:(id)a3;
- (PNRODSchemaPNRODMetricDuration)responseCATHydrationTime;
- (PNRODSchemaPNRODMetricDuration)responseCatalogueRetrievalTime;
- (PNRODSchemaPNRODMetricDuration)responseGenerationTime;
- (PNRODSchemaPNRODMetricDuration)responseHallucinationInferenceTime;
- (PNRODSchemaPNRODMetricDuration)responseInputValidationTime;
- (PNRODSchemaPNRODMetricDuration)responseModelInferenceTime;
- (PNRODSchemaPNRODMetricDuration)responseOverridesTime;
- (PNRODSchemaPNRODMetricDuration)responsePreparationTime;
- (PNRODSchemaPNRODMetricDuration)responseSafetyInferenceTime;
- (SISchemaUUID)clientRequestId;
- (SISchemaUUID)planId;
- (SISchemaUUID)rawQueryEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)responseInferenceLocation;
- (unint64_t)hash;
- (void)deleteClientRequestId;
- (void)deleteFailureInfo;
- (void)deletePlanId;
- (void)deleteRawQueryEventId;
- (void)deleteResponseCATHydrationTime;
- (void)deleteResponseCatalogueRetrievalTime;
- (void)deleteResponseGenerationTime;
- (void)deleteResponseHallucinationInferenceTime;
- (void)deleteResponseInferenceLocation;
- (void)deleteResponseInputValidationTime;
- (void)deleteResponseIsFallback;
- (void)deleteResponseIsStaticDialogueProvided;
- (void)deleteResponseIsValidInput;
- (void)deleteResponseMobileAssetVersion;
- (void)deleteResponseModelInferenceTime;
- (void)deleteResponseOverridesTime;
- (void)deleteResponsePreparationTime;
- (void)deleteResponseSafetyInferenceTime;
- (void)setClientRequestId:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setHasClientRequestId:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasPlanId:(BOOL)a3;
- (void)setHasRawQueryEventId:(BOOL)a3;
- (void)setHasResponseCATHydrationTime:(BOOL)a3;
- (void)setHasResponseCatalogueRetrievalTime:(BOOL)a3;
- (void)setHasResponseGenerationTime:(BOOL)a3;
- (void)setHasResponseHallucinationInferenceTime:(BOOL)a3;
- (void)setHasResponseInferenceLocation:(BOOL)a3;
- (void)setHasResponseInputValidationTime:(BOOL)a3;
- (void)setHasResponseIsFallback:(BOOL)a3;
- (void)setHasResponseIsStaticDialogueProvided:(BOOL)a3;
- (void)setHasResponseIsValidInput:(BOOL)a3;
- (void)setHasResponseMobileAssetVersion:(BOOL)a3;
- (void)setHasResponseModelInferenceTime:(BOOL)a3;
- (void)setHasResponseOverridesTime:(BOOL)a3;
- (void)setHasResponsePreparationTime:(BOOL)a3;
- (void)setHasResponseSafetyInferenceTime:(BOOL)a3;
- (void)setPlanId:(id)a3;
- (void)setRawQueryEventId:(id)a3;
- (void)setResponseCATHydrationTime:(id)a3;
- (void)setResponseCatalogueRetrievalTime:(id)a3;
- (void)setResponseGenerationTime:(id)a3;
- (void)setResponseHallucinationInferenceTime:(id)a3;
- (void)setResponseInferenceLocation:(int)a3;
- (void)setResponseInputValidationTime:(id)a3;
- (void)setResponseIsFallback:(BOOL)a3;
- (void)setResponseIsStaticDialogueProvided:(BOOL)a3;
- (void)setResponseIsValidInput:(BOOL)a3;
- (void)setResponseMobileAssetVersion:(id)a3;
- (void)setResponseModelInferenceTime:(id)a3;
- (void)setResponseOverridesTime:(id)a3;
- (void)setResponsePreparationTime:(id)a3;
- (void)setResponseSafetyInferenceTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v46 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self planId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deletePlanId];
  }
  v9 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self clientRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteClientRequestId];
  }
  v12 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self rawQueryEventId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteRawQueryEventId];
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responsePreparationTime];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponsePreparationTime];
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInputValidationTime];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseInputValidationTime];
  }
  v21 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseOverridesTime];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseOverridesTime];
  }
  v24 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCatalogueRetrievalTime];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseCatalogueRetrievalTime];
  }
  v27 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCATHydrationTime];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseCATHydrationTime];
  }
  v30 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseModelInferenceTime];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseModelInferenceTime];
  }
  v33 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseHallucinationInferenceTime];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseHallucinationInferenceTime];
  }
  v36 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseSafetyInferenceTime];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseSafetyInferenceTime];
  }
  v39 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseGenerationTime];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteResponseGenerationTime];
  }
  v42 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self failureInfo];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_responseGenerationTime, 0);
  objc_storeStrong((id *)&self->_responseSafetyInferenceTime, 0);
  objc_storeStrong((id *)&self->_responseHallucinationInferenceTime, 0);
  objc_storeStrong((id *)&self->_responseModelInferenceTime, 0);
  objc_storeStrong((id *)&self->_responseCATHydrationTime, 0);
  objc_storeStrong((id *)&self->_responseCatalogueRetrievalTime, 0);
  objc_storeStrong((id *)&self->_responseOverridesTime, 0);
  objc_storeStrong((id *)&self->_responseInputValidationTime, 0);
  objc_storeStrong((id *)&self->_responsePreparationTime, 0);
  objc_storeStrong((id *)&self->_responseMobileAssetVersion, 0);
  objc_storeStrong((id *)&self->_rawQueryEventId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasResponseHallucinationInferenceTime = a3;
}

- (void)setHasResponseGenerationTime:(BOOL)a3
{
  self->_hasResponseModelInferenceTime = a3;
}

- (void)setHasResponseSafetyInferenceTime:(BOOL)a3
{
  self->_hasResponseCATHydrationTime = a3;
}

- (void)setHasResponseHallucinationInferenceTime:(BOOL)a3
{
  self->_hasResponseCatalogueRetrievalTime = a3;
}

- (void)setHasResponseModelInferenceTime:(BOOL)a3
{
  self->_hasResponseOverridesTime = a3;
}

- (void)setHasResponseCATHydrationTime:(BOOL)a3
{
  self->_hasResponseInputValidationTime = a3;
}

- (void)setHasResponseCatalogueRetrievalTime:(BOOL)a3
{
  self->_hasResponsePreparationTime = a3;
}

- (void)setHasResponseOverridesTime:(BOOL)a3
{
  self->_hasResponseMobileAssetVersion = a3;
}

- (void)setHasResponseInputValidationTime:(BOOL)a3
{
  self->_hasRawQueryEventId = a3;
}

- (void)setHasResponsePreparationTime:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasResponseMobileAssetVersion:(BOOL)a3
{
  self->_hasPlanId = a3;
}

- (void)setHasRawQueryEventId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasPlanId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFailureInfo:(id)a3
{
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setResponseGenerationTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseGenerationTime
{
  return self->_responseGenerationTime;
}

- (void)setResponseSafetyInferenceTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseSafetyInferenceTime
{
  return self->_responseSafetyInferenceTime;
}

- (void)setResponseHallucinationInferenceTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseHallucinationInferenceTime
{
  return self->_responseHallucinationInferenceTime;
}

- (void)setResponseModelInferenceTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseModelInferenceTime
{
  return self->_responseModelInferenceTime;
}

- (void)setResponseCATHydrationTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseCATHydrationTime
{
  return self->_responseCATHydrationTime;
}

- (void)setResponseCatalogueRetrievalTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseCatalogueRetrievalTime
{
  return self->_responseCatalogueRetrievalTime;
}

- (void)setResponseOverridesTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseOverridesTime
{
  return self->_responseOverridesTime;
}

- (void)setResponseInputValidationTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseInputValidationTime
{
  return self->_responseInputValidationTime;
}

- (void)setResponsePreparationTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responsePreparationTime
{
  return self->_responsePreparationTime;
}

- (BOOL)responseIsFallback
{
  return self->_responseIsFallback;
}

- (int)responseInferenceLocation
{
  return self->_responseInferenceLocation;
}

- (void)setResponseMobileAssetVersion:(id)a3
{
}

- (NSString)responseMobileAssetVersion
{
  return self->_responseMobileAssetVersion;
}

- (BOOL)responseIsStaticDialogueProvided
{
  return self->_responseIsStaticDialogueProvided;
}

- (BOOL)responseIsValidInput
{
  return self->_responseIsValidInput;
}

- (void)setRawQueryEventId:(id)a3
{
}

- (SISchemaUUID)rawQueryEventId
{
  return self->_rawQueryEventId;
}

- (void)setClientRequestId:(id)a3
{
}

- (SISchemaUUID)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setPlanId:(id)a3
{
}

- (SISchemaUUID)planId
{
  return self->_planId;
}

- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary;
  v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)&v51 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"planId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setPlanId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"clientRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setClientRequestId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"rawQueryEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setRawQueryEventId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"responseIsValidInput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsValidInput:](v5, "setResponseIsValidInput:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"responseIsStaticDialogueProvided"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsStaticDialogueProvided:](v5, "setResponseIsStaticDialogueProvided:", [v13 BOOLValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"responseMobileAssetVersion"];
    objc_opt_class();
    v50 = v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseMobileAssetVersion:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"responseInferenceLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseInferenceLocation:](v5, "setResponseInferenceLocation:", [v16 intValue]);
    }
    v42 = v16;
    int v17 = [v4 objectForKeyedSubscript:@"responseIsFallback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsFallback:](v5, "setResponseIsFallback:", [v17 BOOLValue]);
    }
    int v41 = v17;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"responsePreparationTime"];
    objc_opt_class();
    v49 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v18];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponsePreparationTime:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"responseInputValidationTime"];
    objc_opt_class();
    v48 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v20];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseInputValidationTime:v21];
    }
    v47 = (void *)v6;
    uint64_t v22 = [v4 objectForKeyedSubscript:@"responseOverridesTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v22];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseOverridesTime:v23];
    }
    v40 = (void *)v22;
    objc_super v46 = (void *)v8;
    v24 = [v4 objectForKeyedSubscript:@"responseCatalogueRetrievalTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v24];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseCatalogueRetrievalTime:v25];
    }
    v45 = (void *)v10;
    int v26 = [v4 objectForKeyedSubscript:@"responseCATHydrationTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v26];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseCATHydrationTime:v27];
    }
    int v44 = v12;
    v28 = [v4 objectForKeyedSubscript:@"responseModelInferenceTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v28];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseModelInferenceTime:v29];
    }
    v43 = v13;
    v30 = [v4 objectForKeyedSubscript:@"responseHallucinationInferenceTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v30];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseHallucinationInferenceTime:v31];
    }
    int v32 = [v4 objectForKeyedSubscript:@"responseSafetyInferenceTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v32];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseSafetyInferenceTime:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"responseGenerationTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v34];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setResponseGenerationTime:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v36];
      [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)v5 setFailureInfo:v37];
    }
    int v38 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self dictionaryRepresentation];
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
  if (self->_clientRequestId)
  {
    id v4 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self clientRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clientRequestId"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clientRequestId"];
    }
  }
  if (self->_failureInfo)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self failureInfo];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"failureInfo"];
    }
  }
  if (self->_planId)
  {
    uint64_t v10 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self planId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"planId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"planId"];
    }
  }
  if (self->_rawQueryEventId)
  {
    v13 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self rawQueryEventId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"rawQueryEventId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"rawQueryEventId"];
    }
  }
  if (self->_responseCATHydrationTime)
  {
    v16 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCATHydrationTime];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"responseCATHydrationTime"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"responseCATHydrationTime"];
    }
  }
  if (self->_responseCatalogueRetrievalTime)
  {
    v19 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCatalogueRetrievalTime];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"responseCatalogueRetrievalTime"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"responseCatalogueRetrievalTime"];
    }
  }
  if (self->_responseGenerationTime)
  {
    uint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseGenerationTime];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"responseGenerationTime"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"responseGenerationTime"];
    }
  }
  if (self->_responseHallucinationInferenceTime)
  {
    v25 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseHallucinationInferenceTime];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"responseHallucinationInferenceTime"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"responseHallucinationInferenceTime"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v28 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInferenceLocation];
    int v29 = @"RESPONSEINFERENCELOCTION_UNKNOWN";
    if (v28 == 1) {
      int v29 = @"RESPONSEINFERENCELOCTION_ON_DEVICE";
    }
    if (v28 == 2) {
      v30 = @"RESPONSEINFERENCELOCTION_SERVER";
    }
    else {
      v30 = v29;
    }
    [v3 setObject:v30 forKeyedSubscript:@"responseInferenceLocation"];
  }
  if (self->_responseInputValidationTime)
  {
    v31 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInputValidationTime];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"responseInputValidationTime"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"responseInputValidationTime"];
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v40 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseIsFallback](self, "responseIsFallback"));
    [v3 setObject:v40 forKeyedSubscript:@"responseIsFallback"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_55:
      if ((has & 1) == 0) {
        goto LABEL_57;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_55;
  }
  int v41 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseIsStaticDialogueProvided](self, "responseIsStaticDialogueProvided"));
  [v3 setObject:v41 forKeyedSubscript:@"responseIsStaticDialogueProvided"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_56:
    int v35 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseIsValidInput](self, "responseIsValidInput"));
    [v3 setObject:v35 forKeyedSubscript:@"responseIsValidInput"];
  }
LABEL_57:
  if (self->_responseMobileAssetVersion)
  {
    v36 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseMobileAssetVersion];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"responseMobileAssetVersion"];
  }
  if (self->_responseModelInferenceTime)
  {
    int v38 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseModelInferenceTime];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"responseModelInferenceTime"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"responseModelInferenceTime"];
    }
  }
  if (self->_responseOverridesTime)
  {
    v43 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseOverridesTime];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"responseOverridesTime"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"responseOverridesTime"];
    }
  }
  if (self->_responsePreparationTime)
  {
    objc_super v46 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responsePreparationTime];
    v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"responsePreparationTime"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"responsePreparationTime"];
    }
  }
  if (self->_responseSafetyInferenceTime)
  {
    v49 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseSafetyInferenceTime];
    v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"responseSafetyInferenceTime"];
    }
    else
    {
      objc_super v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"responseSafetyInferenceTime"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_planId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_clientRequestId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_rawQueryEventId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_responseIsValidInput;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_responseIsStaticDialogueProvided;
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  NSUInteger v8 = [(NSString *)self->_responseMobileAssetVersion hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_responseInferenceLocation;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_responseIsFallback;
LABEL_11:
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v12 = v10 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responsePreparationTime hash];
  unint64_t v13 = v12 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responseInputValidationTime hash];
  unint64_t v14 = v11 ^ v13 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responseOverridesTime hash];
  unint64_t v15 = [(PNRODSchemaPNRODMetricDuration *)self->_responseCatalogueRetrievalTime hash];
  unint64_t v16 = v15 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responseCATHydrationTime hash];
  unint64_t v17 = v16 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responseModelInferenceTime hash];
  unint64_t v18 = v17 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responseHallucinationInferenceTime hash];
  unint64_t v19 = v14 ^ v18 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responseSafetyInferenceTime hash];
  unint64_t v20 = [(PNRODSchemaPNRODMetricDuration *)self->_responseGenerationTime hash];
  return v19 ^ v20 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_86;
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self planId];
  uint64_t v6 = [v4 planId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self planId];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self planId];
    uint64_t v10 = [v4 planId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self clientRequestId];
  uint64_t v6 = [v4 clientRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self clientRequestId];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self clientRequestId];
    unint64_t v15 = [v4 clientRequestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self rawQueryEventId];
  uint64_t v6 = [v4 rawQueryEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self rawQueryEventId];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    unint64_t v19 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self rawQueryEventId];
    unint64_t v20 = [v4 rawQueryEventId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  $86BB7101E4381D961DA263370D03E249 has = self->_has;
  unsigned int v23 = v4[136];
  if ((*(unsigned char *)&has & 1) != (v23 & 1)) {
    goto LABEL_86;
  }
  if (*(unsigned char *)&has)
  {
    int responseIsValidInput = self->_responseIsValidInput;
    if (responseIsValidInput != [v4 responseIsValidInput]) {
      goto LABEL_86;
    }
    $86BB7101E4381D961DA263370D03E249 has = self->_has;
    unsigned int v23 = v4[136];
  }
  int v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1)) {
    goto LABEL_86;
  }
  if (v25)
  {
    int responseIsStaticDialogueProvided = self->_responseIsStaticDialogueProvided;
    if (responseIsStaticDialogueProvided != [v4 responseIsStaticDialogueProvided]) {
      goto LABEL_86;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseMobileAssetVersion];
  uint64_t v6 = [v4 responseMobileAssetVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v27 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseMobileAssetVersion];
  if (v27)
  {
    int v28 = (void *)v27;
    int v29 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseMobileAssetVersion];
    v30 = [v4 responseMobileAssetVersion];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  $86BB7101E4381D961DA263370D03E249 v32 = self->_has;
  int v33 = (*(unsigned int *)&v32 >> 2) & 1;
  unsigned int v34 = v4[136];
  if (v33 != ((v34 >> 2) & 1)) {
    goto LABEL_86;
  }
  if (v33)
  {
    int responseInferenceLocation = self->_responseInferenceLocation;
    if (responseInferenceLocation != [v4 responseInferenceLocation]) {
      goto LABEL_86;
    }
    $86BB7101E4381D961DA263370D03E249 v32 = self->_has;
    unsigned int v34 = v4[136];
  }
  int v36 = (*(unsigned int *)&v32 >> 3) & 1;
  if (v36 != ((v34 >> 3) & 1)) {
    goto LABEL_86;
  }
  if (v36)
  {
    int responseIsFallback = self->_responseIsFallback;
    if (responseIsFallback != [v4 responseIsFallback]) {
      goto LABEL_86;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responsePreparationTime];
  uint64_t v6 = [v4 responsePreparationTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v38 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responsePreparationTime];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responsePreparationTime];
    int v41 = [v4 responsePreparationTime];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInputValidationTime];
  uint64_t v6 = [v4 responseInputValidationTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v43 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInputValidationTime];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInputValidationTime];
    objc_super v46 = [v4 responseInputValidationTime];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseOverridesTime];
  uint64_t v6 = [v4 responseOverridesTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v48 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseOverridesTime];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseOverridesTime];
    objc_super v51 = [v4 responseOverridesTime];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCatalogueRetrievalTime];
  uint64_t v6 = [v4 responseCatalogueRetrievalTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v53 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCatalogueRetrievalTime];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCatalogueRetrievalTime];
    v56 = [v4 responseCatalogueRetrievalTime];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCATHydrationTime];
  uint64_t v6 = [v4 responseCATHydrationTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v58 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCATHydrationTime];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCATHydrationTime];
    v61 = [v4 responseCATHydrationTime];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseModelInferenceTime];
  uint64_t v6 = [v4 responseModelInferenceTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v63 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseModelInferenceTime];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseModelInferenceTime];
    v66 = [v4 responseModelInferenceTime];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseHallucinationInferenceTime];
  uint64_t v6 = [v4 responseHallucinationInferenceTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v68 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseHallucinationInferenceTime];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseHallucinationInferenceTime];
    v71 = [v4 responseHallucinationInferenceTime];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseSafetyInferenceTime];
  uint64_t v6 = [v4 responseSafetyInferenceTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v73 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseSafetyInferenceTime];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseSafetyInferenceTime];
    v76 = [v4 responseSafetyInferenceTime];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseGenerationTime];
  uint64_t v6 = [v4 responseGenerationTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_85;
  }
  uint64_t v78 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseGenerationTime];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseGenerationTime];
    v81 = [v4 responseGenerationTime];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_86;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self failureInfo];
  uint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_85:

    goto LABEL_86;
  }
  uint64_t v83 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self failureInfo];
  if (!v83)
  {

LABEL_89:
    BOOL v88 = 1;
    goto LABEL_87;
  }
  v84 = (void *)v83;
  v85 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self failureInfo];
  v86 = [v4 failureInfo];
  char v87 = [v85 isEqual:v86];

  if (v87) {
    goto LABEL_89;
  }
LABEL_86:
  BOOL v88 = 0;
LABEL_87:

  return v88;
}

- (void)writeTo:(id)a3
{
  id v34 = a3;
  unint64_t v4 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self planId];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self planId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self clientRequestId];

  if (v6)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self clientRequestId];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v8 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self rawQueryEventId];

  if (v8)
  {
    uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self rawQueryEventId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  int v11 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseMobileAssetVersion];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  char v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v12 = (char)self->_has;
  }
  if ((v12 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v13 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responsePreparationTime];

  if (v13)
  {
    unint64_t v14 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responsePreparationTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v15 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInputValidationTime];

  if (v15)
  {
    int v16 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseInputValidationTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseOverridesTime];

  if (v17)
  {
    unint64_t v18 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseOverridesTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v19 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCatalogueRetrievalTime];

  if (v19)
  {
    unint64_t v20 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCatalogueRetrievalTime];
    PBDataWriterWriteSubmessage();
  }
  int v21 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCATHydrationTime];

  if (v21)
  {
    uint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseCATHydrationTime];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v23 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseModelInferenceTime];

  if (v23)
  {
    v24 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseModelInferenceTime];
    PBDataWriterWriteSubmessage();
  }
  int v25 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseHallucinationInferenceTime];

  if (v25)
  {
    int v26 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseHallucinationInferenceTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v27 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseSafetyInferenceTime];

  if (v27)
  {
    int v28 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseSafetyInferenceTime];
    PBDataWriterWriteSubmessage();
  }
  int v29 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseGenerationTime];

  if (v29)
  {
    v30 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self responseGenerationTime];
    PBDataWriterWriteSubmessage();
  }
  int v31 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self failureInfo];

  $86BB7101E4381D961DA263370D03E249 v32 = v34;
  if (v31)
  {
    int v33 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();

    $86BB7101E4381D961DA263370D03E249 v32 = v34;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteResponseGenerationTime
{
}

- (BOOL)hasResponseGenerationTime
{
  return self->_responseGenerationTime != 0;
}

- (void)deleteResponseSafetyInferenceTime
{
}

- (BOOL)hasResponseSafetyInferenceTime
{
  return self->_responseSafetyInferenceTime != 0;
}

- (void)deleteResponseHallucinationInferenceTime
{
}

- (BOOL)hasResponseHallucinationInferenceTime
{
  return self->_responseHallucinationInferenceTime != 0;
}

- (void)deleteResponseModelInferenceTime
{
}

- (BOOL)hasResponseModelInferenceTime
{
  return self->_responseModelInferenceTime != 0;
}

- (void)deleteResponseCATHydrationTime
{
}

- (BOOL)hasResponseCATHydrationTime
{
  return self->_responseCATHydrationTime != 0;
}

- (void)deleteResponseCatalogueRetrievalTime
{
}

- (BOOL)hasResponseCatalogueRetrievalTime
{
  return self->_responseCatalogueRetrievalTime != 0;
}

- (void)deleteResponseOverridesTime
{
}

- (BOOL)hasResponseOverridesTime
{
  return self->_responseOverridesTime != 0;
}

- (void)deleteResponseInputValidationTime
{
}

- (BOOL)hasResponseInputValidationTime
{
  return self->_responseInputValidationTime != 0;
}

- (void)deleteResponsePreparationTime
{
}

- (BOOL)hasResponsePreparationTime
{
  return self->_responsePreparationTime != 0;
}

- (void)deleteResponseIsFallback
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasResponseIsFallback:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResponseIsFallback
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setResponseIsFallback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int responseIsFallback = a3;
}

- (void)deleteResponseInferenceLocation
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasResponseInferenceLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseInferenceLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setResponseInferenceLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int responseInferenceLocation = a3;
}

- (void)deleteResponseMobileAssetVersion
{
}

- (BOOL)hasResponseMobileAssetVersion
{
  return self->_responseMobileAssetVersion != 0;
}

- (void)deleteResponseIsStaticDialogueProvided
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResponseIsStaticDialogueProvided:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseIsStaticDialogueProvided
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResponseIsStaticDialogueProvided:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int responseIsStaticDialogueProvided = a3;
}

- (void)deleteResponseIsValidInput
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResponseIsValidInput:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseIsValidInput
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResponseIsValidInput:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int responseIsValidInput = a3;
}

- (void)deleteRawQueryEventId
{
}

- (BOOL)hasRawQueryEventId
{
  return self->_rawQueryEventId != 0;
}

- (void)deleteClientRequestId
{
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deletePlanId
{
}

- (BOOL)hasPlanId
{
  return self->_planId != 0;
}

@end