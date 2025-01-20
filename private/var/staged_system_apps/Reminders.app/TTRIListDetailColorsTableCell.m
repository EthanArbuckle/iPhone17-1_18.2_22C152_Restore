@interface TTRIListDetailColorsTableCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9Reminders29TTRIListDetailColorsTableCell)initWithCoder:(id)a3;
- (_TtC9Reminders29TTRIListDetailColorsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIListDetailColorsTableCell

- (_TtC9Reminders29TTRIListDetailColorsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC9Reminders29TTRIListDetailColorsTableCell *)sub_10004A17C(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders29TTRIListDetailColorsTableCell)initWithCoder:(id)a3
{
  *(void *)&self->gridView[OBJC_IVAR____TtC9Reminders29TTRIListDetailColorsTableCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC9Reminders29TTRIListDetailColorsTableCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat width = a3.width;
  uint64_t v6 = self;
  TTRListAppearanceGridView.height(forWidth:)();
  double v8 = v7;

  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders29TTRIListDetailColorsTableCell_gridView));
  v3 = (char *)self + OBJC_IVAR____TtC9Reminders29TTRIListDetailColorsTableCell_delegate;

  sub_1000499D4((uint64_t)v3);
}

@end