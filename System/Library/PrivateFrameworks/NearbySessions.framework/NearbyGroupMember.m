@interface NearbyGroupMember
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC14NearbySessions17NearbyGroupMember)init;
- (_TtC14NearbySessions17NearbyGroupMember)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NearbyGroupMember

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = NearbyGroupMember.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = NearbyGroupMember.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14NearbySessions17NearbyGroupMember)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions17NearbyGroupMember *)NearbyGroupMember.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  NearbyGroupMember.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions17NearbyGroupMember)init
{
  result = (_TtC14NearbySessions17NearbyGroupMember *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = NearbyGroupMember.description.getter();
  uint64_t v5 = v4;

  char v6 = (void *)MEMORY[0x25A2B5660](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

@end