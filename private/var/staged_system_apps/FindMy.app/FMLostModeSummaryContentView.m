@interface FMLostModeSummaryContentView
- (_TtC6FindMy28FMLostModeSummaryContentView)init;
- (_TtC6FindMy28FMLostModeSummaryContentView)initWithCoder:(id)a3;
- (_TtC6FindMy28FMLostModeSummaryContentView)initWithFrame:(CGRect)a3;
- (void)didTryInteractWithDisabledMessageView;
@end

@implementation FMLostModeSummaryContentView

- (_TtC6FindMy28FMLostModeSummaryContentView)init
{
  return (_TtC6FindMy28FMLostModeSummaryContentView *)sub_100139748();
}

- (_TtC6FindMy28FMLostModeSummaryContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10013B0FC();
}

- (void)didTryInteractWithDisabledMessageView
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v3 = self;
    sub_10032A584();

    swift_unknownObjectRelease();
  }
}

- (_TtC6FindMy28FMLostModeSummaryContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy28FMLostModeSummaryContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_notifyWhenFoundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_sendEmailUpdatesView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_phoneNumberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_emailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_messageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_disableButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_messageViewGestureRecognizer));
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy28FMLostModeSummaryContentView_delegate;

  sub_100068760((uint64_t)v3);
}

@end