@interface TTRIReminderLocationPickerViewCell
- (UIImageView)pinImageView;
- (UILabel)addressLabel;
- (UILabel)nameLabel;
- (UIView)pinImageBackgroundView;
- (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setAddressLabel:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPinImageBackgroundView:(id)a3;
- (void)setPinImageView:(id)a3;
@end

@implementation TTRIReminderLocationPickerViewCell

- (void)awakeFromNib
{
  v2 = self;
  sub_1B93F8598();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B93F8924();
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel));
}

- (void)setNameLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)addressLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel));
}

- (void)setAddressLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel) = (Class)a3;
  id v3 = a3;
}

- (UIImageView)pinImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView));
}

- (void)setPinImageView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView) = (Class)a3;
  id v3 = a3;
}

- (UIView)pinImageBackgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView));
}

- (void)setPinImageBackgroundView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView) = (Class)a3;
  id v3 = a3;
}

- (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1B996E9F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell *)sub_1B93F8BE4(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell *)sub_1B93F8D14(a3);
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_viewModelItem;
  sub_1B93FA0C0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_viewModelItem), *((void *)v3 + 1), *((void *)v3 + 2), *((void *)v3 + 3), *((void *)v3 + 4), *((void *)v3 + 5), *((void **)v3 + 6), *((void **)v3 + 7));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView));
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView);
}

@end