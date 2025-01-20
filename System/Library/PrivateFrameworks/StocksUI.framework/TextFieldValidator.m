@interface TextFieldValidator
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC8StocksUI18TextFieldValidator)init;
@end

@implementation TextFieldValidator

- (BOOL)textFieldShouldReturn:(id)a3
{
  v4 = *(uint64_t (**)(uint64_t, unint64_t))((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8StocksUI18TextFieldValidator_isTextValid);
  id v5 = a3;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_text);
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = sub_20A8CE280();
    unint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v11 = 0xE000000000000000;
  }
  char v12 = v4(v9, v11);
  uint64_t v13 = swift_bridgeObjectRelease();
  if (v12) {
    (*(void (**)(uint64_t))((char *)&v6->super.isa + OBJC_IVAR____TtC8StocksUI18TextFieldValidator_submit))(v13);
  }

  return v12 & 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  sub_20A8CE280();
  id v7 = a3;
  v8 = self;
  sub_20A891984(v7);

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC8StocksUI18TextFieldValidator)init
{
  result = (_TtC8StocksUI18TextFieldValidator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end