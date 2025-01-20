@interface PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary
- (BOOL)hasClientRequestId;
- (BOOL)hasFailureInfo;
- (BOOL)hasFullPlannerInferenceInvocationSource;
- (BOOL)hasFullPlannerModelInferenceCallTime;
- (BOOL)hasFullPlannerServiceHandleTime;
- (BOOL)hasModelAssetVersion;
- (BOOL)hasPlanId;
- (BOOL)hasPlanOverridesServiceHandleTime;
- (BOOL)hasPlanResolverServiceHandleTime;
- (BOOL)hasQueryDecorationContextRetrievalDuration;
- (BOOL)hasQueryDecorationSpanRetrievalDuration;
- (BOOL)hasQueryDecorationToolRetrievalDuration;
- (BOOL)hasQueryDecorationTotalCollectInputsDuration;
- (BOOL)hasQueryDecorationTotalRankingDuration;
- (BOOL)hasQueryDecorationTupleBuildingDuration;
- (BOOL)hasQueryDecorationTupleRankingDuration;
- (BOOL)hasRawQueryEventId;
- (BOOL)hasResponseGenerationServiceHandleTime;
- (BOOL)hasStandardPlannerGeneratePlanTime;
- (BOOL)hasStandardPlannerMakePlanTime;
- (BOOL)hasStandardPlannerPrescribedPlanGeneratorTime;
- (BOOL)hasStandardPlannerQueryDecorationTime;
- (BOOL)hasWasPlanOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasPlanOverridden;
- (NSData)jsonData;
- (NSString)modelAssetVersion;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)initWithJSON:(id)a3;
- (PNRODSchemaPNRODMetricDuration)fullPlannerModelInferenceCallTime;
- (PNRODSchemaPNRODMetricDuration)fullPlannerServiceHandleTime;
- (PNRODSchemaPNRODMetricDuration)planOverridesServiceHandleTime;
- (PNRODSchemaPNRODMetricDuration)planResolverServiceHandleTime;
- (PNRODSchemaPNRODMetricDuration)queryDecorationContextRetrievalDuration;
- (PNRODSchemaPNRODMetricDuration)queryDecorationSpanRetrievalDuration;
- (PNRODSchemaPNRODMetricDuration)queryDecorationToolRetrievalDuration;
- (PNRODSchemaPNRODMetricDuration)queryDecorationTotalCollectInputsDuration;
- (PNRODSchemaPNRODMetricDuration)queryDecorationTotalRankingDuration;
- (PNRODSchemaPNRODMetricDuration)queryDecorationTupleBuildingDuration;
- (PNRODSchemaPNRODMetricDuration)queryDecorationTupleRankingDuration;
- (PNRODSchemaPNRODMetricDuration)responseGenerationServiceHandleTime;
- (PNRODSchemaPNRODMetricDuration)standardPlannerGeneratePlanTime;
- (PNRODSchemaPNRODMetricDuration)standardPlannerMakePlanTime;
- (PNRODSchemaPNRODMetricDuration)standardPlannerPrescribedPlanGeneratorTime;
- (PNRODSchemaPNRODMetricDuration)standardPlannerQueryDecorationTime;
- (SISchemaUUID)clientRequestId;
- (SISchemaUUID)planId;
- (SISchemaUUID)rawQueryEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)fullPlannerInferenceInvocationSource;
- (unint64_t)hash;
- (void)deleteClientRequestId;
- (void)deleteFailureInfo;
- (void)deleteFullPlannerInferenceInvocationSource;
- (void)deleteFullPlannerModelInferenceCallTime;
- (void)deleteFullPlannerServiceHandleTime;
- (void)deleteModelAssetVersion;
- (void)deletePlanId;
- (void)deletePlanOverridesServiceHandleTime;
- (void)deletePlanResolverServiceHandleTime;
- (void)deleteQueryDecorationContextRetrievalDuration;
- (void)deleteQueryDecorationSpanRetrievalDuration;
- (void)deleteQueryDecorationToolRetrievalDuration;
- (void)deleteQueryDecorationTotalCollectInputsDuration;
- (void)deleteQueryDecorationTotalRankingDuration;
- (void)deleteQueryDecorationTupleBuildingDuration;
- (void)deleteQueryDecorationTupleRankingDuration;
- (void)deleteRawQueryEventId;
- (void)deleteResponseGenerationServiceHandleTime;
- (void)deleteStandardPlannerGeneratePlanTime;
- (void)deleteStandardPlannerMakePlanTime;
- (void)deleteStandardPlannerPrescribedPlanGeneratorTime;
- (void)deleteStandardPlannerQueryDecorationTime;
- (void)deleteWasPlanOverridden;
- (void)setClientRequestId:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setFullPlannerInferenceInvocationSource:(int64_t)a3;
- (void)setFullPlannerModelInferenceCallTime:(id)a3;
- (void)setFullPlannerServiceHandleTime:(id)a3;
- (void)setHasClientRequestId:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasFullPlannerInferenceInvocationSource:(BOOL)a3;
- (void)setHasFullPlannerModelInferenceCallTime:(BOOL)a3;
- (void)setHasFullPlannerServiceHandleTime:(BOOL)a3;
- (void)setHasModelAssetVersion:(BOOL)a3;
- (void)setHasPlanId:(BOOL)a3;
- (void)setHasPlanOverridesServiceHandleTime:(BOOL)a3;
- (void)setHasPlanResolverServiceHandleTime:(BOOL)a3;
- (void)setHasQueryDecorationContextRetrievalDuration:(BOOL)a3;
- (void)setHasQueryDecorationSpanRetrievalDuration:(BOOL)a3;
- (void)setHasQueryDecorationToolRetrievalDuration:(BOOL)a3;
- (void)setHasQueryDecorationTotalCollectInputsDuration:(BOOL)a3;
- (void)setHasQueryDecorationTotalRankingDuration:(BOOL)a3;
- (void)setHasQueryDecorationTupleBuildingDuration:(BOOL)a3;
- (void)setHasQueryDecorationTupleRankingDuration:(BOOL)a3;
- (void)setHasRawQueryEventId:(BOOL)a3;
- (void)setHasResponseGenerationServiceHandleTime:(BOOL)a3;
- (void)setHasStandardPlannerGeneratePlanTime:(BOOL)a3;
- (void)setHasStandardPlannerMakePlanTime:(BOOL)a3;
- (void)setHasStandardPlannerPrescribedPlanGeneratorTime:(BOOL)a3;
- (void)setHasStandardPlannerQueryDecorationTime:(BOOL)a3;
- (void)setHasWasPlanOverridden:(BOOL)a3;
- (void)setModelAssetVersion:(id)a3;
- (void)setPlanId:(id)a3;
- (void)setPlanOverridesServiceHandleTime:(id)a3;
- (void)setPlanResolverServiceHandleTime:(id)a3;
- (void)setQueryDecorationContextRetrievalDuration:(id)a3;
- (void)setQueryDecorationSpanRetrievalDuration:(id)a3;
- (void)setQueryDecorationToolRetrievalDuration:(id)a3;
- (void)setQueryDecorationTotalCollectInputsDuration:(id)a3;
- (void)setQueryDecorationTotalRankingDuration:(id)a3;
- (void)setQueryDecorationTupleBuildingDuration:(id)a3;
- (void)setQueryDecorationTupleRankingDuration:(id)a3;
- (void)setRawQueryEventId:(id)a3;
- (void)setResponseGenerationServiceHandleTime:(id)a3;
- (void)setStandardPlannerGeneratePlanTime:(id)a3;
- (void)setStandardPlannerMakePlanTime:(id)a3;
- (void)setStandardPlannerPrescribedPlanGeneratorTime:(id)a3;
- (void)setStandardPlannerQueryDecorationTime:(id)a3;
- (void)setWasPlanOverridden:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v67 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deletePlanId];
  }
  v9 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self clientRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteClientRequestId];
  }
  v12 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self rawQueryEventId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteRawQueryEventId];
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerMakePlanTime];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteStandardPlannerMakePlanTime];
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerQueryDecorationTime];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteStandardPlannerQueryDecorationTime];
  }
  v21 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerPrescribedPlanGeneratorTime];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteStandardPlannerPrescribedPlanGeneratorTime];
  }
  v24 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerGeneratePlanTime];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteStandardPlannerGeneratePlanTime];
  }
  v27 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planResolverServiceHandleTime];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deletePlanResolverServiceHandleTime];
  }
  v30 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self responseGenerationServiceHandleTime];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteResponseGenerationServiceHandleTime];
  }
  v33 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planOverridesServiceHandleTime];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deletePlanOverridesServiceHandleTime];
  }
  v36 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerServiceHandleTime];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteFullPlannerServiceHandleTime];
  }
  v39 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerModelInferenceCallTime];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteFullPlannerModelInferenceCallTime];
  }
  v42 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalCollectInputsDuration];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteQueryDecorationTotalCollectInputsDuration];
  }
  v45 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationSpanRetrievalDuration];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteQueryDecorationSpanRetrievalDuration];
  }
  v48 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationContextRetrievalDuration];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteQueryDecorationContextRetrievalDuration];
  }
  v51 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationToolRetrievalDuration];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteQueryDecorationToolRetrievalDuration];
  }
  v54 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalRankingDuration];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteQueryDecorationTotalRankingDuration];
  }
  v57 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleBuildingDuration];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteQueryDecorationTupleBuildingDuration];
  }
  v60 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleRankingDuration];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteQueryDecorationTupleRankingDuration];
  }
  v63 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self failureInfo];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_queryDecorationTupleRankingDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationTupleBuildingDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationTotalRankingDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationToolRetrievalDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationContextRetrievalDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationSpanRetrievalDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationTotalCollectInputsDuration, 0);
  objc_storeStrong((id *)&self->_fullPlannerModelInferenceCallTime, 0);
  objc_storeStrong((id *)&self->_fullPlannerServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_planOverridesServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_responseGenerationServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_planResolverServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerGeneratePlanTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerPrescribedPlanGeneratorTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerQueryDecorationTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerMakePlanTime, 0);
  objc_storeStrong((id *)&self->_modelAssetVersion, 0);
  objc_storeStrong((id *)&self->_rawQueryEventId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasQueryDecorationTotalRankingDuration = a3;
}

