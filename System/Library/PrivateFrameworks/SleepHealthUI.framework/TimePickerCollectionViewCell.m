@interface TimePickerCollectionViewCell
- (NSString)description;
- (_TtC13SleepHealthUI28TimePickerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI28TimePickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
@end

@implementation TimePickerCollectionViewCell

- (_TtC13SleepHealthUI28TimePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell____lazy_storage___timePicker) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TimePickerCollectionViewCell();
  v8 = -[TimePickerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1AD91D460();

  return v8;
}

- (_TtC13SleepHealthUI28TimePickerCollectionViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell____lazy_storage___timePicker) = 0;
  id v5 = a3;

  result = (_TtC13SleepHealthUI28TimePickerCollectionViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_1AD8865C8();

  v3 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)prepareForReuse
{
}

- (void)didMoveToSuperview
{
}

- (void).cxx_destruct
{
  sub_1AD886AB4((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI28TimePickerCollectionViewCell____lazy_storage___timePicker);
}

@end