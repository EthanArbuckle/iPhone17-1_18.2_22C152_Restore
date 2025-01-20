@interface TempOptInReprompt
- (NSArray)keyCommands;
- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3;
- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueButtonPressed;
@end

@implementation TempOptInReprompt

- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3
{
  return (_TtC17SequoiaTranslator17TempOptInReprompt *)sub_1001D6B9C();
}

- (NSArray)keyCommands
{
  sub_100007620((uint64_t *)&unk_1002F0270);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10024CE10;
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [self keyCommandWithInput:v5 modifierFlags:0 action:"continueButtonPressed"];

  *(void *)(v3 + 32) = v6;
  specialized Array._endMutation()();

  sub_1001D738C();
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (void)continueButtonPressed
{
  v2 = self;
  sub_1001D70B4();
}

- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC17SequoiaTranslator17TempOptInReprompt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator17TempOptInReprompt)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC17SequoiaTranslator17TempOptInReprompt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end