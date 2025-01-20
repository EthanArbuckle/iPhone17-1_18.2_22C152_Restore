@interface UITextEffectView
- (_TtC5UIKit16UITextEffectView)initWithCoder:(id)a3;
- (_TtC5UIKit16UITextEffectView)initWithFrame:(CGRect)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation UITextEffectView

- (_TtC5UIKit16UITextEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185A03BFC();
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UITextEffectView();
  id v2 = v5.receiver;
  [(UIView *)&v5 didMoveToSuperview];
  id v3 = objc_msgSend(v2, sel__scroller, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel__addScrollViewScrollObserver_, v2);
  }
}

- (void)didMoveToWindow
{
  id v3 = self;
  id v2 = [(UIView *)v3 window];

  if (!v2) {
    sub_185A0069C();
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UITextEffectView();
  id v2 = v3.receiver;
  [(UIView *)&v3 layoutSubviews];
  sub_185A003A4();
}

- (_TtC5UIKit16UITextEffectView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit16UITextEffectView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18596AE14((uint64_t)self + OBJC_IVAR____TtC5UIKit16UITextEffectView_source);
  sub_18596AE14((uint64_t)self + OBJC_IVAR____TtC5UIKit16UITextEffectView_animationDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UITextEffectView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(UIView *)&v6 _observeScrollViewDidScroll:v4];
  sub_185A003A4();
}

@end