@interface TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView
- (UIEdgeInsets)effectiveLayoutMargins;
- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithArrangedSubviews:(id)isa;
- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithCoder:(id)a3;
- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithFrame:(CGRect)a3;
@end

@implementation TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView

- (UIEdgeInsets)effectiveLayoutMargins
{
  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  id v2 = v16.receiver;
  [(TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView *)&v16 effectiveLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (qword_100785438 != -1) {
    swift_once();
  }
  double v11 = *(double *)&qword_100797548;

  double v12 = v6 - v11;
  double v13 = v10 - v11;
  double v14 = v4;
  double v15 = v8;
  result.right = v13;
  result.bottom = v15;
  result.left = v12;
  result.top = v14;
  return result;
}

- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithArrangedSubviews:(id)isa
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
  double v6 = [(TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView *)&v8 initWithArrangedSubviews:isa];

  return v6;
}

- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView *)&v5 initWithCoder:a3];
}

@end