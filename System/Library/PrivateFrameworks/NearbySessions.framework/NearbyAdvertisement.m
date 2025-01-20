@interface NearbyAdvertisement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC14NearbySessions19NearbyAdvertisement)init;
- (_TtC14NearbySessions19NearbyAdvertisement)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NearbyAdvertisement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  NearbyAdvertisement.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions19NearbyAdvertisement)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions19NearbyAdvertisement *)NearbyAdvertisement.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)@objc NearbyInvitationParameters.description.getter(self, (uint64_t)a2, NearbyAdvertisement.description.getter);
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = NearbyAdvertisement.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = NearbyAdvertisement.isEqual(_:)((uint64_t)v8);

  outlined destroy of Invitation_HostConnectionInfo?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (_TtC14NearbySessions19NearbyAdvertisement)init
{
  result = (_TtC14NearbySessions19NearbyAdvertisement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  Swift::Int v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions19NearbyAdvertisement_scannerID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions19NearbyAdvertisement_userInfo), *(void *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions19NearbyAdvertisement_userInfo]);
  swift_unknownObjectRelease();
}

@end