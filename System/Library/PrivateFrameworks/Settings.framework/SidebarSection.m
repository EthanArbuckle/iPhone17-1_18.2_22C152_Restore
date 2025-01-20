@interface SidebarSection
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC8Settings14SidebarSection)init;
- (_TtC8Settings14SidebarSection)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SidebarSection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1E4D849BC(self, (uint64_t)a2, (void (*)(void))sub_1E4D84A2C);
}

- (_TtC8Settings14SidebarSection)initWithCoder:(id)a3
{
  return (_TtC8Settings14SidebarSection *)SidebarSection.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D84F60(v4);
}

- (_TtC8Settings14SidebarSection)init
{
  result = (_TtC8Settings14SidebarSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end