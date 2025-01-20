@interface TRIExperimentPostLaunchEvent
+ (BOOL)_isCategoricalLoggingEventType:(unsigned __int8)a3;
+ (BOOL)_isErrorType:(unsigned __int8)a3;
+ (id)_experimentStateNameForType:(unsigned __int8)a3;
+ (id)deactivationEventWithTriggerEvent:(unint64_t)a3 experimentRecord:(id)a4 additionalTelemetry:(id)a5;
+ (id)eventWithEventType:(unsigned __int8)a3 experimentRecord:(id)a4;
+ (id)eventWithEventType:(unsigned __int8)a3 treatmentTriple:(id)a4;
+ (id)failureEventWithEventType:(unsigned __int8)a3 treatmentTriple:(id)a4 failureReason:(id)a5;
+ (id)obsoletionOrDeactivationEventWithTriggerEvent:(unint64_t)a3 previousStateProvider:(id)a4 experimentRecord:(id)a5 additionalTelemetry:(id)a6;
- (NSArray)versionedNamespaces;
- (NSString)errorOrDeactivationReason;
- (NSString)experimentStateName;
- (TRIExperimentDeploymentTreatment)treatmentTriple;
- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 experimentRecord:(id)a5 errorOrDeactivationReason:(id)a6;
- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 experimentRecord:(id)a5 errorOrDeactivationReason:(id)a6 telemetry:(id)a7;
- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 treatmentTriple:(id)a5 errorOrDeactivationReason:(id)a6 deploymentEnvironment:(int)a7 versionedNamespaces:(id)a8 telemetry:(id)a9;
- (TRITrialSystemTelemetry)additionalTelemetry;
- (id)experimentRecord;
- (int)deploymentEnvironment;
- (unsigned)eventType;
@end

@implementation TRIExperimentPostLaunchEvent

- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 treatmentTriple:(id)a5 errorOrDeactivationReason:(id)a6 deploymentEnvironment:(int)a7 versionedNamespaces:(id)a8 telemetry:(id)a9
{
  id v25 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  if (!v14)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIExperimentPostLaunchEvent.m", 62, @"Invalid parameter not satisfying: %@", @"treatmentTriple" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)TRIExperimentPostLaunchEvent;
  v18 = [(TRIExperimentPostLaunchEvent *)&v26 init];
  v19 = v18;
  if (v18)
  {
    v18->_eventType = a3;
    objc_storeStrong((id *)&v18->_experimentStateName, a4);
    objc_storeStrong((id *)&v19->_treatmentTriple, a5);
    objc_storeStrong((id *)&v19->_errorOrDeactivationReason, a6);
    v19->_deploymentEnvironment = a7;
    objc_storeStrong((id *)&v19->_versionedNamespaces, a8);
    objc_storeStrong((id *)&v19->_additionalTelemetry, a9);
  }

  return v19;
}

- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 experimentRecord:(id)a5 errorOrDeactivationReason:(id)a6
{
  return [(TRIExperimentPostLaunchEvent *)self initWithEventType:a3 experimentStateName:a4 experimentRecord:a5 errorOrDeactivationReason:a6 telemetry:0];
}

- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 experimentRecord:(id)a5 errorOrDeactivationReason:(id)a6 telemetry:(id)a7
{
  unsigned int v27 = a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [v13 treatmentId];
  id v16 = (void *)v15;
  id v17 = @"unspecified-or-default-treatment";
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  v18 = v17;

  v19 = [v13 experimentDeployment];
  v20 = [v19 experimentId];
  v21 = [v13 experimentDeployment];
  v22 = +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v20, [v21 deploymentId], v18);

  uint64_t v23 = [v13 deploymentEnvironment];
  v24 = [v13 versionedNamespaces];

  id v25 = [(TRIExperimentPostLaunchEvent *)self initWithEventType:v27 experimentStateName:v14 treatmentTriple:v22 errorOrDeactivationReason:v12 deploymentEnvironment:v23 versionedNamespaces:v24 telemetry:v11];
  return v25;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (NSString)experimentStateName
{
  return self->_experimentStateName;
}

- (TRIExperimentDeploymentTreatment)treatmentTriple
{
  return self->_treatmentTriple;
}

