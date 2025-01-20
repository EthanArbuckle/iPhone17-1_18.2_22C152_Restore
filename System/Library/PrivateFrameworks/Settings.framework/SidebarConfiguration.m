@interface SidebarConfiguration
+ (BOOL)supportsSecureCoding;
- (_TtC8Settings20SidebarConfiguration)init;
- (_TtC8Settings20SidebarConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SidebarConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D82D54(v4);
}

- (_TtC8Settings20SidebarConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Settings20SidebarConfiguration *)sub_1E4D8537C(v3);

  return v4;
}

- (_TtC8Settings20SidebarConfiguration)init
{
  result = (_TtC8Settings20SidebarConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end