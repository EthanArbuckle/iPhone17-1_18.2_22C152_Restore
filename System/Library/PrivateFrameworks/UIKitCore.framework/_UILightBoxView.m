@interface _UILightBoxView
- (_TtC5UIKit15_UILightBoxView)initWithCoder:(id)a3;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
@end

@implementation _UILightBoxView

- (_TtC5UIKit15_UILightBoxView)initWithCoder:(id)a3
{
  result = (_TtC5UIKit15_UILightBoxView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)didAddSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _UILightBoxView();
  id v4 = a3;
  v5 = (char *)v6.receiver;
  [(UIView *)&v6 didAddSubview:v4];
  objc_msgSend(v5, sel_bringSubviewToFront_, *(void *)&v5[OBJC_IVAR____TtC5UIKit15_UILightBoxView_lightSourceView], v6.receiver, v6.super_class);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _UILightBoxView();
  v2 = (char *)v4.receiver;
  [(_UILightEffectTransitionView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit15_UILightBoxView_lightSourceView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  CGRect v6 = CGRectInset(v5, -*(double *)&v2[OBJC_IVAR____TtC5UIKit28_UILightEffectTransitionView_transitionSubviewOutset], -*(double *)&v2[OBJC_IVAR____TtC5UIKit28_UILightEffectTransitionView_transitionSubviewOutset]);
  objc_msgSend(v3, sel_setFrame_, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit15_UILightBoxView_lightSourceView));
}

@end