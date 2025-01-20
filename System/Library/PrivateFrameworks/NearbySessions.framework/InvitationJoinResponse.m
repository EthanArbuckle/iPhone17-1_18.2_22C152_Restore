@interface InvitationJoinResponse
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions22InvitationJoinResponse)init;
- (_TtC14NearbySessions22InvitationJoinResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InvitationJoinResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  InvitationJoinResponse.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions22InvitationJoinResponse)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions22InvitationJoinResponse *)InvitationJoinResponse.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)@objc NearbyInvitationParameters.description.getter(self, (uint64_t)a2, InvitationJoinResponse.description.getter);
}

- (_TtC14NearbySessions22InvitationJoinResponse)init
{
  result = (_TtC14NearbySessions22InvitationJoinResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions22InvitationJoinResponse_userInfo);
  unint64_t v4 = *(void *)&self->sessionIdentifier[OBJC_IVAR____TtC14NearbySessions22InvitationJoinResponse_userInfo];
  outlined consume of Data?(v3, v4);
}

@end