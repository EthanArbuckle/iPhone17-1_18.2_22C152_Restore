@interface CurrencyAmountTextField.AmountTextField
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGRect)caretRectForPosition:(id)a3;
- (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField)initWithCoder:(id)a3;
- (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField)initWithFrame:(CGRect)a3;
- (id)selectionRectsForRange:(id)a3;
- (void)dealloc;
- (void)editingChanged;
- (void)resetSelection;
- (void)textFieldDidBeginEditing:(id)a3;
@end

@implementation CurrencyAmountTextField.AmountTextField

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, *MEMORY[0x1E4FB3058], 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CurrencyAmountTextField.AmountTextField();
  [(CurrencyAmountTextField.AmountTextField *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField____lazy_storage___currencyFormatter);
}

- (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField_firstEdit) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField____lazy_storage___currencyFormatter) = 0;
  id v4 = a3;

  result = (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)editingChanged
{
  v2 = self;
  sub_19F7E7434();
}

- (void)resetSelection
{
  v2 = self;
  id v3 = [(CurrencyAmountTextField.AmountTextField *)v2 endOfDocument];
  id v4 = [(CurrencyAmountTextField.AmountTextField *)v2 endOfDocument];
  id v5 = [(CurrencyAmountTextField.AmountTextField *)v2 textRangeFromPosition:v3 toPosition:v4];

  [(CurrencyAmountTextField.AmountTextField *)v2 setSelectedTextRange:v5];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1A03B4988();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_19F7E77EC(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_19F7E80E8();
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_19F7E8D94();

  return self & 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A03B57A8();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_19F48B93C((uint64_t)v6, (uint64_t *)&unk_1E949FF20);
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  sub_19F48BAC4(0, (unint64_t *)&unk_1E94A8B50);
  id v3 = (void *)sub_1A03B4C38();

  return v3;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtCV9PassKitUIP33_9DF5EB707CF8ADE05C1E2D1C73483CEC23CurrencyAmountTextField15AmountTextField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end