- (NSString)errorOrDeactivationReason
{
  return self->_errorOrDeactivationReason;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
}

- (NSArray)versionedNamespaces
{
  return self->_versionedNamespaces;
}

- (TRITrialSystemTelemetry)additionalTelemetry
{
  return self->_additionalTelemetry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTelemetry, 0);
  objc_storeStrong((id *)&self->_versionedNamespaces, 0);
  objc_storeStrong((id *)&self->_errorOrDeactivationReason, 0);
  objc_storeStrong((id *)&self->_treatmentTriple, 0);
  objc_storeStrong((id *)&self->_experimentStateName, 0);
}

+ (id)eventWithEventType:(unsigned __int8)a3 experimentRecord:(id)a4
{
  uint64_t v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIExperimentPostLaunchEvent.m", 111, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  if (+[TRIExperimentPostLaunchEvent _isCategoricalLoggingEventType:v4])
  {
    v8 = 0;
  }
  else
  {
    v9 = [TRIExperimentPostLaunchEvent alloc];
    v10 = +[TRIExperimentPostLaunchEvent _experimentStateNameForType:v4];
    v8 = [(TRIExperimentPostLaunchEvent *)v9 initWithEventType:v4 experimentStateName:v10 experimentRecord:v7 errorOrDeactivationReason:0];
  }
  return v8;
}

+ (id)eventWithEventType:(unsigned __int8)a3 treatmentTriple:(id)a4
{
  uint64_t v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIExperimentPostLaunchEvent.m", 124, @"Invalid parameter not satisfying: %@", @"treatmentTriple" object file lineNumber description];
  }
  if (+[TRIExperimentPostLaunchEvent _isCategoricalLoggingEventType:v4])
  {
    v8 = 0;
  }
  else
  {
    v9 = [TRIExperimentPostLaunchEvent alloc];
    v10 = +[TRIExperimentPostLaunchEvent _experimentStateNameForType:v4];
    v8 = [(TRIExperimentPostLaunchEvent *)v9 initWithEventType:v4 experimentStateName:v10 treatmentTriple:v7 errorOrDeactivationReason:0 deploymentEnvironment:0 versionedNamespaces:0 telemetry:0];
  }
  return v8;
}

+ (BOOL)_isCategoricalLoggingEventType:(unsigned __int8)a3
{
  return (a3 < 0xAu) & (0x3C8u >> a3);
}

+ (id)deactivationEventWithTriggerEvent:(unint64_t)a3 experimentRecord:(id)a4 additionalTelemetry:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"TRIExperimentPostLaunchEvent.m", 167, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"TRIExperimentPostLaunchEvent.m", 168, @"Invalid parameter not satisfying: %@", @"telemetry" object file lineNumber description];

LABEL_3:
  id v12 = +[TRIDeactivationTriggerEventString categoricalValueForTriggerEvent:a3];
  id v13 = [TRIExperimentPostLaunchEvent alloc];
  id v14 = +[TRIExperimentPostLaunchEvent _experimentStateNameForType:3];
  uint64_t v15 = [(TRIExperimentPostLaunchEvent *)v13 initWithEventType:3 experimentStateName:v14 experimentRecord:v9 errorOrDeactivationReason:v12 telemetry:v11];

  return v15;
}

+ (id)failureEventWithEventType:(unsigned __int8)a3 treatmentTriple:(id)a4 failureReason:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([a1 _isErrorType:v6])
  {
    id v10 = [TRIExperimentPostLaunchEvent alloc];
    id v11 = +[TRIExperimentPostLaunchEvent _experimentStateNameForType:v6];
    id v12 = [(TRIExperimentPostLaunchEvent *)v10 initWithEventType:v6 experimentStateName:v11 treatmentTriple:v8 errorOrDeactivationReason:v9 deploymentEnvironment:0 versionedNamespaces:0 telemetry:0];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)obsoletionOrDeactivationEventWithTriggerEvent:(unint64_t)a3 previousStateProvider:(id)a4 experimentRecord:(id)a5 additionalTelemetry:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  if ([v11 status] == 2)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:a1 file:@"TRIExperimentPostLaunchEvent.m" lineNumber:199 description:@"Cannot attempt to obsolete for a record not in enrollment"];

    if (v13) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, a1, @"TRIExperimentPostLaunchEvent.m", 200, @"Invalid parameter not satisfying: %@", @"prevProvider" object file lineNumber description];

