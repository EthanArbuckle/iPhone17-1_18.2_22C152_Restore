@interface PXVisualDiagnosticsConfiguration(Diagnostics)
- (void)collectTapToRadarDiagnosticsIntoContainer:()Diagnostics;
@end

@implementation PXVisualDiagnosticsConfiguration(Diagnostics)

- (void)collectTapToRadarDiagnosticsIntoContainer:()Diagnostics
{
  id v4 = a3;
  uint64_t v5 = [a1 name];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"Visual Diagnostics";
  }
  v8 = [v4 beginCollectionOperationWithName:v7 timeout:30.0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__PXVisualDiagnosticsConfiguration_Diagnostics__collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  v11[3] = &unk_1E5DCC458;
  id v12 = v4;
  id v13 = v8;
  id v9 = v8;
  id v10 = v4;
  +[PXVisualDiagnosticsFactory requestVisualDiagnosticsPDFDocumentURLWithConfiguration:a1 resultHandler:v11];
}

@end