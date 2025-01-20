@interface AppShowcaseLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore21AppShowcaseLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore21AppShowcaseLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppShowcaseLockupView

- (_TtC8AppStore21AppShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21AppShowcaseLockupView *)sub_1002FB3F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21AppShowcaseLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002FF60C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002FE360();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1002F9F14();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_wordmarkView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_offerButton));

  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_offerLabelPresenter, (uint64_t *)&unk_100982B40);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_crossLinkSubtitleLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore21AppShowcaseLockupView_type;
  uint64_t v4 = type metadata accessor for AppShowcaseType();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end