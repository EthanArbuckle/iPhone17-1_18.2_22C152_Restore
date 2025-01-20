@interface ODDSiriSchemaODDSiriClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasAssetAvailabilityFromBootDigestReported;
- (BOOL)hasAssetSetStatusDigestReported;
- (BOOL)hasAssistantCarPlayDigestReported;
- (BOOL)hasAssistantDeviceDigestReported;
- (BOOL)hasAssistantDiagnosticAndUsageOptInDigestReported;
- (BOOL)hasAssistantExperimentDigestReported;
- (BOOL)hasDeviceCohortsReported;
- (BOOL)hasDeviceSegmentsReported;
- (BOOL)hasDictationDeviceDigestReported;
- (BOOL)hasDictationExperimentDigestsReported;
- (BOOL)hasEventMetadata;
- (BOOL)hasExecutionMetadataReported;
- (BOOL)hasIOSDevicePropertiesReported;
- (BOOL)hasMacOSDevicePropertiesReported;
- (BOOL)hasRequestsWithoutAssetsDigestReported;
- (BOOL)hasSiriAccountInformation;
- (BOOL)hasTvOSDevicePropertiesReported;
- (BOOL)hasVisionOSDevicePropertiesReported;
- (BOOL)hasWatchOSDevicePropertiesReported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported)assetAvailabilityFromBootDigestReported;
- (ODDSiriSchemaODDAssetSetStatusDigestReported)assetSetStatusDigestReported;
- (ODDSiriSchemaODDAssistantCarPlayDigestReported)assistantCarPlayDigestReported;
- (ODDSiriSchemaODDAssistantDeviceDigestsReported)assistantDeviceDigestReported;
- (ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported)assistantDiagnosticAndUsageOptInDigestReported;
- (ODDSiriSchemaODDAssistantExperimentDigestsReported)assistantExperimentDigestReported;
- (ODDSiriSchemaODDClientEventMetadata)eventMetadata;
- (ODDSiriSchemaODDDeviceCohortsReported)deviceCohortsReported;
- (ODDSiriSchemaODDDeviceSegmentsReported)deviceSegmentsReported;
- (ODDSiriSchemaODDDictationDeviceDigestsReported)dictationDeviceDigestReported;
- (ODDSiriSchemaODDDictationExperimentDigestsReported)dictationExperimentDigestsReported;
- (ODDSiriSchemaODDExecutionMetadataReported)executionMetadataReported;
- (ODDSiriSchemaODDRequestsWithoutAssetsDigestReported)requestsWithoutAssetsDigestReported;
- (ODDSiriSchemaODDSiriAccountInformation)siriAccountInformation;
- (ODDSiriSchemaODDSiriClientEvent)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDSiriClientEvent)initWithJSON:(id)a3;
- (ODDSiriSchemaODDiOSDevicePropertiesReported)iOSDevicePropertiesReported;
- (ODDSiriSchemaODDmacOSDevicePropertiesReported)macOSDevicePropertiesReported;
- (ODDSiriSchemaODDtvOSDevicePropertiesReported)tvOSDevicePropertiesReported;
- (ODDSiriSchemaODDvisionOSDevicePropertiesReported)visionOSDevicePropertiesReported;
- (ODDSiriSchemaODDwatchOSDevicePropertiesReported)watchOSDevicePropertiesReported;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAssetAvailabilityFromBootDigestReported;
- (void)deleteAssetSetStatusDigestReported;
- (void)deleteAssistantCarPlayDigestReported;
- (void)deleteAssistantDeviceDigestReported;
- (void)deleteAssistantDiagnosticAndUsageOptInDigestReported;
- (void)deleteAssistantExperimentDigestReported;
- (void)deleteDeviceCohortsReported;
- (void)deleteDeviceSegmentsReported;
- (void)deleteDictationDeviceDigestReported;
- (void)deleteDictationExperimentDigestsReported;
- (void)deleteEventMetadata;
- (void)deleteExecutionMetadataReported;
- (void)deleteIOSDevicePropertiesReported;
- (void)deleteMacOSDevicePropertiesReported;
- (void)deleteRequestsWithoutAssetsDigestReported;
- (void)deleteSiriAccountInformation;
- (void)deleteTvOSDevicePropertiesReported;
- (void)deleteVisionOSDevicePropertiesReported;
- (void)deleteWatchOSDevicePropertiesReported;
- (void)setAssetAvailabilityFromBootDigestReported:(id)a3;
- (void)setAssetSetStatusDigestReported:(id)a3;
- (void)setAssistantCarPlayDigestReported:(id)a3;
- (void)setAssistantDeviceDigestReported:(id)a3;
- (void)setAssistantDiagnosticAndUsageOptInDigestReported:(id)a3;
- (void)setAssistantExperimentDigestReported:(id)a3;
- (void)setDeviceCohortsReported:(id)a3;
- (void)setDeviceSegmentsReported:(id)a3;
- (void)setDictationDeviceDigestReported:(id)a3;
- (void)setDictationExperimentDigestsReported:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setExecutionMetadataReported:(id)a3;
- (void)setHasAssetAvailabilityFromBootDigestReported:(BOOL)a3;
- (void)setHasAssetSetStatusDigestReported:(BOOL)a3;
- (void)setHasAssistantCarPlayDigestReported:(BOOL)a3;
- (void)setHasAssistantDeviceDigestReported:(BOOL)a3;
- (void)setHasAssistantDiagnosticAndUsageOptInDigestReported:(BOOL)a3;
- (void)setHasAssistantExperimentDigestReported:(BOOL)a3;
- (void)setHasDeviceCohortsReported:(BOOL)a3;
- (void)setHasDeviceSegmentsReported:(BOOL)a3;
- (void)setHasDictationDeviceDigestReported:(BOOL)a3;
- (void)setHasDictationExperimentDigestsReported:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasExecutionMetadataReported:(BOOL)a3;
- (void)setHasIOSDevicePropertiesReported:(BOOL)a3;
- (void)setHasMacOSDevicePropertiesReported:(BOOL)a3;
- (void)setHasRequestsWithoutAssetsDigestReported:(BOOL)a3;
- (void)setHasSiriAccountInformation:(BOOL)a3;
- (void)setHasTvOSDevicePropertiesReported:(BOOL)a3;
- (void)setHasVisionOSDevicePropertiesReported:(BOOL)a3;
- (void)setHasWatchOSDevicePropertiesReported:(BOOL)a3;
- (void)setIOSDevicePropertiesReported:(id)a3;
- (void)setMacOSDevicePropertiesReported:(id)a3;
- (void)setRequestsWithoutAssetsDigestReported:(id)a3;
- (void)setSiriAccountInformation:(id)a3;
- (void)setTvOSDevicePropertiesReported:(id)a3;
- (void)setVisionOSDevicePropertiesReported:(id)a3;
- (void)setWatchOSDevicePropertiesReported:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDSiriClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)ODDSiriSchemaODDSiriClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v64 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDSiriClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteEventMetadata];
  }
  v9 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceSegmentsReported];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteDeviceSegmentsReported];
  }
  v12 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceCohortsReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteDeviceCohortsReported];
  }
  v15 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDeviceDigestReported];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteAssistantDeviceDigestReported];
  }
  v18 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationDeviceDigestReported];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteDictationDeviceDigestReported];
  }
  v21 = [(ODDSiriSchemaODDSiriClientEvent *)self siriAccountInformation];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteSiriAccountInformation];
  }
  v24 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantExperimentDigestReported];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteAssistantExperimentDigestReported];
  }
  v27 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDiagnosticAndUsageOptInDigestReported];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteAssistantDiagnosticAndUsageOptInDigestReported];
  }
  v30 = [(ODDSiriSchemaODDSiriClientEvent *)self iOSDevicePropertiesReported];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteIOSDevicePropertiesReported];
  }
  v33 = [(ODDSiriSchemaODDSiriClientEvent *)self watchOSDevicePropertiesReported];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteWatchOSDevicePropertiesReported];
  }
  v36 = [(ODDSiriSchemaODDSiriClientEvent *)self tvOSDevicePropertiesReported];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteTvOSDevicePropertiesReported];
  }
  v39 = [(ODDSiriSchemaODDSiriClientEvent *)self macOSDevicePropertiesReported];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteMacOSDevicePropertiesReported];
  }
  v42 = [(ODDSiriSchemaODDSiriClientEvent *)self visionOSDevicePropertiesReported];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteVisionOSDevicePropertiesReported];
  }
  v45 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantCarPlayDigestReported];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteAssistantCarPlayDigestReported];
  }
  v48 = [(ODDSiriSchemaODDSiriClientEvent *)self requestsWithoutAssetsDigestReported];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteRequestsWithoutAssetsDigestReported];
  }
  v51 = [(ODDSiriSchemaODDSiriClientEvent *)self assetAvailabilityFromBootDigestReported];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteAssetAvailabilityFromBootDigestReported];
  }
  v54 = [(ODDSiriSchemaODDSiriClientEvent *)self assetSetStatusDigestReported];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteAssetSetStatusDigestReported];
  }
  v57 = [(ODDSiriSchemaODDSiriClientEvent *)self executionMetadataReported];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteExecutionMetadataReported];
  }
  v60 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationExperimentDigestsReported];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(ODDSiriSchemaODDSiriClientEvent *)self deleteDictationExperimentDigestsReported];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(ODDSiriSchemaODDSiriClientEvent *)self whichEvent_Type] - 10;
  if (v3 <= 0x12 && ((0x5FFFFu >> v3) & 1) != 0) {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB398[v3]);
  }
  else {
    id v4 = 0;
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 10 > 0x12) {
    return 0;
  }
  else {
    return off_1E5EAB430[a3 - 10];
  }
}

