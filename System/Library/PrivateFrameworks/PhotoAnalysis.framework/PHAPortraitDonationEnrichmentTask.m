@interface PHAPortraitDonationEnrichmentTask
- (BOOL)currentPlatformIsSupported;
- (double)period;
- (id)enrichmentProcessor;
- (id)incrementalKey;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAPortraitDonationEnrichmentTask

- (id)enrichmentProcessor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8D6D0]);

  return v2;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAPortraitDonationEnrichmentTask timeoutFatal:]", "PHAPortraitDonationEnrichmentTask.m", 39, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAPortraitDonationEnrichmentTask is stuck", v3, 2u);
  }
}

- (double)period
{
  return 86400.0;
}

- (int)priority
{
  return -1;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

@end