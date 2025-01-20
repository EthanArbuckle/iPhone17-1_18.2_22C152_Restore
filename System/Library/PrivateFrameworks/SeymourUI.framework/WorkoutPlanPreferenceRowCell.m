@interface WorkoutPlanPreferenceRowCell
- (_TtC9SeymourUI28WorkoutPlanPreferenceRowCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI28WorkoutPlanPreferenceRowCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation WorkoutPlanPreferenceRowCell

- (_TtC9SeymourUI28WorkoutPlanPreferenceRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI28WorkoutPlanPreferenceRowCell *)sub_239FEB234(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI28WorkoutPlanPreferenceRowCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FEC12C();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for WorkoutPlanPreferenceRowCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(WorkoutPlanPreferenceRowCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanPreferenceRowCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanPreferenceRowCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanPreferenceRowCell_itemInfo);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanPreferenceRowCell_appearance);
  objc_release(*(id *)((char *)&self->super.super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanPreferenceRowCell_appearance));
  swift_bridgeObjectRelease();
}

@end