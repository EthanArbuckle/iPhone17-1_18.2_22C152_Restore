@interface NearbySessionInvitation
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions23NearbySessionInvitation)init;
- (_TtC14NearbySessions23NearbySessionInvitation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NearbySessionInvitation

- (NSString)description
{
  v2 = self;
  uint64_t v3 = NearbySessionInvitation.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x25A2B5660](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NearbySessionInvitation.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions23NearbySessionInvitation)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions23NearbySessionInvitation *)NearbySessionInvitation.init(coder:)(a3);
}

- (_TtC14NearbySessions23NearbySessionInvitation)init
{
  result = (_TtC14NearbySessions23NearbySessionInvitation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions23NearbySessionInvitation_identifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions23NearbySessionInvitation_userInfo);
  unint64_t v6 = *(void *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions23NearbySessionInvitation_userInfo];
  outlined consume of Data?(v5, v6);
}

@end