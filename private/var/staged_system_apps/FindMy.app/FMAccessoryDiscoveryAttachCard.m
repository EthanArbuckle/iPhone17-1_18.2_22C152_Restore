@interface FMAccessoryDiscoveryAttachCard
- (_TtC6FindMy30FMAccessoryDiscoveryAttachCard)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMAccessoryDiscoveryAttachCard

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryAttachCard();
  v2 = (char *)v5.receiver;
  [(FMAccessoryDiscoveryAttachCard *)&v5 viewDidLoad];
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy30FMAccessoryDiscoveryAttachCard_imageView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)&v2[OBJC_IVAR____TtC6FindMy30FMAccessoryDiscoveryAttachCard_imageViewContainer] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [v2 contentView];
  [v4 addSubview:v3];

  sub_1004C09A4();
  sub_1004C0EA8();
}

- (_TtC6FindMy30FMAccessoryDiscoveryAttachCard)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy30FMAccessoryDiscoveryAttachCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end