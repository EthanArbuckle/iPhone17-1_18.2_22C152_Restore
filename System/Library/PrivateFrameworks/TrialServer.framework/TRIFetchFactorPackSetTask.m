@interface TRIFetchFactorPackSetTask
+ (BOOL)supportsSecureCoding;
+ (id)_namespaceNamesFromExperimentRecord:(id)a3;
+ (id)parseFromData:(id)a3;
+ (id)taskWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 bmltDeployment:(id)a5;
+ (id)taskWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 rolloutDeployment:(id)a5 capabilityModifier:(id)a6;
+ (id)taskWithFactorPackSetId:(id)a3 treatmentId:(id)a4 taskAttribution:(id)a5 experimentDeployment:(id)a6;
- (BOOL)_downloadAndSaveCKAssetsWithMetadata:(id)a3 artifactProvider:(id)a4 options:(id)a5 downloadNotificationKey:(id)a6 context:(id)a7 assetsDownloadSize:(unint64_t *)a8 errorResult:(id *)a9 fetchError:(id *)a10;
- (BOOL)_downloadAndSaveMAAssets:(id)a3 options:(id)a4 downloadNotificationKey:(id)a5 context:(id)a6 assetsDownloadSize:(unint64_t *)a7 errorResult:(id *)a8 fetchError:(id *)a9;
- (BOOL)_saveFactorPackSet:(id)a3 requiredAssetMap:(id)a4 context:(id)a5;
- (BOOL)incompatibleNamespaceNameForBMLT:(id)a3 namespaceDescriptorProvider:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSString)description;
- (TRIBMLTDeployment)bmltDeployment;
- (TRIExperimentDeployment)experimentDeployment;
- (TRIFactorPackSetId)factorPackSetId;
- (TRIFetchFactorPackSetTask)initWithCoder:(id)a3;
- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 bmltDeployment:(id)a5;
- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 rolloutDeployment:(id)a5 capabilityModifier:(id)a6;
- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 treatmentId:(id)a4 taskAttribution:(id)a5 experimentDeployment:(id)a6;
- (TRIRolloutDeployment)rolloutDeployment;
- (id)_asPersistedTask;
- (id)_downloadSetArtifactWithProvider:(id)a3 downloadOptions:(id)a4 downloadNotificationKey:(id)a5 errorResult:(id *)a6 setArtifactFetchError:(id *)a7;
- (id)_requiredAssetsForFactorPackSet:(id)a3 context:(id)a4;
- (id)_subscribedOnDemandFactorsForAssets:(id)a3 factorPackSet:(id)a4 context:(id)a5;
- (id)_taskResultForStatus:(int)a3 reportResultToServer:(BOOL)a4 earliestRetryDate:(id)a5;
- (id)_uniqueUninstalledAssets:(id)a3;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)_addMetricForFetchFactorPackSetTaskError:(int)a3;
- (void)_bmltFetchTelemetryIfApplicableWithSuccess:(BOOL)a3 bmltRecord:(id)a4 serverContext:(id)a5;
- (void)_logOnDemandFactor:(id)a3 metricName:(id)a4 namespaceName:(id)a5 client:(id)a6 error:(id)a7;
- (void)_recordExperimentFetchFailedWithReason:(id)a3 context:(id)a4;
- (void)_recordExperimentFetchFailedWithTaskError:(int)a3 context:(id)a4;
- (void)_removeDownloadableRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIFetchFactorPackSetTask

- (int)taskType
{
  return 20;
}

- (NSArray)tags
{
  v3 = [(TRIRolloutTaskSupport *)self->_rolloutSupport tags];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(TRIBMLTTaskSupport *)self->_bmltSupport tags];
  }
  v6 = v5;

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v8 = (void *)[v7 mutableCopy];
  +[TRITaskUtils addAttribution:self->_taskAttribution toTaskTags:v8];

  return (NSArray *)v8;
}

- (NSArray)dependencies
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl() && (experimentDeployment = self->_experimentDeployment) != 0)
  {
    v4 = +[TRIFetchExperimentTask taskWithExperimentDeployment:experimentDeployment taskAttributing:self->_taskAttribution];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v5;
}

- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 rolloutDeployment:(id)a5 capabilityModifier:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_10:
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 134, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 133, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_11:
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 135, @"Invalid parameter not satisfying: %@", @"rolloutDeployment" object file lineNumber description];

LABEL_4:
  v43.receiver = self;
  v43.super_class = (Class)TRIFetchFactorPackSetTask;
  v16 = [(TRIFetchFactorPackSetTask *)&v43 init];
  v17 = v16;
  if (v16)
  {
    id v39 = v15;
    objc_storeStrong((id *)&v16->_factorPackSetId, a3);
    objc_storeStrong((id *)&v17->_taskAttribution, a4);
    v17->_construct = 0;
    objc_storeStrong((id *)&v17->_rolloutDeployment, a5);
    v18 = [[TRIRolloutTaskSupport alloc] initWithRolloutDeployment:v17->_rolloutDeployment];
    rolloutSupport = v17->_rolloutSupport;
    v17->_rolloutSupport = v18;

    objc_storeStrong((id *)&v17->_capabilityModifier, a6);
    factorRecordsByAssetId = v17->_factorRecordsByAssetId;
    v17->_factorRecordsByAssetId = 0;

    id v21 = objc_alloc(MEMORY[0x1E4F93B70]);
    v22 = objc_opt_new();
    uint64_t v23 = [v21 initWithGuardedData:v22];
    guardedDownloadableRecord = v17->_guardedDownloadableRecord;
    v17->_guardedDownloadableRecord = (_PASLock *)v23;

    v25 = objc_opt_new();
    v26 = [(TRIRolloutDeployment *)v17->_rolloutDeployment rolloutId];
    v27 = [v25 ensureRolloutFields];
    [v27 setClientRolloutId:v26];

    v28 = loggableFactorPackSetIdFromFactorPackSetId(v12);
    v29 = [v25 ensureRolloutFields];
    [v29 setClientFactorPackSetId:v28];

    v30 = objc_msgSend(NSNumber, "numberWithInt:", -[TRIRolloutDeployment deploymentId](v17->_rolloutDeployment, "deploymentId"));
    v31 = [v30 stringValue];
    [v25 setClientDeploymentId:v31];

    v32 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v13];
    [(TRIRolloutTaskSupport *)v17->_rolloutSupport mergeTelemetry:v25];
    [(TRIRolloutTaskSupport *)v17->_rolloutSupport mergeTelemetry:v32];
    v33 = [v13 networkOptions];
    LODWORD(v29) = [v33 allowsCellularAccess];

    if (v29)
    {
      v34 = v17->_rolloutSupport;
      v35 = (void *)MEMORY[0x1E4FB05A8];
      v36 = [v13 networkOptions];
      v37 = objc_msgSend(v35, "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v36, "allowsCellularAccess"));
      [(TRIRolloutTaskSupport *)v34 addMetric:v37];
    }
    id v15 = v39;
  }

  return v17;
}

+ (id)taskWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 rolloutDeployment:(id)a5 capabilityModifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithFactorPackSetId:v13 taskAttribution:v12 rolloutDeployment:v11 capabilityModifier:v10];

  return v14;
}

- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 bmltDeployment:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 176, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 175, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 177, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];

LABEL_4:
  v36.receiver = self;
  v36.super_class = (Class)TRIFetchFactorPackSetTask;
  id v13 = [(TRIFetchFactorPackSetTask *)&v36 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_factorPackSetId, a3);
    objc_storeStrong((id *)&v14->_taskAttribution, a4);
    v14->_construct = 1;
    objc_storeStrong((id *)&v14->_bmltDeployment, a5);
    id v15 = [[TRIBMLTTaskSupport alloc] initWithBMLTDeployment:v14->_bmltDeployment];
    bmltSupport = v14->_bmltSupport;
    v14->_bmltSupport = v15;

    uint64_t v17 = objc_opt_new();
    capabilityModifier = v14->_capabilityModifier;
    v14->_capabilityModifier = (TRITaskCapabilityModifier *)v17;

    factorRecordsByAssetId = v14->_factorRecordsByAssetId;
    v14->_factorRecordsByAssetId = 0;

    id v20 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v21 = objc_opt_new();
    uint64_t v22 = [v20 initWithGuardedData:v21];
    guardedDownloadableRecord = v14->_guardedDownloadableRecord;
    v14->_guardedDownloadableRecord = (_PASLock *)v22;

    v24 = objc_opt_new();
    v25 = [(TRIBMLTDeployment *)v14->_bmltDeployment backgroundMLTaskId];
    v26 = [v24 ensureBMLTFields];
    [v26 setClientBmltId:v25];

    v27 = loggableFactorPackSetIdFromFactorPackSetId(v10);
    v28 = [v24 ensureBMLTFields];
    [v28 setClientBmltFactorPackSetId:v27];

    v29 = objc_msgSend(NSNumber, "numberWithInt:", -[TRIBMLTDeployment deploymentId](v14->_bmltDeployment, "deploymentId"));
    v30 = [v29 stringValue];
    [v24 setClientDeploymentId:v30];

    v31 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v11];
    [(TRIBMLTTaskSupport *)v14->_bmltSupport mergeTelemetry:v24];
    [(TRIBMLTTaskSupport *)v14->_bmltSupport mergeTelemetry:v31];
  }
  return v14;
}

+ (id)taskWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 bmltDeployment:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithFactorPackSetId:v10 taskAttribution:v9 bmltDeployment:v8];

  return v11;
}

- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 treatmentId:(id)a4 taskAttribution:(id)a5 experimentDeployment:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    objc_super v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 213, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 212, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 214, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];

LABEL_4:
  v38.receiver = self;
  v38.super_class = (Class)TRIFetchFactorPackSetTask;
  v16 = [(TRIFetchFactorPackSetTask *)&v38 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_factorPackSetId, a3);
    objc_storeStrong((id *)&v17->_treatmentId, a4);
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    v17->_construct = 2;
    objc_storeStrong((id *)&v17->_experimentDeployment, a6);
    v18 = [[TRIExperimentTaskSupport alloc] initWithExperimentDeployment:v15];
    experimentSupport = v17->_experimentSupport;
    v17->_experimentSupport = v18;

    uint64_t v20 = objc_opt_new();
    capabilityModifier = v17->_capabilityModifier;
    v17->_capabilityModifier = (TRITaskCapabilityModifier *)v20;

    factorRecordsByAssetId = v17->_factorRecordsByAssetId;
    v17->_factorRecordsByAssetId = 0;

    id v23 = objc_alloc(MEMORY[0x1E4F93B70]);
    v24 = objc_opt_new();
    uint64_t v25 = [v23 initWithGuardedData:v24];
    guardedDownloadableRecord = v17->_guardedDownloadableRecord;
    v17->_guardedDownloadableRecord = (_PASLock *)v25;

    v27 = objc_opt_new();
    v28 = [(TRIExperimentDeployment *)v17->_experimentDeployment experimentId];
    v29 = [v27 ensureExperimentFields];
    [v29 setClientExperimentId:v28];

    v30 = [v27 ensureExperimentFields];
    [v30 setClientTreatmentId:v13];

    v31 = objc_msgSend(NSNumber, "numberWithInt:", -[TRIExperimentDeployment deploymentId](v17->_experimentDeployment, "deploymentId"));
    v32 = [v31 stringValue];
    [v27 setClientDeploymentId:v32];

    v33 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v14];
    [(TRIExperimentTaskSupport *)v17->_experimentSupport mergeTelemetry:v27];
    [(TRIExperimentTaskSupport *)v17->_experimentSupport mergeTelemetry:v33];
  }
  return v17;
}

+ (id)taskWithFactorPackSetId:(id)a3 treatmentId:(id)a4 taskAttribution:(id)a5 experimentDeployment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithFactorPackSetId:v13 treatmentId:v12 taskAttribution:v11 experimentDeployment:v10];

  return v14;
}

- (void)_recordExperimentFetchFailedWithTaskError:(int)a3 context:(id)a4
{
  id v6 = a4;
  fetchTaskErrorAsString(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(TRIFetchFactorPackSetTask *)self _recordExperimentFetchFailedWithReason:v7 context:v6];
}

- (void)_recordExperimentFetchFailedWithReason:(id)a3 context:(id)a4
{
  id v7 = a4;
  if (self->_construct != 2) {
    goto LABEL_10;
  }
  id v23 = v7;
  id v8 = a3;
  id v9 = [(TRIFetchFactorPackSetTask *)self experimentDeployment];

  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 264, @"Invalid parameter not satisfying: %@", @"self.experimentDeployment" object file lineNumber description];
  }
  id v10 = v23;
  if (self->_treatmentId)
  {
    if (v8) {
      goto LABEL_6;
    }
LABEL_14:
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v10);
    [v20 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 266, @"Invalid parameter not satisfying: %@", @"failureReason" object file lineNumber description];

    if (v23) {
      goto LABEL_7;
    }
LABEL_15:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 267, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    goto LABEL_7;
  }
  v19 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v23);
  [v19 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 265, @"Invalid parameter not satisfying: %@", @"_treatmentId" object file lineNumber description];

  id v10 = v23;
  if (!v8) {
    goto LABEL_14;
  }
LABEL_6:
  if (!v10) {
    goto LABEL_15;
  }
LABEL_7:
  id v11 = +[TRIExperimentPostLaunchRecorder recorderFromContext:](TRIExperimentPostLaunchRecorder, "recorderFromContext:");
  id v12 = [(TRIFetchFactorPackSetTask *)self experimentDeployment];
  id v13 = [v12 experimentId];
  id v14 = [(TRIFetchFactorPackSetTask *)self experimentDeployment];
  id v15 = +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v13, [v14 deploymentId], self->_treatmentId);

  v16 = +[TRIExperimentPostLaunchEvent failureEventWithEventType:7 treatmentTriple:v15 failureReason:v8];

  id v17 = v16;
  if (!v17)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 279, @"Expression was unexpectedly nil/false: %@", @"failureEvent" object file lineNumber description];
  }
  [v11 recordEvent:v17];

  id v7 = v23;
LABEL_10:
}

- (id)_taskResultForStatus:(int)a3 reportResultToServer:(BOOL)a4 earliestRetryDate:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ((v6 - 3) > 1 || !self->_experimentDeployment)
  {
    id v17 = [TRITaskRunResult alloc];
    uint64_t v18 = MEMORY[0x1E4F1CBF0];
    uint64_t v19 = v6;
LABEL_11:
    v16 = [(TRITaskRunResult *)v17 initWithRunStatus:v19 reportResultToServer:v5 nextTasks:v18 earliestRetryDate:v8];
    goto LABEL_12;
  }
  int v9 = _os_feature_enabled_impl();
  id v10 = TRILogCategory_Server();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (!v9)
  {
    if (v11)
    {
      factorPackSetId = self->_factorPackSetId;
      v24 = [(TRIExperimentDeployment *)self->_experimentDeployment experimentId];
      *(_DWORD *)buf = 138412546;
      v27 = factorPackSetId;
      __int16 v28 = 2112;
      v29 = v24;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch factor pack set (with id:%@) for experiment (with id:%@).", buf, 0x16u);
    }
    id v17 = [TRITaskRunResult alloc];
    uint64_t v18 = MEMORY[0x1E4F1CBF0];
    uint64_t v19 = 2;
    goto LABEL_11;
  }
  if (v11)
  {
    id v21 = self->_factorPackSetId;
    uint64_t v22 = [(TRIExperimentDeployment *)self->_experimentDeployment experimentId];
    *(_DWORD *)buf = 138412546;
    v27 = v21;
    __int16 v28 = 2112;
    v29 = v22;
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch factor pack set (with id:%@) for experiment (with id:%@). Deactivating experiment.", buf, 0x16u);
  }
  id v12 = [(TRIExperimentDeployment *)self->_experimentDeployment experimentId];
  id v13 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v12 deploymentId:[(TRIExperimentDeployment *)self->_experimentDeployment deploymentId] failOnUnrecognizedExperiment:0 triggerEvent:14 taskAttribution:self->_taskAttribution];

  id v14 = [TRITaskRunResult alloc];
  uint64_t v25 = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v16 = [(TRITaskRunResult *)v14 initWithRunStatus:v6 reportResultToServer:v5 nextTasks:v15 earliestRetryDate:v8];

