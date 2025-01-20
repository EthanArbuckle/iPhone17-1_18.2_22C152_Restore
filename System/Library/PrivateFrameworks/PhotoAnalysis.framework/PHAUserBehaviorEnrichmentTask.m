@interface PHAUserBehaviorEnrichmentTask
- (double)period;
- (id)enrichmentProcessor;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAUserBehaviorEnrichmentTask

- (id)enrichmentProcessor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8D700]);

  return v2;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAUserBehaviorEnrichmentTask timeoutFatal:]", "PHAUserBehaviorEnrichmentTask.m", 29, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAUserBehaviorEnrichmentTask is stuck", v3, 2u);
  }
}

- (int)priority
{
  return -1;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (double)period
{
  return 604800.0;
}

@end