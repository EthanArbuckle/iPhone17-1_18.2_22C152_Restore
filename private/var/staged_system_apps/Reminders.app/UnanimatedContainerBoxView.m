@interface UnanimatedContainerBoxView
- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithArrangedSubviews:(id)a3;
- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithCoder:(id)a3;
- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UnanimatedContainerBoxView

- (void)layoutSubviews
{
  v2 = self;
  sub_1004544DC();
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UnanimatedContainerBoxView();
  return -[UnanimatedContainerBoxView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithArrangedSubviews:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_1000368FC(0, (unint64_t *)&qword_100788600);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for UnanimatedContainerBoxView();
  v5 = [(UnanimatedContainerBoxView *)&v7 initWithArrangedSubviews:isa];

  return v5;
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UnanimatedContainerBoxView();
  return [(UnanimatedContainerBoxView *)&v5 initWithCoder:a3];
}

@end