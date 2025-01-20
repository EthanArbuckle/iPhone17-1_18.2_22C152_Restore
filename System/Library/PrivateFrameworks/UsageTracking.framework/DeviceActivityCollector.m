@interface DeviceActivityCollector
+ (void)collectLocalActivityWithOptions:(int64_t)a3 shouldSync:(BOOL)a4 completionHandler:(id)a5;
+ (void)deleteLocalActivityWithCompletionHandler:(id)a3;
+ (void)startCollecting;
- (_TtC18UsageTrackingAgent23DeviceActivityCollector)init;
- (void)localeDidChangeWithNotification:(id)a3;
- (void)timeZoneDidChangeWithNotification:(id)a3;
@end

@implementation DeviceActivityCollector

- (_TtC18UsageTrackingAgent23DeviceActivityCollector)init
{
  return (_TtC18UsageTrackingAgent23DeviceActivityCollector *)sub_100023DF8();
}

- (void)localeDidChangeWithNotification:(id)a3
{
}

- (void)timeZoneDidChangeWithNotification:(id)a3
{
}

+ (void)startCollecting
{
}

+ (void)collectLocalActivityWithOptions:(int64_t)a3 shouldSync:(BOOL)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v7 = sub_10002F708;
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_getObjCClassMetadata();
  sub_100024FAC(a3, a4, (uint64_t)v7, v8);
  sub_10002C8B0((uint64_t)v7);
}

+ (void)deleteLocalActivityWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v6 = sub_10002C8F8;
  }
  else
  {
    v6 = 0;
    uint64_t v5 = 0;
  }
  swift_getObjCClassMetadata();
  sub_100025510((uint64_t)v6, v5);
  sub_10002C8B0((uint64_t)v6);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

@end