@interface CRLiOSPageTitleButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)hitTestingInsets;
- (UIEdgeInsets)insets;
- (_TtC8Freeform21CRLiOSPageTitleButton)initWithCoder:(id)a3;
- (_TtC8Freeform21CRLiOSPageTitleButton)initWithFrame:(CGRect)a3;
- (_TtC8Freeform21CRLiOSPageTitleButton)initWithTitle:(id)a3 insets:(UIEdgeInsets)a4;
- (void)dealloc;
- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4;
- (void)setHitTestingInsets:(UIEdgeInsets)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)updateConfiguration;
@end

@implementation CRLiOSPageTitleButton

- (UIEdgeInsets)insets
{
  double v2 = sub_100DBFD20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_insets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)hitTestingInsets
{
  double v2 = sub_100DBFD20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_hitTestingInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setHitTestingInsets:(UIEdgeInsets)a3
{
}

- (_TtC8Freeform21CRLiOSPageTitleButton)initWithTitle:(id)a3 insets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8Freeform21CRLiOSPageTitleButton *)CRLiOSPageTitleButton.init(title:insets:)(v8, v9, top, left, bottom, right);
}

- (void)dealloc
{
  double v3 = self;
  double v4 = self;
  id v5 = [v3 sharedHelper];
  [v5 stopHandlingTouchUpDownAnimationsForControl:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CRLiOSPageTitleButton();
  [(CRLiOSPageTitleButton *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_titleFont));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_selectedTitleColor);
}

- (_TtC8Freeform21CRLiOSPageTitleButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8Freeform21CRLiOSPageTitleButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  objc_super v6 = self;
  if (a3)
  {
    id v7 = [a3 string];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  [(CRLiOSPageTitleButton *)v6 setTitle:v8 forState:a4];
}

- (void)updateConfiguration
{
  double v2 = self;
  CRLiOSPageTitleButton.updateConfiguration()();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = self;
  if ([(CRLiOSPageTitleButton *)v8 isEnabled]
    && ([(CRLiOSPageTitleButton *)v8 isHidden] & 1) == 0)
  {
    [(CRLiOSPageTitleButton *)v8 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = (double *)((char *)v8 + OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_hitTestingInsets);
    swift_beginAccess();
    v23.origin.double x = sub_100A4A174(v11, v13, v15, v17, *v18, v18[1]);
    v22.double x = x;
    v22.double y = y;
    BOOL v9 = CGRectContainsPoint(v23, v22);
  }
  else
  {
    v21.receiver = v8;
    v21.super_class = (Class)type metadata accessor for CRLiOSPageTitleButton();
    BOOL v9 = -[CRLiOSPageTitleButton pointInside:withEvent:](&v21, "pointInside:withEvent:", v7, x, y);
  }
  BOOL v19 = v9;

  return v19;
}

- (_TtC8Freeform21CRLiOSPageTitleButton)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (_TtC8Freeform21CRLiOSPageTitleButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end