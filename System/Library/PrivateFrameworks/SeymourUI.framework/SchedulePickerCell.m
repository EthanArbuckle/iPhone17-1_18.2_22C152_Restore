@interface SchedulePickerCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI18SchedulePickerCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI18SchedulePickerCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)timePickerPressed;
@end

@implementation SchedulePickerCell

- (_TtC9SeymourUI18SchedulePickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18SchedulePickerCell *)sub_23A373F38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18SchedulePickerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A376770();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SchedulePickerCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(SchedulePickerCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(SchedulePickerCell *)v9 contentView];
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
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_lengthPickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_lengthPickerTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_timePickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_timePickerTitleLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_weekdayPickerView);
}

- (void)timePickerPressed
{
  uint64_t v3 = type metadata accessor for ShelfItemAction();
  __n128 v4 = MEMORY[0x270FA5388](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_delegate, v4);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = swift_storeEnumTagMultiPayload();
    MEMORY[0x270FA5388](v9);
    *(&v11 - 4) = 0;
    *((unsigned char *)&v11 - 24) = 1;
    *(&v11 - 2) = (uint64_t)v6;
    *(&v11 - 1) = v8;
    id v10 = self;
    sub_239C831A4(v10, sub_239C74FF8, &v11 - 6, v8);
    swift_unknownObjectRelease();
    sub_239C74FFC((uint64_t)v6);
  }
}

@end