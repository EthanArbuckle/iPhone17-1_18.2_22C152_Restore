@interface PhotoContentView
- (_TtC10MobileMail16PhotoContentView)initWithCoder:(id)a3;
- (_TtC10MobileMail16PhotoContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PhotoContentView

- (_TtC10MobileMail16PhotoContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003BAA80();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003BAC64();
}

- (_TtC10MobileMail16PhotoContentView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail16PhotoContentView *)sub_1003BAEE8();
}

- (void).cxx_destruct
{
  sub_1003B9F18((uint64_t)self + OBJC_IVAR____TtC10MobileMail16PhotoContentView_cornerConfiguration);
  sub_10024C328((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail16PhotoContentView____lazy_storage___avatarViewController));
}

@end