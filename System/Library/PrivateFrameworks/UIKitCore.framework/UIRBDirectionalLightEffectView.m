@interface UIRBDirectionalLightEffectView
- (_TtC5UIKit30UIRBDirectionalLightEffectView)initWithCoder:(id)a3;
- (_TtC5UIKit30UIRBDirectionalLightEffectView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)update:(id)a3;
@end

@implementation UIRBDirectionalLightEffectView

- (_TtC5UIKit30UIRBDirectionalLightEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit30UIRBDirectionalLightEffectView *)UIRBDirectionalLightEffectView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5UIKit30UIRBDirectionalLightEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185B1B4B0();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for UIRBDirectionalLightEffectView();
  v2 = (char *)v4.receiver;
  [(UIView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_drawingView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
  sub_185B19518();
}

- (void)update:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185B19668(v4);
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_185B1988C();
}

- (void).cxx_destruct
{
  sub_1854AFD40(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_alongsideAnimation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_drawingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_displayLink));
  sub_1854AFD40(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_completionBlock));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_alongsideAnimationCurve);
}

@end