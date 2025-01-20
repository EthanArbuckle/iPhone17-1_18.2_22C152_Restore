@interface StateOfMindCalendarDayCell
- (_TtC14MentalHealthUI26StateOfMindCalendarDayCell)initWithCoder:(id)a3;
- (_TtC14MentalHealthUI26StateOfMindCalendarDayCell)initWithFrame:(CGRect)a3;
@end

@implementation StateOfMindCalendarDayCell

- (_TtC14MentalHealthUI26StateOfMindCalendarDayCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC14MentalHealthUI26StateOfMindCalendarDayCell_day;
  uint64_t v10 = type metadata accessor for StateOfMindCalendarDay();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v11 = -[StateOfMindCalendarDayCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  *(void *)(swift_allocObject() + 16) = v11;
  v12 = v11;
  sub_256178378();

  return v12;
}

- (_TtC14MentalHealthUI26StateOfMindCalendarDayCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC14MentalHealthUI26StateOfMindCalendarDayCell_day;
  uint64_t v6 = type metadata accessor for StateOfMindCalendarDay();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC14MentalHealthUI26StateOfMindCalendarDayCell *)sub_256178658();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end