LABEL_12:
  return v16;
}

- (void)_removeDownloadableRecord:(id)a3
{
  id v4 = a3;
  guardedDownloadableRecord = self->_guardedDownloadableRecord;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __55__TRIFetchFactorPackSetTask__removeDownloadableRecord___block_invoke;
  v7[3] = &unk_1E6BBC148;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)guardedDownloadableRecord runWithLockAcquired:v7];
}

void __55__TRIFetchFactorPackSetTask__removeDownloadableRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 containsObject:*(void *)(a1 + 32)])
  {
    [v3 removeObject:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Missing %@ in _guardedDownloadableRecord", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)_downloadSetArtifactWithProvider:(id)a3 downloadOptions:(id)a4 downloadNotificationKey:(id)a5 errorResult:(id *)a6 setArtifactFetchError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([@"empty-fp-set" isEqualToString:self->_factorPackSetId])
  {
    id v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Factor pack set is empty by definition; skipping CloudKit fetch.",
        buf,
        2u);
    }

    v16 = [TRIFactorPackSet alloc];
    id v17 = [(TRIFactorPackSet *)v16 initWithIdent:@"empty-fp-set" packs:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v27 = v12;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    if (self->_rolloutDeployment) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 1;
    }
    uint64_t v20 = [TRIFetchOptions alloc];
    id v21 = [NSNumber numberWithUnsignedInt:v19];
    uint64_t v22 = [(TRIFetchOptions *)v20 initWithDownloadOptions:v13 cacheDeleteAvailableSpaceClass:v21];

    *(void *)buf = 0;
    v40 = buf;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__32;
    objc_super v43 = __Block_byref_object_dispose__32;
    id v44 = 0;
    uint64_t v35 = 0;
    objc_super v36 = &v35;
    uint64_t v37 = 0x2020000000;
    int v38 = 0;
    factorPackSetId = self->_factorPackSetId;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __136__TRIFetchFactorPackSetTask__downloadSetArtifactWithProvider_downloadOptions_downloadNotificationKey_errorResult_setArtifactFetchError___block_invoke;
    v28[3] = &unk_1E6BBC170;
    v28[4] = self;
    v31 = &v35;
    v33 = a6;
    v34 = a7;
    id v29 = v14;
    v32 = buf;
    v24 = v18;
    id v12 = v27;
    uint64_t v25 = v24;
    uint64_t v30 = v24;
    [v27 fetchFactorPackSetWithId:factorPackSetId options:v22 completion:v28];
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_DWORD *)v36 + 6)) {
      -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](self, "_addMetricForFetchFactorPackSetTaskError:");
    }
    id v17 = (TRIFactorPackSet *)*((id *)v40 + 5);

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(buf, 8);
  }
  return v17;
}

void __136__TRIFetchFactorPackSetTask__downloadSetArtifactWithProvider_downloadOptions_downloadNotificationKey_errorResult_setArtifactFetchError___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a2 != 4)
  {
    v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 128);
      int v25 = 138543618;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      id v28 = v13;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Unable to fetch factor pack set %{public}@: %{public}@", (uint8_t *)&v25, 0x16u);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 32;
    dispatch_semaphore_t v18 = *(void **)(a1 + 32);
    uint64_t v19 = 1;
    goto LABEL_10;
  }
  if (!v11)
  {
    uint64_t v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 128);
      int v25 = 138543362;
      uint64_t v26 = v21;
      _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "No valid factor set could be downloaded for %{public}@.", (uint8_t *)&v25, 0xCu);
    }

    [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:*(void *)(a1 + 40) withCloudKitError:v13];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 31;
    dispatch_semaphore_t v18 = *(void **)(a1 + 32);
    uint64_t v19 = 3;
LABEL_10:
    uint64_t v22 = [v18 _taskResultForStatus:v19 reportResultToServer:1 earliestRetryDate:v12];
    id v23 = *(void ***)(a1 + 72);
    v24 = *v23;
    *id v23 = (void *)v22;

    id v14 = *(id **)(a1 + 80);
    id v15 = a6;
    goto LABEL_11;
  }
  id v14 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v15 = a3;
LABEL_11:
  objc_storeStrong(v14, v15);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_requiredAssetsForFactorPackSet:(id)a3 context:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [TRIAssetStore alloc];
  uint64_t v8 = [v6 paths];
  uint64_t v41 = [(TRIAssetStore *)v7 initWithPaths:v8];

  v40 = objc_opt_new();
  objc_super v36 = v6;
  int v9 = [v6 keyValueStore];
  id v39 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v9];

  id v10 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v37 = v5;
  id obj = [v5 packs];
  uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    id v14 = v10;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v44 + 1) + 8 * v15);
        uint64_t v17 = (void *)MEMORY[0x1E016E7F0]();
        dispatch_semaphore_t v18 = [v16 selectedNamespace];
        int v19 = [v18 hasName];

        unint64_t v20 = 0x1E6BB6000uLL;
        if (v19)
        {
          uint64_t v21 = [v16 selectedNamespace];
          uint64_t v22 = [v21 name];
          id v23 = +[TRIClientFactorPackUtils aliasesInNamespace:v22];

          unint64_t v20 = 0x1E6BB6000;
        }
        else
        {
          uint64_t v21 = TRILogCategory_Server();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = [v16 factorPackId];
            *(_DWORD *)buf = 138543362;
            v49 = v30;
            _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", buf, 0xCu);
          }
          id v23 = 0;
        }

        v24 = [*(id *)(v20 + 3656) requiredAssetsForInstallationWithFactorPack:v16 assetStore:v41 maProvider:v40 subscriptionSettings:v39 aliasToUnaliasMap:v23];
        if (!v24)
        {

          id v32 = 0;
          id v10 = v14;
          goto LABEL_18;
        }
        int v25 = v24;
        uint64_t v26 = [v24 cloudKit];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke;
        v43[3] = &unk_1E6BBA900;
        v43[4] = v16;
        [v26 enumerateObjectsUsingBlock:v43];

        __int16 v27 = [v25 mobileAsset];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke_366;
        v42[3] = &unk_1E6BB9EF8;
        v42[4] = v16;
        [v27 enumerateObjectsUsingBlock:v42];

        id v28 = [v16 factorPackId];
        uint64_t v29 = TRIValidateFactorPackId();

        if (!v29)
        {
          v31 = [MEMORY[0x1E4F28B00] currentHandler];
          [v31 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 432, @"Expression was unexpectedly nil/false: %@", @"TRIValidateFactorPackId(pack.factorPackId)" object file lineNumber description];
        }
        id v10 = v14;
        [v14 setObject:v25 forKeyedSubscript:v29];

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v32 = v10;
LABEL_18:

  return v32;
}

void __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isInstalled] & 1) == 0)
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) factorPackId];
      id v6 = [v3 assetId];
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v6;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ requires Trial-CK asset %{public}@ which is not already on disk; will be downloaded.",
        (uint8_t *)&v7,
        0x16u);
    }
  }
}

void __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke_366(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isInstalled] & 1) == 0)
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) factorPackId];
      id v6 = [v3 fullAssetId];
      int v7 = [v6 type];
      uint64_t v8 = [v3 fullAssetId];
      __int16 v9 = [v8 specifier];
      id v10 = [v3 fullAssetId];
      uint64_t v11 = [v10 version];
      int v12 = 138544130;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      int v19 = v11;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ requires MAAsset %{public}@.%{public}@.%{public}@ which is not already on disk; will be downloaded.",
        (uint8_t *)&v12,
        0x2Au);
    }
  }
}

- (id)_uniqueUninstalledAssets:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke;
  __int16 v14 = &unk_1E6BBC198;
  id v15 = v4;
  id v16 = v5;
  id v6 = v5;
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:&v11];

  uint64_t v8 = [TRIGenericUniqueRequiredAssets alloc];
  __int16 v9 = -[TRIGenericUniqueRequiredAssets initWithCloudKit:mobileAsset:](v8, "initWithCloudKit:mobileAsset:", v7, v6, v11, v12, v13, v14);

  return v9;
}

void __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 cloudKit];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_2;
  v9[3] = &unk_1E6BBA900;
  id v10 = *(id *)(a1 + 32);
  [v5 enumerateObjectsUsingBlock:v9];

  id v6 = [v4 mobileAsset];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_3;
  v7[3] = &unk_1E6BB9EF8;
  id v8 = *(id *)(a1 + 40);
  [v6 enumerateObjectsUsingBlock:v7];
}

void __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 isInstalled] & 1) == 0)
  {
    id v3 = [v6 metadata];
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 assetId];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

void __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 metadata];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 fullAssetId];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (id)_subscribedOnDemandFactorsForAssets:(id)a3 factorPackSet:(id)a4 context:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v7 = a4;
  id v8 = [a5 keyValueStore];
  v34 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v8];

  id v35 = (id)objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v30 = v7;
  id obj = [v7 packs];
  uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (![v13 hasSelectedNamespace]
          || ([v13 selectedNamespace],
              __int16 v14 = objc_claimAutoreleasedReturnValue(),
              char v15 = [v14 hasName],
              v14,
              (v15 & 1) == 0))
        {
          id v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2 object:self file:@"TRIFetchFactorPackSetTask.m" lineNumber:471 description:@"factor pack is missing namespace"];
        }
        uint64_t v17 = [v13 selectedNamespace];
        __int16 v18 = [v17 name];

        int v19 = [v34 subscribedFactorsForNamespaceName:v18];
        if (([v13 hasFactorPackId] & 1) == 0)
        {
          uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:a2 object:self file:@"TRIFetchFactorPackSetTask.m" lineNumber:475 description:@"factor pack is missing factor pack identifier"];
        }
        uint64_t v20 = [v13 factorPackId];
        uint64_t v21 = TRIValidateFactorPackId();

        if (!v21)
        {
          __int16 v27 = [MEMORY[0x1E4F28B00] currentHandler];
          [v27 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 476, @"Expression was unexpectedly nil/false: %@", @"TRIValidateFactorPackId(pack.factorPackId)" object file lineNumber description];
        }
        uint64_t v22 = [v36 objectForKeyedSubscript:v21];
        if (!v22)
        {
          id v28 = [MEMORY[0x1E4F28B00] currentHandler];
          [v28 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 477, @"Expression was unexpectedly nil/false: %@", @"assets[factorPackId]" object file lineNumber description];
        }
        id v23 = [v22 cloudKit];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __87__TRIFetchFactorPackSetTask__subscribedOnDemandFactorsForAssets_factorPackSet_context___block_invoke;
        v37[3] = &unk_1E6BBC1C0;
        id v38 = v19;
        id v39 = v18;
        v40 = v13;
        id v41 = v35;
        id v24 = v18;
        id v25 = v19;
        [v23 enumerateObjectsUsingBlock:v37];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v10);
  }

  return v35;
}

void __87__TRIFetchFactorPackSetTask__subscribedOnDemandFactorsForAssets_factorPackSet_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isOnDemand])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 factorName];
    LODWORD(v4) = [v4 containsObject:v5];

    if (v4)
    {
      id v6 = [TRIFactorNamespaceRecord alloc];
      id v7 = [v3 factorName];
      id v8 = [(TRIFactorNamespaceRecord *)v6 initWithFactorName:v7 namespaceName:*(void *)(a1 + 40)];

      uint64_t v9 = TRILogCategory_Server();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 48) factorPackId];
        uint64_t v11 = [v3 assetId];
        uint64_t v12 = [v3 factorName];
        int v22 = 138543874;
        id v23 = v10;
        __int16 v24 = 2114;
        id v25 = v11;
        __int16 v26 = 2114;
        __int16 v27 = v12;
        _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ has asset %{public}@ associated with on-demand factor name %{public}@", (uint8_t *)&v22, 0x20u);
      }
      uint64_t v13 = *(void **)(a1 + 56);
      __int16 v14 = [v3 assetId];
      char v15 = [v13 objectForKeyedSubscript:v14];

      if (v15 && ([v15 isEqualToFactorRecord:v8] & 1) == 0)
      {
        id v16 = TRILogCategory_Server();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v3 assetId];
          __int16 v18 = [v15 factorName];
          int v19 = [v3 factorName];
          int v22 = 138543874;
          id v23 = v17;
          __int16 v24 = 2114;
          id v25 = v18;
          __int16 v26 = 2114;
          __int16 v27 = v19;
          _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Warning:same assetId %{public}@ with different on-demand factor names %{public}@ and %{public}@; ; ignoring the former",
            (uint8_t *)&v22,
            0x20u);
        }
      }
      uint64_t v20 = *(void **)(a1 + 56);
      uint64_t v21 = [v3 assetId];
      [v20 setObject:v8 forKeyedSubscript:v21];
    }
  }
}

- (BOOL)_downloadAndSaveCKAssetsWithMetadata:(id)a3 artifactProvider:(id)a4 options:(id)a5 downloadNotificationKey:(id)a6 context:(id)a7 assetsDownloadSize:(unint64_t *)a8 errorResult:(id *)a9 fetchError:(id *)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  v58 = v20;
  if ([v17 count])
  {
    v55 = v21;
    int v22 = objc_opt_new();
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke;
    v116[3] = &unk_1E6BBC1E8;
    id v23 = v18;
    __int16 v24 = self;
    id v25 = v22;
    id v117 = v25;
    [v17 enumerateKeysAndObjectsUsingBlock:v116];
    dispatch_semaphore_t v56 = dispatch_semaphore_create(0);
    uint64_t v110 = 0;
    v111 = &v110;
    uint64_t v112 = 0x3032000000;
    v113 = __Block_byref_object_copy__32;
    v114 = __Block_byref_object_dispose__32;
    id v115 = 0;
    v52 = a8;
    *a8 = 0;
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2;
    v102[3] = &unk_1E6BBC210;
    __int16 v26 = v24;
    v102[4] = v24;
    id v18 = v23;
    id v27 = v20;
    id v103 = v27;
    v107 = a9;
    v108 = a10;
    id v53 = v17;
    id v28 = v17;
    id v104 = v28;
    v106 = &v110;
    SEL v109 = a2;
    v59 = v56;
    v105 = v59;
    v54 = v25;
    id v29 = (id)[v18 fetchRecordIdsForAssetsWithIds:v25 options:v19 completion:v102];
    [MEMORY[0x1E4F93B18] waitForSemaphore:v59];
    if (v111[5])
    {
      uint64_t v30 = v27;
      v57 = v19;
      id v31 = objc_alloc(MEMORY[0x1E4F1CA60]);
      id v32 = v26;
      v33 = objc_msgSend(v31, "initWithCapacity:", objc_msgSend((id)v111[5], "count"));
      v34 = (void *)v111[5];
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_389;
      v97[3] = &unk_1E6BBC238;
      id v35 = v28;
      SEL v101 = a2;
      id v98 = v35;
      v99 = v26;
      id v36 = v33;
      id v100 = v36;
      [v34 enumerateKeysAndObjectsUsingBlock:v97];
      uint64_t v91 = 0;
      v92 = &v91;
      uint64_t v93 = 0x3032000000;
      v94 = __Block_byref_object_copy__32;
      v95 = __Block_byref_object_dispose__32;
      id v96 = 0;
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_395;
      v87[3] = &unk_1E6BBADA8;
      id v88 = v36;
      v89 = v26;
      id v90 = v55;
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_4;
      v83[3] = &unk_1E6BBADF8;
      id v84 = v88;
      v85 = v26;
      id v37 = v90;
      id v86 = v37;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_6;
      v76[3] = &unk_1E6BBC260;
      v76[4] = v26;
      v81 = a9;
      id v77 = v30;
      id v38 = v35;
      id v78 = v38;
      v80 = &v91;
      SEL v82 = a2;
      id v39 = v59;
      v79 = v39;
      id v51 = v84;
      id v40 = (id)[v18 fetchAssetsWithRecordIds:v84 options:v57 perRecordProgress:0 perRecordCompletionBlockOnSuccess:v87 perRecordCompletionBlockOnError:v83 completion:v76];
      [MEMORY[0x1E4F93B18] waitForSemaphore:v39];
      if (v92[5])
      {
        uint64_t v72 = 0;
        v73 = &v72;
        uint64_t v74 = 0x2020000000;
        char v75 = 1;
        id v41 = [TRIAssetStore alloc];
        long long v42 = [v37 paths];
        long long v43 = [v57 downloadOptions];
        long long v44 = [v43 activity];
        long long v45 = [(TRIAssetStore *)v41 initWithPaths:v42 monitoredActivity:v44];

        long long v46 = (void *)v92[5];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_399;
        v63[3] = &unk_1E6BBC288;
        SEL v69 = a2;
        id v64 = v38;
        v65 = v32;
        uint64_t v47 = v45;
        v66 = v47;
        v68 = &v72;
        id v67 = v57;
        v70 = a9;
        v71 = v52;
        [v46 enumerateKeysAndObjectsUsingBlock:v63];
        v61[0] = 0;
        v61[1] = v61;
        v61[2] = 0x2020000000;
        char v62 = 1;
        v48 = (void *)v92[5];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_402;
        v60[3] = &unk_1E6BBAE98;
        v60[4] = v61;
        [v48 enumerateKeysAndObjectsUsingBlock:v60];
        id v21 = v55;
        BOOL v49 = *((unsigned char *)v73 + 24) != 0;
        _Block_object_dispose(v61, 8);

        _Block_object_dispose(&v72, 8);
      }
      else
      {
        BOOL v49 = 0;
        id v21 = v55;
      }
      id v19 = v57;

      _Block_object_dispose(&v91, 8);
    }
    else
    {
      BOOL v49 = 0;
    }

    _Block_object_dispose(&v110, 8);
    id v17 = v53;
  }
  else
  {
    BOOL v49 = 1;
  }

  return v49;
}