- (int)clockIsolationLevel
{
  unint64_t v2 = [(ODDSiriSchemaODDSiriClientEvent *)self whichEvent_Type];
  if (v2 - 10 > 0x12) {
    return 1;
  }
  else {
    return dword_1AE47AE0C[v2 - 10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationExperimentDigestsReported, 0);
  objc_storeStrong((id *)&self->_executionMetadataReported, 0);
  objc_storeStrong((id *)&self->_assetSetStatusDigestReported, 0);
  objc_storeStrong((id *)&self->_assetAvailabilityFromBootDigestReported, 0);
  objc_storeStrong((id *)&self->_requestsWithoutAssetsDigestReported, 0);
  objc_storeStrong((id *)&self->_assistantCarPlayDigestReported, 0);
  objc_storeStrong((id *)&self->_visionOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_macOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_tvOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_watchOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_iOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_assistantDiagnosticAndUsageOptInDigestReported, 0);
  objc_storeStrong((id *)&self->_assistantExperimentDigestReported, 0);
  objc_storeStrong((id *)&self->_siriAccountInformation, 0);
  objc_storeStrong((id *)&self->_dictationDeviceDigestReported, 0);
  objc_storeStrong((id *)&self->_assistantDeviceDigestReported, 0);
  objc_storeStrong((id *)&self->_deviceCohortsReported, 0);
  objc_storeStrong((id *)&self->_deviceSegmentsReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasDictationExperimentDigestsReported:(BOOL)a3
{
  self->_hasDictationExperimentDigestsReported = a3;
}

- (BOOL)hasDictationExperimentDigestsReported
{
  return self->_hasDictationExperimentDigestsReported;
}

- (void)setHasExecutionMetadataReported:(BOOL)a3
{
  self->_hasExecutionMetadataReported = a3;
}

- (BOOL)hasExecutionMetadataReported
{
  return self->_hasExecutionMetadataReported;
}

- (void)setHasAssetSetStatusDigestReported:(BOOL)a3
{
  self->_hasAssetSetStatusDigestReported = a3;
}

- (BOOL)hasAssetSetStatusDigestReported
{
  return self->_hasAssetSetStatusDigestReported;
}

- (void)setHasAssetAvailabilityFromBootDigestReported:(BOOL)a3
{
  self->_hasAssetAvailabilityFromBootDigestReported = a3;
}

- (BOOL)hasAssetAvailabilityFromBootDigestReported
{
  return self->_hasAssetAvailabilityFromBootDigestReported;
}

- (void)setHasRequestsWithoutAssetsDigestReported:(BOOL)a3
{
  self->_hasRequestsWithoutAssetsDigestReported = a3;
}

- (BOOL)hasRequestsWithoutAssetsDigestReported
{
  return self->_hasRequestsWithoutAssetsDigestReported;
}

- (void)setHasAssistantCarPlayDigestReported:(BOOL)a3
{
  self->_hasAssistantCarPlayDigestReported = a3;
}

- (BOOL)hasAssistantCarPlayDigestReported
{
  return self->_hasAssistantCarPlayDigestReported;
}

- (void)setHasVisionOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasVisionOSDevicePropertiesReported = a3;
}

- (BOOL)hasVisionOSDevicePropertiesReported
{
  return self->_hasVisionOSDevicePropertiesReported;
}

- (void)setHasMacOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasMacOSDevicePropertiesReported = a3;
}

- (BOOL)hasMacOSDevicePropertiesReported
{
  return self->_hasMacOSDevicePropertiesReported;
}

- (void)setHasTvOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasTvOSDevicePropertiesReported = a3;
}

