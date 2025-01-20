@interface DeviceActivityQuerying
+ (BOOL)isQuickLookVideoNowPlaying;
+ (NSOrderedSet)currentBundleIdentifiers;
+ (NSOrderedSet)currentWebDomains;
+ (id)currentVideoIdentifiers;
- (_TtC18UsageTrackingAgent22DeviceActivityQuerying)init;
- (id)query:(id)a3 error:(id *)a4;
- (void)queryForUncategorizedLocalWebUsageDuringInterval:(NSDateInterval *)a3 completionHandler:(id)a4;
@end

@implementation DeviceActivityQuerying

- (id)query:(id)a3 error:(id *)a4
{
  v5 = (char *)a3;
  v6 = self;
  v7 = (void *)sub_100031464(v5);

  return v7;
}

- (void)queryForUncategorizedLocalWebUsageDuringInterval:(NSDateInterval *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000222D4(&qword_100095730);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100095960;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100095970;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_100035304((uint64_t)v10, (uint64_t)&unk_100095980, (uint64_t)v15);
  swift_release();
}

+ (NSOrderedSet)currentBundleIdentifiers
{
  if (qword_1000950A8 != -1) {
    swift_once();
  }
  v2 = (void *)(*(uint64_t (**)(void))(*(void *)algn_100097448 + 8))();
  return (NSOrderedSet *)v2;
}

+ (NSOrderedSet)currentWebDomains
{
  if (qword_1000950A8 != -1) {
    swift_once();
  }
  v2 = (void *)(*(uint64_t (**)(void))(*(void *)algn_100097448 + 16))();
  return (NSOrderedSet *)v2;
}

+ (BOOL)isQuickLookVideoNowPlaying
{
  if (qword_1000950A8 != -1) {
    swift_once();
  }
  return (*(uint64_t (**)(void))(*(void *)algn_100097448 + 24))() & 1;
}

+ (id)currentVideoIdentifiers
{
  if (qword_1000950A8 != -1) {
    swift_once();
  }
  v2 = (void *)(*(uint64_t (**)(void))(*(void *)algn_100097448 + 32))();
  v4 = v3;
  id v5 = [objc_allocWithZone((Class)BPSTuple) initWithFirst:v2 second:v3];

  return v5;
}

- (_TtC18UsageTrackingAgent22DeviceActivityQuerying)init
{
  v3 = (char *)self + OBJC_IVAR____TtC18UsageTrackingAgent22DeviceActivityQuerying____lazy_storage___dataSource;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18UsageTrackingAgent22DeviceActivityQuerying__query);
  uint64_t *v4 = type metadata accessor for DeviceActivityQuery();
  v4[1] = (uint64_t)&off_10008AEF8;
  id v5 = (char *)self + OBJC_IVAR____TtC18UsageTrackingAgent22DeviceActivityQuerying____lazy_storage___usageQuerying;
  v6 = (objc_class *)type metadata accessor for DeviceActivityQuerying();
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(DeviceActivityQuerying *)&v8 init];
}

- (void).cxx_destruct
{
}

@end