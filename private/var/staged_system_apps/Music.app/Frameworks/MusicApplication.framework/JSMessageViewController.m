@interface JSMessageViewController
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (_TtC16MusicApplication23JSMessageViewController)initWithCoder:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSMessageViewController

- (_TtC16MusicApplication23JSMessageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication23JSMessageViewController____lazy_storage___noContentView) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication23JSMessageViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)playActivityFeatureName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSData)playActivityRecommendationData
{
  uint64_t v2 = JSViewModel.playActivityRecommendationData.getter();
  if (v3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    Class isa = sub_AB09C0().super.isa;
    sub_4B654(v5, v6);
  }

  return (NSData *)isa;
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_53E8D0();
}

- (void)viewDidLayoutSubviews
{
  uint64_t v2 = self;
  sub_53EB2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSMessageViewController_messageViewModel));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication23JSMessageViewController____lazy_storage___noContentView);
}

@end