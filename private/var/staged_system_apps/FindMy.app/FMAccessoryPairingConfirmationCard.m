@interface FMAccessoryPairingConfirmationCard
- (_TtC6FindMy34FMAccessoryPairingConfirmationCard)initWithContentView:(id)a3;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)dealloc;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation FMAccessoryPairingConfirmationCard

- (void)dealloc
{
  v2 = self;
  sub_1001CD6F0();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  sub_1001D1550((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy34FMAccessoryPairingConfirmationCard_viewModel], type metadata accessor for FMAccessoryPairingConfirmationCard.ViewModel);
  swift_release();

  swift_release();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryPairingConfirmationCard(0);
  id v2 = v3.receiver;
  [(FMAccessoryPairingConfirmationCard *)&v3 viewDidLoad];
  sub_1001CD9CC();
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FMAccessoryPairingConfirmationCard(0);
  [(FMAccessoryPairingConfirmationCard *)&v2 viewDidLayoutSubviews];
}

- (_TtC6FindMy34FMAccessoryPairingConfirmationCard)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy34FMAccessoryPairingConfirmationCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  type metadata accessor for FMDiscoveredAccessoryAnnotation();
  if (swift_dynamicCastClass())
  {
    uint64_t v7 = qword_1006AE028;
    id v8 = a3;
    swift_unknownObjectRetain();
    v9 = self;
    if (v7 != -1) {
      swift_once();
    }
    NSString v10 = String._bridgeToObjectiveC()();
    id v11 = [v8 dequeueReusableAnnotationViewWithIdentifier:v10 forAnnotation:a4];

    swift_unknownObjectRelease();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end