@interface WeekdayPlannerEmptyCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI23WeekdayPlannerEmptyCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI23WeekdayPlannerEmptyCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation WeekdayPlannerEmptyCell

- (_TtC9SeymourUI23WeekdayPlannerEmptyCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23WeekdayPlannerEmptyCell *)sub_23A5FBE1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23WeekdayPlannerEmptyCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC9SeymourUI23WeekdayPlannerEmptyCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI23WeekdayPlannerEmptyCell_itemInfo;
  uint64_t v6 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC9SeymourUI23WeekdayPlannerEmptyCell_styleProvider;
  uint64_t v8 = qword_268A0C838;
  id v9 = a3;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_268A0C860;
  id v11 = (id)qword_268A461D0;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_268A461F8;
  v13 = (Class *)((char *)&self->super.super.super.super.super.isa + v7);
  void *v13 = v11;
  v13[1] = v12;

  result = (_TtC9SeymourUI23WeekdayPlannerEmptyCell *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for WeekdayPlannerEmptyCell();
  v11.receiver = self;
  v11.super_class = v6;
  uint64_t v7 = self;
  [(WeekdayPlannerEmptyCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23WeekdayPlannerEmptyCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(WeekdayPlannerEmptyCell *)v9 contentView];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23WeekdayPlannerEmptyCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23WeekdayPlannerEmptyCell_itemInfo);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI23WeekdayPlannerEmptyCell_styleProvider);
}

@end