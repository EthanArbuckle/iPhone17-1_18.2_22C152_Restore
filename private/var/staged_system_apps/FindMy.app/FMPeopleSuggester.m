@interface FMPeopleSuggester
- (NSString)description;
- (_TtC6FindMy17FMPeopleSuggester)init;
- (void)dealloc;
@end

@implementation FMPeopleSuggester

- (_TtC6FindMy17FMPeopleSuggester)init
{
  return (_TtC6FindMy17FMPeopleSuggester *)sub_1002E0658();
}

- (NSString)description
{
  v2 = self;
  String.init(format:_:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)dealloc
{
  NSString v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:CNContactStoreDidChangeNotification object:0];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for FMPeopleSuggester();
  [(FMPeopleSuggester *)&v6 dealloc];
}

- (void).cxx_destruct
{
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy17FMPeopleSuggester_contactStore);
}

@end