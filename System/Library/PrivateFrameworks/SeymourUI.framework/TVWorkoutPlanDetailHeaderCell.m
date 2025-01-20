@interface TVWorkoutPlanDetailHeaderCell
- (BOOL)canBecomeFocused;
- (_TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation TVWorkoutPlanDetailHeaderCell

- (_TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell *)sub_23A598C98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A59AD20();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVWorkoutPlanDetailHeaderCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVWorkoutPlanDetailHeaderCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell_optionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVWorkoutPlanDetailHeaderCell_textStackView));

  swift_bridgeObjectRelease();
}

@end