LABEL_3:
  id v14 = [v11 treatmentId];

  if (v14)
  {
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"TRIExperimentPostLaunchEvent.m", 201, @"Invalid parameter not satisfying: %@", @"record.treatmentId" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, a1, @"TRIExperimentPostLaunchEvent.m", 202, @"Invalid parameter not satisfying: %@", @"telemetry" object file lineNumber description];

LABEL_5:
  uint64_t v15 = [v11 experimentDeployment];
  id v16 = [v15 experimentId];
  id v17 = [v11 experimentDeployment];
  uint64_t v18 = [v17 deploymentId];
  v19 = [v11 treatmentId];
  v20 = +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:v16 deploymentId:v18 treatmentId:v19];

  int v21 = [v13 previousExperimentStateForTriple:v20];
  if (v21 == 1) {
    unsigned int v22 = 9;
  }
  else {
    unsigned int v22 = 4;
  }
  if (v21 == 4) {
    uint64_t v23 = 10;
  }
  else {
    uint64_t v23 = v22;
  }

  v24 = +[TRIDeactivationTriggerEventString categoricalValueForTriggerEvent:a3];
  id v25 = [TRIExperimentPostLaunchEvent alloc];
  if ((v23 - 4) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
    objc_super v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v26 = off_1E6BB8B70[v23 - 4];
  }
  unsigned int v27 = [(TRIExperimentPostLaunchEvent *)v25 initWithEventType:3 experimentStateName:v26 experimentRecord:v11 errorOrDeactivationReason:v24 telemetry:v12];

  return v27;
}

+ (BOOL)_isErrorType:(unsigned __int8)a3
{
  return (a3 - 6) < 4;
}

+ (id)_experimentStateNameForType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id result = 0;
  v5 = @"exp_st_AL";
  switch(a3)
  {
    case 0u:
    case 5u:
      return result;
    case 1u:
      goto LABEL_12;
    case 2u:
      v5 = @"exp_st_AC";
      goto LABEL_12;
    case 3u:
      v5 = @"exp_st_DE";
      goto LABEL_12;
    case 4u:
      v5 = @"exp_st_FE";
      goto LABEL_12;
    case 6u:
      v5 = @"exp_st_AL_F";
      goto LABEL_12;
    case 7u:
      v5 = @"exp_st_FE_F";
      goto LABEL_12;
    case 8u:
      v5 = @"exp_st_AC_F";
      goto LABEL_12;
    case 9u:
      v5 = @"exp_st_DE_F";
LABEL_12:
      id result = v5;
      break;
    default:
      uint64_t v6 = TRILogCategory_Server();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [NSNumber numberWithUnsignedChar:v3];
        int v8 = 138412290;
        id v9 = v7;
        _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unexpected eventType %@ encountered", (uint8_t *)&v8, 0xCu);
      }
      id result = 0;
      break;
  }
  return result;
}

- (id)experimentRecord
{
  uint64_t v3 = [(TRIExperimentPostLaunchEvent *)self treatmentTriple];
  uint64_t v4 = [v3 experimentId];

  v5 = [(TRIExperimentPostLaunchEvent *)self treatmentTriple];
  uint64_t v6 = [v5 deploymentId];

  id v7 = [(TRIExperimentPostLaunchEvent *)self treatmentTriple];
  int v8 = [v7 treatmentId];

  id v9 = (void *)MEMORY[0x1E4FB0108];
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [(TRIExperimentPostLaunchEvent *)self eventType];
  uint64_t v12 = [(TRIExperimentPostLaunchEvent *)self deploymentEnvironment];
  id v13 = [(TRIExperimentPostLaunchEvent *)self errorOrDeactivationReason];
  id v14 = [(TRIExperimentPostLaunchEvent *)self versionedNamespaces];
  uint64_t v15 = [v9 recordWithEventDate:v10 eventType:v11 deploymentEnvironment:v12 experimentId:v4 deploymentId:v6 treatmentId:v8 errorOrDeactivationReason:v13 namespaces:v14];

  return v15;
}

@end