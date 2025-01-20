@interface SidebarSearchFieldContentView
- (_TtC5Books29SidebarSearchFieldContentView)initWithCoder:(id)a3;
- (_TtC5Books29SidebarSearchFieldContentView)initWithFrame:(CGRect)a3;
@end

@implementation SidebarSearchFieldContentView

- (_TtC5Books29SidebarSearchFieldContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_searchBar;
  id v6 = objc_allocWithZone((Class)UISearchBar);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_textSubscriptionCancellable) = 0;

  result = (_TtC5Books29SidebarSearchFieldContentView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (_TtC5Books29SidebarSearchFieldContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Books29SidebarSearchFieldContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_searchBar));
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_configuration);

  swift_release();
}

@end