- (void)setHasQueryDecorationTupleRankingDuration:(BOOL)a3
{
  self->_hasQueryDecorationToolRetrievalDuration = a3;
}

- (void)setHasQueryDecorationTupleBuildingDuration:(BOOL)a3
{
  self->_hasQueryDecorationContextRetrievalDuration = a3;
}

- (void)setHasQueryDecorationTotalRankingDuration:(BOOL)a3
{
  self->_hasQueryDecorationSpanRetrievalDuration = a3;
}

- (void)setHasQueryDecorationToolRetrievalDuration:(BOOL)a3
{
  self->_hasQueryDecorationTotalCollectInputsDuration = a3;
}

- (void)setHasQueryDecorationContextRetrievalDuration:(BOOL)a3
{
  self->_hasFullPlannerModelInferenceCallTime = a3;
}

- (void)setHasQueryDecorationSpanRetrievalDuration:(BOOL)a3
{
  self->_hasFullPlannerServiceHandleTime = a3;
}

- (void)setHasQueryDecorationTotalCollectInputsDuration:(BOOL)a3
{
  self->_hasPlanOverridesServiceHandleTime = a3;
}

- (void)setHasFullPlannerModelInferenceCallTime:(BOOL)a3
{
  self->_hasResponseGenerationServiceHandleTime = a3;
}

