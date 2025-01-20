@interface BiometricStoreListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7idcredd22BiometricStoreListener)init;
- (void)dealloc;
@end

@implementation BiometricStoreListener

- (void)dealloc
{
  v2 = self;
  sub_10001BBF0();
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
  char v9 = sub_10002C018(v7);

  return v9 & 1;
}

- (_TtC7idcredd22BiometricStoreListener)init
{
  result = (_TtC7idcredd22BiometricStoreListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end