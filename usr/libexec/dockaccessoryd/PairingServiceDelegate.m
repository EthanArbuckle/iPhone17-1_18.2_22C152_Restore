@interface PairingServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14dockaccessoryd22PairingServiceDelegate)init;
@end

@implementation PairingServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100181774(v7);

  return v9 & 1;
}

- (_TtC14dockaccessoryd22PairingServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PairingServiceDelegate();
  return [(PairingServiceDelegate *)&v3 init];
}

@end