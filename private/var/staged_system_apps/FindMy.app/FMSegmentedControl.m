@interface FMSegmentedControl
- (_TtC6FindMy18FMSegmentedControl)initWithCoder:(id)a3;
- (_TtC6FindMy18FMSegmentedControl)initWithFrame:(CGRect)a3;
- (_TtC6FindMy18FMSegmentedControl)initWithItems:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation FMSegmentedControl

- (_TtC6FindMy18FMSegmentedControl)initWithItems:(id)a3
{
  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMSegmentedControl();
  v5 = [(FMSegmentedControl *)&v7 initWithItems:v4.super.isa];

  return v5;
}

- (_TtC6FindMy18FMSegmentedControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMSegmentedControl();
  return -[FMSegmentedControl initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy18FMSegmentedControl)initWithCoder:(id)a3
{
  result = (_TtC6FindMy18FMSegmentedControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_10014BF34();
  sub_1000C8370();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  objc_super v7 = self;
  id v8 = [(FMSegmentedControl *)v7 selectedSegmentIndex];
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for FMSegmentedControl();
  [(FMSegmentedControl *)&v10 touchesEnded:isa withEvent:v6];

  if (v8 == [(FMSegmentedControl *)v7 selectedSegmentIndex]) {
    [(FMSegmentedControl *)v7 sendActionsForControlEvents:64];
  }

  swift_bridgeObjectRelease();
}

@end