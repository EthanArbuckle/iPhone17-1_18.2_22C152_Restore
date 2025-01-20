@interface SearchResultConfigurationCell
- (_TtC10MobileMail29SearchResultConfigurationCell)initWithCoder:(id)a3;
- (_TtC10MobileMail29SearchResultConfigurationCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation SearchResultConfigurationCell

- (void)prepareForReuse
{
  v2 = self;
  sub_1003E77C8();
}

- (_TtC10MobileMail29SearchResultConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail29SearchResultConfigurationCell *)sub_1003E78F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail29SearchResultConfigurationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail29SearchResultConfigurationCell *)sub_1003E7A5C(a3);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29SearchResultConfigurationCell_futureContacts));
}

@end