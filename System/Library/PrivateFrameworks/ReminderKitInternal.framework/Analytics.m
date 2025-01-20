@interface Analytics
+ (void)postEventWithName:(id)a3 payload:(id)a4 error:(id)a5 performAutoBugCaptureOnError:(BOOL)a6;
- (_TtC19ReminderKitInternal9Analytics)init;
@end

@implementation Analytics

+ (void)postEventWithName:(id)a3 payload:(id)a4 error:(id)a5 performAutoBugCaptureOnError:(BOOL)a6
{
  uint64_t v8 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  unint64_t v10 = v9;
  sub_1A72BEFEC(0, (unint64_t *)&qword_1EB7054C0);
  uint64_t v11 = sub_1A75723F0();
  id v12 = a5;
  sub_1A7467B18(v8, v10, v11, 0, 1, a5, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC19ReminderKitInternal9Analytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Analytics();
  return [(Analytics *)&v3 init];
}

@end