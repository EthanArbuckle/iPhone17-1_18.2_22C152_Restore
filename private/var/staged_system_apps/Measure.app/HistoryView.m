@interface HistoryView
- (_TtC7Measure11HistoryView)initWithCoder:(id)a3;
- (_TtC7Measure11HistoryView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation HistoryView

- (_TtC7Measure11HistoryView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure11HistoryView *)sub_1000C0BE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure11HistoryView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Measure11HistoryView_tableView;
  id v6 = objc_allocWithZone((Class)UITableView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  swift_unknownObjectWeakInit();

  result = (_TtC7Measure11HistoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1000C1234((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end