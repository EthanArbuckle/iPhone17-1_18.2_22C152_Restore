@interface CSDConversationLinkGeneratorDescriptor
- (BOOL)isEqual:(id)a3;
- (CSDConversationLinkGeneratorDescriptor)init;
- (CSDConversationLinkGeneratorDescriptor)initWithIdentifier:(id)a3 version:(int64_t)a4;
- (NSString)identifier;
- (int64_t)hash;
- (int64_t)version;
- (void)setIdentifier:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation CSDConversationLinkGeneratorDescriptor

- (NSString)identifier
{
  sub_100325C98();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_100325D44(v4, v6);
}

- (int64_t)version
{
  return sub_100325D84();
}

- (void)setVersion:(int64_t)a3
{
}

- (CSDConversationLinkGeneratorDescriptor)initWithIdentifier:(id)a3 version:(int64_t)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDConversationLinkGeneratorDescriptor *)sub_100325DCC(v5, v6, a4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = sub_100325E50((uint64_t)v8);

  sub_100202D2C((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  NSString v2 = self;
  Swift::Int v3 = sub_100325FC8();

  return v3;
}

- (CSDConversationLinkGeneratorDescriptor)init
{
}

- (void).cxx_destruct
{
}

@end