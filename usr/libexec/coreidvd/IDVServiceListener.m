@interface IDVServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd18IDVServiceListener)init;
- (void)dealloc;
@end

@implementation IDVServiceListener

- (_TtC8coreidvd18IDVServiceListener)init
{
  return (_TtC8coreidvd18IDVServiceListener *)sub_10046DFAC();
}

- (void)dealloc
{
  v2 = self;
  sub_10046E1CC();
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10046E878(v7);

  return v9 & 1;
}

@end