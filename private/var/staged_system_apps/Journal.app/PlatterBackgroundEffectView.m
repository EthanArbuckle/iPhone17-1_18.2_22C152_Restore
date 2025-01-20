@interface PlatterBackgroundEffectView
- (_TtC7Journal27PlatterBackgroundEffectView)initWithCoder:(id)a3;
- (_TtC7Journal27PlatterBackgroundEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlatterBackgroundEffectView

- (_TtC7Journal27PlatterBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal27PlatterBackgroundEffectView *)sub_100668700(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal27PlatterBackgroundEffectView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100668EC8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_contentView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_fillView);
}

@end