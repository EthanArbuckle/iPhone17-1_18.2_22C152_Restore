@interface FMAccessoryPairingEmojiSelectionTextField
- (BOOL)becomeFirstResponder;
- (BOOL)isSelected;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)init;
- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)initWithCoder:(id)a3;
- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation FMAccessoryPairingEmojiSelectionTextField

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField();
  return [(FMAccessoryPairingEmojiSelectionTextField *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField();
  id v4 = v5.receiver;
  [(FMAccessoryPairingEmojiSelectionTextField *)&v5 setSelected:v3];
  sub_10034F650();
}

- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)init
{
  return (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *)sub_10034FA40();
}

- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)initWithCoder:(id)a3
{
  return (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *)sub_10034FB38(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMAccessoryPairingEmojiSelectionTextField();
  id v2 = v4.receiver;
  [(FMAccessoryPairingEmojiSelectionTextField *)&v4 layoutSubviews];
  id v3 = [v2 layer];
  [v2 bounds];
  [v3 setCornerRadius:CGRectGetWidth(v5) * 0.5];
}

- (BOOL)becomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_hiddenTextField) becomeFirstResponder];
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  NSString v12 = String._bridgeToObjectiveC()();
  int IsSingleEmoji = CEMStringIsSingleEmoji();

  if (IsSingleEmoji)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1000E7754(v7, v9);
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v17 = v14;
    uint64_t v18 = v16;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  sub_10034F770(v17, v18);

  swift_bridgeObjectRelease();
  return 0;
}

- (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_hiddenTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_placeholderView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy41FMAccessoryPairingEmojiSelectionTextField_borderColor);
}

@end