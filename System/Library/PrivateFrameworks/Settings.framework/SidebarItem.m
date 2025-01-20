@interface SidebarItem
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC8Settings11SidebarItem)init;
- (_TtC8Settings11SidebarItem)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SidebarItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1E4D849BC(self, (uint64_t)a2, (void (*)(void))sub_1E4D838B4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D83AE0(v4);
}

- (_TtC8Settings11SidebarItem)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Settings11SidebarItem *)sub_1E4D856C4(v3);

  return v4;
}

- (_TtC8Settings11SidebarItem)init
{
  result = (_TtC8Settings11SidebarItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E4D856A4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Settings11SidebarItem____lazy_storage___icon));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end