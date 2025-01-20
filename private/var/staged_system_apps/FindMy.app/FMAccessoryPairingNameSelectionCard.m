@interface FMAccessoryPairingNameSelectionCard
- (_TtC6FindMy35FMAccessoryPairingNameSelectionCard)initWithContentView:(id)a3;
- (void)updateButtonState;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMAccessoryPairingNameSelectionCard

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryPairingNameSelectionCard();
  v4 = (char *)v5.receiver;
  [(FMAccessoryPairingNameSelectionCard *)&v5 viewWillAppear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC6FindMy35FMAccessoryPairingNameSelectionCard_nameLabel] becomeFirstResponder];
}

- (void)updateButtonState
{
  v2 = self;
  sub_1001785B0();
}

- (_TtC6FindMy35FMAccessoryPairingNameSelectionCard)initWithContentView:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC6FindMy35FMAccessoryPairingNameSelectionCard_nameLabel;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMAccessoryNameTextField());
  id v7 = a3;
  v8 = self;
  *(void *)&self->PRXCardContentViewController_opaque[v5] = [v6 init];
  *(void *)&v8->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy35FMAccessoryPairingNameSelectionCard_backAction] = 0;
  *(void *)&v8->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy35FMAccessoryPairingNameSelectionCard_continueAction] = 0;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMAccessoryPairingNameSelectionCard();
  v9 = [(FMAccessoryPairingNameSelectionCard *)&v11 initWithContentView:v7];

  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy35FMAccessoryPairingNameSelectionCard_continueAction];
}

@end