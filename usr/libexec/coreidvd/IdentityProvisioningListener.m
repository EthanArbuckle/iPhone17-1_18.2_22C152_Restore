@interface IdentityProvisioningListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd28IdentityProvisioningListener)init;
- (void)dealloc;
@end

@implementation IdentityProvisioningListener

- (_TtC8coreidvd28IdentityProvisioningListener)init
{
  return (_TtC8coreidvd28IdentityProvisioningListener *)sub_1004C0280();
}

- (void)dealloc
{
  v2 = self;
  sub_1004C04A4();
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1004C1618(v7);

  return v9 & 1;
}

@end