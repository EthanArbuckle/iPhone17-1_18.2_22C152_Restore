@interface WorkoutPlanWeekdayCell
- (_TtC9SeymourUI22WorkoutPlanWeekdayCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI22WorkoutPlanWeekdayCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation WorkoutPlanWeekdayCell

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A18C40);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for WorkoutPlanWeekdayCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(WorkoutPlanWeekdayCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for HostedContentIdentifier();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier;
  swift_beginAccess();
  sub_23A284D54((uint64_t)v5, v9);
  swift_endAccess();
}

- (_TtC9SeymourUI22WorkoutPlanWeekdayCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContent) = 0;
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier;
  uint64_t v9 = type metadata accessor for HostedContentIdentifier();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WorkoutPlanWeekdayCell();
  return -[WorkoutPlanWeekdayCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI22WorkoutPlanWeekdayCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContent) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier;
  uint64_t v6 = type metadata accessor for HostedContentIdentifier();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WorkoutPlanWeekdayCell();
  return [(WorkoutPlanWeekdayCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContent));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier;

  sub_23A284DBC((uint64_t)v3);
}

@end