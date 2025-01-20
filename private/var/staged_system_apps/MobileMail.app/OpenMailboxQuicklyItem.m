@interface OpenMailboxQuicklyItem
- (BOOL)isEqual:(id)a3;
- (NSArray)pathComponents;
- (NSString)displayName;
- (NSString)identifier;
- (_TtC10MobileMail22OpenMailboxQuicklyItem)init;
@end

@implementation OpenMailboxQuicklyItem

- (NSString)identifier
{
  v2 = self;
  sub_1003B4080();

  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSString)displayName
{
  v2 = self;
  sub_1003B4148();

  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSArray)pathComponents
{
  v2 = self;
  sub_1003B4210();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)isa;
}

- (BOOL)isEqual:(id)a3
{
  swift_unknownObjectRetain();
  v3 = self;
  if (a3)
  {
    _bridgeAnyObjectToAny(_:)();
    sub_10023B414((uint64_t)v7, (uint64_t)v8);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1003B5100((uint64_t)v8);
  sub_100057EE8((uint64_t)v8);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (_TtC10MobileMail22OpenMailboxQuicklyItem)init
{
  return (_TtC10MobileMail22OpenMailboxQuicklyItem *)sub_1003B53D0();
}

- (void).cxx_destruct
{
  sub_100239544();
  sub_10001B0B0();
  sub_10022FCDC();
}

@end