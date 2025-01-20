@interface HomeScreenConfigurationPosterControlContentView
- (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView)initWithCoder:(id)a3;
- (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HomeScreenConfigurationPosterControlContentView

- (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_primaryImage) = 0;
  id v4 = a3;

  result = (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView *)sub_1D3372A88();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D32E2990();
}

- (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_primaryImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_primaryImageView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_floatingImageView);
}

@end