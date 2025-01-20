@interface AdjustableSeparatorInsetListCell
- (_TtC10MobileMail32AdjustableSeparatorInsetListCell)initWithCoder:(id)a3;
- (_TtC10MobileMail32AdjustableSeparatorInsetListCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation AdjustableSeparatorInsetListCell

- (void)updateConstraints
{
  v2 = self;
  sub_100251FC0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002529B4(a3);
}

- (_TtC10MobileMail32AdjustableSeparatorInsetListCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail32AdjustableSeparatorInsetListCell *)sub_10025301C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail32AdjustableSeparatorInsetListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail32AdjustableSeparatorInsetListCell *)sub_1002531B0(a3);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail32AdjustableSeparatorInsetListCell_leadingConstraint));
}

@end