- (BOOL)hasTvOSDevicePropertiesReported
{
  return self->_hasTvOSDevicePropertiesReported;
}

- (void)setHasWatchOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasWatchOSDevicePropertiesReported = a3;
}

- (BOOL)hasWatchOSDevicePropertiesReported
{
  return self->_hasWatchOSDevicePropertiesReported;
}

- (void)setHasIOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasIOSDevicePropertiesReported = a3;
}

- (BOOL)hasIOSDevicePropertiesReported
{
  return self->_hasIOSDevicePropertiesReported;
}

- (void)setHasAssistantDiagnosticAndUsageOptInDigestReported:(BOOL)a3
{
  self->_hasAssistantDiagnosticAndUsageOptInDigestReported = a3;
}

- (BOOL)hasAssistantDiagnosticAndUsageOptInDigestReported
{
  return self->_hasAssistantDiagnosticAndUsageOptInDigestReported;
}

- (void)setHasAssistantExperimentDigestReported:(BOOL)a3
{
  self->_hasAssistantExperimentDigestReported = a3;
}

- (BOOL)hasAssistantExperimentDigestReported
{
  return self->_hasAssistantExperimentDigestReported;
}

- (void)setHasSiriAccountInformation:(BOOL)a3
{
  self->_hasSiriAccountInformation = a3;
}

- (BOOL)hasSiriAccountInformation
{
  return self->_hasSiriAccountInformation;
}

- (void)setHasDictationDeviceDigestReported:(BOOL)a3
{
  self->_hasDictationDeviceDigestReported = a3;
}

- (BOOL)hasDictationDeviceDigestReported
{
  return self->_hasDictationDeviceDigestReported;
}

- (void)setHasAssistantDeviceDigestReported:(BOOL)a3
{
  self->_hasAssistantDeviceDigestReported = a3;
}

- (BOOL)hasAssistantDeviceDigestReported
{
  return self->_hasAssistantDeviceDigestReported;
}

- (void)setHasDeviceCohortsReported:(BOOL)a3
{
  self->_hasDeviceCohortsReported = a3;
}

- (BOOL)hasDeviceCohortsReported
{
  return self->_hasDeviceCohortsReported;
}

- (void)setHasDeviceSegmentsReported:(BOOL)a3
{
  self->_hasDeviceSegmentsReported = a3;
}

