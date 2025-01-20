@interface FMAccessoryDiscoveryItemSearchingCard
- (_TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard)initWithContentView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMAccessoryDiscoveryItemSearchingCard

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryItemSearchingCard();
  id v2 = v3.receiver;
  [(FMAccessoryDiscoveryVideoCard *)&v3 viewDidLoad];
  sub_1003F8F10();
  sub_1003F9088();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1003F8820(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1003F8D28(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryItemSearchingCard();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMAccessoryDiscoveryItemSearchingCard *)&v6 traitCollectionDidChange:v4];
  sub_1003F9088();
}

- (_TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy37FMAccessoryDiscoveryItemSearchingCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
}

@end