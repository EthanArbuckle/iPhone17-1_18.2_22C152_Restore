@interface Interstellar.HeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCO16MusicApplication12Interstellar10HeaderView)initWithCoder:(id)a3;
- (_TtCO16MusicApplication12Interstellar10HeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation Interstellar.HeaderView

- (_TtCO16MusicApplication12Interstellar10HeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCO16MusicApplication12Interstellar10HeaderView *)sub_2B7D64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO16MusicApplication12Interstellar10HeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2BE884();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_contentView) sizeThatFits:a3.width, a3.height];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2B8058();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_seeAllButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_separator));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_buttonSelectionHandler);

  sub_1A528(v3);
}

@end