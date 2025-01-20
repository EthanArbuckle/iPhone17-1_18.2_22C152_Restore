@interface InvitationApprovalRequest
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions25InvitationApprovalRequest)init;
- (_TtC14NearbySessions25InvitationApprovalRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InvitationApprovalRequest

- (NSString)description
{
  return (NSString *)@objc NearbyInvitationParameters.description.getter(self, (uint64_t)a2, InvitationApprovalRequest.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  InvitationApprovalRequest.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions25InvitationApprovalRequest)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions25InvitationApprovalRequest *)InvitationApprovalRequest.init(coder:)(a3);
}

- (_TtC14NearbySessions25InvitationApprovalRequest)init
{
  result = (_TtC14NearbySessions25InvitationApprovalRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14NearbySessions25InvitationApprovalRequest_remoteInvitationData));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions25InvitationApprovalRequest_userInfo);
  unint64_t v4 = *(void *)&self->remoteInvitationData[OBJC_IVAR____TtC14NearbySessions25InvitationApprovalRequest_userInfo];

  outlined consume of Data?(v3, v4);
}

@end