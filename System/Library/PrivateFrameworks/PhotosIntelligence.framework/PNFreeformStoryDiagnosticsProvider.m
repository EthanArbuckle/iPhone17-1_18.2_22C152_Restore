@interface PNFreeformStoryDiagnosticsProvider
+ (id)memoryCreationDiagnosticFilesForMemory:(id)a3 error:(id *)a4;
@end

@implementation PNFreeformStoryDiagnosticsProvider

+ (id)memoryCreationDiagnosticFilesForMemory:(id)a3 error:(id *)a4
{
  return +[PNFreeformStoryDiagnosticsUtils diagnosticFilesFor:a3 error:a4];
}

@end