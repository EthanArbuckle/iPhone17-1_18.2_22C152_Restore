@interface BTDiagnostics
+ (BOOL)OI_IsInternalDiagnosticsEnabled;
+ (void)fileABCSnapshot:(id)a3 subTypeContext:(id)a4 duration:(double)a5;
@end

@implementation BTDiagnostics

+ (void)fileABCSnapshot:(id)a3 subTypeContext:(id)a4 duration:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v10 = objc_alloc_init((Class)SDRDiagnosticReporter);
  v9 = [v10 signatureWithDomain:@"Bluetooth" type:@"Networking" subType:v8 subtypeContext:v7 detectedProcess:@"bluetoothd" triggerThresholdValues:0];

  [v10 snapshotWithSignature:v9 duration:0 events:0 payload:0 actions:&stru_100018AB8 reply:a5];
}

+ (BOOL)OI_IsInternalDiagnosticsEnabled
{
  return _os_variant_has_internal_diagnostics("com.apple.bluetooth", a2);
}

@end