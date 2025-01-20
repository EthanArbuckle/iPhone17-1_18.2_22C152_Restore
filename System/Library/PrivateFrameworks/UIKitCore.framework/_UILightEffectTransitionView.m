@interface _UILightEffectTransitionView
- (_TtC5UIKit28_UILightEffectTransitionView)initWithCoder:(id)a3;
- (_TtC5UIKit28_UILightEffectTransitionView)initWithFrame:(CGRect)a3;
- (void)_didRemoveSubview:(id)a3;
- (void)layoutSubviews;
@end

@implementation _UILightEffectTransitionView

- (_TtC5UIKit28_UILightEffectTransitionView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC5UIKit28_UILightEffectTransitionView_activationTransition;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC5UIKit28_UILightEffectTransitionView_deactivationTransition;
  *((void *)v5 + 4) = 0;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  id v6 = a3;

  result = (_TtC5UIKit28_UILightEffectTransitionView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)_didRemoveSubview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _UILightEffectTransitionView();
  id v4 = v8.receiver;
  id v5 = a3;
  [(UIView *)&v8 _didRemoveSubview:v5];
  if (v5)
  {
    swift_beginAccess();
    id v6 = v5;
    v7 = (void *)sub_185B05D30(v6);
    swift_endAccess();
  }
  else
  {
    __break(1u);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185A9CB0C();
}

- (_TtC5UIKit28_UILightEffectTransitionView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit28_UILightEffectTransitionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1858FABE4((uint64_t)self + OBJC_IVAR____TtC5UIKit28_UILightEffectTransitionView_activationTransition);
  sub_1858FABE4((uint64_t)self + OBJC_IVAR____TtC5UIKit28_UILightEffectTransitionView_deactivationTransition);
  swift_bridgeObjectRelease();
}

@end