uint64_t __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  switch(a2)
  {
    case 0:
      uint64_t v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v14;
        __int16 v40 = 2114;
        uint64_t v41 = (uint64_t)v12;
        _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Unable to fetch CKRecordIDs for factor pack set %{public}@, will not retry: %{public}@", buf, 0x16u);
      }

      [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:*(void *)(a1 + 40) withCloudKitError:v12];
      char v15 = *(void **)(a1 + 32);
      uint64_t v16 = 3;
      goto LABEL_8;
    case 1:
      id v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v18;
        _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Fetch of factor pack set %{public}@ was canceled.", buf, 0xCu);
      }

      char v15 = *(void **)(a1 + 32);
      uint64_t v16 = 4;
LABEL_8:
      id v19 = 0;
      goto LABEL_12;
    case 2:
      id v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543874;
        uint64_t v39 = v21;
        __int16 v40 = 2114;
        uint64_t v41 = (uint64_t)v11;
        __int16 v42 = 2114;
        uint64_t v43 = (uint64_t)v12;
        _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Unable to fetch CKRecordIDs for factor pack set %{public}@, will retry after %{public}@: %{public}@", buf, 0x20u);
      }

      char v15 = *(void **)(a1 + 32);
      uint64_t v16 = 1;
      id v19 = v11;
LABEL_12:
      uint64_t v22 = [v15 _taskResultForStatus:v16 reportResultToServer:1 earliestRetryDate:v19];
      id v23 = *(void ***)(a1 + 72);
      __int16 v24 = *v23;
      *id v23 = (void *)v22;

      id v25 = *(id **)(a1 + 80);
      __int16 v26 = a5;
      goto LABEL_13;
    case 3:
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 88), *(void *)(a1 + 32), @"TRIFetchFactorPackSetTask.m", 569, @"Unexpected TRIFetchStatus %tu", 3);

      goto LABEL_23;
    case 4:
      if (v10 && (uint64_t v28 = [v10 count], v28 == objc_msgSend(*(id *)(a1 + 48), "count")))
      {
        id v29 = TRILogCategory_Server();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = [*(id *)(a1 + 48) count];
          uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 128);
          *(_DWORD *)buf = 134218242;
          uint64_t v39 = v30;
          __int16 v40 = 2114;
          uint64_t v41 = v31;
          _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Retrieved %tu CKRecordIDs for assets in factor pack set %{public}@.", buf, 0x16u);
        }

        id v25 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        __int16 v26 = a3;
LABEL_13:
        objc_storeStrong(v25, v26);
      }
      else
      {
        id v32 = TRILogCategory_Server();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 128);
          uint64_t v37 = [*(id *)(a1 + 48) count];
          *(_DWORD *)buf = 138543874;
          uint64_t v39 = v36;
          __int16 v40 = 2048;
          uint64_t v41 = v37;
          __int16 v42 = 2048;
          uint64_t v43 = [v10 count];
          _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Retrieved wrong number of CKRecordIDs for assets in factor pack set %{public}@ (exp %tu, act %tu).", buf, 0x20u);
        }

        uint64_t v33 = [*(id *)(a1 + 32) _taskResultForStatus:3 reportResultToServer:1 earliestRetryDate:0];
        v34 = *(void ***)(a1 + 72);
        id v35 = *v34;
        void *v34 = (void *)v33;
      }
LABEL_23:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

      return;
    default:
      goto LABEL_23;
  }
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_389(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"TRIFetchFactorPackSetTask.m", 584, @"Expression was unexpectedly nil/false: %@", @"assetMetadata[assetId]" object file lineNumber description];
  }
  uint64_t v9 = [v8 downloadSize];

  id v11 = [[TRISizedCKRecordID alloc] initWithRecordId:v6 downloadSize:v9];
  [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v7];
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_395(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_3;
  v9[3] = &unk_1E6BBAD80;
  id v6 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v7 = (void *)a1[6];
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = *(void **)(a1 + 32);
  id v8 = [a3 recordId];
  LODWORD(v7) = [v7 isEqual:v8];

  uint64_t v9 = v16;
  if (v7)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKeyedSubscript:v16];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = *(void **)(a1 + 40);
      uint64_t v13 = [v10 factorName];
      uint64_t v14 = [v11 namespaceName];
      char v15 = [*(id *)(a1 + 48) client];
      [v12 _logOnDemandFactor:v13 metricName:@"on_demand_factor_downloaded_by_subscription" namespaceName:v14 client:v15 error:0];

      [*(id *)(a1 + 40) _removeDownloadableRecord:v11];
    }
    *a4 = 1;

    uint64_t v9 = v16;
  }
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_5;
  v13[3] = &unk_1E6BBADD0;
  uint64_t v9 = (void *)a1[4];
  uint64_t v8 = a1[5];
  id v10 = (void *)a1[6];
  id v14 = v6;
  uint64_t v15 = v8;
  id v16 = v10;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_5(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [a3 recordId];
  LODWORD(v7) = [v7 isEqual:v8];

  uint64_t v9 = v16;
  if (v7)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKeyedSubscript:v16];
    id v11 = v10;
    if (v10)
    {
      id v12 = *(void **)(a1 + 40);
      uint64_t v13 = [v10 factorName];
      id v14 = [v11 namespaceName];
      uint64_t v15 = [*(id *)(a1 + 48) client];
      [v12 _logOnDemandFactor:v13 metricName:@"on_demand_factor_failed_to_download_by_subscription" namespaceName:v14 client:v15 error:*(void *)(a1 + 56)];

      [*(id *)(a1 + 40) _removeDownloadableRecord:v11];
    }
    *a4 = 1;

    uint64_t v9 = v16;
  }
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  switch(a2)
  {
    case 0:
      uint64_t v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v14;
        __int16 v36 = 2114;
        uint64_t v37 = (uint64_t)v12;
        _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Unable to fetch all assets for factor pack set %{public}@, will not retry: %{public}@", buf, 0x16u);
      }

      [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:*(void *)(a1 + 40) withCloudKitError:v12];
      goto LABEL_19;
    case 1:
      uint64_t v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v16;
        _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Fetch of factor pack set %{public}@ was canceled.", buf, 0xCu);
      }

      id v17 = *(void **)(a1 + 32);
      uint64_t v18 = 4;
      goto LABEL_20;
    case 2:
      id v19 = TRILogCategory_Server();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v20;
        __int16 v36 = 2114;
        uint64_t v37 = (uint64_t)v11;
        __int16 v38 = 2114;
        uint64_t v39 = (uint64_t)v12;
        _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "Unable to fetch all assets for factor pack set %{public}@, will retry after %{public}@: %{public}@", buf, 0x20u);
      }

      id v17 = *(void **)(a1 + 32);
      uint64_t v18 = 1;
      id v21 = v11;
      goto LABEL_21;
    case 3:
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIFetchFactorPackSetTask.m", 666, @"Unexpected TRIFetchStatus %tu", 3);

      goto LABEL_22;
    case 4:
      uint64_t v23 = [v10 count];
      uint64_t v24 = [*(id *)(a1 + 48) count];
      id v25 = TRILogCategory_Server();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v23 == v24)
      {
        if (v26)
        {
          uint64_t v27 = [*(id *)(a1 + 48) count];
          uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 128);
          *(_DWORD *)buf = 134218242;
          uint64_t v35 = v27;
          __int16 v36 = 2114;
          uint64_t v37 = v28;
          _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Finished downloading %tu assets for factor pack set %{public}@.", buf, 0x16u);
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
      }
      else
      {
        if (v26)
        {
          uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 128);
          uint64_t v30 = [*(id *)(a1 + 48) count];
          *(_DWORD *)buf = 138543874;
          uint64_t v35 = v29;
          __int16 v36 = 2048;
          uint64_t v37 = v30;
          __int16 v38 = 2048;
          uint64_t v39 = [v10 count];
          _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Downloaded wrong number of assets for factor pack set %{public}@ (exp %tu, act %tu).", buf, 0x20u);
        }

LABEL_19:
        id v17 = *(void **)(a1 + 32);
        uint64_t v18 = 3;
LABEL_20:
        id v21 = 0;
LABEL_21:
        uint64_t v31 = [v17 _taskResultForStatus:v18 reportResultToServer:1 earliestRetryDate:v21];
        id v32 = *(void ***)(a1 + 72);
        uint64_t v33 = *v32;
        NSObject *v32 = (void *)v31;
      }
LABEL_22:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

      return;
    default:
      goto LABEL_22;
  }
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_399(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 objectForKeyedSubscript:v9];
  if (!v10)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"TRIFetchFactorPackSetTask.m", 683, @"Expression was unexpectedly nil/false: %@", @"assetMetadata[assetId]" object file lineNumber description];
  }
  id v11 = *(void **)(a1 + 48);
  id v24 = 0;
  char v12 = [v11 saveAssetWithIdentifier:v9 assetURL:v8 metadata:v10 error:&v24];

  id v13 = v24;
  if (v12 == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    [*(id *)(a1 + 40) setWasDeferred:1];
    uint64_t v20 = [*(id *)(a1 + 40) _taskResultForStatus:1 reportResultToServer:1 earliestRetryDate:0];
    id v21 = *(void ***)(a1 + 80);
    uint64_t v22 = *v21;
    *id v21 = (void *)v20;

    *a4 = 1;
  }
  else if (v12)
  {
    **(void **)(a1 + 88) += [v10 downloadSize];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v14 = [*(id *)(a1 + 56) downloadOptions];
    uint64_t v15 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v13 options:v14];

    if (v15) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 3;
    }
    uint64_t v17 = [*(id *)(a1 + 40) _taskResultForStatus:v16 reportResultToServer:1 earliestRetryDate:v15];
    uint64_t v18 = *(void ***)(a1 + 80);
    id v19 = *v18;
    void *v18 = (void *)v17;

    *a4 = 1;
  }
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_402(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v14];
  id v7 = v14;

  if ((v6 & 1) == 0)
  {
    id v8 = [v7 domain];
    id v9 = v8;
    if (v8 != (void *)*MEMORY[0x1E4F281F8])
    {

      goto LABEL_5;
    }
    uint64_t v10 = [v7 code];

    if (v10 != 4)
    {
LABEL_5:
      int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      char v12 = TRILogCategory_Server();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v13) {
          goto LABEL_11;
        }
      }
      else if (v13)
      {
LABEL_11:
        *(_DWORD *)buf = 138543618;
        id v16 = v4;
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %{public}@: %{public}@", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

- (BOOL)_downloadAndSaveMAAssets:(id)a3 options:(id)a4 downloadNotificationKey:(id)a5 context:(id)a6 assetsDownloadSize:(unint64_t *)a7 errorResult:(id *)a8 fetchError:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ([v14 count])
  {
    id v18 = objc_opt_new();
    uint64_t v19 = [v18 ensureMobileAssetOriginFields];
    [v19 setIsMobileAsset:1];

    rolloutSupport = self->_rolloutSupport;
    if (rolloutSupport
      || (rolloutSupport = self->_bmltSupport) != 0
      || _os_feature_enabled_impl() && (rolloutSupport = self->_experimentSupport) != 0)
    {
      [rolloutSupport mergeTelemetry:v18];
    }

    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__32;
    uint64_t v40 = __Block_byref_object_dispose__32;
    id v41 = 0;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    uint64_t v22 = objc_opt_new();
    taskAttribution = self->_taskAttribution;
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __136__TRIFetchFactorPackSetTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke;
    uint64_t v31 = &unk_1E6BB9F20;
    v34 = &v36;
    uint64_t v35 = a9;
    id v32 = self;
    id v24 = v21;
    uint64_t v33 = v24;
    id v25 = (id)[v22 downloadAssets:v14 attribution:taskAttribution aggregateProgress:0 group:0 completion:&v28];
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    if (a8) {
      objc_storeStrong(a8, (id)v37[5]);
    }
    BOOL v26 = objc_msgSend((id)v37[5], "runStatus", v28, v29, v30, v31, v32) == 2;

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    BOOL v26 = 1;
  }

  return v26;
}

void __136__TRIFetchFactorPackSetTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v16 = a4;
  id v9 = a5;
  if (a3) {
    [*(id *)(a1 + 32) setWasDeferred:1];
  }
  uint64_t v10 = *(void ***)(a1 + 56);
  int v11 = *v10;
  *uint64_t v10 = v9;
  id v12 = v9;

  uint64_t v13 = [*(id *)(a1 + 32) _taskResultForStatus:a2 reportResultToServer:1 earliestRetryDate:v16];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_saveFactorPackSet:(id)a3 requiredAssetMap:(id)a4 context:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v59 = a4;
  id v7 = a5;
  int v55 = _os_feature_enabled_impl();
  id v8 = [TRIFactorPackStorage alloc];
  v54 = v7;
  id v9 = [v7 paths];
  id v64 = [(TRIFactorPackStorage *)v8 initWithPaths:v9];

  uint64_t v10 = [TRIFBFactorPackStorage alloc];
  int v11 = [v54 paths];
  v52 = [(TRIFBFactorPackStorage *)v10 initWithPaths:v11];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = [v51 packs];
  uint64_t v60 = [(TRIFactorPackSetStorage *)obj countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (!v60) {
    goto LABEL_34;
  }
  uint64_t v56 = *(void *)v78;
  while (2)
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v78 != v56)
      {
        uint64_t v13 = v12;
        objc_enumerationMutation(obj);
        uint64_t v12 = v13;
      }
      uint64_t v62 = v12;
      uint64_t v14 = *(void **)(*((void *)&v77 + 1) + 8 * v12);
      v63 = (void *)MEMORY[0x1E016E7F0]();
      id v67 = &stru_1F3455898;
      if ([v14 hasFactorPackId])
      {
        id v67 = [v14 factorPackId];
      }
      if (![v14 hasFactorPackId]
        || (TRIValidateFactorPackId(), (v68 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 793, @"Unexpected failure to validate factor pack set id: %@", v67 object file lineNumber description];

        v68 = 0;
      }
      if (![v14 hasSelectedNamespace]
        || ([v14 selectedNamespace],
            id v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 hasName],
            v16,
            (v17 & 1) == 0))
      {
        id v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 795, @"Factor pack %@ has unexpectedly-empty namespace name", v67 object file lineNumber description];
      }
      uint64_t v19 = objc_opt_new();
      uint64_t v20 = [v59 objectForKeyedSubscript:v68];
      if (!v20)
      {
        long long v46 = [MEMORY[0x1E4F28B00] currentHandler];
        [v46 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 799, @"Expression was unexpectedly nil/false: %@", @"requiredAssetMap[factorPackId]" object file lineNumber description];
      }
      dispatch_semaphore_t v21 = [v20 cloudKit];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke;
      v75[3] = &unk_1E6BBA900;
      id v22 = v19;
      id v76 = v22;
      [v21 enumerateObjectsUsingBlock:v75];

      uint64_t v23 = [v20 mobileAsset];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_2;
      v73[3] = &unk_1E6BB9EF8;
      id v65 = v22;
      id v74 = v65;
      [v23 enumerateObjectsUsingBlock:v73];

      id v24 = [v14 selectedNamespace];
      LODWORD(v22) = [v24 hasName];

      if (v22)
      {
        id v25 = [v14 selectedNamespace];
        BOOL v26 = [v25 name];
        v66 = +[TRIClientFactorPackUtils aliasesInNamespace:v26];
      }
      else
      {
        id v25 = TRILogCategory_Server();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          long long v45 = [v14 factorPackId];
          LODWORD(v85) = 138543362;
          *(void *)((char *)&v85 + 4) = v45;
          _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", (uint8_t *)&v85, 0xCu);
        }
        v66 = 0;
      }

      uint64_t v27 = [v14 selectedNamespace];
      uint64_t v28 = [v27 name];
      uint64_t v29 = [(TRIFactorPackStorage *)v64 pathForFactorPackWithId:v68 namespaceName:v28];

      uint64_t v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v31 = [v29 stringByAppendingPathComponent:@"factorPack.fb"];
      if (v31)
      {
        int v32 = [v30 fileExistsAtPath:v31];
        if (v29) {
          goto LABEL_23;
        }
      }
      else
      {
        int v32 = 0;
        if (v29)
        {
LABEL_23:
          context = (void *)MEMORY[0x1E016E7F0]();
          uint64_t v33 = [v54 keyValueStore];
          v34 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v33];

          uint64_t v35 = [v14 selectedNamespace];
          uint64_t v36 = [v35 name];
          uint64_t v37 = [v34 subscribedFactorsForNamespaceName:v36];

          *(void *)&long long v85 = 0;
          *((void *)&v85 + 1) = &v85;
          uint64_t v86 = 0x3032000000;
          v87 = __Block_byref_object_copy__32;
          id v88 = __Block_byref_object_dispose__32;
          id v89 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_423;
          v69[3] = &unk_1E6BBC2B0;
          id v38 = v66;
          id v70 = v38;
          id v39 = v37;
          id v71 = v39;
          uint64_t v72 = &v85;
          [v14 enumerateFactorLevelsWithBlock:v69];
          uint64_t v40 = [v14 selectedNamespace];
          id v41 = [v40 name];
          [(TRIFactorPackStorage *)v64 updateSavedFactorPackWithId:v68 namespaceName:v41 populatingAssetsForFactorNames:*(void *)(*((void *)&v85 + 1) + 40) aliasToUnaliasMap:v38];

          if ((v32 & v55) == 1)
          {
            __int16 v42 = [v14 selectedNamespace];
            uint64_t v43 = [v42 name];
            [(TRIFBFactorPackStorage *)v52 updateSavedFactorLevelsWithFactorPackId:v68 namespaceName:v43 populatingAssetsForFactorNames:*(void *)(*((void *)&v85 + 1) + 40) aliasToUnaliasMap:v38];
          }
          uint64_t v44 = TRILogCategory_Server();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            SEL v82 = v68;
            __int16 v83 = 2114;
            id v84 = v29;
            _os_log_impl(&dword_1DA291000, v44, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ is already on disk (path: %{public}@), updating on-demand assets", buf, 0x16u);
          }

          _Block_object_dispose(&v85, 8);
          goto LABEL_32;
        }
      }
      if (![(TRIFactorPackStorage *)v64 saveFactorPack:v14 populatingAssetsForFactorNames:v65 aliasToUnaliasMap:v66 factorPackByNamePath:0 factorPackByIdPath:0]|| v55&& ![(TRIFBFactorPackStorage *)v52 saveFactorLevelsForFactorPack:v14 populatingAssetsForFactorNames:v65 aliasToUnaliasMap:v66 factorLevelsByNamePath:0 factorLevelsByIdPath:0])
      {
        [(TRIFetchFactorPackSetTask *)self _addMetricForFetchFactorPackSetTaskError:16];

        goto LABEL_38;
      }
LABEL_32:

      uint64_t v12 = v62 + 1;
    }
    while (v60 != v62 + 1);
    uint64_t v60 = [(TRIFactorPackSetStorage *)obj countByEnumeratingWithState:&v77 objects:v90 count:16];
    if (v60) {
      continue;
    }
    break;
  }
LABEL_34:

  uint64_t v47 = [TRIFactorPackSetStorage alloc];
  v48 = [v54 paths];
  id obj = [(TRIFactorPackSetStorage *)v47 initWithPaths:v48];

  if ([(TRIFactorPackSetStorage *)obj saveFactorPackSet:v51])
  {
    BOOL v49 = 1;
  }
  else
  {
    [(TRIFetchFactorPackSetTask *)self _addMetricForFetchFactorPackSetTaskError:16];
LABEL_38:
    BOOL v49 = 0;
  }

  return v49;
}

void __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 factorName];
  [v2 addObject:v3];
}

void __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 factorName];
  [v2 addObject:v3];
}

void __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_423(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([v12 hasLevel])
  {
    id v3 = [v12 level];
    int v4 = [v3 isFactorOnDemand];

    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      char v6 = [v12 factor];
      id v7 = [v6 name];
      id v8 = [v5 objectForKeyedSubscript:v7];
      id v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        int v11 = [v12 factor];
        id v10 = [v11 name];
      }
      if ([*(id *)(a1 + 40) containsObject:v10]) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
      }
    }
  }
}

- (BOOL)incompatibleNamespaceNameForBMLT:(id)a3 namespaceDescriptorProvider:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E016E7F0]();
  id v8 = [v5 selectedNamespace];
  id v9 = [v8 name];
  id v10 = [v6 descriptorWithNamespaceName:v9];

  if (v10)
  {
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    int v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "compatibilityVersionArray_Count"));
    id v12 = [v8 compatibilityVersionArray];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __90__TRIFetchFactorPackSetTask_incompatibleNamespaceNameForBMLT_namespaceDescriptorProvider___block_invoke;
    v28[3] = &unk_1E6BBC0D0;
    id v13 = v10;
    id v29 = v13;
    uint64_t v31 = &v32;
    id v14 = v11;
    id v30 = v14;
    [v12 enumerateValuesWithBlock:v28];

    BOOL v15 = *((unsigned char *)v33 + 24) != 0;
    if (!*((unsigned char *)v33 + 24))
    {
      id v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v26 = [v5 taskId];
        int v17 = [v5 deploymentId];
        id v27 = [v14 componentsJoinedByString:@","];
        id v25 = [v8 name];
        int v24 = [v13 downloadNCV];
        id v18 = [v5 taskId];
        *(_DWORD *)buf = 138544642;
        uint64_t v37 = v26;
        __int16 v38 = 1024;
        int v39 = v17;
        __int16 v40 = 2114;
        id v41 = v27;
        __int16 v42 = 2114;
        uint64_t v43 = v25;
        __int16 v44 = 1024;
        int v45 = v24;
        __int16 v46 = 2114;
        uint64_t v47 = v18;
        _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@.%u supports namespace compatibility versions {%{public}@} for namespace \"%{public}@\", but the namespace descriptor declares download compatibility with version %u. (This is unlikely to be an issue, unless you're REALLY sure BMLT %{public}@ should be available on this device.)", buf, 0x36u);
      }
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    uint64_t v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v5 taskId];
      int v21 = [v5 deploymentId];
      id v22 = [v8 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v20;
      __int16 v38 = 1024;
      int v39 = v21;
      __int16 v40 = 2114;
      id v41 = v22;
      _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "Note: BMLT %{public}@.%u involves namespace %{public}@ but it is not registered with Trial. Factor packs for this namespace shall not be downloaded.", buf, 0x1Cu);
    }
    BOOL v15 = 0;
  }

  return v15;
}

void __90__TRIFetchFactorPackSetTask_incompatibleNamespaceNameForBMLT_namespaceDescriptorProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) downloadNCV] == a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  int v4 = *(void **)(a1 + 40);
  id v5 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", a2);
  [v4 addObject:v5];
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  v390[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v296 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  v317 = v7;
  v297 = (void *)os_transaction_create();
  v369[0] = MEMORY[0x1E4F143A8];
  v369[1] = 3221225472;
  v369[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke;
  v369[3] = &unk_1E6BB82A8;
  v369[4] = v7;
  id v316 = v6;
  id v370 = v316;
  v298 = (void (**)(void))MEMORY[0x1E016EA80](v369);
  id v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v82 = (id)objc_opt_class();
    factorPackSetId = v317->_factorPackSetId;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v82;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = factorPackSetId;
    _os_log_debug_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEBUG, "starting %{public}@ with factor pack set id %{public}@", buf, 0x16u);
  }
  unint64_t construct = v317->_construct;
  if (construct != 2)
  {
    if (construct != 1)
    {
      if (!construct)
      {
        id v10 = [v316 rolloutDatabase];
        int v11 = [v10 recordWithDeployment:v317->_rolloutDeployment usingTransaction:0];

        if (!v11)
        {
          id v12 = TRILogCategory_Server();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v60 = [(TRIRolloutDeployment *)v317->_rolloutDeployment shortDesc];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v60;
            _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Warning: record for Rollout deployment %{public}@ not available; issuing incomplete telemetry.",
              buf,
              0xCu);
          }
LABEL_42:

          v61 = [TRIFactorPackSetStorage alloc];
          uint64_t v62 = [v316 paths];
          uint64_t v33 = [(TRIFactorPackSetStorage *)v61 initWithPaths:v62];

          *(void *)v384 = 0;
          if ([(TRIFactorPackSetStorage *)v33 hasFactorPackSetWithId:v317->_factorPackSetId path:v384])
          {
            v63 = [v316 namespaceDatabase];
            id v64 = [v316 paths];
            id v65 = [v64 namespaceDescriptorsDefaultDir];
            v66 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v63 defaultDescriptorDirectoryPath:v65];

            if (v11)
            {
              id v67 = [(TRIFactorPackSetStorage *)v11 artifact];
              v68 = [v67 rollout];
              SEL v69 = +[TRISetupAssistantFetchUtils getIncompatibleNamespaceNamesForTriClientRollout:v68 namespaceDescriptorProvider:v66];

              uint64_t v70 = [v69 count];
              id v71 = objc_opt_new();
              uint64_t v72 = v317->_factorPackSetId;
              v366[0] = MEMORY[0x1E4F143A8];
              v366[1] = 3221225472;
              v366[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_441;
              v366[3] = &unk_1E6BB9BC0;
              SEL v368 = a2;
              v366[4] = v317;
              id v73 = v71;
              id v367 = v73;
              [(TRIFactorPackSetStorage *)v33 enumerateCompatibleFactorPacksForFactorPackSet:v72 usingLegacyPaths:0 withBlock:v366];
              id v74 = [(TRIFactorPackSetStorage *)v11 artifact];
              char v75 = [v74 rollout];
              uint64_t v76 = objc_msgSend(v75, "selectedNamespaceArray_Count");
              BOOL v78 = v76 != [v73 count] && v70 == 0;

              if (v78)
              {
                long long v79 = TRILogCategory_Server();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  long long v80 = v317->_factorPackSetId;
                  *(_DWORD *)buf = 138543362;
                  *(void *)&uint8_t buf[4] = v80;
                  _os_log_impl(&dword_1DA291000, v79, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ contains ineligible factor pack. Re-fetching factor pack to find replacement.", buf, 0xCu);
                }

                int v81 = 1;
              }
              else
              {
                id v90 = TRILogCategory_Server();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v91 = v317->_factorPackSetId;
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v91;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = *(void *)v384;
                  _os_log_impl(&dword_1DA291000, v90, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
                    buf,
                    0x16u);
                }

                id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:2 reportResultToServer:0 earliestRetryDate:0];
                int v81 = 0;
              }

              if (v78) {
                goto LABEL_76;
              }
            }
            else
            {
              uint64_t v86 = TRILogCategory_Server();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
              {
                v274 = v317->_factorPackSetId;
                v275 = [(TRIRolloutDeployment *)v317->_rolloutDeployment shortDesc];
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v274;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v275;
                _os_log_error_impl(&dword_1DA291000, v86, OS_LOG_TYPE_ERROR, "Unable to update preexisting factor pack set %{public}@ for %{public}@: record not found in database.", buf, 0x16u);
              }
              [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:29];
              [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:0 serverContext:v316];
              id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:3 reportResultToServer:1 earliestRetryDate:0];
            }
            goto LABEL_326;
          }
          int v81 = 0;
LABEL_76:

          v295 = [(TRIFactorPackSetStorage *)v11 namespaces];
          if (v11)
          {
            [MEMORY[0x1E4FB00D0] immediateDownloadNotificationKeyForNamespaceNames:v295];
            BOOL v287 = v81 != 0;
            id v299 = (id)objc_claimAutoreleasedReturnValue();

            v291 = 0;
            v305 = 0;
          }
          else
          {
            id v299 = 0;
            v291 = 0;
            v305 = 0;
            int v11 = 0;
            BOOL v287 = v81 != 0;
          }
