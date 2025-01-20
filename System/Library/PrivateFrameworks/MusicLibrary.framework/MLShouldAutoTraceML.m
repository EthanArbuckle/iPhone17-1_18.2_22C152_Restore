@interface MLShouldAutoTraceML
@end

@implementation MLShouldAutoTraceML

void ___MLShouldAutoTraceML_block_invoke()
{
  v0 = getenv("SQLITE_AUTO_TRACE_ML");
  if (v0)
  {
    int v1 = strcmp(v0, "1");
    _MLShouldAutoTraceML_shouldAutoTraceML = v1 == 0;
    if (!v1) {
      return;
    }
  }
  else
  {
    _MLShouldAutoTraceML_shouldAutoTraceML = 0;
  }
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _MLShouldAutoTraceML_shouldAutoTraceML = [v2 BOOLForKey:@"SQLITE_AUTO_TRACE_ML"];
}

@end