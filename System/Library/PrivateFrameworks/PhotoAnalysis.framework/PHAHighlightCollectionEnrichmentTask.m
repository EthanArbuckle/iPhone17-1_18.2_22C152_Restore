@interface PHAHighlightCollectionEnrichmentTask
- (BOOL)currentPlatformIsSupported;
- (PHAHighlightCollectionEnrichmentTask)initWithOptions:(id)a3;
- (double)period;
- (id)enrichmentProcessor;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAHighlightCollectionEnrichmentTask

- (void).cxx_destruct
{
}

- (id)enrichmentProcessor
{
  if (self->_options) {
    id v2 = (id)[objc_alloc(MEMORY[0x1E4F8D668]) initWithOptions:self->_options];
  }
  else {
    id v2 = objc_alloc_init(MEMORY[0x1E4F8D668]);
  }

  return v2;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAHighlightCollectionEnrichmentTask timeoutFatal:]", "PHAHighlightCollectionEnrichmentTask.m", 55, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAHighlightCollectionEnrichmentTask is stuck", v3, 2u);
  }
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (double)period
{
  return 10800.0;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (PHAHighlightCollectionEnrichmentTask)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAHighlightCollectionEnrichmentTask;
  v6 = [(PHAHighlightCollectionEnrichmentTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

@end