LABEL_93:
          v307 = [(TRITaskAttributing *)v317->_taskAttribution applicationBundleIdentifier];
          v292 = v11;
          SEL v101 = [v316 keyValueStore];
          v102 = +[TRIFetchDateManager managerWithKeyValueStore:v101];

          id v103 = [v316 namespaceDatabase];
          id v104 = [v316 paths];
          v105 = [v104 namespaceDescriptorsDefaultDir];
          v106 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v103 defaultDescriptorDirectoryPath:v105];

          uint64_t v107 = [(TRITaskAttributing *)v317->_taskAttribution triCloudKitContainer];
          v108 = [(TRITaskAttributing *)v317->_taskAttribution teamIdentifier];
          v300 = +[TRICKNativeArtifactProvider providerForContainer:v107 teamId:v108 bundleId:v307 dateProvider:v102 namespaceDescriptorProvider:v106 serverContext:v316];

          v311 = [(TRITaskAttributing *)v317->_taskAttribution networkOptions];
          v301 = [(TRIBaseTask *)v317 stateProvider];
          if ([v311 discretionaryBehavior])
          {
            SEL v109 = [v301 activeActivityGrantingCapability:16];
            if (!v109)
            {
              v208 = TRILogCategory_Server();
              if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DA291000, v208, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
              }

              [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:3];
              [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v316];
              id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:1 reportResultToServer:1 earliestRetryDate:0];
              goto LABEL_325;
            }
            [v311 setActivity:v109];
          }
          id v359 = 0;
          v358 = 0;
          uint64_t v110 = [(TRIFetchFactorPackSetTask *)v317 _downloadSetArtifactWithProvider:v300 downloadOptions:v311 downloadNotificationKey:v299 errorResult:&v359 setArtifactFetchError:&v358];
          if ([v359 runStatus] != 2)
          {
            v317->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:v358];
            if (v358)
            {
              v111 = TRIFetchErrorParseToMetrics(v358);
              if ([v111 count]
                && (v317->_rolloutSupport || v317->_bmltSupport || v317->_experimentSupport))
              {
                v314 = v110;
                long long v357 = 0u;
                long long v355 = 0u;
                long long v356 = 0u;
                long long v354 = 0u;
                id v112 = v111;
                uint64_t v113 = [v112 countByEnumeratingWithState:&v354 objects:v389 count:16];
                if (!v113) {
                  goto LABEL_117;
                }
                uint64_t v114 = *(void *)v355;
                while (1)
                {
                  for (uint64_t i = 0; i != v113; ++i)
                  {
                    if (*(void *)v355 != v114) {
                      objc_enumerationMutation(v112);
                    }
                    uint64_t v116 = *(void *)(*((void *)&v354 + 1) + 8 * i);
                    unint64_t v117 = v317->_construct;
                    p_rolloutSupport = (id *)&v317->_rolloutSupport;
                    switch(v117)
                    {
                      case 0uLL:
                        goto LABEL_114;
                      case 1uLL:
                        v120 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_113:
                        p_rolloutSupport = (id *)((char *)&v317->super.super.isa + *v120);
LABEL_114:
                        [*p_rolloutSupport addMetric:v116];
                        continue;
                      case 2uLL:
                        int v119 = _os_feature_enabled_impl();
                        v120 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                        if (v119) {
                          goto LABEL_113;
                        }
                        break;
                    }
                  }
                  uint64_t v113 = [v112 countByEnumeratingWithState:&v354 objects:v389 count:16];
                  if (!v113)
                  {
LABEL_117:

                    uint64_t v110 = v314;
                    break;
                  }
                }
              }
            }
          }
          if (!v110)
          {
            -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v317, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", [v359 runStatus] == 2, v305, v316);
            if ([v359 runStatus] == 3) {
              [(TRIFetchFactorPackSetTask *)v317 _recordExperimentFetchFailedWithReason:@"FactorPackNotFound" context:v316];
            }
            id v304 = v359;
            if (!v304)
            {
              v294 = [MEMORY[0x1E4F28B00] currentHandler];
              [v294 handleFailureInMethod:a2, v317, @"TRIFetchFactorPackSetTask.m", 1265, @"Expression was unexpectedly nil/false: %@", @"taskResult" object file lineNumber description];
              id v304 = 0;
            }
            goto LABEL_324;
          }
          v315 = objc_opt_new();
          for (unint64_t j = 0; ; ++j)
          {
            v122 = [v110 packs];
            BOOL v123 = j < [v122 count];

            if (!v123) {
              break;
            }
            v124 = (void *)MEMORY[0x1E016E7F0]();
            v125 = [v110 packs];
            v126 = [v125 objectAtIndexedSubscript:j];

            if (([v126 hasFactorPackId] & 1) == 0)
            {
              v147 = [MEMORY[0x1E4F28B00] currentHandler];
              v148 = [v110 ident];
              [v147 handleFailureInMethod:a2, v317, @"TRIFetchFactorPackSetTask.m", 1274, @"Factor pack set %@ has factor pack with missing id", v148 object file lineNumber description];
            }
            v127 = [v126 selectedNamespace];
            char v128 = [v127 hasName];

            if ((v128 & 1) == 0)
            {
              v149 = [MEMORY[0x1E4F28B00] currentHandler];
              v150 = [v126 factorPackId];
              [v149 handleFailureInMethod:a2, v317, @"TRIFetchFactorPackSetTask.m", 1275, @"No namespace name on factor pack %@", v150 object file lineNumber description];
            }
            v129 = (void *)MEMORY[0x1E4FB01A0];
            v130 = [v126 selectedNamespace];
            v131 = [v130 name];
            v132 = [v316 paths];
            v133 = [v132 namespaceDescriptorsDefaultDir];
            v134 = [v129 loadWithNamespaceName:v131 fromDirectory:v133];

            if (v134)
            {
              *(void *)buf = 0;
              *(void *)&uint8_t buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              LOBYTE(v376) = 0;
              v135 = [v126 selectedNamespace];
              v136 = [v135 compatibilityVersionArray];
              v351[0] = MEMORY[0x1E4F143A8];
              v351[1] = 3221225472;
              v351[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_464;
              v351[3] = &unk_1E6BBC378;
              id v137 = v134;
              id v352 = v137;
              v353 = buf;
              [v136 enumerateValuesWithBlock:v351];

              if (!*(unsigned char *)(*(void *)&buf[8] + 24))
              {
                v138 = TRILogCategory_Server();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                {
                  v139 = [v126 factorPackId];
                  v140 = [v126 selectedNamespace];
                  v141 = [v140 name];
                  int v142 = [v137 downloadNCV];
                  *(_DWORD *)v384 = 138543874;
                  *(void *)&v384[4] = v139;
                  __int16 v385 = 2114;
                  v386 = v141;
                  __int16 v387 = 1024;
                  int v388 = v142;
                  _os_log_impl(&dword_1DA291000, v138, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ does not declare compatibility with NCV (%{public}@, %u); will be omitted from installation.",
                    v384,
                    0x1Cu);
                }
                [v315 addIndex:j];
              }

              _Block_object_dispose(buf, 8);
            }
            else
            {
              v143 = TRILogCategory_Server();
              if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
              {
                v144 = [v126 selectedNamespace];
                v145 = [v144 name];
                v146 = [v110 ident];
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v145;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v146;
                _os_log_impl(&dword_1DA291000, v143, OS_LOG_TYPE_DEFAULT, "Could not load namespace descriptor for namespace %{public}@ found in factor pack set %{public}@. Skipping download of factor pack for that namespace.", buf, 0x16u);
              }
              [v315 addIndex:j];
            }
          }
          v151 = [v110 packs];
          v152 = (void *)[v151 mutableCopy];

          [v152 removeObjectsAtIndexes:v315];
          v293 = (void *)[v110 copyWithReplacementPacks:v152];

          v290 = [(TRIFetchFactorPackSetTask *)v317 _requiredAssetsForFactorPackSet:v293 context:v316];
          if (!v290)
          {
            [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:5];
            [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v316];
            [(TRIFetchFactorPackSetTask *)v317 _recordExperimentFetchFailedWithTaskError:5 context:v316];
            id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:3 reportResultToServer:1 earliestRetryDate:0];
LABEL_323:

LABEL_324:
LABEL_325:

            uint64_t v33 = v292;
            int v11 = v295;
            goto LABEL_326;
          }
          v289 = -[TRIFetchFactorPackSetTask _uniqueUninstalledAssets:](v317, "_uniqueUninstalledAssets:");
          v153 = TRILogCategory_Server();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
          {
            v154 = [v293 ident];
            v155 = [v289 cloudKit];
            uint64_t v156 = [v155 count];
            v157 = [v289 mobileAsset];
            uint64_t v158 = [v157 count];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v154;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v158 + v156;
            _os_log_impl(&dword_1DA291000, v153, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ references %tu assets which are required for enrollment and are not already on disk.", buf, 0x16u);
          }
          uint64_t v159 = [(TRIFetchFactorPackSetTask *)v317 _subscribedOnDemandFactorsForAssets:v290 factorPackSet:v293 context:v316];
          factorRecordsByAssetId = v317->_factorRecordsByAssetId;
          v317->_factorRecordsByAssetId = (NSDictionary *)v159;

          guardedDownloadableRecord = v317->_guardedDownloadableRecord;
          v350[0] = MEMORY[0x1E4F143A8];
          v350[1] = 3221225472;
          v350[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_465;
          v350[3] = &unk_1E6BBC148;
          v350[4] = v317;
          [(_PASLock *)guardedDownloadableRecord runWithLockAcquired:v350];
          v302 = [v301 activeActivityDescriptorGrantingCapability:1];

          uint64_t v162 = [v311 discretionaryBehavior];
          if (v317->_experimentDeployment) {
            BOOL v163 = v162 == 0;
          }
          else {
            BOOL v163 = 0;
          }
          int v164 = !v163;
          int v312 = v164;
          long long v346 = 0u;
          long long v347 = 0u;
          long long v348 = 0u;
          long long v349 = 0u;
          v165 = [v293 packs];
          uint64_t v166 = [(TRIFetchOptions *)v165 countByEnumeratingWithState:&v346 objects:v383 count:16];
          id obj = v165;
          uint64_t v167 = 0;
          if (v166)
          {
            uint64_t v308 = *(void *)v347;
            do
            {
              uint64_t v168 = 0;
              do
              {
                if (*(void *)v347 != v308) {
                  objc_enumerationMutation(obj);
                }
                v169 = *(void **)(*((void *)&v346 + 1) + 8 * v168);
                v170 = (void *)MEMORY[0x1E016E7F0]();
                v171 = (void *)MEMORY[0x1E4FB01A0];
                v172 = [v169 selectedNamespace];
                v173 = [v172 name];
                v174 = [v316 paths];
                v175 = [v174 namespaceDescriptorsDefaultDir];
                v176 = [v171 loadWithNamespaceName:v173 fromDirectory:v175];

                int v177 = [v176 purgeabilityLevel];
                if ((int)v167 <= v177) {
                  uint64_t v167 = v177;
                }
                else {
                  uint64_t v167 = v167;
                }
                if (!v312
                  || ((int v178 = [v311 allowsCellularAccess], !v302) ? (v179 = v178) : (v179 = 0),
                      v179 != 1
                   || v307
                   && [v307 length]
                   && ([v176 expensiveNetworkingAllowed] & 1) != 0))
                {
                  int v180 = 1;
                }
                else
                {
                  unint64_t v181 = v317->_construct;
                  if (v181)
                  {
                    if (v181 == 1)
                    {
                      v182 = [(TRIBMLTDeployment *)v317->_bmltDeployment backgroundMLTaskId];
                      v183 = @"BMLT";
                    }
                    else if (v181 == 2 && _os_feature_enabled_impl())
                    {
                      v182 = [(TRIExperimentDeployment *)v317->_experimentDeployment experimentId];
                      v183 = @"Experiment";
                    }
                    else
                    {
                      v183 = 0;
                      v182 = 0;
                    }
                  }
                  else
                  {
                    v182 = [(TRIRolloutDeployment *)v317->_rolloutDeployment rolloutId];
                    v183 = @"Rollout";
                  }
                  v184 = TRILogCategory_Server();
                  if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
                  {
                    v185 = v317->_factorPackSetId;
                    v186 = [(TRIFactorPackSetStorage *)v295 firstObject];
                    int v187 = [v176 expensiveNetworkingAllowed];
                    *(_DWORD *)buf = 138413570;
                    v188 = @"NO";
                    if (v187) {
                      v188 = @"YES";
                    }
                    *(void *)&uint8_t buf[4] = v185;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v186;
                    *(_WORD *)&buf[22] = 2112;
                    v376 = v183;
                    __int16 v377 = 2112;
                    v378 = v182;
                    __int16 v379 = 2112;
                    v380 = v307;
                    __int16 v381 = 2112;
                    v382 = v188;
                    _os_log_error_impl(&dword_1DA291000, v184, OS_LOG_TYPE_ERROR, "preventing fetch of factor pack set %@ on cellular for namespace %@ of %@ %@, resourceAttributionBundleIdentifier: %@ expensiveNetworkingAllowed: %@", buf, 0x3Eu);
                  }
                  [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:23];
                  [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v316];
                  id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:1 reportResultToServer:0 earliestRetryDate:0];

                  int v180 = 0;
                }

                if (!v180) {
                  goto LABEL_322;
                }
                ++v168;
              }
              while (v166 != v168);
              uint64_t v189 = [(TRIFetchOptions *)obj countByEnumeratingWithState:&v346 objects:v383 count:16];
              uint64_t v166 = v189;
            }
            while (v189);
          }

          uint64_t v190 = [MEMORY[0x1E4FB0210] availableSpaceClassFromPurgeabilityLevel:v167];
          v191 = [TRIFetchOptions alloc];
          unint64_t v192 = 0x1E4F28000uLL;
          v193 = [NSNumber numberWithUnsignedInt:v190];
          id obj = [(TRIFetchOptions *)v191 initWithDownloadOptions:v311 cacheDeleteAvailableSpaceClass:v193];

          v194 = objc_opt_new();
          v195 = [v289 cloudKit];
          v344[0] = MEMORY[0x1E4F143A8];
          v344[1] = 3221225472;
          v344[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_482;
          v344[3] = &unk_1E6BBC1E8;
          id v196 = v194;
          id v345 = v196;
          [v195 enumerateKeysAndObjectsUsingBlock:v344];

          *(void *)v384 = 0;
          v343 = 0;
          uint64_t v342 = 0;
          v197 = [v289 cloudKit];
          v198 = [v316 paths];
          v340[0] = MEMORY[0x1E4F143A8];
          v340[1] = 3221225472;
          v340[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_484;
          v340[3] = &unk_1E6BBC3A0;
          v340[4] = v317;
          id v341 = v316;
          v338[0] = MEMORY[0x1E4F143A8];
          v338[1] = 3221225472;
          v338[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_3;
          v338[3] = &unk_1E6BBC3C8;
          v338[4] = v317;
          id v313 = v341;
          id v339 = v313;
          v199 = +[TRIDiffableAssetBuilder buildAndSaveDiffableAssetsWithAssetIds:v196 metadataForAssetId:v197 artifactProvider:v300 options:obj paths:v198 assetsDownloadSize:&v342 perAssetIdCompletionBlockOnSuccess:v340 perAssetIdCompletionBlockOnError:v338 retryAfter:v384 error:&v343];

          if (v199)
          {
            if ([v199 count])
            {
              v200 = TRILogCategory_Server();
              if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v201 = [v199 count];
                v202 = [v289 cloudKit];
                uint64_t v203 = [v202 count];
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v201;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v203;
                _os_log_impl(&dword_1DA291000, v200, OS_LOG_TYPE_DEFAULT, "%tu of %tu required assets are being handled by patching preexisting assets.", buf, 0x16u);
              }
            }
            v204 = [v289 cloudKit];
            v205 = (void *)[v204 mutableCopy];

            v336[0] = MEMORY[0x1E4F143A8];
            v336[1] = 3221225472;
            v336[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_487;
            v336[3] = &unk_1E6BBC3F0;
            id v206 = v205;
            id v337 = v206;
            [v199 enumerateObjectsUsingBlock:v336];
            uint64_t v207 = [v289 copyWithReplacementCloudKit:v206];

            v289 = (void *)v207;
LABEL_220:

            if (v199)
            {
              v219 = [(TRIFetchOptions *)obj downloadOptions];
              v220 = [v219 activity];

              if (v220 && xpc_activity_should_defer((xpc_activity_t)v220))
              {
                v221 = TRILogCategory_Server();
                if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1DA291000, v221, OS_LOG_TYPE_DEFAULT, "XPC activity was deferred before asset download.", buf, 2u);
                }

                [(TRIFetchFactorPackSetTask *)v317 setWasDeferred:1];
                [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:1];
                [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v313];
                id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:1 reportResultToServer:1 earliestRetryDate:0];

                goto LABEL_322;
              }

              *(void *)buf = 0;
              *(void *)&uint8_t buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              v376 = 0;
              v222 = [v289 cloudKit];
              v331[0] = MEMORY[0x1E4F143A8];
              v331[1] = 3221225472;
              v331[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_489;
              v331[3] = &unk_1E6BBC418;
              v331[4] = buf;
              [v222 enumerateKeysAndObjectsUsingBlock:v331];

              v223 = [v289 mobileAsset];
              v330[0] = MEMORY[0x1E4F143A8];
              v330[1] = 3221225472;
              v330[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_490;
              v330[3] = &unk_1E6BBC440;
              v330[4] = buf;
              [v223 enumerateKeysAndObjectsUsingBlock:v330];

              if (+[TRICacheDeleteUtils hasSufficientDiskSpaceForDownload:*(void *)(*(void *)&buf[8] + 24)])
              {
                _Block_object_dispose(buf, 8);
                *(void *)v384 = 0;
                v343 = 0;
                v224 = [v289 cloudKit];
                BOOL v309 = [(TRIFetchFactorPackSetTask *)v317 _downloadAndSaveCKAssetsWithMetadata:v224 artifactProvider:v300 options:obj downloadNotificationKey:v299 context:v313 assetsDownloadSize:&v343 errorResult:&v359 fetchError:v384];

                if ([v359 runStatus] != 2 && *(void *)v384)
                {
                  v225 = TRIFetchErrorParseToMetrics(*(void **)v384);
                  if ([v225 count]
                    && (v317->_rolloutSupport || v317->_bmltSupport || v317->_experimentSupport))
                  {
                    long long v328 = 0u;
                    long long v329 = 0u;
                    long long v326 = 0u;
                    long long v327 = 0u;
                    id v226 = v225;
                    uint64_t v227 = [v226 countByEnumeratingWithState:&v326 objects:v373 count:16];
                    if (!v227) {
                      goto LABEL_248;
                    }
                    uint64_t v228 = *(void *)v327;
                    while (1)
                    {
                      for (uint64_t k = 0; k != v227; ++k)
                      {
                        if (*(void *)v327 != v228) {
                          objc_enumerationMutation(v226);
                        }
                        uint64_t v230 = *(void *)(*((void *)&v326 + 1) + 8 * k);
                        unint64_t v231 = v317->_construct;
                        v232 = (id *)&v317->_rolloutSupport;
                        switch(v231)
                        {
                          case 0uLL:
                            goto LABEL_245;
                          case 1uLL:
                            v234 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_244:
                            v232 = (id *)((char *)&v317->super.super.isa + *v234);
LABEL_245:
                            [*v232 addMetric:v230];
                            continue;
                          case 2uLL:
                            int v233 = _os_feature_enabled_impl();
                            v234 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                            if (v233) {
                              goto LABEL_244;
                            }
                            break;
                        }
                      }
                      uint64_t v227 = [v226 countByEnumeratingWithState:&v326 objects:v373 count:16];
                      if (!v227)
                      {
LABEL_248:

                        unint64_t v192 = 0x1E4F28000;
                        break;
                      }
                    }
                  }
                }
                if (v309)
                {
                  v235 = *(void **)v384;
                  *(void *)v384 = 0;

                  v343 = 0;
                  v236 = [v289 mobileAsset];
                  BOOL v310 = [(TRIFetchFactorPackSetTask *)v317 _downloadAndSaveMAAssets:v236 options:obj downloadNotificationKey:v299 context:v313 assetsDownloadSize:&v343 errorResult:&v359 fetchError:v384];

                  if ([v359 runStatus] != 2 && *(void *)v384)
                  {
                    v237 = TRIFetchErrorParseToMetrics(*(void **)v384);
                    if ([v237 count] && (v317->_rolloutSupport || v317->_bmltSupport))
                    {
                      long long v324 = 0u;
                      long long v325 = 0u;
                      long long v322 = 0u;
                      long long v323 = 0u;
                      id v238 = v237;
                      uint64_t v239 = [v238 countByEnumeratingWithState:&v322 objects:v372 count:16];
                      if (!v239) {
                        goto LABEL_271;
                      }
                      uint64_t v240 = *(void *)v323;
                      while (1)
                      {
                        for (uint64_t m = 0; m != v239; ++m)
                        {
                          if (*(void *)v323 != v240) {
                            objc_enumerationMutation(v238);
                          }
                          uint64_t v242 = *(void *)(*((void *)&v322 + 1) + 8 * m);
                          unint64_t v243 = v317->_construct;
                          v244 = (id *)&v317->_rolloutSupport;
                          switch(v243)
                          {
                            case 0uLL:
                              goto LABEL_268;
                            case 1uLL:
                              v246 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_267:
                              v244 = (id *)((char *)&v317->super.super.isa + *v246);
LABEL_268:
                              [*v244 addMetric:v242];
                              continue;
                            case 2uLL:
                              int v245 = _os_feature_enabled_impl();
                              v246 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                              if (v245) {
                                goto LABEL_267;
                              }
                              break;
                          }
                        }
                        uint64_t v239 = [v238 countByEnumeratingWithState:&v322 objects:v372 count:16];
                        if (!v239)
                        {
LABEL_271:

                          unint64_t v192 = 0x1E4F28000uLL;
                          break;
                        }
                      }
                    }
                  }
                  if (v310)
                  {
                    v247 = v292;
                    uint64_t v248 = [(TRIFetchFactorPackSetTask *)v317 _saveFactorPackSet:v293 requiredAssetMap:v290 context:v313];
                    if (v248)
                    {
                      if (v317->_experimentDeployment)
                      {
                        if (v317->_treatmentId)
                        {
                          v249 = [v313 experimentDatabase];
                          char v250 = [v249 setTreatmentId:v317->_treatmentId factorPackSetId:v317->_factorPackSetId forExperimentDeployment:v317->_experimentDeployment usingTransaction:0];

                          v247 = v292;
                          if ((v250 & 1) == 0)
                          {
                            v282 = TRILogCategory_Server();
                            if (os_log_type_enabled(v282, OS_LOG_TYPE_ERROR))
                            {
                              treatmentId = v317->_treatmentId;
                              v284 = [(TRIExperimentDeployment *)v317->_experimentDeployment experimentId];
                              *(_DWORD *)buf = 138412546;
                              *(void *)&uint8_t buf[4] = treatmentId;
                              *(_WORD *)&buf[12] = 2114;
                              *(void *)&buf[14] = v284;
                              _os_log_error_impl(&dword_1DA291000, v282, OS_LOG_TYPE_ERROR, "failed to save treatment id %@ to database for experiment %{public}@", buf, 0x16u);
                            }
                            id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:1 reportResultToServer:0 earliestRetryDate:0];
                            goto LABEL_321;
                          }
                        }
                      }
                      if (v287)
                      {
                        long long v320 = 0u;
                        long long v321 = 0u;
                        long long v318 = 0u;
                        long long v319 = 0u;
                        v251 = v295;
                        uint64_t v252 = [(TRIFactorPackSetStorage *)v251 countByEnumeratingWithState:&v318 objects:v371 count:16];
                        if (v252)
                        {
                          uint64_t v253 = *(void *)v319;
                          do
                          {
                            for (uint64_t n = 0; n != v252; ++n)
                            {
                              if (*(void *)v319 != v253) {
                                objc_enumerationMutation(v251);
                              }
                              uint64_t v255 = *(void *)(*((void *)&v318 + 1) + 8 * n);
                              v256 = TRILogCategory_Server();
                              if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138543362;
                                *(void *)&uint8_t buf[4] = v255;
                                _os_log_impl(&dword_1DA291000, v256, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@", buf, 0xCu);
                              }

                              [MEMORY[0x1E4FB01E8] notifyUpdateForNamespaceName:v255];
                            }
                            uint64_t v252 = [(TRIFactorPackSetStorage *)v251 countByEnumeratingWithState:&v318 objects:v371 count:16];
                          }
                          while (v252);
                        }

                        v247 = v292;
                      }
                    }
                    [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:v248 bmltRecord:v305 serverContext:v313];
                    if (v248) {
                      uint64_t v257 = 2;
                    }
                    else {
                      uint64_t v257 = 3;
                    }
                    if (v247) {
                      int v258 = v248;
                    }
                    else {
                      int v258 = 0;
                    }
                    if (v258 == 1)
                    {
                      v259 = [(TRIFactorPackSetStorage *)v247 deployment];
                      v260 = [v259 rolloutId];
                      v261 = [(TRIFactorPackSetStorage *)v292 rampId];
                      v262 = [(TRIFactorPackSetStorage *)v292 deployment];
                      LOBYTE(v286) = 0;
                      +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 2, v260, v261, [v262 deploymentId], v317->_factorPackSetId, 0, 0, v292, v286, v313);
                    }
                    else
                    {
                      if ((v248 & 1) != 0 || !v292) {
                        goto LABEL_311;
                      }
                      v259 = [(TRIFactorPackSetStorage *)v292 deployment];
                      v260 = [v259 rolloutId];
                      v261 = [(TRIFactorPackSetStorage *)v292 rampId];
                      v262 = [(TRIFactorPackSetStorage *)v292 deployment];
                      LOBYTE(v286) = 0;
                      +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 6, v260, v261, [v262 deploymentId], v317->_factorPackSetId, 0, 0, v292, v286, v313);
                    }

LABEL_311:
                    if (_os_feature_enabled_impl())
                    {
                      if (v291) {
                        int v276 = v248;
                      }
                      else {
                        int v276 = 0;
                      }
                      if (v276 == 1)
                      {
                        v277 = [(TRIFactorPackSetStorage *)v291 experimentDeployment];
                        v278 = [v277 experimentId];
                        v279 = [(TRIFactorPackSetStorage *)v291 treatmentId];
                        v280 = [(TRIFactorPackSetStorage *)v291 experimentDeployment];
                        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 4, v278, v279, [v280 deploymentId], v291, 0, v313);
                      }
                      else if ((v248 & 1) == 0 && v291)
                      {
                        [(TRIFetchFactorPackSetTask *)v317 _recordExperimentFetchFailedWithReason:@"FailedToSaveFactorPack" context:v313];
                      }
                    }
                    id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:v257 reportResultToServer:1 earliestRetryDate:0];
                    goto LABEL_321;
                  }
                  [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v313];
                  if ([v359 runStatus] == 3)
                  {
                    id v266 = [NSString alloc];
                    v267 = [*(id *)v384 domain];
                    v268 = objc_msgSend(*(id *)(v192 + 3792), "numberWithInteger:", objc_msgSend(*(id *)v384, "code"));
                    v269 = [v268 stringValue];
                    v270 = (void *)[v266 initWithFormat:@"MAError: %@ %@", v267, v269];

                    [(TRIFetchFactorPackSetTask *)v317 _recordExperimentFetchFailedWithReason:v270 context:v313];
                  }
                  id v264 = v359;
                  if (!v264)
                  {
                    v285 = [MEMORY[0x1E4F28B00] currentHandler];
                    [v285 handleFailureInMethod:a2, v317, @"TRIFetchFactorPackSetTask.m", 1606, @"Expression was unexpectedly nil/false: %@", @"taskResult" object file lineNumber description];
                  }
                }
                else
                {
                  [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v313];
                  if ([v359 runStatus] == 3)
                  {
                    v263 = TRIFetchErrorParseToPostLaunchMetric(*(void **)v384);
                    [(TRIFetchFactorPackSetTask *)v317 _recordExperimentFetchFailedWithReason:v263 context:v313];
                  }
                  id v264 = v359;
                  if (!v264)
                  {
                    v265 = [MEMORY[0x1E4F28B00] currentHandler];
                    [v265 handleFailureInMethod:a2, v317, @"TRIFetchFactorPackSetTask.m", 1560, @"Expression was unexpectedly nil/false: %@", @"taskResult" object file lineNumber description];
                  }
                }
                id v304 = v264;

LABEL_321:
                goto LABEL_322;
              }
              [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v299 withError:4];
              [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:24];
              [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v313];
              [(TRIFetchFactorPackSetTask *)v317 _recordExperimentFetchFailedWithTaskError:24 context:v313];
              id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:3 reportResultToServer:1 earliestRetryDate:0];
              _Block_object_dispose(buf, 8);
            }
