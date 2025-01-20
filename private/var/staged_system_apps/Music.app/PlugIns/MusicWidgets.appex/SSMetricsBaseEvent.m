@interface SSMetricsBaseEvent
- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation SSMetricsBaseEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_1001BABF8;
  v8[5] = v7;
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  swift_retain();
  sub_1001B9E30((uint64_t)sub_1001BA7CC, (uint64_t)v8);

  swift_release();

  swift_release();
}

@end