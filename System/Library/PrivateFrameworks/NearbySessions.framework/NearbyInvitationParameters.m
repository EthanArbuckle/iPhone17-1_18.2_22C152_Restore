@interface NearbyInvitationParameters
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14NearbySessions26NearbyInvitationParameters)init;
- (_TtC14NearbySessions26NearbyInvitationParameters)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NearbyInvitationParameters

- (NSString)description
{
  return (NSString *)@objc NearbyInvitationParameters.description.getter(self, (uint64_t)a2, NearbyInvitationParameters.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  NearbyInvitationParameters.encode(with:)((NSCoder)v4);
}

- (_TtC14NearbySessions26NearbyInvitationParameters)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions26NearbyInvitationParameters *)NearbyInvitationParameters.init(coder:)(a3);
}

- (_TtC14NearbySessions26NearbyInvitationParameters)init
{
  result = (_TtC14NearbySessions26NearbyInvitationParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end