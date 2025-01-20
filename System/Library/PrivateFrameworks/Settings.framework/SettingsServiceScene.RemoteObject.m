@interface SettingsServiceScene.RemoteObject
- (void)updateAvailabilityWithAvailable:(BOOL)a3;
- (void)updateSidebarWithItems:(id)a3;
@end

@implementation SettingsServiceScene.RemoteObject

- (void)updateAvailabilityWithAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  swift_retain();
  v4 = (void *)sub_1E4D776A4();
  if (v4)
  {
    objc_msgSend(v4, sel_updateAvailabilityWithAvailable_, v3);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)updateSidebarWithItems:(id)a3
{
  type metadata accessor for SidebarItem();
  sub_1E4DBDFE8();
  swift_retain();
  uint64_t v3 = sub_1E4D776A4();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)sub_1E4DBDFD8();
    objc_msgSend(v4, sel_updateSidebarWithItems_, v5);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
}

@end