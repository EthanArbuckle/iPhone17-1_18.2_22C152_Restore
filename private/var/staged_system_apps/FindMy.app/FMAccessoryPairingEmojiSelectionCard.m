@interface FMAccessoryPairingEmojiSelectionCard
- (_TtC6FindMy36FMAccessoryPairingEmojiSelectionCard)initWithContentView:(id)a3;
- (void)updateButtonState;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMAccessoryPairingEmojiSelectionCard

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionCard();
  v4 = (char *)v5.receiver;
  [(FMAccessoryPairingEmojiSelectionCard *)&v5 viewWillAppear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_emojiSelectionView] becomeFirstResponder];
}

- (void)updateButtonState
{
  v2 = self;
  sub_1003511CC();
}

- (_TtC6FindMy36FMAccessoryPairingEmojiSelectionCard)initWithContentView:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_emojiSelectionView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField());
  id v7 = a3;
  v8 = self;
  *(void *)&self->PRXCardContentViewController_opaque[v5] = [v6 init];
  *(void *)&v8->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_continueAction] = 0;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionCard();
  v9 = [(FMAccessoryPairingEmojiSelectionCard *)&v11 initWithContentView:v7];

  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy36FMAccessoryPairingEmojiSelectionCard_continueAction];
}

@end