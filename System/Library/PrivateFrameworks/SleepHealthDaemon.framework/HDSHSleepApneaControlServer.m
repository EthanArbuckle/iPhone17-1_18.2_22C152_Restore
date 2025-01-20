@interface HDSHSleepApneaControlServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (HDSHSleepApneaControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 analyzer:(id)a7 analysisScheduler:(id)a8;
- (id)_clientRemoteObjectProxy;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_forceBreathingDisturbanceAnalysis;
- (void)remote_getBreathingDisturbanceSamplesInDateInterval:(id)a3 completion:(id)a4;
- (void)remote_overridePreviousTimeIntervalWithTimeInterval:(double)a3;
@end

@implementation HDSHSleepApneaControlServer

- (HDSHSleepApneaControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 analyzer:(id)a7 analysisScheduler:(id)a8
{
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HDSHSleepApneaControlServer;
  v17 = [(HDStandardTaskServer *)&v22 initWithUUID:a3 configuration:a4 client:v14 delegate:a6];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_analyzer, a7);
    objc_storeStrong((id *)&v18->_analysisScheduler, a8);
    uint64_t v19 = [v14 profile];
    profile = v18->_profile;
    v18->_profile = (HDProfile *)v19;
  }
  return v18;
}

- (void)remote_forceBreathingDisturbanceAnalysis
{
}

- (void)remote_overridePreviousTimeIntervalWithTimeInterval:(double)a3
{
}

- (void)remote_getBreathingDisturbanceSamplesInDateInterval:(id)a3 completion:(id)a4
{
  if (a3)
  {
    analyzer = self->_analyzer;
    profile = self->_profile;
    id v8 = a4;
    id v10 = [(HDSHBreathingDisturbanceAnalyzer *)analyzer fetchSamplesWithAnalysisInterval:a3 profile:profile error:0];
    (*((void (**)(id))a4 + 2))(v8);
  }
  else
  {
    v9 = (void (*)(void))*((void *)a4 + 2);
    id v10 = a4;
    v9();
  }
}

- (id)_clientRemoteObjectProxy
{
  v2 = [(HDStandardTaskServer *)self client];
  v3 = [v2 connection];
  v4 = [v3 remoteObjectProxy];

  return v4;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 profile];
  id v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x263F75F00]];

  if (v16)
  {
    v17 = [HDSHBreathingDisturbanceAnalyzer alloc];
    v18 = [v13 profile];
    uint64_t v19 = [(HDSHBreathingDisturbanceAnalyzer *)v17 initWithProfile:v18];

    v20 = [HDSHSleepApneaControlServer alloc];
    v21 = [v16 breathingDisturbanceAnalysisScheduler];
    objc_super v22 = [(HDSHSleepApneaControlServer *)v20 initWithUUID:v11 configuration:v12 client:v13 delegate:v14 analyzer:v19 analysisScheduler:v21];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"Profile extension not found for class %@", objc_opt_class());
    v24 = (HDSHBreathingDisturbanceAnalyzer *)(id)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    if (v24)
    {
      if (a7)
      {
        v21 = v24;
        objc_super v22 = 0;
        *a7 = v21;
      }
      else
      {
        _HKLogDroppedError();
        objc_super v22 = 0;
      }
      uint64_t v19 = v21;
    }
    else
    {
      uint64_t v19 = 0;
      objc_super v22 = 0;
    }
  }

  return v22;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F731A0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x270F73198](self, a2);
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F75F08];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_analysisScheduler, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end