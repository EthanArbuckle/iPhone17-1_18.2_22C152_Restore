@interface MenuManager
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC5TeaUI11MenuManager)init;
- (void)buildMenuWithBuilder:(id)a3;
- (void)handleAlternateMenuCommandWithSender:(id)a3;
- (void)handleMenuCommandWithSender:(id)a3;
@end

@implementation MenuManager

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  MenuManager.buildMenu(with:)(a3);
  swift_unknownObjectRelease();
}

- (void)handleMenuCommandWithSender:(id)a3
{
}

- (void)handleAlternateMenuCommandWithSender:(id)a3
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_1B61B3030();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  char v7 = MenuManager.canPerformAction(_:withSender:)();

  sub_1B5E15B34((uint64_t)v9);
  return v7 & 1;
}

- (_TtC5TeaUI11MenuManager)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end