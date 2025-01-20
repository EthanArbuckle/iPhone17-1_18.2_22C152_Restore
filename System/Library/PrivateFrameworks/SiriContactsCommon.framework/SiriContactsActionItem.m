@interface SiriContactsActionItem
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC18SiriContactsCommon22SiriContactsActionItem)init;
- (int64_t)hash;
@end

@implementation SiriContactsActionItem

- (NSString)description
{
  v2 = self;
  uint64_t v3 = SiriContactsActionItem.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x26118E540](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = SiriContactsActionItem.hash.getter();

  return v3;
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
  char v6 = SiriContactsActionItem.isEqual(_:)((uint64_t)v8);

  outlined destroy of URL?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (_TtC18SiriContactsCommon22SiriContactsActionItem)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url, &demangling cache variable for type metadata for URL?);
  swift_bridgeObjectRelease();
}

@end