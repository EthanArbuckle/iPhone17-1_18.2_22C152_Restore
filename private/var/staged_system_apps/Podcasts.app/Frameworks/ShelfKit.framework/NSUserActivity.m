@interface NSUserActivity
- (BOOL)isStateRestorationActivity;
@end

@implementation NSUserActivity

- (BOOL)isStateRestorationActivity
{
  v2 = self;
  v3 = [(NSUserActivity *)v2 activityType];
  uint64_t v4 = sub_3D7D50();
  uint64_t v6 = v5;

  if (v4 == 0xD000000000000023 && v6 == 0x80000000003FF400)
  {

    swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else
  {
    char v7 = sub_3D8FE0();

    swift_bridgeObjectRelease();
  }
  return v7 & 1;
}

@end