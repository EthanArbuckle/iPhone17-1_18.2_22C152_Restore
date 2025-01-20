@interface FMItemTerminalView
- (_TtC6FindMy18FMItemTerminalView)initWithCoder:(id)a3;
- (void)dealloc;
- (void)handleSecondaryAction;
- (void)handleTertiaryAction;
@end

@implementation FMItemTerminalView

- (void)dealloc
{
  v2 = self;
  sub_1001A61A4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FMItemTerminalView();
  [(FMTerminalView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_secondaryActionButtonHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_tertiaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMItemTerminalView_tertiaryActionButtonHeight));
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC6FindMy18FMItemTerminalView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001A7428();
}

- (void)handleSecondaryAction
{
  v2 = self;
  sub_1001A6BE4();
}

- (void)handleTertiaryAction
{
  v2 = self;
  sub_1001A6C3C();
}

@end