LABEL_322:

            goto LABEL_323;
          }
          if (v343)
          {
            v209 = TRIFetchErrorParseToMetrics(v343);
            if ([v209 count]
              && (v317->_rolloutSupport || v317->_bmltSupport || v317->_experimentSupport))
            {
              long long v334 = 0u;
              long long v335 = 0u;
              long long v332 = 0u;
              long long v333 = 0u;
              id v210 = v209;
              uint64_t v211 = [v210 countByEnumeratingWithState:&v332 objects:v374 count:16];
              v303 = v209;
              if (!v211) {
                goto LABEL_214;
              }
              uint64_t v212 = *(void *)v333;
              while (1)
              {
                for (iuint64_t i = 0; ii != v211; ++ii)
                {
                  if (*(void *)v333 != v212) {
                    objc_enumerationMutation(v210);
                  }
                  uint64_t v214 = *(void *)(*((void *)&v332 + 1) + 8 * ii);
                  unint64_t v215 = v317->_construct;
                  v216 = (id *)&v317->_rolloutSupport;
                  switch(v215)
                  {
                    case 0uLL:
                      goto LABEL_211;
                    case 1uLL:
                      v218 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_210:
                      v216 = (id *)((char *)&v317->super.super.isa + *v218);
LABEL_211:
                      [*v216 addMetric:v214];
                      continue;
                    case 2uLL:
                      int v217 = _os_feature_enabled_impl();
                      v218 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                      if (v217) {
                        goto LABEL_210;
                      }
                      break;
                  }
                }
                uint64_t v211 = [v210 countByEnumeratingWithState:&v332 objects:v374 count:16];
                if (!v211)
                {
LABEL_214:

                  unint64_t v192 = 0x1E4F28000;
                  v209 = v303;
                  break;
                }
              }
            }
          }
          [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:15];
          [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:v305 serverContext:v313];
          if (*(void *)v384)
          {
            -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v317, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 1, 1);
          }
          else
          {
            [(TRIFetchFactorPackSetTask *)v317 _recordExperimentFetchFailedWithTaskError:15 context:v313];
            [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v299 withCloudKitError:v343];
            [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:3 reportResultToServer:1 earliestRetryDate:0];
          }
          id v304 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_220;
        }
        id v12 = objc_opt_new();
        id v13 = [(TRIFactorPackSetStorage *)v11 rampId];

        if (v13)
        {
          id v14 = [(TRIFactorPackSetStorage *)v11 rampId];
          BOOL v15 = [v12 ensureRolloutFields];
          [v15 setClientRampId:v14];
        }
        id v16 = v317->_factorPackSetId;
        int v17 = [(TRIFactorPackSetStorage *)v11 targetedFactorPackSetId];
        if ([(TRIFactorPackSetId *)v16 isEqual:v17])
        {
          id v18 = [(TRIFactorPackSetStorage *)v11 targetedTargetingRuleIndex];
          BOOL v19 = v18 == 0;

          if (v19)
          {
LABEL_13:
            [(TRIRolloutTaskSupport *)v317->_rolloutSupport mergeTelemetry:v12];
            goto LABEL_42;
          }
          int v17 = [(TRIFactorPackSetStorage *)v11 targetedTargetingRuleIndex];
          uint64_t v20 = [v17 intValue];
          int v21 = [v12 ensureRolloutFields];
          [v21 setClientTargetingRuleGroupOrdinal:v20];
        }
        goto LABEL_13;
      }
LABEL_58:
      BOOL v287 = 0;
      id v299 = 0;
      v291 = 0;
      v305 = 0;
      int v11 = 0;
      v295 = 0;
      goto LABEL_93;
    }
    id v22 = [v316 bmltDatabase];
    int v11 = [v22 taskRecordWithTaskDeployment:v317->_bmltDeployment];

    if (!v11)
    {
      uint64_t v23 = TRILogCategory_Server();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v40 = [(TRIBMLTDeployment *)v317->_bmltDeployment shortDesc];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v40;
        _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "Warning: record for BMLT deployment %{public}@ not available; issuing incomplete telemetry.",
          buf,
          0xCu);
      }
