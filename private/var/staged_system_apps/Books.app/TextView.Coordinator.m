@interface TextView.Coordinator
- (_TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator)init;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TextView.Coordinator

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007C78BC(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007C79F8(v4);
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007C7B78(v4);
}

- (_TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator)init
{
  result = (_TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end