@interface PommesSearchXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PommesSearchXPCServer)init;
- (void)dealloc;
@end

@implementation PommesSearchXPCServer

- (PommesSearchXPCServer)init
{
  return (PommesSearchXPCServer *)PommesSearchServiceDelegate.init()();
}

- (void)dealloc
{
  v2 = self;
  PommesSearchServiceDelegate.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PommesSearchXPCServer_listener);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = specialized PommesSearchServiceDelegate.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end