@interface STCommunicationSafetyAnalyticsTipContentInterface
+ (id)makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:(id)a3 dismissTipBlock:(id)a4;
- (_TtC16ScreenTimeUICore49STCommunicationSafetyAnalyticsTipContentInterface)init;
@end

@implementation STCommunicationSafetyAnalyticsTipContentInterface

+ (id)makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:(id)a3 dismissTipBlock:(id)a4
{
  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  id v9 = sub_21898306C((uint64_t)sub_218983258, v7, (uint64_t)sub_218983290, v8);
  swift_release();
  swift_release();

  return v9;
}

- (_TtC16ScreenTimeUICore49STCommunicationSafetyAnalyticsTipContentInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STCommunicationSafetyAnalyticsTipContentInterface();
  return [(STCommunicationSafetyAnalyticsTipContentInterface *)&v3 init];
}

@end