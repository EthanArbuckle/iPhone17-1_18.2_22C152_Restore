@interface MainToolbarView
- (BOOL)isAccessibilityElement;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC5Books15MainToolbarView)initWithCoder:(id)a3;
- (_TtC5Books15MainToolbarView)initWithFrame:(CGRect)a3;
- (int64_t)_sceneDraggingBehaviorOnPan;
- (unint64_t)accessibilityTraits;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)didPressBackButtonItem;
- (void)layoutSubviews;
@end

@implementation MainToolbarView

- (_TtC5Books15MainToolbarView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books15MainToolbarView *)sub_1005A6C3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books15MainToolbarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005A83D0();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_1005A7670(a4);

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MainToolbarView();
  v2 = (char *)v10.receiver;
  [(MainToolbarView *)&v10 layoutSubviews];
  id v3 = [v2[OBJC_IVAR____TtC5Books15MainToolbarView_backgroundView] layer];
  [v2 bounds];
  id v8 = [self bezierPathWithRect:v4, v5, v6, v7];
  id v9 = [v8 CGPath];

  [v3 setShadowPath:v9];
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  return 1;
}

- (void)didPressBackButtonItem
{
  v2 = self;
  sub_1005A78C0();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books15MainToolbarView_backgroundView);
  id v8 = a4;
  id v9 = self;
  if (![v7 isHidden]) {
    goto LABEL_4;
  }
  unint64_t v10 = *(unint64_t *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC5Books15MainToolbarView_itemViews);
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1007FF290();
    swift_bridgeObjectRelease();
    if (!v11) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v11)
  {
LABEL_4:
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for MainToolbarView();
    LOBYTE(v11) = -[MainToolbarView pointInside:withEvent:](&v13, "pointInside:withEvent:", v8, x, y);
  }
LABEL_5:

  return v11;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MainToolbarView();
  id v2 = v7.receiver;
  unint64_t v3 = [(MainToolbarView *)&v7 accessibilityTraits];
  UIAccessibilityTraits v4 = UIAccessibilityTraitHeader;

  if ((v4 & ~v3) != 0) {
    UIAccessibilityTraits v5 = v4;
  }
  else {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (NSString)accessibilityLabel
{
  id v2 = self;
  sub_1005A7C80();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books15MainToolbarView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___flexibleSpacerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___titleContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___separatorView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books15MainToolbarView_leadingStackViewConstraint);
}

@end