@interface FMHyperlinkPlatterInfoView
- (_TtC6FindMy26FMHyperlinkPlatterInfoView)initWithCoder:(id)a3;
- (_TtC6FindMy26FMHyperlinkPlatterInfoView)initWithFrame:(CGRect)a3;
- (void)buttonPressed;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMHyperlinkPlatterInfoView

- (_TtC6FindMy26FMHyperlinkPlatterInfoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000F9D14();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000F9EDC();
}

- (void)buttonPressed
{
  v2 = *(void (**)(void *))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_actionHandler);
  if (v2)
  {
    id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_button);
    v7[3] = sub_1000F9CD4();
    v7[0] = v4;
    v5 = self;
    sub_1000B7838((uint64_t)v2);
    id v6 = v4;
    v2(v7);
    sub_100036B90((uint64_t)v2);
    sub_10002CEFC((uint64_t)v7);
  }
}

- (_TtC6FindMy26FMHyperlinkPlatterInfoView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy26FMHyperlinkPlatterInfoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_circleTintColor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_circleImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_iconImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_labelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_labelCenterYConstraint));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_actionHandler);

  sub_100036B90(v3);
}

@end