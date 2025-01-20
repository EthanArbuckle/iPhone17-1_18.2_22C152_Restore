@interface BKStandardItemsCacheManager
+ (void)prewarm;
- (BKStandardItemsCacheManager)init;
@end

@implementation BKStandardItemsCacheManager

+ (void)prewarm
{
  if (qword_100B22C98 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1007F6BC0();
  sub_10005B838(v0, (uint64_t)qword_100B36E98);
  v1 = sub_1007F6BA0();
  os_log_type_t v2 = sub_1007FE3A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_10005B0A8(0x286D726177657270, 0xE900000000000029, &v7);
    sub_1007FEE10();
    *(_WORD *)(v3 + 12) = 2080;
    sub_10005B0A8(0xD000000000000019, 0x8000000100889430, &v7);
    sub_1007FEE10();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s %s prewarm start", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (qword_100B23440 != -1) {
    swift_once();
  }
  v4 = sub_1007F6BA0();
  os_log_type_t v5 = sub_1007FE3A0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_10005B0A8(0x286D726177657270, 0xE900000000000029, &v7);
    sub_1007FEE10();
    *(_WORD *)(v6 + 12) = 2080;
    sub_10005B0A8(0xD000000000000019, 0x8000000100889430, &v7);
    sub_1007FEE10();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s %s prewarm end", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
}

- (BKStandardItemsCacheManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StandardItemsCacheManager();
  return [(BKStandardItemsCacheManager *)&v3 init];
}

@end