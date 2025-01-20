@interface SearchPreparingView
- (_TtC10MobileMail19SearchPreparingView)initWithCoder:(id)a3;
- (_TtC10MobileMail19SearchPreparingView)initWithFrame:(CGRect)a3;
- (void)updateWith:(id)a3;
@end

@implementation SearchPreparingView

- (void)updateWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003E5DA8(a3);
}

- (_TtC10MobileMail19SearchPreparingView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail19SearchPreparingView *)sub_1003E5E7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail19SearchPreparingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E68AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_explanationLabel));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_indexStatus));
}

@end