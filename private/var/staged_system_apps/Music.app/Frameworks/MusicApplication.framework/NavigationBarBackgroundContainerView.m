@interface NavigationBarBackgroundContainerView
- (_TtC16MusicApplication36NavigationBarBackgroundContainerView)initWithCoder:(id)a3;
- (_TtC16MusicApplication36NavigationBarBackgroundContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NavigationBarBackgroundContainerView

- (_TtC16MusicApplication36NavigationBarBackgroundContainerView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC16MusicApplication36NavigationBarBackgroundContainerView_visibleBackgroundBottom;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (_TtC16MusicApplication36NavigationBarBackgroundContainerView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B48CC();
}

- (_TtC16MusicApplication36NavigationBarBackgroundContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication36NavigationBarBackgroundContainerView_backgroundView));
}

@end