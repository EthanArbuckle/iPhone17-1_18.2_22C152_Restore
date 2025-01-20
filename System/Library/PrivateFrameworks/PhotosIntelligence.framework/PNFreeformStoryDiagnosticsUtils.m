@interface PNFreeformStoryDiagnosticsUtils
+ (id)diagnosticFilesFor:(id)a3 error:(id *)a4;
- (PNFreeformStoryDiagnosticsUtils)init;
@end

@implementation PNFreeformStoryDiagnosticsUtils

+ (id)diagnosticFilesFor:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v5 = a3;
  static FreeformStoryDiagnosticsUtils.diagnosticFiles(for:)();

  sub_259842680();
  v6 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  return v6;
}

- (PNFreeformStoryDiagnosticsUtils)init
{
  return (PNFreeformStoryDiagnosticsUtils *)FreeformStoryDiagnosticsUtils.init()();
}

@end