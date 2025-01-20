@interface WDSJWTAuthenticatorServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13WeatherDaemon34WDSJWTAuthenticatorServiceListener)init;
- (void)generateTokenWithUrl:(id)a3 completion:(id)a4;
@end

@implementation WDSJWTAuthenticatorServiceListener

- (_TtC13WeatherDaemon34WDSJWTAuthenticatorServiceListener)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = WDSJWTAuthenticatorServiceListener.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v8, (NSXPCConnection)v7);

  return v9;
}

- (void)generateTokenWithUrl:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1A95C3D24(v7, (uint64_t)v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
}

@end