@interface IdentityManagementListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd26IdentityManagementListener)init;
- (void)dealloc;
@end

@implementation IdentityManagementListener

- (_TtC8coreidvd26IdentityManagementListener)init
{
  return (_TtC8coreidvd26IdentityManagementListener *)sub_1005943B8();
}

- (void)dealloc
{
  v2 = self;
  sub_100594604();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd26IdentityManagementListener_watchSessionManager);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1005A4C4C(v7);

  return v9 & 1;
}

@end