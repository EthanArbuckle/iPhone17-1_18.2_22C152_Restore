@interface FMAccessoryDiscoverySearchingCard
- (_TtC6FindMy33FMAccessoryDiscoverySearchingCard)initWithContentView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMAccessoryDiscoverySearchingCard

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryDiscoverySearchingCard();
  id v2 = v3.receiver;
  [(FMAccessoryDiscoveryVideoCard *)&v3 viewDidLoad];
  sub_10029B368();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10029B5A8((uint64_t)a3);
}

- (_TtC6FindMy33FMAccessoryDiscoverySearchingCard)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy33FMAccessoryDiscoverySearchingCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end