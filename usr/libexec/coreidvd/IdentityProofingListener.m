@interface IdentityProofingListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd24IdentityProofingListener)init;
- (void)dealloc;
@end

@implementation IdentityProofingListener

- (_TtC8coreidvd24IdentityProofingListener)init
{
  return (_TtC8coreidvd24IdentityProofingListener *)sub_100060920();
}

- (void)dealloc
{
  v2 = self;
  sub_100060B44();
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100062060(v7);

  return v9 & 1;
}

@end