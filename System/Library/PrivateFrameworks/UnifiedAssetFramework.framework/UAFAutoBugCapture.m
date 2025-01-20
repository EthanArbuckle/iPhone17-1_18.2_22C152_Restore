@interface UAFAutoBugCapture
+ (void)captureWithType:(id)a3 subType:(id)a4 context:(id)a5 logCategory:(id)a6;
+ (void)captureWithType:(id)a3 subType:(id)a4 context:(id)a5 logCategory:(id)a6 withSDRDiagnosticReporter:(id)a7;
@end

@implementation UAFAutoBugCapture

+ (void)captureWithType:(id)a3 subType:(id)a4 context:(id)a5 logCategory:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263F7C080];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (id)[[v9 alloc] initWithQueue:0];
  +[UAFAutoBugCapture captureWithType:v13 subType:v12 context:v11 logCategory:v10 withSDRDiagnosticReporter:v14];
}

+ (void)captureWithType:(id)a3 subType:(id)a4 context:(id)a5 logCategory:(id)a6 withSDRDiagnosticReporter:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[UAFCommonUtilities isInternalInstall])
  {
    v16 = [MEMORY[0x263F08AB0] processInfo];
    v17 = [v16 processName];
    v18 = [v15 signatureWithDomain:@"UnifiedAssetFramework" type:v11 subType:v12 subtypeContext:v13 detectedProcess:v17 triggerThresholdValues:0];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315906;
      v20 = "+[UAFAutoBugCapture captureWithType:subType:context:logCategory:withSDRDiagnosticReporter:]";
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s Reporting failure to ABC.  Failure type: %@, subType: %@, context: %@", (uint8_t *)&v19, 0x2Au);
    }
    [v15 snapshotWithSignature:v18 delay:0 events:0 payload:0 actions:0 reply:0.0];
  }
}

@end