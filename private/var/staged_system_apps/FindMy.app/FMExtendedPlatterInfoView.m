@interface FMExtendedPlatterInfoView
- (_TtC6FindMy25FMExtendedPlatterInfoView)initWithCoder:(id)a3;
- (_TtC6FindMy25FMExtendedPlatterInfoView)initWithFrame:(CGRect)a3;
- (void)handleCloseAction;
- (void)platterTapped;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMExtendedPlatterInfoView

- (_TtC6FindMy25FMExtendedPlatterInfoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10033F008();
}

- (void)platterTapped
{
  v2 = *(void (**)(void *))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionHandler);
  if (v2)
  {
    v5[3] = swift_getObjectType();
    v5[0] = self;
    v4 = self;
    sub_1000B7838((uint64_t)v2);
    v2(v5);
    sub_100036B90((uint64_t)v2);
    sub_10002CEFC((uint64_t)v5);
  }
}

- (void)handleCloseAction
{
  v2 = (char *)self + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v3 = *((void *)v2 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC6FindMy25FMExtendedPlatterInfoView *, uint64_t, uint64_t))(v3 + 8))(self, ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = self;
  }
  [(FMExtendedPlatterInfoView *)self removeFromSuperview];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10033EC3C((uint64_t)a3);
}

- (_TtC6FindMy25FMExtendedPlatterInfoView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy25FMExtendedPlatterInfoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_iconImageView));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionLabel));
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_containerView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_platterIcon;

  sub_1002C5988((uint64_t)v3);
}

@end