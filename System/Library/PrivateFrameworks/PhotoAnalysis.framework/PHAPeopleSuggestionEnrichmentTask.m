@interface PHAPeopleSuggestionEnrichmentTask
- (double)period;
- (id)enrichmentProcessor;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAPeopleSuggestionEnrichmentTask

- (id)enrichmentProcessor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8D6B0]);

  return v2;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAPeopleSuggestionEnrichmentTask timeoutFatal:]", "PHAPeopleSuggestionEnrichmentTask.m", 25, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAPeopleSuggestionEnrichmentTask is stuck", v3, 2u);
  }
}

- (int)priority
{
  return -1;
}

- (double)period
{
  return 86400.0;
}

@end