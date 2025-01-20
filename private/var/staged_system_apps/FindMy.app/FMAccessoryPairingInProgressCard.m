@interface FMAccessoryPairingInProgressCard
- (_TtC6FindMy32FMAccessoryPairingInProgressCard)initWithContentView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMAccessoryPairingInProgressCard

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryPairingInProgressCard();
  id v2 = v3.receiver;
  [(FMAccessoryPairingInProgressCard *)&v3 viewDidLoad];
  sub_10047DAE4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10047D2CC(a3);
}

- (_TtC6FindMy32FMAccessoryPairingInProgressCard)initWithContentView:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy32FMAccessoryPairingInProgressCard_imageView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = a3;
  v8 = self;
  *(void *)&self->PRXCardContentViewController_opaque[v5] = [v6 init];
  *(void *)&v8->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy32FMAccessoryPairingInProgressCard_imageFetchCancellable] = 0;
  swift_unknownObjectWeakInit();

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMAccessoryPairingInProgressCard();
  v9 = [(FMAccessoryPairingInProgressCard *)&v11 initWithContentView:v7];

  return v9;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectWeakDestroy();
}

@end