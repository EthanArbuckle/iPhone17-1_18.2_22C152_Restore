@interface PHAAssetRevGeocodeEnrichmentTask
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (double)period;
- (id)enrichmentProcessor;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAAssetRevGeocodeEnrichmentTask

- (id)enrichmentProcessor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8D648]);

  return v2;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAAssetRevGeocodeEnrichmentTask timeoutFatal:]", "PHAAssetRevGeocodeEnrichmentTask.m", 34, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAAssetRevGeocodeEnrichmentTask is stuck", v3, 2u);
  }
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  return 1;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (double)period
{
  return 3600.0;
}

@end