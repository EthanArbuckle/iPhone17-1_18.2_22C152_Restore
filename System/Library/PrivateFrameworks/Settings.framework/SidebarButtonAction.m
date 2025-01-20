@interface SidebarButtonAction
+ (BOOL)supportsSecureCoding;
- (_TtC8Settings19SidebarButtonAction)init;
- (_TtC8Settings19SidebarButtonAction)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SidebarButtonAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC8Settings19SidebarButtonAction_action);
  id v5 = a3;
  v6 = self;
  id v7 = (id)sub_1E4DBDF08();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);
}

- (_TtC8Settings19SidebarButtonAction)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (_TtC8Settings19SidebarButtonAction *)sub_1E4D852B0(v3);

  return v4;
}

- (_TtC8Settings19SidebarButtonAction)init
{
  result = (_TtC8Settings19SidebarButtonAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end