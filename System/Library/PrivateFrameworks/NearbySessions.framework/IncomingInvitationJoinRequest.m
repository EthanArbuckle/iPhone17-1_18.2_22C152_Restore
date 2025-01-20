@interface IncomingInvitationJoinRequest
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions29IncomingInvitationJoinRequest)init;
- (_TtC14NearbySessions29IncomingInvitationJoinRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IncomingInvitationJoinRequest

- (NSString)description
{
  return (NSString *)@objc NearbyInvitationParameters.description.getter(self, (uint64_t)a2, IncomingInvitationJoinRequest.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IncomingInvitationJoinRequest.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions29IncomingInvitationJoinRequest)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions29IncomingInvitationJoinRequest *)IncomingInvitationJoinRequest.init(coder:)(a3);
}

- (_TtC14NearbySessions29IncomingInvitationJoinRequest)init
{
  result = (_TtC14NearbySessions29IncomingInvitationJoinRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_invitationID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_remotePublicKey), *(void *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_remotePublicKey]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_userInfo), *(void *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_userInfo]);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_hostInfo);
}

@end