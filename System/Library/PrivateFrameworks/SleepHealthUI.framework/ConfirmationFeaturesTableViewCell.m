@interface ConfirmationFeaturesTableViewCell
- (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ConfirmationFeaturesTableViewCell

- (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1AD9DF710();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell *)sub_1AD98BD44(a3, (uint64_t)a4, v6);
}

- (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD98D77C();
}

- (void).cxx_destruct
{
  sub_1AD8B1F34((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item, (unint64_t *)&qword_1E9A4A3B8, (unint64_t *)&qword_1E9A4A3C0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepFocusModeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepScreenView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_windDownView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepTrackingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_healthStatusView));
  swift_bridgeObjectRelease();
}

@end