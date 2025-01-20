@interface CurrencyUITextField
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC9PassKitUI19CurrencyUITextField)initWithCoder:(id)a3;
- (_TtC9PassKitUI19CurrencyUITextField)initWithFrame:(CGRect)a3;
- (void)deleteBackward;
- (void)editingChanged;
- (void)resetSelection;
@end

@implementation CurrencyUITextField

- (_TtC9PassKitUI19CurrencyUITextField)initWithCoder:(id)a3
{
  result = (_TtC9PassKitUI19CurrencyUITextField *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)deleteBackward
{
  v2 = self;
  sub_19FA1FB5C();
}

- (void)editingChanged
{
  v2 = self;
  sub_19FA1FCD8();
}

- (void)resetSelection
{
  v2 = self;
  id v3 = [(CurrencyUITextField *)v2 endOfDocument];
  id v4 = [(CurrencyUITextField *)v2 endOfDocument];
  id v5 = [(CurrencyUITextField *)v2 textRangeFromPosition:v3 toPosition:v4];

  [(CurrencyUITextField *)v2 setSelectedTextRange:v5];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1A03B4988();
  uint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_19FA200CC(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC9PassKitUI19CurrencyUITextField_pk_isEditable);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (_TtC9PassKitUI19CurrencyUITextField)initWithFrame:(CGRect)a3
{
  result = (_TtC9PassKitUI19CurrencyUITextField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI19CurrencyUITextField_formatter);
}

@end