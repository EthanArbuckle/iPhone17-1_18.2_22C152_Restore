@interface MTSyncChangeArchiver
- (unint64_t)mtType;
@end

@implementation MTSyncChangeArchiver

- (unint64_t)mtType
{
  return 2;
}

@end