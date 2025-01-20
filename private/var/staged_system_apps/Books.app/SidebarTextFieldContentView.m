@interface SidebarTextFieldContentView
- (_TtC5Books27SidebarTextFieldContentView)initWithCoder:(id)a3;
- (_TtC5Books27SidebarTextFieldContentView)initWithFrame:(CGRect)a3;
- (void)_editingDidEndOnExit;
@end

@implementation SidebarTextFieldContentView

- (_TtC5Books27SidebarTextFieldContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_textField;
  type metadata accessor for SidebarTextField();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC5Books27SidebarTextFieldContentView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)_editingDidEndOnExit
{
}

- (_TtC5Books27SidebarTextFieldContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Books27SidebarTextFieldContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_textField));
  v3 = (char *)self + OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_configuration;

  _s5Books15CurrentPageViewVwxx_0((uint64_t)v3);
}

@end