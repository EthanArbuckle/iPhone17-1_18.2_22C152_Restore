@interface FMAccessoryDiscoveryVideoCard
- (_TtC6FindMy29FMAccessoryDiscoveryVideoCard)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMAccessoryDiscoveryVideoCard

- (void)viewDidLoad
{
  v2 = self;
  sub_1001A0AF8();
}

- (_TtC6FindMy29FMAccessoryDiscoveryVideoCard)initWithContentView:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy29FMAccessoryDiscoveryVideoCard_videoPlayer;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMAVPlayerView());
  id v7 = a3;
  v8 = self;
  *(void *)&self->PRXCardContentViewController_opaque[v5] = sub_1002F651C(0, 0.25);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryVideoCard();
  v9 = [(FMAccessoryDiscoveryVideoCard *)&v11 initWithContentView:v7];

  return v9;
}

- (void).cxx_destruct
{
}

@end