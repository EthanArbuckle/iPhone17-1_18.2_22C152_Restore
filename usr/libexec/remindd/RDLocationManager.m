@interface RDLocationManager
- (_TtC7remindd17RDLocationManager)init;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation RDLocationManager

- (_TtC7remindd17RDLocationManager)init
{
  result = (_TtC7remindd17RDLocationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd17RDLocationManager_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd17RDLocationManager_q_locationManager);
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  sub_1004F3C18(a4, v9);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1004F3F20();
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_1004F41C4(a4);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  v5 = self;
  id v4 = a3;
  sub_1004F3768(0xD000000000000016, (void *)0x80000001007D7330, (uint64_t)v5, v4);
}

@end