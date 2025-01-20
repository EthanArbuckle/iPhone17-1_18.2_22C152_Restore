@interface PLAppPrivateData(Globals)
- (BOOL)getCachedIsReadyForAnalysisFromSavedState;
- (void)saveCachedIsReadyForAnalysis:()Globals;
@end

@implementation PLAppPrivateData(Globals)

- (void)saveCachedIsReadyForAnalysis:()Globals
{
  int v5 = [a1 getCachedIsReadyForAnalysisFromSavedState];
  if (a3)
  {
    if (v5) {
      return;
    }
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    v6 = [@"GlobalValue" stringByAppendingPathExtension:@"isReadyForAnalysisDate"];
    [a1 setValue:v7 forKeyPath:v6];
  }
  else
  {
    if (!v5) {
      return;
    }
    id v7 = [@"GlobalValue" stringByAppendingPathExtension:@"isReadyForAnalysisDate"];
    [a1 setValue:0 forKeyPath:v7];
  }
}

- (BOOL)getCachedIsReadyForAnalysisFromSavedState
{
  v2 = [@"GlobalValue" stringByAppendingPathExtension:@"isReadyForAnalysisDate"];
  v3 = [a1 valueForKeyPath:v2];

  return v3 != 0;
}

@end