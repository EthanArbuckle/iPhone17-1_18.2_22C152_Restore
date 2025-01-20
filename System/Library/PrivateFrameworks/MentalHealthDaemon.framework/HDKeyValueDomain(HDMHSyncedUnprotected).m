@interface HDKeyValueDomain(HDMHSyncedUnprotected)
- (uint64_t)hdmh_setUpdatedPeriodicPromptedAssessmentNotificationFireDate:()HDMHSyncedUnprotected error:;
- (uint64_t)hdmh_updatedPeriodicPromptedAssessmentNotificationFireDateWithError:()HDMHSyncedUnprotected;
@end

@implementation HDKeyValueDomain(HDMHSyncedUnprotected)

- (uint64_t)hdmh_setUpdatedPeriodicPromptedAssessmentNotificationFireDate:()HDMHSyncedUnprotected error:
{
  return [a1 setDate:a3 forKey:*MEMORY[0x263F54FF0] error:a4];
}

- (uint64_t)hdmh_updatedPeriodicPromptedAssessmentNotificationFireDateWithError:()HDMHSyncedUnprotected
{
  return [a1 dateForKey:*MEMORY[0x263F54FF0] error:a3];
}

@end