- (void)setHasFullPlannerServiceHandleTime:(BOOL)a3
{
  self->_hasPlanResolverServiceHandleTime = a3;
}

- (void)setHasPlanOverridesServiceHandleTime:(BOOL)a3
{
  self->_hasStandardPlannerGeneratePlanTime = a3;
}

- (void)setHasResponseGenerationServiceHandleTime:(BOOL)a3
{
  self->_hasStandardPlannerPrescribedPlanGeneratorTime = a3;
}

- (void)setHasPlanResolverServiceHandleTime:(BOOL)a3
{
  self->_hasStandardPlannerQueryDecorationTime = a3;
}

- (void)setHasStandardPlannerGeneratePlanTime:(BOOL)a3
{
  self->_hasStandardPlannerMakePlanTime = a3;
}

- (void)setHasStandardPlannerPrescribedPlanGeneratorTime:(BOOL)a3
{
  self->_hasModelAssetVersion = a3;
}

- (void)setHasStandardPlannerQueryDecorationTime:(BOOL)a3
{
  self->_hasRawQueryEventId = a3;
}

- (void)setHasStandardPlannerMakePlanTime:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasModelAssetVersion:(BOOL)a3
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

- (void)setQueryDecorationTupleRankingDuration:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTupleRankingDuration
{
  return self->_queryDecorationTupleRankingDuration;
}

- (void)setQueryDecorationTupleBuildingDuration:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTupleBuildingDuration
{
  return self->_queryDecorationTupleBuildingDuration;
}

- (void)setQueryDecorationTotalRankingDuration:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTotalRankingDuration
{
  return self->_queryDecorationTotalRankingDuration;
}

- (void)setQueryDecorationToolRetrievalDuration:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationToolRetrievalDuration
{
  return self->_queryDecorationToolRetrievalDuration;
}

- (void)setQueryDecorationContextRetrievalDuration:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationContextRetrievalDuration
{
  return self->_queryDecorationContextRetrievalDuration;
}

- (void)setQueryDecorationSpanRetrievalDuration:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationSpanRetrievalDuration
{
  return self->_queryDecorationSpanRetrievalDuration;
}

- (void)setQueryDecorationTotalCollectInputsDuration:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTotalCollectInputsDuration
{
  return self->_queryDecorationTotalCollectInputsDuration;
}

- (void)setFullPlannerModelInferenceCallTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)fullPlannerModelInferenceCallTime
{
  return self->_fullPlannerModelInferenceCallTime;
}

- (void)setFullPlannerServiceHandleTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)fullPlannerServiceHandleTime
{
  return self->_fullPlannerServiceHandleTime;
}

- (void)setPlanOverridesServiceHandleTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)planOverridesServiceHandleTime
{
  return self->_planOverridesServiceHandleTime;
}

- (void)setResponseGenerationServiceHandleTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseGenerationServiceHandleTime
{
  return self->_responseGenerationServiceHandleTime;
}

- (void)setPlanResolverServiceHandleTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)planResolverServiceHandleTime
{
  return self->_planResolverServiceHandleTime;
}

- (void)setStandardPlannerGeneratePlanTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerGeneratePlanTime
{
  return self->_standardPlannerGeneratePlanTime;
}

- (void)setStandardPlannerPrescribedPlanGeneratorTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerPrescribedPlanGeneratorTime
{
  return self->_standardPlannerPrescribedPlanGeneratorTime;
}

- (void)setStandardPlannerQueryDecorationTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerQueryDecorationTime
{
  return self->_standardPlannerQueryDecorationTime;
}

- (void)setStandardPlannerMakePlanTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerMakePlanTime
{
  return self->_standardPlannerMakePlanTime;
}

- (int64_t)fullPlannerInferenceInvocationSource
{
  return self->_fullPlannerInferenceInvocationSource;
}

- (void)setModelAssetVersion:(id)a3
{
}

- (NSString)modelAssetVersion
{
  return self->_modelAssetVersion;
}

- (BOOL)wasPlanOverridden
{
  return self->_wasPlanOverridden;
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

- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary;
  v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)&v68 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"planId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setPlanId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"clientRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setClientRequestId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"rawQueryEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setRawQueryEventId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"wasPlanOverridden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setWasPlanOverridden:](v5, "setWasPlanOverridden:", [v12 BOOLValue]);
    }
    int v56 = v12;
    v13 = [v4 objectForKeyedSubscript:@"modelAssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = (void *)[v13 copy];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setModelAssetVersion:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"fullPlannerInferenceInvocationSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFullPlannerInferenceInvocationSource:](v5, "setFullPlannerInferenceInvocationSource:", [v15 longLongValue]);
    }
    v54 = v15;
    uint64_t v16 = [v4 objectForKeyedSubscript:@"standardPlannerMakePlanTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v16];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setStandardPlannerMakePlanTime:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"standardPlannerQueryDecorationTime"];
    objc_opt_class();
    objc_super v67 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v18];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setStandardPlannerQueryDecorationTime:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"standardPlannerPrescribedPlanGeneratorTime"];
    objc_opt_class();
    v66 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v20];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setStandardPlannerPrescribedPlanGeneratorTime:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"standardPlannerGeneratePlanTime"];
    objc_opt_class();
    int v65 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v22];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setStandardPlannerGeneratePlanTime:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"planResolverServiceHandleTime"];
    objc_opt_class();
    v64 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v24];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setPlanResolverServiceHandleTime:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"responseGenerationServiceHandleTime"];
    objc_opt_class();
    v63 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v26];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setResponseGenerationServiceHandleTime:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"planOverridesServiceHandleTime"];
    objc_opt_class();
    int v62 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v28];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setPlanOverridesServiceHandleTime:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"fullPlannerServiceHandleTime"];
    objc_opt_class();
    v61 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v30];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setFullPlannerServiceHandleTime:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"fullPlannerModelInferenceCallTime"];
    objc_opt_class();
    v60 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v32];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setFullPlannerModelInferenceCallTime:v33];
    }
    int v53 = (void *)v16;
    uint64_t v34 = [v4 objectForKeyedSubscript:@"queryDecorationTotalCollectInputsDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v34];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setQueryDecorationTotalCollectInputsDuration:v35];
    }
    int v59 = (void *)v6;
    v36 = objc_msgSend(v4, "objectForKeyedSubscript:", @"queryDecorationSpanRetrievalDuration", v34);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v36];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setQueryDecorationSpanRetrievalDuration:v37];
    }
    v58 = (void *)v8;
    int v38 = [v4 objectForKeyedSubscript:@"queryDecorationContextRetrievalDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v38];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setQueryDecorationContextRetrievalDuration:v39];
    }
    v57 = (void *)v10;
    v40 = [v4 objectForKeyedSubscript:@"queryDecorationToolRetrievalDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v40];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setQueryDecorationToolRetrievalDuration:v41];
    }
    v55 = v13;
    v42 = [v4 objectForKeyedSubscript:@"queryDecorationTotalRankingDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v42];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setQueryDecorationTotalRankingDuration:v43];
    }
    int v44 = [v4 objectForKeyedSubscript:@"queryDecorationTupleBuildingDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v44];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setQueryDecorationTupleBuildingDuration:v45];
    }
    v46 = [v4 objectForKeyedSubscript:@"queryDecorationTupleRankingDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v46];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setQueryDecorationTupleRankingDuration:v47];
    }
    v48 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v48];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)v5 setFailureInfo:v49];
    }
    int v50 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self dictionaryRepresentation];
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
    id v4 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self clientRequestId];
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
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self failureInfo];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerInferenceInvocationSource](self, "fullPlannerInferenceInvocationSource"));
    [v3 setObject:v10 forKeyedSubscript:@"fullPlannerInferenceInvocationSource"];
  }
  if (self->_fullPlannerModelInferenceCallTime)
  {
    int v11 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerModelInferenceCallTime];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"fullPlannerModelInferenceCallTime"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"fullPlannerModelInferenceCallTime"];
    }
  }
  if (self->_fullPlannerServiceHandleTime)
  {
    int v14 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerServiceHandleTime];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"fullPlannerServiceHandleTime"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"fullPlannerServiceHandleTime"];
    }
  }
  if (self->_modelAssetVersion)
  {
    int v17 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self modelAssetVersion];
    uint64_t v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"modelAssetVersion"];
  }
  if (self->_planId)
  {
    v19 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planId];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"planId"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"planId"];
    }
  }
  if (self->_planOverridesServiceHandleTime)
  {
    uint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planOverridesServiceHandleTime];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"planOverridesServiceHandleTime"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"planOverridesServiceHandleTime"];
    }
  }
  if (self->_planResolverServiceHandleTime)
  {
    v25 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planResolverServiceHandleTime];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"planResolverServiceHandleTime"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"planResolverServiceHandleTime"];
    }
  }
  if (self->_queryDecorationContextRetrievalDuration)
  {
    uint64_t v28 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationContextRetrievalDuration];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"queryDecorationContextRetrievalDuration"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"queryDecorationContextRetrievalDuration"];
    }
  }
  if (self->_queryDecorationSpanRetrievalDuration)
  {
    v31 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationSpanRetrievalDuration];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"queryDecorationSpanRetrievalDuration"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"queryDecorationSpanRetrievalDuration"];
    }
  }
  if (self->_queryDecorationToolRetrievalDuration)
  {
    uint64_t v34 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationToolRetrievalDuration];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"queryDecorationToolRetrievalDuration"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"queryDecorationToolRetrievalDuration"];
    }
  }
  if (self->_queryDecorationTotalCollectInputsDuration)
  {
    v37 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalCollectInputsDuration];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"queryDecorationTotalCollectInputsDuration"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"queryDecorationTotalCollectInputsDuration"];
    }
  }
  if (self->_queryDecorationTotalRankingDuration)
  {
    v40 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalRankingDuration];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"queryDecorationTotalRankingDuration"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"queryDecorationTotalRankingDuration"];
    }
  }
  if (self->_queryDecorationTupleBuildingDuration)
  {
    v43 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleBuildingDuration];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"queryDecorationTupleBuildingDuration"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"queryDecorationTupleBuildingDuration"];
    }
  }
  if (self->_queryDecorationTupleRankingDuration)
  {
    v46 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleRankingDuration];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"queryDecorationTupleRankingDuration"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"queryDecorationTupleRankingDuration"];
    }
  }
  if (self->_rawQueryEventId)
  {
    v49 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self rawQueryEventId];
    int v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"rawQueryEventId"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"rawQueryEventId"];
    }
  }
  if (self->_responseGenerationServiceHandleTime)
  {
    v52 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self responseGenerationServiceHandleTime];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"responseGenerationServiceHandleTime"];
    }
    else
    {
      v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"responseGenerationServiceHandleTime"];
    }
  }
  if (self->_standardPlannerGeneratePlanTime)
  {
    v55 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerGeneratePlanTime];
    int v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"standardPlannerGeneratePlanTime"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"standardPlannerGeneratePlanTime"];
    }
  }
  if (self->_standardPlannerMakePlanTime)
  {
    v58 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerMakePlanTime];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"standardPlannerMakePlanTime"];
    }
    else
    {
      v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"standardPlannerMakePlanTime"];
    }
  }
  if (self->_standardPlannerPrescribedPlanGeneratorTime)
  {
    v61 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerPrescribedPlanGeneratorTime];
    int v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"standardPlannerPrescribedPlanGeneratorTime"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"standardPlannerPrescribedPlanGeneratorTime"];
    }
  }
  if (self->_standardPlannerQueryDecorationTime)
  {
    v64 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerQueryDecorationTime];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"standardPlannerQueryDecorationTime"];
    }
    else
    {
      v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"standardPlannerQueryDecorationTime"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v67 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary wasPlanOverridden](self, "wasPlanOverridden"));
    [v3 setObject:v67 forKeyedSubscript:@"wasPlanOverridden"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v68 = v3;

  return v68;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_planId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_clientRequestId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_rawQueryEventId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_wasPlanOverridden;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_modelAssetVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_fullPlannerInferenceInvocationSource;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(PNRODSchemaPNRODMetricDuration *)self->_standardPlannerMakePlanTime hash];
  unint64_t v10 = [(PNRODSchemaPNRODMetricDuration *)self->_standardPlannerQueryDecorationTime hash];
  unint64_t v11 = v10 ^ [(PNRODSchemaPNRODMetricDuration *)self->_standardPlannerPrescribedPlanGeneratorTime hash];
  unint64_t v12 = v11 ^ [(PNRODSchemaPNRODMetricDuration *)self->_standardPlannerGeneratePlanTime hash];
  unint64_t v13 = v9 ^ v12 ^ [(PNRODSchemaPNRODMetricDuration *)self->_planResolverServiceHandleTime hash];
  unint64_t v14 = [(PNRODSchemaPNRODMetricDuration *)self->_responseGenerationServiceHandleTime hash];
  unint64_t v15 = v14 ^ [(PNRODSchemaPNRODMetricDuration *)self->_planOverridesServiceHandleTime hash];
  unint64_t v16 = v15 ^ [(PNRODSchemaPNRODMetricDuration *)self->_fullPlannerServiceHandleTime hash];
  unint64_t v17 = v16 ^ [(PNRODSchemaPNRODMetricDuration *)self->_fullPlannerModelInferenceCallTime hash];
  unint64_t v18 = v13 ^ v17 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationTotalCollectInputsDuration hash];
  unint64_t v19 = [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationSpanRetrievalDuration hash];
  unint64_t v20 = v19 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationContextRetrievalDuration hash];
  unint64_t v21 = v20 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationToolRetrievalDuration hash];
  unint64_t v22 = v21 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationTotalRankingDuration hash];
  unint64_t v23 = v22 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationTupleBuildingDuration hash];
  unint64_t v24 = v18 ^ v23 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationTupleRankingDuration hash];
  return v24 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_113;
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planId];
  uint64_t v6 = [v4 planId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planId];
    unint64_t v10 = [v4 planId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self clientRequestId];
  uint64_t v6 = [v4 clientRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self clientRequestId];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self clientRequestId];
    unint64_t v15 = [v4 clientRequestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self rawQueryEventId];
  uint64_t v6 = [v4 rawQueryEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self rawQueryEventId];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    unint64_t v19 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self rawQueryEventId];
    unint64_t v20 = [v4 rawQueryEventId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[192] & 1)) {
    goto LABEL_113;
  }
  if (*(unsigned char *)&self->_has)
  {
    int wasPlanOverridden = self->_wasPlanOverridden;
    if (wasPlanOverridden != [v4 wasPlanOverridden]) {
      goto LABEL_113;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self modelAssetVersion];
  uint64_t v6 = [v4 modelAssetVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v23 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self modelAssetVersion];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    v25 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self modelAssetVersion];
    uint64_t v26 = [v4 modelAssetVersion];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  int v28 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v28 != ((v4[192] >> 1) & 1)) {
    goto LABEL_113;
  }
  if (v28)
  {
    int64_t fullPlannerInferenceInvocationSource = self->_fullPlannerInferenceInvocationSource;
    if (fullPlannerInferenceInvocationSource != [v4 fullPlannerInferenceInvocationSource]) {
      goto LABEL_113;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerMakePlanTime];
  uint64_t v6 = [v4 standardPlannerMakePlanTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v30 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerMakePlanTime];
  if (v30)
  {
    v31 = (void *)v30;
    uint64_t v32 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerMakePlanTime];
    v33 = [v4 standardPlannerMakePlanTime];
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerQueryDecorationTime];
  uint64_t v6 = [v4 standardPlannerQueryDecorationTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v35 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerQueryDecorationTime];
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerQueryDecorationTime];
    int v38 = [v4 standardPlannerQueryDecorationTime];
    int v39 = [v37 isEqual:v38];

    if (!v39) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerPrescribedPlanGeneratorTime];
  uint64_t v6 = [v4 standardPlannerPrescribedPlanGeneratorTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v40 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerPrescribedPlanGeneratorTime];
  if (v40)
  {
    int v41 = (void *)v40;
    v42 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerPrescribedPlanGeneratorTime];
    v43 = [v4 standardPlannerPrescribedPlanGeneratorTime];
    int v44 = [v42 isEqual:v43];

    if (!v44) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerGeneratePlanTime];
  uint64_t v6 = [v4 standardPlannerGeneratePlanTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v45 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerGeneratePlanTime];
  if (v45)
  {
    v46 = (void *)v45;
    int v47 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerGeneratePlanTime];
    v48 = [v4 standardPlannerGeneratePlanTime];
    int v49 = [v47 isEqual:v48];

    if (!v49) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planResolverServiceHandleTime];
  uint64_t v6 = [v4 planResolverServiceHandleTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v50 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planResolverServiceHandleTime];
  if (v50)
  {
    v51 = (void *)v50;
    v52 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planResolverServiceHandleTime];
    int v53 = [v4 planResolverServiceHandleTime];
    int v54 = [v52 isEqual:v53];

    if (!v54) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self responseGenerationServiceHandleTime];
  uint64_t v6 = [v4 responseGenerationServiceHandleTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v55 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self responseGenerationServiceHandleTime];
  if (v55)
  {
    int v56 = (void *)v55;
    v57 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self responseGenerationServiceHandleTime];
    v58 = [v4 responseGenerationServiceHandleTime];
    int v59 = [v57 isEqual:v58];

    if (!v59) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planOverridesServiceHandleTime];
  uint64_t v6 = [v4 planOverridesServiceHandleTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v60 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planOverridesServiceHandleTime];
  if (v60)
  {
    v61 = (void *)v60;
    int v62 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planOverridesServiceHandleTime];
    v63 = [v4 planOverridesServiceHandleTime];
    int v64 = [v62 isEqual:v63];

    if (!v64) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerServiceHandleTime];
  uint64_t v6 = [v4 fullPlannerServiceHandleTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v65 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerServiceHandleTime];
  if (v65)
  {
    v66 = (void *)v65;
    objc_super v67 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerServiceHandleTime];
    id v68 = [v4 fullPlannerServiceHandleTime];
    int v69 = [v67 isEqual:v68];

    if (!v69) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerModelInferenceCallTime];
  uint64_t v6 = [v4 fullPlannerModelInferenceCallTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v70 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerModelInferenceCallTime];
  if (v70)
  {
    v71 = (void *)v70;
    v72 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerModelInferenceCallTime];
    v73 = [v4 fullPlannerModelInferenceCallTime];
    int v74 = [v72 isEqual:v73];

    if (!v74) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalCollectInputsDuration];
  uint64_t v6 = [v4 queryDecorationTotalCollectInputsDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v75 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalCollectInputsDuration];
  if (v75)
  {
    v76 = (void *)v75;
    v77 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalCollectInputsDuration];
    v78 = [v4 queryDecorationTotalCollectInputsDuration];
    int v79 = [v77 isEqual:v78];

    if (!v79) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationSpanRetrievalDuration];
  uint64_t v6 = [v4 queryDecorationSpanRetrievalDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v80 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationSpanRetrievalDuration];
  if (v80)
  {
    v81 = (void *)v80;
    v82 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationSpanRetrievalDuration];
    v83 = [v4 queryDecorationSpanRetrievalDuration];
    int v84 = [v82 isEqual:v83];

    if (!v84) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationContextRetrievalDuration];
  uint64_t v6 = [v4 queryDecorationContextRetrievalDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v85 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationContextRetrievalDuration];
  if (v85)
  {
    v86 = (void *)v85;
    v87 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationContextRetrievalDuration];
    v88 = [v4 queryDecorationContextRetrievalDuration];
    int v89 = [v87 isEqual:v88];

    if (!v89) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationToolRetrievalDuration];
  uint64_t v6 = [v4 queryDecorationToolRetrievalDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v90 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationToolRetrievalDuration];
  if (v90)
  {
    v91 = (void *)v90;
    v92 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationToolRetrievalDuration];
    v93 = [v4 queryDecorationToolRetrievalDuration];
    int v94 = [v92 isEqual:v93];

    if (!v94) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalRankingDuration];
  uint64_t v6 = [v4 queryDecorationTotalRankingDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v95 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalRankingDuration];
  if (v95)
  {
    v96 = (void *)v95;
    v97 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalRankingDuration];
    v98 = [v4 queryDecorationTotalRankingDuration];
    int v99 = [v97 isEqual:v98];

    if (!v99) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleBuildingDuration];
  uint64_t v6 = [v4 queryDecorationTupleBuildingDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v100 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleBuildingDuration];
  if (v100)
  {
    v101 = (void *)v100;
    v102 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleBuildingDuration];
    v103 = [v4 queryDecorationTupleBuildingDuration];
    int v104 = [v102 isEqual:v103];

    if (!v104) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleRankingDuration];
  uint64_t v6 = [v4 queryDecorationTupleRankingDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_112;
  }
  uint64_t v105 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleRankingDuration];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleRankingDuration];
    v108 = [v4 queryDecorationTupleRankingDuration];
    int v109 = [v107 isEqual:v108];

    if (!v109) {
      goto LABEL_113;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self failureInfo];
  uint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v110 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self failureInfo];
    if (!v110)
    {

LABEL_116:
      BOOL v115 = 1;
      goto LABEL_114;
    }
    v111 = (void *)v110;
    v112 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self failureInfo];
    v113 = [v4 failureInfo];
    char v114 = [v112 isEqual:v113];

    if (v114) {
      goto LABEL_116;
    }
  }
  else
  {
LABEL_112:
  }
