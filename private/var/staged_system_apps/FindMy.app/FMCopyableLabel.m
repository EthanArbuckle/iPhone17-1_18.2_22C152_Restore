@interface FMCopyableLabel
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC6FindMy15FMCopyableLabel)initWithCoder:(id)a3;
- (_TtC6FindMy15FMCopyableLabel)initWithFrame:(CGRect)a3;
- (void)copy:(id)a3;
- (void)showMenuWithSender:(id)a3;
@end

@implementation FMCopyableLabel

- (_TtC6FindMy15FMCopyableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC6FindMy15FMCopyableLabel *)sub_1001A8C98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6FindMy15FMCopyableLabel)initWithCoder:(id)a3
{
  return (_TtC6FindMy15FMCopyableLabel *)sub_1001A8DE0(a3);
}

- (void)showMenuWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1001A9170();
  swift_unknownObjectRelease();
}

- (void)copy:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  id v6 = [self generalPasteboard];
  id v7 = [(FMCopyableLabel *)self text];
  [v6 setString:v7];

  [*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy15FMCopyableLabel_menuController) hideMenuFromView:self];
  sub_100067244((uint64_t)v8);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    id v6 = self;
  }
  char v7 = static Selector.== infix(_:_:)();

  sub_100067244((uint64_t)v9);
  return v7 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMCopyableLabel_menuController));
}

@end