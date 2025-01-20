@interface BackgroundContentView
- (_TtC19ExtragalacticPoster21BackgroundContentView)initWithCoder:(id)a3;
- (_TtC19ExtragalacticPoster21BackgroundContentView)initWithFrame:(CGRect)a3;
@end

@implementation BackgroundContentView

- (_TtC19ExtragalacticPoster21BackgroundContentView)initWithFrame:(CGRect)a3
{
  return (_TtC19ExtragalacticPoster21BackgroundContentView *)sub_100015D20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19ExtragalacticPoster21BackgroundContentView)initWithCoder:(id)a3
{
  return (_TtC19ExtragalacticPoster21BackgroundContentView *)sub_100015E44(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_primaryBannerLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_secondaryBannerLayer);
}

@end