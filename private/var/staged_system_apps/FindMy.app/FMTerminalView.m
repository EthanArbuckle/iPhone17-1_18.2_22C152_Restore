@interface FMTerminalView
- (_TtC6FindMy14FMTerminalView)initWithCoder:(id)a3;
- (void)dealloc;
- (void)handleAction;
@end

@implementation FMTerminalView

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy14FMTerminalView_delegate);

  swift_release();
}

- (void)dealloc
{
  v2 = self;
  sub_100008E04();
}

- (_TtC6FindMy14FMTerminalView)initWithCoder:(id)a3
{
  *(void *)&self->super.mediator[OBJC_IVAR____TtC6FindMy14FMTerminalView_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_isVisible) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_isPeopleTab) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_state) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_conditionSubcription) = 0;
  id v5 = a3;

  result = (_TtC6FindMy14FMTerminalView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)handleAction
{
  switch(*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_state))
  {
    case 1:
    case 2:
    case 3:
      id v5 = self;
      v4 = self;
      sub_100412268();
      goto LABEL_5;
    case 4:
      id v5 = self;
      v2 = self;
      sub_100411A24();
      goto LABEL_5;
    case 5:
      id v5 = self;
      v3 = self;
      sub_10004BACC();
LABEL_5:

      break;
    default:
      return;
  }
}

@end