@interface AccessoryBoxView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithArrangedSubviews:(id)isa;
- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithCoder:(id)a3;
- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithFrame:(CGRect)a3;
@end

@implementation AccessoryBoxView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  char v7 = NUIContainerView.ttr_pointIncludingExpandedHitTestInsets(inside:with:)();

  return v7 & 1;
}

- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[AccessoryBoxView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithArrangedSubviews:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_1000368FC(0, (unint64_t *)&qword_100788600);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(AccessoryBoxView *)&v8 initWithArrangedSubviews:isa];

  return v6;
}

- (_TtC9RemindersP33_E1C0813461C0906AF08ECA319453B61E16AccessoryBoxView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AccessoryBoxView *)&v5 initWithCoder:a3];
}

@end