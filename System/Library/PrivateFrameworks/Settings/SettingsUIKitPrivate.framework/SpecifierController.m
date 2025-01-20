@interface SpecifierController
- (void)reloadWithNotification:(id)a3;
@end

@implementation SpecifierController

- (void)reloadWithNotification:(id)a3
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage);
  id v4 = a3;
  swift_retain();
  objc_msgSend(v3, sel_numberOfSections);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236F4E3B8();
}

@end