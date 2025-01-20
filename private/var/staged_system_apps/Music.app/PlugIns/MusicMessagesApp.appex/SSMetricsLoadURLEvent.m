@interface SSMetricsLoadURLEvent
- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation SSMetricsLoadURLEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  id v9 = a3;
  sub_10010928C(a3, v8, v8, (uint64_t)a3, (uint64_t)sub_100109EF0, v7);

  swift_release();
}

@end