@interface Relay.MachService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation Relay.MachService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100039EC4();
  char v10 = v9;

  return v10 & 1;
}

- (void).cxx_destruct
{
}

@end