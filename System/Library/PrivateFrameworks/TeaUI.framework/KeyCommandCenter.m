@interface KeyCommandCenter
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC5TeaUI16KeyCommandCenter)init;
- (void)handleKeyCommandWithSender:(id)a3;
@end

@implementation KeyCommandCenter

- (void)handleKeyCommandWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B61B3030();
  swift_unknownObjectRelease();
  KeyCommandCenter.handleKeyCommand(sender:)((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
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
  char v7 = KeyCommandCenter.canPerformAction(_:withSender:)();

  sub_1B601A4E8((uint64_t)v9, (unint64_t *)&qword_1EB64CAC0);
  return v7 & 1;
}

- (_TtC5TeaUI16KeyCommandCenter)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC5TeaUI16KeyCommandCenter_stagedTracker;
  sub_1B6019EEC((uint64_t)v3);
}

@end