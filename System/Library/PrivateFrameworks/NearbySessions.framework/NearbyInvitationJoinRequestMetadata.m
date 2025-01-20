@interface NearbyInvitationJoinRequestMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions35NearbyInvitationJoinRequestMetadata)init;
- (_TtC14NearbySessions35NearbyInvitationJoinRequestMetadata)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NearbyInvitationJoinRequestMetadata

- (NSString)description
{
  return (NSString *)@objc NearbyInvitationParameters.description.getter(self, (uint64_t)a2, NearbyInvitationJoinRequestMetadata.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  NearbyInvitationJoinRequestMetadata.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions35NearbyInvitationJoinRequestMetadata)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions35NearbyInvitationJoinRequestMetadata *)NearbyInvitationJoinRequestMetadata.init(coder:)(a3);
}

- (_TtC14NearbySessions35NearbyInvitationJoinRequestMetadata)init
{
  result = (_TtC14NearbySessions35NearbyInvitationJoinRequestMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC14NearbySessions35NearbyInvitationJoinRequestMetadata_publicKey), *(void *)&self->publicKey[OBJC_IVAR____TtC14NearbySessions35NearbyInvitationJoinRequestMetadata_publicKey]);
  swift_bridgeObjectRelease();
}

@end