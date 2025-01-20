@interface TimePickerTableViewCell
- (NSString)description;
- (_TtC13SleepHealthUI23TimePickerTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI23TimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
@end

@implementation TimePickerTableViewCell

- (_TtC13SleepHealthUI23TimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1AD9DF710();
    v6 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((void *)v6 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker) = 0;
    v7 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((void *)v8 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker) = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TimePickerTableViewCell();
  v9 = [(TimePickerTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:v7];

  v10 = v9;
  sub_1AD91D584();

  return v10;
}

- (_TtC13SleepHealthUI23TimePickerTableViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker) = 0;
  id v5 = a3;

  result = (_TtC13SleepHealthUI23TimePickerTableViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_1AD91DCBC();

  v3 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AD91DDC8((SEL *)&selRef_prepareForReuse);
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_1AD91DDC8((SEL *)&selRef_didMoveToSuperview);
}

- (void).cxx_destruct
{
  sub_1AD8B1F34((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell_item, (unint64_t *)&qword_1E9A4A3B8, (unint64_t *)&qword_1E9A4A3C0);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI23TimePickerTableViewCell____lazy_storage___timePicker);
}

@end