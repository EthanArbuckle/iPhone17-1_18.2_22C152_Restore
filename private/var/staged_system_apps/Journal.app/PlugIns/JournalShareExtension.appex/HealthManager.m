@interface HealthManager
- (BOOL)hasSeenBothHealthTCCs;
- (void)setHasSeenBothHealthTCCs:(BOOL)a3;
@end

@implementation HealthManager

- (BOOL)hasSeenBothHealthTCCs
{
  swift_retain();
  unsigned __int8 v2 = sub_10000C118();
  swift_release();
  return v2 & 1;
}

- (void)setHasSeenBothHealthTCCs:(BOOL)a3
{
  v3 = *(void **)self->sharedUserDefaults;
  if (v3)
  {
    BOOL v4 = a3;
    swift_retain();
    NSString v5 = sub_100109CF0();
    [v3 setBool:v4 forKey:v5];

    NSString v6 = sub_100109CF0();
    [v3 setBool:v4 forKey:v6];
    swift_release();
  }
}

@end