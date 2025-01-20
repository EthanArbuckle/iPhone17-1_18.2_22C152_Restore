@interface ChromeBar
- (_TtC17SequoiaTranslator9ChromeBar)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator9ChromeBar)initWithFrame:(CGRect)a3;
@end

@implementation ChromeBar

- (_TtC17SequoiaTranslator9ChromeBar)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator9ChromeBar *)sub_100036084(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator9ChromeBar)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC17SequoiaTranslator9ChromeBar_backgroundView;
  uint64_t v5 = qword_1002EE568;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)[objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:qword_1002F0460];

  result = (_TtC17SequoiaTranslator9ChromeBar *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator9ChromeBar_backgroundView));
}

@end