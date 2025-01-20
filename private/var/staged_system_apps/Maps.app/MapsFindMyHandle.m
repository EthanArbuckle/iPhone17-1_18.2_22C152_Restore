@interface MapsFindMyHandle
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (NSSet)emailAddresses;
- (NSSet)phoneNumbers;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)prettyName;
- (NSString)spokenName;
- (_TtC4Maps16MapsFindMyHandle)init;
- (_TtC4Maps16MapsFindMyHandle)initWithIdentifier:(id)a3;
- (_TtC4Maps16MapsFindMyHandle)initWithSearchFindMyHandle:(id)a3;
- (id)thumbnailIconWithScale:(double)a3 size:(CGSize)a4;
@end

@implementation MapsFindMyHandle

- (_TtC4Maps16MapsFindMyHandle)initWithIdentifier:(id)a3
{
  uint64_t v4 = type metadata accessor for Handle();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10030D804((uint64_t)_swiftEmptyArrayStorage);
  Handle.init(withID:serverID:pushIdentifiers:expiresByGroupId:siblingIdentifiers:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle, v7, v4);

  MyHandle = (objc_class *)type metadata accessor for MapsFindMyHandle();
  v11.receiver = v8;
  v11.super_class = MyHandle;
  return [(MapsFindMyHandle *)&v11 init];
}

- (_TtC4Maps16MapsFindMyHandle)initWithSearchFindMyHandle:(id)a3
{
  uint64_t v4 = (char *)a3 + OBJC_IVAR____TtC4Maps18SearchFindMyHandle_handle;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle;
  uint64_t v6 = type metadata accessor for Handle();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v5, v4, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MapsFindMyHandle();
  return [(MapsFindMyHandle *)&v8 init];
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
  char v6 = sub_10023E3D4((uint64_t)v8);

  sub_1001189D4((uint64_t)v8);
  return v6 & 1;
}

- (NSString)identifier
{
  uint64_t v3 = type metadata accessor for Handle();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v4 + 16))(v7, (char *)self + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle, v3, v5);
  objc_super v8 = self;
  Handle.identifier.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (NSSet)phoneNumbers
{
  v2 = self;
  sub_10023E7AC();

  sub_10023FCD4();
  sub_10023FD14();
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v3.super.isa;
}

- (NSSet)emailAddresses
{
  v2 = self;
  sub_10023ECFC();

  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v3.super.isa;
}

- (NSString)prettyName
{
  return (NSString *)sub_10023F378(self, (uint64_t)a2, (void (*)(void))sub_10023F0C8);
}

- (NSString)displayName
{
  v2 = self;
  sub_10023F13C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)spokenName
{
  return (NSString *)sub_10023F378(self, (uint64_t)a2, (void (*)(void))sub_10023F3F8);
}

- (CNContact)contact
{
  v2 = self;
  id v3 = sub_10023F6AC();

  return (CNContact *)v3;
}

- (id)thumbnailIconWithScale:(double)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v7 = self;
  id v8 = sub_10023F910(a3, width, height);

  return v8;
}

- (_TtC4Maps16MapsFindMyHandle)init
{
  result = (_TtC4Maps16MapsFindMyHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle;
  uint64_t v3 = type metadata accessor for Handle();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end