- (BOOL)hasDeviceSegmentsReported
{
  return self->_hasDeviceSegmentsReported;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (ODDSiriSchemaODDClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ODDSiriSchemaODDSiriClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)ODDSiriSchemaODDSiriClientEvent;
  v5 = [(ODDSiriSchemaODDSiriClientEvent *)&v58 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDClientEventMetadata alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"deviceSegmentsReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDDeviceSegmentsReported alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setDeviceSegmentsReported:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"deviceCohortsReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODDSiriSchemaODDDeviceCohortsReported alloc] initWithDictionary:v10];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setDeviceCohortsReported:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"assistantDeviceDigestReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ODDSiriSchemaODDAssistantDeviceDigestsReported alloc] initWithDictionary:v12];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setAssistantDeviceDigestReported:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"dictationDeviceDigestReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ODDSiriSchemaODDDictationDeviceDigestsReported alloc] initWithDictionary:v14];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setDictationDeviceDigestReported:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"siriAccountInformation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[ODDSiriSchemaODDSiriAccountInformation alloc] initWithDictionary:v16];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setSiriAccountInformation:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"assistantExperimentDigestReported"];
    objc_opt_class();
    v57 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[ODDSiriSchemaODDAssistantExperimentDigestsReported alloc] initWithDictionary:v18];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setAssistantExperimentDigestReported:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"assistantDiagnosticAndUsageOptInDigestReported"];
    objc_opt_class();
    int v56 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported alloc] initWithDictionary:v20];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setAssistantDiagnosticAndUsageOptInDigestReported:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"iOSDevicePropertiesReported"];
    objc_opt_class();
    v55 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[ODDSiriSchemaODDiOSDevicePropertiesReported alloc] initWithDictionary:v22];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setIOSDevicePropertiesReported:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"watchOSDevicePropertiesReported"];
    objc_opt_class();
    v54 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[ODDSiriSchemaODDwatchOSDevicePropertiesReported alloc] initWithDictionary:v24];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setWatchOSDevicePropertiesReported:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"tvOSDevicePropertiesReported"];
    objc_opt_class();
    int v53 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[ODDSiriSchemaODDtvOSDevicePropertiesReported alloc] initWithDictionary:v26];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setTvOSDevicePropertiesReported:v27];
    }
    int v50 = (void *)v10;
    uint64_t v28 = [v4 objectForKeyedSubscript:@"macOSDevicePropertiesReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[ODDSiriSchemaODDmacOSDevicePropertiesReported alloc] initWithDictionary:v28];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setMacOSDevicePropertiesReported:v29];
    }
    v49 = (void *)v12;
    v30 = objc_msgSend(v4, "objectForKeyedSubscript:", @"visionOSDevicePropertiesReported", v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[ODDSiriSchemaODDvisionOSDevicePropertiesReported alloc] initWithDictionary:v30];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setVisionOSDevicePropertiesReported:v31];
    }
    v48 = (void *)v14;
    int v32 = [v4 objectForKeyedSubscript:@"assistantCarPlayDigestReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[ODDSiriSchemaODDAssistantCarPlayDigestReported alloc] initWithDictionary:v32];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setAssistantCarPlayDigestReported:v33];
    }
    int v47 = (void *)v16;
    v34 = [v4 objectForKeyedSubscript:@"requestsWithoutAssetsDigestReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[ODDSiriSchemaODDRequestsWithoutAssetsDigestReported alloc] initWithDictionary:v34];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setRequestsWithoutAssetsDigestReported:v35];
    }
    v52 = (void *)v6;
    v36 = [v4 objectForKeyedSubscript:@"assetAvailabilityFromBootDigestReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported alloc] initWithDictionary:v36];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setAssetAvailabilityFromBootDigestReported:v37];
    }
    v51 = (void *)v8;
    int v38 = [v4 objectForKeyedSubscript:@"assetSetStatusDigestReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[ODDSiriSchemaODDAssetSetStatusDigestReported alloc] initWithDictionary:v38];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setAssetSetStatusDigestReported:v39];
    }
    v40 = [v4 objectForKeyedSubscript:@"executionMetadataReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[ODDSiriSchemaODDExecutionMetadataReported alloc] initWithDictionary:v40];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setExecutionMetadataReported:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"dictationExperimentDigestsReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[ODDSiriSchemaODDDictationExperimentDigestsReported alloc] initWithDictionary:v42];
      [(ODDSiriSchemaODDSiriClientEvent *)v5 setDictationExperimentDigestsReported:v43];
    }
    int v44 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDSiriClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDSiriClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  unint64_t v2 = [(ODDSiriSchemaODDSiriClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_assetAvailabilityFromBootDigestReported)
  {
    id v4 = [(ODDSiriSchemaODDSiriClientEvent *)self assetAvailabilityFromBootDigestReported];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assetAvailabilityFromBootDigestReported"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assetAvailabilityFromBootDigestReported"];
    }
  }
  if (self->_assetSetStatusDigestReported)
  {
    uint64_t v7 = [(ODDSiriSchemaODDSiriClientEvent *)self assetSetStatusDigestReported];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"assetSetStatusDigestReported"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"assetSetStatusDigestReported"];
    }
  }
  if (self->_assistantCarPlayDigestReported)
  {
    uint64_t v10 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantCarPlayDigestReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"assistantCarPlayDigestReported"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"assistantCarPlayDigestReported"];
    }
  }
  if (self->_assistantDeviceDigestReported)
  {
    v13 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDeviceDigestReported];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"assistantDeviceDigestReported"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"assistantDeviceDigestReported"];
    }
  }
  if (self->_assistantDiagnosticAndUsageOptInDigestReported)
  {
    uint64_t v16 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDiagnosticAndUsageOptInDigestReported];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"assistantDiagnosticAndUsageOptInDigestReported"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"assistantDiagnosticAndUsageOptInDigestReported"];
    }
  }
  if (self->_assistantExperimentDigestReported)
  {
    v19 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantExperimentDigestReported];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"assistantExperimentDigestReported"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"assistantExperimentDigestReported"];
    }
  }
  if (self->_deviceCohortsReported)
  {
    uint64_t v22 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceCohortsReported];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"deviceCohortsReported"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"deviceCohortsReported"];
    }
  }
  if (self->_deviceSegmentsReported)
  {
    v25 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceSegmentsReported];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"deviceSegmentsReported"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"deviceSegmentsReported"];
    }
  }
  if (self->_dictationDeviceDigestReported)
  {
    uint64_t v28 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationDeviceDigestReported];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"dictationDeviceDigestReported"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"dictationDeviceDigestReported"];
    }
  }
  if (self->_dictationExperimentDigestsReported)
  {
    v31 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationExperimentDigestsReported];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"dictationExperimentDigestsReported"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"dictationExperimentDigestsReported"];
    }
  }
  if (self->_eventMetadata)
  {
    v34 = [(ODDSiriSchemaODDSiriClientEvent *)self eventMetadata];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_executionMetadataReported)
  {
    v37 = [(ODDSiriSchemaODDSiriClientEvent *)self executionMetadataReported];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"executionMetadataReported"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"executionMetadataReported"];
    }
  }
  if (self->_iOSDevicePropertiesReported)
  {
    v40 = [(ODDSiriSchemaODDSiriClientEvent *)self iOSDevicePropertiesReported];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"iOSDevicePropertiesReported"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"iOSDevicePropertiesReported"];
    }
  }
  if (self->_macOSDevicePropertiesReported)
  {
    v43 = [(ODDSiriSchemaODDSiriClientEvent *)self macOSDevicePropertiesReported];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"macOSDevicePropertiesReported"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"macOSDevicePropertiesReported"];
    }
  }
  if (self->_requestsWithoutAssetsDigestReported)
  {
    v46 = [(ODDSiriSchemaODDSiriClientEvent *)self requestsWithoutAssetsDigestReported];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"requestsWithoutAssetsDigestReported"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"requestsWithoutAssetsDigestReported"];
    }
  }
  if (self->_siriAccountInformation)
  {
    v49 = [(ODDSiriSchemaODDSiriClientEvent *)self siriAccountInformation];
    int v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"siriAccountInformation"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"siriAccountInformation"];
    }
  }
  if (self->_tvOSDevicePropertiesReported)
  {
    v52 = [(ODDSiriSchemaODDSiriClientEvent *)self tvOSDevicePropertiesReported];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"tvOSDevicePropertiesReported"];
    }
    else
    {
      v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"tvOSDevicePropertiesReported"];
    }
  }
  if (self->_visionOSDevicePropertiesReported)
  {
    v55 = [(ODDSiriSchemaODDSiriClientEvent *)self visionOSDevicePropertiesReported];
    int v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"visionOSDevicePropertiesReported"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"visionOSDevicePropertiesReported"];
    }
  }
  if (self->_watchOSDevicePropertiesReported)
  {
    objc_super v58 = [(ODDSiriSchemaODDSiriClientEvent *)self watchOSDevicePropertiesReported];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"watchOSDevicePropertiesReported"];
    }
    else
    {
      v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"watchOSDevicePropertiesReported"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(ODDSiriSchemaODDDeviceSegmentsReported *)self->_deviceSegmentsReported hash] ^ v3;
  unint64_t v5 = [(ODDSiriSchemaODDDeviceCohortsReported *)self->_deviceCohortsReported hash];
  unint64_t v6 = v4 ^ v5 ^ [(ODDSiriSchemaODDAssistantDeviceDigestsReported *)self->_assistantDeviceDigestReported hash];
  unint64_t v7 = [(ODDSiriSchemaODDDictationDeviceDigestsReported *)self->_dictationDeviceDigestReported hash];
  unint64_t v8 = v7 ^ [(ODDSiriSchemaODDSiriAccountInformation *)self->_siriAccountInformation hash];
  unint64_t v9 = v6 ^ v8 ^ [(ODDSiriSchemaODDAssistantExperimentDigestsReported *)self->_assistantExperimentDigestReported hash];
  unint64_t v10 = [(ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *)self->_assistantDiagnosticAndUsageOptInDigestReported hash];
  unint64_t v11 = v10 ^ [(ODDSiriSchemaODDiOSDevicePropertiesReported *)self->_iOSDevicePropertiesReported hash];
  unint64_t v12 = v11 ^ [(ODDSiriSchemaODDwatchOSDevicePropertiesReported *)self->_watchOSDevicePropertiesReported hash];
  unint64_t v13 = v9 ^ v12 ^ [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self->_tvOSDevicePropertiesReported hash];
  unint64_t v14 = [(ODDSiriSchemaODDmacOSDevicePropertiesReported *)self->_macOSDevicePropertiesReported hash];
  unint64_t v15 = v14 ^ [(ODDSiriSchemaODDvisionOSDevicePropertiesReported *)self->_visionOSDevicePropertiesReported hash];
  unint64_t v16 = v15 ^ [(ODDSiriSchemaODDAssistantCarPlayDigestReported *)self->_assistantCarPlayDigestReported hash];
  unint64_t v17 = v16 ^ [(ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *)self->_requestsWithoutAssetsDigestReported hash];
  unint64_t v18 = v13 ^ v17 ^ [(ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *)self->_assetAvailabilityFromBootDigestReported hash];
  unint64_t v19 = [(ODDSiriSchemaODDAssetSetStatusDigestReported *)self->_assetSetStatusDigestReported hash];
  unint64_t v20 = v19 ^ [(ODDSiriSchemaODDExecutionMetadataReported *)self->_executionMetadataReported hash];
  return v18 ^ v20 ^ [(ODDSiriSchemaODDDictationExperimentDigestsReported *)self->_dictationExperimentDigestsReported hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_98;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_98;
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v8 = [(ODDSiriSchemaODDSiriClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(ODDSiriSchemaODDSiriClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceSegmentsReported];
  unint64_t v7 = [v4 deviceSegmentsReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v13 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceSegmentsReported];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceSegmentsReported];
    unint64_t v16 = [v4 deviceSegmentsReported];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceCohortsReported];
  unint64_t v7 = [v4 deviceCohortsReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v18 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceCohortsReported];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceCohortsReported];
    v21 = [v4 deviceCohortsReported];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDeviceDigestReported];
  unint64_t v7 = [v4 assistantDeviceDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v23 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDeviceDigestReported];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    v25 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDeviceDigestReported];
    uint64_t v26 = [v4 assistantDeviceDigestReported];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationDeviceDigestReported];
  unint64_t v7 = [v4 dictationDeviceDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v28 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationDeviceDigestReported];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationDeviceDigestReported];
    v31 = [v4 dictationDeviceDigestReported];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self siriAccountInformation];
  unint64_t v7 = [v4 siriAccountInformation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v33 = [(ODDSiriSchemaODDSiriClientEvent *)self siriAccountInformation];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(ODDSiriSchemaODDSiriClientEvent *)self siriAccountInformation];
    v36 = [v4 siriAccountInformation];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantExperimentDigestReported];
  unint64_t v7 = [v4 assistantExperimentDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v38 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantExperimentDigestReported];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantExperimentDigestReported];
    int v41 = [v4 assistantExperimentDigestReported];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDiagnosticAndUsageOptInDigestReported];
  unint64_t v7 = [v4 assistantDiagnosticAndUsageOptInDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v43 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDiagnosticAndUsageOptInDigestReported];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDiagnosticAndUsageOptInDigestReported];
    v46 = [v4 assistantDiagnosticAndUsageOptInDigestReported];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self iOSDevicePropertiesReported];
  unint64_t v7 = [v4 iOSDevicePropertiesReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v48 = [(ODDSiriSchemaODDSiriClientEvent *)self iOSDevicePropertiesReported];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(ODDSiriSchemaODDSiriClientEvent *)self iOSDevicePropertiesReported];
    v51 = [v4 iOSDevicePropertiesReported];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self watchOSDevicePropertiesReported];
  unint64_t v7 = [v4 watchOSDevicePropertiesReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v53 = [(ODDSiriSchemaODDSiriClientEvent *)self watchOSDevicePropertiesReported];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(ODDSiriSchemaODDSiriClientEvent *)self watchOSDevicePropertiesReported];
    int v56 = [v4 watchOSDevicePropertiesReported];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self tvOSDevicePropertiesReported];
  unint64_t v7 = [v4 tvOSDevicePropertiesReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v58 = [(ODDSiriSchemaODDSiriClientEvent *)self tvOSDevicePropertiesReported];
  if (v58)
  {
    int v59 = (void *)v58;
    v60 = [(ODDSiriSchemaODDSiriClientEvent *)self tvOSDevicePropertiesReported];
    v61 = [v4 tvOSDevicePropertiesReported];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self macOSDevicePropertiesReported];
  unint64_t v7 = [v4 macOSDevicePropertiesReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v63 = [(ODDSiriSchemaODDSiriClientEvent *)self macOSDevicePropertiesReported];
  if (v63)
  {
    objc_super v64 = (void *)v63;
    v65 = [(ODDSiriSchemaODDSiriClientEvent *)self macOSDevicePropertiesReported];
    v66 = [v4 macOSDevicePropertiesReported];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self visionOSDevicePropertiesReported];
  unint64_t v7 = [v4 visionOSDevicePropertiesReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v68 = [(ODDSiriSchemaODDSiriClientEvent *)self visionOSDevicePropertiesReported];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(ODDSiriSchemaODDSiriClientEvent *)self visionOSDevicePropertiesReported];
    v71 = [v4 visionOSDevicePropertiesReported];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantCarPlayDigestReported];
  unint64_t v7 = [v4 assistantCarPlayDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v73 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantCarPlayDigestReported];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantCarPlayDigestReported];
    v76 = [v4 assistantCarPlayDigestReported];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self requestsWithoutAssetsDigestReported];
  unint64_t v7 = [v4 requestsWithoutAssetsDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v78 = [(ODDSiriSchemaODDSiriClientEvent *)self requestsWithoutAssetsDigestReported];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(ODDSiriSchemaODDSiriClientEvent *)self requestsWithoutAssetsDigestReported];
    v81 = [v4 requestsWithoutAssetsDigestReported];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self assetAvailabilityFromBootDigestReported];
  unint64_t v7 = [v4 assetAvailabilityFromBootDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v83 = [(ODDSiriSchemaODDSiriClientEvent *)self assetAvailabilityFromBootDigestReported];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(ODDSiriSchemaODDSiriClientEvent *)self assetAvailabilityFromBootDigestReported];
    v86 = [v4 assetAvailabilityFromBootDigestReported];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self assetSetStatusDigestReported];
  unint64_t v7 = [v4 assetSetStatusDigestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v88 = [(ODDSiriSchemaODDSiriClientEvent *)self assetSetStatusDigestReported];
  if (v88)
  {
    v89 = (void *)v88;
    v90 = [(ODDSiriSchemaODDSiriClientEvent *)self assetSetStatusDigestReported];
    v91 = [v4 assetSetStatusDigestReported];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self executionMetadataReported];
  unint64_t v7 = [v4 executionMetadataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_97;
  }
  uint64_t v93 = [(ODDSiriSchemaODDSiriClientEvent *)self executionMetadataReported];
  if (v93)
  {
    v94 = (void *)v93;
    v95 = [(ODDSiriSchemaODDSiriClientEvent *)self executionMetadataReported];
    v96 = [v4 executionMetadataReported];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_98;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationExperimentDigestsReported];
  unint64_t v7 = [v4 dictationExperimentDigestsReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v98 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationExperimentDigestsReported];
    if (!v98)
    {

LABEL_101:
      BOOL v103 = 1;
      goto LABEL_99;
    }
    v99 = (void *)v98;
    v100 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationExperimentDigestsReported];
    v101 = [v4 dictationExperimentDigestsReported];
    char v102 = [v100 isEqual:v101];

    if (v102) {
      goto LABEL_101;
    }
  }
  else
  {
LABEL_97:
  }
