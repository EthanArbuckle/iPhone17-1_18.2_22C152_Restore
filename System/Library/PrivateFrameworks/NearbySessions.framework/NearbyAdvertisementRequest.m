@interface NearbyAdvertisementRequest
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions26NearbyAdvertisementRequest)init;
- (_TtC14NearbySessions26NearbyAdvertisementRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NearbyAdvertisementRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  NearbyAdvertisementRequest.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions26NearbyAdvertisementRequest)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions26NearbyAdvertisementRequest *)NearbyAdvertisementRequest.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = NearbyAdvertisementRequest.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x25A2B5660](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14NearbySessions26NearbyAdvertisementRequest)init
{
  result = (_TtC14NearbySessions26NearbyAdvertisementRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions26NearbyAdvertisementRequest_identifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions26NearbyAdvertisementRequest_invitation);
  unint64_t v6 = *(void *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions26NearbyAdvertisementRequest_invitation];
  outlined consume of Data._Representation(v5, v6);
}

@end