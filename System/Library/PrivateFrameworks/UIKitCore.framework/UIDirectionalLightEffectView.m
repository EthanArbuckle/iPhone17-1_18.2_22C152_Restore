@interface UIDirectionalLightEffectView
- (_TtC5UIKit28UIDirectionalLightEffectView)initWithCoder:(id)a3;
- (_TtC5UIKit28UIDirectionalLightEffectView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation UIDirectionalLightEffectView

- (_TtC5UIKit28UIDirectionalLightEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185905DC4();
}

- (_TtC5UIKit28UIDirectionalLightEffectView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit28UIDirectionalLightEffectView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_configuration);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_configuration);
  swift_bridgeObjectRelease();

  sub_1854AFD40(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_idleTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_fillView));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_idleTimerImpl);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for UIDirectionalLightEffectView();
  v2 = (char *)v4.receiver;
  [(UIView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_fillView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIDirectionalLightEffectView();
  id v2 = v3.receiver;
  [(UIView *)&v3 didMoveToSuperview];
  sub_185902D0C();
}

@end