LABEL_113:
  BOOL v115 = 0;
LABEL_114:

  return v115;
}

- (void)writeTo:(id)a3
{
  id v46 = a3;
  unint64_t v4 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planId];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self clientRequestId];

  if (v6)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self clientRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self rawQueryEventId];

  if (v8)
  {
    unint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self rawQueryEventId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v10 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self modelAssetVersion];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  int v11 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerMakePlanTime];

  if (v11)
  {
    uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerMakePlanTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v13 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerQueryDecorationTime];

  if (v13)
  {
    unint64_t v14 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerQueryDecorationTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v15 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerPrescribedPlanGeneratorTime];

  if (v15)
  {
    int v16 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerPrescribedPlanGeneratorTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerGeneratePlanTime];

  if (v17)
  {
    unint64_t v18 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self standardPlannerGeneratePlanTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v19 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planResolverServiceHandleTime];

  if (v19)
  {
    unint64_t v20 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planResolverServiceHandleTime];
    PBDataWriterWriteSubmessage();
  }
  int v21 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self responseGenerationServiceHandleTime];

  if (v21)
  {
    unint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self responseGenerationServiceHandleTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v23 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planOverridesServiceHandleTime];

  if (v23)
  {
    unint64_t v24 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self planOverridesServiceHandleTime];
    PBDataWriterWriteSubmessage();
  }
  v25 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerServiceHandleTime];

  if (v25)
  {
    uint64_t v26 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerServiceHandleTime];
    PBDataWriterWriteSubmessage();
  }
  int v27 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerModelInferenceCallTime];

  if (v27)
  {
    int v28 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self fullPlannerModelInferenceCallTime];
    PBDataWriterWriteSubmessage();
  }
  int v29 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalCollectInputsDuration];

  if (v29)
  {
    uint64_t v30 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalCollectInputsDuration];
    PBDataWriterWriteSubmessage();
  }
  v31 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationSpanRetrievalDuration];

  if (v31)
  {
    uint64_t v32 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationSpanRetrievalDuration];
    PBDataWriterWriteSubmessage();
  }
  v33 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationContextRetrievalDuration];

  if (v33)
  {
    int v34 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationContextRetrievalDuration];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v35 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationToolRetrievalDuration];

  if (v35)
  {
    v36 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationToolRetrievalDuration];
    PBDataWriterWriteSubmessage();
  }
  v37 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalRankingDuration];

  if (v37)
  {
    int v38 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTotalRankingDuration];
    PBDataWriterWriteSubmessage();
  }
  int v39 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleBuildingDuration];

  if (v39)
  {
    uint64_t v40 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleBuildingDuration];
    PBDataWriterWriteSubmessage();
  }
  int v41 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleRankingDuration];

  if (v41)
  {
    v42 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self queryDecorationTupleRankingDuration];
    PBDataWriterWriteSubmessage();
  }
  v43 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self failureInfo];

  int v44 = v46;
  if (v43)
  {
    uint64_t v45 = [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();

    int v44 = v46;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteQueryDecorationTupleRankingDuration
{
}

- (BOOL)hasQueryDecorationTupleRankingDuration
{
  return self->_queryDecorationTupleRankingDuration != 0;
}

- (void)deleteQueryDecorationTupleBuildingDuration
{
}

- (BOOL)hasQueryDecorationTupleBuildingDuration
{
  return self->_queryDecorationTupleBuildingDuration != 0;
}

- (void)deleteQueryDecorationTotalRankingDuration
{
}

- (BOOL)hasQueryDecorationTotalRankingDuration
{
  return self->_queryDecorationTotalRankingDuration != 0;
}

- (void)deleteQueryDecorationToolRetrievalDuration
{
}

- (BOOL)hasQueryDecorationToolRetrievalDuration
{
  return self->_queryDecorationToolRetrievalDuration != 0;
}

- (void)deleteQueryDecorationContextRetrievalDuration
{
}

- (BOOL)hasQueryDecorationContextRetrievalDuration
{
  return self->_queryDecorationContextRetrievalDuration != 0;
}

- (void)deleteQueryDecorationSpanRetrievalDuration
{
}

- (BOOL)hasQueryDecorationSpanRetrievalDuration
{
  return self->_queryDecorationSpanRetrievalDuration != 0;
}

- (void)deleteQueryDecorationTotalCollectInputsDuration
{
}

- (BOOL)hasQueryDecorationTotalCollectInputsDuration
{
  return self->_queryDecorationTotalCollectInputsDuration != 0;
}

- (void)deleteFullPlannerModelInferenceCallTime
{
}

- (BOOL)hasFullPlannerModelInferenceCallTime
{
  return self->_fullPlannerModelInferenceCallTime != 0;
}

- (void)deleteFullPlannerServiceHandleTime
{
}

- (BOOL)hasFullPlannerServiceHandleTime
{
  return self->_fullPlannerServiceHandleTime != 0;
}

- (void)deletePlanOverridesServiceHandleTime
{
}

- (BOOL)hasPlanOverridesServiceHandleTime
{
  return self->_planOverridesServiceHandleTime != 0;
}

- (void)deleteResponseGenerationServiceHandleTime
{
}

- (BOOL)hasResponseGenerationServiceHandleTime
{
  return self->_responseGenerationServiceHandleTime != 0;
}

- (void)deletePlanResolverServiceHandleTime
{
}

- (BOOL)hasPlanResolverServiceHandleTime
{
  return self->_planResolverServiceHandleTime != 0;
}

- (void)deleteStandardPlannerGeneratePlanTime
{
}

- (BOOL)hasStandardPlannerGeneratePlanTime
{
  return self->_standardPlannerGeneratePlanTime != 0;
}

- (void)deleteStandardPlannerPrescribedPlanGeneratorTime
{
}

- (BOOL)hasStandardPlannerPrescribedPlanGeneratorTime
{
  return self->_standardPlannerPrescribedPlanGeneratorTime != 0;
}

- (void)deleteStandardPlannerQueryDecorationTime
{
}

- (BOOL)hasStandardPlannerQueryDecorationTime
{
  return self->_standardPlannerQueryDecorationTime != 0;
}

- (void)deleteStandardPlannerMakePlanTime
{
}

- (BOOL)hasStandardPlannerMakePlanTime
{
  return self->_standardPlannerMakePlanTime != 0;
}

- (void)deleteFullPlannerInferenceInvocationSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasFullPlannerInferenceInvocationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFullPlannerInferenceInvocationSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFullPlannerInferenceInvocationSource:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t fullPlannerInferenceInvocationSource = a3;
}

- (void)deleteModelAssetVersion
{
}

- (BOOL)hasModelAssetVersion
{
  return self->_modelAssetVersion != 0;
}

- (void)deleteWasPlanOverridden
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasWasPlanOverridden:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWasPlanOverridden
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWasPlanOverridden:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int wasPlanOverridden = a3;
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