LABEL_28:

      id v41 = [TRIFactorPackSetStorage alloc];
      __int16 v42 = [v316 paths];
      uint64_t v33 = [(TRIFactorPackSetStorage *)v41 initWithPaths:v42];

      *(void *)v384 = 0;
      if (![(TRIFactorPackSetStorage *)v33 hasFactorPackSetWithId:v317->_factorPackSetId path:v384])
      {

        int v59 = 0;
        if (!v11) {
          goto LABEL_58;
        }
        goto LABEL_91;
      }
      uint64_t v43 = [v316 namespaceDatabase];
      __int16 v44 = [v316 paths];
      int v45 = [v44 namespaceDescriptorsDefaultDir];
      __int16 v46 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v43 defaultDescriptorDirectoryPath:v45];

      if (!v11)
      {
        long long v85 = TRILogCategory_Server();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          v272 = v317->_factorPackSetId;
          v273 = [(TRIBMLTDeployment *)v317->_bmltDeployment shortDesc];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v272;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v273;
          _os_log_error_impl(&dword_1DA291000, v85, OS_LOG_TYPE_ERROR, "Unable to update preexisting factor pack set %{public}@ for BMLT deployment %{public}@: record not found in database.", buf, 0x16u);
        }
        [(TRIFetchFactorPackSetTask *)v317 _addMetricForFetchFactorPackSetTaskError:29];
        [(TRIFetchFactorPackSetTask *)v317 _bmltFetchTelemetryIfApplicableWithSuccess:0 bmltRecord:0 serverContext:v316];
        id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:3 reportResultToServer:1 earliestRetryDate:0];

        goto LABEL_193;
      }
      uint64_t v47 = [(TRIFactorPackSetStorage *)v11 artifact];
      uint64_t v48 = [v47 backgroundTask];
      BOOL v49 = [(TRIFetchFactorPackSetTask *)v317 incompatibleNamespaceNameForBMLT:v48 namespaceDescriptorProvider:v46];

      v50 = objc_opt_new();
      id v51 = v317->_factorPackSetId;
      v364[0] = MEMORY[0x1E4F143A8];
      v364[1] = 3221225472;
      v364[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_446;
      v364[3] = &unk_1E6BBC300;
      id v52 = v50;
      id v365 = v52;
      [(TRIFactorPackSetStorage *)v33 enumerateCompatibleFactorPacksForFactorPackSet:v51 usingLegacyPaths:0 withBlock:v364];
      LODWORD(v51) = _os_feature_enabled_impl();
      if ((v51 & _os_feature_enabled_impl()) == 1)
      {
        id v53 = objc_opt_new();
        v54 = v317->_factorPackSetId;
        v360[0] = MEMORY[0x1E4F143A8];
        v360[1] = 3221225472;
        v360[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_448;
        v360[3] = &unk_1E6BBC350;
        id v361 = v46;
        v362 = v317;
        id v55 = v53;
        id v363 = v55;
        [(TRIFactorPackSetStorage *)v33 enumerateFBFactorPacksForFactorPackSet:v54 usingLegacyPaths:0 withBlock:v360];
        if ([v55 count]) {
          BOOL v56 = 0;
        }
        else {
          BOOL v56 = v49;
        }
        if (v56)
        {
          v57 = TRILogCategory_Server();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = v317->_factorPackSetId;
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v58;
            _os_log_impl(&dword_1DA291000, v57, OS_LOG_TYPE_DEFAULT, "Flatbuffer Storage: Factor pack set %{public}@ contains ineligible factor pack. Re-fetching factor pack to find replacement.", buf, 0xCu);
          }

          int v59 = 1;
        }
        else
        {
          v95 = TRILogCategory_Server();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            id v96 = v317->_factorPackSetId;
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v96;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = *(void *)v384;
            _os_log_impl(&dword_1DA291000, v95, OS_LOG_TYPE_DEFAULT, "Flatbuffer Storage: Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
              buf,
              0x16u);
          }

          id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:2 reportResultToServer:0 earliestRetryDate:0];
          int v59 = 0;
        }

        if (v56)
        {
LABEL_87:
          int v94 = 1;
          goto LABEL_89;
        }
        int v94 = 0;
      }
      else
      {
        if ([v52 count]) {
          BOOL v87 = 0;
        }
        else {
          BOOL v87 = v49;
        }
        if (v87)
        {
          id v88 = TRILogCategory_Server();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            id v89 = v317->_factorPackSetId;
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v89;
            _os_log_impl(&dword_1DA291000, v88, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ contains ineligible factor pack. Re-fetching factor pack to find replacement.", buf, 0xCu);
          }

          int v59 = 1;
          goto LABEL_87;
        }
        v92 = TRILogCategory_Server();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v93 = v317->_factorPackSetId;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v93;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = *(void *)v384;
          _os_log_impl(&dword_1DA291000, v92, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
            buf,
            0x16u);
        }

        id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:2 reportResultToServer:0 earliestRetryDate:0];
        int v94 = 0;
        int v59 = 0;
      }
LABEL_89:

      if (v94)
      {

LABEL_91:
        v97 = [(TRIFactorPackSetStorage *)v11 artifact];
        id v98 = [v97 backgroundTask];
        v99 = [v98 selectedNamespace];
        id v100 = [v99 name];
        v390[0] = v100;
        v295 = [MEMORY[0x1E4F1C978] arrayWithObjects:v390 count:1];

        [MEMORY[0x1E4FB00D0] immediateDownloadNotificationKeyForNamespaceNames:v295];
        BOOL v287 = v59 != 0;
        id v299 = (id)objc_claimAutoreleasedReturnValue();

        v291 = 0;
        v305 = v11;
        goto LABEL_92;
      }
LABEL_193:

      goto LABEL_326;
    }
    uint64_t v23 = objc_opt_new();
    int v24 = v317->_factorPackSetId;
    id v25 = [(TRIFactorPackSetStorage *)v11 targetedFactorPackSetId];
    if ([(TRIFactorPackSetId *)v24 isEqual:v25])
    {
      BOOL v26 = [(TRIFactorPackSetStorage *)v11 targetedTargetingRuleIndex];
      BOOL v27 = v26 == 0;

      if (v27)
      {
LABEL_19:
        [(TRIBMLTTaskSupport *)v317->_bmltSupport mergeTelemetry:v23];
        goto LABEL_28;
      }
      id v25 = [(TRIFactorPackSetStorage *)v11 targetedTargetingRuleIndex];
      uint64_t v28 = [v25 intValue];
      id v29 = [v23 ensureBMLTFields];
      [v29 setClientBmltTargetingRuleGroupOrdinal:v28];
    }
    goto LABEL_19;
  }
  id v30 = [v316 experimentDatabase];
  int v11 = [v30 experimentRecordWithExperimentDeployment:v317->_experimentDeployment];

  uint64_t v31 = [TRIFactorPackSetStorage alloc];
  uint64_t v32 = [v316 paths];
  uint64_t v33 = [(TRIFactorPackSetStorage *)v31 initWithPaths:v32];

  *(void *)v384 = 0;
  if (![(TRIFactorPackSetStorage *)v33 hasFactorPackSetWithId:v317->_factorPackSetId path:v384])
  {

    if (!v11)
    {
      id v84 = TRILogCategory_Server();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v271 = [(TRIExperimentDeployment *)v317->_experimentDeployment shortDesc];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v271;
        _os_log_error_impl(&dword_1DA291000, v84, OS_LOG_TYPE_ERROR, "Warning: record for experiment deployment %{public}@ not available.", buf, 0xCu);
      }
      goto LABEL_58;
    }
    v295 = [(id)objc_opt_class() _namespaceNamesFromExperimentRecord:v11];
    id v299 = [MEMORY[0x1E4FB00D0] immediateDownloadNotificationKeyForNamespaceNames:v295];
    BOOL v287 = 0;
    v305 = 0;
    v291 = v11;
LABEL_92:
    int v11 = 0;
    goto LABEL_93;
  }
  uint64_t v34 = TRILogCategory_Server();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    char v35 = v317->_factorPackSetId;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = *(void *)v384;
    _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
      buf,
      0x16u);
  }

  uint64_t v36 = [(TRIFactorPackSetStorage *)v11 experimentDeployment];
  uint64_t v37 = [v36 experimentId];
  __int16 v38 = [(TRIFactorPackSetStorage *)v11 treatmentId];
  int v39 = [(TRIFactorPackSetStorage *)v11 experimentDeployment];
  +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 4, v37, v38, [v39 deploymentId], v11, 0, v316);

  id v304 = [(TRIFetchFactorPackSetTask *)v317 _taskResultForStatus:2 reportResultToServer:0 earliestRetryDate:0];

LABEL_326:
  if (v298) {
    v298[2](v298);
  }

  objc_sync_exit(v317);
  return v304;
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"on_demand_subscribed_factor_failed_to_download_without_asset_fetch";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v4 = (void *)[v2 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 88);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2;
  v8[3] = &unk_1E6BBC2D8;
  v8[4] = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = v4;
  id v7 = v4;
  [v6 runWithLockAcquired:v8];
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 138412290;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "factorName", v16);

        if (v10)
        {
          uint64_t v11 = *(void **)(a1 + 32);
          id v12 = [v9 factorName];
          id v13 = [v9 namespaceName];
          id v14 = [*(id *)(a1 + 40) client];
          [v11 _logOnDemandFactor:v12 metricName:@"on_demand_factor_failed_to_download_by_subscription" namespaceName:v13 client:v14 error:*(void *)(a1 + 48)];
        }
        else
        {
          id v12 = TRILogCategory_Server();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_11;
          }
          BOOL v15 = (objc_class *)objc_opt_class();
          id v13 = NSStringFromClass(v15);
          *(_DWORD *)buf = v16;
          id v22 = v13;
          _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Missing factorname in %@", buf, 0xCu);
        }

LABEL_11:
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_441(void *a1, void *a2, void *a3)
{
  unint64_t v12 = a2;
  unint64_t v5 = a3;
  uint64_t v6 = (void *)v12;
  if (v12 | v5)
  {
    if (v5)
    {
      uint64_t v7 = (void *)a1[5];
      id v8 = [(id)v5 namespaceName];
      [v7 addObject:v8];
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a1[6], a1[4], @"TRIFetchFactorPackSetTask.m", 1009, @"Invalid parameter not satisfying: %@", @"pbFactorPack || fbFactorLevel" object file lineNumber description];

    uint64_t v6 = (void *)v12;
  }
  id v10 = (void *)a1[5];
  id v8 = [v6 selectedNamespace];
  uint64_t v11 = [v8 name];
  [v10 addObject:v11];

LABEL_6:
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_446(uint64_t a1, void *a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    id v5 = [a3 namespaceName];
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    id v5 = [a2 selectedNamespace];
    uint64_t v4 = [v5 name];
    [v3 addObject:v4];
  }
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_448(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v5 namespaceName];
  id v9 = [v7 descriptorWithNamespaceName:v8];

  if (v9)
  {
    id v10 = [v5 ncvs];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_449;
    v14[3] = &unk_1E6BBC328;
    id v15 = v9;
    id v16 = *(id *)(a1 + 48);
    id v17 = v5;
    [v10 enumerateObjectsUsingBlock:v14];
  }
  else
  {
    uint64_t v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 128);
      id v13 = [v5 namespaceName];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      int v21 = v13;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "From Flatbuffer storage: Factor pack set %{public}@ requires namespace %{public}@ which is not registered in Trial.", buf, 0x16u);
    }
    *a3 = 1;
  }
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_449(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  LODWORD(v6) = [v6 downloadNCV];
  int v8 = [v7 intValue];

  if (v6 == v8)
  {
    *a4 = 1;
    id v9 = *(void **)(a1 + 40);
    id v10 = [*(id *)(a1 + 48) namespaceName];
    [v9 addObject:v10];
  }
}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_464(uint64_t a1, int a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) downloadNCV];
  if (result == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_465(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 80) allValues];
  [v5 addObjectsFromArray:v4];
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_482(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 type] == 1) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_484(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:a2];
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v8 = v3;
    id v5 = [v3 factorName];
    uint64_t v6 = [v8 namespaceName];
    id v7 = [*(id *)(a1 + 40) client];
    [v4 _logOnDemandFactor:v5 metricName:@"on_demand_factor_downloaded_by_subscription" namespaceName:v6 client:v7 error:0];

    [*(id *)(a1 + 32) _removeDownloadableRecord:v8];
    id v3 = v8;
  }
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:a2];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 factorName];
    id v9 = [v6 namespaceName];
    id v10 = [*(id *)(a1 + 40) client];
    [v7 _logOnDemandFactor:v8 metricName:@"on_demand_factor_failed_to_download_by_subscription" namespaceName:v9 client:v10 error:v11];

    [*(id *)(a1 + 32) _removeDownloadableRecord:v6];
  }
}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_487(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:a2];
}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_489(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 downloadSize];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_490(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 downloadSize];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)_namespaceNamesFromExperimentRecord:(id)a3
{
  id v3 = [a3 namespaces];
  uint64_t v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_20);

  return v4;
}

uint64_t __65__TRIFetchFactorPackSetTask__namespaceNamesFromExperimentRecord___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (void)_logOnDemandFactor:(id)a3 metricName:(id)a4 namespaceName:(id)a5 client:(id)a6 error:(id)a7
{
  id v30 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v14 && [v14 shouldLogAtLevel:20])
  {
    context = (void *)MEMORY[0x1E016E7F0]();
    id v16 = [MEMORY[0x1E4FB05A8] metricWithName:v12];
    id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v16, 0);
    if (v15)
    {
      long long v18 = TRIFetchErrorParseToMetrics(v15);
      if (v18)
      {
        [v17 addObjectsFromArray:v18];
      }
      else
      {
        uint64_t v19 = (void *)MEMORY[0x1E4FB05A8];
        __int16 v20 = [v15 localizedDescription];
        int v21 = [v19 metricWithName:v20];
        [v17 addObject:v21];
      }
    }
    uint64_t v22 = [(TRIFetchFactorPackSetTask *)self trialSystemTelemetry];
    uint64_t v23 = (void *)[v22 copy];

    uint64_t v24 = [v23 ensureOnDemandFactorFields];
    [v24 setFactorName:v30];

    id v25 = [v23 ensureOnDemandFactorFields];
    [v25 setNamespaceName:v13];

    BOOL v26 = [v14 logger];
    BOOL v27 = [v14 trackingId];
    uint64_t v28 = [(TRIFetchFactorPackSetTask *)self dimensions];
    [v26 logWithTrackingId:v27 metrics:v17 dimensions:v28 trialSystemTelemetry:v23];
  }
}

- (void)_addMetricForFetchFactorPackSetTaskError:(int)a3
{
  p_rolloutSupport = &self->_rolloutSupport;
  if (!self->_rolloutSupport && !self->_bmltSupport && !self->_experimentSupport) {
    return;
  }
  id v5 = (void *)MEMORY[0x1E4FB05A8];
  uint64_t v6 = fetchTaskErrorAsString(a3);
  id v9 = [v5 metricWithName:@"fetchfactorpacksettask_error" categoricalValue:v6];

  id v7 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
  unint64_t construct = self->_construct;
  if (!construct) {
    goto LABEL_10;
  }
  if (construct == 1)
  {
LABEL_9:
    p_rolloutSupport = (TRIRolloutTaskSupport **)((char *)self + *v7);
LABEL_10:
    [(TRIRolloutTaskSupport *)*p_rolloutSupport addMetric:v9];
    goto LABEL_11;
  }
  if (construct == 2 && _os_feature_enabled_impl())
  {
    id v7 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
    goto LABEL_9;
  }
LABEL_11:
}

