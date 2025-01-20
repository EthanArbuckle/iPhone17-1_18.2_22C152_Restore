@interface ContactConfigurationCell
- (_TtC10MobileMail24ContactConfigurationCell)initWithCoder:(id)a3;
- (_TtC10MobileMail24ContactConfigurationCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ContactConfigurationCell

- (_TtC10MobileMail24ContactConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail24ContactConfigurationCell *)sub_10027577C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail24ContactConfigurationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100276438();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002765F8(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100276CC8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_label));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_imageSizeConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell____lazy_storage___avatarViewController));
  sub_100239544();
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_contact));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_futureContact));
}

@end