@interface InvitationBlob
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions14InvitationBlob)init;
- (_TtC14NearbySessions14InvitationBlob)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InvitationBlob

- (NSString)description
{
  return (NSString *)@objc NearbyInvitationParameters.description.getter(self, (uint64_t)a2, InvitationBlob.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  InvitationBlob.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions14InvitationBlob)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions14InvitationBlob *)InvitationBlob.init(coder:)(a3);
}

- (_TtC14NearbySessions14InvitationBlob)init
{
  result = (_TtC14NearbySessions14InvitationBlob *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions14InvitationBlob_dataBlob);
  unint64_t v4 = *(void *)&self->invitationID[OBJC_IVAR____TtC14NearbySessions14InvitationBlob_dataBlob];
  outlined consume of Data._Representation(v3, v4);
}

@end