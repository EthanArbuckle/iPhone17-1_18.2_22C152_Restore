@interface FMAccessoryDiscoveryFlowSelectionCard
- (_TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMAccessoryDiscoveryFlowSelectionCard

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryFlowSelectionCard();
  v2 = (char *)v5.receiver;
  [(FMAccessoryDiscoveryFlowSelectionCard *)&v5 viewDidLoad];
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard_imageView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)&v2[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard_imageViewContainer] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [v2 contentView];
  [v4 addSubview:v3];

  sub_10025A720();
  sub_10025ACEC();
}

- (_TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy37FMAccessoryDiscoveryFlowSelectionCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end