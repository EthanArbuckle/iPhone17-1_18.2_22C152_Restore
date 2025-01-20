@interface MTSyncChangeUnarchiver
- (unint64_t)mtType;
@end

@implementation MTSyncChangeUnarchiver

- (unint64_t)mtType
{
  return 3;
}

@end