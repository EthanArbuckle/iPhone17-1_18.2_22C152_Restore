@interface _DPMLRuntimeTelemetry
+ (void)reportPluginForTrialClient:(id)a3 withError:(id)a4;
+ (void)reportPluginSucceedForTrialClient:(id)a3;
@end

@implementation _DPMLRuntimeTelemetry

+ (void)reportPluginSucceedForTrialClient:(id)a3
{
}

+ (void)reportPluginForTrialClient:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[LBFEventManager sharedInstance];
  id v8 = objc_alloc((Class)LBFTrialIdentifiers);
  v9 = [v6 experimentIdentifier];
  v10 = [v6 deploymentIdentifier];
  id v11 = [v10 intValue];
  v12 = [v6 treatmentIdentifier];

  id v13 = [v8 initWithExperimentID:v9 deploymentID:v11 treatmentID:v12];
  id v14 = [objc_alloc((Class)LBFLighthouseEvent) initWithPerformTrialTaskStatus:v5 == 0 error:v5 usePrivateUpload:1];

  id v18 = 0;
  LODWORD(v9) = [v7 addLighthousePluginEvent:v14 identifiers:v13 error:&v18];
  id v15 = v18;
  v16 = v15;
  if (v9 && v15)
  {
    v17 = +[_PFLLog extension];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100020328((uint64_t)v16, v17);
    }
  }
}

@end