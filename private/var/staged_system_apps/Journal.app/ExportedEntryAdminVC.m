@interface ExportedEntryAdminVC
- (_TtC7Journal20ExportedEntryAdminVC)initWithCoder:(id)a3;
- (_TtC7Journal20ExportedEntryAdminVC)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation ExportedEntryAdminVC

- (void)viewDidLoad
{
  v2 = self;
  sub_1002C9A54();
}

- (_TtC7Journal20ExportedEntryAdminVC)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Journal20ExportedEntryAdminVC_webView;
  id v6 = objc_allocWithZone((Class)WKWebView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7Journal20ExportedEntryAdminVC *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Journal20ExportedEntryAdminVC)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal20ExportedEntryAdminVC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end