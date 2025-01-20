@interface JSTVShowPlayBarViewController
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (_TtC16MusicApplication29JSTVShowPlayBarViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication29JSTVShowPlayBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSTVShowPlayBarViewController

- (_TtC16MusicApplication29JSTVShowPlayBarViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_contentItem) = 0;
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarUserActivity;
  type metadata accessor for UserActivity();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_3DAA14();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_episode) = 0;

  result = (_TtC16MusicApplication29JSTVShowPlayBarViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSTVShowPlayBarViewController();
  v4 = (char *)v5.receiver;
  [(JSTVShowPlayBarViewController *)&v5 viewDidAppear:v3];
  [*(id *)(*(void *)&v4[OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarUserActivity]+ 16) becomeCurrent:v5.receiver, v5.super_class];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2C1968();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2C1CE8();
}

- (NSString)playActivityFeatureName
{
  v2 = *(void (**)(void))&stru_68.segname[(**(void **)((char *)&self->super.super.super.isa
                                                       + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarViewModel) & swift_isaMask)
                                        + 8];
  BOOL v3 = self;
  v2();

  NSString v4 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSData)playActivityRecommendationData
{
  v2 = *(uint64_t (**)(void))((char *)&stru_68.offset
                           + (**(void **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarViewModel) & swift_isaMask));
  BOOL v3 = self;
  uint64_t v4 = v2();
  unint64_t v6 = v5;

  if (v6 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_AB09C0().super.isa;
    sub_4B654(v4, v6);
  }

  return (NSData *)isa;
}

- (_TtC16MusicApplication29JSTVShowPlayBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication29JSTVShowPlayBarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_contentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarViewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_tvShowPlayBarView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication29JSTVShowPlayBarViewController_episode);
}

@end