LABEL_98:
  BOOL v103 = 0;
LABEL_99:

  return v103;
}

- (void)writeTo:(id)a3
{
  id v42 = a3;
  id v4 = [(ODDSiriSchemaODDSiriClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(ODDSiriSchemaODDSiriClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceSegmentsReported];

  if (v6)
  {
    unint64_t v7 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceSegmentsReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceCohortsReported];

  if (v8)
  {
    unint64_t v9 = [(ODDSiriSchemaODDSiriClientEvent *)self deviceCohortsReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDeviceDigestReported];

  if (v10)
  {
    unint64_t v11 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDeviceDigestReported];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationDeviceDigestReported];

  if (v12)
  {
    uint64_t v13 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationDeviceDigestReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(ODDSiriSchemaODDSiriClientEvent *)self siriAccountInformation];

  if (v14)
  {
    unint64_t v15 = [(ODDSiriSchemaODDSiriClientEvent *)self siriAccountInformation];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantExperimentDigestReported];

  if (v16)
  {
    int v17 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantExperimentDigestReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDiagnosticAndUsageOptInDigestReported];

  if (v18)
  {
    unint64_t v19 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantDiagnosticAndUsageOptInDigestReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(ODDSiriSchemaODDSiriClientEvent *)self iOSDevicePropertiesReported];

  if (v20)
  {
    v21 = [(ODDSiriSchemaODDSiriClientEvent *)self iOSDevicePropertiesReported];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(ODDSiriSchemaODDSiriClientEvent *)self watchOSDevicePropertiesReported];

  if (v22)
  {
    uint64_t v23 = [(ODDSiriSchemaODDSiriClientEvent *)self watchOSDevicePropertiesReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v24 = [(ODDSiriSchemaODDSiriClientEvent *)self tvOSDevicePropertiesReported];

  if (v24)
  {
    v25 = [(ODDSiriSchemaODDSiriClientEvent *)self tvOSDevicePropertiesReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v26 = [(ODDSiriSchemaODDSiriClientEvent *)self macOSDevicePropertiesReported];

  if (v26)
  {
    int v27 = [(ODDSiriSchemaODDSiriClientEvent *)self macOSDevicePropertiesReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(ODDSiriSchemaODDSiriClientEvent *)self visionOSDevicePropertiesReported];

  if (v28)
  {
    int v29 = [(ODDSiriSchemaODDSiriClientEvent *)self visionOSDevicePropertiesReported];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantCarPlayDigestReported];

  if (v30)
  {
    v31 = [(ODDSiriSchemaODDSiriClientEvent *)self assistantCarPlayDigestReported];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(ODDSiriSchemaODDSiriClientEvent *)self requestsWithoutAssetsDigestReported];

  if (v32)
  {
    uint64_t v33 = [(ODDSiriSchemaODDSiriClientEvent *)self requestsWithoutAssetsDigestReported];
    PBDataWriterWriteSubmessage();
  }
  v34 = [(ODDSiriSchemaODDSiriClientEvent *)self assetAvailabilityFromBootDigestReported];

  if (v34)
  {
    int v35 = [(ODDSiriSchemaODDSiriClientEvent *)self assetAvailabilityFromBootDigestReported];
    PBDataWriterWriteSubmessage();
  }
  v36 = [(ODDSiriSchemaODDSiriClientEvent *)self assetSetStatusDigestReported];

  if (v36)
  {
    int v37 = [(ODDSiriSchemaODDSiriClientEvent *)self assetSetStatusDigestReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(ODDSiriSchemaODDSiriClientEvent *)self executionMetadataReported];

  if (v38)
  {
    v39 = [(ODDSiriSchemaODDSiriClientEvent *)self executionMetadataReported];
    PBDataWriterWriteSubmessage();
  }
  v40 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationExperimentDigestsReported];

  if (v40)
  {
    int v41 = [(ODDSiriSchemaODDSiriClientEvent *)self dictationExperimentDigestsReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDSiriClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteDictationExperimentDigestsReported
{
  if (self->_whichEvent_Type == 28)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationExperimentDigestsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDDictationExperimentDigestsReported)dictationExperimentDigestsReported
{
  if (self->_whichEvent_Type == 28) {
    unint64_t v2 = self->_dictationExperimentDigestsReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setDictationExperimentDigestsReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDDictationExperimentDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  unint64_t v22 = 28;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = v4;
}

- (void)deleteExecutionMetadataReported
{
  if (self->_whichEvent_Type == 26)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_executionMetadataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDExecutionMetadataReported)executionMetadataReported
{
  if (self->_whichEvent_Type == 26) {
    unint64_t v2 = self->_executionMetadataReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setExecutionMetadataReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDExecutionMetadataReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 26;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = v4;
}

- (void)deleteAssetSetStatusDigestReported
{
  if (self->_whichEvent_Type == 25)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assetSetStatusDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDAssetSetStatusDigestReported)assetSetStatusDigestReported
{
  if (self->_whichEvent_Type == 25) {
    unint64_t v2 = self->_assetSetStatusDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAssetSetStatusDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDAssetSetStatusDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 25;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = v4;
}

- (void)deleteAssetAvailabilityFromBootDigestReported
{
  if (self->_whichEvent_Type == 24)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assetAvailabilityFromBootDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported)assetAvailabilityFromBootDigestReported
{
  if (self->_whichEvent_Type == 24) {
    unint64_t v2 = self->_assetAvailabilityFromBootDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAssetAvailabilityFromBootDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 24;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = v4;
}

- (void)deleteRequestsWithoutAssetsDigestReported
{
  if (self->_whichEvent_Type == 23)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestsWithoutAssetsDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDRequestsWithoutAssetsDigestReported)requestsWithoutAssetsDigestReported
{
  if (self->_whichEvent_Type == 23) {
    unint64_t v2 = self->_requestsWithoutAssetsDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setRequestsWithoutAssetsDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 23;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = v4;
}

- (void)deleteAssistantCarPlayDigestReported
{
  if (self->_whichEvent_Type == 22)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantCarPlayDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDAssistantCarPlayDigestReported)assistantCarPlayDigestReported
{
  if (self->_whichEvent_Type == 22) {
    unint64_t v2 = self->_assistantCarPlayDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAssistantCarPlayDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDAssistantCarPlayDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 22;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = v4;
}

- (void)deleteVisionOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 21)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_visionOSDevicePropertiesReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDvisionOSDevicePropertiesReported)visionOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 21) {
    unint64_t v2 = self->_visionOSDevicePropertiesReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setVisionOSDevicePropertiesReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDvisionOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 21;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = v4;
}

- (void)deleteMacOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 20)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_macOSDevicePropertiesReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDmacOSDevicePropertiesReported)macOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 20) {
    unint64_t v2 = self->_macOSDevicePropertiesReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setMacOSDevicePropertiesReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDmacOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 20;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = v4;
}

- (void)deleteTvOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 19)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_tvOSDevicePropertiesReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDtvOSDevicePropertiesReported)tvOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 19) {
    unint64_t v2 = self->_tvOSDevicePropertiesReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setTvOSDevicePropertiesReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDtvOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 19;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = v4;
}

- (void)deleteWatchOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 18)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_watchOSDevicePropertiesReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDwatchOSDevicePropertiesReported)watchOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 18) {
    unint64_t v2 = self->_watchOSDevicePropertiesReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setWatchOSDevicePropertiesReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDwatchOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 18;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = v4;
}

- (void)deleteIOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 17)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_iOSDevicePropertiesReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDiOSDevicePropertiesReported)iOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 17) {
    unint64_t v2 = self->_iOSDevicePropertiesReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setIOSDevicePropertiesReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDiOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 17;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = v4;
}

- (void)deleteAssistantDiagnosticAndUsageOptInDigestReported
{
  if (self->_whichEvent_Type == 16)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDiagnosticAndUsageOptInDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported)assistantDiagnosticAndUsageOptInDigestReported
{
  if (self->_whichEvent_Type == 16) {
    unint64_t v2 = self->_assistantDiagnosticAndUsageOptInDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAssistantDiagnosticAndUsageOptInDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  self->_unint64_t whichEvent_Type = 16 * (v4 != 0);
  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = v4;
}

- (void)deleteAssistantExperimentDigestReported
{
  if (self->_whichEvent_Type == 15)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantExperimentDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDAssistantExperimentDigestsReported)assistantExperimentDigestReported
{
  if (self->_whichEvent_Type == 15) {
    unint64_t v2 = self->_assistantExperimentDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAssistantExperimentDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDAssistantExperimentDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 15;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = v4;
}

- (void)deleteSiriAccountInformation
{
  if (self->_whichEvent_Type == 14)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_siriAccountInformation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDSiriAccountInformation)siriAccountInformation
{
  if (self->_whichEvent_Type == 14) {
    unint64_t v2 = self->_siriAccountInformation;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSiriAccountInformation:(id)a3
{
  id v4 = (ODDSiriSchemaODDSiriAccountInformation *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 14;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = v4;
}

- (void)deleteDictationDeviceDigestReported
{
  if (self->_whichEvent_Type == 13)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationDeviceDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDDictationDeviceDigestsReported)dictationDeviceDigestReported
{
  if (self->_whichEvent_Type == 13) {
    unint64_t v2 = self->_dictationDeviceDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setDictationDeviceDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDDictationDeviceDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 13;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = v4;
}

- (void)deleteAssistantDeviceDigestReported
{
  if (self->_whichEvent_Type == 12)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDeviceDigestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDAssistantDeviceDigestsReported)assistantDeviceDigestReported
{
  if (self->_whichEvent_Type == 12) {
    unint64_t v2 = self->_assistantDeviceDigestReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAssistantDeviceDigestReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDAssistantDeviceDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 12;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = v4;
}

- (void)deleteDeviceCohortsReported
{
  if (self->_whichEvent_Type == 11)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_deviceCohortsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDDeviceCohortsReported)deviceCohortsReported
{
  if (self->_whichEvent_Type == 11) {
    unint64_t v2 = self->_deviceCohortsReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setDeviceCohortsReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDDeviceCohortsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 11;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = v4;
}

- (void)deleteDeviceSegmentsReported
{
  if (self->_whichEvent_Type == 10)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_deviceSegmentsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODDSiriSchemaODDDeviceSegmentsReported)deviceSegmentsReported
{
  if (self->_whichEvent_Type == 10) {
    unint64_t v2 = self->_deviceSegmentsReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setDeviceSegmentsReported:(id)a3
{
  id v4 = (ODDSiriSchemaODDDeviceSegmentsReported *)a3;
  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  dictationExperimentDigestsReported = self->_dictationExperimentDigestsReported;
  self->_dictationExperimentDigestsReported = 0;

  unint64_t v22 = 10;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichEvent_Type = v22;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(ODDSiriSchemaODDSiriClientEvent *)self whichEvent_Type];
  if (v2 - 10 > 0x12) {
    return @"com.apple.aiml.siri.odd.ODDSiriClientEvent";
  }
  else {
    return off_1E5EBD3D0[v2 - 10];
  }
}

- (int)getAnyEventType
{
  return 81;
}

@end