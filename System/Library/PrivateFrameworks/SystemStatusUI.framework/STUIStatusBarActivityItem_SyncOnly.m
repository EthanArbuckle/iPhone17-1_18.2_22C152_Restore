@interface STUIStatusBarActivityItem_SyncOnly
- (BOOL)_enableForType:(int64_t)a3;
@end

@implementation STUIStatusBarActivityItem_SyncOnly

- (BOOL)_enableForType:(int64_t)a3
{
  return a3 & 1;
}

@end