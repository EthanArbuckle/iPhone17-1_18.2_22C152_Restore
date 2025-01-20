@interface UITextViewRepresentable.Coordinator
- (_TtCV9TipsTryIt23UITextViewRepresentable11Coordinator)init;
- (void)handleTapWithSender:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
@end

@implementation UITextViewRepresentable.Coordinator

- (void)handleTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F74419C();
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_text);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = sub_25F78BFD0();
    uint64_t v10 = v9;

    v11 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_text);
    uint64_t *v11 = v8;
    v11[1] = v10;

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F740EE0(v4);
}

- (_TtCV9TipsTryIt23UITextViewRepresentable11Coordinator)init
{
  result = (_TtCV9TipsTryIt23UITextViewRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_textView));
  swift_release();
  swift_bridgeObjectRelease();
}

@end