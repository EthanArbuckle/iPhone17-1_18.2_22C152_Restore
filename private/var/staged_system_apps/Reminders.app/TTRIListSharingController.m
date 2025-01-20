@interface TTRIListSharingController
- (_TtC9Reminders25TTRIListSharingController)init;
- (id)itemThumbnailDataForCloudSharingController:(id)a3;
- (id)itemTitleForCloudSharingController:(id)a3;
- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3;
- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3;
- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4;
- (void)cloudSharingControllerDidSaveShare:(id)a3;
- (void)cloudSharingControllerDidStopSharing:(id)a3;
@end

@implementation TTRIListSharingController

- (_TtC9Reminders25TTRIListSharingController)init
{
  result = (_TtC9Reminders25TTRIListSharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders25TTRIListSharingController_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9Reminders25TTRIListSharingController_list);
}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1005E2664((uint64_t)v8);
}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005E1E68(v4, (uint64_t)sub_1005E1DD0, (uint64_t)&unk_100751C28, (SEL *)&selRef_updateShare_accountID_queue_completion_);
}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005E1E68(v4, (uint64_t)sub_1005E20C8, (uint64_t)&unk_100751C00, (SEL *)&selRef_stopShare_accountID_queue_completion_);
}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  v3 = sub_1005E2884();
  if (v4 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v6 = (uint64_t)v3;
    unint64_t v7 = v4;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100522A64(v6, v7);
  }

  return isa;
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  unint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9Reminders25TTRIListSharingController_list);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = [v4 displayName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v8;
}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  unint64_t v4 = self;
  sub_1005E1720(a3);
}

- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3
{
  unint64_t v4 = self;
  sub_1005E1A3C(a3);
}

@end