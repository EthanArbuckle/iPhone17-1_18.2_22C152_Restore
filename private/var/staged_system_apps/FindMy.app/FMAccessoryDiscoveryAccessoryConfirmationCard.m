@interface FMAccessoryDiscoveryAccessoryConfirmationCard
- (_TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMAccessoryDiscoveryAccessoryConfirmationCard

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryAccessoryConfirmationCard(0);
  id v2 = v3.receiver;
  [(FMAccessoryDiscoveryAccessoryConfirmationCard *)&v3 viewDidLoad];
  sub_10048DD1C();
  sub_10048E230();
}

- (_TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10048F364((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy45FMAccessoryDiscoveryAccessoryConfirmationCard_viewModel], type metadata accessor for FMAccessoryDiscoveryAccessoryConfirmationCard.ViewModel);

  swift_unknownObjectWeakDestroy();
}

@end