@interface InterludeContentView
- (_TtC7NewsUI220InterludeContentView)initWithCoder:(id)a3;
- (_TtC7NewsUI220InterludeContentView)initWithFrame:(CGRect)a3;
@end

@implementation InterludeContentView

- (_TtC7NewsUI220InterludeContentView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI220InterludeContentView *)sub_1DF6E3070();
}

- (_TtC7NewsUI220InterludeContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF6E338C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220InterludeContentView____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220InterludeContentView_iconContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220InterludeContentView_subtitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI220InterludeContentView____lazy_storage___maskImageView);
}

@end