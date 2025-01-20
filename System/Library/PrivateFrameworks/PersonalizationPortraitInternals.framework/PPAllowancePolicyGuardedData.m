@interface PPAllowancePolicyGuardedData
@end

@implementation PPAllowancePolicyGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchableItemAllowlist, 0);
  objc_storeStrong((id *)&self->searchableItemBlocklist, 0);
  objc_storeStrong((id *)&self->notificationAllowlist, 0);
  objc_storeStrong((id *)&self->notificationBlocklist, 0);
}

@end