@interface MFMailDebugGroupedSenderGroupingController
+ (id)debugViewControllerWithHandler:(id)a3;
- (_TtC10MobileMail42MFMailDebugGroupedSenderGroupingController)init;
@end

@implementation MFMailDebugGroupedSenderGroupingController

+ (id)debugViewControllerWithHandler:(id)a3
{
  swift_getObjCClassMetadata();
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_getObjCClassMetadata();
  v7 = sub_100360EB4((uint64_t)sub_1003615D8, v6);
  swift_release();

  return v7;
}

- (_TtC10MobileMail42MFMailDebugGroupedSenderGroupingController)init
{
  return (_TtC10MobileMail42MFMailDebugGroupedSenderGroupingController *)sub_100361508();
}

@end