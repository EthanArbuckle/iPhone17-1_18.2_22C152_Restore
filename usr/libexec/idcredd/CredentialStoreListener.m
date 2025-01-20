@interface CredentialStoreListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7idcredd23CredentialStoreListener)init;
- (void)dealloc;
@end

@implementation CredentialStoreListener

- (void)dealloc
{
  v2 = self;
  sub_10010F15C();
}

- (void).cxx_destruct
{
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100126A58(v7);

  return v9 & 1;
}

- (_TtC7idcredd23CredentialStoreListener)init
{
  result = (_TtC7idcredd23CredentialStoreListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end