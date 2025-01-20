@interface DateRangeTitleCell
- (_TtC7Journal18DateRangeTitleCell)initWithCoder:(id)a3;
- (_TtC7Journal18DateRangeTitleCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation DateRangeTitleCell

- (_TtC7Journal18DateRangeTitleCell)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18DateRangeTitleCell *)sub_100466D2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1004676F8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7Journal18DateRangeTitleCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100468594();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18DateRangeTitleCell_mainStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18DateRangeTitleCell_listContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18DateRangeTitleCell_datePicker));
  id v3 = (char *)self + OBJC_IVAR____TtC7Journal18DateRangeTitleCell__title;
  uint64_t v4 = sub_100010218(&qword_10080D5F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC7Journal18DateRangeTitleCell__selectedDate;
  uint64_t v6 = sub_100010218(&qword_10080D5E8);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end