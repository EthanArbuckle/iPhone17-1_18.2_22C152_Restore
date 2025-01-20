@interface TTRIHelpLinkHeaderFooterContentConfiguration.ContentView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView)initWithCoder:(id)a3;
- (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView)initWithFrame:(CGRect)a3;
@end

@implementation TTRIHelpLinkHeaderFooterContentConfiguration.ContentView

- (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView_textViewConstraints) = 0;
  id v4 = a3;

  result = (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7 = sub_1B996A580();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996A520();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1B9961E58();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView)initWithFrame:(CGRect)a3
{
  result = (_TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self+ OBJC_IVAR____TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV15RemindersUICore44TTRIHelpLinkHeaderFooterContentConfigurationP33_2108835FC8B9BCCAF061C8AA871EA9D611ContentView_textView));

  swift_bridgeObjectRelease();
}

@end