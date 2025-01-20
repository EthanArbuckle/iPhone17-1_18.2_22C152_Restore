@interface _UIStatusBarActivityItem_SyncOnly
- (BOOL)_enableForType:(int64_t)a3;
@end

@implementation _UIStatusBarActivityItem_SyncOnly

- (BOOL)_enableForType:(int64_t)a3
{
  return a3 & 1;
}

@end