- (void)_bmltFetchTelemetryIfApplicableWithSuccess:(BOOL)a3 bmltRecord:(id)a4 serverContext:(id)a5
{
  bmltDeployment = self->_bmltDeployment;
  if (bmltDeployment)
  {
    BOOL v7 = a3;
    id v9 = a5;
    id v10 = a4;
    id v13 = [(TRIBMLTDeployment *)bmltDeployment backgroundMLTaskId];
    uint64_t v11 = [(TRIBMLTDeployment *)self->_bmltDeployment deploymentId];
    if (v7) {
      uint64_t v12 = 6;
    }
    else {
      uint64_t v12 = 5;
    }
    +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:v12 forBMLT:v13 deployment:v11 fps:self->_factorPackSetId bmltRecord:v10 context:v9];
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TRIFetchFactorPackSetTask *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIFetchFactorPackSetTask;
    if ([(TRIBaseTask *)&v8 isEqual:v4]
      && [(TRIFetchFactorPackSetTask *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      if ([(TRIFactorPackSetId *)self->_factorPackSetId isEqualToString:v5->_factorPackSetId])char v6 = [(TRITaskAttributing *)self->_taskAttribution isEqual:v5->_taskAttribution]; {
      else
      }
        char v6 = 0;
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)TRIFetchFactorPackSetTask;
  unint64_t v3 = [(TRIBaseTask *)&v6 hash];
  uint64_t v4 = [(TRIFactorPackSetId *)self->_factorPackSetId hash] + 37 * v3;
  return [(TRITaskAttributing *)self->_taskAttribution hash] + 37 * v4;
}

- (id)dimensions
{
  rolloutSupport = self->_rolloutSupport;
  if (rolloutSupport) {
    goto LABEL_3;
  }
  rolloutSupport = self->_bmltSupport;
  if (rolloutSupport) {
    goto LABEL_3;
  }
  if (_os_feature_enabled_impl())
  {
    rolloutSupport = self->_experimentSupport;
    if (rolloutSupport)
    {
LABEL_3:
      rolloutSupport = [rolloutSupport dimensions];
    }
  }
  else
  {
    rolloutSupport = 0;
  }
  return rolloutSupport;
}

- (id)metrics
{
  rolloutSupport = self->_rolloutSupport;
  if (rolloutSupport) {
    goto LABEL_3;
  }
  rolloutSupport = self->_bmltSupport;
  if (rolloutSupport) {
    goto LABEL_3;
  }
  if (_os_feature_enabled_impl())
  {
    rolloutSupport = self->_experimentSupport;
    if (rolloutSupport)
    {
LABEL_3:
      rolloutSupport = [rolloutSupport metrics];
    }
  }
  else
  {
    rolloutSupport = 0;
  }
  return rolloutSupport;
}

- (id)trialSystemTelemetry
{
  rolloutSupport = self->_rolloutSupport;
  if (rolloutSupport) {
    goto LABEL_3;
  }
  rolloutSupport = self->_bmltSupport;
  if (rolloutSupport) {
    goto LABEL_3;
  }
  if (_os_feature_enabled_impl())
  {
    rolloutSupport = self->_experimentSupport;
    if (rolloutSupport)
    {
LABEL_3:
      rolloutSupport = [rolloutSupport trialSystemTelemetry];
    }
  }
  else
  {
    rolloutSupport = 0;
  }
  return rolloutSupport;
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  [v3 setFactorPackSetId:self->_factorPackSetId];
  uint64_t v4 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v4];

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchFactorPackSetTask retryCount](self, "retryCount"));
  unint64_t construct = self->_construct;
  switch(construct)
  {
    case 2uLL:
      if (_os_feature_enabled_impl())
      {
        [v3 setConstruct:3];
        id v9 = [(TRIExperimentDeployment *)self->_experimentDeployment experimentId];
        [v3 setExperimentId:v9];

        objc_msgSend(v3, "setDeploymentId:", -[TRIExperimentDeployment deploymentId](self->_experimentDeployment, "deploymentId"));
        [v3 setTreatmentId:self->_treatmentId];
      }
      break;
    case 1uLL:
      [v3 setConstruct:2];
      objc_super v8 = [(TRIBMLTDeployment *)self->_bmltDeployment backgroundMLTaskId];
      [v3 setBmltId:v8];

      objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_bmltDeployment, "deploymentId"));
      break;
    case 0uLL:
      [v3 setConstruct:1];
      objc_super v6 = [(TRIRolloutDeployment *)self->_rolloutDeployment rolloutId];
      [v3 setRolloutId:v6];

      objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_rolloutDeployment, "deploymentId"));
      BOOL v7 = [(TRITaskCapabilityModifier *)self->_capabilityModifier asPersistedModifier];
      [v3 setCapabilityModifier:v7];

      break;
  }
  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIFetchFactorPackSetTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 1823, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v82 = 0;
  unint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v82];
  id v4 = v82;
  if (!v3)
  {
    id v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v84 = v4;
      _os_log_fault_impl(&dword_1DA291000, v17, OS_LOG_TYPE_FAULT, "Unable to parse buffer as TRIFetchFactorPackSetPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_74;
  }
  if (![v3 hasConstruct]) {
    goto LABEL_13;
  }
  int v5 = [v3 construct];
  if (v5 != 2)
  {
    if (v5 == 3)
    {
      if ([v3 hasExperimentId])
      {
        objc_super v6 = [v3 experimentId];
        uint64_t v7 = [v6 length];

        if (v7)
        {
          if ([v3 hasDeploymentId])
          {
            char v8 = [v3 hasTreatmentId];
            if ((v8 & 1) == 0)
            {
              id v9 = TRILogCategory_Server();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                long long v80 = (objc_class *)objc_opt_class();
                int v81 = NSStringFromClass(v80);
                *(_DWORD *)buf = 138412290;
                id v84 = v81;
                _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);
              }
            }
            int v10 = 0;
            int v11 = 0;
            char v12 = v8 ^ 1;
            goto LABEL_52;
          }
          uint64_t v28 = TRILogCategory_Server();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
          __int16 v38 = (objc_class *)objc_opt_class();
          id v30 = NSStringFromClass(v38);
          *(_DWORD *)buf = 138412290;
          id v84 = v30;
          uint64_t v31 = "Cannot decode message of type %@ with missing field: deploymentId";
        }
        else
        {
          uint64_t v28 = TRILogCategory_Server();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
LABEL_50:

            int v10 = 0;
            int v11 = 0;
            goto LABEL_51;
          }
          uint64_t v37 = (objc_class *)objc_opt_class();
          id v30 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138412290;
          id v84 = v30;
          uint64_t v31 = "Cannot decode message of type %@ with field of length 0: experimentId";
        }
      }
      else
      {
        BOOL v27 = TRILogCategory_Server();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v70 = (objc_class *)objc_opt_class();
          id v71 = NSStringFromClass(v70);
          *(_DWORD *)buf = 138412290;
          id v84 = v71;
          _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
        }
        uint64_t v28 = TRILogCategory_Server();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
        id v29 = (objc_class *)objc_opt_class();
        id v30 = NSStringFromClass(v29);
        *(_DWORD *)buf = 138412290;
        id v84 = v30;
        uint64_t v31 = "Cannot decode message of type %@ with missing field: experimentId";
      }
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);

      goto LABEL_50;
    }
LABEL_13:
    if ([v3 hasRolloutId])
    {
      id v13 = [v3 rolloutId];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        char v15 = [v3 hasDeploymentId];
        if ((v15 & 1) == 0)
        {
          id v16 = TRILogCategory_Server();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v68 = (objc_class *)objc_opt_class();
            SEL v69 = NSStringFromClass(v68);
            *(_DWORD *)buf = 138412290;
            id v84 = v69;
            _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: deploymentId", buf, 0xCu);
          }
        }
        int v10 = 0;
        char v12 = v15 ^ 1;
        int v11 = 1;
        goto LABEL_52;
      }
      uint64_t v19 = TRILogCategory_Server();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      id v67 = (objc_class *)objc_opt_class();
      int v21 = NSStringFromClass(v67);
      *(_DWORD *)buf = 138412290;
      id v84 = v21;
      uint64_t v22 = "Cannot decode message of type %@ with field of length 0: rolloutId";
    }
    else
    {
      long long v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v63 = (objc_class *)objc_opt_class();
        id v64 = NSStringFromClass(v63);
        *(_DWORD *)buf = 138412290;
        id v84 = v64;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);
      }
      uint64_t v19 = TRILogCategory_Server();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      __int16 v20 = (objc_class *)objc_opt_class();
      int v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138412290;
      id v84 = v21;
      uint64_t v22 = "Cannot decode message of type %@ with missing field: rolloutId";
    }
    _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

LABEL_34:
    int v10 = 0;
    int v11 = 1;
LABEL_51:
    char v12 = 1;
    goto LABEL_52;
  }
  if (([v3 hasBmltId] & 1) == 0)
  {
    uint64_t v32 = TRILogCategory_Server();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v72 = (objc_class *)objc_opt_class();
      id v73 = NSStringFromClass(v72);
      *(_DWORD *)buf = 138412290;
      id v84 = v73;
      _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: bmltId", buf, 0xCu);
    }
    uint64_t v33 = TRILogCategory_Server();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    uint64_t v34 = (objc_class *)objc_opt_class();
    char v35 = NSStringFromClass(v34);
    *(_DWORD *)buf = 138412290;
    id v84 = v35;
    uint64_t v36 = "Cannot decode message of type %@ with missing field: bmltId";
    goto LABEL_91;
  }
  uint64_t v23 = [v3 bmltId];
  uint64_t v24 = [v23 length];

  if (!v24)
  {
    uint64_t v33 = TRILogCategory_Server();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
LABEL_46:

      int v11 = 0;
      int v10 = 1;
      goto LABEL_51;
    }
    long long v77 = (objc_class *)objc_opt_class();
    char v35 = NSStringFromClass(v77);
    *(_DWORD *)buf = 138412290;
    id v84 = v35;
    uint64_t v36 = "Cannot decode message of type %@ with field of length 0: bmltId";
LABEL_91:
    _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);

    goto LABEL_46;
  }
  char v25 = [v3 hasDeploymentId];
  if ((v25 & 1) == 0)
  {
    BOOL v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      BOOL v78 = (objc_class *)objc_opt_class();
      long long v79 = NSStringFromClass(v78);
      *(_DWORD *)buf = 138412290;
      id v84 = v79;
      _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: deploymentId", buf, 0xCu);
    }
  }
  int v11 = 0;
  char v12 = v25 ^ 1;
  int v10 = 1;
LABEL_52:
  if (([v3 hasFactorPackSetId] & 1) == 0)
  {
    __int16 v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v61 = (objc_class *)objc_opt_class();
      uint64_t v62 = NSStringFromClass(v61);
      *(_DWORD *)buf = 138412290;
      id v84 = v62;
      _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: factorPackSetId", buf, 0xCu);
    }
    id v17 = TRILogCategory_Server();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    uint64_t v43 = (objc_class *)objc_opt_class();
    __int16 v44 = NSStringFromClass(v43);
    *(_DWORD *)buf = 138412290;
    id v84 = v44;
    int v45 = "Cannot decode message of type %@ with missing field: factorPackSetId";
    goto LABEL_73;
  }
  int v39 = [v3 factorPackSetId];
  uint64_t v40 = [v39 length];

  if (!v40)
  {
    id v17 = TRILogCategory_Server();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    __int16 v46 = (objc_class *)objc_opt_class();
    __int16 v44 = NSStringFromClass(v46);
    *(_DWORD *)buf = 138412290;
    id v84 = v44;
    int v45 = "Cannot decode message of type %@ with field of length 0: factorPackSetId";
LABEL_73:
    _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, v45, buf, 0xCu);

    goto LABEL_74;
  }
  if (v12)
  {
    id v41 = 0;
    goto LABEL_76;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    id v17 = TRILogCategory_Server();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    v58 = (objc_class *)objc_opt_class();
    __int16 v44 = NSStringFromClass(v58);
    *(_DWORD *)buf = 138412290;
    id v84 = v44;
    int v45 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_73;
  }
  if (([v3 hasRetryCount] & 1) == 0)
  {
    id v17 = TRILogCategory_Server();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    int v59 = (objc_class *)objc_opt_class();
    __int16 v44 = NSStringFromClass(v59);
    *(_DWORD *)buf = 138412290;
    id v84 = v44;
    int v45 = "Cannot decode message of type %@ with missing field: retryCount";
    goto LABEL_73;
  }
  uint64_t v47 = [v3 factorPackSetId];
  id v17 = TRIValidateFactorPackSetId();

  if (v17)
  {
    uint64_t v48 = [v3 taskAttribution];
    BOOL v49 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v48];

    if (!v49)
    {
      id v41 = 0;
LABEL_89:

      goto LABEL_75;
    }
    if (v11)
    {
      v50 = (void *)MEMORY[0x1E4FB0228];
      id v51 = [v3 rolloutId];
      id v52 = objc_msgSend(v50, "deploymentWithRolloutId:deploymentId:", v51, objc_msgSend(v3, "deploymentId"));

      if ([v3 hasCapabilityModifier])
      {
        id v53 = [TRITaskCapabilityModifier alloc];
        v54 = [v3 capabilityModifier];
        uint64_t v55 = [v54 add];
        BOOL v56 = [v3 capabilityModifier];
        v57 = -[TRITaskCapabilityModifier initWithAdd:remove:](v53, "initWithAdd:remove:", v55, [v56 remove]);
      }
      else
      {
        v57 = (TRITaskCapabilityModifier *)objc_opt_new();
      }
      id v74 = [[TRIFetchFactorPackSetTask alloc] initWithFactorPackSetId:v17 taskAttribution:v49 rolloutDeployment:v52 capabilityModifier:v57];
    }
    else
    {
      if (v10)
      {
        id v65 = (void *)MEMORY[0x1E4FB0078];
        v66 = [v3 bmltId];
        id v52 = objc_msgSend(v65, "deploymentWithBackgroundMLTaskId:deploymentId:", v66, objc_msgSend(v3, "deploymentId"));

        id v41 = [[TRIFetchFactorPackSetTask alloc] initWithFactorPackSetId:v17 taskAttribution:v49 bmltDeployment:v52];
LABEL_88:

        -[TRIFetchFactorPackSetTask setRetryCount:](v41, "setRetryCount:", [v3 retryCount]);
        goto LABEL_89;
      }
      char v75 = (void *)MEMORY[0x1E4FB00F8];
      uint64_t v76 = [v3 experimentId];
      id v52 = objc_msgSend(v75, "deploymentWithExperimentId:deploymentId:", v76, objc_msgSend(v3, "deploymentId"));

      v57 = [v3 treatmentId];
      id v74 = [[TRIFetchFactorPackSetTask alloc] initWithFactorPackSetId:v17 treatmentId:v57 taskAttribution:v49 experimentDeployment:v52];
    }
    id v41 = v74;

    goto LABEL_88;
  }
LABEL_74:
  id v41 = 0;
LABEL_75:

LABEL_76:
  return v41;
}

- (unint64_t)requiredCapabilities
{
  unint64_t v3 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  uint64_t v4 = [v3 requiredCapability];
  v8.receiver = self;
  v8.super_class = (Class)TRIFetchFactorPackSetTask;
  unint64_t v5 = [(TRIBaseTask *)&v8 requiredCapabilities] | v4;
  uint64_t v6 = v5 | (4 * ([(TRIFetchFactorPackSetTask *)self retryCount] > 0));

  return [(TRITaskCapabilityModifier *)self->_capabilityModifier updateCapability:v6];
}

- (NSString)description
{
  unint64_t v3 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  uint64_t v4 = [v3 discretionaryBehavior];
  unint64_t v5 = @"disc";
  if (!v4) {
    unint64_t v5 = @"non-disc";
  }
  uint64_t v6 = v5;

  uint64_t v7 = NSString;
  uint64_t v8 = objc_opt_class();
  factorPackSetId = self->_factorPackSetId;
  int v10 = [(TRITaskAttributing *)self->_taskAttribution applicationBundleIdentifier];
  int v11 = [v7 stringWithFormat:@"<%@:%@,a:%@,d:%@,r:%d>", v8, factorPackSetId, v10, v6, -[TRIFetchFactorPackSetTask retryCount](self, "retryCount")];

  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchFactorPackSetTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchFactorPackSetTask;
  unint64_t v5 = [(TRIFetchFactorPackSetTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      uint64_t v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFetchFactorPackSetTask.m", 1927, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  unint64_t v5 = [(TRIFetchFactorPackSetTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (TRIRolloutDeployment)rolloutDeployment
{
  return self->_rolloutDeployment;
}

- (TRIBMLTDeployment)bmltDeployment
{
  return self->_bmltDeployment;
}

- (TRIExperimentDeployment)experimentDeployment
{
  return self->_experimentDeployment;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
  objc_storeStrong((id *)&self->_rolloutDeployment, 0);
  objc_storeStrong((id *)&self->_guardedDownloadableRecord, 0);
  objc_storeStrong((id *)&self->_factorRecordsByAssetId, 0);
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentSupport, 0);
  objc_storeStrong((id *)&self->_bmltSupport, 0);
  objc_storeStrong((id *)&self->_rolloutSupport, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end