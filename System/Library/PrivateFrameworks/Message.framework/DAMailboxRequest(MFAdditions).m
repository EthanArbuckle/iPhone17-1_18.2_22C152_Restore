@interface DAMailboxRequest(MFAdditions)
- (uint64_t)mf_alwaysReportFailures;
@end

@implementation DAMailboxRequest(MFAdditions)

- (uint64_t)mf_alwaysReportFailures
{
  return 0;
}

@end