@interface SiriRemembersServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14siriinferenced28SiriRemembersServiceDelegate)init;
@end

@implementation SiriRemembersServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10001709C((int)v8, v7);

  return v9 & 1;
}

- (_TtC14siriinferenced28SiriRemembersServiceDelegate)init
{
  return (_TtC14siriinferenced28SiriRemembersServiceDelegate *)sub_1000173F4();
}

@end