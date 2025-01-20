@interface SessionRangedCoachingEventView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9SeymourUI30SessionRangedCoachingEventView)initWithCoder:(id)a3;
- (_TtC9SeymourUI30SessionRangedCoachingEventView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionRangedCoachingEventView

- (_TtC9SeymourUI30SessionRangedCoachingEventView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30SessionRangedCoachingEventView *)sub_239EBAE50();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239EBA750();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_239EBAA80();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SessionRangedCoachingEventView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI30SessionRangedCoachingEventView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EBB5D4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_unitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_plusImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_plusImage);
}

@end